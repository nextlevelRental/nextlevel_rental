CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0094 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0094
   PURPOSE   프로시져 변수 로그 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 프로시져 변수 로그 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0094Count(
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,           /*로그순번            */
    v_Pseq           IN RTCM0094.PSEQ%TYPE              /*매개변수 순서       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져 변수 로그 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0094 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE          /*로그순번              */
    );
    
  /*****************************************************************************
  -- 프로시져 변수 로그 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*로그순번              */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*매개변수 명           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*매개변수 값           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 프로시져 변수 로그 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*로그순번              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*매개변수 순서         */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*매개변수 명           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*매개변수 값           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져 변수 로그 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*로그순번              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*매개변수 순서         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 프로시져 변수 로그 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0094 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*로그순번              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*매개변수 순서         */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*매개변수 명           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*매개변수 값           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtcm0094;
/
