CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0024 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0024
   PURPOSE:   프로그램-권한그룹 연동 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0024Count(
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0024
    WHERE   PRGM_CD     = V_Prgm_Cd
    AND     AUTH_GRP_CD = V_Auth_Grp_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0024Count;

  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0024 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Read_Auth_Yn   IN RTCM0024.READ_AUTH_YN%TYPE,   /*읽기원한여부          */
    v_Save_Auth_Yn   IN RTCM0024.SAVE_AUTH_YN%TYPE,   /*저장권한여부          */
    v_Del_Auth_Yn    IN RTCM0024.DEL_AUTH_YN%TYPE,    /*삭제권한여부          */
    v_Prnt_Auth_Yn   IN RTCM0024.PRNT_AUTH_YN%TYPE,   /*인쇄권한여부          */
    v_Expt_Auth_Yn   IN RTCM0024.EXPT_AUTH_YN%TYPE,   /*엑셀저장권한여부      */
    v_Chg_Auth_Yn    IN RTCM0024.CHG_AUTH_YN%TYPE     /*조직수정권한여부      */
    ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  A.PRGM_CD,          /*프로그램코드          */
            A.AUTH_GRP_CD,      /*권한그룹코드          */
            A.READ_AUTH_YN,     /*읽기원한여부          */
            A.SAVE_AUTH_YN,     /*저장권한여부          */
            A.DEL_AUTH_YN,      /*삭제권한여부          */
            A.PRNT_AUTH_YN,     /*인쇄권한여부          */
            A.EXPT_AUTH_YN,     /*엑셀저장권한여부      */
            A.CHG_AUTH_YN,      /*조직수정권한여부      */
            A.ETC1_AUTH_YN,     /*기타 권한1            */
            A.ETC2_AUTH_YN,     /*기타 권한2            */
            A.ETC3_AUTH_YN,     /*기타 권한3            */
            A.REG_ID,           /*등록자 ID             */
            A.REG_DT,           
            A.CHG_ID,
            A.CHG_DT 
    FROM    RTCM0024 A
    WHERE   A.PRGM_CD     = DECODE(V_Prgm_Cd, NULL, A.PRGM_CD, V_Prgm_Cd)
    AND     A.AUTH_GRP_CD = DECODE(v_Auth_Grp_Cd, NULL, A.AUTH_GRP_CD, v_Auth_Grp_Cd)
    AND     A.READ_AUTH_YN LIKE v_Read_Auth_Yn||'%'   /*읽기원한여부          */
    AND     A.SAVE_AUTH_YN LIKE v_Save_Auth_Yn||'%'   /*저장권한여부          */
    AND     A.DEL_AUTH_YN  LIKE v_Del_Auth_Yn ||'%'   /*삭제권한여부          */
    AND     A.PRNT_AUTH_YN LIKE v_Prnt_Auth_Yn||'%'   /*인쇄권한여부          */
    AND     A.EXPT_AUTH_YN LIKE v_Expt_Auth_Yn||'%'   /*엑셀저장권한여부      */
    AND     A.CHG_AUTH_YN  LIKE v_Chg_Auth_Yn ||'%';  /*조직수정권한여부      */
    
  END p_sRtcm0024;

  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0024(
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Read_Auth_Yn   IN RTCM0024.READ_AUTH_YN%TYPE,   /*읽기원한여부          */
    v_Save_Auth_Yn   IN RTCM0024.SAVE_AUTH_YN%TYPE,   /*저장권한여부          */
    v_Del_Auth_Yn    IN RTCM0024.DEL_AUTH_YN%TYPE,    /*삭제권한여부          */
    v_Prnt_Auth_Yn   IN RTCM0024.PRNT_AUTH_YN%TYPE,   /*인쇄권한여부          */
    v_Expt_Auth_Yn   IN RTCM0024.EXPT_AUTH_YN%TYPE,   /*엑셀저장권한여부      */
    v_Chg_Auth_Yn    IN RTCM0024.CHG_AUTH_YN%TYPE,    /*조직수정권한여부      */
    v_Etc1_Auth_Yn   IN RTCM0024.ETC1_AUTH_YN%TYPE,   /*기타 권한1            */
    v_Etc2_Auth_Yn   IN RTCM0024.ETC2_AUTH_YN%TYPE,   /*기타 권한2            */
    v_Etc3_Auth_Yn   IN RTCM0024.ETC3_AUTH_YN%TYPE,   /*기타 권한3            */
    v_Reg_Id         IN RTCM0024.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    INSERT  INTO RTCM0024 (
            PRGM_CD,
            AUTH_GRP_CD,
            READ_AUTH_YN,
            SAVE_AUTH_YN,
            DEL_AUTH_YN,
            PRNT_AUTH_YN,
            EXPT_AUTH_YN,
            CHG_AUTH_YN,
            ETC1_AUTH_YN,
            ETC2_AUTH_YN,
            ETC3_AUTH_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Prgm_Cd,
            v_Auth_Grp_Cd,
            v_Read_Auth_Yn,
            v_Save_Auth_Yn,
            v_Del_Auth_Yn,
            v_Prnt_Auth_Yn,
            v_Expt_Auth_Yn,
            v_Chg_Auth_Yn,
            v_Etc1_Auth_Yn,
            v_Etc2_Auth_Yn,
            v_Etc3_Auth_Yn,
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
        
  END f_InsertRTCM0024;


  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0024(
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Read_Auth_Yn   IN RTCM0024.READ_AUTH_YN%TYPE,   /*읽기원한여부          */
    v_Save_Auth_Yn   IN RTCM0024.SAVE_AUTH_YN%TYPE,   /*저장권한여부          */
    v_Del_Auth_Yn    IN RTCM0024.DEL_AUTH_YN%TYPE,    /*삭제권한여부          */
    v_Prnt_Auth_Yn   IN RTCM0024.PRNT_AUTH_YN%TYPE,   /*인쇄권한여부          */
    v_Expt_Auth_Yn   IN RTCM0024.EXPT_AUTH_YN%TYPE,   /*엑셀저장권한여부      */
    v_Chg_Auth_Yn    IN RTCM0024.CHG_AUTH_YN%TYPE,    /*조직수정권한여부      */
    v_Etc1_Auth_Yn   IN RTCM0024.ETC1_AUTH_YN%TYPE,   /*기타 권한1            */
    v_Etc2_Auth_Yn   IN RTCM0024.ETC2_AUTH_YN%TYPE,   /*기타 권한2            */
    v_Etc3_Auth_Yn   IN RTCM0024.ETC3_AUTH_YN%TYPE,   /*기타 권한3            */
    v_Reg_Id         IN RTCM0024.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN
  
    UPDATE RTCM0024
    SET    READ_AUTH_YN = V_Read_Auth_Yn,
           SAVE_AUTH_YN = V_Save_Auth_Yn,
           DEL_AUTH_YN  = V_Del_Auth_Yn,
           PRNT_AUTH_YN = V_Prnt_Auth_Yn,
           EXPT_AUTH_YN = V_Expt_Auth_Yn,
           CHG_AUTH_YN  = V_Chg_Auth_Yn,
           ETC1_AUTH_YN = V_Etc1_Auth_Yn,
           ETC2_AUTH_YN = V_Etc2_Auth_Yn,
           ETC3_AUTH_YN = V_Etc3_Auth_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  PRGM_CD      = V_Prgm_Cd
    AND    AUTH_GRP_CD  = V_Auth_Grp_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0024;
  
  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0024(
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0024.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    DELETE RTCM0024
    WHERE  PRGM_CD     = V_Prgm_Cd
    AND    AUTH_GRP_CD = V_Auth_Grp_Cd;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0024.f_DeleteRtcm0024(1)', '프로그램코드|권한그룹코드|등록자 ID', v_Prgm_Cd, v_Auth_Grp_Cd, v_Reg_Id);  

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0024;

  
  /*****************************************************************************
  -- 프로그램-권한그룹 연동 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0024(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Read_Auth_Yn   IN RTCM0024.READ_AUTH_YN%TYPE,   /*읽기원한여부          */
    v_Save_Auth_Yn   IN RTCM0024.SAVE_AUTH_YN%TYPE,   /*저장권한여부          */
    v_Del_Auth_Yn    IN RTCM0024.DEL_AUTH_YN%TYPE,    /*삭제권한여부          */
    v_Prnt_Auth_Yn   IN RTCM0024.PRNT_AUTH_YN%TYPE,   /*인쇄권한여부          */
    v_Expt_Auth_Yn   IN RTCM0024.EXPT_AUTH_YN%TYPE,   /*엑셀저장권한여부      */
    v_Chg_Auth_Yn    IN RTCM0024.CHG_AUTH_YN%TYPE,    /*조직수정권한여부      */
    v_Etc1_Auth_Yn   IN RTCM0024.ETC1_AUTH_YN%TYPE,   /*기타 권한1            */
    v_Etc2_Auth_Yn   IN RTCM0024.ETC2_AUTH_YN%TYPE,   /*기타 권한2            */
    v_Etc3_Auth_Yn   IN RTCM0024.ETC3_AUTH_YN%TYPE,   /*기타 권한3            */
    v_Reg_Id         IN RTCM0024.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값: 프로그램코드, 권한그룹코드
    IF TRIM(v_Prgm_Cd) IS NULL THEN
        v_Return_Message := '프로그램코드('||v_Prgm_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Auth_Grp_Cd) IS NULL THEN
        v_Return_Message := '권한그룹코드('||v_Auth_Grp_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (v_Read_Auth_Yn IS NULL) OR (TRIM(v_Read_Auth_Yn) NOT IN ('Y','N')) OR 
       (v_Save_Auth_Yn IS NULL) OR (TRIM(v_Save_Auth_Yn) NOT IN ('Y','N')) OR 
       (v_Del_Auth_Yn  IS NULL) OR (TRIM(v_Del_Auth_Yn ) NOT IN ('Y','N')) OR 
       (v_Prnt_Auth_Yn IS NULL) OR (TRIM(v_Prnt_Auth_Yn) NOT IN ('Y','N')) OR 
       (v_Expt_Auth_Yn IS NULL) OR (TRIM(v_Expt_Auth_Yn) NOT IN ('Y','N')) OR 
       (v_Chg_Auth_Yn  IS NULL) OR (TRIM(v_Chg_Auth_Yn ) NOT IN ('Y','N')) OR 
       (v_Etc1_Auth_Yn IS NULL) OR (TRIM(v_Etc1_Auth_Yn) NOT IN ('Y','N')) OR 
       (v_Etc2_Auth_Yn IS NULL) OR (TRIM(v_Etc2_Auth_Yn) NOT IN ('Y','N')) OR 
       (v_Etc3_Auth_Yn IS NULL) OR (TRIM(v_Etc3_Auth_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '권한여부 값이 NULL 이거나, Y 또는 N이 아니므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtcm0024Count(v_Prgm_Cd, v_Auth_Grp_Cd) THEN

        IF 0 != f_InsertRtcm0024(v_Prgm_Cd, v_Auth_Grp_Cd, v_Read_Auth_Yn, v_Save_Auth_Yn,
                                 v_Del_Auth_Yn, v_Prnt_Auth_Yn, v_Expt_Auth_Yn, v_Chg_Auth_Yn,
                                 v_Etc1_Auth_Yn, v_Etc2_Auth_Yn, v_Etc3_Auth_Yn, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := '프로그램-권한그룹 연동 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;       
                         
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0024(v_Prgm_Cd, v_Auth_Grp_Cd, v_Read_Auth_Yn, v_Save_Auth_Yn,
                                     v_Del_Auth_Yn, v_Prnt_Auth_Yn, v_Expt_Auth_Yn, v_Chg_Auth_Yn,
                                     v_Etc1_Auth_Yn, v_Etc2_Auth_Yn, v_Etc3_Auth_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '프로그램-권한그룹 연동 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0024(v_Prgm_Cd, v_Auth_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '프로그램-권한그룹 연동 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;
            
        ELSE
            v_Return_Message := ' 처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;  
                  
        END IF;
    END IF;
    
    -- 프로그램-권한그룹 연동 변경이력 생성
    IF 0 != Pkg_Rtcm0027.f_InsertRtcm0027(v_Prgm_Cd, v_Auth_Grp_Cd, v_Comm_Dvsn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '이력 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText:= v_ErrorText;
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0024.p_IUDRTCM0024(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0024.p_IUDRTCM0024(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0024;
  
  
  /*****************************************************************************
  --  프로그램-권한그룹 연동 -  특정 사용자의  메뉴- 프로그램 - 사용권한  트리 구성
  *****************************************************************************/
  PROCEDURE p_sRtcm0024UserProgramAuth (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*사용자 아이디       */    
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
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
    AND     C23.AUTH_GRP_CD = C21.AUTH_GRP_CD
    AND     C21.USE_YN = 'Y'
    AND     C23.AUTH_GRP_CD = C24.AUTH_GRP_CD
    GROUP   BY C23.USER_ID, C24.PRGM_CD; 
    
  END p_sRtcm0024UserProgramAuth;


  /*****************************************************************************
  --  프로그램-권한그룹 연동 관리 - 특정권한그룹에 속한 프로그램 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0024AuthGroupProgram (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  C24.AUTH_GRP_CD,  /*권한그룹코드          */
            C24.PRGM_CD,      /*프로그램코드          */
            C11.PRGM_NM,      /*프로그램명            */
            C11.PRGM_PATH,    /*프로그램경로          */
            C11.PRGM_DESC,    /*프로그램설명          */
            C11.MDL_CD,       /*모듈코드              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', C11.MDL_CD) MDL_NM, /*모듈명 */
            C24.READ_AUTH_YN, /*읽기권한 여부         */
            C24.SAVE_AUTH_YN, /*저장권한여부          */
            C24.DEL_AUTH_YN , /*삭제권한여부          */
            C24.PRNT_AUTH_YN, /*인쇄권한여부          */
            C24.EXPT_AUTH_YN, /*엑셀저장권한여부      */
            C24.CHG_AUTH_YN , /*조직수정권한여부      */
            C24.ETC1_AUTH_YN, /*기타 권한1            */
            C24.ETC2_AUTH_YN, /*기타 권한2            */
            C24.ETC3_AUTH_YN, /*기타 권한3            */
            C11.USE_YN        /*사용유무              */
    FROM    RTCM0024 C24,
            RTCM0011 C11
    WHERE   C24.AUTH_GRP_CD = v_Auth_Grp_Cd
    AND     C24.PRGM_CD = C11.PRGM_CD
    AND     C11.USE_YN = 'Y'
    ORDER   BY C11.MDL_CD, C24.PRGM_CD;
    
  END p_sRtcm0024AuthGroupProgram;
  

  /*****************************************************************************
  --  프로그램-권한그룹 연동 관리 - 특정권한그룹에 속하지 않은 프로그램 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0024AuthGroupProgramNot (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE         /*프로그램명            */
    ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR
    SELECT  v_Auth_Grp_Cd AUTH_GRP_CD,   /*권한그룹코드          */
            C11.PRGM_CD,      /*프로그램코드          */
            C11.PRGM_NM,      /*프로그램명            */
            C11.PRGM_PATH,    /*프로그램경로          */
            C11.PRGM_DESC,    /*프로그램설명          */
            C11.MDL_CD,       /*모듈코드              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', C11.MDL_CD) MDL_NM, /*모듈명 */
            'N' READ_AUTH_YN, /*읽기권한 여부         */
            'N' SAVE_AUTH_YN, /*저장권한여부          */
            'N' DEL_AUTH_YN , /*삭제권한여부          */
            'N' PRNT_AUTH_YN, /*인쇄권한여부          */
            'N' EXPT_AUTH_YN, /*엑셀저장권한여부      */
            'N' CHG_AUTH_YN , /*조직수정권한여부      */
            'N' ETC1_AUTH_YN, /*기타 권한1            */
            'N' ETC2_AUTH_YN, /*기타 권한2            */
            'N' ETC3_AUTH_YN, /*기타 권한3            */
            C11.USE_YN        /*사용유무              */
    FROM    RTCM0011 C11
    WHERE   C11.PRGM_CD LIKE v_Prgm_Cd||'%'
    AND     C11.PRGM_NM LIKE '%'||v_Prgm_Nm||'%'
    AND     C11.PRGM_CD NOT IN (SELECT  C24.PRGM_CD
                                FROM    RTCM0024 C24
                                WHERE   C24.AUTH_GRP_CD = v_Auth_Grp_Cd
                                )
    AND     C11.USE_YN = 'Y'
    ORDER   BY C11.MDL_CD, C11.PRGM_CD;
    
  END p_sRtcm0024AuthGroupProgramNot;
      
    
  
END Pkg_Rtcm0024;