CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0093 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0093
   PURPOSE   프로시져 로그 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 프로시져 로그 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0093Count(
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE            /*로그순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져 로그 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0093 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*사용자 아이디         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*프로시져명            */
    v_Start_Fdt      IN RTCM0093.START_DT%TYPE,       /*시작일시FROM          */
    v_Start_Tdt      IN RTCM0093.START_DT%TYPE,       /*시작일시TO            */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*처리시간              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*처리결과              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE        /*결과메시지            */
    );

  /*****************************************************************************
  -- 프로시져 로그 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0093 (
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE,         /*로그순번              */
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*사용자 아이디         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*프로시져명            */
    v_Start_Dt       IN RTCM0093.START_DT%TYPE,       /*시작일시              */
    v_Close_Dt       IN RTCM0093.CLOSE_DT%TYPE,       /*종료일시              */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*처리시간              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*처리결과              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE,       /*결과메시지            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져 로그 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0093 (
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE,         /*로그순번              */
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*사용자 아이디         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*프로시져명            */
    v_Start_Dt       IN RTCM0093.START_DT%TYPE,       /*시작일시              */
    v_Close_Dt       IN RTCM0093.CLOSE_DT%TYPE,       /*종료일시              */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*처리시간              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*처리결과              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE,       /*결과메시지            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져 로그 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0093 (
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE,         /*로그순번              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져 로그 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0093 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Logseq         IN OUT RTCM0093.LOGSEQ%TYPE,     /*로그순번              */
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*사용자 아이디         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*프로시져명            */
    v_Start_Dt       IN RTCM0093.START_DT%TYPE,       /*시작일시              */
    v_Close_Dt       IN RTCM0093.CLOSE_DT%TYPE,       /*종료일시              */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*처리시간              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*처리결과              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE,       /*결과메시지            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  --  프로시져 로그 관리 - 로그순번 획득
  *****************************************************************************/
  FUNCTION f_sRtcm0093Seq RETURN NUMBER;
  

END Pkg_Rtcm0093;