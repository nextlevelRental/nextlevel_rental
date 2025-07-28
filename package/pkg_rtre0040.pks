CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0040 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0040
   PURPOSE   무통장 수납내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 무통장 수납내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0040Count(
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 무통장 수납내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0040 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*수납자 ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 무통장 수납내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*수납자 ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 무통장 수납내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*수납자 ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 무통장 수납내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 무통장 수납내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0040 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Recv_Seq       IN OUT RTRE0040.RECV_SEQ%TYPE,   /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*수납자 ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 무통장 수납내역 - 수납거래번호 체번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0040RecvSeq RETURN NUMBER;
  
  /*****************************************************************************
  -- 무통장 수납내역 - 취소가능여부 판단 - 취소가능상태 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtre0040CncCount(
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER;
      
  /*****************************************************************************
  -- 무통장 수납내역 - 수납취소 - 원거래수납수정
  *****************************************************************************/
  FUNCTION f_UpdateRtre0040Cancel (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtre0040;