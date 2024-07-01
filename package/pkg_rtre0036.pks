CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0036 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0036
   PURPOSE   선수금 정리내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 선수금 정리내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0036Count(
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,          /*정리거래번호        */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE          /*정리거래일련번호    */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 정리내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0036 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*수납유형              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*정리구분              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 선수금 정리내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0036 (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*수납유형              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*정리구분              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 정리내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0036 (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*수납유형              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*정리구분              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 정리내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0036 (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 정리내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0036 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN OUT RTRE0036.SBS_ISEQ%TYPE,   /*정리거래일련번호      */
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Amt        IN RTRE0036.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0036.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0036.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0036.RECP_FG%TYPE,        /*수납유형              */
    v_Sbs_Tp         IN RTRE0036.SBS_TP%TYPE,         /*정리구분              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 선수금 정리내역 - 거래일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0036SbsIseq (
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE         /*정리거래번호          */
  ) RETURN NUMBER;


  /*****************************************************************************
  -- 선수금 정리내역 Select - 발생기준
  *****************************************************************************/
  PROCEDURE p_sRtre0036RecvRitm (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0036.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0036.RITM_SEQ%TYPE        /*거래일련번호          */
    );

  
  /*****************************************************************************
  -- 선수금 정리내역 관리 - RE-040115_선수금 정리 취소 처리: 기 정리된 선수금 정리내역에 대하여 선수정리 취소를 진행하는 프로세스임
  *****************************************************************************/
  PROCEDURE p_InsertRtre0036CleanAdvance     (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*정리일자              */
    v_Ord_No         IN RTRE0036.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0036.CUST_NO%TYPE,        /*고객번호              */
    v_Sbs_Seq        IN RTRE0036.SBS_SEQ%TYPE,        /*정리거래번호          */
    v_Sbs_Iseq       IN RTRE0036.SBS_ISEQ%TYPE,       /*정리거래일련번호      */
    v_Reg_Id         IN RTRE0036.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre0036;
/
