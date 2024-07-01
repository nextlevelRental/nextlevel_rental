CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0101 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0101
   PURPOSE   ��ü��� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��ü��� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0101Count(
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,         /*��ü��������        */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,           /*����ȣ            */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,          /*����ȣ            */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE          /*û������            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ü��� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0101 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*��ü��������          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*��ü��                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE          /*����� ID             */
    );
    
  /*****************************************************************************
  -- ��ü û������ ���� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtre0101Detail (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,        /*��ü��������         */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,          /*����ȣ             */ 
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE          /*����ȣ             */    
    );     

  /*****************************************************************************
  -- ��ü��� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0101 (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*��ü��������          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*��ü��                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ü��� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0101 (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*��ü��������          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*��ü��                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ü��� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0101 (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*��ü��������          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*û������              */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ü��� ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0101 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*��ü��������          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*����ȣ              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*��ü��                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ��ü��� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0101DelyDayAll (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*��ü��������          */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtre0101;
/
