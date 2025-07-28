CREATE OR REPLACE PACKAGE NXRADMIN.PKG_TEST01 AS
 
  /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0051Count(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN NUMBER; 
 
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

END PKG_TEST01;