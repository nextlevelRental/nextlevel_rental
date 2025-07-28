CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0205 AS
/*******************************************************************************
   NAME:      Pkg_RTCM0205
   PURPOSE:   문자포맷 Detail 관리

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-31  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0205Count(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE            /*하위코드명          */
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 공통코드 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0205 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE            /*하위코드명          */
    );

  /*****************************************************************************
  -- 문자포맷 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*하위코드명          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*하위코드명          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 문자포맷 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*하위코드명          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*하위코드명          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 문자포맷 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 문자포맷 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0205(
    v_Comm_Dvsn      IN  CHAR,                           /* 처리구분(I,U,D)        */
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*하위코드명          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*하위코드명          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
  
    /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0205LockYn(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE            /*하위코드명          */
    ) RETURN VARCHAR2;
    
END Pkg_Rtcm0205;