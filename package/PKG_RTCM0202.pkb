CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_RTCM0202 AS
/*******************************************************************************
   NAME:      Pkg_RTCM0202
   PURPOSE:   문자포맷 Detail history

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 문자포맷 Detail history Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0202(
    v_Mid_Grp_Cd     IN  RTCM0202.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0202.CD%TYPE,               /*하위코드            */
    v_Cd_Nm          IN  RTCM0202.CD_NM%TYPE,            /*하위코드명          */
    v_Msg_Contents   IN  RTCM0202.MSG_CONTENTS%TYPE,     /*코드설명            */
    v_Kakao_Msg_Cd   IN  RTCM0202.KAKAO_MSG_CD%TYPE,     /*알림톡코드            */
    v_Msg_Type       IN  RTCM0202.MSG_TYPE%TYPE,         /*발송유형            */
    v_Reserved_Type  IN  RTCM0202.RESERVED_TYPE%TYPE,    /*즉시발송여부         */
    v_Order_Pt       IN  RTCM0202.ORDER_PT%TYPE,         /*정렬순서            */
    v_Use_Yn         IN  RTCM0202.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0202.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0202 (
            MID_GRP_CD, CD, CD_NM, SEQ, MSG_CONTENTS, 
            ORDER_PT, KAKAO_MSG_CD, MSG_TYPE, RESERVED_TYPE, 
            USE_YN, REG_ID, REG_DT, CHG_ID, CHG_DT
            )
    VALUES  (
            v_Mid_Grp_Cd, v_Cd, NVL(v_Cd_Nm, ' '), (SELECT MAX(SEQ) + 1 FROM RTCM0202 WHERE MID_GRP_CD = v_Mid_Grp_Cd AND CD = v_Cd), 
            v_Msg_Contents, v_Order_Pt, v_Kakao_Msg_Cd, v_Msg_Type, v_Reserved_Type, 
            v_Use_Yn, v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0202;
  
END Pkg_Rtcm0202;