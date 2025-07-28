CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0041 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0041
   PURPOSE   온라인 결제 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 온라인 결제 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0041Count(
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 온라인 결제 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0041 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0041.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*수납유형              */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 온라인 결제 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0041 (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0041.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*수납유형              */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 온라인 결제 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0041 (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Tp        IN RTRE0041.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*수납유형              */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 온라인 결제 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0041 (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 온라인 결제 내역 관리- PG사 수납등록처리: 쇼핑몰에서 결제한 내역에 대하여 수납처리하는 함수
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041PgReceipt (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 온라인 결제 내역 관리- 수납취소처리: 수납등록된 내역에 대하여 취소 처리 하는 기능임
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041RecCancel (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 온라인 결제 내역 - 수납거래번호 체번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0041RecvSeq RETURN NUMBER;
  
  /*****************************************************************************
  -- 온라인 결제 내역 - 취소가능여부 판단 - 취소가능상태 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtre0041CncCount(
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER ;
    
  /*****************************************************************************
  -- 온라인 결제 내역 - 수납취소 - 원거래수납수정
  *****************************************************************************/
  FUNCTION f_UpdateRtre0041Cancel (
    v_Recv_Seq       IN RTRE0041.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Fg        IN RTRE0041.RECP_FG%TYPE,        /*수납유형              */
    v_Cnc_Rseq       IN RTRE0041.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0041.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 쇼핑몰 당월 청구내역조회
  *****************************************************************************/
  PROCEDURE p_sRtre0041RecvThisMonList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0100.SAFEKEY%TYPE         /*계약번호              */
    ) ;    
    
  /*****************************************************************************
  -- 쇼핑몰 전월 청구내역조회
  *****************************************************************************/
  PROCEDURE p_sRtre0041RecvPrvsMonList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0100.SAFEKEY%TYPE,         /*계약번호              */
    v_Start_Day      IN RTRE0030.RECV_DAY%TYPE,        /* 시작일자 */
    v_End_Day        IN RTRE0030.RECV_DAY%TYPE         /* 종료일자 */
    );
    
  /*****************************************************************************
  -- 쇼핑몰 연체내역조회
  *****************************************************************************/
  PROCEDURE p_sRtre0041ArreList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0100.SAFEKEY%TYPE         /*세이프키              */
    );         
    
  /*****************************************************************************
  -- 쇼핑몰 연체내역상세조회
  *****************************************************************************/
  PROCEDURE p_sRtre0041ArreDtlList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0109.ORD_NO%TYPE         /*세이프키              */
    );    
   
  /*****************************************************************************
  -- 쇼핑몰 연체내역상세조회(O2O연계)
  *****************************************************************************/
  PROCEDURE p_sRtre0041ArreDtlListNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0109.ORD_NO%TYPE,         /*세이프키              */
    v_Str_Day      IN RTSD0109.ZFB_DAY%TYPE,
    v_End_Day      IN RTSD0109.ZFB_DAY%TYPE
    );
     
  /*****************************************************************************
  -- 온라인 중도완납 결제 내역 관리- PG사 수납등록처리: 쇼핑몰에서 결제한 중도완납금액을 처리하는 함수(중도해지는 정책상 불가)
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041MfpPgReceipt (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
--    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*종료유형(S070:E,C)    */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Balance_Amt    IN RTSD0109.ARRE_AMT%TYPE,       /*선납금액            */
    v_Arre1_Amt      IN RTSD0109.ARRE_AMT%TYPE,       /*할인미대상            */
    v_Sale_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*총렌탈금액            */
    v_Recv_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*총수납금액(기존수납액) */
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    
    

  /*****************************************************************************
  --쇼핑몰 연체금 상세정보
  *****************************************************************************/
  PROCEDURE sRtre0041ShopOverdueInfo (
    Ref_Cursor     IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE         /* 계약번호             */
  );

  /*****************************************************************************
  --쇼핑몰 결제/신청 상세정보
  *****************************************************************************/
  PROCEDURE sRtre0041ShopApprovalInfo (
    Ref_Cursor     IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE         /* 계약번호              */
  );
  
  /*****************************************************************************
  -- 온라인 결제 내역 관리- PG사 수납등록처리: 쇼핑몰에서 결제한 선납할인에 대하여 수납처리하는 함수
  *****************************************************************************/
  PROCEDURE p_InsertRtre0041PgPrptReceipt (
    v_Recv_Day       IN RTRE0041.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0041.ORD_NO%TYPE,         /*계약번호              */
--    v_Cust_No        IN RTRE0041.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Id        IN RTRE0030.RECP_ID%TYPE,        /*수납자ID              */
    v_Recp_Amt       IN RTRE0041.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0041.RECP_PAY%TYPE,       /*수납방법              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Tno            IN RTRE0041.TNO%TYPE,            /*PG거래번호            */
    v_Dc_Cd          IN RTSD0025.DC_CD%TYPE,          /* 할인코드 */
    v_Prpt_Mon       IN RTSD0025.MAX_CNT%TYPE,        /* 선납개월 */        
    v_Reg_Id         IN RTRE0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    
  
END Pkg_Rtre0041;