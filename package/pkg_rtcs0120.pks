CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0120 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0120
   PURPOSE   ����ڱ��������������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-06  kimhanna         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����ڱ��������������� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0120Count(
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE            /*�ֹ���ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ڱ��������������� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0120 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*�������ڵ�            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*�𵨸�                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*�ܸ���                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*�����                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*��ġ                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ����ڱ��������������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0120 (
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*�������ڵ�            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*�𵨸�                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*�ܸ���                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*�����                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*��ġ                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ڱ��������������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0120 (
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*�������ڵ�            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*�𵨸�                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*�ܸ���                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*�����                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*��ġ                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ڱ��������������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0120 (
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*�������ڵ�            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*�𵨸�                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*�ܸ���                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*�����                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*��ġ                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ڱ��������������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0120 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*�������ڵ�            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*�𵨸�                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*�ܸ���                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*�����                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*��ġ                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtcs0120;
/
