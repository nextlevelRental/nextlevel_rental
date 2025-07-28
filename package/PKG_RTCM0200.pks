CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0200 AS
/******************************************************************************
   NAME:       RTCM0200
   PURPOSE:    문자포맷헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/
   
  /*****************************************************************************
  -- 문자포맷 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0200Count(
    v_Mid_Grp_Cd IN  RTCM0200.MID_GRP_CD%TYPE             /*코드그룹코드        */
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- 문자포맷 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE         /*코드그룹코드            */
    );

  /*****************************************************************************
  -- 문자포맷 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0200(
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*코드그룹코드        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 문자포맷 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0200(
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*코드그룹코드        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 문자포맷 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0200(
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*코드그룹코드        */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 문자포맷 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0200(
    v_Comm_Dvsn      IN  CHAR,                           /* 처리구분(I,U,D)        */
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*코드그룹코드        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    
END Pkg_Rtcm0200;