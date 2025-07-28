CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0009 AS 
/*******************************************************************************
   NAME      Pkg_Rtcs0009
   PURPOSE   엔진오일 배송신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-10  jemcarry         1. Created this package body.
   1.0.1      2016-11-23  임욱재           [20161123-0001]
                                           - 신청제한 연체기준 변경
   1.0.2      2017-03-31  wjim             [20170331_02] 엔진오일 신청불가 메시지 분리
   1.1        2017-09-12  wjim             [20170906_01] SMS 발송기능 추가/변경
   1.2        2017-09-29  wjim             [20170929_02] 추석연휴 배송금지(임시처리)
   1.3        2018-02-09  wjim             [20180209_01] 구정연휴 배송금지(임시처리)
   1.4        2018-03-23  wjim             [20180323_01] 엔진오일 최초신청 가능기준 변경
   1.5        2019-05-14  wjim             [20180514_01] 엔진오일 최초신청 가능기준 보완
   1.6        2019-08-23  wjim             [20180823_01] 차대번호 필수 처리
   1.7        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가 
*******************************************************************************/

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0009Count(
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,         /*배송신청일자        */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE          /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0009
    WHERE   DLVR_DAY = v_Dlvr_Day
    AND     DLVR_SEQ = v_Dlvr_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0009Count;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0009 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dlvr_DayF      IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자FROM      */
    v_Dlvr_DayT      IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자TO        */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,          /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Sales_Office     IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,     /*장착 대리점           */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                     /* 로그인 사용자 그룹 */
    ) IS

  BEGIN

     -- 필수 : 요청시작일자, 요청종료일자
    -- 선택 : 상태
    IF v_Agency_Cd IS NOT NULL THEN
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
        SELECT  A.DLVR_DAY,                  /*배송신청일자        */
                A.DLVR_SEQ,                  /*순번                */
                A.ORD_NO,                    /*계약번호            */
                A.CUST_NO,                   /*고객코드            */
                Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO)           AS CUST_NM,   /*고객명    */
                B.MAKER_CD,                  /*카메이커            */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',B.MAKER_CD)   AS MAKER_NM,  /*카메이커명*/
                B.MODEL_CD,
                Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',B.MODEL_CD)   AS MODEL_NM,  /*차종명    */
                B.CAR_NO,                    /*차량번호            */
                A.FUEL_CD,                   /*유종                */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C020',A.FUEL_CD)    AS FUEL_NM,   /*유종명    */
                A.YRML_CD,                   /*연식                */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C021',A.YRML_CD)    AS YRML_NM,   /*연식명    */
                A.DSPLMT_CD,                 /*배기량              */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C022',A.DSPLMT_CD)  AS DSPLMT_NM, /*배기량명  */
                A.DLV_GB,                    /*배송구분            */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C023',A.DLV_GB)     AS DLVGB_NM,  /*배송구분명*/
                A.CONSIGNEE,                 /*수취인              */
                A.POS_CD,                    /*우편번호            */
                A.ADDR1,                     /*주소1               */
                A.ADDR2,                     /*주소2               */
                C.MOB_NO,                    /*고객 핸드폰 번호    */
                A.DLV_TEL,                   /*연락처              */
                A.DLV_DESC,                  /*배송요청사항        */
                A.DLV_STAT,                  /*상태                */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C019',A.DLV_STAT)   AS DLVSTAT_NM,/*상태명    */
                A.DLV_ENT,                   /*배송업체            */
                A.TRSP_DOC,                  /*송장번호            */
                A.SERV_SEQ,                  /*서비스 순번         */
                A.AGENCY_CD,                 /*대리점              */
                Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD)        AS AGENCY_NM, /*대리점명          */          
                A.SERVRQ_DAY,                /*교체예정일자        */
                A.DOWN_DAY,                  /*다운처리일시        */
                A.DLVS_DAY,                  /*송장적용일시        */
                A.REG_ID,                    /*등록자 ID           */
                A.REG_DT,                    /*등록일              */
                A.CHG_ID,                    /*변경자 ID           */
                A.CHG_DT,                     /*변경일             */
                A.CAR_ID,                     /*차대번호           */
                DECODE(A.REG_ID,'ONL_SYS','쇼핑몰','call06','콜센터',Pkg_Rtcm0051.f_sRtcm0051CodeName('C001', D.USER_GRP)) USER_GRP_NM, /*사용자 그룹명  */
                E.PROC_DAY                  /*서비스서명완료일           */
        FROM    RTCS0009 A,
                RTSD0108 B,
                RTSD0100 C,
                RTCM0001 D,
                RTSD0114 E
        WHERE   (v_Dlvr_DayF IS NULL OR A.DLVR_DAY  BETWEEN v_Dlvr_DayF AND v_Dlvr_DayT)
        AND     A.DLV_STAT LIKE v_Dlv_Stat||'%'
        AND     (v_Cust_No IS NULL OR A.CUST_NO = v_Cust_No)
        AND     (v_Ord_No  IS NULL OR A.ORD_NO = v_Ord_No)
        AND     A.ORD_NO   = B.ORD_NO
        AND     A.CUST_NO  = C.CUST_NO 
        AND     A.REG_ID = D.USER_ID 
