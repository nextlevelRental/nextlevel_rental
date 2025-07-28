CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0310 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0310
   PURPOSE   청구중지대상등록

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-07-15  kstka         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 청구중지대상 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0310 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_FDay     IN RTSD0108.PROC_DAY%TYPE,
    v_Proc_TDay     IN RTSD0108.PROC_DAY%TYPE,
    v_Ord_No         IN RTRE0310.ORD_NO%TYPE
    );
    
  /*****************************************************************************
  -- 청구중지대상 등록
  *****************************************************************************/
  FUNCTION f_InsertRtre0310 (
    v_Ord_No        IN RTRE0310.ORD_NO%TYPE,       /*연체기준일자          */
    v_Appr_Flag     IN RTRE0310.APPR_FLAG%TYPE,        /*고객번호              */
    v_Use_Yn         IN RTRE0310.USE_YN%TYPE,       /*청구순번              */
    v_Pay_Mthd      IN RTRE0310.PAY_MTHD%TYPE,       /*청구순번              */
    v_Reg_Id          IN RTRE0310.REG_ID%TYPE,       /*청구순번              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

   /*****************************************************************************
  -- 청구중지대상 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0310 (
    v_Ord_No        IN RTRE0310.ORD_NO%TYPE,       /*연체기준일자          */
    v_Seq             IN RTRE0310.SEQ%TYPE,        /*고객번호              */
    v_Appr_Flag     IN RTRE0310.APPR_FLAG%TYPE,        /*고객번호              */
    v_Use_Yn         IN RTRE0310.USE_YN%TYPE,       /*청구순번              */
    v_Pay_Mthd      IN RTRE0310.PAY_MTHD%TYPE,       /*청구순번              */
    v_Reg_Id          IN RTRE0310.REG_ID%TYPE,       /*청구순번              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 당월연체내역집계
  *****************************************************************************/
  PROCEDURE p_IUDRtre0310 (
    v_Comm_Dvsn  IN VARCHAR2,
    v_Ord_No        IN RTRE0310.ORD_NO%TYPE,       /*연체기준일자          */
    v_Seq             IN RTRE0310.SEQ%TYPE,        /*고객번호              */
    v_Appr_Flag     IN RTRE0310.APPR_FLAG%TYPE,        /*고객번호              */
    v_Use_Yn         IN RTRE0310.USE_YN%TYPE,       /*청구순번              */
    v_Pay_Mthd      IN RTRE0310.PAY_MTHD%TYPE,       /*청구순번              */
    v_Reg_Id          IN RTRE0310.REG_ID%TYPE,       /*청구순번              */
    v_Success_code    OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
       
END Pkg_Rtre0310;