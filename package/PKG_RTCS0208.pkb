CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0208 AS 
/*******************************************************************************
   NAME      Pkg_Rtcs0207
   PURPOSE   미모파손 부여/신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-10-05  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 마모파손보증 신청 내역
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-05  kstka           Created. [20201005_01]                             
  *****************************************************************************/
  FUNCTION f_sRtcs0208Count(
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,         /*배송신청일자        */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE          /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0208
    WHERE   DLVR_DAY = v_Dlvr_Day
    AND     DLVR_SEQ = v_Dlvr_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0208Count;
  
  /*****************************************************************************
  -- 마모파손보증 신청 내역
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-05  kstka           Created. [20201005_01]                             
  *****************************************************************************/
  FUNCTION f_sRtcs0208SumCount(
    v_Ord_No       IN RTCS0208.ORD_NO%TYPE,          /*주문번호        */
    v_Serv_Cd      IN RTCS0208.SERV_CD%TYPE          /*서비스코드      */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL(SUM(KWMENG), '0')
    INTO    v_curr_cunt
    FROM    RTCS0208
    WHERE   ORD_NO = v_Ord_No
    AND     SERV_CD = v_Serv_Cd
    AND     DLV_STAT IN ('01', '02', '03');

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0208SumCount;
  
  /*****************************************************************************
  -- 마모파손보증 부여/신청 내역
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-05  kstka           Created. [20201005_01]                             
  *****************************************************************************/
  PROCEDURE p_sRtcs0208SelectList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0208.CUST_NO%TYPE,        /*고객코드              */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTCS0208.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Car_No         IN RTCS0208.CAR_NO%TYPE,         /*차량번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Dlvr_Day_F     IN RTCS0208.DLVR_DAY%TYPE,       /*신청일자 From         */
    v_Dlvr_Day_T     IN RTCS0208.DLVR_DAY%TYPE,       /*신청일자 To           */
    v_Proc_Day_F     IN RTCS0208.PROC_DAY%TYPE,       /*장착일자 From         */
    v_Proc_Day_T     IN RTCS0208.PROC_DAY%TYPE,       /*장착일자 To           */
    v_Chan_Cd        IN RTSD0108.CHAN_CD%TYPE,        /*채널코드              */
    v_Dlv_Stat       IN RTCS0208.DLV_STAT%TYPE,       /*신청상태              */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE          /*사용자아이디           */
    ) IS
    
    v_Dely_Day   RTRE0100.DELY_DAY%TYPE;       /*마지막 연체집계 일자  */    --[20161123-0001]
    v_User_Grp   RTCM0001.USER_GRP%TYPE;       /*사용자그룹          */    --[20200914-0001]
  BEGIN
/*
00 접수대기
01 신청
02 배송요청
03 배송중
04 장착완료
06 요청취소
*/
    -- 마지막 연체집계일 조회 [20161123-0001]
--    SELECT  MAX(DELY_DAY)
--      INTO  v_Dely_Day
--      FROM  RTRE0100
--     WHERE  DEL_YN = 'N';    
    
    OPEN Ref_Cursor FOR
    SELECT  ROWNUM,
            NVL(D.DLVR_DAY, TO_CHAR(SYSDATE, 'YYYYMMDD')) AS DLVR_DAY,
            NVL(D.SERV_CD, Pkg_Rtcs0207.f_sGetService(A.ORD_NO)) AS SERV_CD,
            'B' AS DLVR_TYPE,
            NVL(D.DLVR_SEQ, 0) AS DLVR_SEQ,
            A.ORD_NO,                                                          /*계약번호          */
            B.CUST_NO,                                                         /*고객코드          */
            B.CUST_NM,                                                         /*고객명            */
            C.MAT_CD AS MAT_CD,/*상품코드          */
            Pkg_Rtsd0005.f_sRtsd0005MatName(C.MAT_CD) || ' (외 ' || (SELECT COUNT(1)-1 FROM RTSD0106 WHERE ORD_NO = A.ORD_NO) ||'건)'  AS MAT_NM,    /*상품명            */
            A.CNT_CD,                                                          /*수량              */
            A.PERIOD_CD,                                                       /*계약기간          */
            A.MAKER_CD,                                                        /*카메이커          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',A.MAKER_CD)  AS MAKER_NM,  /*카메이커명        */
            A.MODEL_CD,                                                        /*차종              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)  AS MODEL_NM,  /*차종명            */
            A.CAR_NO,                                                          /*차량번호          */
            A.CAR_OWNER,                                                       /*차량소유자        */
            Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00011') AS B00011_R_CNT, /*마모보증 잔여횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00012') AS B00012_R_CNT, /*마모보증 잔여횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00007') - Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00007') AS B00007_U_CNT, /*걱정제로 사용횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00011') - Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00011') AS B00011_U_CNT, /*마모보증 사용횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00012') - Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00012') AS B00012_U_CNT, /*파손보증 사용횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00007') AS B00007_I_CNT,   
            A.ORD_DAY,                                                         /*계약일자          */
            A.PROC_DAY,                                                        /*장착일자          */
            NVL(D.SERVAD_SEQ, Pkg_Rtcs0207.f_sRtcs0207ServAdSeq(A.ORD_NO, 'A', (SELECT X.SERV_CD FROM RTCS0207 X WHERE X.ORD_NO = A.ORD_NO AND X.DLV_STAT = '04' AND ROWNUM = 1))) AS SERVAD_SEQ,
            B.POS_CD,                                                          /*고객주소-우편번호 */
            B.ADDR1,                                                           /*고객주소-주소     */
            B.ADDR2,                                                           /*고객주소-상세주소 */
            B.MOB_NO,                                                          /*핸드폰번호        */
            D.DLVR_DAY,                                                        /*교체신청일자      */
            D.DLVR_SEQ,                                                        /*교체신청순번      */        
            D.AGENCY_CD,                                                       /*교체점코드        */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(D.AGENCY_CD)        AS AGENCY_NM, /*교체점명          */
            D.SERVRQ_DAY,                                                      /*교체예정일자      */       
            D.POS_CD AS DLV_POS_CD,                                             /*우편번호          */
            D.ADDR1  AS DLV_ADDR1,                                             /*주소              */
            D.ADDR2  AS DLV_ADDR2,                                             /*상세주소          */
            D.DLV_TEL,                                                         /*핸드폰번호        */                                                       /*배송요청사항      */
            D.DLV_STAT,                                                        /*배송요청상태      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C035',D.DLV_STAT)  AS DLVSTAT_NM,/*배송요청상태명    */
            Pkg_Rtcs0208.f_sRtcs0208DlvrYn(A.ORD_NO, D.DLVR_SEQ) DLVR_YN,
            '0' AS APPR_AMT,