--        AND DECODE(A.AGENCY_CD,NULL,0,A.AGENCY_CD) = NVL2(v_Agency_Cd,A.AGENCY_CD,0)     /*장착 대리점           */
        AND A.AGENCY_CD = v_Agency_Cd
        AND A.ORD_NO = E.ORD_NO(+)
        AND A.SERV_SEQ = E.SEQ(+)
        AND E.PRS_DCD1(+) = 'Y'      
        ORDER   BY A.DLVR_DAY, A.DLVR_SEQ
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
        
      ELSE
        OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
        SELECT A.*,
               B.RENTAL_GROUP,
               B.RENTAL_OFFICE,
               Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
               Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
          FROM (
        SELECT  A.DLVR_DAY,                  /*배송신청일자        */
                A.DLVR_SEQ,                  /*순번                */
                A.ORD_NO,                    /*계약번호            */
                A.CUST_NO,                   /*고객코드            */
                Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO)           AS CUST_NM,   /*고객명    */
                B.MAKER_CD,                  /*카메이커            */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',B.MAKER_CD)   AS MAKER_NM,  /*카메이커명*/
                B.MODEL_CD,
                Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',B.MODEL_CD)   AS MODEL_NM,  /*차종명    */
                B.CAR_NO,                    /*차량번호            */
                A.FUEL_CD,                   /*유종                */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C020',A.FUEL_CD)    AS FUEL_NM,   /*유종명    */
                A.YRML_CD,                   /*연식                */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C021',A.YRML_CD)    AS YRML_NM,   /*연식명    */
                A.DSPLMT_CD,                 /*배기량              */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C022',A.DSPLMT_CD)  AS DSPLMT_NM, /*배기량명  */
                A.DLV_GB,                    /*배송구분            */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C023',A.DLV_GB)     AS DLVGB_NM,  /*배송구분명*/
                A.CONSIGNEE,                 /*수취인              */
                A.POS_CD,                    /*우편번호            */
                A.ADDR1,                     /*주소1               */
                A.ADDR2,                     /*주소2               */
                C.MOB_NO,                    /*고객 핸드폰 번호    */
                A.DLV_TEL,                   /*연락처              */
                A.DLV_DESC,                  /*배송요청사항        */
                A.DLV_STAT,                  /*상태                */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('C019',A.DLV_STAT)   AS DLVSTAT_NM,/*상태명    */
                A.DLV_ENT,                   /*배송업체            */
                A.TRSP_DOC,                  /*송장번호            */
                A.SERV_SEQ,                  /*서비스 순번         */
                A.AGENCY_CD,                 /*대리점              */
                Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD)        AS AGENCY_NM, /*대리점명          */          
                A.SERVRQ_DAY,                /*교체예정일자        */
                A.DOWN_DAY,                  /*다운처리일시        */
                A.DLVS_DAY,                  /*송장적용일시        */
                A.REG_ID,                    /*등록자 ID           */
                A.REG_DT,                    /*등록일              */
                A.CHG_ID,                    /*변경자 ID           */
                A.CHG_DT,                     /*변경일              */
                A.CAR_ID,                     /*차대번호           */
                DECODE(A.REG_ID,'ONL_SYS','쇼핑몰','call06','콜센터',Pkg_Rtcm0051.f_sRtcm0051CodeName('C001', D.USER_GRP)) USER_GRP_NM, /*사용자 그룹명  */
                E.PROC_DAY                  /*서비스서명완료일           */
        FROM    RTCS0009 A,
                RTSD0108 B,
                RTSD0100 C,
                RTCM0001 D,
                RTSD0114 E
        WHERE   (v_Dlvr_DayF IS NULL OR A.DLVR_DAY  BETWEEN v_Dlvr_DayF AND v_Dlvr_DayT)
        AND     A.DLV_STAT LIKE v_Dlv_Stat||'%'
        AND     (v_Cust_No IS NULL OR A.CUST_NO = v_Cust_No)
        AND     (v_Ord_No  IS NULL OR A.ORD_NO = v_Ord_No)
        AND     A.ORD_NO   = B.ORD_NO
        AND     A.CUST_NO  = C.CUST_NO 
        AND     A.REG_ID = D.USER_ID 
        AND A.ORD_NO = E.ORD_NO(+)
        AND A.SERV_SEQ = E.SEQ(+)
        AND E.PRS_DCD1(+) = 'Y'      
        ORDER   BY A.DLVR_DAY, A.DLVR_SEQ
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
    ;
            
      END IF;


  END p_sRtcs0009;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.7        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가 
  *****************************************************************************/
  FUNCTION f_InsertRtcs0009 (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Fuel_Cd        IN RTCS0009.FUEL_CD%TYPE,        /*유종                  */
    v_Yrml_Cd        IN RTCS0009.YRML_CD%TYPE,        /*연식                  */
    v_Dsplmt_Cd      IN RTCS0009.DSPLMT_CD%TYPE,      /*배기량                */
    v_Dlv_Gb         IN RTCS0009.DLV_GB%TYPE,         /*배송구분              */
    v_Agency_Cd      IN RTCS0009.AGENCY_CD%TYPE,      /*대리점                */
    v_Consignee      IN RTCS0009.CONSIGNEE%TYPE,      /*수취인                */
    v_Pos_Cd         IN RTCS0009.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0009.ADDR1%TYPE,          /*주소1                 */
    v_Addr2          IN RTCS0009.ADDR2%TYPE,          /*주소2                 */
    v_Dlv_Tel        IN RTCS0009.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0009.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Servrq_Day     IN RTCS0009.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*다운처리일시          */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*송장적용일시          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*배송업체              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*송장번호              */
    v_Car_Id         IN RTCS0009.CAR_ID%TYPE,       /*차대번호              */    
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Tm        IN RTCS0009.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Poscd    IN RTCS0009.INST2_POSCD%TYPE,    /*Delivery 우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0009.INST2_ADDR1%TYPE,    /*Delivery 주소1        */ --[2019-00359563]
    v_Inst2_Addr2    IN RTCS0009.INST2_ADDR2%TYPE,    /*Delivery 주소2        */ --[2019-00359563]
    v_Car_No         IN RTCS0009.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0009 (
            DLVR_DAY,
            DLVR_SEQ,
            ORD_NO,
            CUST_NO,
            SERV_SEQ,
            DLV_STAT,
            FUEL_CD,
            YRML_CD,
            DSPLMT_CD,
            DLV_GB,
            AGENCY_CD,
            CONSIGNEE,
            POS_CD,
            ADDR1,
            ADDR2,
            DLV_TEL,
            DLV_DESC,
            SERVRQ_DAY,
            DOWN_DAY,
            DLVS_DAY,
            DLV_ENT,
            TRSP_DOC,
            CAR_ID,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            INST_TM,
            INST2_POSCD,
            INST2_ADDR1,
            INST2_ADDR2,
            CAR_NO
            )
    VALUES  (
            v_Dlvr_Day,
            v_Dlvr_Seq,
            v_Ord_No,
            v_Cust_No,
            v_Serv_Seq,
            v_Dlv_Stat,
            v_Fuel_Cd,
            v_Yrml_Cd,
            v_Dsplmt_Cd,
            v_Dlv_Gb,
            v_Agency_Cd,
            v_Consignee,
            v_Pos_Cd,
            v_Addr1,
            v_Addr2,
            v_Dlv_Tel,
            v_Dlv_Desc,
            v_Servrq_Day,
            v_Down_Day,
            v_Dlvs_Day,
            v_Dlv_Ent,
            v_Trsp_Doc,
            v_Car_Id,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Inst_Tm,
            v_Inst2_Poscd,
            v_Inst2_Addr1,
            v_Inst2_Addr2,
            v_Car_No
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0009;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.7        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가 
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0009 (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Fuel_Cd        IN RTCS0009.FUEL_CD%TYPE,        /*유종                  */
    v_Yrml_Cd        IN RTCS0009.YRML_CD%TYPE,        /*연식                  */
    v_Dsplmt_Cd      IN RTCS0009.DSPLMT_CD%TYPE,      /*배기량                */
    v_Dlv_Gb         IN RTCS0009.DLV_GB%TYPE,         /*배송구분              */
    v_Agency_Cd      IN RTCS0009.AGENCY_CD%TYPE,      /*대리점                */
    v_Consignee      IN RTCS0009.CONSIGNEE%TYPE,      /*수취인                */
    v_Pos_Cd         IN RTCS0009.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0009.ADDR1%TYPE,          /*주소1                 */
    v_Addr2          IN RTCS0009.ADDR2%TYPE,          /*주소2                 */
    v_Dlv_Tel        IN RTCS0009.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0009.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Servrq_Day     IN RTCS0009.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*다운처리일시          */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*송장적용일시          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*배송업체              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*송장번호              */
    v_Car_Id         IN RTCS0009.CAR_ID%TYPE,        /*차대번호              */    
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Tm        IN RTCS0009.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Poscd    IN RTCS0009.INST2_POSCD%TYPE,    /*Delivery 우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0009.INST2_ADDR1%TYPE,    /*Delivery 주소1        */ --[2019-00359563]
    v_Inst2_Addr2    IN RTCS0009.INST2_ADDR2%TYPE,    /*Delivery 주소2        */ --[2019-00359563]
    v_Car_No         IN RTCS0009.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    IF v_Car_Id IS NULL THEN 
        UPDATE RTCS0009
        SET    ORD_NO    = v_Ord_No,
               CUST_NO   = v_Cust_No,
               SERV_SEQ  = v_Serv_Seq,
               DLV_STAT  = v_Dlv_Stat,
               FUEL_CD   = v_Fuel_Cd,
               YRML_CD   = v_Yrml_Cd,
               DSPLMT_CD = v_Dsplmt_Cd,
               DLV_GB    = v_Dlv_Gb,
               AGENCY_CD = v_Agency_Cd,
               CONSIGNEE = v_Consignee,
               POS_CD    = v_Pos_Cd,
               ADDR1     = v_Addr1,
               ADDR2     = v_Addr2,
               DLV_TEL   = v_Dlv_Tel,
               DLV_DESC  = v_Dlv_Desc,
               SERVRQ_DAY= v_Servrq_Day,
               DOWN_DAY  = v_Down_Day,
               DLVS_DAY  = v_Dlvs_Day,
               DLV_ENT   = v_Dlv_Ent,
               TRSP_DOC  = v_Trsp_Doc,
               CHG_ID    = v_Reg_Id,
               CHG_DT    = SYSDATE,
               INST_TM     = v_Inst_Tm,
               INST2_POSCD = v_Inst2_Poscd,
               INST2_ADDR1 = v_Inst2_Addr1,
               INST2_ADDR2 = v_Inst2_Addr2,
               CAR_NO      = v_Car_No
        WHERE  DLVR_DAY  = v_Dlvr_Day
        AND    DLVR_SEQ  = v_Dlvr_Seq;
    ELSE
        UPDATE RTCS0009
        SET    ORD_NO    = v_Ord_No,
               CUST_NO   = v_Cust_No,
               SERV_SEQ  = v_Serv_Seq,
               DLV_STAT  = v_Dlv_Stat,
               FUEL_CD   = v_Fuel_Cd,
               YRML_CD   = v_Yrml_Cd,
               DSPLMT_CD = v_Dsplmt_Cd,
               DLV_GB    = v_Dlv_Gb,
               AGENCY_CD = v_Agency_Cd,
               CONSIGNEE = v_Consignee,
               POS_CD    = v_Pos_Cd,
               ADDR1     = v_Addr1,
               ADDR2     = v_Addr2,
               DLV_TEL   = v_Dlv_Tel,
               DLV_DESC  = v_Dlv_Desc,
               SERVRQ_DAY= v_Servrq_Day,
               DOWN_DAY  = v_Down_Day,
               DLVS_DAY  = v_Dlvs_Day,
               DLV_ENT   = v_Dlv_Ent,
               TRSP_DOC  = v_Trsp_Doc,
               CAR_ID    = v_Car_Id,
               CHG_ID    = v_Reg_Id,
               CHG_DT    = SYSDATE,
               INST_TM     = v_Inst_Tm,
               INST2_POSCD = v_Inst2_Poscd,
               INST2_ADDR1 = v_Inst2_Addr1,
               INST2_ADDR2 = v_Inst2_Addr2,
               CAR_NO      = v_Car_No
        WHERE  DLVR_DAY  = v_Dlvr_Day
        AND    DLVR_SEQ  = v_Dlvr_Seq;    
    END IF;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0009;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Delete 
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0009 (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0009
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

  END f_DeleteRtcs0009;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 관리(IUD)

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0.1      2016-11-23  임욱재           [20161123-0001]
                                           - 신청제한 연체기준 변경
                                           - 기존 : 전월말일 연체집계 기준
                                           - 변경 : 마지막 연체집계 기준
   1.0.2      2017-03-31  wjim             [20170331_02] 엔진오일 신청불가 메시지 분리
                                           - 기존 : 장착후 3개월, 연체존재 시 모두 동일 메시지 출력되어 고객혼동 야기
                                           - 변경 : 장착후 3개월, 연체존재 불가 메시지 분리
   1.1        2017-09-12  wjim             [20170906_01] SMS 발송기능 추가/변경
   1.2        2017-09-29  wjim             [20170929_02] 추석연휴 배송금지(임시처리)
   1.3        2018-02-09  wjim             [20180209_01] 구정연휴 배송금지(임시처리)
   1.4        2018-03-23  wjim             [20180323_01] 엔진오일 최초신청 가능기준 변경
                                           - 기존 : 장착후 3개월
                                           - 변경 : 1회차 등록비, 렌탈료 완납
   1.5        2019-05-14  wjim             [20180514_01] 엔진오일 최초신청 가능기준 보완
   1.6        2019-08-23  wjim             [20180823_01] 차대번호 필수 처리
   1.7        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0009 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN OUT RTCS0009.DLVR_SEQ%TYPE,   /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Fuel_Cd        IN RTCS0009.FUEL_CD%TYPE,        /*유종                  */
    v_Yrml_Cd        IN RTCS0009.YRML_CD%TYPE,        /*연식                  */
    v_Dsplmt_Cd      IN RTCS0009.DSPLMT_CD%TYPE,      /*배기량                */
    v_Dlv_Gb         IN RTCS0009.DLV_GB%TYPE,         /*배송구분              */
    v_Agency_Cd      IN RTCS0009.AGENCY_CD%TYPE,      /*대리점                */
    v_Consignee      IN RTCS0009.CONSIGNEE%TYPE,      /*수취인                */
    v_Pos_Cd         IN RTCS0009.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0009.ADDR1%TYPE,          /*주소1                 */
    v_Addr2          IN RTCS0009.ADDR2%TYPE,          /*주소2                 */
    v_Dlv_Tel        IN RTCS0009.DLV_TEL%TYPE,        /*연락처                */
    v_Dlv_Desc       IN RTCS0009.DLV_DESC%TYPE,       /*배송요청사항          */
    v_Servrq_Day     IN RTCS0009.SERVRQ_DAY%TYPE,     /*교체예정일자          */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*다운처리일시          */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*송장적용일시          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*배송업체              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*송장번호              */
    v_Car_Id         IN RTCS0009.CAR_ID%TYPE,         /*차대번호              */    
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Tm        IN RTCS0009.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst2_Poscd    IN RTCS0009.INST2_POSCD%TYPE,    /*Delivery 우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0009.INST2_ADDR1%TYPE,    /*Delivery 주소1        */ --[2019-00359563]
    v_Inst2_Addr2    IN RTCS0009.INST2_ADDR2%TYPE,    /*Delivery 주소2        */ --[2019-00359563]
    v_Car_No         IN RTCS0009.CAR_NO%TYPE,         /*차량번호              */ --[2019-00359563]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    
    lr_Sd0100       RTSD0100%ROWTYPE;             /*고객정보                  */ --[20170906_01]  
    lr_Sd0007       RTSD0007%ROWTYPE;             /*대리점정보                */ --[20170906_01] 
    
    v_Ord_NoB       RTCS0009.ORD_NO%TYPE;         /*계약번호                  */
    v_Cust_NoB      RTCS0009.CUST_NO%TYPE;        /*고객코드                  */
    v_Dlv_StatB     RTCS0009.DLV_STAT%TYPE;       /*상태                      */
    v_Down_DayB     RTCS0009.DOWN_DAY%TYPE;       /*다운처리일시              */
    v_ConsigneeB    RTCS0009.CONSIGNEE%TYPE;      /*수취인                    */
    v_Dlv_TelB      RTCS0009.DLV_TEL%TYPE;        /*연락처                    */
    v_Dely_Day      RTRE0100.DELY_DAY%TYPE;       /*마지막 연체집계 일자      */ --[20161123-0001]
    v_Appr_Amt      RTRE0100.APPR_AMT%TYPE;       /*연체금액                  */
    v_Proc_Day      RTSD0108.PROC_DAY%TYPE;       /*장착일자                  */ --[20170331_02]
--    v_ServCnt    NUMBER;                       /*서비스가능금액        */    
    v_Snd_Msg       RTSD0205.SND_MSG%TYPE;        /*발송 SMS메시지            */ --[20170906_01]
    v_Serv_Cntr     RTSD0013.SERV_CNTR%TYPE;      /*엔진오일 서비스 잔여횟수  */ --[20170906_01]
    v_Pay_Mthd      RTSD0108.PAY_MTHD%TYPE;       /* 결제구분                 */ --[20180323_01]  
    v_Zfb_Day       RTSD0109.ZFB_DAY%TYPE;        /* 초회차 렌탈료 결제기준일 */ --[20180323_01]
    v_Ord_id        RTSD0108.ORD_ID%TYPE;        /* 주문구분                 */
    
    v_templateCd    VARCHAR2(20);                 /* 알림톡 템플릿 번호 */
    
    v_Ord_type      VARCHAR2(1);                  /*계약번호 앞1자리          */ --[20170906_01]
    v_Chk_Cnt       NUMBER DEFAULT 0;
    
    
  BEGIN

    -- 필수값:
    IF 0 != ISDATE(v_Dlvr_Day) THEN
        v_Return_Message := '배송신청일자('||v_Dlvr_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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
    
    --[20170929_02] 2017.10.01 ~ 2017.10.11 금지
    --[20180209_01] 2018.02.13 ~ 2018.02.19 금지
    IF v_Servrq_Day BETWEEN '20180213' AND '20180219' THEN
        v_Return_Message := '연휴기간으로 인해 2월 19일 이후부터 교체예정일 선택이 가능합니다.';
        RAISE e_Error;
    END IF;

-- 마지막 연체집계일 조회 [20161123-0001]
    SELECT  MAX(DELY_DAY)
      INTO  v_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';
         
/*서비스 3개월 이후가 지내야 받을수있음*/
   /*SELECT   
      DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, NULL),
      0,  CASE -- 장착일자 ~ (+ 3개월 - 1일)까지는 0,
      WHEN TO_CHAR(ADD_MONTHS(A.PROC_DAY, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN 0
      ELSE  Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') END,
      0) AS PRS_DCD1_CNT 
      INTO v_ServCnt
   FROM RTSD0108 A
   WHERE ORD_NO = v_Ord_No;*/
   
--    SELECT   
--      DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day), --[20161123-0001]
--      0,  CASE -- 장착일자 ~ (+ 3개월 - 1일)까지는 0,
--      WHEN TO_CHAR(ADD_MONTHS(A.PROC_DAY, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN 0
--      ELSE  Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') END,
--      0) AS PRS_DCD1_CNT 
--      INTO v_ServCnt
--   FROM RTSD0108 A
--   WHERE ORD_NO = v_Ord_No; --[20170331_02] 이전

    IF v_Comm_Dvsn IN ('I','U') THEN
        
--        IF v_ServCnt = 0 THEN
--            v_Return_Message := '서비스 신청은 장착일자 3개월 이후 가능합니다.!';
--            RAISE e_Error;
--        END IF;  --[20170331_02] 이전   

        IF 0 = Pkg_Rtcm0060.f_sRtcm0060AfterInDay(v_Dlvr_Day, v_Servrq_Day) THEN
            v_Return_Message := '교체 예정일자는 접수일(등록일)로부터 영업일 기준 3일 이후 ~ 10일 이내만 접수 가능합니다.!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Dlv_Stat) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C019', v_Dlv_Stat)) THEN
            v_Return_Message := '상태('||v_Dlv_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Fuel_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C020', v_Fuel_Cd)) THEN
            v_Return_Message := '유종('||v_Fuel_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Yrml_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C021', v_Yrml_Cd)) THEN
            v_Return_Message := '연식('||v_Yrml_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Dsplmt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C022', v_Dsplmt_Cd)) THEN
            v_Return_Message := '배기량('||v_Dsplmt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Dlv_Gb) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C023', v_Dlv_Gb)) THEN
            v_Return_Message := '배송구분('||v_Dlv_Gb||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        IF (TRIM(v_Consignee) IS NULL) THEN
            v_Return_Message := '수취인('||v_Consignee||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Pos_Cd) IS NULL) THEN
            v_Return_Message := '우편번호('||v_Cust_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Addr1) IS NULL) THEN
            v_Return_Message := '주소1('||v_Addr1||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Addr2) IS NULL) THEN
            v_Return_Message := '주소2('||v_Addr2||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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
        
        -- [20180823_01]
        IF (TRIM(v_Car_Id) IS NULL) OR (TRIM(v_Car_Id) = '') THEN
            v_Return_Message := '차대번호 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Dlv_Gb) = '01') THEN

            IF ((TRIM(v_Agency_Cd) IS NULL) OR (0 = Pkg_Rtsd0007.f_sRtsd0007Count( v_Agency_Cd ))) THEN
                v_Return_Message := '대리점('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF 0 != ISDATE(v_Servrq_Day) THEN
                v_Return_Message := '교체예정일자('||v_Servrq_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

        END IF;

    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 < f_sRtcs0009Count(v_Dlvr_Day, v_Dlvr_Seq) THEN
            v_Return_Message := '해당 일자-번호('||v_Dlvr_Day||'-'||v_Dlvr_Seq||')로 이미등록된 데이터가 존재하므로 신규등록처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 서비스 적용 가능여부 체크
        IF 0 = Pkg_Rtsd0013.f_sRtsd0013ServCntr( v_Ord_No, 'B00001') THEN
            v_Return_Message := '계약번호 기준 프리미엄서비스(RTSD0013) 잔여횟수(0)으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 기존내역 존재여부 체크: 계약번호, 고객코드 기준으로 RTCS0009 테이블에 DLV_STAT 값이 '01', '02', '03' 인 경우 처리불가
        IF 'Y' = f_sRtcs0009DlvrYn(v_Ord_No) THEN
            v_Return_Message := '현재 진행건이 존재하므로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 엔진오일 신청 서비스에 수취인명 변경(대리점배송:01)
        IF TRIM(v_Dlv_Gb) = '01' THEN 
                               
            SELECT AGENCY_NM, TEL_NO 
            INTO   v_ConsigneeB, v_Dlv_TelB
            FROM   RTVIEW02
            WHERE  AGENCY_CD = v_Agency_Cd;
        
        ELSE 
        
            v_ConsigneeB := v_Consignee;
            v_Dlv_TelB   := v_Dlv_Tel;
            
        END IF;
        
        /*
         * 연체금액 체크
         */        
        -- 마지막 연체집계일 조회 [20161123-0001]
        SELECT  MAX(DELY_DAY)
          INTO  v_Dely_Day
          FROM  RTRE0100
         WHERE  DEL_YN = 'N';
         
        v_Appr_Amt := Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(v_Cust_No, NULL, v_Dely_Day);   --[20161123-0001]
