CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTMANUAL AS
/*******************************************************************************
    NAME        PKG_RTMANUAL
    PURPOSE     수기처리 모음

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
    1.1     2017-07-08  wjim            [20170708_01] NS홈쇼핑 양식 추가
    1.2     2017-07-10  wjim            [20170710_01] 신세계홈쇼핑 양식 추가
    1.3     2017-07-21  wjim            [20170721_01] B쇼핑 양식 추가
    1.4     2017-08-18  kstka           [20170818_01] 홈앤쇼핑, 쇼핑엔티 양식 추가
    1.5     2017-09-20  wjim            [20170920_01] 홈쇼핑 업로드 양식 변경
    1.6     2017-09-27  wjim            [20170927_02] 신세계 홈쇼핑 업로드 기준 변경
    1.7     2018-07-25  wjim            [20180725_01] 롯데원티비 예약일시 Trim 처리
    1.8     2019-11-13  kstka           [20191112_01] K쇼핑 양식 변경
    1.9     2020-09-28  kstka           [20200928_01] 홈쇼핑 인입건 2주제한 조건 추가
    1.10    2022-01-20  kstka           [20220120_01] GS MY SHOP 등록 추가
    1.11    2023-06-21  kstka           [20230621_01] 홈쇼핑가계약양식 공통화
*******************************************************************************/

  /*****************************************************************************
  -- 홈쇼핑 가계약 일괄 업로드
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
    1.1     2017-07-08  wjim            [20170708_01] NS홈쇼핑 양식 추가
    1.2     2017-07-10  wjim            [20170710_01] 신세계홈쇼핑 양식 추가
    1.3     2017-07-21  wjim            [20170721_01] B쇼핑 양식 추가
    1.4     2017-08-18  kstka           [20170818_01] 홈앤쇼핑, 쇼핑엔티 양식 추가
    1.5     2017-09-20  wjim            [20170920_01] 홈쇼핑 업로드 양식 변경
                                        - 신세계 : 기출하, 기회수 항목 추가
                                        - 쇼핑엔티 : 전화번호 기준 변경 (상담전화번호>전화번호)
    1.6     2017-09-27  wjim            [20170927_02] 신세계 홈쇼핑 업로드 기준 변경
                                        - '전화번호'를 '추가연락처'에 매핑    
    1.7     2018-07-25  wjim            [20180725_01] 롯데원티비 예약일시 Trim 처리
    1.8     2019-11-13  kstka           [20191112_01] K쇼핑 양식 변경
    1.9     2020-09-28  kstka           [20200928_01] 홈쇼핑 인입건 2주제한 조건 추가      
    1.11    2023-06-21  kstka           [20230621_01] 홈쇼핑가계약양식 공통화                                                                
  *****************************************************************************/
  PROCEDURE p_UpHshopProvsn_OLD (
      v_Hshop_Tp       IN RTSD0121.HSHOP_TP%TYPE   /* 홈쇼핑구분 [S096]       */
    , v_Provsn_Day     IN RTSD0121.PROVSN_DAY%TYPE /* 업로드일자 (YYYYMMDD)   */
    , v_Air_Day        IN RTSD0121.AIR_DAY%TYPE    /* 방송일자 (YYYYMMDD)     */
    , v_Air_Tm         IN RTSD0121.AIR_TM%TYPE     /* 방송시간 (HH24MI)       */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE     /* 등록자ID                */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    -- 상수 선언
    cs_Provsn_Tp     RTSD0121.PROVSN_TP%TYPE     := 'H';    --가계약구분=홈쇼핑 [S092]
    cs_Provsn_St     RTSD0121.PROVSN_ST%TYPE     := '20';   --가계약상태=접수 [S093]
    cs_Provsn_St_Dtl RTSD0121.PROVSN_ST_DTL%TYPE := '2010'; --가계약세부상태=컨택예정 [S094]
    
    -- 변수 선언
    ls_Provsn_Day    RTSD0121.PROVSN_DAY%TYPE;              --업로드일자 
    ln_cnt_exe       NUMBER DEFAULT 0;                      --수행건수
    ln_seq           NUMBER DEFAULT 0;                      --일련번호
    
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 홈쇼핑구분 
    IF (TRIM(v_Hshop_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S096', v_Hshop_Tp)) THEN
        v_Return_Message := '홈쇼핑구분('||v_Hshop_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 방송일자
    IF (v_Hshop_Tp IN ('02','03','04','05','06')) AND (TRIM(v_Air_Day) IS NULL) THEN
        v_Return_Message := '방송일자('||v_Air_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 방송시간
    IF (v_Hshop_Tp IN ('02','03','04','05','06')) AND (TRIM(v_Air_Tm) IS NULL) THEN
        v_Return_Message := '방송시간('||v_Air_Tm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 공백행 삭제(Excel 업로드 과정에서 발생 가능)
     */ 
    DELETE  RTTEMPIWJ
     WHERE  1=1
       AND  TRIM(COL_01) IS NULL AND TRIM(COL_02) IS NULL
    ;
    
    -- 업로드일자 초기화
    IF TRIM(v_Provsn_Day) IS NULL OR TRIM(v_Provsn_Day) = '' THEN
        ls_Provsn_Day := TO_CHAR(SYSDATE, 'YYYYMMDD');
    ELSE
        ls_Provsn_Day := v_Provsn_Day;
    END IF;
    
    SELECT  TO_NUMBER(NVL(SUBSTR(MAX(PROVSN_NO),10),0))
      INTO  ln_seq
      FROM  RTSD0121
     WHERE  PROVSN_NO LIKE cs_Provsn_Tp||ls_Provsn_Day||'%'
    ;
    
    /*
     * 업로드
     */
    --GS홈쇼핑
--    IF v_Hshop_Tp = '01' THEN
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_07)                                                  AS CUST_NM     
--             ,  REPLACE(NVL(TRIM(COL_10), TRIM(COL_11)),'-','')               AS MOB_NO
--             ,  COL_18                                                        AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_01                                                        AS HSHOP_ORDNO
--             ,  REPLACE(SUBSTR(COL_04,1,10),'-','')                           AS AIR_DAY   
--             ,  TRIM(REPLACE(SUBSTR(COL_04,11),':',''))                       AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  COL_16                                                        AS CUST_REQ
--             ,  COL_02                                                        AS PROD_CD
--             ,  COL_03                                                        AS PROD_NM
--             ,  REPLACE(SUBSTR(COL_05,1,10),'-','')                           AS RSRV_DAY
--             ,  TRIM(REPLACE(SUBSTR(COL_05,11),':',''))                       AS RSRV_TM
--             ,  DECODE(COL_06,'CATV','01','MC','02','EC','03','TC','04','99') AS MEDIA
--             ,  COL_08                                                        AS REQ_CUST_NM
--             ,  COL_09                                                        AS RES_CUST_NO
--             ,  COL_11                                                        AS ADD_MOB_NO
--             ,  COL_12                                                        AS RES_CUST
--             ,  COL_13                                                        AS CNCL_DAY
--             ,  COL_14                                                        AS INST_DAY
--             ,  COL_15                                                        AS JOIN_REQ
--             ,  COL_17                                                        AS ZIP_CD
--             ,  NULL                                                          AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  NULL                                                          AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  NULL                                                          AS ADDR_2
--             ,  NULL                                                          AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  NULL                                                          AS UNIT_CD
--             ,  NULL                                                          AS ORD_CNT
--             ,  NULL                                                          AS REMAIN_CNT
--             ,  NULL                                                          AS LOW_VNDR_CD
--             ,  NULL                                                          AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  NULL                                                          AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  NULL                                                          AS UNIT_DESC
--             ,  NULL                                                          AS ADD_MOB_NO_1
--             ,  NULL                                                          AS ADD_MOB_NO_2
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV             
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(NVL(TRIM(COL_10), TRIM(COL_11)),'-',''));
--    --CJ홈쇼핑      
--    ELSIF v_Hshop_Tp = '02' THEN
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_11)                                                  AS CUST_NM     
--             ,  REPLACE(NVL(TRIM(COL_13),TRIM(COL_12)),'-','')                AS MOB_NO
--             ,  NVL(TRIM(COL_15),COL_16)                                      AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_05                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  NULL                                                          AS CUST_REQ
--             ,  COL_03                                                        AS PROD_CD
--             ,  NULL                                                          AS PROD_NM
--             ,  REPLACE(SUBSTR(COL_06,1,10),'-','')                           AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  NULL                                                          AS REQ_CUST_NM
--             ,  COL_21                                                        AS RES_CUST_NO
--             ,  COL_12                                                        AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  REPLACE(SUBSTR(COL_09,1,10),'-','')                           AS CNCL_DAY
--             ,  REPLACE(SUBSTR(COL_09,1,10),'-','')                           AS INST_DAY
--             ,  COL_20                                                        AS JOIN_REQ
--             ,  COL_14                                                        AS ZIP_CD
--             ,  COL_01                                                        AS SEQ_NO 
--             ,  COL_02                                                        AS CH_SML
--             ,  COL_04                                                        AS SALE_DESC
--             ,  COL_07                                                        AS PRGRS_STATE
--             ,  COL_10                                                        AS CNCL_DESC
--             ,  COL_16                                                        AS ADDR_2
--             ,  COL_18                                                        AS ACCPTR_INFO
--             ,  COL_19                                                        AS SALE_PRICE
--             ,  NULL                                                          AS UNIT_CD
--             ,  NULL                                                          AS ORD_CNT
--             ,  NULL                                                          AS REMAIN_CNT
--             ,  NULL                                                          AS LOW_VNDR_CD
--             ,  NULL                                                          AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  NULL                                                          AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  NULL                                                          AS UNIT_DESC    
--             ,  NULL                                                          AS ADD_MOB_NO_1
--             ,  NULL                                                          AS ADD_MOB_NO_2 
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(NVL(TRIM(COL_13),TRIM(COL_12)),'-',''));    
--    --K쇼핑
--    ELSIF v_Hshop_Tp = '03' THEN
--        INSERT  INTO RTSD0121
----        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
----             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
----             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
----             ,  TRIM(COL_05)                                                  AS CUST_NM     
----             ,  REPLACE(TRIM(COL_16),'-','')                                  AS MOB_NO
----             ,  COL_18                                                        AS ADDR
----             ,  NULL                                                          AS MC_NM
----             ,  NULL                                                          AS SPEC_NM
----             ,  NULL                                                          AS CAR_NO
----             ,  NULL                                                          AS PATTERN_NM
----             ,  NULL                                                          AS CNT
----             ,  NULL                                                          AS PERIOD
----             ,  NULL                                                          AS REGI_AMT
----             ,  NULL                                                          AS RENT_AMT
----             ,  COL_12                                                        AS PLAN_DAY
----             ,  NULL                                                          AS EMAIL_ADDR
----             ,  cs_Provsn_St                                                  AS PROVSN_ST
----             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
----             ,  NULL                                                          AS ORD_NO
----             ,  v_Reg_Id                                                      AS REG_ID
----             ,  SYSDATE                                                       AS REG_DT
----             ,  v_Reg_Id                                                      AS CHG_ID
----             ,  SYSDATE                                                       AS CHG_DT
----             ,  v_Hshop_Tp                                                    AS HSHOP_TP
----             ,  COL_04                                                        AS HSHOP_ORDNO
----             ,  v_Air_Day                                                     AS AIR_DAY   
----             ,  v_Air_Tm                                                      AS AIR_TM
----             ,  NULL                                                          AS CONTACT_GET
----             ,  NULL                                                          AS CUST_REQ
----             ,  COL_07                                                        AS PROD_CD
----             ,  COL_09                                                        AS PROD_NM
----             ,  TRIM(COL_13)                                                        AS RSRV_DAY
----             ,  NULL                                                          AS RSRV_TM
----             ,  NULL                                                          AS MEDIA
----             ,  COL_06                                                        AS REQ_CUST_NM
----             ,  NULL                                                          AS RES_CUST_NO
----             ,  NULL                                                          AS ADD_MOB_NO
----             ,  NULL                                                          AS RES_CUST
----             ,  NULL                                                          AS CNCL_DAY
----             ,  NULL                                                          AS INST_DAY
----             ,  NULL                                                          AS JOIN_REQ
----             ,  COL_17                                                        AS ZIP_CD
----             ,  COL_01                                                        AS SEQ_NO 
----             ,  COL_02                                                        AS CH_SML
----             ,  COL_10                                                        AS SALE_DESC
----             ,  COL_03                                                        AS PRGRS_STATE
----             ,  NULL                                                          AS CNCL_DESC
----             ,  NULL                                                          AS ADDR_2
----             ,  COL_15                                                        AS ACCPTR_INFO
----             ,  NULL                                                          AS SALE_PRICE
----             ,  COL_08                                                        AS UNIT_CD
----             ,  COL_11                                                        AS ORD_CNT
----             ,  COL_14                                                        AS REMAIN_CNT
----             ,  COL_19                                                        AS LOW_VNDR_CD
----             ,  COL_20                                                        AS LOW_VNDR_NM
----             ,  NULL                                                          AS TEL_REQ_DIV
----             ,  NULL                                                          AS REQ_DAY
----             ,  NULL                                                          AS REQ_TM
----             ,  NULL                                                          AS ORD_DIV
----             ,  NULL                                                          AS SHIP_PLAN_DAY
----             ,  NULL                                                          AS REG_YN
----             ,  NULL                                                          AS RSRV_SND_DAY
----             ,  NULL                                                          AS UNIT_DESC
----             ,  NULL                                                          AS ADD_MOB_NO_1
----             ,  NULL                                                          AS ADD_MOB_NO_2
----             ,  NULL                                                          AS PAY_APRV_DAY
----             ,  NULL                                                          AS VNDR_REQ_DAY
----             ,  NULL                                                          AS VNDR_REQ_TM
----             ,  NULL                                                          AS PROD_DIV
----          FROM  RTTEMPIWJ;
--
--          --[20191112_01] K쇼핑 양식 변경
--            SELECT   cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_06)                                                  AS CUST_NM     
--             ,  REPLACE(NVL(TRIM(COL_21), TRIM(COL_20)),'-','')               AS MOB_NO
--             ,  COL_23                                                        AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_05                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  NULL                                                          AS CUST_REQ
--             ,  COL_08                                                        AS PROD_CD
--             ,  COL_10                                                        AS PROD_NM
--             ,  NULL                                                          AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  COL_07                                                        AS REQ_CUST_NM
--             ,  NULL                                                          AS RES_CUST_NO
--             ,  COL_19                                                        AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  COL_22                                                        AS ZIP_CD
--             ,  COL_01                                                        AS SEQ_NO 
--             ,  COL_02                                                        AS CH_SML
--             ,  COL_04                                                        AS SALE_DESC
--             ,  COL_03                                                        AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  COL_23                                                        AS ADDR_2
--             ,  COL_18                                                        AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  COL_09                                                        AS UNIT_CD
--             ,  COL_12                                                        AS ORD_CNT
--             ,  COL_17                                                        AS REMAIN_CNT
--             ,  COL_25                                                        AS LOW_VNDR_CD
--             ,  COL_26                                                        AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  NULL                                                          AS ORD_DIV
--             ,  COL_16                                                        AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  COL_15                                                        AS RSRV_SND_DAY
--             ,  COL_11                                                        AS UNIT_DESC
--             ,  COL_20                                                        AS ADD_MOB_NO_1
--             ,  NULL                                                          AS ADD_MOB_NO_2
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(NVL(TRIM(COL_21), TRIM(COL_20)),'-',''));
--          
--    --NS홈쇼핑      
--    ELSIF v_Hshop_Tp = '04' THEN --[20170708_01]
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_04)                                                  AS CUST_NM     
--             ,  REPLACE(TRIM(COL_05),'-','')                                  AS MOB_NO
--             ,  NULL                                                          AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_01                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  COL_06||' '||COL_07||' '||COL_08                              AS CUST_REQ
--             ,  NULL                                                          AS PROD_CD
--             ,  NULL                                                          AS PROD_NM
--             ,  TRIM(REPLACE(SUBSTR(COL_02,1,10),'-',''))                     AS RSRV_DAY
--             ,  TRIM(REPLACE(SUBSTR(COL_02,14),':',''))                       AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  NULL                                                          AS REQ_CUST_NM
--             ,  COL_03                                                        AS RES_CUST_NO
--             ,  NULL                                                          AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  NULL                                                          AS ZIP_CD
--             ,  NULL                                                          AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  NULL                                                          AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  NULL                                                          AS ADDR_2
--             ,  NULL                                                          AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  NULL                                                          AS UNIT_CD
--             ,  NULL                                                          AS ORD_CNT
--             ,  NULL                                                          AS REMAIN_CNT
--             ,  NULL                                                          AS LOW_VNDR_CD
--             ,  NULL                                                          AS LOW_VNDR_NM
--             ,  COL_06                                                        AS TEL_REQ_DIV
--             ,  COL_07                                                        AS REQ_DAY
--             ,  COL_08                                                        AS REQ_TM
--             ,  NULL                                                          AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  NULL                                                          AS UNIT_DESC  
--             ,  NULL                                                          AS ADD_MOB_NO_1 
--             ,  NULL                                                          AS ADD_MOB_NO_2  
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(TRIM(COL_05),'-',''));
--    --신세계홈쇼핑      
--    ELSIF v_Hshop_Tp = '05' THEN
--        INSERT  INTO RTSD0121
----        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
----             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
----             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
----             ,  TRIM(COL_07)                                                  AS CUST_NM     
----             ,  REPLACE(TRIM(NVL2(COL_20,COL_20,COL_19)),'-','')              AS MOB_NO
----             ,  COL_22                                                        AS ADDR
----             ,  NULL                                                          AS MC_NM
----             ,  NULL                                                          AS SPEC_NM
----             ,  NULL                                                          AS CAR_NO
----             ,  NULL                                                          AS PATTERN_NM
----             ,  NULL                                                          AS CNT
----             ,  NULL                                                          AS PERIOD
----             ,  NULL                                                          AS REGI_AMT
----             ,  NULL                                                          AS RENT_AMT
----             ,  NULL                                                          AS PLAN_DAY
----             ,  NULL                                                          AS EMAIL_ADDR
----             ,  cs_Provsn_St                                                  AS PROVSN_ST
----             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
----             ,  NULL                                                          AS ORD_NO
----             ,  v_Reg_Id                                                      AS REG_ID
----             ,  SYSDATE                                                       AS REG_DT
----             ,  v_Reg_Id                                                      AS CHG_ID
----             ,  SYSDATE                                                       AS CHG_DT
----             ,  v_Hshop_Tp                                                    AS HSHOP_TP
----             ,  COL_06                                                        AS HSHOP_ORDNO
----             ,  v_Air_Day                                                     AS AIR_DAY   
----             ,  v_Air_Tm                                                      AS AIR_TM
----             ,  NULL                                                          AS CONTACT_GET
----             ,  NULL                                                          AS CUST_REQ
----             ,  COL_09                                                        AS PROD_CD
----             ,  COL_11                                                        AS PROD_NM
----             ,  NULL                                                          AS RSRV_DAY
----             ,  NULL                                                          AS RSRV_TM
----             ,  NULL                                                          AS MEDIA
----             ,  COL_08                                                        AS REQ_CUST_NM
----             ,  NULL                                                          AS RES_CUST_NO
----             ,  COL_19                                                        AS ADD_MOB_NO --[20170927_02]
----             ,  NULL                                                          AS RES_CUST
----             ,  NULL                                                          AS CNCL_DAY
----             ,  NULL                                                          AS INST_DAY
----             ,  NULL                                                          AS JOIN_REQ
----             ,  COL_21                                                        AS ZIP_CD
----             ,  COL_01                                                        AS SEQ_NO 
----             ,  NULL                                                          AS CH_SML
----             ,  COL_12                                                        AS SALE_DESC
----             ,  COL_03                                                        AS PRGRS_STATE
----             ,  NULL                                                          AS CNCL_DESC
----             ,  NULL                                                          AS ADDR_2
----             ,  NULL                                                          AS ACCPTR_INFO
----             ,  NULL                                                          AS SALE_PRICE
----             ,  COL_10                                                        AS UNIT_CD
----             ,  COL_13                                                        AS ORD_CNT
----             ,  COL_17                                                        AS REMAIN_CNT
----             ,  COL_23                                                        AS LOW_VNDR_CD
----             ,  COL_24                                                        AS LOW_VNDR_NM
----             ,  NULL                                                          AS TEL_REQ_DIV
----             ,  NULL                                                          AS REQ_DAY
----             ,  NULL                                                          AS REQ_TM
----             ,  COL_02                                                        AS ORD_DIV
----             ,  COL_14                                                        AS SHIP_PLAN_DAY
----             ,  COL_15                                                        AS REG_YN
----             ,  COL_16                                                        AS RSRV_SND_DAY
----             ,  NULL                                                          AS UNIT_DESC   
----             ,  NULL                                                          AS ADD_MOB_NO_1
----             ,  NULL                                                          AS ADD_MOB_NO_2 
----             ,  NULL                                                          AS PAY_APRV_DAY
----             ,  NULL                                                          AS VNDR_REQ_DAY
----             ,  NULL                                                          AS VNDR_REQ_TM
----             ,  NULL                                                          AS PROD_DIV
----          FROM  RTTEMPIWJ;
--          
--          SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_09)                                                  AS CUST_NM     
--             ,  REPLACE(TRIM(NVL2(COL_27,COL_27,COL_26)),'-','')              AS MOB_NO
--             ,  COL_30                                                        AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_07                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  NULL                                                          AS CUST_REQ
--             ,  COL_11                                                        AS PROD_CD
--             ,  COL_13                                                        AS PROD_NM
--             ,  NULL                                                          AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  COL_10                                                        AS REQ_CUST_NM
--             ,  NULL                                                          AS RES_CUST_NO
--             ,  COL_26                                                        AS ADD_MOB_NO --[20170927_02]
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  COL_29                                                        AS ZIP_CD
--             ,  COL_01                                                        AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  COL_03                                                        AS SALE_DESC
--             ,  COL_04                                                        AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  NULL                                                          AS ADDR_2
--             ,  NULL                                                          AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  COL_12                                                        AS UNIT_CD
--             ,  COL_15                                                        AS ORD_CNT
--             ,  COL_16                                                        AS REMAIN_CNT
--             ,  COL_31                                                        AS LOW_VNDR_CD
--             ,  COL_32                                                        AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  COL_02                                                        AS ORD_DIV
--             ,  COL_19                                                        AS SHIP_PLAN_DAY
--             ,  COL_22                                                        AS REG_YN
--             ,  COL_23                                                        AS RSRV_SND_DAY
--             ,  NULL                                                          AS UNIT_DESC   
--             ,  NULL                                                          AS ADD_MOB_NO_1
--             ,  NULL                                                          AS ADD_MOB_NO_2 
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(TRIM(NVL2(COL_20,COL_20,COL_19)),'-',''));
--    --B쇼핑(SK스토아)      
--    ELSIF v_Hshop_Tp = '06' THEN
----        INSERT  INTO RTSD0121
----        SELECT  cs_Provsn_Tp||ls_Provsn_Day||to_char(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
----             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
----             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
----             ,  COL_10                                                        AS CUST_NM     
----             ,  COL_12                                                        AS MOB_NO
----             ,  NULL                                                          AS ADDR
----             ,  NULL                                                          AS MC_NM
----             ,  NULL                                                          AS SPEC_NM
----             ,  NULL                                                          AS CAR_NO
----             ,  NULL                                                          AS PATTERN_NM
----             ,  NULL                                                          AS CNT
----             ,  NULL                                                          AS PERIOD
----             ,  NULL                                                          AS REGI_AMT
----             ,  NULL                                                          AS RENT_AMT
----             ,  NULL                                                          AS PLAN_DAY
----             ,  NULL                                                          AS EMAIL_ADDR
----             ,  cs_Provsn_St                                                  AS PROVSN_ST
----             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
----             ,  NULL                                                          AS ORD_NO
----             ,  v_Reg_Id                                                      AS REG_ID
----             ,  SYSDATE                                                       AS REG_DT
----             ,  v_Reg_Id                                                      AS CHG_ID
----             ,  SYSDATE                                                       AS CHG_DT
----             ,  v_Hshop_Tp                                                    AS HSHOP_TP
----             ,  COL_02                                                        AS HSHOP_ORDNO
----             ,  v_Air_Day                                                     AS AIR_DAY   
----             ,  v_Air_Tm                                                      AS AIR_TM
----             ,  NULL                                                          AS CONTACT_GET
----             ,  NULL                                                          AS CUST_REQ
----             ,  COL_05                                                        AS PROD_CD
----             ,  COL_06                                                        AS PROD_NM
----             ,  NULL                                                          AS RSRV_DAY
----             ,  NULL                                                          AS RSRV_TM
----             ,  NULL                                                          AS MEDIA
----             ,  NULL                                                          AS REQ_CUST_NM
----             ,  NULL                                                          AS RES_CUST_NO
----             ,  NULL                                                          AS ADD_MOB_NO
----             ,  NULL                                                          AS RES_CUST
----             ,  NULL                                                          AS CNCL_DAY
----             ,  NULL                                                          AS INST_DAY
----             ,  NULL                                                          AS JOIN_REQ
----             ,  NULL                                                          AS ZIP_CD
----             ,  COL_01                                                        AS SEQ_NO 
----             ,  NULL                                                          AS CH_SML
----             ,  NULL                                                          AS SALE_DESC
----             ,  NULL                                                          AS PRGRS_STATE
----             ,  NULL                                                          AS CNCL_DESC
----             ,  NULL                                                          AS ADDR_2
----             ,  COL_11                                                        AS ACCPTR_INFO
----             ,  NULL                                                          AS SALE_PRICE
----             ,  COL_07                                                        AS UNIT_CD
----             ,  COL_09                                                        AS ORD_CNT
----             ,  NULL                                                          AS REMAIN_CNT
----             ,  COL_03                                                        AS LOW_VNDR_CD
----             ,  COL_04                                                        AS LOW_VNDR_NM
----             ,  NULL                                                          AS TEL_REQ_DIV
----             ,  NULL                                                          AS REQ_DAY
----             ,  NULL                                                          AS REQ_TM
----             ,  NULL                                                          AS ORD_DIV
----             ,  NULL                                                          AS SHIP_PLAN_DAY
----             ,  NULL                                                          AS REG_YN
----             ,  NULL                                                          AS RSRV_SND_DAY
----             ,  COL_08                                                        AS UNIT_DESC 
----             ,  NULL                                                          AS ADD_MOB_NO_1
----             ,  NULL                                                          AS ADD_MOB_NO_2  
----             ,  NULL                                                          AS PAY_APRV_DAY
----             ,  NULL                                                          AS VNDR_REQ_DAY
----             ,  NULL                                                          AS VNDR_REQ_TM
----             ,  NULL                                                          AS PROD_DIV
----          FROM  RTTEMPIWJ;
--
--        INSERT  INTO RTSD0121 
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_11)                                                  AS CUST_NM     
--             ,  REPLACE(TRIM(COL_13),'-','')                                  AS MOB_NO
--             ,  COL_14 || ' ' || COL_15                                       AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_03                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  NULL                                                          AS CUST_REQ
--             ,  COL_05                                                        AS PROD_CD
--             ,  COL_07                                                        AS PROD_NM
--             ,  NULL                                                          AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  NULL                                                          AS REQ_CUST_NM
--             ,  COL_10                                                        AS RES_CUST_NO
--             ,  NULL                                                          AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  NULL                                                          AS ZIP_CD
--             ,  COL_01                                                        AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  NULL                                                          AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  NULL                                                          AS ADDR_2
--             ,  COL_12                                                        AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  COL_06                                                        AS UNIT_CD
--             ,  COL_09                                                        AS ORD_CNT
--             ,  NULL                                                          AS REMAIN_CNT
--             ,  COL_18                                                        AS LOW_VNDR_CD
--             ,  COL_19                                                        AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  COL_02                                                        AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  COL_08                                                        AS UNIT_DESC 
--             ,  NULL                                                          AS ADD_MOB_NO_1
--             ,  NULL                                                          AS ADD_MOB_NO_2  
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  REPLACE(COL_04, '/', '')                                      AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(NVL(TRIM(COL_14), TRIM(COL_13)),'-',''));
--          
--    --홈앤쇼핑
--    ELSIF v_Hshop_Tp = '07' THEN
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_12)                                                  AS CUST_NM     
--             ,  REPLACE(NVL(TRIM(COL_15), TRIM(COL_14)),'-','')               AS MOB_NO
--             ,  COL_19                                                        AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_04                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  COL_13                                                        AS CUST_REQ
--             ,  COL_06                                                        AS PROD_CD
--             ,  COL_08                                                        AS PROD_NM
--             ,  NULL                                                          AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  NULL                                                          AS REQ_CUST_NM
--             ,  NULL                                                          AS RES_CUST_NO
--             ,  COL_14                                                        AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  COL_18                                                        AS ZIP_CD
--             ,  COL_01                                                        AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  NULL                                                          AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  NULL                                                          AS ADDR_2
--             ,  COL_05                                                        AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  COL_07                                                        AS UNIT_CD
--             ,  COL_10                                                        AS ORD_CNT
--             ,  COL_11                                                        AS REMAIN_CNT
--             ,  COL_20                                                        AS LOW_VNDR_CD
--             ,  COL_21                                                        AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  REPLACE(SUBSTR(TRIM(COL_17), 0, LENGTH(TRIM(COL_17)) - 5), '/', '')                   AS REQ_DAY
--             ,  REPLACE(TRIM(SUBSTR(TRIM(COL_17), LENGTH(TRIM(COL_17)) - 5, 6)), ':', '')             AS REQ_TM
--             ,  COL_02                                                        AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  COL_09                                                        AS UNIT_DESC 
--             ,  COL_16                                                        AS ADD_MOB_NO_1
--             ,  NULL                                                          AS ADD_MOB_NO_2
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(NVL(TRIM(COL_15), TRIM(COL_14)),'-',''));
--    
--    --쇼핑엔티
--    ELSIF v_Hshop_Tp = '08' THEN
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_13)                                                  AS CUST_NM     
--             ,  REPLACE(NVL(TRIM(COL_17), TRIM(COL_16)),'-','')               AS MOB_NO
--             ,  COL_19                                                        AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_04                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  NULL                                                          AS CUST_REQ
--             ,  COL_06                                                        AS PROD_CD
--             ,  COL_08                                                        AS PROD_NM
--             ,  NULL                                                          AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  NULL                                                          AS REQ_CUST_NM
--             ,  NULL                                                          AS RES_CUST_NO
--             ,  COL_17                                                        AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  COL_18                                                        AS ZIP_CD
--             ,  COL_01                                                        AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  COL_03                                                        AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  NULL                                                          AS ADDR_2
--             ,  COL_05                                                        AS ACCPTR_INFO
--             ,  COL_10                                                        AS SALE_PRICE
--             ,  COL_07                                                        AS UNIT_CD
--             ,  COL_11                                                        AS ORD_CNT
--             ,  COL_12                                                        AS REMAIN_CNT
--             ,  COL_20                                                        AS LOW_VNDR_CD
--             ,  COL_21                                                        AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  COL_02                                                        AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  COL_09                                                        AS UNIT_DESC    
--             ,  COL_14                                                        AS ADD_MOB_NO_1 
--             ,  COL_15                                                        AS ADD_MOB_NO_2
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(NVL(TRIM(COL_17), TRIM(COL_16)),'-',''));
--    --W쇼핑
--    ELSIF v_Hshop_Tp = '09' THEN     
----          INSERT INTO RTSD0121
----          SELECT  cs_Provsn_Tp||ls_Provsn_Day||to_char(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
----             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
----             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
----             ,  COL_15                                                        AS CUST_NM     
----             ,  COL_20                                                        AS MOB_NO
----             ,  COL_18                                                        AS ADDR
----             ,  NULL                                                          AS MC_NM
----             ,  NULL                                                          AS SPEC_NM
----             ,  NULL                                                          AS CAR_NO
----             ,  NULL                                                          AS PATTERN_NM
----             ,  NULL                                                          AS CNT
----             ,  NULL                                                          AS PERIOD
----             ,  NULL                                                          AS REGI_AMT
----             ,  NULL                                                          AS RENT_AMT
----             ,  NULL                                                          AS PLAN_DAY
----             ,  NULL                                                          AS EMAIL_ADDR
----             ,  cs_Provsn_St                                                  AS PROVSN_ST
----             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
----             ,  NULL                                                          AS ORD_NO
----             ,  v_Reg_Id                                                      AS REG_ID
----             ,  SYSDATE                                                       AS REG_DT
----             ,  v_Reg_Id                                                      AS REG_ID
----             ,  SYSDATE                                                       AS CHG_DT
----             ,  v_Hshop_Tp                                                    AS HSHOP_TP
----             ,  COL_04                                                        AS HSHOP_ORDNO
----             ,  v_Air_Day                                                     AS AIR_DAY   
----             ,  v_Air_Tm                                                      AS AIR_TM
----             ,  NULL                                                          AS CONTACT_GET
----             ,  COL_30                                                        AS CUST_REQ
----             ,  COL_09                                                        AS PROD_CD
----             ,  COL_11                                                        AS PROD_NM
----             ,  REPLACE(SUBSTR(COL_31, 0, 10), '/', '')                       AS RSRV_DAY
----             ,  TRIM(REPLACE(SUBSTR(COL_31, 11), ':', ''))                    AS RSRV_TM
----             ,  NULL                                                          AS MEDIA
----             ,  NULL                                                          AS REQ_CUST_NM
----             ,  NULL                                                          AS RES_CUST_NO
----             ,  COL_19                                                        AS ADD_MOB_NO
----             ,  NULL                                                          AS RES_CUST
----             ,  NULL                                                          AS CNCL_DAY
----             ,  NULL                                                          AS INST_DAY
----             ,  NULL                                                          AS JOIN_REQ
----             ,  COL_17                                                        AS ZIP_CD
----             ,  COL_01                                                        AS SEQ_NO 
----             ,  NULL                                                          AS CH_SML
----             ,  NULL                                                          AS SALE_DESC
----             ,  NULL                                                          AS PRGRS_STATE
----             ,  NULL                                                          AS CNCL_DESC
----             ,  NULL                                                          AS ADDR_2
----             ,  COL_16                                                        AS ACCPTR_INFO
----             ,  NULL                                                          AS SALE_PRICE
----             ,  COL_10                                                        AS UNIT_CD
----             ,  COL_13                                                        AS ORD_CNT
----             ,  NULL                                                          AS REMAIN_CNT
----             ,  NULL                                                          AS LOW_VNDR_CD
----             ,  NULL                                                          AS LOW_VNDR_NM
----             ,  NULL                                                          AS TEL_REQ_DIV
----             ,  NULL                                                          AS REQ_DAY
----             ,  NULL                                                          AS REQ_TM
----             ,  COL_03                                                        AS ORD_DIV
----             ,  NULL                                                          AS SHIP_PLAN_DAY
----             ,  NULL                                                          AS REG_YN
----             ,  NULL                                                          AS RSRV_SND_DAY
----             ,  COL_12                                                        AS UNIT_DESC    
----             ,  NULL                                                          AS ADD_MOB_NO_1 
----             ,  NULL                                                          AS ADD_MOB_NO_2
----             ,  COL_06                                                        AS PAY_APRV_DAY
----             ,  REPLACE(SUBSTR(COL_07, 0, 10), '/', '')                       AS VNDR_REQ_DAY
----             ,  TRIM(REPLACE(SUBSTR(COL_07, 11), ':', ''))                    AS VNDR_REQ_TM
----             ,  COL_29                                                        AS PROD_DIV
----          FROM  RTTEMPIWJ;
--            
--            INSERT INTO RTSD0121
--             SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--              ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_06)                                                  AS CUST_NM     
--             ,  REPLACE(TRIM(COL_16),'-','')                                  AS MOB_NO
--             ,  NULL                                                          AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--              ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--              ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--              ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_04                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  NULL                                                          AS CUST_REQ
--             ,  COL_07                                                        AS PROD_CD
--             ,  COL_09                                                        AS PROD_NM
--             ,  NULL                                                            AS RSRV_DAY
--             ,  NULL                                                            AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  COL_14                                                        AS REQ_CUST_NM
--             ,  NULL                                                          AS RES_CUST_NO
--             ,  NULL                                                        AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  NULL                                                          AS ZIP_CD
--             ,  COL_01                                                        AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  COL_03                                                          AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  NULL                                                          AS ADDR_2
--             ,  COL_14                                                        AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  COL_08                                                        AS UNIT_CD
--             ,  COL_11                                                        AS ORD_CNT
--             ,  COL_12                                                          AS REMAIN_CNT
--             ,  NULL                                                          AS LOW_VNDR_CD
--             ,  NULL                                                          AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  COL_02                                                        AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  NULL                                                          AS UNIT_DESC    
--             ,  NULL                                                          AS ADD_MOB_NO_1 
--             ,  NULL                                                          AS ADD_MOB_NO_2
--             ,  NULL                                                        AS PAY_APRV_DAY
--             ,  NULL                      AS VNDR_REQ_DAY
--             ,  NULL                    AS VNDR_REQ_TM
--             ,  NULL                                                        AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(TRIM(COL_13),'-',''));
--    
--    --CJ오쇼핑플러스      
--    ELSIF v_Hshop_Tp = '10' THEN
--    
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_11)                                                  AS CUST_NM     
--             ,  REPLACE(NVL(TRIM(COL_13),TRIM(COL_12)),'-','')                AS MOB_NO
--             ,  NVL(TRIM(COL_15),COL_16)                                      AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_05                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  NULL                                                          AS CUST_REQ
--             ,  COL_03                                                        AS PROD_CD
--             ,  NULL                                                          AS PROD_NM
--             ,  REPLACE(SUBSTR(COL_06,1,10),'-','')                           AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  NULL                                                          AS REQ_CUST_NM
--             ,  COL_21                                                        AS RES_CUST_NO
--             ,  COL_12                                                        AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  REPLACE(SUBSTR(COL_09,1,10),'-','')                           AS CNCL_DAY
--             ,  REPLACE(SUBSTR(COL_09,1,10),'-','')                           AS INST_DAY
--             ,  COL_20                                                        AS JOIN_REQ
--             ,  COL_14                                                        AS ZIP_CD
--             ,  COL_01                                                        AS SEQ_NO 
--             ,  COL_02                                                        AS CH_SML
--             ,  COL_04                                                        AS SALE_DESC
--             ,  COL_07                                                        AS PRGRS_STATE
--             ,  COL_10                                                        AS CNCL_DESC
--             ,  COL_16                                                        AS ADDR_2
--             ,  COL_18                                                        AS ACCPTR_INFO
--             ,  COL_19                                                        AS SALE_PRICE
--             ,  NULL                                                          AS UNIT_CD
--             ,  NULL                                                          AS ORD_CNT
--             ,  NULL                                                          AS REMAIN_CNT
--             ,  NULL                                                          AS LOW_VNDR_CD
--             ,  NULL                                                          AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  NULL                                                          AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  COL_17                                                        AS UNIT_DESC    
--             ,  NULL                                                          AS ADD_MOB_NO_1
--             ,  NULL                                                          AS ADD_MOB_NO_2 
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(NVL(TRIM(COL_13),TRIM(COL_12)),'-',''));   
--    
--    --롯데원티비      
--    ELSIF v_Hshop_Tp = '11' THEN
--          
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_07)                                                  AS CUST_NM     
--             ,  REPLACE(NVL(TRIM(COL_09), TRIM(COL_08)),'-','')               AS MOB_NO
--             ,  TRIM(COL_45)                                                  AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_04                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  COL_14                                                        AS CONTACT_GET
--             ,  COL_16                                                        AS CUST_REQ
--             ,  COL_18                                                        AS PROD_CD
--             ,  COL_22                                                        AS PROD_NM
--             ,  REPLACE(SUBSTR(TRIM(COL_49), 0, 10), '-', '')                 AS RSRV_DAY --[20180725_01]
--             ,  REPLACE(SUBSTR(TRIM(COL_49), 12, 5), ':', '')                 AS RSRV_TM  --[20180725_01]
--             ,  NULL                                                          AS MEDIA
--             ,  NULL                                                          AS REQ_CUST_NM
--             ,  NULL                                                          AS RES_CUST_NO
--             ,  COL_08                                                        AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  COL_44                                                        AS ZIP_CD
--             ,  COL_01                                                        AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  NULL                                                          AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  NULL                                                        AS ADDR_2
--             ,  COL_12                                                        AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  COL_20                                                        AS UNIT_CD
--             ,  NULL                                                        AS ORD_CNT
--             ,  NULL                                                          AS REMAIN_CNT
--             ,  NULL                                                          AS LOW_VNDR_CD
--             ,  NULL                                                          AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY --[20180725_01]
--             ,  NULL                                                          AS REQ_TM  --[20180725_01]
--             ,  COL_05                                                        AS ORD_DIV
--             ,  COL_02                                                        AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  COL_41                                                        AS RSRV_SND_DAY
--             ,  COL_24                                                        AS UNIT_DESC    
--             ,  COL_09                                                        AS ADD_MOB_NO_1
--             ,  COL_15                                                        AS ADD_MOB_NO_2 
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  COL_17                                                        AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(NVL(TRIM(COL_09), TRIM(COL_08)),'-',''));    
--    
--    ELSIF v_Hshop_Tp = '12' THEN --[20190424_01]
--    
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_04)                                                  AS CUST_NM     
--             ,  REPLACE(TRIM(COL_05),'-','')                                  AS MOB_NO
--             ,  NULL                                                          AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_01                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  COL_06||' '||COL_07||' '||COL_08                              AS CUST_REQ
--             ,  NULL                                                          AS PROD_CD
--             ,  NULL                                                          AS PROD_NM
--             ,  TRIM(COL_02)                                                  AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  NULL                                                          AS REQ_CUST_NM
--             ,  COL_03                                                        AS RES_CUST_NO
--             ,  NULL                                                          AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  NULL                                                          AS ZIP_CD
--             ,  NULL                                                          AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  NULL                                                          AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  NULL                                                          AS ADDR_2
--             ,  NULL                                                          AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  NULL                                                          AS UNIT_CD
--             ,  NULL                                                          AS ORD_CNT
--             ,  NULL                                                          AS REMAIN_CNT
--             ,  NULL                                                          AS LOW_VNDR_CD
--             ,  NULL                                                          AS LOW_VNDR_NM
--             ,  COL_06                                                        AS TEL_REQ_DIV
--             ,  COL_07                                                        AS REQ_DAY
--             ,  COL_08                                                        AS REQ_TM
--             ,  NULL                                                          AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  NULL                                                          AS UNIT_DESC  
--             ,  NULL                                                          AS ADD_MOB_NO_1 
--             ,  NULL                                                          AS ADD_MOB_NO_2  
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
----          WHERE NOT EXISTS (SELECT 1 FROM RTSD0121 
----                                WHERE TO_CHAR(SYSDATE - 14, 'YYYYMMDD') <= PROVSN_DAY 
----                                AND PROVSN_TP = 'H' 
----                                AND MOB_NO = REPLACE(TRIM(COL_05),'-','')); 
--
--
--    ELSIF v_Hshop_Tp = '13' THEN --[20220120_01] GS MY SHOP
--    
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_07)                                                  AS CUST_NM     
--             ,  REPLACE(TRIM(COL_10),'-','')                                  AS MOB_NO
--             ,  NULL                                                          AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_01                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  NULL                                                          AS CUST_REQ
--             ,  COL_02                                                        AS PROD_CD
--             ,  COL_03                                                        AS PROD_NM
--             ,  TRIM(COL_05)                                                  AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  COL_06                                                        AS MEDIA
--             ,  COL_08                                                        AS REQ_CUST_NM
--             ,  COL_09                                                        AS RES_CUST_NO
--             ,  COL_11                                                        AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  COL_17                                                        AS ZIP_CD
--             ,  NULL                                                          AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  NULL                                                          AS PRGRS_STATE
--             ,  NULL                                                          AS CNCL_DESC
--             ,  COL_18                                                        AS ADDR_2
--             ,  NULL                                                          AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  NULL                                                          AS UNIT_CD
--             ,  NULL                                                          AS ORD_CNT
--             ,  NULL                                                          AS REMAIN_CNT
--             ,  NULL                                                          AS LOW_VNDR_CD
--             ,  NULL                                                          AS LOW_VNDR_NM
--             ,  NULL                                                          AS TEL_REQ_DIV
--             ,  NULL                                                          AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  NULL                                                          AS ORD_DIV
--             ,  NULL                                                          AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  NULL                                                          AS UNIT_DESC  
--             ,  NULL                                                          AS ADD_MOB_NO_1 
--             ,  NULL                                                          AS ADD_MOB_NO_2  
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
--    
--        ELSIF v_Hshop_Tp = '14' THEN --[20220317_01] 현대홈쇼핑
--    
--        INSERT  INTO RTSD0121
--        SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
--             ,  cs_Provsn_Tp                                                  AS PROVSN_TP
--             ,  ls_Provsn_Day                                                 AS PROVSN_DAY
--             ,  TRIM(COL_23)                                                  AS CUST_NM     
--             ,  REPLACE(TRIM(COL_26),'-','')                                  AS MOB_NO
--             ,  COL_29                                                        AS ADDR
--             ,  NULL                                                          AS MC_NM
--             ,  NULL                                                          AS SPEC_NM
--             ,  NULL                                                          AS CAR_NO
--             ,  NULL                                                          AS PATTERN_NM
--             ,  NULL                                                          AS CNT
--             ,  NULL                                                          AS PERIOD
--             ,  NULL                                                          AS REGI_AMT
--             ,  NULL                                                          AS RENT_AMT
--             ,  NULL                                                          AS PLAN_DAY
--             ,  NULL                                                          AS EMAIL_ADDR
--             ,  cs_Provsn_St                                                  AS PROVSN_ST
--             ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
--             ,  NULL                                                          AS ORD_NO
--             ,  v_Reg_Id                                                      AS REG_ID
--             ,  SYSDATE                                                       AS REG_DT
--             ,  v_Reg_Id                                                      AS CHG_ID
--             ,  SYSDATE                                                       AS CHG_DT
--             ,  v_Hshop_Tp                                                    AS HSHOP_TP
--             ,  COL_06                                                        AS HSHOP_ORDNO
--             ,  v_Air_Day                                                     AS AIR_DAY   
--             ,  v_Air_Tm                                                      AS AIR_TM
--             ,  NULL                                                          AS CONTACT_GET
--             ,  NULL                                                          AS CUST_REQ
--             ,  COL_11                                                        AS PROD_CD
--             ,  COL_12                                                        AS PROD_NM
--             ,  TRIM(COL_08)                                                  AS RSRV_DAY
--             ,  NULL                                                          AS RSRV_TM
--             ,  NULL                                                          AS MEDIA
--             ,  COL_22                                                        AS REQ_CUST_NM
--             ,  COL_05                                                        AS RES_CUST_NO
--             ,  COL_27                                                        AS ADD_MOB_NO
--             ,  NULL                                                          AS RES_CUST
--             ,  NULL                                                          AS CNCL_DAY
--             ,  NULL                                                          AS INST_DAY
--             ,  NULL                                                          AS JOIN_REQ
--             ,  COL_28                                                        AS ZIP_CD
--             ,  NULL                                                          AS SEQ_NO 
--             ,  NULL                                                          AS CH_SML
--             ,  NULL                                                          AS SALE_DESC
--             ,  COL_09                                                        AS PRGRS_STATE
--             ,  COL_10                                                        AS CNCL_DESC
--             ,  COL_29                                                        AS ADDR_2
--             ,  NULL                                                          AS ACCPTR_INFO
--             ,  NULL                                                          AS SALE_PRICE
--             ,  NULL                                                          AS UNIT_CD
--             ,  NULL                                                          AS ORD_CNT
--             ,  NULL                                                          AS REMAIN_CNT
--             ,  NULL                                                          AS LOW_VNDR_CD
--             ,  NULL                                                          AS LOW_VNDR_NM
--             ,  COL_24                                                        AS TEL_REQ_DIV
--             ,  COL_19                                                        AS REQ_DAY
--             ,  NULL                                                          AS REQ_TM
--             ,  COL_20                                                        AS ORD_DIV
--             ,  COL_21                                                        AS SHIP_PLAN_DAY
--             ,  NULL                                                          AS REG_YN
--             ,  NULL                                                          AS RSRV_SND_DAY
--             ,  NULL                                                          AS UNIT_DESC  
--             ,  COL_26                                                        AS ADD_MOB_NO_1 
--             ,  COL_27                                                        AS ADD_MOB_NO_2  
--             ,  NULL                                                          AS PAY_APRV_DAY
--             ,  NULL                                                          AS VNDR_REQ_DAY
--             ,  NULL                                                          AS VNDR_REQ_TM
--             ,  NULL                                                          AS PROD_DIV
--          FROM  RTTEMPIWJ;
--                      
--    END IF;
    
    /*
     * 업로드 건 수 확인
     */
    SELECT  COUNT(1)
      INTO  ln_cnt_exe
      FROM  RTTEMPIWJ
    ;           
    
    v_Success_code   := 0;
    v_Return_Message := ln_cnt_exe||'건 정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rttmp.p_UpHshopProvsn(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rttmp.p_UpHshopProvsn(2)', v_ErrorText, v_Return_Message);

  END p_UpHshopProvsn_OLD;
  
  PROCEDURE p_UpHshopProvsn (
      v_Hshop_Tp       IN RTSD0121.HSHOP_TP%TYPE   /* 홈쇼핑구분 [S096]       */
    , v_Provsn_Day     IN RTSD0121.PROVSN_DAY%TYPE /* 업로드일자 (YYYYMMDD)   */
    , v_Air_Day        IN RTSD0121.AIR_DAY%TYPE    /* 방송일자 (YYYYMMDD)     */
    , v_Air_Tm         IN RTSD0121.AIR_TM%TYPE     /* 방송시간 (HH24MI)       */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE     /* 등록자ID                */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    -- 상수 선언
    cs_Provsn_Tp     RTSD0121.PROVSN_TP%TYPE     := 'H';    --가계약구분=홈쇼핑 [S092]
    cs_Provsn_St     RTSD0121.PROVSN_ST%TYPE     := '20';   --가계약상태=접수 [S093]
    cs_Provsn_St_Dtl RTSD0121.PROVSN_ST_DTL%TYPE := '2010'; --가계약세부상태=컨택예정 [S094]
    
    -- 변수 선언
    ls_Provsn_Day    RTSD0121.PROVSN_DAY%TYPE;              --업로드일자 
    ln_cnt_exe       NUMBER DEFAULT 0;                      --수행건수
    ln_seq           NUMBER DEFAULT 0;                      --일련번호
    
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 홈쇼핑구분 
    IF (TRIM(v_Hshop_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S096', v_Hshop_Tp)) THEN
        v_Return_Message := '홈쇼핑구분('||v_Hshop_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 방송일자
    IF (v_Hshop_Tp IN ('02','03','04','05','06')) AND (TRIM(v_Air_Day) IS NULL) THEN
        v_Return_Message := '방송일자('||v_Air_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 방송시간
    IF (v_Hshop_Tp IN ('02','03','04','05','06')) AND (TRIM(v_Air_Tm) IS NULL) THEN
        v_Return_Message := '방송시간('||v_Air_Tm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 공백행 삭제(Excel 업로드 과정에서 발생 가능)
     */ 
    DELETE  RTTEMPIWJ
     WHERE  1=1
       AND  TRIM(COL_01) IS NULL AND TRIM(COL_02) IS NULL
    ;
    
    -- 업로드일자 초기화
    IF TRIM(v_Provsn_Day) IS NULL OR TRIM(v_Provsn_Day) = '' THEN
        ls_Provsn_Day := TO_CHAR(SYSDATE, 'YYYYMMDD');
    ELSE
        ls_Provsn_Day := v_Provsn_Day;
    END IF;
    
    SELECT  TO_NUMBER(NVL(SUBSTR(MAX(PROVSN_NO),10),0))
      INTO  ln_seq
      FROM  RTSD0121
     WHERE  PROVSN_NO LIKE cs_Provsn_Tp||ls_Provsn_Day||'%'
    ;
    
    /*
     * 업로드
     */
    INSERT  INTO RTSD0121
    SELECT  cs_Provsn_Tp||ls_Provsn_Day||TO_CHAR(ln_seq+ROWNUM, 'FM000000') AS PROVSN_NO
         ,  cs_Provsn_Tp                                                  AS PROVSN_TP
         ,  ls_Provsn_Day                                                 AS PROVSN_DAY
         ,  TRIM(COL_01)                                                  AS CUST_NM     
         ,  REPLACE(TRIM(COL_02),'-','')                                  AS MOB_NO
         ,  COL_04                                                        AS ADDR
         ,  NULL                                                          AS MC_NM
         ,  NULL                                                          AS SPEC_NM
         ,  NULL                                                          AS CAR_NO
         ,  NULL                                                          AS PATTERN_NM
         ,  NULL                                                          AS CNT
         ,  NULL                                                          AS PERIOD
         ,  NULL                                                          AS REGI_AMT
         ,  NULL                                                          AS RENT_AMT
         ,  NULL                                                          AS PLAN_DAY
         ,  NULL                                                          AS EMAIL_ADDR
         ,  cs_Provsn_St                                                  AS PROVSN_ST
         ,  cs_Provsn_St_Dtl                                              AS PROVSN_ST_DTL
         ,  NULL                                                          AS ORD_NO
         ,  v_Reg_Id                                                      AS REG_ID
         ,  SYSDATE                                                       AS REG_DT
         ,  v_Reg_Id                                                      AS CHG_ID
         ,  SYSDATE                                                       AS CHG_DT
         ,  v_Hshop_Tp                                                    AS HSHOP_TP
         ,  NULL                                                          AS HSHOP_ORDNO
         ,  v_Air_Day                                                     AS AIR_DAY   
         ,  v_Air_Tm                                                      AS AIR_TM
         ,  NULL                                                          AS CONTACT_GET
         ,  NULL                                                          AS CUST_REQ
         ,  NULL                                                          AS PROD_CD
         ,  NULL                                                          AS PROD_NM
         ,  NULL                                                          AS RSRV_DAY
         ,  NULL                                                          AS RSRV_TM
         ,  NULL                                                          AS MEDIA
         ,  NULL                                                          AS REQ_CUST_NM
         ,  NULL                                                          AS RES_CUST_NO
         ,  REPLACE(TRIM(COL_03),'-','')                                  AS ADD_MOB_NO
         ,  NULL                                                          AS RES_CUST
         ,  NULL                                                          AS CNCL_DAY
         ,  NULL                                                          AS INST_DAY
         ,  NULL                                                          AS JOIN_REQ
         ,  NULL                                                          AS ZIP_CD
         ,  NULL                                                          AS SEQ_NO 
         ,  NULL                                                          AS CH_SML
         ,  NULL                                                          AS SALE_DESC
         ,  NULL                                                          AS PRGRS_STATE
         ,  NULL                                                          AS CNCL_DESC
         ,  NULL                                                          AS ADDR_2
         ,  NULL                                                          AS ACCPTR_INFO
         ,  NULL                                                          AS SALE_PRICE
         ,  NULL                                                          AS UNIT_CD
         ,  NULL                                                          AS ORD_CNT
         ,  NULL                                                          AS REMAIN_CNT
         ,  NULL                                                          AS LOW_VNDR_CD
         ,  NULL                                                          AS LOW_VNDR_NM
         ,  NULL                                                          AS TEL_REQ_DIV
         ,  NULL                                                          AS REQ_DAY
         ,  NULL                                                          AS REQ_TM
         ,  NULL                                                          AS ORD_DIV
         ,  NULL                                                          AS SHIP_PLAN_DAY
         ,  NULL                                                          AS REG_YN
         ,  NULL                                                          AS RSRV_SND_DAY
         ,  NULL                                                          AS UNIT_DESC  
         ,  NULL                                                          AS ADD_MOB_NO_1 
         ,  NULL                                                          AS ADD_MOB_NO_2  
         ,  NULL                                                          AS PAY_APRV_DAY
         ,  NULL                                                          AS VNDR_REQ_DAY
         ,  NULL                                                          AS VNDR_REQ_TM
         ,  NULL                                                          AS PROD_DIV
         ,  NULL
         ,  NULL
      FROM  RTTEMPIWJ;
    
    /*
     * 업로드 건 수 확인
     */
    SELECT  COUNT(1)
      INTO  ln_cnt_exe
      FROM  RTTEMPIWJ
    ;           
    
    v_Success_code   := 0;
    v_Return_Message := ln_cnt_exe||'건 정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rttmp.p_UpHshopProvsn(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rttmp.p_UpHshopProvsn(2)', v_ErrorText, v_Return_Message);

  END p_UpHshopProvsn;
  
END PKG_RTMANUAL;