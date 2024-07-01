CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0050 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0050
   PURPOSE:    �����ڵ� ���

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-17  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Head Count
  *****************************************************************************/
  FUNCTION f_sRtcm0050Count(
    v_Cd_Grp_Cd    IN     RTCM0050.CD_GRP_CD%TYPE           /*�ڵ�׷��ڵ�    */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �����ڵ� Head Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0050 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*�ڵ�׷��ڵ�        */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE      /*�ڵ�׷��          */
    );

  /*****************************************************************************
  -- �����ڵ� Head Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0050(
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,     /*�ڵ�׷��ڵ�           */
    v_Cd_Grp_Nm     IN  RTCM0050.CD_GRP_NM%TYPE,     /*�ڵ�׷��             */
    v_Cd_Grp_Desc   IN  RTCM0050.CD_GRP_DESC%TYPE,   /*�ڵ�׷켳��           */
    v_Mdl_Cd        IN  RTCM0050.MDL_CD%TYPE,        /*��ⱸ��               */
    v_Use_Yn        IN  RTCM0050.USE_YN%TYPE,        /*��뿩��               */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,        /*����� ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ڵ� Head Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0050(
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,   /*�ڵ�׷��ڵ�          */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE,   /*�ڵ�׷��            */
    v_Cd_Grp_Desc   IN     RTCM0050.CD_GRP_DESC%TYPE, /*�ڵ�׷켳��          */
    v_Mdl_Cd        IN     RTCM0050.MDL_CD%TYPE,      /*��ⱸ��              */
    v_Use_Yn        IN     RTCM0050.USE_YN%TYPE,      /*��뿩��              */
    v_Reg_Id        IN     RTCM0050.REG_ID%TYPE,      /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �����ڵ� Head Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0050(
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*����� ���̵�       */
    v_Reg_Id        IN     RTCM0050.REG_ID%TYPE,        /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  
  /*****************************************************************************
  -- �����ڵ� Head ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0050(
    v_Comm_Dvsn     IN  CHAR,                       /*ó������(I,U,D)         */
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,    /*�ڵ�׷��ڵ�            */
    v_Cd_Grp_Nm     IN  RTCM0050.CD_GRP_NM%TYPE,    /*�ڵ�׷��              */
    v_Cd_Grp_Desc   IN  RTCM0050.CD_GRP_DESC%TYPE,  /*�ڵ�׷켳��            */
    v_Mdl_Cd        IN  RTCM0050.MDL_CD%TYPE,       /*��ⱸ��                */
    v_Use_Yn        IN  RTCM0050.USE_YN%TYPE,       /*��뿩��                */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,       /*����� ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    
  /*****************************************************************************
  -- �����ڵ� Head Select - �����ڵ� �׷� ��ȸ(2�� ����Ʈ ������)
  *****************************************************************************/
  PROCEDURE p_sRtcm0050ComboList (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*�ڵ�׷��ڵ�        */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE      /*�ڵ�׷��          */
    );
END Pkg_Rtcm0050;
/
