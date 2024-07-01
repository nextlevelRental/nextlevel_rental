CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0030 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0030
   PURPOSE   수납 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 수납 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0030Count(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수납 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0030.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*수납유형              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*현금영수증 발행여부   */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*수납취소거래일련번호  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*수납취소거래번호 종료 */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 수납 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0030 (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0030.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*수납유형              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*현금영수증 발행여부   */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*수납취소거래일련번호  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*수납취소거래번호 종료 */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수납 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0030 (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0030.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*수납유형              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*현금영수증 발행여부   */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*수납취소거래일련번호  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*수납취소거래번호 종료 */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수납 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0030 (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수납 내역 관리 - 수납등록처리:수납내역생성처리
  *****************************************************************************/
  PROCEDURE p_InsertRtre0030 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0030.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0030.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0030.RECP_FG%TYPE,        /*수납유형              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Rear_Amt       NUMBER,                          /*미납수납금액          */ 
    v_Pnd_Amt        NUMBER,                          /*선수금수납금액        */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 수납 내역 관리 - 수납취소처리:수납내역생성처리
  *****************************************************************************/
  PROCEDURE p_InsertRtre0030Cancel (
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- CMS 수납세부 내역 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030Detail(
    Ref_Cursor       IN OUT SYS_REFCURSOR,  
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE          /*수납거래번호        */
    );    
  /*****************************************************************************
  -- 수납 내역 - 수납거래번호 체번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030RecvSeq RETURN NUMBER;
  
  /*****************************************************************************
  -- 수납 내역 - 거래일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030RitmSeq(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 수납 내역 Count - 수납거래번호 기준 현금영수증 발행여부(건수) 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030CashYnCnt(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 수납 내역 -  수납거래번호로 선수금(합계) 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030RecpAmtSum(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE        /*수납거래번호          */
    ) RETURN NUMBER;


  
  /*****************************************************************************
  -- 수납 내역 -  수납거래번호로 수납취소 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtre0030CncStatYCnt(
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE        /*수납거래번호          */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 수납 내역 Update - 수납 취소에 따른 취소정보 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0030CncBefore (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Cnc_Stat       IN RTRE0030.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Iseq       IN RTRE0030.CNC_ISEQ%TYPE,       /*수납취소거래일련번호  */
    v_Cnc_Ioseq      IN RTRE0030.CNC_IOSEQ%TYPE,      /*수납취소거래번호 종료 */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 수납 내역 Update - 대상집계된 수납내역의 현금영수증 발행여부(CASH_YN) 에 'P' (발행처리중) 값으로 업데이트 한다. 
  *****************************************************************************/
  FUNCTION f_UpdateRtre0030Aggregate (
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Yn        IN RTRE0030.CASH_YN%TYPE,        /*현금영수증 발행여부   */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수납거래번호에 대하여 수납방법코드를 조회한다. 
  *****************************************************************************/
  FUNCTION f_sRtre0030Recp_Pay (
    v_Recv_Seq      IN RTRE0030.RECV_SEQ%TYPE       /*수납거래번호          */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 수납 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0030AFRecpAmtSum(
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE        /*스케줄순번            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 수납 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030RecvList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0030.SCHD_SEQ%TYPE        /*스케줄순번            */
    );
    
  /*****************************************************************************
  --  쇼핑몰연체내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0030ShopArreList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key         IN RTSD0100.SAFEKEY%TYPE         /*세이프키              */
    );        
  
  PROCEDURE p_InsertRtre0030Cancel_Ritm (
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*수납순서              */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
                          
END Pkg_Rtre0030;
/
