CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0112 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0112
   PURPOSE   ���û�� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���û�� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0112Count(
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,          /*ä�ǰ������        */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,           /*����ȣ            */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,          /*����ȣ            */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE          /*û������            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���û�� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0112 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*��ü��                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*�����������        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���û�� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0112 (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*��ü��                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*�����������        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���û�� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0112 (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*��ü��                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*�����������        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���û�� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0112 (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*û������              */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���û�� ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0112 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*��ü��                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*�����������        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���û�� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0112Equal (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

END Pkg_Rtre0112;
/
