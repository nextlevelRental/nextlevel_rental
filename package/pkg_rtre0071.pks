CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0071 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0071
   PURPOSE   출금이체 대상 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 출금이체 대상 Count
  *****************************************************************************/
  FUNCTION f_sRtre0071Count(
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,           /*계약번호            */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE          /*스케줄순번          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 대상 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0071 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*은행코드              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE          /*등록자 ID             */
    );
    
    
  /*****************************************************************************
  -- CMS 청구세부 내역 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0071Detail (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE        /*출금이체일련번호      */ 
    );    

  /*****************************************************************************
  -- 출금이체 대상 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0071 (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*은행코드              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 대상 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0071 (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*은행코드              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 대상 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0071 (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 대상 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0071 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN OUT RTRE0071.SCHD_SEQ%TYPE,   /*스케줄순번            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*은행코드              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 출금이체 대상 - 스케줄순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0071SchdSeq(
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;

    
  /*****************************************************************************
  -- 출금이체 대상 집계
  *****************************************************************************/
  PROCEDURE p_CreateRtre0071TransAccum (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Trans_Type     IN CHAR,                         /*출금대상구분          */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 출금이체 대상 집계(RCMS_SEQ Udate)
  *****************************************************************************/
  FUNCTION f_URtre0071TransAccum(
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

    
  /*****************************************************************************
  -- 출금이체 진행 CHECK
  *****************************************************************************/
  PROCEDURE p_sRtre0071Processing (
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Rcms_Day       OUT RTRE0071.RCMS_DAY%TYPE,      /*출금이체일자          */
    v_Rcms_Amt       OUT RTRE0070.RCMS_AMT%TYPE,      /*출금이체금액          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


END Pkg_Rtre0071;
/
