CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0037 AS
/*******************************************************************************
   NAME      Pkg_Rtre0037
   PURPOSE   선수금 잔액내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-15  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 선수금 잔액내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0037Count(
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,        /*마감기준일자        */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0037
    WHERE   CLOSE_DAY      = v_Close_Day
    AND     RECV_SEQ       = v_Recv_Seq
    AND     RITM_SEQ       = v_Ritm_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0037Count;

  /*****************************************************************************
  -- 선수금 잔액내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0037 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CLOSE_DAY,                 /*마감기준일자        */
            A.RECV_SEQ,                  /*수납거래번호        */
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
    FROM    RTRE0037 A
    WHERE   A.CLOSE_DAY        = DECODE(v_Close_Day      , NULL, A.CLOSE_DAY       , v_Close_Day)
    AND     A.RECV_SEQ         = DECODE(v_Recv_Seq       , NULL, A.RECV_SEQ        , v_Recv_Seq)
    AND     A.RITM_SEQ         = DECODE(v_Ritm_Seq       , NULL, A.RITM_SEQ        , v_Ritm_Seq)
    AND     A.PND_DAY          = DECODE(v_Pnd_Day        , NULL, A.PND_DAY         , v_Pnd_Day)
    AND     A.ORD_NO           = DECODE(v_Ord_No         , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
    AND     A.PND_AMT          = DECODE(v_Pnd_Amt        , NULL, A.PND_AMT         , v_Pnd_Amt)
    AND     A.SBS_AMT          = DECODE(v_Sbs_Amt        , NULL, A.SBS_AMT         , v_Sbs_Amt)
    AND     A.RECP_TP          = DECODE(v_Recp_Tp        , NULL, A.RECP_TP         , v_Recp_Tp)
    AND     A.RECP_PAY         = DECODE(v_Recp_Pay       , NULL, A.RECP_PAY        , v_Recp_Pay)
    AND     A.RECP_FG          = DECODE(v_Recp_Fg        , NULL, A.RECP_FG         , v_Recp_Fg)
    AND     A.PND_STAT         = DECODE(v_Pnd_Stat       , NULL, A.PND_STAT        , v_Pnd_Stat)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre0037;

  /*****************************************************************************
  -- 선수금 잔액내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0037 (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0037 (
            CLOSE_DAY,
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
            v_Close_Day,
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

  END f_InsertRtre0037;

  /*****************************************************************************
  -- 선수금 잔액내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0037 (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0037
    SET    PND_DAY          = v_Pnd_Day,
           ORD_NO           = v_Ord_No,
           CUST_NO          = v_Cust_No,
           PND_AMT          = v_Pnd_Amt,
           SBS_AMT          = v_Sbs_Amt,
           RECP_TP          = v_Recp_Tp,
           RECP_PAY         = v_Recp_Pay,
           RECP_FG          = v_Recp_Fg,
           PND_STAT         = v_Pnd_Stat,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE 
    WHERE  CLOSE_DAY        = v_Close_Day
    AND    RECV_SEQ         = v_Recv_Seq
    AND    RITM_SEQ         = v_Ritm_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0037;

  /*****************************************************************************
  -- 선수금 잔액내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0037 (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTRE0037
    WHERE  CLOSE_DAY        = v_Close_Day
    AND    RECV_SEQ         = v_Recv_Seq
    AND    RITM_SEQ         = v_Ritm_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.f_DeleteRtre0037(2)', '마감기준일자', v_Close_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.f_DeleteRtre0037(2)', '수납거래번호', v_Recv_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.f_DeleteRtre0037(2)', '거래일련번호', v_Ritm_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.f_DeleteRtre0037(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0037;

  /*****************************************************************************
  -- 선수금 잔액내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0037 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Recv_Seq       IN RTRE0037.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0037.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Pnd_Day        IN RTRE0037.PND_DAY%TYPE,        /*선수 발생일자         */
    v_Ord_No         IN RTRE0037.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0037.CUST_NO%TYPE,        /*고객번호              */
    v_Pnd_Amt        IN RTRE0037.PND_AMT%TYPE,        /*선수 발생금액         */
    v_Sbs_Amt        IN RTRE0037.SBS_AMT%TYPE,        /*선수 정리금액         */
    v_Recp_Tp        IN RTRE0037.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Pay       IN RTRE0037.RECP_PAY%TYPE,       /*수납방법              */
    v_Recp_Fg        IN RTRE0037.RECP_FG%TYPE,        /*수납유형              */
    v_Pnd_Stat       IN RTRE0037.PND_STAT%TYPE,       /*선수금상태            */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 마감기준일자, 수납거래번호, 거래일련번호, 등록자 ID
    IF TRIM(v_Close_Day) IS NULL THEN
        v_Return_Message := '마감기준일자('||v_Close_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ritm_Seq) IS NULL THEN
        v_Return_Message := '거래일련번호('||v_Ritm_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0037( v_Close_Day, v_Recv_Seq, v_Ritm_Seq, v_Pnd_Day,
                                  v_Ord_No,    v_Cust_No,  v_Pnd_Amt,  v_Sbs_Amt,
                                  v_Recp_Tp,   v_Recp_Pay, v_Recp_Fg,  v_Pnd_Stat, 
                                  v_Reg_Id,    v_ErrorText 
                                 ) THEN
            v_Return_Message := '선수금 잔액내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;

        END IF;
        
    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtre0037( v_Close_Day, v_Recv_Seq, v_Ritm_Seq, v_Pnd_Day,
                                  v_Ord_No,    v_Cust_No,  v_Pnd_Amt,  v_Sbs_Amt,
                                  v_Recp_Tp,   v_Recp_Pay, v_Recp_Fg,  v_Pnd_Stat,
                                  v_Reg_Id,    v_ErrorText
                                 ) THEN
            v_Return_Message := '선수금 잔액내역 수정 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;


    ELSIF v_Comm_Dvsn = 'D' THEN
    
        IF 0 != f_DeleteRtre0037(
                        v_Close_Day,
                        v_Recv_Seq,
                        v_Ritm_Seq,
                        v_Reg_Id,
                        v_ErrorText ) THEN
            v_Return_Message := '선수금 잔액내역 삭제 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
    
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.p_IUDRtre0037(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.p_IUDRtre0037(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0037;


  /*****************************************************************************
  -- 선수금 잔액내역 집계
  *****************************************************************************/
  PROCEDURE p_Rtre0037PreAccum (
    v_Close_Day      IN RTRE0037.CLOSE_DAY%TYPE,      /*마감기준일자          */
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(Y:재처리)    */
    v_Reg_Id         IN RTRE0037.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre0035 IS
    SELECT  'R' AS JOB_TP,
            A.RECV_SEQ, A.RITM_SEQ, A.PND_DAY, A.ORD_NO, A.CUST_NO,
            A.PND_AMT, A.SBS_AMT, A.RECP_TP, A.RECP_PAY, A.RECP_FG,
            A.PND_STAT
    FROM    RTRE0035 A
    WHERE   A.PND_DAY <= v_Close_Day
    AND     A.PND_STAT IN ('P','R')
    AND     A.ORD_NO NOT IN ( SELECT    B.ORD_NO
                                FROM    RTRE0036 B
                               WHERE SBS_DAY > v_Close_Day
                            )
    UNION 
    SELECT  'S' AS JOB_TP,
            A.RECV_SEQ, A.RITM_SEQ, A.PND_DAY, A.ORD_NO, A.CUST_NO,
            A.PND_AMT, A.SBS_AMT, A.RECP_TP, A.RECP_PAY, A.RECP_FG,
            A.PND_STAT
    FROM    RTRE0035 A
    WHERE   A.PND_DAY <= v_Close_Day
    AND     A.ORD_NO IN ( SELECT    B.ORD_NO
                            FROM    RTRE0036 B
                           WHERE SBS_DAY > v_Close_Day
                        );
                        

    e_Error EXCEPTION;

    v_Recv_Seq   RTRE0037.RECV_SEQ%TYPE DEFAULT NULL;  /*수납거래번호         */
    v_Pnd_Amt    RTRE0037.PND_AMT%TYPE  DEFAULT NULL;  /*선수발생금액         */
    v_Sbs_Amt    RTRE0037.SBS_AMT%TYPE  DEFAULT NULL;  /*선수정리금액         */
    v_Pnd_Stat   RTRE0037.PND_STAT%TYPE DEFAULT NULL;  /*선수금상태           */
    v_Count      NUMBER;
    
  BEGIN

    -- 필수값: 마감기준일자, 등록자 ID
    IF TRIM(v_Close_Day) IS NULL THEN
        v_Return_Message := '마감기준일자('||v_Close_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 재처리가 아니면 기존에 자료가 존재하는 지  check
    IF NVL(v_Comm_Dvsn, 'N') <> 'Y' THEN
        v_Count := 0;
        SELECT  COUNT(*) 
          INTO  v_Count
          FROM  RTRE0037
         WHERE  CLOSE_DAY = v_Close_Day
           AND  ROWNUM = 1;

        IF NVL(v_Count, 0) > 0 THEN
            v_Return_Message := '마감일자 ( '||v_Close_Day||' )는 집계내역이 존재합니다. 처리할 수 없습니다';
            RAISE  e_Error;
        END IF;
                                    
    END IF;
    
    -- 기존자료 삭제
    DELETE 
    FROM    RTRE0037
    WHERE   CLOSE_DAY = v_Close_Day;
    

    -- 선수내역  집계 대상
    FOR CUR_0035 IN Cur_Rtre0035 LOOP
        EXIT WHEN Cur_Rtre0035%NOTFOUND;  

        v_Sbs_Amt := 0;
        IF CUR_0035.JOB_TP = 'S' THEN -- 선수정리건만 처리
        
            -- 마감일이후 정리금액 원복처리
            SELECT  SUM ( SBS_AMT ) 
            INTO    v_Sbs_Amt
            FROM    RTRE0036
            WHERE   RECV_SEQ = CUR_0035.RECV_SEQ
            AND     RITM_SEQ = CUR_0035.RITM_SEQ
            AND     ORD_NO   = CUR_0035.ORD_NO
            AND     SBS_DAY  > v_Close_Day;

        END IF;
        
        v_Sbs_Amt := CUR_0035.SBS_AMT - v_Sbs_Amt;
        
        --20200630 선수금 집계시 마감일 이후 정리금액을 포함 제외하면서 
        --전체선수금에 처리된 선수금을 더하는 구조로 되어 있어 
        --발생금액은 변하지 않게 처리함.
        --v_Pnd_Amt := CUR_0035.PND_AMT + v_Sbs_Amt;
        v_Pnd_Amt := CUR_0035.PND_AMT;
       
        IF v_Pnd_Amt > 0 THEN
            IF  v_Pnd_Amt = CUR_0035.PND_AMT THEN
                v_Pnd_Stat := 'P';  -- 발생
            ELSE
                v_Pnd_Stat := 'R';  -- 부분정리
            END IF;
            
            IF 0 != f_InsertRtre0037( v_Close_Day,       CUR_0035.Recv_Seq, CUR_0035.Ritm_Seq, CUR_0035.Pnd_Day,
                                      CUR_0035.Ord_No,   CUR_0035.Cust_No,  v_Pnd_Amt,         v_Sbs_Amt,
                                      CUR_0035.Recp_Tp,  CUR_0035.Recp_Pay, CUR_0035.Recp_Fg,  v_Pnd_Stat, 
                                      v_Reg_Id,    v_ErrorText 
                                     ) THEN
                v_Return_Message := '선수금 잔액내역 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;            
            
        END IF; 
            
    END LOOP;    
    
    IF Cur_Rtre0035%ISOPEN THEN
        CLOSE Cur_Rtre0035;
    END IF;    
        
        
    v_Success_code := 0;
    v_Return_Message := '정상적으로 집계되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtre0035%ISOPEN THEN
            CLOSE Cur_Rtre0035;
        END IF;    
        
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.p_Rtre0037PreAccum(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.p_Rtre0037PreAccum(2)', v_ErrorText, v_Return_Message);

  END p_Rtre0037PreAccum;


END Pkg_Rtre0037;
/