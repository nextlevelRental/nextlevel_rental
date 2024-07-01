CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0099 AS
/*******************************************************************************
   NAME      Pkg_Rtre0099
   PURPOSE   송수신 작업 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
   1.1        2016-09-13  임욱재           계좌신청결과 '이중출금'의 경우는 정상출금처리  
*******************************************************************************/

  /*****************************************************************************
  -- 송수신 작업 Count
  *****************************************************************************/
  FUNCTION f_sRtre0099Count(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*파일명              */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE          /*파일순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0099
    WHERE   FILE_TP  = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     FILE_SEQ = v_File_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0099Count;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.FILE_TP,                   /*송수신파일구분      */
            A.RQST_DAY,                  /*요청일자            */
            A.FILE_NM,                   /*파일명              */
            A.FILE_SEQ,                  /*파일순번            */
            A.EXTRC_YN,                  /*대상집계여부        */
            A.CONFI_YN,                  /*대상확인여부        */
            A.FCRET_YN,                  /*파일생성여부        */
            A.FTRAN_YN,                  /*파일전송여부        */
            A.STDEX_DD,                  /*결제일이체기준      */
            A.STR_DAY,                   /*집계대상 시작일     */
            A.END_DAY,                   /*집계대상 종료일     */
            A.HEADER_YN,                 /*HEADER 존재여부     */
            A.TRAILER_YN,                /*TRAILER 존재여부    */
            A.TDATA_CNT,                 /*데이터 총건수       */
            A.TDATA_AMT,                 /*데이터 총금액       */
            A.ACRQ_CNT,                  /*계좌신청건수        */
            A.ACCNRQ_CNT,                /*계좌해지건수        */
            A.RMCNRQ_CNT,                /*계좌임의해지건수    */
            A.REQST_CNT,                 /*요청건수            */
            A.REQST_AMT,                 /*요청금액            */
            A.CNCRQ_CNT,                 /*취소요청건수        */
            A.CNCRQ_AMT,                 /*취소요청금액        */
            A.SRECP_CNT,                 /*정상결제 처리건수   */
            A.SRECP_AMT,                 /*정상결제 처리금액   */
            A.HSRCP_CNT,                 /*부분결제 처리건수   */
            A.HSRCP_AMT,                 /*부분결제 처리금액   */
            A.ERECP_CNT,                 /*결제실패 처리건수   */
            A.ERECP_AMT,                 /*결제실패 처리금액   */
            A.SCNRQ_CNT,                 /*취소정상 처리건수   */
            A.SCNRQ_AMT,                 /*취소정상 처리금액   */
            A.ECNRQ_CNT,                 /*취소오류 처리건수   */
            A.ECNRQ_AMT,                 /*취소오류 처리금액   */
            A.DEL_YN,                    /*삭제여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0099 A
    WHERE   A.FILE_TP    = DECODE(v_File_Tp    , NULL, A.FILE_TP    , v_File_Tp)
    AND     A.RQST_DAY   = DECODE(v_Rqst_Day   , NULL, A.RQST_DAY   , v_Rqst_Day)
    AND     A.FILE_NM    = DECODE(v_File_Nm    , NULL, A.FILE_NM    , v_File_Nm)
    AND     A.FILE_SEQ   = DECODE(v_File_Seq   , NULL, A.FILE_SEQ   , v_File_Seq)
    AND     A.EXTRC_YN   = DECODE(v_Extrc_Yn   , NULL, A.EXTRC_YN   , v_Extrc_Yn)
    AND     A.CONFI_YN   = DECODE(v_Confi_Yn   , NULL, A.CONFI_YN   , v_Confi_Yn)
    AND     A.FCRET_YN   = DECODE(v_Fcret_Yn   , NULL, A.FCRET_YN   , v_Fcret_Yn)
    AND     A.FTRAN_YN   = DECODE(v_Ftran_Yn   , NULL, A.FTRAN_YN   , v_Ftran_Yn)
    AND     A.STDEX_DD   = DECODE(v_Stdex_Dd   , NULL, A.STDEX_DD   , v_Stdex_Dd)
    AND     A.STR_DAY    = DECODE(v_Str_Day    , NULL, A.STR_DAY    , v_Str_Day)
    AND     A.END_DAY    = DECODE(v_End_Day    , NULL, A.END_DAY    , v_End_Day)
    AND     A.HEADER_YN  = DECODE(v_Header_Yn  , NULL, A.HEADER_YN  , v_Header_Yn)
    AND     A.TRAILER_YN = DECODE(v_Trailer_Yn , NULL, A.TRAILER_YN , v_Trailer_Yn)
    AND     A.TDATA_CNT  = DECODE(v_Tdata_Cnt  , NULL, A.TDATA_CNT  , v_Tdata_Cnt)
    AND     A.TDATA_AMT  = DECODE(v_Tdata_Amt  , NULL, A.TDATA_AMT  , v_Tdata_Amt)
    AND     A.ACRQ_CNT   = DECODE(v_Acrq_Cnt   , NULL, A.ACRQ_CNT   , v_Acrq_Cnt)
    AND     A.ACCNRQ_CNT = DECODE(v_Accnrq_Cnt , NULL, A.ACCNRQ_CNT , v_Accnrq_Cnt)
    AND     A.RMCNRQ_CNT = DECODE(v_Rmcnrq_Cnt , NULL, A.RMCNRQ_CNT , v_Rmcnrq_Cnt)
    AND     A.REQST_CNT  = DECODE(v_Reqst_Cnt  , NULL, A.REQST_CNT  , v_Reqst_Cnt)
    AND     A.REQST_AMT  = DECODE(v_Reqst_Amt  , NULL, A.REQST_AMT  , v_Reqst_Amt)
    AND     A.CNCRQ_CNT  = DECODE(v_Cncrq_Cnt  , NULL, A.CNCRQ_CNT  , v_Cncrq_Cnt)
    AND     A.CNCRQ_AMT  = DECODE(v_Cncrq_Amt  , NULL, A.CNCRQ_AMT  , v_Cncrq_Amt)
    AND     A.SRECP_CNT  = DECODE(v_Srecp_Cnt  , NULL, A.SRECP_CNT  , v_Srecp_Cnt)
    AND     A.SRECP_AMT  = DECODE(v_Srecp_Amt  , NULL, A.SRECP_AMT  , v_Srecp_Amt)
    AND     A.HSRCP_CNT  = DECODE(v_Hsrcp_Cnt  , NULL, A.HSRCP_CNT  , v_Hsrcp_Cnt)
    AND     A.HSRCP_AMT  = DECODE(v_Hsrcp_Amt  , NULL, A.HSRCP_AMT  , v_Hsrcp_Amt)
    AND     A.ERECP_CNT  = DECODE(v_Erecp_Cnt  , NULL, A.ERECP_CNT  , v_Erecp_Cnt)
    AND     A.ERECP_AMT  = DECODE(v_Erecp_Amt  , NULL, A.ERECP_AMT  , v_Erecp_Amt)
    AND     A.SCNRQ_CNT  = DECODE(v_Scnrq_Cnt  , NULL, A.SCNRQ_CNT  , v_Scnrq_Cnt)
    AND     A.SCNRQ_AMT  = DECODE(v_Scnrq_Amt  , NULL, A.SCNRQ_AMT  , v_Scnrq_Amt)
    AND     A.ECNRQ_CNT  = DECODE(v_Ecnrq_Cnt  , NULL, A.ECNRQ_CNT  , v_Ecnrq_Cnt)
    AND     A.ECNRQ_AMT  = DECODE(v_Ecnrq_Amt  , NULL, A.ECNRQ_AMT  , v_Ecnrq_Amt)
    AND     A.DEL_YN     = DECODE(v_Del_Yn     , NULL, A.DEL_YN     , v_Del_Yn)
    AND     A.REG_ID     = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtre0099;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0099 (
            FILE_TP,
            RQST_DAY,
            FILE_NM,
            FILE_SEQ,
            FILE_DATA,
            EXTRC_YN,
            CONFI_YN,
            FCRET_YN,
            FTRAN_YN,
            STDEX_DD,
            STR_DAY,
            END_DAY,
            HEADER_YN,
            TRAILER_YN,
            TDATA_CNT,
            TDATA_AMT,
            ACRQ_CNT,
            ACCNRQ_CNT,
            RMCNRQ_CNT,
            REQST_CNT,
            REQST_AMT,
            CNCRQ_CNT,
            CNCRQ_AMT,
            SRECP_CNT,
            SRECP_AMT,
            HSRCP_CNT,
            HSRCP_AMT,
            ERECP_CNT,
            ERECP_AMT,
            SCNRQ_CNT,
            SCNRQ_AMT,
            ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_File_Tp,
            v_Rqst_Day,
            v_File_Nm,
            v_File_Seq,
            v_File_Data,
            v_Extrc_Yn,
            v_Confi_Yn,
            v_Fcret_Yn,
            v_Ftran_Yn,
            v_Stdex_Dd,
            v_Str_Day,
            v_End_Day,
            v_Header_Yn,
            v_Trailer_Yn,
            v_Tdata_Cnt,
            v_Tdata_Amt,
            v_Acrq_Cnt,
            v_Accnrq_Cnt,
            v_Rmcnrq_Cnt,
            v_Reqst_Cnt,
            v_Reqst_Amt,
            v_Cncrq_Cnt,
            v_Cncrq_Amt,
            v_Srecp_Cnt,
            v_Srecp_Amt,
            v_Hsrcp_Cnt,
            v_Hsrcp_Amt,
            v_Erecp_Cnt,
            v_Erecp_Amt,
            v_Scnrq_Cnt,
            v_Scnrq_Amt,
            v_Ecnrq_Cnt,
            v_Ecnrq_Amt,
            v_Del_Yn,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0099;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    EXTRC_YN   = v_Extrc_Yn,
           CONFI_YN   = v_Confi_Yn,
           FCRET_YN   = v_Fcret_Yn,
           FTRAN_YN   = v_Ftran_Yn,
           STDEX_DD   = v_Stdex_Dd,
           STR_DAY    = v_Str_Day,
           END_DAY    = v_End_Day,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           TDATA_AMT  = v_Tdata_Amt,
           ACRQ_CNT   = v_Acrq_Cnt,
           ACCNRQ_CNT = v_Accnrq_Cnt,
           RMCNRQ_CNT = v_Rmcnrq_Cnt,
           REQST_CNT  = v_Reqst_Cnt,
           REQST_AMT  = v_Reqst_Amt,
           CNCRQ_CNT  = v_Cncrq_Cnt,
           CNCRQ_AMT  = v_Cncrq_Amt,
           SRECP_CNT  = v_Srecp_Cnt,
           SRECP_AMT  = v_Srecp_Amt,
           HSRCP_CNT  = v_Hsrcp_Cnt,
           HSRCP_AMT  = v_Hsrcp_Amt,
           ERECP_CNT  = v_Erecp_Cnt,
           ERECP_AMT  = v_Erecp_Amt,
           SCNRQ_CNT  = v_Scnrq_Cnt,
           SCNRQ_AMT  = v_Scnrq_Amt,
           ECNRQ_CNT  = v_Ecnrq_Cnt,
           ECNRQ_AMT  = v_Ecnrq_Amt,
           DEL_YN     = v_Del_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    DEL_YN   = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  FILE_TP  = v_File_Tp
    AND    RQST_DAY = v_Rqst_Day
    AND    FILE_NM  = v_File_Nm
    AND    FILE_SEQ = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0099;

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
    ) IS

    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT NULL;  /*송수신파일구분        */
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL; /*파일순번              */
    v_Extrc_Yn   RTRE0099.EXTRC_YN%TYPE DEFAULT 'N';  /*대상집계여부          */
    v_Confi_Yn   RTRE0099.CONFI_YN%TYPE DEFAULT 'N';  /*대상확인여부          */
    v_Fcret_Yn   RTRE0099.FCRET_YN%TYPE DEFAULT 'N';  /*파일생성여부          */
    v_Ftran_Yn   RTRE0099.FTRAN_YN%TYPE DEFAULT 'N';  /*파일전송여부          */
    v_Stdex_Dd   RTRE0099.STDEX_DD%TYPE DEFAULT NULL; /*결제일이체기준        */
    v_Str_Day    RTRE0099.STR_DAY%TYPE DEFAULT NULL;  /*집계대상 시작일       */
    v_End_Day    RTRE0099.END_DAY%TYPE DEFAULT NULL;  /*집계대상 종료일       */
    v_Header_Yn  RTRE0099.HEADER_YN%TYPE DEFAULT 'N'; /*HEADER 존재여부       */
    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT 'N';/*TRAILER 존재여부      */
    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE DEFAULT 0;   /*데이터 총건수         */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT 0;   /*데이터 총금액         */
    v_Acrq_Cnt   RTRE0099.ACRQ_CNT%TYPE DEFAULT 0;    /*계좌신청건수          */
    v_Accnrq_Cnt RTRE0099.ACCNRQ_CNT%TYPE DEFAULT 0;  /*계좌해지건수          */
    v_Rmcnrq_Cnt RTRE0099.RMCNRQ_CNT%TYPE DEFAULT 0;  /*계좌임의해지건수      */
    v_Reqst_Cnt  RTRE0099.REQST_CNT%TYPE DEFAULT 0;   /*요청건수              */
    v_Reqst_Amt  RTRE0099.REQST_AMT%TYPE DEFAULT 0;   /*요청금액              */
    v_Cncrq_Cnt  RTRE0099.CNCRQ_CNT%TYPE DEFAULT 0;   /*취소요청건수          */
    v_Cncrq_Amt  RTRE0099.CNCRQ_AMT%TYPE DEFAULT 0;   /*취소요청금액          */
    v_Srecp_Cnt  RTRE0099.SRECP_CNT%TYPE DEFAULT 0;   /*정상결제 처리건수     */
    v_Srecp_Amt  RTRE0099.SRECP_AMT%TYPE DEFAULT 0;   /*정상결제 처리금액     */
    v_Hsrcp_Cnt  RTRE0099.HSRCP_CNT%TYPE DEFAULT 0;   /*부분결제 처리건수     */
    v_Hsrcp_Amt  RTRE0099.HSRCP_AMT%TYPE DEFAULT 0;   /*부분결제 처리금액     */
    v_Erecp_Cnt  RTRE0099.ERECP_CNT%TYPE DEFAULT 0;   /*결제실패 처리건수     */
    v_Erecp_Amt  RTRE0099.ERECP_AMT%TYPE DEFAULT 0;   /*결제실패 처리금액     */
    v_Scnrq_Cnt  RTRE0099.SCNRQ_CNT%TYPE DEFAULT 0;   /*취소정상 처리건수     */
    v_Scnrq_Amt  RTRE0099.SCNRQ_AMT%TYPE DEFAULT 0;   /*취소정상 처리금액     */
    v_Ecnrq_Cnt  RTRE0099.ECNRQ_CNT%TYPE DEFAULT 0;   /*취소오류 처리건수     */
    v_Ecnrq_Amt  RTRE0099.ECNRQ_AMT%TYPE DEFAULT 0;   /*취소오류 처리금액     */
    v_Del_Yn     RTRE0099.DEL_YN%TYPE DEFAULT 'N';    /*삭제여부              */

    --v_Acrq_Fg    RTRE0060.ACRQ_FG%TYPE DEFAULT 'A';   /*계좌신청 발생구분     */
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT '2';   /*계좌신청 처리상태     */


    e_Error EXCEPTION;
  BEGIN

    -- 필수값:요청일자,파일명, 등록자 ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Nm) IS NULL THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 송수신파일구분
    v_File_Tp := SUBSTR(v_File_Nm, 1, 4);

    -- 파일 송수신 내역이 존재하면(이미 파일 업로드를 한 상태)
    IF 0 < Pkg_Rtre0098.f_sRtre0098CountCheck2(v_Rqst_Day, v_File_Nm) THEN

        -- 대상확인여부 획득
        v_Confi_Yn := Pkg_Rtre0099.f_sRtre0099ConfiYn(v_File_Tp, v_Rqst_Day, v_File_Nm);

        IF v_Confi_Yn IS NULL THEN
            v_Return_Message := '대상확인이 안되므로 처리가 불가 합니다.!!';
            RAISE e_Error;

        ELSIF v_Confi_Yn = 'Y' THEN
            v_Return_Message := '대상확인이 완료된 상태이므로 처리가 불가 합니다.!!';
            RAISE e_Error;

        -- 대상확인 이전이므로 기존 데이터를 삭제(업데이트) 처리
        ELSIF v_Confi_Yn = 'N' THEN

            -- 송수신 작업(RTRE0099) - 요청일자, 파일명 기준 삭제처리
            IF 0 != f_DeleteRtre0099DelYn(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '송수신 작업(RTRE0099) - 요청일자, 파일명 기준 삭제처리 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


            -- 파일 송수신 내역(RTRE0098) Update - 송신 파일 존재시 DEL_YN 업데이트
            IF 0 != Pkg_Rtre0098.f_Delete0098FileClear2(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '파일 송수신 내역(RTRE0098) Update - 송신 파일 존재시 DEL_YN 업데이트 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            IF v_Acrq_Fg = 'A' THEN

                -- 계좌신청 내역(RTRE0060) Update - 회사접수(A)건에 대하여  계좌신청처리 상태를 전송(2) 상태로 변경
                IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqSt(v_Acrq_Fg, v_Rqst_Day, v_Acrq_St, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '파일 송수신 내역(RTRE0098) Update - 송신 파일 존재시 DEL_YN 업데이트 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            ELSIF v_Acrq_Fg = 'B' THEN

                -- 계좌신청 내역(RTRE0060) DELETE - 은행접수(B)건에 대하여 존재하면 계좌신청내역을 삭제함
                IF 0 != Pkg_Rtre0060.f_DeleteRtre0060All(v_Acrq_Fg, v_Rqst_Day, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '계좌신청 내역(RTRE0060) DELETE - 은행접수(B)건에 대하여 존재하면 계좌신청내역을 삭제 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            ELSE
                v_Return_Message := '계좌신청 발생구분-회사접수(A),은행접수(B) : ('||v_Acrq_Fg||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
        END IF;

    END IF;

    -- 파일순번 획득
    v_File_Seq := f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);

    -- 송수신 작업(RTRE0099) 데이터 생성
    IF 0 != f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn,
                             v_Stdex_Dd, v_Str_Day, v_End_Day, v_Header_Yn,
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, v_Acrq_Cnt,
                             v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reqst_Cnt, v_Reqst_Amt,
                             v_Cncrq_Cnt, v_Cncrq_Amt, v_Srecp_Cnt, v_Srecp_Amt,
                             v_Hsrcp_Cnt, v_Hsrcp_Amt, v_Erecp_Cnt, v_Erecp_Amt,
                             v_Scnrq_Cnt, v_Scnrq_Amt, v_Ecnrq_Cnt, v_Ecnrq_Amt,
                             v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '송수신 작업(RTRE0099) 데이터 생성 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;

    END IF;



    -- 회사접수(A)
    IF v_Acrq_Fg = 'A' THEN
        -- 파일 송수신 내역(RTRE0098) 생성 - 데이터 파일 파싱하여 생성
        Pkg_Rtre0098.p_InsertRtre0098FileParsingA(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_File_Data, v_Acrq_Fg,
                                                 v_Extrc_Yn, v_Header_Yn, v_Trailer_Yn, v_Tdata_Cnt,
                                                 v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reg_Id,
                                                 v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '파일 송수신 내역(RTRE0098) 생성 - 데이터 파일 파싱하여 생성 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    -- 은행접수(B)
    ELSIF v_Acrq_Fg = 'B' THEN


        -- 파일 송수신 내역(RTRE0098) 생성 - 데이터 파일 파싱하여 생성
        Pkg_Rtre0098.p_InsertRtre0098FileParsingB(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_File_Data, v_Acrq_Fg,
                                                 v_Extrc_Yn, v_Header_Yn, v_Trailer_Yn, v_Tdata_Cnt,
                                                 v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reg_Id,
                                                 v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '파일 송수신 내역(RTRE0098) 생성 - 데이터 파일 파싱하여 생성 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '계좌신청 발생구분-회사접수(A),은행접수(B) : ('||v_Acrq_Fg||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 송수신 작업(RTRE0099) Update - 계좌신청 결과파일 업로드 결과 업데이트
    IF 0 != f_UpdateRtre0099AcrqFileUpload (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                            v_Extrc_Yn, v_Header_Yn, v_Trailer_Yn, v_Tdata_Cnt,
                                            v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reg_Id,
                                            v_ErrorText) THEN
        v_Return_Message := '송수신 작업(RTRE0099) Update - 계좌신정 대상 배치 결과 업데이트 실패!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_InsertRtre0099AcrqFileUpload(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_InsertRtre0099AcrqFileUpload(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0099AcrqFileUpload;


 /*****************************************************************************
  -- 송수신 작업 상태 업데이트(대상집계여부, 대상확인여부 파일생성여부, 파일전송여부 작업별 처리상태 업데이트)
  *****************************************************************************/
   PROCEDURE   p_UpdateRtre0099Extrcyn (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*계좌신청일자          */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명               */
    v_Cnf_Step       IN RTRE0099.FILE_NM%TYPE,        /*송신처리단계          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    e_Error EXCEPTION;
    v_cnt   NUMBER DEFAULT 0;
    v_Extrc_Yn VARCHAR(1);  /*대상집계여부*/
    v_Confi_Yn VARCHAR(1);  /*대상확인여부*/
    v_Fcret_Yn VARCHAR(1);  /*파일생성여부*/
    v_Ftran_Yn VARCHAR(1);  /*파일전송여부*/

  BEGIN

    SELECT  COUNT(*) OVER() CNT , EXTRC_YN, CONFI_YN, FCRET_YN, FTRAN_YN
    INTO    v_cnt, v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn
    FROM    RTRE0099
    WHERE   FILE_TP  = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     DEL_YN   = 'N';

    IF (v_cnt = 0 OR v_cnt > 1) THEN

        v_Return_Message := '송수신 처리 내역 오류 입니다. 관리자에게 확인하세요.(ERR CODE:9JT1F2)';
        RAISE e_Error;

    ELSIF v_cnt = 1 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다.';
        v_ErrorText := '';

        IF 0 != Pkg_Rtre0099.f_UpdateRtre0099Extrcyn(v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn, v_File_Tp, v_Rqst_Day, v_File_Nm, v_Cnf_Step, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '송수신 처리 내역 오류 입니다. 관리자에게 확인하세요.(ERR CODE:567F4D) [Cnf_Step:'||v_Cnf_Step||',File_Tp:'||v_File_Tp||',Extrc_Yn:'||v_Extrc_Yn||',Confi_Yn:'||v_Confi_Yn||',Fcret_Yn:'||v_Fcret_Yn||',Ftran_Yn:'||v_Ftran_Yn||']';
            RAISE e_Error;
        ELSE
            v_Success_code := 0;
            v_Return_Message := '정상적으로 처리되었습니다.';
            v_ErrorText := '';
        END IF;

    ELSE
        v_Success_code := -1;
        v_Return_Message := '송수신 처리 내역 오류 입니다. 관리자에게 확인하세요.(ERR CODE:B6EDW2)';
        RAISE e_Error;
    END IF;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099Extrcyn(1)', v_ErrorText, v_Return_Message);
      WHEN NO_DATA_FOUND THEN
        v_Success_code := -1;
        v_Return_Message := '대상없음(RTRE0099). 시스템 담당자에게 확인하세요.('||v_File_Tp||','||v_Rqst_Day||','||v_File_Nm||')';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099Extrcyn(3)', v_ErrorText, v_Return_Message);
      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := SUBSTR(SQLERRM, 1, 200);
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099Extrcyn(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0099Extrcyn;

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
    ) RETURN NUMBER IS
  BEGIN

      --송신처리단계(대상집계여부)
      IF v_Cnf_Step = 'EXTR' THEN

        IF v_Extrc_Yn = 'N' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN

            UPDATE  RTRE0099
            SET     EXTRC_YN = 'Y',
                    CHG_ID   = v_Reg_Id,
                    CHG_DT   = SYSDATE
            WHERE   FILE_TP  = v_File_Tp
            AND     RQST_DAY = v_Rqst_Day
            AND     FILE_NM  = v_File_Nm
            AND     DEL_YN   = 'N';

        ELSE
          RETURN -1;
        END IF;

      --송신처리단계(대상확인여부)
      ELSIF v_Cnf_Step = 'CONF' THEN

        IF v_Extrc_Yn = 'Y' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN

            UPDATE  RTRE0099
            SET     CONFI_YN = 'Y',
                    CHG_ID   = v_Reg_Id,
                    CHG_DT   = SYSDATE
            WHERE   FILE_TP  = v_File_Tp
            AND     RQST_DAY = v_Rqst_Day
            AND     FILE_NM  = v_File_Nm
            AND     DEL_YN   = 'N';

        ELSE
          RETURN -1;
        END IF;

      --송신처리단계(파일생성여부)
      ELSIF v_Cnf_Step = 'FILE' THEN

        IF v_Extrc_Yn = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN

            UPDATE  RTRE0099
            SET     FCRET_YN = 'Y',
                    CHG_ID   = v_Reg_Id,
                    CHG_DT   = SYSDATE
            WHERE   FILE_TP  = v_File_Tp
            AND     RQST_DAY = v_Rqst_Day
            AND     FILE_NM  = v_File_Nm
            AND     DEL_YN   = 'N';
        ELSE
          RETURN -1;
        END IF;


      --송신처리단계(파일전송여부)
      ELSIF v_Cnf_Step = 'TRAN' THEN

        IF v_Extrc_Yn = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'N' THEN

            UPDATE  RTRE0099
            SET     FTRAN_YN = 'Y',
                    CHG_ID   = v_Reg_Id,
                    CHG_DT   = SYSDATE
            WHERE   FILE_TP  = v_File_Tp
            AND     RQST_DAY = v_Rqst_Day
            AND     FILE_NM  = v_File_Nm
            AND     DEL_YN   = 'N';

        ELSE
          RETURN -1;
        END IF;

      END IF;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099Extrcyn;

  /*****************************************************************************
  -- 송수신 작업 - 송수신파일구분/요청일자/파일명 기준  파일순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0099FileSeq(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*파일명              */
    ) RETURN NUMBER IS
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;    /*파일순번            */
  BEGIN


    SELECT  NVL((SELECT  MAX(FILE_SEQ)
                 FROM    RTRE0099
                 WHERE   FILE_TP        = v_File_Tp
                 AND     RQST_DAY       = v_Rqst_Day
                 AND     FILE_NM        = v_File_Nm
                 )+ 1, 1) AS FILE_SEQ
    INTO    v_File_Seq
    FROM    DUAL;

    RETURN v_File_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0099FileSeq;


  /*****************************************************************************
  -- 송수신 작업 - 송수신파일구분/요청일자/파일명 기준  기존파일순번 조회
  *****************************************************************************/
  FUNCTION f_sRtre0099FinalFileSeq(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*파일명              */
    ) RETURN NUMBER IS
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;    /*파일순번            */
  BEGIN


    SELECT  FILE_SEQ
    INTO    v_File_Seq
    FROM    RTRE0099
    WHERE   FILE_TP  = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     DEL_YN   = 'N'
    AND     EXTRC_YN = 'Y'
    AND     CONFI_YN = 'Y'
    AND     FTRAN_YN = 'N'
    ;

    RETURN v_File_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0099FinalFileSeq;


  /*****************************************************************************
  -- 송수신 작업 - 최종 계좌신청 작업일자 구하기
  *****************************************************************************/
  FUNCTION f_sRtre0099RpcDay RETURN VARCHAR IS
    v_Rpc_Day    VARCHAR(8) DEFAULT NULL;                  /*작업일자          */
  BEGIN


    SELECT  NVL((SELECT  MAX(END_DAY)        -- 집계대상 종료일
                 FROM    RTRE0099            -- 송수신 작업
                 WHERE   FILE_TP     = 'EB13'-- 송수신파일구분
                 AND     FCRET_YN    = 'Y'   -- 파일생성여부
                 AND     FTRAN_YN    = 'Y'   -- 파인정송여부
                 AND     DEL_YN      = 'N'   -- 삭제여부
                 ), TO_CHAR(SYSDATE-1, 'YYYYMMDD')) -- MAX(END_DAY) 없는 경우 현재일 - 1
    INTO    v_Rpc_Day
    FROM    DUAL;

    RETURN v_Rpc_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN TO_CHAR(SYSDATE-1, 'YYYYMMDD');

  END f_sRtre0099RpcDay;


  /*****************************************************************************
  -- 송수신 작업 Count - 기준일자 기준 대상집계 내역 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099FileCount(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*파일명              */
    v_Del_Yn         IN VARCHAR                         /*삭제여부(NULL,Y,N)  */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0099
    WHERE   FILE_TP = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     FILE_NM = v_File_Nm
    AND     DEL_YN  LIKE TRIM(v_Del_Yn)||'%';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0099FileCount;



  /*****************************************************************************
  -- 송수신 작업 Count - 송수신처리 내역 체크 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099CountCheck(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*파일명              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0099
    WHERE   FILE_TP   = v_File_Tp
    AND     RQST_DAY  = v_Rqst_Day
    AND     FILE_NM   = v_File_Nm
    AND     DEL_YN    = 'N'
    AND     EXTRC_YN  = 'Y'
    AND     CONFI_YN  = 'Y'
    AND     FCRET_YN  = 'N'
    AND     FTRAN_YN  = 'N';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0099CountCheck;


  /*****************************************************************************
  -- 출금이체 작업 Count - 출금이체처리 내역 체크 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099CountCheck2(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*파일명              */
    v_Gubun          IN VARCHAR2                        /*구분                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    IF NVL(v_Gubun, '') = 'DEL' THEN

        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE0099
        WHERE   FILE_TP   = v_File_Tp
        AND     RQST_DAY  = v_Rqst_Day
        AND     FILE_NM   = v_File_Nm
        AND     DEL_YN    = 'N';

     ELSIF NVL(v_Gubun, '') = 'TRANS' THEN

        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE0099
        WHERE   FILE_TP   = v_File_Tp
        AND     RQST_DAY  = v_Rqst_Day
        AND     FILE_NM   = v_File_Nm
        AND     DEL_YN    = 'N'
        AND     EXTRC_YN  = 'Y'
        AND     CONFI_YN  = 'Y'
        AND     FTRAN_YN  = 'N';

     ELSE

        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE0099
        WHERE   FILE_TP   = v_File_Tp
        AND     RQST_DAY  = v_Rqst_Day
        AND     FILE_NM   = v_File_Nm
        AND     DEL_YN    = 'N'
        AND     CONFI_YN  = 'N'
        AND     FCRET_YN  = 'N'
        AND     FTRAN_YN  = 'N';

    END IF;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0099CountCheck2;



  /*****************************************************************************
  -- 송수신 작업 - 대상확인여부 획득
  *****************************************************************************/
  FUNCTION f_sRtre0099ConfiYn(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*송수신파일구분      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*파일명              */
    ) RETURN VARCHAR IS
    v_Confi_Yn   VARCHAR(1) DEFAULT NULL;               /*대상확인여부        */
  BEGIN

    SELECT  CONFI_YN        -- 대상확인여부
    INTO    v_Confi_Yn
    FROM    RTRE0099
    WHERE   FILE_TP   = v_File_Tp
    AND     RQST_DAY  = v_Rqst_Day
    AND     FILE_NM   = v_File_Nm
    AND     FCRET_YN  = 'N' -- 파일생성여부
    AND     FTRAN_YN  = 'N' -- 파일전송여부
    AND     DEL_YN    = 'N';-- 삭제여부

    RETURN v_Confi_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0099ConfiYn;


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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    EXTRC_YN         = v_Extrc_Yn,
           ACRQ_CNT         = v_Acrq_Cnt,
           ACCNRQ_CNT       = v_Accnrq_Cnt,
           RMCNRQ_CNT       = v_Rmcnrq_Cnt,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  FILE_TP          = v_File_Tp
    AND    RQST_DAY         = v_Rqst_Day
    AND    FILE_NM          = v_File_Nm
    AND    FILE_SEQ         = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099BatchResult;


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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    FCRET_YN   = v_Fcret_Yn,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           TDATA_AMT  = v_Tdata_Amt,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099FileResult2;



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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    FCRET_YN   = v_Fcret_Yn,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099FileResult;


  /*****************************************************************************
  -- 송수신 작업 - 요청일자, 파일명 기준 삭제처리
  *****************************************************************************/
  FUNCTION f_DeleteRtre0099DelYn(
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*파일명              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0099
    SET     DEL_YN    = 'Y',
            CHG_ID    = v_Reg_Id,
            CHG_DT    = SYSDATE
    WHERE   RQST_DAY  = v_Rqst_Day
    AND     FILE_NM   = v_File_Nm
    AND     DEL_YN    = 'N';-- 삭제여부

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0099DelYn;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    EXTRC_YN   = v_Extrc_Yn,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           ACRQ_CNT   = v_Acrq_Cnt,
           ACCNRQ_CNT = v_Accnrq_Cnt,
           RMCNRQ_CNT = v_Rmcnrq_Cnt,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099AcrqFileUpload;


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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    EXTRC_YN   = v_Extrc_Yn,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           TDATA_AMT  = v_Tdata_Amt,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099CashFileUpload;

  /*****************************************************************************
  -- 송수신 작업 Update - 계좌신청 결과처리 결과 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099FileUpResult (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*파일생성여부          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0099
    SET     FCRET_YN = v_Fcret_Yn,
            CHG_ID   = v_Reg_Id,
            CHG_DT   = SYSDATE
    WHERE   FILE_TP  = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     DEL_YN   = 'N'
    AND     EXTRC_YN = 'Y'
    AND     CONFI_YN = 'Y'
    AND     FCRET_YN = 'N'
    AND     FTRAN_YN = 'N';

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099FileUpResult;

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
    ) IS

    e_Error EXCEPTION;
    v_Pay_Mthd  RTSD0108.PAY_MTHD%TYPE;
    v_Rcms_day  VARCHAR2(08);
    v_Start         NUMBER;
    v_Trans_Type    CHAR(04);
    v_File_Tp       CHAR(04);
    v_File_Nm   VARCHAR2(20);  /*파일명*/

  BEGIN

    -- 필수값: 요청일자 ,결제일이체기준 ,등록자 ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Stdex_Dd) IS NULL THEN
        v_Return_Message := '결제일이체기준('||v_Stdex_Dd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    ELSIF INSTR(TRIM(v_Stdex_Dd),'Y') = 0 THEN
        v_Return_Message := '결제일이체기준('||v_Stdex_Dd||') : 이 선택일자가 없어서 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_File_Tp := 'EB21';
    v_File_Nm := v_File_Tp||SUBSTR(v_Rqst_Day, 5, 4);
    IF f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') > 0 THEN
        v_Return_Message := '요청일자('||v_File_Nm||') : 에 이미 출금요청한 자료가 있어서 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Rcms_day := v_Rqst_Day;
    v_Pay_Mthd := 'A';  -- 계좌이체
    v_Start := 1;

    IF Pkg_Rtre0070.f_sRtre0070ProcessCount(v_Rcms_day) > 0 THEN
        v_Return_Message := '요청일자('||v_Rcms_day||') : 이전건 중 출금이체반영 미완료인 자료가 있어서 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 이체일자별 자료 생성(RTRE0071)
    WHILE v_Start <= LENGTH(TRIM(v_Stdex_Dd))
    LOOP
        v_Trans_Type := SUBSTR(v_Stdex_Dd, v_Start, 4);

        IF INSTR(v_Trans_Type, 'Y') > 0 THEN
            Pkg_Rtre0071.p_CreateRtre0071TransAccum(v_Rcms_Day, v_Trans_Type, v_Reg_Id,
                                                    v_Success_Code, v_Return_Message, v_ErrorText);
        END IF;

        v_Start := v_Start + 4;

        IF v_Success_Code <> 0 THEN
            v_Start := LENGTH(TRIM(v_Stdex_Dd)) + 1;
            RAISE e_Error;
        END IF;

    END LOOP;

    -- 이체내역 집계 자료 생성(RTRE0070)
    Pkg_Rtre0070.p_CreateRtre0070TransAccum(v_Rcms_Day, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF v_Success_Code <> 0 THEN
        RAISE e_Error;
    END IF;


    -- 이체일자별 자료 Update(RTRE0071)
    IF 0 <> Pkg_Rtre0071.f_URtre0071TransAccum(v_Rcms_Day,
                                    v_ErrorText) THEN
        v_Return_Message := 'Rtre0071 수정 실패!!!';
        RAISE e_Error;
    END IF;


    -- 송수신작업 자료 Insert(RTRE0099)
    INSERT  INTO RTRE0099 (
            FILE_TP, RQST_DAY,  FILE_NM, FILE_SEQ,
            EXTRC_YN, CONFI_YN, FCRET_YN,  FTRAN_YN,
            STDEX_DD, HEADER_YN,  TRAILER_YN,
            TDATA_CNT, TDATA_AMT,
            ACRQ_CNT,  ACCNRQ_CNT, RMCNRQ_CNT, REQST_CNT,
            REQST_AMT, CNCRQ_CNT,  CNCRQ_AMT,  SRECP_CNT,
            SRECP_AMT, HSRCP_CNT,  HSRCP_AMT,  ERECP_CNT,
            ERECP_AMT, SCNRQ_CNT,  SCNRQ_AMT,  ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            REG_ID, REG_DT,  CHG_ID,CHG_DT )
        SELECT  v_File_tp, v_Rqst_Day, v_File_Nm,
                NVL(( SELECT  MAX(B.FILE_SEQ)
                      FROM    RTRE0099 B
                      WHERE   B.FILE_TP = v_File_Tp
                      AND     B.RQST_DAY  = v_Rqst_Day
                      AND     B.FILE_NM   = v_File_Nm), 0) + 1 FILE_SEQ,
                'Y' EXTRC_YN, 'N', 'N','N',
                v_Stdex_Dd,  'N' HEADER_YN, 'N' TRAILER_YN,
                X.TDATA_CNT, X.TDATA_AMT,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0,
                'N' DEL_YN,
                v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE CHG_DT
        FROM    (
                SELECT  COUNT(1) TDATA_CNT, SUM(A.RCMS_AMT) TDATA_AMT
                FROM    RTRE0070 A
                WHERE   A.RCMS_DAY = v_Rcms_Day
                ) X;

    IF SQLCODE <> 0 THEN
        v_Return_Message := 'Rtre0099 생성 실패!!!';
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 집계되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_CreateRtre0099TransAccum(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_CreateRtre0099TransAccum(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0099TransAccum;

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
    ) IS

    e_Error EXCEPTION;
    v_Rcrd_day  RTRE0081.RCRD_DAY%TYPE;
    v_Start         NUMBER;
    v_Trans_Type    CHAR(04);
    v_File_Tp   RTRE0099.FILE_TP%TYPE;
    v_File_Nm   RTRE0099.FILE_NM%TYPE;  /*파일명*/

  BEGIN

    -- 필수값: 요청일자 ,결제일이체기준 ,등록자 ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Stdex_Dd) IS NULL THEN
        v_Return_Message := '결제일이체기준('||v_Stdex_Dd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    ELSIF INSTR(TRIM(v_Stdex_Dd),'Y') = 0 THEN
        v_Return_Message := '결제일이체기준('||v_Stdex_Dd||') : 이 선택일자가 없어서 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_File_Tp := 'BC02_INX';
    v_File_Nm := 'KCP_BATCH_FILE_'||v_File_Tp||'_V5407_'||SUBSTR(v_Rqst_Day, 1, 8);
    IF f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') > 0 THEN
        v_Return_Message := '요청일자('||v_File_Nm||') : 에 이미 출금요청한 자료가 있어서 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Rcrd_day := v_Rqst_Day;

    IF Pkg_Rtre0080.f_sRtre0080ProcessCount(v_Rcrd_day) > 0 THEN
        v_Return_Message := '요청일자('||v_Rcrd_day||') : 이전건 중 카드이체반영 미완료인 자료가 있어서 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 이체일자별 자료 생성(RTRE0081)
    v_Start := 1;
    WHILE v_Start <= LENGTH(TRIM(v_Stdex_Dd))
    LOOP
        v_Trans_Type := SUBSTR(v_Stdex_Dd, v_Start, 4);

        IF INSTR(v_Trans_Type, 'Y') > 0 THEN
            Pkg_Rtre0081.p_CreateRtre0081CardTrans(v_Rcrd_Day, v_Trans_Type, v_Reg_Id,
                                                    v_Success_Code, v_Return_Message, v_ErrorText);
        END IF;

        v_Start := v_Start + 4;

        IF v_Success_Code <> 0 THEN
            v_Start := LENGTH(TRIM(v_Stdex_Dd)) + 1;
            RAISE e_Error;
        END IF;

    END LOOP;


    -- 이체내역 집계 자료 생성(RTRE0080)
    Pkg_Rtre0080.p_CreateRtre0080CardTrans(v_Rcrd_Day, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF v_Success_Code <> 0 THEN
        RAISE e_Error;
    END IF;


    -- 이체일자별 자료 Update(RTRE0081)
    IF 0 <> Pkg_Rtre0081.f_URtre0081CardTrans(v_Rcrd_Day, v_ErrorText) THEN
        v_Return_Message := 'Rtre0071 수정 실패!!!';
        RAISE e_Error;
    END IF;


    -- 송수신작업 자료 Insert(RTRE0099)
    INSERT  INTO RTRE0099 (
            FILE_TP, RQST_DAY,  FILE_NM, FILE_SEQ,
            EXTRC_YN, CONFI_YN, FCRET_YN,  FTRAN_YN,
            STDEX_DD, HEADER_YN,  TRAILER_YN,
            TDATA_CNT, TDATA_AMT,
            ACRQ_CNT,  ACCNRQ_CNT, RMCNRQ_CNT, REQST_CNT,
            REQST_AMT, CNCRQ_CNT,  CNCRQ_AMT,  SRECP_CNT,
            SRECP_AMT, HSRCP_CNT,  HSRCP_AMT,  ERECP_CNT,
            ERECP_AMT, SCNRQ_CNT,  SCNRQ_AMT,  ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            REG_ID, REG_DT,  CHG_ID,CHG_DT )
        SELECT  v_File_tp, v_Rqst_Day, v_File_Nm,
                NVL(( SELECT  MAX(B.FILE_SEQ)
                      FROM    RTRE0099 B
                      WHERE   B.FILE_TP = v_File_Tp
                      AND     B.RQST_DAY  = v_Rqst_Day
                      AND     B.FILE_NM   = v_File_Nm), 0) + 1 FILE_SEQ,
                'Y' EXTRC_YN, 'N', 'N','N',
                v_Stdex_Dd,  'N' HEADER_YN, 'N' TRAILER_YN,
                X.TDATA_CNT, X.TDATA_AMT,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0,
                'N' DEL_YN,
                v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE CHG_DT
        FROM    (
                SELECT  COUNT(1) TDATA_CNT, SUM(A.RCRD_AMT) TDATA_AMT
                FROM    RTRE0080 A
                WHERE   A.RCRD_DAY = v_Rcrd_Day
                ) X;

    IF SQLCODE <> 0 THEN
        v_Return_Message := 'Rtre0099 생성 실패!!!';
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 집계되었습니다';
    v_ErrorText := '';
    --COMMIT;


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_CreateRtre0099CardTrans(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_CreateRtre0099CardTrans(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0099CardTrans;


  /*****************************************************************************
  -- 송수신 작업 관리- 계좌신청 결과처리(회사접수): 계좌신청 결과코드 업데이트 된 이후 장착마스터 및 결제정보 변경 내역에 업데이트 처리
    REVISIONS
    Date        Author      Description
    ----------  --------    -------------------------------------
    2016-09-13  임욱재     계좌신청결과 '이중출금'의 경우는 정상출금처리  
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099FileUpResultA (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 계좌신청 내역
    CURSOR  Cur_Rtre0060 IS
    SELECT  ACRQ_FG,            /*계좌신청 발생구분     */
            ACRQ_DAY,           /*계좌신청일            */
            ACRQ_SEQ,           /*계좌신청순번          */
            ACRQ_TP,            /*계좌신청 구분         */
            ACRQ_ST,            /*계좌신청 처리상태     */
            RPC_SEQ,            /*결제변경요청순번      */
            ORD_NO,             /*계약번호              */
            ACC_SEQ,            /*계좌번호              */
            ACERCD              /*계좌신청결과코드      */
    FROM    RTRE0060            /*계좌신청상태          */
    WHERE   ACRQ_FG = 'A'       /*계좌신청 발생구분     */
    AND     ACRQ_DAY  = v_Rqst_Day; /*계좌신청일        */

    v_Total_Cnt  NUMBER DEFAULT 0;
    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT 'EB14';  /*송수신파일구분        */
    v_Fcret_Yn   RTRE0099.FCRET_YN%TYPE DEFAULT 'Y';    /*파일생성여부          */
    v_Afacc_Stat RTRE0050.AFACC_STAT%TYPE DEFAULT NULL; /*변경후 계좌신청 상태  */
    v_Afacrq_St  RTRE0050.AFACRQ_ST%TYPE DEFAULT NULL;  /*변경후 계좌신청 처리상*/
    v_Pay_Mthd   RTSD0108.PAY_MTHD%TYPE DEFAULT NULL;   /*결제구분              */
    v_Acc_Seq    RTSD0108.ACC_SEQ%TYPE DEFAULT NULL;    /*계좌순번              */
    v_Acc_Stat   RTSD0108.ACC_STAT%TYPE DEFAULT NULL;   /*계좌신청상태          */
    v_Bfacc_Stat RTRE0050.BFACC_STAT%TYPE DEFAULT NULL; /*변경전 계좌신청상태   */
    v_Bfacrq_St  RTRE0050.BFACRQ_ST%TYPE DEFAULT NULL;  /*변경전 계좌해지 신청  */

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:요청일자, 등록자 ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

   -- 송수신 작업 자료  확인(RTRE0099)
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck (v_File_Tp, v_Rqst_Day, v_File_Tp||SUBSTR(v_Rqst_Day, 5,4)) THEN
        v_Return_Message := '처리할 파일 송수신 내역(RTRE0099) 대상이 없습니다!!. 시스템관리자 문의 바람!'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 계좌신청 내역 기준 결제정보변경(RTRE0050) 상태 및 장착마스터(RTSD0108) 계좌신청상태 업데이트
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;
        v_Total_Cnt := v_Total_Cnt+1;

        -- 계좌신청 구분:  신청(1)
        IF CUR.ACRQ_TP = '1' THEN

            -- 계좌신청 처리상태(ACRQ_ST) = 2 이면 '4', 아니면 '3'
            IF CUR.ACRQ_ST = '2' THEN
                v_Afacc_Stat := '4';
                v_Afacrq_St  := '4';
            ELSE
                v_Afacc_Stat := '3';
                v_Afacrq_St  := '3';
            END IF;

            IF 0 = Pkg_Rtre0050.f_sRtre0050Count(CUR.RPC_SEQ) THEN
                v_Return_Message := '계좌신청내역의 결제변경요청순번('||CUR.RPC_SEQ||')이 결제정보 변경이력(RTRE0050)에 없으므로 처리 불가!!';
                RAISE e_Error;
            END IF;

            -- 결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값(변경후) Update
            IF 0!= Pkg_Rtre0050.f_UpdateRtre0050AfterResult (CUR.RPC_SEQ, v_Afacc_Stat , v_Afacrq_St, v_Reg_Id,
                                                             v_ErrorText) THEN
                v_Return_Message := '결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값 Update 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 장착정보의 결제구분과 계좌순번 획득
            BEGIN
                SELECT  PAY_MTHD, ACC_SEQ
                INTO    v_Pay_Mthd, v_Acc_Seq
                FROM    RTSD0108
                WHERE   ORD_NO = CUR.ORD_NO;
            END;

            -- 장착정보에서 획득한 결제구분과 계좌순번이 계좌신청 내역(RTRE0060)과 일치하지 않으면 오류처리
            IF (NVL(v_Pay_Mthd, ' ') != 'A') OR (NVL(v_Acc_Seq, ' ') != CUR.ACC_SEQ) THEN
                v_Return_Message := '장착정보(RTSD0108)의 결제정보(A - '||CUR.ACC_SEQ||')가 상이하여 처리 불가!!';
                RAISE e_Error;
            END IF;


            -- 계좌신청 처리상태(ACRQ_ST) = 2 이면 '4', 아니면 '3'
            IF CUR.ACRQ_ST = '2' THEN
                v_Acc_Stat  := '4';

                -- 계좌신청상태 업데이트
                IF 0!= Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ,  v_Acc_Stat, '0000', v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '계좌신청 내역(RTRE0050)에 계좌신청 처리상태값 Update 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            ELSE
                v_Acc_Stat  := '3';
            END IF;
            
            -- 계좌신청 오류코드가 '이중신청'의 경우에는 출금은 정상처리하기 위해
            -- 장착정보의 계좌신청상태는 '정상'처리
            IF v_Acc_Stat = '3' AND CUR.ACERCD = 'A016' THEN
                v_Acc_Stat := '4';
            END IF;
            
            -- 장착정보(RTSD0108)의 계좌신청상태 업데이트
            IF 0!= Pkg_Rtsd0108.f_UpdateRtsd0108AccStat (CUR.ORD_NO, v_Acc_Stat , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '장착정보(RTSD0108)의 계좌신청상태 업데이트 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        -- 계좌신청 구분: 해지(3)
        ELSIF CUR.ACRQ_TP = '3' THEN

            -- 계좌신청 처리상태(ACRQ_ST) = 2 이면 '8', 아니면 '7'
            IF CUR.ACRQ_ST = '2' THEN
                v_Bfacc_Stat  := '8';
                v_Bfacrq_St  := '8';

                -- 계좌신청상태 업데이트
                IF 0!= Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ,  v_Bfacrq_St, '0000', v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '계좌신청 내역(RTRE0050)에 계좌신청 처리상태값 Update 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            ELSE
                v_Bfacc_Stat  := '7';
                v_Bfacrq_St  := '7';
            END IF;

            -- 결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값(변경전) Update
            IF 0!= Pkg_Rtre0050.f_UpdateRtre0050BeforeResult (CUR.RPC_SEQ, v_Bfacrq_St , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값 Update 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '계좌신청 내역 기준 처리할 수 없는 계좌신청 구분('||CUR.ACRQ_TP||')으로 처리 불가!!.';
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;


    -- 송수신 처리 내역 상태 업데이트
    IF 0!= f_UpdateRtre0099FileUpResult (v_File_Tp, v_Rqst_Day , v_Fcret_Yn, v_Reg_Id,
                                         v_ErrorText) THEN
        v_Return_Message := '송수신 작업 Update - 계좌신청 결과처리 결과 업데이트 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099FileUpResultA(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099FileUpResultA(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0099FileUpResultA;

  /*****************************************************************************
  -- 송수신 작업 관리- 계좌신청 결과처리(은행접수): 계좌신청 결과코드 업데이트 된 이후 장착마스터 및 결제정보 변경 내역에 업데이트 처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099FileUpResultB (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 계좌신청 내역
    CURSOR  Cur_Rtre0060 IS
    SELECT  ACRQ_FG,            /*계좌신청 발생구분     */
            ACRQ_DAY,           /*계좌신청일            */
            ACRQ_SEQ,           /*계좌신청순번          */
            ORD_NO,             /*계약번호              */
            CUST_NO,            /*고객번호              */
            ACC_SEQ,            /*계좌순번              */
            ACRQ_TP,            /*계좌신청 구분         */
            RPC_SEQ,            /*결제변경요청순번      */
            ACRQ_ST             /*계좌신청 처리상태     */
    FROM    RTRE0060            /*계좌신청상태          */
    WHERE   ACRQ_FG  = 'B'      /*계좌신청 발생구분     */
    AND     ACRQ_DAY = v_Rqst_Day   /*계좌신청일        */
    AND     ACRQ_ST != '3'
    AND     ACRQ_ST != '7';


    v_Total_Cnt  NUMBER DEFAULT 0;
    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT 'EB11';  /*송수신파일구분        */
    v_Fcret_Yn   RTRE0099.FCRET_YN%TYPE DEFAULT 'Y';    /*파일생성여부          */

    v_Pay_Mthd   RTSD0108.PAY_MTHD%TYPE DEFAULT NULL;   /*결제구분              */
    v_Acc_Seq    RTSD0108.ACC_SEQ%TYPE DEFAULT NULL;    /*계좌순번              */
    v_Acc_Stat   RTSD0108.ACC_STAT%TYPE DEFAULT NULL;   /*계좌신청상태          */

    v_Afacc_Stat RTRE0050.AFACC_STAT%TYPE DEFAULT NULL; /*변경후 계좌신청 상태  */
    v_Afacrq_St  RTRE0050.AFACRQ_ST%TYPE DEFAULT NULL;  /*변경후 계좌신청 처리상*/
    v_Bfacc_Stat RTRE0050.BFACC_STAT%TYPE DEFAULT NULL; /*변경전 계좌신청상태   */
    v_Bfacrq_St  RTRE0050.BFACRQ_ST%TYPE DEFAULT NULL;  /*변경전 계좌해지 신청  */
    v_Rpc_Seq    RTRE0050.RPC_SEQ%TYPE DEFAULT NULL;    /*결제변경요청순번      */

    v_Acrq_Fg    RTRE0060.ACRQ_FG%TYPE DEFAULT NULL;    /*계좌신청 발생구분     */
    v_Acrq_Day   RTRE0060.ACRQ_DAY%TYPE DEFAULT NULL;   /*계좌신청일            */
    v_Acrq_Seq   RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL;   /*계좌신청순번          */
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;    /*계좌신청 처리상태     */
    v_Acercd     RTRE0060.ACERCD%TYPE DEFAULT NULL;     /*계좌신청 결과코드     */


    v_File_Nm    RTRE0099.FILE_NM%TYPE DEFAULT NULL;    /*파일명                */
    e_Error EXCEPTION;
  BEGIN

    -- 필수값:요청일자, 등록자 ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 계좌신청일 = 요청일자
    v_Acrq_Day := v_Rqst_Day;
    v_File_Nm  := v_File_Tp||SUBSTR(v_Rqst_Day, 5,4);

   -- 송수신 작업 자료  확인(RTRE0099)
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck (v_File_Tp, v_Rqst_Day, v_File_Nm) THEN
        v_Return_Message := '처리할 파일 송수신 내역(RTRE0099) 대상이 없습니다!!. 시스템관리자 문의 바람!'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 계좌신청 내역 기준 결제정보변경(RTRE0050) 상태 및 장착마스터(RTSD0108) 계좌신청상태 업데이트
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;
        v_Total_Cnt := v_Total_Cnt+1;

        -- 장착정보의 결제구분과 계좌순번 획득
        BEGIN
            SELECT  ACC_SEQ, ACC_STAT
            INTO    v_Acc_Seq, v_Acc_Stat
            FROM    RTSD0108
            WHERE   ORD_NO = CUR.ORD_NO;
        END;

        -- 결제변경요청순번
        v_Rpc_Seq := NULL;

        -- 계좌신청 구분:  신청(1)
        IF CUR.ACRQ_TP = '1' THEN

            -- 장착정보에서 획득한 결제구분과 계좌순번이 계좌신청 내역(RTRE0060)과 일치하면
            IF (NVL(v_Acc_Seq, ' ') = CUR.ACC_SEQ) AND (NVL(v_Acc_Stat, ' ') = '4') THEN


                    -- 계좌신청 처리상태 : 신청정상(4)
                    v_Acrq_St := '4';

                    -- 계좌신청 내역(RTRE0060) Update - 계좌신청처리 상태를 변경
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqSt(v_Acrq_Fg, v_Rqst_Day, v_Acrq_St, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '계좌신청 내역(RTRE0060) Update - 계좌신청처리 상태(신청정상:4)를 변경 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

            ELSE
                -- 결제정보 변경이력(RTRE0050) 생성 및 상태 변경
                p_UpdateRtre0099Acrq (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, CUR.ACRQ_TP,
                                      v_Reg_Id, v_Rpc_Seq, v_Success_Code, v_Return_Message, v_ErrorText);


                -- 결제정보 변경이력 생성 중 에러 발생시 부분 롤백하지 않고 아래를 진행
                IF 0 = v_Success_Code THEN

                    v_Afacc_Stat := '4'; /*변경후 계좌신청 상태  */
                    v_Afacrq_St  := '4'; /*변경후 계좌신청 처리상*/


                    -- 결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값(변경후) Update
                    IF 0!= Pkg_Rtre0050.f_UpdateRtre0050AfterResult (CUR.RPC_SEQ, v_Afacc_Stat , v_Afacrq_St, v_Reg_Id,
                                                                     v_ErrorText) THEN
                        v_Return_Message := '결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값 Update 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    v_Acrq_St := '4';     /*계좌신청 처리상태     */
                    v_Acercd  := '0000';  /*계좌신청 결과코드     */

                    -- 계좌신청 내역(RTRE0060) Update - 계좌신청 처리상태와 결제변경요청순번 업데이트
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqStRpcSeq (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                                       v_Acercd, v_Rpc_Seq, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '계좌신청 내역(RTRE0060) Update(2) - 계좌신청 처리상태와 결제변경요청순번 업데이트 중 에러!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                ELSE

                    v_Acrq_St := '3';     /*계좌신청 처리상태     */
                    v_Acercd  := 'A017';  /*계좌신청 결과코드     */


                    -- 계좌신청 내역(RTRE0060) Update - 계좌신청 처리상태와 결과코드 Update
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                                   v_Acercd, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '계좌신청 내역(RTRE0060) Update(1) - 계좌신청 처리상태와 결과코드 Update 중 에러!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;


                END IF;


            END IF;


        -- 계좌신청 구분: 해지(3),임의해지(7)
        ELSIF CUR.ACRQ_TP IN ('3','7') THEN

            v_Acercd  := '0000';  /*계좌신청 결과코드- 정상처리    */

            IF CUR.ACRQ_TP = '3' THEN
                v_Acrq_St := '8';
            ELSIF CUR.ACRQ_TP = '7' THEN
                v_Acrq_St := '9';
            END IF;

            -- 장착정보에서 획득한 결제구분과 계좌순번이 계좌신청 내역(RTRE0060)과 일치하면
            IF NVL(v_Acc_Seq, ' ') = CUR.ACC_SEQ THEN

                IF NVL(v_Acc_Stat, ' ') = '4' THEN


                    -- 결제정보 변경이력(RTRE0050) 생성 및 상태 변경(결제변경요청순번 획득)
                    p_UpdateRtre0099Acrq (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, CUR.ACRQ_TP,
                                          v_Reg_Id, v_Rpc_Seq, v_Success_Code, v_Return_Message, v_ErrorText);

                    -- 결제정보 변경이력 생성 중 에러 발생시 부분 롤백하지 않고 아래를 진행
                    IF 0 = v_Success_Code THEN

                        -- 계좌신청 내역(RTRE0060) Update - 계좌신청 처리상태와 결제변경요청순번 업데이트
                        IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqStRpcSeq (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                                           v_Acercd, v_Rpc_Seq, v_Reg_Id, v_ErrorText) THEN
                            v_Return_Message := '계좌신청 내역(RTRE0060) Update(2) - 계좌신청 처리상태와 결제변경요청순번 업데이트 중 에러!!.'||'-'||v_ErrorText;
                            v_ErrorText := v_ErrorText;
                            RAISE e_Error;
                        END IF;

                    ELSE
                        v_Return_Message := '계좌신청 내역(RTRE0050) 생성 오류 !!.'||'-'||v_Return_Message||'-'||v_ErrorText;
                        --v_Return_Message := '계좌신청 내역(RTRE0050) 생성 오류 !!.'||'-'||CUR.ORD_NO||'-'||CUR.ACRQ_FG||'-'||CUR.ACRQ_DAY||'-'||CUR.ACRQ_SEQ||'-'||CUR.ACRQ_TP||'-'||v_Reg_Id;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                ELSE

                    v_Acrq_St := '7';
                    v_Acercd  := 'A017';  /*계좌신청 결과코드     */

                    -- 계좌신청 내역(RTRE0060) Update - 계좌신청 처리상태와 결과코드 Update
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                                   v_Acercd, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '계좌신청 내역(RTRE0060) Update(3) - 계좌신청 처리상태와 결과코드 Update 중 에러!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                END IF;

            ELSE

                v_Acrq_St := '7';
                v_Acercd  := 'A017';  /*계좌신청 결과코드     */

                -- 계좌신청 내역(RTRE0060) Update - 계좌신청 처리상태와 결과코드 Update
                IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                               v_Acercd, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '계좌신청 내역(RTRE0060) Update(3) - 계좌신청 처리상태와 결과코드 Update 중 에러!!.'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            END IF;

        ELSE
            v_Return_Message := '계좌신청 내역 기준 처리할 수 없는 계좌신청 구분('||CUR.ACRQ_TP||')으로 처리 불가!!.';
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;


    -- 송수신 처리 내역 상태 업데이트
    IF 0!= f_UpdateRtre0099FileUpResult (v_File_Tp, v_Rqst_Day , v_Fcret_Yn, v_Reg_Id,
                                          v_ErrorText) THEN
        v_Return_Message := '송수신 작업 Update - 계좌신청 결과처리 결과 업데이트 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    -- 은행접수(EB11)분 기준으로 출금이체신청내역(EB12)을 생성
    /* IF 0!= f_InsertRtre0099FileUpResult (v_File_Tp, v_Rqst_Day , v_File_Nm, v_Reg_Id,
                                         v_ErrorText) THEN
        v_Return_Message := '송수신 작업 Update - 계좌신청 결과처리 결과 업데이트 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; */

    -- 은행접수(EB11)분 기준으로 출금이체신청내역(EB12)을 생성
    IF 0!= f_InsertRtre0099FileUpResult ('EB12', v_Rqst_Day , v_File_Nm, v_Reg_Id,
                                         v_ErrorText) THEN
        v_Return_Message := '송수신 작업 Update - 계좌신청 결과처리 결과 업데이트 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099FileUpResultB(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099FileUpResultB(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0099FileUpResultB;

  /*****************************************************************************
  -- 송수신 작업 관리 - 은행접수(EB11)분 기준으로 출금이체신청내역(EB12)을 생성
  *****************************************************************************/
  FUNCTION f_InsertRtre0099FileUpResult(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*송수신파일구분        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0099 (
            FILE_TP,
            RQST_DAY,
            FILE_NM,
            FILE_SEQ,
            FILE_DATA,
            EXTRC_YN,
            CONFI_YN,
            FCRET_YN,
            FTRAN_YN,
            STDEX_DD,
            STR_DAY,
            END_DAY,
            HEADER_YN,
            TRAILER_YN,
            TDATA_CNT,
            TDATA_AMT,
            ACRQ_CNT,
            ACCNRQ_CNT,
            RMCNRQ_CNT,
            REQST_CNT,
            REQST_AMT,
            CNCRQ_CNT,
            CNCRQ_AMT,
            SRECP_CNT,
            SRECP_AMT,
            HSRCP_CNT,
            HSRCP_AMT,
            ERECP_CNT,
            ERECP_AMT,
            SCNRQ_CNT,
            SCNRQ_AMT,
            ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  FILE_TP,
            RQST_DAY,
            'EB12'||SUBSTR(v_Rqst_Day,5,4) FILE_NM,
            FILE_SEQ,
            FILE_DATA,
            'Y' EXTRC_YN,
            'Y' CONFI_YN,
            'N' FCRET_YN,
            'N' FTRAN_YN,
            STDEX_DD,
            STR_DAY,
            END_DAY,
            HEADER_YN,
            TRAILER_YN,
            TDATA_CNT,
            TDATA_AMT,
            ACRQ_CNT,
            ACCNRQ_CNT,
            RMCNRQ_CNT,
            REQST_CNT,
            REQST_AMT,
            CNCRQ_CNT,
            CNCRQ_AMT,
            SRECP_CNT,
            SRECP_AMT,
            HSRCP_CNT,
            HSRCP_AMT,
            ERECP_CNT,
            ERECP_AMT,
            SCNRQ_CNT,
            SCNRQ_AMT,
            ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0099
    WHERE   FILE_TP   = v_File_Tp
    AND     RQST_DAY  = v_Rqst_Day
    AND     FILE_NM   = v_File_Nm
    AND     DEL_YN    = 'N';


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0099FileUpResult;


  /*****************************************************************************
  -- 송수신 작업 관리 - 계좌신청 내역
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099Acrq (
    v_IAcrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,       /*계좌신청 발생구분     */
    v_IAcrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,      /*계좌신청일            */
    v_IAcrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,      /*계좌신청순번          */
    v_IAcrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,       /*계좌신청구분          */
    v_Reg_Id          IN RTRE0060.REG_ID%TYPE,        /*등록자 ID             */
    v_Rpc_Seq        OUT RTRE0050.RPC_SEQ%TYPE,       /*결제변경요청순번      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS


    v_Comm_Dvsn    CHAR DEFAULT NULL;                       /*처리구분              */
    v_Ord_No       RTRE0050.ORD_NO%TYPE DEFAULT NULL;       /*주문번호              */
    v_Rpc_Day      RTRE0050.RPC_DAY%TYPE DEFAULT NULL;      /*결제변경요청일        */
    v_Rpc_Uid      RTRE0050.RPC_UID%TYPE DEFAULT NULL;      /*결제변경요청자        */
    v_Rpc_Cd       RTRE0050.RPC_CD%TYPE DEFAULT NULL;       /*변경사유코드          */
    v_Rpc_Rsn      RTRE0050.RPC_RSN%TYPE DEFAULT NULL;      /*변경사유              */
    v_Acrq_Day     RTRE0060.ACRQ_DAY%TYPE DEFAULT NULL;     /*계좌신청 처리일       */
    v_Acrq_Seq     RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL;     /*계좌신청 순번         */
    v_File_Grp_Seq RTRE0050.FILE_GRP_SEQ%TYPE DEFAULT NULL; /*첨부파일              */
    v_Bfcust_No    RTRE0050.BFCUST_NO%TYPE DEFAULT NULL;    /*변경전 고객번호       */
    v_Bftcgrp_No   RTRE0050.BFTCGRP_NO%TYPE DEFAULT NULL;   /*변경전 통합청구번호   */
    v_Bfpay_Mthd   RTRE0050.BFPAY_MTHD%TYPE DEFAULT NULL;   /*변경전 결제방법       */
    v_Bfpay_Dd     RTRE0050.BFPAY_DD%TYPE DEFAULT NULL;     /*변경전 결제일자       */
    v_Bfacc_Seq    RTRE0050.BFACC_SEQ%TYPE DEFAULT NULL;    /*변경전 계좌순번       */
    v_Bfacust_Nm   RTRE0010.CUST_NM%TYPE DEFAULT NULL;      /*변경전 예금주명       */
    v_Bfacust_Tp   RTRE0010.CUST_TP%TYPE DEFAULT NULL;      /*변경전계좌 고객유형   */
    v_Bfaebir_Day  RTRE0010.EBIR_DAY%TYPE DEFAULT NULL;     /*변경전 법정생년월일   */
    v_Bfabusl_No   RTRE0010.BUSL_NO%TYPE DEFAULT NULL;      /*변경전 계좌 사업자번호*/
    v_Bfbank_No    RTRE0010.BANK_CD%TYPE DEFAULT NULL;      /*변경전 은행코드       */
    v_Bfacct_No    RTRE0010.ACCT_NO%TYPE DEFAULT NULL;      /*변경전 계좌번호       */
    v_Bfcrd_Seq    RTRE0020.CRD_SEQ%TYPE DEFAULT NULL;      /*변경전 카드순번       */
    v_Bfccust_Nm   RTRE0020.CUST_NM%TYPE DEFAULT NULL;      /*변경전 카드주명       */
    v_Bfccust_Tp   RTRE0020.CUST_TP%TYPE DEFAULT NULL;      /*변경전카드고객유형    */
    v_Bfcebir_Day  RTRE0020.EBIR_DAY%TYPE DEFAULT NULL;     /*변경전카드법정생년월일*/
    v_Bfcbusl_No   RTRE0020.BUSL_NO%TYPE DEFAULT NULL;      /*변경전카드사업자번호  */
    v_Bfcardcom_No RTRE0020.CARDCOM_CD%TYPE DEFAULT NULL;   /*변경전카드사코드      */
    v_Bfcard_No    RTRE0020.CARD_NO%TYPE DEFAULT NULL;      /*변경전 카드번호       */
    v_Bfexpire_Ym  RTRE0020.EXPIRE_YM%TYPE DEFAULT NULL;    /*변경전 유효기간       */
    v_Bfbatch_Key  RTRE0050.BFBATCH_KEY%TYPE DEFAULT NULL;  /*변경전 BATCH KEY      */
    v_Bfacc_Stat   RTRE0050.BFACC_STAT%TYPE DEFAULT NULL;   /*변경전 계좌신청상태   */
    v_Afcust_No    RTRE0050.AFCUST_NO%TYPE DEFAULT NULL;    /*변경후 고객번호       */
    v_Aftcgrp_No   RTRE0050.AFTCGRP_NO%TYPE DEFAULT NULL;   /*변경후 통합청구번호   */
    v_Afpay_Mthd   RTRE0050.AFPAY_MTHD%TYPE DEFAULT NULL;   /*변경후 결제방법       */
    v_Afpay_Dd     RTRE0050.AFPAY_DD%TYPE DEFAULT NULL;     /*변경후 결제일자       */
    v_Afacc_Seq    RTRE0050.AFACC_SEQ%TYPE DEFAULT NULL;    /*변경후 계좌순번       */
    v_Afacust_Nm   RTRE0010.CUST_NM%TYPE DEFAULT NULL;      /*변경후 고객명         */
    v_Afacust_Tp   RTRE0010.CUST_TP%TYPE DEFAULT NULL;      /*변경후 고객유형       */
    v_Afaebir_Day  RTRE0010.EBIR_DAY%TYPE DEFAULT NULL;     /*변경후 법정생년월일   */
    v_Afabusl_No   RTRE0010.BUSL_NO%TYPE DEFAULT NULL;      /*변경후 사업자번호     */
    v_Afbank_No    RTRE0010.BANK_CD%TYPE DEFAULT NULL;      /*변경후 은행코드       */
    v_Afacct_No    RTRE0010.ACCT_NO%TYPE DEFAULT NULL;      /*변경후 계좌번호       */
    v_Afacc_Chk    RTRE0010.ACC_CHK%TYPE DEFAULT NULL;      /*변경후 계좌확인상태   */
    v_Afcrd_Seq    RTRE0050.AFCRD_SEQ%TYPE DEFAULT NULL;    /*변경후 카드순번       */
    v_Afbatch_Key  RTRE0050.AFBATCH_KEY%TYPE DEFAULT NULL;  /*변경후 BATCH KEY      */
    v_Afccust_Nm   RTRE0020.CUST_NM%TYPE DEFAULT NULL;      /*변경후 카드주명       */
    v_Afccust_Tp   RTRE0020.CUST_TP%TYPE DEFAULT NULL;      /*변경후카드고객유형    */
    v_Afcebir_Day  RTRE0020.EBIR_DAY%TYPE DEFAULT NULL;     /*변경후카드법정생년월일*/
    v_Afcbusl_No   RTRE0020.BUSL_NO%TYPE DEFAULT NULL;      /*변경후카드사업자번호  */
    v_Afcardcom_No RTRE0020.CARDCOM_CD%TYPE DEFAULT NULL;   /*변경후카드사코드      */
    v_Afcard_No    RTRE0020.CARD_NO%TYPE DEFAULT NULL;      /*변경후 카드번호       */
    v_Afexpire_Ym  RTRE0020.EXPIRE_YM%TYPE DEFAULT NULL;    /*변경후 유효기간       */
    v_Afbkey_Chk   RTRE0020.BKEY_CHK%TYPE DEFAULT NULL;     /*변경후 카드확인 상태  */

  BEGIN


        BEGIN


            SELECT  'I'             Comm_Dvsn,
                    A.ORD_NO        Ord_No,                  /*계약번호              */
                    v_IAcrq_Day     Rpc_Day,                 /*결제변경요청일        */
                    NULL            Rpc_Uid,                 /*결제변경요청자        */
                    DECODE(v_IAcrq_Tp, '1','03','3','02','7','06') Rpc_Cd, /*변경사유코드 */
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('R013', DECODE(v_IAcrq_Tp, '1','03','3','02','7','06')) Rpc_Rsn, /*변경사유 */
                    v_IAcrq_Day     Acrq_Day,                /*계좌신청 처리일       */
                    v_IAcrq_Seq     Acrq_Seq,                /*계좌신청 순번         */
                    NULL            File_Grp_Seq,            /*첨부파일              */
                    A.CUST_NO       Bfcust_No,               /*변경전 고객번호       */
                    A.TCGRP_NO      Bftcgrp_No,              /*통합청구번호          */
                    A.PAY_MTHD      Bfpay_Mthd,              /*결제방법              */
                    A.PAY_DD        Bfpay_Dd,                /*결제일                */
                    A.ACC_SEQ       Bfacc_Seq,               /*계좌순번              */
                    C.CUST_NM       Bfacust_Nm,              /*변경전 예금주명       */
                    C.CUST_TP       Bfacust_Tp,              /*변경전계좌 고객유형   */
                    C.EBIR_DAY      Bfaebir_Day,             /*변경전 법정생년월일   */
                    C.BUSL_NO       Bfabusl_No,              /*변경전 계좌 사업자번호*/
                    C.BANK_CD       Bfbank_No,               /*변경전 은행코드       */
                    C.ACCT_NO       Bfacct_No,               /*변경전 계좌번호       */
                    D.CRD_SEQ       Bfcrd_Seq,               /*변경전 카드순번       */
                    D.CUST_NM       Bfccust_Nm,              /*변경전 카드주명       */
                    D.CUST_TP       Bfccust_Tp,              /*변경전카드고객유형    */
                    D.EBIR_DAY      Bfcebir_Day,             /*변경전카드법정생년월일*/
                    D.BUSL_NO       Bfcbusl_No,              /*변경전카드사업자번호  */
                    D.CARDCOM_CD    Bfcardcom_No,            /*변경전카드사코드      */
                    D.CARD_NO       Bfcard_No,               /*변경전 카드번호       */
                    D.EXPIRE_YM     Bfexpire_Ym,             /*변경전 유효기간       */
                    A.BATCH_KEY     Bfbatch_Key,             /*변경전 BATCH KEY      */
                    A.ACC_STAT      Bfacc_Stat,              /*변경전 계좌신청상태   */
                    B.CUST_NO       Afcust_No,               /*변경후 고객번호       */
                    A.TCGRP_NO      Aftcgrp_No,              /*변경후 통합청구번호   */
                    'A'             Afpay_Mthd,              /*변경후 결제방법       */
                    A.PAY_DD        Afpay_Dd,                /*변경후 결제일자       */
                    B.ACC_SEQ       Afacc_Seq,               /*변경후 계좌순번       */
                    E.CUST_NM       Afacust_Nm,              /*변경후 고객명         */
                    E.CUST_TP       Afacust_Tp,              /*변경후 고객유형       */
                    E.EBIR_DAY      Afaebir_Day,             /*변경후 법정생년월일   */
                    E.BUSL_NO       Afabusl_No,              /*변경후 사업자번호     */
                    E.BANK_CD       Afbank_No,               /*변경후 은행코드       */
                    E.ACCT_NO       Afacct_No,               /*변경후 계좌번호       */
                    'Y'             Afacc_Chk,               /*변경후 계좌확인상태   */
                    NULL            Afcrd_Seq,               /*변경후 카드순번       */
                    NULL            Afbatch_Key,             /*변경후 BATCH KEY      */
                    NULL            Afccust_Nm,              /*변경후 카드주명       */
                    NULL            Afccust_Tp,              /*변경후카드고객유형    */
                    NULL            Afcebir_Day,             /*변경후카드법정생년월일*/
                    NULL            Afcbusl_No,              /*변경후카드사업자번호  */
                    NULL            Afcardcom_No,            /*변경후카드사코드      */
                    NULL            Afcard_No,               /*변경후 카드번호       */
                    NULL            Afexpire_Ym,             /*변경후 유효기간       */
                    'N'             Afbkey_Chk               /*변경후 카드확인 상태  */
            INTO    v_Comm_Dvsn, v_Ord_No, v_Rpc_Day, v_Rpc_Uid, v_Rpc_Cd, v_Rpc_Rsn, v_Acrq_Day, v_Acrq_Seq, v_File_Grp_Seq, v_Bfcust_No,
                    v_Bftcgrp_No, v_Bfpay_Mthd, v_Bfpay_Dd, v_Bfacc_Seq, v_Bfacust_Nm, v_Bfacust_Tp, v_Bfaebir_Day, v_Bfabusl_No, v_Bfbank_No, v_Bfacct_No,
                    v_Bfcrd_Seq, v_Bfccust_Nm, v_Bfccust_Tp, v_Bfcebir_Day, v_Bfcbusl_No, v_Bfcardcom_No, v_Bfcard_No, v_Bfexpire_Ym, v_Bfbatch_Key, v_Bfacc_Stat,
                    v_Afcust_No, v_Aftcgrp_No, v_Afpay_Mthd, v_Afpay_Dd, v_Afacc_Seq, v_Afacust_Nm, v_Afacust_Tp, v_Afaebir_Day, v_Afabusl_No, v_Afbank_No,
                    v_Afacct_No, v_Afacc_Chk, v_Afcrd_Seq, v_Afbatch_Key, v_Afccust_Nm, v_Afccust_Tp, v_Afcebir_Day, v_Afcbusl_No, v_Afcardcom_No, v_Afcard_No,
                    v_Afexpire_Ym, v_Afbkey_Chk
            FROM    RTSD0108 A,              /*장착정보T    */
                    RTRE0060 B,              /*계좌신청 내역T*/
                    RTRE0010 C,              /*고객계좌정보T*/
                    RTRE0020 D,              /*고객카드정보T*/
                    RTRE0010 E               /*고객계좌정보T*/
            WHERE   B.ACRQ_FG   = v_IAcrq_Fg
            AND     B.ACRQ_DAY  = v_IAcrq_Day
            AND     B.ACRQ_SEQ  = v_IAcrq_Seq
            AND     A.ORD_NO    = B.ORD_NO
            AND     A.ACC_SEQ   = C.ACC_SEQ(+)
            AND     A.CRD_SEQ   = D.CRD_SEQ(+)
            AND     C.USE_YN(+) = 'Y'
            AND     D.USE_YN(+) = 'Y'
            AND     B.ACC_SEQ   = E.ACC_SEQ;

        END;

        -- 결제정보 변경이력 관리(IUD)
        Pkg_Rtre0050.p_IUDRtre0050 (v_Comm_Dvsn, v_Ord_No, v_Rpc_Day, v_Rpc_Uid, v_Rpc_Cd, v_Rpc_Rsn, v_Acrq_Day, v_Acrq_Seq, v_File_Grp_Seq, v_Bfcust_No,
                                    v_Bftcgrp_No, v_Bfpay_Mthd, v_Bfpay_Dd, v_Bfacc_Seq, v_Bfacust_Nm, v_Bfacust_Tp, v_Bfaebir_Day, v_Bfabusl_No, v_Bfbank_No, v_Bfacct_No,
                                    v_Bfcrd_Seq, v_Bfccust_Nm, v_Bfccust_Tp, v_Bfcebir_Day, v_Bfcbusl_No, v_Bfcardcom_No, v_Bfcard_No, v_Bfexpire_Ym, v_Bfbatch_Key, v_Bfacc_Stat,
                                    v_Afcust_No, v_Aftcgrp_No, v_Afpay_Mthd, v_Afpay_Dd, v_Afacc_Seq, v_Afacust_Nm, v_Afacust_Tp, v_Afaebir_Day, v_Afabusl_No, v_Afbank_No,
                                    v_Afacct_No, v_Afacc_Chk, v_Afcrd_Seq, v_Afbatch_Key, v_Afccust_Nm, v_Afccust_Tp, v_Afcebir_Day, v_Afcbusl_No, v_Afcardcom_No, v_Afcard_No,
                                    v_Afexpire_Ym, v_Afbkey_Chk, v_Reg_Id, v_Rpc_Seq,
                                    v_Success_Code, v_Return_Message, v_ErrorText);


  END p_UpdateRtre0099Acrq;

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
    ) IS


    v_Acrq_Fg    RTRE0060.ACRQ_FG%TYPE DEFAULT NULL;  /*계좌신청 발생구분     */
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL; /*파일순번              */
    v_Extrc_Yn   RTRE0099.EXTRC_YN%TYPE DEFAULT 'N';  /*대상집계여부          */
    v_Confi_Yn   RTRE0099.CONFI_YN%TYPE DEFAULT 'N';  /*대상확인여부          */
    v_Fcret_Yn   RTRE0099.FCRET_YN%TYPE DEFAULT 'N';  /*파일생성여부          */
    v_Ftran_Yn   RTRE0099.FTRAN_YN%TYPE DEFAULT 'N';  /*파일전송여부          */
    v_Stdex_Dd   RTRE0099.STDEX_DD%TYPE DEFAULT NULL; /*결제일이체기준        */
    v_Str_Day    RTRE0099.STR_DAY%TYPE DEFAULT NULL;  /*집계대상 시작일       */
    v_End_Day    RTRE0099.END_DAY%TYPE DEFAULT NULL;  /*집계대상 종료일       */
    v_Header_Yn  RTRE0099.HEADER_YN%TYPE DEFAULT 'N'; /*HEADER 존재여부       */
    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT 'N';/*TRAILER 존재여부      */
    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE DEFAULT 0;   /*데이터 총건수         */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT 0;   /*데이터 총금액         */
    v_Acrq_Cnt   RTRE0099.ACRQ_CNT%TYPE DEFAULT 0;    /*계좌신청건수          */
    v_Accnrq_Cnt RTRE0099.ACCNRQ_CNT%TYPE DEFAULT 0;  /*계좌해지건수          */
    v_Rmcnrq_Cnt RTRE0099.RMCNRQ_CNT%TYPE DEFAULT 0;  /*계좌임의해지건수      */
    v_Reqst_Cnt  RTRE0099.REQST_CNT%TYPE DEFAULT 0;   /*요청건수              */
    v_Reqst_Amt  RTRE0099.REQST_AMT%TYPE DEFAULT 0;   /*요청금액              */
    v_Cncrq_Cnt  RTRE0099.CNCRQ_CNT%TYPE DEFAULT 0;   /*취소요청건수          */
    v_Cncrq_Amt  RTRE0099.CNCRQ_AMT%TYPE DEFAULT 0;   /*취소요청금액          */
    v_Srecp_Cnt  RTRE0099.SRECP_CNT%TYPE DEFAULT 0;   /*정상결제 처리건수     */
    v_Srecp_Amt  RTRE0099.SRECP_AMT%TYPE DEFAULT 0;   /*정상결제 처리금액     */
    v_Hsrcp_Cnt  RTRE0099.HSRCP_CNT%TYPE DEFAULT 0;   /*부분결제 처리건수     */
    v_Hsrcp_Amt  RTRE0099.HSRCP_AMT%TYPE DEFAULT 0;   /*부분결제 처리금액     */
    v_Erecp_Cnt  RTRE0099.ERECP_CNT%TYPE DEFAULT 0;   /*결제실패 처리건수     */
    v_Erecp_Amt  RTRE0099.ERECP_AMT%TYPE DEFAULT 0;   /*결제실패 처리금액     */
    v_Scnrq_Cnt  RTRE0099.SCNRQ_CNT%TYPE DEFAULT 0;   /*취소정상 처리건수     */
    v_Scnrq_Amt  RTRE0099.SCNRQ_AMT%TYPE DEFAULT 0;   /*취소정상 처리금액     */
    v_Ecnrq_Cnt  RTRE0099.ECNRQ_CNT%TYPE DEFAULT 0;   /*취소오류 처리건수     */
    v_Ecnrq_Amt  RTRE0099.ECNRQ_AMT%TYPE DEFAULT 0;   /*취소오류 처리금액     */
    v_Del_Yn     RTRE0099.DEL_YN%TYPE DEFAULT 'N';    /*삭제여부              */

    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT '2';   /*계좌신청 처리상태     */
    v_Cash_Stat  RTRE0091.CASH_STAT%TYPE DEFAULT NULL;/*현금영수증 발행상태   */

--    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT NULL;   /*송수신파일구분        */
--    v_Rqst_Day   RTRE0099.RQST_DAY%TYPE DEFAULT NULL;  /*요청일자              */
--    v_File_Nm    RTRE0099.FILE_NM%TYPE DEFAULT NULL;   /*파일명                */
--    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;  /*파일순번              */
--    v_Extrc_Yn   RTRE0099.EXTRC_YN%TYPE DEFAULT NULL;  /*대상집계여부          */
--    v_Header_Yn  RTRE0099.HEADER_YN%TYPE DEFAULT NULL; /*HEADER 존재여부       */
--    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT NULL;/*TRAILER 존재여부      */
--    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE DEFAULT NULL; /*데이터 총건수         */
--    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT NULL; /*데이터 총금액         */
--    v_Reg_Id     RTRE0099.REG_ID%TYPE DEFAULT NULL;    /*등록자 ID             */

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:요청일자,파일명, 등록자 ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Nm) IS NULL THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 파일 송수신 내역이 존재하면(이미 파일 업로드를 한 상태)
    IF 0 < Pkg_Rtre0098.f_sRtre0098CountCheck2(v_Rqst_Day, v_File_Nm) THEN

        BEGIN
            -- 대상확인여부
            SELECT  FILE_SEQ, CONFI_YN
            INTO    v_File_Seq, v_Confi_Yn
            FROM    RTRE0099
            WHERE   FILE_TP   = v_File_Tp
            AND     RQST_DAY  = v_Rqst_Day
            AND     FILE_NM   = v_File_Nm
            AND     FCRET_YN  = 'N' -- 파일생성여부
            AND     FTRAN_YN  = 'N' -- 파일전송여부
            AND     DEL_YN    = 'N';-- 삭제여부

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '송수신파일 순번 획득 실패!!!. 시스템관리자 문의 바람!(ERR CODE: 9GM5F2)';
                RAISE e_Error;
        END;

        IF v_Confi_Yn IS NULL THEN
            v_Return_Message := '대상확인이 안되므로 처리가 불가 합니다.!!';
            RAISE e_Error;

        ELSIF v_Confi_Yn = 'Y' THEN
            v_Return_Message := '대상확인이 완료된 상태이므로 처리가 불가 합니다.!!';
            RAISE e_Error;

        -- 대상확인 이전이므로 기존 데이터를 삭제(업데이트) 처리
        ELSIF v_Confi_Yn = 'N' THEN

            -- 송수신 작업(RTRE0099) - 요청일자, 파일명 기준 삭제처리
            IF 0 != f_DeleteRtre0099DelYn(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '송수신 작업(RTRE0099) - 요청일자, 파일명 기준 삭제처리 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


            -- 파일 송수신 내역(RTRE0098) Update - 송신 파일 존재시 DEL_YN 업데이트
            IF 0 != Pkg_Rtre0098.f_Delete0098FileClear2(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '파일 송수신 내역(RTRE0098) Update - 송신 파일 존재시 DEL_YN 업데이트 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 현금영수증 발행상태
            v_Cash_Stat := '2';

            -- 현금영수증발급내역(RTRE0091) 발행상태 업데이트
            IF 0!= Pkg_Rtre0091.f_UpdateRtre0091CashStat2 (v_Rqst_Day, v_File_Seq, v_Cash_Stat , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '현금영수증발급내역(RTRE0091) 발행상태 업데이트 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;

    END IF;

    -- 파일순번 획득
    v_File_Seq := f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);


    -- 송수신 작업(RTRE0099) 데이터 생성
    IF 0 != f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn,
                             v_Stdex_Dd, v_Str_Day, v_End_Day, v_Header_Yn,
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, v_Acrq_Cnt,
                             v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reqst_Cnt, v_Reqst_Amt,
                             v_Cncrq_Cnt, v_Cncrq_Amt, v_Srecp_Cnt, v_Srecp_Amt,
                             v_Hsrcp_Cnt, v_Hsrcp_Amt, v_Erecp_Cnt, v_Erecp_Amt,
                             v_Scnrq_Cnt, v_Scnrq_Amt, v_Ecnrq_Cnt, v_Ecnrq_Amt,
                             v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '송수신 작업(RTRE0099) 데이터 생성 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;

    END IF;


    -- 파일 송수신 내역(RTRE0098) 생성 - 데이터 파일 파싱하여 생성
    Pkg_Rtre0098.p_InsertRtre0098FileParsingCh(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq,
                                               v_File_Data, v_Header_Yn,
                                               v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, v_Reg_Id,
                                               v_Success_Code, v_Return_Message, v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '파일 송수신 내역(RTRE0098) 생성 - 데이터 파일 파싱하여 생성 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 대상집계여부
    v_Extrc_Yn := 'Y';

    -- 송수신 작업(RTRE0099) Update - 현금영수증 결과파일 업로드 결과 업데이트
    IF 0 != f_UpdateRtre0099CashFileUpload (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                            v_Extrc_Yn, v_Header_Yn, v_Trailer_Yn, v_Tdata_Cnt,
                                            v_Tdata_Amt, v_Reg_Id,
                                            v_ErrorText) THEN
        v_Return_Message := '송수신 작업(RTRE0099) Update - 계좌신정 대상 배치 결과 업데이트 실패!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_InsertRtre0099AcrqFileUpload(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_InsertRtre0099AcrqFileUpload(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0099CashFileUpload;

END Pkg_Rtre0099;
/
