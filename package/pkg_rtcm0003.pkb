CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0003 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0003
   PURPOSE:   비밀번호변경이력 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 비밀번호변경이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0003 (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_User_Id   IN     RTCM0003.USER_ID%TYPE        /*사용자 아이디           */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.USER_ID,
            A.USEQ,
            A.PASSWORD,
            A.REASON,
            A.CHG_ID ,
            A.CHG_DT
    FROM    RTCM0003    A
    WHERE   A.USER_ID = v_User_Id
    ORDER BY A.USER_ID, A.USEQ;
    
  END p_sRtcm0003;

  /*****************************************************************************
  -- 비밀번호변경이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0003(
    v_User_Id        IN  RTCM0003.USER_ID%TYPE,        /*사용자 아이디        */
    v_Password       IN  RTCM0003.PASSWORD%TYPE,       /*비밀번호             */
    v_Reason         IN  RTCM0003.REASON%TYPE,         /*변경사유             */
    v_Chg_Id         IN  RTCM0003.CHG_ID%TYPE,         /*변경자 ID            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
    e_Error EXCEPTION;
  BEGIN

    INSERT INTO RTCM0003 (
            USER_ID, 
            USEQ, 
            PASSWORD, REASON, 
            CHG_ID, CHG_DT
            )
    VALUES  (
            v_User_Id,            
            NVL((SELECT  MAX(USEQ) + 1
                 FROM    RTCM0003
                 WHERE   USER_ID = v_User_Id), 1),
            v_Password, v_Reason, 
            v_Chg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0003;

END Pkg_Rtcm0003;