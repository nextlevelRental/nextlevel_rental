CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0091 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0091
   PURPOSE   사용자별 로그 설정 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 사용자별 로그 설정 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0091Count(
    v_User_Id        IN RTCM0091.USER_ID%TYPE           /*사용자 아이디       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자별 로그 설정 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0091 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*로그 저장 여부        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*매개변수 저장 여부    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 사용자별 로그 설정 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0091 (
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*사용자 아이디         */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*로그 저장 여부        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*매개변수 저장 여부    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자별 로그 설정 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0091 (
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*사용자 아이디         */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*로그 저장 여부        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*매개변수 저장 여부    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자별 로그 설정 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0091 (
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*사용자 아이디         */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자별 로그 설정 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0091 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*사용자 아이디         */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*로그 저장 여부        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*매개변수 저장 여부    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtcm0091;
/
