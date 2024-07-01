CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0101 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0101
   PURPOSE   해피콜 질의 답변 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 해피콜 질의 답변 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0101Count(
    v_Call_No        IN RTCS0101.CALL_NO%TYPE           /*상담번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 해피콜 질의 답변 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0101 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Call_No         IN RTCS0101.CALL_NO%TYPE,        /*상담번호             */
    v_Object_Qus_01   IN RTCS0101.OBJECT_QUS_01%TYPE,  /*질문1 코드           */
    v_Object_Qus_02   IN RTCS0101.OBJECT_QUS_02%TYPE,  /*질문2 코드           */
    v_Object_Qus_03   IN RTCS0101.OBJECT_QUS_03%TYPE,  /*질문3 코드           */
    v_Object_Qus_04   IN RTCS0101.OBJECT_QUS_04%TYPE,  /*질문4 코드           */
    v_Object_Qus_05   IN RTCS0101.OBJECT_QUS_05%TYPE,  /*질문5 코드           */
    v_Object_Qus_06   IN RTCS0101.OBJECT_QUS_06%TYPE,  /*질문6 코드           */
    v_Object_Qus_07   IN RTCS0101.OBJECT_QUS_07%TYPE,  /*질문7 코드           */
    v_Object_Qus_08   IN RTCS0101.OBJECT_QUS_08%TYPE,  /*질문8 코드           */
    v_Object_Qus_09   IN RTCS0101.OBJECT_QUS_09%TYPE,  /*질문9 코드           */
    v_Object_Qus_10   IN RTCS0101.OBJECT_QUS_10%TYPE,  /*질문10 코드          */
    v_Object_Ans_01   IN RTCS0101.OBJECT_ANS_01%TYPE,  /*답번1코드            */
    v_Object_Ans_02   IN RTCS0101.OBJECT_ANS_02%TYPE,  /*답번2코드            */
    v_Object_Ans_03   IN RTCS0101.OBJECT_ANS_03%TYPE,  /*답번3코드            */
    v_Object_Ans_04   IN RTCS0101.OBJECT_ANS_04%TYPE,  /*답번4코드            */
    v_Object_Ans_05   IN RTCS0101.OBJECT_ANS_05%TYPE,  /*답번5코드            */
    v_Object_Ans_06   IN RTCS0101.OBJECT_ANS_06%TYPE,  /*답번6코드            */
    v_Object_Ans_07   IN RTCS0101.OBJECT_ANS_07%TYPE,  /*답번7코드            */
    v_Object_Ans_08   IN RTCS0101.OBJECT_ANS_08%TYPE,  /*답번8코드            */
    v_Object_Ans_09   IN RTCS0101.OBJECT_ANS_09%TYPE,  /*답번9코드            */
    v_Object_Ans_10   IN RTCS0101.OBJECT_ANS_10%TYPE,  /*답번10코드           */
    v_Object_Jumsu_01 IN RTCS0101.OBJECT_JUMSU_01%TYPE,/*점수1                */
    v_Object_Jumsu_02 IN RTCS0101.OBJECT_JUMSU_02%TYPE,/*점수2                */
    v_Object_Jumsu_03 IN RTCS0101.OBJECT_JUMSU_03%TYPE,/*점수3                */
    v_Object_Jumsu_04 IN RTCS0101.OBJECT_JUMSU_04%TYPE,/*점수4                */
    v_Object_Jumsu_05 IN RTCS0101.OBJECT_JUMSU_05%TYPE,/*점수5                */
    v_Object_Jumsu_06 IN RTCS0101.OBJECT_JUMSU_06%TYPE,/*점수6                */
    v_Object_Jumsu_07 IN RTCS0101.OBJECT_JUMSU_07%TYPE,/*점수7                */
    v_Object_Jumsu_08 IN RTCS0101.OBJECT_JUMSU_08%TYPE,/*점수8                */
    v_Object_Jumsu_09 IN RTCS0101.OBJECT_JUMSU_09%TYPE,/*점수9                */
    v_Object_Jumsu_10 IN RTCS0101.OBJECT_JUMSU_10%TYPE,/*점수10               */
    v_Subject_Qus1    IN RTCS0101.SUBJECT_QUS1%TYPE,   /*주관식 질문 코드 1   */
    v_Subject_Qus2    IN RTCS0101.SUBJECT_QUS2%TYPE,   /*주관식 질문 코드 2   */
    v_Subject_Qus3    IN RTCS0101.SUBJECT_QUS3%TYPE,   /*주관식 질문 코드 3   */
    v_Subject_Qus4    IN RTCS0101.SUBJECT_QUS4%TYPE,   /*주관식 질문 코드 4   */
    v_Subject_Qus5    IN RTCS0101.SUBJECT_QUS5%TYPE,   /*주관식 질문 코드 5   */
    v_Subject_Ans1    IN RTCS0101.SUBJECT_ANS1%TYPE,   /*주관식 답변 1        */
    v_Subject_Ans2    IN RTCS0101.SUBJECT_ANS2%TYPE,   /*주관식 답변 2        */
    v_Subject_Ans3    IN RTCS0101.SUBJECT_ANS3%TYPE,   /*주관식 답변 3        */
    v_Subject_Ans4    IN RTCS0101.SUBJECT_ANS4%TYPE,   /*주관식 답변 4        */
    v_Subject_Ans5    IN RTCS0101.SUBJECT_ANS5%TYPE,   /*주관식 답변 5        */
    v_Reg_Id          IN RTCS0101.REG_ID%TYPE          /*등록자 ID            */
    );

  /*****************************************************************************
  -- 해피콜 질의 답변 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0101 (
    v_Call_No         IN RTCS0101.CALL_NO%TYPE,        /*상담번호             */
    v_Object_Qus_01   IN RTCS0101.OBJECT_QUS_01%TYPE,  /*질문1 코드           */
    v_Object_Qus_02   IN RTCS0101.OBJECT_QUS_02%TYPE,  /*질문2 코드           */
    v_Object_Qus_03   IN RTCS0101.OBJECT_QUS_03%TYPE,  /*질문3 코드           */
    v_Object_Qus_04   IN RTCS0101.OBJECT_QUS_04%TYPE,  /*질문4 코드           */
    v_Object_Qus_05   IN RTCS0101.OBJECT_QUS_05%TYPE,  /*질문5 코드           */
    v_Object_Qus_06   IN RTCS0101.OBJECT_QUS_06%TYPE,  /*질문6 코드           */
    v_Object_Qus_07   IN RTCS0101.OBJECT_QUS_07%TYPE,  /*질문7 코드           */
    v_Object_Qus_08   IN RTCS0101.OBJECT_QUS_08%TYPE,  /*질문8 코드           */
    v_Object_Qus_09   IN RTCS0101.OBJECT_QUS_09%TYPE,  /*질문9 코드           */
    v_Object_Qus_10   IN RTCS0101.OBJECT_QUS_10%TYPE,  /*질문10 코드          */
    v_Object_Ans_01   IN RTCS0101.OBJECT_ANS_01%TYPE,  /*답번1코드            */
    v_Object_Ans_02   IN RTCS0101.OBJECT_ANS_02%TYPE,  /*답번2코드            */
    v_Object_Ans_03   IN RTCS0101.OBJECT_ANS_03%TYPE,  /*답번3코드            */
    v_Object_Ans_04   IN RTCS0101.OBJECT_ANS_04%TYPE,  /*답번4코드            */
    v_Object_Ans_05   IN RTCS0101.OBJECT_ANS_05%TYPE,  /*답번5코드            */
    v_Object_Ans_06   IN RTCS0101.OBJECT_ANS_06%TYPE,  /*답번6코드            */
    v_Object_Ans_07   IN RTCS0101.OBJECT_ANS_07%TYPE,  /*답번7코드            */
    v_Object_Ans_08   IN RTCS0101.OBJECT_ANS_08%TYPE,  /*답번8코드            */
    v_Object_Ans_09   IN RTCS0101.OBJECT_ANS_09%TYPE,  /*답번9코드            */
    v_Object_Ans_10   IN RTCS0101.OBJECT_ANS_10%TYPE,  /*답번10코드           */
    v_Object_Jumsu_01 IN RTCS0101.OBJECT_JUMSU_01%TYPE,/*점수1                */
    v_Object_Jumsu_02 IN RTCS0101.OBJECT_JUMSU_02%TYPE,/*점수2                */
    v_Object_Jumsu_03 IN RTCS0101.OBJECT_JUMSU_03%TYPE,/*점수3                */
    v_Object_Jumsu_04 IN RTCS0101.OBJECT_JUMSU_04%TYPE,/*점수4                */
    v_Object_Jumsu_05 IN RTCS0101.OBJECT_JUMSU_05%TYPE,/*점수5                */
    v_Object_Jumsu_06 IN RTCS0101.OBJECT_JUMSU_06%TYPE,/*점수6                */
    v_Object_Jumsu_07 IN RTCS0101.OBJECT_JUMSU_07%TYPE,/*점수7                */
    v_Object_Jumsu_08 IN RTCS0101.OBJECT_JUMSU_08%TYPE,/*점수8                */
    v_Object_Jumsu_09 IN RTCS0101.OBJECT_JUMSU_09%TYPE,/*점수9                */
    v_Object_Jumsu_10 IN RTCS0101.OBJECT_JUMSU_10%TYPE,/*점수10               */
    v_Subject_Qus1    IN RTCS0101.SUBJECT_QUS1%TYPE,   /*주관식 질문 코드 1   */
    v_Subject_Qus2    IN RTCS0101.SUBJECT_QUS2%TYPE,   /*주관식 질문 코드 2   */
    v_Subject_Qus3    IN RTCS0101.SUBJECT_QUS3%TYPE,   /*주관식 질문 코드 3   */
    v_Subject_Qus4    IN RTCS0101.SUBJECT_QUS4%TYPE,   /*주관식 질문 코드 4   */
    v_Subject_Qus5    IN RTCS0101.SUBJECT_QUS5%TYPE,   /*주관식 질문 코드 5   */
    v_Subject_Ans1    IN RTCS0101.SUBJECT_ANS1%TYPE,   /*주관식 답변 1        */
    v_Subject_Ans2    IN RTCS0101.SUBJECT_ANS2%TYPE,   /*주관식 답변 2        */
    v_Subject_Ans3    IN RTCS0101.SUBJECT_ANS3%TYPE,   /*주관식 답변 3        */
    v_Subject_Ans4    IN RTCS0101.SUBJECT_ANS4%TYPE,   /*주관식 답변 4        */
    v_Subject_Ans5    IN RTCS0101.SUBJECT_ANS5%TYPE,   /*주관식 답변 5        */
    v_Reg_Id          IN RTCS0101.REG_ID%TYPE,         /*등록자 ID            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 해피콜 질의 답변 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0101 (
    v_Call_No         IN RTCS0101.CALL_NO%TYPE,        /*상담번호             */
    v_Object_Qus_01   IN RTCS0101.OBJECT_QUS_01%TYPE,  /*질문1 코드           */
    v_Object_Qus_02   IN RTCS0101.OBJECT_QUS_02%TYPE,  /*질문2 코드           */
    v_Object_Qus_03   IN RTCS0101.OBJECT_QUS_03%TYPE,  /*질문3 코드           */
    v_Object_Qus_04   IN RTCS0101.OBJECT_QUS_04%TYPE,  /*질문4 코드           */
    v_Object_Qus_05   IN RTCS0101.OBJECT_QUS_05%TYPE,  /*질문5 코드           */
    v_Object_Qus_06   IN RTCS0101.OBJECT_QUS_06%TYPE,  /*질문6 코드           */
    v_Object_Qus_07   IN RTCS0101.OBJECT_QUS_07%TYPE,  /*질문7 코드           */
    v_Object_Qus_08   IN RTCS0101.OBJECT_QUS_08%TYPE,  /*질문8 코드           */
    v_Object_Qus_09   IN RTCS0101.OBJECT_QUS_09%TYPE,  /*질문9 코드           */
    v_Object_Qus_10   IN RTCS0101.OBJECT_QUS_10%TYPE,  /*질문10 코드          */
    v_Object_Ans_01   IN RTCS0101.OBJECT_ANS_01%TYPE,  /*답번1코드            */
    v_Object_Ans_02   IN RTCS0101.OBJECT_ANS_02%TYPE,  /*답번2코드            */
    v_Object_Ans_03   IN RTCS0101.OBJECT_ANS_03%TYPE,  /*답번3코드            */
    v_Object_Ans_04   IN RTCS0101.OBJECT_ANS_04%TYPE,  /*답번4코드            */
    v_Object_Ans_05   IN RTCS0101.OBJECT_ANS_05%TYPE,  /*답번5코드            */
    v_Object_Ans_06   IN RTCS0101.OBJECT_ANS_06%TYPE,  /*답번6코드            */
    v_Object_Ans_07   IN RTCS0101.OBJECT_ANS_07%TYPE,  /*답번7코드            */
    v_Object_Ans_08   IN RTCS0101.OBJECT_ANS_08%TYPE,  /*답번8코드            */
    v_Object_Ans_09   IN RTCS0101.OBJECT_ANS_09%TYPE,  /*답번9코드            */
    v_Object_Ans_10   IN RTCS0101.OBJECT_ANS_10%TYPE,  /*답번10코드           */
    v_Object_Jumsu_01 IN RTCS0101.OBJECT_JUMSU_01%TYPE,/*점수1                */
    v_Object_Jumsu_02 IN RTCS0101.OBJECT_JUMSU_02%TYPE,/*점수2                */
    v_Object_Jumsu_03 IN RTCS0101.OBJECT_JUMSU_03%TYPE,/*점수3                */
    v_Object_Jumsu_04 IN RTCS0101.OBJECT_JUMSU_04%TYPE,/*점수4                */
    v_Object_Jumsu_05 IN RTCS0101.OBJECT_JUMSU_05%TYPE,/*점수5                */
    v_Object_Jumsu_06 IN RTCS0101.OBJECT_JUMSU_06%TYPE,/*점수6                */
    v_Object_Jumsu_07 IN RTCS0101.OBJECT_JUMSU_07%TYPE,/*점수7                */
    v_Object_Jumsu_08 IN RTCS0101.OBJECT_JUMSU_08%TYPE,/*점수8                */
    v_Object_Jumsu_09 IN RTCS0101.OBJECT_JUMSU_09%TYPE,/*점수9                */
    v_Object_Jumsu_10 IN RTCS0101.OBJECT_JUMSU_10%TYPE,/*점수10               */
    v_Subject_Qus1    IN RTCS0101.SUBJECT_QUS1%TYPE,   /*주관식 질문 코드 1   */
    v_Subject_Qus2    IN RTCS0101.SUBJECT_QUS2%TYPE,   /*주관식 질문 코드 2   */
    v_Subject_Qus3    IN RTCS0101.SUBJECT_QUS3%TYPE,   /*주관식 질문 코드 3   */
    v_Subject_Qus4    IN RTCS0101.SUBJECT_QUS4%TYPE,   /*주관식 질문 코드 4   */
    v_Subject_Qus5    IN RTCS0101.SUBJECT_QUS5%TYPE,   /*주관식 질문 코드 5   */
    v_Subject_Ans1    IN RTCS0101.SUBJECT_ANS1%TYPE,   /*주관식 답변 1        */
    v_Subject_Ans2    IN RTCS0101.SUBJECT_ANS2%TYPE,   /*주관식 답변 2        */
    v_Subject_Ans3    IN RTCS0101.SUBJECT_ANS3%TYPE,   /*주관식 답변 3        */
    v_Subject_Ans4    IN RTCS0101.SUBJECT_ANS4%TYPE,   /*주관식 답변 4        */
    v_Subject_Ans5    IN RTCS0101.SUBJECT_ANS5%TYPE,   /*주관식 답변 5        */
    v_Reg_Id          IN RTCS0101.REG_ID%TYPE,         /*등록자 ID            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 해피콜 질의 답변 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0101 (
    v_Comm_Dvsn       IN CHAR,                         /*처리구분(I,U,D)      */
    v_Call_No         IN RTCS0101.CALL_NO%TYPE,        /*상담번호             */
    v_Object_Qus_01   IN RTCS0101.OBJECT_QUS_01%TYPE,  /*질문1 코드           */
    v_Object_Qus_02   IN RTCS0101.OBJECT_QUS_02%TYPE,  /*질문2 코드           */
    v_Object_Qus_03   IN RTCS0101.OBJECT_QUS_03%TYPE,  /*질문3 코드           */
    v_Object_Qus_04   IN RTCS0101.OBJECT_QUS_04%TYPE,  /*질문4 코드           */
    v_Object_Qus_05   IN RTCS0101.OBJECT_QUS_05%TYPE,  /*질문5 코드           */
    v_Object_Qus_06   IN RTCS0101.OBJECT_QUS_06%TYPE,  /*질문6 코드           */
    v_Object_Qus_07   IN RTCS0101.OBJECT_QUS_07%TYPE,  /*질문7 코드           */
    v_Object_Qus_08   IN RTCS0101.OBJECT_QUS_08%TYPE,  /*질문8 코드           */
    v_Object_Qus_09   IN RTCS0101.OBJECT_QUS_09%TYPE,  /*질문9 코드           */
    v_Object_Qus_10   IN RTCS0101.OBJECT_QUS_10%TYPE,  /*질문10 코드          */
    v_Object_Ans_01   IN RTCS0101.OBJECT_ANS_01%TYPE,  /*답번1코드            */
    v_Object_Ans_02   IN RTCS0101.OBJECT_ANS_02%TYPE,  /*답번2코드            */
    v_Object_Ans_03   IN RTCS0101.OBJECT_ANS_03%TYPE,  /*답번3코드            */
    v_Object_Ans_04   IN RTCS0101.OBJECT_ANS_04%TYPE,  /*답번4코드            */
    v_Object_Ans_05   IN RTCS0101.OBJECT_ANS_05%TYPE,  /*답번5코드            */
    v_Object_Ans_06   IN RTCS0101.OBJECT_ANS_06%TYPE,  /*답번6코드            */
    v_Object_Ans_07   IN RTCS0101.OBJECT_ANS_07%TYPE,  /*답번7코드            */
    v_Object_Ans_08   IN RTCS0101.OBJECT_ANS_08%TYPE,  /*답번8코드            */
    v_Object_Ans_09   IN RTCS0101.OBJECT_ANS_09%TYPE,  /*답번9코드            */
    v_Object_Ans_10   IN RTCS0101.OBJECT_ANS_10%TYPE,  /*답번10코드           */
    v_Object_Jumsu_01 IN RTCS0101.OBJECT_JUMSU_01%TYPE,/*점수1                */
    v_Object_Jumsu_02 IN RTCS0101.OBJECT_JUMSU_02%TYPE,/*점수2                */
    v_Object_Jumsu_03 IN RTCS0101.OBJECT_JUMSU_03%TYPE,/*점수3                */
    v_Object_Jumsu_04 IN RTCS0101.OBJECT_JUMSU_04%TYPE,/*점수4                */
    v_Object_Jumsu_05 IN RTCS0101.OBJECT_JUMSU_05%TYPE,/*점수5                */
    v_Object_Jumsu_06 IN RTCS0101.OBJECT_JUMSU_06%TYPE,/*점수6                */
    v_Object_Jumsu_07 IN RTCS0101.OBJECT_JUMSU_07%TYPE,/*점수7                */
    v_Object_Jumsu_08 IN RTCS0101.OBJECT_JUMSU_08%TYPE,/*점수8                */
    v_Object_Jumsu_09 IN RTCS0101.OBJECT_JUMSU_09%TYPE,/*점수9                */
    v_Object_Jumsu_10 IN RTCS0101.OBJECT_JUMSU_10%TYPE,/*점수10               */
    v_Subject_Qus1    IN RTCS0101.SUBJECT_QUS1%TYPE,   /*주관식 질문 코드 1   */
    v_Subject_Qus2    IN RTCS0101.SUBJECT_QUS2%TYPE,   /*주관식 질문 코드 2   */
    v_Subject_Qus3    IN RTCS0101.SUBJECT_QUS3%TYPE,   /*주관식 질문 코드 3   */
    v_Subject_Qus4    IN RTCS0101.SUBJECT_QUS4%TYPE,   /*주관식 질문 코드 4   */
    v_Subject_Qus5    IN RTCS0101.SUBJECT_QUS5%TYPE,   /*주관식 질문 코드 5   */
    v_Subject_Ans1    IN RTCS0101.SUBJECT_ANS1%TYPE,   /*주관식 답변 1        */
    v_Subject_Ans2    IN RTCS0101.SUBJECT_ANS2%TYPE,   /*주관식 답변 2        */
    v_Subject_Ans3    IN RTCS0101.SUBJECT_ANS3%TYPE,   /*주관식 답변 3        */
    v_Subject_Ans4    IN RTCS0101.SUBJECT_ANS4%TYPE,   /*주관식 답변 4        */
    v_Subject_Ans5    IN RTCS0101.SUBJECT_ANS5%TYPE,   /*주관식 답변 5        */
    v_Reg_Id          IN RTCS0101.REG_ID%TYPE,         /*등록자 ID            */
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText       OUT VARCHAR2
    );

/*****************************************************************************
-- 질문 리스트
*****************************************************************************/
  PROCEDURE p_sRtcs0101ANS (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No   IN RTCS0100.CALL_NO%TYPE  /*상담번호           */
    );
/*****************************************************************************
-- 답변 리스트
*****************************************************************************/
  PROCEDURE p_sRtcs0101Answer (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Question       IN RTCS0101.OBJECT_ANS_01%TYPE  /*질문내용           */
    );
  /*****************************************************************************
  -- 질문,답변 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0101qustans (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0100.CALL_NO%TYPE  /*상담번호           */
    );
            
END Pkg_Rtcs0101;
/
