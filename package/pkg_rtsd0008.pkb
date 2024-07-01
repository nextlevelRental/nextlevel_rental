CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0008 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0008
   PURPOSE   ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-29  jemcarry         1. Created this package body.
   1.1        2017-03-13  wjim             [20170313_01] B2B�Ͻú� ������å �߰��� ���� ����
*******************************************************************************/

  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0008Count(
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,          /*�������� ������     */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,          /*�������� �Ϸ���     */
    v_Seq            IN RTSD0008.SEQ%TYPE               /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0008
    WHERE   PRICE_CD  = v_Price_Cd
    AND     MAT_CD    = v_Mat_Cd
    AND     PERIOD_CD = v_Period_Cd
    AND     CNT_CD    = v_Cnt_Cd
    AND     REGI_CD   = v_Regi_Cd
    AND     STR_DAY   = v_Str_Day
    AND     END_DAY   = v_End_Day
    AND     SEQ       = v_Seq;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0008Count;

  /*****************************************************************************
  -- ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PRICE_CD,                  /*����,�ݾ�����       */
            A.MAT_CD,                    /*��ǰ�ڵ�            */
            (SELECT MAT_NM FROM RTSD0005 B WHERE B.MAT_CD = A.MAT_CD) MAT_NM,
            A.PERIOD_CD,                 /*�Ⱓ�ڵ�            */
            A.CNT_CD,                    /*Ÿ�̾��          */
            A.REGI_CD,                   /*��Ϻ��ڵ�          */
            A.STR_DAY,                   /*�������� ������     */
            A.END_DAY,                   /*�������� �Ϸ���     */
            A.SEQ,                       /*����                */
            A.AMT,                       /*�ݾ�                */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0008 A
    WHERE   A.PRICE_CD  = DECODE(v_Price_Cd  , NULL, A.PRICE_CD  , v_Price_Cd)
    AND     A.MAT_CD    = DECODE(v_Mat_Cd    , NULL, A.MAT_CD    , v_Mat_Cd)
    AND     A.PERIOD_CD = DECODE(v_Period_Cd , NULL, A.PERIOD_CD , v_Period_Cd)
    AND     A.CNT_CD    = DECODE(v_Cnt_Cd    , NULL, A.CNT_CD    , v_Cnt_Cd)
    AND     A.REGI_CD   = DECODE(v_Regi_Cd   , NULL, A.REGI_CD   , v_Regi_Cd)
    AND     A.STR_DAY   = DECODE(v_Str_Day   , NULL, A.STR_DAY   , v_Str_Day)
    AND     A.END_DAY   = DECODE(v_End_Day   , NULL, A.END_DAY   , v_End_Day)
    AND     A.SEQ       = DECODE(v_Seq       , NULL, A.SEQ       , v_Seq)
    AND     A.AMT       = DECODE(v_Amt       , NULL, A.AMT       , v_Amt)
    AND     A.USE_YN    = DECODE(v_Use_Yn    , NULL, A.USE_YN    , v_Use_Yn)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id)
