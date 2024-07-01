CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0003 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0003
   PURPOSE   ��Ż ������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-09  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��Ż ������� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0003Count(
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,           /*�������            */
    v_Matnr          IN RTCS0003.MATNR%TYPE             /*��ǰ�ڵ�            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż ������� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0003 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*��ǰ����              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*��������              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ��Ż ������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*��ǰ����              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*��������              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż ������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*��ǰ����              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*��������              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż ������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż ������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0003 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*��ǰ�ڵ�              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*��ǰ����              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*��������              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ��Ż ������� �������� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0003CloseCount(
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*�������              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE        /*��������              */
    ) RETURN NUMBER;

END Pkg_Rtcs0003;
/
