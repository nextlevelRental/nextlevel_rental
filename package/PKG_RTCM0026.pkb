CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0026 AS
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
  ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR 
    SELECT  A1.AUTH_GRP_CD  /* 권한그룹코드  */
         ,  B1.AUTH_GRP_NM  /* 권한그룹명    */
         ,  A1.USER_ID      /* 사용자 아이디 */
         ,  C1.USER_NM      /* 사용자명      */
         ,  A1.USEQ         /* 이력순번      */
         ,  A1.DEL_FG       /* 삭제표시      */
         ,  A1.REG_ID       /* 등록자 ID     */
         ,  A1.REG_DT       /* 등록일        */
         ,  A1.CHG_ID       /* 변경자 ID     */
         ,  A1.CHG_DT       /* 변경일        */
      FROM  RTCM0026 A1  
         ,  RTCM0021 B1
         ,  RTCM0001 C1
     WHERE  A1.AUTH_GRP_CD = v_Auth_Grp_Cd
       AND  A1.USER_ID     = v_User_Id 
       AND  A1.AUTH_GRP_CD = B1.AUTH_GRP_CD(+)
       AND  A1.USER_ID     = C1.USER_ID(+) 
     ORDER  BY A1.USER_ID, A1.AUTH_GRP_CD, A1.USEQ  
    ;    
    
  END p_sRtcm0026;

  /*****************************************************************************
  -- 권한그룹-사용자 연동이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0026(
      v_Auth_Grp_Cd    IN     RTCM0026.AUTH_GRP_CD%TYPE    /*권한그룹코드       */
    , v_User_Id        IN     RTCM0026.USER_ID%TYPE        /*사용자 아이디      */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
    
  BEGIN
  
    INSERT INTO RTCM0026 (
          AUTH_GRP_CD
        , USER_ID
        , USEQ
        , DEL_FG
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    )
    SELECT  A1.AUTH_GRP_CD
         ,  A1.USER_ID
         ,  NVL((SELECT MAX(Z.USEQ)+1 FROM RTCM0026 Z WHERE Z.AUTH_GRP_CD = A1.AUTH_GRP_CD AND Z.USER_ID = A1.USER_ID), 1)
         ,  A1.DEL_FG
         ,  A1.REG_ID
         ,  A1.REG_DT
         ,  A1.CHG_ID
         ,  A1.CHG_DT
      FROM  RTCM0023 A1  
     WHERE  A1.AUTH_GRP_CD = v_Auth_Grp_Cd
       AND  A1.USER_ID     = v_User_Id 
    ;             
                
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0026;



END Pkg_Rtcm0026;
/