CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0023 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0023
   PURPOSE:   권한그룹-사용자 연동 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 권한그룹-사용자 연동 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0023Count(
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE         /*사용자 아이디         */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0023
    WHERE   AUTH_GRP_CD = v_Auth_Grp_Cd
    AND     USER_ID     = v_User_Id;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN 0;

  END f_sRTCM0023Count;

  /*****************************************************************************
  -- 권한그룹-사용자 연동 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0023 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE         /*사용자 아이디         */
    ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  A.AUTH_GRP_CD,      /*권한그룹코드          */
            A.USER_ID,          /*사용자 아이디         */
            A.DEL_FG,           /*삭제표시              */
            A.REG_ID,           /*등록자 ID             */
            A.REG_DT,           /*등록일                */
            A.CHG_ID,           /*변경자 ID             */
            A.CHG_DT            /*변경일                */
    FROM    RTCM0023 A
    WHERE   A.AUTH_GRP_CD = DECODE(V_Auth_Grp_Cd, NULL, A.AUTH_GRP_CD, V_Auth_Grp_Cd)
    AND     A.USER_ID LIKE V_User_Id||'%'
    AND     A.DEL_FG = 'N';
    
  END p_sRtcm0023;

  /*****************************************************************************
  -- 권한그룹-사용자 연동 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0023(
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_Del_Fg         IN RTCM0023.DEL_FG%TYPE,         /*삭제표시              */
    v_Reg_Id         IN RTCM0023.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0023 (
            AUTH_GRP_CD,
            USER_ID,
            DEL_FG,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Auth_Grp_Cd,
            v_User_Id,
            v_Del_Fg,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
            
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRTCM0023;


  /*****************************************************************************
  -- 권한그룹-사용자 연동 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0023(
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_Del_Fg         IN RTCM0023.DEL_FG%TYPE,         /*삭제표시              */
    v_Reg_Id         IN RTCM0023.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN
  
    UPDATE RTCM0023
    SET    DEL_FG      = V_Del_Fg,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  AUTH_GRP_CD = V_Auth_Grp_Cd
    AND    USER_ID     = V_User_Id;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0023;
  
  /*****************************************************************************
  -- 권한그룹-사용자 연동 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0023(
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_Reg_Id         IN RTCM0023.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0023
    SET    DEL_FG      = 'Y',
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  AUTH_GRP_CD = V_Auth_Grp_Cd
    AND    USER_ID     = V_User_Id;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0023;

  
  /*****************************************************************************
  -- 권한그룹-사용자 연동 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0023(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_Del_Fg         IN RTCM0023.DEL_FG%TYPE,         /*삭제표시              */
    v_Reg_Id         IN RTCM0023.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값: 권한그룹코드, 사용자 아이디, 삭제표시, 등록자ID
    IF TRIM(v_Auth_Grp_Cd) IS NULL THEN
        v_Return_Message := '권한그룹코드('||v_Auth_Grp_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_User_Id) IS NULL THEN
        v_Return_Message := '사용자 아이디('||v_User_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Del_Fg) IS NULL THEN
        v_Return_Message := '삭제표시('||v_Del_Fg||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtcm0023Count(v_Auth_Grp_Cd, v_User_Id) THEN
    
        IF 0 != f_InsertRtcm0023(v_Auth_Grp_Cd, v_User_Id, v_Del_Fg, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '권한그룹-사용자 연동 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;  
                              
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0023(v_Auth_Grp_Cd, v_User_Id, v_Del_Fg, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '권한그룹-사용자 연동 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0023(v_Auth_Grp_Cd, v_User_Id, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '권한그룹-사용자 연동 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;
            
        ELSE
            v_Return_Message := ' 처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;  
                  
        END IF;
    END IF;
    
    -- 권한그룹-사용자 연동 변경이력 생성
    IF 0 != Pkg_Rtcm0026.f_InsertRtcm0026(v_Auth_Grp_Cd, v_User_Id, v_ErrorText) THEN
        v_Return_Message := '이력 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText:= v_ErrorText;
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
--    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0023.p_IUDRTCM0023(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0023.p_IUDRTCM0023(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0023;


  /*****************************************************************************
  --  권한그룹-사용자 연동 관리 - 해당 권한그룹에 소속된 사용자 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0023AuthGroupUser (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.USER_ID,                   /*사용자 아이디       */
            A.USER_NM,                   /*사용자명            */
            A.USER_GRP,                  /*사용자 그룹         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C001', A.USER_GRP) USER_GRP_NM, /*사용자 그룹명  */
            A.VKGRP,                     /*지사                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.VKGRP) VKGRP_NM,       /*지사명         */
            A.VKBUR,                     /*지점                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.VKBUR) VKBUR_NM,       /*지점명         */
            A.AGENT_ID,                  /*대리점아이디        */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENT_ID) AGENT_NM             /*대리점명       */
    FROM    RTCM0001 A    
    WHERE   A.USER_ID IN (SELECT  B.USER_ID
                          FROM    RTCM0023 B
                          WHERE   B.AUTH_GRP_CD = v_Auth_Grp_Cd
                          AND     B.DEL_FG = 'N')
    AND     A.LOCK_YN = 'N';
    
    
  END p_sRtcm0023AuthGroupUser;
  
  /*****************************************************************************
  --  권한그룹-사용자 연동 관리 - 해당 권한그룹에 소속되지 않은 사용자 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0023AuthGroupUserNot (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE         /*사용자명              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  A.USER_ID,                   /*사용자 아이디       */
            A.USER_NM,                   /*사용자명            */
            A.USER_GRP,                  /*사용자 그룹         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C001', A.USER_GRP) USER_GRP_NM, /*사용자 그룹명  */
            A.VKGRP,                     /*지사                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.VKGRP) VKGRP_NM,       /*지사명         */
            A.VKBUR,                     /*지점                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.VKBUR) VKBUR_NM,       /*지점명         */
            A.AGENT_ID,                  /*대리점아이디        */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENT_ID) AGENT_NM             /*대리점명       */
    FROM    RTCM0001 A    
    WHERE   A.USER_ID NOT IN (SELECT  B.USER_ID
                              FROM    RTCM0023 B
                              WHERE   B.AUTH_GRP_CD = v_Auth_Grp_Cd
                              AND     B.DEL_FG = 'N')
    AND     A.USER_ID LIKE v_User_Id||'%'
    AND     A.USER_NM LIKE '%'||v_User_Nm||'%' 
    AND     A.LOCK_YN = 'N'
          ) A
          LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENT_ID = B.USER_ID
     ) A
    ;
    
    
  END p_sRtcm0023AuthGroupUserNot;
  
END Pkg_Rtcm0023;