CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0010 AS
/*******************************************************************************
   NAME      Pkg_Rtre0010
   PURPOSE   �� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
   1.1        2017-09-01  wjim             [20170901_01] ���¼��� ȹ�� ����                                        
*******************************************************************************/

  /*****************************************************************************
  -- �� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0010Count(
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE           /*���¼���            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0010
    WHERE   ACC_SEQ = v_Acc_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0010Count;

  /*****************************************************************************
  -- �� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0010 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Str_Day        IN RTRE0010.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE0010.END_DAY%TYPE,        /*��������              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*����Ȯ�λ���          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACC_SEQ,                   /*���¼���            */
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
    FROM    RTRE0010 A
    WHERE   A.ACC_SEQ   = DECODE(v_Acc_Seq   , NULL, A.ACC_SEQ   , v_Acc_Seq)
    AND     A.CUST_NO   = DECODE(v_Cust_No   , NULL, A.CUST_NO   , v_Cust_No)
    AND     A.STR_DAY   = DECODE(v_Str_Day   , NULL, A.STR_DAY   , v_Str_Day)
    AND     A.END_DAY   = DECODE(v_End_Day   , NULL, A.END_DAY   , v_End_Day)
    AND     A.CUST_NM   = DECODE(v_Cust_Nm   , NULL, A.CUST_NM   , v_Cust_Nm)
    AND     A.CUST_TP   = DECODE(v_Cust_Tp   , NULL, A.CUST_TP   , v_Cust_Tp)
    AND     A.EBIR_DAY  = DECODE(v_Ebir_Day  , NULL, A.EBIR_DAY  , v_Ebir_Day)
    AND     A.BUSL_NO   = DECODE(v_Busl_No   , NULL, A.BUSL_NO   , v_Busl_No)
    AND     A.BANK_CD   = DECODE(v_Bank_Cd   , NULL, A.BANK_CD   , v_Bank_Cd)
    AND     A.ACCT_NO   = DECODE(v_Acct_No   , NULL, A.ACCT_NO   , v_Acct_No)
    AND     A.ACC_CHK   = DECODE(v_Acc_Chk   , NULL, A.ACC_CHK   , v_Acc_Chk)
    AND     A.ACNC_ID   = DECODE(v_Acnc_Id   , NULL, A.ACNC_ID   , v_Acnc_Id)
    AND     A.ACNC_DESC = DECODE(v_Acnc_Desc , NULL, A.ACNC_DESC , v_Acnc_Desc)
    AND     A.USE_YN    = DECODE(v_Use_Yn    , NULL, A.USE_YN    , v_Use_Yn)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtre0010;

  /*****************************************************************************
  -- �� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*����Ȯ�λ���          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0010 (
            ACC_SEQ,
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
    VALUES  (
            v_Acc_Seq,
            v_Cust_No,
            TO_CHAR(SYSDATE, 'YYYYMMDD'),
            '99991231',
            v_Cust_Nm,
            v_Cust_Tp,
            v_Ebir_Day,
            v_Busl_No,
            v_Bank_Cd,
            v_Acct_No,
            v_Acc_Chk,
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

  END f_InsertRtre0010;

  /*****************************************************************************
  -- �� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*����Ȯ�λ���          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0010
    SET    CUST_NO   = v_Cust_No,
           END_DAY   = DECODE(v_Use_Yn,'N','99991231',END_DAY),
           CUST_NM   = v_Cust_Nm,
           CUST_TP   = v_Cust_Tp,
           EBIR_DAY  = v_Ebir_Day,
           BUSL_NO   = v_Busl_No,
           BANK_CD   = v_Bank_Cd,
           ACCT_NO   = v_Acct_No,
           ACC_CHK   = v_Acc_Chk,
           ACNC_ID   = v_Acnc_Id,
           ACNC_DESC = v_Acnc_Desc,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACC_SEQ   = v_Acc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0010;

  /*****************************************************************************
  -- �� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0010 (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0010
    SET    ACNC_ID   = v_Acnc_Id,
           ACNC_DESC = v_Acnc_Desc,
           END_DAY   = TO_CHAR(SYSDATE,'YYYYMMDD'),
           USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACC_SEQ   = v_Acc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0010;

  /*****************************************************************************
  -- �� ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0010 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Acc_Seq        IN OUT RTRE0010.ACC_SEQ%TYPE,    /*���¼���              */
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0010.CUST_NM%TYPE,        /*����                */
    v_Cust_Tp        IN RTRE0010.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0010.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0010.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE,        /*���¹�ȣ              */
    v_Acc_Chk        IN RTRE0010.ACC_CHK%TYPE,        /*����Ȯ�λ���          */
    v_Acnc_Id        IN RTRE0010.ACNC_ID%TYPE,        /*���������            */
    v_Acnc_Desc      IN RTRE0010.ACNC_DESC%TYPE,      /*��������              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Acc_Seqo  RTRE0010.ACC_SEQ%TYPE DEFAULT NULL;   /*���¼���              */

  BEGIN

    -- �ʼ���:�����ڵ� ,���¹�ȣ ,����ȣ ,���� ,������ ,�����������(YYMMDD) ,����ڹ�ȣ, ����Ȯ�λ���, ��뿩��,  ����� ID
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

    IF (TRIM(v_Acc_Chk) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R012', v_Acc_Chk)) THEN
        v_Return_Message := '����Ȯ�λ���('||v_Acc_Chk||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
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

    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtre0010Count(v_Acc_Seq) THEN
            v_Return_Message := '�ش� �������ڵ�('||v_Acc_Seq||')�� �̹� ��ϵ� �����Ͱ� �������� �űԵ���� �Ұ��մϴ�.!';
            RAISE e_Error;
        END IF;

        -- �ű� ����ε�, ���� ��/����/���°� �����ϸ�, ����ó��
        IF 0 != Pkg_Rtre0010.f_sRtre0010CountAcctNo(v_Cust_No, v_Bank_Cd, v_Acct_No) THEN

            SELECT ACC_SEQ  INTO v_Acc_Seqo
            FROM RTRE0010
            WHERE CUST_NO = v_Cust_No
            AND   BANK_CD = v_Bank_Cd
            AND   ACCT_NO = v_Acct_No
            AND   DECODE( CUST_TP, '01', EBIR_DAY, BUSL_NO ) = DECODE( v_Cust_Tp, '01', v_Ebir_Day, v_Busl_No );

            IF (TRIM(v_Acc_Seqo) IS NULL) THEN

                v_Return_Message := '���ڵ�('||v_Cust_No||') �����ڵ�('||v_Bank_Cd||') ���¹�ȣ('||v_Acct_No||')�� ��ϵ� �����Ͱ� �����մϴ�.Ȯ�� �� ����Ͻñ� �ٶ��ϴ�!';
                RAISE e_Error;
            END IF;
        END IF;

        IF (TRIM(v_Acc_Seqo) IS NULL) THEN

            v_Acc_Seq := f_sRtre0010Seq(v_Cust_No);

            IF 0 != f_InsertRtre0010(v_Acc_Seq, v_Cust_No,
                                     v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                     v_Bank_Cd, v_Acct_No, v_Acc_Chk, v_Acnc_Id,
                                     v_Acnc_Desc, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := ' �� ���� ���� ��� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        ELSE
         v_Acc_Seq := v_Acc_Seqo;
        END IF;

    ELSE

        IF 0 = f_sRtre0010Count(v_Acc_Seq) THEN
            v_Return_Message := '�ش� �������ڵ�('||v_Acc_Seq||')�� ��ϵ� �����Ͱ� �������� ����/������ �Ұ��մϴ�.!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0010(v_Acc_Seq, v_Cust_No,
                                     v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                     v_Bank_Cd, v_Acct_No, v_Acc_Chk, v_Acnc_Id,
                                     v_Acnc_Desc, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := ' �� ���� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0010(v_Acc_Seq, v_Acnc_Id, v_Acnc_Desc, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := ' �� ���� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- ���� �̷� ����
    IF 0 != Pkg_Rtre0011.f_InsertRtre0011(v_Acc_Seq, v_ErrorText) THEN
        v_Return_Message := '�� ���� ���� �̷� ��� ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0010.p_IUDRtre0010(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0010.p_IUDRtre0010(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0010;

  /*****************************************************************************
  -- �� ���� ���� - ����ȣ/�����ڵ�/���¹�ȣ ���� ���¼��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0010AcctNo(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*���¹�ȣ              */
    ) RETURN VARCHAR IS

    v_Acc_Seq   RTRE0010.ACC_SEQ%TYPE DEFAULT NULL;   /*���¼���              */
  BEGIN

    SELECT  ACC_SEQ
    INTO    v_Acc_Seq
    FROM    RTRE0010
    WHERE   CUST_NO = v_Cust_No
    AND     BANK_CD = v_Bank_Cd
    AND     ACCT_NO = v_Acct_No;

    RETURN v_Acc_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0010AcctNo;

  /*****************************************************************************
  -- �� ���� ���� - ����ȣ/�����ڵ�/���¹�ȣ ���� ��뿩�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtre0010UseYn(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*���¹�ȣ              */
    ) RETURN VARCHAR IS

    v_Use_Yn    RTRE0010.USE_YN%TYPE DEFAULT NULL;    /*��뿩��              */
  BEGIN

    SELECT  USE_YN
    INTO    v_Use_Yn
    FROM    RTRE0010
    WHERE   CUST_NO = v_Cust_No
    AND     BANK_CD = v_Bank_Cd
    AND     ACCT_NO = v_Acct_No;

    RETURN v_Use_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0010UseYn;

  /*****************************************************************************
  -- �� ���� ���� - ����ȣ/�����ڵ�/���¹�ȣ ���� ���翩�� üũ
  *****************************************************************************/
  FUNCTION f_sRtre0010CountAcctNo(
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Bank_Cd        IN RTRE0010.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acct_No        IN RTRE0010.ACCT_NO%TYPE         /*���¹�ȣ              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN


    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0010
    WHERE   CUST_NO = v_Cust_No
    AND     BANK_CD = v_Bank_Cd
    AND     ACCT_NO = v_Acct_No;

    RETURN v_curr_cunt;


    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0010CountAcctNo;

  /*****************************************************************************
  -- �� ���� ���� - ���¼��� ȹ��
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-09-01  wjim             [20170901_01] ���¼��� ȹ�� ����
                                           - ����ȣ�� 14�ڸ��� �ƴ� ��� ��ó
  *****************************************************************************/
  FUNCTION f_sRtre0010Seq (
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE         /*����ȣ              */
    ) RETURN VARCHAR IS

    v_Acc_Seq   RTRE0010.ACC_SEQ%TYPE DEFAULT NULL;   /*���¼���              */
  BEGIN

    -- ���¼��� : A + ����ȣ + SEQ(3)    
    SELECT  'A'||LPAD('0',10-LENGTH(v_Cust_No),'0')||v_Cust_No||LPAD(NVL((SELECT  /*+ INDEX_DESC ( RTRE0010 RTRE0010_PK ) */
                                              SUBSTR(ACC_SEQ,LENGTH(ACC_SEQ)-2,3)
                                      FROM    RTRE0010
                                      WHERE   CUST_NO = v_Cust_No
                                      AND     LENGTH(ACC_SEQ) = 14
                                      AND     ROWNUM <= 1) +1, 1),3,'0')
    INTO    v_Acc_Seq
    FROM    DUAL;

--    --[20170901_01]����
--    SELECT  'A'||v_Cust_No||LPAD(NVL((SELECT  /*+ INDEX_DESC ( RTRE0010 RTRE0010_PK ) */
--                                              SUBSTR(ACC_SEQ,12,3)
--                                      FROM    RTRE0010
--                                      WHERE   CUST_NO = v_Cust_No
--                                      AND     ROWNUM <= 1) +1, 1),3,'0')
--    INTO    v_Acc_Seq
--    FROM    DUAL;


    RETURN v_Acc_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0010Seq;


  /*****************************************************************************
  -- �� ���� ���� Select - ����ȣ ���� ���� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtre0010CustNoList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE         /*����ȣ              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACC_SEQ,                   /*���¼���            */
            A.CUST_NO,                   /*����ȣ            */
            A.STR_DAY,                   /*��������            */
            A.END_DAY,                   /*��������            */
            A.CUST_NM,                   /*����(�����ָ�)    */
            A.CUST_TP,                   /*������            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S024', A.CUST_TP) CUST_TP_NM, /*��������     */
            A.EBIR_DAY,                  /*�����������(YYMMDD)*/
            A.BUSL_NO,                   /*����ڹ�ȣ          */
            A.BANK_CD,                   /*�����ڵ�            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001', A.BANK_CD) BANK_NM,    /*�����         */
            A.ACCT_NO,                   /*���¹�ȣ            */
            A.ACC_CHK,                   /*����Ȯ�λ���        */
            A.ACNC_ID,                   /*���������          */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.ACNC_ID) ACNC_NM,              /*��������ڸ�   */
            A.ACNC_DESC,                 /*��������            */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0010 A
    WHERE   A.CUST_NO = v_Cust_No
    ORDER   BY A.ACC_SEQ;

  END p_sRtre0010CustNoList;

  /*****************************************************************************
  -- �� ���� ���� Select - �����¼��� �˾� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0010AccPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0010.CUST_NO%TYPE,        /*����ȣ              */
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE         /*���¼���              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACC_SEQ,                   /*���¼���            */
            A.CUST_NO,                      /*����ȣ            */
            A.BANK_CD,                   /*�����ڵ�            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001', A.BANK_CD) BANK_NM,    /*�����         */
            A.ACCT_NO,                   /*���¹�ȣ            */
            A.CUST_NM,                   /*����              */
            A.CUST_TP,                   /*������            */
            A.EBIR_DAY,                  /*�����������(YYMMDD)*/
            A.BUSL_NO,                   /*����ڹ�ȣ          */
            ACC_CHK                         /*����Ȯ�λ���        */
    FROM    RTRE0010 A
    WHERE   A.CUST_NO = v_Cust_No
    AND     TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN A.STR_DAY AND  A.END_DAY
    AND     (v_Acc_Seq      IS NULL OR A.ACC_SEQ =  v_Acc_Seq)
    AND     A.USE_YN = 'Y'
    ORDER   BY A.ACC_SEQ;

  END p_sRtre0010AccPopup;

  /*****************************************************************************
  -- �� ���� ���� - ������� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0010UseYn (
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE,        /*���¼���              */
    v_Use_Yn         IN RTRE0010.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0010
    SET    USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACC_SEQ   = v_Acc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0010UseYn;

  /*****************************************************************************
  -- �� ���� ���� Bank_Cd
  *****************************************************************************/
  FUNCTION f_sRtre0010BankCd(
    v_Acc_Seq        IN RTRE0010.ACC_SEQ%TYPE           /*���¼���            */
    ) RETURN VARCHAR2 IS

    v_Bank_Cd   RTRE0060.BANK_CD%TYPE DEFAULT NULL;     /*�����ڵ�            */

  BEGIN

    SELECT  BANK_CD
    INTO    v_Bank_Cd
    FROM    RTRE0010
    WHERE   ACC_SEQ = v_Acc_Seq;

    RETURN v_Bank_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0010BankCd;


END Pkg_Rtre0010;
/
