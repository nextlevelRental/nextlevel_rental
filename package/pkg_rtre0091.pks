CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0091 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0091
   PURPOSE   ���ݿ������߱޳��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-14  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ݿ������߱޳��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0091Count(
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,         /*�����ŷ���ȣ        */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE          /*���ݿ����� ���� �Ϸ�*/
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݿ������߱޳��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0091 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*��ҿ���              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���ݿ������߱޳��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*��ҿ���              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݿ������߱޳��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*��ҿ���              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݿ������߱޳��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݿ������߱޳��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0091 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN OUT RTRE0091.CASH_SEQ%TYPE,   /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*��ҿ���              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���ݿ������߱޳��� Update - ���ݿ����� �������
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashStat (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���ݿ������߱޳��� Update - ���ݿ����� �������
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashStat2 (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    

  /*****************************************************************************
  -- ���ݿ������߱޳��� Update - ���ݿ����� ������ ���� �Ľ��Ͽ� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashUload (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���ݿ������߱޳��� - ���ݿ����� ���� �Ϸ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0091CashSeq(
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���ݿ������߱޳��� Select - �������� �������� ������ ���� ��Ȳ�� ��ȸ�Ѵ�. 
  *****************************************************************************/
  PROCEDURE p_sRtre0091TargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    
    
    
  /*****************************************************************************
  -- ���ݿ��������� > ���ݿ����� ��ȸ select
  *****************************************************************************/
  PROCEDURE p_sRtre0091CashReceiptList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Day_F       IN RTRE0091.RECV_DAY%TYPE,        /*�������� ��ȸ��������           */
    v_Recv_Day_T       IN RTRE0091.RECV_DAY%TYPE,        /*�������� ��ȸ��������           */
    v_Cash_Day_F       IN RTRE0091.CASH_DAY%TYPE,        /*���ݿ����� �������� ��ȸ��������*/
    v_Cash_Day_T       IN RTRE0091.CASH_DAY%TYPE,        /*���ݿ����� �������� ��ȸ��������*/  
    v_Cust_No          IN RTRE0091.CUST_NO%TYPE,         /*����ȣ*/ 
    v_Cash_Stat        IN RTRE0091.CASH_STAT%TYPE,       /*���ݿ����� �������*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );     


  /*****************************************************************************
  -- ���ݿ������߱޳��� - ���ݿ����� ��� ������ �������� ���������� ���࿩�� ������Ʈ ó��
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0091CashReltApply (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
        
END Pkg_Rtre0091;
/
