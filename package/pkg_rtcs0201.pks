CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0201 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0201
   PURPOSE   [CS] â�� ������ �����̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-26  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0201Count(
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,         /*â���ڵ�            */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE           /*â�������        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0201 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Wareh_Nm       IN RTCS0201.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0201.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0201.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0201.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0201.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0201.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0201.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0201.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0201.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0201.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0201 (
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Wareh_Nm       IN RTCS0201.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0201.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0201.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0201.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0201.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0201.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0201.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0201.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0201.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0201.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0201 (
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Wareh_Nm       IN RTCS0201.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0201.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0201.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0201.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0201.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0201.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0201.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0201.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0201.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0201.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0201 (
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0201 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Wareh_Nm       IN RTCS0201.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0201.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0201.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0201.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0201.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0201.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0201.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0201.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0201.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0201.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- â�� �����̷� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0201WareHistory (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� â���ڵ庰 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0201TotCount(
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE          /*â���ڵ�            */
    ) RETURN NUMBER;

END Pkg_Rtcs0201;
/
