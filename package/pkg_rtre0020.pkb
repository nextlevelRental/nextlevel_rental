CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0020 AS
/*******************************************************************************
   NAME      Pkg_Rtre0020
   PURPOSE   �� ī�� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
   1.1        2017-05-04  wjim             [20170504_01] ī����� ȹ�� ����
   1.2        2017-05-18  wjim             [20170518_01] ī����� ȹ�� ����         
*******************************************************************************/

  /*****************************************************************************
  -- �� ī�� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0020Count(
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE           /*ī�����            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0020
    WHERE   CRD_SEQ = v_Crd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0020Count;


  /*****************************************************************************
  -- �� ī�� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0020 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Str_Day        IN RTRE0020.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE0020.END_DAY%TYPE,        /*��������              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CRD_SEQ,                   /*ī�����            */
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
    FROM    RTRE0020 A
    WHERE   A.CRD_SEQ    = DECODE(v_Crd_Seq    , NULL, A.CRD_SEQ    , v_Crd_Seq)
    AND     A.CUST_NO    = DECODE(v_Cust_No    , NULL, A.CUST_NO    , v_Cust_No)
    AND     A.STR_DAY    = DECODE(v_Str_Day    , NULL, A.STR_DAY    , v_Str_Day)
    AND     A.END_DAY    = DECODE(v_End_Day    , NULL, A.END_DAY    , v_End_Day)
    AND     A.CUST_NM    = DECODE(v_Cust_Nm    , NULL, A.CUST_NM    , v_Cust_Nm)
    AND     A.CUST_TP    = DECODE(v_Cust_Tp    , NULL, A.CUST_TP    , v_Cust_Tp)
    AND     A.EBIR_DAY   = DECODE(v_Ebir_Day   , NULL, A.EBIR_DAY   , v_Ebir_Day)
    AND     A.BUSL_NO    = DECODE(v_Busl_No    , NULL, A.BUSL_NO    , v_Busl_No)
    AND     A.CARDCOM_CD = DECODE(v_Cardcom_Cd , NULL, A.CARDCOM_CD , v_Cardcom_Cd)
    AND     A.CARD_NO    = DECODE(v_Card_No    , NULL, A.CARD_NO    , v_Card_No)
    AND     A.EXPIRE_YM  = DECODE(v_Expire_Ym  , NULL, A.EXPIRE_YM  , v_Expire_Ym)
    AND     A.BKEY_CHK   = DECODE(v_Bkey_Chk   , NULL, A.BKEY_CHK   , v_Bkey_Chk)
    AND     A.BATCH_KEY  = DECODE(v_Batch_Key  , NULL, A.BATCH_KEY  , v_Batch_Key)
    AND     A.ACNC_ID    = DECODE(v_Acnc_Id    , NULL, A.ACNC_ID    , v_Acnc_Id)
    AND     A.ACNC_DESC  = DECODE(v_Acnc_Desc  , NULL, A.ACNC_DESC  , v_Acnc_Desc)
    AND     A.USE_YN     = DECODE(v_Use_Yn     , NULL, A.USE_YN     , v_Use_Yn)
    AND     A.REG_ID     = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtre0020;

  /*****************************************************************************
  -- �� ī�� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0020 (
            CRD_SEQ,
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
    VALUES  (
            v_Crd_Seq,
            v_Cust_No,
            TO_CHAR(SYSDATE, 'YYYYMMDD'),
            '99991231',
            v_Cust_Nm,
            v_Cust_Tp,
            v_Ebir_Day,
            v_Busl_No,
            v_Cardcom_Cd,
            v_Card_No,
            v_Expire_Ym,
            v_Bkey_Chk,
            v_Batch_Key,
            v_Acnc_Id,
            v_Acnc_Desc,
            v_Use_Yn,
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

  END f_InsertRtre0020;

  /*****************************************************************************
  -- �� ī�� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*ī�����              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0020
    SET    CUST_NO    = v_Cust_No,
           END_DAY    = DECODE(v_Use_Yn,'N','99991231',END_DAY),
           CUST_NM    = v_Cust_Nm,
           CUST_TP    = v_Cust_Tp,
           EBIR_DAY   = v_Ebir_Day,
           BUSL_NO    = v_Busl_No,
           CARDCOM_CD = v_Cardcom_Cd,
           CARD_NO    = v_Card_No,
           EXPIRE_YM  = v_Expire_Ym,
           BKEY_CHK   = v_Bkey_Chk,
           BATCH_KEY  = v_Batch_Key,
           ACNC_ID    = v_Acnc_Id,
           ACNC_DESC  = v_Acnc_Desc,
           USE_YN     = v_Use_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  CRD_SEQ    = v_Crd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0020;

  /*****************************************************************************
  -- �� ī�� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0020 (
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE,        /*ī�����              */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0020
    SET    ACNC_ID   = v_Acnc_Id,
           ACNC_DESC = v_Acnc_Desc,
           END_DAY   = TO_CHAR(SYSDATE,'YYYYMMDD'),
           USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  CRD_SEQ   = v_Crd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0020;

  /*****************************************************************************
  -- �� ī�� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0020 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Crd_Seq        IN OUT RTRE0020.CRD_SEQ%TYPE,    /*ī�����              */
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0020.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0020.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0020.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0020.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Bkey_Chk       IN RTRE0020.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Batch_Key      IN RTRE0020.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Acnc_Id        IN RTRE0020.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0020.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0020.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0020.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Crd_Seqo  RTRE0020.CRD_SEQ%TYPE DEFAULT NULL;   /*ī�����              */

  BEGIN

    -- �ʼ���: ����ȣ , ���� ,������ ,�����������(YYMMDD) ,����ڹ�ȣ ,ī����ڵ� ,ī���ȣ ,��ȿ�Ⱓ ,ī��Ȯ�λ��� , ��뿩�� ,����� ID
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '����ȣ('||v_Cust_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm) IS NULL THEN
        v_Return_Message := '����('||v_Cust_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Cust_Tp)) THEN
        v_Return_Message := '������('||v_Cust_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cardcom_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R002', v_Cardcom_Cd)) THEN
        v_Return_Message := 'ī����ڵ�('||v_Cardcom_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Card_No) IS NULL THEN
        v_Return_Message := 'ī���ȣ('||v_Card_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Expire_Ym) IS NULL THEN
        v_Return_Message := '��ȿ�Ⱓ('||v_Expire_Ym||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Expire_Ym) < TO_CHAR(SYSDATE,'YYYYMM') THEN
        v_Return_Message := '('||v_Expire_Ym||') �Է��� �� ���� ��ȿ�Ⱓ���� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Bkey_Chk) IS NULL) OR (TRIM(v_Bkey_Chk) NOT IN ('Y','N')) THEN
        v_Return_Message := 'ī��Ȯ�λ���('||v_Bkey_Chk||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- ����(01), �����(02)
    IF TRIM(v_Cust_Tp) = '01' THEN

        IF TRIM(v_Ebir_Day) IS NULL THEN
            v_Return_Message := '�����������(YYMMDD)('||v_Ebir_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
    ELSE
        IF TRIM(v_Busl_No) IS NULL THEN
            v_Return_Message := '����ڹ�ȣ('||v_Busl_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
    END IF;

    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtre0020Count(v_Crd_Seq) THEN
            v_Return_Message := '�ش� ��ī�����('||v_Reg_Id||')�� �̹� ��ϵ� �������̹Ƿ� �űԵ���� �Ұ��մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ű� ����ε�, ���� ī���/ī���ȣ �����ϸ�, ����ó��
        IF Pkg_Rtre0020.f_sRtre0020CrdSeq(v_Cust_No, v_Cardcom_Cd, v_Card_No, v_Expire_Ym) IS NOT NULL THEN

            SELECT CRD_SEQ  INTO v_Crd_Seqo
            FROM RTRE0020
            WHERE CUST_NO    = v_Cust_No
            AND   CARDCOM_CD = v_Cardcom_Cd
            AND   CARD_NO    = v_Card_No
            AND   EXPIRE_YM  = v_Expire_Ym
            AND   DECODE( CUST_TP, '01', EBIR_DAY, BUSL_NO ) = DECODE( v_Cust_Tp, '01', v_Ebir_Day, v_Busl_No );

            IF (TRIM(v_Crd_Seqo) IS NULL) THEN

                v_Return_Message := 'ī����ڵ�('||v_Cardcom_Cd||') ī���ȣ('||v_Card_No||')�� ��ϵ� �����Ͱ� �����մϴ�.Ȯ�� �� ����Ͻñ� �ٶ��ϴ�!';
                RAISE e_Error;
            END IF;
        END IF;


        IF (TRIM(v_Crd_Seqo) IS NULL) THEN
            v_Crd_Seq := f_sRtre0020Seq(v_Cust_No);

            IF 0 != f_InsertRtre0020(v_Crd_Seq, v_Cust_No,
                                     v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                     v_Cardcom_Cd, v_Card_No, v_Expire_Ym, v_Bkey_Chk, v_Batch_Key,
                                     v_Acnc_Id, v_Acnc_Desc, v_Use_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '�� ī�� ���� ��� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;
        ELSE
            v_Crd_Seq := v_Crd_Seqo;
        END IF;

    ELSE

        IF 0 = f_sRtre0020Count(v_Crd_Seq) THEN
            v_Return_Message := '�ش� ��ī�����('||v_Reg_Id||')�� ��ϵ� �����Ͱ� �ƴϹǷ� ����/������ �Ұ��մϴ�!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0020(v_Crd_Seq, v_Cust_No,
                                     v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                     v_Cardcom_Cd, v_Card_No, v_Expire_Ym, v_Bkey_Chk, v_Batch_Key,
                                     v_Acnc_Id, v_Acnc_Desc, v_Use_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '�� ī�� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            -- �ʼ���: ���������, ��������
            IF (TRIM(v_Acnc_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Acnc_Id)) THEN
                v_Return_Message := '���������('||v_Acnc_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;

            IF TRIM(v_Acnc_Desc) IS NULL THEN
                v_Return_Message := '��������('||v_Acnc_Desc||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;

            IF 0 != f_DeleteRtre0020(v_Crd_Seq, v_Acnc_Id, v_Acnc_Desc, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '�� ī�� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- ���� �̷� ����
    IF 0 != Pkg_Rtre0021.f_InsertRtre0021(v_Crd_Seq, v_ErrorText) THEN
        v_Return_Message := '�̷� ��� ����!!!';
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0020.p_IUDRtre0020(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0020.p_IUDRtre0020(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0020;

  /*****************************************************************************
  -- �� ī�� ���� - ����ȣ/ī����ڵ�/ ī���ȣ����/��ȿ�Ⱓ ���翩�� üũ
  *****************************************************************************/
  FUNCTION f_sRtre0020CrdSeq(
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Cardcom_Cd     IN RTRE0020.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0020.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0020.EXPIRE_YM%TYPE       /*��ȿ�Ⱓ              */
    ) RETURN VARCHAR IS
    v_Crd_Seq   RTRE0020.CRD_SEQ%TYPE DEFAULT NULL;   /*ī�����              */
  BEGIN

    SELECT  CRD_SEQ
    INTO    v_Crd_Seq
    FROM    RTRE0020
    WHERE   CUST_NO    = v_Cust_No
    AND     CARDCOM_CD = v_Cardcom_Cd
    AND     CARD_NO    = v_Card_No
    AND     EXPIRE_YM  = v_Expire_Ym;

    RETURN v_Crd_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0020CrdSeq;

  /*****************************************************************************
  -- �� ī�� ���� - ī����� ȹ��
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-05-04  wjim             [20170504_01] ä���� ����
                                           - ����ȣ�� 10�ڸ� �̸�(6�ڸ�)�� ���� ��� ���
   1.2        2017-05-18  wjim             [20170518_01] ����ȣ 123467 ä�� ���� ����
                                           - ä�� 10�ڸ�, 14�ڸ� ȥ�� �� �����߻�                                                                                      
  *****************************************************************************/
  FUNCTION f_sRtre0020Seq (
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE         /*����ȣ              */
    ) RETURN VARCHAR IS

    v_Crd_Seq   RTRE0020.CRD_SEQ%TYPE DEFAULT NULL;   /*ī�����            */
  BEGIN

    -- ī����� : C + ����ȣ + SEQ(3)
    SELECT  'C'||LPAD('0',10-LENGTH(v_Cust_No),'0')||v_Cust_No||LPAD(NVL((SELECT  /*+ INDEX_DESC ( RTRE0020 RTRE0020_PK ) */
                                              SUBSTR(CRD_SEQ,LENGTH(CRD_SEQ)-2,3)
                                      FROM    RTRE0020
                                      WHERE   CUST_NO = v_Cust_No
                                      AND     LENGTH(CRD_SEQ) = 14 --[20170518_01]
                                      AND     ROWNUM <= 1) +1, 1),3,'0')
    INTO    v_Crd_Seq
    FROM    DUAL;
    
--    --[20170504_01]����
--    SELECT  'C'||v_Cust_No||LPAD(NVL((SELECT  /*+ INDEX_DESC ( RTRE0020 RTRE0020_PK ) */
--                                              SUBSTR(CRD_SEQ,12,3)
--                                      FROM    RTRE0020
--                                      WHERE   CUST_NO = v_Cust_No
--                                      AND     ROWNUM <= 1) +1, 1),3,'0')
--    INTO    v_Crd_Seq
--    FROM    DUAL;

    RETURN v_Crd_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0020Seq;

  /*****************************************************************************
  -- �� ī�� ���� Select - ����ȣ ���� ī�� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtre0020CrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE         /*����ȣ              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CRD_SEQ,                   /*ī�����            */
            A.CARDCOM_CD,                /*ī����ڵ�          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002', A.CARDCOM_CD) CARDCOM_NM,    /*ī����         */
            A.CARD_NO,                   /*ī���ȣ            */
            A.EXPIRE_YM,                 /*��ȿ�Ⱓ            */
            A.CUST_NM,                   /*����              */
            A.CUST_TP,                   /*������            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S024', A.CUST_TP) CUST_TP_NM,       /*������         */
            A.EBIR_DAY,                  /*�����������(YYMMDD)*/
            A.BUSL_NO,                   /*����ڹ�ȣ          */
            A.CUST_NO,                   /*����ȣ            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CCUST_NM,                 /*����           */
            A.STR_DAY,                   /*��������            */
            A.END_DAY,                   /*��������            */
            A.BKEY_CHK,                  /*ī��Ȯ�λ���        */
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.ACNC_ID,                   /*���������          */
            A.ACNC_DESC,                 /*��������            */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0020 A
    WHERE   A.CUST_NO = v_Cust_No
    ORDER   BY A.CRD_SEQ;


  END p_sRtre0020CrdList;

  /*****************************************************************************
  -- �� ī�� ���� Select - ��ī�弱�� �˾� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0020CrdPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0020.CUST_NO%TYPE,        /*����ȣ              */
    v_Crd_Seq        IN RTRE0020.CRD_SEQ%TYPE         /*ī�����              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CRD_SEQ,                   /*ī�����            */
            A.CUST_NO,                   /*����ȣ            */
            A.CARDCOM_CD,                /*ī����ڵ�          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002', A.CARDCOM_CD) CARDCOM_NM,    /*ī����         */
            A.CARD_NO,                   /*ī���ȣ            */
            A.EXPIRE_YM,                 /*��ȿ�Ⱓ            */
            A.CUST_NM,                   /*����              */
            A.CUST_TP,                   /*������            */
            A.EBIR_DAY,                  /*�����������(YYMMDD)*/
            A.BUSL_NO,                   /*����ڹ�ȣ          */
            A.BKEY_CHK,                  /*ī��Ȯ�λ���        */
            A.BATCH_KEY                  /*BATCH KEY           */
    FROM    RTRE0020 A
    WHERE   A.CUST_NO = v_Cust_No
    AND     (v_Crd_Seq        IS NULL OR A.CRD_SEQ =  v_Crd_Seq)
    AND     TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN A.STR_DAY AND  A.END_DAY
    AND     A.USE_YN = 'Y'
    ORDER   BY A.CRD_SEQ;

  END p_sRtre0020CrdPopup;

END Pkg_Rtre0020;
/
