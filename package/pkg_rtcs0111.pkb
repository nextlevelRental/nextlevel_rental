CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0111 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0111
   PURPOSE   ��������(�������_������ȣ) ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-27  jemcarry         1. Created this package body.
   1.1        2019-04-09  wjim             [20190409_01] ���ļ����� �������� ȹ�� ���� ����
*******************************************************************************/

  /*****************************************************************************
  -- ��������(�������_������ȣ) Count
  *****************************************************************************/
  FUNCTION f_sRtcs0111Count(
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,           /*�������            */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE       /*������ȣ            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0111
    WHERE   JOB_TP      = v_Job_Tp
    AND     QUESTION_NO = v_Question_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0111Count;

  /*****************************************************************************
  -- ��������(�������_������ȣ) Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0111 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*�������              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0111.USE_YN%TYPE,         /*��뿩��              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.JOB_TP,                                                                /*�������            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H001', A.JOB_TP) JOB_TP_NM,            /*���������            */
            A.QUESTION_NO,                                                           /*������ȣ            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H004', B.QUESTION_TP) QUESTION_TP_NM,  /*��������            */
            B.QUESTION,                                                              /*��������             */
            A.USE_YN,                                                                /*��뿩��            */
            A.SORT_SEQ,                                                              /*���ļ���            */
            A.REG_ID,                                                                /*����� ID           */
            A.REG_DT,                                                                /*�����              */
            A.CHG_ID,                                                                /*������ ID           */
            A.CHG_DT                                                                 /*������              */
    FROM    RTCS0111 A,
            RTCS0112 B
    WHERE   A.QUESTION_NO = B.QUESTION_NO
    AND     A.JOB_TP      = DECODE(v_Job_Tp      , NULL, A.JOB_TP      , v_Job_Tp)
    AND     A.QUESTION_NO = DECODE(v_Question_No , NULL, A.QUESTION_NO , v_Question_No)
    AND     A.USE_YN      = DECODE(v_Use_Yn      , NULL, A.USE_YN      , v_Use_Yn)
    AND     A.SORT_SEQ    = DECODE(v_Sort_Seq    , NULL, A.SORT_SEQ    , v_Sort_Seq)
    AND     A.REG_ID      = DECODE(v_Reg_Id      , NULL, A.REG_ID      , v_Reg_Id)
    ORDER BY A.JOB_TP, A.SORT_SEQ;

  END p_sRtcs0111;

  /*****************************************************************************
  -- ��������(�������_������ȣ) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0111 (
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*�������              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0111.USE_YN%TYPE,         /*��뿩��              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0111 (
            JOB_TP,
            QUESTION_NO,
            USE_YN,
            SORT_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Job_Tp,
            v_Question_No,
            v_Use_Yn,
            v_Sort_Seq,
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

  END f_InsertRtcs0111;

  /*****************************************************************************
  -- ��������(�������_������ȣ) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0111 (
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*�������              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0111.USE_YN%TYPE,         /*��뿩��              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0111
    SET    USE_YN      = v_Use_Yn,
           SORT_SEQ    = v_Sort_Seq,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  JOB_TP      = v_Job_Tp
    AND    QUESTION_NO = v_Question_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0111;

  /*****************************************************************************
  -- ��������(�������_������ȣ) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0111 (
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*�������              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0111
    SET    USE_YN      = 'N',
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  JOB_TP      = v_Job_Tp
    AND    QUESTION_NO = v_Question_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0111;

  /*****************************************************************************
  -- ��������(�������_������ȣ) ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0111 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*�������              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0111.USE_YN%TYPE,         /*��뿩��              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:�������,������ȣ, ��뿩��,���ļ���, ����� ID
    IF (TRIM(v_Job_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H001', v_Job_Tp)) THEN
        v_Return_Message := '�������('||v_Job_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Question_No) IS NULL) OR (LENGTH(TRIM(v_Question_No)) != 3) THEN
        v_Return_Message := '������ȣ('||v_Question_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Use_Yn) IS NULL) OR (TRIM(v_Use_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Sort_Seq) IS NULL THEN
        v_Return_Message := '���ļ���('||v_Sort_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtcs0111Count(v_Job_Tp, v_Question_No) THEN
            v_Return_Message := '�ش� ������ȣ('||v_Question_No||')�� �̹� ��ϵ� �������̹Ƿ� �űԵ�� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtcs0111(v_Job_Tp, v_Question_No, v_Use_Yn, v_Sort_Seq,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '��������(�������_������ȣ) ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;

    ELSE

        IF 0 = f_sRtcs0111Count(v_Job_Tp, v_Question_No) THEN
            v_Return_Message := '�ش� ������ȣ('||v_Question_No||')�� ��ϵ� �����Ͱ� �ƴϹǷ� ����/���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcs0111(v_Job_Tp, v_Question_No, v_Use_Yn, v_Sort_Seq,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '��������(�������_������ȣ) ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0111(v_Job_Tp, v_Question_No, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '��������(�������_������ȣ) ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0111.p_IUDRtcs0111(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0111.p_IUDRtcs0111(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0111;


  /*****************************************************************************
  -- ��������(�������_������ȣ) - ���ļ����� �������� ȹ��
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2019-04-09  wjim             [20190409_01] ���ļ����� �������� ȹ�� ���� ����
                                           - ���������� ���ļ������ ������� �ʴ� ���� ����
  *****************************************************************************/
  FUNCTION f_sRtcs0111QuestionNo(
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*�������              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE        /*���ļ���              */
    ) RETURN VARCHAR IS
    v_Question_No   RTCS0111.QUESTION_NO%TYPE DEFAULT NULL; /*������ȣ        */
  BEGIN


    SELECT  QUESTION_NO
    INTO    v_Question_No
    FROM    (
--            SELECT  ROWNUM RN, A.QUESTION_NO        --[20190409_01] ����
            SELECT  SORT_SEQ RN, A.QUESTION_NO  --[20190409_01] ����
            FROM    RTCS0111 A,
                    RTCS0112 B
            WHERE   A.JOB_TP      = v_Job_Tp
            AND     A.USE_YN      = 'Y'
            AND     A.QUESTION_NO = B.QUESTION_NO
            AND     B.USE_YN      = 'Y'
            AND     B.QUESTION_TP = v_Question_Tp
            ORDER   BY SORT_SEQ
            )
    WHERE   RN = v_Sort_Seq;

    RETURN TRIM(v_Question_No);

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0111QuestionNo;

/*****************************************************************************
  -- �����ݻ�� �����ݿ����� ���
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0111Reg (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,       /*����ȣ              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0101
    SET OBJECT_JUMSU_01 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_01) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_01,3),SUBSTR(OBJECT_ANS_01,-3))
                           END),
        OBJECT_JUMSU_02 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_02) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_02,3),SUBSTR(OBJECT_ANS_02,-3))
                           END),
        OBJECT_JUMSU_03 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_03) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_03,3),SUBSTR(OBJECT_ANS_03,-3))
                           END),
        OBJECT_JUMSU_04 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_04) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_04,3),SUBSTR(OBJECT_ANS_04,-3))
                           END),
        OBJECT_JUMSU_05 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_05) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_05,3),SUBSTR(OBJECT_ANS_05,-3))
                           END),
        OBJECT_JUMSU_06 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_06) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_06,3),SUBSTR(OBJECT_ANS_06,-3))
                           END),
        OBJECT_JUMSU_07 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_07) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_07,3),SUBSTR(OBJECT_ANS_07,-3))
                           END),
        OBJECT_JUMSU_08 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_08) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_08,3),SUBSTR(OBJECT_ANS_08,-3))
                           END),
        OBJECT_JUMSU_09 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_09) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_09,3),SUBSTR(OBJECT_ANS_09,-3))
                           END),
        OBJECT_JUMSU_10 = (CASE Pkg_Rtcs0112.f_sRtcs0112_JSYN(OBJECT_QUS_10) WHEN '' THEN 0
                                WHEN 'N' THEN 0
                                WHEN 'Y' THEN Pkg_Rtcs0113.f_sRtcs0113_JS(SUBSTR(OBJECT_ANS_10,3),SUBSTR(OBJECT_ANS_10,-3))
                           END)
    WHERE   CALL_NO = v_Call_No;


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;


  END f_UpdateRtcs0111Reg;


END Pkg_Rtcs0111;
/
