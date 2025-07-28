CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0001 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0001
   PURPOSE   사용자 MASTER 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 사용자 MASTER Count
  *****************************************************************************/
  FUNCTION f_sRtcm0001Count(
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*사용자 아이디       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자 MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0001 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE        /*사용자 그룹           */
    );

  /*****************************************************************************
  -- 사용자 MASTER Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0001 (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_Password       IN RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
    v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*대리점아이디          */
    v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*지사                  */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*사용자 그룹           */
    v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*사용불가 계정여부     */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자 MASTER Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0001 (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_Password       IN RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
    v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*대리점아이디          */
    v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*지사                  */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*사용자 그룹           */
    v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*사용불가 계정여부     */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 사용자 MASTER Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0001 (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자 MASTER 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0001 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_Password       IN RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
    v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*대리점아이디          */
    v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*지사                  */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*사용자 그룹           */
    v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*사용불가 계정여부     */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 사용자Master Update -  PassWord Update
  *****************************************************************************/
  PROCEDURE p_UpdateRtcm0001PassWord(
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,      /*사용자 아이디          */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,     /*비밀번호               */
    v_Old_Password   IN  RTCM0001.OLD_PASSWORD%TYPE, /*이전비밀번호           */
    v_Reason         IN  RTCM0003.REASON%TYPE,       /*변경사유               */
    v_Reg_Id         IN  RTCM0001.REG_ID%TYPE,       /*등록자 ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );


  /*****************************************************************************
  -- 사용자Master Update - 비밀번호 초기화
  *****************************************************************************/
  PROCEDURE p_UpdateRtcm0001Init(
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,      /*사용자 아이디          */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,     /*비밀번호               */
    v_Reg_Id         IN  RTCM0001.REG_ID%TYPE,       /*등록자 ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );


  /*****************************************************************************
  -- 사용자 패스워드 검증
  *****************************************************************************/
  PROCEDURE p_sPassWordVerification(
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,      /*사용자 아이디          */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,     /*비밀번호               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2
    );

  /*****************************************************************************
  -- 사용자 Master 조회- 로그인시 사용자 정보 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0001LoginInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN     RTCM0001.USER_ID%TYPE,       /*사용자 아이디      */
    v_Password       IN     RTCM0001.PASSWORD%TYPE,      /*비밀번호           */
    v_Local_Ip       IN     VARCHAR2                     /*로컬PC IP          */
    );    


  /*****************************************************************************
  -- 사용자 MASTER Update - 로그인 시도횟수 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0001FailCnt (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 사용자 MASTER Update - 로그인 시도횟수 초기화
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0001FailCntInit (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 사용자 MASTER - 사용자아이디 기준 사용자명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0001UserNm(
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*사용자 아이디       */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 사용자 MASTER - 사용자명 기준 사용자아이디 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0001UserCd(
    v_User_Nm        IN RTCM0001.USER_NM%TYPE           /*사용자 명       */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- 사용자 MASTER - 사용자아이디 기준 사용자 그룹 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0001UserGrp(
    v_User_Id        IN RTCM0001.USER_ID%TYPE         /*사용자 아이디         */
    ) RETURN VARCHAR;
            
END Pkg_Rtcm0001;