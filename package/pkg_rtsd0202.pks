CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0202 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0202
   PURPOSE   ���νſ���ȸ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���νſ���ȸ��� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0202Count(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*������ȣ            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,          /*������              */
    v_Seq            IN RTSD0202.SEQ%TYPE               /*��������            */
    ) RETURN NUMBER;
    
 /*****************************************************************************
  -- ���νſ���ȸ���ϱ���(SafeKey + ������)
  *****************************************************************************/
  FUNCTION f_sRtsd0202TodayCount(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*������ȣ            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE          /*������              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���νſ���ȸ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0202 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*��������              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*�ſ���              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE          /*����� ID             */
    );
    
    /*****************************************************************************
  -- ���νſ���ȸ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0202TodayExists (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE        /*������                */
    );


  /*****************************************************************************
  -- ���νſ���ȸ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*��������              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*�ſ���              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���νſ���ȸ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*��������              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*�ſ���              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���νſ���ȸ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*��������              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���νſ���ȸ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0202 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*������                */
    v_Seq            IN OUT RTSD0202.SEQ%TYPE,        /*��������              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*�ſ���              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���νſ���ȸ��� - ���� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0202Seq(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*������ȣ            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE           /*������              */
    ) RETURN NUMBER;
    
    
END Pkg_Rtsd0202;
/
