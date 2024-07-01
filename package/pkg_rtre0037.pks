CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0037 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0037
   PURPOSE   ������ �ܾ׳��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-15  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ������ �ܾ׳��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0037Count(
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,        /*������������        */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,         /*�����ŷ���ȣ        */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE          /*�ŷ��Ϸù�ȣ        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �ܾ׳��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0037 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*������������          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*���� �߻�����         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*����ȣ              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*���� �߻��ݾ�         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*���� �����ݾ�         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*��������              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*�����ݻ���            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ������ �ܾ׳��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0037 (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*������������          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*���� �߻�����         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*����ȣ              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*���� �߻��ݾ�         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*���� �����ݾ�         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*��������              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*�����ݻ���            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �ܾ׳��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0037 (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*������������          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*���� �߻�����         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*����ȣ              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*���� �߻��ݾ�         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*���� �����ݾ�         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*��������              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*�����ݻ���            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �ܾ׳��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0037 (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*������������          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ������ �ܾ׳��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0037 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*������������          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*�ŷ��Ϸù�ȣ          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*���� �߻�����         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*����ȣ              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*���� �߻��ݾ�         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*���� �����ݾ�         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*û������              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*��������              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*�����ݻ���            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ������ �ܾ׳��� ����
  *****************************************************************************/
  PROCEDURE p_Rtre0037PreAccum (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*������������          */
    v_Comm_Dvsn      IN CHAR,                         /*ó������(Y:��ó��)    */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtre0037;
/
