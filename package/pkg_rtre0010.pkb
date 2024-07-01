CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0010 AS
/*******************************************************************************
   NAME      Pkg_Rtre0010
   PURPOSE   고객 계좌 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
   1.1        2017-09-01  wjim             [20170901_01] 계좌순번 획득 보완                                        
*******************************************************************************/

  /*****************************************************************************
  -- 고객 계좌 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtre0010Count(
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE           /*계좌순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0010
    WHERE   ACC_SEQ = v_Acc_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0010Count;

  /*****************************************************************************
  -- 고객 계좌 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0010 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Str_Day        IN RTRE0010.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE0010.END_DAY%TYPE,        /*종료일자              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*사업자번호            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*계좌번호              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACC_SEQ,                   /*계좌순번            */
            A.CUST_NO,                   /*고객번호            */
            A.STR_DAY,                   /*시작일자            */
            A.END_DAY,                   /*종료일자            */
            A.CUST_NM,                   /*고객명              */
            A.CUST_TP,                   /*고객유형            */
            A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
            A.BUSL_NO,                   /*사업자번호          */
            A.BANK_CD,                   /*은행코드            */
            A.ACCT_NO,                   /*계좌번호            */
            A.ACC_CHK,                   /*계좌확인상태        */
            A.ACNC_ID,                   /*해지사용자          */
            A.ACNC_DESC,                 /*해지사유            */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0010 A
    WHERE   A.ACC_SEQ   = DECODE(v_Acc_Seq   , NULL, A.ACC_SEQ   , v_Acc_Seq)
    AND     A.CUST_NO   = DECODE(v_Cust_No   , NULL, A.CUST_NO   , v_Cust_No)
    AND     A.STR_DAY   = DECODE(v_Str_Day   , NULL, A.STR_DAY   , v_Str_Day)
    AND     A.END_DAY   = DECODE(v_End_Day   , NULL, A.END_DAY   , v_End_Day)
    AND     A.CUST_NM   = DECODE(v_Cust_Nm   , NULL, A.CUST_NM   , v_Cust_Nm)
    AND     A.CUST_TP   = DECODE(v_Cust_Tp   , NULL, A.CUST_TP   , v_Cust_Tp)
    AND     A.EBIR_DAY  = DECODE(v_Ebir_Day  , NULL, A.EBIR_DAY  , v_Ebir_Day)
    AND     A.BUSL_NO   = DECODE(v_Busl_No   , NULL, A.BUSL_NO   , v_Busl_No)
    AND     A.BANK_CD   = DECODE(v_Bank_Cd   , NULL, A.BANK_CD   , v_Bank_Cd)
    AND     A.ACCT_NO   = DECODE(v_Acct_No   , NULL, A.ACCT_NO   , v_Acct_No)
    AND     A.ACC_CHK   = DECODE(v_Acc_Chk   , NULL, A.ACC_CHK   , v_Acc_Chk)
    AND     A.ACNC_ID   = DECODE(v_Acnc_Id   , NULL, A.ACNC_ID   , v_Acnc_Id)
    AND     A.ACNC_DESC = DECODE(v_Acnc_Desc , NULL, A.ACNC_DESC , v_Acnc_Desc)
    AND     A.USE_YN    = DECODE(v_Use_Yn    , NULL, A.USE_YN    , v_Use_Yn)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtre0010;

  /*****************************************************************************
  -- 고객 계좌 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*사업자번호            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*계좌번호              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0010 (
            ACC_SEQ,
            CUST_NO,
            STR_DAY,
            END_DAY,
            CUST_NM,
            CUST_TP,
            EBIR_DAY,
            BUSL_NO,
            BANK_CD,
            ACCT_NO,
            ACC_CHK,
            ACNC_ID,
            ACNC_DESC,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Acc_Seq,
            v_Cust_No,
            TO_CHAR(SYSDATE, 'YYYYMMDD'),
            '99991231',
            v_Cust_Nm,
            v_Cust_Tp,
            v_Ebir_Day,
            v_Busl_No,
            v_Bank_Cd,
            v_Acct_No,
            v_Acc_Chk,
            v_Acnc_Id,
            v_Acnc_Desc,
            v_Use_Yn,
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

  END f_InsertRtre0010;

  /*****************************************************************************
  -- 고객 계좌 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*사업자번호            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*계좌번호              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0010
    SET    CUST_NO   = v_Cust_No,
           END_DAY   = DECODE(v_Use_Yn,'N','99991231',END_DAY),
           CUST_NM   = v_Cust_Nm,
           CUST_TP   = v_Cust_Tp,
           EBIR_DAY  = v_Ebir_Day,
           BUSL_NO   = v_Busl_No,
           BANK_CD   = v_Bank_Cd,
           ACCT_NO   = v_Acct_No,
           ACC_CHK   = v_Acc_Chk,
           ACNC_ID   = v_Acnc_Id,
           ACNC_DESC = v_Acnc_Desc,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACC_SEQ   = v_Acc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0010;

  /*****************************************************************************
  -- 고객 계좌 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0010
    SET    ACNC_ID   = v_Acnc_Id,
           ACNC_DESC = v_Acnc_Desc,
           END_DAY   = TO_CHAR(SYSDATE,'YYYYMMDD'),
           USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACC_SEQ   = v_Acc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0010;

  /*****************************************************************************
  -- 고객 계좌 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0010 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Acc_Seq        IN OUT RTRE0010.ACC_SEQ%TYPE,    /*계좌순번              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*사업자번호            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*계좌번호              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Acc_Seqo  RTRE0010.ACC_SEQ%TYPE DEFAULT NULL;   /*계좌순번              */

  BEGIN

    -- 필수값:은행코드 ,계좌번호 ,고객번호 ,고객명 ,고객유형 ,법정생년월일(YYMMDD) ,사업자번호, 계좌확인상태, 사용여부,  등록자 ID
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

    IF (TRIM(v_Acc_Chk) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R012', v_Acc_Chk)) THEN
        v_Return_Message := '계좌확인상태('||v_Acc_Chk||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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

    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtre0010Count(v_Acc_Seq) THEN
            v_Return_Message := '해당 고객계좌코드('||v_Acc_Seq||')로 이미 등록된 데이터가 있음으로 신규등록이 불가합니다.!';
            RAISE e_Error;
        END IF;

        -- 신규 등록인데, 동일 고객/은행/계좌가 존재하면, 에러처리
        IF 0 != Pkg_Rtre0010.f_sRtre0010CountAcctNo(v_Cust_No, v_Bank_Cd, v_Acct_No) THEN

            SELECT ACC_SEQ  INTO v_Acc_Seqo
            FROM RTRE0010
            WHERE CUST_NO = v_Cust_No
            AND   BANK_CD = v_Bank_Cd
            AND   ACCT_NO = v_Acct_No
            AND   DECODE( CUST_TP, '01', EBIR_DAY, BUSL_NO ) = DECODE( v_Cust_Tp, '01', v_Ebir_Day, v_Busl_No );

            IF (TRIM(v_Acc_Seqo) IS NULL) THEN

                v_Return_Message := '고객코드('||v_Cust_No||') 은행코드('||v_Bank_Cd||') 계좌번호('||v_Acct_No||')로 등록된 데이터가 존재합니다.확인 후 등록하시길 바랍니다!';
                RAISE e_Error;
            END IF;
        END IF;

        IF (TRIM(v_Acc_Seqo) IS NULL) THEN

            v_Acc_Seq := f_sRtre0010Seq(v_Cust_No);

            IF 0 != f_InsertRtre0010(v_Acc_Seq, v_Cust_No,
                                     v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                     v_Bank_Cd, v_Acct_No, v_Acc_Chk, v_Acnc_Id,
                                     v_Acnc_Desc, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := ' 고객 계좌 정보 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        ELSE
         v_Acc_Seq := v_Acc_Seqo;
        END IF;

    ELSE

        IF 0 = f_sRtre0010Count(v_Acc_Seq) THEN
            v_Return_Message := '해당 고객계좌코드('||v_Acc_Seq||')로 등록된 데이터가 없음으로 수정/삭제이 불가합니다.!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0010(v_Acc_Seq, v_Cust_No,
                                     v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                     v_Bank_Cd, v_Acct_No, v_Acc_Chk, v_Acnc_Id,
                                     v_Acnc_Desc, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := ' 고객 계좌 정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0010(v_Acc_Seq, v_Acnc_Id, v_Acnc_Desc, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := ' 고객 계좌 정보 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtre0011.f_InsertRtre0011(v_Acc_Seq, v_ErrorText) THEN
        v_Return_Message := '고객 계좌 정보 이력 등록 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0010.p_IUDRtre0010(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0010.p_IUDRtre0010(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0010;

  /*****************************************************************************
  -- 고객 계좌 정보 - 고객번호/은행코드/계좌번호 기준 계좌순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0010AcctNo(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*계좌번호              */
    ) RETURN VARCHAR IS

    v_Acc_Seq   RTRE0010.ACC_SEQ%TYPE DEFAULT NULL;   /*계좌순번              */
  BEGIN

    SELECT  ACC_SEQ
    INTO    v_Acc_Seq
    FROM    RTRE0010
    WHERE   CUST_NO = v_Cust_No
    AND     BANK_CD = v_Bank_Cd
    AND     ACCT_NO = v_Acct_No;

    RETURN v_Acc_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0010AcctNo;

  /*****************************************************************************
  -- 고객 계좌 정보 - 고객번호/은행코드/계좌번호 기준 사용여부 조회
  *****************************************************************************/
  FUNCTION f_sRtre0010UseYn(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*계좌번호              */
    ) RETURN VARCHAR IS

    v_Use_Yn    RTRE0010.USE_YN%TYPE DEFAULT NULL;    /*사용여부              */
  BEGIN

    SELECT  USE_YN
    INTO    v_Use_Yn
    FROM    RTRE0010
    WHERE   CUST_NO = v_Cust_No
    AND     BANK_CD = v_Bank_Cd
    AND     ACCT_NO = v_Acct_No;

    RETURN v_Use_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0010UseYn;

  /*****************************************************************************
  -- 고객 계좌 정보 - 고객번호/은행코드/계좌번호 기준 존재여부 체크
  *****************************************************************************/
  FUNCTION f_sRtre0010CountAcctNo(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*은행코드              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*계좌번호              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN


    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0010
    WHERE   CUST_NO = v_Cust_No
    AND     BANK_CD = v_Bank_Cd
    AND     ACCT_NO = v_Acct_No;

    RETURN v_curr_cunt;


    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0010CountAcctNo;

  /*****************************************************************************
  -- 고객 계좌 정보 - 계좌순번 획득
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-09-01  wjim             [20170901_01] 계좌순번 획득 보완
                                           - 고객번호가 14자리가 아닌 경우 대처
  *****************************************************************************/
  FUNCTION f_sRtre0010Seq (
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE         /*고객번호              */
    ) RETURN VARCHAR IS

    v_Acc_Seq   RTRE0010.ACC_SEQ%TYPE DEFAULT NULL;   /*계좌순번              */
  BEGIN

    -- 계좌순번 : A + 고객번호 + SEQ(3)    
    SELECT  'A'||LPAD('0',10-LENGTH(v_Cust_No),'0')||v_Cust_No||LPAD(NVL((SELECT  /*+ INDEX_DESC ( RTRE0010 RTRE0010_PK ) */
                                              SUBSTR(ACC_SEQ,LENGTH(ACC_SEQ)-2,3)
                                      FROM    RTRE0010
                                      WHERE   CUST_NO = v_Cust_No
                                      AND     LENGTH(ACC_SEQ) = 14
                                      AND     ROWNUM <= 1) +1, 1),3,'0')
    INTO    v_Acc_Seq
    FROM    DUAL;

--    --[20170901_01]이전
--    SELECT  'A'||v_Cust_No||LPAD(NVL((SELECT  /*+ INDEX_DESC ( RTRE0010 RTRE0010_PK ) */
--                                              SUBSTR(ACC_SEQ,12,3)
--                                      FROM    RTRE0010
--                                      WHERE   CUST_NO = v_Cust_No
--                                      AND     ROWNUM <= 1) +1, 1),3,'0')
--    INTO    v_Acc_Seq
--    FROM    DUAL;


    RETURN v_Acc_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0010Seq;


  /*****************************************************************************
  -- 고객 계좌 정보 Select - 고객번호 기준 계좌 리스트
  *****************************************************************************/
  PROCEDURE p_sRtre0010CustNoList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE         /*고객번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACC_SEQ,                   /*계좌순번            */
            A.CUST_NO,                   /*고객번호            */
            A.STR_DAY,                   /*시작일자            */
            A.END_DAY,                   /*종료일자            */
            A.CUST_NM,                   /*고객명(예금주명)    */
            A.CUST_TP,                   /*고객유형            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S024', A.CUST_TP) CUST_TP_NM, /*고객유형명     */
            A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
            A.BUSL_NO,                   /*사업자번호          */
            A.BANK_CD,                   /*은행코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001', A.BANK_CD) BANK_NM,    /*은행명         */
            A.ACCT_NO,                   /*계좌번호            */
            A.ACC_CHK,                   /*계좌확인상태        */
            A.ACNC_ID,                   /*해지사용자          */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.ACNC_ID) ACNC_NM,              /*해지사용자명   */
            A.ACNC_DESC,                 /*해지사유            */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0010 A
    WHERE   A.CUST_NO = v_Cust_No
    ORDER   BY A.ACC_SEQ;

  END p_sRtre0010CustNoList;

  /*****************************************************************************
  -- 고객 계좌 정보 Select - 고객계좌선택 팝업 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0010AccPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE         /*계좌순번              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACC_SEQ,                   /*계좌순번            */
            A.CUST_NO,                      /*고객번호            */
            A.BANK_CD,                   /*은행코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001', A.BANK_CD) BANK_NM,    /*은행명         */
            A.ACCT_NO,                   /*계좌번호            */
            A.CUST_NM,                   /*고객명              */
            A.CUST_TP,                   /*고객유형            */
            A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
            A.BUSL_NO,                   /*사업자번호          */
            ACC_CHK                         /*계좌확인상태        */
    FROM    RTRE0010 A
    WHERE   A.CUST_NO = v_Cust_No
    AND     TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN A.STR_DAY AND  A.END_DAY
    AND     (v_Acc_Seq      IS NULL OR A.ACC_SEQ =  v_Acc_Seq)
    AND     A.USE_YN = 'Y'
    ORDER   BY A.ACC_SEQ;

  END p_sRtre0010AccPopup;

  /*****************************************************************************
  -- 고객 계좌 정보 - 사용유무 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0010UseYn (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0010
    SET    USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACC_SEQ   = v_Acc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0010UseYn;

  /*****************************************************************************
  -- 고객 계좌 정보 Bank_Cd
  *****************************************************************************/
  FUNCTION f_sRtre0010BankCd(
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE           /*계좌순번            */
    ) RETURN VARCHAR2 IS

    v_Bank_Cd   RTRE0060.BANK_CD%TYPE DEFAULT NULL;     /*은행코드            */

  BEGIN

    SELECT  BANK_CD
    INTO    v_Bank_Cd
    FROM    RTRE0010
    WHERE   ACC_SEQ = v_Acc_Seq;

    RETURN v_Bank_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0010BankCd;


END Pkg_Rtre0010;
/
