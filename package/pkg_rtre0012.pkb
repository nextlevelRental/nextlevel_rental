CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0012 AS
/*******************************************************************************
   NAME      Pkg_Rtre0012
   PURPOSE   �������� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-20  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �������� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0012Count(
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,        /*�������� ����       */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE         /*�������� ����       */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0012
    WHERE   ACERT_DAY = v_Acert_Day
    AND     ACERT_SEQ = v_Acert_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0012Count;

  /*****************************************************************************
  -- �������� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0012 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*����                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*����Ȯ�λ���          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*��������ڵ�          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*��������޽���        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*������                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*��ȸ��                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACERT_DAY,                 /*�������� ����       */
            A.ACERT_SEQ,                 /*�������� ����       */
            A.BANK_CD,                   /*�����ڵ�            */
            A.ACCT_NO,                   /*���¹�ȣ            */
            A.CUST_TP,                   /*������            */
            A.EBIR_DAY,                  /*�����������(YYMMDD)*/
            A.BUSL_NO,                   /*����ڹ�ȣ          */
            A.ACERT_ID,                  /*������û��          */
            A.CUST_NO,                   /*����ȣ            */
            A.CUST_NM,                   /*����              */
            A.ACERT_CHK,                 /*����Ȯ�λ���        */
            A.ACERT_ERRCD,               /*��������ڵ�        */
            A.ACERT_DESC,                /*��������޽���      */
            A.OWNER_NM,                  /*������              */
            A.CHKCNT,                    /*��ȸ��              */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0012 A
    WHERE   A.ACERT_DAY        = DECODE(v_Acert_Day      , NULL, A.ACERT_DAY       , v_Acert_Day);
