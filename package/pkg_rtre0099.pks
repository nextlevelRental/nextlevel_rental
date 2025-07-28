CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0099 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0099
   PURPOSE   송수신 작업 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 송수신 작업 Count
  *****************************************************************************/
  FUNCTION f_sRtre0099Count(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*파일명              */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE          /*파일순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 송수신 작업 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0099 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*파일순번              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*대상집계여부          */
    v_Confi_Yn       IN RTRE0099.CONFI_YN%TYPE,       /*대상확인여부          */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*파일생성여부          */
    v_Ftran_Yn       IN RTRE0099.FTRAN_YN%TYPE,       /*파일전송여부          */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*결제일이체기준        */
    v_Str_Day        IN RTRE0099.STR_DAY%TYPE,        /*집계대상 시작일       */
    v_End_Day        IN RTRE0099.END_DAY%TYPE,        /*집계대상 종료일       */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER 존재여부       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*데이터 총건수         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*데이터 총금액         */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*계좌신청건수          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*계좌해지건수          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*계좌임의해지건수      */
    v_Reqst_Cnt      IN RTRE0099.REQST_CNT%TYPE,      /*요청건수              */
    v_Reqst_Amt      IN RTRE0099.REQST_AMT%TYPE,      /*요청금액              */
    v_Cncrq_Cnt      IN RTRE0099.CNCRQ_CNT%TYPE,      /*취소요청건수          */
    v_Cncrq_Amt      IN RTRE0099.CNCRQ_AMT%TYPE,      /*취소요청금액          */
    v_Srecp_Cnt      IN RTRE0099.SRECP_CNT%TYPE,      /*정상결제 처리건수     */
    v_Srecp_Amt      IN RTRE0099.SRECP_AMT%TYPE,      /*정상결제 처리금액     */
    v_Hsrcp_Cnt      IN RTRE0099.HSRCP_CNT%TYPE,      /*부분결제 처리건수     */
    v_Hsrcp_Amt      IN RTRE0099.HSRCP_AMT%TYPE,      /*부분결제 처리금액     */
    v_Erecp_Cnt      IN RTRE0099.ERECP_CNT%TYPE,      /*결제실패 처리건수     */
    v_Erecp_Amt      IN RTRE0099.ERECP_AMT%TYPE,      /*결제실패 처리금액     */
    v_Scnrq_Cnt      IN RTRE0099.SCNRQ_CNT%TYPE,      /*취소정상 처리건수     */
    v_Scnrq_Amt      IN RTRE0099.SCNRQ_AMT%TYPE,      /*취소정상 처리금액     */
    v_Ecnrq_Cnt      IN RTRE0099.ECNRQ_CNT%TYPE,      /*취소오류 처리건수     */
    v_Ecnrq_Amt      IN RTRE0099.ECNRQ_AMT%TYPE,      /*취소오류 처리금액     */
    v_Del_Yn         IN RTRE0099.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 송수신 작업 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0099 (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*파일순번              */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*대상집계여부          */
    v_Confi_Yn       IN RTRE0099.CONFI_YN%TYPE,       /*대상확인여부          */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*파일생성여부          */
    v_Ftran_Yn       IN RTRE0099.FTRAN_YN%TYPE,       /*파일전송여부          */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*결제일이체기준        */
    v_Str_Day        IN RTRE0099.STR_DAY%TYPE,        /*집계대상 시작일       */
    v_End_Day        IN RTRE0099.END_DAY%TYPE,        /*집계대상 종료일       */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER 존재여부       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*데이터 총건수         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*데이터 총금액         */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*계좌신청건수          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*계좌해지건수          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*계좌임의해지건수      */
    v_Reqst_Cnt      IN RTRE0099.REQST_CNT%TYPE,      /*요청건수              */
    v_Reqst_Amt      IN RTRE0099.REQST_AMT%TYPE,      /*요청금액              */
    v_Cncrq_Cnt      IN RTRE0099.CNCRQ_CNT%TYPE,      /*취소요청건수          */
    v_Cncrq_Amt      IN RTRE0099.CNCRQ_AMT%TYPE,      /*취소요청금액          */
    v_Srecp_Cnt      IN RTRE0099.SRECP_CNT%TYPE,      /*정상결제 처리건수     */
    v_Srecp_Amt      IN RTRE0099.SRECP_AMT%TYPE,      /*정상결제 처리금액     */
    v_Hsrcp_Cnt      IN RTRE0099.HSRCP_CNT%TYPE,      /*부분결제 처리건수     */
    v_Hsrcp_Amt      IN RTRE0099.HSRCP_AMT%TYPE,      /*부분결제 처리금액     */
    v_Erecp_Cnt      IN RTRE0099.ERECP_CNT%TYPE,      /*결제실패 처리건수     */
    v_Erecp_Amt      IN RTRE0099.ERECP_AMT%TYPE,      /*결제실패 처리금액     */
    v_Scnrq_Cnt      IN RTRE0099.SCNRQ_CNT%TYPE,      /*취소정상 처리건수     */
    v_Scnrq_Amt      IN RTRE0099.SCNRQ_AMT%TYPE,      /*취소정상 처리금액     */
    v_Ecnrq_Cnt      IN RTRE0099.ECNRQ_CNT%TYPE,      /*취소오류 처리건수     */
    v_Ecnrq_Amt      IN RTRE0099.ECNRQ_AMT%TYPE,      /*취소오류 처리금액     */
    v_Del_Yn         IN RTRE0099.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 송수신 작업 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099 (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*파일순번              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*대상집계여부          */
    v_Confi_Yn       IN RTRE0099.CONFI_YN%TYPE,       /*대상확인여부          */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*파일생성여부          */
    v_Ftran_Yn       IN RTRE0099.FTRAN_YN%TYPE,       /*파일전송여부          */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*결제일이체기준        */
    v_Str_Day        IN RTRE0099.STR_DAY%TYPE,        /*집계대상 시작일       */
    v_End_Day        IN RTRE0099.END_DAY%TYPE,        /*집계대상 종료일       */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER 존재여부       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*데이터 총건수         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*데이터 총금액         */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*계좌신청건수          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*계좌해지건수          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*계좌임의해지건수      */
    v_Reqst_Cnt      IN RTRE0099.REQST_CNT%TYPE,      /*요청건수              */
    v_Reqst_Amt      IN RTRE0099.REQST_AMT%TYPE,      /*요청금액              */
    v_Cncrq_Cnt      IN RTRE0099.CNCRQ_CNT%TYPE,      /*취소요청건수          */
    v_Cncrq_Amt      IN RTRE0099.CNCRQ_AMT%TYPE,      /*취소요청금액          */
    v_Srecp_Cnt      IN RTRE0099.SRECP_CNT%TYPE,      /*정상결제 처리건수     */
    v_Srecp_Amt      IN RTRE0099.SRECP_AMT%TYPE,      /*정상결제 처리금액     */
    v_Hsrcp_Cnt      IN RTRE0099.HSRCP_CNT%TYPE,      /*부분결제 처리건수     */
    v_Hsrcp_Amt      IN RTRE0099.HSRCP_AMT%TYPE,      /*부분결제 처리금액     */
    v_Erecp_Cnt      IN RTRE0099.ERECP_CNT%TYPE,      /*결제실패 처리건수     */
    v_Erecp_Amt      IN RTRE0099.ERECP_AMT%TYPE,      /*결제실패 처리금액     */
    v_Scnrq_Cnt      IN RTRE0099.SCNRQ_CNT%TYPE,      /*취소정상 처리건수     */
    v_Scnrq_Amt      IN RTRE0099.SCNRQ_AMT%TYPE,      /*취소정상 처리금액     */
    v_Ecnrq_Cnt      IN RTRE0099.ECNRQ_CNT%TYPE,      /*취소오류 처리건수     */
    v_Ecnrq_Amt      IN RTRE0099.ECNRQ_AMT%TYPE,      /*취소오류 처리금액     */
    v_Del_Yn         IN RTRE0099.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 송수신 작업 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0099 (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*파일순번              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 송수신 작업 관리- 계좌신청 결과파일 업로드
  *****************************************************************************/
  PROCEDURE p_InsertRtre0099AcrqFileUpload (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) ;

 /*****************************************************************************
  -- 송수신 작업 상태 업데이트(대상집계여부, 대상확인여부 파일생성여부, 파일전송여부 작업별 처리상태 업데이트)
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099Extrcyn (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*계좌신청일자          */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_Cnf_Step       IN RTRE0099.FILE_NM%TYPE,        /*송신처리단계          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

 /*****************************************************************************
  -- 송수신 작업 상태 업데이트 FUNCTION
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099Extrcyn (
    v_Extrc_Yn       IN VARCHAR,                      /*대상집계여부          */
    v_Confi_Yn       IN VARCHAR,                      /*대상확인여부          */
    v_Fcret_Yn       IN VARCHAR,                      /*파일생성여부          */
    v_Ftran_Yn       IN VARCHAR,                      /*파일전송여부          */  
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*계좌신청일자          */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_Cnf_Step       IN RTRE0099.FILE_NM%TYPE,        /*송신처리단계          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 송수신 작업 - 송수신파일구분/요청일자/파일명 기준  파일순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0099FileSeq(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*파일명              */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 송수신 작업 - 송수신파일구분/요청일자/파일명 기준  기존파일순번 조회
  *****************************************************************************/
  FUNCTION f_sRtre0099FinalFileSeq(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*파일명              */
    ) RETURN NUMBER;                                    /*파일순번            */


  /*****************************************************************************
  -- 송수신 작업 - 최종 계좌신청 작업일자 구하기
  *****************************************************************************/
  FUNCTION f_sRtre0099RpcDay RETURN VARCHAR;

  /*****************************************************************************
  -- 송수신 작업 Count - 기준일자 기준 대상집계 내역 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099FileCount(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*파일명              */
    v_Del_Yn         IN VARCHAR                         /*삭제여부(NULL,Y,N)  */
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -- 송수신 작업 Update - 계좌신정 대상 배치 결과 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099BatchResult (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*파일순번              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*대상집계여부          */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*계좌신청건수          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*계좌해지건수          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*계좌임의해지건수      */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 송수신 작업 Update - 현금영수증 파일생성 결과 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099FileResult2 (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*파일순번              */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*파일생성여부          */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER 존재여부       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*데이터 총건수         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*데이터 총금액         */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 송수신 작업 Update - 계좌신정 파일 생성 결과 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099FileResult (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*파일순번              */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*파일생성여부          */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER 존재여부       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*데이터 총건수         */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 송수신 작업 Count - 송수신처리 내역 체크 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099CountCheck(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*파일명              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 작업 Count - 출금이체처리 내역 체크 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099CountCheck2(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*파일명              */
    v_Gubun          IN VARCHAR2                        /*구분                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 출금이체 대상 집계
  *****************************************************************************/
  PROCEDURE p_CreateRtre0099TransAccum (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*결제일이체기준        */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 카드이체 대상 집계
  *****************************************************************************/
  PROCEDURE p_CreateRtre0099CardTrans (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*결제일이체기준        */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 송수신 작업 - 대상확인여부 획득
  *****************************************************************************/
  FUNCTION f_sRtre0099ConfiYn(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*파일명              */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- 송수신 작업 - 요청일자, 파일명 기준 삭제처리
  *****************************************************************************/
  FUNCTION f_DeleteRtre0099DelYn(
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*파일명              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
                
  /*****************************************************************************
  -- 송수신 작업 Update - 계좌신청 결과파일 업로드 결과 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099AcrqFileUpload (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*파일순번              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*대상집계여부          */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER 존재여부       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*데이터 총건수         */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*계좌신청건수          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*계좌해지건수          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*계좌임의해지건수      */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 송수신 작업 Update - 현금영수증 결과파일 업로드 결과 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099CashFileUpload (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*파일순번              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*대상집계여부          */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER 존재여부       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*데이터 총건수         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*데이터 총금액         */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 송수신 작업 Update - 계좌신청 결과처리 결과 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099FileUpResult (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*파일생성여부          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -- 송수신 작업 관리- 계좌신청 결과처리(회사접수): 계좌신청 결과코드 업데이트 된 이후 장착마스터 및 결제정보 변경 내역에 업데이트 처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099FileUpResultA (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */    
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 송수신 작업 관리- 계좌신청 결과처리(은행접수): 계좌신청 결과코드 업데이트 된 이후 장착마스터 및 결제정보 변경 내역에 업데이트 처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099FileUpResultB (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */    
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 송수신 작업 관리 - 은행접수(EB11)분 기준으로 출금이체신청내역(EB12)을 생성
  *****************************************************************************/
  FUNCTION f_InsertRtre0099FileUpResult(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -- 송수신 작업 관리 - 계좌신청 내역 
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099Acrq (
    v_IAcrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,       /*계좌신청 발생구분     */
    v_IAcrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,      /*계좌신청일            */
    v_IAcrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,      /*계좌신청순번          */
    v_IAcrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분          */
    v_Reg_Id          IN RTRE0060.REG_ID%TYPE,        /*등록자 ID             */
    v_Rpc_Seq        OUT RTRE0050.RPC_SEQ%TYPE,       /*결제변경요청순번      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 송수신 작업 관리- 현금영수증 결과파일 업로드
  *****************************************************************************/
  PROCEDURE p_InsertRtre0099CashFileUpload (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
            
END Pkg_Rtre0099;