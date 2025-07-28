CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0050 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0050
   PURPOSE:    공통코드 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-17  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 공통코드 Head Count
  *****************************************************************************/
  FUNCTION f_sRtcm0050Count(
    v_Cd_Grp_Cd    IN     RTCM0050.CD_GRP_CD%TYPE           /*코드그룹코드    */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 공통코드 Head Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0050 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*코드그룹코드        */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE      /*코드그룹명          */
    );

  /*****************************************************************************
  -- 공통코드 Head Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0050(
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,     /*코드그룹코드           */
    v_Cd_Grp_Nm     IN  RTCM0050.CD_GRP_NM%TYPE,     /*코드그룹명             */
    v_Cd_Grp_Desc   IN  RTCM0050.CD_GRP_DESC%TYPE,   /*코드그룹설명           */
    v_Mdl_Cd        IN  RTCM0050.MDL_CD%TYPE,        /*모듈구분               */
    v_Use_Yn        IN  RTCM0050.USE_YN%TYPE,        /*사용여부               */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,        /*등록자 ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 공통코드 Head Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0050(
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,   /*코드그룹코드          */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE,   /*코드그룹명            */
    v_Cd_Grp_Desc   IN     RTCM0050.CD_GRP_DESC%TYPE, /*코드그룹설명          */
    v_Mdl_Cd        IN     RTCM0050.MDL_CD%TYPE,      /*모듈구분              */
    v_Use_Yn        IN     RTCM0050.USE_YN%TYPE,      /*사용여부              */
    v_Reg_Id        IN     RTCM0050.REG_ID%TYPE,      /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 공통코드 Head Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0050(
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*사용자 아이디       */
    v_Reg_Id        IN     RTCM0050.REG_ID%TYPE,        /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  
  /*****************************************************************************
  -- 공통코드 Head 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0050(
    v_Comm_Dvsn     IN  CHAR,                       /*처리구분(I,U,D)         */
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,    /*코드그룹코드            */
    v_Cd_Grp_Nm     IN  RTCM0050.CD_GRP_NM%TYPE,    /*코드그룹명              */
    v_Cd_Grp_Desc   IN  RTCM0050.CD_GRP_DESC%TYPE,  /*코드그룹설명            */
    v_Mdl_Cd        IN  RTCM0050.MDL_CD%TYPE,       /*모듈구분                */
    v_Use_Yn        IN  RTCM0050.USE_YN%TYPE,       /*사용여부                */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,       /*등록자 ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    
  /*****************************************************************************
  -- 공통코드 Head Select - 공통코드 그룹 조회(2열 리스트 구성용)
  *****************************************************************************/
  PROCEDURE p_sRtcm0050ComboList (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*코드그룹코드        */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE      /*코드그룹명          */
    );
END Pkg_Rtcm0050;