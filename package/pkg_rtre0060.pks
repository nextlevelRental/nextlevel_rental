CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0060 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0060
   PURPOSE   ���½�û ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���½�û ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0060Count(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*���½�û �߻�����   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,         /*���½�û��          */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE          /*���½�û����        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���½�û ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE        /*���½�û��            */
    );

  /*****************************************************************************
  -- ���½�û ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*���°��� ���ڵ�       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*��� ���ڵ�           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���½�û ���� Insert(ARS������������)
  *****************************************************************************/
  FUNCTION f_InsertRtre0060RecData (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*���°��� ���ڵ�       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*��� ���ڵ�           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_Txt_No         IN RTRE0060.TXT_NO%TYPE,         /*ARS���� ����������ȣ  */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���½�û ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*���°��� ���ڵ�       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*��� ���ڵ�           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���½�û ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���½�û ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0060 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN OUT RTRE0060.ACRQ_SEQ%TYPE,   /*���½�û����          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*���°��� ���ڵ�       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*��� ���ڵ�           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���½�û ���� - ���½�û�������
  *****************************************************************************/
  FUNCTION f_sRtre0060AcrqSeq(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*���½�û �߻�����   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE          /*���½�û��          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݰ��� > CMS���� > ���½�û ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtreAccReq0060List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_From_Dt        IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��             */
    v_To_Dt          IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��             */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����           */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*�ֹ���ȣ               */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�               */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������      */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE         /*���������û��         */
    );

  /*****************************************************************************
  -- ���ݰ��� > CMS���� > ���½�û ��� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060AccReqTargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*���½�û����          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���ݰ��� > CMS���� > ���½�û ��� �ݿ� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060AccResultList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*���½�û����          */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*�۾�����(��û����)     */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���½�û ���� ���� - RE-020201_���½�û �������
  *****************************************************************************/
  PROCEDURE p_InsertRtre0060Aggregate (
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Fr_Rpc_Day     IN VARCHAR,                      /*�������� ����������� */
    v_To_Rpc_Day     IN VARCHAR,                      /*�������� ������������ */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���½�û ���� ���� - ���½�û ������� �ϰ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0060Batch (
    v_Acrq_Day       IN  RTRE0060.ACRQ_DAY%TYPE,      /*���½�û��            */
    v_Fr_Rpc_Day     IN  VARCHAR,                     /*�������� ����������� */
    v_To_Rpc_Day     IN  VARCHAR,                     /*�������� ������������ */
    v_Reg_Id         IN  RTRE0060.REG_ID%TYPE,        /*����� ID             */
    v_Acrq_Cnt       OUT RTRE0099.ACRQ_CNT%TYPE,      /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     OUT RTRE0099.ACCNRQ_CNT%TYPE,    /*���������Ǽ�          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���½�û ����(RTRE0060) Update - ���½�ûó�� ���¸� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���½�û ���� Count - ����ȣ ���� ���翩�� Ȯ��
  *****************************************************************************/
  FUNCTION f_sRtre0060OrdCount(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*���½�û �߻�����   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,         /*���½�û��          */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,         /*���½�û����        */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE            /*����ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���½�û ����(RTRE0060) Update - ���½�ûó������ ���� ���½�ûó�� ���¸� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqTpSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���½�û ����(RTRE0060) Update - ���½�û ó�����¿� ����ڵ� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqcdSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���½�û ����(RTRE0060) Update - ���½�û ó�����¿� ���������û���� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqStRpcSeq (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���½�û ���� Delete - ���½�û �߻�����, ���½�û�� ���� ��� ����
  *****************************************************************************/
  FUNCTION f_DeleteRtre0060All (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


END Pkg_Rtre0060;
/