--            NVL(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),0) AS APPR_AMT, /*연체금액    */ --[20161123-0001]
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, Pkg_Rtcs0207.f_sGetService(A.ORD_NO)) - f_sRtcs0208SumCount(A.ORD_NO, Pkg_Rtcs0207.f_sGetService(A.ORD_NO))  AS BASIC_SERV_CNTR,
            NVL(D.KWMENG, '0') AS CNT_CD1,                                                           /*신청할수있는 타이어 본수      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S089',D.KWMENG)  AS CNT_NM, /*걱정제로 타이어 본수명    */
            F.SERV_CNT0 AS SERV_CNT00,                                                 /*걱정제로 최초부여횟수 */ --[20180426_01]
            Pkg_Rtcs0208.f_sRtcs0208ReqNo(A.ORD_NO, D.DLVR_TYPE, D.DLVR_DAY, D.DLVR_SEQ) AS REQ_NO,  /*걱정제로 신청회차     */ --[20180426_01]
            D.C_MILEAGE AS C_MILEAGE,
            D.DLV_DESC,
            Pkg_Exif0004.f_sExif0004O2OTireImg(A.ORD_NO) AS IMG_URL,
            D.APPLY_REASON
    FROM    RTSD0108 A
            INNER JOIN RTSD0100 B ON A.CUST_NO  = B.CUST_NO
            INNER JOIN RTSD0106 C ON A.ORD_NO   = C.ORD_NO AND C.SEQ = 1
            LEFT OUTER JOIN RTCS0208 D ON A.ORD_NO   = D.ORD_NO AND     (D.DLV_STAT IN ( '00', '01', '02', '03' ) )
            LEFT OUTER JOIN RTSD0013 F ON A.ORD_NO   = F.ORD_NO AND     F.PRS_DCD IN ('B00011')
            LEFT OUTER JOIN RTSD0013 G ON A.ORD_NO   = G.ORD_NO AND     G.PRS_DCD IN ('B00012')
--            INNER JOIN RTCS0207 H ON A.ORD_NO   = H.ORD_NO AND H.SERV_CD = NVL(D.SERV_CD, Pkg_Rtcs0207.f_sGetService(A.ORD_NO)) AND H.DLV_STAT = '04'
    WHERE   A.ORD_NO   = DECODE( TRIM( v_Ord_No ), NULL, A.ORD_NO, v_Ord_No )
    AND     A.CAR_NO   = DECODE( TRIM( v_Car_No ), NULL, A.CAR_NO, v_Car_No )
    AND     B.CUST_NO  = DECODE( TRIM( v_Cust_No ), NULL, B.CUST_NO, v_Cust_No )
    AND     B.CUST_NM  LIKE '%' || TRIM( v_Cust_Nm ) || '%'
    AND     B.MOB_NO   = DECODE( TRIM( v_Mob_No ), NULL, B.MOB_NO, v_Mob_No )
    AND     (v_Dlvr_Day_F IS NULL OR D.DLVR_DAY BETWEEN v_Dlvr_Day_F AND v_Dlvr_Day_T)
    AND     (v_Proc_Day_F IS NULL OR D.PROC_DAY BETWEEN v_Proc_Day_F AND v_Proc_Day_T)
    AND     A.CHAN_CD   = DECODE( TRIM( v_Chan_Cd ), NULL, A.CHAN_CD, v_Chan_Cd )
    AND     (v_Dlv_Stat IS NULL OR D.DLV_STAT   = DECODE( TRIM( v_Dlv_Stat ), NULL, D.DLV_STAT, v_Dlv_Stat ))
    AND     EXISTS (SELECT 1 FROM RTCS0207 X WHERE X.ORD_NO = A.ORD_NO AND X.DLV_STAT = '04') --접수내역 존재 여부 확인
    ;


  END p_sRtcs0208SelectList;  
  
  /*****************************************************************************
  -- 마모파손보증 신청이력 조회
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2021-07-15  kstka           Created. [20210715_01]                             
  *****************************************************************************/
  PROCEDURE p_sRtcs0208 (
    Ref_Cursor     IN OUT SYS_REFCURSOR
    , v_Dlvr_DayF    IN RTCS0208.DLVR_DAY%TYPE       /*배송신청일자FROM      */
    , v_Dlvr_DayT    IN RTCS0208.DLVR_DAY%TYPE       /*배송신청일자TO        */
    , v_Dlv_Stat     IN RTCS0208.DLV_STAT%TYPE       /*상태                  */
    , v_Ord_No       IN RTCS0208.ORD_NO%TYPE         /*계약번호              */
    , v_Cust_No      IN RTCS0208.CUST_NO%TYPE        /*고객코드              */    
    , v_Sales_Office IN RTSD0104.SALES_OFFICE%TYPE   /*지점                  */
    , v_Sales_Group  IN RTSD0104.SALES_GROUP%TYPE    /*지사                  */
    , v_Agency_Cd    IN RTSD0104.AGENCY_CD%TYPE      /*장착 대리점           */
    , v_RENTAL_GROUP  IN VARCHAR2
    , v_RENTAL_OFFICE IN VARCHAR2
    , v_LOGIN_ID      IN VARCHAR2                     /* 로그인ID: 관련항목 범위 지정 */
    , v_LOGIN_GRP     IN VARCHAR2                     /* 로그인 사용자 그룹 */
    ) IS
    
    v_Dely_Day   RTRE0100.DELY_DAY%TYPE;       /*마지막 연체집계 일자  */    --[20161123-0001]
    v_User_Grp   RTCM0001.USER_GRP%TYPE;       /*사용자그룹          */    --[20200914-0001]
  BEGIN
/*
00 접수대기
01 신청
02 배송요청
03 배송중
04 장착완료
06 요청취소
*/
    -- 마지막 연체집계일 조회 [20161123-0001]