--        v_Appr_Amt := Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(v_Cust_No, NULL, NULL);
        IF NVL(v_Appr_Amt,0) > 0 THEN
            v_Return_Message := '연체금액('||TO_CHAR(NVL(v_Appr_Amt,0))||')이 존재하므로 처리가 불가합니다.!';
            RAISE e_Error;
        END IF;
        
        -- 장착일자 ~ (+ 3개월 - 1일)까지는 엔진오일 신청불가 
        -- - [20170331_02] 에 의해 연체금액 체크로직과 분리 
        -- - [20180323_01] 에 의해 주석처리       
--        SELECT  PROC_DAY
--          INTO  v_Proc_Day
--          FROM  RTSD0108
--         WHERE  ORD_NO = v_Ord_No;
--   
--        IF TO_CHAR(ADD_MONTHS(v_Proc_Day, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN
--            v_Return_Message := '서비스 신청은 장착일자('||v_Proc_Day||') 3개월 이후부터 가능합니다!';
--            RAISE e_Error;
--        END IF;

        -- [20180514_01] 예외처리 대상 계약변호가 없을 때 NOT IN ('')로 처리하면 해당 검증분기를 타지 않음
        -- 따라서 'X'와 같이 존재하지 않는 계약번호를 포함시킴
        -- 예외처리 필요 시 해당 계약번호는 'X' 뒤에 추가하면 됨
        IF v_Ord_No NOT IN ('X','D19000201831') THEN
        
            /*
             * 1회차 렌탈료 결제가 진행됐는지 확인 [20180323_01]
             */
            -- 결제유형 확인+ 주문유형 확인(일시불인경우 패스)
            SELECT  PAY_MTHD, ORD_ID
              INTO  v_Pay_Mthd, v_Ord_id
              FROM  RTSD0108
             WHERE  ORD_NO = v_Ord_No;
             
            -- 최초결제일 확인
            IF v_Ord_id != '03' THEN    
                SELECT  ZFB_DAY
                  INTO  v_Zfb_Day
                  FROM  RTSD0109
                 WHERE  ORD_NO   = v_Ord_No
                   AND  SCHD_SEQ = 1;
            END IF;
            
            -- 일시불인 경우에는 매월 수납을 하지 않아서 체크를 하면 안된다.
            IF v_Ord_id != '03' THEN    
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
                    v_Return_Message := '첫 렌탈료 결제 이후 신청가능합니다!';
                    RAISE e_Error;
                END IF;
            END IF;
        
        END IF;
        
        -- 순번 획득
        v_Dlvr_Seq := f_sRtcs0009DlvrSeq(v_Dlvr_Day);

        IF 0 != f_InsertRtcs0009(v_Dlvr_Day ,v_Dlvr_Seq ,v_Ord_No ,v_Cust_No ,
                                 v_Serv_Seq ,v_Dlv_Stat ,v_Fuel_Cd ,v_Yrml_Cd ,
                                 v_Dsplmt_Cd ,v_Dlv_Gb ,v_Agency_Cd ,v_ConsigneeB ,
                                 v_Pos_Cd ,v_Addr1 ,v_Addr2 ,v_Dlv_TelB ,
                                 v_Dlv_Desc ,v_Servrq_Day ,v_Down_Day ,v_Dlvs_Day ,
                                 v_Dlv_Ent ,v_Trsp_Doc ,v_Car_Id, v_Reg_Id,
                                 v_Inst_Tm, v_Inst2_Poscd, v_Inst2_Addr1, v_Inst2_Addr2, v_Car_No, v_ErrorText) THEN
            v_Return_Message := '엔진오일 배송신청 내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
        ---------------------------
        -- SMS발송 [20170906_01] --
        ---------------------------
        -- 계약번호 앞자리 (D,O,B,M..) 
        v_Ord_type := SUBSTR(v_Ord_No,1, 1);
        
        IF v_Ord_type IN ('D','O','B','M','L','P') THEN
        
            -- 고객 정보 조회
            SELECT  *
              INTO  lr_Sd0100
              FROM  RTSD0100
             WHERE  CUST_NO = v_Cust_No;
             
            -- 대리점 정보 조회 [2017.10.20] 자택 및 타지역배송의 경우 대리점코드가 존재하지 않음 K.S.T
            IF v_Dlv_Gb IN ('01') THEN
            
                SELECT  *
                  INTO  lr_Sd0007
                  FROM  RTSD0007
                 WHERE  AGENCY_CD = v_Agency_Cd;
                 
            END IF;
            
            -- 서비스 잔여횟수 조회
            SELECT  NVL(MAX(SERV_CNTR)-1, 0)
              INTO  v_Serv_Cntr
              FROM  RTSD0013
             WHERE  ORD_NO  = v_Ord_No
               AND  PRS_DCD = 'B00001';

            /*
             * 고객용 SMS 발송 
             */
            v_Snd_Msg := '[넥센타이어]  '||lr_Sd0100.CUST_NM||' 고객님께서 신청하신 엔진오일 서비스가 정상 접수되었습니다.';
            v_Snd_Msg := v_Snd_Msg||' 엔진오일 부품 배송이 시작되면 배송안내 문자가 발송될 예정입니다.';
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            
            IF v_Dlv_Gb IN ('01') THEN  --대리점배송의 경우
                v_Snd_Msg := v_Snd_Msg||'(장착점 안내) 상호명 : '||v_ConsigneeB||', 주소 : '||v_Addr1||' '||v_Addr2;
                v_Snd_Msg := v_Snd_Msg||', 전화번호 : '||v_Dlv_TelB;
--                v_Snd_Msg := v_Snd_Msg||', 교체 예정일 : '||REGEXP_REPLACE(v_Servrq_Day, '(\d{4})(\d{2})(\d{2})', '\1.\2.\3');
                
                v_templateCd := 'RENTAL00000000000014';
            ELSE                        --자택배송, 타지역배송의 경우
                v_Snd_Msg := v_Snd_Msg||'(배송정보 ) 수취인 : '||v_ConsigneeB||', 주소 : '||v_Addr1||' '||v_Addr2;
                
                v_templateCd := 'RENTAL00000000000016';
            END IF;

            v_Snd_Msg := v_Snd_Msg||', 택배사 : 한진택배';
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||'(서비스 잔여 회수 : '||v_Serv_Cntr||'회)';
            
            IF v_templateCd = 'RENTAL00000000000016' THEN
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'※유의사항: 엔진오일 도착 완료 후 3개월 경과시 교체여부와 관계없이 서비스 횟수는 차감되며,';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'엔진오일의 분실 우려가 있을 수 있습니다. (분실될 경우 당사에서 재발송 되지 않습니다.)';            
            END IF;

            NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                  'I'               /*예약 전송여부         */
                , '00000000000000'  /*예약 전송시간         */
                , lr_Sd0100.MOB_NO  /*받는 전화번호         */
                , '18550100'        /*보내는 전화번호       */
                , v_Snd_Msg         /*메시지내용            */
                , 'S007'            /*사용자지정 필드       */
                , v_Ord_No          /*사용자지정 필드       */
                , '2'
                , v_templateCd
                , v_Reg_Id          /*등록자 ID             */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
                
            IF 0 != v_Success_Code THEN
                v_Return_Message := '엔진오일신청 SMS 고객발송 실패!!!'||'-'||v_Return_Message;
                RAISE e_Error;
            END IF;
            
            /*
             * 대리점용 SMS발송
             */
            IF (TRIM(lr_Sd0007.MOB_NO) IS NOT NULL) AND (v_Dlv_Gb IN ('01')) THEN --대리점배송의 경우에만 발송

                v_Snd_Msg := '[넥센타이어] '||lr_Sd0100.CUST_NM||' 고객님께서 신청하신 엔진오일 서비스가 접수되었습니다.';                
                v_Snd_Msg := v_Snd_Msg||' 연락처 : '||REGEXP_REPLACE(lr_Sd0100.MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3');
--                v_Snd_Msg := v_Snd_Msg||', 교체 예정일 : '||REGEXP_REPLACE(v_Servrq_Day, '(\d{4})(\d{2})(\d{2})', '\1.\2.\3');
                
                NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                      'I'               /*예약 전송여부         */
                    , '00000000000000'  /*예약 전송시간         */
                    , lr_Sd0007.MOB_NO  /*받는 전화번호         */
                    , '18550100'        /*보내는 전화번호       */
                    , v_Snd_Msg         /*메시지내용            */
                    , 'S027'            /*사용자지정 필드       */
                    , v_Ord_No          /*사용자지정 필드       */
                    , '2'
                    , 'RENTAL00000000000015'
                    , v_Reg_Id          /*등록자 ID             */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
                
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '엔진오일신청 SMS 대리점발송 실패!!!'||'-'||v_Return_Message;
                    RAISE e_Error;
                END IF;
            END IF;
        
        END IF;

    ELSIF v_Comm_Dvsn IN ('U','D') THEN

        IF 0 = f_sRtcs0009Count(v_Dlvr_Day, v_Dlvr_Seq) THEN
            v_Return_Message := '해당 일자-번호('||v_Dlvr_Day||'-'||v_Dlvr_Seq||')로 등록된 데이터가 존재하지 않음므로 수정처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        BEGIN

            SELECT  ORD_NO, CUST_NO, DLV_STAT, DOWN_DAY
            INTO    v_Ord_NoB, v_Cust_NoB, v_Dlv_StatB, v_Down_DayB
            FROM    RTCS0009
            WHERE   DLVR_DAY  = v_Dlvr_Day
            AND     DLVR_SEQ  = v_Dlvr_Seq;

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '엔진오일 배송신청 내역(RTCS0009) 획득 실패!.';
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

        IF (v_Dlv_Stat <> '01') THEN
            v_Return_Message := '해당 엔진오일 배송신청 상태가 요청접수(01) 상태이므로 처리가 불가 합니다.!.('||v_Dlv_StatB||')';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcs0009(v_Dlvr_Day ,v_Dlvr_Seq ,v_Ord_No ,v_Cust_No ,
                                     v_Serv_Seq ,v_Dlv_Stat ,v_Fuel_Cd ,v_Yrml_Cd ,
                                     v_Dsplmt_Cd ,v_Dlv_Gb ,v_Agency_Cd ,v_Consignee ,
                                     v_Pos_Cd ,v_Addr1 ,v_Addr2 ,v_Dlv_Tel ,
                                     v_Dlv_Desc ,v_Servrq_Day ,v_Down_Day ,v_Dlvs_Day ,
                                     v_Dlv_Ent ,v_Trsp_Doc ,v_Car_Id,v_Reg_Id, 
                                     v_Inst_Tm, v_Inst2_Poscd, v_Inst2_Addr1, v_Inst2_Addr2, v_Car_No, v_ErrorText) THEN
                v_Return_Message := '엔진오일 배송신청 내역 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0009(v_Dlvr_Day ,v_Dlvr_Seq ,v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '엔진오일 배송신청 내역 삭제 실패!!!'||'-'||v_Errortext;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_IUDRtcs0009(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_IUDRtcs0009(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0009;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0009FieldValue(
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Field_Nm       IN VARCHAR                       /*필드명                */
    ) RETURN VARCHAR2 IS
    v_Field_Value VARCHAR(2000);                      /*필드값                */
  BEGIN


    SELECT  TO_CHAR(DECODE(UPPER(TRIM(v_Field_Nm)),
              TRIM('ORD_NO    '), ORD_NO    ,  /*계약번호     */
              TRIM('CUST_NO   '), CUST_NO   ,  /*고객코드     */
              TRIM('SERV_SEQ  '), SERV_SEQ  ,  /*서비스 순번  */
              TRIM('DLV_STAT  '), DLV_STAT  ,  /*상태         */
              TRIM('FUEL_CD   '), FUEL_CD   ,  /*유종         */
              TRIM('YRML_CD   '), YRML_CD   ,  /*연식         */
              TRIM('DSPLMT_CD '), DSPLMT_CD ,  /*배기량       */
              TRIM('DLV_GB    '), DLV_GB    ,  /*배송구분     */
              TRIM('AGENCY_CD '), AGENCY_CD ,  /*대리점       */
              TRIM('CONSIGNEE '), CONSIGNEE ,  /*수취인       */
              TRIM('POS_CD    '), POS_CD    ,  /*우편번호     */
              TRIM('ADDR1     '), ADDR1     ,  /*주소1        */
              TRIM('ADDR2     '), ADDR2     ,  /*주소2        */
              TRIM('DLV_TEL   '), DLV_TEL   ,  /*연락처       */
              TRIM('DLV_DESC  '), DLV_DESC  ,  /*배송요청사항 */
              TRIM('SERVRQ_DAY'), SERVRQ_DAY,  /*교체예정일자 */
              TRIM('DOWN_DAY  '), DOWN_DAY  ,  /*다운처리일시 */
              TRIM('DLVS_DAY  '), DLVS_DAY  ,  /*송장적용일시 */
              TRIM('DLV_ENT   '), DLV_ENT   ,  /*배송업체     */
              TRIM('TRSP_DOC  '), TRSP_DOC  ,  /*송장번호     */
              TRIM('REG_ID    '), REG_ID    ,  /*등록자 ID    */
              TRIM('REG_DT    '), REG_DT    ,  /*등록일       */
              TRIM('CHG_ID    '), CHG_ID    ,  /*변경자 ID    */
              TRIM('CHG_DT    '), CHG_DT    ,  /*변경일       */
              NULL)) FIELD_VALUE
    INTO    v_Field_Value
    FROM    RTCS0009
    WHERE   DLVR_DAY = v_Dlvr_Day
    AND     DLVR_SEQ = v_Dlvr_Seq;

    RETURN v_Field_Value;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0009FieldValue;


  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrSeq(
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE          /*배송신청일자        */
    ) RETURN NUMBER IS
    v_Dlvr_Seq RTCS0009.DLVR_SEQ%TYPE;                  /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(DLVR_SEQ)
                 FROM    RTCS0009
                 WHERE   DLVR_DAY = v_Dlvr_Day)+ 1, 1) AS DLVR_SEQ
    INTO    v_Dlvr_Seq
    FROM    DUAL;

    RETURN v_Dlvr_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0009DlvrSeq;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 교체신청여부
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrYn(
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2 IS
    v_Dlvr_Yn   VARCHAR2(1);                          /*교체신청여부          */
  BEGIN

    SELECT  DECODE( COUNT(*), 0, 'N', 'Y')
    INTO    v_Dlvr_Yn
    FROM    RTCS0009
    WHERE   ORD_NO = v_Ord_No
    AND     DLV_STAT IN ( '01', '02', '03' );

    RETURN v_Dlvr_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0009DlvrYn;


  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 교체신청건수 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrCnt(
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER IS
    v_Dlvr_Cnt   NUMBER;                              /*교체신청건수          */
  BEGIN

    SELECT  COUNT(*)
    INTO    v_Dlvr_Cnt
    FROM    RTCS0009
    WHERE   ORD_NO = v_Ord_No
    AND     DLV_STAT IN ( '01', '02', '03' );

    RETURN v_Dlvr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0009DlvrCnt;
  
  
  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 배송상태 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrStat(
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2 IS
    v_Dlvr_Stat   VARCHAR2(10);                          /*교체신청여부          */
  BEGIN

    SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName('C019', DLV_STAT)
    INTO    v_Dlvr_Stat
    FROM    RTCS0009
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Dlvr_Stat;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0009DlvrStat;
  

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 엔진오일교체 신청등록 - 조회조건에 맞는 계약정보를 조회한다.
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0.1      2016-11-23  임욱재           [20161123-0001]
                                           - 신청제한 연체기준 변경
                                           - 기존 : 전월말일 연체집계 기준
                                           - 변경 : 마지막 연체집계 기준 
  *****************************************************************************/
  PROCEDURE p_sRtcs0009SelectOrderList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객코드              */
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE          /*휴대폰번호            */
    ) IS

    v_Dely_Day   RTRE0100.DELY_DAY%TYPE;       /*마지막 연체집계 일자  */    --[20161123-0001]
    
  BEGIN
    -- 마지막 연체집계일 조회 [20161123-0001]
    SELECT  MAX(DELY_DAY)
      INTO  v_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N'; 

    -- 고객번호, 계약번호, 차량번호, 전화번호, 휴대번호 중 1개는 필수
    -- 고객명만 입력 불가

    OPEN Ref_Cursor FOR
    SELECT  ROWNUM,
            A.ORD_NO,                                                          /*계약번호          */
            B.CUST_NO,                                                         /*고객코드          */
            B.CUST_NM,                                                         /*고객명            */
            C.MAT_CD,                                                          /*상품코드          */
            Pkg_Rtsd0005.f_sRtsd0005MatName(C.MAT_CD)  || ' (외 ' || (SELECT COUNT(1)-1 FROM RTSD0106 WHERE ORD_NO = A.ORD_NO) ||'건)'  AS MAT_NM,    /*상품명            */
            A.CNT_CD,                                                          /*수량              */
            A.PERIOD_CD,                                                       /*계약기간          */
            A.MAKER_CD,                                                        /*카메이커          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',A.MAKER_CD)  AS MAKER_NM,  /*카메이커명        */
            A.MODEL_CD,                                                        /*차종              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)  AS MODEL_NM,  /*차종명            */
            A.CAR_NO,                                                          /*차량번호          */
            A.CAR_OWNER,                                                       /*차량소유자        */
            Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00001') AS SERV_CNT0, /*엔진오일 잔여횟수 */
            A.ORD_DAY,                                                         /*계약일자          */
            A.PROC_DAY,                                                        /*장착일자          */
            B.POS_CD,                                                          /*고객주소-우편번호 */
            B.ADDR1,                                                           /*고객주소-주소     */
            B.ADDR2,                                                           /*고객주소-상세주소 */
            B.MOB_NO,                                                          /*핸드폰번호        */
            Pkg_Rtcs0009.f_sRtcs0009DlvrYn(A.ORD_NO)             AS DLVR_YN,   /*교체신청여부      */
            D.DLVR_DAY,                                                        /*교체신청일자      */
            D.DLVR_SEQ,                                                        /*교체신청순번      */
            D.FUEL_CD,                                                         /*유종              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C020',D.FUEL_CD)   AS FUEL_NM,   /*유종명            */
            D.YRML_CD,                                                         /*연식              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C021',D.YRML_CD)   AS YRML_NM,   /*연식명            */
            D.DSPLMT_CD,                                                       /*배기량            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C022',D.DSPLMT_CD) AS DSPLMT_NM, /*배기량명          */
            D.DLV_GB,                                                          /*배송지구분        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C023',D.DLV_GB)    AS DLVGB_NM,  /*배송지구분명      */
            D.AGENCY_CD,                                                       /*교체점코드        */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(D.AGENCY_CD)        AS AGENCY_NM, /*교체점명          */
            D.SERVRQ_DAY,                                                      /*교체예정일자      */
            D.CONSIGNEE,                                                       /*수취인            */
            D.POS_CD AS DLVPOS_CD,                                             /*우편번호          */
            D.ADDR1  AS DLV_ADDR1,                                             /*주소              */
            D.ADDR2  AS DLV_ADDR2,                                             /*상세주소          */
            D.DLV_TEL,                                                         /*핸드폰번호        */
            D.DLV_DESC,                                                        /*배송요청사항      */
            D.DLV_STAT,                                                        /*배송요청상태      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C019',D.DLV_STAT)  AS DLVSTAT_NM,/*배송요청상태명    */
--            NVL(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, NULL),0) AS APPR_AMT, /*연체금액    */
            NVL(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),0) AS APPR_AMT, /*연체금액    */ --[20161123-0001]
            D.CAR_ID
    FROM    RTSD0108 A,
            RTSD0100 B,
            RTSD0106 C,
            RTCS0009 D
    WHERE   A.ORD_NO   = DECODE( TRIM( v_Ord_No ), NULL, A.ORD_NO, v_Ord_No )
    AND     A.CAR_NO   = DECODE( TRIM( v_Car_No ), NULL, A.CAR_NO, v_Car_No )
    AND     A.CUST_NO  = B.CUST_NO
    AND     B.CUST_NO  = DECODE( TRIM( v_Cust_No ), NULL, B.CUST_NO, v_Cust_No )
    AND     B.CUST_NM  LIKE '%' || TRIM( v_Cust_Nm ) || '%'
    AND     B.TEL_NO   = DECODE( TRIM( v_Tel_No ), NULL, B.TEL_NO, v_Tel_No )
    AND     B.MOB_NO   = DECODE( TRIM( v_Mob_No ), NULL, B.MOB_NO, v_Mob_No )
    AND     A.ORD_NO   = C.ORD_NO
    AND     A.ORD_NO   = D.ORD_NO(+)
    AND     D.DLV_STAT(+) IN ( '01', '02', '03' )
    AND     ROWNUM = 1;

  END p_sRtcs0009SelectOrderList;



  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Update - 엔진오일교체 신청내역조회 - 조회된 신청내역에 대하여 엑셀 다운로드시 상태 업데이트 처리 한다. -> 개별등록 -> 미사용
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0009DownDay (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*다운처리일시          */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Ord_NoB    RTCS0009.ORD_NO%TYPE;         /*계약번호              */
    v_Cust_NoB   RTCS0009.CUST_NO%TYPE;        /*고객코드              */
    v_Dlv_StatB  RTCS0009.DLV_STAT%TYPE;       /*상태                  */
    v_Down_DayB  RTCS0009.DOWN_DAY%TYPE;       /*다운처리일시          */
  BEGIN

    -- 필수값:
    IF 0 != ISDATE(v_Dlvr_Day) THEN
        v_Return_Message := '배송신청일자('||v_Dlvr_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Dlvr_Seq) IS NULL) OR (0 = f_sRtcs0009Count(v_Dlvr_Day, v_Dlvr_Seq)) THEN
        v_Return_Message := '순번('||v_Dlvr_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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

    BEGIN

        SELECT  ORD_NO, CUST_NO, DLV_STAT, DOWN_DAY
        INTO    v_Ord_NoB, v_Cust_NoB, v_Dlv_StatB, v_Down_DayB
        FROM    RTCS0009
        WHERE   DLVR_DAY  = v_Dlvr_Day
        AND     DLVR_SEQ  = v_Dlvr_Seq;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '엔진오일 배송신청 내역(RTCS0009) 획득 실패!.';
            RAISE e_Error;
    END;


    -- 계약번호, 고객번호 동일여부 체크
    IF v_Ord_No <> v_Ord_NoB THEN
        v_Return_Message := '계약번호('||v_Ord_No||'='||v_Ord_NoB||')가 일치하지 않음으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Cust_No <> v_Cust_NoB THEN
        v_Return_Message := '고객번호('||v_Cust_No||'='||v_Cust_NoB||')가 일치하지 않음으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 상태( DLV_STAT ) 체크 : '01' 요청접수 인 경우, '02'이며 다운일자가 동일한 경우 업데이트 가능
    IF v_Dlv_StatB <> '01' AND ( v_Dlv_StatB <> '02' OR v_Down_DayB <> TO_CHAR(SYSDATE,'YYYYMMDD'))THEN
