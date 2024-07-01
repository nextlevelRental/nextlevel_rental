CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0021 AS
/*******************************************************************************
   NAME      Pkg_Rtre0021
   PURPOSE   �� ī�� ���� �̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �� ī�� ���� �̷� Count
  *****************************************************************************/
  FUNCTION f_sRtre0021Count(
    v_Crd_Seq        IN RTRE0021.CRD_SEQ%TYPE,          /*ī�����            */
    v_Useq           IN RTRE0021.USEQ%TYPE              /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0021
    WHERE   CRD_SEQ = v_Crd_Seq
    AND     USEQ    = v_Useq;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0021Count;

  /*****************************************************************************
  -- �� ī�� ���� �̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0021 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Crd_Seq        IN RTRE0021.CRD_SEQ%TYPE         /*ī�����              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CRD_SEQ,                   /*ī�����            */
            A.USEQ,                      /*����                */
            A.CUST_NO,                   /*����ȣ            */
            A.STR_DAY,                   /*��������            */
            A.END_DAY,                   /*��������            */
            A.CUST_NM,                   /*����              */
            A.CUST_TP,                   /*������            */
            A.EBIR_DAY,                  /*�����������(YYMMDD)*/
            A.BUSL_NO,                   /*����ڹ�ȣ          */
            A.CARDCOM_CD,                /*ī����ڵ�          */
            A.CARD_NO,                   /*ī���ȣ            */
            A.EXPIRE_YM,                 /*��ȿ�Ⱓ            */
            A.BKEY_CHK,                  /*ī��Ȯ�λ���        */
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.ACNC_ID,                   /*���������          */
            A.ACNC_DESC,                 /*��������            */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0021 A
    WHERE   A.CRD_SEQ = v_Crd_Seq
    ORDER   BY A.CRD_SEQ, A.USEQ;

  END p_sRtre0021;

  /*****************************************************************************
  -- �� ī�� ���� �̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0021 (
    v_Crd_Seq        IN RTRE0021.CRD_SEQ%TYPE,        /*ī�����              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0021 (
            CRD_SEQ,
            USEQ,
            CUST_NO,
            STR_DAY,
            END_DAY,
            CUST_NM,
            CUST_TP,
            EBIR_DAY,
            BUSL_NO,
            CARDCOM_CD,
            CARD_NO,
            EXPIRE_YM,
            BKEY_CHK,
            BATCH_KEY,
            ACNC_ID,
            ACNC_DESC,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  A.CRD_SEQ,
            NVL((SELECT  MAX(B.USEQ)
                 FROM    RTRE0021 B
                 WHERE   B.CRD_SEQ = A.CRD_SEQ), 1) + 1 USEQ, 
            A.CUST_NO,
            A.STR_DAY,
            A.END_DAY,
            A.CUST_NM,
            A.CUST_TP,
            A.EBIR_DAY,
            A.BUSL_NO,
            A.CARDCOM_CD,
            A.CARD_NO,
            A.EXPIRE_YM,
            A.BKEY_CHK,
            A.BATCH_KEY,
            A.ACNC_ID,
            A.ACNC_DESC,
            A.USE_YN,
            A.REG_ID,
            A.REG_DT,
            A.CHG_ID,
            A.CHG_DT
    FROM    RTRE0020 A
    WHERE   A.CRD_SEQ = v_Crd_Seq;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0021;

END Pkg_Rtre0021;
/
