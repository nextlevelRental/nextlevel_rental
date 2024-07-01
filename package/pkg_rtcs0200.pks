CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0200 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0200
   PURPOSE   [CS] â�� ������ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-26  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] â�� ������ Count
  *****************************************************************************/
  FUNCTION f_sRtcs0200Count(
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE          /*â���ڵ�            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] â�� ������ Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- [CS] â�� ������ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] â�� ������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] â�� ������ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] â�� ������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0200 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- â�� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0200WareHouse (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- [CS] â�� ������ ��Ī ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcs0200WarehNm(
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE          /*â���ڵ�            */
    ) RETURN VARCHAR;

END Pkg_Rtcs0200;
/
