CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0011 AS
/*******************************************************************************
   NAME      Pkg_Rtre0011
   PURPOSE   �� ���� ���� �̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �� ���� ���� �̷� Count
  *****************************************************************************/
  FUNCTION f_sRtre0011Count(
    v_Acc_Seq        IN RTRE0011.ACC_SEQ%TYPE,          /*���¼���            */
    v_Useq           IN RTRE0011.USEQ%TYPE              /*����                */
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
  -- �� ���� ���� �̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0011 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acc_Seq        IN RTRE0011.ACC_SEQ%TYPE         /*���¼���              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACC_SEQ,                   /*���¼���            */
            A.USEQ,                      /*����                */
            A.CUST_NO,                   /*����ȣ            */
            A.STR_DAY,                   /*��������            */
            A.END_DAY,                   /*��������            */
            A.CUST_NM,                   /*����              */
            A.CUST_TP,                   /*������            */
            A.EBIR_DAY,                  /*�����������(YYMMDD)*/
            A.BUSL_NO,                   /*����ڹ�ȣ          */
            A.BANK_CD,                   /*�����ڵ�            */
            A.ACCT_NO,                   /*���¹�ȣ            */
            A.ACC_CHK,                   /*����Ȯ�λ���        */
            A.ACNC_ID,                   /*���������          */
            A.ACNC_DESC,                 /*��������            */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0011 A
    WHERE   A.ACC_SEQ = v_Acc_Seq
    ORDER   BY A.ACC_SEQ, A.USEQ;

  END p_sRtre0011;

  /*****************************************************************************
  -- �� ���� ���� �̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0011 (
    v_Acc_Seq        IN RTRE0011.ACC_SEQ%TYPE,        /*���¼���              */
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
/
