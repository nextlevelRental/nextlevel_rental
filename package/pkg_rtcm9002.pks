CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm9002 AS
/*******************************************************************************
   NAME      Pkg_Rtcm9002
   PURPOSE   거래테스트

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-09-12  Sean         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 질문관리(답변번호) Count
  *****************************************************************************/
  FUNCTION f_sRtcm9002Count(
    v_Answer_No      IN ZTCS0113.ANSWER_NO%TYPE,        /*답변번호            */
    v_Answer_Seq     IN ZTCS0113.ANSWER_SEQ%TYPE        /*답변순번            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 질문관리(답변번호) Select
  *****************************************************************************/
  PROCEDURE p_sRtcm9002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Answer_No      IN ZTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN ZTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Use_Yn         IN ZTCS0113.USE_YN%TYPE,         /*사용여부              */
    v_Answer         IN ZTCS0113.ANSWER%TYPE,         /*답변내용              */
    v_Score          IN ZTCS0113.SCORE%TYPE,          /*점수                  */
    v_Reg_Id         IN ZTCS0113.REG_ID%TYPE          /*등록자 ID             */
    ); 

  /*****************************************************************************
  -- 질문관리(답변번호) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm9002 (
    v_Answer_No      IN ZTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN ZTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Use_Yn         IN ZTCS0113.USE_YN%TYPE,         /*사용여부              */
    v_Answer         IN ZTCS0113.ANSWER%TYPE,         /*답변내용              */
    v_Score          IN ZTCS0113.SCORE%TYPE,          /*점수                  */
    v_Reg_Id         IN ZTCS0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(답변번호) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm9002 (
    v_Answer_No      IN ZTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN ZTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Use_Yn         IN ZTCS0113.USE_YN%TYPE,         /*사용여부              */
    v_Answer         IN ZTCS0113.ANSWER%TYPE,         /*답변내용              */
    v_Score          IN ZTCS0113.SCORE%TYPE,          /*점수                  */
    v_Reg_Id         IN ZTCS0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(답변번호) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm9002 (
    v_Answer_No      IN ZTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN ZTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Reg_Id         IN ZTCS0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 질문관리(답변번호) 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm9002 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Answer_No      IN ZTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN ZTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Use_Yn         IN ZTCS0113.USE_YN%TYPE,         /*사용여부              */
    v_Answer         IN ZTCS0113.ANSWER%TYPE,         /*답변내용              */
    v_Score          IN ZTCS0113.SCORE%TYPE,          /*점수                  */
    v_Reg_Id         IN ZTCS0113.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 평가반영점수조회
  *****************************************************************************/
  FUNCTION f_sRtcm9002_JS(
    v_Answer_No        IN ZTCS0113.ANSWER_NO%TYPE,      /*질문번호            */
    v_Answer_Seq       IN ZTCS0113.ANSWER_SEQ%TYPE      /*질문번호            */
    ) RETURN NUMBER;

END Pkg_Rtcm9002;
/