--    AND     A.STR_DAY   <= TO_CHAR(sysdate, 'YYYYMMDD')
--    AND     A.END_DAY   >= TO_CHAR(sysdate, 'YYYYMMDD')
    ;

  END p_sRtsd0008;

  /*****************************************************************************
  -- ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN OUT RTSD0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    v_Seq := f_sRtsd0008MaxSeq(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd, v_Str_Day, v_End_Day);

    INSERT  INTO RTSD0008 (
            PRICE_CD,
            MAT_CD,
            PERIOD_CD,
            CNT_CD,
            REGI_CD,
            STR_DAY,
            END_DAY,
            SEQ,
            AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Price_Cd,
            v_Mat_Cd,
            v_Period_Cd,
            v_Cnt_Cd,
            v_Regi_Cd,
            v_Str_Day,
            v_End_Day,
            v_Seq,
            v_Amt,
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

  END f_InsertRtsd0008;

  /*****************************************************************************
  -- ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0008
    SET    AMT       = v_Amt,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0008;

  /*****************************************************************************
  -- ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0008
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0008;

  /*****************************************************************************
  -- ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0008 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN OUT RTSD0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����_�ݾ����� , ��ǰ�ڵ�,�Ⱓ�ڵ�,Ÿ�̾��, ��Ϻ��ڵ�,�������� ������,�������� �Ϸ���,  ��뿩�� ,����� ID
    IF TRIM(v_Price_Cd) IS NULL THEN
        v_Return_Message := '����_�ݾ����� ('||v_Price_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '��ǰ�ڵ�('||v_Mat_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Period_Cd) IS NULL THEN
        v_Return_Message := '�Ⱓ�ڵ�('||v_Period_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cnt_Cd) IS NULL THEN
        v_Return_Message := 'Ÿ�̾��('||v_Cnt_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Regi_Cd) IS NULL THEN
        v_Return_Message := '��Ϻ��ڵ�('||v_Regi_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Str_Day) IS NULL THEN
        v_Return_Message := '�������� ������('||v_Str_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_End_Day) IS NULL THEN
        v_Return_Message := '�������� �Ϸ���('||v_End_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0008Count(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                            v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq) THEN

        IF 0 != f_InsertRtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                 v_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF
        ;
    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                     v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                     v_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                     v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� ���� ���� ����!!!'||'-'||v_ErrorText;
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

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0008.p_IUDRtsd0008(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0008.p_IUDRtsd0008(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0008;

  /*****************************************************************************
  -- ���� ���� Select - ��ǰ �� ������ȸ POPUP
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-13  wjim             [20170313_01] B2B�Ͻú� ������å �߰��� ���� ����
  *****************************************************************************/
  PROCEDURE p_sRtsd0008PoPup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,        /*����������            */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE          /*Ÿ�̾��            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PRICE_CD,                  /*����,�ݾ�����       */
            A.MAT_CD,                    /*��ǰ�ڵ�            */
            Pkg_Rtsd0005.f_sRtsd0005MatName(A.MAT_CD) MAT_NM, /*��ǰ��  */
            A.PERIOD_CD,                 /*�Ⱓ�ڵ�            */
            A.CNT_CD,                    /*Ÿ�̾��          */
            A.REGI_CD,                   /*��Ϻ��ڵ�          */
            TO_NUMBER(Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',A.REGI_CD)) REGI_AMT, /*��Ż��Ϻ� */
            A.AMT  RENT_AMT,             /*�ݾ�(����Ż��)      */
            A.STR_DAY,                   /*�������� ������     */
            A.END_DAY,                   /*�������� �Ϸ���     */
            A.SEQ                        /*����                */
    FROM    RTSD0008 A
    WHERE   v_Ord_Day BETWEEN A.STR_DAY AND  END_DAY
    AND     A.MAT_CD    = DECODE(v_Mat_Cd    , NULL, A.MAT_CD    , v_Mat_Cd)
    AND     A.PERIOD_CD = DECODE(v_Period_Cd , NULL, A.PERIOD_CD , v_Period_Cd)
    AND     A.CNT_CD    = DECODE(v_Cnt_Cd    , NULL, A.CNT_CD    , v_Cnt_Cd)
    AND     A.USE_YN = 'Y'
    AND     A.PRICE_CD = '0002'          /* [20170313_01] ��Ż�Ḹ ��ȸ */
    ORDER   BY A.SEQ;

  END p_sRtsd0008PoPup;

    /*****************************************************************************
    -- ��ǰ���� Select - ��ǰ �� ������ȸ POPUP
    REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-13  wjim             [20170313_01] B2B�Ͻú� ������å �߰��� ���� �Ķ���� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtsd0008_Pro_Pri_PoPup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,         /*����������          */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,          /*��ǰ�ڵ�            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,       /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,          /*Ÿ�̾��          */
    v_regi_Amt       IN RTSD0106.REGI_AMT%TYPE,        /*��Ż��Ϻ�          */
    v_Amt            IN RTSD0008.AMT%TYPE,             /*�ݾ�                */
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE         /*���ݱݾ�����        */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAT_CD,               /*��ǰ�ڵ�*/
            A.MAT_NM,               /*��ǰ��*/
            A.PETTERN_CD,           /*�����ڵ�*/
            A.SECTION_WIDTH,        /*�ܸ���*/
            A.ASPECT_RATIO,         /*�����*/
            A.WHEEL_INCHES,         /*��ġ*/
            A.PLY_RATING,           /*PR(����)*/
            A.DEMEND_QTY,           /*Ÿ�̾�ҿ䷮*/
            A.PG_CD,                /*Pricing Group Code*/
            A.SEASON_CD,            /*��������*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S014',A.SEASON_CD) AS SEASON_NM, /*�������и�            */
            B.FR_CD,                /*���� ����*/
            B.CONTENTS_CD,          /*���*/
            B.MODEL_CD,             /*����*/
            B.WHEEL_QTY,            /*������*/
            B.WHEEL_LIMIT_QTY,      /*�������� ������*/
            B.CLASS_CD,             /*�����з�*/
            C.MAKER_CD,             /*ī����Ŀ*/
            D.SEQ,                  /*����*/
            D.END_DAY,              /*�������� �Ϸ���*/
            D.STR_DAY,              /*�������� ������*/
            D.REGI_CD,              /*��Ϻ��ڵ�*/
            TO_NUMBER(Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',D.REGI_CD)) AS REGI_AMT, /*��Ż��Ϻ� */
            D.CNT_CD,               /*Ÿ�̾��*/
            TO_NUMBER( D.CNT_CD ) AS ORD_QTY,     /*Ÿ�̾���� */
            D.PERIOD_CD,            /*�Ⱓ�ڵ�*/
            D.PRICE_CD,             /*����,�ݾ�����*/
            D.AMT AS RENT_AMT       /*�ݾ�*/
    FROM    RTSD0005 A,
            RTSD0004 B,
            RTSD0001 C,
            RTSD0008 D
    WHERE   B.MODEL_CD      = v_Model_Cd                 /*����(S001)          */
    AND     B.CONTENTS_CD   = v_Contents_Cd              /*���(S002,S003)     */
    AND     B.FR_CD         = v_Fr_Cd                    /*���� ����           */
    AND     D.MAT_CD        = v_Mat_Cd                   /*��ǰ�ڵ�            */
    AND     v_Ord_Day BETWEEN D.STR_DAY AND D.END_DAY    /*��������            */
    AND     D.PERIOD_CD     = v_Period_Cd                /*�Ⱓ�ڵ�            */
    AND     D.CNT_CD        = v_Cnt_Cd                   /*Ÿ�̾��          */
    AND     (v_regi_Amt IS NULL OR TO_NUMBER(Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',D.REGI_CD)) =  v_regi_Amt)
    AND     (v_Amt      IS NULL OR D.AMT =  v_Amt)
    AND     A.SECTION_WIDTH = B.SECTION_WIDTH            /*�ܸ���              */
    AND     A.ASPECT_RATIO  = B.ASPECT_RATIO             /*�����              */
    AND     A.WHEEL_INCHES  = B.WHEEL_INCHES             /*��ġ                */
    AND     A.PLY_RATING    = B.PLY_RATING               /*PR(����)            */
    AND     A.USE_YN        = 'Y'
    AND     B.USE_YN        = 'Y'
    AND     B.MODEL_CD      = C.MODEL_CD
    AND     B.CONTENTS_CD   = C.CONTENTS_CD
    AND     C.USE_YN        = 'Y'
    AND     A.MAT_CD        = D.MAT_CD
    AND     D.USE_YN        = 'Y'
    AND     D.PRICE_CD      = v_Price_Cd                 /* [20170313_01]      */
    ORDER BY D.STR_DAY DESC, D.AMT ASC;

  END p_sRtsd0008_Pro_Pri_PoPup;
  
  /*****************************************************************************
    -- ��ǰ���� Select - ��ǰ �� ������ȸ
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-13  wjim             [20170313_01] B2B�Ͻú� ������å �߰��� ���� ����
  *****************************************************************************/
  PROCEDURE p_sRtsd0008_ProductList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,    /*����ġ              */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,      /*����                */    
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,       /*���� ����           */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,      /*�����ڵ�            */
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,         /*����������          */    
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,       /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE           /*Ÿ�̾��          */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAT_CD,               /*��ǰ�ڵ�*/
            A.SECTION_WIDTH || '/' || A.ASPECT_RATIO || '/' || A.WHEEL_INCHES || '/' || A.PLY_RATING AS MAT_NM, /*�԰�*/
            A.PETTERN_CD,           /*�����ڵ�*/
            A.SECTION_WIDTH,        /*�ܸ���*/
            A.ASPECT_RATIO,         /*�����*/
            A.WHEEL_INCHES,         /*��ġ*/
            A.PLY_RATING,           /*PR(����)*/
            A.DEMEND_QTY,           /*Ÿ�̾�ҿ䷮*/
            A.PG_CD,                /*Pricing Group Code*/
            A.SEASON_CD,            /*��������*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S014',A.SEASON_CD) AS SEASON_NM, /*�������и�            */
            B.FR_CD,                /*���� ����*/
            DECODE(B.FR_CD, 'Z', '���о���', Pkg_Rtcm0051.f_sRtcm0051CodeName('S004',B.FR_CD)) AS FR_CD_NM, /*���ı��и�*/
            B.CONTENTS_CD,          /*���*/
            DECODE(B.CONTENTS_CD, '0001', '������', Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',B.CONTENTS_CD)) AS CONTENTS_CD_NM, /*����*/
            B.MODEL_CD,             /*����*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',B.MODEL_CD) AS MODEL_NM, /*�𵨸�*/
            B.WHEEL_QTY,            /*������*/
            B.WHEEL_LIMIT_QTY,      /*�������� ������*/
            B.CLASS_CD,             /*�����з�*/
            C.MAKER_CD,             /*ī����Ŀ*/
            D.SEQ,                  /*����*/
            D.END_DAY,              /*�������� �Ϸ���*/
            D.STR_DAY,              /*�������� ������*/
            D.REGI_CD,              /*��Ϻ��ڵ�*/
            TO_NUMBER(Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',D.REGI_CD)) AS REGI_AMT, /*��Ż��Ϻ� */
            D.CNT_CD,               /*Ÿ�̾��*/
            TO_NUMBER( D.CNT_CD ) AS ORD_QTY,     /*Ÿ�̾���� */
            D.PERIOD_CD,            /*�Ⱓ�ڵ�*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S021',D.PERIOD_CD) AS PERIOD_NM, /*��Ż�Ⱓ */
            D.PRICE_CD,             /*����,�ݾ�����*/
            D.AMT AS RENT_AMT       /*�ݾ�*/
    FROM    RTSD0005 A,
            RTSD0004 B,
            RTSD0001 C,
            RTSD0008 D
    WHERE   B.MODEL_CD      = v_Model_Cd                 /*����(S001)          */
    AND     B.CONTENTS_CD   = v_Contents_Cd              /*���(S002,S003)     */
    AND     (v_Fr_Cd      IS NULL OR B.FR_CD =  v_Fr_Cd) /*���� ����           */
    AND     v_Ord_Day BETWEEN D.STR_DAY AND D.END_DAY    /*��������            */
    AND     (v_Period_Cd      IS NULL OR D.PERIOD_CD =  v_Period_Cd) /*�Ⱓ�ڵ�            */
    AND     (v_Cnt_Cd      IS NULL OR D.CNT_CD =  v_Cnt_Cd) /*Ÿ�̾��            */
    AND     A.SECTION_WIDTH = B.SECTION_WIDTH            /*�ܸ���              */
    AND     A.ASPECT_RATIO  = B.ASPECT_RATIO             /*�����              */
    AND     A.WHEEL_INCHES  = B.WHEEL_INCHES             /*��ġ                */
    AND     A.PLY_RATING    = B.PLY_RATING               /*PR(����)            */
    AND     (v_Section_Width      IS NULL OR A.SECTION_WIDTH =  v_Section_Width) /*�ܸ���            */
    AND     (v_Aspect_Ratio      IS NULL OR A.ASPECT_RATIO =  v_Aspect_Ratio) /*�����            */
    AND     (v_Wheel_Inches      IS NULL OR A.WHEEL_INCHES =  v_Wheel_Inches) /*����ġ            */
    AND     (v_Ply_Rating      IS NULL OR A.PLY_RATING =  v_Ply_Rating) /*����            */
    AND     (v_Season_Cd      IS NULL OR A.SEASON_CD =  v_Season_Cd) /*����            */
    AND     (v_Pettern_Cd      IS NULL OR A.PETTERN_CD =  v_Pettern_Cd) /*����            */              
    AND     A.USE_YN        = 'Y'
    AND     B.USE_YN        = 'Y'
    AND     B.MODEL_CD      = C.MODEL_CD
    AND     B.CONTENTS_CD   = C.CONTENTS_CD
    AND     C.USE_YN        = 'Y'
    AND     A.MAT_CD        = D.MAT_CD
    AND     D.USE_YN        = 'Y'
    AND     D.PRICE_CD      = '0002'  /* [20170313_01] ��Ż�Ḹ ��ȸ */
    ORDER BY A.PETTERN_CD, A.SECTION_WIDTH, A.ASPECT_RATIO, A.WHEEL_INCHES, A.PLY_RATING, D.PERIOD_CD, D.CNT_CD, B.FR_CD;

  END p_sRtsd0008_ProductList;

  FUNCTION f_sRtsd0008MaxSeq (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,          /*�������� ������     */
    v_End_Day        IN RTSD0008.END_DAY%TYPE          /*�������� �Ϸ���     */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL((SELECT
                        SEQ + 1
                FROM    RTSD0008
                WHERE   PRICE_CD   = v_Price_Cd
                AND     MAT_CD     = v_Mat_Cd
                AND     PERIOD_CD  =  v_Period_Cd
                AND     CNT_CD     = v_Cnt_Cd
                AND     REGI_CD    = v_Regi_Cd
                AND     STR_DAY    = v_Str_Day
                AND     END_DAY    = v_End_Day
                AND     ROWNUM    <= 1), 1)
    INTO    v_curr_cunt
    FROM    DUAL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0008MaxSeq;

   FUNCTION f_sRtsd0008ExistsDay (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Seq            OUT RTSD0008.SEQ%TYPE              /*���� */
    ) RETURN VARCHAR IS
    v_curr_day   VARCHAR(8) DEFAULT NULL;
  BEGIN

    SELECT  STR_DAY, SEQ
            INTO v_curr_day, v_Seq
    FROM    (
            SELECT  STR_DAY, SEQ
            FROM    RTSD0008
            WHERE   PRICE_CD = v_Price_Cd
            AND     MAT_CD = v_Mat_Cd
            AND     PERIOD_CD = v_Period_Cd
            AND     CNT_CD = v_Cnt_Cd
            AND     REGI_CD = v_Regi_Cd
            AND     USE_YN = 'Y'
            ORDER   BY PRICE_CD, MAT_CD, PERIOD_CD, CNT_CD, REGI_CD, END_DAY DESC)
    WHERE   ROWNUM = 1;

    RETURN v_curr_day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0008ExistsDay;



   /*****************************************************************************
  -- ���� ���� ����(���� �������� ������Ʈó��)
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0008EndDay (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_End_Day2       IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���(����)  */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����_�ݾ����� , ��ǰ�ڵ�,�Ⱓ�ڵ�,Ÿ�̾��, ��Ϻ��ڵ�,�������� ������,�������� �Ϸ���,  ��뿩�� ,����� ID
    IF TRIM(v_Price_Cd) IS NULL THEN
        v_Return_Message := '����_�ݾ����� ('||v_Price_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '��ǰ�ڵ�('||v_Mat_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Period_Cd) IS NULL THEN
        v_Return_Message := '�Ⱓ�ڵ�('||v_Period_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cnt_Cd) IS NULL THEN
        v_Return_Message := 'Ÿ�̾��('||v_Cnt_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Regi_Cd) IS NULL THEN
        v_Return_Message := '��Ϻ��ڵ�('||v_Regi_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Str_Day) IS NULL THEN
        v_Return_Message := '�������� ������('||v_Str_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_End_Day) IS NULL THEN
        v_Return_Message := '�������� �Ϸ���('||v_End_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    UPDATE RTSD0008
    SET    END_DAY   = v_End_Day2,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

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

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0008.p_IUDRtsd0008EndDay(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0008.p_IUDRtsd0008EndDay(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtsd0008EndDay;
  
  
  
  /*****************************************************************************
  -- ��ǰ�߰� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*����                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*�Ⱓ�ڵ�            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*Ÿ�̾��          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*�Ǹ޻�ǰ�ڵ�        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*������            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,              /*������ġ            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE,
    v_Pettern_cd    IN RTSD0005.PETTERN_CD%TYPE,
    v_Spec_cd   IN VARCHAR2
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    SELECT
        B.MAT_CD||C.PERIOD_CD||C.CNT_CD as PRS_PK,
        E.SALE_GDS_CD,                                             /*�����ڵ� */
        B.SECTION_WIDTH||'/'||B.ASPECT_RATIO||'R'||B.WHEEL_INCHES as STANDARD, /* �� �� */
        B.MAT_CD,                                                      /* ��ǰ�ڵ� */
        B.MAT_NM,                                                     /* ��ǰ�� */
        C.PERIOD_CD,
        PKG_RTCM0051.F_SRTCM0051CODENAME('S021',C.PERIOD_CD) AS PERIOD_NM,      /*��Ż�Ⱓ */
        B.SEASON_CD,
        PKG_RTCM0051.F_SRTCM0051CODENAME('S014',B.SEASON_CD) AS SEASON_NM,      /*�������и� */
        C.CNT_CD,
        PKG_RTCM0051.F_SRTCM0051CODENAME('S022',C.CNT_CD) AS CNT_NM,         /*���� */
        C.REGI_CD,
        (SELECT T.AMT FROM RTSD0029 T WHERE '0'||T.CNT_CD = C.CNT_CD AND T.SALE_CD = D.SALE_CD) AS REGI_AMT,         /*��Ż��Ϻ� */
        C.AMT,                                                            /* �� ��Ż�� */
        A.FR_CD,
        PKG_RTCM0051.F_SRTCM0051CODENAME('S004', A.FR_CD) AS FR_NM,             /*������ġ*/
        CASE WHEN D.PRDT_GRP_DTL = '03' THEN 
            CASE WHEN D.DC_RATE = 0 THEN D.DC_AMT
                 ELSE TRUNC(C.AMT * D.DC_RATE/100 )
            END
        END GROUP_SALE,     /* ��ü���� */
        CASE WHEN D.PRDT_GRP_DTL IS NULL OR  D.PRDT_GRP_DTL !='03' THEN 
            CASE WHEN D.DC_RATE = 0 THEN D.DC_AMT
                 ELSE TRUNC(C.AMT * D.DC_RATE/100 ) 
            END
        END CHNL_SALE       /* �Ǹ�ä������ */
        
    FROM RTSD0004 A, RTSD0005 B, RTSD0008 C, RTSD0020 D, RTSD0021 E
    WHERE 1=1
    
        AND A.SECTION_WIDTH = B.SECTION_WIDTH
        AND A.ASPECT_RATIO = B.ASPECT_RATIO
        AND A.WHEEL_INCHES = B.WHEEL_INCHES
        AND A.PLY_RATING = B.PLY_RATING
        AND A.USE_YN = 'Y'
        AND B.USE_YN = 'Y'
        AND C.PRICE_CD = '0002'
        AND B.MAT_CD = C.MAT_CD 
        AND C.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---������
        AND C.END_DAY >= to_char(sysdate,'YYYYMMDD') ---������
        AND D.SALE_CD = E.SALE_CD 
        AND E.GDS_GB = '1' 
        AND E.SALE_GDS_CD = B.PETTERN_CD
        AND B.MAT_CD NOT IN(SELECT MAT_CD FROM RTSD0046 WHERE SALE_CD=v_Sale_Cd)    
        AND D.SALE_CD = DECODE(v_Sale_Cd  , NULL, D.SALE_CD  , v_Sale_Cd)  --- ������
        AND A.MODEL_CD = DECODE(v_Model_Cd  , NULL, A.MODEL_CD  , v_Model_Cd)  --- ������
        AND C.PERIOD_CD = DECODE(v_Period_Cd  , NULL, C.PERIOD_CD  , v_Period_Cd)  --- ȭ���Է�_��Ż�Ⱓ
        AND C.CNT_CD = DECODE(v_Cnt_Cd  , NULL, C.CNT_CD  , v_Cnt_Cd)     --- ȭ���Է�_Ÿ�̾��   
        AND A.CONTENTS_CD = DECODE(v_contents_Cd  , NULL, A.CONTENTS_CD  , v_contents_Cd)     --- ������
        AND A.FR_CD = DECODE(v_fr_Cd  , NULL, A.FR_CD  , v_fr_Cd)     --- ������ġ
        AND B.SEASON_CD     = DECODE(v_Season_cd  , NULL, B.SEASON_CD  , v_Season_cd)                 ---��������
        AND B.PETTERN_CD    = DECODE(replace(v_Pettern_cd,';apos;',''''), NULL, B.PETTERN_CD, replace(v_Pettern_cd,';apos;',''''))
        AND B.SECTION_WIDTH||'/'||B.ASPECT_RATIO||'R'||B.WHEEL_INCHES||' '||B.PLY_RATING||'P' = DECODE(v_Spec_cd, NULL, B.SECTION_WIDTH||'/'||B.ASPECT_RATIO||'R'||B.WHEEL_INCHES||' '||B.PLY_RATING||'P',v_Spec_cd) 
        
    ORDER BY E.SALE_GDS_CD;
    
  END p_sRtsd0008AddProduct;
  
  
  /*****************************************************************************
  -- ��ະ ����� ��ǰ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddSelProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,          /*����                */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,         /*�Ⱓ�ڵ�            */  
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,            /*Ÿ�̾��          */ 
    v_Ord_no         IN RTSD0106.ORD_NO%TYPE,            /*����ȣ            */  
    v_Sale_Cd        IN RTSD0020.SALE_CD%TYPE,           /*Ÿ�̾��          */
    v_contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE        /*������            */
  ) IS

  BEGIN
    
    IF v_Sale_Cd IS NULL THEN   /* AS-IS ������ ��ȸ */
    
    
        OPEN Ref_Cursor FOR
    
        SELECT AA.PRS_PK,
           AA.SALE_GDS_CD,
           AA.STANDARD,
           AA.MAT_CD,
           AA.MAT_NM,
           AA.PERIOD_CD,
           AA.PERIOD_NM,
           AA.SEASON_CD,
           AA.SEASON_NM,
           AA.CNT_CD,
           AA.CNT_NM,
           AA.AMT,
           AA.GROUP_SALE,
           AA.CHNL_SALE,
           BB.ORD_NO,
           BB.SEQ,
           BB.ORD_ID,
           BB.REGI_CD,
           BB.FR_CD,
           PKG_RTCM0051.F_SRTCM0051CODENAME('S004', BB.FR_CD) AS FR_NM,             /*������ġ*/
           BB.LR_CD,
           BB.ORD_QTY,
           BB.REGI_AMT,
           BB.RENT_AMT,
           BB.RENTP_AMT,
           BB.F_DCRATE,
           BB.F_DCAMT,
           BB.MON_DCAMT,
           BB.MON_AMT,
           BB.PLAN_DAY,
           BB.PLAN_TM,
           BB.INST_DAY,
           BB.INST_TM,
           BB.INST_YN,
           BB.VAL_YN,
           BB.EQU_NO,
           BB.OS_ID,
           BB.OS_DAY,
           BB.STAT_CD,
           BB.FL_YN,
           BB.FR_YN,
           BB.RL_YN,
           BB.RR_YN,
           BB.MAT_DESC,
           BB.SALE_CD,
           BB.GDS_GB,
           BB.GDS_GRP
       FROM (SELECT E.MAT_CD||F.PERIOD_CD||F.CNT_CD as PRS_PK,
                   E.PETTERN_CD AS SALE_GDS_CD,
                   E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES as STANDARD,  /* �� �� */
                   E.MAT_CD,                                                               /* ��ǰ�ڵ� */
                   E.MAT_NM,                                                               /* ��ǰ�� */
                   F.PERIOD_CD,
                   PKG_RTCM0051.F_SRTCM0051CODENAME('S021',F.PERIOD_CD) AS PERIOD_NM,      /*��Ż�Ⱓ */
                   E.SEASON_CD,
                   PKG_RTCM0051.F_SRTCM0051CODENAME('S014',E.SEASON_CD) AS SEASON_NM,      /*�������и� */
                   F.CNT_CD,
                   PKG_RTCM0051.F_SRTCM0051CODENAME('S022',F.CNT_CD) AS CNT_NM,            /*���� */
                   F.REGI_CD,
                   F.AMT,                                                                  /* �� ��Ż�� */
                   0 AS GROUP_SALE,
                   0 AS CHNL_SALE
              FROM RTSD0005 E, RTSD0008 F
             WHERE 1=1
               AND E.USE_YN = 'Y'
               AND E.MAT_CD = F.MAT_CD
               AND F.PRICE_CD = '0002'
               AND F.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---������
               AND F.END_DAY >= to_char(sysdate,'YYYYMMDD') ---������
          ) AA, RTSD0106 BB
        WHERE AA.PERIOD_CD = BB.PERIOD_CD --- ȭ���Է�_��Ż�Ⱓ
        AND AA.CNT_CD = BB.CNT_CD     --- ȭ���Է�_Ÿ�̾��    
        AND AA.MAT_CD = BB.MAT_CD  -- ��ະ    
        AND BB.ORD_NO = v_Ord_no;
        
    ELSE  /* TO-BE ������ ��ȸ */
    
        OPEN Ref_Cursor FOR
        
        SELECT AA.PRS_PK,
               AA.SALE_GDS_CD,
               AA.STANDARD,
               AA.MAT_CD,
               AA.MAT_NM,
               AA.PERIOD_CD,
               AA.PERIOD_NM,
               AA.SEASON_CD,
               AA.SEASON_NM,
               AA.CNT_CD,
               AA.CNT_NM,
               AA.AMT,
               AA.GROUP_SALE,
               AA.CHNL_SALE,
               BB.ORD_NO,
               BB.SEQ,
               BB.ORD_ID,
               BB.REGI_CD,
               BB.FR_CD,
               PKG_RTCM0051.F_SRTCM0051CODENAME('S004', BB.FR_CD) AS FR_NM,             /*������ġ*/
               BB.LR_CD,
               BB.ORD_QTY,
               AA.REGI_AMT,
               BB.RENT_AMT,
               BB.RENTP_AMT,
               BB.F_DCRATE,
               BB.F_DCAMT,
               BB.MON_DCAMT,
               BB.MON_AMT,
               BB.PLAN_DAY,
               BB.PLAN_TM,
               BB.INST_DAY,
               BB.INST_TM,
               BB.INST_YN,
               BB.VAL_YN,
               BB.EQU_NO,
               BB.OS_ID,
               BB.OS_DAY,
               BB.STAT_CD,
               BB.FL_YN,
               BB.FR_YN,
               BB.RL_YN,
               BB.RR_YN,
               BB.MAT_DESC,
               BB.SALE_CD,
               BB.GDS_GB,
               BB.GDS_GRP
          FROM (SELECT E.MAT_CD||F.PERIOD_CD||F.CNT_CD as PRS_PK,
                       H.SALE_GDS_CD,                                                          /*�����ڵ� */
                       E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES as STANDARD,  /* �� �� */
                       E.MAT_CD,                                                               /* ��ǰ�ڵ� */
                       E.MAT_NM,                                                               /* ��ǰ�� */
                       F.PERIOD_CD,
                       PKG_RTCM0051.F_SRTCM0051CODENAME('S021',F.PERIOD_CD) AS PERIOD_NM,      /*��Ż�Ⱓ */
                       E.SEASON_CD,
                       PKG_RTCM0051.F_SRTCM0051CODENAME('S014',E.SEASON_CD) AS SEASON_NM,      /*�������и� */
                       F.CNT_CD,
                       PKG_RTCM0051.F_SRTCM0051CODENAME('S022',F.CNT_CD) AS CNT_NM,            /*���� */
                       F.REGI_CD,
                       --Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',F.REGI_CD) AS REGI_AMT,         /*��Ż��Ϻ� */
                       (SELECT T.AMT FROM RTSD0029 T WHERE '0'||T.CNT_CD = F.CNT_CD AND T.SALE_CD = G.SALE_CD) AS REGI_AMT,         /*��Ż��Ϻ� */
                       F.AMT,                                                                  /* �� ��Ż�� */
                       B.FR_CD,
                       CASE WHEN G.PRDT_GRP_DTL = '03' THEN 
                            CASE WHEN G.DC_RATE = 0 THEN G.DC_AMT
                                 ELSE TRUNC(F.AMT * G.DC_RATE/100 )
                            END
                       END GROUP_SALE,     /* ��ü���� */
                       CASE WHEN G.PRDT_GRP_DTL IS NULL OR  G.PRDT_GRP_DTL !='03' THEN 
                            CASE WHEN G.DC_RATE = 0 THEN G.DC_AMT
                                 ELSE TRUNC(F.AMT * G.DC_RATE/100 ) 
                            END
                       END CHNL_SALE       /* �Ǹ�ä������ */
                  FROM RTSD0001 A, RTSD0002 B, RTSD0004 C, RTSD0005 E, RTSD0008 F, RTSD0020 G, RTSD0021 H
                 WHERE A. MODEL_CD = B.MODEL_CD
                   AND A. MODEL_CD = C.MODEL_CD
                   AND A. CONTENTS_CD = C.CONTENTS_CD
                   AND A. CONTENTS_CD = B.CONTENTS_CD
                   AND B.FR_CD = C.FR_CD
                   AND C.SECTION_WIDTH = E.SECTION_WIDTH
                   AND C.ASPECT_RATIO = E.ASPECT_RATIO
                   AND C.WHEEL_INCHES = E.WHEEL_INCHES
                   AND C.PLY_RATING = E.PLY_RATING
                   AND A.USE_YN = 'Y'
                   AND B.USE_YN = 'Y'
                   AND C.USE_YN = 'Y'
                   AND E.USE_YN = 'Y'
                   AND F.PRICE_CD = '0002'
                   AND E.MAT_CD = F.MAT_CD
                   AND F.PRICE_CD = '0002'
                   AND F.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---������
                   AND F.END_DAY >= to_char(sysdate,'YYYYMMDD') ---������
                   AND G.SALE_CD = DECODE(v_Sale_Cd  , NULL, G.SALE_CD  , v_Sale_Cd)
                   AND G.SALE_CD = H.SALE_CD 
                   AND H.GDS_GB = '1' 
                   AND H.SALE_GDS_CD = E.PETTERN_CD    
                   AND A.MODEL_CD = DECODE(v_Model_Cd  , NULL, A.MODEL_CD  , v_Model_Cd)  --- ������
                   AND B.CONTENTS_CD = DECODE(v_contents_Cd  , NULL, B.CONTENTS_CD  , v_contents_Cd)
              ) AA, RTSD0106 BB
        WHERE AA.PERIOD_CD = BB.PERIOD_CD --- ȭ���Է�_��Ż�Ⱓ
          AND AA.CNT_CD = BB.CNT_CD     --- ȭ���Է�_Ÿ�̾��    
          AND AA.MAT_CD = BB.MAT_CD  -- ��ະ  
          AND AA.FR_CD = BB.FR_CD
          AND BB.ORD_NO = v_Ord_no
        ORDER BY AA.SALE_GDS_CD;
        
    END IF;
    
  END p_sRtsd0008AddSelProduct;





  /*****************************************************************************
  -- ��ະ ����� ��ǰ���� Select �Ͻú�
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddSelProductDirect (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,         /*�Ⱓ�ڵ�            */  
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,            /*Ÿ�̾��          */ 
    v_Ord_no         IN RTSD0106.ORD_NO%TYPE,            /*����ȣ            */  
    v_Sale_Cd        IN RTSD0020.SALE_CD%TYPE            /*Ÿ�̾��          */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    
  SELECT
       T1.MAT_CD||T2.PERIOD_CD||T2.CNT_CD as PRS_PK, 
       T1.MAT_CD,
       T1.MAT_NM,
       T1.SECTION_WIDTH||'/'||T1.ASPECT_RATIO||'R'||T1.WHEEL_INCHES as STANDARD,
       T1.PETTERN_CD,
       T1.SEASON_CD,
       PKG_RTCM0051.F_SRTCM0051CODENAME('S014', T1.SEASON_CD) AS SEASON_NM,      /*�������и� */
       T2.PERIOD_CD,
       PKG_RTCM0051.F_SRTCM0051CODENAME('S021',T2.PERIOD_CD) AS PERIOD_NM,      /*��Ż�Ⱓ */
       T4.SALE_GDS_CD,
       T2.CNT_CD,
       PKG_RTCM0051.F_SRTCM0051CODENAME('S022',T2.CNT_CD) AS CNT_NM,
       T2.REGI_CD,
       (SELECT X.AMT FROM RTSD0029 X WHERE '0'||X.CNT_CD = T2.CNT_CD AND X.SALE_CD = T3.SALE_CD) AS REGI_AMT,         /*��Ż��Ϻ� */
       T2.AMT,
       T.ORD_NO,
       T.SEQ,
       T.ORD_ID,
       T.REGI_CD,
       T.FR_CD,
       T.LR_CD,
       T.ORD_QTY,
       T.RENT_AMT,
       T.RENTP_AMT,
       T.F_DCRATE,
       T.F_DCAMT,
       T.MON_DCAMT,
       T.MON_AMT,
       T.PLAN_DAY,
       T.PLAN_TM,
       T.INST_DAY,
       T.INST_TM,
       T.INST_YN,
       T.VAL_YN,
       T.EQU_NO,
       T.OS_ID,
       T.OS_DAY,
       T.STAT_CD,
       T.FL_YN,
       T.FR_YN,
       T.RL_YN,
       T.RR_YN,
       T.MAT_DESC,
       T.SALE_CD,
       T.GDS_GB,
       T.GDS_GRP,
       CASE
         WHEN T3.PRDT_GRP_DTL = '3' THEN
         CASE
           WHEN T3.DC_RATE = 0 THEN T3.DC_AMT
           ELSE TRUNC(T2.AMT * T3.DC_RATE/100 )
         END
       END GROUP_SALE,
 /* ��ü���� */
       CASE
         WHEN T3.PRDT_GRP_DTL IS NULL
    OR T3.PRDT_GRP_DTL !='3' THEN
         CASE
           WHEN T3.DC_RATE = 0 THEN T3.DC_AMT
           ELSE TRUNC(T2.AMT * T3.DC_RATE/100 )
         END
       END CHNL_SALE /* �Ǹ�ä������ */
  FROM RTSD0106 T,
       RTSD0005 T1,
       RTSD0008 T2,
       RTSD0020 T3,
       RTSD0021 T4
 WHERE  T.ORD_NO = DECODE(v_Ord_no  , NULL, T.ORD_NO  , v_Ord_no)  --- ������
   AND T.MAT_CD = T1.MAT_CD
   AND T1.MAT_CD = T2.MAT_CD
   AND T.PERIOD_CD = T2.PERIOD_CD
   AND T.CNT_CD = T2.CNT_CD
   AND T2.PRICE_CD = '0002'
   AND T.SALE_CD = T3.SALE_CD
   AND T3.SALE_CD = DECODE(v_Sale_Cd  , NULL, T3.SALE_CD  , v_Sale_Cd)  --- ������
   AND T.SALE_CD = T4.SALE_CD
   AND T4.GDS_GB = '1'
   AND T1.PETTERN_CD = T4.SALE_GDS_CD
   AND TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN T2.STR_DAY AND T2.END_DAY;    
    
  END p_sRtsd0008AddSelProductDirect;


  /*****************************************************************************
  -- ��ǰ�߰� ���� �޺��ڽ�  Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028PetternCombo (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*����                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*�Ⱓ�ڵ�            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*Ÿ�̾��          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*�Ǹ޻�ǰ�ڵ�        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*������            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,              /*������ġ            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
   
    /*SELECT 
        A.SALE_GDS_CD
       
    FROM  RTSD0021 A, RTSD0005 B
    WHERE A.SALE_CD = DECODE(v_Sale_Cd  , NULL, A.SALE_CD  , v_Sale_Cd)  --- ������
    AND   B.SEASON_CD = DECODE(v_Season_Cd  , NULL, B.SEASON_CD  , v_Season_Cd)  --- ������
    AND A.GDS_GB = '1'
    AND A.SALE_GDS_CD = B.PETTERN_CD
    GROUP BY A.SALE_GDS_CD
    ORDER BY A.SALE_GDS_CD;*/
    
    SELECT DISTINCT(AA.SALE_GDS_CD) AS SALE_GDS_CD
    FROM (
            SELECT
                E.SALE_GDS_CD   
            FROM RTSD0004 A, RTSD0005 B, RTSD0008 C, RTSD0021 E
            WHERE 1=1    
                AND A.SECTION_WIDTH = B.SECTION_WIDTH
                AND A.ASPECT_RATIO = B.ASPECT_RATIO
                AND A.WHEEL_INCHES = B.WHEEL_INCHES
                AND A.PLY_RATING = B.PLY_RATING
                AND A.USE_YN = 'Y'
                AND B.USE_YN = 'Y'
                AND C.PRICE_CD = '0002'
                AND B.MAT_CD = C.MAT_CD 
                AND C.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---������
                AND C.END_DAY >= to_char(sysdate,'YYYYMMDD') ---������
                AND E.GDS_GB = '1' 
                AND E.SALE_GDS_CD = B.PETTERN_CD
                AND B.MAT_CD NOT IN(SELECT MAT_CD FROM RTSD0046 WHERE SALE_CD=v_Sale_Cd)    
                AND E.SALE_CD = DECODE(v_Sale_Cd  , NULL, E.SALE_CD  , v_Sale_Cd)  --- ������
                AND A.MODEL_CD = DECODE(v_Model_Cd  , NULL, A.MODEL_CD  , v_Model_Cd)  --- ������
                AND C.PERIOD_CD = DECODE(v_Period_Cd  , NULL, C.PERIOD_CD  , v_Period_Cd)  --- ȭ���Է�_��Ż�Ⱓ
                AND C.CNT_CD = DECODE(v_Cnt_Cd  , NULL, C.CNT_CD  , v_Cnt_Cd)     --- ȭ���Է�_Ÿ�̾��   
                AND A.CONTENTS_CD = DECODE(v_contents_Cd  , NULL, A.CONTENTS_CD  , v_contents_Cd)     --- ������
                AND A.FR_CD = DECODE(v_fr_Cd  , NULL, A.FR_CD  , v_fr_Cd)     --- ������ġ
                AND B.SEASON_CD  = DECODE(v_Season_cd  , NULL, B.SEASON_CD  , v_Season_cd)                 ---��������
            ) AA
    ORDER BY AA.SALE_GDS_CD ASC;
    
    END p_sRtsd0028PetternCombo;

  /*****************************************************************************
  -- ��ǰ�߰� �԰�  �޺��ڽ�  Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028PetternComboStan (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*����                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*�Ⱓ�ڵ�            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*Ÿ�̾��          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*�Ǹ޻�ǰ�ڵ�        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*������            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,              /*������ġ            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE,
    v_Pettern_cd    IN RTSD0005.PETTERN_CD%TYPE
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    SELECT DISTINCT(AA.SPEC_NM) AS SPEC_NM
    FROM (
            SELECT
                B.SECTION_WIDTH||'/'||B.ASPECT_RATIO||'R'||B.WHEEL_INCHES||' '||B.PLY_RATING||'P' AS SPEC_NM        
            FROM RTSD0004 A, RTSD0005 B, RTSD0008 C, RTSD0021 E
            WHERE 1=1    
                AND A.SECTION_WIDTH = B.SECTION_WIDTH
                AND A.ASPECT_RATIO = B.ASPECT_RATIO
                AND A.WHEEL_INCHES = B.WHEEL_INCHES
                AND A.PLY_RATING = B.PLY_RATING
                AND A.USE_YN = 'Y'
                AND B.USE_YN = 'Y'
                AND C.PRICE_CD = '0002'
                AND B.MAT_CD = C.MAT_CD 
                AND C.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---������
                AND C.END_DAY >= to_char(sysdate,'YYYYMMDD') ---������
                AND E.GDS_GB = '1' 
                AND E.SALE_GDS_CD = B.PETTERN_CD
                AND B.MAT_CD NOT IN(SELECT MAT_CD FROM RTSD0046 WHERE SALE_CD=v_Sale_Cd)    
                AND E.SALE_CD = DECODE(v_Sale_Cd  , NULL, E.SALE_CD  , v_Sale_Cd)  --- ������
                AND A.MODEL_CD = DECODE(v_Model_Cd  , NULL, A.MODEL_CD  , v_Model_Cd)  --- ������
                AND C.PERIOD_CD = DECODE(v_Period_Cd  , NULL, C.PERIOD_CD  , v_Period_Cd)  --- ȭ���Է�_��Ż�Ⱓ
                AND C.CNT_CD = DECODE(v_Cnt_Cd  , NULL, C.CNT_CD  , v_Cnt_Cd)     --- ȭ���Է�_Ÿ�̾��   
                AND A.CONTENTS_CD = DECODE(v_contents_Cd  , NULL, A.CONTENTS_CD  , v_contents_Cd)     --- ������
                AND A.FR_CD = DECODE(v_fr_Cd  , NULL, A.FR_CD  , v_fr_Cd)     --- ������ġ
                AND B.SEASON_CD  = DECODE(v_Season_cd  , NULL, B.SEASON_CD  , v_Season_cd)                 ---��������
                AND B.PETTERN_CD = DECODE(replace(v_Pettern_Cd,';apos;',''''), NULL, B.PETTERN_CD, replace(v_Pettern_Cd,';apos;','''')) 
           ) AA
    ORDER BY AA.SPEC_NM ASC;
   
    /*SELECT 
        T1.SEASON_CD
        ,T1.PETTERN_CD
        ,T1.SECTION_WIDTH
        ,T1.ASPECT_RATIO
        ,T1.WHEEL_INCHES
        ,T1.PLY_RATING
        ,T1.SECTION_WIDTH||'/'||T1.ASPECT_RATIO||'R'||T1.WHEEL_INCHES||' '||T1.PLY_RATING||'P' AS SPEC_NM
    FROM  RTSD0021 T, RTSD0005 T1, RTSD0004 T2
    WHERE T.SALE_CD = DECODE(v_Sale_Cd  , NULL, T.SALE_CD  , v_Sale_Cd)  --- ������
    AND   T1.SEASON_CD = DECODE(v_Season_Cd  , NULL, T1.SEASON_CD  , v_Season_Cd)  --- ������
    AND   T1.PETTERN_CD = DECODE(replace(v_Pettern_Cd,';apos;',''''), NULL, T1.PETTERN_CD, replace(v_Pettern_Cd,';apos;','''')) 
    AND T.GDS_GB            = '1'
    AND T1.USE_YN           = 'Y'
    AND T.SALE_GDS_CD       = T1.PETTERN_CD
    AND T2.USE_YN           = 'Y'
    AND T2.MODEL_CD         = DECODE(v_Model_Cd, NULL, T2.MODEL_CD ,v_Model_Cd)
    AND T2.CONTENTS_CD      = DECODE(v_Content_Cd, NULL, T2.CONTENTS_CD ,v_Content_Cd)
    AND T1.SECTION_WIDTH    = T2.SECTION_WIDTH
    AND T1.ASPECT_RATIO     = T2.ASPECT_RATIO
    AND T1.WHEEL_INCHES     = T2.WHEEL_INCHES
    AND T1.PLY_RATING       = T2.PLY_RATING 
    ORDER BY T1.PETTERN_CD;*/
    
    END p_sRtsd0028PetternComboStan;


  /*****************************************************************************
  -- Ÿ�̾� ����  üũ
  *****************************************************************************/
  FUNCTION f_sRtsd0008GetWheelQty(
    v_Model_Cd      IN RTSD0001.MODEL_CD%TYPE,        /*���� �븮��           */
    v_contents_Cd   IN RTSD0001.CONTENTS_CD%TYPE,     /*���� �븮��           */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE            /*���� �븮��           */
    ) RETURN VARCHAR IS
    v_Wheel_Cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT 
            CASE 
                WHEN v_fr_Cd = 'Z' THEN 
                    MIN(T1.WHEEL_QTY) 
                ELSE 
                    MIN(T1.WHEEL_LIMIT_QTY)
        
            END WHEEL_QTY    
    
            INTO v_Wheel_Cnt
    
    FROM RTSD0001 T, RTSD0004 T1
    WHERE T.MODEL_CD = v_Model_Cd
    AND T.CONTENTS_CD = v_contents_Cd
    AND T1.FR_CD = v_fr_Cd
    AND T.MODEL_CD = T1.MODEL_CD
    AND T.CONTENTS_CD = T1.CONTENTS_CD
    AND T1.WHEEL_QTY = (SELECT MIN(A.WHEEL_QTY)  FROM RTSD0004 A WHERE A.MODEL_CD = T1.MODEL_CD AND A.CONTENTS_CD = T1.CONTENTS_CD AND A.FR_CD = T1.FR_CD);

    RETURN v_Wheel_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0008GetWheelQty;


  /*****************************************************************************
  -- ���� ���� Ÿ�̾� ����  üũ
  *****************************************************************************/
  FUNCTION f_sRtsd0008GetWheelQtyLt(
    v_Model_Cd      IN RTSD0001.MODEL_CD%TYPE,        /*���� �븮��           */
    v_contents_Cd   IN RTSD0001.CONTENTS_CD%TYPE,     /*���� �븮��           */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE            /*���� �븮��           */
    ) RETURN VARCHAR IS
    v_Wheel_Cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT MIN(T1.WHEEL_QTY) AS WHEEL_QTY    
           INTO v_Wheel_Cnt
    FROM RTSD0001 T, RTSD0004 T1
    WHERE T.MODEL_CD = v_Model_Cd
    AND T.CONTENTS_CD = v_contents_Cd
    AND T1.FR_CD = v_fr_Cd
    AND T.MODEL_CD = T1.MODEL_CD
    AND T.CONTENTS_CD = T1.CONTENTS_CD
    AND T1.WHEEL_QTY = (SELECT MIN(A.WHEEL_QTY)  FROM RTSD0004 A WHERE A.MODEL_CD = T1.MODEL_CD AND A.CONTENTS_CD = T1.CONTENTS_CD AND A.FR_CD = T1.FR_CD);

    RETURN v_Wheel_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0008GetWheelQtyLt;
END Pkg_Rtsd0008;
/
