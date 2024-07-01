CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0203 AS
/******************************************************************************
   NAME:       RTCM0203
   PURPOSE:    �����Ķ��������

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/
   
  /*****************************************************************************
  -- �������� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0203Count(
    v_Mid_Grp_Cd IN  RTCM0203.MID_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd         IN  RTCM0203.CD%TYPE,                    /*�ڵ�                */
    v_Param_Cd   IN  RTCM0203.PARAM_CD%TYPE               /*�Ķ���� �ڵ�        */
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- �������� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0203 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd             IN  RTCM0203.CD%TYPE,                /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE           /*�Ķ�����ڵ�            */
    );

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0203(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0203.CD%TYPE,               /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,            /*�����ڵ��          */
    v_Param_Cd_Nm    IN  RTCM0203.PARAM_CD_NM%TYPE,     /*�ڵ弳��            */
    v_Param_Cd_Desc  IN  RTCM0203.PARAM_CD_DESC%TYPE,     /*�˸����ڵ�            */
    v_Order_Pt       IN  RTCM0203.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0203(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0203.CD%TYPE,               /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,            /*�����ڵ��          */
    v_Param_Cd_Nm    IN  RTCM0203.PARAM_CD_NM%TYPE,     /*�ڵ弳��            */
    v_Param_Cd_Desc  IN  RTCM0203.PARAM_CD_DESC%TYPE,     /*�˸����ڵ�            */
    v_Order_Pt       IN  RTCM0203.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0203(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */
    v_Cd             IN  RTCM0203.CD%TYPE,               /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,         /*�Ķ�����ڵ�        */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0203(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0203.CD%TYPE,               /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,            /*�����ڵ��          */
    v_Param_Cd_Nm    IN  RTCM0203.PARAM_CD_NM%TYPE,     /*�ڵ弳��            */
    v_Param_Cd_Desc  IN  RTCM0203.PARAM_CD_DESC%TYPE,     /*�˸����ڵ�            */
    v_Order_Pt       IN  RTCM0203.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
      
   /*****************************************************************************
  -- �������� Detail ��ȸ- ��з�/�Һз��ڵ� ���� �Һз��ڵ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0203CodeName(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�         */
    v_Cd             IN  RTCM0203.CD%TYPE,                /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,          /*�Ķ�����ڵ�         */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE              /*��뿩��           */
    ) RETURN VARCHAR;
    
    
END Pkg_Rtcm0203;
/