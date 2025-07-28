CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0040 AS
/*******************************************************************************
   NAME:      PKG_RTSD0040
   PURPOSE    계약별할인정보

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-09  sePark         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계약별 할인정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0040 (
    v_Ord_No         IN RTSD0040.ORD_NO%TYPE,         /* 계약번호             */
    v_Seq            IN RTSD0040.SEQ%TYPE,            /* 순번                 */
    v_Rent_Amt       IN RTSD0106.RENT_AMT%TYPE,       /*월렌탈료(조견표)      */
    v_Mon_Dcamt      IN RTSD0106.MON_DCAMT%TYPE,      /*월렌탈료 할인액       */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

    /*****************************************************************************
  --계약별 할인정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0040 (
    v_Ord_No         IN RTSD0040.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER;
  
END PKG_RTSD0040;