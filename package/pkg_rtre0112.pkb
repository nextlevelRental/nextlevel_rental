CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0112 AS
/*******************************************************************************
   NAME      Pkg_Rtre0112
   PURPOSE   당월청구 세부 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 당월청구 세부 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0112Count(
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,          /*채권관리년월        */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,           /*계약번호            */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,          /*고객번호            */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE          /*청구순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0112
    WHERE   RAMG_YM  = v_Ramg_Ym
    AND     ORD_NO   = v_Ord_No
    AND     CUST_NO  = v_Cust_No
    AND     SCHD_SEQ = v_Schd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0112Count;

  /*****************************************************************************
  -- 당월청구 세부 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0112 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*이체일                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RAMG_YM,                   /*채권관리년월        */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.SCHD_SEQ,                  /*청구순번            */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_NU,                   /*청구회차            */
            A.SALE_AMT,                  /*매출금액            */
            A.RECP_AMT,                  /*수납금액            */
            A.ARRE_AMT,                  /*연체금액            */
            A.PAY_MTHD,                  /*결제구분            */
            A.PAY_DD,                    /*이체일              */
            A.ZFB_DAY,                   /*만기계산기준일      */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0112 A
    WHERE   A.RAMG_YM  = DECODE(v_Ramg_Ym  , NULL, A.RAMG_YM  , v_Ramg_Ym)
    AND     A.ORD_NO   = DECODE(v_Ord_No   , NULL, A.ORD_NO   , v_Ord_No)
    AND     A.CUST_NO  = DECODE(v_Cust_No  , NULL, A.CUST_NO  , v_Cust_No)
    AND     A.SCHD_SEQ = DECODE(v_Schd_Seq , NULL, A.SCHD_SEQ , v_Schd_Seq)
    AND     A.RECP_TP  = DECODE(v_Recp_Tp  , NULL, A.RECP_TP  , v_Recp_Tp)
    AND     A.RECP_NU  = DECODE(v_Recp_Nu  , NULL, A.RECP_NU  , v_Recp_Nu)
    AND     A.SALE_AMT = DECODE(v_Sale_Amt , NULL, A.SALE_AMT , v_Sale_Amt)
    AND     A.RECP_AMT = DECODE(v_Recp_Amt , NULL, A.RECP_AMT , v_Recp_Amt)
    AND     A.ARRE_AMT = DECODE(v_Arre_Amt , NULL, A.ARRE_AMT , v_Arre_Amt)
    AND     A.PAY_MTHD = DECODE(v_Pay_Mthd , NULL, A.PAY_MTHD , v_Pay_Mthd)
    AND     A.PAY_DD   = DECODE(v_Pay_Dd   , NULL, A.PAY_DD   , v_Pay_Dd)
    AND     A.ZFB_DAY  = DECODE(v_Zfb_Day  , NULL, A.ZFB_DAY  , v_Zfb_Day)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtre0112;

  /*****************************************************************************
  -- 당월청구 세부 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0112 (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*이체일                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0112 (
            RAMG_YM,
            ORD_NO,
            CUST_NO,
            SCHD_SEQ,
            RECP_TP,
            RECP_NU,
            SALE_AMT,
            RECP_AMT,
            ARRE_AMT,
            PAY_MTHD,
            PAY_DD,
            ZFB_DAY,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ramg_Ym,
            v_Ord_No,
            v_Cust_No,
            v_Schd_Seq,
            v_Recp_Tp,
            v_Recp_Nu,
            v_Sale_Amt,
            v_Recp_Amt,
            v_Arre_Amt,
            v_Pay_Mthd,
            v_Pay_Dd,
            v_Zfb_Day,
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

  END f_InsertRtre0112;

  /*****************************************************************************
  -- 당월청구 세부 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0112 (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*이체일                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0112
    SET    RECP_TP  = v_Recp_Tp,
           RECP_NU  = v_Recp_Nu,
           SALE_AMT = v_Sale_Amt,
           RECP_AMT = v_Recp_Amt,
           ARRE_AMT = v_Arre_Amt,
           PAY_MTHD = v_Pay_Mthd,
           PAY_DD   = v_Pay_Dd,
           ZFB_DAY  = v_Zfb_Day,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RAMG_YM  = v_Ramg_Ym
    AND    ORD_NO   = v_Ord_No
    AND    CUST_NO  = v_Cust_No
    AND    SCHD_SEQ = v_Schd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0112;

  /*****************************************************************************
  -- 당월청구 세부 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0112 (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0112
    WHERE  RAMG_YM  = v_Ramg_Ym
    AND    ORD_NO   = v_Ord_No
    AND    CUST_NO  = v_Cust_No
    AND    SCHD_SEQ = v_Schd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0112;

  /*****************************************************************************
  -- 당월청구 세부 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0112 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0112.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0112.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0112.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0112.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0112.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0112.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0112.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0112.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0112.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0112.PAY_DD%TYPE,         /*이체일                */
    v_Zfb_Day        IN RTRE0112.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtre0112Count(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Schd_Seq) THEN

        IF 0 != f_InsertRtre0112(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Schd_Seq, 
                                 v_Recp_Tp, v_Recp_Nu, v_Sale_Amt, v_Recp_Amt, 
                                 v_Arre_Amt, v_Pay_Mthd, v_Pay_Dd, v_Zfb_Day, 
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '당월청구 세부 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0112(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Schd_Seq, 
                                     v_Recp_Tp, v_Recp_Nu, v_Sale_Amt, v_Recp_Amt, 
                                     v_Arre_Amt, v_Pay_Mthd, v_Pay_Dd, v_Zfb_Day, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '당월청구 세부 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0112(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Schd_Seq, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '당월청구 세부 내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0112.p_IUDRtre0112(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0112.p_IUDRtre0112(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0112;

  /*****************************************************************************
  -- 당월청구 세부 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0112Equal (
    v_Ramg_Ym        IN RTRE0112.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Reg_Id         IN RTRE0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0112
    WHERE  RAMG_YM = v_Ramg_Ym;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0112.f_DeleteRtre0112Equal', '채권관리년월', v_Ramg_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0112.f_DeleteRtre0112Equal', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0112Equal;
  
END Pkg_Rtre0112;