CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0103 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0103
   PURPOSE   ���� �� �̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-08  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� �� �̷� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0103Count(
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,           /*�����չ�ȣ        */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� �̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0103 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE            /*�����չ�ȣ          */
    --v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*����ȣ              */
    --v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*��������              */
    --v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*�и�����              */
    --v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*���տ���              */
    --v_Reg_Id         IN RTSD0103.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���� �� �̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0103 (
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*����ȣ              */
    v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*��������              */
    v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*�и�����              */
    v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*���տ���              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� �̷� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0103 (
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*����ȣ              */
    v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*��������              */
    v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*�и�����              */
    v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*���տ���              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� �̷� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0103 (
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*����ȣ              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� �̷� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0103 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*����ȣ              */
    v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*��������              */
    v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*�и�����              */
    v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*���տ���              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���� �� INSERT - ���忡 ���� �� üũ RETURN  : �����չ�ȣ
  *****************************************************************************/
  FUNCTION p_sRtsd0103_SelectCustNo(
  	v_Cust_No         IN RTSD0103.CUST_NO%TYPE          /*����ȣ            */
  ) RETURN VARCHAR2;


  /*****************************************************************************
  -- ���� �� ���� ó��
  *****************************************************************************/
  PROCEDURE p_BatchRtsd0103Discount (
    v_Appl_Ym        IN VARCHAR2,                     /*������              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtsd0103;
/
