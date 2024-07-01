CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0125 AS
/*******************************************************************************
   NAME      Pkg_Rtre0125
   PURPOSE   [RE] �̿�ó�� �������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-16  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [RE] �̿�ó�� �������� Count
  *****************************************************************************/
  FUNCTION f_sRtre0125Count(
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,           /*����ȣ            */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,         /*�̿��׸�            */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE         /*�̿�ȸ��            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0125
    WHERE   ORD_NO         = v_Ord_No
    AND     POSTP_TP       = v_Postp_Tp
    AND     POSTP_SEQ      = v_Postp_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0125Count;

  /*****************************************************************************
  -- [RE] �̿�ó�� �������� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0125 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*�̿�ȸ��              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*�̿�����              */
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*�����              */
    v_Ly_Tpp_Amt     IN RTRE0125.LY_TPP_AMT%TYPE,     /*���⸻ �����         */
    v_Cy_Pp_Amt      IN RTRE0125.CY_PP_AMT%TYPE,      /*��� ó����           */
    v_Cy_Tpp_Amt     IN RTRE0125.CY_TPP_AMT%TYPE,     /*��� �Ѵ����         */
    v_Cm_Pp_Amt      IN RTRE0125.CM_PP_AMT%TYPE,      /*��� ó����           */
    v_Cm_R_Amt       IN RTRE0125.CM_R_AMT%TYPE,       /*��� ��������         */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*����ȣ            */
            A.POSTP_TP,                  /*�̿��׸�            */
            A.POSTP_SEQ,                 /*�̿�ȸ��            */
            A.POSTP_STAT,                /*�̿�����            */
            A.POSTP_YM,                  /*�����            */
            A.LY_TPP_AMT,                /*���⸻ �����       */
            A.CY_PP_AMT,                 /*��� ó����         */
            A.CY_TPP_AMT,                /*��� �Ѵ����       */
            A.CM_PP_AMT,                 /*��� ó����         */
            A.CM_R_AMT,                  /*��� ��������       */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0125 A
    WHERE   A.ORD_NO           = DECODE(v_Ord_No         , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.POSTP_TP         = DECODE(v_Postp_Tp       , NULL, A.POSTP_TP        , v_Postp_Tp)
    AND     A.POSTP_SEQ        = DECODE(v_Postp_Seq      , NULL, A.POSTP_SEQ       , v_Postp_Seq)
    AND     A.POSTP_STAT       = DECODE(v_Postp_Stat     , NULL, A.POSTP_STAT      , v_Postp_Stat)
    AND     A.POSTP_YM         = DECODE(v_Postp_Ym       , NULL, A.POSTP_YM        , v_Postp_Ym)
    AND     A.LY_TPP_AMT       = DECODE(v_Ly_Tpp_Amt     , NULL, A.LY_TPP_AMT      , v_Ly_Tpp_Amt)
    AND     A.CY_PP_AMT        = DECODE(v_Cy_Pp_Amt      , NULL, A.CY_PP_AMT       , v_Cy_Pp_Amt)
    AND     A.CY_TPP_AMT       = DECODE(v_Cy_Tpp_Amt     , NULL, A.CY_TPP_AMT      , v_Cy_Tpp_Amt)
    AND     A.CM_PP_AMT        = DECODE(v_Cm_Pp_Amt      , NULL, A.CM_PP_AMT       , v_Cm_Pp_Amt)
    AND     A.CM_R_AMT         = DECODE(v_Cm_R_Amt       , NULL, A.CM_R_AMT        , v_Cm_R_Amt)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre0125;

  /*****************************************************************************
  -- [RE] �̿�ó�� �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0125 (
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*�̿�ȸ��              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*�̿�����              */
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*�����              */
    v_Ly_Tpp_Amt     IN RTRE0125.LY_TPP_AMT%TYPE,     /*���⸻ �����         */
    v_Cy_Pp_Amt      IN RTRE0125.CY_PP_AMT%TYPE,      /*��� ó����           */
    v_Cy_Tpp_Amt     IN RTRE0125.CY_TPP_AMT%TYPE,     /*��� �Ѵ����         */
    v_Cm_Pp_Amt      IN RTRE0125.CM_PP_AMT%TYPE,      /*��� ó����           */
    v_Cm_R_Amt       IN RTRE0125.CM_R_AMT%TYPE,       /*��� ��������         */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0125 (
            ORD_NO,
            POSTP_TP,
            POSTP_SEQ,
            POSTP_STAT,
            POSTP_YM,
            LY_TPP_AMT,
            CY_PP_AMT,
            CY_TPP_AMT,
            CM_PP_AMT,
            CM_R_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Postp_Tp,
            v_Postp_Seq,
            v_Postp_Stat,
            v_Postp_Ym,
            v_Ly_Tpp_Amt,
            v_Cy_Pp_Amt,
            v_Cy_Tpp_Amt,
            v_Cm_Pp_Amt,
            v_Cm_R_Amt,
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

  END f_InsertRtre0125;

  /*****************************************************************************
  -- [RE] �̿�ó�� �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0125 (
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*�̿�ȸ��              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*�̿�����              */
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*�����              */
    v_Ly_Tpp_Amt     IN RTRE0125.LY_TPP_AMT%TYPE,     /*���⸻ �����         */
    v_Cy_Pp_Amt      IN RTRE0125.CY_PP_AMT%TYPE,      /*��� ó����           */
    v_Cy_Tpp_Amt     IN RTRE0125.CY_TPP_AMT%TYPE,     /*��� �Ѵ����         */
    v_Cm_Pp_Amt      IN RTRE0125.CM_PP_AMT%TYPE,      /*��� ó����           */
    v_Cm_R_Amt       IN RTRE0125.CM_R_AMT%TYPE,       /*��� ��������         */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0125
    SET    POSTP_STAT       = v_Postp_Stat,
           POSTP_YM         = v_Postp_Ym,
           LY_TPP_AMT       = v_Ly_Tpp_Amt,
           CY_PP_AMT        = v_Cy_Pp_Amt,
           CY_TPP_AMT       = v_Cy_Tpp_Amt,
           CM_PP_AMT        = v_Cm_Pp_Amt,
           CM_R_AMT         = v_Cm_R_Amt,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  ORD_NO           = v_Ord_No
    AND    POSTP_TP         = v_Postp_Tp
    AND    POSTP_SEQ        = v_Postp_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0125;

  /*****************************************************************************
  -- [RE] �̿�ó�� �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0125 (
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*�̿�ȸ��              */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTRE0125
    WHERE  ORD_NO           = v_Ord_No
    AND    POSTP_TP         = v_Postp_Tp
    AND    POSTP_SEQ        = v_Postp_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0125;

  /*****************************************************************************
  -- [RE] �̿�ó�� �������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0125 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*�̿�ȸ��              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*�̿�����              */
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*�����              */
    v_Ly_Tpp_Amt     IN RTRE0125.LY_TPP_AMT%TYPE,     /*���⸻ �����         */
    v_Cy_Pp_Amt      IN RTRE0125.CY_PP_AMT%TYPE,      /*��� ó����           */
    v_Cy_Tpp_Amt     IN RTRE0125.CY_TPP_AMT%TYPE,     /*��� �Ѵ����         */
    v_Cm_Pp_Amt      IN RTRE0125.CM_PP_AMT%TYPE,      /*��� ó����           */
    v_Cm_R_Amt       IN RTRE0125.CM_R_AMT%TYPE,       /*��� ��������         */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����ȣ, �̿��׸�, �̿�ȸ��, ����� ID
    IF (TRIM(v_Ord_No) IS NULL) THEN
        v_Return_Message := '����ȣ('||v_Ord_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Postp_Tp) IS NULL) THEN
        v_Return_Message := '�̿��׸�('||v_Postp_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Postp_Seq) IS NULL) THEN
        v_Return_Message := '�̿�ȸ��('||v_Postp_Seq||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText
                                ) THEN
            v_Return_Message := '[RE] �̿�ó�� �������� ��� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

         IF 0 != f_UpdateRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText
                                ) THEN
            v_Return_Message := '[RE] �̿�ó�� �������� ���� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq,
                                  v_Reg_Id,    v_ErrorText
                                ) THEN
            v_Return_Message := '[RE] �̿�ó�� �������� ���� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0125.p_IUDRtre0125(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0125.p_IUDRtre0125(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0125;


  /*****************************************************************************
  -- [RE] �̿�ó�� �������� �ߵ����� UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtre0125Postpone (
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*�̿�ȸ��              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*�̿�����              */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0125
    SET    POSTP_STAT       = v_Postp_Stat,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  ORD_NO           = v_Ord_No
    AND    POSTP_TP         = v_Postp_Tp
    AND    POSTP_SEQ        = v_Postp_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0125Postpone;


  /*****************************************************************************
  -- [RE] �̿�ó�� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0125MaxSeq(
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,           /*����ȣ            */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE          /*�̿��׸�            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL(MAX(POSTP_SEQ), 0)
    INTO    v_curr_cunt
    FROM    RTRE0125
    WHERE   ORD_NO         = v_Ord_No
    AND     POSTP_TP       = v_Postp_Tp;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0125MaxSeq;



  /*****************************************************************************
  -- �̿�ó�� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0125Postpone (
    Ref_Cursor       OUT SYS_REFCURSOR,
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*�����              */
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*�̿�����              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
  BEGIN

    Pkg_Rtre0125.p_sRtre0125PostponePage(Ref_Cursor, v_Postp_Ym, v_Ord_No, v_Postp_Tp,
                                         v_Postp_Stat, 1, 100000, v_Success_Code,
                                         v_Return_Message, v_ErrorText);

  END p_sRtre0125Postpone;

  /*****************************************************************************
  -- �̿�ó�� ���� ��ȸ - �κй���ó���� ���� page ó��
  *****************************************************************************/
  PROCEDURE p_sRtre0125PostponePage (
    Ref_Cursor       OUT SYS_REFCURSOR,
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*�����              */
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*�̿�����              */
    v_Page_No        IN NUMBER,                       /*������                */
    v_Get_Cnt        IN NUMBER,                       /*ȹ��Ǽ�              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Serch_Flag NUMBER DEFAULT 0;
    e_Error EXCEPTION;
  BEGIN


    -- �ʼ���: ���س��, ����ȣ, �̿��׸�, �̿�����
    -- ���س��/����ȣ�� �� ���� �ϳ��� �ʼ�, �̿��׸�/�̿����´� ����
    IF (v_Ord_No IS NULL) AND (v_Postp_Ym IS NULL) THEN
        v_Serch_Flag := -1;
        v_Return_Message := '����ȣ�� ����� : ������ �ϳ��� �ݵ�� �Է��ϼž� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (v_Ord_No IS NOT NULL) THEN
        IF Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) = 0 THEN
            v_Serch_Flag := -1;
            v_Return_Message := '����ȣ('||v_Ord_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ��մϴ�!';
            RAISE e_Error;
        END IF;
    END IF;

--    IF (TRIM(v_Postp_Tp) IS NULL) THEN
--        v_Return_Message := '�̿��׸�('||v_Postp_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ��մϴ�!';
--        RAISE e_Error;
--    END IF;


    OPEN Ref_Cursor FOR
    SELECT  A.ROW_NUM,
            A.POSTP_YM,
            A.POSTP_TP,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R037', A.POSTP_TP) POSTP_TP_NM,
            A.CUST_NO,
            A.CUST_NM,
            A.CUST_TP,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S024', A.CUST_TP) CUST_TP_NM,
            A.ORD_NO,
            A.MAT_CD,
            A.MAT_NM,
            A.PROC_DAY,
            A.ORD_QTY,
            A.AGENCY_CD,
            A.AGENCY_NM,
            DECODE(A.CHAN_CD, '01', A.AGENCY_CD,
                   DECODE(A.CHAN_CD, '05', A.AGENCY_CD, A.ORD_AGENT)) ORD_AGENT,
            DECODE(A.CHAN_CD, '01', A.AGENCY_NM,
                   DECODE(A.CHAN_CD, '05', A.AGENCY_NM, A.ORG_AGNM)) ORD_AGNM,
            A.POSTP_STAT,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R038', A.POSTP_STAT) POSTP_STAT_NM,
            DECODE(A.PSTR_YM, NULL, NULL, MONTHS_BETWEEN( TO_DATE(A.POSTP_YM,'YYYYMM'), TO_DATE(A.PSTR_YM, 'YYYYMM') ) + 1) POSTP_TERM,
            A.ACQ_AMT,
            A.LY_TPP_AMT,
            A.CY_PP_AMT,
            A.CY_TPP_AMT,
            A.CM_PP_AMT,
            A.CM_R_AMT,
            A.TOTAL_CNT
    FROM    (
            SELECT  DECODE(GROUPING(A.ROW_NUM),1, NULL, A.ROW_NUM)          AS ROW_NUM,
                    DECODE(GROUPING(A.ROW_NUM),1, '��ü �Ѱ�', MIN(A.POSTP_YM))  AS POSTP_YM,
                    DECODE(GROUPING(A.ROW_NUM),1, TO_CHAR(MIN(A.TOTAL_CNT),'999,999,999')||'(��)', MIN(A.POSTP_TP))    AS POSTP_TP,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.CUST_NO))     AS CUST_NO,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.CUST_TP))     AS CUST_TP,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.ORD_NO))      AS ORD_NO,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.MAT_CD))      AS MAT_CD,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.PROC_DAY))    AS PROC_DAY,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.ORD_QTY))     AS ORD_QTY,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.AGENCY_CD))   AS AGENCY_CD,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.CHAN_CD))     AS CHAN_CD,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.ORD_AGENT))   AS ORD_AGENT,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.POSTP_STAT))  AS POSTP_STAT,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.CUST_NM))     AS CUST_NM,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.MAT_NM))      AS MAT_NM,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.AGENCY_NM))   AS AGENCY_NM,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.TOTAL_CNT))   AS TOTAL_CNT,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.ORG_AGNM))    AS ORG_AGNM,
                    DECODE(GROUPING(A.ROW_NUM),1, NULL, MIN(A.PSTR_YM))     AS PSTR_YM,
                    SUM(A.ACQ_AMT)      AS ACQ_AMT,
                    SUM(A.LY_TPP_AMT)   AS LY_TPP_AMT,
                    SUM(A.CY_PP_AMT)    AS CY_PP_AMT,
                    SUM(A.CY_TPP_AMT)   AS CY_TPP_AMT,
                    SUM(A.CM_PP_AMT)    AS CM_PP_AMT,
                    SUM(A.CM_R_AMT)     AS CM_R_AMT
            FROM    (
                    SELECT  A.POSTP_YM, A.POSTP_TP, C.CUST_NO, D.CUST_NM,
                            D.CUST_TP, A.ORD_NO, B.MAT_CD, E.MAT_NM,
                            C.PROC_DAY, B.ORD_QTY, C.AGENCY_CD, F.AGENCY_NM,
                            B.CHAN_CD, C.ORD_AGENT, G.ORG_AGNM, A.POSTP_STAT,
                            B.PSTR_YM, B.ACQ_AMT, A.LY_TPP_AMT, A.CY_PP_AMT,
                            A.CY_TPP_AMT, A.CM_PP_AMT, A.CM_R_AMT,
                            ROW_NUMBER() OVER(ORDER BY A.ORD_NO, A.POSTP_TP, A.POSTP_YM) ROW_NUM,
                            COUNT(A.ORD_NO) OVER() TOTAL_CNT
                    FROM    RTRE0125 A,
                            RTRE0120 B,
                            RTSD0108 C,
                            RTSD0100 D,
                            RTSD0005 E,
                            RTSD0007 F,
                            RTSD0113 G
                    WHERE   v_Serch_Flag   = 0
                    AND     A.POSTP_YM = DECODE(v_Postp_Ym, NULL, A.POSTP_YM, v_Postp_Ym)
                    AND     A.ORD_NO   = DECODE(v_Ord_No, NULL, A.ORD_NO, v_Ord_No)
                    AND     A.POSTP_TP    = DECODE(v_Postp_Tp, NULL, A.POSTP_TP, v_Postp_Tp)
                    AND     A.POSTP_STAT  = DECODE(v_Postp_Stat, NULL, A.POSTP_STAT, v_Postp_Stat)
                    AND     A.POSTP_STAT <> 'Z'
                    AND     A.ORD_NO   = B.ORD_NO
                    AND     A.POSTP_TP = B.POSTP_TP
                    AND     A.ORD_NO   = C.ORD_NO
                    AND     C.CUST_NO  = D.CUST_NO
                    AND     B.MAT_CD   = E.MAT_CD
                    AND     C.AGENCY_CD = F.AGENCY_CD
                    AND     C.ORD_AGENT = G.ORD_AGENT(+)
                    ) A
            GROUP BY ROLLUP(A.ROW_NUM)
            ) A
    WHERE   NVL(A.ROW_NUM,v_Page_No * v_Get_Cnt)  BETWEEN (((v_Page_No - 1) * v_Get_Cnt)+1)  AND (v_Page_No * v_Get_Cnt)
    ORDER   BY NVL(TO_NUMBER(A.ROW_NUM),v_Page_No * v_Get_Cnt);

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0125.p_sRtre0125PostponePage(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0125.p_sRtre0125PostponePage(2)', v_ErrorText, v_Return_Message);

  END p_sRtre0125PostponePage;


  /*****************************************************************************
  -- ���� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0125Close (
    Ref_Cursor       OUT SYS_REFCURSOR,
    v_Close_Ym       IN VARCHAR2,                     /*�������              */
    v_Close_Tp       IN VARCHAR2,                     /*��������              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: �������,
    -- ���������� ����
    IF v_Close_Ym IS NULL THEN
        v_Return_Message := '�������('||v_Close_Ym||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ��մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Close_Tp IS NOT NULL THEN
        IF 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R041', v_Close_Tp) THEN
            v_Return_Message := '��������('||v_Close_Tp||') : �߸��� �� �Է����� ó���� �Ұ��մϴ�!';
            RAISE e_Error;
        END IF;
    END IF;


    OPEN Ref_Cursor FOR
    SELECT  CLOSE_YM,
            CLOSE_TP,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R041', CLOSE_TP) CLOSE_TP_NM,
            CLS_DETAIL,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R007', CLS_DETAIL) CLS_DETAIL_NM,
            CLOSE_CNT,
            CLOSE_AMT
    FROM    (
            -- (A)����
            SELECT  v_Close_Ym       CLOSE_YM,
                    'A'              CLOSE_TP,
                    A.RECP_TP        CLS_DETAIL,
                    COUNT(*)         CLOSE_CNT,
                    SUM(A.SALE_AMT)  CLOSE_AMT
            FROM    RTSD0109 A
            WHERE   A.DEMD_DT BETWEEN v_Close_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
            AND     A.SCD_STAT      = 'S'
            AND     'A'             = NVL(v_Close_Tp, 'A')
            GROUP   BY A.RECP_TP
            UNION   ALL
            -- (B)����
            SELECT  v_Close_Ym       CLOSE_YM,
                    'B'              CLOSE_TP,
                    A.RECP_TP        CLS_DETAIL,
                    COUNT(*)         CLOSE_CNT,
                    SUM(A.RECP_AMT)  CLOSE_AMT
            FROM    RTRE0030 A
            WHERE   A.RECV_DAY BETWEEN v_Close_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
            AND     'B'              = NVL(v_Close_Tp, 'B')
            GROUP   BY A.RECP_TP
            UNION   ALL
            -- (C)����
            SELECT  v_Close_Ym       CLOSE_YM,
                    'C'              CLOSE_TP,
                    A.RECP_TP        CLS_DETAIL,
                    COUNT(*)         CLOSE_CNT,
                    SUM(A.PND_AMT - A.SBS_AMT)                                   CLOSE_AMT
            FROM    RTRE0037 A
            WHERE   A.CLOSE_DAY      = TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
            AND     'C'              = NVL(v_Close_Tp, 'C')
            GROUP   BY A.RECP_TP
            UNION   ALL
            -- (D)�̳�
            SELECT  CLOSE_YM,
                    CLOSE_TP,
                    CLS_DETAIL,
                    SUM(CLOSE_CNT) CLOSE_CNT,
                    SUM(CLOSE_AMT) CLOSE_AMT
            FROM    (
                    SELECT  v_Close_Ym       CLOSE_YM,
                            'D'              CLOSE_TP,
                            A.RECP_TP        CLS_DETAIL,
                            COUNT(*)         CLOSE_CNT,
                            SUM(A.SALE_AMT)  CLOSE_AMT
                    FROM    RTSD0109 A
                    WHERE   A.DEMD_DT BETWEEN v_Close_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
                    AND     A.ZFB_DAY  > TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
                    AND     A.SCD_STAT = 'S'
                    AND     'D'        = NVL(v_Close_Tp, 'D')
                    GROUP   BY A.RECP_TP
                    UNION
                    SELECT  v_Close_Ym       CLOSE_YM,
                            'D'              CLOSE_TP,
                            A.RECP_TP        CLS_DETAIL,
                            COUNT(*)         CLOSE_CNT,
                            SUM(A.ARRE_AMT)  CLOSE_AMT
                    FROM    RTRE0101 A
                    WHERE   A.DELY_DAY = TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
                    AND     'D'        = NVL(v_Close_Tp, 'D')
                    GROUP   BY A.RECP_TP
                    )
            GROUP   BY CLOSE_YM, CLOSE_TP, CLS_DETAIL
            UNION   ALL
            -- (E)���ݿ�����
            SELECT  v_Close_Ym       AS CLOSE_YM,
                    'E'              AS CLOSE_TP,
                    A.CASHD_TP       AS CLS_DETAIL,
                    COUNT(*)         AS CLOSE_CNT,
                    SUM(A.CASH_AMT)  AS CLOSE_AMT
            FROM    RTRE0091 A
            WHERE   A.CASH_DAY  BETWEEN v_Close_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
            AND     A.CASH_STAT = '5'
            AND     'E'         = NVL(v_Close_Tp, 'E')
            GROUP   BY A.CASHD_TP
            UNION   ALL
            -- (F)ī����ü
            SELECT  v_Close_Ym       AS CLOSE_YM,
                    'F'              AS CLOSE_TP,
                    A.CARDCOM_CD     AS CLS_DETAIL,
                    COUNT(*)         AS CLOSE_CNT,
                    SUM(A.RECP_AMT)  AS CLOSE_AMT
            FROM    RTRE0080 A
            WHERE   A.RCRD_DAY BETWEEN v_Close_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
            AND     'F'        = NVL(v_Close_Tp, 'F')
            GROUP   BY A.CARDCOM_CD
            UNION   ALL
            -- (G)ī��(PG)
            SELECT  v_Close_Ym       AS CLOSE_YM,
                    'G'              AS CLOSE_TP,
                    A.RECP_PAY       AS CLS_DETAIL,
                    COUNT(*)         AS CLOSE_CNT,
                    SUM(A.RECP_AMT)  AS CLOSE_AMT
            FROM    RTRE0041 A
            WHERE   A.RECV_DAY BETWEEN v_Close_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
            AND     A.RECP_PAY = 'P1'
            AND     'G'        = NVL(v_Close_Tp, 'G')
            GROUP   BY A.RECP_PAY
            UNION   ALL
            -- (H)������,  (I)��Ϻ��̿�,  (J)�������̿�
            SELECT  A.POSTP_YM       CLOSE_YM,
                    CASE
                      WHEN A.POSTP_TP   IN ( '02', '03' )                   THEN 'H' -- (H)������
                      WHEN A.POSTP_TP   = '01'                              THEN 'I' -- (I)��Ϻ��̿�
                      WHEN A.POSTP_TP   IN ( '04', '05', '06', '07', '08' ) THEN 'J' -- (J)�������̿�
                    END AS           CLOSE_TP,
                    A.POSTP_TP       CLS_DETAIL,
                    COUNT(*)         CLOSE_CNT,
                    SUM(A.CM_PP_AMT) CLOSE_AMT
            FROM    RTRE0125 A
            WHERE   A.POSTP_YM   = v_Close_Ym
            AND     A.POSTP_TP   IN (
                                    SELECT  CD
                                    FROM    RTCM0051
                                    WHERE   CD_GRP_CD = 'R037'
                                    AND     ((v_Close_Tp IS NULL) OR
                                             (v_Close_Tp = 'H' AND CD IN ( '02', '03' )) OR
                                             (v_Close_Tp = 'I' AND CD = '01') OR
                                             (v_Close_Tp = 'J' AND CD IN ( '04', '05', '06', '07', '08' )))
                                    )
            AND     A.POSTP_STAT <> 'Z'
            GROUP   BY A.POSTP_YM, A.POSTP_TP
            UNION   ALL
            -- (K)�Ǹż�����
            SELECT  A.SLCM_YM       CLOSE_YM,
                    'K'             CLOSE_TP,
                    A.COMM_TP       CLS_DETAIL,
                    COUNT(*)        CLOSE_CNT,
                    SUM(A.SLCM_AMT) CLOSE_AMT
            FROM    RTRE5040 A
            WHERE   A.SLCM_YM = v_Close_Ym
            AND     'K'       = NVL(v_Close_Tp, 'K')
            GROUP   BY A.SLCM_YM, A.COMM_TP
            UNION   ALL
            -- (L)����������
            SELECT  A.SLCM_YM        CLOSE_YM,
                    'L'              CLOSE_TP,
                    A.COMM_TP        CLS_DETAIL,
                    COUNT(*)         CLOSE_CNT,
                    SUM(A.PROCC_AMT) CLOSE_AMT
            FROM    RTRE5050 A
            WHERE   A.SLCM_YM = v_Close_Ym
            AND     'L'       = NVL(v_Close_Tp, 'L')
            GROUP   BY A.SLCM_YM, A.COMM_TP
            UNION   ALL
            -- (M)���񽺼�����
            SELECT  A.SLCM_YM        CLOSE_YM,
                    'M'              CLOSE_TP,
                    A.COMM_TP        CLS_DETAIL,
                    COUNT(*)         CLOSE_CNT,
                    SUM(A.SVCC_AMT)  CLOSE_AMT
            FROM    RTRE5060 A
            WHERE   A.SLCM_YM = v_Close_Ym
            AND     'M'       = NVL(v_Close_Tp, 'M')
            GROUP   BY A.SLCM_YM, A.COMM_TP
            UNION   ALL
            -- (N)������ �ջ�
            SELECT  A.SLCM_YM        CLOSE_YM,
                    'N'              CLOSE_TP,
                    ''               CLS_DETAIL,
                    COUNT(*)         CLOSE_CNT,
                    SUM(A.TCOMM_AMT) CLOSE_AMT
            FROM    RTRE5070 A
            WHERE   A.SLCM_YM = v_Close_Ym
            AND     'N'       = NVL(v_Close_Tp, 'N')
            GROUP   BY A.SLCM_YM
            UNION   ALL
            -- (O)���ݳ���
            SELECT  SUBSTR(A.APFD_DAY,1,6)          CLOSE_YM,
                    'O'                             CLOSE_TP,
                    A.APFD_TP                       CLS_DETAIL,
                    COUNT(*)         CLOSE_CNT,
                    SUM(A.APFD_PAMT - A.APFD_MAMT)  CLOSE_AMT
            FROM    RTRE5080 A
            WHERE   APFD_DAY BETWEEN  v_Close_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Close_Ym, 'YYYYMM')), 'YYYYMMDD')
            AND     'O'       = NVL(v_Close_Tp, 'O')
            GROUP   BY SUBSTR(A.APFD_DAY,1,6), A.APFD_TP
            )
    ORDER   BY CLOSE_YM, CLOSE_TP, CLS_DETAIL;

    v_Success_code := 0;
    v_Return_Message := '���������� ó���Ǿ����ϴ�';
    v_ErrorText := '';
    --COMMIT;



    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        OPEN Ref_Cursor FOR
        SELECT  '' CLOSE_YM,  '' CLOSE_TP, '' CLOSE_TP_NM, '' CLS_DETAIL, '' CLS_DETAIL_NM,
                '' CLOSE_CNT, '' CLOSE_AMT
        FROM    DUAL
        WHERE   DUMMY = 'Z';
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0125.p_sRtre0125Close(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        OPEN Ref_Cursor FOR
        SELECT  '' CLOSE_YM,  '' CLOSE_TP, '' CLOSE_TP_NM, '' CLS_DETAIL, '' CLS_DETAIL_NM,
                '' CLOSE_CNT, '' CLOSE_AMT
        FROM    DUAL
        WHERE   DUMMY = 'Z';
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0125.p_sRtre0125Close(2)', v_ErrorText, v_Return_Message);


  END p_sRtre0125Close;


END Pkg_Rtre0125;
/
