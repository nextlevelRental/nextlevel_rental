CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0081 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0081
   PURPOSE   카드이체 대상 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 카드이체 대상 Count
  *****************************************************************************/
  FUNCTION f_sRtre0081Count(
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,         /*카드이체일자        */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,           /*계약번호            */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE          /*스케줄순번          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드이체 대상 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0081 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 카드이체 청구세부 내역 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0081Detail (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE        /*카드이체일련번호      */ 
    ); 
    
  /*****************************************************************************
  -- 카드이체 대상 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0081 (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드이체 대상 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0081 (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드이체 대상 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0081 (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드이체 대상 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0081 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN OUT RTRE0081.SCHD_SEQ%TYPE,   /*스케줄순번            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 카드이체 대상 - 스케줄순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0081SchdSeq(
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,         /*카드이체일자        */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;


    
  /*****************************************************************************
  -- 카드이체 대상 집계
  *****************************************************************************/
  PROCEDURE p_CreateRtre0081CardTrans (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Trans_Type     IN CHAR,                         /*출금대상구분          */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

    
  /*****************************************************************************
  -- 카드이체 대상 집계(RCRD_SEQ Udate)
  *****************************************************************************/
  FUNCTION f_URtre0081CardTrans(
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,         /*카드이체일자        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- CLOB 자료Parsing 
  *****************************************************************************/
  PROCEDURE p_Rtre0081ClobParsing(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Clob_Data      IN RTRE0099.FILE_DATA%TYPE,          /*CLOB자료          */
    v_Clob_Type      IN VARCHAR,                          /*CLOB TYPE         */
    v_Type           IN VARCHAR,                          /*Parsing 구분자    */
    v_Spe_Yn         IN VARCHAR,                          /*별도처리여부      */
    v_Spe_Pos        IN NUMBER,                           /*별도처리위치      */
    v_Row_Count      IN OUT NUMBER,                       /*데이터총건수      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    

  /*****************************************************************************
  -- CLOB 자료Parsing TEST
  *****************************************************************************/
  PROCEDURE p_Rtre0081ClobTest(
    Ref_Cursor       OUT SYS_REFCURSOR,
    v_Test           IN  VARCHAR,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    

  /*****************************************************************************
  -- 카드이체 진행 CHECK
  *****************************************************************************/
  PROCEDURE p_sRtre0081Processing (
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Rcrd_Day       OUT RTRE0081.RCRD_DAY%TYPE,      /*카드이체일자          */
    v_Rcrd_Amt       OUT RTRE0080.RCRD_AMT%TYPE,      /*카드이체금액          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


END Pkg_Rtre0081;