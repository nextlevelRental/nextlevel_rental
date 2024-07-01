CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0093 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0093
   PURPOSE   ���ν��� �α� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ν��� �α� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0093Count(
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE            /*�α׼���            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν��� �α� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0093 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*����� ���̵�         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*���ν�����            */
    v_Start_Fdt      IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�FROM          */
    v_Start_Tdt      IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�TO            */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*ó���ð�              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*ó�����              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE        /*����޽���            */
    );

  /*****************************************************************************
  -- ���ν��� �α� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0093 (
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE,         /*�α׼���              */
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*����� ���̵�         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*���ν�����            */
    v_Start_Dt       IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�              */
    v_Close_Dt       IN RTCM0093.CLOSE_DT%TYPE,       /*�����Ͻ�              */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*ó���ð�              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*ó�����              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE,       /*����޽���            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν��� �α� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0093 (
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE,         /*�α׼���              */
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*����� ���̵�         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*���ν�����            */
    v_Start_Dt       IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�              */
    v_Close_Dt       IN RTCM0093.CLOSE_DT%TYPE,       /*�����Ͻ�              */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*ó���ð�              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*ó�����              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE,       /*����޽���            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν��� �α� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0093 (
    v_Logseq         IN RTCM0093.LOGSEQ%TYPE,         /*�α׼���              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν��� �α� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0093 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Logseq         IN OUT RTCM0093.LOGSEQ%TYPE,     /*�α׼���              */
    v_User_Id        IN RTCM0093.USER_ID%TYPE,        /*����� ���̵�         */
    v_Proc_Nm        IN RTCM0093.PROC_NM%TYPE,        /*���ν�����            */
    v_Start_Dt       IN RTCM0093.START_DT%TYPE,       /*�����Ͻ�              */
    v_Close_Dt       IN RTCM0093.CLOSE_DT%TYPE,       /*�����Ͻ�              */
    v_Exec_Time      IN RTCM0093.EXEC_TIME%TYPE,      /*ó���ð�              */
    v_Relt_Code      IN RTCM0093.RELT_CODE%TYPE,      /*ó�����              */
    v_Relt_Msg       IN RTCM0093.RELT_MSG%TYPE,       /*����޽���            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  --  ���ν��� �α� ���� - �α׼��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcm0093Seq RETURN NUMBER;
  

END Pkg_Rtcm0093;
/
