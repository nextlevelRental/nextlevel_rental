CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0202 AS
/******************************************************************************
   NAME:       RTCM0202
   PURPOSE:    문자포맷디테일

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 문자포맷 Detail history Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0202(
    v_Mid_Grp_Cd     IN  RTCM0202.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0202.CD%TYPE,               /*하위코드            */
    v_Msg_Contents   IN  RTCM0202.MSG_CONTENTS%TYPE,     /*코드설명            */
    v_Kakao_Msg_Cd   IN  RTCM0202.KAKAO_MSG_CD%TYPE,     /*알림톡코드            */
    v_Msg_Type       IN  RTCM0202.MSG_TYPE%TYPE,         /*발송유형            */
    v_Reserved_Type  IN  RTCM0202.RESERVED_TYPE%TYPE,    /*즉시발송여부         */
    v_Order_Pt       IN  RTCM0202.ORDER_PT%TYPE,         /*정렬순서            */
    v_Use_Yn         IN  RTCM0202.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0202.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtcm0202;
/