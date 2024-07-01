CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0012 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0012
   PURPOSE   �������� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-20  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �������� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0012Count(
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,        /*�������� ����       */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE         /*�������� ����       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0012 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*����                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*����Ȯ�λ���          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*��������ڵ�          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*��������޽���        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*������                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*��ȸ��                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �������� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*����                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*����Ȯ�λ���          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*��������ڵ�          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*��������޽���        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*������                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*��ȸ��                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*����                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*����Ȯ�λ���          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*��������ڵ�          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*��������޽���        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*������                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*��ȸ��                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0012 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN OUT RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*����                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*����Ȯ�λ���          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*��������ڵ�          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*��������޽���        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*������                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*��ȸ��                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �������� ���� - �������� ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0012AcertSeq RETURN NUMBER;

  /*****************************************************************************
  -- �������� ���� - Ư���� ���� ���� ���� ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0012AcertChkSeq(
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE         /*���¹�ȣ              */
    ) RETURN NUMBER;
    
    /*****************************************************************************
  -- �������� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0012TodayExistsCmsInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Cust_Serial_No IN VARCHAR2                 /*�����������(YYMMDD), ����ڹ�ȣ  */
    );

  /*****************************************************************************
  -- ���ϰ��� �������� ���� Select
  *****************************************************************************/ 
  PROCEDURE p_sRtre0012TodayCmsInfos (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE         /*����ȣ              */
   );
   
END Pkg_Rtre0012;
/
