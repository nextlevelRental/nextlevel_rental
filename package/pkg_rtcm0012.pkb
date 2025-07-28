CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0012 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0012
   PURPOSE:   메뉴 Master 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 메뉴 Master Count
  *****************************************************************************/
  FUNCTION f_sRtcm0012Count(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE         /*메뉴코드              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0012
    WHERE   MENU_CD = v_Menu_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0012Count;

  /*****************************************************************************
  -- 메뉴 Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0012 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*메뉴명                */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE     /*상위메뉴코드          */
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
    WHERE   A.MENU_CD = DECODE(v_Menu_Cd, NULL, A.MENU_CD, v_Menu_Cd)
    AND     A.MENU_NM LIKE '%'||v_Menu_Nm||'%'
    AND     A.UPR_MENU_CD = DECODE(v_Upr_Menu_Cd, NULL, A.UPR_MENU_CD, v_Upr_Menu_Cd)
    AND     A.UPR_MENU_CD = B.MENU_CD(+)
    ORDER   BY A.MDL_CD, A.SORT_ODR;
    
  END p_sRtcm0012;

  /*****************************************************************************
  -- 메뉴 Master Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*메뉴명                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*메뉴레벨              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*상위메뉴코드          */
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*모듈코드              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*정렬순서              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*메뉴설명              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    INSERT  INTO RTCM0012 (
            MENU_CD,
            MENU_NM,
            MENU_LVL,
            UPR_MENU_CD,
            MDL_CD,
            SORT_ODR,
            MENU_DESC,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Menu_Cd,
            v_Menu_Nm,
            v_Menu_Lvl,
            DECODE(V_Menu_Lvl,1,' ', V_Upr_Menu_Cd), -- V_Upr_Menu_Cd 인덱스를 사용하기 위해 최상위메뉴만 ' '으로 처리
            v_Mdl_Cd,
            v_Sort_Odr,
            v_Menu_Desc,
            v_Use_Yn,
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
        
  END f_InsertRTCM0012;


  /*****************************************************************************
  -- 메뉴 Master Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*메뉴명                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*메뉴레벨              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*상위메뉴코드          */    
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*모듈코드              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*정렬순서              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*메뉴설명              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS    

  BEGIN

    UPDATE RTCM0012
    SET    MENU_CD      = V_Menu_Cd,
           MENU_NM      = V_Menu_Nm,
           MENU_LVL     = V_Menu_Lvl,
           UPR_MENU_CD  = DECODE(V_Menu_Lvl,1,' ', V_Upr_Menu_Cd), -- V_Upr_Menu_Cd 인덱스를 사용하기 위해 최상위메뉴만 ' '으로 처리
           MDL_CD       = v_Mdl_Cd,
           SORT_ODR     = v_Sort_Odr,
           MENU_DESC    = V_Menu_Desc,
           USE_YN       = V_Use_Yn,
           REG_ID       = V_Reg_Id,
           REG_DT       = SYSDATE,
           CHG_ID       = V_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  MENU_CD      = V_Menu_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0012;
  
  /*****************************************************************************
  -- 메뉴 Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0012(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0012
    SET    USE_YN  = 'N',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  MENU_CD = v_Menu_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0012;

  
  /*****************************************************************************
  -- 메뉴 Master 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0012(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE,        /*메뉴코드              */
    v_Menu_Nm        IN RTCM0012.MENU_NM%TYPE,        /*메뉴명                */
    v_Menu_Lvl       IN RTCM0012.MENU_LVL%TYPE,       /*메뉴레벨              */
    v_Upr_Menu_Cd    IN RTCM0012.UPR_MENU_CD%TYPE,    /*상위메뉴코드          */
    v_Mdl_Cd         IN RTCM0012.MDL_CD%TYPE,         /*모듈코드              */
    v_Sort_Odr       IN RTCM0012.SORT_ODR%TYPE,       /*정렬순서              */
    v_Menu_Desc      IN RTCM0012.MENU_DESC%TYPE,      /*메뉴설명              */
    v_Use_Yn         IN RTCM0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0012.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값: 프로그램 코드, 프로그램 명, 프로그램 URL, 프로그램 설명, 모듈코드 , 사용유무, 등록자 ID
    IF TRIM(v_Menu_Cd) IS NULL THEN
        v_Return_Message := '메뉴코드('||v_Menu_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Menu_Nm) IS NULL THEN
        v_Return_Message := '메뉴명('||v_Menu_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Menu_Lvl) IS NULL THEN
        v_Return_Message := '메뉴레벨('||(v_Menu_Lvl)||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (v_Menu_Lvl <> 1) AND (TRIM(v_Upr_Menu_Cd) IS NULL) THEN
        v_Return_Message := '최상위 메뉴를 제외하고는 상위메뉴('||(v_Upr_Menu_Cd)||')필수 입력항목입니다. 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        
        
    IF (TRIM(v_Mdl_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C003', v_Mdl_Cd)) THEN
        v_Return_Message := '모듈코드('||v_Mdl_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtcm0012Count(v_Menu_Cd) THEN

        IF 0 != f_InsertRtcm0012(v_Menu_Cd, v_Menu_Nm, v_Menu_Lvl, v_Upr_Menu_Cd, 
                                 v_Mdl_Cd, v_Sort_Odr, v_Menu_Desc, v_Use_Yn, 
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '메뉴 Master 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;      
                          
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0012(v_Menu_Cd, v_Menu_Nm, v_Menu_Lvl, v_Upr_Menu_Cd, 
                                     v_Mdl_Cd, v_Sort_Odr, v_Menu_Desc, v_Use_Yn, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '메뉴 Master 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0012(v_Menu_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '메뉴 Master 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0012.p_IUDRTCM0012(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0012.p_IUDRTCM0012(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0012;

  /*****************************************************************************
  -- 메뉴 Master - 메뉴코드로 메뉴명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0012MenuName(
    v_Menu_Cd        IN RTCM0012.MENU_CD%TYPE         /*메뉴코드              */
    ) RETURN VARCHAR IS
    v_Menu_Nm        RTCM0012.MENU_NM%TYPE;           /*메뉴코드              */
  BEGIN

    SELECT  MENU_NM
    INTO    v_Menu_Nm
    FROM    RTCM0012
    WHERE   MENU_CD = v_Menu_Cd;

    RETURN v_Menu_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0012MenuName;

  /*****************************************************************************
  -- 메뉴 Master - 메뉴TREE 구성을 위한 전체 메뉴구조 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0012Tree (
    Ref_Cursor   IN OUT SYS_REFCURSOR
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  ROWNUM ROW_SEQ,
            A.MENU_CD,       /*메뉴코드              */
            A.MENU_NM,       /*메뉴명                */
            A.MENU_LVL,      /*메뉴레벨              */
            A.UPR_MENU_CD,   /*상위메뉴코드          */
            Pkg_Rtcm0012.f_sRtcm0012MenuName(A.UPR_MENU_CD) UPR_MENU_NM, /*상위메뉴명          */
            A.MDL_CD,        /*모듈코드              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM, /*모듈명 */
            A.SORT_ODR,      /*정렬순서              */
            A.MENU_DESC,     /*메뉴설명              */
            A.USE_YN         /*사용여부              */
    FROM    RTCM0012 A
    START   WITH A.UPR_MENU_CD = ' '
    CONNECT BY A.UPR_MENU_CD = PRIOR A.MENU_CD
    AND     A.USE_YN = 'Y'
    ORDER   SIBLINGS BY A.SORT_ODR; 
    
  END p_sRtcm0012Tree;


  /*****************************************************************************
  -- 메뉴 Master -  메뉴- 프로그램  트리 구성
  *****************************************************************************/
  PROCEDURE p_sRtcm0012TreeProgram (
    Ref_Cursor   IN OUT SYS_REFCURSOR
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  A.MENU_TYPE,                                
            A.MENU_CD,       /*메뉴코드              */ 
            A.MENU_NM,       /*메뉴명                */ 
            A.MENU_LVL,      /*메뉴레벨              */ 
            A.UPR_MENU_CD,   /*상위메뉴코드          */ 
            A.MDL_CD,        /*모듈코드              */ 
            A.SORT_ODR,      /*정렬순서              */ 
            A.MENU_DESC,     /*메뉴설명              */ 
            A.USE_YN         /*사용여부              */ 
    FROM    (
            SELECT  'M' MENU_TYPE,
                    C12.MENU_CD,       /*메뉴코드              */
                    C12.MENU_NM,       /*메뉴명                */
                    C12.MENU_LVL,      /*메뉴레벨              */
                    C12.UPR_MENU_CD,   /*상위메뉴코드          */
                    C12.MDL_CD,        /*모듈코드              */
                    C12.SORT_ODR,      /*정렬순서              */
                    C12.MENU_DESC,     /*메뉴설명              */
                    C12.USE_YN         /*사용여부              */
            FROM    RTCM0012 C12
            UNION   ALL
            SELECT  'P' MENU_TYPE,
                    C13.PRGM_CD MENU_CD,
                    C11.PRGM_NM MENU_NM,
                    C12.MENU_LVL+1 MENU_LVL,
                    C13.MENU_CD UPR_MENU_CD, 
                    C12.MDL_CD,
                    C13.SORT_ODR,
                    C11.PRGM_DESC MENU_DESC,
                    C12.USE_YN
            FROM    RTCM0013 C13,
                    RTCM0012 C12,
                    RTCM0011 C11
            WHERE   C13.MENU_CD = C12.MENU_CD
            AND     C13.PRGM_CD = C11.PRGM_CD
            ) A
    START   WITH A.UPR_MENU_CD = ' '
    CONNECT BY A.UPR_MENU_CD = PRIOR A.MENU_CD
    AND     A.USE_YN = 'Y'
    ORDER   SIBLINGS BY A.SORT_ODR; 
    
  END p_sRtcm0012TreeProgram;


  /*****************************************************************************
  -- 메뉴 Master - 특정 사용자의  메뉴 트리 구성
  *****************************************************************************/
  PROCEDURE p_sRtcm0012UserTree (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*사용자 아이디       */    
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  ROWNUM ROW_SEQ,
            A.MENU_CD,       /*메뉴코드              */
            A.MENU_NM,       /*메뉴명                */
            A.MENU_LVL,      /*메뉴레벨              */
            A.UPR_MENU_CD,   /*상위메뉴코드          */
            Pkg_Rtcm0012.f_sRtcm0012MenuName(A.UPR_MENU_CD) UPR_MENU_NM, /*상위메뉴명          */
            A.MDL_CD,        /*모듈코드              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM, /*모듈명 */
            A.SORT_ODR,      /*정렬순서              */
            A.MENU_DESC,     /*메뉴설명              */
            A.USE_YN         /*사용여부              */
    FROM    RTCM0012 A
    WHERE   A.MENU_CD IN (-- 사용자의 권한그룹별 메뉴 리스트(중복제거)
                            SELECT  DISTINCT C25.MENU_CD
                            FROM    RTCM0023 C23,
                                    RTCM0025 C25,
                                    RTCM0021 C21
                            WHERE   C23.USER_ID = v_User_Id
                            AND     C23.DEL_FG = 'N'
                            AND     C23.AUTH_GRP_CD = C25.AUTH_GRP_CD
                            AND     C23.AUTH_GRP_CD = C21.AUTH_GRP_CD
                            AND     C21.USE_YN = 'Y'
                            )
    START   WITH A.UPR_MENU_CD = ' '
    CONNECT BY A.UPR_MENU_CD = PRIOR A.MENU_CD
    AND     A.USE_YN = 'Y'
    ORDER   SIBLINGS BY A.SORT_ODR;
    
  END p_sRtcm0012UserTree;  
  
  /*****************************************************************************
  -- 메뉴 Master -  특정 사용자의  메뉴- 프로그램 - 사용권한  트리 구성
  *****************************************************************************/
  PROCEDURE p_sRtcm0012UserTreeAuth (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE,          /*사용자 아이디       */
    v_Local_Ip       IN VARCHAR2                        /*로컬PC IP           */
    ) IS

    v_ErrorText      VARCHAR2(2000);
    
    v_Fail_Cnt       RTCM0001.FAIL_CNT%TYPE;
    
  BEGIN


    OPEN Ref_Cursor FOR
    WITH R_MENU_CD AS (
        SELECT C13.MENU_CD
               FROM RTCM0023 C23,
                    RTCM0021 C21,
                    RTCM0024 C24,
                    RTCM0013 C13
                    WHERE     C23.USER_ID = v_User_Id
                    AND C23.DEL_FG = 'N'
                    AND C23.AUTH_GRP_CD = C21.AUTH_GRP_CD
                    AND C21.USE_YN = 'Y'
                    AND C23.AUTH_GRP_CD = C24.AUTH_GRP_CD
                    AND C24.PRGM_CD = C13.PRGM_CD
                    GROUP BY C13.MENU_CD
    )
    SELECT  A.ROW_SEQ,         /*순번                  */
            A.MENU_TYPE,       /*메뉴_프로그램구분     */
            A.MENU_CD,         /*메뉴코드              */
            A.MENU_NM,         /*메뉴명                */
            A.MENU_LVL,        /*메뉴레벨              */
            A.UPR_MENU_CD,     /*상위메뉴코드          */
            A.MENU_CD_TOP,     /*최상위메뉴코드        */
            LOWER(A.MDL_CD) MDL_CD, /*모듈코드              */
            A.SORT_ODR,        /*정렬순서              */
            A.MENU_DESC,       /*메뉴설명              */
            A.USE_YN,          /*사용여부              */
            A.PRGM_PATH,       /*프로그램경로          */
            B.USER_ID,         /*사용자아이디          */
            B.PRGM_CD,         /*프로그램코드          */
            B.READ_AUTH_YN,    /*읽기권한 여부         */
            B.SAVE_AUTH_YN,    /*저장권한여부          */
            B.DEL_AUTH_YN,     /*삭제권한여부          */
            B.PRNT_AUTH_YN,    /*인쇄권한여부          */
            B.EXPT_AUTH_YN,    /*엑셀저장권한여부      */
            B.CHG_AUTH_YN,     /*조직수정권한여부      */
            B.ETC1_AUTH_YN,    /*기타 권한1            */
            B.ETC2_AUTH_YN,    /*기타 권한2            */
            B.ETC3_AUTH_YN     /*기타 권한3            */
    FROM    (
            SELECT  ROWNUM ROW_SEQ,
                    CONNECT_BY_ROOT(A.MENU_CD) MENU_CD_TOP,
                    A.*
            FROM    (
                    SELECT  'M' MENU_TYPE,               /*메뉴_프로그램구분     */
                            C12.MENU_CD,                 /*메뉴코드              */
                            C12.MENU_NM,                 /*메뉴명                */
                            C12.MENU_LVL,                /*메뉴레벨              */
                            C12.UPR_MENU_CD,             /*상위메뉴코드          */
                            C12.MDL_CD,                  /*모듈코드              */
                            C12.SORT_ODR,                /*정렬순서              */
                            C12.MENU_DESC,               /*메뉴설명              */
                            C12.USE_YN,                  /*사용여부              */
                            '' PRGM_PATH                 /*프로그램경로          */
                    FROM    RTCM0012 C12
                    WHERE   C12.MENU_CD IN (SELECT  MENU_CD
                                            FROM    RTCM0012 C13
                                            START   WITH C13.MENU_CD IN (SELECT * FROM R_MENU_CD)
                                            CONNECT BY  PRIOR C13.UPR_MENU_CD = C13.MENU_CD )  
                    UNION   ALL
                    SELECT  'P' MENU_TYPE,               /*메뉴_프로그램구분     */
                            C13.PRGM_CD MENU_CD,         /*메뉴코드              */
                            C11.PRGM_NM MENU_NM,         /*메뉴명                */
                            C12.MENU_LVL+1 MENU_LVL,     /*메뉴레벨              */
                            C13.MENU_CD UPR_MENU_CD,     /*상위메뉴코드          */
                            C12.MDL_CD,                  /*모듈코드              */
                            C13.SORT_ODR,                /*정렬순서              */
                            C11.PRGM_DESC MENU_DESC,     /*메뉴설명              */
                            C11.USE_YN,                  /*사용여부              */
                            C11.PRGM_PATH                /*프로그램경로          */
                    FROM    RTCM0013 C13,
                            RTCM0012 C12,
                            RTCM0011 C11
                    WHERE   C13.MENU_CD = C12.MENU_CD
                    AND     C13.PRGM_CD = C11.PRGM_CD
                    AND     C13.MENU_CD IN (SELECT  MENU_CD
                                            FROM    RTCM0012 C13
                                            START   WITH C13.MENU_CD IN (SELECT * FROM R_MENU_CD)
                                            CONNECT BY  PRIOR C13.UPR_MENU_CD = C13.MENU_CD )  
                    ) A
            START   WITH A.UPR_MENU_CD = ' '
            CONNECT BY A.UPR_MENU_CD = PRIOR A.MENU_CD
            AND     A.USE_YN = 'Y'
            ORDER   SIBLINGS BY A.SORT_ODR
            ) A,
            (
            SELECT  C23.USER_ID,                         /*사용자아이디          */
                    C24.PRGM_CD,                         /*프로그램코드          */
                    MAX(C24.READ_AUTH_YN) READ_AUTH_YN,  /*읽기권한 여부         */
                    MAX(C24.SAVE_AUTH_YN) SAVE_AUTH_YN,  /*저장권한여부          */
                    MAX(C24.DEL_AUTH_YN ) DEL_AUTH_YN ,  /*삭제권한여부          */
                    MAX(C24.PRNT_AUTH_YN) PRNT_AUTH_YN,  /*인쇄권한여부          */
                    MAX(C24.EXPT_AUTH_YN) EXPT_AUTH_YN,  /*엑셀저장권한여부      */
                    MAX(C24.CHG_AUTH_YN ) CHG_AUTH_YN ,  /*조직수정권한여부      */
                    MAX(C24.ETC1_AUTH_YN) ETC1_AUTH_YN,  /*기타 권한1            */
                    MAX(C24.ETC2_AUTH_YN) ETC2_AUTH_YN,  /*기타 권한2            */
                    MAX(C24.ETC3_AUTH_YN) ETC3_AUTH_YN   /*기타 권한3            */
            FROM    RTCM0023 C23,
                    RTCM0021 C21,
                    RTCM0024 C24
            WHERE   C23.USER_ID = v_User_Id
            AND     C23.DEL_FG  = 'N'
            AND     C23.AUTH_GRP_CD = C21.AUTH_GRP_CD
            AND     C21.USE_YN = 'Y'
            AND     C23.AUTH_GRP_CD = C24.AUTH_GRP_CD
            GROUP   BY C23.USER_ID, C24.PRGM_CD
            ) B
    WHERE   A.MENU_CD = B.PRGM_CD(+)
    AND     NOT (A.MENU_TYPE = 'P' AND USER_ID IS NULL)
    ORDER BY A.ROW_SEQ;

    -- 사용자별 메뉴권한 프로시져(p_sRtcm0012UserTreeAuth)는  로그인 성공시 호출되는 프로시져로 최종 접속 일자 업데이트
    
    SELECT  FAIL_CNT
      INTO  v_Fail_Cnt
      FROM  RTCM0001
     WHERE  USER_ID = v_User_Id;

    IF v_Fail_Cnt <= 5 THEN
        -- 사용자정보조회 프로시져(p_sRtcm0001LoginInfo)에서 접속 실패 건수를 +1 해놓고, 로그인 성공시 0으로 초기화
        IF 0 != Pkg_Rtcm0001.f_UpdateRtcm0001FailCntInit(v_User_Id, v_ErrorText) THEN
            Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0012.p_sRtcm0012UserTreeAuth(2)', '접속 실패 건수 초기화 실패!!!', v_User_Id, v_ErrorText);
        END IF;
    END IF;

    -- 사용자 아이디와 로컬 IP 정보는 추후 아이디 도용등의 문제 점검시 사용하기 위해 로그 생성
    --Pkg_Utility.p_LoginFileWrite('Pkg_Rtcm0012.p_sRtcm0012UserTreeAuth(1)', 'v_User_Id', v_User_Id, 'v_Local_Ip', v_Local_Ip);



  END p_sRtcm0012UserTreeAuth;
    
END Pkg_Rtcm0012;