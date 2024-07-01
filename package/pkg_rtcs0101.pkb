CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0101 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0101
   PURPOSE   ������ ���� �亯 ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ������ ���� �亯 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0101Count(
    v_Call_No        IN RTCS0101.CALL_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0101
    WHERE   CALL_NO = v_Call_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0101Count;

  /*****************************************************************************
  -- ������ ���� �亯 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0101 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Call_No         IN RTCS0101.CALL_NO%TYPE,        /*����ȣ             */
    v_Object_Qus_01   IN RTCS0101.OBJECT_QUS_01%TYPE,  /*����1 �ڵ�           */
    v_Object_Qus_02   IN RTCS0101.OBJECT_QUS_02%TYPE,  /*����2 �ڵ�           */
    v_Object_Qus_03   IN RTCS0101.OBJECT_QUS_03%TYPE,  /*����3 �ڵ�           */
    v_Object_Qus_04   IN RTCS0101.OBJECT_QUS_04%TYPE,  /*����4 �ڵ�           */
    v_Object_Qus_05   IN RTCS0101.OBJECT_QUS_05%TYPE,  /*����5 �ڵ�           */
    v_Object_Qus_06   IN RTCS0101.OBJECT_QUS_06%TYPE,  /*����6 �ڵ�           */
    v_Object_Qus_07   IN RTCS0101.OBJECT_QUS_07%TYPE,  /*����7 �ڵ�           */
    v_Object_Qus_08   IN RTCS0101.OBJECT_QUS_08%TYPE,  /*����8 �ڵ�           */
    v_Object_Qus_09   IN RTCS0101.OBJECT_QUS_09%TYPE,  /*����9 �ڵ�           */
    v_Object_Qus_10   IN RTCS0101.OBJECT_QUS_10%TYPE,  /*����10 �ڵ�          */
    v_Object_Ans_01   IN RTCS0101.OBJECT_ANS_01%TYPE,  /*���1�ڵ�            */
    v_Object_Ans_02   IN RTCS0101.OBJECT_ANS_02%TYPE,  /*���2�ڵ�            */
    v_Object_Ans_03   IN RTCS0101.OBJECT_ANS_03%TYPE,  /*���3�ڵ�            */
    v_Object_Ans_04   IN RTCS0101.OBJECT_ANS_04%TYPE,  /*���4�ڵ�            */
    v_Object_Ans_05   IN RTCS0101.OBJECT_ANS_05%TYPE,  /*���5�ڵ�            */
    v_Object_Ans_06   IN RTCS0101.OBJECT_ANS_06%TYPE,  /*���6�ڵ�            */
    v_Object_Ans_07   IN RTCS0101.OBJECT_ANS_07%TYPE,  /*���7�ڵ�            */
    v_Object_Ans_08   IN RTCS0101.OBJECT_ANS_08%TYPE,  /*���8�ڵ�            */
    v_Object_Ans_09   IN RTCS0101.OBJECT_ANS_09%TYPE,  /*���9�ڵ�            */
    v_Object_Ans_10   IN RTCS0101.OBJECT_ANS_10%TYPE,  /*���10�ڵ�           */
    v_Object_Jumsu_01 IN RTCS0101.OBJECT_JUMSU_01%TYPE,/*����1                */
    v_Object_Jumsu_02 IN RTCS0101.OBJECT_JUMSU_02%TYPE,/*����2                */
    v_Object_Jumsu_03 IN RTCS0101.OBJECT_JUMSU_03%TYPE,/*����3                */
    v_Object_Jumsu_04 IN RTCS0101.OBJECT_JUMSU_04%TYPE,/*����4                */
    v_Object_Jumsu_05 IN RTCS0101.OBJECT_JUMSU_05%TYPE,/*����5                */
    v_Object_Jumsu_06 IN RTCS0101.OBJECT_JUMSU_06%TYPE,/*����6                */
    v_Object_Jumsu_07 IN RTCS0101.OBJECT_JUMSU_07%TYPE,/*����7                */
    v_Object_Jumsu_08 IN RTCS0101.OBJECT_JUMSU_08%TYPE,/*����8                */
    v_Object_Jumsu_09 IN RTCS0101.OBJECT_JUMSU_09%TYPE,/*����9                */
    v_Object_Jumsu_10 IN RTCS0101.OBJECT_JUMSU_10%TYPE,/*����10               */
    v_Subject_Qus1    IN RTCS0101.SUBJECT_QUS1%TYPE,   /*�ְ��� ���� �ڵ� 1   */
    v_Subject_Qus2    IN RTCS0101.SUBJECT_QUS2%TYPE,   /*�ְ��� ���� �ڵ� 2   */
    v_Subject_Qus3    IN RTCS0101.SUBJECT_QUS3%TYPE,   /*�ְ��� ���� �ڵ� 3   */
    v_Subject_Qus4    IN RTCS0101.SUBJECT_QUS4%TYPE,   /*�ְ��� ���� �ڵ� 4   */
    v_Subject_Qus5    IN RTCS0101.SUBJECT_QUS5%TYPE,   /*�ְ��� ���� �ڵ� 5   */
    v_Subject_Ans1    IN RTCS0101.SUBJECT_ANS1%TYPE,   /*�ְ��� �亯 1        */
    v_Subject_Ans2    IN RTCS0101.SUBJECT_ANS2%TYPE,   /*�ְ��� �亯 2        */
    v_Subject_Ans3    IN RTCS0101.SUBJECT_ANS3%TYPE,   /*�ְ��� �亯 3        */
    v_Subject_Ans4    IN RTCS0101.SUBJECT_ANS4%TYPE,   /*�ְ��� �亯 4        */
    v_Subject_Ans5    IN RTCS0101.SUBJECT_ANS5%TYPE,   /*�ְ��� �亯 5        */
    v_Reg_Id          IN RTCS0101.REG_ID%TYPE          /*����� ID            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CALL_NO,                   /*����ȣ            */
            A.OBJECT_QUS_01,             /*����1 �ڵ�          */
            A.OBJECT_QUS_02,             /*����2 �ڵ�          */
            A.OBJECT_QUS_03,             /*����3 �ڵ�          */
            A.OBJECT_QUS_04,             /*����4 �ڵ�          */
            A.OBJECT_QUS_05,             /*����5 �ڵ�          */
            A.OBJECT_QUS_06,             /*����6 �ڵ�          */
            A.OBJECT_QUS_07,             /*����7 �ڵ�          */
            A.OBJECT_QUS_08,             /*����8 �ڵ�          */
            A.OBJECT_QUS_09,             /*����9 �ڵ�          */
            A.OBJECT_QUS_10,             /*����10 �ڵ�         */
            A.OBJECT_ANS_01,             /*���1�ڵ�           */
            A.OBJECT_ANS_02,             /*���2�ڵ�           */
            A.OBJECT_ANS_03,             /*���3�ڵ�           */
            A.OBJECT_ANS_04,             /*���4�ڵ�           */
            A.OBJECT_ANS_05,             /*���5�ڵ�           */
            A.OBJECT_ANS_06,             /*���6�ڵ�           */
            A.OBJECT_ANS_07,             /*���7�ڵ�           */
            A.OBJECT_ANS_08,             /*���8�ڵ�           */
            A.OBJECT_ANS_09,             /*���9�ڵ�           */
            A.OBJECT_ANS_10,             /*���10�ڵ�          */
            A.OBJECT_JUMSU_01,           /*����1               */
            A.OBJECT_JUMSU_02,           /*����2               */
            A.OBJECT_JUMSU_03,           /*����3               */
            A.OBJECT_JUMSU_04,           /*����4               */
            A.OBJECT_JUMSU_05,           /*����5               */
            A.OBJECT_JUMSU_06,           /*����6               */
            A.OBJECT_JUMSU_07,           /*����7               */
            A.OBJECT_JUMSU_08,           /*����8               */
            A.OBJECT_JUMSU_09,           /*����9               */
            A.OBJECT_JUMSU_10,           /*����10              */
            A.SUBJECT_QUS1,              /*�ְ��� ���� �ڵ� 1  */
            A.SUBJECT_QUS2,              /*�ְ��� ���� �ڵ� 2  */
            A.SUBJECT_QUS3,              /*�ְ��� ���� �ڵ� 3  */
            A.SUBJECT_QUS4,              /*�ְ��� ���� �ڵ� 4  */
            A.SUBJECT_QUS5,              /*�ְ��� ���� �ڵ� 5  */
            A.SUBJECT_ANS1,              /*�ְ��� �亯 1       */
            A.SUBJECT_ANS2,              /*�ְ��� �亯 2       */
            A.SUBJECT_ANS3,              /*�ְ��� �亯 3       */
            A.SUBJECT_ANS4,              /*�ְ��� �亯 4       */
            A.SUBJECT_ANS5,              /*�ְ��� �亯 5       */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTCS0101 A
    WHERE   A.CALL_NO          = DECODE(v_Call_No        , NULL, A.CALL_NO         , v_Call_No)
    AND     A.OBJECT_QUS_01    = DECODE(v_Object_Qus_01  , NULL, A.OBJECT_QUS_01   , v_Object_Qus_01)
    AND     A.OBJECT_QUS_02    = DECODE(v_Object_Qus_02  , NULL, A.OBJECT_QUS_02   , v_Object_Qus_02)
    AND     A.OBJECT_QUS_03    = DECODE(v_Object_Qus_03  , NULL, A.OBJECT_QUS_03   , v_Object_Qus_03)
    AND     A.OBJECT_QUS_04    = DECODE(v_Object_Qus_04  , NULL, A.OBJECT_QUS_04   , v_Object_Qus_04)
    AND     A.OBJECT_QUS_05    = DECODE(v_Object_Qus_05  , NULL, A.OBJECT_QUS_05   , v_Object_Qus_05)
    AND     A.OBJECT_QUS_06    = DECODE(v_Object_Qus_06  , NULL, A.OBJECT_QUS_06   , v_Object_Qus_06)
    AND     A.OBJECT_QUS_07    = DECODE(v_Object_Qus_07  , NULL, A.OBJECT_QUS_07   , v_Object_Qus_07)
    AND     A.OBJECT_QUS_08    = DECODE(v_Object_Qus_08  , NULL, A.OBJECT_QUS_08   , v_Object_Qus_08)
    AND     A.OBJECT_QUS_09    = DECODE(v_Object_Qus_09  , NULL, A.OBJECT_QUS_09   , v_Object_Qus_09)
    AND     A.OBJECT_QUS_10    = DECODE(v_Object_Qus_10  , NULL, A.OBJECT_QUS_10   , v_Object_Qus_10)
    AND     A.OBJECT_ANS_01    = DECODE(v_Object_Ans_01  , NULL, A.OBJECT_ANS_01   , v_Object_Ans_01)
    AND     A.OBJECT_ANS_02    = DECODE(v_Object_Ans_02  , NULL, A.OBJECT_ANS_02   , v_Object_Ans_02)
    AND     A.OBJECT_ANS_03    = DECODE(v_Object_Ans_03  , NULL, A.OBJECT_ANS_03   , v_Object_Ans_03)
    AND     A.OBJECT_ANS_04    = DECODE(v_Object_Ans_04  , NULL, A.OBJECT_ANS_04   , v_Object_Ans_04)
    AND     A.OBJECT_ANS_05    = DECODE(v_Object_Ans_05  , NULL, A.OBJECT_ANS_05   , v_Object_Ans_05)
    AND     A.OBJECT_ANS_06    = DECODE(v_Object_Ans_06  , NULL, A.OBJECT_ANS_06   , v_Object_Ans_06)
    AND     A.OBJECT_ANS_07    = DECODE(v_Object_Ans_07  , NULL, A.OBJECT_ANS_07   , v_Object_Ans_07)
    AND     A.OBJECT_ANS_08    = DECODE(v_Object_Ans_08  , NULL, A.OBJECT_ANS_08   , v_Object_Ans_08)
    AND     A.OBJECT_ANS_09    = DECODE(v_Object_Ans_09  , NULL, A.OBJECT_ANS_09   , v_Object_Ans_09)
    AND     A.OBJECT_ANS_10    = DECODE(v_Object_Ans_10  , NULL, A.OBJECT_ANS_10   , v_Object_Ans_10)
    AND     A.OBJECT_JUMSU_01  = DECODE(v_Object_Jumsu_01, NULL, A.OBJECT_JUMSU_01 , v_Object_Jumsu_01)
    AND     A.OBJECT_JUMSU_02  = DECODE(v_Object_Jumsu_02, NULL, A.OBJECT_JUMSU_02 , v_Object_Jumsu_02)
    AND     A.OBJECT_JUMSU_03  = DECODE(v_Object_Jumsu_03, NULL, A.OBJECT_JUMSU_03 , v_Object_Jumsu_03)
    AND     A.OBJECT_JUMSU_04  = DECODE(v_Object_Jumsu_04, NULL, A.OBJECT_JUMSU_04 , v_Object_Jumsu_04)
    AND     A.OBJECT_JUMSU_05  = DECODE(v_Object_Jumsu_05, NULL, A.OBJECT_JUMSU_05 , v_Object_Jumsu_05)
    AND     A.OBJECT_JUMSU_06  = DECODE(v_Object_Jumsu_06, NULL, A.OBJECT_JUMSU_06 , v_Object_Jumsu_06)
    AND     A.OBJECT_JUMSU_07  = DECODE(v_Object_Jumsu_07, NULL, A.OBJECT_JUMSU_07 , v_Object_Jumsu_07)
    AND     A.OBJECT_JUMSU_08  = DECODE(v_Object_Jumsu_08, NULL, A.OBJECT_JUMSU_08 , v_Object_Jumsu_08)
    AND     A.OBJECT_JUMSU_09  = DECODE(v_Object_Jumsu_09, NULL, A.OBJECT_JUMSU_09 , v_Object_Jumsu_09)
    AND     A.OBJECT_JUMSU_10  = DECODE(v_Object_Jumsu_10, NULL, A.OBJECT_JUMSU_10 , v_Object_Jumsu_10)
    AND     A.SUBJECT_QUS1     = DECODE(v_Subject_Qus1   , NULL, A.SUBJECT_QUS1    , v_Subject_Qus1)
    AND     A.SUBJECT_QUS2     = DECODE(v_Subject_Qus2   , NULL, A.SUBJECT_QUS2    , v_Subject_Qus2)
    AND     A.SUBJECT_QUS3     = DECODE(v_Subject_Qus3   , NULL, A.SUBJECT_QUS3    , v_Subject_Qus3)
    AND     A.SUBJECT_QUS4     = DECODE(v_Subject_Qus4   , NULL, A.SUBJECT_QUS4    , v_Subject_Qus4)
    AND     A.SUBJECT_QUS5     = DECODE(v_Subject_Qus5   , NULL, A.SUBJECT_QUS5    , v_Subject_Qus5)
    AND     A.SUBJECT_ANS1     = DECODE(v_Subject_Ans1   , NULL, A.SUBJECT_ANS1    , v_Subject_Ans1)
    AND     A.SUBJECT_ANS2     = DECODE(v_Subject_Ans2   , NULL, A.SUBJECT_ANS2    , v_Subject_Ans2)
    AND     A.SUBJECT_ANS3     = DECODE(v_Subject_Ans3   , NULL, A.SUBJECT_ANS3    , v_Subject_Ans3)
    AND     A.SUBJECT_ANS4     = DECODE(v_Subject_Ans4   , NULL, A.SUBJECT_ANS4    , v_Subject_Ans4)
    AND     A.SUBJECT_ANS5     = DECODE(v_Subject_Ans5   , NULL, A.SUBJECT_ANS5    , v_Subject_Ans5)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtcs0101;

  /*****************************************************************************
  -- ������ ���� �亯 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0101 (
    v_Call_No         IN RTCS0101.CALL_NO%TYPE,        /*����ȣ             */
    v_Object_Qus_01   IN RTCS0101.OBJECT_QUS_01%TYPE,  /*����1 �ڵ�           */
    v_Object_Qus_02   IN RTCS0101.OBJECT_QUS_02%TYPE,  /*����2 �ڵ�           */
    v_Object_Qus_03   IN RTCS0101.OBJECT_QUS_03%TYPE,  /*����3 �ڵ�           */
    v_Object_Qus_04   IN RTCS0101.OBJECT_QUS_04%TYPE,  /*����4 �ڵ�           */
    v_Object_Qus_05   IN RTCS0101.OBJECT_QUS_05%TYPE,  /*����5 �ڵ�           */
    v_Object_Qus_06   IN RTCS0101.OBJECT_QUS_06%TYPE,  /*����6 �ڵ�           */
    v_Object_Qus_07   IN RTCS0101.OBJECT_QUS_07%TYPE,  /*����7 �ڵ�           */
    v_Object_Qus_08   IN RTCS0101.OBJECT_QUS_08%TYPE,  /*����8 �ڵ�           */
    v_Object_Qus_09   IN RTCS0101.OBJECT_QUS_09%TYPE,  /*����9 �ڵ�           */
    v_Object_Qus_10   IN RTCS0101.OBJECT_QUS_10%TYPE,  /*����10 �ڵ�          */
    v_Object_Ans_01   IN RTCS0101.OBJECT_ANS_01%TYPE,  /*���1�ڵ�            */
    v_Object_Ans_02   IN RTCS0101.OBJECT_ANS_02%TYPE,  /*���2�ڵ�            */
    v_Object_Ans_03   IN RTCS0101.OBJECT_ANS_03%TYPE,  /*���3�ڵ�            */
    v_Object_Ans_04   IN RTCS0101.OBJECT_ANS_04%TYPE,  /*���4�ڵ�            */
    v_Object_Ans_05   IN RTCS0101.OBJECT_ANS_05%TYPE,  /*���5�ڵ�            */
    v_Object_Ans_06   IN RTCS0101.OBJECT_ANS_06%TYPE,  /*���6�ڵ�            */
    v_Object_Ans_07   IN RTCS0101.OBJECT_ANS_07%TYPE,  /*���7�ڵ�            */
    v_Object_Ans_08   IN RTCS0101.OBJECT_ANS_08%TYPE,  /*���8�ڵ�            */
    v_Object_Ans_09   IN RTCS0101.OBJECT_ANS_09%TYPE,  /*���9�ڵ�            */
    v_Object_Ans_10   IN RTCS0101.OBJECT_ANS_10%TYPE,  /*���10�ڵ�           */
    v_Object_Jumsu_01 IN RTCS0101.OBJECT_JUMSU_01%TYPE,/*����1                */
    v_Object_Jumsu_02 IN RTCS0101.OBJECT_JUMSU_02%TYPE,/*����2                */
    v_Object_Jumsu_03 IN RTCS0101.OBJECT_JUMSU_03%TYPE,/*����3                */
    v_Object_Jumsu_04 IN RTCS0101.OBJECT_JUMSU_04%TYPE,/*����4                */
    v_Object_Jumsu_05 IN RTCS0101.OBJECT_JUMSU_05%TYPE,/*����5                */
    v_Object_Jumsu_06 IN RTCS0101.OBJECT_JUMSU_06%TYPE,/*����6                */
    v_Object_Jumsu_07 IN RTCS0101.OBJECT_JUMSU_07%TYPE,/*����7                */
    v_Object_Jumsu_08 IN RTCS0101.OBJECT_JUMSU_08%TYPE,/*����8                */
    v_Object_Jumsu_09 IN RTCS0101.OBJECT_JUMSU_09%TYPE,/*����9                */
    v_Object_Jumsu_10 IN RTCS0101.OBJECT_JUMSU_10%TYPE,/*����10               */
    v_Subject_Qus1    IN RTCS0101.SUBJECT_QUS1%TYPE,   /*�ְ��� ���� �ڵ� 1   */
    v_Subject_Qus2    IN RTCS0101.SUBJECT_QUS2%TYPE,   /*�ְ��� ���� �ڵ� 2   */
    v_Subject_Qus3    IN RTCS0101.SUBJECT_QUS3%TYPE,   /*�ְ��� ���� �ڵ� 3   */
    v_Subject_Qus4    IN RTCS0101.SUBJECT_QUS4%TYPE,   /*�ְ��� ���� �ڵ� 4   */
    v_Subject_Qus5    IN RTCS0101.SUBJECT_QUS5%TYPE,   /*�ְ��� ���� �ڵ� 5   */
    v_Subject_Ans1    IN RTCS0101.SUBJECT_ANS1%TYPE,   /*�ְ��� �亯 1        */
    v_Subject_Ans2    IN RTCS0101.SUBJECT_ANS2%TYPE,   /*�ְ��� �亯 2        */
    v_Subject_Ans3    IN RTCS0101.SUBJECT_ANS3%TYPE,   /*�ְ��� �亯 3        */
    v_Subject_Ans4    IN RTCS0101.SUBJECT_ANS4%TYPE,   /*�ְ��� �亯 4        */
    v_Subject_Ans5    IN RTCS0101.SUBJECT_ANS5%TYPE,   /*�ְ��� �亯 5        */
    v_Reg_Id          IN RTCS0101.REG_ID%TYPE,         /*����� ID            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0101 (
            CALL_NO,
            OBJECT_QUS_01,
            OBJECT_QUS_02,
            OBJECT_QUS_03,
            OBJECT_QUS_04,
            OBJECT_QUS_05,
            OBJECT_QUS_06,
            OBJECT_QUS_07,
            OBJECT_QUS_08,
            OBJECT_QUS_09,
            OBJECT_QUS_10,
            OBJECT_ANS_01,
            OBJECT_ANS_02,
            OBJECT_ANS_03,
            OBJECT_ANS_04,
            OBJECT_ANS_05,
            OBJECT_ANS_06,
            OBJECT_ANS_07,
            OBJECT_ANS_08,
            OBJECT_ANS_09,
            OBJECT_ANS_10,
            OBJECT_JUMSU_01,
            OBJECT_JUMSU_02,
            OBJECT_JUMSU_03,
            OBJECT_JUMSU_04,
            OBJECT_JUMSU_05,
            OBJECT_JUMSU_06,
            OBJECT_JUMSU_07,
            OBJECT_JUMSU_08,
            OBJECT_JUMSU_09,
            OBJECT_JUMSU_10,
            SUBJECT_QUS1,
            SUBJECT_QUS2,
            SUBJECT_QUS3,
            SUBJECT_QUS4,
            SUBJECT_QUS5,
            SUBJECT_ANS1,
            SUBJECT_ANS2,
            SUBJECT_ANS3,
            SUBJECT_ANS4,
            SUBJECT_ANS5,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Call_No,
            v_Object_Qus_01,
            v_Object_Qus_02,
            v_Object_Qus_03,
            v_Object_Qus_04,
            v_Object_Qus_05,
            v_Object_Qus_06,
            v_Object_Qus_07,
            v_Object_Qus_08,
            v_Object_Qus_09,
            v_Object_Qus_10,
            v_Object_Ans_01,
            v_Object_Ans_02,
            v_Object_Ans_03,
            v_Object_Ans_04,
            v_Object_Ans_05,
            v_Object_Ans_06,
            v_Object_Ans_07,
            v_Object_Ans_08,
            v_Object_Ans_09,
            v_Object_Ans_10,
            v_Object_Jumsu_01,
            v_Object_Jumsu_02,
            v_Object_Jumsu_03,
            v_Object_Jumsu_04,
            v_Object_Jumsu_05,
            v_Object_Jumsu_06,
            v_Object_Jumsu_07,
            v_Object_Jumsu_08,
            v_Object_Jumsu_09,
            v_Object_Jumsu_10,
            v_Subject_Qus1,
            v_Subject_Qus2,
            v_Subject_Qus3,
            v_Subject_Qus4,
            v_Subject_Qus5,
            v_Subject_Ans1,
            v_Subject_Ans2,
            v_Subject_Ans3,
            v_Subject_Ans4,
            v_Subject_Ans5,
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

  END f_InsertRtcs0101;

  /*****************************************************************************
  -- ������ ���� �亯 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0101 (
    v_Call_No         IN RTCS0101.CALL_NO%TYPE,        /*����ȣ             */
    v_Object_Qus_01   IN RTCS0101.OBJECT_QUS_01%TYPE,  /*����1 �ڵ�           */
    v_Object_Qus_02   IN RTCS0101.OBJECT_QUS_02%TYPE,  /*����2 �ڵ�           */
    v_Object_Qus_03   IN RTCS0101.OBJECT_QUS_03%TYPE,  /*����3 �ڵ�           */
    v_Object_Qus_04   IN RTCS0101.OBJECT_QUS_04%TYPE,  /*����4 �ڵ�           */
    v_Object_Qus_05   IN RTCS0101.OBJECT_QUS_05%TYPE,  /*����5 �ڵ�           */
    v_Object_Qus_06   IN RTCS0101.OBJECT_QUS_06%TYPE,  /*����6 �ڵ�           */
    v_Object_Qus_07   IN RTCS0101.OBJECT_QUS_07%TYPE,  /*����7 �ڵ�           */
    v_Object_Qus_08   IN RTCS0101.OBJECT_QUS_08%TYPE,  /*����8 �ڵ�           */
    v_Object_Qus_09   IN RTCS0101.OBJECT_QUS_09%TYPE,  /*����9 �ڵ�           */
    v_Object_Qus_10   IN RTCS0101.OBJECT_QUS_10%TYPE,  /*����10 �ڵ�          */
    v_Object_Ans_01   IN RTCS0101.OBJECT_ANS_01%TYPE,  /*���1�ڵ�            */
    v_Object_Ans_02   IN RTCS0101.OBJECT_ANS_02%TYPE,  /*���2�ڵ�            */
    v_Object_Ans_03   IN RTCS0101.OBJECT_ANS_03%TYPE,  /*���3�ڵ�            */
    v_Object_Ans_04   IN RTCS0101.OBJECT_ANS_04%TYPE,  /*���4�ڵ�            */
    v_Object_Ans_05   IN RTCS0101.OBJECT_ANS_05%TYPE,  /*���5�ڵ�            */
    v_Object_Ans_06   IN RTCS0101.OBJECT_ANS_06%TYPE,  /*���6�ڵ�            */
    v_Object_Ans_07   IN RTCS0101.OBJECT_ANS_07%TYPE,  /*���7�ڵ�            */
    v_Object_Ans_08   IN RTCS0101.OBJECT_ANS_08%TYPE,  /*���8�ڵ�            */
    v_Object_Ans_09   IN RTCS0101.OBJECT_ANS_09%TYPE,  /*���9�ڵ�            */
    v_Object_Ans_10   IN RTCS0101.OBJECT_ANS_10%TYPE,  /*���10�ڵ�           */
    v_Object_Jumsu_01 IN RTCS0101.OBJECT_JUMSU_01%TYPE,/*����1                */
    v_Object_Jumsu_02 IN RTCS0101.OBJECT_JUMSU_02%TYPE,/*����2                */
    v_Object_Jumsu_03 IN RTCS0101.OBJECT_JUMSU_03%TYPE,/*����3                */
    v_Object_Jumsu_04 IN RTCS0101.OBJECT_JUMSU_04%TYPE,/*����4                */
    v_Object_Jumsu_05 IN RTCS0101.OBJECT_JUMSU_05%TYPE,/*����5                */
    v_Object_Jumsu_06 IN RTCS0101.OBJECT_JUMSU_06%TYPE,/*����6                */
    v_Object_Jumsu_07 IN RTCS0101.OBJECT_JUMSU_07%TYPE,/*����7                */
    v_Object_Jumsu_08 IN RTCS0101.OBJECT_JUMSU_08%TYPE,/*����8                */
    v_Object_Jumsu_09 IN RTCS0101.OBJECT_JUMSU_09%TYPE,/*����9                */
    v_Object_Jumsu_10 IN RTCS0101.OBJECT_JUMSU_10%TYPE,/*����10               */
    v_Subject_Qus1    IN RTCS0101.SUBJECT_QUS1%TYPE,   /*�ְ��� ���� �ڵ� 1   */
    v_Subject_Qus2    IN RTCS0101.SUBJECT_QUS2%TYPE,   /*�ְ��� ���� �ڵ� 2   */
    v_Subject_Qus3    IN RTCS0101.SUBJECT_QUS3%TYPE,   /*�ְ��� ���� �ڵ� 3   */
    v_Subject_Qus4    IN RTCS0101.SUBJECT_QUS4%TYPE,   /*�ְ��� ���� �ڵ� 4   */
    v_Subject_Qus5    IN RTCS0101.SUBJECT_QUS5%TYPE,   /*�ְ��� ���� �ڵ� 5   */
    v_Subject_Ans1    IN RTCS0101.SUBJECT_ANS1%TYPE,   /*�ְ��� �亯 1        */
    v_Subject_Ans2    IN RTCS0101.SUBJECT_ANS2%TYPE,   /*�ְ��� �亯 2        */
    v_Subject_Ans3    IN RTCS0101.SUBJECT_ANS3%TYPE,   /*�ְ��� �亯 3        */
    v_Subject_Ans4    IN RTCS0101.SUBJECT_ANS4%TYPE,   /*�ְ��� �亯 4        */
    v_Subject_Ans5    IN RTCS0101.SUBJECT_ANS5%TYPE,   /*�ְ��� �亯 5        */
    v_Reg_Id          IN RTCS0101.REG_ID%TYPE,         /*����� ID            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0101
    SET    OBJECT_QUS_01    = v_Object_Qus_01,
           OBJECT_QUS_02    = v_Object_Qus_02,
           OBJECT_QUS_03    = v_Object_Qus_03,
           OBJECT_QUS_04    = v_Object_Qus_04,
           OBJECT_QUS_05    = v_Object_Qus_05,
           OBJECT_QUS_06    = v_Object_Qus_06,
           OBJECT_QUS_07    = v_Object_Qus_07,
           OBJECT_QUS_08    = v_Object_Qus_08,
           OBJECT_QUS_09    = v_Object_Qus_09,
           OBJECT_QUS_10    = v_Object_Qus_10,
           OBJECT_ANS_01    = v_Object_Ans_01,
           OBJECT_ANS_02    = v_Object_Ans_02,
           OBJECT_ANS_03    = v_Object_Ans_03,
           OBJECT_ANS_04    = v_Object_Ans_04,
           OBJECT_ANS_05    = v_Object_Ans_05,
           OBJECT_ANS_06    = v_Object_Ans_06,
           OBJECT_ANS_07    = v_Object_Ans_07,
           OBJECT_ANS_08    = v_Object_Ans_08,
           OBJECT_ANS_09    = v_Object_Ans_09,
           OBJECT_ANS_10    = v_Object_Ans_10,
           OBJECT_JUMSU_01  = v_Object_Jumsu_01,
           OBJECT_JUMSU_02  = v_Object_Jumsu_02,
           OBJECT_JUMSU_03  = v_Object_Jumsu_03,
           OBJECT_JUMSU_04  = v_Object_Jumsu_04,
           OBJECT_JUMSU_05  = v_Object_Jumsu_05,
           OBJECT_JUMSU_06  = v_Object_Jumsu_06,
           OBJECT_JUMSU_07  = v_Object_Jumsu_07,
           OBJECT_JUMSU_08  = v_Object_Jumsu_08,
           OBJECT_JUMSU_09  = v_Object_Jumsu_09,
           OBJECT_JUMSU_10  = v_Object_Jumsu_10,
           SUBJECT_QUS1     = v_Subject_Qus1,
           SUBJECT_QUS2     = v_Subject_Qus2,
           SUBJECT_QUS3     = v_Subject_Qus3,
           SUBJECT_QUS4     = v_Subject_Qus4,
           SUBJECT_QUS5     = v_Subject_Qus5,
           SUBJECT_ANS1     = v_Subject_Ans1,
           SUBJECT_ANS2     = v_Subject_Ans2,
           SUBJECT_ANS3     = v_Subject_Ans3,
           SUBJECT_ANS4     = v_Subject_Ans4,
           SUBJECT_ANS5     = v_Subject_Ans5,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  CALL_NO          = v_Call_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0101;

  /*****************************************************************************
  -- ������ ���� �亯 ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0101 (
    v_Comm_Dvsn       IN CHAR,                         /*ó������(I,U,D)      */
    v_Call_No         IN RTCS0101.CALL_NO%TYPE,        /*����ȣ             */
    v_Object_Qus_01   IN RTCS0101.OBJECT_QUS_01%TYPE,  /*����1 �ڵ�           */
    v_Object_Qus_02   IN RTCS0101.OBJECT_QUS_02%TYPE,  /*����2 �ڵ�           */
    v_Object_Qus_03   IN RTCS0101.OBJECT_QUS_03%TYPE,  /*����3 �ڵ�           */
    v_Object_Qus_04   IN RTCS0101.OBJECT_QUS_04%TYPE,  /*����4 �ڵ�           */
    v_Object_Qus_05   IN RTCS0101.OBJECT_QUS_05%TYPE,  /*����5 �ڵ�           */
    v_Object_Qus_06   IN RTCS0101.OBJECT_QUS_06%TYPE,  /*����6 �ڵ�           */
    v_Object_Qus_07   IN RTCS0101.OBJECT_QUS_07%TYPE,  /*����7 �ڵ�           */
    v_Object_Qus_08   IN RTCS0101.OBJECT_QUS_08%TYPE,  /*����8 �ڵ�           */
    v_Object_Qus_09   IN RTCS0101.OBJECT_QUS_09%TYPE,  /*����9 �ڵ�           */
    v_Object_Qus_10   IN RTCS0101.OBJECT_QUS_10%TYPE,  /*����10 �ڵ�          */
    v_Object_Ans_01   IN RTCS0101.OBJECT_ANS_01%TYPE,  /*���1�ڵ�            */
    v_Object_Ans_02   IN RTCS0101.OBJECT_ANS_02%TYPE,  /*���2�ڵ�            */
    v_Object_Ans_03   IN RTCS0101.OBJECT_ANS_03%TYPE,  /*���3�ڵ�            */
    v_Object_Ans_04   IN RTCS0101.OBJECT_ANS_04%TYPE,  /*���4�ڵ�            */
    v_Object_Ans_05   IN RTCS0101.OBJECT_ANS_05%TYPE,  /*���5�ڵ�            */
    v_Object_Ans_06   IN RTCS0101.OBJECT_ANS_06%TYPE,  /*���6�ڵ�            */
    v_Object_Ans_07   IN RTCS0101.OBJECT_ANS_07%TYPE,  /*���7�ڵ�            */
    v_Object_Ans_08   IN RTCS0101.OBJECT_ANS_08%TYPE,  /*���8�ڵ�            */
    v_Object_Ans_09   IN RTCS0101.OBJECT_ANS_09%TYPE,  /*���9�ڵ�            */
    v_Object_Ans_10   IN RTCS0101.OBJECT_ANS_10%TYPE,  /*���10�ڵ�           */
    v_Object_Jumsu_01 IN RTCS0101.OBJECT_JUMSU_01%TYPE,/*����1                */
    v_Object_Jumsu_02 IN RTCS0101.OBJECT_JUMSU_02%TYPE,/*����2                */
    v_Object_Jumsu_03 IN RTCS0101.OBJECT_JUMSU_03%TYPE,/*����3                */
    v_Object_Jumsu_04 IN RTCS0101.OBJECT_JUMSU_04%TYPE,/*����4                */
    v_Object_Jumsu_05 IN RTCS0101.OBJECT_JUMSU_05%TYPE,/*����5                */
    v_Object_Jumsu_06 IN RTCS0101.OBJECT_JUMSU_06%TYPE,/*����6                */
    v_Object_Jumsu_07 IN RTCS0101.OBJECT_JUMSU_07%TYPE,/*����7                */
    v_Object_Jumsu_08 IN RTCS0101.OBJECT_JUMSU_08%TYPE,/*����8                */
    v_Object_Jumsu_09 IN RTCS0101.OBJECT_JUMSU_09%TYPE,/*����9                */
    v_Object_Jumsu_10 IN RTCS0101.OBJECT_JUMSU_10%TYPE,/*����10               */
    v_Subject_Qus1    IN RTCS0101.SUBJECT_QUS1%TYPE,   /*�ְ��� ���� �ڵ� 1   */
    v_Subject_Qus2    IN RTCS0101.SUBJECT_QUS2%TYPE,   /*�ְ��� ���� �ڵ� 2   */
    v_Subject_Qus3    IN RTCS0101.SUBJECT_QUS3%TYPE,   /*�ְ��� ���� �ڵ� 3   */
    v_Subject_Qus4    IN RTCS0101.SUBJECT_QUS4%TYPE,   /*�ְ��� ���� �ڵ� 4   */
    v_Subject_Qus5    IN RTCS0101.SUBJECT_QUS5%TYPE,   /*�ְ��� ���� �ڵ� 5   */
    v_Subject_Ans1    IN RTCS0101.SUBJECT_ANS1%TYPE,   /*�ְ��� �亯 1        */
    v_Subject_Ans2    IN RTCS0101.SUBJECT_ANS2%TYPE,   /*�ְ��� �亯 2        */
    v_Subject_Ans3    IN RTCS0101.SUBJECT_ANS3%TYPE,   /*�ְ��� �亯 3        */
    v_Subject_Ans4    IN RTCS0101.SUBJECT_ANS4%TYPE,   /*�ְ��� �亯 4        */
    v_Subject_Ans5    IN RTCS0101.SUBJECT_ANS5%TYPE,   /*�ְ��� �亯 5        */
    v_Reg_Id          IN RTCS0101.REG_ID%TYPE,         /*����� ID            */
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText       OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:����ȣ, ����� ID
    IF (TRIM(v_Call_No) IS NULL) OR (0 = Pkg_Rtcs0100.f_sRtcs0100Count(v_Call_No)) THEN
        v_Return_Message := '����ȣ('||v_Call_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtcs0101Count(v_Call_No) THEN
            v_Return_Message := '�ش� ����ȣ('||v_Call_No||')�� ��ϵ� ������ �̹� �����ϹǷ� �űԵ�� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtcs0101(v_Call_No, v_Object_Qus_01, v_Object_Qus_02, v_Object_Qus_03,
                                 v_Object_Qus_04, v_Object_Qus_05, v_Object_Qus_06, v_Object_Qus_07,
                                 v_Object_Qus_08, v_Object_Qus_09, v_Object_Qus_10, v_Object_Ans_01,
                                 v_Object_Ans_02, v_Object_Ans_03, v_Object_Ans_04, v_Object_Ans_05,
                                 v_Object_Ans_06, v_Object_Ans_07, v_Object_Ans_08, v_Object_Ans_09,
                                 v_Object_Ans_10, v_Object_Jumsu_01, v_Object_Jumsu_02, v_Object_Jumsu_03,
                                 v_Object_Jumsu_04, v_Object_Jumsu_05, v_Object_Jumsu_06, v_Object_Jumsu_07,
                                 v_Object_Jumsu_08, v_Object_Jumsu_09, v_Object_Jumsu_10, v_Subject_Qus1,
                                 v_Subject_Qus2, v_Subject_Qus3, v_Subject_Qus4, v_Subject_Qus5,
                                 v_Subject_Ans1, v_Subject_Ans2, v_Subject_Ans3, v_Subject_Ans4,
                                 v_Subject_Ans5, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '������ ���� �亯 ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 = f_sRtcs0101Count(v_Call_No) THEN
            v_Return_Message := '�ش� ����ȣ('||v_Call_No||')�� ��ϵ� ������ ���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;


        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcs0101(v_Call_No, v_Object_Qus_01, v_Object_Qus_02, v_Object_Qus_03,
                                     v_Object_Qus_04, v_Object_Qus_05, v_Object_Qus_06, v_Object_Qus_07,
                                     v_Object_Qus_08, v_Object_Qus_09, v_Object_Qus_10, v_Object_Ans_01,
                                     v_Object_Ans_02, v_Object_Ans_03, v_Object_Ans_04, v_Object_Ans_05,
                                     v_Object_Ans_06, v_Object_Ans_07, v_Object_Ans_08, v_Object_Ans_09,
                                     v_Object_Ans_10, v_Object_Jumsu_01, v_Object_Jumsu_02, v_Object_Jumsu_03,
                                     v_Object_Jumsu_04, v_Object_Jumsu_05, v_Object_Jumsu_06, v_Object_Jumsu_07,
                                     v_Object_Jumsu_08, v_Object_Jumsu_09, v_Object_Jumsu_10, v_Subject_Qus1,
                                     v_Subject_Qus2, v_Subject_Qus3, v_Subject_Qus4, v_Subject_Qus5,
                                     v_Subject_Ans1, v_Subject_Ans2, v_Subject_Ans3, v_Subject_Ans4,
                                     v_Subject_Ans5, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '������ ���� �亯 ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0101.p_IUDRtcs0101(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0101.p_IUDRtcs0101(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0101;

  /*****************************************************************************
  -- ���� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcs0101ANS (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0100.CALL_NO%TYPE  /*����ȣ           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT
            OBJECT_QUS_01, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS QUESTION01,
            OBJECT_QUS_02, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_02) AS QUESTION02,
            OBJECT_QUS_03, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_03) AS QUESTION03,
            OBJECT_QUS_04, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_04) AS QUESTION04,
            OBJECT_QUS_05, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_05) AS QUESTION05,
            OBJECT_QUS_06, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_06) AS QUESTION06,
            OBJECT_QUS_07, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_07) AS QUESTION07,
            OBJECT_QUS_08, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_08) AS QUESTION08,
            OBJECT_QUS_09, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_09) AS QUESTION09,
            OBJECT_QUS_10, (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_10) AS QUESTION10
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_01,
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_02,
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_03,
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_04,
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_05,
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_06,
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_07,
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_08,
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_09,
--            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS OBJECT_ANS_10
    FROM    RTCS0101 A
    WHERE   A.CALL_NO = v_Call_No;



  END p_sRtcs0101ANS;

  /*****************************************************************************
  -- �亯 ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcs0101Answer(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Question       IN RTCS0101.OBJECT_ANS_01%TYPE        /*���1�ڵ�         */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  B.ANSWER_NO||B.ANSWER_SEQ as ANSWER_CD,  /*�亯�ڵ�           */
            B.ANSWER                                 /*�亯����           */
    FROM    RTCS0112 A,
            RTCS0113 B
    WHERE   A.ANSWER_NO = B.ANSWER_NO
    AND     A.QUESTION  = v_Question
    ORDER   BY B.ANSWER_NO;



  END p_sRtcs0101Answer;

  /*****************************************************************************
  -- ����,�亯 ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0101qustans (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0100.CALL_NO%TYPE  /*����ȣ           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01) AS QUESTION01,
            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_02) AS QUESTION02,
            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_03) AS QUESTION03,
            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_04) AS QUESTION04,
            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_05) AS QUESTION05,
            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_06) AS QUESTION06,
            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_07) AS QUESTION07,
            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_08) AS QUESTION08,
            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_09) AS QUESTION09,
            (SELECT B.QUESTION FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_10) AS QUESTION10,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_01),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_01,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_01,4,3)),
                    A.OBJECT_JUMSU_01
                   )
            AS ANSWER_01,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_02),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_02,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_02,4,3)),
                    A.OBJECT_JUMSU_02
                   )
            AS ANSWER_02,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_03),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_03,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_03,4,3)),
                    A.OBJECT_JUMSU_03
                   )
            AS ANSWER_03,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_04),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_04,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_04,4,3)),
                    A.OBJECT_JUMSU_04
                   )
            AS ANSWER_04,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_05),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_05,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_05,4,3)),
                    A.OBJECT_JUMSU_05
                   )
            AS ANSWER_05,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_06),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_06,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_06,4,3)),
                    A.OBJECT_JUMSU_06
                   )
            AS ANSWER_06,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_07),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_07,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_07,4,3)),
                    A.OBJECT_JUMSU_07
                   )
            AS ANSWER_07,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_08),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_08,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_08,4,3)),
                    A.OBJECT_JUMSU_08
                   )
            AS ANSWER_08,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_09),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_09,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_09,4,3)),
                    A.OBJECT_JUMSU_09
                   )
            AS ANSWER_09,
            DECODE((SELECT B.CONF_YN FROM RTCS0112 B WHERE B.QUESTION_NO = A.OBJECT_QUS_10),
                    'N',
                    (SELECT B.ANSWER FROM RTCS0113 B WHERE B.ANSWER_NO =  SUBSTR(A.OBJECT_ANS_10,1,3) AND B.ANSWER_SEQ = SUBSTR(A.OBJECT_ANS_10,4,3)),
                    A.OBJECT_JUMSU_10
                   )
            AS ANSWER_10,
            SUBJECT_QUS1 AS SUBJECT_QUS1,
            SUBJECT_QUS2 AS SUBJECT_QUS2,
            SUBJECT_QUS3 AS SUBJECT_QUS3,
            SUBJECT_QUS4 AS SUBJECT_QUS4,
            SUBJECT_QUS5 AS SUBJECT_QUS5,
            SUBJECT_ANS1 AS SUBJECT_ANS1,
            SUBJECT_ANS2 AS SUBJECT_ANS2,
            SUBJECT_ANS3 AS SUBJECT_ANS3,
            SUBJECT_ANS4 AS SUBJECT_ANS4,
            SUBJECT_ANS5 AS SUBJECT_ANS5
    FROM    RTCS0101 A
    WHERE   A.CALL_NO = v_Call_No;

  END p_sRtcs0101qustans;

END Pkg_Rtcs0101;
/
