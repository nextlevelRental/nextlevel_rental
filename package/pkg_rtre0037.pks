CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0037 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0037
   PURPOSE   선수금 잔액내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-15  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 선수금 잔액내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0037Count(
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,        /*마감기준일자        */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 잔액내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0037 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 선수금 잔액내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0037 (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 잔액내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0037 (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 잔액내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0037 (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 선수금 잔액내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0037 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 선수금 잔액내역 집계
  *****************************************************************************/
  PROCEDURE p_Rtre0037PreAccum (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(Y:재처리)    */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtre0037;