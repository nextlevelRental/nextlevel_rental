CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0112 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0112
   PURPOSE   ��������(������ȣ) ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��������(������ȣ) Count
  *****************************************************************************/
  FUNCTION f_sRtcs0112Count(
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE       /*������ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��������(������ȣ) Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0112 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*��뿩��              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*����                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*�򰡹ݿ�����          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ��������(������ȣ) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*��뿩��              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*����                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*�򰡹ݿ�����          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��������(������ȣ) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*��뿩��              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*����                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*�򰡹ݿ�����          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��������(������ȣ) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��������(������ȣ) ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0112 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*��뿩��              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*����                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*�򰡹ݿ�����          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*�亯��ȣ              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �򰡹ݿ�������ȸ
  *****************************************************************************/
  FUNCTION f_sRtcs0112_JSYN(
    v_Question_No        IN RTCS0112.QUESTION_NO%TYPE   /*������ȣ            */
    ) RETURN VARCHAR ; 
               
    
END Pkg_Rtcs0112;
/