--        v_Return_Message := '배송신청 상태가 요청접수(01) 인 경우만 처리 가능!.('||v_Dlv_StatB||')';
        v_Return_Message := '엑셀 다운을 처리할 수 없는 상태입니다.('||v_Dlv_StatB||'-'||v_Down_DayB||')';
        RAISE e_Error;
    END IF;


    UPDATE  RTCS0009
    SET     DLV_STAT  = '02', -- 배송준비
            DOWN_DAY  = NVL(TRIM(v_Down_Day),TO_CHAR(SYSDATE,'YYYYMMDD')),
            CHG_ID    = v_Reg_Id,
            CHG_DT    = SYSDATE
    WHERE   DLVR_DAY  = v_Dlvr_Day
    AND     DLVR_SEQ  = v_Dlvr_Seq;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_UpdateRtcs0009DownDay(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_UpdateRtcs0009DownDay(2)', v_ErrorText, v_Return_Message);


  END p_UpdateRtcs0009DownDay;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Update - 배송신청, 상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0009ServSeqDlvStat (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*순번                  */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*상태                  */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0009
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

  END f_UpdateRtcs0009ServSeqDlvStat;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 - 엔진오일 교체 신청 내역 송장정보업데이트
  -- VER 1.1 2016-07-26 이영근, 문자메시지 발송 기능 추가
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-10  jemcarry         1. Created this package body.
   1.0.1      2016-11-23  임욱재           [20161123-0001]
                                           - 신청제한 연체기준 변경
   1.0.2      2017-03-31  wjim             [20170331_02] 엔진오일 신청불가 메시지 분리
   1.1        2017-09-12  wjim             [20170906_01] SMS 발송기능 추가/변경
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0009TrspDoc (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN OUT RTCS0009.DLVR_SEQ%TYPE,   /*순번                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*고객코드              */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*송장적용일시          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*배송업체              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*송장번호              */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Ord_NoB       RTCS0009.ORD_NO%TYPE;             /*계약번호              */
    v_Cust_NoB      RTCS0009.CUST_NO%TYPE;            /*고객코드              */
    v_Dlv_StatB     RTCS0009.DLV_STAT%TYPE;           /*상태                  */
    v_Down_DayB     RTCS0009.DOWN_DAY%TYPE;           /*다운처리일시          */
    v_Dlv_GbB       RTCS0009.DLV_GB%TYPE;             /*배송구분              */
    v_Equ_No        RTSD0108.EQU_NO%TYPE;             /*설비번호              */
    v_A_Mileage     RTSD0108.C_MILEAGE%TYPE;          /*현재주행거리          */
    v_Serv_Seq      RTCS0007.SERV_SEQ%TYPE;           /*서비스 순번           */
    v_Per_Tp        RTCS0007.PER_TP%TYPE;             /*정기,비정기구분       */
    v_Serv_Sign_Seq RTCS0007.SERV_SIGN_SEQ%TYPE;      /*서비스확인서 서명순번 */
    v_Seq           RTCS0008.SEQ%TYPE;                /*순번                  */
    v_Dlvc_Yn       RTCS0008.DLVC_YN%TYPE;            /*수수료 적용여부       */
    v_Cust_Nm       RTSD0100.CUST_NM%TYPE;
    v_Mob_No        RTSD0100.MOB_NO%TYPE;
--    v_Sms_Msg       RTSD0205.SND_MSG%TYPE;
    v_Snd_Msg       RTSD0205.SND_MSG%TYPE;
    v_Agency_Mobno  RTSD0007.MOB_NO%TYPE;             /*대리점 휴대폰번호     */ --[20170906_01]
    v_Consignee     RTCS0009.CONSIGNEE%TYPE;
    v_Addr1         RTCS0009.ADDR1%TYPE;
    v_Addr2         RTCS0009.ADDR2%TYPE;
    v_Dlv_Tel       RTCS0009.DLV_TEL%TYPE;
    v_Servrq_Day    RTCS0009.SERVRQ_DAY%TYPE;
    v_Serv_Cntr     RTSD0013.SERV_CNTR%TYPE;
    
    v_templateCd    VARCHAR2(20);               /* 알림톡 템플릿코드 */
    
    v_Ord_type      VARCHAR2(1);                  /*계약번호 앞1자리          */ --[20170906_01]
    
  BEGIN

    -- 필수값:
    IF 0 != ISDATE(v_Dlvr_Day) THEN
        v_Return_Message := '배송신청일자('||v_Dlvr_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Dlvr_Seq) IS NULL THEN
        v_Return_Message := '순번('||v_Dlvr_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF 0 != ISDATE(v_Dlvs_Day) THEN
        v_Return_Message := '송장적용일시('||v_Dlvs_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Dlv_Ent) IS NULL THEN
        v_Return_Message := '배송업체('||v_Dlv_Ent||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Trsp_Doc) IS NULL THEN
        v_Return_Message := '송장번호('||v_Trsp_Doc||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    BEGIN

        SELECT  A.ORD_NO, A.CUST_NO, A.DLV_STAT, A.DOWN_DAY, A.DLV_GB, B.CUST_NM, B.MOB_NO, C.MOB_NO,
                A.CONSIGNEE, A.ADDR1, A.ADDR2, A.DLV_TEL, A.SERVRQ_DAY, 
                NVL(D.SERV_CNTR-1, 0) 
        INTO    v_Ord_NoB, v_Cust_NoB, v_Dlv_StatB, v_Down_DayB, v_Dlv_GbB, v_Cust_Nm, v_Mob_No, v_Agency_Mobno,
                v_Consignee, v_Addr1, v_Addr2, v_Dlv_Tel, v_Servrq_Day,
                v_Serv_Cntr
        FROM    RTCS0009 A,
                RTSD0100 B,
                RTSD0007 C,
                RTSD0013 D
        WHERE   A.DLVR_DAY   = v_Dlvr_Day
        AND     A.DLVR_SEQ   = v_Dlvr_Seq
        AND     A.CUST_NO    = B.CUST_NO
        AND     A.AGENCY_CD  = C.AGENCY_CD(+)
        AND     A.ORD_NO     = D.ORD_NO(+)
        AND     D.PRS_DCD(+) = 'B00001';

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '엔진오일 배송신청 내역(RTCS0009) 획득 실패!.'||'-'||SUBSTR(SQLERRM, 1, 200);
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

    IF (v_Dlv_StatB <> '02') THEN
        v_Return_Message := '해당 엔진오일 배송신청 상태가 배송준비(02) 상태가 아니므로 처리가 불가 합니다.!.('||v_Dlv_StatB||')';
        RAISE e_Error;
    END IF;

    -- DLV_GB에 따라 '01' 대리점 배송인 경우 '03' 배송준비 '02' 자택배송 OR '03' 타지역배송 인 경우 '04' 처리완료
    UPDATE RTCS0009
    SET    ORD_NO    = v_Ord_No,
           CUST_NO   = v_Cust_No,
           DLV_STAT  = DECODE(DLV_GB, '01', '03', '04'),
           DLVS_DAY  = v_Dlvs_Day,
           DLV_ENT   = v_Dlv_Ent,
           TRSP_DOC  = v_Trsp_Doc,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  DLVR_DAY  = v_Dlvr_Day
    AND    DLVR_SEQ  = v_Dlvr_Seq;

    -- '02' 자택배송 OR '03' 타지역배송 인 경우
    IF v_Dlv_GbB IN ('02','03') THEN

        -- 서비스명1_엔진오일(RTSD0013) -  해당 서비스건 횟수 차감처리
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00001', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '서비스명1_엔진오일(RTSD0013) -  해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

        BEGIN
            SELECT EQU_NO, C_MILEAGE
            INTO   v_Equ_No, v_A_Mileage
            FROM   RTSD0108
            WHERE  ORD_NO = v_Ord_No;

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '서비스 처리내역(RTCS0007) 등록에 필요한 설비번호와 마일리지 조회시 실패!!!'||'-'||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;

        END;

        v_Per_Tp := '2';
        v_Serv_Sign_Seq := NULL;

        -- 서비스 처리내역(RTCS0007) 등록
        Pkg_Rtcs0007.p_IUDRtcs0007('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Per_Tp, v_Reg_Id, v_A_Mileage, TO_CHAR(SYSDATE,'YYYYMMDD'),
                                   TO_CHAR(SYSDATE,'HH24MISS'), v_Serv_Sign_Seq, v_Reg_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);


        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역(RTCS0007) 등록 실패!!!'||'-'||v_Return_Message;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

        v_Dlvc_Yn := 'N';

        -- 서비스 처리내역 상세(RTCS0008) 등록
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00001', v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq,
                                   v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등 실패!!!'||'-'||v_Return_Message;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    END IF;
    
    --2016-07-26 이영근, 문자메시지 발송 추가
    /* [20170906_01] 에 의해 주석처리
    v_Sms_Msg := v_Cust_Nm || ' 고객님께서 신청하신 엔진오일 서비스를 위한 부품 배송을 시작하였습니다. 배송업체: ' || v_Dlv_Ent || ', 송장번호: ' || v_Trsp_Doc;
    Pkg_Rtsd0205.p_Rtsd0205Interface('I', '00000000000000', v_Mob_No, '18550100', v_Sms_Msg, 'S008', '서비스배송안내', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '고객용 SMS 발송 실패!!!'||'-'||v_Return_Message;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
    */
    
    ---------------------------
    -- SMS발송 [20170906_01] --
    ---------------------------
    -- 계약번호 앞자리 (D,O,B,M..) 
    v_Ord_type := SUBSTR(v_Ord_No,1, 1);
        
    IF v_Ord_type IN ('D','O','B','M') THEN
        /*
         * 고객용 SMS 발송 
         */
        v_Snd_Msg := '[넥센타이어] '||v_Cust_Nm||' 고객님께서 신청하신 엔진오일 서비스를 위한 부품 배송을 시작하였습니다.';
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            
        IF v_Dlv_GbB IN ('01') THEN  --대리점배송의 경우  
