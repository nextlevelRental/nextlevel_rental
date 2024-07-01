CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0204 AS
/******************************************************************************
   NAME:       RTCM0204
   PURPOSE:    �������˵�����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/
   
  /*****************************************************************************
  -- �������� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0204Count(
    v_Send_Pos IN  RTCM0204.SEND_POS%TYPE            /*�ڵ�׷��ڵ�        */
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- �������� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0204 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,          /*�ڵ�׷��ڵ�            */
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd             IN  RTCM0204.CD%TYPE                 /*�����ڵ�            */
    );

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0204(
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0204.CD%TYPE,               /*�����ڵ�            */
    v_Remark         IN  RTCM0204.REMARK%TYPE,            /*�����ڵ��          */
    v_Use_Yn         IN  RTCM0204.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0204(
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0204.CD%TYPE,               /*�����ڵ�            */
    v_Remark         IN  RTCM0204.REMARK%TYPE,            /*�����ڵ��          */
    v_Use_Yn         IN  RTCM0204.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0204(
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,         /*�ڵ�׷��ڵ�        */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0204(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0204.CD%TYPE,               /*�����ڵ�            */
    v_Remark         IN  RTCM0204.REMARK%TYPE,            /*�����ڵ��          */
    v_Use_Yn         IN  RTCM0204.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    
  /*****************************************************************************
  -- �������� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sMessageInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,          /*�ڵ�׷��ڵ�            */
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd             IN  RTCM0204.CD%TYPE                 /*�����ڵ�            */
    );
    
  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0204SeqNumber
  RETURN VARCHAR;
  
  
END Pkg_Rtcm0204;
/