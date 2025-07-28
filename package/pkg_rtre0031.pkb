CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0031 AS
/*******************************************************************************
   NAME      Pkg_Rtre0031
   PURPOSE   수납 대상 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 수납 대상 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0031Count(
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,         /*수납거래번호        */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE          /*거래일련번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0031
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     RITM_SEQ = v_Ritm_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0031Count;

  /*****************************************************************************
  -- 수납 대상 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0031 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.RECV_DAY,                  /*수납일자            */
            A.ORD_NO,                    /*계약번호            */
            A.SCHD_SEQ,                  /*스케줄순번          */
            A.CUST_NO,                   /*고객번호            */
            A.RECP_TP,                   /*청구구분            */
            A.SALE_AMT,                  /*매출금액            */
            A.ARRE_AMT,                  /*연체금액            */
            A.ZFBDT,                     /*만기계산기준일      */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0031 A
    WHERE   A.RECV_SEQ = DECODE(v_Recv_Seq , NULL, A.RECV_SEQ , v_Recv_Seq)
    AND     A.RITM_SEQ = DECODE(v_Ritm_Seq , NULL, A.RITM_SEQ , v_Ritm_Seq)
    AND     A.RECV_DAY = DECODE(v_Recv_Day , NULL, A.RECV_DAY , v_Recv_Day)
    AND     A.ORD_NO   = DECODE(v_Ord_No   , NULL, A.ORD_NO   , v_Ord_No)
    AND     A.SCHD_SEQ = DECODE(v_Schd_Seq , NULL, A.SCHD_SEQ , v_Schd_Seq)
    AND     A.CUST_NO  = DECODE(v_Cust_No  , NULL, A.CUST_NO  , v_Cust_No)
    AND     A.RECP_TP  = DECODE(v_Recp_Tp  , NULL, A.RECP_TP  , v_Recp_Tp)
    AND     A.SALE_AMT = DECODE(v_Sale_Amt , NULL, A.SALE_AMT , v_Sale_Amt)
    AND     A.ARRE_AMT = DECODE(v_Arre_Amt , NULL, A.ARRE_AMT , v_Arre_Amt)
    AND     A.ZFBDT    = DECODE(v_Zfbdt    , NULL, A.ZFBDT    , v_Zfbdt)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtre0031;

  /*****************************************************************************
  -- 수납 대상 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0031 (
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0031 (
            RECV_SEQ,
            RITM_SEQ,
            RECV_DAY,
            ORD_NO,
            SCHD_SEQ,
            CUST_NO,
            RECP_TP,
            SALE_AMT,
            ARRE_AMT,
            ZFBDT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Ritm_Seq,
            v_Recv_Day,
            v_Ord_No,
            v_Schd_Seq,
            v_Cust_No,
            v_Recp_Tp,
            v_Sale_Amt,
            v_Arre_Amt,
            v_Zfbdt,
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

  END f_InsertRtre0031;

  /*****************************************************************************
  -- 수납 대상 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0031 (
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0031
    SET    RECV_DAY = v_Recv_Day,
           ORD_NO   = v_Ord_No,
           SCHD_SEQ = v_Schd_Seq,
           CUST_NO  = v_Cust_No,
           RECP_TP  = v_Recp_Tp,
           SALE_AMT = v_Sale_Amt,
           ARRE_AMT = v_Arre_Amt,
           ZFBDT    = v_Zfbdt,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RECV_SEQ = v_Recv_Seq
    AND    RITM_SEQ = v_Ritm_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0031;

  /*****************************************************************************
  -- 수납 대상 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0031 (
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0031
    WHERE  RECV_SEQ = v_Recv_Seq
    AND    RITM_SEQ = v_Ritm_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0031.f_DeleteRtre0031(1)', '수납거래번호', v_Recv_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0031.f_DeleteRtre0031(1)', '거래일련번호', v_Ritm_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0031.f_DeleteRtre0031(1)', '등록자 ID', v_Reg_Id);
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0031;

  /*****************************************************************************
  -- 수납 대상 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0031 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0031.RITM_SEQ%TYPE,       /*거래일련번호          */
    v_Recv_Day       IN RTRE0031.RECV_DAY%TYPE,       /*수납일자              */
    v_Ord_No         IN RTRE0031.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0031.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0031.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0031.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0031.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0031.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0031.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Reg_Id         IN RTRE0031.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 수납거래번호, 수납일자,계약번호, 고객번호, 청구구분, 매출금액, 연체금액, 등록자 ID
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Ritm_Seq) IS NULL THEN
        v_Return_Message := '거래일련번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
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
    
    IF TRIM(v_Recp_Tp) IS NULL THEN
        v_Return_Message := '청구구분('||v_Recp_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Sale_Amt) IS NULL THEN
        v_Return_Message := '매출금액('||v_Sale_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Zfbdt) IS NULL THEN
        v_Return_Message := '연체금액('||v_Zfbdt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN 
    
        IF 0 != f_sRtre0031Count(v_Recv_Seq, v_Ritm_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||'-'||v_Ritm_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;    
        
        IF 0 != f_InsertRtre0031(v_Recv_Seq, v_Ritm_Seq, v_Recv_Day, v_Ord_No, 
                                 v_Schd_Seq, v_Cust_No, v_Recp_Tp, v_Sale_Amt, 
                                 v_Arre_Amt, v_Zfbdt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '수납 대상 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0031Count(v_Recv_Seq, v_Ritm_Seq) THEN
            v_Return_Message := '해당건('||v_Recv_Seq||'-'||v_Ritm_Seq||')으로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;    
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0031(v_Recv_Seq, v_Ritm_Seq, v_Recv_Day, v_Ord_No, 
                                     v_Schd_Seq, v_Cust_No, v_Recp_Tp, v_Sale_Amt, 
                                     v_Arre_Amt, v_Zfbdt, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납 대상 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0031(v_Recv_Seq, v_Ritm_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납 대상 내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0031.p_IUDRtre0031(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0031.p_IUDRtre0031(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0031;


  /*****************************************************************************
  -- 수납 대상 내역 - 거래일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0031RitmSeq(
    v_Recv_Seq       IN RTRE0031.RECV_SEQ%TYPE          /*수납거래번호        */
    ) RETURN NUMBER IS
    v_Ritm_Seq  RTRE0031.RITM_SEQ%TYPE DEFAULT NULL;    /*거래일련번호        */
  BEGIN

    SELECT  NVL((SELECT  MAX(RITM_SEQ)
                 FROM    RTRE0031
                 WHERE   RECV_SEQ = v_Recv_Seq)+ 1, 1) AS RITM_SEQ
    INTO    v_Ritm_Seq
    FROM    DUAL;
    
    RETURN v_Ritm_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0031RitmSeq;


END Pkg_Rtre0031;