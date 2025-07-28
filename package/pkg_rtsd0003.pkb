CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0003 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0003
   PURPOSE   타이어 규격 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 타이어 규격 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0003Count(
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,    /*단면폭              */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,     /*편평비              */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,     /*인치                */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE        /*PR(강도)            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0003
    WHERE   SECTION_WIDTH  = v_Section_Width
    AND     ASPECT_RATIO   = v_Aspect_Ratio
    AND     WHEEL_INCHES   = v_Wheel_Inches
    AND     PLY_RATING     = v_Ply_Rating;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0003Count;

  /*****************************************************************************
  -- 타이어 규격 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0003 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*규격                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*규격2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SECTION_WIDTH,             /*단면폭              */
            A.ASPECT_RATIO,              /*편평비              */
            A.WHEEL_INCHES,              /*인치                */
            A.PLY_RATING,                /*PR(강도)            */
            A.SIZE_CD,                   /*규격                */
            A.SIZE_CD2,                  /*규격2               */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0003 A
    WHERE   A.SECTION_WIDTH = DECODE(v_Section_Width , NULL, A.SECTION_WIDTH , v_Section_Width)
    AND     A.ASPECT_RATIO  = DECODE(v_Aspect_Ratio  , NULL, A.ASPECT_RATIO  , v_Aspect_Ratio)
    AND     A.WHEEL_INCHES  = DECODE(v_Wheel_Inches  , NULL, A.WHEEL_INCHES  , v_Wheel_Inches)
    AND     A.PLY_RATING    = DECODE(v_Ply_Rating    , NULL, A.PLY_RATING    , v_Ply_Rating)
    AND     A.SIZE_CD       = DECODE(v_Size_Cd       , NULL, A.SIZE_CD       , v_Size_Cd)
    AND     A.SIZE_CD2      = DECODE(v_Size_Cd2      , NULL, A.SIZE_CD2      , v_Size_Cd2)
    AND     A.USE_YN        = DECODE(v_Use_Yn        , NULL, A.USE_YN        , v_Use_Yn)
    AND     A.REG_ID        = DECODE(v_Reg_Id        , NULL, A.REG_ID        , v_Reg_Id);

  END p_sRtsd0003;

  /*****************************************************************************
  -- 타이어 규격 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*규격                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*규격2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0003 (
            SECTION_WIDTH,
            ASPECT_RATIO,
            WHEEL_INCHES,
            PLY_RATING,
            SIZE_CD,
            SIZE_CD2,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Section_Width,
            v_Aspect_Ratio,
            v_Wheel_Inches,
            v_Ply_Rating,
            v_Size_Cd,
            v_Size_Cd2,
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

  END f_InsertRtsd0003;

  /*****************************************************************************
  -- 타이어 규격 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*규격                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*규격2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0003
    SET    SIZE_CD       = v_Size_Cd,
           SIZE_CD2      = v_Size_Cd2,
           USE_YN        = v_Use_Yn,
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE 
    WHERE  SECTION_WIDTH = v_Section_Width
    AND    ASPECT_RATIO  = v_Aspect_Ratio
    AND    WHEEL_INCHES  = v_Wheel_Inches
    AND    PLY_RATING    = v_Ply_Rating;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0003;

  /*****************************************************************************
  -- 타이어 규격 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0003
    SET    USE_YN        = 'N',
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE 
    WHERE  SECTION_WIDTH = v_Section_Width
    AND    ASPECT_RATIO  = v_Aspect_Ratio
    AND    WHEEL_INCHES  = v_Wheel_Inches
    AND    PLY_RATING    = v_Ply_Rating;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0003;

  /*****************************************************************************
  -- 타이어 규격 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0003 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*규격                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*규격2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
  
    -- 필수값: 단면폭, 편평비,인치, PR(강도), 규격, 사용여부 ,등록자 ID
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
    
    IF TRIM(v_Size_Cd) IS NULL THEN
        v_Return_Message := '규격('||v_Size_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF 0 = f_sRtsd0003Count(v_Section_Width, v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating) THEN

        IF 0 != f_InsertRtsd0003(v_Section_Width, v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, 
                                 v_Size_Cd, v_Size_Cd2, v_Use_Yn, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := '타이어 규격 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0003(v_Section_Width, v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, 
                                     v_Size_Cd, v_Size_Cd2, v_Use_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '타이어 규격 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0003(v_Section_Width, v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '타이어 규격 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0003.p_IUDRtsd0003(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0003.p_IUDRtsd0003(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0003;

END Pkg_Rtsd0003;