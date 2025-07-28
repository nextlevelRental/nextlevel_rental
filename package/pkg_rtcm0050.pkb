CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0050 AS
/*******************************************************************************
   NAME:      Pkg_RTCM0050
   PURPOSE:   공통코드 Head 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 공통코드 Head Count
  *****************************************************************************/
  FUNCTION f_sRtcm0050Count(
    v_Cd_Grp_Cd    IN     RTCM0050.CD_GRP_CD%TYPE           /*코드그룹코드    */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0050
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0050Count;

  /*****************************************************************************
  -- 공통코드 Head Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0050 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*코드그룹코드        */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE      /*코드그룹명          */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.CD_GRP_CD,      /*코드그룹코드          */
            A.CD_GRP_NM,      /*코드그룹명            */
            A.CD_GRP_DESC,    /*코드그룹설명          */
            A.MDL_CD,         /*모듈구분              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C003', A.MDL_CD) MDL_NM,    /*모듈명         */
            A.USE_YN,         /*사용여부              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*사용여부명     */
            A.REG_ID,         /*등록자 ID             */
            A.REG_DT,         /*등록일                */
            A.CHG_ID,         /*변경자 ID             */
            A.CHG_DT          /*변경일                */
    FROM    RTCM0050    A
    WHERE   A.CD_GRP_CD LIKE v_Cd_Grp_Cd||'%'
    AND     A.CD_GRP_NM LIKE '%'||v_Cd_Grp_Nm||'%'
    ORDER   BY A.CD_GRP_CD;
    
  END p_sRtcm0050;

  /*****************************************************************************
  -- 공통코드 Head Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0050(
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,     /*코드그룹코드           */
    v_Cd_Grp_Nm     IN  RTCM0050.CD_GRP_NM%TYPE,     /*코드그룹명             */
    v_Cd_Grp_Desc   IN  RTCM0050.CD_GRP_DESC%TYPE,   /*코드그룹설명           */
    v_Mdl_Cd        IN  RTCM0050.MDL_CD%TYPE,        /*모듈구분               */
    v_Use_Yn        IN  RTCM0050.USE_YN%TYPE,        /*사용여부               */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,        /*등록자 ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN


    INSERT INTO RTCM0050 (
            CD_GRP_CD, CD_GRP_NM, CD_GRP_DESC, USE_YN, 
            MDL_CD, REG_ID, REG_DT,CHG_ID,CHG_DT
            )
    VALUES  (
            v_Cd_Grp_Cd, v_Cd_Grp_Nm, v_Cd_Grp_Desc, v_Use_Yn, 
            v_Mdl_Cd, v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRTCM0050;


  /*****************************************************************************
  -- 공통코드 Head Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0050(
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,      /*코드그룹코드       */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE,      /*코드그룹명         */
    v_Cd_Grp_Desc   IN     RTCM0050.CD_GRP_DESC%TYPE,    /*코드그룹설명       */
    v_Mdl_Cd        IN     RTCM0050.MDL_CD%TYPE,         /*모듈구분           */
    v_Use_Yn        IN     RTCM0050.USE_YN%TYPE,         /*사용여부           */
    v_Reg_Id        IN     RTCM0050.REG_ID%TYPE,         /*등록자 ID          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0050 SET
           CD_GRP_NM    = v_Cd_Grp_Nm,
           CD_GRP_DESC  = v_Cd_Grp_Desc,
           MDL_CD       = v_Mdl_Cd,
           CHG_DT       = SYSDATE,
           CHG_ID       = v_Reg_Id
    WHERE  CD_GRP_CD    = v_Cd_Grp_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0050;
  
  /*****************************************************************************
  -- 공통코드 Head Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0050(
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,        /*사용자 아이디       */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0050 SET
           USE_YN = 'N',
           CHG_DT = SYSDATE,
           CHG_ID = v_Reg_Id
    WHERE  CD_GRP_CD = v_Cd_Grp_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0050;
  
  /*****************************************************************************
  -- 공통코드 Head 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0050(
    v_Comm_Dvsn     IN  CHAR,                       /*처리구분(I,U,D)         */
    v_Cd_Grp_Cd     IN  RTCM0050.CD_GRP_CD%TYPE,    /*코드그룹코드            */
    v_Cd_Grp_Nm     IN  RTCM0050.CD_GRP_NM%TYPE,    /*코드그룹명              */
    v_Cd_Grp_Desc   IN  RTCM0050.CD_GRP_DESC%TYPE,  /*코드그룹설명            */
    v_Mdl_Cd        IN  RTCM0050.MDL_CD%TYPE,       /*모듈구분                */
    v_Use_Yn        IN  RTCM0050.USE_YN%TYPE,       /*사용여부                */
    v_Reg_Id        IN  RTCM0050.REG_ID%TYPE,       /*등록자 ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값: 코드그룹코드, 코드그룹명, 사용여부 ,등록자 ID
    IF TRIM(v_Cd_Grp_Cd) IS NULL THEN
        v_Return_Message := '코드그룹코드('||v_Cd_Grp_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cd_Grp_Nm) IS NULL THEN
        v_Return_Message := '코드그룹명('||v_Cd_Grp_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtcm0050Count(v_Cd_Grp_Cd) THEN

        IF 0 != f_InsertRtcm0050(v_Cd_Grp_Cd, v_Cd_Grp_Nm, v_Cd_Grp_Desc, v_Mdl_Cd,
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '공통코드 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;              
                  
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0050(v_Cd_Grp_Cd, v_Cd_Grp_Nm, v_Cd_Grp_Desc, v_Mdl_Cd, 
                                     v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '공통코드 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0050(v_Cd_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '공통코드 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0050.p_IUDRTCM0050(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0050.p_IUDRTCM0050(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0050;
  
  /*****************************************************************************
  -- 공통코드 Head Select - 공통코드 그룹 조회(2열 리스트 구성용)
  *****************************************************************************/
  PROCEDURE p_sRtcm0050ComboList (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd     IN     RTCM0050.CD_GRP_CD%TYPE,     /*코드그룹코드        */
    v_Cd_Grp_Nm     IN     RTCM0050.CD_GRP_NM%TYPE      /*코드그룹명          */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.CD_GRP_CD,      /*코드그룹코드          */
            A.CD_GRP_NM       /*코드그룹명            */
    FROM    RTCM0050    A
    WHERE   A.CD_GRP_CD LIKE v_Cd_Grp_Cd||'%'
    AND     A.CD_GRP_NM LIKE '%'||v_Cd_Grp_Nm||'%';
    
  END p_sRtcm0050ComboList;
  
END Pkg_Rtcm0050;