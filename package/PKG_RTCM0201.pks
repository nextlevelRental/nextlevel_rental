CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0201 AS
/******************************************************************************
   NAME:       RTCM0201
   PURPOSE:    �������˵�����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/
   
  /*****************************************************************************
  -- �������� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0201Count(
    v_Mid_Grp_Cd IN  RTCM0201.MID_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd         IN  RTCM0201.CD%TYPE                     /*�ڵ�                */
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- �������� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0201 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd             IN  RTCM0201.CD%TYPE                 /*�����ڵ�            */
    );

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0201(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0201.CD%TYPE,               /*�����ڵ�            */
    v_Cd_Nm          IN  RTCM0201.CD_NM%TYPE,            /*�����ڵ��          */
    v_Msg_Contents   IN  RTCM0201.MSG_CONTENTS%TYPE,     /*�ڵ弳��            */
    v_Kakao_Msg_Cd   IN  RTCM0201.KAKAO_MSG_CD%TYPE,     /*�˸����ڵ�            */
    v_Msg_Type       IN  RTCM0201.MSG_TYPE%TYPE,         /*�߼�����            */
    v_Reserved_Type  IN  RTCM0201.RESERVED_TYPE%TYPE,    /*��ù߼ۿ���         */
    v_Order_Pt       IN  RTCM0201.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0201(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0201.CD%TYPE,               /*�����ڵ�            */
    v_Cd_Nm          IN  RTCM0201.CD_NM%TYPE,            /*�����ڵ��          */
    v_Msg_Contents   IN  RTCM0201.MSG_CONTENTS%TYPE,     /*�ڵ弳��            */
    v_Kakao_Msg_Cd   IN  RTCM0201.KAKAO_MSG_CD%TYPE,     /*�˸����ڵ�            */
    v_Msg_Type       IN  RTCM0201.MSG_TYPE%TYPE,         /*�߼�����            */
    v_Reserved_Type  IN  RTCM0201.RESERVED_TYPE%TYPE,    /*��ù߼ۿ���         */
    v_Order_Pt       IN  RTCM0201.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0201(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */
    v_Cd             IN  RTCM0201.CD%TYPE,               /*�����ڵ�            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0201(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */
    v_Cd             IN  RTCM0201.CD%TYPE,               /*�����ڵ�            */
    v_Cd_Nm          IN  RTCM0201.CD_NM%TYPE,            /*�����ڵ��          */
    v_Msg_Contents   IN  RTCM0201.MSG_CONTENTS%TYPE,     /*�ڵ弳��            */    
    v_Kakao_Msg_Cd   IN  RTCM0201.KAKAO_MSG_CD%TYPE,     /*�˸����ڵ�            */
    v_Msg_Type       IN  RTCM0201.MSG_TYPE%TYPE,         /*�߼�����            */
    v_Reserved_Type  IN  RTCM0201.RESERVED_TYPE%TYPE,    /*��ù߼ۿ���         */
    v_Order_Pt       IN  RTCM0201.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*����� ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
      
   /*****************************************************************************
  -- �������� Detail ��ȸ- ��з�/�Һз��ڵ� ���� �Һз��ڵ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0201Msg(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�        */
    v_Cd             IN  RTCM0201.CD%TYPE,                /*�����ڵ�            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE              /*��뿩��            */
    ) RETURN VARCHAR;
    
    
END Pkg_Rtcm0201;
/