--    AND     A.ACERT_SEQ        = DECODE(v_Acert_Seq      , NULL, A.ACERT_SEQ       , v_Acert_Seq)
--    AND     A.BANK_CD          = DECODE(v_Bank_Cd        , NULL, A.BANK_CD         , v_Bank_Cd)
--    AND     A.ACCT_NO          = DECODE(v_Acct_No        , NULL, A.ACCT_NO         , v_Acct_No)
--    AND     A.CUST_TP          = DECODE(v_Cust_Tp        , NULL, A.CUST_TP         , v_Cust_Tp)
--    AND     A.EBIR_DAY         = DECODE(v_Ebir_Day       , NULL, A.EBIR_DAY        , v_Ebir_Day)
--    AND     A.BUSL_NO          = DECODE(v_Busl_No        , NULL, A.BUSL_NO         , v_Busl_No)
--    AND     A.ACERT_ID         = DECODE(v_Acert_Id       , NULL, A.ACERT_ID        , v_Acert_Id)
--    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
--    AND     A.CUST_NM          = DECODE(v_Cust_Nm        , NULL, A.CUST_NM         , v_Cust_Nm)
--    AND     A.ACERT_CHK        = DECODE(v_Acert_Chk      , NULL, A.ACERT_CHK       , v_Acert_Chk)
--    AND     A.ACERT_ERRCD      = DECODE(v_Acert_Errcd    , NULL, A.ACERT_ERRCD     , v_Acert_Errcd)
--    AND     A.ACERT_DESC       = DECODE(v_Acert_Desc     , NULL, A.ACERT_DESC      , v_Acert_Desc)
--    AND     A.OWNER_NM         = DECODE(v_Owner_Nm       , NULL, A.OWNER_NM        , v_Owner_Nm)
--    AND     A.CHKCNT           = DECODE(v_Chkcnt         , NULL, A.CHKCNT          , v_Chkcnt)
--    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre0012;

  /*****************************************************************************
  -- �������� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*����                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*����Ȯ�λ���          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*��������ڵ�          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*��������޽���        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*������                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*��ȸ��                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0012 (
            ACERT_DAY,
            ACERT_SEQ,
            BANK_CD,
            ACCT_NO,
            CUST_TP,
            EBIR_DAY,
            BUSL_NO,
            ACERT_ID,
            CUST_NO,
            CUST_NM,
            ACERT_CHK,
            ACERT_ERRCD,
            ACERT_DESC,
            OWNER_NM,
            CHKCNT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Acert_Day,
            v_Acert_Seq,
            v_Bank_Cd,
            v_Acct_No,
            v_Cust_Tp,
            v_Ebir_Day,
            v_Busl_No,
            v_Acert_Id,
            v_Cust_No,
            v_Cust_Nm,
            v_Acert_Chk,
            v_Acert_Errcd,
            v_Acert_Desc,
            v_Owner_Nm,
            v_Chkcnt,
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

  END f_InsertRtre0012;

  /*****************************************************************************
  -- �������� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*����                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*����Ȯ�λ���          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*��������ڵ�          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*��������޽���        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*������                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*��ȸ��                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0012
    SET    BANK_CD     = v_Bank_Cd,
           ACCT_NO     = v_Acct_No,
           CUST_TP     = v_Cust_Tp,
           EBIR_DAY    = v_Ebir_Day,
           BUSL_NO     = v_Busl_No,
           ACERT_ID    = v_Acert_Id,
           CUST_NO     = v_Cust_No,
           CUST_NM     = v_Cust_Nm,
           ACERT_CHK   = v_Acert_Chk,
           ACERT_ERRCD = v_Acert_Errcd,
           ACERT_DESC  = v_Acert_Desc,
           OWNER_NM    = v_Owner_Nm,
           CHKCNT      = v_Chkcnt,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  ACERT_DAY   = v_Acert_Day
    AND    ACERT_SEQ   = v_Acert_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0012;

  /*****************************************************************************
  -- �������� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0012 (
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0012
    WHERE  ACERT_DAY        = v_Acert_Day
    AND    ACERT_SEQ        = v_Acert_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.f_DeleteRtre0012(1)', '�������� ����', v_Acert_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.f_DeleteRtre0012(1)', '�������� ����', v_Acert_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.f_DeleteRtre0012(1)', '����� ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0012;

  /*****************************************************************************
  -- �������� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0012 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Acert_Seq      IN OUT RTRE0012.ACERT_SEQ%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0012.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0012.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Acert_Id       IN RTRE0012.ACERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0012.CUST_NM%TYPE,        /*����                */
    v_Acert_Chk      IN RTRE0012.ACERT_CHK%TYPE,      /*����Ȯ�λ���          */
    v_Acert_Errcd    IN RTRE0012.ACERT_ERRCD%TYPE,    /*��������ڵ�          */
    v_Acert_Desc     IN RTRE0012.ACERT_DESC%TYPE,     /*��������޽���        */
    v_Owner_Nm       IN RTRE0012.OWNER_NM%TYPE,       /*������                */
    v_Chkcnt         IN RTRE0012.CHKCNT%TYPE,         /*��ȸ��                */
    v_Reg_Id         IN RTRE0012.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:�������� ����, �����ڵ� ,���¹�ȣ ,����ȣ ,���� ,������ ,�����������(YYMMDD) ,����ڹ�ȣ, ����Ȯ�λ���, ��뿩��,  ����� ID
    IF 0 != ISDATE(v_Acert_Day) THEN
        v_Return_Message := '�������� ����('||v_Acct_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Bank_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R001', v_Bank_Cd)) THEN
        v_Return_Message := '�����ڵ�('||v_Bank_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Acct_No) IS NULL THEN
        v_Return_Message := '���¹�ȣ('||v_Acct_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '����ȣ('||v_Cust_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm) IS NULL THEN
        v_Return_Message := '����('||v_Cust_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Acert_Chk) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R012', v_Acert_Chk)) THEN
        v_Return_Message := '����Ȯ�λ���('||v_Acert_Chk||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Cust_Tp)) THEN
        v_Return_Message := '������('||v_Cust_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
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

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Acert_Seq) IS NULL) THEN
        v_Acert_Seq := f_sRtre0012AcertSeq();
    END IF;

    IF 0 = f_sRtre0012Count(v_Acert_Day, v_Acert_Seq) THEN

        IF 0 != f_InsertRtre0012(v_Acert_Day ,v_Acert_Seq ,v_Bank_Cd ,v_Acct_No ,
                                 v_Cust_Tp ,v_Ebir_Day ,v_Busl_No ,v_Acert_Id ,
                                 v_Cust_No ,v_Cust_Nm ,v_Acert_Chk ,v_Acert_Errcd ,
                                 v_Acert_Desc ,v_Owner_Nm ,v_Chkcnt ,v_Reg_Id ,
                                 v_ErrorText) THEN
            v_Return_Message := '�������� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0012(v_Acert_Day ,v_Acert_Seq ,v_Bank_Cd ,v_Acct_No ,
                                     v_Cust_Tp ,v_Ebir_Day ,v_Busl_No ,v_Acert_Id ,
                                     v_Cust_No ,v_Cust_Nm ,v_Acert_Chk ,v_Acert_Errcd ,
                                     v_Acert_Desc ,v_Owner_Nm ,v_Chkcnt ,v_Reg_Id ,
                                     v_ErrorText) THEN
                v_Return_Message := '�������� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0012(v_Acert_Day ,v_Acert_Seq ,v_Reg_Id ,v_ErrorText) THEN
                v_Return_Message := '�������� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.p_IUDRtre0012(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0012.p_IUDRtre0012(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0012;


  /*****************************************************************************
  -- �������� ���� - �������� ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0012AcertSeq RETURN NUMBER IS

    v_Acert_Seq RTRE0012.ACERT_SEQ%TYPE DEFAULT NULL; /*�������� ����         */
  BEGIN

    SELECT  SEQ_RTRE0012ACERT_SEQ.NEXTVAL ACERT_SEQ
    INTO    v_Acert_Seq
    FROM    DUAL;

    RETURN v_Acert_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0012AcertSeq;


  /*****************************************************************************
  -- �������� ���� - Ư���� ���� ���� ���� ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0012AcertChkSeq(
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE         /*���¹�ȣ              */
    ) RETURN NUMBER IS

    v_Acert_Seq RTRE0012.ACERT_SEQ%TYPE DEFAULT NULL; /*�������� ����         */
  BEGIN

    SELECT  ACERT_SEQ
    INTO    v_Acert_Seq
    FROM    RTRE0012
    WHERE   ACERT_DAY = v_Acert_Day
    AND     BANK_CD   = v_Bank_Cd
    AND     ACCT_NO   = v_Acct_No
    AND     ACERT_CHK = 'Y'  /*����Ȯ�λ���(Y,N) */
    AND     ROWNUM    = 1;

    RETURN v_Acert_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0012AcertChkSeq;


  /*****************************************************************************
  -- ���� ��������������ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0012TodayExistsCmsInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Bank_Cd        IN RTRE0012.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0012.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Cust_Tp        IN RTRE0012.CUST_TP%TYPE,        /*������              */
    v_Cust_Serial_No IN VARCHAR2                 /*�����������(YYMMDD), ����ڹ�ȣ  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACERT_ERRCD
    FROM    RTRE0012 A
    WHERE   A.ACERT_DAY        = v_Acert_Day
    AND     A.BANK_CD          = v_Bank_Cd
    AND     A.ACCT_NO          = v_Acct_No
    AND     DECODE (v_Cust_Tp, '01', A.EBIR_DAY, '02', A.BUSL_NO) = v_Cust_Serial_No
    AND     ACERT_CHK = 'Y'
    AND     ROWNUM = 1;

  END p_sRtre0012TodayExistsCmsInfo;

  /*****************************************************************************
  -- ���ϰ��� �������� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0012TodayCmsInfos (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acert_Day      IN RTRE0012.ACERT_DAY%TYPE,      /*�������� ����         */
    v_Cust_No        IN RTRE0012.CUST_NO%TYPE         /*����ȣ              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT ACERT_DAY,                 /*�������� ����       */
           ACERT_SEQ,                 /*�������� ����       */
           BANK_CD,                   /*�����ڵ�            */
           ACCT_NO,                   /*���¹�ȣ            */
           CUST_TP,                   /*������            */
           EBIR_DAY,                  /*�����������(YYMMDD)*/
           BUSL_NO,                   /*����ڹ�ȣ          */
           ACERT_ID,                  /*������û��          */
           CUST_NO,                   /*����ȣ            */
           CUST_NM,                   /*����              */
           ACERT_CHK,                 /*����Ȯ�λ���        */
           ACERT_ERRCD,               /*��������ڵ�        */
           ACERT_DESC,                /*��������޽���      */
           OWNER_NM,                  /*������              */
           CHKCNT,                    /*��ȸ��              */
           REG_ID,                    /*����� ID           */
           REG_DT,                    /*�����              */
           CHG_ID,                    /*������ ID           */
           CHG_DT                     /*������              */
    FROM (
            SELECT  A.ACERT_DAY,                 /*�������� ����       */
                    A.ACERT_SEQ,                 /*�������� ����       */
                    A.BANK_CD,                   /*�����ڵ�            */
                    A.ACCT_NO,                   /*���¹�ȣ            */
                    A.CUST_TP,                   /*������            */
                    A.EBIR_DAY,                  /*�����������(YYMMDD)*/
                    A.BUSL_NO,                   /*����ڹ�ȣ          */
                    A.ACERT_ID,                  /*������û��          */
                    A.CUST_NO,                   /*����ȣ            */
                    A.CUST_NM,                   /*����              */
                    A.ACERT_CHK,                 /*����Ȯ�λ���        */
                    A.ACERT_ERRCD,               /*��������ڵ�        */
                    A.ACERT_DESC,                /*��������޽���      */
                    A.OWNER_NM,                  /*������              */
                    A.CHKCNT,                    /*��ȸ��              */
                    A.REG_ID,                    /*����� ID           */
                    A.REG_DT,                    /*�����              */
                    A.CHG_ID,                    /*������ ID           */
                    A.CHG_DT                     /*������              */
            FROM    RTRE0012 A
            WHERE   1=1
            --AND     A.ACERT_DAY        = DECODE(v_Acert_Day      , NULL, A.ACERT_DAY       , v_Acert_Day)
            AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
            AND     A.ACERT_ERRCD      = '0000'
            ORDER BY A.ACERT_SEQ DESC
        )
    WHERE ROWNUM = 1;

  END p_sRtre0012TodayCmsInfos;
  
END Pkg_Rtre0012;
/
