CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0091 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0091
   PURPOSE   현금영수증발급내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-14  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 현금영수증발급내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0091Count(
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE          /*현금영수증 발행 일련*/
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 현금영수증발급내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0091 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*파일순번              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*수납시간              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*고객명                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*거래구분              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*발행대상구분          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*현금영수증 식별번호   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*현금영수증 발행금액   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*현금영수증 발행 공급가*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*현금영수증 발행 부가세*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*원승인번호            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*원승인일자            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*취소여부              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 현금영수증발급내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*파일순번              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*수납시간              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*고객명                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*거래구분              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*발행대상구분          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*현금영수증 식별번호   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*현금영수증 발행금액   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*현금영수증 발행 공급가*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*현금영수증 발행 부가세*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*원승인번호            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*원승인일자            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*취소여부              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 현금영수증발급내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*파일순번              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*수납시간              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*고객명                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*거래구분              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*발행대상구분          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*현금영수증 식별번호   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*현금영수증 발행금액   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*현금영수증 발행 공급가*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*현금영수증 발행 부가세*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*원승인번호            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*원승인일자            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*취소여부              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 현금영수증발급내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 현금영수증발급내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0091 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN OUT RTRE0091.CASH_SEQ%TYPE,   /*현금영수증 발행 일련번*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*파일순번              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*수납시간              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*고객명                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*거래구분              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*발행대상구분          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*현금영수증 식별번호   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*현금영수증 발행금액   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*현금영수증 발행 공급가*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*현금영수증 발행 부가세*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*원승인번호            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*원승인일자            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*취소여부              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 현금영수증발급내역 Update - 현금영수증 발행상태
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashStat (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 현금영수증발급내역 Update - 현금영수증 발행상태
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashStat2 (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*파일순번              */
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    

  /*****************************************************************************
  -- 현금영수증발급내역 Update - 현금영수증 데이터 파일 파싱하여 생성
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashUload (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 현금영수증발급내역 - 현금영수증 발행 일련 획득
  *****************************************************************************/
  FUNCTION f_sRtre0091CashSeq(
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 현금영수증발급내역 Select - 발행일을 기준으로 발행대상에 대한 현황을 조회한다. 
  *****************************************************************************/
  PROCEDURE p_sRtre0091TargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    
    
    
  /*****************************************************************************
  -- 현금영수증관리 > 현금영수증 조회 select
  *****************************************************************************/
  PROCEDURE p_sRtre0091CashReceiptList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Day_F       IN RTRE0091.RECV_DAY%TYPE,        /*수납일자 조회시작일자           */
    v_Recv_Day_T       IN RTRE0091.RECV_DAY%TYPE,        /*수납일자 조회종료일자           */
    v_Cash_Day_F       IN RTRE0091.CASH_DAY%TYPE,        /*현금영수증 발행일자 조회시작일자*/
    v_Cash_Day_T       IN RTRE0091.CASH_DAY%TYPE,        /*현금영수증 발행일자 조회종료일자*/  
    v_Cust_No          IN RTRE0091.CUST_NO%TYPE,         /*고객번호*/ 
    v_Cash_Stat        IN RTRE0091.CASH_STAT%TYPE,       /*현금영수증 발행상태*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    );     


  /*****************************************************************************
  -- 현금영수증발급내역 - 현금영수증 결과 내역을 기준으로 수납내역에 발행여부 업데이트 처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0091CashReltApply (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
        
END Pkg_Rtre0091;
/
