CREATE OR REPLACE PACKAGE NXRADMIN.PKG_TEST01 AS
 
  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0051Count(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*�ڵ�                */
    ) RETURN NUMBER; 
 
  /*****************************************************************************
  -- �����ڵ� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*�ڵ�                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*�ڵ��              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*�ڵ弳��            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*�켱����            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*��뿩��            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*����                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ڵ� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*�ڵ�                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*�ڵ��              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*�ڵ弳��            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*�켱����            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*��뿩��            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*����                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �����ڵ� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*�ڵ�                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �����ڵ� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0051(
    v_Comm_Dvsn  IN  CHAR,                          /* ó������(I,U,D)        */
    v_Cd_Grp_Cd  IN  RTCM0051.CD_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�            */
    v_Cd         IN  RTCM0051.CD%TYPE,              /*�ڵ�                    */
    v_Cd_Nm      IN  RTCM0051.CD_NM%TYPE,           /*�ڵ��                  */
    v_Cd_Desc    IN  RTCM0051.CD_DESC%TYPE,         /*�ڵ弳��                */
    v_Order_Pt   IN  RTCM0051.ORDER_PT%TYPE,        /*�켱����                */
    v_Use_Yn     IN  RTCM0051.USE_YN%TYPE,          /*��뿩��                */
    v_Remark     IN  RTCM0051.REMARK%TYPE,          /*����                    */
    v_Reg_Id     IN  RTCM0051.REG_ID%TYPE,          /*����� ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

END PKG_TEST01;
/
