CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0401 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0401
    PURPOSE     방문장착 정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-24  wjim            [20181122_01] Created this package body.
    1.1     2019-01-23  wjim            [20190123_01] 방문장착 정보 목록조회 조회항목 추가
    1.2     2019-01-24  wjim            [20190124_01] 방문장착 정보 목록조회 조회조건 추가
*******************************************************************************/
  /*****************************************************************************
  -- 방문장착 정보 Count
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package body.
  *****************************************************************************/
  FUNCTION f_sRtsd0401Count(
    v_Ord_No         IN RTSD0401.ORD_NO%TYPE            /*계약번호            */
  ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;
    
  BEGIN

    SELECT  COUNT(*)
      INTO  v_curr_cunt
      FROM  RTSD0106
     WHERE  ORD_NO = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0401Count;
  
  
  /*****************************************************************************
  -- 방문장착 정보 목록 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-12-01  wjim            [20181122_01] Created this package body.
    1.1     2019-01-23  wjim            [20190123_01] 계약접수일자 추가
    1.2     2019-01-24  wjim            [20190124_01] 조회조건 추가
                                        - 계약접수일자(from~to)
  *****************************************************************************/
  PROCEDURE p_sRTSD0401 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Agency_Cd       IN RTSD0401.AGENCY_CD%TYPE     /*대리점번호           */
    , v_Proc_Day_F      IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자(from)   */   
    , v_Proc_Day_T      IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자(to)     */
    , v_Stat_Cd         IN RTSD0401.STAT_CD%TYPE       /*상태코드(S105)       */
    , v_Stat_Dtl_Cd     IN RTSD0401.STAT_DTL_CD%TYPE   /*상태세부코드(S106)   */    
    , v_Cust_Nm         IN RTSD0100.CUST_NM%TYPE       /*고객명               */
    , v_Mob_No          IN RTSD0401.MOB_NO%TYPE        /*휴대폰번호           */
    , v_Ord_No          IN RTSD0401.ORD_NO%TYPE        /*계약번호             */
    , v_Ord_Day_F       IN RTSD0104.ORD_Day%TYPE       /*계약접수일자(from)   */
    , v_Ord_Day_T       IN RTSD0104.ORD_Day%TYPE       /*계약접수일자(from)   */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.AGENCY_CD
         ,  E1.AGENCY_NM
         ,  A1.ORD_NO
         ,  B1.STAT_CD     AS ORD_STAT_CD
         ,  ZA.CD_NM       AS ORD_STAT_NM
         ,  B1.CUST_NO
         ,  C1.CUST_NM
         ,  B1.CAR_NO
         ,  B1.MAKER_CD
         ,  ZB.CD_NM       AS MAKER_NM
         ,  B1.MODEL_CD
         ,  ZC.CD_NM       AS MODEL_NM
         ,  B1.CONTENTS_CD
         ,  ZD.CD_NM       AS CONTENTS_NM
         ,  D1.MAT_CD
         ,  F1.MAT_NM
         ,  D1.FR_CD
         ,  ZE.CD_NM       AS FR_NM
         ,  D1.CNT_CD
         ,  A1.REQ_DAY
         ,  A1.PROC_DAY
         ,  A1.PROC_TM
         ,  A1.MOB_NO
         ,  A1.BLD_MNG_NO
         ,  A1.POSCD
         ,  A1.ADDR1
         ,  A1.ADDR2
         ,  A1.STAT_CD
         ,  ZF.CD_NM       AS STAT_NM
         ,  A1.STAT_DTL_CD
         ,  ZG.CD_NM       AS STAT_DTL_NM
         ,  A1.MEMO
         ,  A1.REG_ID
         ,  A1.REG_DT
         ,  A1.CHG_ID
         ,  A1.CHG_DT
         ,  B1.ORD_DAY
      FROM  RTSD0401 A1
         ,  RTSD0104 B1
         ,  RTSD0100 C1
         ,  RTSD0106 D1
         ,  RTSD0007 E1
         ,  RTSD0005 F1     
         ,  RTCM0051 ZA
         ,  RTCM0051 ZB
         ,  RTCM0051 ZC
         ,  RTCM0051 ZD
         ,  RTCM0051 ZE
         ,  RTCM0051 ZF
         ,  RTCM0051 ZG
     WHERE  1=1
       AND  A1.AGENCY_CD   = DECODE(v_Agency_Cd  , NULL, A1.AGENCY_CD  , v_Agency_Cd    ) 
       AND  (v_Proc_Day_F IS NULL OR A1.PROC_DAY  BETWEEN v_Proc_Day_F AND v_Proc_Day_T )
       AND  A1.STAT_CD     = DECODE(v_Stat_Cd    , NULL, A1.STAT_CD    , v_Stat_Cd      )
       AND  A1.STAT_DTL_CD = DECODE(v_Stat_Dtl_Cd, NULL, A1.STAT_DTL_CD, v_Stat_Dtl_Cd  )
       AND  (v_Cust_Nm    IS NULL OR C1.CUST_NM   LIKE '%'||REPLACE(v_Cust_Nm, ' ' ,'')||'%')
       AND  REPLACE(A1.MOB_NO, '-', '') = DECODE(v_Mob_No, NULL, REPLACE(A1.MOB_NO, '-', '') , REPLACE(v_Mob_No, '-', ''))
       AND  A1.ORD_NO       = DECODE(v_Ord_No    , NULL, A1.ORD_NO     , v_Ord_No       )
       AND  (v_Ord_Day_F IS NULL OR B1.ORD_DAY    BETWEEN v_Ord_Day_F AND v_Ord_Day_T   )
       AND  A1.ORD_NO       = B1.ORD_NO(+)
       AND  B1.CUST_NO      = C1.CUST_NO(+)   
       AND  A1.ORD_NO       = D1.ORD_NO(+)
       AND  A1.AGENCY_CD    = E1.AGENCY_CD(+)
       AND  D1.MAT_CD       = F1.MAT_CD(+)
       AND  B1.STAT_CD      = ZA.CD(+)
       AND  ZA.CD_GRP_CD(+) = 'S032'
       AND  B1.MAKER_CD     = ZB.CD(+)
       AND  ZB.CD_GRP_CD(+) = 'S001'
       AND  B1.MODEL_CD     = ZC.CD(+)
       AND  ZC.CD_GRP_CD(+) = 'S002'
       AND  B1.CONTENTS_CD  = ZD.CD(+)
       AND  ZD.CD_GRP_CD(+) = 'S003'
       AND  D1.FR_CD        = ZE.CD(+)
       AND  ZE.CD_GRP_CD(+) = 'S004'
       AND  A1.STAT_CD      = ZF.CD(+)
       AND  ZF.CD_GRP_CD(+) = 'S105'
       AND  A1.STAT_DTL_CD  = ZG.CD(+)
       AND  ZG.CD_GRP_CD(+) = 'S106'
     ORDER  BY A1.AGENCY_CD
         ,  A1.PROC_DAY
         ,  A1.PROC_TM
    ; 

  END p_sRTSD0401; 
  
  
  /*****************************************************************************
  -- 방문장착 정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package body.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0401 (
      v_Ord_No         IN RTSD0401.ORD_NO%TYPE        /*계약번호              */
    , v_Agency_Cd      IN RTSD0401.AGENCY_CD%TYPE     /*대리점번호            */
    , v_Req_Day        IN RTSD0401.REQ_DAY%TYPE       /*장착요청일자          */
    , v_Proc_Day       IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자          */
    , v_Proc_Tm        IN RTSD0401.PROC_TM%TYPE       /*장착협의시간          */
    , v_Mob_No         IN RTSD0401.MOB_NO%TYPE        /*연락처                */
    , v_Bld_Mng_No     IN RTSD0401.BLD_MNG_NO%TYPE    /*건물번호              */
    , v_Poscd          IN RTSD0401.POSCD%TYPE         /*우편번호              */
    , v_Addr1          IN RTSD0401.ADDR1%TYPE         /*주소                  */
    , v_Addr2          IN RTSD0401.ADDR2%TYPE         /*상세주소              */
    , v_Stat_Cd        IN RTSD0401.STAT_CD%TYPE       /*상태코드(S105)        */
    , v_Stat_Dtl_Cd    IN RTSD0401.STAT_DTL_CD%TYPE   /*상태세부코드(S106)    */
    , v_Memo           IN RTSD0401.MEMO%TYPE          /*메모                  */
    , v_Reg_Id         IN RTSD0401.REG_ID%TYPE        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTSD0401 (
          ORD_NO
        , AGENCY_CD
        , REQ_DAY
        , PROC_DAY
        , PROC_TM
        , MOB_NO
        , BLD_MNG_NO
        , POSCD
        , ADDR1
        , ADDR2
        , STAT_CD
        , STAT_DTL_CD
        , MEMO
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT            
    ) VALUES (
          v_Ord_No    
        , v_Agency_Cd 
        , v_Req_Day   
        , v_Proc_Day  
        , v_Proc_Tm   
        , v_Mob_No    
        , v_Bld_Mng_No
        , v_Poscd     
        , v_Addr1     
        , v_Addr2     
        , v_Stat_Cd 
        , v_Stat_Dtl_Cd  
        , v_Memo      
        , v_Reg_Id            
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0401;
  
  
  /*****************************************************************************
  -- 방문장착 정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package body.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0401 (
      v_Ord_No         IN RTSD0401.ORD_NO%TYPE        /*계약번호              */
    , v_Agency_Cd      IN RTSD0401.AGENCY_CD%TYPE     /*대리점번호            */
    , v_Req_Day        IN RTSD0401.REQ_DAY%TYPE       /*장착요청일자          */
    , v_Proc_Day       IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자          */
    , v_Proc_Tm        IN RTSD0401.PROC_TM%TYPE       /*장착협의시간          */
    , v_Mob_No         IN RTSD0401.MOB_NO%TYPE        /*연락처                */
    , v_Bld_Mng_No     IN RTSD0401.BLD_MNG_NO%TYPE    /*건물번호              */
    , v_Poscd          IN RTSD0401.POSCD%TYPE         /*우편번호              */
    , v_Addr1          IN RTSD0401.ADDR1%TYPE         /*주소                  */
    , v_Addr2          IN RTSD0401.ADDR2%TYPE         /*상세주소              */
    , v_Stat_Cd        IN RTSD0401.STAT_CD%TYPE       /*상태코드(S105)        */
    , v_Stat_Dtl_Cd    IN RTSD0401.STAT_DTL_CD%TYPE   /*상태세부코드(S106)    */
    , v_Memo           IN RTSD0401.MEMO%TYPE          /*메모                  */
    , v_Reg_Id         IN RTSD0401.REG_ID%TYPE        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS 
  BEGIN

    UPDATE RTSD0401
       SET AGENCY_CD   = v_Agency_Cd
         , REQ_DAY     = v_Req_Day
         , PROC_DAY    = v_Proc_Day
         , PROC_TM     = v_Proc_Tm
         , MOB_NO      = v_Mob_No   
         , BLD_MNG_NO  = v_Bld_Mng_No
         , POSCD       = v_Poscd
         , ADDR1       = v_Addr1
         , ADDR2       = v_Addr2
         , STAT_CD     = v_Stat_Cd
         , STAT_DTL_CD = v_Stat_Dtl_Cd
         , MEMO        = v_Memo
         , CHG_ID      = v_Reg_Id
         , CHG_DT      = SYSDATE  
    WHERE  ORD_NO      = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0401;
  
  
  /*****************************************************************************
  -- 방문장착 정보 관리(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package body.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0401 (
      v_Comm_Dvsn      IN CHAR                        /*처리구분(I,U,D)       */
    , v_Ord_No         IN RTSD0401.ORD_NO%TYPE        /*계약번호              */
    , v_Agency_Cd      IN RTSD0401.AGENCY_CD%TYPE     /*대리점번호            */
    , v_Req_Day        IN RTSD0401.REQ_DAY%TYPE       /*장착요청일자          */
    , v_Proc_Day       IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자          */
    , v_Proc_Tm        IN RTSD0401.PROC_TM%TYPE       /*장착협의시간          */
    , v_Mob_No         IN RTSD0401.MOB_NO%TYPE        /*연락처                */
    , v_Bld_Mng_No     IN RTSD0401.BLD_MNG_NO%TYPE    /*건물번호              */
    , v_Poscd          IN RTSD0401.POSCD%TYPE         /*우편번호              */
    , v_Addr1          IN RTSD0401.ADDR1%TYPE         /*주소                  */
    , v_Addr2          IN RTSD0401.ADDR2%TYPE         /*상세주소              */
    , v_Stat_Cd        IN RTSD0401.STAT_CD%TYPE       /*상태코드(S105)        */
    , v_Stat_Dtl_Cd    IN RTSD0401.STAT_DTL_CD%TYPE   /*상태세부코드(S106)    */
    , v_Memo           IN RTSD0401.MEMO%TYPE          /*메모                  */
    , v_Reg_Id         IN RTSD0401.REG_ID%TYPE        /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS 
  e_Error EXCEPTION;
  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0401(
              v_Ord_No    
            , v_Agency_Cd 
            , v_Req_Day   
            , v_Proc_Day  
            , v_Proc_Tm   
            , TRIM(REPLACE(v_Mob_No, '-', ''))    
            , v_Bld_Mng_No
            , v_Poscd     
            , v_Addr1     
            , v_Addr2     
            , v_Stat_Cd   
            , v_Stat_Dtl_Cd
            , v_Memo      
            , v_Reg_Id         
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN
            
        IF 0 != f_UpdateRtsd0401(
              v_Ord_No    
            , v_Agency_Cd 
            , v_Req_Day   
            , v_Proc_Day  
            , v_Proc_Tm   
            , v_Mob_No    
            , v_Bld_Mng_No
            , v_Poscd     
            , v_Addr1     
            , v_Addr2     
            , v_Stat_Cd
            , v_Stat_Dtl_Cd   
            , v_Memo      
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검 정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0402.f_InsertRtsd0402(v_Ord_No, v_ErrorText) THEN
        v_Return_Message := '방문장착 이력정보 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0401.p_IUDRtsd0401(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0401.p_IUDRtsd0401(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0401;
  

  /*****************************************************************************
  -- 방문장착 정보 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-24  wjim            [20181122_01] Created this package body.
  *****************************************************************************/
  PROCEDURE p_sRTSD0401CountPerStat (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Agency_Cd       IN RTSD0401.AGENCY_CD%TYPE      /* 대리점번호         */   
    , v_Proc_Day_F      IN RTSD0401.PROC_DAY%TYPE       /* 장착협의일자(from) */   
    , v_Proc_Day_T      IN RTSD0401.PROC_DAY%TYPE       /* 장착협의일자(to)   */   
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A3.CAL_DAY
         ,  A3.CAL_DAT
         ,  NVL(B3.CNT_SUM , 0) AS CNT_SUM
         ,  NVL(B3.CNT_REAL, 0) AS CNT_REAL
         ,  NVL(B3.CNT_01  , 0) AS CNT_01
         ,  NVL(B3.CNT_02  , 0) AS CNT_02
         ,  NVL(B3.CNT_03  , 0) AS CNT_03
         ,  NVL(B3.CNT_04  , 0) AS CNT_04
      FROM  (
                SELECT  TO_CHAR(DATES, 'YYYYMMDD') AS CAL_DAY
                     ,  TO_CHAR(DATES, 'DY')       AS CAL_DAT
                  FROM  (     
                            SELECT  TO_DATE(v_Proc_Day_F, 'YYYYMMDD') + LEVEL - 1 AS DATES
                                  FROM  DUAL
                               CONNECT  BY LEVEL <= TO_DATE(v_Proc_Day_T, 'YYYYMMDD') - TO_DATE(v_Proc_Day_F, 'YYYYMMDD') + 1
                        )
            ) A3
         ,  (
                SELECT  A2.PROC_DAY
                     ,  SUM(A2.CNT_VISIT)                              AS CNT_SUM
                     ,  SUM(DECODE(A2.STAT_CD, '04', 0, A2.CNT_VISIT)) AS CNT_REAL
                     ,  SUM(DECODE(A2.STAT_CD, '01', A2.CNT_VISIT, 0)) AS CNT_01
                     ,  SUM(DECODE(A2.STAT_CD, '02', A2.CNT_VISIT, 0)) AS CNT_02
                     ,  SUM(DECODE(A2.STAT_CD, '03', A2.CNT_VISIT, 0)) AS CNT_03
                     ,  SUM(DECODE(A2.STAT_CD, '04', A2.CNT_VISIT, 0)) AS CNT_04
                  FROM  (
                            SELECT  A1.PROC_DAY
                                 ,  A1.STAT_CD
                                 ,  COUNT(A1.ORD_NO) AS CNT_VISIT
                              FROM  RTSD0401 A1
                             WHERE  1=1
                               AND  A1.AGENCY_CD = DECODE(v_Agency_Cd, NULL, A1.AGENCY_CD, v_Agency_Cd)  
                               AND  (v_Proc_Day_F IS NULL OR A1.PROC_DAY BETWEEN v_Proc_Day_F AND v_Proc_Day_T)
                             GROUP  BY A1.PROC_DAY
                                 ,  A1.STAT_CD
                        ) A2
                 WHERE  1=1
                 GROUP  BY A2.PROC_DAY 
            ) B3
     WHERE  A3.CAL_DAY = B3.PROC_DAY(+)
     ORDER  BY A3.CAL_DAY;

  END p_sRTSD0401CountPerStat;
        
END Pkg_Rtsd0401;
/