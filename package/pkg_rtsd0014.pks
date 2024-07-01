CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0014 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0014
   PURPOSE   ��ະ ķ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��ະ ķ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0014Count(
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE            /*�ֹ���ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ະ ķ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0014 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE          /*�ֹ���ȣ              */
    );

  /*****************************************************************************
  -- ��ະ ķ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0014 (
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Dc_Tp          IN RTSD0014.DC_TP%TYPE,          /*��������              */
    v_Mat_Cd         IN RTSD0014.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Seq            IN RTSD0014.SEQ%TYPE,            /*����                  */
    v_Dc_Rate        IN RTSD0014.DC_RATE%TYPE,        /*������                */
    v_Dc_Amt         IN RTSD0014.DC_AMT%TYPE,         /*���αݾ�              */
    v_Reg_Id         IN RTSD0014.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ະ ķ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0014 (
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE          /*�ֹ���ȣ              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ະ ķ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0014 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Dc_Tp          IN RTSD0014.DC_TP%TYPE,          /*��������              */
    v_Mat_Cd         IN RTSD0014.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Seq            IN RTSD0014.SEQ%TYPE,            /*����                  */
    v_Dc_Rate        IN RTSD0014.DC_RATE%TYPE,        /*������                */
    v_Dc_Amt         IN RTSD0014.DC_AMT%TYPE,         /*���αݾ�              */
    v_Reg_Id         IN RTSD0014.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ��ະ ķ���� ���� - �¶���
  *****************************************************************************/
  PROCEDURE p_Online_InsertRtsd0014 (
    v_Ord_No      IN RTSD0014.ORD_NO%TYPE,          /*�ֹ���ȣ              */
    v_Ord_Day     IN RtSD0104.ORD_DAY%TYPE,         /*��������              */
    v_Mat_Cd      IN RTSD0014.MAT_CD%TYPE,          /*��ǰ�ڵ�              */
    v_Cust_No     IN RTSD0100.CUST_NO%TYPE,         /*����ȣ              */
    v_Cnt_Cd      IN RTSD0008.CNT_CD%TYPE,          /*Ÿ�̾��            */
    v_Period_Cd   IN RTSD0008.PERIOD_CD%TYPE,       /*�Ⱓ�ڵ�              */
    v_Reg_Id      IN RTSD0014.REG_ID%TYPE,          /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
  
  
END Pkg_Rtsd0014;
/
