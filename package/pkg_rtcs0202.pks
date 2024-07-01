CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0202 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0202
   PURPOSE   [CS] �븮�� - â�� �������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-26  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0202Count(
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,        /*�븮���ڵ�          */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE            /*â�������        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0202 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*����������            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0202 (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*����������            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0202 (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*����������            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0202 (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0202 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*����������            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �븮�� - â�� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0202AgencyWareh (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    );

  /*****************************************************************************
  -- [CS] �븮�� - â�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcs0202Use_Yn (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE          /*��뿩��              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �븮�� - â�� ���� ��ȸ(��밡�� â��)
  *****************************************************************************/
  PROCEDURE p_sRtcs0202UseAgencyWareh (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- [CS] �븮�� ��ȿ â�� �Ǽ� COUNT (���������)
  *****************************************************************************/
  FUNCTION f_sRtcs0202UseCntCheck (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE       /*�븮���ڵ�            */
    ) RETURN NUMBER;

END Pkg_Rtcs0202;
/
