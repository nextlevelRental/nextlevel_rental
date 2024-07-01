CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0092 AS 
/*******************************************************************************
   NAME:      Pkg_Rtre0092
   PURPOSE   현금영수증 실시간 처리 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-11-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtre0092Count(
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,         /*현금영수증 발행 일련*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE         /*현금영수증 이력번호 */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0092 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Cash_Day       IN RTRE0092.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0092.FILE_SEQ%TYPE,       /*파일순번              */
    v_Recv_Day       IN RTRE0092.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Time      IN RTRE0092.RECV_TIME%TYPE,      /*수납시간              */
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,        /*고객명                */
    v_Cashd_Tp       IN RTRE0092.CASHD_TP%TYPE,       /*거래구분              */
    v_Cashd_Fg       IN RTRE0092.CASHD_FG%TYPE,       /*발행대상구분          */
    v_Chi_No         IN RTRE0092.CHI_NO%TYPE,         /*현금영수증 식별번호   */
    v_Cash_Amt       IN RTRE0092.CASH_AMT%TYPE,       /*현금영수증 발행금액   */
    v_Cash_Namt      IN RTRE0092.CASH_NAMT%TYPE,      /*현금영수증 발행 공급가*/
    v_Cash_Vamt      IN RTRE0092.CASH_VAMT%TYPE,      /*현금영수증 발행 부가세*/
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Ocapp_No       IN RTRE0092.OCAPP_NO%TYPE,       /*원승인번호            */
    v_Ocash_Day      IN RTRE0092.OCASH_DAY%TYPE,      /*원승인일자            */
    v_Cnc_Yn         IN RTRE0092.CNC_YN%TYPE,         /*취소여부              */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*현금영수증 거래번호   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*현금영수증 승인시간   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*등록상태코드          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*등록상태설명          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0092 (
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Cash_Day       IN RTRE0092.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0092.FILE_SEQ%TYPE,       /*파일순번              */
    v_Recv_Day       IN RTRE0092.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Time      IN RTRE0092.RECV_TIME%TYPE,      /*수납시간              */
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,        /*고객명                */
    v_Cashd_Tp       IN RTRE0092.CASHD_TP%TYPE,       /*거래구분              */
    v_Cashd_Fg       IN RTRE0092.CASHD_FG%TYPE,       /*발행대상구분          */
    v_Chi_No         IN RTRE0092.CHI_NO%TYPE,         /*현금영수증 식별번호   */
    v_Cash_Amt       IN RTRE0092.CASH_AMT%TYPE,       /*현금영수증 발행금액   */
    v_Cash_Namt      IN RTRE0092.CASH_NAMT%TYPE,      /*현금영수증 발행 공급가*/
    v_Cash_Vamt      IN RTRE0092.CASH_VAMT%TYPE,      /*현금영수증 발행 부가세*/
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Ocapp_No       IN RTRE0092.OCAPP_NO%TYPE,       /*원승인번호            */
    v_Ocash_Day      IN RTRE0092.OCASH_DAY%TYPE,      /*원승인일자            */
    v_Cnc_Yn         IN RTRE0092.CNC_YN%TYPE,         /*취소여부              */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*현금영수증 거래번호   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*현금영수증 승인시간   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*등록상태코드          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*등록상태설명          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 - 이력번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0092CashIseq(
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE          /*현금영수증 발행 일련*/
    ) RETURN NUMBER;
    

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 - 현금영수증 발행/취소를 위한 데이터 조회 및 이력 생성 처리 한다.
  *****************************************************************************/
  PROCEDURE p_IRtre0092CreateCashApp (
    v_Job_Gb         IN  VARCHAR2,                     /*작업구분(C:발행,D:취소*/
    v_Recv_Seq       IN  RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN  RTRE0092.REG_ID%TYPE,         /*등록자 ID             */
    v_Cash_Seq       OUT RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/    
    v_Cash_Iseq      OUT RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Ordr_Idxx      OUT VARCHAR2,                     /*주문구분번호          */ 
    v_Good_Nm        OUT VARCHAR2,                     /*상품명                */ 
    v_Buyr_Nm        OUT VARCHAR2,                     /*주문자명              */ 
    v_Buyr_Tel       OUT VARCHAR2,                     /*주문자 전화번호       */ 
    v_Req_Tx         OUT VARCHAR2,                     /*요청 종류             */ 
    v_Co_Type        OUT VARCHAR2,                     /*사업장 구분           */ 
    v_Ctax_Type      OUT VARCHAR2,                     /*과세/면세 구분        */ 
    v_Ctax_No        OUT VARCHAR2,                     /*발행 사업자번호       */ 
    v_Co_Nm          OUT VARCHAR2,                     /*상호                  */ 
    v_Cowner_Nm      OUT VARCHAR2,                     /*대표자명              */ 
    v_Co_Add         OUT VARCHAR2,                     /*사업장 주소           */ 
    v_Co_Tel         OUT VARCHAR2,                     /*사업장 대표 연락처    */ 
    v_Trad_Tm        OUT VARCHAR2,                     /*원 거래시각           */ 
    v_Tr_Code        OUT VARCHAR2,                     /*발행용도              */ 
    v_Id_Info        OUT VARCHAR2,                     /*신분확인 ID           */ 
    v_Amt_Tot        OUT VARCHAR2,                     /*거래금액 총 합        */ 
    v_Amt_Sup        OUT VARCHAR2,                     /*공급가액              */ 
    v_Amt_Svc        OUT VARCHAR2,                     /*봉사료                */ 
    v_Amt_Tax        OUT VARCHAR2,                     /*부가가치세            */ 
    v_Mod_Type       OUT VARCHAR2,                     /*변경 타입             */ 
    v_Mod_Gb         OUT VARCHAR2,                     /*변경요청 거래번호 구분*/ 
    v_Mod_Val        OUT VARCHAR2,                     /*변경요청 거래번호     */ 
    v_Mod_Mny        OUT VARCHAR2,                     /*변경요청 금액         */ 
    v_Rem_Mny        OUT VARCHAR2,                     /*변경처리 이전 금액    */ 
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 - 현금영수증 발행/취소 실시간 결과 정보를 업데이트 한다.
  *****************************************************************************/
  FUNCTION f_UpdateRtre0092ResultCashApp (
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*발급오류코드          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*발급오류메세지        */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*현금영수증 거래번호   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*현금영수증 승인시간   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*등록상태코드          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*등록상태설명          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 현금영수증 실시간 처리 이력 - 현금영수증 발행/취소 실시간 결과 정보를 업데이트 한다.
  *****************************************************************************/
  PROCEDURE p_IRtre0092ResultCashApp (
    v_Job_Gb         IN  VARCHAR2,                     /*작업구분(C:발행,D:취소*/
    v_Recv_Seq       IN  RTRE0092.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN  RTRE0092.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/    
    v_Cash_Iseq      IN  RTRE0092.CASH_ISEQ%TYPE,      /*현금영수증 이력번호   */
    v_Res_Cd         IN  VARCHAR2,                     /*결과코드              */ 
    v_Res_Msg        IN  VARCHAR2,                     /*결과메시지            */ 
    v_Cash_Tno       IN  RTRE0092.CASH_TNO%TYPE,       /*현금영수증 거래번호   */ 
    v_Cashapp_No     IN  RTRE0092.CASHAPP_NO%TYPE,     /*현금영수증 승인번호   */
    v_Cashapp_Tm     IN  RTRE0092.CASHAPP_TM%TYPE,     /*현금영수증 승인시간   */
    v_Creg_St        IN  RTRE0092.CREG_ST%TYPE,        /*등록상태코드          */
    v_Creg_Desc      IN  RTRE0092.CREG_DESC%TYPE,      /*등록상태설명          */
    v_Reg_Id         IN  RTRE0092.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre0092;
/
