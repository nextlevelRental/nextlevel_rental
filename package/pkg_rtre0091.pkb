CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0091 AS
/*******************************************************************************
   NAME      Pkg_Rtre0091
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
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0091
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     CASH_SEQ = v_Cash_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0091Count;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.CASH_SEQ,                  /*현금영수증 발행 일련*/
            A.CASH_DAY,                  /*현금영수증발행일자  */
            A.FILE_SEQ,                  /*파일순번            */
            A.RECV_DAY,                  /*수납일자            */
            A.RECV_TIME,                 /*수납시간            */
            A.CUST_NO,                   /*고객번호            */
            A.CUST_NM,                   /*고객명              */
            A.CASHD_TP,                  /*거래구분            */
            A.CASHD_FG,                  /*발행대상구분        */
            A.CHI_NO,                    /*현금영수증 식별번호 */
            A.CASH_AMT,                  /*현금영수증 발행금액 */
            A.CASH_NAMT,                 /*현금영수증 발행 공급*/
            A.CASH_VAMT,                 /*현금영수증 발행 부가*/
            A.CASH_STAT,                 /*현금영수증 발행상태 */
            A.CASHAPP_NO,                /*현금영수증 승인번호 */
            A.CSERCD,                    /*발급오류코드        */
            A.CSERMSG,                   /*발급오류메세지      */
            A.OCAPP_NO,                  /*원승인번호          */
            A.OCASH_DAY,                 /*원승인일자          */
            A.CNC_YN,                    /*취소여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0091 A
    WHERE   A.RECV_SEQ   = DECODE(v_Recv_Seq  , NULL, A.RECV_SEQ   , v_Recv_Seq)
    AND     A.CASH_SEQ   = DECODE(v_Cash_Seq  , NULL, A.CASH_SEQ   , v_Cash_Seq)
    AND     A.CASH_DAY   = DECODE(v_Cash_Day  , NULL, A.CASH_DAY   , v_Cash_Day)
    AND     A.FILE_SEQ   = DECODE(v_File_Seq  , NULL, A.FILE_SEQ   , v_File_Seq)
    AND     A.RECV_DAY   = DECODE(v_Recv_Day  , NULL, A.RECV_DAY   , v_Recv_Day)
    AND     A.RECV_TIME  = DECODE(v_Recv_Time , NULL, A.RECV_TIME  , v_Recv_Time)
    AND     A.CUST_NO    = DECODE(v_Cust_No   , NULL, A.CUST_NO    , v_Cust_No)
    AND     A.CUST_NM    = DECODE(v_Cust_Nm   , NULL, A.CUST_NM    , v_Cust_Nm)
    AND     A.CASHD_TP   = DECODE(v_Cashd_Tp  , NULL, A.CASHD_TP   , v_Cashd_Tp)
    AND     A.CASHD_FG   = DECODE(v_Cashd_Fg  , NULL, A.CASHD_FG   , v_Cashd_Fg)
    AND     A.CHI_NO     = DECODE(v_Chi_No    , NULL, A.CHI_NO     , v_Chi_No)
    AND     A.CASH_AMT   = DECODE(v_Cash_Amt  , NULL, A.CASH_AMT   , v_Cash_Amt)
    AND     A.CASH_NAMT  = DECODE(v_Cash_Namt , NULL, A.CASH_NAMT  , v_Cash_Namt)
    AND     A.CASH_VAMT  = DECODE(v_Cash_Vamt , NULL, A.CASH_VAMT  , v_Cash_Vamt)
    AND     A.CASH_STAT  = DECODE(v_Cash_Stat , NULL, A.CASH_STAT  , v_Cash_Stat)
    AND     A.CASHAPP_NO = DECODE(v_Cashapp_No, NULL, A.CASHAPP_NO , v_Cashapp_No)
    AND     A.CSERCD     = DECODE(v_Csercd    , NULL, A.CSERCD     , v_Csercd)
    AND     A.CSERMSG    = DECODE(v_Csermsg   , NULL, A.CSERMSG    , v_Csermsg)
    AND     A.OCAPP_NO   = DECODE(v_Ocapp_No  , NULL, A.OCAPP_NO   , v_Ocapp_No)
    AND     A.OCASH_DAY  = DECODE(v_Ocash_Day , NULL, A.OCASH_DAY  , v_Ocash_Day)
    AND     A.CNC_YN     = DECODE(v_Cnc_Yn    , NULL, A.CNC_YN     , v_Cnc_Yn)
    AND     A.REG_ID     = DECODE(v_Reg_Id    , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtre0091;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0091 (
            RECV_SEQ,
            CASH_SEQ,
            CASH_DAY,
            FILE_SEQ,
            RECV_DAY,
            RECV_TIME,
            CUST_NO,
            CUST_NM,
            CASHD_TP,
            CASHD_FG,
            CHI_NO,
            CASH_AMT,
            CASH_NAMT,
            CASH_VAMT,
            CASH_STAT,
            CASHAPP_NO,
            CSERCD,
            CSERMSG,
            OCAPP_NO,
            OCASH_DAY,
            CNC_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Cash_Seq,
            v_Cash_Day,
            v_File_Seq,
            v_Recv_Day,
            v_Recv_Time,
            v_Cust_No,
            v_Cust_Nm,
            v_Cashd_Tp,
            v_Cashd_Fg,
            v_Chi_No,
            v_Cash_Amt,
            v_Cash_Namt,
            v_Cash_Vamt,
            v_Cash_Stat,
            v_Cashapp_No,
            v_Csercd,
            v_Csermsg,
            v_Ocapp_No,
            v_Ocash_Day,
            v_Cnc_Yn,
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

  END f_InsertRtre0091;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0091
    SET    CASH_DAY   = v_Cash_Day,
           FILE_SEQ   = v_File_Seq,
           RECV_DAY   = v_Recv_Day,
           RECV_TIME  = v_Recv_Time,
           CUST_NO    = v_Cust_No,
           CUST_NM    = v_Cust_Nm,
           CASHD_TP   = v_Cashd_Tp,
           CASHD_FG   = v_Cashd_Fg,
           CHI_NO     = v_Chi_No,
           CASH_AMT   = v_Cash_Amt,
           CASH_NAMT  = v_Cash_Namt,
           CASH_VAMT  = v_Cash_Vamt,
           CASH_STAT  = v_Cash_Stat,
           CASHAPP_NO = v_Cashapp_No,
           CSERCD     = v_Csercd,
           CSERMSG    = v_Csermsg,
           OCAPP_NO   = v_Ocapp_No,
           OCASH_DAY  = v_Ocash_Day,
           CNC_YN     = v_Cnc_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  RECV_SEQ   = v_Recv_Seq
    AND    CASH_SEQ   = v_Cash_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0091;

  /*****************************************************************************
  -- 현금영수증발급내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0091
    SET    CNC_YN   = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  RECV_SEQ = v_Recv_Seq
    AND    CASH_SEQ = v_Cash_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0091;

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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 수납거래번호, 현금영수증 발행 일련번호, 현금영수증발행일자, 파일순번, 수납일자, 수납시간, 고객번호, 고객명, 거래구분, 발행대상구분, 현금영수증 식별번호, 현금영수증 발행금액, 현금영수증 발행 공급가액, 현금영수증 발행 부가세, 현금영수증 발행상태  등록자 ID
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Chi_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Cash_Day) THEN
        v_Return_Message := '현금영수증발행일자('||v_Cash_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Seq) IS NULL THEN
        v_Return_Message := '파일순번('||v_File_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISTIME(v_Recv_Time) THEN
        v_Return_Message := '수납시간('||v_Recv_Time||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm) IS NULL THEN
        v_Return_Message := '고객명('||v_Cust_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cashd_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R030', v_Cashd_Tp)) THEN
        v_Return_Message := '거래구분('||v_Cashd_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cashd_Fg) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R031', v_Cashd_Fg)) THEN
        v_Return_Message := '발행대상구분('||v_Cashd_Fg||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Chi_No) IS NULL THEN
        v_Return_Message := '현금영수증 식별번호('||v_Chi_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Amt) IS NULL THEN
        v_Return_Message := '현금영수증 발행금액('||v_Cash_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Namt) IS NULL THEN
        v_Return_Message := '현금영수증 발행 공급가액('||v_Cash_Namt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Vamt) IS NULL THEN
        v_Return_Message := '현금영수증 발행 부가세액('||v_Cash_Vamt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cash_Stat) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R033', v_Cash_Stat)) THEN
        v_Return_Message := '현금영수증 발행상태('||v_Cash_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Csercd) IS NOT NULL) AND (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R028', v_Csercd)) THEN
        v_Return_Message := '발급오류코드('||v_Csercd||') : 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn = 'I' THEN

        v_Cash_Seq := f_sRtre0091CashSeq(v_Recv_Seq);

        IF 0 != f_InsertRtre0091(v_Recv_Seq, v_Cash_Seq, v_Cash_Day, v_File_Seq,
                                 v_Recv_Day, v_Recv_Time, v_Cust_No, v_Cust_Nm,
                                 v_Cashd_Tp, v_Cashd_Fg, v_Chi_No, v_Cash_Amt,
                                 v_Cash_Namt, v_Cash_Vamt, v_Cash_Stat, v_Cashapp_No,
                                 v_Csercd, v_Csermsg, v_Ocapp_No, v_Ocash_Day,
                                 v_Cnc_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '현금영수증발급내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE

        IF 0 = f_sRtre0091Count(v_Recv_Seq, v_Cash_Seq) THEN
            v_Return_Message := '해당 수납거래번호('||v_Reg_Id||'-'||v_Cash_Seq||')로 등록된 데이터가 존재하지 않음으로 수정/삭제가 불가합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0091(v_Recv_Seq, v_Cash_Seq, v_Cash_Day, v_File_Seq,
                                     v_Recv_Day, v_Recv_Time, v_Cust_No, v_Cust_Nm,
                                     v_Cashd_Tp, v_Cashd_Fg, v_Chi_No, v_Cash_Amt,
                                     v_Cash_Namt, v_Cash_Vamt, v_Cash_Stat, v_Cashapp_No,
                                     v_Csercd, v_Csermsg, v_Ocapp_No, v_Ocash_Day,
                                     v_Cnc_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '현금영수증발급내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0091(v_Recv_Seq, v_Cash_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '현금영수증발급내역 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_IUDRtre0091(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_IUDRtre0091(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0091;


  /*****************************************************************************
  -- 현금영수증발급내역 - 현금영수증 발행 일련 획득
  *****************************************************************************/
  FUNCTION f_sRtre0091CashSeq(
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER IS
    v_Cash_Seq RTRE0091.CASH_SEQ%TYPE DEFAULT NULL;     /*현금영수증 발행 일련*/
  BEGIN

    SELECT  NVL((SELECT  MAX(CASH_SEQ)
                 FROM    RTRE0091
                 WHERE   RECV_SEQ = v_Recv_Seq)+ 1, 1)
    INTO    v_Cash_Seq
    FROM    DUAL;

    RETURN v_Cash_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0091CashSeq;


  /*****************************************************************************
  -- 현금영수증발급내역 Update - 현금영수증 발행상태
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashStat (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*현금영수증 발행 일련번*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0091
    SET    CASH_STAT = v_Cash_Stat,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  RECV_SEQ  = v_Recv_Seq
    AND    CASH_SEQ  = v_Cash_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0091CashStat;

  /*****************************************************************************
  -- 현금영수증발급내역 Update - 현금영수증 발행상태
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashStat2 (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*파일순번              */
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*현금영수증 발행상태   */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0091
    SET    CASH_STAT = v_Cash_Stat,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  CASH_DAY  = v_Cash_Day
    AND    FILE_SEQ  = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0091CashStat2;


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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0091
    SET     CASH_STAT  = v_Cash_Stat,
            CASHAPP_NO = v_Cashapp_No,
            CSERCD     = v_Csercd,
            CSERMSG    = v_Csermsg,
            CHG_ID     = v_Reg_Id,
            CHG_DT     = SYSDATE
    WHERE   RECV_SEQ   = v_Recv_Seq
    AND     CASH_SEQ   = v_Cash_Seq;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0091CashUload;

  /*****************************************************************************
  -- 현금영수증발급내역 Select - 발행일을 기준으로 발행대상에 대한 현황을 조회한다.
  *****************************************************************************/
  PROCEDURE p_sRtre0091TargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;  /*파일순번              */
    v_Extrc_Yn  RTRE0099.EXTRC_YN%TYPE DEFAULT NULL;  /*대상집계여부          */
    v_Confi_Yn  RTRE0099.CONFI_YN%TYPE DEFAULT NULL;  /*대상확인여부          */
    v_Fcret_Yn  RTRE0099.FCRET_YN%TYPE DEFAULT NULL;  /*파일생성여부          */
    v_Ftran_Yn  RTRE0099.FTRAN_YN%TYPE DEFAULT NULL;  /*파일전송여부          */
  BEGIN

    -- 발행대상에 대한 현황
    OPEN Ref_Cursor FOR
    SELECT  A.CASH_DAY,                  /*현금영수증발행일자  */
            A.CASH_STAT,                 /*현금영수증 발행상태 */
            Pkg_Rtcm0051.f_sRtcm0051Codename('R033', A.CASH_STAT) CASH_STAT_NM,   /*현금영수증 발행상태 */
            A.CASH_CNT,                  /*현금영수증 건수 */
            A.CASH_AMT,                  /*현금영수증 발행금액 */
            A.CASH_NAMT,                 /*현금영수증 발행 공급*/
            A.CASH_VAMT                  /*현금영수증 발행 부가*/
    FROM    (
            SELECT  CASH_DAY,
                    CASH_STAT,
                    COUNT(*) AS CASH_CNT,
                    SUM(CASH_AMT ) AS CASH_AMT,
                    SUM(CASH_NAMT ) AS CASH_NAMT,
                    SUM(CASH_VAMT ) AS CASH_VAMT
            FROM    RTRE0091
            WHERE   CASH_DAY = v_Cash_Day
            AND     FILE_SEQ = ( SELECT FILE_SEQ FROM RTRE0099
                                 WHERE FILE_TP  = 'CH01_INX'
                                 AND   RQST_DAY = v_Cash_Day
                                 AND   DEL_YN = 'N'
                                 AND   ROWNUM = 1 )
            GROUP   BY CASH_DAY, CASH_STAT
            ) A;

    -- 송수신 작업 결과 SET
    SELECT  FILE_SEQ,
            EXTRC_YN,
            CONFI_YN,
            FCRET_YN,
            FTRAN_YN
    INTO    v_File_Seq, v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn
    FROM    RTRE0099
    WHERE   FILE_TP  = 'CH01_INX'
    AND     RQST_DAY = v_Cash_Day
    AND     FILE_NM  = 'KCP_BATCH_FILE_CH01_INX_V3770_' ||v_Cash_Day
    AND     DEL_YN   = 'N';


    IF  v_Extrc_Yn  = 'N' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
      v_Success_code := 0;
      v_Return_Message := '대상집계가 완료 되지 않았습니다.';
    ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
      v_Success_code := 0;
      v_Return_Message := '대상집계 완료, 대상확인 하시기 바랍니다.';
    ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
      v_Success_code := 0;
      v_Return_Message := '대상확인 완료, 파일생성 하시기 바랍니다.';
    ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'N' THEN
      v_Success_code := 0;
      v_Return_Message := '파일생성 완료, 전송완료 하시기 바랍니다.';
    ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'Y' THEN
      v_Success_code := 0;
      v_Return_Message := '현금영수증 발행 처리 완료 되었습니다.';
    ELSE
      v_Success_code := -1;
      v_Return_Message := '시스템 담당자에게 확인하세요.';
    END IF;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_Success_Code := -1;
        v_Return_Message := '현금영수증 발행대상(RTRE0099)이 없음으로 처리 불가합니다.';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_sRtre0091TargetList(2)', v_Errortext, v_Return_Message);
      WHEN OTHERS THEN
        v_Success_Code := -1;
        v_Return_Message := '시스템 담당자에게 확인하세요.';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_sRtre0091TargetList(2)', v_Errortext, v_Return_Message);

  END p_sRtre0091TargetList;

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
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    WITH TMRE0091 AS (
            SELECT  A.RECV_SEQ, A.RECV_DAY, A.CASH_AMT, A.CASH_NAMT,
                    A.CASH_VAMT, A.CUST_NO, A.CHI_NO, A.CASH_DAY,
                    A.CASHAPP_NO, A.CASH_STAT, A.CSERMSG,
                    A.CASH_SEQ
            FROM    RTRE0091 A
            WHERE   A.CASH_DAY BETWEEN v_Cash_Day_F AND v_Cash_Day_T
            AND     A.RECV_DAY BETWEEN v_Recv_Day_F AND v_Recv_Day_T
            AND     A.CUST_NO = DECODE( v_Cust_No, NULL, A.CUST_NO, v_Cust_No)
            AND     (v_Cash_Stat IS NULL OR A.CASH_STAT =  v_Cash_Stat)
            )
    SELECT  A.RECV_DAY,                                                         /*수납일자                      */
            A.CASH_AMT,                                                         /*현금영수증 발행 금액          */
            A.CASH_NAMT,                                                        /*현금영수증 발행 공급가액      */
            A.CASH_VAMT,                                                        /*현금영수증 발행 부가세        */
            Pkg_Rtre0030.f_sRtre0030Recp_Pay(A.RECV_SEQ) AS RECV_PAY,           /*수납방법                      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R019', Pkg_Rtre0030.f_sRtre0030Recp_Pay(A.RECV_SEQ)) AS RECV_PAY_NM, /*수납방법명 */
            A.CUST_NO,                                                          /*고객번호                      */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) AS CUST_NM,             /*고객명                        */
            A.CHI_NO,                                                           /*현금영수증 식별번호           */
            A.CASH_DAY,                                                         /*현금영수증 발행일자           */
            A.CASHAPP_NO,                                                       /*현금영수증 승인번호           */
            A.CASH_STAT,                                                        /*현금영수증 발행상태           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R033', A.CASH_STAT) AS CASH_STAT_NM,/*현금영수증 발행상태명       */
            A.CSERMSG,                                                          /*발급오류메세지                */
            A.RECV_SEQ,                                                         /*수납거래번호                  */
            B.REGI_AMT,                                                         /*등록비                        */
            B.RENT_AMT,                                                         /*렌탈료                        */
            B.RTAR_AMT,                                                         /*렌탈연체료                    */
            B.CANC_AMT,                                                         /*취소수수료                    */
            B.PNTY_AMT,                                                         /*위약금                        */
            B.PPAY_AMT,                                                         /*선수금                        */
            B.ETC_AMT,                                                          /*기타                          */
            A.CASH_SEQ                                                          /*현금영수증발행순번            */
    FROM    TMRE0091 A,
            (
            SELECT  B.RECV_SEQ,
                    SUM(DECODE(B.RECP_TP, '01', B.RECP_AMT,0)) REGI_AMT,       /*등록비     */
                    SUM(DECODE(B.RECP_TP, '11', B.RECP_AMT,0)) RENT_AMT,       /*렌탈료     */
                    SUM(DECODE(B.RECP_TP, '12', B.RECP_AMT,0)) RTAR_AMT,       /*렌탈연체료 */
                    SUM(DECODE(B.RECP_TP, '41', B.RECP_AMT,0)) CANC_AMT,       /*취소수수료 */
                    SUM(DECODE(B.RECP_TP, '42', B.RECP_AMT,0)) PNTY_AMT,       /*위약금     */
                    SUM(DECODE(B.RECP_TP, '90', B.RECP_AMT,0)) PPAY_AMT,       /*선수금     */
                    SUM(DECODE(B.RECP_TP, '01',0,'11',0,'12',0,'41',0,'42',0,'90',0,B.RECP_AMT,0)) ETC_AMT /*기타       */
            FROM    RTRE0030 B
            WHERE   B.RECV_SEQ IN (SELECT C.RECV_SEQ FROM  TMRE0091 C)           
            GROUP   BY B.RECV_SEQ
            ) B
    WHERE   A.RECV_SEQ = B.RECV_SEQ(+)
    ORDER BY A.RECV_SEQ, A.CASH_SEQ;

  END p_sRtre0091CashReceiptList;


  /*****************************************************************************
  -- 현금영수증발급내역 - 현금영수증 결과 내역을 기준으로 수납내역에 발행여부 업데이트 처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0091CashReltApply (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 현금영수증발급내역
    CURSOR  Cur_Rtre0091 (v_File_Seq NUMBER) IS
    SELECT  RECV_SEQ, CASH_SEQ, CASH_STAT
    FROM    RTRE0091
    WHERE   CASH_DAY = v_Cash_Day
    AND     FILE_SEQ = v_File_Seq;

    v_Total_Cnt  NUMBER DEFAULT 0;
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;   /*파일순번              */
    v_Cash_Yn    RTRE0030.CASH_YN%TYPE DEFAULT NULL;    /*현금영수증 발행여부   */
    v_Cash_Stat  RTRE0091.CASH_STAT%TYPE DEFAULT NULL;  /*현금영수증 발행상태   */
    e_Error EXCEPTION;
  BEGIN

    -- 필수값:현금영수증발행일자, 등록자 ID
    IF 0 != ISDATE(v_Cash_Day) THEN
        v_Return_Message := '현금영수증발행일자('||v_Cash_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    BEGIN
        -- 송수신파일 순번 획득
        SELECT  FILE_SEQ
        INTO    v_File_Seq
        FROM    RTRE0099
        WHERE   FILE_TP   = 'CH01_OUT'
        AND     RQST_DAY  = v_Cash_Day
        AND     DEL_YN    = 'N'
        AND     EXTRC_YN  = 'Y'
        AND     CONFI_YN  = 'Y'
        AND     FCRET_YN  = 'N'
        AND     FTRAN_YN  = 'N';

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '발행일('||v_Cash_Day||')에 대한 확인완료 처리가 진행되지 않았습니다.!!. 시스템관리자 문의 바람!';
            RAISE e_Error;
    END;

    IF v_File_Seq IS NULL THEN
        v_Return_Message := '발행일('||v_Cash_Day||')에 대한 확인완료 처리가 진행되지 않았습니다.!!. 시스템관리자 문의 바람!';
        RAISE e_Error;
    END IF;

    BEGIN
        -- 송수신파일 순번 획득
        SELECT  FILE_SEQ
        INTO    v_File_Seq
        FROM    RTRE0099
        WHERE   FILE_TP   = 'CH01_INX'
        AND     RQST_DAY  = v_Cash_Day
        AND     DEL_YN    = 'N'
        AND     EXTRC_YN  = 'Y'
        AND     CONFI_YN  = 'Y'
        AND     FCRET_YN  = 'Y'
        AND     FTRAN_YN  = 'Y';

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '송수신파일 순번 획득 실패!!!. 시스템관리자 문의 바람!(ERR CODE: E3S9C3)';
            RAISE e_Error;
    END;

    IF v_File_Seq IS NULL THEN
        v_Return_Message := '처리할 파일 송수신 내역(RTRE0099) 대상이 없습니다!!. 시스템관리자 문의 바람!';
        RAISE e_Error;
    END IF;

    -- 현금영수증발급내역(RTRE0091) 기준 수납 내역(RTRE0030) 현금영수증발행여부 및 현금영수증발급내역(RTRE0091) 발행상태 업데이트
    FOR CUR IN Cur_Rtre0091(v_File_Seq) LOOP
        EXIT WHEN Cur_Rtre0091%NOTFOUND;
        v_Total_Cnt := v_Total_Cnt+1;

        IF CUR.CASH_STAT = '4' THEN

            -- 현금영수증 발행여부
            v_Cash_Yn := 'Y';

            -- 수납 내역(RTRE0030) 현금영수증발행여부 Update
            IF 0!= Pkg_Rtre0030.f_UpdateRtre0030Aggregate(CUR.RECV_SEQ, v_Cash_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납 내역(RTRE0030) 현금영수증발행여부 Update 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 현금영수증 발행상태
            v_Cash_Stat := '5';

            -- 현금영수증발급내역(RTRE0091) 발행상태 업데이트
            IF 0!= Pkg_Rtre0091.f_UpdateRtre0091CashStat (CUR.RECV_SEQ, CUR.CASH_SEQ, v_Cash_Stat , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '현금영수증발급내역(RTRE0091) 발행상태 업데이트 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF CUR.CASH_STAT = '3' THEN

            -- 현금영수증 발행여부
            v_Cash_Yn := 'N';

            -- 수납 내역(RTRE0030) 현금영수증발행여부 Update
            IF 0!= Pkg_Rtre0030.f_UpdateRtre0030Aggregate(CUR.RECV_SEQ, v_Cash_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := ' 수납 내역(RTRE0030) 현금영수증발행여부 Update 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '현금영수증 결과 반영처리 할 수 있는 상태('||CUR.CASH_STAT||')가 아니므로 처리 불가!!.';
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0091%ISOPEN THEN
        CLOSE Cur_Rtre0091;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_UpdateRtre0091CashReltApply(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_UpdateRtre0091CashReltApply(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0091CashReltApply;

END Pkg_Rtre0091;