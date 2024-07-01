CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0012 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0012
   PURPOSE:    �޴� Master ���

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- �޴� Master Count
  *****************************************************************************/
  FUNCTION f_sRtcm0012Count(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE         /*�޴��ڵ�              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �޴� Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0012 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*�޴���                */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE     /*�����޴��ڵ�          */
    );

  /*****************************************************************************
  -- �޴� Master Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*�޴���                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*�޴�����              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*�����޴��ڵ�          */
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*����ڵ�              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*���ļ���              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*�޴�����              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �޴� Master Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*�޴���                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*�޴�����              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*�����޴��ڵ�          */	
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*����ڵ�              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*���ļ���              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*�޴�����              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �޴� Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �޴� Master ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0012(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*�޴���                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*�޴�����              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*�����޴��ڵ�          */
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*����ڵ�              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*���ļ���              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*�޴�����              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

  /*****************************************************************************
  -- �޴� Master - �޴��ڵ�� �޴��� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0012MenuName(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE         /*�޴��ڵ�              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- �޴� Master - �޴�TREE ������ ���� ��ü �޴����� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0012Tree (
    Ref_Cursor   IN OUT SYS_REFCURSOR
    );   

  /*****************************************************************************
  -- �޴� Master -  �޴�- ���α׷�  Ʈ�� ����
  *****************************************************************************/
  PROCEDURE p_sRtcm0012TreeProgram (
    Ref_Cursor   IN OUT SYS_REFCURSOR
    );
    
  /*****************************************************************************
  -- �޴� Master - Ư�� �������  �޴� Ʈ�� ����
  *****************************************************************************/
  PROCEDURE p_sRtcm0012UserTree (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*����� ���̵�       */    
    );
    
  /*****************************************************************************
  -- �޴� Master -  Ư�� �������  �޴�- ���α׷� - ������  Ʈ�� ����
  *****************************************************************************/
  PROCEDURE p_sRtcm0012UserTreeAuth (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE,          /*����� ���̵�       */  
    v_Local_Ip       IN VARCHAR2                        /*����PC IP           */  
    );
      
END Pkg_Rtcm0012;
/
