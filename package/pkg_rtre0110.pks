CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0110 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0110
   PURPOSE   채권 관리 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 채권 관리 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0110Count(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,          /*채권관리년월        */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0110 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE       /*채권계정등급          */
    );

  /*****************************************************************************
  -- 채권 관리 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*채권계정등급          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*연체이자수납금액      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*채권관리자            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*계약건수              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*채권계정등급          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*연체이자수납금액      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*채권관리자            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*계약건수              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0110 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*채권계정등급          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*연체이자수납금액      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*채권관리자            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*계약건수              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 채권 관리 - RE-040111 채권대상집계-채권관리대상 집계
  *****************************************************************************/
  PROCEDURE p_InsertRtre0110Aggregate (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Proc_Yn        IN VARCHAR,                      /*처리가능 여부         */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 채권 관리 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0110AfterCount(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE           /*채권관리년월        */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 채권 관리 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0110EqualCount(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE           /*채권관리년월        */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 채권 관리 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0110Equal (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
        
END Pkg_Rtre0110;