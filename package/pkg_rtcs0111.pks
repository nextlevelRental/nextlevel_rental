CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0111 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0111
   PURPOSE   ��������(�������_������ȣ) ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��������(�������_������ȣ) Count
  *****************************************************************************/
  FUNCTION f_sRtcs0111Count(
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,           /*�������            */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE       /*������ȣ            */
    ) RETURN NUMBER;

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
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��������(�������_������ȣ) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0111 (
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*�������              */
    v_Question_No    IN RTCS0111.QUESTION_NO%TYPE,    /*������ȣ              */
    v_Reg_Id         IN RTCS0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

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
    );

  /*****************************************************************************
  -- ��������(�������_������ȣ) - ���ļ����� �������� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0111QuestionNo(
    v_Job_Tp         IN RTCS0111.JOB_TP%TYPE,         /*�������              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*��������              */
    v_Sort_Seq       IN RTCS0111.SORT_SEQ%TYPE        /*���ļ���              */
    ) RETURN VARCHAR;
 
/*****************************************************************************
  -- �����ݻ�� �����ݿ����� ���
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0111Reg (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,       /*����ȣ              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
       
END Pkg_Rtcs0111;
/
