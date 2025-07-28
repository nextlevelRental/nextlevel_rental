CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0012 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0012
   PURPOSE   계좌인증 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-20  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계좌인증 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0012Count(
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,        /*계좌인증 일자       */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE         /*계좌인증 순번       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌인증 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0012 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*사업자번호            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*고객명                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*계좌확인상태          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*인증결과코드          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*인증결과메시지        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*예금주                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*조회수                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 계좌인증 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*사업자번호            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*고객명                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*계좌확인상태          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*인증결과코드          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*인증결과메시지        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*예금주                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*조회수                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌인증 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*사업자번호            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*고객명                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*계좌확인상태          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*인증결과코드          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*인증결과메시지        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*예금주                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*조회수                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌인증 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌인증 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0012 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN OUT RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*사업자번호            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*고객명                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*계좌확인상태          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*인증결과코드          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*인증결과메시지        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*예금주                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*조회수                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계좌인증 내역 - 계좌인증 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0012AcertSeq RETURN NUMBER;

  /*****************************************************************************
  -- 계좌인증 내역 - 특정일 계좌 인증 성공 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0012AcertChkSeq(
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE         /*계좌번호              */
    ) RETURN NUMBER;
    
    /*****************************************************************************
  -- 계좌인증 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0012TodayExistsCmsInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Serial_No IN VARCHAR2                 /*법정생년월일(YYMMDD), 사업자번호  */
    );

  /*****************************************************************************
  -- 당일계좌 정상인증 내역 Select
  *****************************************************************************/ 
  PROCEDURE p_sRtre0012TodayCmsInfos (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE         /*고객번호              */
   );
   
END Pkg_Rtre0012;