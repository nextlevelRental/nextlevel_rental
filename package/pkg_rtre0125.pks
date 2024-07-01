CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0125 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0125
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
    ) RETURN NUMBER;

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
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] �̿�ó�� �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0125 (
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*����ȣ              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*�̿��׸�              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*�̿�ȸ��              */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

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
    );


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
    ) RETURN NUMBER;


  /*****************************************************************************
  -- [RE] �̿�ó�� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0125MaxSeq(
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,           /*����ȣ            */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE          /*�̿��׸�            */
    ) RETURN NUMBER;


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
    );

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
    );
    
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
    );


END Pkg_Rtre0125;
/
