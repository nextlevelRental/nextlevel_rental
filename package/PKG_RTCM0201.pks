CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0201 AS
/******************************************************************************
   NAME:       RTCM0201
   PURPOSE:    문자포맷디테일

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
******************************************************************************/
   
  /*****************************************************************************
  -- 문자포맷 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0201Count(
    v_Mid_Grp_Cd IN  RTCM0201.MID_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd         IN  RTCM0201.CD%TYPE                     /*코드                */
    ) RETURN NUMBER;
     
  /*****************************************************************************
  -- 문자포맷 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0201 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd             IN  RTCM0201.CD%TYPE                 /*하위코드            */
    );

  /*****************************************************************************
  -- 문자포맷 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0201(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0201.CD%TYPE,               /*하위코드            */
    v_Cd_Nm          IN  RTCM0201.CD_NM%TYPE,            /*하위코드명          */
    v_Msg_Contents   IN  RTCM0201.MSG_CONTENTS%TYPE,     /*코드설명            */
    v_Kakao_Msg_Cd   IN  RTCM0201.KAKAO_MSG_CD%TYPE,     /*알림톡코드            */
    v_Msg_Type       IN  RTCM0201.MSG_TYPE%TYPE,         /*발송유형            */
    v_Reserved_Type  IN  RTCM0201.RESERVED_TYPE%TYPE,    /*즉시발송여부         */
    v_Order_Pt       IN  RTCM0201.ORDER_PT%TYPE,         /*정렬순서            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 문자포맷 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0201(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0201.CD%TYPE,               /*하위코드            */
    v_Cd_Nm          IN  RTCM0201.CD_NM%TYPE,            /*하위코드명          */
    v_Msg_Contents   IN  RTCM0201.MSG_CONTENTS%TYPE,     /*코드설명            */
    v_Kakao_Msg_Cd   IN  RTCM0201.KAKAO_MSG_CD%TYPE,     /*알림톡코드            */
    v_Msg_Type       IN  RTCM0201.MSG_TYPE%TYPE,         /*발송유형            */
    v_Reserved_Type  IN  RTCM0201.RESERVED_TYPE%TYPE,    /*즉시발송여부         */
    v_Order_Pt       IN  RTCM0201.ORDER_PT%TYPE,         /*정렬순서            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 문자포맷 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0201(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*코드그룹코드        */
    v_Cd             IN  RTCM0201.CD%TYPE,               /*하위코드            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 문자포맷 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0201(
    v_Comm_Dvsn      IN  CHAR,                           /* 처리구분(I,U,D)        */
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*코드그룹코드        */
    v_Cd             IN  RTCM0201.CD%TYPE,               /*하위코드            */
    v_Cd_Nm          IN  RTCM0201.CD_NM%TYPE,            /*하위코드명          */
    v_Msg_Contents   IN  RTCM0201.MSG_CONTENTS%TYPE,     /*코드설명            */    
    v_Kakao_Msg_Cd   IN  RTCM0201.KAKAO_MSG_CD%TYPE,     /*알림톡코드            */
    v_Msg_Type       IN  RTCM0201.MSG_TYPE%TYPE,         /*발송유형            */
    v_Reserved_Type  IN  RTCM0201.RESERVED_TYPE%TYPE,    /*즉시발송여부         */
    v_Order_Pt       IN  RTCM0201.ORDER_PT%TYPE,         /*정렬순서            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*등록자 ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
      
   /*****************************************************************************
  -- 문자포맷 Detail 조회- 대분류/소분류코드 기준 소분류코드명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0201Msg(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,        /*코드그룹코드        */
    v_Cd             IN  RTCM0201.CD%TYPE,                /*하위코드            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE              /*사용여부            */
    ) RETURN VARCHAR;
    
END Pkg_Rtcm0201;