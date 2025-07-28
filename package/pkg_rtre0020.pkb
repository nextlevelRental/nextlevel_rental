CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0020 AS
/*******************************************************************************
   NAME      Pkg_Rtre0020
   PURPOSE   고객 카드 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
   1.1        2017-05-04  wjim             [20170504_01] 카드순번 획득 보완
   1.2        2017-05-18  wjim             [20170518_01] 카드순번 획득 보완         
*******************************************************************************/

  /*****************************************************************************
  -- 고객 카드 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtre0020Count(
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE           /*카드순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0020
    WHERE   CRD_SEQ = v_Crd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0020Count;


  /*****************************************************************************
  -- 고객 카드 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0020 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Str_Day        IN RTRE0020.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE0020.END_DAY%TYPE,        /*종료일자              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CRD_SEQ,                   /*카드순번            */
            A.CUST_NO,                   /*고객번호            */
            A.STR_DAY,                   /*시작일자            */
            A.END_DAY,                   /*종료일자            */
            A.CUST_NM,                   /*고객명              */
            A.CUST_TP,                   /*고객유형            */
            A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
            A.BUSL_NO,                   /*사업자번호          */
            A.CARDCOM_CD,                /*카드사코드          */
            A.CARD_NO,                   /*카드번호            */
            A.EXPIRE_YM,                 /*유효기간            */
            A.BKEY_CHK,                  /*카드확인상태        */
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.ACNC_ID,                   /*해지사용자          */
            A.ACNC_DESC,                 /*해지사유            */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0020 A
    WHERE   A.CRD_SEQ    = DECODE(v_Crd_Seq    , NULL, A.CRD_SEQ    , v_Crd_Seq)
    AND     A.CUST_NO    = DECODE(v_Cust_No    , NULL, A.CUST_NO    , v_Cust_No)
    AND     A.STR_DAY    = DECODE(v_Str_Day    , NULL, A.STR_DAY    , v_Str_Day)
    AND     A.END_DAY    = DECODE(v_End_Day    , NULL, A.END_DAY    , v_End_Day)
    AND     A.CUST_NM    = DECODE(v_Cust_Nm    , NULL, A.CUST_NM    , v_Cust_Nm)
    AND     A.CUST_TP    = DECODE(v_Cust_Tp    , NULL, A.CUST_TP    , v_Cust_Tp)
    AND     A.EBIR_DAY   = DECODE(v_Ebir_Day   , NULL, A.EBIR_DAY   , v_Ebir_Day)
    AND     A.BUSL_NO    = DECODE(v_Busl_No    , NULL, A.BUSL_NO    , v_Busl_No)
    AND     A.CARDCOM_CD = DECODE(v_Cardcom_Cd , NULL, A.CARDCOM_CD , v_Cardcom_Cd)
    AND     A.CARD_NO    = DECODE(v_Card_No    , NULL, A.CARD_NO    , v_Card_No)
    AND     A.EXPIRE_YM  = DECODE(v_Expire_Ym  , NULL, A.EXPIRE_YM  , v_Expire_Ym)
    AND     A.BKEY_CHK   = DECODE(v_Bkey_Chk   , NULL, A.BKEY_CHK   , v_Bkey_Chk)
    AND     A.BATCH_KEY  = DECODE(v_Batch_Key  , NULL, A.BATCH_KEY  , v_Batch_Key)
    AND     A.ACNC_ID    = DECODE(v_Acnc_Id    , NULL, A.ACNC_ID    , v_Acnc_Id)
    AND     A.ACNC_DESC  = DECODE(v_Acnc_Desc  , NULL, A.ACNC_DESC  , v_Acnc_Desc)
    AND     A.USE_YN     = DECODE(v_Use_Yn     , NULL, A.USE_YN     , v_Use_Yn)
    AND     A.REG_ID     = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtre0020;

  /*****************************************************************************
  -- 고객 카드 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0020 (
            CRD_SEQ,
            CUST_NO,
            STR_DAY,
            END_DAY,
            CUST_NM,
            CUST_TP,
            EBIR_DAY,
            BUSL_NO,
            CARDCOM_CD,
            CARD_NO,
            EXPIRE_YM,
            BKEY_CHK,
            BATCH_KEY,
            ACNC_ID,
            ACNC_DESC,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Crd_Seq,
            v_Cust_No,
            TO_CHAR(SYSDATE, 'YYYYMMDD'),
            '99991231',
            v_Cust_Nm,
            v_Cust_Tp,
            v_Ebir_Day,
            v_Busl_No,
            v_Cardcom_Cd,
            v_Card_No,
            v_Expire_Ym,
            v_Bkey_Chk,
            v_Batch_Key,
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

  END f_InsertRtre0020;

  /*****************************************************************************
  -- 고객 카드 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0020
    SET    CUST_NO    = v_Cust_No,
           END_DAY    = DECODE(v_Use_Yn,'N','99991231',END_DAY),
           CUST_NM    = v_Cust_Nm,
           CUST_TP    = v_Cust_Tp,
           EBIR_DAY   = v_Ebir_Day,
           BUSL_NO    = v_Busl_No,
           CARDCOM_CD = v_Cardcom_Cd,
           CARD_NO    = v_Card_No,
           EXPIRE_YM  = v_Expire_Ym,
           BKEY_CHK   = v_Bkey_Chk,
           BATCH_KEY  = v_Batch_Key,
           ACNC_ID    = v_Acnc_Id,
           ACNC_DESC  = v_Acnc_Desc,
           USE_YN     = v_Use_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  CRD_SEQ    = v_Crd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0020;

  /*****************************************************************************
  -- 고객 카드 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0020
    SET    ACNC_ID   = v_Acnc_Id,
           ACNC_DESC = v_Acnc_Desc,
           END_DAY   = TO_CHAR(SYSDATE,'YYYYMMDD'),
           USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  CRD_SEQ   = v_Crd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0020;

  /*****************************************************************************
  -- 고객 카드 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0020 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Crd_Seq        IN OUT RTRE0020.CRD_SEQ%TYPE,    /*카드순번              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*고객명                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*해지사용자            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*해지사유              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Crd_Seqo  RTRE0020.CRD_SEQ%TYPE DEFAULT NULL;   /*카드순번              */

  BEGIN

    -- 필수값: 고객번호 , 고객명 ,고객유형 ,법정생년월일(YYMMDD) ,사업자번호 ,카드사코드 ,카드번호 ,유효기간 ,카드확인상태 , 사용여부 ,등록자 ID
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm) IS NULL THEN
        v_Return_Message := '고객명('||v_Cust_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Cust_Tp)) THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cardcom_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R002', v_Cardcom_Cd)) THEN
        v_Return_Message := '카드사코드('||v_Cardcom_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Card_No) IS NULL THEN
        v_Return_Message := '카드번호('||v_Card_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Expire_Ym) IS NULL THEN
        v_Return_Message := '유효기간('||v_Expire_Ym||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Expire_Ym) < TO_CHAR(SYSDATE,'YYYYMM') THEN
        v_Return_Message := '('||v_Expire_Ym||') 입력할 수 없는 유효기간으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Bkey_Chk) IS NULL) OR (TRIM(v_Bkey_Chk) NOT IN ('Y','N')) THEN
        v_Return_Message := '카드확인상태('||v_Bkey_Chk||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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

        IF 0 != f_sRtre0020Count(v_Crd_Seq) THEN
            v_Return_Message := '해당 고객카드순번('||v_Reg_Id||')은 이미 등록된 데이터이므로 신규등록이 불가합니다!';
            RAISE e_Error;
        END IF;

        -- 신규 등록인데, 동일 카드사/카드번호 존재하면, 에러처리
        IF Pkg_Rtre0020.f_sRtre0020CrdSeq(v_Cust_No, v_Cardcom_Cd, v_Card_No, v_Expire_Ym) IS NOT NULL THEN

            SELECT CRD_SEQ  INTO v_Crd_Seqo
            FROM RTRE0020
            WHERE CUST_NO    = v_Cust_No
            AND   CARDCOM_CD = v_Cardcom_Cd
            AND   CARD_NO    = v_Card_No
            AND   EXPIRE_YM  = v_Expire_Ym
            AND   DECODE( CUST_TP, '01', EBIR_DAY, BUSL_NO ) = DECODE( v_Cust_Tp, '01', v_Ebir_Day, v_Busl_No );

            IF (TRIM(v_Crd_Seqo) IS NULL) THEN

                v_Return_Message := '카드사코드('||v_Cardcom_Cd||') 카드번호('||v_Card_No||')로 등록된 데이터가 존재합니다.확인 후 등록하시길 바랍니다!';
                RAISE e_Error;
            END IF;
        END IF;


        IF (TRIM(v_Crd_Seqo) IS NULL) THEN
            v_Crd_Seq := f_sRtre0020Seq(v_Cust_No);

            IF 0 != f_InsertRtre0020(v_Crd_Seq, v_Cust_No,
                                     v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                     v_Cardcom_Cd, v_Card_No, v_Expire_Ym, v_Bkey_Chk, v_Batch_Key,
                                     v_Acnc_Id, v_Acnc_Desc, v_Use_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '고객 카드 정보 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;
        ELSE
            v_Crd_Seq := v_Crd_Seqo;
        END IF;

    ELSE

        IF 0 = f_sRtre0020Count(v_Crd_Seq) THEN
            v_Return_Message := '해당 고객카드순번('||v_Reg_Id||')은 등록된 데이터가 아니므로 수정/삭제가 불가합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0020(v_Crd_Seq, v_Cust_No,
                                     v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                     v_Cardcom_Cd, v_Card_No, v_Expire_Ym, v_Bkey_Chk, v_Batch_Key,
                                     v_Acnc_Id, v_Acnc_Desc, v_Use_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '고객 카드 정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            -- 필수값: 해지사용자, 해지사유
            IF (TRIM(v_Acnc_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Acnc_Id)) THEN
                v_Return_Message := '해지사용자('||v_Acnc_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF TRIM(v_Acnc_Desc) IS NULL THEN
                v_Return_Message := '해지사유('||v_Acnc_Desc||') : 필수 입력값 누락으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF 0 != f_DeleteRtre0020(v_Crd_Seq, v_Acnc_Id, v_Acnc_Desc, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '고객 카드 정보 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtre0021.f_InsertRtre0021(v_Crd_Seq, v_ErrorText) THEN
        v_Return_Message := '이력 등록 실패!!!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0020.p_IUDRtre0020(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0020.p_IUDRtre0020(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0020;

  /*****************************************************************************
  -- 고객 카드 정보 - 고객번호/카드사코드/ 카드번호기준/유효기간 존재여부 체크
  *****************************************************************************/
  FUNCTION f_sRtre0020CrdSeq(
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE       /*유효기간              */
    ) RETURN VARCHAR IS
    v_Crd_Seq   RTRE0020.CRD_SEQ%TYPE DEFAULT NULL;   /*카드순번              */
  BEGIN

    SELECT  CRD_SEQ
    INTO    v_Crd_Seq
    FROM    RTRE0020
    WHERE   CUST_NO    = v_Cust_No
    AND     CARDCOM_CD = v_Cardcom_Cd
    AND     CARD_NO    = v_Card_No
    AND     EXPIRE_YM  = v_Expire_Ym;

    RETURN v_Crd_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0020CrdSeq;

  /*****************************************************************************
  -- 고객 카드 정보 - 카드순번 획득
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-05-04  wjim             [20170504_01] 채번룰 보완
                                           - 고객번호가 10자리 미만(6자리)인 고객인 경우 고려
   1.2        2017-05-18  wjim             [20170518_01] 고객번호 123467 채번 오류 수정
                                           - 채번 10자리, 14자리 혼용 시 에러발생                                                                                      
  *****************************************************************************/
  FUNCTION f_sRtre0020Seq (
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE         /*고객번호              */
    ) RETURN VARCHAR IS

    v_Crd_Seq   RTRE0020.CRD_SEQ%TYPE DEFAULT NULL;   /*카드순번            */
  BEGIN

    -- 카드순번 : C + 고객번호 + SEQ(3)
    SELECT  'C'||LPAD('0',10-LENGTH(v_Cust_No),'0')||v_Cust_No||LPAD(NVL((SELECT  /*+ INDEX_DESC ( RTRE0020 RTRE0020_PK ) */
                                              SUBSTR(CRD_SEQ,LENGTH(CRD_SEQ)-2,3)
                                      FROM    RTRE0020
                                      WHERE   CUST_NO = v_Cust_No
                                      AND     LENGTH(CRD_SEQ) = 14 --[20170518_01]
                                      AND     ROWNUM <= 1) +1, 1),3,'0')
    INTO    v_Crd_Seq
    FROM    DUAL;
    
--    --[20170504_01]이전
--    SELECT  'C'||v_Cust_No||LPAD(NVL((SELECT  /*+ INDEX_DESC ( RTRE0020 RTRE0020_PK ) */
--                                              SUBSTR(CRD_SEQ,12,3)
--                                      FROM    RTRE0020
--                                      WHERE   CUST_NO = v_Cust_No
--                                      AND     ROWNUM <= 1) +1, 1),3,'0')
--    INTO    v_Crd_Seq
--    FROM    DUAL;

    RETURN v_Crd_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0020Seq;

  /*****************************************************************************
  -- 고객 카드 정보 Select - 고객번호 기준 카드 리스트
  *****************************************************************************/
  PROCEDURE p_sRtre0020CrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE         /*고객번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CRD_SEQ,                   /*카드순번            */
            A.CARDCOM_CD,                /*카드사코드          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002', A.CARDCOM_CD) CARDCOM_NM,    /*카드사명         */
            A.CARD_NO,                   /*카드번호            */
            A.EXPIRE_YM,                 /*유효기간            */
            A.CUST_NM,                   /*고객명              */
            A.CUST_TP,                   /*고객유형            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S024', A.CUST_TP) CUST_TP_NM,       /*고객유형         */
            A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
            A.BUSL_NO,                   /*사업자번호          */
            A.CUST_NO,                   /*고객번호            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CCUST_NM,                 /*고객명           */
            A.STR_DAY,                   /*시작일자            */
            A.END_DAY,                   /*종료일자            */
            A.BKEY_CHK,                  /*카드확인상태        */
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.ACNC_ID,                   /*해지사용자          */
            A.ACNC_DESC,                 /*해지사유            */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0020 A
    WHERE   A.CUST_NO = v_Cust_No
    ORDER   BY A.CRD_SEQ;


  END p_sRtre0020CrdList;

  /*****************************************************************************
  -- 고객 카드 정보 Select - 고객카드선택 팝업 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0020CrdPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE         /*카드순번              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CRD_SEQ,                   /*카드순번            */
            A.CUST_NO,                   /*고객번호            */
            A.CARDCOM_CD,                /*카드사코드          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002', A.CARDCOM_CD) CARDCOM_NM,    /*카드사명         */
            A.CARD_NO,                   /*카드번호            */
            A.EXPIRE_YM,                 /*유효기간            */
            A.CUST_NM,                   /*고객명              */
            A.CUST_TP,                   /*고객유형            */
            A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
            A.BUSL_NO,                   /*사업자번호          */
            A.BKEY_CHK,                  /*카드확인상태        */
            A.BATCH_KEY                  /*BATCH KEY           */
    FROM    RTRE0020 A
    WHERE   A.CUST_NO = v_Cust_No
    AND     (v_Crd_Seq        IS NULL OR A.CRD_SEQ =  v_Crd_Seq)
    AND     TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN A.STR_DAY AND  A.END_DAY
    AND     A.USE_YN = 'Y'
    ORDER   BY A.CRD_SEQ;

  END p_sRtre0020CrdPopup;

END Pkg_Rtre0020;