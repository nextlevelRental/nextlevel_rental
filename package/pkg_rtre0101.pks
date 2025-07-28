CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0101 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0101
   PURPOSE   연체대상 세부 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 연체대상 세부 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0101Count(
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,         /*연체기준일자        */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,           /*계약번호            */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,          /*고객번호            */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE          /*청구순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체대상 세부 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0101 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*이체일                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE          /*등록자 ID             */
    );
    
  /*****************************************************************************
  -- 연체 청구세부 내역 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0101Detail (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,        /*연체기준일자         */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,          /*계약번호             */ 
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE          /*고객번호             */    
    );     

  /*****************************************************************************
  -- 연체대상 세부 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0101 (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*이체일                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체대상 세부 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0101 (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*이체일                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체대상 세부 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0101 (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체대상 세부 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0101 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*이체일                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 연체대상 세부 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0101DelyDayAll (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtre0101;