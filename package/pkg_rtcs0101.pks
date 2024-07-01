CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0101 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0101
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
    ) RETURN NUMBER;

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
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;


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
    );

/*****************************************************************************
-- ���� ����Ʈ
*****************************************************************************/
  PROCEDURE p_sRtcs0101ANS (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No   IN RTCS0100.CALL_NO%TYPE  /*����ȣ           */
    );
/*****************************************************************************
-- �亯 ����Ʈ
*****************************************************************************/
  PROCEDURE p_sRtcs0101Answer (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Question       IN RTCS0101.OBJECT_ANS_01%TYPE  /*��������           */
    );
  /*****************************************************************************
  -- ����,�亯 ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0101qustans (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0100.CALL_NO%TYPE  /*����ȣ           */
    );
            
END Pkg_Rtcs0101;
/
