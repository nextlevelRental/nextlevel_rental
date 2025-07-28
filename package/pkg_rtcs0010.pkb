CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0010 AS 
/*******************************************************************************
   NAME      Pkg_Rtcs0010
   PURPOSE   걱정제로 배송신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-01-15  cleansalmon      1. Created this package body.
   1.0.1      2016-11-23  임욱재           [20161123-0001]
                                           - 신청제한 연체기준 변경   
   1.0.2      2016-12-06  wjim             [20161206_02]
                                           - '콜센터(아웃바운드)' 사용자그룹 추가
   1.0.3      2017-04-27  wjim             [20170427_01] 조회항목 추가      
   1.1        2017-09-12  wjim             [20170906_01] SMS 발송기능 추가/변경                                   
   1.2        2017-12-11  wjim             [20171211_01] 서비스내역조회 항목 추가
                                           - 상품명
   1.3        2017-12-18  wjim             [20171218_02] 걱정제로 배송신청 내역 조회 조회조건 순서변경
   1.4        2017-12-18  wjim             [20171218_03] 걱정제로 신청,변경 시 단종제품 SMS 내용분기 
   1.5        2018-03-06  wjim             [20180306_01] 걱정제로 신청 SMS 메시지 변경
   1.6        2018-03-23  wjim             [20180323_01] 걱정제로 최초신청 가능기준 변경
   1.7        2019-04-08  wjim             [20180408_01] 걱정제로 초과신청 방지 로직 보완
   1.8        2019-04-26  wjim             [20180426_01] 걱정제로 신청회차 조회 기능 추가, 걱정제로 신청조회 항목 추가
   1.9        2019-05-14  wjim             [20180514_01] 걱정제로 최초신청 가능기준 보완
   1.10       2019-10-21  wjim             [20191021_01] 쇼핑몰에서 걱정제로 취소 시 오류 보완
   1.11       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
   1.13       2021-11-23  kstka             [20211123_01] 걱정제로 수령건 대응 관련 기능 추가    
   1.14       2022-04-12  kstka            [20220412_01] 배송요청일을 간헐적으로 랜덤으로 등록되는 경우가 발생해 등록일 기준으로 변경 
*******************************************************************************/

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0010Count(
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,         /*배송신청일자        */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE          /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0010
    WHERE   DLVR_DAY = v_Dlvr_Day
    AND     DLVR_SEQ = v_Dlvr_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0010Count;

 
  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Select   
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
              2016-07-13 이영근            장착완료일자 추가 
   1.0.2      2016-12-06  wjim             [20161206_02]
                                           - '콜센터(아웃바운드)' 사용자그룹 추가
   1.0.3      2017-04-27  wjim             [20170427_01] 조회항목 추가
                                           - 걱정제로 신청회차 추가   
   1.2        2017-12-11  wjim             [20171211_01] 상품명 추가 
   1.3        2017-12-18  wjim             [20171218_02] 조회조건 순서변경 (계약번호-고객번호)   
   1.4        2018-05-10  kstka            [20180510] 걱정제로신청순번 sort변경
   1.11       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가                                                                                                                                                               
  *****************************************************************************/
  PROCEDURE p_sRtcs0010 (
      Ref_Cursor     IN OUT SYS_REFCURSOR
    , v_Dlvr_DayF    IN RTCS0010.DLVR_DAY%TYPE       /*배송신청일자FROM      */
    , v_Dlvr_DayT    IN RTCS0010.DLVR_DAY%TYPE       /*배송신청일자TO        */
    , v_Dlv_Stat     IN RTCS0010.DLV_STAT%TYPE       /*상태                  */
    , v_Ord_No       IN RTCS0010.ORD_NO%TYPE         /*계약번호              */
    , v_Cust_No      IN RTCS0010.CUST_NO%TYPE        /*고객코드              */    
    , v_Sales_Office IN RTSD0104.SALES_OFFICE%TYPE   /*지점                  */
    , v_Sales_Group  IN RTSD0104.SALES_GROUP%TYPE    /*지사                  */
    , v_Agency_Cd    IN RTSD0104.AGENCY_CD%TYPE      /*장착 대리점           */
    , v_RENTAL_GROUP  IN VARCHAR2
    , v_RENTAL_OFFICE IN VARCHAR2
    , v_LOGIN_ID      IN VARCHAR2                     /* 로그인ID: 관련항목 범위 지정 */
    , v_LOGIN_GRP     IN VARCHAR2                     /* 로그인 사용자 그룹 */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
       B.USER_ID,
       B.RENTAL_GROUP,
       B.RENTAL_OFFICE,
       Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
       Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  *
      FROM  (
                SELECT  A.DLVR_DAY                                                        /*배송신청일자        */
                     ,  A.DLVR_SEQ                                                        /*순번                */
                     ,  A.ORD_NO                                                          /*계약번호            */
                     ,  A.CUST_NO                                                         /*고객코드            */
                     ,  Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO)         AS CUST_NM    /*고객명              */
                     ,  B.MAKER_CD                                                        /*카메이커            */
                     ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',B.MAKER_CD) AS MAKER_NM   /*카메이커명          */
                     ,  B.MODEL_CD
                     ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',B.MODEL_CD) AS MODEL_NM   /*차종명              */
                     ,  B.CAR_NO                                                          /*차량번호            */
                     ,  A.MATNR                                             AS MAT_CD                     
--                     ,  A.MATNR                                             AS MAT_NM   
                     ,  F.MAT_NM                                            AS MAT_NM     /*상품명              */ --[20171211_01]                  
                     ,  A.KWMENG                                            AS CNT_CD                    
                     ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('S089',A.KWMENG)   AS CNT_NM     /*본수                */              
                     ,  A.AGENCY_CD                                                       /*대리점              */
                     ,  Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD)       AS AGENCY_NM  /*교체점명            */                                       
                     ,  A.ADDR1                                                           /*주소1               */         
                     ,  A.DLV_TEL                                                         /*연락처              */
                     ,  A.DLV_DESC                                                        /*배송요청사항        */
                     ,  A.DLV_STAT                                                        /*상태                */
                     ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('C024',A.DLV_STAT) AS DLVSTAT_NM /*상태명              */           
                     ,  A.SERVRQ_DAY
                     ,  C.MOB_NO                                                          /*교체예정일자        */
                     ,  A.PROC_DAY                                                        /*장착완료일자        */
                     ,  CASE 
                            WHEN A.REG_ID = 'ONL_SYS' THEN '쇼핑몰'
                            WHEN A.REG_ID IN (SELECT E.USER_ID FROM RTCM0001 E WHERE E.USER_GRP IN ('02','13')) THEN '콜센터'
                            ELSE '대리점'
                        END AS IN_ROUTE                                                    /*유입경로 [20161206_02] */
                     ,  Pkg_Rtcs0010.f_sRtcs0010ReqNo(A.ORD_NO, A.DLVR_DAY, A.DLVR_SEQ) AS REQ_NUM
                     --,  DECODE(A.DLV_STAT,'06','',E.NUM)                    AS REQ_NUM     /*걱정제로 신청회차      */ --[20170427_01]
                     ,  A.INST_CD                                                          /*장착유형코드           */ --[2019-00359563]
                     ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('S304',A.INST_CD) AS INST_NM      /*장착유형명             */ --[2019-00359563]   
                     ,  A.INST_TM                                                          /*장착희망시간           */ --[2019-00359563]   
                     ,  A.INST2_ADDR1                                                      /*장착주소2              */ --[2019-00359563]   
                     ,  A.CAR_NO AS INST_CAR_NO                                            /*차량번호               */ --[2019-00359563] 
                     ,  NVL2(E.NUM, ROW_NUMBER() OVER (PARTITION BY A.DLVR_DAY, A.DLVR_SEQ ORDER BY E.SEND_DAY), 1) AS ROW_NUM
                     ,  Pkg_Exif0004.f_sExif0004O2OStockYn(A.OMS_ORDERNO) AS O2O_STOCK_YN /*O2O 재고 사용 여부       */ --[2020422_01]
                     ,  A.DLV_GB                                                          /*수령여부*/  --[20211122_01]
              FROM  RTCS0010 A
                 ,  RTSD0108 B
                 ,  RTSD0100 C
                 ,  RTSD0007 D
                 ,  RTSD0115 E
                 ,  RTSD0005 F                                                  --[20171211_01]
             WHERE  (v_Dlvr_DayF IS NULL OR A.DLVR_DAY  BETWEEN v_Dlvr_DayF AND v_Dlvr_DayT)
               AND  A.DLV_STAT LIKE v_Dlv_Stat||'%'
               AND  (v_Cust_No IS NULL OR A.CUST_NO = v_Cust_No)
               AND  (v_Ord_No  IS NULL OR A.ORD_NO = v_Ord_No)
               AND  A.ORD_NO    = B.ORD_NO
               AND  A.CUST_NO   = C.CUST_NO 
               AND  A.AGENCY_CD =D.AGENCY_CD
--               AND     D.SALES_OFFICE  = DECODE(v_Sales_Office, NULL, D.SALES_OFFICE, v_Sales_Office)  /*지점                  */
--               AND     D.SALES_GROUP   = DECODE(v_Sales_Group , NULL, D.SALES_GROUP , v_Sales_Group)   /*지사                  */
               AND  A.AGENCY_CD = DECODE(v_Agency_Cd   , NULL, A.AGENCY_CD   , v_Agency_Cd)     /*장착 대리점           */   
               AND  A.ORD_NO    = E.ORD_NO(+)
               AND  E.NUM(+)   IS NOT NULL
               AND  A.DLVR_DAY <= E.SEND_DAY(+)
               AND  A.MATNR     = F.MAT_CD(+)
            )     
     WHERE  ROW_NUM = 1    
     ORDER  BY DLVR_DAY, DLVR_SEQ
       ) A
        LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
 ) A
 WHERE 1=1
   AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
   AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
   AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1

