CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_TEST01 AS

  /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0051Count(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0051
    WHERE   CD_GRP_CD   = v_Cd_Grp_Cd
    AND     CD          = v_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0051Count;
  
  /*****************************************************************************
  -- 공통코드 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*코드                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*코드명              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*코드설명            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*우선순위            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*사용여부            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*적요                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0051 (
            CD_GRP_CD, CD, CD_NM, CD_DESC, ORDER_PT,
            USE_YN, REMARK, REG_ID, REG_DT,
            CHG_ID, CHG_DT
            )
    VALUES  (
            v_Cd_Grp_Cd, v_Cd, NVL(v_Cd_Nm, ' '), v_Cd_Desc, v_Order_Pt,
            v_Use_Yn, v_Remark, v_Reg_Id, SYSDATE,
            v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0051;

  /*****************************************************************************
  -- 공통코드 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*코드                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*코드명              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*코드설명            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*우선순위            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*사용여부            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*적요                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0051
    SET     CD_NM     = NVL(v_Cd_Nm,' '),
            CD_DESC   = v_Cd_Desc,
            ORDER_PT  = v_Order_Pt,
            USE_YN    = v_Use_Yn,
            REMARK    = v_Remark,
            CHG_DT    = SYSDATE,
            CHG_ID    = v_Reg_Id
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0051;


  /*****************************************************************************
  -- 공통코드 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*코드                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0051
    SET     USE_YN  = 'N',
            CHG_DT  = SYSDATE,
            CHG_ID  = v_Reg_Id
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0051;


  /*****************************************************************************
  -- 공통코드 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0051(
    v_Comm_Dvsn  IN  CHAR,                          /*처리구분(I,U,D)         */
    v_Cd_Grp_Cd  IN  RTCM0051.CD_GRP_CD%TYPE,       /*코드그룹코드            */
    v_Cd         IN  RTCM0051.CD%TYPE,              /*코드                    */
    v_Cd_Nm      IN  RTCM0051.CD_NM%TYPE,           /*코드명                  */
    v_Cd_Desc    IN  RTCM0051.CD_DESC%TYPE,         /*코드설명                */
    v_Order_Pt   IN  RTCM0051.ORDER_PT%TYPE,        /*우선순위                */
    v_Use_Yn     IN  RTCM0051.USE_YN%TYPE,          /*사용여부                */
    v_Remark     IN  RTCM0051.REMARK%TYPE,          /*적요                    */
    v_Reg_Id     IN  RTCM0051.REG_ID%TYPE,          /*등록자 ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

  BEGIN

    -- 필수값: 코드그룹코드, 코드, 사용여부 ,등록자 ID
    IF TRIM(v_Cd_Grp_Cd) IS NULL THEN
        v_Return_Message := '코드그룹코드('||v_Cd_Grp_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cd) IS NULL THEN
        v_Return_Message := '코드('||v_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF 0 = f_sRtcm0051Count(v_Cd_Grp_Cd, v_Cd) THEN

        IF 0 != f_InsertRtcm0051(v_Cd_Grp_Cd, v_Cd,v_Cd_Nm, v_Cd_Desc, v_Order_Pt, v_Use_Yn,
                                 v_Remark, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '공통코드 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0051(v_Cd_Grp_Cd, v_Cd,v_Cd_Nm, v_Cd_Desc, v_Order_Pt, v_Use_Yn,
                                     v_Remark, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '공통코드 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0051(v_Cd_Grp_Cd, v_Cd, v_Reg_Id, v_ErrorText) THEN
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0051.p_IUDRTCM0051(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0051.p_IUDRTCM0051(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0051;
 
END PKG_TEST01;