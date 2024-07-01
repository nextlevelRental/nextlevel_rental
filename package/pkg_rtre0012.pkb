CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0012 AS
/*******************************************************************************
   NAME      Pkg_Rtre0012
   PURPOSE   계좌인증 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-20  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계좌인증 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0012Count(
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,        /*계좌인증 일자       */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE         /*계좌인증 순번       */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0012
    WHERE   ACERT_DAY = v_Acert_Day
    AND     ACERT_SEQ = v_Acert_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0012Count;

  /*****************************************************************************
  -- 계좌인증 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0012 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*사업자번호            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*고객명                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*계좌확인상태          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*인증결과코드          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*인증결과메시지        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*예금주                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*조회수                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACERT_DAY,                 /*계좌인증 일자       */
            A.ACERT_SEQ,                 /*계좌인증 순번       */
            A.BANK_CD,                   /*은행코드            */
            A.ACCT_NO,                   /*계좌번호            */
            A.CUST_TP,                   /*고객유형            */
            A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
            A.BUSL_NO,                   /*사업자번호          */
            A.ACERT_ID,                  /*인증요청자          */
            A.CUST_NO,                   /*고객번호            */
            A.CUST_NM,                   /*고객명              */
            A.ACERT_CHK,                 /*계좌확인상태        */
            A.ACERT_ERRCD,               /*인증결과코드        */
            A.ACERT_DESC,                /*인증결과메시지      */
            A.OWNER_NM,                  /*예금주              */
            A.CHKCNT,                    /*조회수              */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0012 A
    WHERE   A.ACERT_DAY        = DECODE(v_Acert_Day      , NULL, A.ACERT_DAY       , v_Acert_Day);
