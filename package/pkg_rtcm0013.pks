CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0013 AS
/******************************************************************************
   NAME:      Pkg_Rtcm0013
   PURPOSE:   �޴�-���α׷� ���� ���

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- �޴�-���α׷� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0013Count(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE         /*���α׷��ڵ�          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �޴�-���α׷� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0013 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE         /*�޴��ڵ�              */
    );

  /*****************************************************************************
  -- �޴�-���α׷� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0013(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Sort_Odr       IN RTCM0013.SORT_ODR%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*�����ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �޴�-���α׷� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0013(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Sort_Odr       IN RTCM0013.SORT_ODR%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*�����ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �޴�-���α׷� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0013(
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*�����ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �޴�-���α׷� ���� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0013(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Menu_Cd        IN RTCM0013.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0013.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Sort_Odr       IN RTCM0013.SORT_ODR%TYPE,       /*���ļ���              */
    v_Reg_Id         IN RTCM0013.REG_ID%TYPE,         /*�����ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );


  /*****************************************************************************
  --  �޴�-���α׷� ���� - �ش� �޴��� �Ҽӵ� ���α׷� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcm0013MenuProgram (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE         /*�޴��ڵ�              */
    );


  /*****************************************************************************
  --  �޴�-���α׷� ���� - �ش� �޴��� �Ҽӵ��� ���� ���α׷� ����Ʈ
  *****************************************************************************/
  PROCEDURE p_sRtcm0013MenuProgramNot (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*�޴��ڵ�              */
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE         /*���α׷���            */
    );        

END Pkg_Rtcm0013;
/
