CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0031 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0031
   PURPOSE   ���� ��� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� ��� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0031Count(
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,         /*�����ŷ���ȣ        */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE          /*�ŷ��Ϸù�ȣ        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ��� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0031 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*�����������        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���� ��� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0031 (
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*�����������        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ��� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0031 (
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*�����������        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ��� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0031 (
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ��� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0031 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*û������              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*�����������        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���� ��� ���� - �ŷ��Ϸù�ȣ ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0031RitmSeq(
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER;
    
END Pkg_Rtre0031;
/
