CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0203 AS
/******************************************************************************
   NAME:       RTCM0203
   PURPOSE:    문자파라미터정보

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/
   
  /*****************************************************************************
  -- 문자포맷 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0203Count(
    v_Mid_Grp_Cd IN  RTCM0203.MID_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd         IN  RTCM0203.CD%TYPE,                    /*코드                */
    v_Param_Cd   IN  RTCM0203.PARAM_CD%TYPE               /*파라미터 코드        */
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- 문자포맷 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0203 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd             IN  RTCM0203.CD%TYPE,                /*하위코드            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE           /*파라미터코드            */
    );

  /*****************************************************************************
  -- 문자포맷 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0203(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0203.CD%TYPE,               /*하위코드            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,            /*하위코드명          */
    v_Param_Cd_Nm    IN  RTCM0203.PARAM_CD_NM%TYPE,     /*코드설명            */
    v_Param_Cd_Desc  IN  RTCM0203.PARAM_CD_DESC%TYPE,     /*알림톡코드            */
    v_Order_Pt       IN  RTCM0203.ORDER_PT%TYPE,         /*정렬순서            */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 문자포맷 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0203(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0203.CD%TYPE,               /*하위코드            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,            /*하위코드명          */
    v_Param_Cd_Nm    IN  RTCM0203.PARAM_CD_NM%TYPE,     /*코드설명            */
    v_Param_Cd_Desc  IN  RTCM0203.PARAM_CD_DESC%TYPE,     /*알림톡코드            */
    v_Order_Pt       IN  RTCM0203.ORDER_PT%TYPE,         /*정렬순서            */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 문자포맷 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0203(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*코드그룹코드        */
    v_Cd             IN  RTCM0203.CD%TYPE,               /*하위코드            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,         /*파라미터코드        */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 문자포맷 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0203(
    v_Comm_Dvsn      IN  CHAR,                           /* 처리구분(I,U,D)        */
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0203.CD%TYPE,               /*하위코드            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,            /*하위코드명          */
    v_Param_Cd_Nm    IN  RTCM0203.PARAM_CD_NM%TYPE,     /*코드설명            */
    v_Param_Cd_Desc  IN  RTCM0203.PARAM_CD_DESC%TYPE,     /*알림톡코드            */
    v_Order_Pt       IN  RTCM0203.ORDER_PT%TYPE,         /*정렬순서            */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
      
   /*****************************************************************************
  -- 문자포맷 Detail 조회- 대분류/소분류코드 기준 소분류코드명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0203CodeName(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,        /*코드그룹코드         */
    v_Cd             IN  RTCM0203.CD%TYPE,                /*하위코드            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,          /*파라미터코드         */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE              /*사용여부           */
    ) RETURN VARCHAR;
    
END Pkg_Rtcm0203;