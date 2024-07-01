CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0200 AS
/******************************************************************************
   NAME:       RTCM0200
   PURPOSE:    �����������

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/
   
  /*****************************************************************************
  -- �������� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0200Count(
    v_Mid_Grp_Cd IN  RTCM0200.MID_GRP_CD%TYPE             /*�ڵ�׷��ڵ�        */
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- �������� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE         /*�ڵ�׷��ڵ�            */
    );

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0200(
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*�ڵ�׷��ڵ�        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0200(
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*�ڵ�׷��ڵ�        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0200(
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0200(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*�ڵ�׷��ڵ�        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    
    
END Pkg_Rtcm0200;
/