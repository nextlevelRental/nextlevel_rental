CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0111 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0111
   PURPOSE   채권 관리 세부내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 채권 관리 세부내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0111Count(
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,          /*채권관리년월        */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,           /*계약번호            */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,          /*고객번호            */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE           /*청구구분            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 세부내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0111 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*청구구분              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*결제일                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*연체회차              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*연체이자 수납금액     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*소유권이전여부        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 채권 관리 세부내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0111 (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*청구구분              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*결제일                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*연체회차              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*연체이자 수납금액     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*소유권이전여부        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 세부내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0111 (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*청구구분              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*결제일                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*연체회차              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*연체이자 수납금액     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*소유권이전여부        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 세부내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0111 (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*청구구분              */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 세부내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0111 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*청구구분              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*결제일                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*연체회차              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*연체이자 수납금액     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*소유권이전여부        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 채권 관리 세부내역 관리 - 채권대상 집계
  *****************************************************************************/
  PROCEDURE p_IUDRtre0111Aggregate (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*청구구분              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*결제일                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*연체회차              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*연체이자 수납금액     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*소유권이전여부        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 채권 관리 세부내역 Update - 채권대상 집계
  *****************************************************************************/
  FUNCTION f_UpdateRtre0111Aggregate (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*청구구분              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*결제일                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*연체회차              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*연체이자 수납금액     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*소유권이전여부        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;    

  /*****************************************************************************
  -- 채권 관리 세부내역 Select - 채권 대상 계약별 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0111OrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE         /*고객번호              */
    );

  /*****************************************************************************
  -- 채권 관리 세부내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0111Equal (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtre0111;