CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0003
AS
   /******************************************************************************
      NAME:       Rtcm0003
      PURPOSE:    비밀번호변경이력

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        2015-06-17  jimcarry         1. Created this package body.
   ******************************************************************************/


  /*****************************************************************************
  -- 비밀번호변경이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0003 (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_User_Id   IN     RTCM0003.USER_ID%TYPE        /*사용자 아이디           */
    );

  /*****************************************************************************
  -- 비밀번호변경이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0003(
    v_User_Id        IN  RTCM0003.USER_ID%TYPE,        /*사용자 아이디        */
    v_Password       IN  RTCM0003.PASSWORD%TYPE,       /*비밀번호             */
    v_Reason         IN  RTCM0003.REASON%TYPE,         /*변경사유             */
    v_Chg_Id         IN  RTCM0003.CHG_ID%TYPE,         /*변경자 ID            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

END Pkg_Rtcm0003;
/
