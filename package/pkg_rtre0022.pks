CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0022 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0022
   PURPOSE   카드인증 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-21  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 카드인증 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0022Count(
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,        /*카드인증일자        */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE         /*카드인증순번        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드인증 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0022 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*카드인증순번          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*예금주                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*사업자번호            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*고객명                */
    v_Mob_No         IN RTRE0022.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Email_Addr     IN RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 카드인증 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0022 (
    v_Ccert_Day      IN OUT RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Ccert_Seq      IN OUT RTRE0022.CCERT_SEQ%TYPE,      /*카드인증순번          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*예금주                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*사업자번호            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*고객명                */
    v_Mob_No         IN OUT RTRE0022.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Email_Addr     IN OUT RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2,
    v_Return_Message OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드인증 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0022 (
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*카드인증순번          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*예금주                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*사업자번호            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*고객명                */
    v_Mob_No         IN RTRE0022.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Email_Addr     IN RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*등록자 ID             */
    v_Res_Cd         IN RTRE0022.RES_CD%TYPE,         /* 응답코드*/
    v_Res_Msg        IN RTRE0022.RES_MSG%TYPE,        /* 응답메시지*/
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드인증 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0022 (
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*카드인증순번          */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드인증 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0022 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ccert_Day      IN OUT RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Ccert_Seq      IN OUT RTRE0022.CCERT_SEQ%TYPE,      /*카드인증순번          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*예금주                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*사업자번호            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*고객명                */
    v_Mob_No         IN OUT RTRE0022.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Email_Addr     IN OUT RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*등록자 ID             */
    v_Res_Cd         IN RTRE0022.RES_CD%TYPE,         /* 응답코드*/
    v_Res_Msg        IN RTRE0022.RES_MSG%TYPE,        /* 응답메시지*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  --  카드인증 내역 - 카드인증 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0022CcertSeq RETURN NUMBER;
  
  
  /*****************************************************************************
  --  카드인증 내역  - 특정일 카드 인증 성공 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0022CcertChkSeq(
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE         /*카드번호              */
    ) RETURN NUMBER;

END Pkg_Rtre0022;
/
