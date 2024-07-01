CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0112 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0112
   PURPOSE   당월청구 세부 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 당월청구 세부 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0112Count(
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,          /*채권관리년월        */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,           /*계약번호            */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,          /*고객번호            */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE          /*청구순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 당월청구 세부 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0112 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*이체일                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 당월청구 세부 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0112 (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*이체일                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 당월청구 세부 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0112 (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*이체일                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 당월청구 세부 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0112 (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 당월청구 세부 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0112 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*이체일                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 당월청구 세부 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0112Equal (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

END Pkg_Rtre0112;
/
