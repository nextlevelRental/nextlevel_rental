CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0026 AS
/*******************************************************************************
   NAME:       Rtcm0026
   PURPOSE:    권한그룹-사용자 연동이력 관리

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2021-10-18                   1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 권한그룹-사용자 연동이력 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0026 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Auth_Grp_Cd    IN     RTCM0026.AUTH_GRP_CD%TYPE    /*권한그룹코드       */
    , v_User_Id        IN     RTCM0026.USER_ID%TYPE        /*사용자 아이디      */
  );
    
  /*****************************************************************************
  -- 권한그룹-사용자 연동이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0026(
      v_Auth_Grp_Cd    IN     RTCM0026.AUTH_GRP_CD%TYPE    /*권한그룹코드       */
    , v_User_Id        IN     RTCM0026.USER_ID%TYPE        /*사용자 아이디      */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
END Pkg_Rtcm0026;