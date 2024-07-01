CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0022 AS
/*******************************************************************************
   NAME      Pkg_Rtre0022
   PURPOSE   카드인증 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-21  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 카드인증 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0022Count(
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,        /*카드인증일자        */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE         /*카드인증순번        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0022
    WHERE   CCERT_DAY = v_Ccert_Day
    AND     CCERT_SEQ = v_Ccert_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0022Count;

  /*****************************************************************************
  -- 카드인증 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0022 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*카드인증순번          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*예금주                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*사업자번호            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*고객명                */
    v_Mob_No         IN RTRE0022.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Email_Addr     IN RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CCERT_DAY,                 /*카드인증일자        */
            A.CCERT_SEQ,                 /*카드인증순번        */
            A.CARD_NO,                   /*카드번호            */
            A.EXPIRE_YM,                 /*유효기간            */
            A.OWNER_NM,                  /*예금주              */
            A.CUST_TP,                   /*고객유형            */
            A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
            A.BUSL_NO,                   /*사업자번호          */
            A.CCERT_ID,                  /*인증요청자          */
            A.CUST_NO,                   /*고객번호            */
            A.CUST_NM,                   /*고객명              */
            A.MOB_NO,                    /*휴대폰번호          */
            A.EMAIL_ADDR,                /*E-Mail주소          */
            A.BKEY_CHK,                  /*카드확인상태        */
            A.CARDCOM_CD,                /*카드사코드          */
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0022 A
    WHERE   A.CCERT_DAY  = DECODE(v_Ccert_Day , NULL, A.CCERT_DAY , v_Ccert_Day)
    AND     A.CCERT_SEQ  = DECODE(v_Ccert_Seq , NULL, A.CCERT_SEQ , v_Ccert_Seq)
    AND     A.CARD_NO    = DECODE(v_Card_No   , NULL, A.CARD_NO   , v_Card_No)
    AND     A.EXPIRE_YM  = DECODE(v_Expire_Ym , NULL, A.EXPIRE_YM , v_Expire_Ym)
    AND     A.OWNER_NM   = DECODE(v_Owner_Nm  , NULL, A.OWNER_NM  , v_Owner_Nm)
    AND     A.CUST_TP    = DECODE(v_Cust_Tp   , NULL, A.CUST_TP   , v_Cust_Tp)
    AND     A.EBIR_DAY   = DECODE(v_Ebir_Day  , NULL, A.EBIR_DAY  , v_Ebir_Day)
    AND     A.BUSL_NO    = DECODE(v_Busl_No   , NULL, A.BUSL_NO   , v_Busl_No)
    AND     A.CCERT_ID   = DECODE(v_Ccert_Id  , NULL, A.CCERT_ID  , v_Ccert_Id)
    AND     A.CUST_NO    = DECODE(v_Cust_No   , NULL, A.CUST_NO   , v_Cust_No)
    AND     A.CUST_NM    = DECODE(v_Cust_Nm   , NULL, A.CUST_NM   , v_Cust_Nm)
    AND     A.MOB_NO     = DECODE(v_Mob_No    , NULL, A.MOB_NO    , v_Mob_No)
    AND     A.EMAIL_ADDR = DECODE(v_Email_Addr, NULL, A.EMAIL_ADDR, v_Email_Addr)
    AND     A.BKEY_CHK   = DECODE(v_Bkey_Chk  , NULL, A.BKEY_CHK  , v_Bkey_Chk)
    AND     A.CARDCOM_CD = DECODE(v_Cardcom_Cd, NULL, A.CARDCOM_CD, v_Cardcom_Cd)
    AND     A.BATCH_KEY  = DECODE(v_Batch_Key , NULL, A.BATCH_KEY , v_Batch_Key)
    AND     A.REG_ID     = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtre0022;

  /*****************************************************************************
  -- 카드인증 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0022 (
    v_Ccert_Day      IN OUT RTRE0022.CCERT_DAY%TYPE,  /*카드인증일자          */
    v_Ccert_Seq      IN OUT RTRE0022.CCERT_SEQ%TYPE,  /*카드인증순번          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*예금주                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*사업자번호            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*고객명                */
    v_Mob_No         IN OUT RTRE0022.MOB_NO%TYPE,     /*휴대폰번호            */
    v_Email_Addr     IN OUT RTRE0022.EMAIL_ADDR%TYPE, /*E-Mail주소            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2,
    v_Return_Message OUT VARCHAR2
    ) RETURN NUMBER IS

    e_Error EXCEPTION;
  BEGIN

    IF TRIM(v_Card_No) IS NULL THEN
        v_Return_Message := '카드번호('||v_Card_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        
    
    IF TRIM(v_Expire_Ym) IS NULL THEN
        v_Return_Message := '유효기간('||v_Expire_Ym||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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
    
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_Nm) IS NULL THEN
        v_Return_Message := '고객명('||v_Cust_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    
    IF (TRIM(v_Cardcom_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R002', v_Cardcom_Cd)) THEN
        v_Return_Message := '카드사코드('||v_Cardcom_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Bkey_Chk) IS NULL) OR (TRIM(v_Bkey_Chk) NOT IN ('Y','N')) THEN
        v_Return_Message := '카드확인상태('||v_Bkey_Chk||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
                     
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;      
     
  
    v_Ccert_Day := to_char(sysdate, 'YYYYMMDD');
    v_Ccert_Seq := f_sRtre0022CcertSeq();
    
    BEGIN
    
        SELECT  MOB_NO, EMAIL_ADDR 
        INTO    v_Mob_No, v_Email_Addr
        FROM    RTSD0100 where CUST_NO = v_Cust_No;
        
    END;

    INSERT  INTO RTRE0022 (
            CCERT_DAY,
            CCERT_SEQ,
            CARD_NO,
            EXPIRE_YM,
            OWNER_NM,
            CUST_TP,
            EBIR_DAY,
            BUSL_NO,
            CCERT_ID,
            CUST_NO,
            CUST_NM,
            MOB_NO,
            EMAIL_ADDR,
            BKEY_CHK,
            CARDCOM_CD,
            BATCH_KEY,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ccert_Day,
            v_Ccert_Seq,
            v_Card_No,
            v_Expire_Ym,
            v_Owner_Nm,
            v_Cust_Tp,
            v_Ebir_Day,
            v_Busl_No,
            v_Ccert_Id,
            v_Cust_No,
            v_Cust_Nm,
            v_Mob_No,
            v_Email_Addr,
            v_Bkey_Chk,
            v_Cardcom_Cd,
            v_Batch_Key,
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

  END f_InsertRtre0022;

  /*****************************************************************************
  -- 카드인증 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0022 (
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*카드인증순번          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*예금주                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*사업자번호            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*고객명                */
    v_Mob_No         IN RTRE0022.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Email_Addr     IN RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*등록자 ID             */
    v_Res_Cd         IN RTRE0022.RES_CD%TYPE,         /* 응답코드*/
    v_Res_Msg        IN RTRE0022.RES_MSG%TYPE,        /* 응답메시지*/
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0022
    SET    BKEY_CHK         = v_Bkey_Chk,
           CARDCOM_CD       = v_Cardcom_Cd,
           BATCH_KEY        = v_Batch_Key,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE ,
           RES_CD           = v_Res_Cd,
           RES_MSG          = v_Res_Msg
    WHERE  CCERT_DAY        = v_Ccert_Day
    AND    CCERT_SEQ        = v_Ccert_Seq;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0022;

  /*****************************************************************************
  -- 카드인증 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0022 (
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*카드인증순번          */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0022
    WHERE  CCERT_DAY        = v_Ccert_Day
    AND    CCERT_SEQ        = v_Ccert_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.f_DeleteRtre0022(2)', '카드인증일자', v_Ccert_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.f_DeleteRtre0022(2)', '카드인증순번', v_Ccert_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.f_DeleteRtre0022(2)', '등록자 ID ', v_Reg_Id);        
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0022;

  /*****************************************************************************
  -- 카드인증 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0022 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ccert_Day      IN OUT RTRE0022.CCERT_DAY%TYPE,  /*카드인증일자          */
    v_Ccert_Seq      IN OUT RTRE0022.CCERT_SEQ%TYPE,  /*카드인증순번          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*카드번호              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*유효기간              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*예금주                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*고객유형              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*법정생년월일(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*사업자번호            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*인증요청자            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*고객명                */
    v_Mob_No         IN OUT RTRE0022.MOB_NO%TYPE,     /*휴대폰번호            */
    v_Email_Addr     IN OUT RTRE0022.EMAIL_ADDR%TYPE, /*E-Mail주소            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*카드확인상태          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*등록자 ID             */
    v_Res_Cd         IN RTRE0022.RES_CD%TYPE,         /* 응답코드*/
    v_Res_Msg        IN RTRE0022.RES_MSG%TYPE,        /* 응답메시지*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN


    IF 0 = f_sRtre0022Count(v_Ccert_Day, v_Ccert_Seq) THEN

        IF 0 != f_InsertRtre0022(v_Ccert_Day, v_Ccert_Seq, v_Card_No, v_Expire_Ym, 
                                 v_Owner_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No, 
                                 v_Ccert_Id, v_Cust_No, v_Cust_Nm, v_Mob_No, 
                                 v_Email_Addr, v_Bkey_Chk, v_Cardcom_Cd, v_Batch_Key, 
                                 v_Reg_Id, v_ErrorText, v_Return_Message) THEN
            v_Return_Message := v_Return_Message;
                v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0022(v_Ccert_Day, v_Ccert_Seq, v_Card_No, v_Expire_Ym, 
                                     v_Owner_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No, 
                                     v_Ccert_Id, v_Cust_No, v_Cust_Nm, v_Mob_No, 
                                     v_Email_Addr, v_Bkey_Chk, v_Cardcom_Cd, v_Batch_Key, 
                                     v_Reg_Id, v_Res_Cd, v_Res_Msg, v_ErrorText) THEN
                v_Return_Message := '카드인증 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0022(v_Ccert_Day, v_Ccert_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '카드인증 내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.p_IUDRtre0022(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.p_IUDRtre0022(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0022;


  /*****************************************************************************
  --  카드인증 내역 - 카드인증 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0022CcertSeq RETURN NUMBER IS
    
    v_Ccert_Seq   RTRE0022.CCERT_SEQ%TYPE DEFAULT 0;   /*카드인증순번          */
  BEGIN

    SELECT  SEQ_RTRE0022CCERT_SEQ.NEXTVAL CCERT_SEQ
    INTO    v_Ccert_Seq
    FROM    DUAL;

    RETURN v_Ccert_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0022CcertSeq;
  
  
  /*****************************************************************************
  --  카드인증 내역  - 특정일 카드 인증 성공 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0022CcertChkSeq(
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*카드인증일자          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE         /*카드번호              */
    ) RETURN NUMBER IS
    
    v_Ccert_Seq RTRE0022.CCERT_SEQ%TYPE DEFAULT NULL; /*카드인증순번          */
  BEGIN

    SELECT  CCERT_SEQ
    INTO    v_Ccert_Seq
    FROM    RTRE0022
    WHERE   CCERT_DAY  = v_Ccert_Day
    AND     CARDCOM_CD = v_Cardcom_Cd
    AND     CARD_NO    = v_Card_No
    AND     BKEY_CHK   = 'Y'  /*카드확인상태(Y,N) */
    AND     ROWNUM     = 1;
    
    RETURN v_Ccert_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0022CcertChkSeq;


END Pkg_Rtre0022;
/
