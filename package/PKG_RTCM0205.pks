CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0205 AS
/*******************************************************************************
   NAME:      Pkg_RTCM0205
   PURPOSE:   �������� Detail ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-31  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0205Count(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE            /*�����ڵ��          */
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0205 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE            /*�����ڵ��          */
    );

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*�����ڵ��          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*�����ڵ��          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*�����ڵ��          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*�����ڵ��          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0205(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*�����ڵ��          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*�����ڵ��          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
  
    /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0205LockYn(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE            /*�����ڵ��          */
    ) RETURN VARCHAR2;
    
END Pkg_Rtcm0205;
/