--    AND     A.ACERT_SEQ        = DECODE(v_Acert_Seq      , NULL, A.ACERT_SEQ       , v_Acert_Seq)
--    AND     A.BANK_CD          = DECODE(v_Bank_Cd        , NULL, A.BANK_CD         , v_Bank_Cd)
--    AND     A.ACCT_NO          = DECODE(v_Acct_No        , NULL, A.ACCT_NO         , v_Acct_No)
--    AND     A.CUST_TP          = DECODE(v_Cust_Tp        , NULL, A.CUST_TP         , v_Cust_Tp)
--    AND     A.EBIR_DAY         = DECODE(v_Ebir_Day       , NULL, A.EBIR_DAY        , v_Ebir_Day)
--    AND     A.BUSL_NO          = DECODE(v_Busl_No        , NULL, A.BUSL_NO         , v_Busl_No)
--    AND     A.ACERT_ID         = DECODE(v_Acert_Id       , NULL, A.ACERT_ID        , v_Acert_Id)
--    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
--    AND     A.CUST_NM          = DECODE(v_Cust_Nm        , NULL, A.CUST_NM         , v_Cust_Nm)
--    AND     A.ACERT_CHK        = DECODE(v_Acert_Chk      , NULL, A.ACERT_CHK       , v_Acert_Chk)
--    AND     A.ACERT_ERRCD      = DECODE(v_Acert_Errcd    , NULL, A.ACERT_ERRCD     , v_Acert_Errcd)
--    AND     A.ACERT_DESC       = DECODE(v_Acert_Desc     , NULL, A.ACERT_DESC      , v_Acert_Desc)
--    AND     A.OWNER_NM         = DECODE(v_Owner_Nm       , NULL, A.OWNER_NM        , v_Owner_Nm)
--    AND     A.CHKCNT           = DECODE(v_Chkcnt         , NULL, A.CHKCNT          , v_Chkcnt)
--    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre0012;

  /*****************************************************************************
  -- 계좌인증 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*사업자번호            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*고객명                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*계좌확인상태          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*인증결과코드          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*인증결과메시지        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*예금주                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*조회수                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0012 (
            ACERT_DAY,
            ACERT_SEQ,
            BANK_CD,
            ACCT_NO,
            CUST_TP,
            EBIR_DAY,
            BUSL_NO,
            ACERT_ID,
            CUST_NO,
            CUST_NM,
            ACERT_CHK,
            ACERT_ERRCD,
            ACERT_DESC,
            OWNER_NM,
            CHKCNT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Acert_Day,
            v_Acert_Seq,
            v_Bank_Cd,
            v_Acct_No,
            v_Cust_Tp,
            v_Ebir_Day,
            v_Busl_No,
            v_Acert_Id,
            v_Cust_No,
            v_Cust_Nm,
            v_Acert_Chk,
            v_Acert_Errcd,
            v_Acert_Desc,
            v_Owner_Nm,
            v_Chkcnt,
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

  END f_InsertRtre0012;

  /*****************************************************************************
  -- 계좌인증 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*사업자번호            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*고객명                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*계좌확인상태          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*인증결과코드          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*인증결과메시지        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*예금주                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*조회수                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0012
    SET    BANK_CD     = v_Bank_Cd,
           ACCT_NO     = v_Acct_No,
           CUST_TP     = v_Cust_Tp,
           EBIR_DAY    = v_Ebir_Day,
           BUSL_NO     = v_Busl_No,
           ACERT_ID    = v_Acert_Id,
           CUST_NO     = v_Cust_No,
           CUST_NM     = v_Cust_Nm,
           ACERT_CHK   = v_Acert_Chk,
           ACERT_ERRCD = v_Acert_Errcd,
           ACERT_DESC  = v_Acert_Desc,
           OWNER_NM    = v_Owner_Nm,
           CHKCNT      = v_Chkcnt,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  ACERT_DAY   = v_Acert_Day
    AND    ACERT_SEQ   = v_Acert_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0012;

  /*****************************************************************************
  -- 계좌인증 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0012
    WHERE  ACERT_DAY        = v_Acert_Day
    AND    ACERT_SEQ        = v_Acert_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.f_DeleteRtre0012(1)', '계좌인증 일자', v_Acert_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.f_DeleteRtre0012(1)', '계좌인증 순번', v_Acert_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.f_DeleteRtre0012(1)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0012;

  /*****************************************************************************
  -- 계좌인증 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0012 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Acert_Seq      IN OUT RTRE0012.ACERT_SEQ%TYPE,      /*계좌인증 순번         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*사업자번호            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*고객명                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*계좌확인상태          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*인증결과코드          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*인증결과메시지        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*예금주                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*조회수                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계좌인증 일자, 은행코드 ,계좌번호 ,고객번호 ,고객명 ,고객유형 ,법정생년월일(YYMMDD) ,사업자번호, 계좌확인상태, 사용여부,  등록자 ID
    IF 0 != ISDATE(v_Acert_Day) THEN
        v_Return_Message := '계좌인증 일자('||v_Acct_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Bank_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R001', v_Bank_Cd)) THEN
        v_Return_Message := '은행코드('||v_Bank_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Acct_No) IS NULL THEN
        v_Return_Message := '계좌번호('||v_Acct_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF (TRIM(v_Acert_Chk) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R012', v_Acert_Chk)) THEN
        v_Return_Message := '계좌확인상태('||v_Acert_Chk||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Cust_Tp)) THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 개인(01), 사업자(02)
    IF TRIM(v_Cust_Tp) = '01' THEN

        IF TRIM(v_Ebir_Day) IS NULL THEN
            v_Return_Message := '법정생년월일(YYMMDD)('||v_Ebir_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    ELSE
        IF TRIM(v_Busl_No) IS NULL THEN
            v_Return_Message := '사업자번호('||v_Busl_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Acert_Seq) IS NULL) THEN
        v_Acert_Seq := f_sRtre0012AcertSeq();
    END IF;

    IF 0 = f_sRtre0012Count(v_Acert_Day, v_Acert_Seq) THEN

        IF 0 != f_InsertRtre0012(v_Acert_Day ,v_Acert_Seq ,v_Bank_Cd ,v_Acct_No ,
                                 v_Cust_Tp ,v_Ebir_Day ,v_Busl_No ,v_Acert_Id ,
                                 v_Cust_No ,v_Cust_Nm ,v_Acert_Chk ,v_Acert_Errcd ,
                                 v_Acert_Desc ,v_Owner_Nm ,v_Chkcnt ,v_Reg_Id ,
                                 v_ErrorText) THEN
            v_Return_Message := '계좌인증 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0012(v_Acert_Day ,v_Acert_Seq ,v_Bank_Cd ,v_Acct_No ,
                                     v_Cust_Tp ,v_Ebir_Day ,v_Busl_No ,v_Acert_Id ,
                                     v_Cust_No ,v_Cust_Nm ,v_Acert_Chk ,v_Acert_Errcd ,
                                     v_Acert_Desc ,v_Owner_Nm ,v_Chkcnt ,v_Reg_Id ,
                                     v_ErrorText) THEN
                v_Return_Message := '계좌인증 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0012(v_Acert_Day ,v_Acert_Seq ,v_Reg_Id ,v_ErrorText) THEN
                v_Return_Message := '계좌인증 내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.p_IUDRtre0012(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.p_IUDRtre0012(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0012;


  /*****************************************************************************
  -- 계좌인증 내역 - 계좌인증 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0012AcertSeq RETURN NUMBER IS

    v_Acert_Seq RTRE0012.ACERT_SEQ%TYPE DEFAULT NULL; /*계좌인증 순번         */
  BEGIN

    SELECT  SEQ_RTRE0012ACERT_SEQ.NEXTVAL ACERT_SEQ
    INTO    v_Acert_Seq
    FROM    DUAL;

    RETURN v_Acert_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0012AcertSeq;


  /*****************************************************************************
  -- 계좌인증 내역 - 특정일 계좌 인증 성공 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0012AcertChkSeq(
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE         /*계좌번호              */
    ) RETURN NUMBER IS

    v_Acert_Seq RTRE0012.ACERT_SEQ%TYPE DEFAULT NULL; /*계좌인증 순번         */
  BEGIN

    SELECT  ACERT_SEQ
    INTO    v_Acert_Seq
    FROM    RTRE0012
    WHERE   ACERT_DAY = v_Acert_Day
    AND     BANK_CD   = v_Bank_Cd
    AND     ACCT_NO   = v_Acct_No
    AND     ACERT_CHK = 'Y'  /*계좌확인상태(Y,N) */
    AND     ROWNUM    = 1;

    RETURN v_Acert_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0012AcertChkSeq;


  /*****************************************************************************
  -- 당일 계좌인증내역조회
  *****************************************************************************/
  PROCEDURE p_sRtre0012TodayExistsCmsInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*계좌번호              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Serial_No IN VARCHAR2                 /*법정생년월일(YYMMDD), 사업자번호  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACERT_ERRCD
    FROM    RTRE0012 A
    WHERE   A.ACERT_DAY        = v_Acert_Day
    AND     A.BANK_CD          = v_Bank_Cd
    AND     A.ACCT_NO          = v_Acct_No
    AND     DECODE (v_Cust_Tp, '01', A.EBIR_DAY, '02', A.BUSL_NO) = v_Cust_Serial_No
    AND     ACERT_CHK = 'Y'
    AND     ROWNUM = 1;

  END p_sRtre0012TodayExistsCmsInfo;

  /*****************************************************************************
  -- 당일계좌 정상인증 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0012TodayCmsInfos (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*계좌인증 일자         */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE         /*고객번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT ACERT_DAY,                 /*계좌인증 일자       */
           ACERT_SEQ,                 /*계좌인증 순번       */
           BANK_CD,                   /*은행코드            */
           ACCT_NO,                   /*계좌번호            */
           CUST_TP,                   /*고객유형            */
           EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
           BUSL_NO,                   /*사업자번호          */
           ACERT_ID,                  /*인증요청자          */
           CUST_NO,                   /*고객번호            */
           CUST_NM,                   /*고객명              */
           ACERT_CHK,                 /*계좌확인상태        */
           ACERT_ERRCD,               /*인증결과코드        */
           ACERT_DESC,                /*인증결과메시지      */
           OWNER_NM,                  /*예금주              */
           CHKCNT,                    /*조회수              */
           REG_ID,                    /*등록자 ID           */
           REG_DT,                    /*등록일              */
           CHG_ID,                    /*변경자 ID           */
           CHG_DT                     /*변경일              */
    FROM (
            SELECT  A.ACERT_DAY,                 /*계좌인증 일자       */
                    A.ACERT_SEQ,                 /*계좌인증 순번       */
                    A.BANK_CD,                   /*은행코드            */
                    A.ACCT_NO,                   /*계좌번호            */
                    A.CUST_TP,                   /*고객유형            */
                    A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
                    A.BUSL_NO,                   /*사업자번호          */
                    A.ACERT_ID,                  /*인증요청자          */
                    A.CUST_NO,                   /*고객번호            */
                    A.CUST_NM,                   /*고객명              */
                    A.ACERT_CHK,                 /*계좌확인상태        */
                    A.ACERT_ERRCD,               /*인증결과코드        */
                    A.ACERT_DESC,                /*인증결과메시지      */
                    A.OWNER_NM,                  /*예금주              */
                    A.CHKCNT,                    /*조회수              */
                    A.REG_ID,                    /*등록자 ID           */
                    A.REG_DT,                    /*등록일              */
                    A.CHG_ID,                    /*변경자 ID           */
                    A.CHG_DT                     /*변경일              */
            FROM    RTRE0012 A
            WHERE   1=1
            --AND     A.ACERT_DAY        = DECODE(v_Acert_Day      , NULL, A.ACERT_DAY       , v_Acert_Day)
            AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
            AND     A.ACERT_ERRCD      = '0000'
            ORDER BY A.ACERT_SEQ DESC
        )
    WHERE ROWNUM = 1;

  END p_sRtre0012TodayCmsInfos;
  
END Pkg_Rtre0012;
/
