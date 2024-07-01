CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0036 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0036
   PURPOSE   ������ �������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ������ �������� Count
  *****************************************************************************/
  FUNCTION f_sRtre0036Count(
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,          /*�����ŷ���ȣ        */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE          /*�����ŷ��Ϸù�ȣ    */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �������� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0036 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*�����ŷ���ȣ          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*�����ŷ��Ϸù�ȣ      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*��������              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*����ȣ              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*���� �����ݾ�         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*��������              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*��������              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ������ �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0036 (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*�����ŷ���ȣ          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*�����ŷ��Ϸù�ȣ      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*��������              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*����ȣ              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*���� �����ݾ�         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*��������              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*��������              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0036 (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*�����ŷ���ȣ          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*�����ŷ��Ϸù�ȣ      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*��������              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*����ȣ              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*���� �����ݾ�         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*��������              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*��������              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0036 (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*�����ŷ���ȣ          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*�����ŷ��Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0036 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*�����ŷ���ȣ          */
    v_Sbs_Iseq       IN OUT RTRE0036.SBS_ISEQ%TYPE,   /*�����ŷ��Ϸù�ȣ      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*��������              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*����ȣ              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*���� �����ݾ�         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*��������              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*��������              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ������ �������� - �ŷ��Ϸù�ȣ ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0036SbsIseq (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE         /*�����ŷ���ȣ          */
  ) RETURN NUMBER;


  /*****************************************************************************
  -- ������ �������� Select - �߻�����
  *****************************************************************************/
  PROCEDURE p_sRtre0036RecvRitm (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*����ȣ              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE        /*�ŷ��Ϸù�ȣ          */
    );

  
  /*****************************************************************************
  -- ������ �������� ���� - RE-040115_������ ���� ��� ó��: �� ������ ������ ���������� ���Ͽ� �������� ��Ҹ� �����ϴ� ���μ�����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0036CleanAdvance     (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*��������              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*����ȣ              */
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*�����ŷ���ȣ          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*�����ŷ��Ϸù�ȣ      */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre0036;
/
