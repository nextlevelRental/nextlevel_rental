CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0091 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0091
   PURPOSE   ����ں� �α� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����ں� �α� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0091Count(
    v_User_Id        IN RTCM0091.USER_ID%TYPE           /*����� ���̵�       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ں� �α� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0091 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*����ڸ�              */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*�α� ���� ����        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*�Ű����� ���� ����    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ����ں� �α� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0091 (
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*�α� ���� ����        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*�Ű����� ���� ����    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ں� �α� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0091 (
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*�α� ���� ����        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*�Ű����� ���� ����    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ں� �α� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0091 (
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ں� �α� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0091 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_User_Id        IN RTCM0091.USER_ID%TYPE,        /*����� ���̵�         */
    v_Log_Save_Yn    IN RTCM0091.LOG_SAVE_YN%TYPE,    /*�α� ���� ����        */
    v_Para_Save_Yn   IN RTCM0091.PARA_SAVE_YN%TYPE,   /*�Ű����� ���� ����    */
    v_Use_Yn         IN RTCM0091.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0091.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtcm0091;
/
