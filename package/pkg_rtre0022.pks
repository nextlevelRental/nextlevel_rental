CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0022 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0022
   PURPOSE   ī������ ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-21  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ī������ ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0022Count(
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,        /*ī����������        */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE         /*ī����������        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī������ ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0022 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*ī����������          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*������                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*����                */
    v_Mob_No         IN RTRE0022.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Email_Addr     IN RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ī������ ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0022 (
    v_Ccert_Day      IN OUT RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Ccert_Seq      IN OUT RTRE0022.CCERT_SEQ%TYPE,      /*ī����������          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*������                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*����                */
    v_Mob_No         IN OUT RTRE0022.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Email_Addr     IN OUT RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2,
    v_Return_Message OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī������ ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0022 (
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*ī����������          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*������                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*����                */
    v_Mob_No         IN RTRE0022.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Email_Addr     IN RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*����� ID             */
    v_Res_Cd         IN RTRE0022.RES_CD%TYPE,         /* �����ڵ�*/
    v_Res_Msg        IN RTRE0022.RES_MSG%TYPE,        /* ����޽���*/
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī������ ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0022 (
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*ī����������          */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī������ ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0022 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ccert_Day      IN OUT RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Ccert_Seq      IN OUT RTRE0022.CCERT_SEQ%TYPE,      /*ī����������          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*������                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*����                */
    v_Mob_No         IN OUT RTRE0022.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Email_Addr     IN OUT RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*����� ID             */
    v_Res_Cd         IN RTRE0022.RES_CD%TYPE,         /* �����ڵ�*/
    v_Res_Msg        IN RTRE0022.RES_MSG%TYPE,        /* ����޽���*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  --  ī������ ���� - ī������ ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0022CcertSeq RETURN NUMBER;
  
  
  /*****************************************************************************
  --  ī������ ����  - Ư���� ī�� ���� ���� ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0022CcertChkSeq(
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE         /*ī���ȣ              */
    ) RETURN NUMBER;

END Pkg_Rtre0022;
/
