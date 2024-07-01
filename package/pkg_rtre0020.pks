CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0020 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0020
   PURPOSE   �� ī�� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �� ī�� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0020Count(
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE           /*ī�����            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ī�� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0020 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Str_Day        IN RTRE0020.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE0020.END_DAY%TYPE,        /*��������              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �� ī�� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ī�� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ī�� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*ī�����              */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ī�� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0020 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Crd_Seq        IN OUT RTRE0020.CRD_SEQ%TYPE,    /*ī�����              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �� ���� ���� - ����/���� ���� ���翩�� üũ
  *****************************************************************************/
  FUNCTION f_sRtre0020CrdSeq(
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE       /*��ȿ�Ⱓ              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- �� ī�� ���� - ī����� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0020Seq (
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE         /*����ȣ              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- �� ī�� ���� Select - ����ȣ ���� ī�� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtre0020CrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE         /*����ȣ              */
    );

  /*****************************************************************************
  -- �� ī�� ���� Select - ��ī�弱�� �˾� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0020CrdPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE         /*ī�����              */
    );
END Pkg_Rtre0020;
/