--            v_Snd_Msg := v_Snd_Msg||'교체 예정일 이전 방문을 원하실 경우, 장착대리점에 해당 부품 도착 확인 후 방문 요청드리며,';
--            v_Snd_Msg := v_Snd_Msg||' 교체 예정일로부터 60일이 경과할 경우 부품 회수 및 서비스 잔여 횟수가 자동 차감되오니 신청하신 일자에 방문하여 주시기 바랍니다.';
--            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
--            v_Snd_Msg := v_Snd_Msg||'(장착점 안내) 상호명 : '||v_Consignee||', 주소 : '||v_Addr1||' '||v_Addr2;
--            v_Snd_Msg := v_Snd_Msg||', 전화번호 : '||v_Dlv_Tel;
--            v_Snd_Msg := v_Snd_Msg||', 교체 예정일 : '||REGEXP_REPLACE(v_Servrq_Day, '(\d{4})(\d{2})(\d{2})', '\1.\2.\3');
            
            v_Snd_Msg := v_Snd_Msg||'엔진오일 신청일로부터 60일이 경과할 경우 부품 회수 및 서비스 잔여 횟수가 차감되오니 신청하신 일자에 방문하여 주시기 바랍니다.';
            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            v_Snd_Msg := v_Snd_Msg||'(장착점 안내 ) 상호명 : '||v_Consignee||', 주소 : '||v_Addr1||' '||v_Addr2;
            v_Snd_Msg := v_Snd_Msg||', 전화번호 : '||v_Dlv_Tel;            

            v_templateCd := 'RENTAL00000000000021';
        ELSE                        --자택배송, 타지역배송의 경우            
            v_Snd_Msg := v_Snd_Msg||'(배송정보 ) 수취인 : '||v_Consignee||', 주소 : '||v_Addr1||' '||v_Addr2;
            v_Snd_Msg := v_Snd_Msg||', 전화번호 : '||v_Dlv_Tel;
            
            v_templateCd := 'RENTAL00000000000023';            
        END IF;

        v_Snd_Msg := v_Snd_Msg||', 택배사 : '||v_Dlv_Ent||', 송장번호 : '||v_Trsp_Doc;
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||'(서비스 잔여 회수 : '||v_Serv_Cntr||'회)';
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
            
        v_Snd_Msg := v_Snd_Msg||'※유의사항: 엔진오일 도착 완료 후 3개월 경과시 교체여부와 관계없이 서비스 횟수는 차감되며,';
        v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
        v_Snd_Msg := v_Snd_Msg||'엔진오일의 분실 우려가 있을 수 있습니다. (분실될 경우 당사에서 재발송 되지 않습니다.)';

   
        NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
              'I'               /*예약 전송여부         */
            , '00000000000000'  /*예약 전송시간         */
            , v_Mob_No          /*받는 전화번호         */
            , '18550100'        /*보내는 전화번호       */
            , v_Snd_Msg         /*메시지내용            */
            , 'S008'            /*사용자지정 필드       */
            , v_Ord_No          /*사용자지정 필드       */
            , '2'
            , v_templateCd
            , v_Reg_Id          /*등록자 ID             */
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );
                
        IF 0 != v_Success_Code THEN
            v_Return_Message := '엔진오일배송 SMS 고객발송 실패!!!'||'-'||v_Return_Message;
            RAISE e_Error;
        END IF;
            
        /*
         * 대리점용 SMS발송
         */
        IF (TRIM(v_Agency_Mobno) IS NOT NULL) AND (v_Dlv_GbB IN ('01')) THEN --대리점배송의 경우에만 발송

            v_Snd_Msg := '[넥센타이어] '||v_Cust_Nm||' 고객님께서 신청하신 엔진오일 서비스를 위한 부품 배송을 시작하였습니다.';                
            v_Snd_Msg := v_Snd_Msg||' 배송업체 : '||v_Dlv_Ent||', 송장번호 : '||v_Trsp_Doc;
                
            NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                  'I'               /*예약 전송여부         */
                , '00000000000000'  /*예약 전송시간         */
                , v_Agency_Mobno    /*받는 전화번호         */
                , '18550100'        /*보내는 전화번호       */
                , v_Snd_Msg         /*메시지내용            */
                , 'S028'            /*사용자지정 필드       */
                , v_Ord_No          /*사용자지정 필드       */
                , '2'
                , 'RENTAL00000000000022'
                , v_Reg_Id          /*등록자 ID             */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
                
            IF 0 != v_Success_Code THEN
                v_Return_Message := '엔진오일신청 SMS 대리점발송 실패!!!'||'-'||v_Return_Message;
                RAISE e_Error;
            END IF;
        END IF;
        
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_UpdateRtcs0009TrspDoc(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_UpdateRtcs0009TrspDoc(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtcs0009TrspDoc;


  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Update - 엔진오일교체 신청내역조회 - 조회된 신청내역에 대하여 엑셀 다운로드시 상태 업데이트 처리 한다.
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0009DownDayAll (
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    UPDATE  RTCS0009
    SET     DLV_STAT  = '02', -- 배송준비
            DOWN_DAY  = TO_CHAR(SYSDATE,'YYYYMMDD'),
            CHG_ID    = v_Reg_Id,
            CHG_DT    = SYSDATE
    WHERE   DLV_STAT  = '01';


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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_UpdateRtcs0009DownDayAll(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0009.p_UpdateRtcs0009DownDayAll(2)', v_ErrorText, v_Return_Message);


  END p_UpdateRtcs0009DownDayAll;

  /*****************************************************************************
  -- 엔진오일 배송신청 내역 Select - 대상 발취 결과, 다운로드 대상조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0009DownList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,        /*배송신청일자FROM      */
    v_LOGIN_ID       IN VARCHAR2,                    /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP     IN VARCHAR2                     /* 로그인 사용자 그룹 */
    ) IS

  BEGIN

    -- 필수 : 요청시작일자, 요청종료일자
    -- 선택 : 상태

    OPEN Ref_Cursor FOR
    SELECT  A.DLVR_DAY,                  /*배송신청일자        */
            A.DLVR_SEQ,                  /*순번                */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객코드            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO)           AS CUST_NM,   /*고객명    */
            B.MAKER_CD,                  /*카메이커            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',B.MAKER_CD)   AS MAKER_NM,  /*카메이커명*/
            B.MODEL_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',B.MODEL_CD)   AS MODEL_NM,  /*차종명    */
            B.CAR_NO,                    /*차량번호            */
            A.FUEL_CD,                   /*유종                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C020',A.FUEL_CD)    AS FUEL_NM,   /*유종명    */
            A.YRML_CD,                   /*연식                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C021',A.YRML_CD)    AS YRML_NM,   /*연식명    */
            A.DSPLMT_CD,                 /*배기량              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C022',A.DSPLMT_CD)  AS DSPLMT_NM, /*배기량명  */
            A.DLV_GB,                    /*배송구분            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C023',A.DLV_GB)     AS DLVGB_NM,  /*배송구분명*/
            A.CONSIGNEE,                 /*수취인              */
            A.POS_CD,                    /*우편번호            */
            A.ADDR1,                     /*주소1               */
            A.ADDR2,                     /*주소2               */
            C.MOB_NO,                    /*고객 핸드폰 번호    */
            A.DLV_TEL,                   /*연락처              */
            A.DLV_DESC,                  /*배송요청사항        */
            A.DLV_STAT,                  /*상태                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C019',A.DLV_STAT)   AS DLVSTAT_NM,/*상태명    */
            A.DLV_ENT,                   /*배송업체            */
            A.TRSP_DOC,                  /*송장번호            */
            A.SERV_SEQ,                  /*서비스 순번         */
            A.AGENCY_CD,                 /*대리점              */
            A.SERVRQ_DAY,                /*교체예정일자        */
            A.DOWN_DAY,                  /*다운처리일시        */
            A.DLVS_DAY,                  /*송장적용일시        */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0009 A,
            RTSD0108 B,
            RTSD0100 C
    WHERE   A.DOWN_DAY  = v_Down_Day
    AND     A.DLV_STAT  = '02'
    AND     A.ORD_NO    = B.ORD_NO
    AND     A.CUST_NO   = C.CUST_NO 
    ORDER   BY A.DLVR_DAY, A.DLVR_SEQ;

  END p_sRtcs0009DownList;

END Pkg_Rtcs0009;