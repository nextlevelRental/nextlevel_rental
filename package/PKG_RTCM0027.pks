CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0027 AS
/*******************************************************************************
   NAME:       Rtcm0027
   PURPOSE:    프로그램-권한그룹 연동이력 관리

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2021-10-29                   1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 프로그램-권한그룹 연동이력 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0027 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Prgm_Cd        IN RTCM0027.PRGM_CD%TYPE         /*프로그램코드          */
    , v_Auth_Grp_Cd    IN RTCM0027.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
  );
    
  /*****************************************************************************
  -- 프로그램-권한그룹 연동이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0027(
      v_Prgm_Cd        IN RTCM0027.PRGM_CD%TYPE         /*프로그램코드          */
    , v_Auth_Grp_Cd    IN RTCM0027.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    , v_Comm_Dvsn      IN RTCM0027.COMM_DVSN%TYPE       /*처리구분(I,U,D)       */
    , v_Reg_Id         IN RTCM0027.REG_ID%TYPE          /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
END Pkg_Rtcm0027;