CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5011 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5011
   PURPOSE   ���¸� �Ǹż����� ����ǥ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Count
  *****************************************************************************/
  FUNCTION f_sRtre5011Count(
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,        /*�Ǹſ��ڵ�          */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE           /*����ǥ����          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Select
  *****************************************************************************/
  PROCEDURE p_sRtre5011 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Standard_Day   IN RTRE5011.STR_DAY%TYPE,        /*��������              */
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE       /*�Ǹſ��ڵ�            */
    );

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*��������              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*��缳���ݾ�          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*��������              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*��缳���ݾ�          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5011 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN OUT RTRE5011.CHR_SEQ%TYPE,    /*����ǥ����            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*��������              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*��缳���ݾ�          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ - �����̷� �������� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre5011EndDay (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*��������              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ - ����ǥ���� ���
  *****************************************************************************/
  FUNCTION f_sRtre5011ChrSeq(
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE         /*�Ǹſ��ڵ�          */
    ) RETURN NUMBER;
    
END Pkg_Rtre5011;
/
