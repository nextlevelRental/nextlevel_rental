CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0092 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0092
   PURPOSE   프로시져별 로그 설정 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 프로시져별 로그 설정 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0092Count(
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE           /*프로시져명          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져별 로그 설정 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0092 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*프로시져명            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE       /*프로시져설명          */
    );

  /*****************************************************************************
  -- 프로시져별 로그 설정 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0092 (
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*프로시져명            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE,      /*프로시져설명          */
    v_Log_Save_Yn    IN RTCM0092.LOG_SAVE_YN%TYPE,    /*로그저장여부          */
    v_Para_Save_Yn   IN RTCM0092.PARA_SAVE_YN%TYPE,   /*매개변수저장여부      */
    v_Use_Yn         IN RTCM0092.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져별 로그 설정 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0092 (
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*프로시져명            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE,      /*프로시져설명          */
    v_Log_Save_Yn    IN RTCM0092.LOG_SAVE_YN%TYPE,    /*로그저장여부          */
    v_Para_Save_Yn   IN RTCM0092.PARA_SAVE_YN%TYPE,   /*매개변수저장여부      */
    v_Use_Yn         IN RTCM0092.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져별 로그 설정 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0092 (
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*프로시져명            */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로시져별 로그 설정 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0092 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*프로시져명            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE,      /*프로시져설명          */
    v_Log_Save_Yn    IN RTCM0092.LOG_SAVE_YN%TYPE,    /*로그저장여부          */
    v_Para_Save_Yn   IN RTCM0092.PARA_SAVE_YN%TYPE,   /*매개변수저장여부      */
    v_Use_Yn         IN RTCM0092.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 프로시져 존재 유무 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0092ProcCount(
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE           /*프로시져명          */
    ) RETURN NUMBER;
    
END Pkg_Rtcm0092;