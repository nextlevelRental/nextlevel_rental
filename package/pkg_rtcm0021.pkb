CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0021 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0021
   PURPOSE:   권한그룹 Master 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  KBJ             1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 권한그룹 Master Count
  *****************************************************************************/
  FUNCTION f_sRtcm0021Count(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0021
    WHERE   AUTH_GRP_CD = v_Auth_Grp_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0021Count;

  /*****************************************************************************
  -- 권한그룹 Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0021 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,      /*권한그룹코드        */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,      /*권한그룹명          */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE     /*권한그룹설명        */    
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  AUTH_GRP_CD,      /*권한그룹코드          */
            AUTH_GRP_NM,      /*권한그룹명            */
            AUTH_GRP_DESC,    /*권한그룹설명          */
            USE_YN,           /*사용여부              */
            REG_ID,           /*등록자 ID             */
            REG_DT,           /*등록일                */
            CHG_ID,           /*변경자 ID             */
            CHG_DT            /*변경일                */
    FROM    RTCM0021 A
    WHERE   A.AUTH_GRP_CD LIKE v_Auth_Grp_Cd||'%'
    AND     A.AUTH_GRP_NM LIKE '%'||v_Auth_Grp_Nm||'%'
    AND     A.USE_YN = 'Y';
    
  END p_sRtcm0021;

  /*****************************************************************************
  -- 권한그룹 Master Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*권한그룹코드      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*권한그룹명        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*권한그룹설명      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*사용여부          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*등록자 ID         */  
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0021 (
            AUTH_GRP_CD,
            AUTH_GRP_NM,
            AUTH_GRP_DESC,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Auth_Grp_Cd,
            v_Auth_Grp_Nm,
            v_Auth_Grp_Desc,
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
        
  END f_InsertRTCM0021;


  /*****************************************************************************
  -- 권한그룹 Master Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*권한그룹코드      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*권한그룹명        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*권한그룹설명      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*사용여부          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*등록자 ID         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0021
    SET    AUTH_GRP_NM   = v_Auth_Grp_Nm,  
           AUTH_GRP_DESC = v_Auth_Grp_Desc,
           USE_YN        = v_Use_Yn,      
           CHG_ID        = v_Reg_Id,       
           CHG_DT        = SYSDATE   
    WHERE  AUTH_GRP_CD   = v_Auth_Grp_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0021;
  
  /*****************************************************************************
  -- 권한그룹 Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*권한그룹코드      */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*등록자 ID         */   
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0021
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  AUTH_GRP_CD = v_Auth_Grp_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0021;

  
  /*****************************************************************************
  -- 권한그룹 Master 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0021(
    v_Comm_Dvsn      IN CHAR,                             /*처리구분(I,U,D)   */
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*권한그룹코드      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*권한그룹명        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*권한그룹설명      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*사용여부          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*등록자 ID         */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값: 권한그룹코드, 권한그룹명, 사용여부, 등록자ID
    IF TRIM(v_Auth_Grp_Cd) IS NULL THEN
        v_Return_Message := '권한그룹코드('||v_Auth_Grp_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Auth_Grp_Nm) IS NULL THEN
        v_Return_Message := '권한그룹명('||v_Auth_Grp_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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
    
    IF 0 = f_sRtcm0021Count(v_Auth_Grp_Cd) THEN

        IF 0 != f_InsertRtcm0021(v_Auth_Grp_Cd, v_Auth_Grp_Nm, v_Auth_Grp_Desc, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '권한그룹 Master 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0021(v_Auth_Grp_Cd, v_Auth_Grp_Nm, v_Auth_Grp_Desc, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '권한그룹 Master 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0021(v_Auth_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '권한그룹 Master 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;
            
        ELSE
            v_Return_Message := ' 처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0021.p_IUDRTCM0021(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0021.p_IUDRTCM0021(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0021;
  
END Pkg_Rtcm0021;