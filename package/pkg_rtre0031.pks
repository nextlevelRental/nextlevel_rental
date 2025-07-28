CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0031 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0031
   PURPOSE   수납 대상 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 수납 대상 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0031Count(
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수납 대상 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0031 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 수납 대상 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0031 (
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수납 대상 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0031 (
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수납 대상 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0031 (
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수납 대상 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0031 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 수납 대상 내역 - 거래일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0031RitmSeq(
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER;
    
END Pkg_Rtre0031;