CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0035 AS
/*******************************************************************************
   NAME      Pkg_Rtre0035
   PURPOSE   선수금 발생내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-31  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 선수금 발생내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0035Count(
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0035
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     RITM_SEQ = v_Ritm_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0035Count;

  /*****************************************************************************
  -- 선수금 발생내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0035 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0035.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0035.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0035.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0035.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0035.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.PND_DAY,                   /*선수 발생일자       */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.PND_AMT,                   /*선수 발생금액       */
            A.SBS_AMT,                   /*선수 정리금액       */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.PND_STAT,                  /*선수금상태          */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0035 A
    WHERE   A.RECV_SEQ = DECODE(v_Recv_Seq , NULL, A.RECV_SEQ , v_Recv_Seq)
    AND     A.RITM_SEQ = DECODE(v_Ritm_Seq , NULL, A.RITM_SEQ , v_Ritm_Seq)
    AND     A.PND_DAY  = DECODE(v_Pnd_Day  , NULL, A.PND_DAY  , v_Pnd_Day)
    AND     A.ORD_NO   = DECODE(v_Ord_No   , NULL, A.ORD_NO   , v_Ord_No)
    AND     A.CUST_NO  = DECODE(v_Cust_No  , NULL, A.CUST_NO  , v_Cust_No)
    AND     A.PND_AMT  = DECODE(v_Pnd_Amt  , NULL, A.PND_AMT  , v_Pnd_Amt)
    AND     A.SBS_AMT  = DECODE(v_Sbs_Amt  , NULL, A.SBS_AMT  , v_Sbs_Amt)
    AND     A.RECP_TP  = DECODE(v_Recp_Tp  , NULL, A.RECP_TP  , v_Recp_Tp)
    AND     A.RECP_PAY = DECODE(v_Recp_Pay , NULL, A.RECP_PAY , v_Recp_Pay)
    AND     A.RECP_FG  = DECODE(v_Recp_Fg  , NULL, A.RECP_FG  , v_Recp_Fg)
    AND     A.PND_STAT = DECODE(v_Pnd_Stat , NULL, A.PND_STAT , v_Pnd_Stat)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtre0035;

  /*****************************************************************************
  -- 선수금 발생내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0035 (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0035.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0035.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0035.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0035.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0035.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0035 (
            RECV_SEQ,
            RITM_SEQ,
            PND_DAY,
            ORD_NO,
            CUST_NO,
            PND_AMT,
            SBS_AMT,
            RECP_TP,
            RECP_PAY,
            RECP_FG,
            PND_STAT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Ritm_Seq,
            v_Pnd_Day,
            v_Ord_No,
            v_Cust_No,
            v_Pnd_Amt,
            v_Sbs_Amt,
            v_Recp_Tp,
            v_Recp_Pay,
            v_Recp_Fg,
            v_Pnd_Stat,
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

  END f_InsertRtre0035;

  /*****************************************************************************
  -- 선수금 발생내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0035 (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0035.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0035.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0035.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0035.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0035.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0035
    SET    PND_DAY  = v_Pnd_Day,
           ORD_NO   = v_Ord_No,
           CUST_NO  = v_Cust_No,
           PND_AMT  = v_Pnd_Amt,
           SBS_AMT  = v_Sbs_Amt,
           RECP_TP  = v_Recp_Tp,
           RECP_PAY = v_Recp_Pay,
           RECP_FG  = v_Recp_Fg,
           PND_STAT = v_Pnd_Stat,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RECV_SEQ = v_Recv_Seq
    AND    RITM_SEQ = v_Ritm_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0035;

  /*****************************************************************************
  -- 선수금 발생내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0035 (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0035
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     RITM_SEQ = v_Ritm_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.p_IUDRtre0035(1)', '수납거래번호', v_Recv_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.p_IUDRtre0035(1)', '거래일련번호', v_Ritm_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.p_IUDRtre0035(1)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0035;

  /*****************************************************************************
  -- 선수금 발생내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0035 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN OUT RTRE0035.RITM_SEQ%TYPE,   /*거래일련번호          */
    v_Pnd_Day        IN RTRE0035.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0035.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0035.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0035.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0035.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 수납거래번호 ,선수 발생일자 ,계약번호 ,고객번호 ,선수 발생금액 ,선수 정리금액 ,청구구분 ,수납방법 ,수납유형 ,선수금상태 ,등록자 ID
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 != ISDATE(v_Pnd_Day) THEN
        v_Return_Message := '선수 발생일자('||v_Pnd_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Pnd_Amt) IS NULL THEN
        v_Return_Message := '선수 발생금액('||v_Pnd_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Sbs_Amt) IS NULL THEN
        v_Return_Message := '선수 정리금액('||v_Sbs_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Recp_Tp) IS NULL THEN
        v_Return_Message := '청구구분('||v_Recp_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Recp_Pay) IS NULL THEN
        v_Return_Message := '수납방법('||v_Recp_Pay||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Recp_Fg) IS NULL THEN
        v_Return_Message := '수납유형('||v_Recp_Fg||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Pnd_Stat) IS NULL THEN
        v_Return_Message := '선수금상태('||v_Pnd_Stat||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtre0035Count(v_Recv_Seq, v_Ritm_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||'-'||v_Ritm_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;    
        
        v_Ritm_Seq := f_sRtre0035Ritm_Seq(v_Recv_Seq);
        
        IF 0 != f_InsertRtre0035(v_Recv_Seq, v_Ritm_Seq, v_Pnd_Day, v_Ord_No, 
                                 v_Cust_No, v_Pnd_Amt, v_Sbs_Amt, v_Recp_Tp, 
                                 v_Recp_Pay, v_Recp_Fg, v_Pnd_Stat, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := '선수금 발생내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0035Count(v_Recv_Seq, v_Ritm_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||'-'||v_Ritm_Seq||')으로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;    
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0035(v_Recv_Seq, v_Ritm_Seq, v_Pnd_Day, v_Ord_No, 
                                     v_Cust_No, v_Pnd_Amt, v_Sbs_Amt, v_Recp_Tp, 
                                     v_Recp_Pay, v_Recp_Fg, v_Pnd_Stat, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '선수금 발생내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0035(v_Recv_Seq, v_Ritm_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '선수금 발생내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.p_IUDRtre0035(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.p_IUDRtre0035(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0035;

  /*****************************************************************************
  -- 선수금 발생내역 - 거래일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0035Ritm_Seq(
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER IS
    v_Ritm_Seq  RTRE0031.RITM_SEQ%TYPE DEFAULT NULL;    /*거래일련번호        */
  BEGIN

    SELECT  NVL((SELECT  MAX(RITM_SEQ)
                 FROM    RTRE0035
                 WHERE   RECV_SEQ = v_Recv_Seq)+ 1, 1) AS RITM_SEQ
    INTO    v_Ritm_Seq
    FROM    DUAL;
    
    RETURN v_Ritm_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0035Ritm_Seq;  
  
  /*****************************************************************************
  -- 선수금 발생내역 - 계약번호/고객번호 기준 선수금 잔액(합산) 획득
  *****************************************************************************/
  FUNCTION f_sRtre0035BalanceAmt (
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE         /*고객번호              */
    ) RETURN NUMBER IS
    v_Balance_Amt   NUMBER DEFAULT 0;
  BEGIN

    -- 선수금 잔액(합산) : 선수 발생금액 -  선수 정리금액
    SELECT  SUM(NVL(PND_AMT,0) - NVL(SBS_AMT,0)) 
    INTO    v_Balance_Amt
    FROM    RTRE0035
    WHERE   ORD_NO   = v_Ord_No
    AND     CUST_NO  = DECODE(v_Cust_No, NULL, CUST_NO, v_Cust_No)
    AND     PND_STAT <> 'S'; -- 선수금상태

    RETURN v_Balance_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0035BalanceAmt;

  /*****************************************************************************
  -- 선수금 발생내역 - 계약번호/고객번호 기준 선수금 잔액(합산) 획득
  *****************************************************************************/
  FUNCTION f_sRtre0035BalanceAmt2 (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER IS
    v_Balance_Amt   NUMBER DEFAULT 0;
  BEGIN

    -- 선수금 잔액(합산) : 선수 발생금액 -  선수 정리금액
    SELECT  NVL(PND_AMT,0) - NVL(SBS_AMT,0)
    INTO    v_Balance_Amt
    FROM    RTRE0035
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     RITM_SEQ = v_Ritm_Seq;

    RETURN v_Balance_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0035BalanceAmt2;
                                                            
  /*****************************************************************************
  -- 선수금 발생내역 - 선수 정리금액 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0035SbsAmt (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Sbs_Amt        IN RTRE0035.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0035
    SET    SBS_AMT  = v_Sbs_Amt,
           PND_STAT = v_Pnd_Stat,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RECV_SEQ = v_Recv_Seq
    AND    RITM_SEQ = v_Ritm_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0035SbsAmt;


  /*****************************************************************************
  -- 선수금 발생내역 Select - 조건별/구분별
  *****************************************************************************/
  PROCEDURE p_sRtre0035OrdCust (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Stat       IN RTRE0035.PND_STAT%TYPE        /*구분                  */
    ) IS

  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  RECV_SEQ,
            RITM_SEQ,
            PND_DAY,
            ORD_NO,
            CUST_NO,
            Pkg_Rtsd0100.f_sRtsd0100CustName( CUST_NO ) AS CUST_NM,
            PND_AMT,
            SBS_AMT,
            PND_AMT - SBS_AMT AS BAL_AMT,
            RECP_TP,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R007', RECP_TP ) AS RECP_TP_NM ,
            RECP_PAY,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R019', RECP_PAY ) AS RECP_PAY_NM,
            RECP_FG,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R020', RECP_FG ) AS RECP_FG_NM,
            PND_STAT,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R021', PND_STAT ) AS PND_STAT_NM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
    FROM    RTRE0035
    WHERE   ORD_NO   = DECODE( v_Ord_No,   NULL, ORD_NO, v_Ord_No )
    AND     CUST_NO  = DECODE( v_Cust_No,  NULL, CUST_NO, v_Cust_No )
    AND     PND_STAT = DECODE( v_Pnd_Stat, NULL, PND_STAT, v_Pnd_Stat )
    ORDER BY CUST_NO, ORD_NO, RECV_SEQ;
        
  END p_sRtre0035OrdCust;


  /*****************************************************************************
  -- 선수금정리 - 건별 수납처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035PartClear (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*선수정리기준일자      */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Type           IN VARCHAR,                      /*처리구분 P:part A:All */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS
    
    CURSOR  Cur_Rtsd0109 (v_Zfb_Day VARCHAR, v_Ord_No VARCHAR, v_Cust_No VARCHAR) IS
    SELECT  A.SCHD_SEQ, A.ARRE_AMT
    FROM    RTSD0109 A
    WHERE   A.CUST_NO  = v_Cust_No
    AND     A.SCD_STAT = 'S'
    AND     A.ZLSPR    = 'N'
    AND     A.RC_YN   <> 'Y'
    AND     A.USE_YN   = 'Y'
    --AND     A.ZFB_DAY <= '20190725'
    AND     A.ZFB_DAY <= v_Zfb_Day
    AND     A.ORD_NO   = v_Ord_No
    ORDER BY A.DEMD_DT, A.RECP_TP;

    e_Error EXCEPTION;
    v_Count         NUMBER;
    v_Table_Count   NUMBER;
    Ref_Cursor  SYS_REFCURSOR;
    v_Recv_Seq1 RTRE0030.RECV_SEQ%TYPE;
    v_Zfb_Day   RTSD0109.ZFB_DAY%TYPE;
    v_Pnd_Amt   RTRE0035.PND_AMT%TYPE;
    v_Sbs_Amt   RTRE0035.SBS_AMT%TYPE;
    v_Recp_Amt  RTRE0035.PND_AMT%TYPE;
    v_Rear_Amt  RTRE0035.PND_AMT%TYPE;
    v_Pend_Amt  RTRE0035.PND_AMT%TYPE;
    v_Arre_Amt  RTRE0035.PND_AMT%TYPE;
    v_Tarre_Amt RTRE0035.PND_AMT%TYPE;
    v_Trecp_Amt RTRE0035.PND_AMT%TYPE;
    v_Recp_Pay  RTRE0035.RECP_PAY%TYPE;
    v_Recp_Fg   RTRE0035.RECP_FG%TYPE;
    v_Pnd_Stat  RTRE0035.PND_STAT%TYPE;

  BEGIN


    -- 필수값:계약번호, 고객번호,  수납거래번호, 거래일련번호, 등록자 ID
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Ritm_Seq) IS NULL THEN
        v_Return_Message := '거래일련번호('||v_Ritm_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Type) IS NULL THEN
        v_Return_Message := '처리구분('||v_Type||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 선수잔액 내역 확인    
    SELECT  PND_AMT,   SBS_AMT,   RECP_PAY,   RECP_FG
    INTO    v_Pnd_Amt, v_Sbs_Amt, v_Recp_Pay, v_Recp_Fg
    FROM    RTRE0035 
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     RITM_SEQ = v_Ritm_Seq
    AND     ORD_NO   = v_Ord_No
    AND     CUST_NO  = v_Cust_No;
                
    IF NVL(v_Pnd_Amt,0) <= NVL(v_Sbs_Amt,0) THEN
        v_Return_Message := '해당건('||v_Recv_Seq||')은 선수잔액(RTRE0035)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    -- 수납대상리스트 임시테이블 존재여부 확인
    SELECT COUNT(*)
    INTO   v_Table_Count
    FROM   USER_TABLES
    WHERE  TABLE_NAME = 'RTTEMP01';

    IF (SQL%NOTFOUND) OR (v_Table_Count = 0) THEN

        -- 수납대상리스트 임시테이블 생성
        EXECUTE IMMEDIATE
        'CREATE GLOBAL TEMPORARY TABLE RTTEMP01 (
              ORD_NO        VARCHAR2(15 BYTE),
              CUST_NO       VARCHAR2(10 BYTE),
              SCHD_SEQ      NUMBER(3),
              ARRE_AMT      NUMBER(10),
              RECP_AMT      NUMBER(10)
         ) ON COMMIT DELETE ROWS;
        COMMENT ON TABLE NXRADMIN.RTTEMP01 IS ''출금이체 수납등록처리(Pkg_Rtre0070)시 사용 TEMPORARY TABLE'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ORD_NO IS ''계약번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.CUST_NO IS ''고객번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCHD_SEQ IS ''청구순번'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ARRE_AMT IS ''미납금액 '';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_AMT IS ''수납처리금액'';';
    
    END IF;


    -- 수납처리 대상 선수잔액 금액
    v_Tarre_Amt := v_Pnd_Amt  - v_Sbs_Amt;
    v_Trecp_Amt := v_Tarre_Amt;     -- 수납처리 대상 전체금액
    v_Zfb_Day   := v_Sbs_Day;
            
    -- 미수자료에대해 수납처리함
    FOR CUR_0109 IN Cur_Rtsd0109(v_Zfb_Day, v_Ord_No, v_Cust_No) LOOP
        EXIT WHEN Cur_Rtsd0109%NOTFOUND;  
            
        IF v_Tarre_Amt >= CUR_0109.ARRE_AMT THEN
            v_Arre_Amt := CUR_0109.ARRE_AMT;
            v_Recp_Amt := CUR_0109.ARRE_AMT;
            v_Tarre_Amt := v_Tarre_Amt - CUR_0109.ARRE_AMT; 
        ELSE
            v_Arre_Amt := CUR_0109.ARRE_AMT;
            v_Recp_Amt := v_Tarre_Amt;
            v_Tarre_Amt := 0;
        END IF;
                
        -- 수납대상리스트 임시테이블에 생성 
        IF v_Recp_Amt > 0 THEN
            INSERT INTO RTTEMP01
                   ( ORD_NO,                    
                     CUST_NO,                   
                     SCHD_SEQ,                  
                     ARRE_AMT,                  
                     RECP_AMT                   
                   )
            VALUES ( v_Ord_No, v_Cust_No, CUR_0109.SCHD_SEQ,
                     v_Arre_Amt, v_Recp_Amt ); 
        END  IF;
            
    END LOOP;   
            

    IF Cur_Rtsd0109%ISOPEN THEN
        CLOSE Cur_Rtsd0109;
    END IF;    

    v_Pend_Amt := v_Tarre_Amt;

    -- 처리금액 재설정
    v_Recp_Amt := v_Trecp_Amt - v_Pend_Amt;
    v_Rear_Amt := v_Trecp_Amt - v_Pend_Amt;

    IF v_Recp_Amt = 0 THEN
    
        IF NVL(v_Type, 'P') <> 'A' THEN
            v_Return_Message := '정리할 미수내역(RTSD0109) 이  없습니다.(주문번호-'||v_Ord_No||')';
            RAISE e_Error;
        END IF;
        
    ELSE
                
        -- 수납내역 생성처리    
        -- 수납대상리스트 조회(미납리스트)
        OPEN  Ref_Cursor FOR    
        SELECT  A.ORD_NO,               -- 계약번호 
                A.CUST_NO,              -- 고객번호 
                A.SCHD_SEQ,             -- 청구순번 
                A.ARRE_AMT,             -- 미납금액 
                A.RECP_AMT              -- 수납처리금액 
        FROM    RTTEMP01 A
        WHERE   A.RECP_AMT > 0          -- 수납금액이 존재하는 것만 
        AND     A.ORD_NO  = v_Ord_No
        AND     A.CUST_NO = v_Cust_No
        ORDER   BY A.SCHD_SEQ;

                            
        -- 수납거래번호 채번(선수금 수납처리)
        v_Recv_Seq1 := Pkg_Rtre0030.f_sRtre0030RecvSeq();
        -- 수납처리 완료후 RTRE0030 추가생성(선수금 - 로 생성해야됨)
    /*            
        IF 0 <> Pkg_Rtre0030.f_InsertRtre0030(v_Recv_Seq,  v_Ritm_Seq, v_Recv_Day, v_Ord_No, v_Cust_No,
                                              v_Recp_Id,   v_Recp_Amt, v_Recp_Tp, v_Recp_Pay,
                                              v_Recp_Fg,   v_Schd_Seq, v_Cash_Yn, v_Cnc_Stat,
                                              v_Cnc_Rseq,  v_Cnc_Iseq, v_Cnc_Ioseq,  v_Reg_Id,
                                              v_ErrorText) THEN
    */                                          
        IF 0 <> Pkg_Rtre0030.f_InsertRtre0030(v_Recv_Seq1, 1,   v_Zfb_Day, v_Ord_No, v_Cust_No,
                                              NULL,  0 - v_Recp_Amt, '90', v_Recp_Pay,
                                              '21',  NULL, 'Y', 'N',
                                              NULL,  NULL, NULL,  v_Reg_Id,
                                              v_ErrorText) THEN
            v_Return_Message := '선수금 수납정리 수납내역(RTRE0030) 선수금(-) 생성 실패!!(수납거래번호-'||v_Recv_Seq||')'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
            
        -- 수납내역 생성            
/*        Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Zfb_Day,  v_Ord_nO,   v_Cust_No, 
                                       NULL,       v_Recp_Amt, v_Recp_Pay, v_Recp_Fg,
                                       v_Recv_Seq1, 
                                       v_Rear_Amt, 0,    v_Reg_Id, v_Success_Code, 
                                       v_Return_Message, v_ErrorText);
*/                                       
        -- 수납내역 생성            
        Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Zfb_Day,  v_Ord_nO,   v_Cust_No, 
                                       NULL,       v_Recp_Amt, v_Recp_Pay, '21',
                                       v_Recv_Seq1, 
                                       v_Rear_Amt, 0,    v_Reg_Id, v_Success_Code, 
                                       v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납내역 생성처리 실패!!('||v_Ord_No||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;  
            

        -- 수납처리 완료후 RTRE0036 신규 생성
        IF 0 <> Pkg_Rtre0036.f_InsertRtre0036 (v_Recv_Seq1, 0,          v_Sbs_Day,  v_Ord_No,  v_Cust_No,
                                               v_Recp_Amt,  '90',       v_Recp_Pay, '21',      NULL,
                                               v_Recv_Seq,  v_Ritm_Seq, v_Reg_Id,   v_ErrorTexT ) THEN
            v_Return_Message := '선수금 수납정리내역 생성(RTRE0036) 실패!!(수납거래번호-'||v_Recv_Seq||')';
            RAISE e_Error;
        END IF;

        -- 수납처리 완료후 RTRE0035 금액 및 상태 Update
        v_Sbs_Amt := v_Sbs_Amt + v_Recp_Amt;
        IF v_Pnd_Amt <= v_Sbs_Amt THEN
            v_Pnd_Stat := 'S';  -- 정리완료
        ELSIF v_Sbs_Amt > 0 THEN
            v_Pnd_Stat := 'R';  -- 부분정리
        ELSE
            v_Pnd_Stat := 'P';  -- 발생(정리금액없음)
        END IF;
            
        IF 0 <> f_UpdateRtre0035SbsAmt(v_Recv_Seq,  v_Ritm_Seq, v_Sbs_Amt, v_Pnd_Stat, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '선수금 수납정리내역 Update(RTRE0036) 실패!!(수납거래번호-'||v_Recv_Seq||')';
            RAISE e_Error;
        END IF;
        
    END IF;
            

    v_Success_code := 0;
    v_Return_Message := '정상적으로 선수 정리되었습니다';
    v_ErrorText := '';
    --COMMIT;


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -2;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0035PartClear;
           

  /*****************************************************************************
  -- 선수금정리 - 선수금 전체처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035AllClear (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*선수정리기준일자      */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS


    CURSOR  Cur_Rtre0035 IS
    SELECT  ORD_NO, CUST_NO, RECV_SEQ, RITM_SEQ
    FROM    RTRE0035 A
    WHERE   PND_AMT > SBS_AMT
    ORDER BY CUST_NO, ORD_NO, RECV_SEQ, RITM_SEQ;

    e_Error EXCEPTION;
    v_Count         NUMBER;
    v_Ord_No        RTRE0035.ORD_NO%TYPE;         /*계약번호              */
    v_Cust_No       RTRE0035.CUST_NO%TYPE;        /*고객번호              */
    v_Recv_Seq      RTRE0035.RECV_SEQ%TYPE;       /*수납거래번호          */
    v_Ritm_Seq      RTRE0035.RITM_SEQ%TYPE;       /*거래일련번호          */
    v_Type          VARCHAR2(1);

  BEGIN


    -- 필수값: 선수금 정리기준일자,  등록자 ID
    IF TRIM(v_Sbs_Day) IS NULL THEN
        v_Return_Message := '선수금 정리기준일자('||v_Sbs_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    
    OPEN Cur_Rtre0035;
    LOOP
        FETCH Cur_Rtre0035 INTO v_Ord_No, v_Cust_No, v_Recv_Seq, v_Ritm_Seq;
        EXIT WHEN Cur_Rtre0035%NOTFOUND;
    
        v_Type := 'A';  -- 전체처리(전체인 경우는 미수가 없어도 ERROR처리하지 않음
        p_UpdateRtre0035PartClear(v_Sbs_Day, v_Ord_No, v_Cust_No, v_Recv_Seq,  v_Ritm_Seq, v_Type,  v_Reg_Id, 
                                  v_Success_Code, v_Return_Message, v_ErrorText);
        IF v_Success_Code <> 0 THEN
            CLOSE Cur_Rtre0035;
            RAISE e_Error;
        END IF;
    
    END LOOP;
    
    IF Cur_Rtre0035%ISOPEN THEN
        CLOSE Cur_Rtre0035;
    END IF;       

       
    v_Success_code := 0;
    v_Return_Message := '정상적으로 선수 정리되었습니다';
    v_ErrorText := '';
    --COMMIT;


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035AllClear(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -2;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035AllClear(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0035AllClear;
           

  /*****************************************************************************
  -- 선수금정리 - 중도완납선수금 수납처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035MfpPartClear (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*선수정리기준일자      */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Type           IN VARCHAR,                      /*처리구분 P:part A:All */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS
    
    CURSOR  Cur_Rtsd0109 (v_Zfb_Day VARCHAR, v_Ord_No VARCHAR, v_Cust_No VARCHAR) IS
    SELECT  A.SCHD_SEQ, A.ARRE_AMT
    FROM    RTSD0109 A
    WHERE   A.CUST_NO  = v_Cust_No
    AND     A.SCD_STAT = 'S'
    AND     A.ZLSPR    = 'N'
    AND     A.RC_YN   <> 'Y'
    AND     A.USE_YN   = 'Y'
    --AND     SUBSTR(DEMD_DT, 1, 6) >= SUBSTR(v_Sbs_Day, 1, 6)
    --AND     A.ZFB_DAY <= '20190725'
    --AND     A.ZFB_DAY <= v_Sbs_Day
    AND     A.ORD_NO   = v_Ord_No
    ORDER BY A.DEMD_DT, A.RECP_TP;

    e_Error EXCEPTION;
    v_Count         NUMBER;
    v_Table_Count   NUMBER;
    Ref_Cursor  SYS_REFCURSOR;
    v_Recv_Seq1 RTRE0030.RECV_SEQ%TYPE;
    v_Zfb_Day   RTSD0109.ZFB_DAY%TYPE;
    v_Pnd_Amt   RTRE0035.PND_AMT%TYPE;
    v_Sbs_Amt   RTRE0035.SBS_AMT%TYPE;
    v_Recp_Amt  RTRE0035.PND_AMT%TYPE;
    v_Rear_Amt  RTRE0035.PND_AMT%TYPE;
    v_Pend_Amt  RTRE0035.PND_AMT%TYPE;
    v_Arre_Amt  RTRE0035.PND_AMT%TYPE;
    v_Tarre_Amt RTRE0035.PND_AMT%TYPE;
    v_Trecp_Amt RTRE0035.PND_AMT%TYPE;
    v_Recp_Pay  RTRE0035.RECP_PAY%TYPE;
    v_Recp_Fg   RTRE0035.RECP_FG%TYPE;
    v_Pnd_Stat  RTRE0035.PND_STAT%TYPE;

  BEGIN


Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(test01)', 'v_Ord_No', v_Ord_No);
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(test02)', 'v_Sbs_Day', v_Sbs_Day);
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(test03)', 'v_Cust_No', v_Cust_No);
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(test04)', 'v_Recv_Seq', v_Recv_Seq);
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(test05)', 'v_Ritm_Seq', v_Ritm_Seq);
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(test06)', 'v_Type', v_Type);
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(test07)', 'v_Reg_Id', v_Reg_Id);

    -- 필수값:계약번호, 고객번호,  수납거래번호, 거래일련번호, 등록자 ID
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Ritm_Seq) IS NULL THEN
        v_Return_Message := '거래일련번호('||v_Ritm_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Type) IS NULL THEN
        v_Return_Message := '처리구분('||v_Type||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 선수잔액 내역 확인    
    SELECT  PND_AMT,   SBS_AMT,   RECP_PAY,   RECP_FG
    INTO    v_Pnd_Amt, v_Sbs_Amt, v_Recp_Pay, v_Recp_Fg
    FROM    RTRE0035 
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     RITM_SEQ = v_Ritm_Seq
    AND     ORD_NO   = v_Ord_No
    AND     CUST_NO  = v_Cust_No;
                
    IF NVL(v_Pnd_Amt,0) <= NVL(v_Sbs_Amt,0) THEN
        v_Return_Message := '해당건('||v_Recv_Seq||')은 선수잔액(RTRE0035)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    -- 수납대상리스트 임시테이블 존재여부 확인
    SELECT COUNT(*)
    INTO   v_Table_Count
    FROM   USER_TABLES
    WHERE  TABLE_NAME = 'RTTEMP01';

    IF (SQL%NOTFOUND) OR (v_Table_Count = 0) THEN

        -- 수납대상리스트 임시테이블 생성
        EXECUTE IMMEDIATE
        'CREATE GLOBAL TEMPORARY TABLE RTTEMP01 (
              ORD_NO        VARCHAR2(15 BYTE),
              CUST_NO       VARCHAR2(10 BYTE),
              SCHD_SEQ      NUMBER(3),
              ARRE_AMT      NUMBER(10),
              RECP_AMT      NUMBER(10)
         ) ON COMMIT DELETE ROWS;
        COMMENT ON TABLE NXRADMIN.RTTEMP01 IS ''출금이체 수납등록처리(Pkg_Rtre0070)시 사용 TEMPORARY TABLE'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ORD_NO IS ''계약번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.CUST_NO IS ''고객번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCHD_SEQ IS ''청구순번'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ARRE_AMT IS ''미납금액 '';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_AMT IS ''수납처리금액'';';
    
    END IF;


    -- 수납처리 대상 선수잔액 금액
    v_Tarre_Amt := v_Pnd_Amt  - v_Sbs_Amt;
    v_Trecp_Amt := v_Tarre_Amt;     -- 수납처리 대상 전체금액
    v_Zfb_Day   := v_Sbs_Day;

    -- 이전TEMP1테이블에 남아있을경우가 있어서 삭제
    DELETE 
    FROM   RTTEMP01
    WHERE  ORD_NO   = v_Ord_No
    AND    CUST_NO  = v_Cust_No;      
            
    -- 미수자료에대해 수납처리함
    FOR CUR_0109 IN Cur_Rtsd0109(v_Zfb_Day, v_Ord_No, v_Cust_No) LOOP
        EXIT WHEN Cur_Rtsd0109%NOTFOUND;  
            
        IF v_Tarre_Amt >= CUR_0109.ARRE_AMT THEN
            v_Arre_Amt := CUR_0109.ARRE_AMT;
            v_Recp_Amt := CUR_0109.ARRE_AMT;
            v_Tarre_Amt := v_Tarre_Amt - CUR_0109.ARRE_AMT; 
        ELSE
            v_Arre_Amt := CUR_0109.ARRE_AMT;
            v_Recp_Amt := v_Tarre_Amt;
            v_Tarre_Amt := 0;
        END IF;
                
        -- 수납대상리스트 임시테이블에 생성 
        IF v_Recp_Amt > 0 THEN
  
        
            INSERT INTO RTTEMP01
                   ( ORD_NO,                    
                     CUST_NO,                   
                     SCHD_SEQ,                  
                     ARRE_AMT,                  
                     RECP_AMT                   
                   )
            VALUES ( v_Ord_No, v_Cust_No, CUR_0109.SCHD_SEQ,
                     v_Arre_Amt, v_Recp_Amt ); 
        END  IF;
            
    END LOOP;   
            

    IF Cur_Rtsd0109%ISOPEN THEN
        CLOSE Cur_Rtsd0109;
    END IF;    

    v_Pend_Amt := v_Tarre_Amt;

    -- 처리금액 재설정
    v_Recp_Amt := v_Trecp_Amt - v_Pend_Amt;
    v_Rear_Amt := v_Trecp_Amt - v_Pend_Amt;

    IF v_Recp_Amt = 0 THEN
    
        IF NVL(v_Type, 'P') <> 'A' THEN
            v_Return_Message := '정리할 미수내역(RTSD0109) 이  없습니다.(주문번호-'||v_Ord_No||')';
            RAISE e_Error;
        END IF;
        
    ELSE
                
        -- 수납내역 생성처리    
        -- 수납대상리스트 조회(미납리스트)
        OPEN  Ref_Cursor FOR    
        SELECT  A.ORD_NO,               -- 계약번호 
                A.CUST_NO,              -- 고객번호 
                A.SCHD_SEQ,             -- 청구순번 
                A.ARRE_AMT,             -- 미납금액 
                A.RECP_AMT              -- 수납처리금액 
        FROM    RTTEMP01 A
        WHERE   A.RECP_AMT > 0          -- 수납금액이 존재하는 것만 
        AND     A.ORD_NO  = v_Ord_No
        AND     A.CUST_NO = v_Cust_No
        ORDER   BY A.SCHD_SEQ;

                            
        -- 수납거래번호 채번(선수금 수납처리)
        v_Recv_Seq1 := Pkg_Rtre0030.f_sRtre0030RecvSeq();
        -- 수납처리 완료후 RTRE0030 추가생성(선수금 - 로 생성해야됨)
    /*            
        IF 0 <> Pkg_Rtre0030.f_InsertRtre0030(v_Recv_Seq,  v_Ritm_Seq, v_Recv_Day, v_Ord_No, v_Cust_No,
                                              v_Recp_Id,   v_Recp_Amt, v_Recp_Tp, v_Recp_Pay,
                                              v_Recp_Fg,   v_Schd_Seq, v_Cash_Yn, v_Cnc_Stat,
                                              v_Cnc_Rseq,  v_Cnc_Iseq, v_Cnc_Ioseq,  v_Reg_Id,
                                              v_ErrorText) THEN
    */                                          
        IF 0 <> Pkg_Rtre0030.f_InsertRtre0030(v_Recv_Seq1, 1,   v_Zfb_Day, v_Ord_No, v_Cust_No,
                                              NULL,  0 - v_Recp_Amt, '90', v_Recp_Pay,
                                              '21',  NULL, 'Y', 'N',
                                              NULL,  NULL, NULL,  v_Reg_Id,
                                              v_ErrorText) THEN
            v_Return_Message := '선수금 수납정리 수납내역(RTRE0030) 선수금(-) 생성 실패!!(수납거래번호-'||v_Recv_Seq||')'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
            
        -- 수납내역 생성            
/*        Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Zfb_Day,  v_Ord_nO,   v_Cust_No, 
                                       NULL,       v_Recp_Amt, v_Recp_Pay, v_Recp_Fg,
                                       v_Recv_Seq1, 
                                       v_Rear_Amt, 0,    v_Reg_Id, v_Success_Code, 
                                       v_Return_Message, v_ErrorText);
*/                                       
        -- 수납내역 생성            
        Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Zfb_Day,  v_Ord_nO,   v_Cust_No, 
                                       NULL,       v_Recp_Amt, v_Recp_Pay, '21',
                                       v_Recv_Seq1, 
                                       v_Rear_Amt, 0,    v_Reg_Id, v_Success_Code, 
                                       v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납내역 생성처리 실패!!('||v_Ord_No||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;  
            

        -- 수납처리 완료후 RTRE0036 신규 생성
        IF 0 <> Pkg_Rtre0036.f_InsertRtre0036 (v_Recv_Seq1, 0,          v_Sbs_Day,  v_Ord_No,  v_Cust_No,
                                               v_Recp_Amt,  '90',       v_Recp_Pay, '21',      NULL,
                                               v_Recv_Seq,  v_Ritm_Seq, v_Reg_Id,   v_ErrorTexT ) THEN
            v_Return_Message := '선수금 수납정리내역 생성(RTRE0036) 실패!!(수납거래번호-'||v_Recv_Seq||')';
            RAISE e_Error;
        END IF;

        -- 수납처리 완료후 RTRE0035 금액 및 상태 Update
        v_Sbs_Amt := v_Sbs_Amt + v_Recp_Amt;
        IF v_Pnd_Amt <= v_Sbs_Amt THEN
            v_Pnd_Stat := 'S';  -- 정리완료
        ELSIF v_Sbs_Amt > 0 THEN
            v_Pnd_Stat := 'R';  -- 부분정리
        ELSE
            v_Pnd_Stat := 'P';  -- 발생(정리금액없음)
        END IF;
            
        IF 0 <> f_UpdateRtre0035SbsAmt(v_Recv_Seq,  v_Ritm_Seq, v_Sbs_Amt, v_Pnd_Stat, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '선수금 수납정리내역 Update(RTRE0036) 실패!!(수납거래번호-'||v_Recv_Seq||')';
            RAISE e_Error;
        END IF;
        
    END IF;
            

    v_Success_code := 0;
    v_Return_Message := '정상적으로 선수 정리되었습니다';
    v_ErrorText := '';
    --COMMIT;


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -2;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0035MfpPartClear;
               
  /*****************************************************************************
  -- 선수금정리 - 패키지 해지시  위약금  수납처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035PkgClear (
    v_Sbs_Day        IN RTRE0036.SBS_DAY%TYPE,        /*선수정리기준일자      */
    v_Ord_No         IN RTRE0035.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0035.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0035.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Type           IN VARCHAR,                      /*처리구분 P:part A:All */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS
    
    CURSOR  Cur_Rtsd0109 (v_Zfb_Day VARCHAR, v_Ord_No VARCHAR, v_Cust_No VARCHAR) IS
    SELECT  A.SCHD_SEQ, A.ARRE_AMT
    FROM    RTSD0109 A
    WHERE   A.CUST_NO  = v_Cust_No
    AND     A.SCD_STAT = 'S'
    AND     A.ZLSPR    = 'N'
    AND     A.RC_YN   <> 'Y'
    AND     A.USE_YN   = 'Y'
    AND     A.RECP_TP  = '42'   -- 위약금만 식별하기 위함
    AND     A.ORD_NO   = v_Ord_No
    ORDER BY A.DEMD_DT, A.RECP_TP;

    e_Error EXCEPTION;
    v_Count         NUMBER;
    v_Table_Count   NUMBER;
    Ref_Cursor  SYS_REFCURSOR;
    v_Recv_Seq1 RTRE0030.RECV_SEQ%TYPE;

    v_Zfb_Day   RTSD0109.ZFB_DAY%TYPE;
    v_Pnd_Amt   RTRE0035.PND_AMT%TYPE;
    v_Sbs_Amt   RTRE0035.SBS_AMT%TYPE;
    v_Recp_Amt  RTRE0035.PND_AMT%TYPE;
    v_Rear_Amt  RTRE0035.PND_AMT%TYPE;
    v_Pend_Amt  RTRE0035.PND_AMT%TYPE;
    v_Arre_Amt  RTRE0035.PND_AMT%TYPE;
    v_Tarre_Amt RTRE0035.PND_AMT%TYPE;
    v_Trecp_Amt RTRE0035.PND_AMT%TYPE;
    v_Recp_Pay  RTRE0035.RECP_PAY%TYPE;
    v_Recp_Fg   RTRE0035.RECP_FG%TYPE;
    v_Pnd_Stat  RTRE0035.PND_STAT%TYPE;

  BEGIN


    -- 필수값:계약번호, 고객번호,  수납거래번호, 거래일련번호, 등록자 ID
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Ritm_Seq) IS NULL THEN
        v_Return_Message := '거래일련번호('||v_Ritm_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Type) IS NULL THEN
        v_Return_Message := '처리구분('||v_Type||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 선수잔액 내역 확인    
    SELECT  PND_AMT,   SBS_AMT,   RECP_PAY,   RECP_FG
    INTO    v_Pnd_Amt, v_Sbs_Amt, v_Recp_Pay, v_Recp_Fg
    FROM    RTRE0035 
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     RITM_SEQ = v_Ritm_Seq
    AND     ORD_NO   = v_Ord_No
    AND     CUST_NO  = v_Cust_No;
                
    IF NVL(v_Pnd_Amt,0) <= NVL(v_Sbs_Amt,0) THEN
        v_Return_Message := '해당건('||v_Recv_Seq||')은 선수잔액(RTRE0035)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    -- 수납대상리스트 임시테이블 존재여부 확인
    SELECT COUNT(*)
    INTO   v_Table_Count
    FROM   USER_TABLES
    WHERE  TABLE_NAME = 'RTTEMP01';

    IF (SQL%NOTFOUND) OR (v_Table_Count = 0) THEN

        -- 수납대상리스트 임시테이블 생성
        EXECUTE IMMEDIATE
        'CREATE GLOBAL TEMPORARY TABLE RTTEMP01 (
              ORD_NO        VARCHAR2(15 BYTE),
              CUST_NO       VARCHAR2(10 BYTE),
              SCHD_SEQ      NUMBER(3),
              ARRE_AMT      NUMBER(10),
              RECP_AMT      NUMBER(10)
         ) ON COMMIT DELETE ROWS;
        COMMENT ON TABLE NXRADMIN.RTTEMP01 IS ''출금이체 수납등록처리(Pkg_Rtre0070)시 사용 TEMPORARY TABLE'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ORD_NO IS ''계약번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.CUST_NO IS ''고객번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCHD_SEQ IS ''청구순번'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ARRE_AMT IS ''미납금액 '';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_AMT IS ''수납처리금액'';';
    
    END IF;


    -- 수납처리 대상 선수잔액 금액
    v_Tarre_Amt := v_Pnd_Amt  - v_Sbs_Amt;
    v_Trecp_Amt := v_Tarre_Amt;     -- 수납처리 대상 전체금액
    v_Zfb_Day   := v_Sbs_Day;
            
    -- 미수자료에대해 수납처리함
    FOR CUR_0109 IN Cur_Rtsd0109(v_Zfb_Day, v_Ord_No, v_Cust_No) LOOP
        EXIT WHEN Cur_Rtsd0109%NOTFOUND;  
DBMS_OUTPUT.PUT_LINE('CUR_0109.ARRE_AMT :: ' || CUR_0109.ARRE_AMT);            
        IF v_Tarre_Amt >= CUR_0109.ARRE_AMT THEN
            v_Arre_Amt := CUR_0109.ARRE_AMT;
            v_Recp_Amt := CUR_0109.ARRE_AMT;
            v_Tarre_Amt := v_Tarre_Amt - CUR_0109.ARRE_AMT; 
DBMS_OUTPUT.PUT_LINE('CUR_0109.v_Arre_Amt :: ' || v_Arre_Amt); 
DBMS_OUTPUT.PUT_LINE('CUR_0109.v_Recp_Amt :: ' || v_Recp_Amt); 
DBMS_OUTPUT.PUT_LINE('CUR_0109.v_Tarre_Amt :: ' || v_Tarre_Amt);             
        ELSE
            v_Arre_Amt := CUR_0109.ARRE_AMT;
            v_Recp_Amt := v_Tarre_Amt;
            v_Tarre_Amt := 0;
DBMS_OUTPUT.PUT_LINE('CUR_0110.v_Arre_Amt :: ' || v_Arre_Amt);
DBMS_OUTPUT.PUT_LINE('CUR_0110.v_Recp_Amt :: ' || v_Recp_Amt);                  
        END IF;
                
        -- 수납대상리스트 임시테이블에 생성 
        IF v_Recp_Amt > 0 THEN
            INSERT INTO RTTEMP01
                   ( ORD_NO,                    
                     CUST_NO,                   
                     SCHD_SEQ,                  
                     ARRE_AMT,                  
                     RECP_AMT                   
                   )
            VALUES ( v_Ord_No, v_Cust_No, CUR_0109.SCHD_SEQ,
                     v_Arre_Amt, v_Recp_Amt ); 
        END  IF;
            
    END LOOP;   
            

    IF Cur_Rtsd0109%ISOPEN THEN
        CLOSE Cur_Rtsd0109;
    END IF;    

    v_Pend_Amt := v_Tarre_Amt;

    -- 처리금액 재설정
    v_Recp_Amt := v_Trecp_Amt - v_Pend_Amt;
    v_Rear_Amt := v_Trecp_Amt - v_Pend_Amt;

    IF v_Recp_Amt = 0 THEN
    
        IF NVL(v_Type, 'P') <> 'A' THEN
            v_Return_Message := '정리할 미수내역(RTSD0109) 이  없습니다.(주문번호-'||v_Ord_No||')';
            RAISE e_Error;
        END IF;
        
    ELSE
                
        -- 수납내역 생성처리    
        -- 수납대상리스트 조회(미납리스트)
        OPEN  Ref_Cursor FOR    
        SELECT  A.ORD_NO,               -- 계약번호 
                A.CUST_NO,              -- 고객번호 
                A.SCHD_SEQ,             -- 청구순번 
                A.ARRE_AMT,             -- 미납금액 
                A.RECP_AMT              -- 수납처리금액 
        FROM    RTTEMP01 A
        WHERE   A.RECP_AMT > 0          -- 수납금액이 존재하는 것만 
        AND     A.ORD_NO  = v_Ord_No
        AND     A.CUST_NO = v_Cust_No
        ORDER   BY A.SCHD_SEQ;

                            
        -- 수납거래번호 채번(선수금 수납처리)
        v_Recv_Seq1 := Pkg_Rtre0030.f_sRtre0030RecvSeq();
        -- 수납처리 완료후 RTRE0030 추가생성(선수금 - 로 생성해야됨)
    /*            
        IF 0 <> Pkg_Rtre0030.f_InsertRtre0030(v_Recv_Seq,  v_Ritm_Seq, v_Recv_Day, v_Ord_No, v_Cust_No,
                                              v_Recp_Id,   v_Recp_Amt, v_Recp_Tp, v_Recp_Pay,
                                              v_Recp_Fg,   v_Schd_Seq, v_Cash_Yn, v_Cnc_Stat,
                                              v_Cnc_Rseq,  v_Cnc_Iseq, v_Cnc_Ioseq,  v_Reg_Id,
                                              v_ErrorText) THEN
    */                                          
        IF 0 <> Pkg_Rtre0030.f_InsertRtre0030(v_Recv_Seq1, 1,   v_Zfb_Day, v_Ord_No, v_Cust_No,
                                              NULL,  0 - v_Recp_Amt, '90', v_Recp_Pay,
                                              '21',  NULL, 'Y', 'N',
                                              NULL,  NULL, NULL,  v_Reg_Id,
                                              v_ErrorText) THEN
            v_Return_Message := '선수금 수납정리 수납내역(RTRE0030) 선수금(-) 생성 실패!!(수납거래번호-'||v_Recv_Seq||')'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
            
        -- 수납내역 생성            
/*        Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Zfb_Day,  v_Ord_nO,   v_Cust_No, 
                                       NULL,       v_Recp_Amt, v_Recp_Pay, v_Recp_Fg,
                                       v_Recv_Seq1, 
                                       v_Rear_Amt, 0,    v_Reg_Id, v_Success_Code, 
                                       v_Return_Message, v_ErrorText);
*/                                       
        -- 수납내역 생성            
        Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Zfb_Day,  v_Ord_nO,   v_Cust_No, 
                                       NULL,       v_Recp_Amt, v_Recp_Pay, '21',
                                       v_Recv_Seq1, 
                                       v_Rear_Amt, 0,    v_Reg_Id, v_Success_Code, 
                                       v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납내역 생성처리 실패!!('||v_Ord_No||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;  
            

        -- 수납처리 완료후 RTRE0036 신규 생성
        IF 0 <> Pkg_Rtre0036.f_InsertRtre0036 (v_Recv_Seq1, 0,          v_Sbs_Day,  v_Ord_No,  v_Cust_No,
                                               v_Recp_Amt,  '90',       v_Recp_Pay, '21',      NULL,
                                               v_Recv_Seq,  v_Ritm_Seq, v_Reg_Id,   v_ErrorTexT ) THEN
            v_Return_Message := '선수금 수납정리내역 생성(RTRE0036) 실패!!(수납거래번호-'||v_Recv_Seq||')';
            RAISE e_Error;
        END IF;

        -- 수납처리 완료후 RTRE0035 금액 및 상태 Update
        v_Sbs_Amt := v_Sbs_Amt + v_Recp_Amt;
        IF v_Pnd_Amt <= v_Sbs_Amt THEN
            v_Pnd_Stat := 'S';  -- 정리완료
        ELSIF v_Sbs_Amt > 0 THEN
            v_Pnd_Stat := 'R';  -- 부분정리
        ELSE
            v_Pnd_Stat := 'P';  -- 발생(정리금액없음)
        END IF;
            
        IF 0 <> f_UpdateRtre0035SbsAmt(v_Recv_Seq,  v_Ritm_Seq, v_Sbs_Amt, v_Pnd_Stat, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '선수금 수납정리내역 Update(RTRE0036) 실패!!(수납거래번호-'||v_Recv_Seq||')';
            RAISE e_Error;
        END IF;
        
    END IF;
            

    v_Success_code := 0;
    v_Return_Message := '정상적으로 선수 정리되었습니다';
    v_ErrorText := '';
    --COMMIT;


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -2;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.f_UpdateRtre0035PartClear(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0035PkgClear;
    
  /*****************************************************************************
  -- 선수금환불 - 선수금 환불 처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0035Refund (
    v_Recv_Seq       IN RTRE0035.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0035.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS
    
    e_Error EXCEPTION;

    v_Recv_Seq_New RTRE0030.RECV_SEQ%TYPE;
    v_Ord_No RTRE0030.ORD_NO%TYPE;
    v_Cust_No RTRE0030.CUST_NO%TYPE;
    v_Recp_Amt RTRE0030.RECP_AMT%TYPE;
    v_Recp_Pay RTRE0030.RECP_PAY%TYPE;
    v_Recv_Day RTRE0030.RECV_DAY%TYPE;
    
    v_Sbs_Iseq RTRE0036.SBS_ISEQ%TYPE;
  BEGIN
    
        SELECT 
            Pkg_Rtre0030.f_sRtre0030recvSeq() 
        INTO v_Recv_Seq_New 
        FROM DUAL;  

    
        SELECT 
            ORD_NO, CUST_NO, RECP_AMT, RECP_PAY, RECV_DAY 
        INTO v_Ord_No, v_Cust_No, v_Recp_Amt, v_Recp_Pay, v_Recv_Day
        FROM RTRE0030
        WHERE RECV_SEQ = v_Recv_Seq;
        
        IF SUBSTR(v_Recv_Day, 1, 6) <> TO_CHAR(SYSDATE, 'YYYYMM') THEN
            v_Return_Message := '당월 입금건에 대해서만 선수금 취소가 가능합니다.';
            RAISE e_Error;
        END IF; 
    
        IF 0 <> Pkg_Rtre0030.f_InsertRtre0030(v_Recv_Seq_New, 1,   TO_CHAR(SYSDATE, 'YYYYMMDD'), v_Ord_No, v_Cust_No,
                                              NULL,  0 - v_Recp_Amt, '90', v_Recp_Pay,
                                              '41',  NULL, 'Y', 'Y',
                                              v_Recv_Seq,  1, 1,  v_Reg_Id,
                                              v_ErrorText) THEN
            v_Return_Message := '선수금 수납정리 수납내역(RTRE0030) 선수금(-) 생성 실패!!(수납거래번호-'||v_Recv_Seq_New||')'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납내역 생성처리 실패!!('||v_Ord_No||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
                     
        -- 이전 수납내역 취소처리            
        IF 0 <> Pkg_Rtre0030.f_UpdateRtre0030CncBefore(v_Recv_Seq, 1, 'Y', v_Recv_Seq_New, 
                                                                       1, 1, v_Reg_Id, v_ErrorText) THEN                                                                       
            v_Return_Message := '선수금 수납정리 이전 수납내역(RTRE0030) 적용 실패!!(수납거래번호-'||v_Recv_Seq_New||')'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        IF 0 != v_Success_Code THEN
            v_Return_Message := '이전 수납내역 취소처리 실패!!('||v_Ord_No||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;  
            
        IF 0 <> f_UpdateRtre0035SbsAmt(v_Recv_Seq,  1, v_Recp_Amt, 'S', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '선수금 수납정리내역 Update(RTRE0035) 실패!!(수납거래번호-'||v_Recv_Seq||')';
            RAISE e_Error;
        END IF;
           
        v_Sbs_Iseq := 0;
        
        Pkg_Rtre0036.p_IUDRtre0036('I', v_Recv_Seq_New, v_Sbs_Iseq, TO_CHAR(SYSDATE, 'YYYYMMDD'), v_Ord_No, v_Cust_No, v_Recp_Amt * -1, '90', v_Recp_Pay, '41', 'S', v_Recv_Seq, 1, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        IF v_Success_Code = -1 THEN
            v_Return_Message := '선수금 수납정리내역 Insert(RTRE0036) 실패!!(수납거래번호-'||v_Recv_Seq||')';
            RAISE e_Error;
        END IF;
        
    v_Success_code := 0;
    v_Return_Message := '정상적으로 선수 정리되었습니다';
    v_ErrorText := '';
    --COMMIT;


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.p_UpdateRtre0035Refund(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -2;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0035.p_UpdateRtre0035Refund(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0035Refund;
      
END Pkg_Rtre0035;