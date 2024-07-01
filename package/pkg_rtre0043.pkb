CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0043 AS
/*******************************************************************************
   NAME      Pkg_Rtre0043
   PURPOSE   KCP ���� ��� ���ʳ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-29  jemcarry         1. Created this package body.
   1.1        2017-03-01  wjim             [20170301_01] ����� ������ ������ ���� ����
*******************************************************************************/

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0043Count(
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,        /*üũ����            */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,        /*ȸ��                */
    v_Cseq           IN RTRE0043.CSEQ%TYPE              /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0043
    WHERE   CHECK_DAY = v_Check_Day
    AND     CHECK_SET = v_Check_Set
    AND     CSEQ      = v_Cseq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0043Count;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0043 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Diff_Yn        IN RTRE0043.DIFF_YN%TYPE         /*���̿���              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CHECK_DAY,                 /*üũ����            */
            A.CHECK_SET,                 /*ȸ��                */
            A.CSEQ,                      /*����                */
            A.ORD_NO,                    /*����ȣ            */
            A.CUST_NM,                   /*����              */
            A.RECP_PAY,                  /*�������            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R019', A.RECP_PAY )  RECP_PAY_NM, /*��������� */
            A.BANK_NM,                   /*�����              */
            A.CARDCOM_NM,                /*ī����            */
            A.APP_AMT,                   /*�ŷ��ݾ�            */
            A.ST_DESC,                   /*�ŷ�����            */
            A.APP_DAY,                   /*��������            */
            A.CNC_DAY,                   /*�������            */
            A.PCNC_DAY,                  /*�κ��������        */
            A.TNO,                       /*�ŷ���ȣ            */
            A.APP_DESC,                  /*�ŷ�����            */
            A.CNC_AMT,                   /*��ұݾ�            */
            A.CNCP_AMT,                  /*��Ұ��ɱݾ�        */
            A.RECP_AMT,                  /*����ó���ݾ�        */
            A.DIFF_YN,                   /*���̿���            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R049', A.DIFF_YN )  DIFF_YN_NM   /*���̿��θ� */
    FROM    RTRE0043 A
    WHERE   A.CHECK_DAY = v_Check_Day
    AND     A.CHECK_SET = v_Check_Set
    AND     (v_Diff_Yn IS NULL OR A.DIFF_YN = v_Diff_Yn);

  END p_sRtre0043;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0043 (
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Cseq           IN RTRE0043.CSEQ%TYPE,           /*����                  */
    v_Ord_No         IN RTRE0043.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_Nm        IN RTRE0043.CUST_NM%TYPE,        /*����                */
    v_Recp_Pay       IN RTRE0043.RECP_PAY%TYPE,       /*�������              */
    v_Bank_Nm        IN RTRE0043.BANK_NM%TYPE,        /*�����                */
    v_Cardcom_Nm     IN RTRE0043.CARDCOM_NM%TYPE,     /*ī����              */
    v_App_Amt        IN RTRE0043.APP_AMT%TYPE,        /*�ŷ��ݾ�              */
    v_St_Desc        IN RTRE0043.ST_DESC%TYPE,        /*�ŷ�����              */
    v_App_Day        IN RTRE0043.APP_DAY%TYPE,        /*��������              */
    v_Cnc_Day        IN RTRE0043.CNC_DAY%TYPE,        /*�������              */
    v_Pcnc_Day       IN RTRE0043.PCNC_DAY%TYPE,       /*�κ��������          */
    v_Tno            IN RTRE0043.TNO%TYPE,            /*�ŷ���ȣ              */
    v_App_Desc       IN RTRE0043.APP_DESC%TYPE,       /*�ŷ�����              */
    v_Cnc_Amt        IN RTRE0043.CNC_AMT%TYPE,        /*��ұݾ�              */
    v_Cncp_Amt       IN RTRE0043.CNCP_AMT%TYPE,       /*��Ұ��ɱݾ�          */
    v_Recp_Amt       IN RTRE0043.RECP_AMT%TYPE,       /*����ó���ݾ�          */
    v_Diff_Yn        IN RTRE0043.DIFF_YN%TYPE,        /*���̿���              */
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0043 (
            CHECK_DAY,
            CHECK_SET,
            CSEQ,
            ORD_NO,
            CUST_NM,
            RECP_PAY,
            BANK_NM,
            CARDCOM_NM,
            APP_AMT,
            ST_DESC,
            APP_DAY,
            CNC_DAY,
            PCNC_DAY,
            TNO,
            APP_DESC,
            CNC_AMT,
            CNCP_AMT,
            RECP_AMT,
            DIFF_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Check_Day,
            v_Check_Set,
            v_Cseq,
            v_Ord_No,
            v_Cust_Nm,
            v_Recp_Pay,
            v_Bank_Nm,
            v_Cardcom_Nm,
            v_App_Amt,
            v_St_Desc,
            v_App_Day,
            v_Cnc_Day,
            v_Pcnc_Day,
            v_Tno,
            v_App_Desc,
            v_Cnc_Amt,
            v_Cncp_Amt,
            v_Recp_Amt,
            v_Diff_Yn,
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

  END f_InsertRtre0043;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0043 (
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Cseq           IN RTRE0043.CSEQ%TYPE,           /*����                  */
    v_Ord_No         IN RTRE0043.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_Nm        IN RTRE0043.CUST_NM%TYPE,        /*����                */
    v_Recp_Pay       IN RTRE0043.RECP_PAY%TYPE,       /*�������              */
    v_Bank_Nm        IN RTRE0043.BANK_NM%TYPE,        /*�����                */
    v_Cardcom_Nm     IN RTRE0043.CARDCOM_NM%TYPE,     /*ī����              */
    v_App_Amt        IN RTRE0043.APP_AMT%TYPE,        /*�ŷ��ݾ�              */
    v_St_Desc        IN RTRE0043.ST_DESC%TYPE,        /*�ŷ�����              */
    v_App_Day        IN RTRE0043.APP_DAY%TYPE,        /*��������              */
    v_Cnc_Day        IN RTRE0043.CNC_DAY%TYPE,        /*�������              */
    v_Pcnc_Day       IN RTRE0043.PCNC_DAY%TYPE,       /*�κ��������          */
    v_Tno            IN RTRE0043.TNO%TYPE,            /*�ŷ���ȣ              */
    v_App_Desc       IN RTRE0043.APP_DESC%TYPE,       /*�ŷ�����              */
    v_Cnc_Amt        IN RTRE0043.CNC_AMT%TYPE,        /*��ұݾ�              */
    v_Cncp_Amt       IN RTRE0043.CNCP_AMT%TYPE,       /*��Ұ��ɱݾ�          */
    v_Recp_Amt       IN RTRE0043.RECP_AMT%TYPE,       /*����ó���ݾ�          */
    v_Diff_Yn        IN RTRE0043.DIFF_YN%TYPE,        /*���̿���              */
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0043
    SET    ORD_NO           = v_Ord_No,
           CUST_NM          = v_Cust_Nm,
           RECP_PAY         = v_Recp_Pay,
           BANK_NM          = v_Bank_Nm,
           CARDCOM_NM       = v_Cardcom_Nm,
           APP_AMT          = v_App_Amt,
           ST_DESC          = v_St_Desc,
           APP_DAY          = v_App_Day,
           CNC_DAY          = v_Cnc_Day,
           PCNC_DAY         = v_Pcnc_Day,
           TNO              = v_Tno,
           APP_DESC         = v_App_Desc,
           CNC_AMT          = v_Cnc_Amt,
           CNCP_AMT         = v_Cncp_Amt,
           RECP_AMT         = v_Recp_Amt,
           DIFF_YN          = v_Diff_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  CHECK_DAY        = v_Check_Day
    AND    CHECK_SET        = v_Check_Set
    AND    CSEQ             = v_Cseq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0043;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0043 (
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Cseq           IN RTRE0043.CSEQ%TYPE,           /*����                  */
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0043
    WHERE  CHECK_DAY = v_Check_Day
    AND    CHECK_SET = v_Check_Set
    AND    CSEQ      = v_Cseq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0043.p_IUDRtre0043(2)', 'üũ����', v_Check_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0043.p_IUDRtre0043(2)', 'ȸ��', v_Check_Set);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0043.p_IUDRtre0043(2)', '����', v_Cseq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0043.p_IUDRtre0043(2)', '����� ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0043;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� ����(IUD)
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-01  wjim             [20170301_01] ����� ������ ������ ���� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtre0043 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Dup_Gb         IN CHAR,                         /*�ߺ�����(I,M)         */
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Cseq           IN OUT RTRE0043.CSEQ%TYPE,       /*����                  */
    v_Ord_No         IN RTRE0043.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_Nm        IN RTRE0043.CUST_NM%TYPE,        /*����                */
    v_Recp_Pay       IN RTRE0043.RECP_PAY%TYPE,       /*�������              */
    v_Bank_Nm        IN RTRE0043.BANK_NM%TYPE,        /*�����                */
    v_Cardcom_Nm     IN RTRE0043.CARDCOM_NM%TYPE,     /*ī����              */
    v_App_Amt        IN RTRE0043.APP_AMT%TYPE,        /*�ŷ��ݾ�              */
    v_St_Desc        IN RTRE0043.ST_DESC%TYPE,        /*�ŷ�����              */
    v_App_Day        IN VARCHAR2,                     /*��������              */
    v_Cnc_Day        IN VARCHAR2,                     /*�������              */
    v_Pcnc_Day       IN VARCHAR2,                     /*�κ��������          */
    v_Tno            IN RTRE0043.TNO%TYPE,            /*�ŷ���ȣ              */
    v_App_Desc       IN RTRE0043.APP_DESC%TYPE,       /*�ŷ�����              */
    v_Cncp_Amt       IN RTRE0043.CNCP_AMT%TYPE,       /*��Ұ��ɱݾ�          */
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Recp_Amt  RTRE0043.RECP_AMT%TYPE DEFAULT NULL;  /*����ó���ݾ�          */
    v_Diff_Yn   RTRE0043.DIFF_YN%TYPE DEFAULT NULL;   /*���̿���              */
    v_Cnc_Amt   RTRE0043.CNC_AMT%TYPE;                /*��ұݾ�              */
    v_Dup_Skip  BOOLEAN DEFAULT FALSE;
  BEGIN

    -- �ʼ���:
    IF (TRIM(v_Dup_Gb) IS NULL) OR (TRIM(v_Dup_Gb) NOT IN ('I','M')) THEN
        v_Return_Message := '�ߺ�����('||v_Dup_Gb||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Check_Day) THEN
        v_Return_Message := 'üũ����('||v_Check_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Check_Day) != TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
        v_Return_Message := 'üũ����('||v_Check_Day||')�� ���Ϸθ� ó���� �����մϴ�.!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Check_Set) IS NULL THEN
        v_Return_Message := 'ȸ��('||v_Check_Set||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn IN ('I','U') THEN

        IF TRIM(v_Ord_No) IS NULL THEN
            v_Return_Message := '����ȣ('||v_Ord_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

-- [20170301_01] �� ���� �ּ�ó��
--        IF TRIM(v_Cust_Nm) IS NULL THEN
--            v_Return_Message := '����('||v_Cust_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
--            RAISE e_Error;
--        END IF;

        IF TRIM(v_Recp_Pay) IS NULL THEN
            v_Return_Message := '�������('||v_Recp_Pay||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_App_Amt) IS NULL THEN
            v_Return_Message := '�ŷ��ݾ�('||v_App_Amt||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_App_Day) IS NULL THEN
            v_Return_Message := '��������('||v_App_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Tno) IS NULL THEN
            v_Return_Message := '�ŷ���ȣ('||v_Tno||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Cncp_Amt) IS NULL THEN
            v_Return_Message := '��Ұ��ɱݾ�('||v_Cncp_Amt||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

    END IF;

    IF NVL(v_Cncp_Amt,0) > NVL(v_App_Amt,0) THEN
        v_Return_Message := '��Ұ��ɱݾ�('||v_Cncp_Amt||')�� �ŷ��ݾ�('||v_App_Amt||')���� ũ�Ƿ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- ��ұݾ� ���
    v_Cnc_Amt := NVL(v_App_Amt,0) - NVL(v_Cncp_Amt,0);

    IF v_Comm_Dvsn = 'I' THEN

        -- �ߺ����(I), �ߺ�����(M)
        IF v_Dup_Gb = 'M' THEN

            -- �ߺ����ŷ� �ŷ���ȣ(TNO)�� �������� ������ ������ ������ INSERT ����.
            -- ��, �ŷ��ݾװ� ��Ұ��ɱݾ��� �������� ���� ��쿡�� ó���Ұ�
            -- üũ����, üũȸ���� ������ ���� �� TNO�� �����ϰ�, �ŷ��ݾ�, ��Ұ��ɱݾ��� ������ ��� SKIP
            IF 0 < f_sRtre0043TnoDupCheck(v_Check_Day, v_Check_Set, v_Tno) THEN

                IF 0 < f_sRtre0043TnoValueCheck(v_Check_Day, v_Check_Set, v_Tno, v_App_Amt, v_Cncp_Amt) THEN
                    v_Return_Message := '�ŷ���ȣ('||v_Tno||') ���� ���� ������ �����ϳ�, �ŷ��ݾ� �Ǵ� ��Ұ��ɱݾ��� �������� �������� ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                ELSE
                    v_Dup_Skip := TRUE;
                END IF;

            END IF;

        END IF;

        -- �ߺ� Skip�� �ƴ� ��쿡 �ű� ����
        IF (v_Dup_Skip = FALSE) THEN


            -- ����ȹ��
            v_Cseq := f_sRtre0043Cseq(v_Check_Day, v_Check_Set);

            IF 0 != f_InsertRtre0043(v_Check_Day, v_Check_Set, v_Cseq, v_Ord_No,
                                     nvl(v_Cust_Nm,' '), v_Recp_Pay, v_Bank_Nm, v_Cardcom_Nm,
                                     v_App_Amt, v_St_Desc, TO_DATE(v_App_Day,'YYYY.MM.DD HH24:MI:SS'), TO_DATE(v_Cnc_Day,'YYYY.MM.DD HH24:MI:SS'),
                                     TO_DATE(v_Pcnc_Day,'YYYY.MM.DD'), v_Tno, v_App_Desc, v_Cnc_Amt,
                                     v_Cncp_Amt, v_Recp_Amt, v_Diff_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := 'KCP ���� ��� ���ʳ��� ��� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            -- �ߺ� Skip Log ����
            Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0043.p_IUDRtre0043(Dup Skip)', v_Comm_Dvsn || '-' || v_Dup_Gb || '-'
                                         || v_Check_Day || '-' || v_Check_Set || '-' || v_Cseq || '-' || v_Ord_No || '-'
                                         || v_Cust_Nm || '-' || v_Recp_Pay || '-' || v_Bank_Nm || '-' || v_Cardcom_Nm || '-'
                                         || v_App_Amt || '-' || v_St_Desc || '-' || v_App_Day || '-' || v_Cnc_Day || '-'
                                         || v_Pcnc_Day || '-' || v_Tno || '-' || v_App_Desc || '-' || v_Cnc_Amt || '-'
                                         || v_Cncp_Amt || '-' || v_Reg_Id);
        END IF;


    ELSE

        IF 0 = f_sRtre0043Count(v_Check_Day, v_Check_Set, v_Cseq) THEN
            v_Return_Message := '�ش� KCP ���� ��� ���ʳ���('||v_Check_Day||'-'||v_Check_Set||'-'||v_Cseq||')���� ��ϵ� ������ ���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0043(v_Check_Day, v_Check_Set, v_Cseq, v_Ord_No,
                                     nvl(v_Cust_Nm,' '), v_Recp_Pay, v_Bank_Nm, v_Cardcom_Nm,
                                     v_App_Amt, v_St_Desc, TO_DATE(v_App_Day,'YYYY.MM.DD HH24:MI:SS'), TO_DATE(v_Cnc_Day,'YYYY.MM.DD HH24:MI:SS'),
                                     TO_DATE(v_Pcnc_Day,'YYYY.MM.DD'), v_Tno, v_App_Desc, v_Cnc_Amt,
                                     v_Cncp_Amt, v_Recp_Amt, v_Diff_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := 'KCP ���� ��� ���ʳ��� ���� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0043(v_Check_Day, v_Check_Set, v_Cseq, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := 'KCP ���� ��� ���ʳ��� ���� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;

    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ó���Ǿ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0043.p_IUDRtre0043(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0043.p_IUDRtre0043(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0043;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� - ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0043Cseq(
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,        /*üũ����            */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE         /*ȸ��                */
    ) RETURN NUMBER IS
    v_Cseq  RTRE0043.CSEQ%TYPE;                         /*����                */
  BEGIN


    SELECT  NVL((SELECT  MAX(CSEQ)
                 FROM    RTRE0043
                 WHERE   CHECK_DAY = v_Check_Day
                 AND     CHECK_SET = v_Check_Set)+ 1, 1) AS CSEQ
    INTO    v_Cseq
    FROM    DUAL;

    RETURN v_Cseq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0043Cseq;


  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Select - ȸ�� ȹ��
  *****************************************************************************/
  PROCEDURE p_sRtre0043CheckSet (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE       /*üũ����              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CHECK_SET,                  /*ȸ��                */
            A.CHECK_SET||'ȸ��' AS SET_NM /*ȸ����             */
    FROM    RTRE0043 A
    WHERE   A.CHECK_DAY = v_Check_Day
    GROUP   BY A.CHECK_SET
    ORDER   BY A.CHECK_SET;

  END p_sRtre0043CheckSet;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Count - TNO ���� �ߺ�üũ
  *****************************************************************************/
  FUNCTION f_sRtre0043TnoDupCheck(
    v_Check_Day      IN  RTRE0043.CHECK_DAY%TYPE,     /*üũ����              */
    v_Check_Set      IN  RTRE0043.CHECK_SET%TYPE,     /*ȸ��                  */
    v_Tno            IN  RTRE0043.TNO%TYPE            /*�ŷ���ȣ              */
    ) RETURN NUMBER IS

    v_Dup_Cnt NUMBER; /*�ߺ��Ǽ� */
  BEGIN

    SELECT  COUNT(*)
    INTO    v_Dup_Cnt
    FROM    RTRE0043
    WHERE   CHECK_DAY = v_Check_Day
    AND     CHECK_SET = v_Check_Set
    AND     TNO       = v_Tno;

    RETURN v_Dup_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;


  END f_sRtre0043TnoDupCheck;

  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� Count - TNO ���� �ŷ��ݾװ� ��Ұ��ɱݾ� üũ
  *****************************************************************************/
  FUNCTION f_sRtre0043TnoValueCheck(
    v_Check_Day      IN  RTRE0043.CHECK_DAY%TYPE,     /*üũ����              */
    v_Check_Set      IN  RTRE0043.CHECK_SET%TYPE,     /*ȸ��                  */
    v_Tno            IN  RTRE0043.TNO%TYPE,           /*�ŷ���ȣ              */
    v_App_Amt        IN  RTRE0043.APP_AMT%TYPE,       /*�ŷ��ݾ�              */
    v_Cncp_Amt       IN  RTRE0043.CNCP_AMT%TYPE       /*��Ұ��ɱݾ�          */
    ) RETURN NUMBER IS

    v_Dup_Cnt NUMBER;                      /*�ߺ��Ǽ�              */
  BEGIN

    SELECT  COUNT(*)
    INTO    v_Dup_Cnt
    FROM    RTRE0043
    WHERE   CHECK_DAY = v_Check_Day
    AND     CHECK_SET = v_Check_Set
    AND     TNO       = v_Tno
    AND     (NVL(APP_AMT,0) <> NVL(v_App_Amt,0) OR NVL(CNCP_AMT,0) <> NVL(v_Cncp_Amt,0));
    RETURN v_Dup_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0043TnoValueCheck;


  /*****************************************************************************
  -- KCP ���� ��� ���ʳ��� ���� - KCP �������� üũ
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0043Check (
    v_Check_Day      IN RTRE0043.CHECK_DAY%TYPE,      /*üũ����              */
    v_Check_Set      IN RTRE0043.CHECK_SET%TYPE,      /*ȸ��                  */
    v_Job_Gb         IN CHAR,                         /*ó������(N:�ű�O:����)*/
    v_Reg_Id         IN RTRE0043.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:
    IF (TRIM(v_Job_Gb) IS NULL) OR (TRIM(v_Job_Gb) NOT IN ('N','O')) THEN
        v_Return_Message := 'ó������('||v_Job_Gb||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Check_Day) THEN
        v_Return_Message := 'üũ����('||v_Check_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Check_Set) IS NULL THEN
        v_Return_Message := 'ȸ��('||v_Check_Set||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- ó������ : 'N' : RTRE0043.DIFF_YN ���� NULL�� ������ ó�������.
    -- ó������ : 'O' : RTRE0043.DIFF_YN ���� ������� üũ����, üũȸ���� �����ϴ� ��ü ������ ó�� �����
    -- TNO(�ŷ���ȣ)�� �������� RTRE0041 ���� SUM�� �ݾװ� ��Ұ��ɱݾ�(CNCP_AMT) �� ���Ͽ� ���̰��� Ȯ���Ѵ�.

    UPDATE  RTRE0043 Z
    SET     (Z.RECP_AMT, Z.DIFF_YN, Z.CHG_ID, Z.CHG_DT) =
            (
            SELECT  NVL((SELECT SUM(B.RECP_AMT) FROM RTRE0041 B WHERE B.TNO = A.TNO),0) AS RECP_AMT,
                    DECODE(A.CNCP_AMT, NVL((SELECT SUM(B.RECP_AMT) FROM RTRE0041 B WHERE B.TNO = A.TNO),0), 'N', 'Y') AS DIFF_YN,
                    v_Reg_Id, SYSDATE
            FROM    RTRE0043 A
            WHERE   A.CHECK_DAY = Z.CHECK_DAY
            AND     A.CHECK_SET = Z.CHECK_SET
            AND     A.CSEQ      = Z.CSEQ
            )
    WHERE   Z.CHECK_DAY = v_Check_Day
    AND     Z.CHECK_SET = v_Check_Set
    AND     (v_Job_Gb = 'O' OR (v_Job_Gb = 'N' AND Z.DIFF_YN IS NULL));

    v_Success_code := 0;
    v_Return_Message := '���������� ó���Ǿ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0043.p_UpdateRtre0043Check(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0043.p_UpdateRtre0043Check(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0043Check;

END Pkg_Rtre0043;
/
