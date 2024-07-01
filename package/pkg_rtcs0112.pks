CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0112 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0112
   PURPOSE   질문관리(질문번호) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 질문관리(질문번호) Count
  *****************************************************************************/
  FUNCTION f_sRtcs0112Count(
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE       /*질문번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(질문번호) Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0112 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*사용여부              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*질문유형              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*질문                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*평가반영여부          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*답변번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 질문관리(질문번호) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*사용여부              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*질문유형              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*질문                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*평가반영여부          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*답변번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(질문번호) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*사용여부              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*질문유형              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*질문                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*평가반영여부          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*답변번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(질문번호) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 질문관리(질문번호) 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0112 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*사용여부              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*질문유형              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*질문                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*평가반영여부          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*답변번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 평가반영여부조회
  *****************************************************************************/
  FUNCTION f_sRtcs0112_JSYN(
    v_Question_No        IN RTCS0112.QUESTION_NO%TYPE   /*질문번호            */
    ) RETURN VARCHAR ; 
               
    
END Pkg_Rtcs0112;
/
