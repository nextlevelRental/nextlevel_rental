CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0001 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0001
   PURPOSE   차종 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
   1.1        2017-11-06  wjim             [20171106_01] 정렬기준 변경
                                           - 차종
*******************************************************************************/

  /*****************************************************************************
  -- 차종 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0001Count(
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE       /*사양                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0001
    WHERE   MODEL_CD    = v_Model_Cd
    AND     CONTENTS_CD = v_Contents_Cd;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0001Count;

  /*****************************************************************************
  -- 차종 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0001 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAKER_CD,                  /*카메이커            */
            A.MODEL_CD,                  /*차종                */
            A.CONTENTS_CD,               /*사양                */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0001 A
    WHERE   (v_Maker_Cd     IS NULL OR A.MAKER_CD    = v_Maker_Cd)
    AND     (v_Model_Cd     IS NULL OR A.MODEL_CD    = v_Model_Cd)
    AND     (v_Contents_Cd  IS NULL OR A.CONTENTS_CD = v_Contents_Cd)
    AND     (v_Use_Yn       IS NULL OR A.USE_YN      = v_Use_Yn)
    AND     (v_Reg_Id       IS NULL OR A.REG_ID      = v_Reg_Id);

  END p_sRtsd0001;

  /*****************************************************************************
  -- 차종 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*카메이커              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0001 (
            MODEL_CD,
            CONTENTS_CD,
            MAKER_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Model_Cd,
            v_Contents_Cd,
            v_Maker_Cd,
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

  END f_InsertRtsd0001;

  /*****************************************************************************
  -- 차종 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*카메이커              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0001
    SET    MAKER_CD    = v_Maker_Cd,
           USE_YN      = v_Use_Yn,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  MODEL_CD    = v_Model_Cd
    AND    CONTENTS_CD = v_Contents_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0001;

  /*****************************************************************************
  -- 차종 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0001
    SET    USE_YN      = 'N',
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  MODEL_CD    = v_Model_Cd
    AND    CONTENTS_CD = v_Contents_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0001;

  /*****************************************************************************
  -- 차종 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0001 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*카메이커              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN


    -- 필수값: 차종, 사양,카메이커,  사용여부 ,등록자 ID
    IF TRIM(v_Model_Cd) IS NULL THEN
        v_Return_Message := '차종('||v_Model_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Contents_Cd) IS NULL THEN
        v_Return_Message := '사양('||v_Contents_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Maker_Cd) IS NULL THEN
        v_Return_Message := '카메이커('||v_Maker_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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


    IF 0 = f_sRtsd0001Count(v_Model_Cd, v_Contents_Cd) THEN

        IF 0 != f_InsertRtsd0001(v_Model_Cd, v_Contents_Cd, v_Maker_Cd, v_Use_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '차종 마스터 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn IN ('I', 'U') THEN

            IF 0 != f_UpdateRtsd0001(v_Model_Cd, v_Contents_Cd, v_Maker_Cd, v_Use_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '차종 마스터 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0001(v_Model_Cd, v_Contents_Cd, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '차종 마스터 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0001.p_IUDRtsd0001(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0001.p_IUDRtsd0001(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0001;


  /*****************************************************************************
  -- 차종 마스터 Select - 카메이커로 모델명 조회(차종과 사양)- 상품 마스터 조회 팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelName(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE        /*카메이커              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  ROWNUM RN,
            A.MAKER_CD,                  /*카메이커            */
            A.MODEL_CD,                  /*차종                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)  MODEL_NM,      /*차종명                */
            A.CONTENTS_CD,               /*사양                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD) CONTENTS_NM, /*사양명                */
            B.FR_CD,                     /*전후 구분           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)
                || ' ' ||
                Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD)
                || ' ' ||
                DECODE(B.FR_CD,'Z',NULL,'F','앞','R','뒤') MC_NM                /*모델명                */
    FROM    RTSD0001 A,
            RTSD0002 B
    WHERE   A.MODEL_CD    = B.MODEL_CD
    AND     A.CONTENTS_CD = B.CONTENTS_CD
    AND     A.MAKER_CD    = v_Maker_Cd
    AND     A.USE_YN      = 'Y'
    AND     B.USE_YN      = 'Y'
    ORDER   BY MODEL_NM, CONTENTS_NM, MC_NM DESC;

  END p_sRtsd0001ModelName;

  /*****************************************************************************
  -- 차종 마스터 Select - 차종 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*카메이커              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE         /*차종                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.MODEL_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD) AS MODEL_NM
    FROM    RTSD0001 A
    WHERE   (v_Maker_Cd IS NULL OR A.MAKER_CD = v_Maker_Cd)
    AND     (v_Model_Cd IS NULL OR A.MODEL_CD = v_Model_Cd)
    ORDER   BY MODEL_NM ASC;

  END p_sRtsd0001ModelSelect;


    /*****************************************************************************
  -- 차종 마스터 Select - 차종 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ContentsSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*카메이커              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE         /*차종                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.CONTENTS_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD) AS CONTENTS_NM
    FROM    RTSD0001 A
    WHERE   (v_Maker_Cd IS NULL OR A.MAKER_CD = v_Maker_Cd)
    AND     (v_Model_Cd IS NULL OR A.MODEL_CD = v_Model_Cd)
    ORDER   BY CONTENTS_NM ASC;

  END p_sRtsd0001ContentsSelect;
  
  /*****************************************************************************
  -- 차종 마스터 Select - 차종 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-11-06  wjim             [20171106_01] 정렬기준 변경
                                           - 영어 > 한글 > 숫자 순 오름차순 정렬
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelByClassSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*카메이커              */
    v_Class_Cd       IN RTSD0004.CLASS_CD%TYPE         /*차량분류              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  *
      FROM  (
                SELECT  DISTINCT A.MODEL_CD,
                                Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD) MODEL_NM,
                                
                                A.CLASS_CD,
                                B.MAKER_CD,
                                Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',B.MAKER_CD) MAKER_NM
                        FROM    RTSD0004 A,
                                RTSD0001 B
                        WHERE   B.MAKER_CD      = v_Maker_cd      /*차종(S001)          */
                        AND     A.CLASS_CD      = v_Class_Cd
                        AND     A.USE_YN        = 'Y'
                        AND     A.MODEL_CD      = B.MODEL_CD      /*차종(S001)          */
                        AND     A.CONTENTS_CD   = B.CONTENTS_CD   /*사양(S002,S003)     */
                        AND     B.USE_YN        = 'Y'
            )
     ORDER  BY CASE
                WHEN SUBSTR(MODEL_NM, 1, 1) BETWEEN '0' AND '9' THEN 3 
                WHEN MODEL_NM BETWEEN '가' AND '힣' THEN 2            
                ELSE 1
            END 
         ,  UPPER(MODEL_NM) -- [20171106_01]
    ;

  END p_sRtsd0001ModelByClassSelect;

  /*****************************************************************************
  -- 차종 마스터 Select - 차종정보관리  조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0001CarMasterSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*카메이커              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,        /*차종                   */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,     /*차종                   */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE           /*사용여부              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAKER_CD,                                                             /*카메이커            */
            A.MODEL_CD,                                                             /*차종                */
            A.CONTENTS_CD,                                                          /*사양                */
            B.FR_CD,                                                                /*전후구분            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',A.MAKER_CD)     AS MAKER_NM,    /*카메이커            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)     AS MODEL_NM,    /*차종                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD)  AS CONTENTS_NM, /*사양                */
            DECODE(B.FR_CD,'Z',NULL,'F','앞','R','뒤')              AS FR_NM,       /*전후구분            */
            B.MC_NM,                                                                /*차종-사양명         */
            B.USE_YN                                                                /*사용여부            */
    FROM    RTSD0001 A,
            RTSD0002 B
    WHERE   A.MODEL_CD     = B.MODEL_CD
    AND     A.CONTENTS_CD  = B.CONTENTS_CD
    AND     (v_Maker_Cd    IS NULL OR A.MAKER_CD    =  v_Maker_Cd)
    AND     (v_Model_Cd    IS NULL OR A.MODEL_CD    =  v_Model_Cd)
    AND     (v_Contents_Cd IS NULL OR A.CONTENTS_CD =  v_Contents_Cd)
    AND     (v_Use_Yn      IS NULL OR B.USE_YN      =  v_Use_Yn)
    ORDER   BY MAKER_CD, MODEL_CD, CONTENTS_CD, FR_CD;

  END p_sRtsd0001CarMasterSelect;


  /*****************************************************************************
  -- 차종 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0001UseYn (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0001
    SET    USE_YN      = v_Use_Yn,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  MODEL_CD    = v_Model_Cd
    AND    CONTENTS_CD = v_Contents_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0001UseYn;

END Pkg_Rtsd0001;