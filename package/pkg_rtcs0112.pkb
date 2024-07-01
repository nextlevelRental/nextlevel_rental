CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0112 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0112
   PURPOSE   ��������(������ȣ) ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��������(������ȣ) Count
  *****************************************************************************/
  FUNCTION f_sRtcs0112Count(
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE       /*������ȣ            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0112
    WHERE   QUESTION_NO = v_Question_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0112Count;

  /*****************************************************************************
  -- ��������(������ȣ) Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0112 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*��뿩��              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*����                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*�򰡹ݿ�����          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.QUESTION_NO,                                                           /*������ȣ            */
            A.USE_YN,                                                                /*��뿩��            */
            A.QUESTION_TP,                                                           /*��������            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H004', A.QUESTION_TP) QUESTION_TP_NM,  /*��������            */
            A.QUESTION,                                                              /*����                */
            A.CONF_YN,                                                               /*�򰡹ݿ�����        */
            A.ANSWER_NO,                                                             /*�亯��ȣ            */
            B.ANSWER,                                                                /*�亯����            */
            A.REG_ID,                                                                /*����� ID           */
            A.REG_DT,                                                                /*�����              */
            A.CHG_ID,                                                                /*������ ID           */
            A.CHG_DT                                                                 /*������              */
    FROM    RTCS0112 A
            ,RTCS0113 B 
    WHERE   A.ANSWER_NO   = B.ANSWER_NO
    AND     A.QUESTION_NO = DECODE(v_Question_No , NULL, A.QUESTION_NO, v_Question_No)
    AND     A.USE_YN      = DECODE(v_Use_Yn      , NULL, A.USE_YN     , v_Use_Yn)
    AND     A.QUESTION_TP = DECODE(v_Question_Tp , NULL, A.QUESTION_TP, v_Question_Tp)
    AND     A.QUESTION    = DECODE(v_Question    , NULL, A.QUESTION   , v_Question)
    AND     A.CONF_YN     = DECODE(v_Conf_Yn     , NULL, A.CONF_YN    , v_Conf_Yn)
    AND     A.ANSWER_NO   = DECODE(v_Answer_No   , NULL, A.ANSWER_NO  , v_Answer_No)
    AND     A.REG_ID      = DECODE(v_Reg_Id      , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtcs0112;

  /*****************************************************************************
  -- ��������(������ȣ) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*��뿩��              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*����                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*�򰡹ݿ�����          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0112 (
            QUESTION_NO,
            USE_YN,
            QUESTION_TP,
            QUESTION,
            CONF_YN,
            ANSWER_NO,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Question_No,
            v_Use_Yn,
            v_Question_Tp,
            v_Question,
            v_Conf_Yn,
            v_Answer_No,
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

  END f_InsertRtcs0112;

  /*****************************************************************************
  -- ��������(������ȣ) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*��뿩��              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*����                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*�򰡹ݿ�����          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0112
    SET    USE_YN      = v_Use_Yn,
           QUESTION_TP = v_Question_Tp,
           QUESTION    = v_Question,
           CONF_YN     = v_Conf_Yn,
           ANSWER_NO   = v_Answer_No,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE 
    WHERE  QUESTION_NO = v_Question_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0112;

  /*****************************************************************************
  -- ��������(������ȣ) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0112
    SET    USE_YN      = 'N',
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE 
    WHERE  QUESTION_NO = v_Question_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0112;

  /*****************************************************************************
  -- ��������(������ȣ) ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0112 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*��뿩��              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*����                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*�򰡹ݿ�����          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ������ȣ,��뿩��,��������,�򰡹ݿ�����,  ����� ID
    IF (TRIM(v_Question_No) IS NULL) OR (LENGTH(TRIM(v_Question_No)) != 3) THEN
        v_Return_Message := '������ȣ('||v_Question_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Question_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H004', v_Question_Tp)) THEN
        v_Return_Message := '��������('||v_Question_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Conf_Yn) IS NULL) OR (TRIM(v_Conf_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '�򰡹ݿ�����('||v_Conf_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
        
    IF (TRIM(v_Use_Yn) IS NULL) OR (TRIM(v_Use_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_sRtcs0112Count(v_Question_No) THEN
            v_Return_Message := '�ش� ������ȣ('||v_Question_No||')�� �̹� ��ϵ� �����̹Ƿ� �űԵ�� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtcs0112(v_Question_No, v_Use_Yn, v_Question_Tp, v_Question, 
                                 v_Conf_Yn, v_Answer_No, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��������(������ȣ) ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtcs0112Count(v_Question_No) THEN
            v_Return_Message := '�ش� ������ȣ('||v_Question_No||')�� ��ϵ� ������ �ƴϹǷ� ���� �Ǵ� ���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcs0112(v_Question_No, v_Use_Yn, v_Question_Tp, v_Question, 
                                     v_Conf_Yn, v_Answer_No, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '��������(������ȣ) ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcs0112(v_Question_No, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '��������(������ȣ) ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0112.p_IUDRtcs0112(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0112.p_IUDRtcs0112(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0112;

  /*****************************************************************************
  -- �򰡹ݿ�������ȸ
  *****************************************************************************/
  FUNCTION f_sRtcs0112_JSYN(
    v_Question_No        IN RTCS0112.QUESTION_NO%TYPE   /*������ȣ            */
    ) RETURN VARCHAR IS
    v_Conf_Nm        RTCS0112.QUESTION%TYPE;            /*�ݿ�����Y           */
  BEGIN

    SELECT  CONF_YN
    INTO    v_Conf_Nm
    FROM    RTCS0112
    WHERE   QUESTION_NO = v_Question_No;
    
    RETURN  v_Conf_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcs0112_JSYN;

END Pkg_Rtcs0112;
/
