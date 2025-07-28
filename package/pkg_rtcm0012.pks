CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0012 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0012
   PURPOSE:    메뉴 Master 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 메뉴 Master Count
  *****************************************************************************/
  FUNCTION f_sRtcm0012Count(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE         /*메뉴코드              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 메뉴 Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0012 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*메뉴명                */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE     /*상위메뉴코드          */
    );

  /*****************************************************************************
  -- 메뉴 Master Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*메뉴명                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*메뉴레벨              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*상위메뉴코드          */
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*모듈코드              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*정렬순서              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*메뉴설명              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 메뉴 Master Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*메뉴명                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*메뉴레벨              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*상위메뉴코드          */	
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*모듈코드              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*정렬순서              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*메뉴설명              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 메뉴 Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 메뉴 Master 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0012(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*메뉴명                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*메뉴레벨              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*상위메뉴코드          */
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*모듈코드              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*정렬순서              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*메뉴설명              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

  /*****************************************************************************
  -- 메뉴 Master - 메뉴코드로 메뉴명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0012MenuName(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE         /*메뉴코드              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 메뉴 Master - 메뉴TREE 구성을 위한 전체 메뉴구조 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0012Tree (
    Ref_Cursor   IN OUT SYS_REFCURSOR
    );   

  /*****************************************************************************
  -- 메뉴 Master -  메뉴- 프로그램  트리 구성
  *****************************************************************************/
  PROCEDURE p_sRtcm0012TreeProgram (
    Ref_Cursor   IN OUT SYS_REFCURSOR
    );
    
  /*****************************************************************************
  -- 메뉴 Master - 특정 사용자의  메뉴 트리 구성
  *****************************************************************************/
  PROCEDURE p_sRtcm0012UserTree (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*사용자 아이디       */    
    );
    
  /*****************************************************************************
  -- 메뉴 Master -  특정 사용자의  메뉴- 프로그램 - 사용권한  트리 구성
  *****************************************************************************/
  PROCEDURE p_sRtcm0012UserTreeAuth (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE,          /*사용자 아이디       */  
    v_Local_Ip       IN VARCHAR2                        /*로컬PC IP           */  
    );
      
END Pkg_Rtcm0012;