CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0204 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0204
   PURPOSE   ����ſ���ȸ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����ſ���ȸ��� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0204Count(
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*����ڹ�ȣ          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,          /*������              */
    v_Seq            IN RTSD0204.SEQ%TYPE               /*��������            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ����ſ���ȸ��� Count(����ڹ�ȣ + ����)
  *****************************************************************************/
  PROCEDURE p_sRtsd0204TodayCount(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*����ڹ�ȣ          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE          /*������              */
    ) ;

  /*****************************************************************************
  -- ����ſ���ȸ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0204 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*��������              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*����ſ���          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ����ſ���ȸ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*��������              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*����ſ���          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ſ���ȸ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*��������              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*����ſ���          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ſ���ȸ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*��������              */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����ſ���ȸ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0204 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN OUT RTSD0204.SEQ%TYPE,        /*��������              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*����ſ���          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ����ſ���ȸ��� - ���� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0204Seq(
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*����ڹ�ȣ          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE           /*������              */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0204;
/