--    SELECT  MAX(DELY_DAY)
--      INTO  v_Dely_Day
--      FROM  RTRE0100
--     WHERE  DEL_YN = 'N';    
    
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
    SELECT  
            NVL(D.DLVR_DAY, TO_CHAR(SYSDATE, 'YYYYMMDD')) AS DLVR_DAY,
            NVL(D.SERV_CD, Pkg_Rtcs0207.f_sGetService(A.ORD_NO)) AS SERV_CD,
            'B' AS DLVR_TYPE,
            NVL(D.DLVR_SEQ, 0) AS DLVR_SEQ,
            A.ORD_NO,                                                          /*계약번호          */
            B.CUST_NO,                                                         /*고객코드          */
            B.CUST_NM,                                                         /*고객명            */
            C.MAT_CD AS MAT_CD,/*상품코드          */
            Pkg_Rtsd0005.f_sRtsd0005MatName(C.MAT_CD) || ' (외 ' || (SELECT COUNT(1)-1 FROM RTSD0106 WHERE ORD_NO = A.ORD_NO) ||'건)'  AS MAT_NM,    /*상품명            */
            A.CNT_CD,                                                          /*수량              */
            A.PERIOD_CD,                                                       /*계약기간          */
            A.MAKER_CD,                                                        /*카메이커          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',A.MAKER_CD)  AS MAKER_NM,  /*카메이커명        */
            A.MODEL_CD,                                                        /*차종              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)  AS MODEL_NM,  /*차종명            */
            A.CAR_NO,                                                          /*차량번호          */
            A.CAR_OWNER,                                                       /*차량소유자        */
            Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00011') AS B00011_R_CNT, /*마모보증 잔여횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00012') AS B00012_R_CNT, /*마모보증 잔여횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00007') - Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00007') AS B00007_U_CNT, /*걱정제로 사용횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00011') - Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00011') AS B00011_U_CNT, /*마모보증 사용횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00012') - Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00012') AS B00012_U_CNT, /*파손보증 사용횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00007') AS B00007_I_CNT,   
            A.ORD_DAY,                                                         /*계약일자          */
            D.PROC_DAY,                                                        /*장착일자          */
            NVL(D.SERVAD_SEQ, Pkg_Rtcs0207.f_sRtcs0207ServAdSeq(A.ORD_NO, 'A', (SELECT X.SERV_CD FROM RTCS0207 X WHERE X.ORD_NO = A.ORD_NO AND X.DLV_STAT = '04' AND ROWNUM = 1))) AS SERVAD_SEQ,
            B.POS_CD,                                                          /*고객주소-우편번호 */
            B.ADDR1,                                                           /*고객주소-주소     */
            B.ADDR2,                                                           /*고객주소-상세주소 */
            B.MOB_NO,                                                          /*핸드폰번호        */     
            D.AGENCY_CD,                                                       /*교체점코드        */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(D.AGENCY_CD)        AS AGENCY_NM, /*교체점명          */
            D.SERVRQ_DAY,                                                      /*교체예정일자      */
            '(' || D.POS_CD ||') ' || D.ADDR1 || ' ' || D.ADDR2 AS DLV_ADDR,             
            D.POS_CD AS DLV_POS_CD,                                             /*우편번호          */
            D.ADDR1  AS DLV_ADDR1,                                             /*주소              */
            D.ADDR2  AS DLV_ADDR2,                                             /*상세주소          */
            D.DLV_TEL,                                                         /*핸드폰번호        */                                                       /*배송요청사항      */
            D.DLV_STAT,                                                        /*배송요청상태      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C035',D.DLV_STAT)  AS DLVSTAT_NM,/*배송요청상태명    */
            Pkg_Rtcs0208.f_sRtcs0208DlvrYn(A.ORD_NO, D.DLVR_SEQ) DLVR_YN,
            '0' AS APPR_AMT,
