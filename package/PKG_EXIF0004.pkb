CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Exif0004 AS 
/*******************************************************************************
   NAME:      Pkg_Exif0004
   PURPOSE   외부시스템 인터페이스 - O2O

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-03-11  kstka         1. Created this package body.
   1.1        2022-03-17  kstka         [20220317_01] 거점재고 여부 조회 로직 변경
*******************************************************************************/

/*****************************************************************************
  -- 거점코드 구분 (O2O)
  *****************************************************************************/
  FUNCTION f_sExif0004O2OAgency (
      v_Agency_Cd         IN VARCHAR2                                /* 대리점코드 */
  ) RETURN VARCHAR IS

    v_Rc_Yn VARCHAR2(10);  
  BEGIN

    SELECT CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END
        INTO v_Rc_Yn
        FROM O2OUSER.TB_OG_ORGZ_MST A,
             O2OUSER.TB_SV_BHF_MNG B
    WHERE B.BHF_CD = A.ORGZ_CD
        AND B.BHF_SE = '10'
        AND A.BP_CD = TRIM(TO_CHAR(v_Agency_Cd, '0000000000')); /* 10 : O2O 거점*/
    
    RETURN v_Rc_Yn;
    
  END f_sExif0004O2OAgency;
  
  /*****************************************************************************
  -- 거점코드 - 거래처 코드 조회
  *****************************************************************************/
   PROCEDURE p_sExif0004O2OAgencyInfo (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Agency_Cd         IN VARCHAR2                                /* 대리점코드 */
  ) IS
  
  BEGIN
  
        OPEN Ref_Cursor FOR
        SELECT /*+ ORDERED   */
                 A.ORGZ_CD                  AS    bhfCd         /* 지점 코드 */
                 ,    A.WRH_CD               AS   wrhCd         /* 창고 코드 */
                 ,    TO_NUMBER(A.BP_CD)                  AS   bpCd         /*  거래처코드*/
                 ,    A.ORGZ_NM               AS    bhfNm         /* 지점 명 */
                 ,    B.ZIP                  AS   postNo         /* 우편 번호 */                 
                 ,    B.BASS_ADDR    AS   addr1         /* 주소 */
                 ,    B.DTL_ADDR    AS   addr2         /* 상세주소 */
                 ,    B.SALE_GRP_CD            AS    saleGrpCd      /* 판매 그룹 코드 */
                 ,    B.SALE_OFFICE            AS    saleOffice      /* 판매 사무실 */
                FROM   O2OUSER.TB_OG_ORGZ_MST   A   ,
                           O2OUSER.TB_WM_BP_MST   B   ,
                           O2OUSER.TB_SV_BHF_MNG    C,
                           RTSD0007 D
                WHERE    1=1
                AND      A.ORGZ_CD = C.BHF_CD
                AND      C.BHF_SE = '10'
                AND      A.BP_CD = B.BP_CD
                AND      TO_NUMBER(A.BP_CD) = D.AGENCY_CD
                AND      D.USE_YN = 'Y'
                AND      (A.ORGZ_CD = v_Agency_Cd OR D.AGENCY_CD = v_Agency_Cd);
                
  END p_sExif0004O2OAgencyInfo;
    
  /*****************************************************************************
  -- tms orderId 업데이트
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0104TmsOrderId (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Order_Id        IN RTSD0104.TMS_ORDERID%TYPE,         /*상태                  */
    v_Inst_Tm         IN RTSD0104.INST_TM%TYPE,         /*장착시간                  */
    v_Inst_Day        IN RTSD0104.INST_DAY%TYPE,         /*장착예정일자                  */
    v_Oms_OrderNo        IN RTSD0104.OMS_ORDERNO%TYPE,         /*OMS 주문번호                  */
    v_Success_Code      OUT NUMBER
    ) IS
  BEGIN
    
    --변경로그
    INSERT INTO RTSD0105
    SELECT ORD_NO
              , (SELECT NVL(MAX(SEQ), '0') + 1 FROM RTSD0105 WHERE ORD_NO = v_Ord_No) SEQ
              , ORD_DAY
              , ORD_ID
              , CHAN_CD
              , SALE_ID
              , PERIOD_CD
              , CNT_CD
              , REGI_CD
              , CAMP_YN
              , C_DCRATE 
              , C_DCAMT
              , CUST_NO
              , CUST_TP
              , SAFEKEY
              , GRP_YN
              , GRP_NO
              , G_DCRATE
              , G_DCAMT
              , L_DCRATE
              , L_DCAMT
              , F_DCRATE
              , F_DCAMT
              , BORD_NO
              , STAT_CD
              , PROC_DAY
              , CANC_DAY
              , AGENCY_CD
              , SALES_GROUP
              , SALES_OFFICE
              , ENG_NM
              , AG_DESC
              , MAKER_CD
              , MODEL_CD
              , CONTENTS_CD
              , FR_CD
              , CAR_NO
              , CAR_OWNER
              , C_MILEAGE
              , REQ_TEXT
              , PAY_MTHD
              , PAY_DD
              , ACC_SEQ
              , CRD_SEQ
              , ACC_CHK
              , ACC_STAT
              , BKEY_CHK
              , BATCH_KEY
              , BILL_YN
              , CRDT_STAT
              , CERT_CD
              , CERT_STAT
              , ORD_AGENT
              , ORG_CD
              , ORG_HQ
              , ORG_L1
              , ORG_L2
              , ORG_L3
              , ORG_L4
              , INS_ORG
              , PS_CD
              , CMSAG_YN
              , CON_MTHD
              , PCERT_YN
              , FC_DAY
              , AG_DAY
              , AG_SEQ
              , INPUT_DT
              , FILE_PATH
              , FILE_NAME
              , TCGRP_NO
              , VBELN
              , SEASON_CD              
              , REG_ID
              , REG_DT
              , CHG_ID
              , CHG_DT
              , PRDT_GRP
              , SALE_CD
              , PAY_GB              
              , EMP_NO
              , REGI_AMT
              , SUM_MON_AMT
              , MON_AMT
              , FORD_NO
              , INST_CD
              , INST_TM
              , INST1_POSCD
              , INST1_ADDR1
              , INST1_ADDR2
              , INST2_POSCD
              , INST2_ADDR1
              , INST2_ADDR2
              , TMS_ORDERID
              , INST_DAY
              , OMS_ORDERNO
              , OUT_STOCK_YN
              , OUT_STOCK_TYPE
              FROM RTSD0104 
              WHERE ORD_NO = v_Ord_No;
    
        UPDATE RTSD0104
        SET    TMS_ORDERID  = v_Order_Id
        , INST_DAY  = DECODE(v_Inst_Day, NULL, PROC_DAY, v_Inst_Day)
        , INST_TM  = DECODE(v_Inst_Tm, NULL, INST_TM, v_Inst_Tm)   
        , OMS_ORDERNO  = DECODE(v_Oms_OrderNo, NULL, NULL, v_Oms_OrderNo)        
        , CHG_ID = 'omsUser'
        , CHG_DT = SYSDATE
        WHERE  ORD_NO   = v_Ord_No;

    v_Success_Code := 0;
    
    EXCEPTION
      WHEN OTHERS THEN
        v_Success_Code := -1;

  END p_UpdateRtsd0104TmsOrderId;
  
  /*****************************************************************************
  -- tms orderId 업데이트
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0010TmsOrderId (
    v_Ord_No         IN RTCS0010.ORD_NO%TYPE,         /*주문번호              */
    v_Order_Id        IN RTCS0010.TMS_ORDERID%TYPE,         /*상태                  */
    v_Inst_Tm         IN RTCS0010.INST_TM%TYPE,         /*장착시간                  */
    v_Inst_Day        IN RTCS0010.INST_DAY%TYPE,         /*장착예정일자                  */
    v_Oms_OrderNo        IN RTCS0010.OMS_ORDERNO%TYPE,         /*OMS 주문번호                  */
    v_Success_Code      OUT NUMBER
    ) IS
  BEGIN
    
        UPDATE RTCS0010
        SET    TMS_ORDERID  = v_Order_Id
        , INST_DAY  = DECODE(v_Inst_Day, NULL, SERVRQ_DAY, v_Inst_Day)
        , INST_TM  = DECODE(v_Inst_Tm, NULL, INST_TM, v_Inst_Tm)        
        , OMS_ORDERNO  = DECODE(v_Oms_OrderNo, NULL, NULL, v_Oms_OrderNo)        
        , CHG_ID = 'omsUser'
        , CHG_DT = SYSDATE
        WHERE  OMS_ORDERNO   = v_Oms_OrderNo;

    v_Success_Code := 0;

    EXCEPTION
      WHEN OTHERS THEN
        v_Success_Code := -1;

  END p_UpdateRtcs0010TmsOrderId;
  
  /*****************************************************************************
  -- 거점 스케쥴정보
  *****************************************************************************/
   PROCEDURE p_sExif0004O2OAgencyTime (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Proc_Day           IN VARCHAR2,                               /* 장착예정일자 */
      v_Agency_Cd         IN VARCHAR2,                               /* 거점코드 */
      v_Qty                  IN NUMBER,                               /* 타이어 수량 */
      v_Wheel_Yn     IN VARCHAR2                                /* 얼라인먼트 여부 */
  ) IS
  
    wrkTm NUMBER;
    
  BEGIN
  
        --사용가능시간쿼리 호출전 쿼리추가
          SELECT
              CASE WHEN SUM(WRK_TM) > 30
                    THEN SUM(WRK_TM) - 30
                    ELSE 0
              END WRK_TM
              INTO wrkTm
          FROM (
              SELECT
                CASE WHEN SVC_TY_DTL_CD = '3010' AND v_Wheel_Yn='Y' THEN REQRE_TIME + ADD_TIME
                     WHEN SVC_TY_DTL_CD = '1010' THEN REQRE_TIME + ADD_TIME
                     ELSE 0
                END WRK_TM
              FROM O2OUSER.TB_SV_SVC_TY_MST
              WHERE SVC_TY_CD = '30'      
              AND (
                    (SVC_TY_DTL_CD = '1010' AND QY = v_Qty)
                      OR
                    (SVC_TY_DTL_CD = '3010' AND QY = 1)
                  )
              AND USE_YN = 'Y'
          );
        
        OPEN Ref_Cursor FOR
        WITH TB_SV_TIME_SCHEDULE      /* 전체 스케쥴링 가능 타임 */
       AS (
         /* SELECT '093000' AS APPN_TIME, '100000' AS END_DUE_TIME FROM DUAL
              UNION ALL */
            SELECT '100000' AS APPN_TIME, '103000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '103000' AS APPN_TIME, '110000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '110000' AS APPN_TIME, '113000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            /* SELECT '113000' AS APPN_TIME, '120000' AS END_DUE_TIME FROM DUAL
              UNION ALL */
            SELECT '130000' AS APPN_TIME, '133000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '133000' AS APPN_TIME, '140000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '140000' AS APPN_TIME, '143000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '143000' AS APPN_TIME, '150000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '150000' AS APPN_TIME, '153000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '153000' AS APPN_TIME, '160000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '160000' AS APPN_TIME, '163000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '163000' AS APPN_TIME, '170000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '170000' AS APPN_TIME, '173000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            SELECT '173000' AS APPN_TIME, '180000' AS END_DUE_TIME FROM DUAL
              UNION ALL
            /* SELECT '180000' AS APPN_TIME, '183000' AS END_DUE_TIME FROM DUAL
              UNION ALL */
            SELECT '183000' AS APPN_TIME, '190000' AS END_DUE_TIME FROM DUAL
            WHERE TO_CHAR(SYSDATE,'D') IN (2,3,4,5,6)  -- 1:일, 2:월, 3:화, 4:수, 5:목, 6:금, 7:토
       )  
      SELECT
         SUBSTR(APPN_TIME,0,4) AS cd,
         v_Agency_Cd AS initialTerminal,
         SUBSTR(APPN_TIME,0,2) || ':' || SUBSTR(APPN_TIME,3,2) AS cdNm
       FROM TB_SV_TIME_SCHEDULE
       WHERE TO_DATE(END_DUE_TIME,'HH24miss') + wrkTm/24/60 <= TO_DATE('190000','HH24miss')
       AND (CASE WHEN v_Proc_Day = TO_CHAR(SYSDATE, 'yyyyMMdd') THEN TO_CHAR(SYSDATE, 'HH24miss') ELSE '000000' END) <= APPN_TIME
       MINUS   /* 4.전체 스케쥴에서 이미 배정되어있는 스케쥴을 제거한다. */
      SELECT
         SUBSTR(APPN_TIME,0,4) AS time,
         v_Agency_Cd             AS initialTerminal,
         SUBSTR(APPN_TIME,0,2) || ':' || SUBSTR(APPN_TIME,3,2) AS cdNm
       FROM (
          SELECT
             T2.APPN_TIME,
             T2.END_DUE_TIME,
             T1.BAY_CO,
             T1.PROC_DUE_BAY,
             COUNT(DISTINCT T1.PROC_DUE_BAY) OVER (PARTITION BY T2.APPN_TIME) AS CNT
            FROM (
               /* 1.이미 배정되어있는 스케쥴을 조회해서 시작시간은 30분단위로 내림, 종료시간은 30분단위로 올림 처리한다. */
               SELECT
                  CASE WHEN SUBSTR(A.APPN_TIME,3,2) IN ('00','30') THEN LPAD(A.APPN_TIME + 0, 6,'0')
                     WHEN SUBSTR(A.APPN_TIME,3,2) > 30 AND SUBSTR(A.APPN_TIME,3,2) < 50 THEN LPAD(ROUND(A.APPN_TIME,-4) + 3000, 6,'0')
                     WHEN SUBSTR(A.APPN_TIME,3,2)  >=  50 THEN LPAD(ROUND(A.APPN_TIME,-4) - 7000, 6,'0')
                     WHEN SUBSTR(A.APPN_TIME,3,2)  <  30 THEN LPAD(ROUND(A.APPN_TIME,-4) + 0, 6,'0')
                  END APPN_TIME,
                  CASE WHEN SUBSTR(A.END_DUE_TIME,3,2) IN ('00','30') THEN LPAD(A.END_DUE_TIME + 0, 6,'0')
                     WHEN SUBSTR(A.END_DUE_TIME,3,2) > 30 AND SUBSTR(A.END_DUE_TIME,3,2) < 50 THEN LPAD(ROUND(A.END_DUE_TIME,-4) + 10000, 6,'0')
                     WHEN SUBSTR(A.END_DUE_TIME,3,2) >= 50 THEN LPAD(ROUND(A.END_DUE_TIME,-4), 6,'0')
                     WHEN SUBSTR(A.END_DUE_TIME,3,2)  <  30 THEN LPAD(ROUND(A.END_DUE_TIME,-4) + 3000, 6,'0')
                  END END_DUE_TIME,
                  LEAST(B.BAY_CO, B.TOWNHOUR_PROC_CO) AS BAY_CO,
                  A.PROC_DUE_BAY
               FROM   O2OUSER.TB_SV_BHF_MNG B,
                          O2OUSER.TB_SV_OPERT_ASIGN_MST_NX A
               WHERE    A.OPERT_SE IN (25,40,50)         /* 거점작업(픽업 후 작업), 거점방문 */
                AND      A.OPERT_STS NOT IN (70,99)         /* 취소, 삭제 */
                AND      A.APPN_TIME IS NOT NULL
                AND      A.END_DUE_TIME IS NOT NULL
                AND      A.PROC_DUE_BHF = B.BHF_CD
                AND     A.DUE_DE = v_Proc_Day
                AND     B.BHF_CD = (SELECT ORGZ_CD FROM O2OUSER.TB_OG_ORGZ_MST WHERE BP_CD = TO_CHAR(v_Agency_Cd, 'FM0000000000'))
          ) T1, TB_SV_TIME_SCHEDULE T2
          /* 2.이미 배정되어있는 시간과 전체 스케쥴이 겹치는 시간대를 조회하기 위한 조건 */
          WHERE (T1.APPN_TIME <= T2.APPN_TIME AND T1.END_DUE_TIME > T2.APPN_TIME)
                  OR
               (TO_DATE(T1.APPN_TIME,'HH24miss') < TO_DATE(T2.END_DUE_TIME,'HH24miss') + wrkTm/24/60 AND TO_DATE(T1.END_DUE_TIME,'HH24miss') >= TO_DATE(T2.END_DUE_TIME,'HH24miss') + wrkTm/24/60)
                  OR
               (T1.APPN_TIME >= T2.APPN_TIME AND TO_DATE(T1.END_DUE_TIME,'HH24miss') <= TO_DATE(T2.END_DUE_TIME,'HH24miss') + wrkTm/24/60)         
       )
       /* 3.이미 배정되어있는 같은 시간대 스케쥴 개수가  배정가능 bay수와  같거나 클 경우(사실 클 경우는 없을 것) */
       WHERE BAY_CO <= CNT
       ;  
                
  END p_sExif0004O2OAgencyTime;
  
  /*****************************************************************************
  -- 거점재고정보
  *****************************************************************************/
  FUNCTION f_sExif0004O2OAgencyStock (
      v_Agency_Cd         IN VARCHAR2,                                /* 대리점코드 */
      v_Mat_Cd             IN VARCHAR2                                 /* 제품코드 */
  ) RETURN NUMBER IS

    v_Cnt NUMBER;  
  BEGIN

    SELECT
        COUNT(*) AS CNT INTO v_Cnt
        FROM  O2OUSER.TB_OG_ORGZ_MST   T1,
                  O2OUSER.TB_WM_IVT_DTL T2
        WHERE 1=1
        AND TO_CHAR(TO_NUMBER(T1.BP_CD)) = v_Agency_Cd
        AND T1.WRH_CD = T2.WRH_CD
        AND T2.ITEM_MNG_ORGZ = 'WRMSWM' /* 고정 */
        AND T2.ITEM_CD = v_Mat_Cd /* 품목코드 */
        AND T2.USEFUL_QY >= 1  /* 수량 */
        AND T2.STRE_BIN_NO = 'GEN'   /* 고정 */
        AND T2.IVT_TY_CD = '10' /* 고정 */
        ;
    
    RETURN v_Cnt;
    
  END f_sExif0004O2OAgencyStock;

  /*****************************************************************************
  -- 거점코드 재고 (O2O)
  *****************************************************************************/
  FUNCTION f_sExif0004O2OAgencyStockTot (
      v_Mat_Cd            IN VARCHAR2,
      v_Cnt_Cd            IN NUMBER,
      v_Si_Nm             IN VARCHAR2,
      v_Sgg_Nm           IN VARCHAR2,
      v_Emd_Nm          IN VARCHAR2,
      v_XCoord            IN VARCHAR2,
      v_YCoord            IN VARCHAR2
  ) RETURN NUMBER IS
    
    Ref_Cursor SYS_REFCURSOR;
    
    TYPE p_CUR_Type IS RECORD (
        BHF_CD  VARCHAR2(100), -- 지점 코드
        BHF_NM VARCHAR2(100), -- 지점 구분
        WRH_CD VARCHAR2(100), -- 창고 코드
        BP_CD VARCHAR2(100), -- 거래처 코드
        BHF_SE VARCHAR2(100), -- 지점 구분
        BHF_STS_CD VARCHAR2(100), -- 지점 상태코드
        MNG_AREA_CMCD VARCHAR2(100), -- 시도
        MNG_AREA_DTL_CMCD VARCHAR2(100), -- 군구
        MNG_AREA_DTL2_CMCD VARCHAR2(100), -- 읍면동
        LATITUDE VARCHAR2(100), -- 위도 
        LONGITUDE VARCHAR2(100), -- 경도 
        MNG_AREA_CMNM VARCHAR2(100), -- 시도 명
        MNG_AREA_DTL_CMNM VARCHAR2(100), -- 군구 명
        MNG_AREA_DTL2_CMNM VARCHAR2(100) -- 읍면동 명
        );

    CUR p_CUR_Type;
    
    v_mvmnReqreTime varchar2(10);
    v_bhfSelStd varchar2(10);
    v_bhfSelMil varchar2(10);
    v_carSelStd varchar2(10);
    v_carSelMil varchar2(10);
    v_lunchTime varchar2(10);
    v_opertDelayTime varchar2(10);
    
    v_Cnt number := 0;
    v_Tot_Cnt number := 0;

  BEGIN

    SELECT
         MVMN_REQRE_TIME AS mvmnReqreTime,   /* 이동 소요 시간 - SV096 */ 
         BHF_SEL_STD AS bhfSelStd,          /* 지점 조회 기준 - SV097 */
            BHF_SEL_MIL AS bhfSelMil,          /* 지점 조회 거리 */
            CAR_SEL_STD AS carSelStd,          /* 차량 조회 기준 - SV097 */
            CAR_SEL_MIL AS carSelMil,          /* 차량 조회 거리 */
            LUNCH_TIME AS lunchTime,          /* 점심 시간 - SV098 */
            OPERT_DELAY_TIME AS opertDelayTime    /* 작업 지연 시간 - SV099 */
            INTO v_mvmnReqreTime, v_bhfSelStd, v_bhfSelMil, v_carSelStd, v_carSelMil, v_lunchTime, v_opertDelayTime
      FROM O2OUSER.TB_SV_TMS_PROP
      WHERE ROWNUM = 1;
      
      IF v_bhfSelStd = '100' THEN
          
          OPEN Ref_Cursor FOR
          SELECT
               A.BHF_CD AS bhfCd, -- 지점 코드
               C.ORGZ_NM AS bhfNm, -- 지점 구분
               C.WRH_CD AS wrhCd, -- 창고 코드
               C.BP_CD AS bpCd, -- 거래처 코드
               A.BHF_SE AS bhfSe, -- 지점 구분
               A.BHF_STS_CD AS bhfStsCd, -- 지점 상태코드
               D.MNGAREA_CMCD AS mngareaCmcd, -- 시도
               D.MNGAREA_DTL_CMCD AS mngareaDtlCmcd, -- 군구
               D.MNGAREA_DTL2_CMCD AS mngareaDtl2Cmcd, -- 읍면동
               A.LATITUDE AS latitude, -- 위도 
               A.LONGITUDE AS longitude, -- 경도 
               C1.CM_CD_NM AS mngareaCmNm, -- 시도 명
               C2.CM_CD_NM AS mngareaDtlCmNm, -- 군구 명
               C3.CM_CD_NM AS mngareaDtl2CmNm -- 읍면동 명
            FROM O2OUSER.TB_SV_BHF_MNG A 
            INNER JOIN O2OUSER.TB_SV_BHF_MNG_AREA D ON A.BHF_CD = D.BHF_CD AND D.USE_YN = 'Y'
            INNER JOIN O2OUSER.TB_OG_ORGZ_MST C ON A.BHF_CD = C.ORGZ_CD
            INNER JOIN O2OUSER.TB_CM_CD C1 ON D.MNGAREA_CMCD = C1.CM_CD AND C1.CM_GRP_CD = 'SV037' AND C1.USE_YN = 'Y'
            INNER JOIN O2OUSER.TB_CM_CD C2 ON D.MNGAREA_DTL_CMCD = C2.CM_CD AND C2.CM_GRP_CD = 'SV093' AND C2.USE_YN = 'Y'
            INNER JOIN O2OUSER.TB_CM_CD C3 ON D.MNGAREA_DTL2_CMCD = C3.CM_CD AND C3.CM_GRP_CD = 'SV095' AND C3.USE_YN = 'Y'
            WHERE C1.CM_CD_NM LIKE '%' || v_Si_Nm || '%'
            AND C2.CM_CD_NM LIKE '%' || v_Sgg_Nm || '%'
            AND C3.CM_CD_NM LIKE '%' || v_Emd_Nm || '%'
            UNION ALL
            SELECT
               A.BHF_CD AS bhfCd, -- 지점 코드
               C.ORGZ_NM AS bhfNm, -- 지점 구분
               C.WRH_CD AS wrhCd, -- 창고 코드
               C.BP_CD AS bpCd, -- 거래처 코드
               A.BHF_SE AS bhfSe, -- 지점 구분
               A.BHF_STS_CD AS bhfStsCd, -- 지점 상태코드
               D.MNGAREA_CMCD AS mngareaCmcd, -- 시도
               D.MNGAREA_DTL_CMCD AS mngareaDtlCmcd, -- 군구
               D.MNGAREA_DTL2_CMCD AS mngareaDtl2Cmcd, -- 읍면동
               A.LATITUDE AS latitude, -- 위도 
               A.LONGITUDE AS longitude, -- 경도 
               C1.CM_CD_NM AS mngareaCmNm, -- 시도 명
               C2.CM_CD_NM AS mngareaDtlCmNm, -- 군구 명
               '' AS mngareaDtl2CmNm -- 읍면동 명
            FROM O2OUSER.TB_SV_BHF_MNG A 
            INNER JOIN O2OUSER.TB_SV_BHF_MNG_AREA D ON A.BHF_CD = D.BHF_CD AND D.USE_YN = 'Y'
            INNER JOIN O2OUSER.TB_OG_ORGZ_MST C ON A.BHF_CD = C.ORGZ_CD
            INNER JOIN O2OUSER.TB_CM_CD C1 ON D.MNGAREA_CMCD = C1.CM_CD AND C1.CM_GRP_CD = 'SV037' AND C1.USE_YN = 'Y'
            INNER JOIN O2OUSER.TB_CM_CD C2 ON D.MNGAREA_DTL_CMCD = C2.CM_CD AND C2.CM_GRP_CD = 'SV093' AND C2.USE_YN = 'Y'
            WHERE C1.CM_CD_NM LIKE '%' || v_Si_Nm || '%'
            AND C2.CM_CD_NM LIKE '%' || v_Sgg_Nm || '%';

        ELSE 

            OPEN Ref_Cursor FOR
            SELECT
               A.BHF_CD AS bhfCd, -- 지점 코드
               C.ORGZ_NM AS bhfNm, -- 지점 구분
               C.WRH_CD AS wrhCd, -- 창고 코드
               C.BP_CD AS bpCd, -- 거래처 코드
               A.BHF_SE AS bhfSe, -- 지점 구분
               A.BHF_STS_CD AS bhfStsCd, -- 지점 상태코드
               D.MNGAREA_CMCD AS mngareaCmcd, -- 시도
               D.MNGAREA_DTL_CMCD AS mngareaDtlCmcd, -- 군구
               D.MNGAREA_DTL2_CMCD AS mngareaDtl2Cmcd, -- 읍면동
               A.LATITUDE AS latitude, -- 위도 
               A.LONGITUDE AS longitude, -- 경도 
               C1.CM_CD_NM AS mngareaCmNm, -- 시도 명
               C2.CM_CD_NM AS mngareaDtlCmNm, -- 군구 명
               C3.CM_CD_NM AS mngareaDtl2CmNm -- 읍면동 명
            FROM O2OUSER.TB_SV_BHF_MNG A 
            LEFT JOIN O2OUSER.TB_SV_BHF_MNG_AREA D ON A.BHF_CD = D.BHF_CD AND D.USE_YN = 'Y'
            LEFT JOIN O2OUSER.TB_OG_ORGZ_MST C ON A.BHF_CD = C.ORGZ_CD
            LEFT JOIN O2OUSER.TB_CM_CD C1 ON D.MNGAREA_CMCD = C1.CM_CD AND C1.CM_GRP_CD = 'SV037' AND C1.USE_YN = 'Y'
            LEFT JOIN O2OUSER.TB_CM_CD C2 ON D.MNGAREA_DTL_CMCD = C2.CM_CD AND C2.CM_GRP_CD = 'SV093' AND C2.USE_YN = 'Y'
            LEFT JOIN O2OUSER.TB_CM_CD C3 ON D.MNGAREA_DTL2_CMCD = C3.CM_CD AND C3.CM_GRP_CD = 'SV095' AND C3.USE_YN = 'Y'
            AND O2OUSER.FN_SV_0007(v_XCoord,v_YCoord, A.LATITUDE, A.LONGITUDE) < 30;
            
        END IF;

        LOOP
        FETCH  Ref_Cursor INTO CUR;
        EXIT WHEN Ref_Cursor%NOTFOUND;
            
            SELECT 
             COUNT(*) AS cnt into v_Cnt
          FROM O2OUSER.TB_WM_IVT_DTL 
          WHERE WRH_CD = CUR.WRH_CD
          AND ITEM_MNG_ORGZ = 'WRMSWM'
          AND ITEM_CD = v_Mat_Cd
           AND USEFUL_QY >= v_Cnt_Cd
          AND STRE_BIN_NO = 'GEN'
          AND IVT_TY_CD = '10';
          
          v_Tot_Cnt := v_Tot_Cnt + v_Cnt;
       END LOOP;
    
    RETURN v_Tot_Cnt;
    
  END f_sExif0004O2OAgencyStockTot;
  
  /*****************************************************************************
  -- 장착예정일자
  *****************************************************************************/
  FUNCTION f_sExif0004O2OAgencyProcDay (
      v_Ord_No            IN VARCHAR2                               /* 렌탈주문번호 */
  ) RETURN VARCHAR IS

    v_Proc_Day VARCHAR(10);  
  BEGIN

    SELECT
        SUBSTR(A.DUE_DE,1,4)||'-'||SUBSTR(A.DUE_DE,5,2)||'-'||SUBSTR(A.DUE_DE,7,2) 
        INTO v_Proc_Day  /* 예정 시간 */
        FROM    O2OUSER.TB_SV_OPERT_ASIGN_MST_NX        A
        WHERE     1=1
        AND        A.RENT_ORD_NO = v_Ord_No   /* 렌탈 주문 번호 */
        AND        A.OPERT_SE IN ('10','40','20')
        ;
    
    RETURN v_Proc_Day;
    
  END f_sExif0004O2OAgencyProcDay;
  
  /*****************************************************************************
  -- O2O 거점재고 정보
  *****************************************************************************/
  FUNCTION f_sExif0004O2OStockYn (
      v_Ord_No            IN VARCHAR2                               /* 렌탈주문번호 */
  ) RETURN VARCHAR IS

    v_Res_Yn VARCHAR2(1);  
  BEGIN

