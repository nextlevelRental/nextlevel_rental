CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0101 AS
/*******************************************************************************
   NAME      Pkg_Rtre0101
   PURPOSE   연체대상 세부 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 연체대상 세부 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0101Count(
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,         /*연체기준일자        */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,           /*계약번호            */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,          /*고객번호            */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE          /*청구순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0101
    WHERE   DELY_DAY = v_Dely_Day
    AND     ORD_NO   = v_Ord_No
    AND     CUST_NO  = v_Cust_No
    AND     SCHD_SEQ = v_Schd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0101Count;

  /*****************************************************************************
  -- 연체대상 세부 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0101 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*이체일                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.DELY_DAY,                  /*연체기준일자        */
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
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0101 A
    WHERE   A.DELY_DAY = DECODE(v_Dely_Day , NULL, A.DELY_DAY , v_Dely_Day)
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
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtre0101;

  /*****************************************************************************
  -- 연체 청구세부 내역 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0101Detail (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,        /*연체기준일자         */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,          /*계약번호             */ 
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE          /*고객번호             */    
    ) IS
    
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.DELY_DAY,                                                         /*연체일자자     */
            A.ORD_NO,                                                           /*계약번호       */
            A.CUST_NO,                                                          /*고객번호       */
            Pkg_Rtsd0100.f_sRtsd0100CustName( A.CUST_NO ) AS CUST_NM,           /*고객명         */
            B.RECP_TP,                                                          /*청구구분       */
            Pkg_rtcm0051.f_sRtcm0051CodeName( 'R007', B.RECP_TP ) AS RECP_TP_NM,/*청구구분명     */
            B.RECP_NU,                                                          /*청구순번       */
            B.ZFB_DAY,                                                          /*만기일자       */
            A.SALE_AMT,                                                         /*매출금액       */
            A.ARRE_AMT                                                          /*현재미납금액   */
    FROM    RTRE0101 A, 
            RTSD0109 B    
    WHERE   A.DELY_DAY = v_Dely_Day
    AND     A.ORD_NO   = v_Ord_No
    AND     A.CUST_NO  = v_Cust_No
    AND     B.ORD_NO   = A.ORD_NO    
    AND     B.SCHD_SEQ = A.SCHD_SEQ 
    AND     B.CUST_NO  = A.CUST_NO; 

  END p_sRtre0101Detail;

  /*****************************************************************************
  -- 연체대상 세부 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0101 (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*이체일                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0101 (
            DELY_DAY,
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
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Dely_Day,
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

  END f_InsertRtre0101;

  /*****************************************************************************
  -- 연체대상 세부 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0101 (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*이체일                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0101
    SET    RECP_TP  = v_Recp_Tp,
           RECP_NU  = v_Recp_Nu,
           SALE_AMT = v_Sale_Amt,
           RECP_AMT = v_Recp_Amt,
           ARRE_AMT = v_Arre_Amt,
           PAY_MTHD = v_Pay_Mthd,
           PAY_DD   = v_Pay_Dd,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  DELY_DAY = v_Dely_Day
    AND    ORD_NO   = v_Ord_No
    AND    CUST_NO  = v_Cust_No
    AND    SCHD_SEQ = v_Schd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0101;

  /*****************************************************************************
  -- 연체대상 세부 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0101 (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0101
    WHERE  DELY_DAY = v_Dely_Day
    AND    ORD_NO   = v_Ord_No
    AND    CUST_NO  = v_Cust_No
    AND    SCHD_SEQ = v_Schd_Seq;
        
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0101.f_DeleteRtre0101(1)', '연체기준일자', v_Dely_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0101.f_DeleteRtre0101(1)', '계약번호', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0101.f_DeleteRtre0101(1)', '고객번호', v_Cust_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0101.f_DeleteRtre0101(1)', '청구순번', v_Schd_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0101.f_DeleteRtre0101(1)', '등록자 ID', v_Reg_Id);


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0101;

  /*****************************************************************************
  -- 연체대상 세부 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0101 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0101.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0101.CUST_NO%TYPE,        /*고객번호              */
    v_Schd_Seq       IN RTRE0101.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTRE0101.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTRE0101.RECP_NU%TYPE,        /*청구회차              */
    v_Sale_Amt       IN RTRE0101.SALE_AMT%TYPE,       /*매출금액              */
    v_Recp_Amt       IN RTRE0101.RECP_AMT%TYPE,       /*수납금액              */
    v_Arre_Amt       IN RTRE0101.ARRE_AMT%TYPE,       /*연체금액              */
    v_Pay_Mthd       IN RTRE0101.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTRE0101.PAY_DD%TYPE,         /*이체일                */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
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

    IF 0 = f_sRtre0101Count(v_Dely_Day, v_Ord_No, v_Cust_No, v_Schd_Seq) THEN

        IF 0 != f_InsertRtre0101(v_Dely_Day, v_Ord_No, v_Cust_No, v_Schd_Seq, 
                                 v_Recp_Tp, v_Recp_Nu, v_Sale_Amt, v_Recp_Amt, 
                                 v_Arre_Amt, v_Pay_Mthd, v_Pay_Dd, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := '연체대상 세부 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0101(v_Dely_Day, v_Ord_No, v_Cust_No, v_Schd_Seq, 
                                     v_Recp_Tp, v_Recp_Nu, v_Sale_Amt, v_Recp_Amt, 
                                     v_Arre_Amt, v_Pay_Mthd, v_Pay_Dd, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '연체대상 세부 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0101(v_Dely_Day, v_Ord_No, v_Cust_No, v_Schd_Seq, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '연체대상 세부 내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0101.p_IUDRtre0101(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0101.p_IUDRtre0101(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0101;


  /*****************************************************************************
  -- 연체대상 세부 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0101DelyDayAll (
    v_Dely_Day       IN RTRE0101.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Reg_Id         IN RTRE0101.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0101
    WHERE  DELY_DAY = v_Dely_Day;
        
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0101.f_DeleteRtre0101(1)', '연체기준일자', v_Dely_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0101.f_DeleteRtre0101(1)', '등록자 ID', v_Reg_Id);


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0101DelyDayAll;
  
END Pkg_Rtre0101;