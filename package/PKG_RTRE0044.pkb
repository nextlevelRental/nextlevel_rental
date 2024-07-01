CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0044 AS
/*******************************************************************************
   NAME      Pkg_Rtre0044
   PURPOSE   KCP 결제 대사 기초내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-29  jemcarry         1. Created this package body.
   1.1        2017-03-01  wjim             [20170301_01] 모바일 결제건 고객명이 없어 수정
*******************************************************************************/

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0044Count(
    v_Check_Day      IN RTRE0044.CHECK_DAY%TYPE,        /*체크일자            */
    v_Check_Set      IN RTRE0044.CHECK_SET%TYPE,        /*회차                */
    v_Cseq           IN RTRE0044.CSEQ%TYPE              /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0044
    WHERE   CHECK_DAY = v_Check_Day
    AND     CHECK_SET = v_Check_Set
    AND     CSEQ      = v_Cseq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0044Count;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0044 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Check_Day      IN RTRE0044.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0044.CHECK_SET%TYPE,      /*회차                  */
    v_Diff_Yn        IN RTRE0044.DIFF_YN%TYPE         /*차이여부              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CHECK_DAY,                 /*체크일자            */
            A.CHECK_SET,                 /*회차                */
            A.CSEQ,                      /*순번                */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NM,                   /*고객명              */
            A.RECP_PAY,                  /*결제방법            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R019', A.RECP_PAY )  RECP_PAY_NM, /*결제방법명 */
            A.BANK_NM,                   /*은행명              */
            A.CARDCOM_NM,                /*카드사명            */
            A.APP_AMT,                   /*거래금액            */
            A.ST_DESC,                   /*거래상태            */
            A.APP_DAY,                   /*승인일자            */
            A.CNC_DAY,                   /*취소일자            */
            A.PCNC_DAY,                  /*부분취소일자        */
            A.TNO,                       /*거래번호            */
            A.APP_DESC,                  /*거래구분            */
            A.CNC_AMT,                   /*취소금액            */
            A.CNCP_AMT,                  /*취소가능금액        */
            A.RECP_AMT,                  /*수납처리금액        */
            A.DIFF_YN,                   /*차이여부            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R049', A.DIFF_YN )  DIFF_YN_NM   /*차이여부명 */
    FROM    RTRE0044 A
    WHERE   A.CHECK_DAY = v_Check_Day
    AND     A.CHECK_SET = v_Check_Set
    AND     (v_Diff_Yn IS NULL OR A.DIFF_YN = v_Diff_Yn);

  END p_sRtre0044;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0044 (
    v_Check_Day      IN RTRE0044.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0044.CHECK_SET%TYPE,      /*회차                  */
    v_Cseq           IN RTRE0044.CSEQ%TYPE,           /*순번                  */
    v_Ord_No         IN RTRE0044.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTRE0044.CUST_NM%TYPE,        /*고객명                */
    v_Recp_Pay       IN RTRE0044.RECP_PAY%TYPE,       /*결제방법              */
    v_Bank_Nm        IN RTRE0044.BANK_NM%TYPE,        /*은행명                */
    v_Cardcom_Nm     IN RTRE0044.CARDCOM_NM%TYPE,     /*카드사명              */
    v_App_Amt        IN RTRE0044.APP_AMT%TYPE,        /*거래금액              */
    v_St_Desc        IN RTRE0044.ST_DESC%TYPE,        /*거래상태              */
    v_App_Day        IN RTRE0044.APP_DAY%TYPE,        /*승인일자              */
    v_Cnc_Day        IN RTRE0044.CNC_DAY%TYPE,        /*취소일자              */
    v_Pcnc_Day       IN RTRE0044.PCNC_DAY%TYPE,       /*부분취소일자          */
    v_Tno            IN RTRE0044.TNO%TYPE,            /*거래번호              */
    v_App_Desc       IN RTRE0044.APP_DESC%TYPE,       /*거래구분              */
    v_Cnc_Amt        IN RTRE0044.CNC_AMT%TYPE,        /*취소금액              */
    v_Cncp_Amt       IN RTRE0044.CNCP_AMT%TYPE,       /*취소가능금액          */
    v_Recp_Amt       IN RTRE0044.RECP_AMT%TYPE,       /*수납처리금액          */
    v_Diff_Yn        IN RTRE0044.DIFF_YN%TYPE,        /*차이여부              */
    v_Reg_Id         IN RTRE0044.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0044 (
            CHECK_DAY,
            CHECK_SET,
            CSEQ,
            ORD_NO,
            CUST_NM,
            RECP_PAY,
            BANK_NM,
            CARDCOM_NM,
            APP_AMT,
            ST_DESC,
            APP_DAY,
            CNC_DAY,
            PCNC_DAY,
            TNO,
            APP_DESC,
            CNC_AMT,
            CNCP_AMT,
            RECP_AMT,
            DIFF_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Check_Day,
            v_Check_Set,
            v_Cseq,
            v_Ord_No,
            v_Cust_Nm,
            v_Recp_Pay,
            v_Bank_Nm,
            v_Cardcom_Nm,
            v_App_Amt,
            v_St_Desc,
            v_App_Day,
            v_Cnc_Day,
            v_Pcnc_Day,
            v_Tno,
            v_App_Desc,
            v_Cnc_Amt,
            v_Cncp_Amt,
            v_Recp_Amt,
            v_Diff_Yn,
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

  END f_InsertRtre0044;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0044 (
    v_Check_Day      IN RTRE0044.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0044.CHECK_SET%TYPE,      /*회차                  */
    v_Cseq           IN RTRE0044.CSEQ%TYPE,           /*순번                  */
    v_Ord_No         IN RTRE0044.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTRE0044.CUST_NM%TYPE,        /*고객명                */
    v_Recp_Pay       IN RTRE0044.RECP_PAY%TYPE,       /*결제방법              */
    v_Bank_Nm        IN RTRE0044.BANK_NM%TYPE,        /*은행명                */
    v_Cardcom_Nm     IN RTRE0044.CARDCOM_NM%TYPE,     /*카드사명              */
    v_App_Amt        IN RTRE0044.APP_AMT%TYPE,        /*거래금액              */
    v_St_Desc        IN RTRE0044.ST_DESC%TYPE,        /*거래상태              */
    v_App_Day        IN RTRE0044.APP_DAY%TYPE,        /*승인일자              */
    v_Cnc_Day        IN RTRE0044.CNC_DAY%TYPE,        /*취소일자              */
    v_Pcnc_Day       IN RTRE0044.PCNC_DAY%TYPE,       /*부분취소일자          */
    v_Tno            IN RTRE0044.TNO%TYPE,            /*거래번호              */
    v_App_Desc       IN RTRE0044.APP_DESC%TYPE,       /*거래구분              */
    v_Cnc_Amt        IN RTRE0044.CNC_AMT%TYPE,        /*취소금액              */
    v_Cncp_Amt       IN RTRE0044.CNCP_AMT%TYPE,       /*취소가능금액          */
    v_Recp_Amt       IN RTRE0044.RECP_AMT%TYPE,       /*수납처리금액          */
    v_Diff_Yn        IN RTRE0044.DIFF_YN%TYPE,        /*차이여부              */
    v_Reg_Id         IN RTRE0044.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0044
    SET    ORD_NO           = v_Ord_No,
           CUST_NM          = v_Cust_Nm,
           RECP_PAY         = v_Recp_Pay,
           BANK_NM          = v_Bank_Nm,
           CARDCOM_NM       = v_Cardcom_Nm,
           APP_AMT          = v_App_Amt,
           ST_DESC          = v_St_Desc,
           APP_DAY          = v_App_Day,
           CNC_DAY          = v_Cnc_Day,
           PCNC_DAY         = v_Pcnc_Day,
           TNO              = v_Tno,
           APP_DESC         = v_App_Desc,
           CNC_AMT          = v_Cnc_Amt,
           CNCP_AMT         = v_Cncp_Amt,
           RECP_AMT         = v_Recp_Amt,
           DIFF_YN          = v_Diff_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  CHECK_DAY        = v_Check_Day
    AND    CHECK_SET        = v_Check_Set
    AND    CSEQ             = v_Cseq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0044;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0044 (
    v_Check_Day      IN RTRE0044.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0044.CHECK_SET%TYPE,      /*회차                  */
    v_Cseq           IN RTRE0044.CSEQ%TYPE,           /*순번                  */
    v_Reg_Id         IN RTRE0044.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0044
    WHERE  CHECK_DAY = v_Check_Day
    AND    CHECK_SET = v_Check_Set
    AND    CSEQ      = v_Cseq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0044.p_IUDRtre0044(2)', '체크일자', v_Check_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0044.p_IUDRtre0044(2)', '회차', v_Check_Set);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0044.p_IUDRtre0044(2)', '순번', v_Cseq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0044.p_IUDRtre0044(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0044;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 관리(IUD)
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-01  wjim             [20170301_01] 모바일 결제건 고객명이 없어 수정
  *****************************************************************************/
  PROCEDURE p_IUDRtre0044 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Dup_Gb         IN CHAR,                         /*중복구분(I,M)         */
    v_Check_Day      IN RTRE0044.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0044.CHECK_SET%TYPE,      /*회차                  */
    v_Cseq           IN OUT RTRE0044.CSEQ%TYPE,       /*순번                  */
    v_Ord_No         IN RTRE0044.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTRE0044.CUST_NM%TYPE,        /*고객명                */
    v_Recp_Pay       IN RTRE0044.RECP_PAY%TYPE,       /*결제방법              */
    v_Bank_Nm        IN RTRE0044.BANK_NM%TYPE,        /*은행명                */
    v_Cardcom_Nm     IN RTRE0044.CARDCOM_NM%TYPE,     /*카드사명              */
    v_App_Amt        IN RTRE0044.APP_AMT%TYPE,        /*거래금액              */
    v_St_Desc        IN RTRE0044.ST_DESC%TYPE,        /*거래상태              */
    v_App_Day        IN VARCHAR2,                     /*승인일자              */
    v_Cnc_Day        IN VARCHAR2,                     /*취소일자              */
    v_Pcnc_Day       IN VARCHAR2,                     /*부분취소일자          */
    v_Tno            IN RTRE0044.TNO%TYPE,            /*거래번호              */
    v_App_Desc       IN RTRE0044.APP_DESC%TYPE,       /*거래구분              */
    v_Cncp_Amt       IN RTRE0044.CNCP_AMT%TYPE,       /*취소가능금액          */
    v_Reg_Id         IN RTRE0044.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Recp_Amt  RTRE0044.RECP_AMT%TYPE DEFAULT NULL;  /*수납처리금액          */
    v_Diff_Yn   RTRE0044.DIFF_YN%TYPE DEFAULT NULL;   /*차이여부              */
    v_Cnc_Amt   RTRE0044.CNC_AMT%TYPE;                /*취소금액              */
    v_Dup_Skip  BOOLEAN DEFAULT FALSE;
  BEGIN

    -- 필수값:
    IF (TRIM(v_Dup_Gb) IS NULL) OR (TRIM(v_Dup_Gb) NOT IN ('I','M')) THEN
        v_Return_Message := '중복구분('||v_Dup_Gb||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Check_Day) THEN
        v_Return_Message := '체크일자('||v_Check_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Check_Day) != TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
        v_Return_Message := '체크일자('||v_Check_Day||')는 당일로만 처리가 가능합니다.!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Check_Set) IS NULL THEN
        v_Return_Message := '회차('||v_Check_Set||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn IN ('I','U') THEN

        IF TRIM(v_Ord_No) IS NULL THEN
            v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

-- [20170301_01] 에 의해 주석처리
--        IF TRIM(v_Cust_Nm) IS NULL THEN
--            v_Return_Message := '고객명('||v_Cust_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--            RAISE e_Error;
--        END IF;

        IF TRIM(v_Recp_Pay) IS NULL THEN
            v_Return_Message := '결제방법('||v_Recp_Pay||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_App_Amt) IS NULL THEN
            v_Return_Message := '거래금액('||v_App_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_App_Day) IS NULL THEN
            v_Return_Message := '승인일자('||v_App_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Tno) IS NULL THEN
            v_Return_Message := '거래번호('||v_Tno||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Cncp_Amt) IS NULL THEN
            v_Return_Message := '취소가능금액('||v_Cncp_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    IF NVL(v_Cncp_Amt,0) > NVL(v_App_Amt,0) THEN
        v_Return_Message := '취소가능금액('||v_Cncp_Amt||')이 거래금액('||v_App_Amt||')보다 크므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 취소금액 계산
    v_Cnc_Amt := NVL(v_App_Amt,0) - NVL(v_Cncp_Amt,0);

    IF v_Comm_Dvsn = 'I' THEN

      
            
        -- 중복허용(I), 중복구분(M)
        IF v_Dup_Gb = 'M' THEN

            -- 중복제거로 거래번호(TNO)를 기준으로 동일한 내역이 있으면 INSERT 제외.
            -- 단, 거래금액과 취소가능금액이 동일하지 않은 경우에는 처리불가
            -- 체크일자, 체크회차가 동일한 내역 중 TNO가 동일하고, 거래금액, 취소가능금액이 동일한 경우 SKIP
            IF 0 < f_sRtre0044TnoDupCheck(v_Check_Day, v_Check_Set, v_Tno) THEN

                IF 0 < f_sRtre0044TnoValueCheck(v_Check_Day, v_Check_Set, v_Tno, v_App_Amt, v_Cncp_Amt) THEN
                    v_Return_Message := '거래번호('||v_Tno||') 기준 동일 내역이 존재하나, 거래금액 또는 취소가능금액이 동일하지 않음으로 처리가 불가 합니다!';
                    RAISE e_Error;
                ELSE
                    v_Dup_Skip := TRUE;
                END IF;

            END IF;

        END IF;

        -- 중복 Skip이 아닐 경우에 신규 생성
        IF (v_Dup_Skip = FALSE) THEN


            -- 순번획득
            v_Cseq := f_sRtre0044Cseq(v_Check_Day, v_Check_Set);
            
            IF 0 != f_InsertRtre0044(v_Check_Day, v_Check_Set, v_Cseq, v_Ord_No,
                                     nvl(v_Cust_Nm,' '), v_Recp_Pay, v_Bank_Nm, v_Cardcom_Nm,
                                     v_App_Amt, v_St_Desc, TO_DATE(v_App_Day,'YYYY.MM.DD HH24:MI:SS'), TO_DATE(v_Cnc_Day,'YYYY.MM.DD HH24:MI:SS'),
                                     TO_DATE(v_Pcnc_Day,'YYYY.MM.DD'), v_Tno, v_App_Desc, v_Cnc_Amt,
                                     v_Cncp_Amt, v_Recp_Amt, v_Diff_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := 'KCP 결제 대사 기초내역 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            -- 중복 Skip Log 생성
            Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0044.p_IUDRtre0044(Dup Skip)', v_Comm_Dvsn || '-' || v_Dup_Gb || '-'
                                         || v_Check_Day || '-' || v_Check_Set || '-' || v_Cseq || '-' || v_Ord_No || '-'
                                         || v_Cust_Nm || '-' || v_Recp_Pay || '-' || v_Bank_Nm || '-' || v_Cardcom_Nm || '-'
                                         || v_App_Amt || '-' || v_St_Desc || '-' || v_App_Day || '-' || v_Cnc_Day || '-'
                                         || v_Pcnc_Day || '-' || v_Tno || '-' || v_App_Desc || '-' || v_Cnc_Amt || '-'
                                         || v_Cncp_Amt || '-' || v_Reg_Id);
        END IF;


    ELSE
        
        IF 0 = f_sRtre0044Count(v_Check_Day, v_Check_Set, v_Cseq) THEN
            v_Return_Message := '해당 KCP 결제 대사 기초내역('||v_Check_Day||'-'||v_Check_Set||'-'||v_Cseq||')으로 등록된 정보가 없어 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0044(v_Check_Day, v_Check_Set, v_Cseq, v_Ord_No,
                                     nvl(v_Cust_Nm,' '), v_Recp_Pay, v_Bank_Nm, v_Cardcom_Nm,
                                     v_App_Amt, v_St_Desc, TO_DATE(v_App_Day,'YYYY.MM.DD HH24:MI:SS'), TO_DATE(v_Cnc_Day,'YYYY.MM.DD HH24:MI:SS'),
                                     TO_DATE(v_Pcnc_Day,'YYYY.MM.DD'), v_Tno, v_App_Desc, v_Cnc_Amt,
                                     v_Cncp_Amt, v_Recp_Amt, v_Diff_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := 'KCP 결제 대사 기초내역 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0044(v_Check_Day, v_Check_Set, v_Cseq, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := 'KCP 결제 대사 기초내역 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;

    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0044.p_IUDRtre0044(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0044.p_IUDRtre0044(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0044;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0044Cseq(
    v_Check_Day      IN RTRE0044.CHECK_DAY%TYPE,        /*체크일자            */
    v_Check_Set      IN RTRE0044.CHECK_SET%TYPE         /*회차                */
    ) RETURN NUMBER IS
    v_Cseq  RTRE0044.CSEQ%TYPE;                         /*순번                */
  BEGIN


    SELECT  NVL((SELECT  MAX(CSEQ)
                 FROM    RTRE0044
                 WHERE   CHECK_DAY = v_Check_Day
                 AND     CHECK_SET = v_Check_Set)+ 1, 1) AS CSEQ
    INTO    v_Cseq
    FROM    DUAL;

    RETURN v_Cseq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0044Cseq;


  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Select - 회차 획득
  *****************************************************************************/
  PROCEDURE p_sRtre0044CheckSet (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Check_Day      IN RTRE0044.CHECK_DAY%TYPE       /*체크일자              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CHECK_SET,                  /*회차                */
            A.CHECK_SET||'회차' AS SET_NM /*회차명             */
    FROM    RTRE0044 A
    WHERE   A.CHECK_DAY = v_Check_Day
    GROUP   BY A.CHECK_SET
    ORDER   BY A.CHECK_SET;

  END p_sRtre0044CheckSet;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Count - TNO 기준 중복체크
  *****************************************************************************/
  FUNCTION f_sRtre0044TnoDupCheck(
    v_Check_Day      IN  RTRE0044.CHECK_DAY%TYPE,     /*체크일자              */
    v_Check_Set      IN  RTRE0044.CHECK_SET%TYPE,     /*회차                  */
    v_Tno            IN  RTRE0044.TNO%TYPE            /*거래번호              */
    ) RETURN NUMBER IS

    v_Dup_Cnt NUMBER; /*중복건수 */
  BEGIN

    SELECT  COUNT(*)
    INTO    v_Dup_Cnt
    FROM    RTRE0044
    WHERE   CHECK_DAY = v_Check_Day
    AND     CHECK_SET = v_Check_Set
    AND     TNO       = v_Tno;

    RETURN v_Dup_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;


  END f_sRtre0044TnoDupCheck;

  /*****************************************************************************
  -- KCP 결제 대사 기초내역 Count - TNO 기준 거래금액과 취소가능금액 체크
  *****************************************************************************/
  FUNCTION f_sRtre0044TnoValueCheck(
    v_Check_Day      IN  RTRE0044.CHECK_DAY%TYPE,     /*체크일자              */
    v_Check_Set      IN  RTRE0044.CHECK_SET%TYPE,     /*회차                  */
    v_Tno            IN  RTRE0044.TNO%TYPE,           /*거래번호              */
    v_App_Amt        IN  RTRE0044.APP_AMT%TYPE,       /*거래금액              */
    v_Cncp_Amt       IN  RTRE0044.CNCP_AMT%TYPE       /*취소가능금액          */
    ) RETURN NUMBER IS

    v_Dup_Cnt NUMBER;                      /*중복건수              */
  BEGIN

    SELECT  COUNT(*)
    INTO    v_Dup_Cnt
    FROM    RTRE0044
    WHERE   CHECK_DAY = v_Check_Day
    AND     CHECK_SET = v_Check_Set
    AND     TNO       = v_Tno
    AND     (NVL(APP_AMT,0) <> NVL(v_App_Amt,0) OR NVL(CNCP_AMT,0) <> NVL(v_Cncp_Amt,0));
    RETURN v_Dup_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0044TnoValueCheck;


  /*****************************************************************************
  -- KCP 결제 대사 기초내역 관리 - KCP 결제내역 체크
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0044Check (
    v_Check_Day      IN RTRE0044.CHECK_DAY%TYPE,      /*체크일자              */
    v_Check_Set      IN RTRE0044.CHECK_SET%TYPE,      /*회차                  */
    v_Job_Gb         IN CHAR,                         /*처리구분(N:신규O:기존)*/
    v_Reg_Id         IN RTRE0044.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Cnt NUMBER;
        
    e_Error EXCEPTION;
  BEGIN

    -- 필수값:
    IF (TRIM(v_Job_Gb) IS NULL) OR (TRIM(v_Job_Gb) NOT IN ('N','O')) THEN
        v_Return_Message := '처리구분('||v_Job_Gb||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Check_Day) THEN
        v_Return_Message := '체크일자('||v_Check_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Check_Set) IS NULL THEN
        v_Return_Message := '회차('||v_Check_Set||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 처리구분 : 'N' : RTRE0044.DIFF_YN 값이 NULL인 내역만 처리대상임.
    -- 처리구분 : 'O' : RTRE0044.DIFF_YN 값에 관계없이 체크일자, 체크회차에 대항하는 전체 내역이 처리 대상임
    -- TNO(거래번호)를 기준으로 RTRE0041 내역 SUM한 금액과 취소가능금액(CNCP_AMT) 와 비교하여 차이건을 확인한다.

            
    BEGIN
        
        FOR CUR IN (SELECT A.CUST_NO, A.ORD_NO, SUM(A.RECP_AMT) AS RECP_AMT, 'P7' AS RECP_PAY, A.RECV_DAY, B.TNO 
                    FROM RTRE0030 A, RTRE0200 B 
                    WHERE A.RECV_SEQ = B.RECV_SEQ
                    AND A.RECV_DAY BETWEEN SUBSTR(v_Check_Day, 1, 6) || '01' AND LAST_DAY(TO_DATE(SUBSTR(v_Check_Day, 1, 6) || '01', 'YYYYMMDD'))
                    AND B.RCRD_DAY BETWEEN SUBSTR(v_Check_Day, 1, 6) || '01' AND LAST_DAY(TO_DATE(SUBSTR(v_Check_Day, 1, 6) || '01', 'YYYYMMDD'))
                    AND A.RECP_PAY = 'P7'
                    AND A.CNC_STAT = 'N'
                    GROUP BY A.CUST_NO, A.ORD_NO, A.RECV_DAY, B.TNO) LOOP
                 
                    SELECT COUNT(*) 
                        INTO v_Cnt 
                        FROM RTRE0044 
                        WHERE CHECK_DAY = v_Check_Day 
                        AND CHECK_SET = v_Check_Set 
                        AND TNO = CUR.TNO;
            
            IF v_Cnt > 0 THEN
                    UPDATE RTRE0044 
                    SET RECP_AMT = CUR.RECP_AMT
                      , DIFF_YN = 'N' 
                    WHERE CHECK_DAY = v_Check_Day 
                    AND CHECK_SET = v_Check_Set 
                    AND TNO = CUR.TNO;   
            ELSE
                INSERT INTO RTRE0044
                SELECT v_Check_Day
                     , v_Check_Set
                     , (SELECT MAX(CSEQ) + 1 FROM RTRE0044 WHERE CHECK_DAY = v_Check_Day AND CHECK_SET = v_Check_Set)
                     , CUR.ORD_NO
                     , (SELECT CUST_NM FROM RTSD0100 WHERE CUST_NO = CUR.CUST_NO)
                     , 'P7'
                     , ''
                     , ''
                     , '0'
                     , ''
                     , v_Check_Day
                     , ''
                     , ''
                     , CUR.TNO
                     , ''
                     , ''
                     , '0'
                     , CUR.RECP_AMT
                     , 'Y'
                     , v_Reg_Id
                     , SYSDATE
                     , v_Reg_Id
                     , SYSDATE 
                     FROM DUAL;
            END IF;           
                            
        END LOOP;
        
    END;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0044.p_UpdateRtre0044Check(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0044.p_UpdateRtre0044Check(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0044Check;

END Pkg_Rtre0044;
/