CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0021 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0021
   PURPOSE:    권한그룹 Master 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  KBJ             1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 권한그룹 Master Count
  *****************************************************************************/
  FUNCTION f_sRtcm0021Count(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 권한그룹 Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0021 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,      /*권한그룹코드        */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,      /*권한그룹명          */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE     /*권한그룹설명        */    
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 권한그룹 Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*권한그룹코드      */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*등록자 ID         */   
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 권한그룹 Master 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0021(
    v_Comm_Dvsn      IN CHAR,                             /* 처리구분(I,U,D)  */
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*권한그룹코드      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*권한그룹명        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*권한그룹설명      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*사용여부          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*등록자 ID         */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
  
END Pkg_Rtcm0021;
/
