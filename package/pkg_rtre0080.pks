CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0080 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0080
   PURPOSE   카드이체 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 카드이체 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0080Count(
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,         /*카드이체일자        */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE          /*카드이체일련번호    */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드이체 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0080 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0080.CRD_SEQ%TYPE,        /*카드순번              */
    v_Rcrd_Amt       IN RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Cardcom_Cd     IN RTRE0080.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*PG거래번호            */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE          /*등록자 ID             */
    );
  /*****************************************************************************
  -- 카드이체 내역 Select(계약번호별 내역조회)
  *****************************************************************************/
  PROCEDURE p_sRtre0080CrdTranByOrdNo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day_F     IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자FROM       */
    v_Rcrd_Day_T     IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자TO         */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE       /*이체상태              */
    );  
    
  /*****************************************************************************
  -- 카드이체 내역 Select(카드사별 내역조회)
  *****************************************************************************/
  PROCEDURE p_sRtre0080CrdTranByCard (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day_F     IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자FROM       */
    v_Rcrd_Day_T     IN RTRE0080.RCRD_DAY%TYPE        /*카드이체일자TO         */
    );   
  /*****************************************************************************
  -- 수금관리 > 카드이체관리 > 카드이체처리 > 카드이체대상조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0080CrdTranTargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,        /*카드이체일자          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );         
  /*****************************************************************************
  -- 카드이체 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0080 (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0080.CRD_SEQ%TYPE,        /*카드순번              */
    v_Rcrd_Amt       IN RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Cardcom_Cd     IN RTRE0080.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*PG거래번호            */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드이체 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0080 (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0080.CRD_SEQ%TYPE,        /*카드순번              */
    v_Rcrd_Amt       IN RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Cardcom_Cd     IN RTRE0080.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*PG거래번호            */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드이체 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0080 (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카드이체 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0080 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN OUT RTRE0080.RCRD_SEQ%TYPE,   /*카드이체일련번호      */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0080.CRD_SEQ%TYPE,        /*카드순번              */
    v_Rcrd_Amt       IN RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Cardcom_Cd     IN RTRE0080.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*PG거래번호            */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 카드이체 내역 
  *****************************************************************************/
  FUNCTION f_sRtre0080RcrdSeq(
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE          /*카드이체일자        */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 카드이체 대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0080CardTrans (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,        /*카드이체일자          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,          /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );    


  /*****************************************************************************
  -- 카드이체 - 수납처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre0080CardReceive (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );    
    
    
  /*****************************************************************************
  -- 카드이체 내역 Update-상태 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0080RqstStat (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 수금관리 > 카드이체처리 > 카드이체대상조회 Select(Batch_Key, Rcrd_Amt)
  *****************************************************************************/
  PROCEDURE p_sRtre0080BatchAndAmt (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,        /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,        /*카드이체일련번호      */
    v_Rcrd_Amt       OUT RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Batch_Key      OUT RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );  
    
           
  /*****************************************************************************
  -- 카드이체 내역 Update-처리결과 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0080RqstResult (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*KCP 거래번호          */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 카드이체 내역 Update - 수납처리후 수납거래번호 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0080RecvSeq (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 카드이체 내역 미 완료건 Count
  *****************************************************************************/
  FUNCTION f_sRtre0080ProcessCount(
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE          /*카드이체일자        */
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 카드이체 결과 반여 미 완료건 Count
  *****************************************************************************/
  FUNCTION f_sRtre0080ResultCount(
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE          /*카드이체일자        */
    ) RETURN NUMBER;
    
END Pkg_Rtre0080;