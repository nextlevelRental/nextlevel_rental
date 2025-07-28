CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0051 AS
/******************************************************************************
   NAME:       RTCM0051
   PURPOSE:    공통코드 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0051Count(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN NUMBER; 
    
  /*****************************************************************************
  -- 공통코드 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0051 (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd        IN  RTCM0051.CD%TYPE,               /*코드                    */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE             /*코드명                  */
    );

  /*****************************************************************************
  -- 공통코드 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*코드                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*코드명              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*코드설명            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*우선순위            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*사용여부            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*적요                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 공통코드 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*코드                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*코드명              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*코드설명            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*우선순위            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*사용여부            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*적요                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 공통코드 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*코드                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 공통코드 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0051(
    v_Comm_Dvsn  IN  CHAR,                          /* 처리구분(I,U,D)        */
    v_Cd_Grp_Cd  IN  RTCM0051.CD_GRP_CD%TYPE,       /*코드그룹코드            */
    v_Cd         IN  RTCM0051.CD%TYPE,              /*코드                    */
    v_Cd_Nm      IN  RTCM0051.CD_NM%TYPE,           /*코드명                  */
    v_Cd_Desc    IN  RTCM0051.CD_DESC%TYPE,         /*코드설명                */
    v_Order_Pt   IN  RTCM0051.ORDER_PT%TYPE,        /*우선순위                */
    v_Use_Yn     IN  RTCM0051.USE_YN%TYPE,          /*사용여부                */
    v_Remark     IN  RTCM0051.REMARK%TYPE,          /*적요                    */
    v_Reg_Id     IN  RTCM0051.REG_ID%TYPE,          /*등록자 ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

  /*****************************************************************************
  -- 공통코드 Detail 조회- 대분류코드 기준 소분류코드/명 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0051CodeName (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,            /*코드명                  */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE            /*사용여부                */
    );
    
  /*****************************************************************************
  -- 공통코드 Detail 조회- 대분류/소분류코드 기준 소분류코드명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0051CodeName(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 공통코드 Detail 조회- 대분류코드 기준 소분류코드  조회(이용기관식별코드 획득시 사용)
  *****************************************************************************/
  FUNCTION f_sRtcm0051Cd(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE             /*코드그룹코드        */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- 공통코드 Detail Count - 사용중인 코드 존재 여부
  *****************************************************************************/
  FUNCTION f_sRtcm0051UseCount(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN NUMBER;
          
  /*****************************************************************************
  -- 공통코드 Detail 조회 - 상위코드(CD_DESC)로 조회 
  *****************************************************************************/
  PROCEDURE p_sRtcm0051HCode (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE           /*코드설명                */
    );
      
END Pkg_Rtcm0051;