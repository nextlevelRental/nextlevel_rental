CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0051 AS
/******************************************************************************
   NAME:       RTCM0051
   PURPOSE:    �����ڵ� ���

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0051Count(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*�ڵ�                */
    ) RETURN NUMBER; 
    
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0051 (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd        IN  RTCM0051.CD%TYPE,               /*�ڵ�                    */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE             /*�ڵ��                  */
    );

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

  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ- ��з��ڵ� ���� �Һз��ڵ�/�� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0051CodeName (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,            /*�ڵ��                  */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE            /*��뿩��                */
    );
    
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ- ��з�/�Һз��ڵ� ���� �Һз��ڵ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0051CodeName(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*�ڵ�                */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ- ��з��ڵ� ���� �Һз��ڵ�  ��ȸ(�̿����ĺ��ڵ� ȹ��� ���)
  *****************************************************************************/
  FUNCTION f_sRtcm0051Cd(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE             /*�ڵ�׷��ڵ�        */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- �����ڵ� Detail Count - ������� �ڵ� ���� ����
  *****************************************************************************/
  FUNCTION f_sRtcm0051UseCount(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*�ڵ�                */
    ) RETURN NUMBER;
          
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ - �����ڵ�(CD_DESC)�� ��ȸ 
  *****************************************************************************/
  PROCEDURE p_sRtcm0051HCode (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE           /*�ڵ弳��                */
    );
      
END Pkg_Rtcm0051;
/
