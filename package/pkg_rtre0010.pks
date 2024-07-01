CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0010 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0010
   PURPOSE   고객 계좌 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 고객 계좌 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtre0010Count(
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE           /*계좌순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 계좌 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0010 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Str_Day        IN RTRE0010.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE0010.END_DAY%TYPE,        /*종료일자              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*사업자번호            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*계좌번호              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 고객 계좌 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*사업자번호            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*계좌번호              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 계좌 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*사업자번호            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*계좌번호              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 계좌 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 계좌 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0010 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Acc_Seq        IN OUT RTRE0010.ACC_SEQ%TYPE,    /*계좌순번              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*사업자번호            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*계좌번호              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 고객 계좌 정보 Select - 고객번호 기준 계좌 리스트
  *****************************************************************************/
  PROCEDURE p_sRtre0010CustNoList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE         /*고객번호              */
    );

  /*****************************************************************************
  -- 고객 계좌 정보 - 고객번호/은행코드/계좌번호 기준 계좌순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0010AcctNo(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*계좌번호              */
    ) RETURN VARCHAR;
  
  /*****************************************************************************
  -- 고객 계좌 정보 - 고객번호/은행코드/계좌번호 기준 사용여부 조회
  *****************************************************************************/
  FUNCTION f_sRtre0010UseYn(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*계좌번호              */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- 고객 계좌 정보 - 고객번호/은행코드/계좌번호 기준 존재여부 체크
  *****************************************************************************/
  FUNCTION f_sRtre0010CountAcctNo(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*계좌번호              */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 고객 계좌 정보 - 계좌순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0010Seq (
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE         /*고객번호              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 고객 계좌 정보 Select - 고객계좌선택 팝업 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0010AccPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE         /*계좌순번              */
    );

  /*****************************************************************************
  -- 고객 계좌 정보 - 사용유무 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0010UseYn (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -- 고객 계좌 정보 Bank_Cd
  *****************************************************************************/
  FUNCTION f_sRtre0010BankCd(
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE           /*계좌순번            */
    ) RETURN VARCHAR2;

END Pkg_Rtre0010;
/
