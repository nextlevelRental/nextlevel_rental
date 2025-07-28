CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0423 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0423
    PURPOSE     택배사정보 업데이트
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
*******************************************************************************/
   
  /*****************************************************************************
  -- 택배사코드 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0423Count(
    v_Logistics_Cd IN  RTSD0423.LOGISTICS_CD%TYPE            /*택배사코드        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0423
    WHERE   LOGISTICS_CD   = v_Logistics_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0423Count;
  
  /*****************************************************************************
  --택배사코드명
  *****************************************************************************/
  FUNCTION f_sRtsd0423Code(
      v_Logistics_Nm             IN RTSD0423.LOGISTICS_NM%TYPE                  /*택배사명              */
    ) RETURN VARCHAR IS
    
    v_Cd   RTSD0423.LOGISTICS_CD%TYPE DEFAULT NULL;
  BEGIN

    SELECT  LOGISTICS_CD
    INTO    v_Cd
    FROM    RTSD0423
    WHERE   LOGISTICS_NM = v_Logistics_Nm;

    RETURN v_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0423Code;
  
  /*****************************************************************************
  --택배사코드명
  *****************************************************************************/
  FUNCTION f_sRtsd0423CodeName(
      v_Logistics_Cd             IN RTSD0423.LOGISTICS_CD%TYPE                  /*택배사명              */
    ) RETURN VARCHAR IS
    
    v_CdNm   RTSD0423.LOGISTICS_NM%TYPE DEFAULT NULL;
  BEGIN

    SELECT  LOGISTICS_NM
    INTO    v_CdNm
    FROM    RTSD0423
    WHERE   LOGISTICS_CD = v_Logistics_Cd;

    RETURN v_CdNm;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0423CodeName;
         
  /*****************************************************************************
  -- 택배사정보(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-04  kstka            [20220704_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0423 (
      v_Comm_Dvsn                    IN CHAR                                        /*처리구분(I,U,D)      */
    , v_Logistics_Cd                 IN RTSD0423.LOGISTICS_CD%TYPE                  /*택배사코드           */
    , v_Logistics_Nm                 IN RTSD0423.LOGISTICS_NM%TYPE                  /*택배사명             */
    , v_Logistics_International      IN RTSD0423.LOGISTICS_INTERNATIONAL%TYPE       /*국제택배여부          */
    , v_Reg_Id          IN RTSD0423.REG_ID%TYPE                  /*등록자 ID             */
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

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0423(
              v_Logistics_Cd
            , v_Logistics_Nm  
            , v_Logistics_International
            , v_Reg_Id         
            , v_ErrorText
        ) THEN
            v_Return_Message := '택배사 정보 등록 실패!!!'||'-'||v_ErrorText || '[' || v_Logistics_Cd || '::' || v_Logistics_Nm || '::' || v_Logistics_International || ']';
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn IN ('U') THEN
            
        IF 0 != f_UpdateRtsd0423(
              v_Logistics_Cd
            , v_Logistics_Nm  
            , v_Logistics_International   
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '택배사 정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);

  END p_IUDRtsd0423;
   
  /*****************************************************************************
  -- 택배사정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-04  kstka            [20220704_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0423 (
      v_Logistics_Cd                 IN RTSD0423.LOGISTICS_CD%TYPE                  /*택배사코드           */
    , v_Logistics_Nm                 IN RTSD0423.LOGISTICS_NM%TYPE                  /*택배사명             */
    , v_Logistics_International      IN RTSD0423.LOGISTICS_INTERNATIONAL%TYPE       /*국제택배여부          */
    , v_Reg_Id          IN RTSD0423.REG_ID%TYPE                  /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTSD0423 (
          LOGISTICS_CD
        , LOGISTICS_NM
        , LOGISTICS_INTERNATIONAL
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT            
    ) VALUES (
          v_Logistics_Cd
        , v_Logistics_Nm 
        , v_Logistics_International   
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

  END f_InsertRtsd0423;
  
  /*****************************************************************************
  -- 택배사정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-04  kstka            [20220704_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0423 (
      v_Logistics_Cd                 IN RTSD0423.LOGISTICS_CD%TYPE                  /*택배사코드           */
    , v_Logistics_Nm                 IN RTSD0423.LOGISTICS_NM%TYPE                  /*택배사명             */
    , v_Logistics_International      IN RTSD0423.LOGISTICS_INTERNATIONAL%TYPE       /*국제택배여부          */
    , v_Reg_Id          IN RTSD0423.REG_ID%TYPE                 /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS 
  BEGIN

    UPDATE RTSD0423
       SET LOGISTICS_NM                  = v_Logistics_Nm
         , LOGISTICS_INTERNATIONAL       = v_Logistics_International
         , CHG_ID      = v_Reg_Id
         , CHG_DT      = SYSDATE  
    WHERE  1=1
      AND  LOGISTICS_CD  = v_Logistics_Cd
      ;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0423;
  
END Pkg_Rtsd0423;