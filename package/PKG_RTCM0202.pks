CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0202 AS
/******************************************************************************
   NAME:       RTCM0202
   PURPOSE:    �������˵�����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- �������� Detail history Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0202(
    v_Mid_Grp_Cd     IN  RTCM0202.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0202.CD%TYPE,               /*�����ڵ�            */
    v_Msg_Contents   IN  RTCM0202.MSG_CONTENTS%TYPE,     /*�ڵ弳��            */
    v_Kakao_Msg_Cd   IN  RTCM0202.KAKAO_MSG_CD%TYPE,     /*�˸����ڵ�            */
    v_Msg_Type       IN  RTCM0202.MSG_TYPE%TYPE,         /*�߼�����            */
    v_Reserved_Type  IN  RTCM0202.RESERVED_TYPE%TYPE,    /*��ù߼ۿ���         */
    v_Order_Pt       IN  RTCM0202.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0202.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0202.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtcm0202;
/