CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5020 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5020
   PURPOSE   ���������� ����ǥ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  �̿���           ä�� ��/�ߺз� �׸� �߰�   
*******************************************************************************/

  /*****************************************************************************
  -- ���������� ����ǥ Count
  *****************************************************************************/
  FUNCTION f_sRtre5020Count(
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,          /*����ǥ����          */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE    /* ä�� �ߺз�          */      
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���������� ����ǥ Select
  *****************************************************************************/
  PROCEDURE p_sRtre5020 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Standard_Day   IN RTRE5020.STR_DAY%TYPE,        /*��������              */
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE    /* ä�� �ߺз�          */    
    );

  /*****************************************************************************
  -- ���������� ����ǥ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5020 (
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Str_Day        IN RTRE5020.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5020.END_DAY%TYPE,        /*��������              */
    v_Prcm_Amt       IN RTRE5020.PRCM_AMT%TYPE,       /*����������            */
    v_Use_Yn         IN RTRE5020.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���������� ����ǥ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5020 (
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Str_Day        IN RTRE5020.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5020.END_DAY%TYPE,        /*��������              */
    v_Prcm_Amt       IN RTRE5020.PRCM_AMT%TYPE,       /*����������            */
    v_Use_Yn         IN RTRE5020.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���������� ����ǥ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5020 (
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���������� ����ǥ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5020 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chr_Seq        IN OUT RTRE5020.CHR_SEQ%TYPE,    /*����ǥ����            */
    v_Str_Day        IN RTRE5020.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5020.END_DAY%TYPE,        /*��������              */
    v_Prcm_Amt       IN RTRE5020.PRCM_AMT%TYPE,       /*����������            */
    v_Use_Yn         IN RTRE5020.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���������� ����ǥ - �����̷� �������� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre5020EndDay (
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_End_Day        IN RTRE5020.END_DAY%TYPE,        /*��������              */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ���������� ����ǥ  - ����ǥ���� ���
  *****************************************************************************/
  FUNCTION f_sRtre5020ChrSeq(
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE    /* ä�� �ߺз�          */    
    ) RETURN NUMBER;
    
END Pkg_Rtre5020;
/
