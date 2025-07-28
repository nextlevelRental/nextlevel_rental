CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0011 AS
/*******************************************************************************
   NAME      Pkg_Rtre0011
   PURPOSE   고객 계좌 정보 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 고객 계좌 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtre0011Count(
    v_Acc_Seq        IN RTRE0011.ACC_SEQ%TYPE,          /*계좌순번            */
    v_Useq           IN RTRE0011.USEQ%TYPE              /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0011
    WHERE   ACC_SEQ = v_Acc_Seq
    AND     USEQ    = v_Useq;
    
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0011Count;

  /*****************************************************************************
  -- 고객 계좌 정보 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0011 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acc_Seq        IN RTRE0011.ACC_SEQ%TYPE         /*계좌순번              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACC_SEQ,                   /*계좌순번            */
            A.USEQ,                      /*순번                */
            A.CUST_NO,                   /*고객번호            */
            A.STR_DAY,                   /*시작일자            */
            A.END_DAY,                   /*종료일자            */
            A.CUST_NM,                   /*고객명              */
            A.CUST_TP,                   /*고객유형            */
            A.EBIR_DAY,                  /*법정생년월일(YYMMDD)*/
            A.BUSL_NO,                   /*사업자번호          */
            A.BANK_CD,                   /*은행코드            */
            A.ACCT_NO,                   /*계좌번호            */
            A.ACC_CHK,                   /*계좌확인상태        */
            A.ACNC_ID,                   /*해지사용자          */
            A.ACNC_DESC,                 /*해지사유            */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0011 A
    WHERE   A.ACC_SEQ = v_Acc_Seq
    ORDER   BY A.ACC_SEQ, A.USEQ;

  END p_sRtre0011;

  /*****************************************************************************
  -- 고객 계좌 정보 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0011 (
    v_Acc_Seq        IN RTRE0011.ACC_SEQ%TYPE,        /*계좌순번              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0011 (
            ACC_SEQ,
            USEQ,
            CUST_NO,
            STR_DAY,
            END_DAY,
            CUST_NM,
            CUST_TP,
            EBIR_DAY,
            BUSL_NO,
            BANK_CD,
            ACCT_NO,
            ACC_CHK,
            ACNC_ID,
            ACNC_DESC,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  ACC_SEQ,
            NVL((SELECT  MAX(B.USEQ) 
                 FROM    RTRE0011 B
                 WHERE   B.ACC_SEQ = A.ACC_SEQ), 1)+ 1 USEQ, 
            A.CUST_NO,
            A.STR_DAY,
            A.END_DAY,
            A.CUST_NM,
            A.CUST_TP,
            A.EBIR_DAY,
            A.BUSL_NO,
            A.BANK_CD,
            A.ACCT_NO,
            A.ACC_CHK,
            A.ACNC_ID,
            A.ACNC_DESC,
            A.USE_YN,
            A.REG_ID,
            A.REG_DT,
            A.CHG_ID,
            A.CHG_DT
    FROM    RTRE0010 A
    WHERE   A.ACC_SEQ = v_Acc_Seq;
            
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0011;

END Pkg_Rtre0011;