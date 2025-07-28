CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0005 AS
/*******************************************************************************
   NAME      Pkg_Rtcm0005
   PURPOSE   사용자 MASTER 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-06-01  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 기능 사용 권한 MASTER Count
  *****************************************************************************/
  FUNCTION f_sRtcm0005Count(
    v_Mdl_Cd          IN Rtcm0005.MDL_CD%TYPE,         /*중분류               */
    v_Prgm_Cd        IN Rtcm0005.PRGM_CD%TYPE,       /*프로그램코드          */
    v_Control_Id     IN Rtcm0005.CONTROL_ID%TYPE     /*컨트롤 ID            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0005
    WHERE   MDL_CD = v_Mdl_Cd
    AND     PRGM_CD = v_Prgm_Cd
    AND     CONTROL_ID = v_Control_Id;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0005Count;

  /*****************************************************************************
  -- 기능 사용 권한 MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0005 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mdl_Cd          IN Rtcm0005.MDL_CD%TYPE,         /*중분류               */
    v_Prgm_Cd        IN Rtcm0005.PRGM_CD%TYPE,       /*프로그램코드          */
    v_Control_Id     IN Rtcm0005.CONTROL_ID%TYPE     /*컨트롤 ID            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT 
        MDL_CD
       ,PRGM_CD
       ,CONTROL_ID
       ,USER_GRP
       ,USER_ID
       ,TYPE_CD
       ,USE_YN
       ,REG_ID
    FROM RTCM0005
    WHERE 1=1
    AND MDL_CD = v_Mdl_Cd
    AND PRGM_CD = v_Prgm_Cd
    AND CONTROL_ID = DECODE(v_Control_Id, NULL, CONTROL_ID, v_Control_Id)
    ;

  END p_sRtcm0005;

  /*****************************************************************************
  -- 사용자 MASTER Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0005 (
    v_Mdl_Cd          IN Rtcm0005.MDL_CD%TYPE,         /*중분류               */
    v_Prgm_Cd        IN Rtcm0005.PRGM_CD%TYPE,       /*프로그램코드          */
    v_Control_Id     IN Rtcm0005.CONTROL_ID%TYPE,    /*컨트롤 ID            */
    v_User_Grp       IN Rtcm0005.USER_GRP%TYPE,      /*사용자그룹            */
    v_User_Id        IN Rtcm0005.USER_ID%TYPE,       /*사용자 ID            */
    v_Type_Cd        IN Rtcm0005.TYPE_CD%TYPE,       /*기능 오픈 유형        */
    v_Use_Yn         IN Rtcm0005.USE_YN%TYPE,        /*사용 여부            */
    v_Reg_Id         IN Rtcm0005.REG_ID%TYPE,        /*등록자 ID            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO Rtcm0005 (
            MDL_CD
           ,PRGM_CD
           ,CONTROL_ID
           ,USER_GRP
           ,USER_ID
           ,TYPE_CD
           ,USE_YN
           ,REG_ID
           ,REG_DT
           ,CHG_ID
           ,CHG_DT
            )
    VALUES  (
            v_Mdl_Cd,
            v_Prgm_Cd,
            v_Control_Id,
            v_User_Grp,
            v_User_Id,
            v_Type_Cd,
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

  END f_InsertRtcm0005;

  /*****************************************************************************
  -- 사용자 MASTER Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0005 (
    v_Mdl_Cd          IN Rtcm0005.MDL_CD%TYPE,         /*중분류               */
    v_Prgm_Cd        IN Rtcm0005.PRGM_CD%TYPE,       /*프로그램코드          */
    v_Control_Id     IN Rtcm0005.CONTROL_ID%TYPE,    /*컨트롤 ID            */
    v_User_Grp       IN Rtcm0005.USER_GRP%TYPE,      /*사용자그룹            */
    v_User_Id        IN Rtcm0005.USER_ID%TYPE,       /*사용자 ID            */
    v_Type_Cd        IN Rtcm0005.TYPE_CD%TYPE,       /*기능 오픈 유형        */
    v_Use_Yn         IN Rtcm0005.USE_YN%TYPE,        /*사용 여부            */
    v_Reg_Id         IN Rtcm0005.REG_ID%TYPE,        /*등록자 ID            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE Rtcm0005
    SET    USER_GRP   = v_User_Grp,
           USER_ID    = v_User_Id,
           TYPE_CD    = v_Type_Cd,
           USE_YN     = v_Use_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  MDL_CD      = v_Mdl_Cd
    AND    PRGM_CD    = v_Prgm_Cd
    AND    CONTROL_ID = v_Control_Id
    AND    USER_GRP   = v_User_Grp
    AND    USER_ID    = v_User_Id;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
           v_ErrorText := SUBSTR(SQLERRM, 1, 200);
           RETURN SQLCODE;

  END f_UpdateRtcm0005;

  /*****************************************************************************
  -- 기능 권한 사용자 MASTER Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0005 (
    v_Mdl_Cd          IN Rtcm0005.MDL_CD%TYPE,         /*중분류               */
    v_Prgm_Cd        IN Rtcm0005.PRGM_CD%TYPE,       /*프로그램코드          */
    v_Control_Id     IN Rtcm0005.CONTROL_ID%TYPE,    /*컨트롤 ID            */
    v_User_Grp       IN Rtcm0005.USER_GRP%TYPE,      /*사용자그룹            */
    v_User_Id        IN Rtcm0005.USER_ID%TYPE,       /*사용자 ID            */
    v_Type_Cd        IN Rtcm0005.TYPE_CD%TYPE,       /*기능 오픈 유형        */
    v_Use_Yn         IN Rtcm0005.USE_YN%TYPE,        /*사용 여부            */
    v_Reg_Id         IN Rtcm0005.REG_ID%TYPE,        /*등록자 ID            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0005
    SET    USE_YN     = 'N',
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  MDL_CD      = v_Mdl_Cd
    AND    PRGM_CD    = v_Prgm_Cd
    AND    CONTROL_ID = v_Control_Id
    AND    USER_GRP   = v_User_Grp
    AND    USER_ID    = v_User_Id;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
           v_ErrorText := SUBSTR(SQLERRM, 1, 200);
           RETURN SQLCODE;

  END f_DeleteRtcm0005;

  /*****************************************************************************
  -- 사용자 MASTER 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0005 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Mdl_Cd          IN Rtcm0005.MDL_CD%TYPE,         /*중분류               */
    v_Prgm_Cd        IN Rtcm0005.PRGM_CD%TYPE,       /*프로그램코드          */
    v_Control_Id     IN Rtcm0005.CONTROL_ID%TYPE,    /*컨트롤 ID            */
    v_User_Grp       IN Rtcm0005.USER_GRP%TYPE,      /*사용자그룹            */
    v_User_Id        IN Rtcm0005.USER_ID%TYPE,       /*사용자 ID            */
    v_Type_Cd        IN Rtcm0005.TYPE_CD%TYPE,       /*기능 오픈 유형        */
    v_Use_Yn         IN Rtcm0005.USE_YN%TYPE,        /*사용 여부            */
    v_Reg_Id         IN Rtcm0005.REG_ID%TYPE,        /*등록자 ID            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error     EXCEPTION;
    
  BEGIN

    IF v_Comm_Dvsn = 'I' THEN

        -- 최초 등록시 패스워드는 초기값으로 설정되며, 임시비밀번호 사용여부가 Y값으로 설정
        IF 0 != f_InsertRtcm0005(v_Mdl_Cd, v_Prgm_Cd, v_Control_Id, v_User_Grp,
                                 v_User_Id, v_Type_Cd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcm0005(v_Mdl_Cd, v_Prgm_Cd, v_Control_Id, v_User_Grp,
                                 v_User_Id, v_Type_Cd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtcm0005(v_Mdl_Cd, v_Prgm_Cd, v_Control_Id, v_User_Grp,
                                 v_User_Id, v_Type_Cd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0005.p_IUDRtcm0005(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0005.p_IUDRtcm0005(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0005;

  /*****************************************************************************
  -- 사용자 MASTER - 사용자아이디 기준 사용자명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0005UseYn(
    v_Mdl_Cd          IN Rtcm0005.MDL_CD%TYPE,         /*중분류               */
    v_Prgm_Cd        IN Rtcm0005.PRGM_CD%TYPE,       /*프로그램코드          */
    v_Control_Id     IN Rtcm0005.CONTROL_ID%TYPE,    /*컨트롤 ID            */
    v_User_Grp       IN Rtcm0005.USER_GRP%TYPE,      /*사용자그룹            */
    v_User_Id        IN Rtcm0005.USER_ID%TYPE,       /*사용자 ID            */
    v_Type_Cd        IN Rtcm0005.TYPE_CD%TYPE        /*기능 오픈 유형        */
    ) RETURN VARCHAR IS

    v_Use_Yn        RTCM0005.USE_YN%TYPE;             /*사용여부            */

  BEGIN

    SELECT  USE_YN
    INTO    v_Use_Yn
    FROM    RTCM0005
    WHERE   1 = 1
    AND     MDL_CD       = v_Mdl_Cd
    AND     PRGM_CD     = v_Prgm_Cd
    AND     CONTROL_ID  = v_Control_Id
    AND     USER_GRP    = v_User_Grp
    AND     USER_ID     = v_User_Id;

    RETURN v_Use_Yn;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0005UseYn;

END Pkg_Rtcm0005;