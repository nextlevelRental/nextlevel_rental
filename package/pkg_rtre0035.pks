CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0035 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0035
   PURPOSE   선수금 발생내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-31  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 선수금 발생내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0035Count(
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 발생내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0035 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0035.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0035.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0035.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0035.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0035.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 선수금 발생내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0035 (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0035.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0035.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0035.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0035.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0035.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 발생내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0035 (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0035.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0035.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0035.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0035.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0035.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 발생내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0035 (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 발생내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0035 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN OUT RTRE0035.RITM_SEQ%TYPE,   /*거래일련번호          */
    v_Pnd_Day        IN RTRE0035.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0035.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0035.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0035.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0035.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 선수금 발생내역 - 거래일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0035Ritm_Seq(
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 선수금 발생내역 - 계약번호/고객번호 기준 선수금 잔액(합산) 획득
  *****************************************************************************/
  FUNCTION f_sRtre0035BalanceAmt (
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE         /*고객번호              */
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -- 선수금 발생내역 - 계약번호/고객번호 기준 선수금 잔액(합산) 획득
  *****************************************************************************/
  FUNCTION f_sRtre0035BalanceAmt2 (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER;
                                                            
  /*****************************************************************************
  -- 선수금 발생내역 - 선수 정리금액 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0035SbsAmt (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 선수금 발생내역 Select - 조건별/구분별
  *****************************************************************************/
  PROCEDURE p_sRtre0035OrdCust (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE        /*구분                  */
    );


  /*****************************************************************************
  -- 선수금정리 - 건별 수납처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035PartClear (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*선수정리기준일자      */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Type           IN VARCHAR,                      /*처리구분 P:part A:All */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );


  /*****************************************************************************
  -- 선수금정리 - 선수금 전체처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035AllClear (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*선수정리기준일자      */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );
    
  /*****************************************************************************
  -- 선수금정리 - 중도완납선수금 수납처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035MfpPartClear (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*선수정리기준일자      */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Type           IN VARCHAR,                      /*처리구분 P:part A:All */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );
        
  /*****************************************************************************
  -- 선수금정리 - 패키지 해지시  위약금  수납처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035PkgClear (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*선수정리기준일자      */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Type           IN VARCHAR,                      /*처리구분 P:part A:All */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );    
    
  /*****************************************************************************
  -- 선수금환불 - 선수금 환불 처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035Refund (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );
    
END Pkg_Rtre0035;
/