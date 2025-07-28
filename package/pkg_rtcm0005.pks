CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0005 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0005
   PURPOSE   기능 사용 권한 MASTER 관리

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기능 사용 권한 MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0005 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mdl_Cd          IN Rtcm0005.MDL_CD%TYPE,         /*중분류               */
    v_Prgm_Cd        IN Rtcm0005.PRGM_CD%TYPE,       /*프로그램코드          */
    v_Control_Id     IN Rtcm0005.CONTROL_ID%TYPE     /*컨트롤 ID            */
    );

  /*****************************************************************************
  -- 기능 사용 권한 MASTER Insert
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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기능 사용 권한 MASTER Update
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
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 기능 사용 권한 MASTER Delete
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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기능 사용 권한 MASTER 관리(IUD)
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
    );
    
  /*****************************************************************************
  -- 기능 사용 권한 MASTER - 사용자 ID, 사용자 그룹별 사용 여부 확인
  *****************************************************************************/
  FUNCTION f_sRtcm0005UseYn(
    v_Mdl_Cd          IN Rtcm0005.MDL_CD%TYPE,         /*중분류               */
    v_Prgm_Cd        IN Rtcm0005.PRGM_CD%TYPE,       /*프로그램코드          */
    v_Control_Id     IN Rtcm0005.CONTROL_ID%TYPE,    /*컨트롤 ID            */
    v_User_Grp       IN Rtcm0005.USER_GRP%TYPE,      /*사용자그룹            */
    v_User_Id        IN Rtcm0005.USER_ID%TYPE,       /*사용자 ID            */
    v_Type_Cd        IN Rtcm0005.TYPE_CD%TYPE        /*기능 오픈 유형        */
    ) RETURN VARCHAR;  
            
END Pkg_Rtcm0005;