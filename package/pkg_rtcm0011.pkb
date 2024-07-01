CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0011 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0011
   PURPOSE:   프로그램 Master 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 프로그램 Master Count
  *****************************************************************************/
  FUNCTION f_sRtcm0011Count(
    v_Prgm_Cd    IN     RTCM0011.PRGM_CD%TYPE           /*프로그램코드        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0011
    WHERE   PRGM_CD = v_Prgm_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0011Count;

  /*****************************************************************************
  -- 프로그램 Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0011 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Prgm_Cd    IN     RTCM0011.PRGM_CD%TYPE,          /*프로그램코드        */
    v_Prgm_Nm    IN     RTCM0011.PRGM_NM%TYPE           /*프로그램명          */
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  A.PRGM_CD,    /*프로그램코드          */
            A.PRGM_NM,    /*프로그램명            */
            A.PRGM_PATH,  /*프로그램경로          */
            A.PRGM_DESC,  /*프로그램설명          */
            A.MDL_CD,     /*모듈코드              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM, /*모듈명 */
            A.USE_YN,     /*사용여부              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*사용여부명 */
            A.REG_ID,     /*등록자 ID             */
            A.REG_DT,     /*등록일                */
            A.CHG_ID,     /*변경자ID              */
            A.CHG_DT      /*변경일                */
    FROM    RTCM0011 A
    WHERE   A.PRGM_CD LIKE v_Prgm_Cd||'%'
    AND     A.PRGM_NM LIKE '%'||v_Prgm_Nm||'%';
    
  END p_sRtcm0011;

  /*****************************************************************************
  -- 프로그램 Master Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0011(
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE,        /*프로그램명            */
    v_Prgm_Path      IN RTCM0011.PRGM_PATH%TYPE,      /*프로그램경로          */
    v_Prgm_Desc      IN RTCM0011.PRGM_DESC%TYPE,      /*프로그램설명          */
    v_Mdl_Cd         IN RTCM0011.MDL_CD%TYPE,         /*모듈코드              */
    v_Use_Yn         IN RTCM0011.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0011.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0011 (
            PRGM_CD,
            PRGM_NM,
            PRGM_PATH,
            PRGM_DESC,
            MDL_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Prgm_Cd,
            v_Prgm_Nm,
            v_Prgm_Path,
            v_Prgm_Desc,
            v_Mdl_Cd,
            v_Use_Yn,
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
        
  END f_InsertRTCM0011;


  /*****************************************************************************
  -- 프로그램 Master Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0011(
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE,        /*프로그램명            */
    v_Prgm_Path      IN RTCM0011.PRGM_PATH%TYPE,      /*프로그램경로          */
    v_Prgm_Desc      IN RTCM0011.PRGM_DESC%TYPE,      /*프로그램설명          */
    v_Mdl_Cd         IN RTCM0011.MDL_CD%TYPE,         /*모듈코드              */
    v_Use_Yn         IN RTCM0011.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0011.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0011
    SET    PRGM_NM   = V_Prgm_Nm,
           PRGM_PATH = V_Prgm_Path,
           PRGM_DESC = V_Prgm_Desc,
           MDL_CD    = V_Mdl_Cd,
           USE_YN    = V_Use_Yn,
           CHG_ID    = V_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRGM_CD   = V_Prgm_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0011;
  
  /*****************************************************************************
  -- 프로그램 Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0011(
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Reg_Id         IN RTCM0011.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0011
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRGM_CD   = V_Prgm_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0011;

  
  /*****************************************************************************
  -- 프로그램 Master 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0011(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE,        /*프로그램명            */
    v_Prgm_Path      IN RTCM0011.PRGM_PATH%TYPE,      /*프로그램경로          */
    v_Prgm_Desc      IN RTCM0011.PRGM_DESC%TYPE,      /*프로그램설명          */
    v_Mdl_Cd         IN RTCM0011.MDL_CD%TYPE,         /*모듈코드              */
    v_Use_Yn         IN RTCM0011.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0011.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값: 프로그램 코드, 프로그램 명, 프로그램 URL, 프로그램 설명, 모듈코드 , 사용유무, 등록자 ID
    IF TRIM(v_Prgm_Cd) IS NULL THEN
        v_Return_Message := '프로그램코드('||v_Prgm_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Prgm_Nm) IS NULL THEN
        v_Return_Message := '프로그램명('||v_Prgm_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Prgm_Path) IS NULL THEN
        v_Return_Message := '프로그램경로('||v_Prgm_Path||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Mdl_Cd) IS NULL THEN
        v_Return_Message := '모듈코드('||v_Mdl_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
       
    
    
    IF 0 = f_sRtcm0011Count(v_Prgm_Cd) THEN

        IF 0 != f_InsertRtcm0011(v_Prgm_Cd, v_Prgm_Nm, v_Prgm_Path, 
                                 v_Prgm_Desc, v_Mdl_Cd, v_Use_Yn, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := '등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
            
        END IF;                        
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRtcm0011(v_Prgm_Cd, v_Prgm_Nm, v_Prgm_Path, 
                                     v_Prgm_Desc, v_Mdl_Cd, v_Use_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtcm0011(v_Prgm_Cd, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '삭제 실패!!!'||'-'||v_ErrorText;
               v_ErrorText := v_ErrorText;
               RAISE e_Error;
           END IF;
            
        ELSE
            v_Return_Message := ' 처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;  
                  
        END IF;
    END IF;
    
   --DBMS_LOCK.SLEEP(20);

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0011.p_IUDRTCM0011(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0011.p_IUDRTCM0011(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0011;
  
END Pkg_Rtcm0011;
/
