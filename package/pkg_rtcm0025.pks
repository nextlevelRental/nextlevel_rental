CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0025 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0025
   PURPOSE:    메뉴-권한그룹 연동 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0025Count(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0025 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    );

  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 메뉴-권한그룹 연동 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0025(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

  /*****************************************************************************
  -- 메뉴-권한그룹 연동 - 해당 권한그룹에 소속된 메뉴 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0025AuthGroupMenu (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    );

  /*****************************************************************************
  -- 메뉴-권한그룹 연동 - 해당 권한그룹에 소속되지 않은 메뉴 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0025AuthGroupMenuNot (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE         /*메뉴명                */
    );
            
END Pkg_Rtcm0025;
/
