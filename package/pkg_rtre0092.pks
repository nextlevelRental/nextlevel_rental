CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0092 AS 
/*******************************************************************************
   NAME:      Pkg_Rtre0092
   PURPOSE   ���ݿ����� �ǽð� ó�� �̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-11-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� Count
  *****************************************************************************/
  FUNCTION f_sRtre0092Count(
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,         /*�����ŷ���ȣ        */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,         /*���ݿ����� ���� �Ϸ�*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE         /*���ݿ����� �̷¹�ȣ */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0092 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Cash_Day       IN RTRE0092.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0092.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0092.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0092.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0092.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0092.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0092.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0092.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0092.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0092.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0092.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0092.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0092.CNC_YN%TYPE,         /*��ҿ���              */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*���ݿ����� �ŷ���ȣ   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*���ݿ����� ���νð�   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*��ϻ����ڵ�          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*��ϻ��¼���          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0092 (
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Cash_Day       IN RTRE0092.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0092.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0092.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0092.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0092.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0092.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0092.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0092.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0092.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0092.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0092.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0092.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0092.CNC_YN%TYPE,         /*��ҿ���              */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*���ݿ����� �ŷ���ȣ   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*���ݿ����� ���νð�   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*��ϻ����ڵ�          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*��ϻ��¼���          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� - �̷¹�ȣ ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0092CashIseq(
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,         /*�����ŷ���ȣ        */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE          /*���ݿ����� ���� �Ϸ�*/
    ) RETURN NUMBER;
    

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� - ���ݿ����� ����/��Ҹ� ���� ������ ��ȸ �� �̷� ���� ó�� �Ѵ�.
  *****************************************************************************/
  PROCEDURE p_IRtre0092CreateCashApp (
    v_Job_Gb         IN  VARCHAR2,                     /*�۾�����(C:����,D:���*/
    v_Recv_Seq       IN  RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Reg_Id         IN  RTRE0092.REG_ID%TYPE,         /*����� ID             */
    v_Cash_Seq       OUT RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/    
    v_Cash_Iseq      OUT RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Ordr_Idxx      OUT VARCHAR2,                     /*�ֹ����й�ȣ          */ 
    v_Good_Nm        OUT VARCHAR2,                     /*��ǰ��                */ 
    v_Buyr_Nm        OUT VARCHAR2,                     /*�ֹ��ڸ�              */ 
    v_Buyr_Tel       OUT VARCHAR2,                     /*�ֹ��� ��ȭ��ȣ       */ 
    v_Req_Tx         OUT VARCHAR2,                     /*��û ����             */ 
    v_Co_Type        OUT VARCHAR2,                     /*����� ����           */ 
    v_Ctax_Type      OUT VARCHAR2,                     /*����/�鼼 ����        */ 
    v_Ctax_No        OUT VARCHAR2,                     /*���� ����ڹ�ȣ       */ 
    v_Co_Nm          OUT VARCHAR2,                     /*��ȣ                  */ 
    v_Cowner_Nm      OUT VARCHAR2,                     /*��ǥ�ڸ�              */ 
    v_Co_Add         OUT VARCHAR2,                     /*����� �ּ�           */ 
    v_Co_Tel         OUT VARCHAR2,                     /*����� ��ǥ ����ó    */ 
    v_Trad_Tm        OUT VARCHAR2,                     /*�� �ŷ��ð�           */ 
    v_Tr_Code        OUT VARCHAR2,                     /*����뵵              */ 
    v_Id_Info        OUT VARCHAR2,                     /*�ź�Ȯ�� ID           */ 
    v_Amt_Tot        OUT VARCHAR2,                     /*�ŷ��ݾ� �� ��        */ 
    v_Amt_Sup        OUT VARCHAR2,                     /*���ް���              */ 
    v_Amt_Svc        OUT VARCHAR2,                     /*�����                */ 
    v_Amt_Tax        OUT VARCHAR2,                     /*�ΰ���ġ��            */ 
    v_Mod_Type       OUT VARCHAR2,                     /*���� Ÿ��             */ 
    v_Mod_Gb         OUT VARCHAR2,                     /*�����û �ŷ���ȣ ����*/ 
    v_Mod_Val        OUT VARCHAR2,                     /*�����û �ŷ���ȣ     */ 
    v_Mod_Mny        OUT VARCHAR2,                     /*�����û �ݾ�         */ 
    v_Rem_Mny        OUT VARCHAR2,                     /*����ó�� ���� �ݾ�    */ 
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� - ���ݿ����� ����/��� �ǽð� ��� ������ ������Ʈ �Ѵ�.
  *****************************************************************************/
  FUNCTION f_UpdateRtre0092ResultCashApp (
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*���ݿ����� �ŷ���ȣ   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*���ݿ����� ���νð�   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*��ϻ����ڵ�          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*��ϻ��¼���          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� - ���ݿ����� ����/��� �ǽð� ��� ������ ������Ʈ �Ѵ�.
  *****************************************************************************/
  PROCEDURE p_IRtre0092ResultCashApp (
    v_Job_Gb         IN  VARCHAR2,                     /*�۾�����(C:����,D:���*/
    v_Recv_Seq       IN  RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN  RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/    
    v_Cash_Iseq      IN  RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Res_Cd         IN  VARCHAR2,                     /*����ڵ�              */ 
    v_Res_Msg        IN  VARCHAR2,                     /*����޽���            */ 
    v_Cash_Tno       IN  RTRE0092.CASH_TNO%TYPE,       /*���ݿ����� �ŷ���ȣ   */ 
    v_Cashapp_No     IN  RTRE0092.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Cashapp_Tm     IN  RTRE0092.CASHAPP_TM%TYPE,     /*���ݿ����� ���νð�   */
    v_Creg_St        IN  RTRE0092.CREG_ST%TYPE,        /*��ϻ����ڵ�          */
    v_Creg_Desc      IN  RTRE0092.CREG_DESC%TYPE,      /*��ϻ��¼���          */
    v_Reg_Id         IN  RTRE0092.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre0092;
/
