CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0010 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0010
   PURPOSE   �� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0010Count(
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE           /*���¼���            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0010 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Str_Day        IN RTRE0010.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE0010.END_DAY%TYPE,        /*��������              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*����Ȯ�λ���          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*����Ȯ�λ���          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*����Ȯ�λ���          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0010 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Acc_Seq        IN OUT RTRE0010.ACC_SEQ%TYPE,    /*���¼���              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*����Ȯ�λ���          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �� ���� ���� Select - ����ȣ ���� ���� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtre0010CustNoList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE         /*����ȣ              */
    );

  /*****************************************************************************
  -- �� ���� ���� - ����ȣ/�����ڵ�/���¹�ȣ ���� ���¼��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0010AcctNo(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*���¹�ȣ              */
    ) RETURN VARCHAR;
  
  /*****************************************************************************
  -- �� ���� ���� - ����ȣ/�����ڵ�/���¹�ȣ ���� ��뿩�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtre0010UseYn(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*���¹�ȣ              */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- �� ���� ���� - ����ȣ/�����ڵ�/���¹�ȣ ���� ���翩�� üũ
  *****************************************************************************/
  FUNCTION f_sRtre0010CountAcctNo(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*���¹�ȣ              */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �� ���� ���� - ���¼��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0010Seq (
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE         /*����ȣ              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- �� ���� ���� Select - �����¼��� �˾� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0010AccPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE         /*���¼���              */
    );

  /*****************************************************************************
  -- �� ���� ���� - ������� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0010UseYn (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -- �� ���� ���� Bank_Cd
  *****************************************************************************/
  FUNCTION f_sRtre0010BankCd(
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE           /*���¼���            */
    ) RETURN VARCHAR2;

END Pkg_Rtre0010;
/