--            NVL(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),0) AS APPR_AMT, /*연체금액    */ --[20161123-0001]
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, Pkg_Rtcs0207.f_sGetService(A.ORD_NO)) - f_sRtcs0208SumCount(A.ORD_NO, Pkg_Rtcs0207.f_sGetService(A.ORD_NO))  AS BASIC_SERV_CNTR,
            NVL(D.KWMENG, '0') AS CNT_CD1,                                                           /*신청할수있는 타이어 본수      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S089',D.KWMENG)  AS CNT_NM, /*걱정제로 타이어 본수명    */
            F.SERV_CNT0 AS SERV_CNT00,                                                 /*걱정제로 최초부여횟수 */ --[20180426_01]
            Pkg_Rtcs0208.f_sRtcs0208ReqNo(A.ORD_NO, D.DLVR_TYPE, D.DLVR_DAY, D.DLVR_SEQ) AS REQ_NO,  /*걱정제로 신청회차     */ --[20180426_01]
            D.C_MILEAGE AS C_MILEAGE,
            D.DLV_DESC,
            Pkg_Exif0004.f_sExif0004O2OTireImg(A.ORD_NO) AS IMG_URL,
            D.APPLY_REASON
            ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('C036',D.APPLY_REASON)  AS APPLY_REASON_NM
            ,  NVL2(H.NUM, ROW_NUMBER() OVER (PARTITION BY D.DLVR_DAY, D.DLVR_SEQ ORDER BY H.SEND_DAY), 1) AS ROW_NUM
            ,  DECODE(D.DLV_STAT,'06','',H.NUM)                    AS REQ_NUM     /*신청회차      */ --[20170427_01]
    FROM    RTSD0108 A
            INNER JOIN RTSD0100 B ON A.CUST_NO  = B.CUST_NO
            INNER JOIN RTSD0106 C ON A.ORD_NO   = C.ORD_NO AND C.SEQ = 1
            LEFT OUTER JOIN RTCS0208 D ON A.ORD_NO   = D.ORD_NO
            LEFT OUTER JOIN RTSD0013 F ON A.ORD_NO   = F.ORD_NO AND     F.PRS_DCD IN ('B00011')
            LEFT OUTER JOIN RTSD0013 G ON A.ORD_NO   = G.ORD_NO AND     G.PRS_DCD IN ('B00012')
            LEFT OUTER JOIN RTSD0115 H ON D.ORD_NO   = H.ORD_NO AND     H.NUM   IS NOT NULL
    WHERE   A.ORD_NO   = DECODE( TRIM( v_Ord_No ), NULL, A.ORD_NO, v_Ord_No )
    AND     (v_Dlvr_DayF IS NULL OR D.DLVR_DAY BETWEEN v_Dlvr_DayF AND v_Dlvr_DayT)
    AND     D.DLV_STAT = DECODE(v_Dlv_Stat, NULL, D.DLV_STAT, v_Dlv_Stat)
    AND     D.AGENCY_CD = DECODE(v_Agency_Cd, NULL, D.AGENCY_CD, v_Agency_Cd)
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


  END p_sRtcs0208;
  
  /*****************************************************************************
  -- 마모파손보증서비스 부여/신청회차 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-05  kstka             [20201005_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0208ReqNo (
      v_Ord_No      IN RTCS0208.ORD_NO%TYPE     /* 계약번호 */
    , v_Dlvr_Type   IN RTCS0208.DLVR_TYPE%TYPE  /* 서비스유형 */ 
    , v_Dlvr_Day    IN RTCS0208.DLVR_DAY%TYPE   /* 배송신청일자 */  
    , v_Dlvr_Seq    IN RTCS0208.DLVR_SEQ%TYPE   /* 배송신청순번 */
  ) RETURN NUMBER IS
    v_Req_No  NUMBER;
    
  BEGIN
  
    SELECT  NVL(SUM(ROW_NUM), 0)
          INTO  v_Req_No
          FROM  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY X.DLVR_DAY, DLVR_SEQ) AS ROW_NUM
                         ,  X.*
                      FROM  RTCS0208 X
                     WHERE  X.DLV_STAT NOT IN ('06')
                       AND  X.ORD_NO = v_Ord_No
                ) Y
         WHERE  Y.DLVR_TYPE = v_Dlvr_Type
           AND  Y.DLVR_DAY = v_Dlvr_Day
           AND  Y.DLVR_SEQ = v_Dlvr_Seq;

    RETURN v_Req_No;

   EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0208ReqNo;
  
  /*****************************************************************************
  -- 마모파손보증서비스 부여순번 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-05  kstka             [20201005_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0208DlvrSeq(
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE          /*배송신청일자        */
    ) RETURN NUMBER IS
    v_Dlvr_Seq RTCS0208.DLVR_SEQ%TYPE;                  /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(DLVR_SEQ)
                 FROM    RTCS0208
                 WHERE   DLVR_DAY = v_Dlvr_Day)+ 1, 1) AS DLVR_SEQ
    INTO    v_Dlvr_Seq
    FROM    DUAL;

    RETURN v_Dlvr_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0208DlvrSeq;  
  
  /*****************************************************************************
  -- 마모파손보증서비스내역 수정여부 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-23  kstka             [20201023_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0208DlvrYn(
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,          /*계약번호              */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE         /*계약번호              */
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
    FROM    RTCS0208
    WHERE   ORD_NO = v_Ord_No
    AND     DLVR_SEQ = v_Dlvr_Seq
    AND     DLV_STAT IN ( '00', '01', '02','03','07','08');
  --  AND     DLV_STAT IN ( '01', '02');

    RETURN v_Dlvr_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0208DlvrYn;
  
  /*****************************************************************************
  -- 조기마모파손/파손보증 배송신청 내역 Update - 배송신청, 상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0208ServSeqDlvStat (
    v_Dlvr_Day       IN RTCS0010.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0010.DLVR_SEQ%TYPE,       /*순번                  */
    v_Dlv_Stat       IN RTCS0010.DLV_STAT%TYPE,       /*상태                  */
    v_Reg_Id         IN RTCS0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0208
    SET    DLV_STAT  = v_Dlv_Stat,
           PROC_DAY         = TO_CHAR(SYSDATE, 'YYYYMMDD'),
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  DLVR_DAY  = v_Dlvr_Day
    AND    DLVR_SEQ  = v_Dlvr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0208ServSeqDlvStat;
  
  /*****************************************************************************
  -- 조기마모파손/파손보증 배송신청 내역 Update - 배송신청, 상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0208DlvStat (
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호               */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*등록자 ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    v_Dlv_Stat  VARCHAR2(2);                        /* 배송상태 */
  BEGIN

    v_Dlv_Stat := PKG_RTCS0208.f_sRtcs0208DlvStat(v_Ord_No);
    IF v_Dlv_Stat IN ('02','08') THEN
    
        UPDATE RTCS0208
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
                             FROM RTCS0208
                            WHERE ORD_NO = v_Ord_No AND DLV_STAT = v_Dlv_Stat)
                    WHERE RNK = 1);
                   
    END IF;
    
    RETURN SQLCODE;     

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0208DlvStat;
  
  /*****************************************************************************
  -- 걱정제로 배송상태 확인 - 배송요청상태만 조회  20160419 한승훈 
  *****************************************************************************/
  FUNCTION f_sRtcs0208DlvStat (
    v_Ord_No        IN RTCS0208.ORD_NO%TYPE         /* 주문번호 */
    ) RETURN VARCHAR2 IS
    v_Dlv_Stat  VARCHAR2(2);             /* 배송상태 */
  BEGIN
    /* 배송요청(02), 선처리_배송요청(08) 상태만 가져온다.*/
    
    SELECT  DECODE(COUNT(*), 0, '00', A.DLV_STAT)
    INTO    v_Dlv_Stat
    FROM    RTCS0208 A
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.DLV_STAT IN ('02', '08')
    GROUP BY A.DLV_STAT;

    RETURN v_Dlv_Stat;

   EXCEPTION
      WHEN OTHERS THEN
        RETURN '00';

  END f_sRtcs0208DlvStat;  
  
  /*****************************************************************************
  -- 마모파손보증 신청내역 INSERT
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_InsertRtcs0208 (
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0208.DLVR_TYPE%TYPE,      /*부여:A, 신청:B       */
    v_Serv_Cd        IN RTCS0208.SERV_CD%TYPE,        /*서비스코드            */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE,       /*서비스순번            */
    v_Cust_No        IN RTCS0208.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0208.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0208.AGENCY_CD%TYPE,      /*대리점코드             */
    v_Matnr          IN RTCS0208.MATNR%TYPE,          /*제품코드              */
    v_Kwmeng         IN RTCS0208.KWMENG%TYPE,         /*타이어본수             */
    v_ServRq_Day     IN RTCS0208.SERVRQ_DAY%TYPE,     /*신청일자              */
    v_Proc_Day       IN RTCS0208.PROC_DAY%TYPE,       /*장착일자              */
    v_ServAd_Seq     IN RTCS0208.SERVAD_SEQ%TYPE,     /*부여순번              */
    v_Dlv_Stat       IN RTCS0208.DLV_STAT%TYPE,       /*상태                 */
    v_Dlv_Desc       IN RTCS0208.DLV_DESC%TYPE,       /*요청사항             */
    v_C_Mileage      IN RTCS0208.C_MILEAGE%TYPE,      /*주행거리             */
    v_Car_No         IN RTCS0208.CAR_NO%TYPE,         /*차량번호                */
    v_Dlv_Tel        IN RTCS0208.DLV_TEL%TYPE,        /*연락처               */
    v_Pos_Cd         IN RTCS0208.POS_CD%TYPE,         /*우편번호               */
    v_Addr1          IN RTCS0208.ADDR1%TYPE,          /*주소               */
    v_Addr2          IN RTCS0208.ADDR2%TYPE,          /*상세주소               */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*등록자              */
    v_Apply_Reason   IN RTCS0208.APPLY_REASON%TYPE,   /*신청사유              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0208 (
            DLVR_DAY,
            ORD_NO,
            DLVR_TYPE,
            SERV_CD,
            DLVR_SEQ,
            CUST_NO,
            CUST_NM,
            AGENCY_CD,
            MATNR,
            KWMENG,
            SERVRQ_DAY,
            PROC_DAY,
            SERVAD_SEQ,
            DLV_STAT,
            DLV_DESC,
            C_MILEAGE,
            CAR_NO,
            DLV_TEL,
            POS_CD,
            ADDR1,
            ADDR2,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            APPLY_REASON
            )
    VALUES  (
            v_Dlvr_Day,
            v_Ord_No,
            v_Dlvr_Type,
            v_Serv_Cd,
            v_Dlvr_Seq,
            v_Cust_No,
            v_Cust_Nm,
            v_Agency_Cd,
            v_Matnr,
            v_Kwmeng,
            v_ServRq_Day,
            v_Proc_Day,
            v_ServAd_Seq,
            v_Dlv_Stat,
            v_Dlv_Desc,
            v_C_Mileage,
            v_Car_No,
            v_Dlv_Tel,
            v_Pos_Cd,
            v_Addr1,
            v_Addr2,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Apply_Reason
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0208;

  /*****************************************************************************
  -- 마모파손보증 부여내역 UPDATE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0208 (
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0208.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0208.SERV_CD%TYPE,        /*계약번호              */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE,       /*고객코드              */
    v_Dlv_Stat       IN RTCS0208.DLV_STAT%TYPE,       /*상태코드              */
    v_C_Mileage      IN RTCS0208.C_MILEAGE%TYPE,      /*주행거리              */
    v_Dlv_Desc       IN RTCS0208.DLV_DESC%TYPE,       /*요청사항              */
    v_Agency_Cd      IN RTCS0208.AGENCY_CD%TYPE,      /*대리점코드             */
    v_ServRq_Day     IN RTCS0208.SERVRQ_DAY%TYPE,     /*장착예정일             */
    v_Pos_Cd         IN RTCS0208.POS_CD%TYPE,         /*우편번호               */
    v_Addr1          IN RTCS0208.ADDR1%TYPE,          /*주소               */
    v_Addr2          IN RTCS0208.ADDR2%TYPE,          /*상세주소               */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*교체예정일자          */
    v_Apply_Reason   IN RTCS0208.APPLY_REASON%TYPE,   /*신청사유              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0208
    SET    AGENCY_CD        = v_Agency_Cd,
           SERVRQ_DAY       = v_ServRq_Day,
           POS_CD           = v_Pos_Cd,
           ADDR1            = v_Addr1,
           ADDR2            = v_Addr2,
           DLV_STAT         = v_Dlv_Stat,
           C_MILEAGE        = v_C_Mileage,
           DLV_DESC         = v_Dlv_Desc,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE,
           APPLY_REASON     = v_Apply_Reason
    WHERE  DLVR_DAY         = v_Dlvr_Day
    AND    ORD_NO           = v_Ord_No
    AND    DLVR_TYPE        = v_Dlvr_Type
    AND    SERV_CD          = v_Serv_Cd
    AND    DLVR_SEQ         = v_Dlvr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0208;

  /*****************************************************************************
  -- 마모파손보증 부여내역 DELETE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0208 (
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0208.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0208.SERV_CD%TYPE,        /*계약번호              */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE,       /*고객코드              */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0208
    SET    DLV_STAT         = '06'
         , CHG_ID           = v_Reg_Id
         , CHG_DT           = SYSDATE
    WHERE  DLVR_DAY         = v_Dlvr_Day
    AND    ORD_NO           = v_Ord_No
    AND    DLVR_TYPE        = v_Dlvr_Type
    AND    SERV_CD          = v_Serv_Cd
    AND    DLVR_SEQ         = v_Dlvr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0208;
  
  /*****************************************************************************
  -- 마모파손서비스 신청내역 관리(IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0.1      2020-10-14  wjim             [20201014-0001]                                                                         
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0208 (
    v_Comm_Dvsn      IN CHAR,                         /*1 처리구분(I,U,D)       */
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0208.DLVR_TYPE%TYPE,      /*부여:A, 신청:B       */
    v_Dlvr_Seq       IN OUT RTCS0208.DLVR_SEQ%TYPE,   /*서비스순번            */
    v_Serv_Cd        IN RTCS0208.SERV_CD%TYPE,        /*서비스코드            */
    v_Cust_No        IN RTCS0208.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0208.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0208.AGENCY_CD%TYPE,      /*대리점코드             */
    v_Matnr          IN RTCS0208.MATNR%TYPE,          /*제품코드              */
    v_Kwmeng         IN RTCS0208.KWMENG%TYPE,         /*타이어본수             */
    v_ServRq_Day     IN RTCS0208.SERVRQ_DAY%TYPE,     /*신청일자              */
    v_Proc_Day       IN RTCS0208.PROC_DAY%TYPE,       /*장착일자              */
    v_ServAd_Seq     IN OUT RTCS0208.SERVAD_SEQ%TYPE,     /*부여순번              */
    v_Dlv_Stat       IN RTCS0208.DLV_STAT%TYPE,       /*상태                 */
    v_Dlv_Desc       IN RTCS0208.DLV_DESC%TYPE,       /*요청사항             */
    v_C_Mileage      IN RTCS0208.C_MILEAGE%TYPE,      /*주행거리              */
    v_Car_No         IN RTCS0208.CAR_NO%TYPE,         /*차량번호                */
    v_Dlv_Tel        IN RTCS0208.DLV_TEL%TYPE,        /*연락처               */    
    v_Pos_Cd         IN RTCS0208.POS_CD%TYPE,         /*우편번호               */
    v_Addr1          IN RTCS0208.ADDR1%TYPE,          /*주소               */
    v_Addr2          IN RTCS0208.ADDR2%TYPE,          /*상세주소               */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*등록자               */
    v_Apply_Reason   IN RTCS0208.APPLY_REASON%TYPE,   /*신청사유               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error         EXCEPTION;
    
    lr_Sd0100       RTSD0100%ROWTYPE;             /*고객정보                  */
    
    v_Serv_Cnt0     RTSD0013.SERV_CNT0%TYPE;
    v_Kwmeng_0      RTCS0208.KWMENG%TYPE;
    
    v_Ord_NoB       RTCS0208.ORD_NO%TYPE;         /*계약번호              */
    v_Cust_NoB      RTCS0208.CUST_NO%TYPE;        /*고객코드              */
    v_Dlv_StatB     RTCS0208.DLV_STAT%TYPE;       /*상태                  */    
    v_Dlv_TelB      RTCS0208.DLV_TEL%TYPE;        /*연락처                */    
    
    v_Cnt           NUMBER;
    v_Serv_Cntr     NUMBER;
    v_Serv_Org_Cd   RTCS0208.SERV_CD%TYPE;
    
  BEGIN 

    --접수내역이 있는지 확인   
    BEGIN

        SELECT SERV_CD, KWMENG 
        INTO v_Serv_Org_Cd, v_Kwmeng_0
        FROM RTCS0207
        WHERE ORD_NO = v_Ord_No
        AND DLV_STAT = '04'
        AND ROWNUM = 1;
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            v_Return_Message := '접수내역이 존재하지 않습니다.!';
            RAISE e_Error;
    END;
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 < f_sRtcs0208Count(v_Dlvr_Day, v_Dlvr_Seq) THEN
            v_Return_Message := '해당 일자-번호('||v_Dlvr_Day||'-'||v_Dlvr_Seq||')로 이미등록된 데이터가 존재하므로 신규등록처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        --입력된 서비스코드가 접수시 코드와 다르면
        BEGIN
               
            --최초 얼라인먼트 서비스 이후 +1달내인지 여부 확인
            SELECT COUNT(*)
            INTO v_Cnt
            FROM (
                SELECT NUM, REG_DT FROM (
                    SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO, SERVICE_CD ORDER BY REG_DT) NUM, REG_DT
                    FROM RTCS0008
                    WHERE ORD_NO = v_Ord_No
                    AND SERVICE_CD = 'B00008'                
                )
                WHERE NUM = 1
                AND ADD_MONTHS(TO_DATE((SELECT PROC_DAY FROM RTSD0108 WHERE ORD_NO = v_Ord_No), 'YYYYMMDD'), 1) >= REG_DT
            );            
            
        END;        
        
        v_Serv_Cntr := Pkg_Rtsd0013.f_sRtsd0013ServCntr(v_Ord_No, v_Serv_Org_Cd);
        
        --서비스 변경시 기존 서비스 사용내역 여부 확인    
        IF v_Serv_Org_Cd <> v_Serv_Cd THEN
            
            IF v_Serv_Cntr = 0 THEN
                v_Return_Message := '부여된 서비스내역이 존재하지 않습니다.!';
                RAISE e_Error;
            ELSIF v_Kwmeng_0 > v_Serv_Cntr THEN
                v_Return_Message := '기존 서비스 사용내역이 존재하여 서비스 변경이 불가합니다.!';
                RAISE e_Error;
            END IF;
            
        END IF; 
        
        IF v_Kwmeng_0 = v_Serv_Cntr THEN
        
            -- 조기마모 서비스 대상인지 확인    
            IF v_Cnt > 0 AND v_Serv_Cd NOT IN ('B00011') THEN
                v_Return_Message := '해당 계약은 조기마모보증 서비스 대상입니다.!';
                RAISE e_Error;
            ELSIF v_Cnt = 0 AND v_Serv_Cd NOT IN ('B00012') THEN
                v_Return_Message := '해당 계약은 파손보증 서비스 대상입니다.!';
                RAISE e_Error;
            END IF;
            
        END IF;         
            
