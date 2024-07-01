CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0013 AS
/******************************************************************************
   NAME:      Pkg_Rtcm0013
   PURPOSE:   메뉴-프로그램 연동 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 메뉴-프로그램 연동 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0013Count(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*메뉴코드              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE         /*프로그램코드          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 메뉴-프로그램 연동 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0013 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE         /*메뉴코드              */
    );

  /*****************************************************************************
  -- 메뉴-프로그램 연동 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0013(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*메뉴코드              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Sort_Odr       IN RTCM0013.SORT_ODR%TYPE,       /*정렬순서              */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*등록자ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 메뉴-프로그램 연동 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0013(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*메뉴코드              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Sort_Odr       IN RTCM0013.SORT_ODR%TYPE,       /*정렬순서              */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*등록자ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 메뉴-프로그램 연동 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0013(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*메뉴코드              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*등록자ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 메뉴-프로그램 연동 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0013(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*메뉴코드              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Sort_Odr       IN RTCM0013.SORT_ODR%TYPE,       /*정렬순서              */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*등록자ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );


  /*****************************************************************************
  --  메뉴-프로그램 연동 - 해당 메뉴에 소속된 프로그램 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0013MenuProgram (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE         /*메뉴코드              */
    );


  /*****************************************************************************
  --  메뉴-프로그램 연동 - 해당 메뉴에 소속되지 않은 프로그램 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0013MenuProgramNot (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE         /*프로그램명            */
    );        

END Pkg_Rtcm0013;
/
