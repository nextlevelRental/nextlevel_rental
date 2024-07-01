CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0020 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0020
   PURPOSE   고객 카드 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 고객 카드 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtre0020Count(
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE           /*카드순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 카드 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0020 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Str_Day        IN RTRE0020.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE0020.END_DAY%TYPE,        /*종료일자              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 고객 카드 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 카드 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 카드 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 카드 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0020 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Crd_Seq        IN OUT RTRE0020.CRD_SEQ%TYPE,    /*카드순번              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 고객 계좌 정보 - 은행/계좌 기준 존재여부 체크
  *****************************************************************************/
  FUNCTION f_sRtre0020CrdSeq(
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE       /*유효기간              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 고객 카드 정보 - 카드순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0020Seq (
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE         /*고객번호              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 고객 카드 정보 Select - 고객번호 기준 카드 리스트
  *****************************************************************************/
  PROCEDURE p_sRtre0020CrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE         /*고객번호              */
    );

  /*****************************************************************************
  -- 고객 카드 정보 Select - 고객카드선택 팝업 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0020CrdPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE         /*카드순번              */
    );
END Pkg_Rtre0020;
/
