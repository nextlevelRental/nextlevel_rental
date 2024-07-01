CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0109 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0109
   PURPOSE   û�������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-13  jemcarry         1. Created this package body.
   1.1        2017-09-19  wjim             [20170224_01] ���ݰ���(�˾�)�� û��������ȸ �߰�
   1.2        2018-04-19  wjim             [20180419_01] �ߵ��ϳ�(�ؾ�) �� �湮���� ��� ������ ���˰ź� �ڵ� ���
   1.3        2018-04-25  wjim             [20180425_01] �ߵ��ϳ�(�ؾ�) �� �湮���� ���˰ź� �̷µ��
   1.4        2018-11-09  ncho             1. ��ü�ݼ��� - �̳����� �� ��ȸ �߰�
 *******************************************************************************/
  /*****************************************************************************
  -- û�������� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0109Count(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,           /*����ȣ            */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE          /*û������            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- û�������� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0109 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Demd_Fdt       IN RTSD0109.DEMD_DT%TYPE,        /*û������FROM          */
    v_Demd_Tdt       IN RTSD0109.DEMD_DT%TYPE,        /*û������TO            */
    v_Sales_Group    IN RTSD0109.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0109.SALES_OFFICE%TYPE,   /*����                  */
    v_Agency_Cd      IN RTSD0109.AGENCY_CD%TYPE,      /*���� �븮��           */
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*����ȣ              */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*�����ٻ����ڵ�        */
    v_Recp_Tp        IN RTSD0109.RECP_TP%TYPE,        /*û������              */
    v_RENTAL_GROUP  IN VARCHAR2,
    v_RENTAL_OFFICE IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                    /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP     IN VARCHAR2                     /* �α��� ����� �׷� */
    );

  /*****************************************************************************
  -- û�������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0109 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTSD0109.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTSD0109.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*�����ٻ����ڵ�        */
    v_Sale_Amt       IN RTSD0109.SALE_AMT%TYPE,       /*����ݾ�(VAT ����)    */
    v_Sale_Namt      IN RTSD0109.SALE_NAMT%TYPE,      /*����                  */
    v_Sale_Vamt      IN RTSD0109.SALE_VAMT%TYPE,      /*�ΰ���                */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*�����ݾ�(VAT����)     */
    v_Arre_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*��ü�ݾ�(VAT����)     */
    v_Demd_Dt        IN RTSD0109.DEMD_DT%TYPE,        /*û������              */
    v_Zlspr          IN RTSD0109.ZLSPR%TYPE,          /*û������              */
    v_Rc_Day         IN RTSD0109.RC_DAY%TYPE,         /*��������              */
    v_Rc_Yn          IN RTSD0109.RC_YN%TYPE,          /*��������              */
    v_Tax_Dt         IN RTSD0109.TAX_DT%TYPE,         /*���ݰ�꼭��������(�� */
    v_Tax_No         IN RTSD0109.TAX_NO%TYPE,         /*���ݰ�꼭��ȣ        */
    v_Zfb_Day        IN RTSD0109.ZFB_DAY%TYPE,        /*�����������        */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*�ߵ��ϳ���            */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*����ȣ              */
    v_Sales_Group    IN RTSD0109.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0109.SALES_OFFICE%TYPE,   /*����                  */
    v_Agency_Cd      IN RTSD0109.AGENCY_CD%TYPE,      /*���� �븮��           */
    v_Beg_Day        IN RTSD0109.BEG_DAY%TYPE,        /*������                */
    v_End_Day        IN RTSD0109.END_DAY%TYPE,        /*������                */
    v_Delay_Yn       IN RTSD0109.DELAY_YN%TYPE,       /*��ü�������뿩��      */
    v_Delay_Rate     IN RTSD0109.DELAY_RATE%TYPE,     /*��ü ������           */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*��ü��                */
    v_Use_Yn         IN RTSD0109.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- û�������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*û������              */
    v_Recp_Tp        IN RTSD0109.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTSD0109.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*�����ٻ����ڵ�        */
    v_Sale_Amt       IN RTSD0109.SALE_AMT%TYPE,       /*����ݾ�(VAT ����)    */
    v_Sale_Namt      IN RTSD0109.SALE_NAMT%TYPE,      /*����                  */
    v_Sale_Vamt      IN RTSD0109.SALE_VAMT%TYPE,      /*�ΰ���                */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*�����ݾ�(VAT����)     */
    v_Arre_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*��ü�ݾ�(VAT����)     */
    v_Demd_Dt        IN RTSD0109.DEMD_DT%TYPE,        /*û������              */
    v_Zlspr          IN RTSD0109.ZLSPR%TYPE,          /*û������              */
    v_Rc_Day         IN RTSD0109.RC_DAY%TYPE,         /*��������              */
    v_Rc_Yn          IN RTSD0109.RC_YN%TYPE,          /*��������              */
    v_Tax_Dt         IN RTSD0109.TAX_DT%TYPE,         /*���ݰ�꼭��������(�� */
    v_Tax_No         IN RTSD0109.TAX_NO%TYPE,         /*���ݰ�꼭��ȣ        */
    v_Zfb_Day        IN RTSD0109.ZFB_DAY%TYPE,        /*�����������        */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*�ߵ��ϳ���            */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*����ȣ              */
    v_Sales_Group    IN RTSD0109.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0109.SALES_OFFICE%TYPE,   /*����                  */
    v_Agency_Cd      IN RTSD0109.AGENCY_CD%TYPE,      /*���� �븮��           */
    v_Beg_Day        IN RTSD0109.BEG_DAY%TYPE,        /*������                */
    v_End_Day        IN RTSD0109.END_DAY%TYPE,        /*������                */
    v_Delay_Yn       IN RTSD0109.DELAY_YN%TYPE,       /*��ü�������뿩��      */
    v_Delay_Rate     IN RTSD0109.DELAY_RATE%TYPE,     /*��ü ������           */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*��ü��                */
    v_Use_Yn         IN RTSD0109.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- û�������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0109 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*û������              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- û�������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0109 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN OUT RTSD0109.SCHD_SEQ%TYPE,   /*û������              */
    v_Recp_Tp        IN RTSD0109.RECP_TP%TYPE,        /*û������              */
    v_Recp_Nu        IN RTSD0109.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*�����ٻ����ڵ�        */
    v_Sale_Amt       IN RTSD0109.SALE_AMT%TYPE,       /*����ݾ�(VAT ����)    */
    v_Sale_Namt      IN RTSD0109.SALE_NAMT%TYPE,      /*����                  */
    v_Sale_Vamt      IN RTSD0109.SALE_VAMT%TYPE,      /*�ΰ���                */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*�����ݾ�(VAT����)     */
    v_Arre_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*��ü�ݾ�(VAT����)     */
    v_Demd_Dt        IN RTSD0109.DEMD_DT%TYPE,        /*û������              */
    v_Zlspr          IN RTSD0109.ZLSPR%TYPE,          /*û������              */
    v_Rc_Day         IN RTSD0109.RC_DAY%TYPE,         /*��������              */
    v_Rc_Yn          IN RTSD0109.RC_YN%TYPE,          /*��������              */
    v_Tax_Dt         IN RTSD0109.TAX_DT%TYPE,         /*���ݰ�꼭��������(�� */
    v_Tax_No         IN RTSD0109.TAX_NO%TYPE,         /*���ݰ�꼭��ȣ        */
    v_Zfb_Day        IN RTSD0109.ZFB_DAY%TYPE,        /*�����������        */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*�ߵ��ϳ���            */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*����ȣ              */
    v_Sales_Group    IN RTSD0109.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0109.SALES_OFFICE%TYPE,   /*����                  */
    v_Agency_Cd      IN RTSD0109.AGENCY_CD%TYPE,      /*���� �븮��           */
    v_Beg_Day        IN RTSD0109.BEG_DAY%TYPE,        /*������                */
    v_End_Day        IN RTSD0109.END_DAY%TYPE,        /*������                */
    v_Delay_Yn       IN RTSD0109.DELAY_YN%TYPE,       /*��ü�������뿩��      */
    v_Delay_Rate     IN RTSD0109.DELAY_RATE%TYPE,     /*��ü ������           */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*��ü��                */
    v_Use_Yn         IN RTSD0109.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- û�������� Count - û������ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0109SchdSeq(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE            /*����ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- û�������� ���� - ����ȣ ���� û�������� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109ScheduleReal (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ����� û�������� ���� - ����ȣ ���� û�������� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109MemberSchReal (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- û�������� Count - �ش� ����ȣ�� ���Ͽ� ������ ������ �����ϴ��� üũ
  *****************************************************************************/
  FUNCTION f_sRtsd0109UpdateCount(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*����ȣ              */
    v_Chg_Day        IN VARCHAR                       /*��������              */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- û�������� Update - �������, ������, ����������� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109ZfbDay (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*����ȣ              */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*��ü��                */
    v_Chg_Day        IN VARCHAR,                      /*��������              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- û�������� ���� - �������� ���� �Ǵ� ������ �ش� ������ ����(�������, ������, �����������) ������Ʈ �Ѵ�.
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0109 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*����ȣ              */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*��������              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*��ü��                */
    v_Chg_Day        IN VARCHAR,                      /*��������              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- û�������� Select - ������ ��ȸ(��ະ)    û�� ������ ��ȸ(��ະ) - ��    SD-020303    SD00061
  *****************************************************************************/
  PROCEDURE p_sRtsd0109DetailList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE          /*����ȣ              */
    );


  /*****************************************************************************
  -- û�������� - û������ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0109DemdDt(
    v_Recp_Nu        IN RTSD0109.RECP_NU%TYPE,        /*û��ȸ��              */
    v_Proc_Day       IN RTSD0104.PROC_DAY%TYPE,       /*��������              */
    v_Pay_Dd         IN RTSD0104.PAY_DD%TYPE          /*��ü��                */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- û�������� Update - ���� ���� ������Ʈ(��������, �����ݾ�, ��ü�ݾ�, ��������)
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109ReceiptState (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*û������              */
    v_Rc_Yn          IN RTSD0109.RC_YN%TYPE,          /*��������              */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*�����ݾ�(VAT����)     */
    v_Arre_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*��ü�ݾ�(VAT����)     */
    v_Rc_Day         IN RTSD0109.RC_DAY%TYPE,         /*��������              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- û�������� û��ȸ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0109RecpNu (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE        /*û������              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- û�������� �������� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0109ZfbDay (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE        /*û������              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- û�������� Select - �ߵ��ϳ� ���������ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0109CancelList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*����ȣ              */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*��������(S070:E,C)    */
    v_Canc_Day       IN RTSD0108.CANC_DAY%TYPE        /*�������(������)      */
    );

  /*****************************************************************************
  -- û�������� ���� - �ߵ��ϳ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109CancelSave (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*��������(S070:E,C)    */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*�ߵ��ϳ���            */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*�����ݾ�(VAT����)     */
    v_Arre1_Amt      IN RTSD0109.ARRE_AMT%TYPE,       /*���ι̴��            */
    v_Bank_Day       IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- û�������� ���� - �ߵ��ϳ� ����(�������� �ý��� �����˾��� ����)
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109CancelSave2 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*��������(S070:E,C)    */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*�ߵ��ϳ���            */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*�����ݾ�(VAT����)     */
    v_Arre1_Amt      IN RTSD0109.ARRE_AMT%TYPE,       /*���ι̴��            */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ); 
    
  /*****************************************************************************
  -- û�������� ���� - ä�ǸŰ� ó���� ���� �ӽ� ���α׷�
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109CancelSave3 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*��������(S070:E,C)    */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*�ߵ��ϳ���            */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*�����ݾ�(VAT����)     */
    v_Arre1_Amt      IN RTSD0109.ARRE_AMT%TYPE,       /*���ι̴��            */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   

  /*****************************************************************************
  -- û�������� Update - �ߵ��ϳ�
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109Cancel (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*�ߵ��ϳ���            */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*�����ٻ����ڵ�        */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���հ� �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109Discount (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*û������              */
    v_Sale_Amt       IN RTSD0109.SALE_AMT%TYPE,       /*����ݾ�              */
    v_Sale_Namt      IN RTSD0109.SALE_NAMT%TYPE,      /*����                  */
    v_Sale_Vamt      IN RTSD0109.SALE_VAMT%TYPE,      /*�ΰ���                */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���س�� û������ ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0109ApplYmZfbDay (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Appl_Ym        IN VARCHAR                       /*���س��              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���س�� û���ݾ� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0109ApplYmSaleAmt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Appl_Ym        IN VARCHAR                       /*���س��              */
    ) RETURN NUMBER;

  /*****************************************************************************
  --  û�������� - (���ݳ�����ȸ) ���õ� ����ȣ�� �������� û���Ⱓ���� û�������� ��ȸ�Ѵ�.
  *****************************************************************************/
  PROCEDURE p_sRtsd0109ChargeCashApp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Zfb_Fd         IN RTSD0109.ZFB_DAY%TYPE,        /*����û������          */
    v_Zfb_Td         IN RTSD0109.ZFB_DAY%TYPE         /*����û������          */
    );

  /*****************************************************************************
  --  ���ݰ���(�˾�) û��/�������� ��ȸ
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-09-19  wjim             [20170224_01] �߰�
  *****************************************************************************/
  PROCEDURE p_sRtsd0109CollectForReq (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Ord_No         IN RTSD0109.ORD_NO%TYPE        /*����ȣ              */
  );

  /*****************************************************************************
   -- �̳����� �� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0109UnpaidList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                  , v_Ord_No   IN RTSD0109.ORD_NO%TYPE  /* ����ȣ */
                                  , v_Cust_No  IN RTSD0109.CUST_NO%TYPE /* ����ȣ */
                                 );

  /*****************************************************************************
  -- ��ȸ���� û��ȸ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0109SearchRecpNu (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Req_Dt         IN RTSD0109.ZFB_DAY%TYPE        /*��û����              */
    ) RETURN NUMBER ;   
           
  /*****************************************************************************
  -- ��ȸ���� ���� ���� ���� û��Ƚ�� 
  *****************************************************************************/
  FUNCTION f_sRtsd0109RecpNuCnt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Req_Dt         IN RTSD0109.ZFB_DAY%TYPE         /*��û����              */
    ) RETURN NUMBER ;   

  /*****************************************************************************
  -- ���α����� ���� Ƚ��
  *****************************************************************************/
  FUNCTION f_sRtsd0109SaleRecpNuCnt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Req_Dt         IN RTSD0109.ZFB_DAY%TYPE         /*��û����              */
    ) RETURN NUMBER ;   
    
  /*****************************************************************************
  -- ��Ű�� ������ ����� ����
  *****************************************************************************/
  FUNCTION f_sRtsd0109PenaltyAmt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE          /*����ȣ              */
    ) RETURN VARCHAR2 ;   
   
  /*****************************************************************************
  -- û�������� ��ü �� ����� ���, �ؾ�� �缳��
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109SchGrpYnSet (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*����ȣ              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*����� ID             */
    v_Grp_YN         IN RTSD0104.GRP_YN%TYPE,         /*�����������          */
    v_Penalt_Amt     IN RTSD0109.RECP_AMT%TYPE,       /*�����                */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   

  /*****************************************************************************
   -- �������� Update
   *****************************************************************************/
    PROCEDURE p_UpdateRtsd0109SalesPrpt(  v_Ord_No         IN  RTSD0109.ORD_NO%TYPE   /* ����ȣ */
                                        , v_Schd_Seq_U     IN  RTSD0109.SCHD_SEQ%TYPE /* û������ Update */
                                        , v_Scd_Stat_U     IN  RTSD0109.SCD_STAT%TYPE /* �����ٻ����ڵ� Update */
                                        , v_Reg_Id         IN  RTSD0109.REG_ID%TYPE   /* ����� ID */
                                        , v_Success_Code   OUT NUMBER
                                        , v_Return_Message OUT VARCHAR2
                                        , v_ErrorText      OUT VARCHAR2
                                       );

  /*****************************************************************************
  -- ����ȸ�� MAXȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0109MaxRecpNu(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER ;


END Pkg_Rtsd0109;
/
