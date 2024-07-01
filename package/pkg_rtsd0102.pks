CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0102 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0102
   PURPOSE   ���� �� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-08  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� �� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0102Count(
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE            /*�����չ�ȣ        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0102 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,           /*�����չ�ȣ        */
    v_Grp_Day_Start  IN RTSD0102.GRP_DAY%TYPE,          /*��������            */
    v_Grp_Day_End    IN RTSD0102.GRP_DAY%TYPE,          /*��������            */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,           /*���տ���            */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE           /*����ȣ            */
    );

  /*****************************************************************************
  -- ���� �� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*��������              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*�и�����              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*���տ���              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*��������              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*�и�����              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*���տ���              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0102 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Grp_No         IN OUT RTSD0102.GRP_NO%TYPE,     /*�����չ�ȣ          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*��������              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*�и�����              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*���տ���              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���� �� ������ - ���� �� ��ȣ ü��
  *****************************************************************************/
  FUNCTION f_sRtsd0102GrpNo RETURN VARCHAR;
END Pkg_Rtsd0102;
/
