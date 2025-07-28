CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0111 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0111
   PURPOSE   질문관리(상담유형_질문번호) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 질문관리(상담유형_질문번호) Count
  *****************************************************************************/
  FUNCTION f_sRtcs0111Count(
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,           /*상담유형            */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE       /*질문번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(상담유형_질문번호) Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0111 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*상담유형              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0111.USE_YN%TYPE,         /*사용여부              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE,       /*정렬순번              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 질문관리(상담유형_질문번호) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0111 (
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*상담유형              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0111.USE_YN%TYPE,         /*사용여부              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE,       /*정렬순번              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(상담유형_질문번호) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0111 (
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*상담유형              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0111.USE_YN%TYPE,         /*사용여부              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE,       /*정렬순번              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(상담유형_질문번호) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0111 (
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*상담유형              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*질문번호              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(상담유형_질문번호) 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0111 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*상담유형              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0111.USE_YN%TYPE,         /*사용여부              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE,       /*정렬순번              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 질문관리(상담유형_질문번호) - 정렬순번별 질문유형 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0111QuestionNo(
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*상담유형              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*질문유형              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE        /*정렬순번              */
    ) RETURN VARCHAR;
 
/*****************************************************************************
  -- 해피콜상담 점수반영여부 등록
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0111Reg (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,       /*상담번호              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
       
END Pkg_Rtcs0111;