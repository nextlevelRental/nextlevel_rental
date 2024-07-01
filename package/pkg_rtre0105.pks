CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0105 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0105
   PURPOSE   당월연체SMS발송

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-06-16  kstka         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 당월연체내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0105 (
    Ref_Cursor       IN OUT SYS_REFCURSOR
    );

  /*****************************************************************************
  -- 당월연체내역 count
  *****************************************************************************/
  FUNCTION p_sRtre0105Cnt (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 당월연체내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0105 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Rcms_Day     IN RTRE0070.RCMS_DAY%TYPE,         /*계약번호              */
    v_Rcrd_Day      IN RTRE0080.RCRD_DAY%TYPE,        /*고객번호              */
    v_Pay_Dd         IN RTSD0109.SCHD_SEQ%TYPE,       /*청구순번              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 당월연체내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0105All(
    v_ErrorText      OUT VARCHAR2
  )  RETURN NUMBER;
 
  /*****************************************************************************
  -- 연체대상 특정 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0105(
    v_Ord_No        IN VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  )  RETURN NUMBER;
  
  /*****************************************************************************
  -- 당월연체내역집계
  *****************************************************************************/
  PROCEDURE p_ProcessRtre0105 (
    v_Dely_Day          IN RTRE0100.DELY_DAY%TYPE,
    v_Rcms_Day        IN RTRE0070.RCMS_DAY%TYPE,
    v_Rcrd_Day         IN RTRE0080.RCRD_DAY%TYPE,
    v_Pay_Dd            IN RTSD0109.PAY_DD%TYPE,
    v_Success_code    OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
       
END Pkg_Rtre0105;
/