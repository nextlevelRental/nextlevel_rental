CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0310 AS
/*******************************************************************************
   NAME      Pkg_Rtre0310
   PURPOSE   청구중지대상등록

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-07-15  kstka         1. Created this package body.
*******************************************************************************

  /*****************************************************************************
  -- 청구중지 대상 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0310 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_FDay     IN RTSD0108.PROC_DAY%TYPE,
    v_Proc_TDay     IN RTSD0108.PROC_DAY%TYPE,
    v_Ord_No         IN RTRE0310.ORD_NO%TYPE
    ) IS

    v_Dely_Day RTRE0100.DELY_DAY%TYPE;
    v_Cnt NUMBER;
  BEGIN

    SELECT MAX(DELY_DAY) 
    INTO v_Dely_Day
    FROM RTRE0100;
    
    --신규건인지 확인
    SELECT COUNT(*) 
    INTO v_Cnt
    FROM RTRE0310
    WHERE ORD_NO = v_Ord_No;
    
    IF v_Cnt = 0 AND v_Proc_FDay IS NULL THEN
    
        OPEN Ref_Cursor FOR
        SELECT B.ORD_NO, 
               NVL(A.SEQ, 0) SEQ,
               C.CUST_NO,
               C.CUST_NM,
               C.MOB_NO,           
               A.APPR_FLAG, 
               Pkg_Rtcm0051.f_sRtcm0051CodeName('R069', A.APPR_FLAG) APPR_DESC, 
               A.USE_YN,
               B.PAY_MTHD, 
               Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', B.PAY_MTHD) PAY_MTHD_NM,
               NVL((SELECT SUM(APPR_AMT) FROM RTRE0100 X WHERE X.DELY_DAY = v_Dely_Day AND X.ORD_NO = B.ORD_NO), 0) APPR_AMT, 
               NVL((SELECT SUM(APPR_SCNT) FROM RTRE0100 X WHERE X.DELY_DAY = v_Dely_Day AND X.ORD_NO = B.ORD_NO), 0) APPR_SCNT,
               TO_CHAR(A.REG_DT, 'YYYYMMDD') REG_DT,
               A.REG_ID
        FROM RTRE0310 A, RTSD0108 B, RTSD0100 C
        WHERE 1=1
        AND A.ORD_NO(+) = B.ORD_NO
        AND B.CUST_NO = C.CUST_NO(+)
        AND (v_Ord_No IS NULL OR B.ORD_NO = v_Ord_No);

    ELSE
    
        OPEN Ref_Cursor FOR
        SELECT B.ORD_NO, 
               NVL(A.SEQ, 0) SEQ,
               C.CUST_NO,
               C.CUST_NM,
               C.MOB_NO,           
               A.APPR_FLAG, 
               Pkg_Rtcm0051.f_sRtcm0051CodeName('R069', A.APPR_FLAG) APPR_DESC, 
               A.USE_YN,
               B.PAY_MTHD, 
               Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', B.PAY_MTHD) PAY_MTHD_NM,
               NVL((SELECT SUM(APPR_AMT) FROM RTRE0100 X WHERE X.DELY_DAY = v_Dely_Day AND X.ORD_NO = B.ORD_NO), 0) APPR_AMT, 
               NVL((SELECT SUM(APPR_SCNT) FROM RTRE0100 X WHERE X.DELY_DAY = v_Dely_Day AND X.ORD_NO = B.ORD_NO), 0) APPR_SCNT,
               TO_CHAR(A.REG_DT, 'YYYYMMDD') REG_DT,
               A.REG_ID
        FROM RTRE0310 A, RTSD0108 B, RTSD0100 C
        WHERE 1=1
        AND A.ORD_NO = B.ORD_NO
        AND B.CUST_NO = C.CUST_NO
        AND (v_Proc_FDay IS NULL OR B.PROC_DAY BETWEEN v_Proc_FDay AND v_Proc_TDay)
        AND (v_Ord_No IS NULL OR B.ORD_NO = v_Ord_No);
        
    END IF;
    
  END p_sRtre0310;

  /*****************************************************************************
  -- 청구중지대상 등록
  *****************************************************************************/
  FUNCTION f_InsertRtre0310 (
    v_Ord_No        IN RTRE0310.ORD_NO%TYPE,       /*연체기준일자          */
    v_Appr_Flag     IN RTRE0310.APPR_FLAG%TYPE,        /*고객번호              */
    v_Use_Yn         IN RTRE0310.USE_YN%TYPE,       /*청구순번              */
    v_Pay_Mthd      IN RTRE0310.PAY_MTHD%TYPE,       /*청구순번              */
    v_Reg_Id          IN RTRE0310.REG_ID%TYPE,       /*청구순번              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
    v_Max_Seq NUMBER;
  BEGIN

    SELECT TO_NUMBER(NVL(MAX(SEQ), 0))
    INTO v_Max_Seq 
    FROM RTRE0310 
    WHERE ORD_NO = v_Ord_No;
    
    INSERT  INTO RTRE0310 (ORD_NO, SEQ, APPR_FLAG,  USE_YN, REG_DT, REG_ID, CHG_DT, CHG_ID, PAY_MTHD)
    VALUES (v_Ord_No, v_Max_Seq + 1, v_Appr_Flag, v_Use_Yn, SYSDATE, v_Reg_Id, SYSDATE, v_Reg_Id, v_Pay_Mthd);    
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0310;

  /*****************************************************************************
  -- 청구중지대상 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0310 (
    v_Ord_No        IN RTRE0310.ORD_NO%TYPE,       /*연체기준일자          */
    v_Seq             IN RTRE0310.SEQ%TYPE,        /*고객번호              */
    v_Appr_Flag     IN RTRE0310.APPR_FLAG%TYPE,        /*고객번호              */
    v_Use_Yn         IN RTRE0310.USE_YN%TYPE,       /*청구순번              */
    v_Pay_Mthd      IN RTRE0310.PAY_MTHD%TYPE,       /*청구순번              */
    v_Reg_Id          IN RTRE0310.REG_ID%TYPE,       /*청구순번              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
  BEGIN
    
    UPDATE  RTRE0310 
    SET APPR_FLAG = v_Appr_Flag
        , USE_YN = v_Use_Yn
        , CHG_DT = SYSDATE
        , CHG_ID = v_Reg_Id
        , PAY_MTHD = v_Pay_Mthd
    WHERE 1=1
    AND ORD_NO = v_Ord_No
    AND SEQ = v_Seq;    
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0310;
  
  /*****************************************************************************
  -- 당월연체내역집계
  *****************************************************************************/
  PROCEDURE p_IUDRtre0310 (
    v_Comm_Dvsn  IN VARCHAR2,
    v_Ord_No        IN RTRE0310.ORD_NO%TYPE,       /*연체기준일자          */
    v_Seq             IN RTRE0310.SEQ%TYPE,        /*고객번호              */
    v_Appr_Flag     IN RTRE0310.APPR_FLAG%TYPE,        /*고객번호              */
    v_Use_Yn         IN RTRE0310.USE_YN%TYPE,       /*청구순번              */
    v_Pay_Mthd      IN RTRE0310.PAY_MTHD%TYPE,       /*청구순번              */
    v_Reg_Id          IN RTRE0310.REG_ID%TYPE,       /*청구순번              */
    v_Success_code    OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
    
        IF v_Comm_Dvsn = 'I' THEN
        
            IF 0 <> f_InsertRtre0310(v_Ord_No, v_Appr_Flag, v_Use_Yn, v_Pay_Mthd, v_Reg_Id, v_ErrorText) THEN
                v_ErrorText := 'Rtre0310 데이터 생성 오류-' || v_ErrorText;
                RAISE e_Error;
            END IF;
        
        ELSIF v_Comm_Dvsn = 'U' THEN
        
            IF 0 <> f_UpdateRtre0310(v_Ord_No, v_Seq, v_Appr_Flag, v_Use_Yn, v_Pay_Mthd, v_Reg_Id, v_ErrorText) THEN
                v_ErrorText := 'Rtre0310 데이터 업데이트 오류-' || v_ErrorText;
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
        v_Return_Message := v_Return_Message || '-' || v_ErrorText;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.') || '-' || v_ErrorText;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        
  END p_IUDRtre0310;
  
END Pkg_Rtre0310;