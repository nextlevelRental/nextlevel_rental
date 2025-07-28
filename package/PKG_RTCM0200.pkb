CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0200 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0200
   PURPOSE:   문자포맷 Detail 관리

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0200Count(
    v_Mid_Grp_Cd IN  RTCM0200.MID_GRP_CD%TYPE             /*코드그룹코드        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0200
    WHERE   MID_GRP_CD   = v_Mid_Grp_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0200Count;
  
  /*****************************************************************************
  -- 공통코드 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE         /*코드그룹코드            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.LRG_GRP_CD,
            A.MID_GRP_CD,    /*코드그룹코드*/
            A.MID_GRP_NM,
            A.USE_YN,       /*사용여부    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*사용여부명     */
            A.REG_ID,       /*등록자 ID   */
            A.REG_DT,       /*등록일      */
            A.CHG_ID,       /*변경자 ID   */
            A.CHG_DT        /*변경일      */
    FROM    RTCM0200 A
    WHERE   A.MID_GRP_CD = DECODE(v_Mid_Grp_Cd, NULL, A.MID_GRP_CD, v_Mid_Grp_Cd)
    ORDER   BY A.MID_GRP_CD;

  END p_sRtcm0200;

  /*****************************************************************************
  -- 문자포맷 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0200(
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*코드그룹코드        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0200 (
            LRG_GRP_CD, MID_GRP_CD, MID_GRP_NM, MID_GRP_DESC, USE_YN,
            REG_ID, REG_DT, CHG_ID, CHG_DT
            )
    VALUES  (
            v_Lrg_Grp_Cd, v_Mid_Grp_Cd, v_Mid_Grp_Nm, v_Mid_Grp_Desc,
            v_Use_Yn, v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0200;

  /*****************************************************************************
  -- 문자포맷 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0200(
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*코드그룹코드        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0200
    SET     MID_GRP_CD      = v_Mid_Grp_Cd,
            MID_GRP_NM      = v_Mid_Grp_Nm,
            MID_GRP_DESC    = v_Mid_Grp_Desc,
            USE_YN          = v_Use_Yn,
            CHG_DT          = SYSDATE,
            CHG_ID          = v_Reg_Id
    WHERE   MID_GRP_CD      = v_Mid_Grp_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0200;


  /*****************************************************************************
  -- 문자포맷 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0200(
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*코드그룹코드        */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0200
    SET     USE_YN     = 'N',
            CHG_DT     = SYSDATE,
            CHG_ID     = v_Reg_Id
    WHERE   MID_GRP_CD = v_Mid_Grp_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0200;


  /*****************************************************************************
  -- 문자포맷 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0200(
    v_Comm_Dvsn      IN  CHAR,                           /* 처리구분(I,U,D)        */
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*코드그룹코드        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*코드그룹코드        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*사용여부            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS

    e_Error EXCEPTION;

  BEGIN

    -- 필수값: 코드그룹코드, 코드, 사용여부 ,등록자 ID
    IF TRIM(v_Mid_Grp_Cd) IS NULL THEN
        v_Return_Message := '코드그룹코드('||v_Mid_Grp_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF 0 = f_sRTCM0200Count(v_Mid_Grp_Cd) THEN

        IF 0 != f_InsertRtcm0200(v_Lrg_Grp_Cd, v_Mid_Grp_Cd, v_Mid_Grp_Nm, v_Mid_Grp_Desc,  
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '문자포맷 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0200(v_Lrg_Grp_Cd, v_Mid_Grp_Cd, v_Mid_Grp_Nm, v_Mid_Grp_Desc,  
                                     v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '문자포맷 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0200(v_Mid_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '문자포맷 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0200.p_IUDRTCM0200(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0200.p_IUDRTCM0200(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0200;
  
END Pkg_Rtcm0200;