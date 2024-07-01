CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0030 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0030
   PURPOSE   ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0030Count(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,         /*�����ŷ���ȣ        */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE          /*�ŷ��Ϸù�ȣ        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*������ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Tp        IN RTRE0030.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*��������              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*���ݿ����� ���࿩��   */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*������Ұŷ��Ϸù�ȣ  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*������Ұŷ���ȣ ���� */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0030 (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*������ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Tp        IN RTRE0030.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*��������              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*���ݿ����� ���࿩��   */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*������Ұŷ��Ϸù�ȣ  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*������Ұŷ���ȣ ���� */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0030 (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*������ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Tp        IN RTRE0030.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*��������              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE,       /*�����ټ���            */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*���ݿ����� ���࿩��   */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*������Ұŷ��Ϸù�ȣ  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*������Ұŷ���ȣ ���� */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0030 (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� ���� - �������ó��:������������ó��
  *****************************************************************************/
  PROCEDURE p_InsertRtre0030 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*������ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*��������              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Rear_Amt       NUMBER,                          /*�̳������ݾ�          */ 
    v_Pnd_Amt        NUMBER,                          /*�����ݼ����ݾ�        */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���� ���� ���� - �������ó��:������������ó��
  *****************************************************************************/
  PROCEDURE p_InsertRtre0030Cancel (
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*����ȣ              */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- CMS �������� ���� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030Detail(
    Ref_Cursor       IN OUT SYS_REFCURSOR,  
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    );    
  /*****************************************************************************
  -- ���� ���� - �����ŷ���ȣ ü�� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0030RecvSeq RETURN NUMBER;
  
  /*****************************************************************************
  -- ���� ���� - �ŷ��Ϸù�ȣ ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0030RitmSeq(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���� ���� Count - �����ŷ���ȣ ���� ���ݿ����� ���࿩��(�Ǽ�) ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0030CashYnCnt(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���� ���� -  �����ŷ���ȣ�� ������(�հ�) ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0030RecpAmtSum(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE        /*�����ŷ���ȣ          */
    ) RETURN NUMBER;


  
  /*****************************************************************************
  -- ���� ���� -  �����ŷ���ȣ�� ������� �Ǽ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0030CncStatYCnt(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE        /*�����ŷ���ȣ          */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���� ���� Update - ���� ��ҿ� ���� ������� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0030CncBefore (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*������Ұŷ��Ϸù�ȣ  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*������Ұŷ���ȣ ���� */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���� ���� Update - �������� ���������� ���ݿ����� ���࿩��(CASH_YN) �� 'P' (����ó����) ������ ������Ʈ �Ѵ�. 
  *****************************************************************************/
  FUNCTION f_UpdateRtre0030Aggregate (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*���ݿ����� ���࿩��   */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ŷ���ȣ�� ���Ͽ� ��������ڵ带 ��ȸ�Ѵ�. 
  *****************************************************************************/
  FUNCTION f_sRtre0030Recp_Pay (
    v_Recv_Seq      IN RTRE0030.RECV_SEQ%TYPE       /*�����ŷ���ȣ          */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0030AFRecpAmtSum(
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*����ȣ              */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*��������              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE        /*�����ټ���            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030RecvList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE        /*�����ټ���            */
    );
    
  /*****************************************************************************
  --  ���θ���ü���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030ShopArreList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key         IN RTSD0100.SAFEKEY%TYPE         /*������Ű              */
    );        
  
  PROCEDURE p_InsertRtre0030Cancel_Ritm (
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*����ȣ              */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
                          
END Pkg_Rtre0030;
/
