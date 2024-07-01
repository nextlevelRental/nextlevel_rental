CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0098 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0098
   PURPOSE   파일 송수신 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
*******************************************************************************/
    
  /*****************************************************************************
  -- 파일 송수신 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0098Count(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,          /*파일명              */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE           /*ROW 순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 파일 송수신 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0098 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW 순번              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*파일내용              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 파일 송수신 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW 순번              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*파일내용              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    

  /*****************************************************************************
  -- 파일 송수신 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW 순번              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*파일내용              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 파일 송수신 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW 순번              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 파일 송수신 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0098 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN OUT RTRE0098.ROW_SEQ%TYPE,    /*ROW 순번              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*파일내용              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 파일 송수신 내역 - 요청일자/파일명 기준 ROW 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0098RowSeq(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE           /*파일명              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 파일 송수신 내역 - 계좌신청인증 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EI13Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 파일 송수신 내역 - 계좌신청처리 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB13Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 파일 송수신 내역 - 계좌신청처리 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB12Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 파일 송수신 내역 - 계좌신청처리 파일생성 - 콤마로 분리된 스트링데이터를 등록하는 샘플
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB13String (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN STRING,                       /*파일내용              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Tdata_Cnt      OUT VARCHAR,                     /*데이터건수            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );        
  /*****************************************************************************
  -- 파일 송수신 내역 Count - 송수신처리 내역 체크 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0098CountCheck(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE        /*파일 순번             */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 파일 송수신 내역 Count - 송수신처리 내역 체크 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0098CountCheck2(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE         /*파일명                */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 파일 송수신 내역 Update - 송신 파일 존재시 DEL_YN 업데이트
  *****************************************************************************/
  FUNCTION f_Delete0098FileClear (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 파일 송수신 내역 Update - 송신 파일 존재시 DEL_YN 업데이트
  *****************************************************************************/
  FUNCTION f_Delete0098FileClear2 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 파일 송수신 내역 Delete - 송신 파일 업로드 재처리하기위해 기존자료 삭제
  *****************************************************************************/
  FUNCTION f_Delete0098Day_Nm (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 파일 송수신 내역 - 출금이체자료 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098TransAccum (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_Crlf_Yn        OUT VARCHAR2                     /* CRLF 여부            */
    );        
    
    
  /*****************************************************************************
  -- 파일 송수신 내역 - 카드이체자료 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098CardTrans (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_Crlf_Yn        OUT VARCHAR2                     /* CRLF 여부            */
    );        
    
  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 -  회사접수(A) 데이터 파일 파싱하여 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingA (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Extrc_Yn       IN OUT RTRE0099.EXTRC_YN%TYPE,   /*대상집계여부          */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER 존재여부       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*데이터 총건수         */
    v_Acrq_Cnt       IN OUT RTRE0099.ACRQ_CNT%TYPE,   /*계좌신청건수          */
    v_Accnrq_Cnt     IN OUT RTRE0099.ACCNRQ_CNT%TYPE, /*계좌해지건수          */
    v_Rmcnrq_Cnt     IN OUT RTRE0099.RMCNRQ_CNT%TYPE, /*계좌임의해지건수      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 - 은행접수(B데이터 파일 파싱하여 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingB (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Extrc_Yn       IN OUT RTRE0099.EXTRC_YN%TYPE,   /*대상집계여부          */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER 존재여부       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*데이터 총건수         */
    v_Acrq_Cnt       IN OUT RTRE0099.ACRQ_CNT%TYPE,   /*계좌신청건수          */
    v_Accnrq_Cnt     IN OUT RTRE0099.ACCNRQ_CNT%TYPE, /*계좌해지건수          */
    v_Rmcnrq_Cnt     IN OUT RTRE0099.RMCNRQ_CNT%TYPE, /*계좌임의해지건수      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 -  출금이체(T) 결과 파일 UPLOAD
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingT (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 -  카드이체(C) 결과 파일 UPLOAD
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingC (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 - 현금영수증 데이터 파일 파싱하여 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingCh (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER 존재여부       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*데이터 총건수         */
    v_Tdata_Amt      IN OUT RTRE0099.TDATA_AMT%TYPE,  /*데이터 총금액         */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) ;    
    
END Pkg_Rtre0098;
/
