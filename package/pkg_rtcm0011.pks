CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0011 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0011
   PURPOSE:    프로그램 Master 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 프로그램 Master CountT
  *****************************************************************************/
  FUNCTION f_sRtcm0011Count(
    v_Prgm_Cd    IN     RTCM0011.PRGM_CD%TYPE           /*프로그램코드        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로그램 Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0011 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Prgm_Cd    IN     RTCM0011.PRGM_CD%TYPE,          /*프로그램코드        */
    v_Prgm_Nm    IN     RTCM0011.PRGM_NM%TYPE           /*프로그램명          */
    );

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
    ) RETURN NUMBER;


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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로그램 Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0011(
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Reg_Id         IN RTCM0011.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로그램 Master 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0011(
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D)      */
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
    );
  
END Pkg_Rtcm0011;
/
