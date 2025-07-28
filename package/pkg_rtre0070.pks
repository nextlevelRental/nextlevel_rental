CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0070 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0070
   PURPOSE   출금이체 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 출금이체 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0070Count(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE          /*출금이체일련번호    */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 내역 Count-Ord별 건수
  *****************************************************************************/
  FUNCTION f_sRtre0070OrdCount(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,         /*출금이체일련번호    */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 내역 Count-전체 건수
  *****************************************************************************/
  FUNCTION f_sRtre0070TotCount(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 내역 Count-Ord별 청구금액
  *****************************************************************************/
  FUNCTION f_sRtre0070RcmsAmt(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,         /*출금이체일련번호    */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 내역 Count-전체 청구금액
  *****************************************************************************/
  FUNCTION f_sRtre0070TotAmt(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0070 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0070.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Rcms_Amt       IN RTRE0070.RCMS_AMT%TYPE,       /*출금이체요청금액      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Bank_Cd        IN RTRE0070.BANK_CD%TYPE,        /*은행코드              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE          /*등록자 ID             */
    );
  /*****************************************************************************
  -- 출금이체 내역 Select(계약번호별 내역조회)
  *****************************************************************************/
  PROCEDURE p_sRtre0070AccTranByOrdNo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day_F     IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자FROM       */
    v_Rcms_Day_T     IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자TO         */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE       /*이체상태              */
    );    
  /*****************************************************************************
  -- 출금이체 내역 Select(은행별 내역조회)
  *****************************************************************************/
  PROCEDURE p_sRtre0070AccTranByBank (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day_F     IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자FROM       */
    v_Rcms_Day_T     IN RTRE0070.RCMS_DAY%TYPE        /*출금이체일자TO         */
    );       
  /*****************************************************************************
  -- 수금관리 > CMS관리 > 출금이체 대상 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0070AccTranTargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,        /*출금이체일자          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );    
  /*****************************************************************************
  -- 출금이체 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0070 (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0070.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Rcms_Amt       IN RTRE0070.RCMS_AMT%TYPE,       /*출금이체요청금액      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Bank_Cd        IN RTRE0070.BANK_CD%TYPE,        /*은행코드              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0070 (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0070.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Rcms_Amt       IN RTRE0070.RCMS_AMT%TYPE,       /*출금이체요청금액      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Bank_Cd        IN RTRE0070.BANK_CD%TYPE,        /*은행코드              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 내역 Update-상태 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0070RqstStat (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 출금이체 내역 Update-처리결과 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0070RqstResult (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 출금이체 내역 Update-수납처리후 수납거래번호 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0070RecvSeq (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 출금이체 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0070 (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0070 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN OUT RTRE0070.RCMS_SEQ%TYPE,   /*출금이체일련번호      */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0070.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Rcms_Amt       IN RTRE0070.RCMS_AMT%TYPE,       /*출금이체요청금액      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Bank_Cd        IN RTRE0070.BANK_CD%TYPE,        /*은행코드              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 출금이체 내역 - 출금이체일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0070RcmsSeq(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0070TransAccum (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,        /*출금이체일자          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );    


  /*****************************************************************************
  -- 출금이체 - 수납처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre0070TransReceive (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );    
    
    
  /*****************************************************************************
  -- 출금이체 내역 미 완료건 Count
  *****************************************************************************/
  FUNCTION f_sRtre0070ProcessCount(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 내역 결과 미반영 Count
  *****************************************************************************/
  FUNCTION f_sRtre0070ResultCount(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER;
    
END Pkg_Rtre0070;