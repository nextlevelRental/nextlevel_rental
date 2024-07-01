CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0002 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0002
   PURPOSE   차종_사양 명칭 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0002Count(
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,      /*사양                */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE             /*전후 구분           */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0002
    WHERE   MODEL_CD    = v_Model_Cd
    AND     CONTENTS_CD = v_Contents_Cd
    AND     FR_CD       = v_Fr_Cd;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0002Count;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*차종-사양명           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MODEL_CD,                  /*차종                */
            A.CONTENTS_CD,               /*사양                */
            A.FR_CD,                     /*전후 구분           */
            A.MC_NM,                     /*차종-사양명         */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0002 A
    WHERE   A.MODEL_CD    = DECODE(v_Model_Cd    , NULL, A.MODEL_CD    , v_Model_Cd)
    AND     A.CONTENTS_CD = DECODE(v_Contents_Cd , NULL, A.CONTENTS_CD , v_Contents_Cd)
    AND     A.FR_CD       = DECODE(v_Fr_Cd       , NULL, A.FR_CD       , v_Fr_Cd)
    AND     A.MC_NM       = DECODE(v_Mc_Nm       , NULL, A.MC_NM       , v_Mc_Nm)
    AND     A.USE_YN      = DECODE(v_Use_Yn      , NULL, A.USE_YN      , v_Use_Yn)
    AND     A.REG_ID      = DECODE(v_Reg_Id      , NULL, A.REG_ID      , v_Reg_Id);

  END p_sRtsd0002;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*차종-사양명           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0002 (
            MODEL_CD,
            CONTENTS_CD,
            FR_CD,
            MC_NM,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Model_Cd,
            v_Contents_Cd,
            v_Fr_Cd,
            TRIM(v_Mc_Nm),
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

  END f_InsertRtsd0002;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*차종-사양명           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0002
    SET    MC_NM       = v_Mc_Nm,
           USE_YN      = v_Use_Yn,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  MODEL_CD    = v_Model_Cd
    AND    CONTENTS_CD = v_Contents_Cd
    AND    FR_CD       = v_Fr_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0002;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0002
    SET    USE_YN       = 'N',
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  MODEL_CD     = v_Model_Cd
    AND    CONTENTS_CD  = v_Contents_Cd
    AND    FR_CD        = v_Fr_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0002;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0002 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*차종-사양명           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 차종, 사양, 전후 구분, 차종-사양명, 사용여부 ,등록자 ID
    IF TRIM(v_Model_Cd) IS NULL THEN
        v_Return_Message := '차종('||v_Model_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Contents_Cd) IS NULL THEN
        v_Return_Message := '사양('||v_Contents_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Fr_Cd) IS NULL THEN
        v_Return_Message := '전후 구분('||v_Fr_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mc_Nm) IS NULL THEN
        v_Return_Message := '차종-사양명('||v_Mc_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF 0 = f_sRtsd0002Count(v_Model_Cd, v_Contents_Cd, v_Fr_Cd) THEN

        IF 0 != f_InsertRtsd0002(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Mc_Nm,
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '차종_사양 명칭 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE

        IF v_Comm_Dvsn IN ('I', 'U') THEN

            IF 0 != f_UpdateRtsd0002(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Mc_Nm,
                                     v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '차종_사양 명칭 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        

            -- 차종마스터 기준 사용중인 규격관리정보가 있으면 처리불가 처리함
            IF 0 != Pkg_Rtsd0004.f_sRtsd0004UseYnCount(v_Model_Cd, v_Contents_Cd, v_Fr_Cd) THEN
                v_Return_Message := '해당 차종 마스터 정보로 등록된 규격관리정보가 있으므로 처리 불가. 규격관리정보를 미사용 처리후 진행하시길 바랍니다.';
                RAISE e_Error;
            END IF;
            
            IF 0 != f_DeleteRtsd0002(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '차종_사양 명칭 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0002.p_IUDRtsd0002(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0002.p_IUDRtsd0002(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0002;


  /*****************************************************************************
  -- 차종_사양 명칭 관리 - 차종마스터 유효성 처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0002MasterCheck (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 차종, 사양, 전후 구분, 차종-사양명, 사용여부 ,등록자 ID
    IF TRIM(v_Model_Cd) IS NULL THEN
        v_Return_Message := '차종('||v_Model_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Contents_Cd) IS NULL THEN
        v_Return_Message := '사양('||v_Contents_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 차종마스터가 모두 미사용처리 된 경우
    IF 0 = f_sRtsd0002UseYnCount(v_Model_Cd, v_Contents_Cd) THEN


        -- 차종마스터 기준 사용중인 규격관리정보가 있으면 처리불가 처리함
        IF 0 != Pkg_Rtsd0004.f_sRtsd0004UseYnCount(v_Model_Cd, v_Contents_Cd, NULL) THEN
            v_Return_Message := '해당 차종 마스터 정보로 등록된 규격관리정보가 있으므로 처리 불가. 규격관리정보를 미사용 처리후 진행하시길 바랍니다.';
            RAISE e_Error;
        END IF;

        -- 차종마스터가 모두 미사용처리 된 경우 차종마스터도 미사용처리
        IF 0 != Pkg_Rtsd0001.f_UpdateRtsd0001UseYn(v_Model_Cd, v_Contents_Cd, 'N', v_Reg_Id, v_ErrorText) THEN
             v_Return_Message := '차종마스터가 모두 미사용처리 된 경우 차종마스터도 미사용처리 - 실패!!!'||'-'||v_ErrorText;
             v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0002.p_UpdateRtsd0002MasterCheck(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0002.p_UpdateRtsd0002MasterCheck(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtsd0002MasterCheck;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0002UseYnCount(
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE       /*사양                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0002
    WHERE   MODEL_CD    = v_Model_Cd
    AND     CONTENTS_CD = v_Contents_Cd
    AND     USE_YN      ='Y';
    
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0002UseYnCount;

END Pkg_Rtsd0002;
/
