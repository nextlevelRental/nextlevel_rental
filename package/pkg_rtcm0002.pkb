CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0002 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0002
   PURPOSE:   사용자이력 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 사용자이력 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN     RTCM0002.USER_ID%TYPE        /*사용자 아이디      */
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR 
    SELECT  A.USER_ID,
            A.USEQ,
            A.USER_NM,
            A.PASSWORD,     
            A.OLD_PASSWORD,
            NVL(A.AGENT_ID, ' ')  AGENT_ID   ,
            A.VKBUR,
            A.VKGRP,
            A.USER_GRP,     
            A.LAST_PW_DT,   
            A.LAST_LOGON_DT,
            A.FAIL_CNT    , 
            A.TMP_PW_YN    ,
            A.LOCK_YN      ,
            A.REG_ID       ,
            TO_CHAR(A.REG_DT,'YYYY-MM-DD') REG_DT,
            A.CHG_ID       ,
            TO_CHAR(A.CHG_DT,'YYYY-MM-DD') CHG_DT
    FROM    RTCM0002 A
    WHERE   A.USER_ID = v_User_Id
    ORDER   BY A.USER_ID, A.USEQ;
    
    
  END p_sRtcm0002;

  /*****************************************************************************
  -- 사용자이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0002(
    v_User_Id        IN RTCM0002.USER_ID%TYPE,          /*사용자 아이디       */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
  BEGIN
  
    INSERT  INTO RTCM0002 (
            USER_ID, 
            USEQ, 
            USER_NM, PASSWORD,
            OLD_PASSWORD, AGENT_ID, VKBUR, VKGRP, 
            USER_GRP, LAST_PW_DT, LAST_LOGON_DT, FAIL_CNT, 
            TMP_PW_YN, LOCK_YN, REG_ID, REG_DT, 
            CHG_ID, CHG_DT
            )
    SELECT  A.USER_ID, 
            NVL((SELECT  MAX(B.USEQ) + 1
                 FROM    RTCM0002 B
                 WHERE   B.USER_ID = A.USER_ID), 1) USEQ, 
            A.USER_NM, A.PASSWORD, 
            A.OLD_PASSWORD, A.AGENT_ID, A.VKBUR, A.VKGRP, 
            A.USER_GRP, A.LAST_PW_DT, A.LAST_LOGON_DT, A.FAIL_CNT, 
            A.TMP_PW_YN, A.LOCK_YN, A.REG_ID, A.REG_DT, 
            A.CHG_ID, A.CHG_DT
    FROM    RTCM0001 A
    WHERE   A.USER_ID = v_User_Id;
                
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0002;



END Pkg_Rtcm0002;