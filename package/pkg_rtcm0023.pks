CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0023 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0023
   PURPOSE:    권한그룹-사용자 연동 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 권한그룹-사용자 연동 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0023Count(
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE         /*사용자 아이디         */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 권한그룹-사용자 연동 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0023 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE         /*사용자 아이디         */
    );

  /*****************************************************************************
  -- 권한그룹-사용자 연동 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0023(
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_Del_Fg         IN RTCM0023.DEL_FG%TYPE,         /*삭제표시              */
    v_Reg_Id         IN RTCM0023.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 권한그룹-사용자 연동 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0023(
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_Del_Fg         IN RTCM0023.DEL_FG%TYPE,         /*삭제표시              */
    v_Reg_Id         IN RTCM0023.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 권한그룹-사용자 연동 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0023(
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_Reg_Id         IN RTCM0023.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 권한그룹-사용자 연동 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0023(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_Del_Fg         IN RTCM0023.DEL_FG%TYPE,         /*삭제표시              */
    v_Reg_Id         IN RTCM0023.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );


  /*****************************************************************************
  --  권한그룹-사용자 연동 관리 - 해당 권한그룹에 소속된 사용자 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0023AuthGroupUser (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    );

  /*****************************************************************************
  --  권한그룹-사용자 연동 관리 - 해당 권한그룹에 소속되지 않은 사용자 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0023AuthGroupUserNot (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE         /*사용자명              */
    );
          
END Pkg_Rtcm0023;