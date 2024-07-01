CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0111 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0111
   PURPOSE   ä�� ���� ���γ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ä�� ���� ���γ��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0111Count(
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,          /*ä�ǰ������        */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,           /*����ȣ            */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,          /*����ȣ            */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE           /*û������            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ���γ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0111 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ä�� ���� ���γ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0111 (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ���γ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0111 (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ���γ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0111 (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ä�� ���� ���γ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0111 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ä�� ���� ���γ��� ���� - ä�Ǵ�� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtre0111Aggregate (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ä�� ���� ���γ��� Update - ä�Ǵ�� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0111Aggregate (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;    

  /*****************************************************************************
  -- ä�� ���� ���γ��� Select - ä�� ��� ��ະ ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0111OrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE         /*����ȣ              */
    );

  /*****************************************************************************
  -- ä�� ���� ���γ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0111Equal (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtre0111;
/
