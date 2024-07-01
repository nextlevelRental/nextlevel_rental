CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0004 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0004
   PURPOSE   차종_장착가능 규격 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-29  jemcarry         1. Created this package body.
   1.1        2017-11-06  wjim             [20171106_01] 정렬기준 변경
                                           - 사양, 규격 
*******************************************************************************/

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0004Count(
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,      /*사양                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,            /*전후 구분           */
    v_Section_Width  IN RTSD0004.SECTION_WIDTH%TYPE,    /*단면폭              */
    v_Aspect_Ratio   IN RTSD0004.ASPECT_RATIO%TYPE,     /*편평비              */
    v_Wheel_Inches   IN RTSD0004.WHEEL_INCHES%TYPE,     /*인치                */
    v_Ply_Rating     IN RTSD0004.PLY_RATING%TYPE        /*PR(강도)            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0004
    WHERE   MODEL_CD       = v_Model_Cd
    AND     CONTENTS_CD    = v_Contents_Cd
    AND     FR_CD          = v_Fr_Cd
    AND     SECTION_WIDTH  = v_Section_Width
    AND     ASPECT_RATIO   = v_Aspect_Ratio
    AND     WHEEL_INCHES   = v_Wheel_Inches
    AND     PLY_RATING     = v_Ply_Rating;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0004Count;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-11-06  wjim             [20171106_01] 정렬기준 변경
                                           - 인치 > 폭 > 높이 > PR 순 오름차순 정렬
  *****************************************************************************/
  PROCEDURE p_sRtsd0004 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MODEL_CD,                  /*차종                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)         AS MODEL_CD_NM,
            A.CONTENTS_CD,               /*사양                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD)      AS CONTENTS_CD_NM,
            A.FR_CD,                     /*전후 구분           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S004',A.FR_CD)            AS FR_CD_NM,
            A.SECTION_WIDTH,             /*단면폭              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S006',A.SECTION_WIDTH)    AS SECTION_WIDTH_NM,
            A.ASPECT_RATIO,              /*편평비              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S007',A.ASPECT_RATIO)     AS ASPECT_RATIO_NM,
            A.WHEEL_INCHES,              /*인치                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S008',A.WHEEL_INCHES)     AS WHEEL_INCHES_NM,
            A.PLY_RATING,                /*PR(강도)            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S009',A.PLY_RATING)       AS PLY_RATING_NM,
            A.WHEEL_QTY,                 /*바퀴수              */
            A.WHEEL_LIMIT_QTY,           /*장착가능 바퀴수     */
            A.CLASS_CD,                  /*차량분류            */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id)
    ORDER   BY TO_NUMBER(A.WHEEL_INCHES), TO_NUMBER(SECTION_WIDTH), TO_NUMBER(DECODE(ASPECT_RATIO,'Z',0,ASPECT_RATIO)), TO_NUMBER(PLY_RATING) --[20171106_01]
    ;

  END p_sRtsd0004;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0004 (
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0004 (
            MODEL_CD,
            CONTENTS_CD,
            FR_CD,
            SECTION_WIDTH,
            ASPECT_RATIO,
            WHEEL_INCHES,
            PLY_RATING,
            WHEEL_QTY,
            WHEEL_LIMIT_QTY,
            CLASS_CD,
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
            v_Section_Width,
            v_Aspect_Ratio,
            v_Wheel_Inches,
            v_Ply_Rating,
            v_Wheel_Qty,
            v_Wheel_Limit_Qty,
            v_Class_Cd,
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

  END f_InsertRtsd0004;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0004 (
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0004
    SET    WHEEL_QTY        = v_Wheel_Qty,
           WHEEL_LIMIT_QTY  = v_Wheel_Limit_Qty,
           CLASS_CD         = v_Class_Cd,
           USE_YN           = v_Use_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  MODEL_CD         = v_Model_Cd
    AND    CONTENTS_CD      = v_Contents_Cd
    AND    FR_CD            = v_Fr_Cd
    AND    SECTION_WIDTH    = v_Section_Width
    AND    ASPECT_RATIO     = v_Aspect_Ratio
    AND    WHEEL_INCHES     = v_Wheel_Inches
    AND    PLY_RATING       = v_Ply_Rating;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0004;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0004 (
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,          /*전후 구분             */
    v_Section_Width  IN RTSD0004.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0004.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0004.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0004.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Reg_Id         IN RTSD0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0004
    SET    USE_YN        = 'N',
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE
    WHERE  MODEL_CD      = v_Model_Cd
    AND    CONTENTS_CD   = v_Contents_Cd
    AND    FR_CD         = v_Fr_Cd
    AND    SECTION_WIDTH = v_Section_Width
    AND    ASPECT_RATIO  = v_Aspect_Ratio
    AND    WHEEL_INCHES  = v_Wheel_Inches
    AND    PLY_RATING    = v_Ply_Rating;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0004;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0004 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 차종 ,사양 ,전후 구분 ,단면폭 ,편평비 ,인치 ,PR(강도), 사용여부 ,등록자 ID
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

    IF TRIM(v_Section_Width) IS NULL THEN
        v_Return_Message := '단면폭('||v_Section_Width||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Aspect_Ratio) IS NULL THEN
        v_Return_Message := '편평비('||v_Aspect_Ratio||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Wheel_Inches) IS NULL THEN
        v_Return_Message := '인치('||v_Wheel_Inches||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ply_Rating) IS NULL THEN
        v_Return_Message := 'PR(강도)('||v_Ply_Rating||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF 0 = f_sRtsd0004Count(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Section_Width,
                            v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating) THEN

        IF 0 != f_InsertRtsd0004(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Section_Width,
                                 v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, v_Wheel_Qty,
                                 v_Wheel_Limit_Qty, v_Class_Cd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '차종_장착가능 규격 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0004(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Section_Width,
                                     v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, v_Wheel_Qty,
                                     v_Wheel_Limit_Qty, v_Class_Cd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '차종_장착가능 규격 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0004(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Section_Width,
                                     v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '차종_장착가능 규격 삭제 실패!!!'||'-'||v_ErrorText;
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
    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0004.p_IUDRtsd0004(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0004.p_IUDRtsd0004(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0004;


  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Count - 차종,사양,전후구분 기준 사용중인 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0004UseYnCount(
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,      /*사양                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE             /*전후 구분           */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0004
    WHERE   MODEL_CD    = v_Model_Cd
    AND     CONTENTS_CD = v_Contents_Cd
    AND     FR_CD       LIKE v_Fr_Cd||'%'
    AND     USE_YN      = 'Y';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0004UseYnCount;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[사양]
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-11-06  wjim             [20171106_01] 정렬기준 변경
                                           - 숫자 > 영어 > 한글 순 오름차순 정렬
  *****************************************************************************/
  PROCEDURE p_sRtsd0004ContentsCd (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  *
      FROM  (
                SELECT  DISTINCT
                        A.CONTENTS_CD,                              /*사양                */
                        Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD)  AS CONTENTS_CD_NM
                FROM    RTSD0004 A
                WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
                AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
                AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
                AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
                AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
                AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
                AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
                AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
                AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
                AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
                AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
                AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id)
            )
     ORDER  BY UPPER(CONTENTS_CD_NM) --[20171106_01]           
    ;

  END p_sRtsd0004ContentsCd;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[전후구분]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004FrCd (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.FR_CD,                                    /*전후 구분           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S004',A.FR_CD) AS FR_CD_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004FrCd;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[PR강도]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004PlyRatingCd (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.PLY_RATING,                               /*PR(강도)            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S009',A.PLY_RATING) AS PLY_RATING_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004PlyRatingCd;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[단면폭]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004SectionWidth (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.SECTION_WIDTH,                            /*단면폭              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S006',A.SECTION_WIDTH) AS SECTION_WIDTH_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004SectionWidth;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[편평비]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004AspectRatio (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.ASPECT_RATIO,                              /*편평비              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S007',A.ASPECT_RATIO) AS ASPECT_RATIO_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004AspectRatio;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[인치]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004WheelInches (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.WHEEL_INCHES,                             /*인치                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S008',A.WHEEL_INCHES) AS WHEEL_INCHES_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004WheelInches;
  
  /*****************************************************************************
  -- 차종_후륜장착가능 수량 (LTR 이외의 차량의 경우 후륜은 2본으로 고정)
  -- 추후 마스터 기준으로 장착본수를 정할 경우 WHEEL_QTY를 조정하게 변경하면 된다.
  *****************************************************************************/
  FUNCTION f_sRtsd0004WheelQty (
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,       /*차종                  */
    v_Class_Cd       IN RTSD0004.CLASS_CD%TYPE,       /*사양                  */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,          /*전후 구분             */
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE          /*단면폭                */
    ) RETURN VARCHAR2 IS
    
    v_Wheel_Qty VARCHAR2(4);
  BEGIN
    
     IF v_Class_Cd = 'L1' AND v_Fr_Cd = 'R' THEN
         SELECT TRIM(TO_CHAR(WHEEL_QTY, '00'))  
         INTO v_Wheel_Qty
         FROM RTSD0004 A, 
              RTSD0005 B, 
              RTCM0051 C 
         WHERE A.SECTION_WIDTH = B.SECTION_WIDTH 
         AND A.ASPECT_RATIO = B.ASPECT_RATIO 
         AND A.WHEEL_INCHES = B.WHEEL_INCHES
         AND A.PLY_RATING = B.PLY_RATING
         AND B.MAT_CD = v_Mat_Cd
         AND MODEL_CD = v_Model_Cd
         AND A.CLASS_CD = v_Class_Cd
         AND A.FR_CD = v_Fr_Cd
         AND A.MODEL_CD = C.CD
         AND C.CD_GRP_CD = 'S002'; 
     ELSE
        v_Wheel_Qty := '02';
     END IF;
     
     RETURN v_Wheel_Qty;

  END f_sRtsd0004WheelQty;

END Pkg_Rtsd0004;
/