--    SELECT CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END
--    INTO v_Res_Yn
--    FROM O2OUSER.TB_WM_OTBN T1
--    WHERE 1=1
--    AND T1.OTBN_STS_CD IN ('100', '900')
--    AND T1.USE_YN = 'Y'
--    AND T1.ORD_NO = v_Ord_No;

    --[20220317_01] 거점재고 여부 조회 로직 변경
    SELECT CASE WHEN O2OUSER.FN_SV_0009(v_Ord_No,'R') = '거점재고' THEN 'Y' ELSE 'N' END
    INTO v_Res_Yn
    FROM DUAL;
    
    RETURN v_Res_Yn;
    
  END f_sExif0004O2OStockYn; 
  
  /*****************************************************************************
  -- O2O 주문상태정보(완료)
  *****************************************************************************/
  FUNCTION f_sExif0004O2OOrdTransYn (
      v_Ord_No            IN VARCHAR2,                              /* 렌탈주문번호 */
      v_Ord_Seq           IN VARCHAR2,                              /* 렌탈주문순서 */
      v_Sale_Type         IN VARCHAR2                               /* 주문유형 */
  ) RETURN VARCHAR IS

    v_Res_Yn VARCHAR2(1);  
  BEGIN

    SELECT
      CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END 
      INTO v_Res_Yn
    FROM (
      SELECT
         OM.*
      FROM O2OUSER.TB_OD_ORD_MST  OM   
      JOIN O2OUSER.TB_OD_CNTR_MST CT  ON CT.ORD_NO = OM.ORD_NO
      WHERE OM.RENT_IF_CNTR_NO =  v_Ord_No
        AND OM.RENT_IF_REQ_SN  =  v_Ord_Seq
        AND CT.SALE_TY_CD      =  v_Sale_Type
        AND OM.ORD_STS_CD = '30'
        AND OM.RENT_IF_BFIST_SE_CD = '04'
      ORDER BY OM.REG_DT DESC
    )
    WHERE ROWNUM = 1
    ;
    
    RETURN v_Res_Yn;
    
  END f_sExif0004O2OOrdTransYn; 
  
  /*****************************************************************************
  -- O2O 배정관련 SMS문구 생성
  *****************************************************************************/
  FUNCTION f_sExif0004O2OMakeSms (
      v_Tmpl_Cd            IN VARCHAR2,                              /* SMS템플릿코드 */
      v_Ord_No              IN VARCHAR2,                              /* 주문번호 */ 
      v_Oms_Order_No       IN VARCHAR2                              /*  OMS주문번호 */ 
  ) RETURN VARCHAR IS

    CURSOR Cur_Rtsd0104 IS
    SELECT B.ORD_NO             --렌탈주문번호
             , B.OMS_ORDERNO AS OMS_ORDERNO    --OMS주문번호
             , '렌탈' AS SALE_SE_CD --판매유형
             , E.CD_NM AS INST_NM -- 장착유형
             , D.PETTERN_CD         -- 제품코드
             , D.SECTION_WIDTH || '/' || D.ASPECT_RATIO || ' R' || D.WHEEL_INCHES AS TIRE_SIZE --타이어사이즈
             , TO_NUMBER(B.CNT_CD) CNT_CD   --본수
             , O2OUSER.FN_SV_0009(B.OMS_ORDERNO,'R') AS STOCK_USER_TYPE --재고유형
             , A.CUST_NM    --고객명
             , CASE WHEN B.INST_DAY IS NULL THEN
                    ' '
                   ELSE
                      SUBSTR(B.INST_DAY,0,4) || '.' || SUBSTR(B.INST_DAY,5,2) || '.' || SUBSTR(B.INST_DAY,7,2)
              END AS INST_DAY,  --장착예정일자
              CASE WHEN B.INST_TM IS NULL THEN
                     ' '
                   WHEN B.INST_TM BETWEEN '000000' AND '115959' THEN   
                       '오전 ' || SUBSTR(B.INST_TM,0,2) || ':' || SUBSTR(B.INST_TM,3,2)
                   WHEN B.INST_TM BETWEEN '120001' AND '235959' THEN
                       '오후 ' || SUBSTR(B.INST_TM,0,2) || ':' || SUBSTR(B.INST_TM,3,2)
              END AS INST_TM    --장착예정시간
             , F.CD_NM AS MODEL_NM  --차종
             , A.MOB_NO -- 휴대폰번호
             , CASE WHEN B.INST1_ADDR1 IS NULL THEN A.ADDR1 ELSE B.INST1_ADDR1 END ADDR1 --주소
    FROM RTSD0100 A
           , RTSD0104 B
           , RTSD0106 C
           , RTSD0005 D
           , RTCM0051 E
           , RTCM0051 F
    WHERE A.CUST_NO = B.CUST_NO
    AND B.ORD_NO = C.ORD_NO
    AND C.MAT_CD = D.MAT_CD
    AND B.INST_CD = E.CD(+)
    AND E.CD_GRP_CD(+) = 'S304'
    AND B.MODEL_CD = F.CD(+)
    AND F.CD_GRP_CD(+) = 'S002'
    AND B.ORD_NO = v_Ord_No
    AND B.OMS_ORDERNO = v_Oms_Order_No;
    
    CURSOR Cur_Rtcs0010 IS
    SELECT A.ORD_NO             --렌탈주문번호
             , v_Oms_Order_No AS OMS_ORDERNO    --OMS주문번호
             , '걱정제로' AS SALE_SE_CD --판매유형
             , E.CD_NM AS INST_NM -- 장착유형
             , A.MATNR AS PETTERN_CD         -- 제품코드
             , B.SECTION_WIDTH || '/' || B.ASPECT_RATIO || ' R' || B.WHEEL_INCHES AS TIRE_SIZE --타이어사이즈
             , TO_NUMBER(A.KWMENG) CNT_CD   --본수
             , O2OUSER.FN_SV_0009(A.OMS_ORDERNO,'R') AS STOCK_USER_TYPE --재고유형
             , A.CUST_NM    --고객명
             , CASE WHEN A.INST_DAY IS NULL THEN
                    ' '
                   ELSE
                      SUBSTR(A.INST_DAY,0,4) || '.' || SUBSTR(A.INST_DAY,5,2) || '.' || SUBSTR(A.INST_DAY,7,2)
              END AS INST_DAY,  --장착예정일자
              CASE WHEN A.INST_TM IS NULL THEN
                     ' '
                   WHEN A.INST_TM BETWEEN '000000' AND '115959' THEN   
                       '오전 ' || SUBSTR(A.INST_TM,0,2) || ':' || SUBSTR(A.INST_TM,3,2)
                   WHEN A.INST_TM BETWEEN '120001' AND '235959' THEN
                       '오후 ' || SUBSTR(A.INST_TM,0,2) || ':' || SUBSTR(A.INST_TM,3,2)
              END AS INST_TM    --장착예정시간
             , D.CD_NM AS MODEL_NM  --차종
             , A.DLV_TEL AS MOB_NO -- 휴대폰번호
             , A.ADDR1 --주소
    FROM RTCS0010 A
           , RTSD0005 B
           , RTSD0104 C
           , RTCM0051 D
           , RTCM0051 E
    WHERE A.ORD_NO = C.ORD_NO
    AND A.MATNR = B.MAT_CD
    AND C.MODEL_CD = D.CD(+)
    AND D.CD_GRP_CD(+) = 'S002'
    AND A.ORD_NO = v_Ord_No    
    AND A.INST_CD = E.CD(+)
    AND E.CD_GRP_CD(+) = 'S304'
    AND A.DLVR_DAY = (SELECT MAX(DLVR_DAY) FROM RTCS0010 WHERE ORD_NO = v_Ord_No);
                                                          
    v_Tmpl_Cn O2OUSER.TB_CM_ALTK_TMPL.TMPL_CN%TYPE;
    v_Res_Cn varchar2(1000);
  BEGIN

    SELECT    TMPL.TMPL_CN        --템플릿 내용
        INTO v_Tmpl_Cn
        FROM O2OUSER.TB_CM_ALTK_TMPL TMPL
         WHERE  TMPL.TMPL_CD = v_Tmpl_Cd 
        ;   
    
    FOR CUR IN Cur_Rtsd0104 LOOP
             
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$1$', CUR.OMS_ORDERNO);   
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$2$', CUR.SALE_SE_CD);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$3$', CUR.INST_NM);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$4$', CUR.PETTERN_CD);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$5$', CUR.TIRE_SIZE);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$6$', CUR.CNT_CD);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$7$', CUR.STOCK_USER_TYPE);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$8$', CUR.CUST_NM);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$9$', CUR.INST_DAY);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$10$', CUR.INST_TM);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$11$', CUR.MODEL_NM);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$12$', CUR.MOB_NO);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$13$', CUR.ADDR1);
          v_Res_Cn  := v_Tmpl_Cn;
    END LOOP;
    
    IF Cur_Rtsd0104%ISOPEN THEN
        CLOSE Cur_Rtsd0104;
    END IF; 
    
    FOR CUR IN Cur_Rtcs0010 LOOP
             
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$1$', CUR.OMS_ORDERNO);   
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$2$', CUR.SALE_SE_CD);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$3$', CUR.INST_NM);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$4$', CUR.PETTERN_CD);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$5$', CUR.TIRE_SIZE);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$6$', CUR.CNT_CD);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$7$', CUR.STOCK_USER_TYPE);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$8$', CUR.CUST_NM);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$9$', CUR.INST_DAY);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$10$', CUR.INST_TM);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$11$', CUR.MODEL_NM);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$12$', CUR.MOB_NO);
          v_Tmpl_Cn := REPLACE(v_Tmpl_Cn, '$13$', CUR.ADDR1);
          v_Res_Cn  := v_Tmpl_Cn;
    END LOOP;
    
    IF Cur_Rtcs0010%ISOPEN THEN
        CLOSE Cur_Rtcs0010;
    END IF;
    
    RETURN v_Res_Cn;
    
  END f_sExif0004O2OMakeSms; 
  
  /*****************************************************************************
  -- 배정문자발송 (주문/취소)
  *****************************************************************************/
   PROCEDURE p_sExif0004O2OSendSms (
      v_Tmpl_Cd          IN VARCHAR2,                              /* SMS 템플릿 */
      v_Oms_Order_No  IN VARCHAR2,                               /* OMS 주문번호 */
      v_Reg_Id             IN VARCHAR2,                               /* 주문자 */
      v_Success_Code        OUT NUMBER,                               /* 주문자 */
      v_Return_Message     OUT VARCHAR2,                               /* 주문자 */
      v_ErrorText             OUT VARCHAR2                               /* 주문자 */
  ) IS

        v_Sms_Text VARCHAR2(2000);
        v_Ord_No RTSD0104.ORD_NO%TYPE;
        
        e_Error EXCEPTION;
  BEGIN     
       
       IF v_Oms_Order_No IS NULL THEN
            v_Return_Message := 'OMS주문번호가 존재하지 않습니다.!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
       END IF;
       
       -- OMS주문번호 조회
       SELECT RENT_IF_CNTR_NO 
       INTO v_Ord_No
       FROM O2OUSER.TB_OD_ORD_MST
       WHERE ORD_NO = v_Oms_Order_No;
       
       IF v_Ord_No IS NULL THEN
            v_Return_Message := 'OMS주문번호가 존재하지 않습니다.!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
       END IF;
       
       -- 템플릿 구분에 따른 SMS구문 생성
       v_Sms_Text := f_sExif0004O2OMakeSms(v_Tmpl_Cd, v_Ord_No, v_Oms_Order_No);
       
       IF v_Sms_Text IS NULL THEN
            v_Return_Message := 'SMS발송 문구가 존재하지 않습니다.!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
       END IF;
       
       -- SMS발송처리
       FOR CUR IN (
               SELECT  B.ORGZ_CD    AS    orgzCd,
                        B.ORGMB_NM        AS    bhfnm,
                        B.ORGMB_NO        AS    orgmbNo,
                        REPLACE(B.MOB_NO, '-', '')        AS    orgMobNo,        --조직원 전화번호
                        O2OUSER.FN_SV_0009(v_Oms_Order_No ,'R')                     AS stockUseType,        -- 재고사용유형
                        D.SALE_SE_CD AS saleSeCd   --판매구분코드
                FROM   O2OUSER.TB_SV_CAR_ENGR_ASIGN_MNG A,
                          O2OUSER.TB_OG_ORGMB_MST B,
                          O2OUSER.TB_OD_CNTR_MST D
                WHERE 1=1
                  AND A.EMP_NO = B.USR_ID
                  AND A.CAR_NO IN (
                                      SELECT PROC_DUE_CAR_NO
                                      FROM O2OUSER.TB_SV_OPERT_ASIGN_MST_NX
                                      WHERE 1=1
                                      AND  PROC_DUE_CAR_NO IS NOT NULL
                                      AND  ORD_NO = v_Oms_Order_No )
                    AND D.ORD_NO  = v_Oms_Order_No   
                  UNION
                  SELECT  A.ORGZ_CD        AS    orgzCd,         --거점코드
                        A.ORGMB_NM        AS    bhfnm,        --거점이름
                        B.GM_ORGMB_NO    AS    orgmbNo,     --조직 번호
                        REPLACE(A.MOB_NO, '-', '')         AS    orgMobNo,          --조직원 전화 번호
                        O2OUSER.FN_SV_0009(v_Oms_Order_No ,'R')                     AS stockUseType,        -- 재고사용유형
                        D.SALE_SE_CD AS saleSeCd   --판매구분코드
                FROM   O2OUSER.TB_OG_ORGMB_MST A,
                          O2OUSER.TB_OG_ORGZ_MST B,
                          O2OUSER.TB_OD_CNTR_MST D
                WHERE   1=1
                  AND   A.ORGZ_CD = B.ORGZ_CD
                  AND   A.ORGMB_NO = B.GM_ORGMB_NO
                  AND    A.ORGZ_CD = ( SELECT IST_DUE_ORGZ
                                      FROM O2OUSER.TB_OD_CNTR_MST
                                      WHERE 1=1
                                      AND IST_DUE_ORGZ IS NOT NULL
                                      AND ORD_NO = v_Oms_Order_No )
                  AND   D.ORD_NO  = v_Oms_Order_No                     
                  AND   B.ORGZ_LVL = '5') LOOP
          
                  --[20210611_01] kstka 연락처가 없는 경우 발송 제외
                  IF CUR.orgMobNo IS NOT NULL THEN
                  
                      Pkg_Rtsd0205.p_Rtsd0205InterfaceNew('I', TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), CUR.orgMobNo, '18550100', v_Sms_Text, 
                                                                        'S042', v_Ord_No, '7', '', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);                                                                    
                  END IF;
                  
                IF v_Success_Code != 0 THEN
                    v_Return_Message := 'SMS발송 등록 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;
                
          END LOOP;
          
          v_Success_Code := 0;
          v_Return_Message := '정상적으로 등록되었습니다';
          v_Errortext := '';
    
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
            
  END p_sExif0004O2OSendSms;
  
  /*****************************************************************************
  -- 방문점검 차량 배차지역 여부확인
  *****************************************************************************/
   FUNCTION f_sExif0004O2OCarAreaCheck (
      v_Proc_Day          IN VARCHAR2,                              /* 주문일자 */
      v_Si_Nm             IN VARCHAR2,                              /* 시 */
      v_Sgg_Nm           IN VARCHAR2,                              /* 구 */
      v_Emd_Nm          IN VARCHAR2,                              /* 동 */
      v_ErrorText          OUT VARCHAR2                             
  ) RETURN VARCHAR2 IS

    v_Res_Yn VARCHAR2(1);
  BEGIN     
       
            SELECT CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END
            INTO v_Res_Yn
            FROM O2OUSER.TB_SV_CAR_MNG A
            LEFT OUTER JOIN O2OUSER.TB_SV_CAR_MNG_AREA B ON A.CLS_NO = B.CLS_NO AND B.USE_YN = 'Y' 
                AND (REPLACE(v_Proc_Day,'-','') BETWEEN B.STARTDE AND B.ENDDE)    -- 일자
                AND ((CASE WHEN REPLACE(v_Proc_Day,'-','') = B.STARTDE OR REPLACE(v_Proc_Day,'-','') = B.ENDDE THEN  -- 일자
                                CASE WHEN REPLACE(v_Proc_Day,'-','') = B.STARTDE THEN (CASE WHEN B.STARTDE_AMPM  <=  'AM' THEN 'TRUE' ELSE 'FALSE' END) --일자 AM or PB
                                     ELSE (CASE WHEN B.ENDDE_AMPM  >=  'AM' THEN 'TRUE' ELSE 'FALSE' END)
                                END
                           ELSE 'TRUE'
                      END) = 'TRUE')
            LEFT JOIN O2OUSER.TB_OG_ORGZ_MST D ON A.BHF_CD = D.ORGZ_CD
            LEFT OUTER JOIN O2OUSER.TB_SV_CAR_MNG_PERIOD E ON A.CLS_NO = E.CLS_NO
            LEFT JOIN O2OUSER.TB_SV_BHF_MNG F ON A.BHF_CD = F.BHF_CD
            LEFT JOIN O2OUSER.TB_CM_CD C1 ON B.MNGAREA_CMCD = C1.CM_CD AND C1.CM_GRP_CD = 'SV037' AND C1.USE_YN = 'Y'
            LEFT JOIN O2OUSER.TB_CM_CD C2 ON B.MNGAREA_DTL_CMCD = C2.CM_CD AND C2.CM_GRP_CD = 'SV093' AND C2.USE_YN = 'Y'
            LEFT JOIN O2OUSER.TB_CM_CD C3 ON B.MNGAREA_DTL2_CMCD = C3.CM_CD AND C3.CM_GRP_CD = 'SV095' AND C3.USE_YN = 'Y'
            WHERE A.USE_YN = 'Y'
            AND E.CLS_NO IS NOT NULL
            AND v_Proc_Day BETWEEN E.START_DE AND E.END_DE
            AND C1.CM_CD_NM LIKE '%' || v_Si_Nm || '%'  -- 시
            AND C2.CM_CD_NM LIKE '%' || v_Sgg_Nm || '%'     -- 구
            AND ( C3.CM_CD_NM LIKE '%' || v_Emd_Nm || '%' OR C3.CM_CD_NM IS NULL ) -- 동
            AND E.TY = '10'
            GROUP BY A.CLS_NO, A.CAR_NO
             ;  
          
            RETURN v_Res_Yn;
            
  END f_sExif0004O2OCarAreaCheck;
  
  /*****************************************************************************
  -- 제품별 타이어 이미지 획득
  *****************************************************************************/
   FUNCTION f_sExif0004O2OTireImg (
      v_Ord_No          IN VARCHAR2                              /* 주문번호 */                          
  ) RETURN VARCHAR2 IS

    v_Img_Url VARCHAR2(200);
  BEGIN     
       
           SELECT PR.THUMB_IMG_URL
           INTO v_Img_Url
                FROM O2OUSER.TB_WM_ITEM_MST ITEM
           LEFT OUTER JOIN O2OUSER.TB_OD_DP_PR_INFO PR
                ON (PR.PTRN_NM = ITEM.ITEM_PTRN OR PR.PTRN_NM = ITEM.PTRN_SUB)
           INNER JOIN RTSD0005 A ON A.MAT_CD = ITEM.ITEM_CD AND (A.PETTERN_CD = ITEM.ITEM_PTRN OR A.PETTERN_CD = ITEM.PTRN_SUB)
           INNER JOIN RTSD0106 B ON A.MAT_CD = B.MAT_CD
           WHERE  B.ORD_NO = v_Ord_No
           AND ROWNUM = 1
           ;    
          
            RETURN v_Img_Url;
            
  END f_sExif0004O2OTireImg;
   
END Pkg_Exif0004;
/
