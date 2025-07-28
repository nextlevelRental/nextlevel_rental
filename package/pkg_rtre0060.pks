CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0060 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0060
   PURPOSE   계좌신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계좌신청 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0060Count(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*계좌신청 발생구분   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,         /*계좌신청일          */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE          /*계좌신청순번        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌신청 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE        /*계좌신청일            */
    );

  /*****************************************************************************
  -- 계좌신청 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*은행코드              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*계좌개설 점코드       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*취급 점코드           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌신청 내역 Insert(ARS인증녹취포함)
  *****************************************************************************/
  FUNCTION f_InsertRtre0060RecData (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*은행코드              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*계좌개설 점코드       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*취급 점코드           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Txt_No         IN RTRE0060.TXT_NO%TYPE,         /*ARS인증 전문고유번호  */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌신청 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*은행코드              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*계좌개설 점코드       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*취급 점코드           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌신청 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계좌신청 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0060 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN OUT RTRE0060.ACRQ_SEQ%TYPE,   /*계좌신청순번          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*은행코드              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*계좌개설 점코드       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*취급 점코드           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계좌신청 내역 - 계좌신청순번췌번
  *****************************************************************************/
  FUNCTION f_sRtre0060AcrqSeq(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*계좌신청 발생구분   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE          /*계좌신청일          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수금관리 > CMS관리 > 계좌신청 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtreAccReq0060List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_From_Dt        IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일             */
    v_To_Dt          IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일             */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분           */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*주문번호               */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드               */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태      */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE         /*결제변경요청자         */
    );

  /*****************************************************************************
  -- 수금관리 > CMS관리 > 계좌신청 대상 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060AccReqTargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*계좌신청일자          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 수금관리 > CMS관리 > 계좌신청 결과 반영 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060AccResultList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*계좌신청일자          */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*작업구분(신청구분)     */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계좌신청 내역 관리 - RE-020201_계좌신청 대상집계
  *****************************************************************************/
  PROCEDURE p_InsertRtre0060Aggregate (
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Fr_Rpc_Day     IN VARCHAR,                      /*결제정보 변경시작일자 */
    v_To_Rpc_Day     IN VARCHAR,                      /*결제정보 변경종료일자 */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 계좌신청 내역 관리 - 계좌신청 대상집계 일괄 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0060Batch (
    v_Acrq_Day       IN  RTRE0060.ACRQ_DAY%TYPE,      /*계좌신청일            */
    v_Fr_Rpc_Day     IN  VARCHAR,                     /*결제정보 변경시작일자 */
    v_To_Rpc_Day     IN  VARCHAR,                     /*결제정보 변경종료일자 */
    v_Reg_Id         IN  RTRE0060.REG_ID%TYPE,        /*등록자 ID             */
    v_Acrq_Cnt       OUT RTRE0099.ACRQ_CNT%TYPE,      /*계좌신청건수          */
    v_Accnrq_Cnt     OUT RTRE0099.ACCNRQ_CNT%TYPE,    /*계좌해지건수          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계좌신청 내역(RTRE0060) Update - 계좌신청처리 상태를 변경
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌신청 내역 Count - 계약번호 포함 존재여부 확인
  *****************************************************************************/
  FUNCTION f_sRtre0060OrdCount(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*계좌신청 발생구분   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,         /*계좌신청일          */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,         /*계좌신청순번        */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌신청 내역(RTRE0060) Update - 계좌신청처리구분 기준 계좌신청처리 상태를 변경
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqTpSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계좌신청 내역(RTRE0060) Update - 계좌신청 처리상태와 결과코드 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqcdSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계좌신청 내역(RTRE0060) Update - 계좌신청 처리상태와 결제변경요청순번 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqStRpcSeq (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계좌신청 내역 Delete - 계좌신청 발생구분, 계좌신청일 기준 모두 삭제
  *****************************************************************************/
  FUNCTION f_DeleteRtre0060All (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


END Pkg_Rtre0060;