CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0200 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0200
   PURPOSE   SAFE KEY 발급(WEB) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Count
  *****************************************************************************/
  FUNCTION f_sRtsd0200Count(
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,         /*SAFE_KEY            */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE            /*구분(C:생성,R:조회) */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0200
    WHERE   SAFE_KEY = v_Safe_Key
    AND     CRE_DAY  = TO_CHAR(SYSDATE,'YYYYMMDD')
    AND     CRE_TP   = v_Cre_Tp;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0200Count;

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Birth_Day      IN RTSD0200.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Cust_Nm        IN RTSD0200.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTSD0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Gender_Cd      IN RTSD0200.GENDER_CD%TYPE,      /*성별                  */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SAFE_KEY,                  /*SAFE_KEY            */
            A.CRE_DAY,                   /*생성일              */
            A.CRE_TP,                    /*구분(C:생성,R:조회) */
            A.BIRTH_DAY,                 /*법정생년월일        */
            A.CUST_NM,                   /*고객명/법인명       */
            A.MOB_NO,                    /*휴대폰번호          */
            A.GENDER_CD,                 /*성별                */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0200 A
    WHERE   A.SAFE_KEY  = DECODE(v_Safe_Key , NULL, A.SAFE_KEY , v_Safe_Key)
    AND     A.CRE_DAY   = DECODE(v_Cre_Day  , NULL, A.CRE_DAY  , v_Cre_Day)
    AND     A.CRE_TP    = DECODE(v_Cre_Tp   , NULL, A.CRE_TP   , v_Cre_Tp)
    AND     A.BIRTH_DAY = DECODE(v_Birth_Day, NULL, A.BIRTH_DAY, v_Birth_Day)
    AND     A.CUST_NM   = DECODE(v_Cust_Nm  , NULL, A.CUST_NM  , v_Cust_Nm)
    AND     A.MOB_NO    = DECODE(v_Mob_No   , NULL, A.MOB_NO   , v_Mob_No)
    AND     A.GENDER_CD = DECODE(v_Gender_Cd, NULL, A.GENDER_CD, v_Gender_Cd)
    AND     A.REG_ID    = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtsd0200;

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0200 (
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Birth_Day      IN RTSD0200.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Cust_Nm        IN RTSD0200.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTSD0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Gender_Cd      IN RTSD0200.GENDER_CD%TYPE,      /*성별                  */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0200 (
            SAFE_KEY,
            CRE_DAY,
            CRE_TP,
            BIRTH_DAY,
            CUST_NM,
            MOB_NO,
            GENDER_CD,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Safe_Key,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
            v_Cre_Tp,
            v_Birth_Day,
            v_Cust_Nm,
            v_Mob_No,
            v_Gender_Cd,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0200;

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0200 (
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Birth_Day      IN RTSD0200.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Cust_Nm        IN RTSD0200.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTSD0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Gender_Cd      IN RTSD0200.GENDER_CD%TYPE,      /*성별                  */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0200
    SET    BIRTH_DAY = v_Birth_Day,
           CUST_NM   = v_Cust_Nm,
           MOB_NO    = v_Mob_No,
           GENDER_CD = v_Gender_Cd,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  SAFE_KEY  = v_Safe_Key
    AND    CRE_DAY   = v_Cre_Day
    AND    CRE_TP    = v_Cre_Tp;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0200;

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0200 (
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0200
    WHERE  SAFE_KEY  = v_Safe_Key
    AND    CRE_DAY   = v_Cre_Day
    AND    CRE_TP    = v_Cre_Tp;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0200.f_DeleteRtsd0200(2)', 'SAFE_KEY', v_Safe_Key);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0200.f_DeleteRtsd0200(2)', '생성일', v_Cre_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0200.f_DeleteRtsd0200(2)', '구분(C:생성,R:조회)', v_Cre_Tp);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0200.f_DeleteRtsd0200(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0200;

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0200 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Birth_Day      IN RTSD0200.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Cust_Nm        IN RTSD0200.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTSD0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Gender_Cd      IN RTSD0200.GENDER_CD%TYPE,      /*성별                  */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF TRIM(v_Safe_Key) IS NULL THEN
        v_Return_Message := 'SAFE_KEY('||v_Safe_Key||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Cre_Day) THEN
        v_Return_Message := '생성일('||v_Cre_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cre_Tp) IS NULL) OR (TRIM(v_Cre_Tp) NOT IN ('C','R')) THEN -- CD_GRP_CD='???'
        v_Return_Message := '구분(C:생성,R:조회)('||v_Safe_Key||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Gender_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S026', v_Gender_Cd)) THEN
        v_Return_Message := '성별('||v_Gender_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0200Count(v_Safe_Key,  v_Cre_Tp) THEN -- test sysdate - jaemin수정

        IF 0 != f_InsertRtsd0200(v_Safe_Key,  v_Cre_Day, v_Cre_Tp, v_Birth_Day,
                                 v_Cust_Nm, v_Mob_No, v_Gender_Cd, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := 'SAFE KEY 발급(WEB) 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 != f_UpdateRtsd0200(v_Safe_Key, v_Cre_Day, v_Cre_Tp, v_Birth_Day,
                                 v_Cust_Nm, v_Mob_No, v_Gender_Cd, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := 'SAFE KEY 발급(WEB) 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0200.p_IUDRtsd0200(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0200.p_IUDRtsd0200(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0200;
  
  /*****************************************************************************
  --SAFE KEY 확인 : return -> SAFE_KEY
  *****************************************************************************/
  FUNCTION f_sRtsd0200_safeKeyConfirm(
    v_custNm          IN RTSD0200.CUST_NM%TYPE,         /*고객명/법인명       */
    v_birthDay        IN RTSD0200.BIRTH_DAY%TYPE,       /*법정생년월일        */
    v_genderCd        IN RTSD0200.GENDER_CD%TYPE,       /*성별                */
    v_mobNo           IN RTSD0200.MOB_NO%TYPE           /*휴대폰번호          */
    ) RETURN VARCHAR2 IS

    v_safe_key   RTSD0200.SAFE_KEY%TYPE DEFAULT '';

  BEGIN
      
      /*
      SELECT  SAFE_KEY
      INTO    v_safe_key
      FROM    RTSD0200
      WHERE   CUST_NM   = v_custNm
      AND     BIRTH_DAY = v_birthDay
      AND     GENDER_CD = v_genderCd
      AND     MOB_NO    = v_mobNo
      AND     CRE_DAY   = TO_CHAR(SYSDATE,'YYYYMMDD');
      */
      
      /* 당일 조회한 safekey 만 사용하는 것을 최근 safekey 로 변경-2019.02.12-K.J.U */ 
--      SELECT  NVL(SAFE_KEY, '0') SAFEKEY
--      INTO    v_safe_key
--      FROM    ((SELECT 'A' GUBUN,  SAFE_KEY, CRE_DAY  
--               FROM    RTSD0200
--               WHERE   CUST_NM   = v_custNm
--               AND     BIRTH_DAY = v_birthDay
--               AND     GENDER_CD = v_genderCd
--               AND     MOB_NO    = v_mobNo
--               UNION ALL
--               SELECT 'B' GUBUN, SAFEKEY, TO_CHAR(SYSDATE, 'YYYYMMDD') CRE_DAY 
--               FROM RTSD0100 
--               WHERE CUST_NO = v_CustNo)
--               ORDER BY GUBUN, CRE_DAY DESC)
--      WHERE ROWNUM = 1;

      SELECT  SAFE_KEY
      INTO    v_safe_key
      FROM    (SELECT SAFE_KEY  
               FROM    RTSD0200
               WHERE   CUST_NM   = v_custNm
               AND     BIRTH_DAY = v_birthDay
               AND     GENDER_CD = v_genderCd
               AND     MOB_NO    = v_mobNo)
      WHERE ROWNUM = 1;

      RETURN v_safe_key;

    EXCEPTION
    WHEN  NO_DATA_FOUND THEN
        RETURN '0';
    WHEN OTHERS  THEN
        RETURN 'ERROR';

  END f_sRtsd0200_safeKeyConfirm;  
  
  /*****************************************************************************
  --SAFE KEY 확인 : return -> SAFE_KEY
  *****************************************************************************/
  FUNCTION f_sRtsd0200_safeKeyConfirmNew(
    v_custNm          IN RTSD0200.CUST_NM%TYPE,         /*고객명/법인명       */
    v_birthDay        IN RTSD0200.BIRTH_DAY%TYPE,       /*법정생년월일        */
    v_genderCd        IN RTSD0200.GENDER_CD%TYPE,       /*성별                */
    v_mobNo           IN RTSD0200.MOB_NO%TYPE,           /*휴대폰번호          */
    v_custNo           IN RTSD0100.CUST_NO%TYPE           /*고객번호          */
    ) RETURN VARCHAR2 IS

    v_safe_key   RTSD0200.SAFE_KEY%TYPE DEFAULT '';

  BEGIN
      
      /*
      SELECT  SAFE_KEY
      INTO    v_safe_key
      FROM    RTSD0200
      WHERE   CUST_NM   = v_custNm
      AND     BIRTH_DAY = v_birthDay
      AND     GENDER_CD = v_genderCd
      AND     MOB_NO    = v_mobNo
      AND     CRE_DAY   = TO_CHAR(SYSDATE,'YYYYMMDD');
      */
      
      /* 당일 조회한 safekey 만 사용하는 것을 최근 safekey 로 변경-2019.02.12-K.J.U */ 
      SELECT  NVL(SAFE_KEY, '0') SAFEKEY
      INTO    v_safe_key
      FROM    ((SELECT 'A' GUBUN,  SAFE_KEY, CRE_DAY  
               FROM    RTSD0200
               WHERE   CUST_NM   = v_custNm
               AND     BIRTH_DAY = v_birthDay
               AND     GENDER_CD = v_genderCd
               AND     MOB_NO    = v_mobNo
               UNION ALL
               SELECT 'B' GUBUN, SAFEKEY, TO_CHAR(SYSDATE, 'YYYYMMDD') CRE_DAY 
               FROM RTSD0100 
               WHERE CUST_NO = v_CustNo)
               ORDER BY GUBUN, CRE_DAY DESC)
      WHERE ROWNUM = 1;

      RETURN v_safe_key;

    EXCEPTION
    WHEN  NO_DATA_FOUND THEN
        RETURN '0';
    WHEN OTHERS  THEN
        RETURN 'ERROR';

  END f_sRtsd0200_safeKeyConfirmNew;  
  
END Pkg_Rtsd0200;