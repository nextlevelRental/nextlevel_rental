CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0092 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0092
   PURPOSE   ���ν����� �α� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ν����� �α� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0092Count(
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE           /*���ν�����          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν����� �α� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0092 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE       /*���ν�������          */
    );

  /*****************************************************************************
  -- ���ν����� �α� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0092 (
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE,      /*���ν�������          */
    v_Log_Save_Yn    IN RTCM0092.LOG_SAVE_YN%TYPE,    /*�α����忩��          */
    v_Para_Save_Yn   IN RTCM0092.PARA_SAVE_YN%TYPE,   /*�Ű��������忩��      */
    v_Use_Yn         IN RTCM0092.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν����� �α� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0092 (
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE,      /*���ν�������          */
    v_Log_Save_Yn    IN RTCM0092.LOG_SAVE_YN%TYPE,    /*�α����忩��          */
    v_Para_Save_Yn   IN RTCM0092.PARA_SAVE_YN%TYPE,   /*�Ű��������忩��      */
    v_Use_Yn         IN RTCM0092.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν����� �α� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0092 (
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν����� �α� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0092 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE,        /*���ν�����            */
    v_Proc_Desc      IN RTCM0092.PROC_DESC%TYPE,      /*���ν�������          */
    v_Log_Save_Yn    IN RTCM0092.LOG_SAVE_YN%TYPE,    /*�α����忩��          */
    v_Para_Save_Yn   IN RTCM0092.PARA_SAVE_YN%TYPE,   /*�Ű��������忩��      */
    v_Use_Yn         IN RTCM0092.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0092.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���ν��� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0092ProcCount(
    v_Proc_Nm        IN RTCM0092.PROC_NM%TYPE           /*���ν�����          */
    ) RETURN NUMBER;
    
END Pkg_Rtcm0092;
/
