CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0025 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0025
   PURPOSE:    �޴�-���ѱ׷� ���� ���

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0025Count(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0025 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    );

  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0025(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� - �ش� ���ѱ׷쿡 �Ҽӵ� �޴� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcm0025AuthGroupMenu (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    );

  /*****************************************************************************
  -- �޴�-���ѱ׷� ���� - �ش� ���ѱ׷쿡 �Ҽӵ��� ���� �޴� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcm0025AuthGroupMenuNot (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*���ѱ׷��ڵ�          */
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE         /*�޴���                */
    );
            
END Pkg_Rtcm0025;
/
