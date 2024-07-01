CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0110 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0110
   PURPOSE   �������� �̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �������� �̷� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0110Count(
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,          /*����ȣ            */
    v_Seq            IN RTSD0110.SEQ%TYPE               /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0110
    WHERE   CUST_NO = v_Cust_No
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0110Count;

  /*****************************************************************************
  -- �������� �̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0110 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Cert_FDay      IN RTSD0110.CERT_DAY%TYPE,       /*��������FROM          */
    v_Cert_TDay      IN RTSD0110.CERT_DAY%TYPE        /*��������TO            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*����ȣ            */
            A.SEQ,                       /*����                */
            A.CERT_DAY,                  /*��������            */
            A.SAFEKEY,                   /*������ȣ            */
            A.CERT_CD,                   /*�����������        */
            A.CERT_YN,                   /*��������            */
            A.MOB_NO,                    /*�޴�����ȣ          */
            A.MOB_FIRM,                  /*��Ż�              */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0110 A
    WHERE   A.CUST_NO  = v_Cust_No
    AND     A.CERT_DAY BETWEEN v_Cert_FDay AND v_Cert_TDay;

  END p_sRtsd0110;

  /*****************************************************************************
  -- �������� �̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*����                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*��������              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*�����������          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*��������              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0110 (
            CUST_NO,
            SEQ,
            CERT_DAY,
            SAFEKEY,
            CERT_CD,
            CERT_YN,
            MOB_NO,
            MOB_FIRM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Cust_No,
            v_Seq,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
            v_Safekey,
            v_Cert_Cd,
            v_Cert_Yn,
            v_Mob_No,
            v_Mob_Firm,
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

  END f_InsertRtsd0110;

  /*****************************************************************************
  -- �������� �̷� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*����                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*��������              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*�����������          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*��������              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0110
    SET    CERT_DAY = v_Cert_Day,
           SAFEKEY  = v_Safekey,
           CERT_CD  = v_Cert_Cd,
           CERT_YN  = v_Cert_Yn,
           MOB_NO   = v_Mob_No,
           MOB_FIRM = v_Mob_Firm,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  CUST_NO  = v_Cust_No
    AND    SEQ      = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0110;

  /*****************************************************************************
  -- �������� �̷� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0110
    WHERE  CUST_NO = v_Cust_No
    AND    SEQ     = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.f_DeleteRtsd0110(2)', '����ȣ', v_Cust_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.f_DeleteRtsd0110(2)', '����', v_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.f_DeleteRtsd0110(2)', '����� ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0110;

  /*****************************************************************************
  -- �������� �̷� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0110 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Seq            IN OUT RTSD0110.SEQ%TYPE,        /*����                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*��������              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*�����������          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*��������              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����ȣ , �������� , ������ȣ , ����������� , �������� , �޴�����ȣ , ��Ż� , ����� ID
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '����ȣ('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

--    IF 0 != ISDATE(v_Cert_Day) THEN
--        v_Return_Message := '��������('||v_Cert_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
--        RAISE e_Error;
--    END IF;

    IF TRIM(v_Safekey) IS NULL THEN
        v_Return_Message := '������ȣ('||v_Safekey||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cert_Cd) IS NULL THEN
        v_Return_Message := '�����������('||v_Cert_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cert_Yn) IS NULL) OR (TRIM(v_Cert_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '��������('||v_Cert_Yn ||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_No) IS NULL THEN
        v_Return_Message := '�޴�����ȣ('||v_Mob_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_Firm) IS NULL THEN
        v_Return_Message := '��Ż�('||v_Mob_Firm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN


        IF 0 != f_sRtsd0110Count(v_Cust_No, v_Seq) THEN
            v_Return_Message := '�ش� �������� �̷�('||v_Cust_No||'-'||v_Seq||')�� �̹� ��ϵ� �����̹Ƿ� �űԵ��ó���� �Ұ��մϴ�.!';
            RAISE e_Error;
        END IF;

        v_Seq := f_sRtsd0110Seq(v_Cust_No);

        IF 0 != f_InsertRtsd0110(v_Cust_No, v_Seq, v_Cert_Day, v_Safekey,
                                 v_Cert_Cd, v_Cert_Yn, v_Mob_No, v_Mob_Firm,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�������� �̷� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE

        IF 0 = f_sRtsd0110Count(v_Cust_No, v_Seq) THEN
            v_Return_Message := '�ش� �������� �̷�('||v_Cust_No||'-'||v_Seq||')�� ��� �ȵ� �����̹Ƿ� ����/���� ó���� �Ұ��մϴ�.!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0110(v_Cust_No, v_Seq, v_Cert_Day, v_Safekey,
                                     v_Cert_Cd, v_Cert_Yn, v_Mob_No, v_Mob_Firm,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� �̷� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0110(v_Cust_No, v_Seq, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '�������� �̷� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.p_IUDRtsd0110(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.p_IUDRtsd0110(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0110;

  /*****************************************************************************
  -- �������� �̷� - ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0110Seq(
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER IS
    v_Seq RTSD0110.SEQ%TYPE DEFAULT NULL;               /*����                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTSD0110
                 WHERE   CUST_NO = v_Cust_No)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0110Seq;

  /*****************************************************************************
  -- �������� �̷� Select Max Seq
  *****************************************************************************/
  PROCEDURE p_sRtsd0110_MaxSeq (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE         /*����ȣ              */
    ) IS
  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*����ȣ            */
            A.SEQ,                       /*����                */
            A.CERT_DAY,                  /*��������            */
            A.SAFEKEY,                   /*������ȣ            */
            A.CERT_CD,                   /*�����������        */
            A.CERT_YN,                   /*��������            */
            A.MOB_NO,                    /*�޴�����ȣ          */
            A.MOB_FIRM,                  /*��Ż�              */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0110 A
    WHERE   A.CUST_NO = v_Cust_No
    AND     A.SEQ     = (SELECT MAX(SEQ) FROM RTSD0110 WHERE CUST_NO  = v_Cust_No);
    
  END p_sRtsd0110_MaxSeq;

END Pkg_Rtsd0110;
/
