CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0025 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0025
   PURPOSE:   메뉴-권한그룹 연동 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0025Count(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0025
    WHERE   MENU_CD     = v_Menu_Cd
    AND     AUTH_GRP_CD = v_Auth_Grp_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0025Count;

  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0025 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  A.MENU_CD,       /*메뉴코드              */
            A.AUTH_GRP_CD,   /*권한그룹코드          */
            A.REG_ID,        /*등록자 ID             */
            A.REG_DT,        /*등록일                */
            A.CHG_ID,        /*변경자 ID             */
            A.CHG_DT         /*변경일                */
    FROM    RTCM0025 A
    WHERE   A.MENU_CD     = DECODE(v_Menu_Cd, NULL, A.MENU_CD, v_Menu_Cd)
    AND     A.AUTH_GRP_CD = DECODE(v_Auth_Grp_Cd, NULL, A.AUTH_GRP_CD, v_Auth_Grp_Cd);
    
  END p_sRtcm0025;

  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
  
    INSERT  INTO RTCM0025 (
            MENU_CD,
            AUTH_GRP_CD,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Menu_Cd,
            v_Auth_Grp_Cd,
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
        
  END f_InsertRTCM0025;


  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN
    UPDATE RTCM0025
    SET    MENU_CD      = V_Menu_Cd,
           AUTH_GRP_CD  = V_Auth_Grp_Cd,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  MENU_CD      = V_Menu_Cd
    AND    AUTH_GRP_CD  = V_Auth_Grp_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0025;
  
  /*****************************************************************************
  -- 메뉴-권한그룹 연동 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0025(
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    DELETE RTCM0025
    WHERE  MENU_CD      = V_Menu_Cd
    AND    AUTH_GRP_CD  = V_Auth_Grp_Cd;

    Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0025.f_DeleteRtcm0025(1)', '메뉴코드|권한그룹코드|등록자 ID', v_Menu_Cd, v_Auth_Grp_Cd, v_Reg_Id);        

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0025;

  
  /*****************************************************************************
  -- 메뉴-권한그룹 연동 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0025(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Auth_Grp_Cd    IN RTCM0025.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0025.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값: 메뉴코드, 권한그룹코드, 등록자 ID
    IF (TRIM(v_Menu_Cd) IS NULL) OR (0 = Pkg_Rtcm0012.f_sRtcm0012Count(v_Menu_Cd)) THEN
        v_Return_Message := '메뉴코드('||v_Menu_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Auth_Grp_Cd) IS NULL) OR (0 = Pkg_Rtcm0021.f_sRtcm0021Count(v_Auth_Grp_Cd)) THEN
        v_Return_Message := '권한그룹코드('||v_Auth_Grp_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtcm0025Count(v_Menu_Cd, v_Auth_Grp_Cd) THEN

        IF 0 != f_InsertRtcm0025(v_Menu_Cd, v_Auth_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '메뉴-권한그룹 연동 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;   
                             
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0025(v_Menu_Cd, v_Auth_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '메뉴-권한그룹 연동 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0025(v_Menu_Cd, v_Auth_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '메뉴-권한그룹 연동 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;
            
        ELSE
            v_Return_Message := ' 처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;  
                  
        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0025.p_IUDRTCM0025(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0025.p_IUDRTCM0025(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0025;



  /*****************************************************************************
  -- 메뉴-권한그룹 연동 - 해당 권한그룹에 소속된 메뉴 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0025AuthGroupMenu (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MENU_CD,       /*메뉴코드              */
            A.MENU_NM,       /*메뉴명                */
            A.MENU_LVL,      /*메뉴레벨              */
            A.UPR_MENU_CD,   /*상위메뉴코드          */
            B.MENU_NM UP_MENU_NM, /*상위메뉴명       */
            A.MDL_CD,        /*모듈코드              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM,    /*모듈명         */
            A.SORT_ODR,      /*정렬순서              */
            A.MENU_DESC,     /*메뉴설명              */
            A.USE_YN,        /*사용여부              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*사용여부명     */
            A.REG_ID,        /*등록자 ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,              /*등록자명       */
            A.REG_DT,        /*등록일                */
            A.CHG_ID,        /*변경자 ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,              /*변경자명       */
            A.CHG_DT         /*변경일                */
    FROM    RTCM0012 A,
            RTCM0012 B
    WHERE   A.MENU_CD IN (  SELECT  C25.MENU_CD
                            FROM    RTCM0025 C25
                            WHERE   C25.AUTH_GRP_CD = v_Auth_Grp_Cd)
    AND     A.UPR_MENU_CD = B.MENU_CD(+)
    ORDER   BY A.MENU_LVL, A.MDL_CD, A.SORT_ODR;
    
    
  END p_sRtcm0025AuthGroupMenu;
  
  /*****************************************************************************
  -- 메뉴-권한그룹 연동 - 해당 권한그룹에 소속되지 않은 메뉴 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0025AuthGroupMenuNot (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Menu_Cd        IN RTCM0025.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE         /*메뉴명                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MENU_CD,       /*메뉴코드              */
            A.MENU_NM,       /*메뉴명                */
            A.MENU_LVL,      /*메뉴레벨              */
            A.UPR_MENU_CD,   /*상위메뉴코드          */
            B.MENU_NM UP_MENU_NM, /*상위메뉴명       */
            A.MDL_CD,        /*모듈코드              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM,    /*모듈명         */
            A.SORT_ODR,      /*정렬순서              */
            A.MENU_DESC,     /*메뉴설명              */
            A.USE_YN,        /*사용여부              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*사용여부명     */
            A.REG_ID,        /*등록자 ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,              /*등록자명       */
            A.REG_DT,        /*등록일                */
            A.CHG_ID,        /*변경자 ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,              /*변경자명       */
            A.CHG_DT         /*변경일                */
    FROM    RTCM0012 A,
            RTCM0012 B
    WHERE   A.MENU_CD NOT IN (  SELECT  C25.MENU_CD
                                FROM    RTCM0025 C25
                                WHERE   C25.AUTH_GRP_CD = v_Auth_Grp_Cd)
    AND     A.UPR_MENU_CD = B.MENU_CD(+)    
    AND     A.MENU_CD LIKE v_Menu_Cd||'%'
    AND     A.MENU_NM LIKE '%'||v_Menu_Nm||'%' 
    ORDER   BY A.MENU_LVL, A.MDL_CD, A.SORT_ODR;
    
    
  END p_sRtcm0025AuthGroupMenuNot;
    
END Pkg_Rtcm0025;