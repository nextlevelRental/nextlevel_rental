CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0113 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0113
   PURPOSE   ��������(�亯��ȣ) ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��������(�亯��ȣ) Count
  *****************************************************************************/
  FUNCTION f_sRtcs0113Count(
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,        /*�亯��ȣ            */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE        /*�亯����            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0113
    WHERE   ANSWER_NO      = v_Answer_No
    AND     ANSWER_SEQ     = v_Answer_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0113Count;

  /*****************************************************************************
  -- ��������(�亯��ȣ) Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0113 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*��뿩��              */
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*�亯����              */
    v_Score          IN RTCS0113.SCORE%TYPE,          /*����                  */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ANSWER_NO,                 /*�亯��ȣ            */
            A.ANSWER_SEQ,                /*�亯����            */
            A.USE_YN,                    /*��뿩��            */
            A.ANSWER,                    /*�亯����            */
            A.SCORE,                     /*����                */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTCS0113 A
    WHERE   A.ANSWER_NO  = DECODE(v_Answer_No  , NULL, A.ANSWER_NO  , v_Answer_No)
    AND     A.ANSWER_SEQ = DECODE(v_Answer_Seq , NULL, A.ANSWER_SEQ , v_Answer_Seq)
    AND     A.USE_YN     = DECODE(v_Use_Yn     , NULL, A.USE_YN     , v_Use_Yn)
    AND     A.ANSWER     = DECODE(v_Answer     , NULL, A.ANSWER     , v_Answer)
--    AND     (A.SCORE IS NULL OR A.SCORE = v_Score)
    AND   ( A.SCORE     IS NULL OR
            A.SCORE      = DECODE(v_Score      , NULL, A.SCORE      , v_Score))
    AND     A.REG_ID     = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtcs0113;

  /*****************************************************************************
  -- ��������(�亯��ȣ) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0113 (
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*��뿩��              */
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*�亯����              */
    v_Score          IN RTCS0113.SCORE%TYPE,          /*����                  */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0113 (
            ANSWER_NO,
            ANSWER_SEQ,
            USE_YN,
            ANSWER,
            SCORE,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Answer_No,
            v_Answer_Seq,
            v_Use_Yn,
            v_Answer,
            v_Score,
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

  END f_InsertRtcs0113;

  /*****************************************************************************
  -- ��������(�亯��ȣ) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0113 (
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*��뿩��              */
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*�亯����              */
    v_Score          IN RTCS0113.SCORE%TYPE,          /*����                  */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0113
    SET    USE_YN     = v_Use_Yn,
           ANSWER     = v_Answer,
           SCORE      = v_Score,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  ANSWER_NO  = v_Answer_No
    AND    ANSWER_SEQ = v_Answer_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0113;

  /*****************************************************************************
  -- ��������(�亯��ȣ) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0113 (
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0113
    SET    USE_YN     = 'N',
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  ANSWER_NO  = v_Answer_No
    AND    ANSWER_SEQ = v_Answer_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0113;

  /*****************************************************************************
  -- ��������(�亯��ȣ) ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0113 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*��뿩��              */
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*�亯����              */
    v_Score          IN RTCS0113.SCORE%TYPE,          /*����                  */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: �亯��ȣ,�亯����, ��뿩��, ����� ID
    IF (TRIM(v_Answer_No) IS NULL) OR (LENGTH(TRIM(v_Answer_No)) != 3) THEN
        v_Return_Message := '�亯��ȣ('||v_Answer_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Answer_Seq) IS NULL) OR (LENGTH(TRIM(v_Answer_Seq)) != 3) THEN
        v_Return_Message := '�亯����('||v_Answer_Seq||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
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
    
        IF 0 != f_sRtcs0113Count(v_Answer_No, v_Answer_Seq) THEN
            v_Return_Message := '�ش� �亯����('||v_Reg_Id||')�� �̹� ��ϵ� �����̹Ƿ� �űԵ�� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtcs0113(v_Answer_No, v_Answer_Seq, v_Use_Yn, v_Answer, 
                                 v_Score, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��������(�亯��ȣ) ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtcs0113Count(v_Answer_No, v_Answer_Seq) THEN
            v_Return_Message := '�ش� �亯����('||v_Answer_Seq||')�� ��ϵ� ������ �ƴϹǷ� ���� �Ǵ� ���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcs0113(v_Answer_No, v_Answer_Seq, v_Use_Yn, v_Answer, 
                                     v_Score, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '��������(�亯��ȣ) ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcs0113(v_Answer_No, v_Answer_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '��������(�亯��ȣ) ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0113.p_IUDRtcs0113(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0113.p_IUDRtcs0113(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0113;
  
  /*****************************************************************************
  -- �򰡹ݿ�������ȸ
  *****************************************************************************/
  FUNCTION f_sRtcs0113_JS(
    v_Answer_No        IN RTCS0113.ANSWER_NO%TYPE,      /*������ȣ            */
    v_Answer_Seq       IN RTCS0113.ANSWER_SEQ%TYPE      /*������ȣ            */
    ) RETURN NUMBER IS
    v_Score               RTCS0113.SCORE%TYPE;          /*����                */
  BEGIN

    SELECT  SCORE
    INTO    v_Score
    FROM    RTCS0113
    WHERE   ANSWER_NO = v_Answer_No
    AND     ANSWER_SEQ = v_Answer_Seq;
    
    RETURN  v_Score;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcs0113_JS;
  

END Pkg_Rtcs0113;
/