;
     

  END p_sRtcs0010;  

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가 
   1.13       2021-11-23  kstka             [20211123_01] 걱정제로 수령건 대응 관련 기능 추가    
  *****************************************************************************/
  FUNCTION f_InsertRtcs0010 (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0010.CUST_NO%TYPE,        /*고객코드              */
    v_Cust_Nm        IN RTCS0010.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0010.AGENCY_CD%TYPE,      /*대리점                */
    v_Matnr          IN RTCS0010.MATNR%TYPE,          /**/
    v_Kwmeng         IN RTCS0010.KWMENG%TYPE,         /**/
    v_Servrq_Day     IN RTCS0010.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Serv_Seq       IN RTCS0010.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
   -- v_Pos_Cd         IN RTCS0010.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0010.ADDR1%TYPE,          /*주소                  */
    v_Dlv_Tel        IN RTCS0010.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0010.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTCS0010.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTCS0010.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0010.INST2_ADDR1%TYPE,    /*장착주소2             */ --[2019-00359563]
    v_Car_No         IN RTCS0010.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_Tms_OrderId    IN RTCS0010.TMS_ORDERID%TYPE,         /*TMS ORDER ID              */ --[20200317]
    v_Dlv_Gb         IN RTCS0010.DLV_GB%TYPE,         /*수령여부*/               --[20211122_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0010 (
            DLVR_DAY,
            DLVR_SEQ,
            ORD_NO,
            CUST_NO,
            CUST_NM,
            AGENCY_CD,
            MATNR,
            KWMENG,
            SERVRQ_DAY,
            SERV_SEQ,
            DLV_STAT,
            ADDR1,
            DLV_TEL,
            DLV_DESC,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            INST_CD,
            INST_TM,
            INST2_ADDR1,
            CAR_NO,
            TMS_ORDERID,
            INST_DAY,
            DLV_GB
            )
    VALUES  (
            v_Dlvr_Day,
            v_Dlvr_Seq,
            v_Ord_No,
            v_Cust_No,
            v_Cust_Nm,
            v_Agency_Cd,
            v_Matnr,
            v_Kwmeng,
            v_Servrq_Day,
            v_Serv_Seq,
            v_Dlv_Stat,
            v_Addr1,
            v_Dlv_Tel,
            v_Dlv_Desc,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Inst_Cd,
            v_Inst_Tm,
            v_Inst2_Addr1,
            v_Car_No,
            v_Tms_OrderId,
            v_Servrq_Day,
            v_Dlv_Gb
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0010;

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가 
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0010 (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0010.CUST_NO%TYPE,        /*고객코드              */
    v_Cust_Nm        IN RTCS0010.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0010.AGENCY_CD%TYPE,      /*대리점                */
    v_Matnr          IN RTCS0010.MATNR%TYPE,          /**/
    v_Kwmeng         IN RTCS0010.KWMENG%TYPE,         /**/
    v_Servrq_Day     IN RTCS0010.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Serv_Seq       IN RTCS0010.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
  --  v_Pos_Cd         IN RTCS0010.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0010.ADDR1%TYPE,          /*주소                  */
    v_Dlv_Tel        IN RTCS0010.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0010.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTCS0010.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTCS0010.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0010.INST2_ADDR1%TYPE,    /*장착주소2             */ --[2019-00359563]
    v_Car_No         IN RTCS0010.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0010
    SET    DLVR_DAY         = v_Dlvr_Day,
           DLVR_SEQ         = v_Dlvr_Seq,
           ORD_NO           = v_Ord_No,
           CUST_NO          = v_Cust_No,
           CUST_NM          = v_Cust_Nm,
           AGENCY_CD        = v_Agency_Cd,
           MATNR            = v_Matnr,
           KWMENG           = v_Kwmeng,
           SERVRQ_DAY       = v_Servrq_Day,
           SERV_SEQ         = v_Serv_Seq,
           DLV_STAT         = v_Dlv_Stat,
      --     POS_CD           = v_Pos_Cd,
           ADDR1            = v_Addr1,
           DLV_TEL          = v_Dlv_Tel,
           DLV_DESC         = v_Dlv_Desc,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE,
           INST_CD          = v_Inst_Cd,
           INST_TM          = v_Inst_Tm,
           INST2_ADDR1      = v_Inst2_Addr1,
           CAR_NO           = v_Car_No
    WHERE  DLVR_DAY  = v_Dlvr_Day
    AND    DLVR_SEQ  = v_Dlvr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0010;

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0010 (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0010
    SET    DLV_STAT  = '06',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  DLVR_DAY  = v_Dlvr_Day
    AND    DLVR_SEQ  = v_Dlvr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0010;

  /*****************************************************************************
  -- 걱정제로 배송신청 내역 - 교체신청건수 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvrCnt(
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER IS
    v_Dlvr_Cnt   NUMBER;                              /*교체신청건수          */
  BEGIN

    SELECT  NVL(SUM(KWMENG),0)
    INTO    v_Dlvr_Cnt
    FROM    RTCS0010
    WHERE   ORD_NO = v_Ord_No
    --AND     DLV_STAT IN ('04','07','08','09');  /*서비스완료는 제외20160329 한승훈 ;*/
    --AND     DLV_STAT NOT IN ('06','05','09');
    AND     DLV_STAT IN ( '01', '02', '03' );

    RETURN v_Dlvr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0010DlvrCnt;  
  
  /*****************************************************************************
  -- 걱정제로 완료신청 내역 20160329 한승훈 
  *****************************************************************************/
  FUNCTION f_sRtcs0010ComplCnt(
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER IS
    v_Dlvr_Cnt   NUMBER;                              /*교체신청건수          */
  BEGIN

    SELECT  NVL(SUM(KWMENG),0)
    INTO    v_Dlvr_Cnt
    FROM    RTCS0010
    WHERE   ORD_NO = v_Ord_No
    AND     DLV_STAT IN ('04','07','08','09');  /*서비스완료는 제외20160329 한승훈 ;*/
    --AND     DLV_STAT NOT IN ('06','05','09');
    --AND     DLV_STAT IN ( '01', '02', '03' );

    RETURN v_Dlvr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0010ComplCnt;  
  
  /*****************************************************************************
  -- 걱정제로 배송신청 내역 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvrSeq(
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE          /*배송신청일자        */
    ) RETURN NUMBER IS
    v_Dlvr_Seq RTCS0010.DLVR_SEQ%TYPE;                  /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(DLVR_SEQ)
                 FROM    RTCS0010
                 WHERE   DLVR_DAY = v_Dlvr_Day)+ 1, 1) AS DLVR_SEQ
    INTO    v_Dlvr_Seq
    FROM    DUAL;

    RETURN v_Dlvr_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0010DlvrSeq;  

  /*****************************************************************************
  -- 걱정제로일 배송신청 내역 - 교체신청여부
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvrYn(
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2 IS
    v_Dlvr_Yn   VARCHAR2(1);                          /*교체신청여부          */
  BEGIN
/*01 요청접수
02 배송요청
03 배송중
04 서비스 완료
06 요청취소

07 선처리
08 선처리_배송요청
09 선처리_배송중(완료)
*/
    SELECT  DECODE( COUNT(*), 0, 'N', 'Y')
    INTO    v_Dlvr_Yn
    FROM    RTCS0010
    WHERE   ORD_NO = v_Ord_No
    AND     DLV_STAT IN ( '01', '02','03','07','08');
  --  AND     DLV_STAT IN ( '01', '02');

    RETURN v_Dlvr_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0010DlvrYn;
  
  
  /*****************************************************************************
  -- 걱정제로일 배송신청 내역 - 배송상태획득
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvrStat(
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2 IS
    v_Dlvr_Stat   VARCHAR2(10);                          /*교체신청여부          */
  BEGIN
/*01 요청접수
02 배송요청
03 배송중
04 서비스 완료
06 요청취소

07 선처리
08 선처리_배송요청
09 선처리_배송중(완료)
*/
    SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName('C024', DLV_STAT)
    INTO    v_Dlvr_Stat
    FROM    RTCS0010
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Dlvr_Stat;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0010DlvrStat;
  
  
  /*****************************************************************************
  -- 걱정제로 배송신청 내역 관리(IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0.1      2016-11-23  wjim             [20161123-0001]
                                           - 신청제한 연체기준 변경
                                           - 기존 : 전월말일 연체집계 기준
                                           - 변경 : 마지막 연체집계 기준  
  1.1        2017-09-07  wjim             [20170906_01] SMS 발송기능 추가/변경
  1.4        2017-12-18  wjim             [20171218_03] 걱정제로 신청,변경 시 단종제품 SMS 내용분기
                                          - 제품 사용여부가 '미사용'인 경우 단종 또는 장기간 미생산으로 인한 재고없음으로 판단
  1.5        2018-03-06  wjim             [20180306_01] 걱정제로 신청 SMS 메시지 변경
                                          - 선택형 서비스 도입이후 장착수수료 요구 대리점 발생에 따른 문구 보완 
  1.6        2018-03-23  wjim             [20180323_01] 걱정제로 최초신청 가능기준 변경
                                           - 기존 : 장착후 3개월
                                           - 변경 : 1회차 등록비, 렌탈료 완납      
  1.7        2019-04-08  wjim             [20180408_01] 걱정제로 초과신청 방지 로직 보완
                                           - 기존 : 서비스 잔여 횟수와 신청수량 비교 > 잔여 횟수 변경 전 까지 계속 신청 가능
                                           - 변경 : 서비스 총 횟수와 현재까지 사용 횟수, 신청 수량을 함께 비교
  1.9        2019-05-14  wjim             [20180514_01] 걱정제로 최초신청 가능기준 보완  
  1.10       2019-10-21  wjim             [20191021_01] 쇼핑몰에서 걱정제로 취소 시 오류 보완
                                          - 취소 시 SMS발송 로직 skip   
  1.11       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가     
  1.12       2019-12-31  kstka            [2019-00370923] 걱정제로서비스 신청분 삭제 관련 수정요청 건     
  1.13       2021-11-23  kstka             [20211123_01] 걱정제로 수령건 대응 관련 기능 추가                                                                       
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0010 (
    v_Comm_Dvsn      IN CHAR,                         /*1 처리구분(I,U,D)       */
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*2 배송신청일자          */
    v_Dlvr_Seq       IN OUT RTCS0010.DLVR_SEQ%TYPE,   /*3 순번                  */
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE,         /*4 계약번호              */
    v_Cust_No        IN RTCS0010.CUST_NO%TYPE,        /*5 고객코드              */
    v_Cust_Nm        IN RTCS0010.CUST_NM%TYPE,        /*6 고객명                */
    v_Agency_Cd      IN RTCS0010.AGENCY_CD%TYPE,      /*7 대리점                */
    v_Matnr          IN RTCS0010.MATNR%TYPE,          /*8 제품 코드 */
    v_Kwmeng         IN RTCS0010.KWMENG%TYPE,         /*9 수량 */
    v_Servrq_Day     IN RTCS0010.SERVRQ_DAY%TYPE,     /*10 교체예정일자          */
    v_Serv_Seq       IN RTCS0010.SERV_SEQ%TYPE,       /*11 서비스 순번           */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*12 상태                  */
   -- v_Pos_Cd         IN RTCS0010.POS_CD%TYPE,         /*13 우편번호              */
    v_Addr1          IN RTCS0010.ADDR1%TYPE,          /*14 주소                  */
    v_Dlv_Tel        IN RTCS0010.DLV_TEL%TYPE,        /*15 연락처                */
    v_Dlv_Desc       IN RTCS0010.DLV_DESC%TYPE,       /*16 배송요청사항          */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*17 등록자 ID             */
    v_Inst_Cd        IN RTCS0010.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTCS0010.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0010.INST2_ADDR1%TYPE,    /*장착주소2             */ --[2019-00359563]
    v_Car_No         IN RTCS0010.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_Tms_OrderId    IN RTCS0010.TMS_ORDERID%TYPE,         /*TMS ORDER ID              */ --[20200317]
    v_Dlv_Gb         IN RTCS0010.DLV_GB%TYPE,         /*수령여부               */ --[20211122_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error         EXCEPTION;
    
     
    v_Ord_NoB       RTCS0009.ORD_NO%TYPE;         /*계약번호              */
    v_Cust_NoB      RTCS0009.CUST_NO%TYPE;        /*고객코드              */
    v_Dlv_StatB     RTCS0009.DLV_STAT%TYPE;       /*상태                  */    
    v_Dlv_TelB      RTCS0009.DLV_TEL%TYPE;        /*연락처                */    
    v_Dely_Day      RTRE0100.DELY_DAY%TYPE;       /*마지막 연체집계 일자  */     --[20161123-0001]
    v_Appr_Amt      RTRE0100.APPR_AMT%TYPE;       /*연체금액              */
        
    --[20170906_01]
    lr_Sd0100       RTSD0100%ROWTYPE;             /*고객정보                  */
    lr_Sd0007       RTSD0007%ROWTYPE;             /*대리점정보                */
    v_Snd_Msg       RTSD0205.SND_MSG%TYPE;        /*대리점 발송 SMS메시지     */
    v_Pettern_Nm    RTSD0005.MAT_NM%TYPE;         /*패턴명                    */
    v_Mat_Use       RTSD0005.USE_YN%TYPE;         /*상품사용여부              */ --[20171218_03]
    v_Serv_Cntr     RTSD0013.SERV_CNTR%TYPE;      /*엔진오일 서비스 잔여횟수  */
    v_Pay_Mthd      RTSD0108.PAY_MTHD%TYPE;       /* 결제구분                 */ --[20180323_01]  
    v_Zfb_Day       RTSD0109.ZFB_DAY%TYPE;        /* 초회차 렌탈료 결제기준일 */ --[20180323_01]
    v_Serv_Cnt0     RTSD0013.SERV_CNT0%TYPE;
    v_Kwmeng_0      RTCS0010.KWMENG%TYPE;
    
    v_Chk_Cnt       NUMBER DEFAULT 0;
    
    v_Template_No   VARCHAR2(20);
    
    v_Mat_Nm        RTSD0005.MAT_NM%TYPE;


    v_Dlvr_Day_Tmp  RTCS0010.DLVR_DAY%TYPE;
  BEGIN
  
    --배송요청일을 간헐적으로 랜덤으로 등록되는 경우가 발생해 등록일 기준으로 변경 [20220412_01] kstka 
    v_Dlvr_Day_Tmp := TO_CHAR(SYSDATE, 'YYYYMMDD');

    -- 필수값:
    IF 0 != ISDATE(v_Dlvr_Day_Tmp) THEN
        v_Return_Message := '배송신청일자('||v_Dlvr_Day_Tmp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객코드('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    
    IF v_Comm_Dvsn IN ('I','U') THEN
-- 20200408 kstka 방문장착 추가로 인해 거점이 아닌 경우에만 날짜 유효성 체크
        IF Pkg_Exif0004.f_sExif0004O2OAgency(v_Agency_Cd) = 'N' THEN
            IF 0 = Pkg_Rtcm0060.f_sRtcm0060AfterInDayByTerm(v_Dlvr_Day_Tmp, v_Servrq_Day, '2') THEN
                v_Return_Message := '교체 예정일자는 접수일(등록일)로부터 영업일 기준 7일 이후 ~ 10일 이내만 접수 가능합니다.!';
                RAISE e_Error;
            END IF;
        END IF;
        
        IF (TRIM(v_Dlv_Stat) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C024', v_Dlv_Stat)) THEN    -- 변경할 것 
            v_Return_Message := '상태('||v_Dlv_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

     /*   IF (TRIM(v_Matnr) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C020', v_Matnr)) THEN
            v_Return_Message := '교체품목('||v_Matnr||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;*/

        IF (TRIM(v_Kwmeng) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S089', v_Kwmeng)) THEN
            v_Return_Message := '교체수량('||v_Kwmeng||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (Pkg_Rtsd0013.f_sRtsd0013ServCntr2(v_Ord_No , 'B00007')-TRIM(v_Kwmeng)) < 0 THEN
            v_Return_Message := '교체가능 서비스수량('||Pkg_Rtsd0013.f_sRtsd0013ServCntr(v_Ord_No , 'B00007')||') : 교체가능 서비스 수량보다 신청수량이 많아 신청이 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Addr1) IS NULL) THEN
            v_Return_Message := '주소1('||v_Addr1||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
      
        IF (TRIM(v_Dlv_Tel) IS NULL) THEN
            v_Return_Message := '연락처('||v_Dlv_Tel||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
            v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        IF 0 != ISDATE(v_Servrq_Day) THEN
            v_Return_Message := '교체예정일자('||v_Servrq_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


    END IF;
    
    /*
     * 대리점용 SMS발송에 필요한 정보 조회 [20170906_01]
     * - [20191021_01] 등록,수정시에만 수행하도록 변경
     */
    IF v_Comm_Dvsn IN ('I','U') THEN
    
        --SMS발송할 대리점 휴대폰 번호 조회
        SELECT  *
          INTO  lr_Sd0007
          FROM  RTSD0007
         WHERE  AGENCY_CD = v_Agency_Cd;

        --고객정보        
        SELECT  *
          INTO  lr_Sd0100
          FROM  RTSD0100
         WHERE  CUST_NO = v_Cust_No;
        
        --패턴명, 상품사용여부    
        --- 상품사용여부 추가 [20171218_03]                  
        SELECT  PETTERN_CD||' '||SECTION_WIDTH||'/'||ASPECT_RATIO||'R'||WHEEL_INCHES
             ,  USE_YN
          INTO  v_Pettern_Nm, v_Mat_Use
          FROM  RTSD0005
         WHERE  MAT_CD = v_Matnr;
         
        -- 서비스 잔여횟수 조회(신청본수를 뺀다)
        SELECT  NVL(MAX(SERV_CNTR)-v_Kwmeng, 0)
          INTO  v_Serv_Cntr
          FROM  RTSD0013
         WHERE  ORD_NO  = v_Ord_No
           AND  PRS_DCD = 'B00007';
    
    END IF;        

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 < f_sRtcs0010Count(v_Dlvr_Day_Tmp, v_Dlvr_Seq) THEN
            v_Return_Message := '해당 일자-번호('||v_Dlvr_Day_Tmp||'-'||v_Dlvr_Seq||')로 이미등록된 데이터가 존재하므로 신규등록처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        --걱정제로 2본 계약이 중복으로 들어가는 현상이 있어 유효성 검사 체크
        IF 0 < f_sRtcs0010DupCount(v_Dlvr_Day_Tmp, v_Ord_No) THEN
            v_Return_Message := '해당 일자-주문번호('||v_Dlvr_Day_Tmp||'-'||v_Ord_No||')로 이미등록된 데이터가 존재하므로 신규등록처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        -- 서비스 적용 가능여부 체크
        IF 0 = Pkg_Rtsd0013.f_sRtsd0013ServCntr( v_Ord_No, 'B00007') THEN
            v_Return_Message := '계약번호 기준 프리미엄서비스(RTSD0013) 잔여횟수(0)으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 기존내역 존재여부 체크: 계약번호, 고객코드 기준으로 RTCS0009 테이블에 DLV_STAT 값이 '01', '02', '03' 인 경우 처리불가
    /*    IF 'Y' = f_sRtcs0010DlvrYn(v_Ord_No) THEN
            v_Return_Message := '현재 진행건이 존재하므로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;*/
        
        -- 연체금액 체크
        -- 마지막 연체집계일 조회 [20161123-0001]
        SELECT  MAX(DELY_DAY)
          INTO  v_Dely_Day
          FROM  RTRE0100
         WHERE  DEL_YN = 'N';
         
        v_Appr_Amt := Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(v_Cust_No, NULL, v_Dely_Day);   --[20161123-0001]
--        v_Appr_Amt := Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(v_Cust_No, NULL, NULL);
        IF NVL(v_Appr_Amt,0) > 0 THEN
            v_Return_Message := '연체금액('||TO_CHAR(NVL(v_Appr_Amt,0))||')이 존재하므로 처리가 불가합니다.!(ERR CODE:V6SNF4)';
            RAISE e_Error;
        END IF;
       
        -- [20180514_01] 예외처리 대상 계약변호가 없을 때 NOT IN ('')로 처리하면 해당 검증분기를 타지 않음
        -- 따라서 'X'와 같이 존재하지 않는 계약번호를 포함시킴
        -- 예외처리 필요 시 해당 계약번호는 'X' 뒤에 추가하면 됨
        -- B19000212158 : 2019-05-21 김소영 요청
        IF v_Ord_No NOT IN ('X','B19000212158') THEN 
            /*
             * 1회차 렌탈료 결제가 진행됐는지 확인 [20180323_01]
             */
            -- 결제유형 확인
            SELECT  PAY_MTHD
              INTO  v_Pay_Mthd
              FROM  RTSD0108
             WHERE  ORD_NO = v_Ord_No;
             
            -- 최초결제일 확인
            SELECT  ZFB_DAY
              INTO  v_Zfb_Day
              FROM  RTSD0109
             WHERE  ORD_NO   = v_Ord_No
               AND  SCHD_SEQ = 1;
               
            -- 결제유형별 최초결제 진행여부 확인
            -- - 최초 결제일 이후 수금된 이력이 없다면 최초 결제 미진행으로 판단
            IF v_Pay_Mthd = 'A' THEN    
                -- CMS의 경우
                SELECT  COUNT(*)
                  INTO  v_Chk_Cnt
                  FROM  RTRE0070
                 WHERE  RCMS_DAY >= v_Zfb_Day
                   AND  RECP_AMT > 0
                   AND  RECV_SEQ IS NOT NULL;
                   
            ELSE                        
                -- 카드이체의 경우
                SELECT  COUNT(*)
                  INTO  v_Chk_Cnt
                  FROM  RTRE0080
                 WHERE  RCRD_DAY >= v_Zfb_Day
                   AND  RECP_AMT > 0
                   AND  RECV_SEQ IS NOT NULL;
                   
            END IF;
            
            IF v_Chk_Cnt = 0 THEN
                
                            
    --           첫렌탈료가 선수내역에 존재하는지 여부 판단
    --           부분수납도 확인할 것인지 판단 필요
    --            SELECT SUM(PND_AMT)
    --            INTO v_Pnd_Amt
    --            FROM RTRE0030 A, RTRE0035 B
    --            WHERE A.ORD_NO = B.ORD_NO
    --            AND A.RECV_SEQ = B.RECV_SEQ
    --            AND A.RITM_SEQ = B.RITM_SEQ
    --            AND A.ORD_NO = v_Ord_No
    --            AND A.SCHD_SEQ = 1
    --            AND A.RECP_TP = '90';--선수금
    --            
    --            IF SQL%NOTFOUND THEN
    --                v_Return_Message := '첫 렌탈료 결제 이후 신청가능합니다!';
    --                RAISE e_Error;
    --            END IF;

                v_Return_Message := '첫 렌탈료 결제 이후 신청가능합니다!';
                RAISE e_Error;
            END IF;
        
        END IF;
        
        -- [20180408_01] 에 의해 주석 처리
--        IF (Pkg_Rtsd0013.f_sRtsd0013ServCntr2(v_Ord_No , 'B00007')-TRIM(v_Kwmeng)) < 0 THEN
--            v_Return_Message := '교체가능 서비스수량('||Pkg_Rtsd0013.f_sRtsd0013ServCntr(v_Ord_No , 'B00007')||') : 교체가능 서비스 수량보다 신청수량이 많아 신청이 불가 합니다!';
--            RAISE e_Error;
--        END IF;
        
        -- [20180408_01]
        -- 걱정제로 총 부여횟수
        SELECT  SERV_CNT0
          INTO  v_Serv_Cnt0
          FROM  RTSD0013
         WHERE  ORD_NO  = v_Ord_No
           AND  PRS_DCD = 'B00007';
        
        -- 현재까지 신청/진행/완료된 걱정제로 본 수   
        SELECT  NVL(SUM(KWMENG), 0)
          INTO  v_Kwmeng_0
          FROM  RTCS0010
         WHERE  ORD_NO = v_Ord_No
           AND  DLV_STAT NOT IN ('06');
        
        -- 현재까지 신청/진행/완료된 걱정제로 본 수를 감안하여 신청본수 검증   
        IF v_Serv_Cnt0 < v_Kwmeng_0 + TRIM(v_Kwmeng) THEN
            v_Return_Message := '신청가능 서비스수량 : 신청가능 서비스 수량('||v_Serv_Cnt0-v_Kwmeng_0||')보다 신청수량('||TRIM(v_Kwmeng)||')이 많아 신청이 불가 합니다!';
            RAISE e_Error;
        END IF;           
        
        -- 순번 획득
        v_Dlvr_Seq := f_sRtcs0010DlvrSeq(v_Dlvr_Day_Tmp);

    
        IF 0 != f_InsertRtcs0010(v_Dlvr_Day_Tmp ,v_Dlvr_Seq ,v_Ord_No ,v_Cust_No ,
                                 v_Cust_Nm ,v_Agency_Cd ,v_Matnr ,v_Kwmeng ,
                                 v_Servrq_Day ,v_Serv_Seq ,v_Dlv_Stat ,
                                 v_Addr1 ,v_Dlv_Tel ,v_Dlv_Desc , v_Reg_Id,
                                 v_Inst_Cd, v_Inst_Tm, v_Inst2_Addr1, v_Car_No, v_Tms_OrderId, v_Dlv_Gb, v_ErrorText) THEN
            v_Return_Message := '걱정제로 배송신청 내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
         /*
         * 상품명 획득
         */
        SELECT MAT_NM INTO v_Mat_Nm FROM RTSD0005 WHERE MAT_CD = v_Matnr AND ROWNUM = 1;

 
        /*
         * 고객용 SMS발송 [20170906_01]
         */
         
        v_Snd_Msg := '[넥센타이어]  '||v_Cust_Nm|| ' (계약번호: '|| v_Ord_No || '/계약상품: ' || v_Mat_Nm || ') 고객님께서 신청하신 타이어 무상교체 서비스 '||v_Kwmeng||'본이 정상 접수되었습니다.'; --[20210107_01]
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||'(장착점 안내) 상호명 : '||lr_Sd0007.AGENCY_NM||', 주소 : '||lr_Sd0007.CITY||' '||lr_Sd0007.STREET;
        v_Snd_Msg := v_Snd_Msg||', 전화번호 : '||lr_Sd0007.TEL_NO||', 장착 예정일 : '||REGEXP_REPLACE(v_Servrq_Day, '(\d{4})(\d{2})(\d{2})', '\1.\2.\3');
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||'(서비스 잔여 본수 : '||v_Serv_Cntr||'본) 신청 내역과 상이하실 경우 콜센터(1855-0100)로 연락주세요.';
        
        v_Template_No := 'RENTAL00000000000026';
        
        --상품이 미사용인 경우 단종 또는 재고없음 관련 추가 메시지 [20171218_03]
        IF v_Mat_Use = 'N' THEN
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||'(초기렌탈하신 제품이 단종으로 장기간 미생산 및 재고가 없는 경우, 보완된 대체 패턴으로 지급될 수 있습니다.)';
            
            v_Template_No := 'RENTAL00000000000084';
        END IF;
        
        --[20180306_01]
        /*
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||'※ 무상 교체 서비스로 교체 공임이 발생되지 않습니다.(단,TPMS, 런플랫 별도 공임 발생)';
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||'대리점에서 서비스 확인서만 작성 부탁드립니다.';
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        */

        /*
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||'※유의사항 : 본 서비스는 타이어출고 이후 취소할 수 없는 서비스로 취소를 원하시는 경우 사전에 콜센터로 문의해 주시기 바랍니다.';
        v_Snd_Msg := v_Snd_Msg||' 또한 타이어 도착 완료 후 3개월 경과시 장착여부와 관계없이 서비스횟수는 차감되며, 타이어의 분실 우려가 있을 수 있습니다.';
        v_Snd_Msg := v_Snd_Msg||' (분실될 경우 당사에서 재발송되지 않습니다.)';
        */
        
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||'※유의사항'||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||' 1) 서비스 신청 이후 취소 불가'||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||' 2) TPMS등 기타 부속품 장착 차량 추가 공임비 발생'||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||' 3) 신청 후 미장착 3개월 경과시 서비스 횟수 자동 차감'||CHR(13)||CHR(10);
        
        NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
              'I'               /*예약 전송여부         */
            , '00000000000000'  /*예약 전송시간         */
            , lr_Sd0100.MOB_NO  /*받는 전화번호         */
            , '18550100'        /*보내는 전화번호       */
            , v_Snd_Msg         /*메시지내용            */
            , 'S010'            /*사용자지정 필드       */
            , v_Ord_No          /*사용자지정 필드       */
            , '2'
            , v_Template_No
            , v_Reg_Id          /*등록자 ID             */
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );
            
        IF 0 != v_Success_Code THEN
            v_Return_Message := '걱정제로신청 SMS 고객 발송 실패!!!'||'-'||v_Return_Message;
            RAISE e_Error;
        END IF;
         
        /*
         * 대리점용 SMS발송 [20170906_01]
         */
        IF TRIM(lr_Sd0007.MOB_NO) IS NOT NULL THEN

            v_Snd_Msg := '[넥센타이어] '||v_Cust_Nm||' 고객님께서 신청하신 타이어 무상교체 서비스 '||v_Kwmeng||'본이 접수되었습니다.'; --[20210107_01]
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||'계약번호 : '||v_Ord_No||', 연락처 : '||REGEXP_REPLACE(lr_Sd0100.MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3');
            v_Snd_Msg := v_Snd_Msg||', '||v_Pettern_Nm||' '||v_Kwmeng;
            v_Snd_Msg := v_Snd_Msg||'개, 장착예정일 : '||REGEXP_REPLACE(v_Servrq_Day, '(\d{4})(\d{2})(\d{2})', '\1.\2.\3');
            
            v_Template_No := 'RENTAL00000000000025';
            
            --상품이 미사용인 경우 단종 또는 재고없음 관련 추가 메시지 [20171218_03]
            IF v_Mat_Use = 'N' THEN
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'(고객님께서 초기렌탈하신 제품이 단종으로 장기간 미생산 및 재고가 없는 경우, 보완된 대체 패턴으로 지급될 수 있습니다.)';
                
                v_Template_No := 'RENTAL00000000000083';
            END IF;
            
            --[20180306_01]
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
--            v_Snd_Msg := v_Snd_Msg||'※ 무상 교체 서비스로 교체 공임이 발생되지 않습니다. (단, TPMS, 런플랫 별도 공임 청구 가능)';
            v_Snd_Msg := v_Snd_Msg||'※ 무상 교체 서비스로 교체 공임이 발생되지 않습니다.'; --[20210107_01]
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||'고객님께 비용을 청구하지 말아주세요.';
            
            NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                  'I'               /*예약 전송여부         */
                , '00000000000000'  /*예약 전송시간         */
                , lr_Sd0007.MOB_NO  /*받는 전화번호         */
                , '18550100'        /*보내는 전화번호       */
                , v_Snd_Msg         /*메시지내용            */
                , 'S029'            /*사용자지정 필드       */
                , v_Ord_No          /*사용자지정 필드       */
                , '2'
                , v_Template_No                
                , v_Reg_Id          /*등록자 ID             */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
            
            IF 0 != v_Success_Code THEN
                v_Return_Message := '걱정제로신청 SMS 대리점 발송 실패!!!'||'-'||v_Return_Message;
                RAISE e_Error;
            END IF;
        END IF;

    ELSIF v_Comm_Dvsn IN ('U','D') THEN

        IF 0 = f_sRtcs0010Count(v_Dlvr_Day, v_Dlvr_Seq) THEN
            v_Return_Message := '해당 일자-번호('||v_Dlvr_Day_Tmp||'-'||v_Dlvr_Seq||')로 등록된 데이터가 존재하지 않음므로 수정처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        --걱정제로 2본 계약이 중복으로 들어가는 현상이 있어 유효성 검사 체크
--        IF 0 < f_sRtcs0010DupCount(v_Dlvr_Day, v_Ord_No) THEN
--            v_Return_Message := '해당 일자-주문번호('||v_Dlvr_Day||'-'||v_Ord_No||')로 이미등록된 데이터가 존재하므로 신규등록처리가 불가 합니다!';
--            RAISE e_Error;
--        END IF;

        BEGIN

            SELECT  ORD_NO, CUST_NO, DLV_STAT
            INTO    v_Ord_NoB, v_Cust_NoB, v_Dlv_StatB
            FROM    RTCS0010
            WHERE   DLVR_DAY  = v_Dlvr_Day
            AND     DLVR_SEQ  = v_Dlvr_Seq;

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '걱정제로 배송신청 내역(RTCS0010) 획득 실패!.';
                RAISE e_Error;
        END;

        -- 계약번호, 고객번호 동일여부 체크
        IF v_Ord_No <> v_Ord_NoB THEN
            v_Return_Message := '계약번호('||v_Ord_No||'='||v_Ord_NoB||')가 일치하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (v_Cust_No <> v_Cust_NoB) THEN
            v_Return_Message := '고객번호('||v_Cust_No||'='||v_Cust_NoB||')가 일치하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        

        IF v_Comm_Dvsn = 'U' THEN        

            --[2019-00370923] 걱정제로 신청분 삭제(요청접수, 배송요청, 배송중)
            IF (v_Dlv_Stat <> '01') THEN
                v_Return_Message := '해당 걱정제로 배송신청 상태가 요청접수(01) 상태이므로 처리가 불가 합니다.!.('||v_Dlv_StatB||')';
                RAISE e_Error;
            END IF;
            
            IF 0 != f_UpdateRtcs0010(v_Dlvr_Day ,v_Dlvr_Seq ,v_Ord_No ,v_Cust_No ,
                                     v_Cust_Nm ,v_Agency_Cd ,v_Matnr ,v_Kwmeng ,
                                     v_Servrq_Day ,v_Serv_Seq ,v_Dlv_Stat,
                                     v_Addr1, v_Dlv_Tel , v_Dlv_Desc, v_Reg_Id,
                                     v_Inst_Cd, v_Inst_Tm, v_Inst2_Addr1, v_Car_No, v_ErrorText) THEN
                v_Return_Message := '걱정제로 배송신청 내역 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            /*
             * 상품명 획득
             */
            SELECT MAT_NM INTO v_Mat_Nm FROM RTSD0005 WHERE MAT_CD = v_Matnr AND ROWNUM = 1;
            
            /*
             * 고객용 SMS발송 [20170906_01]
             */
            v_Snd_Msg := '[넥센타이어]  '||v_Cust_Nm|| ' 고객님께서 신청하신 타이어 무상교체 서비스 '||v_Kwmeng||'본이 정상 접수되었습니다.';  --[20210107_01]
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||'(장착점 안내) 상호명 : '||lr_Sd0007.AGENCY_NM||', 주소 : '||lr_Sd0007.CITY||' '||lr_Sd0007.STREET;
            v_Snd_Msg := v_Snd_Msg||', 전화번호 : '||lr_Sd0007.TEL_NO||', 장착 예정일 : '||REGEXP_REPLACE(v_Servrq_Day, '(\d{4})(\d{2})(\d{2})', '\1.\2.\3');
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||'(서비스 잔여 본수 : '||v_Serv_Cntr||'본) 신청 내역과 상이하실 경우 콜센터(1855-0100)로 연락주세요.';
            
            v_Template_No := 'RENTAL00000000000024';
            
            --상품이 미사용인 경우 단종 또는 재고없음 관련 추가 메시지 [20171218_03]
            IF v_Mat_Use = 'N' THEN
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'(초기렌탈하신 제품이 단종으로 장기간 미생산 및 재고가 없는 경우, 보완된 대체 패턴으로 지급될 수 있습니다.)';
                
                v_Template_No := 'RENTAL00000000000082';
            END IF;
            
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
--            v_Snd_Msg := v_Snd_Msg||'※ 무상 교체 서비스로 교체 공임이 발생되지 않습니다.(단,TPMS, 런플랫 별도 공임 발생)';
            v_Snd_Msg := v_Snd_Msg||'※ 무상 교체 서비스로 교체 공임이 발생되지 않습니다.(단,TPMS, 런플랫 별도 공임 발생)'; --[20210107_01]
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||'대리점에서 서비스 확인서만 작성 부탁드립니다.';
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||'※유의사항 : 본 서비스는 타이어출고 이후 취소할 수 없는 서비스로 취소를 원하시는 경우 사전에 콜센터로 문의해 주시기 바랍니다.';
            v_Snd_Msg := v_Snd_Msg||' 또한 타이어 도착 완료 후 3개월 경과시 장착여부와 관계없이 서비스횟수는 차감되며, 타이어의 분실 우려가 있을 수 있습니다.';
            v_Snd_Msg := v_Snd_Msg||' (분실될 경우 당사에서 재발송되지 않습니다.)';


            NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                  'I'               /*예약 전송여부         */
                , '00000000000000'  /*예약 전송시간         */
                , lr_Sd0100.MOB_NO  /*받는 전화번호         */
                , '18550100'        /*보내는 전화번호       */
                , v_Snd_Msg         /*메시지내용            */
                , 'S030'            /*사용자지정 필드       */
                , v_Ord_No          /*사용자지정 필드       */
                , '2'
                , v_Template_No                 
                , v_Reg_Id          /*등록자 ID             */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
                
            IF 0 != v_Success_Code THEN
                v_Return_Message := '걱정제로 변경 SMS 고객 발송 실패!!!'||'-'||v_Return_Message;
                RAISE e_Error;
            END IF;
             
            /*
             * 대리점용 SMS발송 [20170906_01]
             */
            IF TRIM(lr_Sd0007.MOB_NO) IS NOT NULL THEN

                v_Snd_Msg := '[넥센타이어]  '||v_Cust_Nm||' 고객님께서 신청하신 타이어 무상교체 서비스가 변경되었습니다.';  --[20210107_01]
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'계약번호 : '||v_Ord_No||', 연락처 : '||REGEXP_REPLACE(lr_Sd0100.MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3');
                v_Snd_Msg := v_Snd_Msg||', '||v_Pettern_Nm||' '||v_Kwmeng;
                v_Snd_Msg := v_Snd_Msg||'개, 장착예정일 : '||REGEXP_REPLACE(v_Servrq_Day, '(\d{4})(\d{2})(\d{2})', '\1.\2.\3');
                
                v_Template_No := 'RENTAL00000000000027';
                --상품이 미사용인 경우 단종 또는 재고없음 관련 추가 메시지 [20171218_03]
                IF v_Mat_Use = 'N' THEN
                    v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                    v_Snd_Msg := v_Snd_Msg||'(초기렌탈하신 제품이 단종으로 장기간 미생산 및 재고가 없는 경우, 보완된 대체 패턴으로 지급될 수 있습니다.)';
                    
                    v_Template_No := 'RENTAL00000000000085';
                END IF;
                
                NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                      'I'               /*예약 전송여부         */
                    , '00000000000000'  /*예약 전송시간         */
                    , lr_Sd0007.MOB_NO  /*받는 전화번호         */
                    , '18550100'        /*보내는 전화번호       */
                    , v_Snd_Msg         /*메시지내용            */
                    , 'S031'            /*사용자지정 필드       */
                    , v_Ord_No          /*사용자지정 필드       */
                    , '2'
                    , v_Template_No
                    , v_Reg_Id          /*등록자 ID             */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
                
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '걱정제로 변경 SMS 대리점 발송 실패!!!'||'-'||v_Return_Message;
                    RAISE e_Error;
                END IF;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0010(v_Dlvr_Day ,v_Dlvr_Seq ,v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '걱정제로 배송신청 내역 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;    

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0010.p_IUDRtcs0010(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0010.p_IUDRtcs0010(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0010;
  
  /*****************************************************************************
  -- 걱정제로 배송신청 내역 - 걱정제로 배송 신청 등록 리스트- 조회조건에 맞는 계약정보를 조회한다.
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0.1      2016-11-23  임욱재           [20161123-0001]
                                           - 신청제한 연체기준 변경
                                           - 기존 : 전월말일 연체집계 기준
                                           - 변경 : 마지막 연체집계 기준  
  1.0.2      2018-06-07  김선태           [20180607-0001]
                                           - CP672단종대상 -> AH8 변경
  1.8        2019-04-26  wjim             [20180426_01] 최초부여횟수, 걱정제로 신청회차 추가
  1.12       2019-12-09  kstka            [20191209_01] 거점여부확인                                         
  *****************************************************************************/
  PROCEDURE p_sRtcs0010SelectOrderList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객코드              */
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE          /*사용자아이디           */
    ) IS
    
    v_Dely_Day   RTRE0100.DELY_DAY%TYPE;       /*마지막 연체집계 일자  */    --[20161123-0001]
    v_User_Grp   RTCM0001.USER_GRP%TYPE;       /*사용자그룹          */    --[20200914-0001]
  BEGIN
/*01 요청접수
02 배송요청
03 배송중
04 서비스 완료
06 요청취소

07 선처리
08 선처리_배송요청
09 선처리_배송중(완료)
*/
    -- 마지막 연체집계일 조회 [20161123-0001]
    SELECT  MAX(DELY_DAY)
      INTO  v_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';    
    
    SELECT  USER_GRP
      INTO  v_User_Grp
      FROM  RTCM0001
    WHERE   USER_ID = v_Reg_Id;
    
    OPEN Ref_Cursor FOR
    --    SELECT  A.ORD_NO,                                                          /*계약번호          */
--            B.CUST_NO,                                                         /*고객코드          */
--            B.CUST_NM,                                                         /*고객명            */
--            NVL(E.REP_MAT_CD, C.MAT_CD) AS MAT_CD,                             /*상품코드          */
--            Pkg_Rtsd0005.f_sRtsd0005MatName(NVL(E.REP_MAT_CD, C.MAT_CD)) AS MAT_NM,    /*상품명            */
--            A.CNT_CD,                                                          /*수량              */
--            A.PERIOD_CD,                                                       /*계약기간          */
--            A.MAKER_CD,                                                        /*카메이커          */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',A.MAKER_CD)  AS MAKER_NM,  /*카메이커명        */
--            A.MODEL_CD,                                                        /*차종              */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)  AS MODEL_NM,  /*차종명            */
--            A.CAR_NO,                                                          /*차량번호          */
--            A.CAR_OWNER,                                                       /*차량소유자        */
--            Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00007') AS SERV_CNT0, /*걱정제로 잔여횟수 */
--            A.ORD_DAY,                                                         /*계약일자          */
--            A.PROC_DAY,                                                        /*장착일자          */
--            B.POS_CD,                                                          /*고객주소-우편번호 */
--            B.ADDR1,                                                           /*고객주소-주소     */
--            B.ADDR2,                                                           /*고객주소-상세주소 */
--            B.MOB_NO,                                                          /*핸드폰번호        */
--            Pkg_Rtcs0010.f_sRtcs0010DlvrYn(A.ORD_NO)             AS DLVR_YN,   /*교체신청여부      */
--            D.DLVR_DAY,                                                        /*교체신청일자      */
--            D.DLVR_SEQ,                                                        /*교체신청순번      */        
--            D.AGENCY_CD,                                                       /*교체점코드        */
--            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(D.AGENCY_CD)        AS AGENCY_NM, /*교체점명          */
--            D.SERVRQ_DAY,                                                      /*교체예정일자      */       
--            D.POS_CD AS DLVPOS_CD,                                             /*우편번호          */
--            D.ADDR1  AS DLV_ADDR1,                                             /*주소              */
--            D.ADDR2  AS DLV_ADDR2,                                             /*상세주소          */
--            D.DLV_TEL,                                                         /*핸드폰번호        */
--            CASE WHEN E.REP_MAT_CD IS NOT NULL AND D.DLV_DESC NOT LIKE '%[CP672단종대체]%' THEN '[CP672단종대체]' || D.DLV_DESC ELSE D.DLV_DESC END AS DLV_DESC, /*배송요청사항      */
--            D.DLV_STAT,                                                        /*배송요청상태      */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('C024',D.DLV_STAT)  AS DLVSTAT_NM,/*배송요청상태명    */
--            NVL(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, NULL),0) AS APPR_AMT, /*연체금액    */
--            NVL(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),0) AS APPR_AMT, /*연체금액    */ [20161123-0001]
--            D.KWMENG AS CNT_CD1,                                                /*걱정제로 타이어 본수      */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S089',D.KWMENG)  AS CNT_NM /*걱정제로 타이어 본수명    */
--    FROM    RTSD0108 A,
--            RTSD0100 B,
--            RTSD0106 C,
--            RTCS0010 D,
--            RTSD0016 E CP672단종마스터추가
--    WHERE   A.ORD_NO   = DECODE( TRIM( v_Ord_No ), NULL, A.ORD_NO, v_Ord_No )
--    AND     A.CAR_NO   = DECODE( TRIM( v_Car_No ), NULL, A.CAR_NO, v_Car_No )
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     B.CUST_NO  = DECODE( TRIM( v_Cust_No ), NULL, B.CUST_NO, v_Cust_No )
--    AND     B.CUST_NM  LIKE '%' || TRIM( v_Cust_Nm ) || '%'
--    AND     B.TEL_NO   = DECODE( TRIM( v_Tel_No ), NULL, B.TEL_NO, v_Tel_No )
--    AND     B.MOB_NO   = DECODE( TRIM( v_Mob_No ), NULL, B.MOB_NO, v_Mob_No )
--    AND     A.ORD_NO   = C.ORD_NO
--    AND     A.ORD_NO   = D.ORD_NO(+)
--    AND     D.DLV_STAT(+) IN ( '01', '02', '03', '07','08' )   '04' '09'
--    AND     D.DLV_STAT(+) IN ( '01', '02', '03' );
--    AND     C.MAT_CD   = E.MAT_CD(+)
--    AND     NVL(D.DLVR_DAY, TO_CHAR(SYSDATE, 'YYYYMMDD')) BETWEEN NVL(E.STR_DAY, '20150901') AND NVL(E.END_DAY,TO_CHAR(SYSDATE, 'YYYYMMDD'))
--    AND     NVL(E.USE_YN, 'Y') = 'Y';


    SELECT  ROWNUM,
            A.ORD_NO,                                                          /*계약번호          */
            B.CUST_NO,                                                         /*고객코드          */
            B.CUST_NM,                                                         /*고객명            */
            NVL(E.REP_MAT_CD, C.MAT_CD) AS MAT_CD,/*상품코드          */
            Pkg_Rtsd0005.f_sRtsd0005MatName(NVL(E.REP_MAT_CD, C.MAT_CD)) || ' (외 ' || (SELECT COUNT(1)-1 FROM RTSD0106 WHERE ORD_NO = A.ORD_NO) ||'건)'  AS MAT_NM,    /*상품명            */
            A.CNT_CD,                                                          /*수량              */
            A.PERIOD_CD,                                                       /*계약기간          */
            A.MAKER_CD,                                                        /*카메이커          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',A.MAKER_CD)  AS MAKER_NM,  /*카메이커명        */
            A.MODEL_CD,                                                        /*차종              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)  AS MODEL_NM,  /*차종명            */
            A.CAR_NO,                                                          /*차량번호          */
            A.CAR_OWNER,                                                       /*차량소유자        */
            Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00007') AS SERV_CNT0, /*걱정제로 잔여횟수 */
            A.ORD_DAY,                                                         /*계약일자          */
            A.PROC_DAY,                                                        /*장착일자          */
          --  B.POS_CD,                                                          /*고객주소-우편번호 */
           -- B.ADDR1,                                                           /*고객주소-주소     */
          --  B.ADDR2,                                                           /*고객주소-상세주소 */
            B.MOB_NO,                                                          /*핸드폰번호        */
            Pkg_Rtcs0010.f_sRtcs0010DlvrYn(A.ORD_NO)             AS DLVR_YN,   /*교체신청여부      */
            D.DLVR_DAY,                                                        /*교체신청일자      */
            D.DLVR_SEQ,                                                        /*교체신청순번      */        
            D.AGENCY_CD,                                                       /*교체점코드        */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(D.AGENCY_CD)        AS AGENCY_NM, /*교체점명          */
            D.SERVRQ_DAY,                                                      /*교체예정일자      */       
            --D.POS_CD AS DLVPOS_CD,                                             /*우편번호          */
            D.ADDR1  AS DLV_ADDR1,                                             /*주소              */
          --  D.ADDR2  AS DLV_ADDR2,                                             /*상세주소          */
            D.DLV_TEL,                                                         /*핸드폰번호        */
            CASE WHEN E.REP_MAT_CD IS NOT NULL AND D.DLV_DESC NOT LIKE '%[CP672단종대체]%' THEN '[CP672단종대체]' || D.DLV_DESC ELSE D.DLV_DESC END AS DLV_DESC,                                                        /*배송요청사항      */
            D.DLV_STAT,                                                        /*배송요청상태      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C024',D.DLV_STAT)  AS DLVSTAT_NM,/*배송요청상태명    */
--            NVL(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, NULL),0) AS APPR_AMT, /*연체금액    */
            NVL(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),0) AS APPR_AMT, /*연체금액    */ --[20161123-0001]
            D.KWMENG AS CNT_CD1,                                                /*걱정제로 타이어 본수      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S089',D.KWMENG)  AS CNT_NM, /*걱정제로 타이어 본수명    */
            F.SERV_CNT0 AS SERV_CNT00,                                                 /*걱정제로 최초부여횟수 */ --[20180426_01]
            Pkg_Rtcs0010.f_sRtcs0010ReqNo(A.ORD_NO, D.DLVR_DAY, D.DLVR_SEQ) AS REQ_NO,  /*걱정제로 신청회차     */ --[20180426_01]
            Pkg_Exif0003.f_sExif0003O2OAgency(NVL(D.AGENCY_CD, A.AGENCY_CD)) AS O2O_YN, /*거점여부 */  --[20191209_01]
            NVL(D.INST_CD, '1030') AS INST_CD, /*장착유형*/    --[20200220]
            D.TMS_ORDERID, /*TMS Order Id*/ --[20200317]
            D.OMS_ORDERNO, /*OMS ORDER NO*/ --[20200624]
            D.DLV_GB    /*DLV_GB*/ --[20211123]
    FROM    RTSD0108 A
            INNER JOIN RTSD0100 B ON A.CUST_NO  = B.CUST_NO
            INNER JOIN RTSD0106 C ON A.ORD_NO   = C.ORD_NO
--            LEFT OUTER JOIN RTCS0010 D ON A.ORD_NO   = D.ORD_NO AND     (D.DLV_STAT IN ( '01', '02', '03', '07','08' ) OR D.DLV_STAT = (CASE WHEN v_User_Grp = '01' THEN '04' ELSE '01' END))
            LEFT OUTER JOIN RTCS0010 D ON A.ORD_NO   = D.ORD_NO AND     (D.DLV_STAT IN ( '01', '02', '03', '07','08' ) )
            LEFT OUTER JOIN RTSD0016 E ON C.MAT_CD   = E.MAT_CD AND     NVL(D.DLVR_DAY, TO_CHAR(SYSDATE, 'YYYYMMDD')) BETWEEN NVL(E.STR_DAY, '20150901') AND NVL(E.END_DAY,TO_CHAR(SYSDATE, 'YYYYMMDD')) AND     NVL(E.USE_YN, 'Y') = 'Y' --CP672단종마스터추가
            LEFT OUTER JOIN RTSD0013 F ON A.ORD_NO   = F.ORD_NO AND     F.PRS_DCD = 'B00007'
    WHERE   A.ORD_NO   = DECODE( TRIM( v_Ord_No ), NULL, A.ORD_NO, v_Ord_No )
    AND     A.CAR_NO   = DECODE( TRIM( v_Car_No ), NULL, A.CAR_NO, v_Car_No )
    AND     B.CUST_NO  = DECODE( TRIM( v_Cust_No ), NULL, B.CUST_NO, v_Cust_No )
    AND     B.CUST_NM  LIKE '%' || TRIM( v_Cust_Nm ) || '%'
    AND     B.TEL_NO   = DECODE( TRIM( v_Tel_No ), NULL, B.TEL_NO, v_Tel_No )
    AND     B.MOB_NO   = DECODE( TRIM( v_Mob_No ), NULL, B.MOB_NO, v_Mob_No )
--    AND     ROWNUM = 1
    ;


  END p_sRtcs0010SelectOrderList;  

/*****************************************************************************
  -- 걱정제로 배송신청 내역 Update - 배송신청, 상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0010ServSeqDlvStat (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Serv_Seq       IN RTCS0010.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0010
    SET    SERV_SEQ  = v_Serv_Seq,
           DLV_STAT  = v_Dlv_Stat,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  DLVR_DAY  = v_Dlvr_Day
    AND    DLVR_SEQ  = v_Dlvr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0010ServSeqDlvStat;
  
  /*****************************************************************************
  -- 걱정제로 배송상태 확인 - 배송요청상태만 조회  20160419 한승훈 
  *****************************************************************************/
  FUNCTION f_sRtcs0010DlvStat (
    v_Ord_No        IN RTCS0010.ORD_NO%TYPE         /* 주문번호 */
    ) RETURN VARCHAR2 IS
    v_Dlv_Stat  VARCHAR2(2);             /* 배송상태 */
  BEGIN
    /* 배송요청(02), 선처리_배송요청(08) 상태만 가져온다.*/
    
    SELECT  DECODE(COUNT(*), 0, '00', A.DLV_STAT)
    INTO    v_Dlv_Stat
    FROM    RTCS0010 A
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.DLV_STAT IN ('02', '08')
    GROUP BY A.DLV_STAT;

    RETURN v_Dlv_Stat;

   EXCEPTION
      WHEN OTHERS THEN
        RETURN '00';

  END f_sRtcs0010DlvStat;  
  
  /*****************************************************************************
   -- 걱정제로 배송상태 Update - 배송요청 상태 업데이트20160419 한승훈 
  배송요청(02) -> 배송중(03) , 선처리_배송요청(08) -> 선처리_배송중(09)
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0010DlvStat (
    v_Ord_No        IN RTCS0010.ORD_NO%TYPE,         /* 주문번호 */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
    v_Dlv_Stat  VARCHAR2(2);                        /* 배송상태 */
  BEGIN
    v_Dlv_Stat := PKG_RTCS0010.f_sRtcs0010DlvStat(v_Ord_No);
    IF v_Dlv_Stat IN ('02','08') THEN
    
        UPDATE RTCS0010
        SET    DLV_STAT = DECODE (v_Dlv_Stat,  '02', '03',  '08', '09'),
               CHG_ID = v_Reg_Id,
               CHG_DT = SYSDATE
        WHERE (ORD_NO, DLVR_SEQ, DLVR_DAY) IN
                  (SELECT ORD_NO, DLVR_SEQ, DLVR_DAY
                     FROM (SELECT ORD_NO,
                                  DLVR_SEQ,
                                  DLVR_DAY,
                                  ROW_NUMBER ()
                                     OVER (PARTITION BY ORD_NO ORDER BY DLVR_DAY ASC)
                                     RNK
                             FROM RTCS0010
                            WHERE ORD_NO = v_Ord_No AND DLV_STAT = v_Dlv_Stat)
                    WHERE RNK = 1);
                   
    END IF;
    
    RETURN SQLCODE;     

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0010DlvStat;
  
  /*****************************************************************************
  -- 걱정제로 배송신청 중복내역 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0010DupCount(
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,         /*배송신청일자        */
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0010
    WHERE   DLVR_DAY = v_Dlvr_Day
    AND     ORD_NO = v_Ord_No
    AND     KWMENG = '2'
    AND     DLV_STAT NOT IN ('06'); --동일 2본계약

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0010DupCount;
  
  /*****************************************************************************
  -- 걱정제로 신청회차 조회
     - 배송신청일자, 순번이 없는 경우 해당 계약의 신규신청 기준 신청회차 반환
     - 배송신청일자, 순번이 있는 경우 해당 시점 신청회차를 반환하되
       매칭되는 신청 건이 없는 경우 오류로 판단하여 0 반환
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2019-04-26  wjim             [20180426_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0010ReqNo (
      v_Ord_No      IN RTCS0010.ORD_NO%TYPE     /* 계약번호 */
    , v_Dlvr_Day    IN RTCS0010.DLVR_DAY%TYPE   /* 배송신청일자 */  
    , v_Dlvr_Seq    IN RTCS0010.DLVR_SEQ%TYPE   /* 배송신청순번 */
  ) RETURN NUMBER IS
    v_Req_No  NUMBER;
    
  BEGIN
  
    IF v_Dlvr_Day IS NULL OR v_Dlvr_Seq IS NULL THEN
        SELECT  COUNT(*) + 1
          INTO  v_Req_No
          FROM  RTCS0010
         WHERE  ORD_NO = v_Ord_No
           AND  DLV_STAT NOT IN ('06');
                 
    ELSE
        SELECT  NVL(SUM(ROW_NUM), 0)
          INTO  v_Req_No
          FROM  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY X.DLVR_DAY, DLVR_SEQ) AS ROW_NUM
                         ,  X.*
                      FROM  RTCS0010 X
                     WHERE  X.DLV_STAT NOT IN ('06')
                       AND  X.ORD_NO = v_Ord_No
                ) Y
         WHERE  Y.DLVR_DAY = v_Dlvr_Day
           AND  Y.DLVR_SEQ = v_Dlvr_Seq;
        
    END IF; 

    RETURN v_Req_No;

   EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0010ReqNo;
  
END Pkg_Rtcs0010;