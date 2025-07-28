CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0204 AS
/******************************************************************************
   NAME:       RTCM0204
   PURPOSE:    문자포맷디테일

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/
   
  /*****************************************************************************
  -- 문자포맷 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0204Count(
    v_Send_Pos IN  RTCM0204.SEND_POS%TYPE            /*코드그룹코드        */
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- 문자포맷 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0204 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,          /*코드그룹코드            */
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd             IN  RTCM0204.CD%TYPE                 /*하위코드            */
    );

  /*****************************************************************************
  -- 문자포맷 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0204(
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0204.CD%TYPE,               /*하위코드            */
    v_Remark         IN  RTCM0204.REMARK%TYPE,            /*하위코드명          */
    v_Use_Yn         IN  RTCM0204.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 문자포맷 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0204(
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0204.CD%TYPE,               /*하위코드            */
    v_Remark         IN  RTCM0204.REMARK%TYPE,            /*하위코드명          */
    v_Use_Yn         IN  RTCM0204.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 문자포맷 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0204(
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,         /*코드그룹코드        */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 문자포맷 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0204(
    v_Comm_Dvsn      IN  CHAR,                           /* 처리구분(I,U,D)        */
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0204.CD%TYPE,               /*하위코드            */
    v_Remark         IN  RTCM0204.REMARK%TYPE,            /*하위코드명          */
    v_Use_Yn         IN  RTCM0204.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    
  /*****************************************************************************
  -- 문자포맷 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sMessageInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,          /*코드그룹코드            */
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd             IN  RTCM0204.CD%TYPE                 /*하위코드            */
    );
    
  /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0204SeqNumber
  RETURN VARCHAR;
  
END Pkg_Rtcm0204;