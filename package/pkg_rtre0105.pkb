CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0105 AS
/*******************************************************************************
   NAME      Pkg_Rtre0105
   PURPOSE   당월연체대상 SMS발송처리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-06-16  kstka         1. Created this package body.
*******************************************************************************

  /*****************************************************************************
  -- 당월연체 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0105 (
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DELY_DAY    AS "연체집계일"
             ,  CUST_NO     AS "고객번호"
             ,  CUST_NM     AS "고객명"
             ,  MOB_NO      AS "휴대폰번호"
             ,  ORD_NO      AS "계약번호"
             ,  APPR_AMT_11 AS "연체금액_렌탈료"
             ,  APPR_AMT_01 AS "연체금액_등록비"
             ,  PAY_MTHD    AS "출금방법"
             ,  PAY_DD      AS "정기출금일"
             ,  REQ_DAY     AS "출금기준일"
             ,  REQ_AMT     AS "출금시도금액"
             ,  RECP_AMT    AS "출금액"
             ,  RCER_CD     AS "출금결과코드"
             ,  RCER_NM     AS "출금결과"
             ,  SMS_MSG     AS "SMS내용"
          FROM  RTRE0105
         WHERE  1=1
        ;

  END p_sRtre0105;
  
  /*****************************************************************************
  -- 당월연체내역 count
  *****************************************************************************/
  FUNCTION p_sRtre0105Cnt (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE
    ) RETURN NUMBER IS

    v_Cnt NUMBER;
  BEGIN

    SELECT  COUNT(*)
          INTO v_Cnt
          FROM  RTRE0105
         WHERE  DELY_DAY = v_Dely_Day
        ;
    
    RETURN v_Cnt;
    
  END p_sRtre0105Cnt;

  /*****************************************************************************
  -- 당월연체내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0105 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Rcms_Day     IN RTRE0070.RCMS_DAY%TYPE,         /*계약번호              */
    v_Rcrd_Day      IN RTRE0080.RCRD_DAY%TYPE,        /*고객번호              */
    v_Pay_Dd         IN RTSD0109.SCHD_SEQ%TYPE,       /*청구순번              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0105 
    SELECT  A2.DELY_DAY
             ,  A2.CUST_NO
             ,  B2.CUST_NM
             ,  B2.MOB_NO
             ,  A2.ORD_NO
             ,  A2.APPR_AMT_11
             ,  A2.APPR_AMT_01
             ,  A2.PAY_MTHD
             ,  A2.PAY_DD
             ,  A2.REQ_DAY
             ,  A2.REQ_AMT
             ,  A2.RECP_AMT
             ,  A2.RCER_CD
             ,  DECODE(A2.PAY_MTHD, 'A', C2.CD_NM, D2.CD_NM) AS RCER_NM
             ,  '[넥센타이어] '||B2.CUST_NM||' 고객님, '
                ||SUBSTR(A2.DELY_DAY,1,4)||'년 '||SUBSTR(A2.DELY_DAY,5,2)||'월 '||SUBSTR(A2.DELY_DAY,7,2)||'일 기준 ' 
                ||A2.ORD_NO||' 계약의 렌탈료가 미납중에 있어 안내드리오니 확인부탁드립니다.'
                ||CHR(13)||CHR(10)
                ||'이미 납부 완료 하셨다면 양해바랍니다.'
                ||CHR(13)||CHR(10)
                ||CHR(13)||CHR(10)
                ||'[연체정보]'
                ||CHR(13)||CHR(10)
                ||'연체금액: '||TRIM(TO_CHAR((A2.APPR_AMT_11+A2.APPR_AMT_01), '999,999,999,999'))||'원'
                ||'(렌탈료 : '||A2.APPR_AMT_11||'원, 등록비 : '||A2.APPR_AMT_01||'원)'
                ||CHR(13)||CHR(10)
                ||'연체기준일: '||SUBSTR(A2.DELY_DAY,1,4)||'.'||SUBSTR(A2.DELY_DAY,5,2)||'.'||SUBSTR(A2.DELY_DAY,7,2)
                ||CHR(13)||CHR(10)
                ||CHR(13)||CHR(10)
                ||'렌탈료 연체시 당사 제공 모든 서비스가 중단되오니, 빠른 시일내 미납요금이 납부될 수 있도록 하여주시기 바랍니다.'
                ||CHR(13)||CHR(10)
                ||CHR(13)||CHR(10)
                ||'[문의]'||'1855-0100(평일 09:00 ~ 18:00)' AS SMS_MSG
          FROM  ( 
                    SELECT  A1.DELY_DAY
                         ,  A1.CUST_NO
                         ,  A1.ORD_NO
                         ,  NVL(A1.APPR_AMT, 0) AS APPR_AMT_11
                         ,  NVL(D1.APPR_AMT, 0) AS APPR_AMT_01 
                         ,  A1.PAY_MTHD
                         ,  E1.PAY_DD
                         ,  DECODE(A1.PAY_MTHD, 'A', B1.RCMS_DAY, C1.RCRD_DAY) AS REQ_DAY
                         ,  DECODE(A1.PAY_MTHD, 'A', B1.RCMS_AMT, C1.RCRD_AMT) AS REQ_AMT
                         ,  DECODE(A1.PAY_MTHD, 'A', B1.RECP_AMT, C1.RECP_AMT) AS RECP_AMT
                         ,  DECODE(A1.PAY_MTHD, 'A', B1.RCERCD  , C1.CRERCD  ) AS RCER_CD
                      FROM  RTRE0100 A1
                         ,  RTRE0070 B1
                         ,  RTRE0080 C1
                         ,  RTRE0100 D1
                         ,  RTSD0108 E1
                     WHERE  1=1
                       AND  A1.DELY_DAY    = v_Dely_Day --*연체집계기준일
                       AND  A1.RECP_TP     = '11'
                       AND  A1.APPR_SCNT   = 1                  
                       AND  A1.ORD_NO      = B1.ORD_NO(+)
                       AND  B1.RCMS_DAY(+) = v_Rcms_Day --*출금요청일
                       AND  A1.ORD_NO      = C1.ORD_NO(+)
                       AND  C1.RCRD_DAY(+) = v_Rcrd_Day --*출금요청일
                       AND  A1.DELY_DAY    = D1.DELY_DAY(+)
                       AND  A1.CUST_NO     = D1.CUST_NO(+)
                       AND  A1.ORD_NO      = D1.ORD_NO(+)
                       AND  D1.RECP_TP(+)  = '01'
                       AND  A1.ORD_NO      = E1.ORD_NO
                       AND  E1.PAY_DD     <= v_Pay_Dd  --*연체집계 시점이 아닌 현재시점 기준으로 집계
                ) A2
             ,  RTSD0100 B2
             ,  RTCM0051 C2
             ,  RTCM0051 D2
         WHERE  1=1
           AND  A2.CUST_NO      = B2.CUST_NO(+)
           AND  A2.RCER_CD      = C2.CD(+)
           AND  C2.CD_GRP_CD(+) = 'R003'
           AND  A2.RCER_CD      = D2.CD(+)
           AND  D2.CD_GRP_CD(+) = 'R028'  
        ;
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0105;

  /*****************************************************************************
  -- 연체대상 세부 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0105All(
    v_ErrorText      OUT VARCHAR2
  )  RETURN NUMBER IS
  BEGIN

    DELETE RTRE0105;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0105All;
  
  /*****************************************************************************
  -- 연체대상 특정 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0105(
    v_Ord_No        IN VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  )  RETURN NUMBER IS
  BEGIN

    DELETE RTRE0105
    WHERE ORD_NO = v_Ord_No;

    v_ErrorText := '정상적으로 삭제되었습니다.';
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0105;
  
  /*****************************************************************************
  -- 당월연체내역집계
  *****************************************************************************/
  PROCEDURE p_ProcessRtre0105 (
    v_Dely_Day          IN RTRE0100.DELY_DAY%TYPE,
    v_Rcms_Day        IN RTRE0070.RCMS_DAY%TYPE,
    v_Rcrd_Day         IN RTRE0080.RCRD_DAY%TYPE,
    v_Pay_Dd            IN RTSD0109.PAY_DD%TYPE,
    v_Success_code    OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
    
        IF 0 <>  f_DeleteRtre0105All(v_ErrorText) THEN
            v_ErrorText := 'Rtre0105 테이블 삭제 오류';
            RAISE e_Error;
        END IF;
    
        IF 0 <> f_InsertRtre0105(V_DELY_DAY, V_RCMS_DAY, V_RCRD_DAY, V_PAY_DD, V_ERRORTEXT) THEN
            v_ErrorText := 'Rtre0105 데이터 생성 오류';
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        
  END p_ProcessRtre0105;
  
END Pkg_Rtre0105;