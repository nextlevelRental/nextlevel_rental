CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0040 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0040
   PURPOSE   ������ �������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ������ �������� Count
  *****************************************************************************/
  FUNCTION f_sRtre0040Count(
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �������� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0040 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*������ ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ������ �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*������ ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*������ ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0040 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Recv_Seq       IN OUT RTRE0040.RECV_SEQ%TYPE,   /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*������ ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ������ �������� - �����ŷ���ȣ ü�� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0040RecvSeq RETURN NUMBER;
  
  /*****************************************************************************
  -- ������ �������� - ��Ұ��ɿ��� �Ǵ� - ��Ұ��ɻ��� �Ǽ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0040CncCount(
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER;
      
  /*****************************************************************************
  -- ������ �������� - ������� - ���ŷ���������
  *****************************************************************************/
  FUNCTION f_UpdateRtre0040Cancel (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtre0040;
/