--        -- 서비스 적용 가능여부 체크
--        IF 0 = Pkg_Rtsd0013.f_sRtsd0013ServCntr( v_Ord_No, v_Serv_Cd) THEN
--            v_Return_Message := '계약번호 기준 프리미엄서비스(RTSD0013) 잔여횟수(0)으로 처리가 불가 합니다!';
--            RAISE e_Error;
--        END IF;
        
        
        BEGIN
        
            -- [20180408_01]
            -- 보증서비스 총 부여횟수
            SELECT  SERV_CNT0
              INTO  v_Serv_Cnt0
              FROM  RTSD0013
             WHERE  ORD_NO  = v_Ord_No
               AND  PRS_DCD = v_Serv_Org_Cd;
                
    --        
    --        -- 현재까지 신청/진행/완료된 보증서비스 본 수   
            SELECT  NVL(SUM(KWMENG), 0)
              INTO  v_Kwmeng_0
              FROM  RTCS0208
             WHERE  ORD_NO = v_Ord_No
               AND  SERV_CD = v_Serv_Cd
               AND  DLV_STAT NOT IN ('06');               
               
              
                   
    --        -- 현재까지 신청/진행/완료된 걱정제로 본 수를 감안하여 신청본수 검증   
            IF v_Serv_Cnt0 < v_Kwmeng_0 + TRIM(v_Kwmeng) THEN
                v_Return_Message := '신청가능 서비스수량 : 신청가능 서비스 수량('||v_Serv_Cnt0||')보다 신청수량('||TRIM(v_Kwmeng)||')이 많아 신청이 불가 합니다!';
                RAISE e_Error;
            END IF;           
        
        END;
        
        -- 순번 획득
        v_Dlvr_Seq := f_sRtcs0208DlvrSeq(v_Dlvr_Day);       
        
        -- 부여순번 획득
        v_ServAd_Seq := Pkg_Rtcs0207.f_sRtcs0207ServAdSeq(v_Ord_No, 'A', v_Serv_Org_Cd);
        
        IF 0 != f_InsertRtcs0208(v_Dlvr_Day ,v_Ord_No ,v_Dlvr_Type, v_Serv_Cd , v_Dlvr_Seq,
                                 v_Cust_No, v_Cust_Nm ,v_Agency_Cd ,v_Matnr ,v_Kwmeng ,
                                 v_ServRq_Day , v_Proc_Day, v_ServAd_Seq, v_Dlv_Stat , v_Dlv_Desc, v_C_Mileage,
                                 v_Car_No, v_Dlv_Tel, v_Pos_Cd, v_Addr1, v_Addr2 , v_Reg_Id, v_Apply_Reason,
                                 v_ErrorText) THEN
            v_Return_Message := '마모파손서비스 신청 내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;       
        
    ELSIF v_Comm_Dvsn IN ('U','D') THEN

        IF 0 = f_sRtcs0208Count(v_Dlvr_Day, v_Dlvr_Seq) THEN
            v_Return_Message := '해당 일자-번호('||v_Dlvr_Day||'-'||v_Dlvr_Seq||')로 등록된 데이터가 존재하지 않음므로 수정처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        BEGIN

            SELECT  ORD_NO, CUST_NO, DLV_STAT
            INTO    v_Ord_NoB, v_Cust_NoB, v_Dlv_StatB
            FROM    RTCS0208
            WHERE   DLVR_DAY  = v_Dlvr_Day
            AND     DLVR_SEQ  = v_Dlvr_Seq;

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '마모파손 신청 내역(RTCS0208) 획득 실패!.';
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

            IF 0 != f_UpdateRtcs0208(v_Dlvr_Day ,v_Ord_No , v_Dlvr_Type ,v_Serv_Cd ,
                                     v_Dlvr_Seq ,v_Dlv_Stat , v_C_Mileage, v_Dlv_Desc, v_Agency_Cd, v_ServRq_Day, v_Pos_Cd, v_Addr1, v_Addr2, v_Reg_Id, v_Apply_Reason,
                                     v_ErrorText) THEN
                v_Return_Message := '마모파손서비스 신청 내역 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;     
            
            p_regiSendSms(v_Ord_No,         /*주문번호              */
                              v_Dlvr_Day,       /*신청일자              */
                              v_Dlvr_Seq,       /*신청순번              */
                              v_Reg_Id,         /*등록자 ID             */
                              v_Success_Code,
                              v_Return_Message,
                              v_ErrorText);
                              
            IF v_Success_Code != 0 THEN        
                v_Return_Message := '마모파손서비스 신청 내역 문자 발송 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

                
            --요청접수시 접수내역 변경 
            --접수대기상태에서 취소하는 케이스 발생으로 승인후 변경처리
            IF v_Dlv_Stat IN ('01') THEN
                --접수내역 변경 업데이트
                UPDATE RTSD0013
                SET PRS_DCD = v_Serv_Cd
                , CHG_ID = v_Reg_Id
                , CHG_DT = SYSDATE
                WHERE ORD_NO = v_Ord_No
                AND PRS_DCD = v_Serv_Org_Cd
                AND SERV_CNT0 = SERV_CNTR;
                
                UPDATE RTCS0207
                SET SERV_CD = v_Serv_Cd
                , CHG_ID = v_Reg_Id
                , CHG_DT = SYSDATE
                WHERE ORD_NO = v_Ord_No
                AND DLVR_SEQ = v_ServAd_Seq;
                
                UPDATE RTCS0209
                SET SERV_CD = v_Serv_Cd
                , CHG_ID = v_Reg_Id
                , CHG_DT = SYSDATE
                WHERE ORD_NO = v_Ord_No
                AND DLVR_TYPE = 'A'
                AND SERV_SEQ = v_ServAd_Seq;
            END IF;
            
        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0208(v_Dlvr_Day ,v_Ord_No , v_Dlvr_Type ,v_Serv_Cd ,
                                     v_Dlvr_Seq ,v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '마모파손서비스 신청 내역 삭제 실패!!!'||'-'||v_Errortext;
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);

    END p_IUDRtcs0208;
    
   /*****************************************************************************
  -- 관리자승인완료시 SMS 발송
  *****************************************************************************/
 PROCEDURE p_regiSendSms (
    v_Ord_No         IN RTCS0208.ORD_NO%TYPE,         /*주문번호              */
    v_Dlvr_Day       IN RTCS0208.DLVR_DAY%TYPE,       /*신청일자              */
    v_Dlvr_Seq       IN RTCS0208.DLVR_SEQ%TYPE,       /*신청순번              */
    v_Reg_Id         IN RTCS0208.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Sms_Msg       RTSD0205.SND_MSG%TYPE := '';
    
    v_StatCd        VARCHAR2(10);    --상태코드
    v_Cust_Nm       VARCHAR2(100);   --고객명
    v_Mat_Nm        VARCHAR2(100);  --계약상품
    v_Ord_Qty       VARCHAR2(100);  --계약수량
    v_Period_Nm     VARCHAR2(10);  --계약기간
    v_Regi_Nm       VARCHAR2(50);  --최초등록비
    v_Summon_Amt    NUMBER;  --월렌탈료
    v_Agency_Nm     VARCHAR2(100);  --장착점상호명
    v_Agency_Addr   VARCHAR2(500);  --장착점주소
    v_Agency_TelNo  VARCHAR2(20);  --장착점전화번호
    v_Prc_Day       VARCHAR2(20);  --장착예정일
    v_Customer_Mobno  VARCHAR2(20);--받는사람핸드폰번호
    
    v_Kmweng        VARCHAR2(20);  --신청본수
    v_Dlv_Stat      VARCHAR2(20);  --신청상태
    v_Serv_Cd       VARCHAR2(20);  --서비스종류
    
   BEGIN
   
    IF v_Ord_No IS NOT NULL THEN
    
        SELECT KWMENG, DLV_STAT, SERV_CD 
        INTO v_Kmweng, v_Dlv_Stat, v_Serv_Cd
        FROM RTCS0208
        WHERE ORD_NO = v_Ord_No
        AND DLVR_DAY = v_Dlvr_Day
        AND DLVR_SEQ = v_Dlvr_Seq;
        
        BEGIN
            SELECT
              (SELECT A.CUST_NM FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS CUST_NM
              ,(SELECT B.MAT_NM FROM RTSD0106 A, RTSD0005 B WHERE A.ORD_NO = T.ORD_NO AND A.MAT_CD = B.MAT_CD) AS MAT_NM
              ,(SELECT A.ORD_QTY FROM RTSD0106 A WHERE A.ORD_NO = T.ORD_NO) AS ORD_QRY
              ,T.PERIOD_CD
              ,T.REGI_AMT
              ,T.SUM_MON_AMT
              ,(SELECT A.AGENCY_NM  FROM RTSD0007 A WHERE A.AGENCY_CD = TT.AGENCY_CD) AS AGENCY_NM
              ,(SELECT A.CITY||' '||A.STREET  FROM RTSD0007 A WHERE A.AGENCY_CD = TT.AGENCY_CD) AS AGENCY_ADDR
              ,(SELECT REGEXP_REPLACE(REGEXP_REPLACE (A.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3')  
                FROM RTSD0007 A 
                WHERE A.AGENCY_CD = TT.AGENCY_CD) AS AGENCY_TEL_NO
              ,TO_CHAR(TO_DATE(TT.SERVRQ_DAY,'YYYYMMDD'),'YYYY.MM.DD') AS PROC_DAY
              ,(SELECT A.MOB_NO FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS MOB_NO
            INTO v_Cust_Nm          --고객명
                 ,v_Mat_Nm          --계약상품
                 ,v_Ord_Qty         --계약수량
                 ,v_Period_Nm       --계약기간
                 ,v_Regi_Nm         --최초등록비
                 ,v_Summon_Amt      --월렌탈료
                 ,v_Agency_Nm       --장착점상호명
                 ,v_Agency_Addr     --장착점주소
                 ,v_Agency_TelNo    --장착점전화번호
                 ,v_Prc_Day        --장착예정일
                 ,v_Customer_Mobno  --받는사람핸드폰번호
            FROM RTSD0104 T, RTCS0208 TT
            WHERE T.ORD_NO = v_Ord_No
            AND T.ORD_NO = TT.ORD_NO
            AND TT.DLVR_DAY = v_Dlvr_Day
            AND TT.DLVR_SEQ = v_Dlvr_Seq;
            
            --관리자 승인완료시 SMS발송
            IF v_Dlv_Stat IN ('01') THEN
            
                v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm|| '(계약번호:' || v_Ord_No || '/계약상품:' || v_Mat_Nm || ')고객님께서 신청하신 보증서비스' || v_Kmweng || '본이 정상접수되었습니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'(장착점 안내) 상호명 : '||v_Agency_Nm||', 주소 : '||v_Agency_Addr||', 전화번호 : '||v_Agency_TelNo||', 장착 예정일 : '||v_Prc_Day;
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'※신청 내역과 상이 할 경우 콜센터(1855-0100)로 연락주세요.';
                
                --주문접수완료 SMS 발송
                Pkg_Rtsd0205.p_Rtsd0205InterfaceNew_RealTmp (
                      'I'                                   /*예약 전송여부    */
                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                    , v_Customer_Mobno                      /*받는 전화번호    */
                    , '18550100'                            /*보내는 전화번호  */
                    , v_Sms_Msg                             /*메시지내용       */
                    , 'S003'                                /*사용자지정 필드1 */
                    , v_Ord_No                              /*사용자지정 필드2 */
                    ,'2'
                    ,'RENTAL00000000000003'
                    , v_Reg_Id                              /*등록자 ID        */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
            
            END IF;
            
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN 
            Null; 
        END;
            
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0208.p_regiAmtPay(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0208.p_regiAmtPay(2)', v_ErrorText, v_Return_Message);
  END p_regiSendSms;
  
  /*****************************************************************************
  -- 마모파손보증 부여내역 DELETE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2021-10-13  kstka           Created. [20211013_01]                             
  *****************************************************************************/
  FUNCTION f_GetJoinRate (
    v_Day_F       IN RTCS0208.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Day_T       IN RTCS0208.DLVR_DAY%TYPE        /*배송신청일자          */
    ) RETURN VARCHAR IS
    
    v_Cnt_1 NUMBER;
    v_Cnt_2 NUMBER;
    v_Rate  VARCHAR2(10);
  BEGIN
    
    SELECT COUNT(*) AS A, SUM(CASE WHEN E.ORD_NO IS NOT NULL THEN 1 ELSE 0 END) AS B
    INTO v_Cnt_1, v_Cnt_2
    FROM RTSD0108 A
       , RTSD0106 B
       , RTSD0005 C
       , RTSD0004 D
       , (SELECT ORD_NO FROM RTCS0207 X WHERE X.DLV_STAT = '04') E
    WHERE PROC_DAY BETWEEN '20201201' AND '20210930'
    AND A.ORD_NO = B.ORD_NO
    AND B.SEQ = 1
    AND A.ORD_NO = E.ORD_NO(+)
    AND B.MAT_CD = C.MAT_CD
    AND A.MODEL_CD = D.MODEL_CD
    AND A.CONTENTS_CD = D.CONTENTS_CD
    AND C.SECTION_WIDTH = D.SECTION_WIDTH
    AND C.ASPECT_RATIO = D.ASPECT_RATIO
    AND C.WHEEL_INCHES = D.WHEEL_INCHES
    AND C.PLY_RATING = D.PLY_RATING
    AND A.FR_CD = D.FR_CD
    AND D.CLASS_CD IN ('P1', 'S1')
    AND C.SEASON_CD IN ('01')
    AND A.CNT_CD NOT IN ('01')
    AND REGEXP_LIKE(REPLACE(A.CAR_NO, ' ', ''),'\d{2}[^하|허|호|아|바|사|자\x20]\d{4}') --렌터카(하, 허, 호) 및 영업용(아, 바, 사, 자) 차량 제외
    ;

    v_Rate := TO_CHAR(ROUND(v_Cnt_2 / v_Cnt_1 * 100, 1), 'FM90.0'); --소수점 첫째자리까지 계산
     
    RETURN v_Rate;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN SQLCODE;

  END f_GetJoinRate;
  
END Pkg_Rtcs0208;
--/
/
