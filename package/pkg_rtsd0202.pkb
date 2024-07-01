CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0202 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0202
   PURPOSE   ���νſ���ȸ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���νſ���ȸ��� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0202Count(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*������ȣ            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,          /*������              */
    v_Seq            IN RTSD0202.SEQ%TYPE               /*��������            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0202
    WHERE   SAFEKEY = v_Safekey
    AND     CRE_DAY = v_Cre_Day
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0202Count;
  
  
  /*****************************************************************************
  -- ���νſ���ȸ������ϱ��� (Safekey + ������)
  *****************************************************************************/
  FUNCTION f_sRtsd0202TodayCount(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*������ȣ            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE          /*������              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0202
    WHERE   SAFEKEY = v_Safekey
    AND     CRE_DAY = v_Cre_Day;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0202TodayCount;

  /*****************************************************************************
  -- ���νſ���ȸ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0202 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*��������              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*�ſ���              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SAFEKEY,                   /*������ȣ            */
            A.CRE_DAY,                   /*������              */
            A.SEQ,                       /*��������            */
            A.CR_GRADE,                  /*�ſ���            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0202 A
    WHERE   A.SAFEKEY  = DECODE(v_Safekey , NULL, A.SAFEKEY , v_Safekey)
    AND     A.CRE_DAY  = DECODE(v_Cre_Day , NULL, A.CRE_DAY , v_Cre_Day)
    AND     A.SEQ      = DECODE(v_Seq     , NULL, A.SEQ     , v_Seq)
    AND     A.CR_GRADE = DECODE(v_Cr_Grade, NULL, A.CR_GRADE, v_Cr_Grade)
    AND     A.REG_ID   = DECODE(v_Reg_Id  , NULL, A.REG_ID  , v_Reg_Id)
    ORDER   BY SAFEKEY, CRE_DAY, SEQ DESC;

  END p_sRtsd0202;
  
  
  /*****************************************************************************
  -- ���νſ���ȸ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0202TodayExists (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE         /*������                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SAFEKEY,                   /*������ȣ            */
            A.CRE_DAY,                   /*������              */
            A.SEQ,                       /*��������            */
            A.CR_GRADE,                  /*�ſ���            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0202 A
    WHERE   A.SAFEKEY = v_Safekey
    AND     A.CRE_DAY = v_Cre_Day
    AND     ROWNUM    <= 1
    ORDER BY SAFEKEY, CRE_DAY, SEQ DESC;

  END p_sRtsd0202TodayExists;

  /*****************************************************************************
  -- ���νſ���ȸ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*��������              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*�ſ���              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0202 (
            SAFEKEY,
            CRE_DAY,
            SEQ,
            CR_GRADE,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Safekey,
            v_Cre_Day,
            v_Seq,
            v_Cr_Grade,
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

  END f_InsertRtsd0202;

  /*****************************************************************************
  -- ���νſ���ȸ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*��������              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*�ſ���              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0202
    SET    CR_GRADE = v_Cr_Grade,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  SAFEKEY  = v_Safekey
    AND    CRE_DAY  = v_Cre_Day
    AND    SEQ      = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0202;

  /*****************************************************************************
  -- ���νſ���ȸ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*��������              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0202
    WHERE  SAFEKEY  = v_Safekey
    AND    CRE_DAY  = v_Cre_Day
    AND    SEQ      = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', '������ȣ', v_Safekey);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', '������', v_Cre_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', '��������', v_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', '����� ID', v_Reg_Id);
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0202;

  /*****************************************************************************
  -- ���νſ���ȸ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0202 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN OUT RTSD0202.SEQ%TYPE,        /*��������              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*�ſ���              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ������ȣ, ������,�ſ���, ����� ID
    IF TRIM(v_Safekey) IS NULL THEN
        v_Return_Message := '������ȣ('||v_Safekey||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF 0 != ISDATE(v_Cre_Day) THEN
        v_Return_Message := '������('||v_Cre_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cr_Grade) IS NULL THEN
        v_Return_Message := '�ſ���('||v_Cr_Grade||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
        
        v_Seq := f_sRtsd0202Seq(v_Safekey, v_Cre_Day);
        
        IF 0 != f_InsertRtsd0202(v_Safekey, v_Cre_Day, v_Seq, v_Cr_Grade, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���νſ���ȸ��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtsd0202Count(v_Safekey, v_Cre_Day, v_Seq) THEN
            v_Return_Message := '��ϵ� �����Ͱ� �������� �������� ����/���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0202(v_Safekey, v_Cre_Day, v_Seq, v_Cr_Grade, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���νſ���ȸ��� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0202(v_Safekey, v_Cre_Day, v_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���νſ���ȸ��� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0202;

  /*****************************************************************************
  -- ���νſ���ȸ��� - ���� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0202Seq(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*������ȣ            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE           /*������              */
    ) RETURN NUMBER IS
    v_Seq   RTSD0202.SEQ%TYPE DEFAULT NULL;             /*��������            */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ) 
                 FROM    RTSD0202
                 WHERE   SAFEKEY = v_Safekey
                 AND     CRE_DAY = v_Cre_Day)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0202Seq;
  
END Pkg_Rtsd0202;
/
