CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0040 AS
/*******************************************************************************
   NAME      Pkg_Rtre0040
   PURPOSE   무통장 수납내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 무통장 수납내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0040Count(
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0040
    WHERE   RECV_SEQ = v_Recv_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0040Count;

  /*****************************************************************************
  -- 무통장 수납내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0040 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*수납자 ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RECV_DAY,                  /*수납일자            */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.RECP_AMT,                  /*수납금액            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.BANK_RECP_DAY,             /*은행입금일          */
            A.CNC_RSEQ,                  /*수납취소거래번호    */
            A.CNC_STAT,                  /*수납취소여부        */
            A.RECP_ID,                   /*수납자 ID           */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0040 A
    WHERE   A.RECV_SEQ      = DECODE(v_Recv_Seq      , NULL, A.RECV_SEQ      , v_Recv_Seq)
    AND     A.RECV_DAY      = DECODE(v_Recv_Day      , NULL, A.RECV_DAY      , v_Recv_Day)
    AND     A.ORD_NO        = DECODE(v_Ord_No        , NULL, A.ORD_NO        , v_Ord_No)
    AND     A.CUST_NO       = DECODE(v_Cust_No       , NULL, A.CUST_NO       , v_Cust_No)
    AND     A.RECP_AMT      = DECODE(v_Recp_Amt      , NULL, A.RECP_AMT      , v_Recp_Amt)
    AND     A.RECP_PAY      = DECODE(v_Recp_Pay      , NULL, A.RECP_PAY      , v_Recp_Pay)
    AND     A.RECP_FG       = DECODE(v_Recp_Fg       , NULL, A.RECP_FG       , v_Recp_Fg)
    AND     A.BANK_RECP_DAY = DECODE(v_Bank_Recp_Day , NULL, A.BANK_RECP_DAY , v_Bank_Recp_Day)
    AND     A.CNC_RSEQ      = DECODE(v_Cnc_Rseq      , NULL, A.CNC_RSEQ      , v_Cnc_Rseq)
    AND     A.CNC_STAT      = DECODE(v_Cnc_Stat      , NULL, A.CNC_STAT      , v_Cnc_Stat)
    AND     A.RECP_ID       = DECODE(v_Recp_Id       , NULL, A.RECP_ID       , v_Recp_Id)
    AND     A.REG_ID        = DECODE(v_Reg_Id        , NULL, A.REG_ID        , v_Reg_Id);

  END p_sRtre0040;

  /*****************************************************************************
  -- 무통장 수납내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*수납자 ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0040 (
            RECV_SEQ,
            RECV_DAY,
            ORD_NO,
            CUST_NO,
            RECP_AMT,
            RECP_PAY,
            RECP_FG,
            BANK_RECP_DAY,
            CNC_RSEQ,
            CNC_STAT,
            RECP_ID,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Recv_Day,
            v_Ord_No,
            v_Cust_No,
            v_Recp_Amt,
            v_Recp_Pay,
            v_Recp_Fg,
            v_Bank_Recp_Day,
            v_Cnc_Rseq,
            v_Cnc_Stat,
            v_Recp_Id,
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

  END f_InsertRtre0040;

  /*****************************************************************************
  -- 무통장 수납내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*수납자 ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0040
    SET    RECV_DAY      = v_Recv_Day,
           ORD_NO        = v_Ord_No,
           CUST_NO       = v_Cust_No,
           RECP_AMT      = v_Recp_Amt,
           RECP_PAY      = v_Recp_Pay,
           RECP_FG       = v_Recp_Fg,
           BANK_RECP_DAY = v_Bank_Recp_Day,
           CNC_RSEQ      = v_Cnc_Rseq,
           CNC_STAT      = v_Cnc_Stat,
           RECP_ID       = v_Recp_Id,
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE 
    WHERE  RECV_SEQ      = v_Recv_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0040;

  /*****************************************************************************
  -- 무통장 수납내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0040
    WHERE   RECV_SEQ = v_Recv_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0040.f_DeleteRtre0040(2)', '수납거래번호', v_Recv_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0040.f_DeleteRtre0040(2)', '등록자 ID', v_Reg_Id);
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0040;

  /*****************************************************************************
  -- 무통장 수납내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0040 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Recv_Seq       IN OUT RTRE0040.RECV_SEQ%TYPE,   /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*수납금액              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*수납자 ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 수납일자 ,계약번호 ,고객번호 ,수납금액 ,수납방법 ,수납유형 ,은행입금일 ,수납취소거래번호 ,수납취소여부 ,등록자 ID    
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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
    
    IF TRIM(v_Recp_Amt) IS NULL THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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
    
    IF 0 != ISDATE(v_Bank_Recp_Day) THEN
        v_Return_Message := '은행입금일('||v_Bank_Recp_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
--    IF TRIM(v_Cnc_Rseq) IS NULL THEN
--        v_Return_Message := '수납취소거래번호('||v_Cnc_Rseq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
    
    IF TRIM(v_Cnc_Stat) IS NULL THEN
        v_Return_Message := '수납취소여부('||v_Cnc_Stat||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;      
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    
    IF v_Comm_Dvsn = 'I' THEN     

        IF 0 != f_sRtre0040Count(v_Recv_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;   
            
        v_Recv_Seq := f_sRtre0040RecvSeq();
        
        IF 0 != f_InsertRtre0040(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No, 
                                 v_Recp_Amt, v_Recp_Pay, v_Recp_Fg, v_Bank_Recp_Day, 
                                 v_Cnc_Rseq, v_Cnc_Stat, v_Recp_Id, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := '무통장 수납내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0040Count(v_Recv_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||')으로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;           
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0040(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No, 
                                     v_Recp_Amt, v_Recp_Pay, v_Recp_Fg, v_Bank_Recp_Day, 
                                     v_Cnc_Rseq, v_Cnc_Stat, v_Recp_Id, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '무통장 수납내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0040(v_Recv_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '무통장 수납내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0040.p_IUDRtre0040(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0040.p_IUDRtre0040(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0040;

  /*****************************************************************************
  -- 무통장 수납내역 - 수납거래번호 체번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0040RecvSeq RETURN NUMBER IS
    v_Recv_Seq  RTRE0040.RECV_SEQ%TYPE DEFAULT NULL;     /*수납거래번호        */
  BEGIN
  
    -- 거래일련번호 시퀀스 같이 사용함    
    SELECT  SEQ_Rtre0030Recv_Seq.NEXTVAL RPC_SEQ
    INTO    v_Recv_Seq
    FROM    DUAL;
    
    RETURN v_Recv_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0040RecvSeq;


  /*****************************************************************************
  -- 무통장 수납내역 - 취소가능여부 판단 - 취소가능상태 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtre0040CncCount(
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN
  
    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0040
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     CNC_RSEQ IS NULL -- 수납취소거래번호
    AND     CNC_STAT = 'N';  -- 수납취소여부

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0040CncCount;
    
  /*****************************************************************************
  -- 무통장 수납내역 - 수납취소 - 원거래수납수정
  *****************************************************************************/
  FUNCTION f_UpdateRtre0040Cancel (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*수납유형              */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*수납취소여부          */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0040
    SET    CNC_RSEQ = v_Cnc_Rseq,
           CNC_STAT = v_Cnc_Stat,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RECV_SEQ = v_Recv_Seq;
    
    IF 0 = SQL%ROWCOUNT THEN
        v_ErrorText := '해당건('||v_Recv_Seq||')으로 등록된 데이터(무통장 수납내역:RTRE0040)이 존재하지 않아 취소처리가 불가 합니다!';
        RETURN -1;
    END IF;

    INSERT  INTO RTRE0040 (
            RECV_SEQ,
            RECV_DAY,
            ORD_NO,
            CUST_NO,
            RECP_AMT,
            RECP_PAY,
            RECP_FG,
            BANK_RECP_DAY,
            CNC_RSEQ,
            CNC_STAT,
            RECP_ID,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  v_Cnc_Rseq RECV_SEQ,
            v_Recv_Day RECV_DAY,
            v_Ord_No   ORD_NO,
            v_Cust_No  CUST_NO,
            - RECP_AMT,
            RECP_PAY,
            v_Recp_Fg RECP_FG,
            BANK_RECP_DAY,
            v_Recv_Seq CNC_RSEQ,
            v_Cnc_Stat CNC_STAT,
            RECP_ID,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0040
    WHERE   RECV_SEQ = v_Recv_Seq;
            
    IF 0 = SQL%ROWCOUNT THEN
        v_ErrorText := '해당건('||v_Cnc_Rseq||')으로 취소 데이터(무통장 수납내역:RTRE0040) 0건으로 등록에 실패하였습니다.!';
        RETURN -1;
    END IF;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0040Cancel;

END Pkg_Rtre0040;