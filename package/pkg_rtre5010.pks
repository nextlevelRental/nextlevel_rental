CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5010 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5010
   PURPOSE   �Ǹż����� ����ǥ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  �̿���           ä�� ��/�ߺз� �׸� �߰�      
*******************************************************************************/

  /*****************************************************************************
  -- �Ǹż����� ����ǥ Count
  *****************************************************************************/
  FUNCTION f_sRtre5010Count(
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,          /*ä�α���            */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,          /*����ǥ����          */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE    /* ä�� �ߺз�          */      
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹż����� ����ǥ Select
  -- �����̷�: 2016-04-18 �̿���, ä�� ��з�,�ߺз� �ڵ� �߰�    
  *****************************************************************************/
  PROCEDURE p_sRtre5010 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Standard_Day   IN RTRE5010.STR_DAY%TYPE,        /*��������              */
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*ä�α���              */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE    /* ä�� �ߺз�          */    
    );

  /*****************************************************************************
  -- �Ǹż����� ����ǥ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5010 (
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*ä�α���              */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Str_Day        IN RTRE5010.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5010.END_DAY%TYPE,        /*��������              */
    v_Slcm_Amt       IN RTRE5010.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfd_Amt       IN RTRE5010.APFD_AMT%TYPE,       /*��缳���ݾ�          */
    v_Use_Yn         IN RTRE5010.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹż����� ����ǥ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5010 (
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*ä�α���              */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Str_Day        IN RTRE5010.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5010.END_DAY%TYPE,        /*��������              */
    v_Slcm_Amt       IN RTRE5010.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfd_Amt       IN RTRE5010.APFD_AMT%TYPE,       /*��缳���ݾ�          */
    v_Use_Yn         IN RTRE5010.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹż����� ����ǥ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5010 (
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*ä�α���              */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹż����� ����ǥ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5010 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*ä�α���              */
    v_Chr_Seq        IN OUT RTRE5010.CHR_SEQ%TYPE,    /*����ǥ����            */
    v_Str_Day        IN RTRE5010.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5010.END_DAY%TYPE,        /*��������              */
    v_Slcm_Amt       IN RTRE5010.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfd_Amt       IN RTRE5010.APFD_AMT%TYPE,       /*��缳���ݾ�          */
    v_Use_Yn         IN RTRE5010.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */     
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �Ǹż����� ����ǥ - �����̷� �������� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre5010EndDay (
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*ä�α���              */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_End_Day        IN RTRE5010.END_DAY%TYPE,        /*��������              */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */      
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �Ǹż����� ����ǥ - ����ǥ���� ���
  *****************************************************************************/
  FUNCTION f_sRtre5010ChrSeq(
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,          /*ä�α���            */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE    /* ä�� �ߺз�          */      
    ) RETURN NUMBER;
    
END Pkg_Rtre5010;
/
