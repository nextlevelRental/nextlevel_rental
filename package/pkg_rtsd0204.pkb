CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0204 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0204
   PURPOSE   ����ſ���ȸ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����ſ���ȸ��� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0204Count(
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*����ڹ�ȣ          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,          /*������              */
    v_Seq            IN RTSD0204.SEQ%TYPE               /*��������            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0204
    WHERE   BUSL_NO = v_Busl_No
    AND     CRE_DAY = v_Cre_Day
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0204Count;
  
  /*****************************************************************************
  -- ����ſ���ȸ��� Count(����ڹ�ȣ + ����)
  *****************************************************************************/
  PROCEDURE p_sRtsd0204TodayCount(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*����ڹ�ȣ          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE          /*������              */
    ) 
    IS
  BEGIN
    OPEN Ref_Cursor FOR
    
    SELECT  T1.BUSL_NO ,
            T1.CRE_DAY ,
            T1.CO_GRADE
    FROM    RTSD0204 T1
    WHERE   BUSL_NO = v_Busl_No
    AND     CRE_DAY = v_Cre_Day
    AND ROWNUM = 1;


  END p_sRtsd0204TodayCount;
  
 
  /*****************************************************************************
  -- ����ſ���ȸ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0204 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*��������              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*����ſ���          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.BUSL_NO,                   /*����ڹ�ȣ          */
            A.CRE_DAY,                   /*������              */
            A.SEQ,                       /*��������            */
            A.CO_GRADE,                  /*����ſ���        */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0204 A
    WHERE   A.BUSL_NO  = DECODE(v_Busl_No  , NULL, A.BUSL_NO  , v_Busl_No)
    AND     A.CRE_DAY  = DECODE(v_Cre_Day  , NULL, A.CRE_DAY  , v_Cre_Day)
    AND     A.SEQ      = DECODE(v_Seq      , NULL, A.SEQ      , v_Seq)
    AND     A.CO_GRADE = DECODE(v_Co_Grade , NULL, A.CO_GRADE , v_Co_Grade)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtsd0204;

  /*****************************************************************************
  -- ����ſ���ȸ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*��������              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*����ſ���          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0204 (
            BUSL_NO,
            CRE_DAY,
            SEQ,
            CO_GRADE,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Busl_No,
            v_Cre_Day,
            v_Seq,
            v_Co_Grade,
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

  END f_InsertRtsd0204;

  /*****************************************************************************
  -- ����ſ���ȸ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*��������              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*����ſ���          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0204
    SET    CO_GRADE = v_Co_Grade,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  BUSL_NO  = v_Busl_No
    AND    CRE_DAY  = v_Cre_Day
    AND    SEQ      = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0204;

  /*****************************************************************************
  -- ����ſ���ȸ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*��������              */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0204
    WHERE  BUSL_NO  = v_Busl_No
    AND    CRE_DAY  = v_Cre_Day
    AND    SEQ      = v_Seq;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.f_DeleteRtsd0204(1)', '����ڹ�ȣ', v_Busl_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.f_DeleteRtsd0204(1)', '������', v_Cre_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.f_DeleteRtsd0204(1)', '��������', v_Seq);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0204;

  /*****************************************************************************
  -- ����ſ���ȸ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0204 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN OUT RTSD0204.SEQ%TYPE,        /*��������              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*����ſ���          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����ڹ�ȣ,������,����ſ���, ����� ID
    IF TRIM(v_Busl_No) IS NULL THEN
        v_Return_Message := '����ڹ�ȣ('||v_Busl_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Cre_Day) THEN
        v_Return_Message := '������('||v_Cre_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Co_Grade) IS NULL THEN
        v_Return_Message := '����ſ���('||v_Co_Grade||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        v_Seq := f_sRtsd0204Seq(v_Busl_No, v_Cre_Day);
        
        IF 0 != f_InsertRtsd0204(v_Busl_No, v_Cre_Day, v_Seq, v_Co_Grade, 
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '����ſ���ȸ��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
        
    ELSE
    
        IF 0 = f_sRtsd0204Count(v_Busl_No, v_Cre_Day, v_Seq) THEN
            v_Return_Message := '��ϵ� �����Ͱ� �������� �������� ����/���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0204(v_Busl_No, v_Cre_Day, v_Seq, v_Co_Grade, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '����ſ���ȸ��� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0204(v_Busl_No, v_Cre_Day, v_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '����ſ���ȸ��� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.p_IUDRtsd0204(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.p_IUDRtsd0204(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0204;

  /*****************************************************************************
  -- ����ſ���ȸ��� - ���� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0204Seq(
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*����ڹ�ȣ          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE           /*������              */
    ) RETURN NUMBER IS
    v_Seq   RTSD0204.SEQ%TYPE DEFAULT NULL;             /*��������            */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ) 
                 FROM    RTSD0204
                 WHERE   BUSL_NO = v_Busl_No
                 AND     CRE_DAY = v_Cre_Day)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;
    
    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0204Seq;
  
END Pkg_Rtsd0204;
/
