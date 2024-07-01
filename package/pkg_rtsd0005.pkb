CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0005 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0005
   PURPOSE  상품 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
   1.1        2017-11-06  wjim             [20171106_01] 패턴 정렬기준 변경
   1.2        2017-11-10  wjim             [20171110_01] B2B일시불 추가
                                           - 기존 LG U+ B2B 용으로 김선태 대리가 개발했으나 운영기 미반영으로 [20171106_01] 작업간 over-write 되어 재작업
                                           - B2B일시불용으로 향후 변경을 고려 기존 p_sRtsd0005Popup에서 분리시켰으나 실제 차이점은 현재까지 없음
                                           - 이후 일반 렌탈과 차이점이 발생하지 않는다면 p_sRtsd0005Popup으로 통합해도 무관
   1.3        2019-04-23  kstka            [20190423_01] 자유렌탈시 총렌탈료 계산에 등록비 포 
*******************************************************************************/

  /*****************************************************************************
  --상품 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0005Count(
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE            /*상품코드            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0005
    WHERE   MAT_CD = v_Mat_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0005Count;

  /*****************************************************************************
  --상품 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0005 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTSD0005.MAT_NM%TYPE,         /*상품명                */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Demend_Qty     IN RTSD0005.DEMEND_QTY%TYPE,     /*타이어소요량          */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAT_CD,                    /*상품코드            */
            A.MAT_NM,                    /*상품명              */
            A.PETTERN_CD,                /*패턴코드            */
            A.SECTION_WIDTH,             /*단면폭              */
            A.ASPECT_RATIO,              /*편평비              */
            A.WHEEL_INCHES,              /*인치                */
            A.PLY_RATING,                /*PR(강도)            */
            A.DEMEND_QTY,                /*타이어소요량        */
            A.PG_CD,                     /*Pricing Group Code  */
            A.SEASON_CD,                 /*계절구분            */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0005 A
    WHERE   A.MAT_CD        = DECODE(v_Mat_Cd       , NULL, A.MAT_CD        , v_Mat_Cd)
    AND     A.MAT_NM        = DECODE(v_Mat_Nm       , NULL, A.MAT_NM        , v_Mat_Nm)
    AND     A.PETTERN_CD    = DECODE(v_Pettern_Cd   , NULL, A.PETTERN_CD    , v_Pettern_Cd)
    AND     A.SECTION_WIDTH = DECODE(v_Section_Width, NULL, A.SECTION_WIDTH , v_Section_Width)
    AND     A.ASPECT_RATIO  = DECODE(v_Aspect_Ratio , NULL, A.ASPECT_RATIO  , v_Aspect_Ratio)
    AND     A.WHEEL_INCHES  = DECODE(v_Wheel_Inches , NULL, A.WHEEL_INCHES  , v_Wheel_Inches)
    AND     A.PLY_RATING    = DECODE(v_Ply_Rating   , NULL, A.PLY_RATING    , v_Ply_Rating)
    AND     (v_Demend_Qty IS NULL OR A.DEMEND_QTY    = v_Demend_Qty)
    AND     A.PG_CD         = DECODE(v_Pg_Cd        , NULL, A.PG_CD         , v_Pg_Cd)
    AND     (v_Season_Cd  IS NULL OR A.SEASON_CD     = v_Season_Cd)
    AND     A.USE_YN        = DECODE(v_Use_Yn       , NULL, A.USE_YN        , v_Use_Yn)
    AND     A.REG_ID        = DECODE(v_Reg_Id       , NULL, A.REG_ID        , v_Reg_Id);

  END p_sRtsd0005;

  /*****************************************************************************
  --상품 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0005 (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTSD0005.MAT_NM%TYPE,         /*상품명                */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Demend_Qty     IN RTSD0005.DEMEND_QTY%TYPE,     /*타이어소요량          */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN


    INSERT  INTO RTSD0005 (
            MAT_CD,
            MAT_NM,
            PETTERN_CD,
            SECTION_WIDTH,
            ASPECT_RATIO,
            WHEEL_INCHES,
            PLY_RATING,
            DEMEND_QTY,
            PG_CD,
            SEASON_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Mat_Cd,
            v_Pettern_Cd || ' ' || v_Section_Width || '/' || v_Aspect_Ratio || 'R' || v_Wheel_Inches || ' ' || v_Ply_Rating || 'P' ,
            v_Pettern_Cd,
            v_Section_Width,
            v_Aspect_Ratio,
            v_Wheel_Inches,
            v_Ply_Rating,
            v_Demend_Qty,
            v_Pg_Cd,
            v_Season_Cd,
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

  END f_InsertRtsd0005;

  /*****************************************************************************
  --상품 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0005 (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTSD0005.MAT_NM%TYPE,         /*상품명                */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Demend_Qty     IN RTSD0005.DEMEND_QTY%TYPE,     /*타이어소요량          */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0005
    SET    DEMEND_QTY = v_Demend_Qty,
           SEASON_CD  = v_Season_Cd,
           USE_YN     = v_Use_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  MAT_CD     = v_Mat_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0005;

  /*****************************************************************************
  --상품 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0005 (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0005
    SET    USE_YN = 'N',
           CHG_ID = v_Reg_Id,
           CHG_DT = SYSDATE
    WHERE  MAT_CD = v_Mat_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0005;

  /*****************************************************************************
  -- 상품 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0005 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTSD0005.MAT_NM%TYPE,         /*상품명                */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Demend_Qty     IN RTSD0005.DEMEND_QTY%TYPE,     /*타이어소요량          */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 상품코드, 상품명, 사용여부 ,등록자 ID
    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mat_Nm) IS NULL THEN
        v_Return_Message := '상품명('||v_Mat_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF 0 = f_sRtsd0005Count(v_Mat_Cd) THEN

        IF 0 != f_InsertRtsd0005(v_Mat_Cd, v_Mat_Nm, v_Pettern_Cd, v_Section_Width,
                                 v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, v_Demend_Qty,
                                 v_Pg_Cd, v_Season_Cd, v_Use_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '상품 마스터 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0005(v_Mat_Cd, v_Mat_Nm, v_Pettern_Cd, v_Section_Width,
                                     v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, v_Demend_Qty,
                                     v_Pg_Cd, v_Season_Cd, v_Use_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '상품 마스터 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0005(v_Mat_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '상품 마스터 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0005.p_IUDRtsd0005(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0005.p_IUDRtsd0005(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0005;

  /*****************************************************************************
  --상품 마스터 - 상품코드로 상품명 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0005MatName(
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE            /*상품코드            */
    ) RETURN VARCHAR IS
    v_Mat_Nm    RTSD0005.MAT_NM%TYPE DEFAULT NULL;      /*상품명              */
  BEGIN

    SELECT  Mat_Nm
    INTO    v_Mat_Nm
    FROM    RTSD0005
    WHERE   MAT_CD = v_Mat_Cd;

    RETURN v_Mat_Nm;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0005MatName;

  /*****************************************************************************
  --상품 마스터 Select - 상품 마스터 조회 팝업 
  *****************************************************************************/
  PROCEDURE p_sRtsd0005Popup (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Season_Cd       IN RTSD0005.SEASON_CD%TYPE,       /*계절구분            */
    v_Pettern_Cd      IN RTSD0005.PETTERN_CD%TYPE,      /*패턴                */
    v_Section_Width   IN RTSD0005.SECTION_WIDTH%TYPE,   /*패턴                */
    v_Aspect_Ratio    IN RTSD0005.ASPECT_RATIO%TYPE,    /*패턴                */
    v_Wheel_Inches    IN RTSD0005.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0005.PLY_RATING%TYPE       /*패턴                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PETTERN_CD,                /*패턴코드            */
            A.PETTERN_NM,                /*패턴명              */
            A.SIZE_NM||' '||A.PLY_RATING||'P' AS SIZE_NM,      /*규격                */
            A.MAT_CD,                    /*상품코드            */
            A.MAT_NM,                    /*상품명              */
            A.WHEEL_QTY,                 /*바퀴수(장착가능수량)*/
            A.WHEEL_LIMIT_QTY,           /*장착가능 바퀴수     */
            A.MODEL_CD,                  /*차종                */
            A.MODEL_NM,                  /*차종명              */
            A.CONTENTS_CD,               /*사양                */
            A.CONTENTS_NM,               /*사양명              */
            A.FR_CD,                     /*전후 구분           */
            A.FR_NM,                     /*전후 구분명         */
            A.MODEL_NM||DECODE(A.CONTENTS_NM, NULL, '', ' '||A.CONTENTS_NM)||DECODE(A.FR_NM, NULL, '', ' '||A.FR_NM) MODEL_FULL_NM,
            A.SECTION_WIDTH,             /*단면폭              */
            A.ASPECT_RATIO,              /*편평비              */
            A.WHEEL_INCHES,              /*인치                */
            A.PLY_RATING,                /*PR(강도)            */
            A.DEMEND_QTY,                /*타이어소요량        */
            A.PG_CD,                     /*Pricing Group Code  */
            A.SEASON_CD,                 /*계절구분            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S014',A.SEASON_CD) AS SEASON_NM, /*계절구분명            */
            A.CLASS_CD,                  /*차량분류            */
            A.MAKER_CD,                  /*카메이커            */
            A.MAKER_NM                   /*카메이커            */
    FROM    (
            SELECT  A.*,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',A.PETTERN_CD) PETTERN_NM,
                    A.SECTION_WIDTH || '/' || A.ASPECT_RATIO || 'R' ||A.WHEEL_INCHES  SIZE_NM, /*단면폭||/||편평비||R||인치*/
                    B.MODEL_CD,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',B.MODEL_CD) MODEL_NM,
                    B.CONTENTS_CD,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',B.CONTENTS_CD) CONTENTS_NM,
                    B.FR_CD,
                    DECODE(B.FR_CD,'Z',NULL,'F','앞','R','뒤') FR_NM,
                    B.WHEEL_QTY,
                    B.WHEEL_LIMIT_QTY,
                    B.CLASS_CD,
                    C.MAKER_CD,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',C.MAKER_CD) MAKER_NM
            FROM    RTSD0005 A,
                    RTSD0004 B,
                    RTSD0001 C
            WHERE   A.SECTION_WIDTH = B.SECTION_WIDTH /*단면폭              */
            AND     A.ASPECT_RATIO  = B.ASPECT_RATIO  /*편평비              */
            AND     A.WHEEL_INCHES  = B.WHEEL_INCHES  /*인치                */
            AND     A.PLY_RATING    = B.PLY_RATING    /*PR(강도)            */
            AND     A.USE_YN = 'Y'            
            AND     B.MODEL_CD      = v_Model_Cd      /*차종(S001)          */
            AND     B.CONTENTS_CD   = v_Contents_Cd   /*사양(S002,S003)     */
            AND     B.FR_CD         = v_Fr_Cd         /*전후 구분           */
            AND     B.USE_YN        = 'Y'
            AND     B.MODEL_CD      = C.MODEL_CD      /*차종(S001)          */
            AND     B.CONTENTS_CD   = C.CONTENTS_CD   /*사양(S002,S003)     */
            AND     C.USE_YN        = 'Y'
            AND     (TRIM(v_Season_Cd    ) IS NULL OR A.SEASON_CD     =  TRIM(v_Season_Cd    ))
            AND     (TRIM(REPLACE(v_Pettern_Cd, CHR(39), '')) IS NULL OR REPLACE(A.PETTERN_CD, CHR(39), '')    =  TRIM(REPLACE(v_Pettern_Cd, CHR(39), '')))
            AND     (TRIM(v_Section_Width) IS NULL OR A.SECTION_WIDTH =  TRIM(v_Section_Width))
            AND     (TRIM(v_Aspect_Ratio ) IS NULL OR A.ASPECT_RATIO  =  TRIM(v_Aspect_Ratio ))
            AND     (TRIM(v_Wheel_Inches ) IS NULL OR A.WHEEL_INCHES  =  TRIM(v_Wheel_Inches ))
            AND     (TRIM(v_Ply_Rating   ) IS NULL OR A.PLY_RATING    =  TRIM(v_Ply_Rating   ))
            ) A
    ORDER   BY  A.PETTERN_NM, /*패턴코드      */
                A.SIZE_NM;   /*사이즈        */

  END p_sRtsd0005Popup;
  
  /*****************************************************************************
  --상품 마스터 Select - B2B상품 마스터 조회 팝업
  --- B2B상품 조회용으로 p_sRtsd0005Popup 에서 분리함
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-11-10  wjim             [20171110_01] 신규작성 
  *****************************************************************************/
  PROCEDURE p_sRtsd0005B2BPopup (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Season_Cd       IN RTSD0005.SEASON_CD%TYPE,       /*계절구분            */
    v_Pettern_Cd      IN RTSD0005.PETTERN_CD%TYPE,      /*패턴                */
    v_Section_Width   IN RTSD0005.SECTION_WIDTH%TYPE,   /*패턴                */
    v_Aspect_Ratio    IN RTSD0005.ASPECT_RATIO%TYPE,    /*패턴                */
    v_Wheel_Inches    IN RTSD0005.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0005.PLY_RATING%TYPE       /*패턴                */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PETTERN_CD,                /*패턴코드            */
            A.PETTERN_NM,                /*패턴명              */
            A.SIZE_NM||' '||A.PLY_RATING||'P' AS SIZE_NM,      /*규격                */
            A.MAT_CD,                    /*상품코드            */
            A.MAT_NM,                    /*상품명              */
            A.WHEEL_QTY,                 /*바퀴수(장착가능수량)*/
            A.WHEEL_LIMIT_QTY,           /*장착가능 바퀴수     */
            A.MODEL_CD,                  /*차종                */
            A.MODEL_NM,                  /*차종명              */
            A.CONTENTS_CD,               /*사양                */
            A.CONTENTS_NM,               /*사양명              */
            A.FR_CD,                     /*전후 구분           */
            A.FR_NM,                     /*전후 구분명         */
            A.MODEL_NM||DECODE(A.CONTENTS_NM, NULL, '', ' '||A.CONTENTS_NM)||DECODE(A.FR_NM, NULL, '', ' '||A.FR_NM) MODEL_FULL_NM,
            A.SECTION_WIDTH,             /*단면폭              */
            A.ASPECT_RATIO,              /*편평비              */
            A.WHEEL_INCHES,              /*인치                */
            A.PLY_RATING,                /*PR(강도)            */
            A.DEMEND_QTY,                /*타이어소요량        */
            A.PG_CD,                     /*Pricing Group Code  */
            A.SEASON_CD,                 /*계절구분            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S014',A.SEASON_CD) AS SEASON_NM, /*계절구분명            */
            A.CLASS_CD,                  /*차량분류            */
            A.MAKER_CD,                  /*카메이커            */
            A.MAKER_NM                   /*카메이커            */
    FROM    (
            SELECT  A.*,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',A.PETTERN_CD) PETTERN_NM,
                    A.SECTION_WIDTH || '/' || A.ASPECT_RATIO || 'R' ||A.WHEEL_INCHES  SIZE_NM, /*단면폭||/||편평비||R||인치*/
                    B.MODEL_CD,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',B.MODEL_CD) MODEL_NM,
                    B.CONTENTS_CD,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',B.CONTENTS_CD) CONTENTS_NM,
                    B.FR_CD,
                    DECODE(B.FR_CD,'Z',NULL,'F','앞','R','뒤') FR_NM,
                    B.WHEEL_QTY,
                    B.WHEEL_LIMIT_QTY,
                    B.CLASS_CD,
                    C.MAKER_CD,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',C.MAKER_CD) MAKER_NM
            FROM    RTSD0005 A,
                    RTSD0004 B,
                    RTSD0001 C
            WHERE   A.SECTION_WIDTH = B.SECTION_WIDTH /*단면폭              */
            AND     A.ASPECT_RATIO  = B.ASPECT_RATIO  /*편평비              */
            AND     A.WHEEL_INCHES  = B.WHEEL_INCHES  /*인치                */
            AND     A.PLY_RATING    = B.PLY_RATING    /*PR(강도)            */
            AND     A.USE_YN = 'Y'
            AND     B.MODEL_CD      = v_Model_Cd      /*차종(S001)          */
            AND     B.CONTENTS_CD   = v_Contents_Cd   /*사양(S002,S003)     */
            AND     B.FR_CD         = v_Fr_Cd         /*전후 구분           */
            AND     B.USE_YN        = 'Y'
            AND     B.MODEL_CD      = C.MODEL_CD      /*차종(S001)          */
            AND     B.CONTENTS_CD   = C.CONTENTS_CD   /*사양(S002,S003)     */
            AND     C.USE_YN        = 'Y'
            AND     (TRIM(v_Season_Cd    ) IS NULL OR A.SEASON_CD     =  TRIM(v_Season_Cd    ))
            AND     (TRIM(v_Pettern_Cd   ) IS NULL OR A.PETTERN_CD    =  TRIM(v_Pettern_Cd   ))
            AND     (TRIM(v_Section_Width) IS NULL OR A.SECTION_WIDTH =  TRIM(v_Section_Width))
            AND     (TRIM(v_Aspect_Ratio ) IS NULL OR A.ASPECT_RATIO  =  TRIM(v_Aspect_Ratio ))
            AND     (TRIM(v_Wheel_Inches ) IS NULL OR A.WHEEL_INCHES  =  TRIM(v_Wheel_Inches ))
            AND     (TRIM(v_Ply_Rating   ) IS NULL OR A.PLY_RATING    =  TRIM(v_Ply_Rating   ))
            ) A
    ORDER   BY  A.PETTERN_NM, /*패턴코드      */
                A.SIZE_NM;   /*사이즈        */

  END p_sRtsd0005B2BPopup;


   /*****************************************************************************
  --상품 마스터 Select - 상품 마스터 조회 팝업(캠페인 등록)
  *****************************************************************************/
  PROCEDURE p_sRtsd0005PopupCamp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mat_Nm        IN RTSD0005.MAT_NM%TYPE              /*차종                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PETTERN_CD,                /*패턴코드            */
            A.PETTERN_NM,                /*패턴명              */
            A.SIZE_NM||' '||A.PLY_RATING||'P' AS SIZE_NM,      /*규격                */
            A.MAT_CD,                    /*상품코드            */
            A.MAT_NM,                    /*상품명              */
            A.WHEEL_QTY,                 /*바퀴수(장착가능수량)*/
            A.WHEEL_LIMIT_QTY,           /*장착가능 바퀴수     */
            A.MODEL_CD,                  /*차종                */
            A.MODEL_NM,                  /*차종명              */
            A.CONTENTS_CD,               /*사양                */
            A.CONTENTS_NM,               /*사양명              */
            A.FR_CD,                     /*전후 구분           */
            A.FR_NM,                     /*전후 구분명         */
            A.MODEL_NM||DECODE(A.CONTENTS_NM, NULL, '', ' '||A.CONTENTS_NM)||DECODE(A.FR_NM, NULL, '', ' '||A.FR_NM) MODEL_FULL_NM,
            A.SECTION_WIDTH,             /*단면폭              */
            A.ASPECT_RATIO,              /*편평비              */
            A.WHEEL_INCHES,              /*인치                */
            A.PLY_RATING,                /*PR(강도)            */
            A.DEMEND_QTY,                /*타이어소요량        */
            A.PG_CD,                     /*Pricing Group Code  */
            A.SEASON_CD,                 /*계절구분            */
            A.CLASS_CD,                  /*차량분류            */
            A.MAKER_CD,                  /*카메이커            */
            A.MAKER_NM                   /*카메이커            */
    FROM    (
            SELECT  A.*,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',A.PETTERN_CD) PETTERN_NM,
                    A.SECTION_WIDTH || '/' || A.ASPECT_RATIO || 'R' ||A.WHEEL_INCHES  SIZE_NM, /*단면폭||/||편평비||R||인치*/
                    B.MODEL_CD,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',B.MODEL_CD) MODEL_NM,
                    B.CONTENTS_CD,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',B.CONTENTS_CD) CONTENTS_NM,
                    B.FR_CD,
                    DECODE(B.FR_CD,'Z',NULL,'F','앞','R','뒤') FR_NM,
                    B.WHEEL_QTY,
                    B.WHEEL_LIMIT_QTY,
                    B.CLASS_CD,
                    C.MAKER_CD,
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',C.MAKER_CD) MAKER_NM
            FROM    RTSD0005 A,
                    RTSD0004 B,
                    RTSD0001 C
            WHERE   A.SECTION_WIDTH = B.SECTION_WIDTH /*단면폭              */
            AND     A.ASPECT_RATIO  = B.ASPECT_RATIO  /*편평비              */
            AND     A.WHEEL_INCHES  = B.WHEEL_INCHES  /*인치                */
            AND     A.PLY_RATING    = B.PLY_RATING    /*PR(강도)            */
            AND     A.USE_YN = 'Y'
            AND     A.MAT_NM LIKE '%'||v_Mat_Nm||'%'
            AND     B.USE_YN        = 'Y'
            AND     B.MODEL_CD      = C.MODEL_CD      /*차종(S001)          */
            AND     B.CONTENTS_CD   = C.CONTENTS_CD   /*사양(S002,S003)     */
            AND     C.USE_YN        = 'Y'
            ) A
    ORDER   BY  A.PETTERN_NM, /*패턴코드      */
                A.SIZE_NM;   /*사이즈        */

  END p_sRtsd0005PopupCamp;

   /*****************************************************************************
  --상품 마스터 Select - 상품 마스터 조회 팝업(캠페인 등록)
  *****************************************************************************/
  PROCEDURE p_sRtsd0005PopupCamp2 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mat_Nm         IN RTSD0005.MAT_NM%TYPE            /*차종                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  MAT_CD,                                                   /*상품코드*/
            MAT_NM,                                                   /*상품명*/
            PETTERN_CD,                                               /*패턴코드*/
            SECTION_WIDTH,                                            /*단면폭*/
            ASPECT_RATIO,                                             /*편평비*/
            WHEEL_INCHES,                                             /*인치*/
            PLY_RATING,                                               /*PR(강도)*/
            DEMEND_QTY,                                               /*타이어소요량*/
            PG_CD,                                                    /*Pricing Group Code*/
            SEASON_CD,                                                /*계절구분*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',A.PETTERN_CD) AS PETTERN_NM,            /*패턴명*/
            A.SECTION_WIDTH || '/' || A.ASPECT_RATIO || 'R' ||A.WHEEL_INCHES AS SIZE_NM     /*단면폭||/||편평비||R||인치*/
    FROM    RTSD0005 A
    WHERE   USE_YN = 'Y'
    AND     A.MAT_NM LIKE '%'||v_Mat_Nm||'%'
    ORDER   BY PETTERN_NM, /*패턴코드      */
               SIZE_NM;   /*사이즈        */

  END p_sRtsd0005PopupCamp2;

  /*****************************************************************************
  --상품 마스터 Update EAI INTERFACE
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0005Interface (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0005
    SET    MAT_NM        = v_Pettern_Cd || ' ' || v_Section_Width || '/' || v_Aspect_Ratio || 'R' || v_Wheel_Inches || ' ' || v_Ply_Rating || 'P' ,
           PETTERN_CD    = v_Pettern_Cd,
           SECTION_WIDTH = v_Section_Width,
           ASPECT_RATIO  = v_Aspect_Ratio,
           WHEEL_INCHES  = v_Wheel_Inches,
           PLY_RATING    = TO_NUMBER(v_Ply_Rating),
           PG_CD         = v_Pg_Cd,
           USE_YN        = v_Use_Yn,
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE
    WHERE  MAT_CD        = v_Mat_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0005Interface;


  /*****************************************************************************
  --상품 마스터 - 사용여부에 따른 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0005UseCount(
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,           /*상품코드            */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE            /*사용여부            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0005
    WHERE   MAT_CD = v_Mat_Cd
    AND     USE_YN LIKE TRIM(v_Use_Yn)||'%';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0005UseCount;
  
  /*****************************************************************************
  --특정 차종, 사양 규격에 상품정보 Select - 상품 및 가격조회 팝업 Combo용
   
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-11-06  wjim             [20171106_01] 패턴 정렬기준 변경
                                           - 공통코드 정렬순번 적용
  *****************************************************************************/
  PROCEDURE p_sRtsd0005Comboset (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE      /*사양                */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT A1.SEASON_CD
         ,  A1.PETTERN_CD
         ,  B1.CD_NM AS PETTERN_NM
         ,  A1.SECTION_WIDTH
         ,  A1.ASPECT_RATIO
         ,  A1.WHEEL_INCHES
         ,  A1.PLY_RATING
         ,  A1.SECTION_WIDTH||'/'||A1.ASPECT_RATIO||'R'||A1.WHEEL_INCHES||' '||A1.PLY_RATING||'P' AS SPEC_NM
         ,  B1.ORDER_PT 
      FROM  RTSD0005 A1
         ,  RTCM0051 B1
     WHERE  A1.USE_YN = 'Y'
       AND  A1.PETTERN_CD = B1.CD(+)
       AND  B1.CD_GRP_CD(+) = 'S012'
       AND  (A1.SECTION_WIDTH, A1.ASPECT_RATIO, A1.WHEEL_INCHES) IN (
                SELECT  SECTION_WIDTH, ASPECT_RATIO, WHEEL_INCHES
                  FROM  RTSD0004
                 WHERE  1=1
                   AND  MODEL_CD    = DECODE(v_Model_Cd   , NULL, v_Model_Cd   , v_Model_Cd   )
                   AND  CONTENTS_CD = DECODE(v_Contents_Cd, NULL, v_Contents_Cd, v_Contents_Cd)
            )       
     ORDER  BY A1.SEASON_CD
         ,  B1.ORDER_PT
         ,  A1.PETTERN_CD
         ,  A1.SECTION_WIDTH
         ,  A1.ASPECT_RATIO
         ,  A1.WHEEL_INCHES
         ,  A1.PLY_RATING;
         
--    [20171106_01] 이전         
--    SELECT  DISTINCT SEASON_CD
--         ,  PETTERN_CD
--         ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',PETTERN_CD) AS PETTERN_NM
--         ,  SECTION_WIDTH
--         ,  ASPECT_RATIO
--         ,  WHEEL_INCHES
--         ,  PLY_RATING
--         ,  SECTION_WIDTH||'/'||ASPECT_RATIO||'R'||WHEEL_INCHES||' '||PLY_RATING||'P' AS SPEC_NM
--      FROM  RTSD0005
--     WHERE  USE_YN = 'Y'
--       AND  (SECTION_WIDTH, ASPECT_RATIO, WHEEL_INCHES) IN (
--                SELECT  SECTION_WIDTH, ASPECT_RATIO, WHEEL_INCHES
--                  FROM  RTSD0004
--                 WHERE  1=1
--                   AND  MODEL_CD    = DECODE(v_Model_Cd   , NULL, v_Model_Cd   , v_Model_Cd   )
--                   AND  CONTENTS_CD = DECODE(v_Contents_Cd, NULL, v_Contents_Cd, v_Contents_Cd)
--            )       
--     ORDER  BY SEASON_CD
--         ,  PETTERN_CD
--         ,  SECTION_WIDTH
--         ,  ASPECT_RATIO
--         ,  WHEEL_INCHES
--         ,  PLY_RATING;

  END p_sRtsd0005Comboset;

/*****************************************************************************
  --상품 마스터 Select - 타이어
  *****************************************************************************/

  PROCEDURE p_sRtsd0005TireCode (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE     /*패턴코드              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT                                                  /*상품명*/
            PETTERN_CD,
                                           
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',PETTERN_CD) AS PETTERN_NM            /*패턴명*/

    FROM    RTSD0005
    WHERE   USE_YN = 'Y'
    --AND     PETTERN_CD LIKE '%' || v_Pettern_Cd || '%'    ？    ？    ？/*검색조건*/
    AND     PETTERN_CD LIKE '%' || v_Pettern_Cd || '%'
    ORDER   BY PETTERN_CD; /*패턴코드      */

  END p_sRtsd0005TireCode;
  
  
  /*****************************************************************************
  --상품 마스터 Select - 타이어
  *****************************************************************************/
  PROCEDURE p_sRtsd0005TireDetailCode (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Sale_Cd        IN RTSD0046.SALE_CD%TYPE   
    ) IS 

  BEGIN
     IF 0 != f_sRtsd0005TireDetailCount(v_Pettern_Cd,v_Sale_Cd)  THEN
    OPEN Ref_Cursor FOR
   
   
    SELECT 
     A.PETTERN_CD
    ,A.SECTION_WIDTH||'/'||A.ASPECT_RATIO||'R'||A.WHEEL_INCHES AS STANDARD
    ,A.MAT_CD
    ,A.MAT_NM
    ,A.REG_DT
    ,PKG_RTCM0051.F_SRTCM0051CODENAME('S014',A.SEASON_CD) AS SEASON_NM /*계절구분명 */
    ,B.SALE_CD
    FROM RTSD0005 A, RTSD0046 B
    
    WHERE A.USE_YN        = 'Y'
    AND A.MAT_CD=B.MAT_CD(+)
      
    AND A.PETTERN_CD LIKE '%' || v_Pettern_Cd || '%'  
    AND A.MAT_CD NOT IN(SELECT MAT_CD FROM RTSD0046 WHERE SALE_CD=v_Sale_Cd)
    ORDER BY PETTERN_CD; /*패턴코드      */
  
    ELSE
    OPEN Ref_Cursor FOR
    SELECT 
     A.PETTERN_CD
    ,A.SECTION_WIDTH||'/'||A.ASPECT_RATIO||'R'||A.WHEEL_INCHES AS STANDARD
    ,A.MAT_CD
    ,A.MAT_NM
    ,A.REG_DT
    ,PKG_RTCM0051.F_SRTCM0051CODENAME('S014',A.SEASON_CD) AS SEASON_NM /*계절구분명 */
    ,B.SALE_CD
    FROM RTSD0005 A, RTSD0046 B
    
    WHERE A.USE_YN        = 'Y'
    AND A.MAT_CD=B.MAT_CD(+)
      
    AND A.PETTERN_CD LIKE '%' || v_Pettern_Cd || '%' 
    ORDER BY PETTERN_CD; /*패턴코드      */ 
    END IF;     
     
   
    

  END p_sRtsd0005TireDetailCode;
  
  

  /*****************************************************************************
  --쇼핑몰 최저가 구하기.(사이즈검색)
  *****************************************************************************/
  FUNCTION f_sRtsd0005SizeMinAmt(
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /* 단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /* 편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE    /* 인치                  */    
  ) RETURN NUMBER IS
    v_Min_Amt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  MIN(T1.AMT) AS AMT
    INTO    v_Min_Amt
    FROM RTSD0005 T, RTSD0008 T1
    WHERE T.MAT_CD = T1.MAT_CD
    AND T.SECTION_WIDTH = DECODE(v_Section_Width,   NULL, T.SECTION_WIDTH,  v_Section_Width)
    AND T.ASPECT_RATIO  = DECODE(v_Aspect_Ratio,    NULL, T.ASPECT_RATIO,   v_Aspect_Ratio)
    AND T.WHEEL_INCHES  = DECODE(v_Wheel_Inches,    NULL, T.WHEEL_INCHES,   v_Wheel_Inches)
    AND T.USE_YN = 'Y';

    RETURN v_Min_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0005SizeMinAmt;
  

  /*****************************************************************************
  --쇼핑몰 최자가 구하기.(차종검색)
  *****************************************************************************/
  FUNCTION f_sRtsd0005MakerMinAmt(
    v_Maker_cd       IN RTSD0001.MAKER_CD%TYPE,       /* 차종     */
    v_Model_cd       IN RTSD0001.MODEL_CD%TYPE,       /* 모델코드 */
    v_Size_Info      VARCHAR2
  ) RETURN NUMBER IS
    v_Min_Amt   NUMBER DEFAULT 0;
  BEGIN

    SELECT 
      MIN(T3.AMT) AS AMT
      INTO v_Min_Amt
    FROM RTSD0001 T, RTSD0004 T1, RTSD0005 T2, RTSD0008 T3
    WHERE T.MODEL_CD        = T1.MODEL_CD
    AND T1.SECTION_WIDTH    = T2.SECTION_WIDTH
    AND T1.ASPECT_RATIO     = T2.ASPECT_RATIO
    AND T1.WHEEL_INCHES     = T2.WHEEL_INCHES
    AND T2.MAT_CD           = T3.MAT_CD
    AND T.MAKER_CD          = DECODE(v_Maker_cd, NULL, T.MAKER_CD, v_Maker_cd)
    AND T.MODEL_CD          = DECODE(v_Model_cd, NULL, T.MODEL_CD, v_Model_cd)
    AND T1.SECTION_WIDTH||'/'||T1.ASPECT_RATIO||'R'||T1.WHEEL_INCHES = v_Size_Info
    AND T1.USE_YN = 'Y';

    RETURN v_Min_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0005MakerMinAmt;
  
  
  /*****************************************************************************
  --쇼핑몰 최저가 구하기.(상품코드, 4본 기준)
    2018.12.07 고객사 요청으로 4본 기준으로 변경
  *****************************************************************************/
  FUNCTION f_sRtsd0005MinAmt(
    I_PriceCd       IN RTSD0008.PRICE_CD%TYPE,      /* 가격유형, 렌탈료:0002*/
    I_MatCd         IN RTSD0008.MAT_CD%TYPE         /* 상품코드 */
  ) RETURN NUMBER IS
    v_Min_Amt   NUMBER DEFAULT 0;
  BEGIN

--    SELECT  MIN(AMT) AS AMT
--      INTO  v_Min_Amt
--    FROM    RTSD0008
--    WHERE   MAT_CD = I_MatCd
--    AND     PRICE_CD = I_PriceCd
--    AND     TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN STR_DAY AND END_DAY
--    AND     CNT_CD = '04';
    
    SELECT  MIN(AMT) AS AMT
      INTO  v_Min_Amt
    FROM    RTSD0008
    WHERE   MAT_CD = I_MatCd
    AND     PRICE_CD = I_PriceCd
    AND     TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN STR_DAY AND END_DAY
    AND     USE_YN = 'Y'
    AND     PERIOD_CD = '36'
    AND     CNT_CD = '02';

    RETURN v_Min_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0005MinAmt;  
  
  /*****************************************************************************
  --상품 마스터 Select - 타이어
  *****************************************************************************/
  PROCEDURE p_sRtsd0005TireDetailCode2 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Sale_Cd        IN RTSD0046.SALE_CD%TYPE,
    v_Pettern_Cd     IN RTSD0046.PETTERN_CD%TYPE
    ) IS

  BEGIN
    OPEN Ref_Cursor FOR
  
   SELECT 
     A.PETTERN_CD
    ,A.MAT_CD
    ,A.REG_DT 
    ,A.SALE_CD    
    FROM RTSD0046 A    
    
    WHERE SALE_CD =v_Sale_Cd
    AND     PETTERN_CD=v_Pettern_Cd;
  END p_sRtsd0005TireDetailCode2;
  
  
/*****************************************************************************
  -- 계약 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0005TireDetailCount(
    v_Pettern_Cd        IN RTSD0046.PETTERN_CD%TYPE,     /*패턴코드              */ 
    v_Sale_Cd        IN RTSD0046.SALE_CD%TYPE
    
    ) RETURN NUMBER IS
    v_Curr_Cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_Curr_Cunt
    FROM    RTSD0046
    WHERE   SALE_CD = v_Sale_Cd
    AND     PETTERN_CD = v_Pettern_Cd;

    RETURN v_Curr_Cunt; 

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0005TireDetailCount;
  
  
/*****************************************************************************
  -타이어패턴코드 Delete
  *****************************************************************************/
  FUNCTION f_DeleteTireDetailRtsd0046 (
    v_Sale_Cd           IN RTSD0046.SALE_CD%TYPE,          /* 판매코드         */
    v_Pettern_Cd        IN RTSD0046.PETTERN_CD%TYPE
    ) RETURN NUMBER IS
  BEGIN

    DELETE FROM RTSD0046
    WHERE  SALE_CD      = v_Sale_Cd
    AND    PETTERN_CD   = v_Pettern_Cd;
    Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0005.f_DeleteTireDetailRtsd0046', '판매코드에러', v_Sale_Cd);

    RETURN SQLCODE;

  END f_DeleteTireDetailRtsd0046;
  
  
  /*****************************************************************************
  -- 타이어패턴정보 IUD
  *****************************************************************************/
  PROCEDURE p_IUDTireDetailRtsd0046 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)  */
    v_Sale_Cd        IN RTSD0046.SALE_CD%TYPE,
    v_Mat_Cd         IN RTSD0046.MAT_CD%TYPE,
    v_Pettern_Cd        IN RTSD0046.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Reg_Id        IN RTSD0046.REG_ID%TYPE,     /*화면사용자              */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2    
    ) IS
 e_Error EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertTireDetailRtsd0046(v_Sale_Cd, v_Mat_Cd,v_Pettern_Cd,v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '판매프리엄미정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
       
        
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            v_Success_code := 0;
        ELSIF v_Comm_Dvsn = 'D' THEN
            v_Success_code := 0;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0005.p_IUDTireDetailRtsd0046(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0005.p_IUDTireDetailRtsd0046(2)', v_ErrorText, v_Return_Message);

  END p_IUDTireDetailRtsd0046; 
  
  
    /*****************************************************************************
  -타이어정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertTireDetailRtsd0046 (
    v_Sale_Cd           IN RTSD0046.SALE_CD%TYPE,           /* 판매코드         */
    v_Mat_Cd            IN RTSD0046.MAT_CD%TYPE,
    v_Pettern_Cd        IN RTSD0046.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Reg_Id        IN RTSD0046.REG_ID%TYPE,     /*화면사용자              */    
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    
      INSERT INTO RTSD0046(
         SALE_CD
        ,MAT_CD
        ,PETTERN_CD
        ,REG_ID
        ,REG_DT
        ,CHG_ID
        ,CHG_DT
        )VALUES(
        v_Sale_Cd
       ,v_Mat_Cd
       ,v_Pettern_Cd
       ,v_Reg_Id
       ,SYSDATE
       ,v_Reg_Id
       ,SYSDATE
        );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertTireDetailRtsd0046;  


  
  /*****************************************************************************
  --쇼핑몰 카페테리아 금액 계산
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopRentAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Mat_cd         IN RTSD0008.MAT_CD%TYPE,           /* 상품코드 */
    v_Maker_cd       IN RTSD0001.MAKER_CD%TYPE,         /* 차종     */
    v_Model_cd       IN RTSD0001.MODEL_CD%TYPE,         /* 모델코드 */
    v_Size_Info      VARCHAR2,
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT
     SS.RENT_AMT,                                              /* 기본 월 렌탈료    */
     0 AS ADD_RENT_AMT,                                        /* 추가렌탈료        */
     SS.TOTAL_AMT,                                             /* 총렌탈료(할인 전) */
     SS.REGI_AMT,                                              /* 렌탈등록비        */
     SS.DC_AMT,                                                /* 할인액            */
     TRUNC((SS.REGI_AMT+SS.TOTAL_AMT)/36,-1) AS TOTAL_PAY_YN,  /* 총 납입금액       */
     SS.SALE_CD,                                               /* 판매상품코드      */
     SS.SALE_NM                                                /* 판매상품명        */
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD)       AS RENT_AMT,
         SUM(S.AMT*36) OVER (PARTITION BY S.SALE_CD)    AS TOTAL_AMT,
         SUM(S.REGI_CD) OVER(PARTITION BY S.SALE_CD)    AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD)     AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM
        FROM (    
            SELECT 
              T3.PRICE_CD,
              T2.PETTERN_CD, 
              T3.MAT_CD,
              T3.PERIOD_CD, 
              T3.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T4.SALE_CD AND '0'||A.CNT_CD = T3.CNT_CD) AS REGI_CD,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T3.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T4.SALE_CD) AS DC_AMT,  
              T3.STR_DAY, 
              T3.END_DAY, 
              T3.SEQ, 
              T3.AMT,
              T4.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T4.SALE_CD) AS SALE_NM
            FROM RTSD0001 T, RTSD0004 T1, RTSD0005 T2, RTSD0008 T3, RTSD0021 T4
            WHERE T.MODEL_CD        = T1.MODEL_CD
            AND T2.MAT_CD           = T3.MAT_CD
            AND T2.MAT_CD           = DECODE(v_Mat_cd, NULL , T2.MAT_CD, v_Mat_cd)
            AND T.MAKER_CD          = DECODE(v_Maker_cd, NULL, T.MAKER_CD, v_Maker_cd)
            AND T.MODEL_CD          = DECODE(v_Model_cd, NULL, T.MODEL_CD, v_Model_cd)
            AND T1.SECTION_WIDTH||'/'||T1.ASPECT_RATIO||'R'||T1.WHEEL_INCHES = v_Size_Info
            AND T3.CNT_CD           = DECODE(v_Cnt_cd, NULL, T3.CNT_CD, v_Cnt_cd)
            AND T3.PERIOD_CD        = DECODE(v_Period_cd, NULL, T3.PERIOD_CD, v_Period_cd)
            AND T4.SALE_GDS_CD      = T2.PETTERN_CD
            AND T4.SALE_CD IN ('S000000243','S000000245','S000000246','S000000247')
            GROUP BY T3.PRICE_CD, T2.PETTERN_CD, T3.MAT_CD, T3.PERIOD_CD, T3.CNT_CD, T3.REGI_CD, T3.STR_DAY, T3.END_DAY, T3.SEQ, T3.AMT, T4.SALE_CD
        ) S    
    ) SS
    GROUP BY SS.RENT_AMT,SS.REGI_AMT,SS.DC_AMT,SS.SALE_CD,SS.TOTAL_AMT,SS.SALE_NM;
    
  END sRtsd0005ShopRentAmt;
  
  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 일시불, 일시불+멤버쉽
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopPayAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    SELECT
     --SS.RENT_AMT,            /* 기본 월 렌탈료 */
     0 AS RENT_AMT,             /* 기본 월 렌탈료 */
     CASE WHEN SS.PRDT_GRP_DTL = '08' THEN NVL(SS.ADD_RENT_AMT,0)     ELSE 0
     END ADD_RENT_AMT,          /* 추가렌탈료     */
     0 AS TOTAL_AMT,            /* 총렌탈료       */
     CASE WHEN SS.PRDT_GRP_DTL = '08' THEN CASE WHEN SS.DC_RATE = 0 THEN TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT*v_Period_cd,0))-NVL(SS.DC_AMT,0)),-1)
                                           ELSE TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT*v_Period_cd,0))-TRUNC(NVL(SS.ADD_RENT_AMT * SS.DC_RATE/100,0)*v_Period_cd + NVL(SS.DC_AMT,0), -1)),-1)
                                           END
     ELSE TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0))-NVL(SS.DC_AMT,0)),-1)
     END AS REGI_AMT,
     0 AS DC_AMT,               /* 할인액         */
     0 AS TOTAL_RENT_AMT,       /* 총 납입금액  (36:납부기간 파라미터 값) */
     SS.SALE_CD,                /* 판매상품코드                           */
     SS.SALE_NM,                /* 판매상품명                             */
     SS.CONTENTS,               /* 비고 */
     SS.PRDT_GRP,               /* 판매유형 Lv1 */
     SS.PRDT_GRP_DTL,           /* 판매유형 Lv2 */
     SS.HASH_TAG1,              /* 해쉬태그1 */
     SS.HASH_TAG2,              /* 해쉬태그2 */
     SS.HASH_TAG3,              /* 해쉬태그3 */
     SS.HASH_TAG4               /* 해쉬태그4 */
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT*v_Period_cd) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         S.DC_RATE,
         (
         SELECT SUM(DECODE(BB.SERV_CNT, 1, AA.SERV_AMT_1,
                                2, AA.SERV_AMT_2,
                                3, AA.SERV_AMT_3,
                                4, AA.SERV_AMT_4,
                                5, AA.SERV_AMT_5,
                                6, AA.SERV_AMT_6,
                                7, AA.SERV_AMT_7,
                                8, AA.SERV_AMT_8,
                                9, AA.SERV_AMT_9,
                                10, AA.SERV_AMT_10)) AS SERV_AMT 
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      B.SERV_AMT_1, 
                      B.SERV_AMT_2, 
                      B.SERV_AMT_3, 
                      B.SERV_AMT_4, 
                      B.SERV_AMT_5, 
                      B.SERV_AMT_6, 
                      B.SERV_AMT_7, 
                      B.SERV_AMT_8, 
                      B.SERV_AMT_9, 
                      B.SERV_AMT_10                        
                 FROM RTSD0028 A, 
                      (
                      SELECT
                          T.PRS_DCD 
                          ,T.PERIOD_CD
                          ,T.SEQ    --[20191001_01] SEQ컬럼추가
                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                      FROM RTSD0043 T
                      WHERE 1=1
                      AND T.PERIOD_CD = DECODE(v_Period_cd, NULL, T.PERIOD_CD, v_Period_cd)
                      GROUP BY T.PRS_DCD,T.PERIOD_CD, T.SEQ --[20191001_01] SEQ컬럼 추가
                      ) B
                WHERE A.PRS_DCD = B.PRS_DCD
                AND A.SEQ = B.SEQ) AA,  --[20191001_01] SEQ컬럼추가   
              (SELECT PS_CD,
                      PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE 1=1
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD           = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND AA.SALE_CD           = BB.PS_CD
           AND BB.PERIOD_CD         = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd)
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd))
         ) AS ADD_RENT_AMT,
         S.PRDT_GRP,
         S.PRDT_GRP_DTL,
         S.CONTENTS,
         S.HASH_TAG1,
         S.HASH_TAG2,
         S.HASH_TAG3,
         S.HASH_TAG4
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              T3.DC_RATE,
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS SALE_NM,
              T4.CHAN_CD,
              T3.PRDT_GRP,
              T3.PRDT_GRP_DTL,
              T3.CONTENTS,
              T3.HASH_TAG1,
              T3.HASH_TAG2,
              T3.HASH_TAG3,
              T3.HASH_TAG4
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTSD0020 T3, RTSD0045 T4
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width -- 단면폭              
            AND T.ASPECT_RATIO     = v_Aspect_Ratio  -- 편평비              
            AND T.WHEEL_INCHES     = v_Wheel_Inches  -- 인치               
            AND T.PLY_RATING       = v_Ply_Rating    -- PR(강도)           
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd        -- 타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd     -- 납부기간
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = '0002'
            AND T2.SALE_CD         = T3.SALE_CD
            AND T3.PRDT_GRP        = '03'                --판매유형 Lv1
            AND T3.PRDT_GRP_DTL    IN('07','08')        --판매유형 Lv2
            AND T3.SALE_CD         = T4.SALE_CD
            AND T4.CHAN_CD         IN('02')    --채널구분
            AND T3.USE_YN          = 'Y'
            AND T3.SALE_STR_DAY     <= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND T3.SALE_END_DAY     >= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;
        
    /*
    SELECT
     SS.RENT_AMT,           -- 기본 월 렌탈료 
     CASE WHEN SS.CD != 'S05' THEN SS.ADD_RENT_AMT
     ELSE 0
     END ADD_RENT_AMT,       -- 추가렌탈료     
     SS.TOTAL_AMT,          --총렌탈료       
     SS.REGI_AMT,           -- 렌탈등록비     
     SS.DC_AMT,              --할인액       
     CASE WHEN SS.CD != 'S05' THEN TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))-NVL(SS.DC_AMT,0)),-1)
     ELSE TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0))-NVL(SS.DC_AMT,0)),-1)
     END AS TOTAL_RENT_AMT,  --총 납입금액  (36:납부기간 파라미터 값) 
     SS.SALE_CD,             --판매상품코드                           
     SS.SALE_NM,             --판매상품명                             
     '3' AS PRDT_GRP,
     '7' AS PRDT_GRP_DTL,
     '고객님을 위한 일시불 상품입니다.' AS BIGO
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (
         SELECT 
             SUM(BB.SERV_CNT * AA.SERV_AMT)  AS SERV_AMT_SUM                           -- 서비스횟수별 최종금액
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      A.SERV_INF_YN,
                      B.SERV_AMT, 
                      B.SERV_INF_AMT                        
                 FROM RTSD0028 A, RTSD0043 B
                WHERE A.PRS_DCD = B.PRS_DCD) AA,   
              (SELECT PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE PERIOD_CD != 'ZZ'
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND BB.PERIOD_CD = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd) --36:납부기간 파마미터 값
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd)) -- 02:타이어본수 파라미터 값
         ) AS ADD_RENT_AMT,
         S.CD
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS SALE_NM,
              T3.CD
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTCM0051 T3
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width -- 단면폭              
            AND T.ASPECT_RATIO     = v_Aspect_Ratio  -- 편평비              
            AND T.WHEEL_INCHES     = v_Wheel_Inches  -- 인치               
            AND T.PLY_RATING       = v_Ply_Rating    -- PR(강도)           
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd        -- 타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd     -- 납부기간
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = (CASE WHEN T3.CD = 'S05' THEN '0008' ELSE '0002' END)
            AND T2.SALE_CD         = T3.CD_NM
            AND T3.CD_GRP_CD       = 'S220'
            AND T3.CD              IN ('S05', 'S07')
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;
    */
    
  END sRtsd0005ShopPayAmt;
   
  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 알뜰, 표준, 무한, 슈퍼
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopTotAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
SELECT
     SS.RENT_AMT,           /* 기본 월 렌탈료 */
     SS.ADD_RENT_AMT,       /* 추가렌탈료     */
     NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0) AS TOTAL_AMT, /* 총렌탈료       */
--     SS.TOTAL_AMT,          /* 총렌탈료       */
     SS.REGI_AMT,           /* 렌탈등록비     */
--     SS.DC_AMT,             /* 할인액         */
     CASE WHEN SS.DC_RATE = 0 THEN NVL(SS.DC_AMT,0)
     ELSE TRUNC(NVL(SS.ADD_RENT_AMT * SS.DC_RATE/100,0) + NVL(SS.DC_AMT,0), -1)
     END AS DC_AMT, /* 할인액         */
     ((NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0))*v_Period_cd)+NVL(SS.REGI_AMT,0) AS TOTAL_RENT_AMT, /* 총 납입금액  (36:납부기간 파라미터 값) */
--     TRUNC((NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1)  AS TOTAL_RENT_AMT, /* 총 납입금액  (36:납부기간 파라미터 값) */
     SS.SALE_CD,            /* 판매상품코드                           */
     SS.SALE_NM,             /* 판매상품명                             */
     SS.PRDT_GRP,
     SS.PRDT_GRP_DTL,
     SS.CONTENTS,
     SS.HASH_TAG1,              /* 해쉬태그1 */
     SS.HASH_TAG2,              /* 해쉬태그2 */
     SS.HASH_TAG3,              /* 해쉬태그3 */
     SS.HASH_TAG4               /* 해쉬태그4 */
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (SELECT DC_RATE FROM RTSD0020 WHERE SALE_CD = S.SALE_CD) AS DC_RATE,
         (
         SELECT SUM(DECODE(BB.SERV_CNT, 1, AA.SERV_AMT_1,
                                2, AA.SERV_AMT_2,
                                3, AA.SERV_AMT_3,
                                4, AA.SERV_AMT_4,
                                5, AA.SERV_AMT_5,
                                6, AA.SERV_AMT_6,
                                7, AA.SERV_AMT_7,
                                8, AA.SERV_AMT_8,
                                9, AA.SERV_AMT_9,
                                10, AA.SERV_AMT_10)) AS SERV_AMT 
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      A.SEQ,    --[20191001_01] SEQ컬럼 추가
                      B.SEQ,    --[20191001_01] SEQ컬럼 추가
                      B.SERV_AMT_1, 
                      B.SERV_AMT_2, 
                      B.SERV_AMT_3, 
                      B.SERV_AMT_4, 
                      B.SERV_AMT_5, 
                      B.SERV_AMT_6, 
                      B.SERV_AMT_7, 
                      B.SERV_AMT_8, 
                      B.SERV_AMT_9, 
                      B.SERV_AMT_10                        
                 FROM RTSD0028 A, 
                      (
                      SELECT
                          T.PRS_DCD 
                          ,T.PERIOD_CD
                          ,T.SEQ    --[20191001_01] SEQ컬럼 추가
                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                      FROM RTSD0043 T
                      WHERE 1=1
                      AND T.PERIOD_CD = DECODE(v_Period_cd, NULL, T.PERIOD_CD, v_Period_cd)
                      GROUP BY T.PRS_DCD,T.PERIOD_CD, T.SEQ --[20191001_01] SEQ컬럼 추가
                      ) B
                WHERE A.PRS_DCD = B.PRS_DCD
                AND A.SEQ = B.SEQ) AA,  --[20191001_01] SEQ컬럼 추가   
              (SELECT PS_CD,
                      PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE 1=1
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PS_CD,PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD           = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND AA.SALE_CD           = BB.PS_CD
           AND BB.PERIOD_CD         = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd)
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd))
         ) AS ADD_RENT_AMT,
         S.CONTENTS,
         S.PRDT_GRP,
         S.PRDT_GRP_DTL,
         S.HASH_TAG1,
         S.HASH_TAG2,
         S.HASH_TAG3,
         S.HASH_TAG4
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              T3.SALE_NM,
              T3.CONTENTS,
              T3.PRDT_GRP,
              T3.PRDT_GRP_DTL,
              T4.CHAN_CD,
              T3.HASH_TAG1,
              T3.HASH_TAG2,
              T3.HASH_TAG3,
              T3.HASH_TAG4
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTSD0020 T3, RTSD0045 T4
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width -- 단면폭            
            AND T.ASPECT_RATIO     = v_Aspect_Ratio  -- 편평비              
            AND T.WHEEL_INCHES     = v_Wheel_Inches  -- 인치                
            AND T.PLY_RATING       = v_Ply_Rating    -- PR(강도)            
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd        -- 타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd     -- 납부기간
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = '0002'
            AND T2.SALE_CD         = T3.SALE_CD
            AND T3.PRDT_GRP        = '01'        --판매유형 Lv1
            AND T3.PRDT_GRP_DTL    = '01'        --판매유형 Lv2
            AND T3.SALE_CD         = T4.SALE_CD
            AND T4.CHAN_CD         IN('02')    --채널구분
            AND T3.USE_YN          = 'Y'
            AND T3.SALE_STR_DAY     <= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND T3.SALE_END_DAY     >= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS
    ORDER BY TOTAL_AMT;        
    
    /*
    SELECT
     SS.RENT_AMT,           -- 기본 월 렌탈료 
     CASE WHEN SS.CD != 'S05' THEN SS.ADD_RENT_AMT
     ELSE 0
     END ADD_RENT_AMT,      -- 추가렌탈료    
     SS.TOTAL_AMT,          -- 총렌탈료      
     SS.REGI_AMT,           -- 렌탈등록비     
     SS.DC_AMT,             -- 할인액         
     CASE WHEN SS.CD != 'S05' THEN TRUNC((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1) 
     ELSE TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0))-NVL(SS.DC_AMT,0)),-1)
     END AS TOTAL_RENT_AMT,  --총 납입금액  (36:납부기간 파라미터 값) 
     SS.SALE_CD,             --판매상품코드                          
     SS.SALE_NM,             --판매상품명                             
     '1' AS PRDT_GRP,
     '1' AS PRDT_GRP_DTL,
     '고객님을 위한 렌탈 상품입니다.' AS BIGO
    FROM (  
        SELECT
         CASE WHEN S.CD='S02' THEN SUM(NVL(S.AMT,0)+3000) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM((NVL(S.AMT,0)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM(((NVL(S.AMT,0)+3000)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)) OVER (PARTITION BY S.SALE_CD) 
         END AS RENT_AMT,
         CASE WHEN S.CD='S02' THEN SUM((NVL(S.AMT,0)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM(((NVL(S.AMT,0)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM((((NVL(S.AMT,0)+3000)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
         END AS TOTAL_AMT,
         --SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         --SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (
         SELECT 
             SUM(BB.SERV_CNT * AA.SERV_AMT)  AS SERV_AMT_SUM                           -- 서비스횟수별 최종금액
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      A.SERV_INF_YN,
                      B.SERV_AMT, 
                      B.SERV_INF_AMT                        
                 FROM RTSD0028 A, RTSD0043 B
                WHERE A.PRS_DCD = B.PRS_DCD) AA,   
              (SELECT PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE PERIOD_CD != 'ZZ'
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND BB.PERIOD_CD = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd) --36:납부기간 파마미터 값
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd)) -- 02:타이어본수 파라미터 값
         ) AS ADD_RENT_AMT,
         S.CD
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS SALE_NM,
              T3.CD
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTCM0051 T3
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width -- 단면폭            
            AND T.ASPECT_RATIO     = v_Aspect_Ratio  -- 편평비              
            AND T.WHEEL_INCHES     = v_Wheel_Inches  -- 인치                
            AND T.PLY_RATING       = v_Ply_Rating    -- PR(강도)            
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd        -- 타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd     -- 납부기간
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = (CASE WHEN T3.CD = 'S05' THEN '0008' ELSE '0002' END)
            AND T2.SALE_CD         = T3.CD_NM
            AND T3.CD_GRP_CD       = 'S220'
            AND T3.CD              NOT IN ('S05', 'S06', 'S07')
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;
    */
  END sRtsd0005ShopTotAmt;
  
  /*****************************************************************************
  --업무용앱 금액산출 계산 - 알뜰, 표준, 무한, 슈퍼
  *****************************************************************************/
  PROCEDURE sRtsd0005MobTotAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
SELECT
     SS.RENT_AMT,           /* 기본 월 렌탈료 */
     SS.ADD_RENT_AMT,       /* 추가렌탈료     */
     NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0) AS TOTAL_AMT, /* 총렌탈료       */
--     SS.TOTAL_AMT,          /* 총렌탈료       */
     SS.REGI_AMT,           /* 렌탈등록비     */
--     SS.DC_AMT,             /* 할인액         */
     CASE WHEN SS.DC_RATE = 0 THEN NVL(SS.DC_AMT,0)
     ELSE TRUNC(NVL(SS.DC_AMT,0), -1)
     END AS DC_AMT, /* 할인액         */
     CASE WHEN SS.DC_RATE = 0 THEN 0        --[20220106_01] kstka 정액할인인경우 서비스료에는 미포함
     ELSE TRUNC(NVL(SS.ADD_RENT_AMT * SS.DC_RATE/100,0), -1)
     END AS ADD_DC_AMT, /* 서비스 할인액         */
     ((NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0))*v_Period_cd)+NVL(SS.REGI_AMT,0) AS TOTAL_RENT_AMT, /* 총 납입금액  (36:납부기간 파라미터 값) */
--     TRUNC((NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1)  AS TOTAL_RENT_AMT, /* 총 납입금액  (36:납부기간 파라미터 값) */
     SS.SALE_CD,            /* 판매상품코드                           */
     SS.SALE_NM,             /* 판매상품명                             */
     SS.PRDT_GRP,
     SS.PRDT_GRP_DTL,
     SS.CONTENTS,
     SS.HASH_TAG1,              /* 해쉬태그1 */
     SS.HASH_TAG2,              /* 해쉬태그2 */
     SS.HASH_TAG3,              /* 해쉬태그3 */
     SS.HASH_TAG4               /* 해쉬태그4 */
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (SELECT DC_RATE FROM RTSD0020 WHERE SALE_CD = S.SALE_CD) AS DC_RATE,
         (
         SELECT SUM(DECODE(BB.SERV_CNT, 1, AA.SERV_AMT_1,
                                2, AA.SERV_AMT_2,
                                3, AA.SERV_AMT_3,
                                4, AA.SERV_AMT_4,
                                5, AA.SERV_AMT_5,
                                6, AA.SERV_AMT_6,
                                7, AA.SERV_AMT_7,
                                8, AA.SERV_AMT_8,
                                9, AA.SERV_AMT_9,
                                10, AA.SERV_AMT_10)) AS SERV_AMT 
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      A.SEQ,    --[20191001_01] SEQ컬럼 추가
                      B.SEQ,    --[20191001_01] SEQ컬럼 추가
                      B.SERV_AMT_1, 
                      B.SERV_AMT_2, 
                      B.SERV_AMT_3, 
                      B.SERV_AMT_4, 
                      B.SERV_AMT_5, 
                      B.SERV_AMT_6, 
                      B.SERV_AMT_7, 
                      B.SERV_AMT_8, 
                      B.SERV_AMT_9, 
                      B.SERV_AMT_10                        
                 FROM RTSD0028 A, 
                      (
                      SELECT
                          T.PRS_DCD 
                          ,T.PERIOD_CD
                          ,T.SEQ    --[20191001_01] SEQ컬럼 추가
                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                      FROM RTSD0043 T
                      WHERE 1=1
                      AND T.PERIOD_CD = DECODE(v_Period_cd, NULL, T.PERIOD_CD, v_Period_cd)
                      GROUP BY T.PRS_DCD,T.PERIOD_CD, T.SEQ --[20191001_01] SEQ컬럼 추가
                      ) B
                WHERE A.PRS_DCD = B.PRS_DCD
                AND A.SEQ = B.SEQ) AA,  --[20191001_01] SEQ컬럼 추가   
              (SELECT PS_CD,
                      PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE 1=1
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PS_CD,PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD           = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND AA.SALE_CD           = BB.PS_CD
           AND BB.PERIOD_CD         = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd)
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd))
         ) AS ADD_RENT_AMT,
         S.CONTENTS,
         S.PRDT_GRP,
         S.PRDT_GRP_DTL,
         S.HASH_TAG1,
         S.HASH_TAG2,
         S.HASH_TAG3,
         S.HASH_TAG4
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              T3.SALE_NM,
              T3.CONTENTS,
              T3.PRDT_GRP,
              T3.PRDT_GRP_DTL,
              T4.CHAN_CD,
              T3.HASH_TAG1,
              T3.HASH_TAG2,
              T3.HASH_TAG3,
              T3.HASH_TAG4
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTSD0020 T3, RTSD0045 T4
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width -- 단면폭            
            AND T.ASPECT_RATIO     = v_Aspect_Ratio  -- 편평비              
            AND T.WHEEL_INCHES     = v_Wheel_Inches  -- 인치                
            AND T.PLY_RATING       = v_Ply_Rating    -- PR(강도)            
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd        -- 타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd     -- 납부기간
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = '0002'
            AND T2.SALE_CD         = T3.SALE_CD
            AND T3.PRDT_GRP        = '01'        --판매유형 Lv1
            AND T3.PRDT_GRP_DTL    = '01'        --판매유형 Lv2
            AND T3.SALE_CD         = T4.SALE_CD
            AND T4.CHAN_CD         IN('01')    --채널구분
            AND T3.USE_YN          = 'Y'
            AND T3.SALE_STR_DAY     <= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND T3.SALE_END_DAY     >= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS
    ORDER BY TOTAL_AMT;        

  END sRtsd0005MobTotAmt;  

  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 자유렌탈
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopFreeRentAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Add_RentAmt    IN NUMBER,                         /* 프리미엄서비스 합계금액(추가렌탈료) */
    v_Regi_Amt       IN NUMBER,                         /* 렌탈등록비 */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
     SELECT
--     SS.RENT_AMT,                                                                                           /* 기본 월 렌탈료 */
     TRUNC(((NVL(SS.RENT_AMT,0))*v_Period_cd+NVL(SS.BASIC_REGI_AMT,0)-NVL(v_Regi_Amt,0))/v_Period_cd,-1) AS RENT_AMT,
     NVL(v_Add_RentAmt,0) AS ADD_RENT_AMT,                                                                  /* 추가렌탈료     */
--     NVL(SS.RENT_AMT,0)+NVL(v_Add_RentAmt,0) AS TOTAL_AMT,                                                  /* 총렌탈료       */
     TRUNC(((NVL(SS.RENT_AMT,0)+NVL(v_Add_RentAmt,0))*v_Period_cd+NVL(SS.BASIC_REGI_AMT,0)-NVL(v_Regi_Amt,0))/v_Period_cd,-1) AS TOTAL_AMT,
--     SS.TOTAL_AMT,                                                                                        /* 총렌탈료       */
     NVL(v_Regi_Amt,0) AS REGI_AMT,                                                                         /* 렌탈등록비     */
--     SS.DC_AMT,                                                                                           /* 할인액         */
     CASE WHEN SS.DC_RATE = 0 THEN NVL(SS.DC_AMT,0)
     ELSE TRUNC(NVL(NVL(v_Add_RentAmt,0) * SS.DC_RATE/100,0) + NVL(SS.DC_AMT,0), -1)
     END AS DC_AMT,                                                                                         /* 할인액 */
--     ((NVL(SS.RENT_AMT,0)+NVL(v_Add_RentAmt,0))*v_Period_cd)+NVL(SS.BASIC_REGI_AMT,0)-NVL(v_Regi_Amt,0) AS TOTAL_RENT_AMT,           /* 총 납입금액  */ [20190423_01] 총렌탈료 계산시 등록비 포함
     ((NVL(SS.RENT_AMT,0)+NVL(v_Add_RentAmt,0))*v_Period_cd)+NVL(SS.BASIC_REGI_AMT,0) AS TOTAL_RENT_AMT_ORG,           /* 총 납입금액  */ 
     (TRUNC(((NVL(SS.RENT_AMT,0))*v_Period_cd+NVL(SS.BASIC_REGI_AMT,0)-NVL(v_Regi_Amt,0))/v_Period_cd,-1) + NVL(v_Add_RentAmt,0)) * v_Period_cd + NVL(v_Regi_Amt,0) AS TOTAL_RENT_AMT,  /* 총 납입금액  */ 
--     TRUNC((NVL(v_Add_RentAmt,0)+NVL(SS.TOTAL_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1) AS TOTAL_RENT_AMT, /* 총 납입금액  (36:납부기간 파라미터 값) */
     SS.SALE_CD,                                                                                            /* 판매상품코드 */
     SS.SALE_NM,                                                                                            /* 판매상품명   */
     SS.PRDT_GRP,
     SS.PRDT_GRP_DTL,
     SS.CONTENTS,
     SS.HASH_TAG1,              /* 해쉬태그1 */
     SS.HASH_TAG2,              /* 해쉬태그2 */
     SS.HASH_TAG3,              /* 해쉬태그3 */
     SS.HASH_TAG4               /* 해쉬태그4 */
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.DC_RATE,
         S.SALE_CD,
         S.SALE_NM,
         S.PRDT_GRP,
         S.PRDT_GRP_DTL,
         S.CONTENTS,
         S.HASH_TAG1,
         S.HASH_TAG2,
         S.HASH_TAG3,
         S.HASH_TAG4,
         S.BASIC_REGI_AMT
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              T3.DC_RATE,
              (SELECT A.AMT FROM RTSD0029 A 
               WHERE A.SALE_CD = T3.SALE_CD
               AND   '0'||A.CNT_CD = T1.CNT_CD) AS BASIC_REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              T3.SALE_NM,
              T3.PRDT_GRP,
              T3.PRDT_GRP_DTL,
              T3.CONTENTS,
              T3.HASH_TAG1,
              T3.HASH_TAG2,
              T3.HASH_TAG3,
              T3.HASH_TAG4
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTSD0020 T3, RTSD0045 T4
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width    /* 단면폭              */
            AND T.ASPECT_RATIO     = v_Aspect_Ratio     /* 편평비              */
            AND T.WHEEL_INCHES     = v_Wheel_Inches     /* 인치                */
            AND T.PLY_RATING       = v_Ply_Rating       /* PR(강도)            */
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd           /* 타이어본수 파라미터 값 */
            AND T1.PERIOD_CD       = v_Period_cd        /* 납부기간*/
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = '0002'
            AND T2.SALE_CD         = T3.SALE_CD
            AND T3.PRDT_GRP        = '01'        --판매유형 Lv1
            AND T3.PRDT_GRP_DTL    = '04'        --판매유형 Lv2
            AND T3.SALE_CD         = T4.SALE_CD
            AND T4.CHAN_CD         IN('02')    --채널구분
            AND T3.USE_YN          = 'Y'
            AND T3.SALE_STR_DAY     <= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND T3.SALE_END_DAY     >= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;

    /*
    SELECT
     SS.RENT_AMT,                                                                                   -- 기본 월 렌탈료 
     v_Add_RentAmt AS ADD_RENT_AMT,                                                                 -- 추가렌탈료     
     SS.TOTAL_AMT,                                                                                  -- 총렌탈료       
     v_Regi_Amt AS REGI_AMT,                                                                        -- 렌탈등록비     
     SS.DC_AMT,                                                                                     -- 할인액         
     TRUNC((v_Regi_Amt+v_Add_RentAmt+NVL(SS.TOTAL_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1) AS TOTAL_RENT_AMT,   -- 총 납입금액  (36:납부기간 파라미터 값) 
     SS.SALE_CD,                                                                                    -- 판매상품코드 
     SS.SALE_NM,                                                                                    -- 판매상품명   
     '1' AS PRDT_GRP,
     '1' AS PRDT_GRP_DTL,
     '고객님을 위한 자유렌탈 상품입니다.' AS BIGO
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         S.CD
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS SALE_NM,
              T3.CD
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTCM0051 T3
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width     --단면폭              
            AND T.ASPECT_RATIO     = v_Aspect_Ratio      --편평비              
            AND T.WHEEL_INCHES     = v_Wheel_Inches      --인치               
            AND T.PLY_RATING       = v_Ply_Rating        --PR(강도)           
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd            --타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd         --납부기간
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = '0002'
            AND T2.SALE_CD         = T3.CD_NM
            AND T3.CD_GRP_CD       = 'S220'
            AND T3.CD              = 'S06'
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;
    */
  END sRtsd0005ShopFreeRentAmt;
  
  /*****************************************************************************
  --업무용앱  금액산출 계산 - 자유렌탈
  *****************************************************************************/
  PROCEDURE sRtsd0005MobFreeRentAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Add_RentAmt    IN NUMBER,                         /* 프리미엄서비스 합계금액(추가렌탈료) */
    v_Regi_Amt       IN NUMBER,                         /* 렌탈등록비 */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
     SELECT
--     SS.RENT_AMT,                                                                                           /* 기본 월 렌탈료 */
     TRUNC(((NVL(SS.RENT_AMT,0))*v_Period_cd+NVL(SS.BASIC_REGI_AMT,0)-NVL(v_Regi_Amt,0))/v_Period_cd,-1) AS RENT_AMT,
     NVL(v_Add_RentAmt,0) AS ADD_RENT_AMT,                                                                  /* 추가렌탈료     */
--     NVL(SS.RENT_AMT,0)+NVL(v_Add_RentAmt,0) AS TOTAL_AMT,                                                  /* 총렌탈료       */
     TRUNC(((NVL(SS.RENT_AMT,0)+NVL(v_Add_RentAmt,0))*v_Period_cd+NVL(SS.BASIC_REGI_AMT,0)-NVL(v_Regi_Amt,0))/v_Period_cd,-1) AS TOTAL_AMT,
--     SS.TOTAL_AMT,                                                                                        /* 총렌탈료       */
     NVL(v_Regi_Amt,0) AS REGI_AMT,                                                                         /* 렌탈등록비     */
--     SS.DC_AMT,                                                                                           /* 할인액         */
     CASE WHEN SS.DC_RATE = 0 THEN NVL(SS.DC_AMT,0)
     ELSE TRUNC(NVL(NVL(v_Add_RentAmt,0) * SS.DC_RATE/100,0) + NVL(SS.DC_AMT,0), -1)
     END AS DC_AMT,                                                                                         /* 할인액 */
--     ((NVL(SS.RENT_AMT,0)+NVL(v_Add_RentAmt,0))*v_Period_cd)+NVL(SS.BASIC_REGI_AMT,0)-NVL(v_Regi_Amt,0) AS TOTAL_RENT_AMT,           /* 총 납입금액  */ [20190423_01] 총렌탈료 계산시 등록비 포함
     ((NVL(SS.RENT_AMT,0)+NVL(v_Add_RentAmt,0))*v_Period_cd)+NVL(SS.BASIC_REGI_AMT,0) AS TOTAL_RENT_AMT_ORG,           /* 총 납입금액  */ 
     (TRUNC(((NVL(SS.RENT_AMT,0))*v_Period_cd+NVL(SS.BASIC_REGI_AMT,0)-NVL(v_Regi_Amt,0))/v_Period_cd,-1) + NVL(v_Add_RentAmt,0)) * v_Period_cd + NVL(v_Regi_Amt,0) AS TOTAL_RENT_AMT,  /* 총 납입금액  */ 
--     TRUNC((NVL(v_Add_RentAmt,0)+NVL(SS.TOTAL_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1) AS TOTAL_RENT_AMT, /* 총 납입금액  (36:납부기간 파라미터 값) */
     SS.SALE_CD,                                                                                            /* 판매상품코드 */
     SS.SALE_NM,                                                                                            /* 판매상품명   */
     SS.PRDT_GRP,
     SS.PRDT_GRP_DTL,
     SS.CONTENTS,
     SS.HASH_TAG1,              /* 해쉬태그1 */
     SS.HASH_TAG2,              /* 해쉬태그2 */
     SS.HASH_TAG3,              /* 해쉬태그3 */
     SS.HASH_TAG4               /* 해쉬태그4 */
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.DC_RATE,
         S.SALE_CD,
         S.SALE_NM,
         S.PRDT_GRP,
         S.PRDT_GRP_DTL,
         S.CONTENTS,
         S.HASH_TAG1,
         S.HASH_TAG2,
         S.HASH_TAG3,
         S.HASH_TAG4,
         S.BASIC_REGI_AMT
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              T3.DC_RATE,
              (SELECT A.AMT FROM RTSD0029 A 
               WHERE A.SALE_CD = T3.SALE_CD
               AND   '0'||A.CNT_CD = T1.CNT_CD) AS BASIC_REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              T3.SALE_NM,
              T3.PRDT_GRP,
              T3.PRDT_GRP_DTL,
              T3.CONTENTS,
              T3.HASH_TAG1,
              T3.HASH_TAG2,
              T3.HASH_TAG3,
              T3.HASH_TAG4
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTSD0020 T3, RTSD0045 T4
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width    /* 단면폭              */
            AND T.ASPECT_RATIO     = v_Aspect_Ratio     /* 편평비              */
            AND T.WHEEL_INCHES     = v_Wheel_Inches     /* 인치                */
            AND T.PLY_RATING       = v_Ply_Rating       /* PR(강도)            */
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd           /* 타이어본수 파라미터 값 */
            AND T1.PERIOD_CD       = v_Period_cd        /* 납부기간*/
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = '0002'
            AND T2.SALE_CD         = T3.SALE_CD
            AND T3.PRDT_GRP        = '01'        --판매유형 Lv1
            AND T3.PRDT_GRP_DTL    = '04'        --판매유형 Lv2
            AND T3.SALE_CD         = T4.SALE_CD
            AND T4.CHAN_CD         IN('01')    --채널구분
            AND T3.USE_YN          = 'Y'
            AND T3.SALE_STR_DAY     <= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND T3.SALE_END_DAY     >= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;
    
  END sRtsd0005MobFreeRentAmt;

  /*****************************************************************************
  --쇼핑몰 판매상품 별 금액산출 계산 - 알뜰, 표준, 무한, 슈퍼, 일시불(자유렌탈 제외)
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE,        /* 기간 */
    v_Sale_cd        IN RTSD0021.SALE_CD%TYPE           /* 판매상품코드 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    SELECT
     CASE WHEN SS.PRDT_GRP_DTL NOT IN ('07','08') THEN SS.RENT_AMT           
     ELSE 0
     END AS RENT_AMT,   /* 기본 월 렌탈료 */
     CASE WHEN SS.PRDT_GRP_DTL NOT IN ('07') THEN NVL(SS.ADD_RENT_AMT,0)
     ELSE 0
     END ADD_RENT_AMT,       /* 추가렌탈료     */
     CASE WHEN SS.PRDT_GRP_DTL NOT IN ('07','08') THEN NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0)
     ELSE 0
     END AS TOTAL_AMT,      /* 총렌탈료       */
     CASE WHEN SS.PRDT_GRP_DTL NOT IN ('07','08') THEN SS.REGI_AMT
     ELSE CASE WHEN SS.PRDT_GRP_DTL = '07' THEN TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))-NVL(SS.DC_AMT*v_Period_cd,0)),-1)
          ELSE CASE WHEN SS.DC_RATE = 0 THEN TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT*v_Period_cd,0))-NVL(SS.DC_AMT*v_Period_cd,0)),-1)
               ELSE TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT*v_Period_cd,0))-TRUNC(NVL(SS.ADD_RENT_AMT * SS.DC_RATE/100,0)*v_Period_cd + NVL(SS.DC_AMT*v_Period_cd,0), -1)),-1)
               END
          END
     END AS REGI_AMT, /* 렌탈등록비     */
     CASE WHEN SS.PRDT_GRP_DTL NOT IN ('07','08') THEN CASE WHEN SS.DC_RATE = 0 THEN NVL(SS.DC_AMT,0)
                                                       ELSE TRUNC(NVL(SS.ADD_RENT_AMT * SS.DC_RATE/100,0) + NVL(SS.DC_AMT,0), -1)
                                                       END
     ELSE 0
     END DC_AMT,             /* 할인액         */
     CASE WHEN SS.PRDT_GRP_DTL IN ('02') THEN ((NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0))*v_Period_cd)+NVL(SS.REGI_AMT,0)-(NVL(SS.RENT_AMT, 0)*EXCEPT_CNT)
             WHEN SS.PRDT_GRP_DTL NOT IN ('07','08') THEN ((NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0))*v_Period_cd)+NVL(SS.REGI_AMT,0)             
     ELSE 0
     END AS TOTAL_RENT_AMT, /* 총 납입금액   */
--     CASE WHEN SS.PRDT_GRP_DTL NOT IN ('07','08') THEN TRUNC((NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1) 
--     ELSE 0
--     END AS TOTAL_RENT_AMT, /* 총 납입금액  (36:납부기간 파라미터 값) */
     SS.SALE_CD,            /* 판매상품코드                           */
     SS.SALE_NM,             /* 판매상품명                             */
     SS.PRDT_GRP,
     SS.PRDT_GRP_DTL,
     SS.CONTENTS,
     SS.HASH_TAG1,              /* 해쉬태그1 */
     SS.HASH_TAG2,              /* 해쉬태그2 */
     SS.HASH_TAG3,              /* 해쉬태그3 */
     SS.HASH_TAG4               /* 해쉬태그4 */
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         S.DC_RATE,
         (SELECT COUNT(*) FROM RTSD0044 WHERE SALE_CD = S.SALE_CD) AS EXCEPT_CNT,
         (
         SELECT SUM(DECODE(BB.SERV_CNT, 1, AA.SERV_AMT_1,
                                2, AA.SERV_AMT_2,
                                3, AA.SERV_AMT_3,
                                4, AA.SERV_AMT_4,
                                5, AA.SERV_AMT_5,
                                6, AA.SERV_AMT_6,
                                7, AA.SERV_AMT_7,
                                8, AA.SERV_AMT_8,
                                9, AA.SERV_AMT_9,
                                10, AA.SERV_AMT_10)) AS SERV_AMT 
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      B.SERV_AMT_1, 
                      B.SERV_AMT_2, 
                      B.SERV_AMT_3, 
                      B.SERV_AMT_4, 
                      B.SERV_AMT_5, 
                      B.SERV_AMT_6, 
                      B.SERV_AMT_7, 
                      B.SERV_AMT_8, 
                      B.SERV_AMT_9, 
                      B.SERV_AMT_10                        
                 FROM RTSD0028 A, 
                      (
                      SELECT
                          T.PRS_DCD 
                          ,T.PERIOD_CD
                          ,T.SEQ    --[20191001_01] SEQ컬럼추가
                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                      FROM RTSD0043 T
                      WHERE 1=1
                      AND T.PERIOD_CD = DECODE(v_Period_cd, NULL, T.PERIOD_CD, v_Period_cd)
                      GROUP BY T.PRS_DCD,T.PERIOD_CD, T.SEQ --[20191001_01] SEQ컬럼 추가
                      ) B
                WHERE A.PRS_DCD = B.PRS_DCD
                AND A.SEQ = B.SEQ) AA,  --[20191001_01] SEQ컬럼추가   
              (SELECT PS_CD,
                      PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE 1=1
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD           = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND AA.SALE_CD           = BB.PS_CD
           AND BB.PERIOD_CD         = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd)
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd))
         ) AS ADD_RENT_AMT,
         S.PRDT_GRP,
         S.PRDT_GRP_DTL,
         S.CONTENTS,
         S.HASH_TAG1,
         S.HASH_TAG2,
         S.HASH_TAG3,
         S.HASH_TAG4
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              T3.DC_RATE,
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS SALE_NM,
              T3.PRDT_GRP,
              T3.PRDT_GRP_DTL,
              T3.CONTENTS,
              T3.HASH_TAG1,
              T3.HASH_TAG2,
              T3.HASH_TAG3,
              T3.HASH_TAG4
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTSD0020 T3, RTSD0045 T4
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width  --단면폭              
            AND T.ASPECT_RATIO     = v_Aspect_Ratio   --편평비              
            AND T.WHEEL_INCHES     = v_Wheel_Inches   --인치                
            AND T.PLY_RATING       = v_Ply_Rating     --PR(강도)            
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd         --타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd      --납부기간
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD 
            AND T1.PRICE_CD        = (SELECT CASE WHEN PRDT_GRP_DTL = '02' THEN '0003' ELSE '0002' END FROM RTSD0020 WHERE SALE_CD = v_Sale_cd)
            AND T2.SALE_CD         = T3.SALE_CD
            AND T3.PRDT_GRP        = (SELECT AA.PRDT_GRP FROM RTSD0020 AA WHERE AA.SALE_CD = v_Sale_cd AND AA.USE_YN = 'Y')       --판매유형 Lv1
            AND T3.PRDT_GRP_DTL    = (SELECT AA.PRDT_GRP_DTL FROM RTSD0020 AA WHERE AA.SALE_CD = v_Sale_cd AND AA.USE_YN = 'Y')        --판매유형 Lv2
            AND T3.SALE_CD         = T4.SALE_CD
            AND T4.CHAN_CD         IN('02')    --채널구분
            AND T2.SALE_CD         = v_Sale_cd
            AND T3.USE_YN          = 'Y'
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;
    
    /*
    SELECT
     SS.RENT_AMT,           -- 기본 월 렌탈료 
     CASE WHEN SS.CD NOT IN ('S05','S07') THEN NVL(SS.ADD_RENT_AMT,0)
     ELSE 0
     END ADD_RENT_AMT,      --  추가렌탈료    
     SS.TOTAL_AMT,          -- 총렌탈료      
     SS.REGI_AMT,            --렌탈등록비     
     SS.DC_AMT,              --할인액         
     CASE WHEN SS.CD NOT IN ('S05','S07') THEN TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))-NVL(SS.DC_AMT,0))/v_Period_cd,-1) 
     ELSE CASE WHEN SS.CD = 'S05' THEN TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0))-NVL(SS.DC_AMT,0)),-1)
          ELSE TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))-NVL(SS.DC_AMT,0)),-1)
          END
     END AS TOTAL_RENT_AMT, -- 총 납입금액  (36:납부기간 파라미터 값) 
     SS.SALE_CD,            -- 판매상품코드                           
     SS.SALE_NM,            -- 판매상품명                             
     '1' AS PRDT_GRP,
     '1' AS PRDT_GRP_DTL,
     '고객님을 위한 렌탈 상품입니다.' AS BIGO
    FROM (  
        SELECT
         CASE WHEN S.CD='S02' THEN SUM(NVL(S.AMT,0)+3000) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM((NVL(S.AMT,0)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM(((NVL(S.AMT,0)+3000)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)) OVER (PARTITION BY S.SALE_CD) 
         END AS RENT_AMT,
         CASE WHEN S.CD='S02' THEN SUM((NVL(S.AMT,0)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM(((NVL(S.AMT,0)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM((((NVL(S.AMT,0)+3000)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
         END AS TOTAL_AMT,
--         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
--         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (
         SELECT 
             SUM(BB.SERV_CNT * AA.SERV_AMT)  AS SERV_AMT_SUM                           -- 서비스횟수별 최종금액
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      A.SERV_INF_YN,
                      B.SERV_AMT, 
                      B.SERV_INF_AMT                        
                 FROM RTSD0028 A, RTSD0043 B
                WHERE A.PRS_DCD = B.PRS_DCD) AA,   
              (SELECT PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE PERIOD_CD != 'ZZ'
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND BB.PERIOD_CD = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd) --36:납부기간 파마미터 값
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd)) -- 02:타이어본수 파라미터 값
         ) AS ADD_RENT_AMT,
         S.CD
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS SALE_NM,
              T3.CD
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTCM0051 T3
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width  --단면폭              
            AND T.ASPECT_RATIO     = v_Aspect_Ratio   --편평비              
            AND T.WHEEL_INCHES     = v_Wheel_Inches   --인치                
            AND T.PLY_RATING       = v_Ply_Rating     --PR(강도)            
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd         --타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd      --납부기간
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = (CASE WHEN T3.CD IN('S05','S07') THEN '0008' ELSE '0002' END)
            AND T2.SALE_CD         = T3.CD_NM
            AND T3.CD_GRP_CD       = 'S220'
            AND T3.CD              != 'S06'
            AND T2.SALE_CD         = v_Sale_cd
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;
   */
  END sRtsd0005ShopAmt;

  /*****************************************************************************
  --쇼핑몰 판매상품 별 프리미엄 서비스 금액
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopMemberShip (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cnt_cd         IN RTSD0012.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0012.PERIOD_CD%TYPE,        /* 납부기간 */
    v_Sale_cd        IN RTSD0021.SALE_CD%TYPE           /* 판매상품코드 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR

    SELECT 
             AA.SALE_CD,                                                                    /* 판매상품코드 */
             (SELECT A.SALE_NM  FROM RTSD0020 A WHERE A.SALE_CD = AA.SALE_CD) AS SALE_NM,   /* 판매상품명 */
             AA.PRS_DCD,                                                                    /* 프리미엄 서비스 코드 */
             Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM,                /* 프리미엄 서비스명 */
             BB.PERIOD_CD,                                                                  /* 기간 */
             BB.CNT_CD,                                                                     /* 본수 */
             BB.SERV_CNT,                                                                   /* 프리미엄 서비스별 제공 횟수 */
--             AA.SERV_AMT AS SERV_AMT,                                                       /* 프리미엄 서비스별 기본제공 금액 */
             DECODE(BB.SERV_CNT, 1,  AA.SERV_AMT_1,
                                 2,  AA.SERV_AMT_2,
                                 3,  AA.SERV_AMT_3,
                                 4,  AA.SERV_AMT_4,
                                 5,  AA.SERV_AMT_5,
                                 6,  AA.SERV_AMT_6,
                                 7,  AA.SERV_AMT_7,
                                 8,  AA.SERV_AMT_8,
                                 9,  AA.SERV_AMT_9,
                                 10, AA.SERV_AMT_10,
                                 12, AA.SERV_AMT_12,
                                 18, AA.SERV_AMT_18,
                                 24, AA.SERV_AMT_24)  AS  SERV_AMT                     /* 프리미엄 서비스별 최종 금액 */
     FROM 
          (SELECT A.SALE_CD, 
                  A.PRS_DCD, 
                  A.SERV_INF_YN,
                  B.SERV_AMT_1 AS SERV_AMT, 
                  B.SERV_INF_AMT AS SERV_INF_AMT,
                  B.SERV_AMT_1,
                  B.SERV_AMT_2,
                  B.SERV_AMT_3,
                  B.SERV_AMT_4,
                  B.SERV_AMT_5,
                  B.SERV_AMT_6,
                  B.SERV_AMT_7,
                  B.SERV_AMT_8,
                  B.SERV_AMT_9,
                  B.SERV_AMT_10,
                  B.SERV_AMT_12,
                  B.SERV_AMT_18,
                  B.SERV_AMT_24
             FROM RTSD0028 A, 
                  (
                      SELECT
                          T.PRS_DCD 
                          ,T.PERIOD_CD
                          ,T.SEQ    --[20191001_01] SEQ컬럼추가
                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                          ,MAX(DECODE(T.SERV_CNT, 12, T.SERV_AMT)) AS SERV_AMT_12
                          ,MAX(DECODE(T.SERV_CNT, 18, T.SERV_AMT)) AS SERV_AMT_18
                          ,MAX(DECODE(T.SERV_CNT, 24, T.SERV_AMT)) AS SERV_AMT_24
                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                      FROM RTSD0043 T
                      WHERE 1=1
                      AND T.PERIOD_CD = DECODE(v_Period_cd, NULL, T.PERIOD_CD, v_Period_cd)
                      GROUP BY T.PRS_DCD,T.PERIOD_CD, T.SEQ --[20191001_01] SEQ컬럼 추가
                  ) B
            WHERE A.PRS_DCD = B.PRS_DCD
            AND A.SEQ = B.SEQ) AA,  --[20191001_01] SEQ컬럼추가    
          (SELECT PS_CD,
                  PRS_DCD,
                  PERIOD_CD,         
                  CNT_CD,
                  MAX(SERV_CNT) SERV_CNT
             FROM RTSD0012
            WHERE 1=1
              AND SERV_CNT != 0 
              AND USE_YN = 'Y' 
            GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) BB
     WHERE AA.PRS_DCD           = BB.PRS_DCD
       AND AA.SALE_CD           = v_Sale_cd   /* 판매상품코드    */
       AND AA.SALE_CD           = BB.PS_CD
       AND BB.PERIOD_CD         = v_Period_cd /* 납부기간        */
       AND TO_NUMBER(BB.CNT_CD) = v_Cnt_cd    /* 타이어본수      */
       ;    
     /*
     SELECT 
             AA.SALE_CD,                                                                    --판매상품코드 
             (SELECT A.SALE_NM  FROM RTSD0020 A WHERE A.SALE_CD = AA.SALE_CD) AS SALE_NM,   -- 판매상품명 
             AA.PRS_DCD,                                                                    -- 프리미엄 서비스 코드 
             Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM,                -- 프리미엄 서비스명 
             BB.PERIOD_CD,                                                                  -- 기간 
             BB.CNT_CD,                                                                     -- 본수 
             BB.SERV_CNT,                                                                   -- 프리미엄 서비스별 제공 횟수 
             AA.SERV_AMT,                                                                   -- 프리미엄 서비스별 기본제공 금액 
             SUM(BB.SERV_CNT * AA.SERV_AMT) OVER (PARTITION BY AA.PRS_DCD) AS LAST_SERV_AMT -- 프리미엄 서비스별 최종 금액 
     FROM 
          (SELECT A.SALE_CD, 
                  A.PRS_DCD, 
                  A.SERV_INF_YN,
                  B.SERV_AMT, 
                  B.SERV_INF_AMT                        
             FROM RTSD0028 A, RTSD0043 B
            WHERE A.PRS_DCD = B.PRS_DCD) AA,   
          (SELECT PRS_DCD,
                  PERIOD_CD,         
                  CNT_CD,
                  MAX(SERV_CNT) SERV_CNT
             FROM RTSD0012
            WHERE PERIOD_CD != 'ZZ'
              AND SERV_CNT != 0 
              AND USE_YN = 'Y' 
            GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) BB
     WHERE AA.PRS_DCD           = BB.PRS_DCD
       AND AA.SALE_CD           = v_Sale_cd   -- 판매상품코드   
       AND BB.PERIOD_CD         = v_Period_cd -- 납부기간     
       AND TO_NUMBER(BB.CNT_CD) = v_Cnt_cd    -- 타이어본수      
       ;
   */
    
  END sRtsd0005ShopMemberShip;

  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 알뜰, 표준, 무한, 슈퍼 - 등록비 추가
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopTotAddRegiAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE,        /* 기간 */
    v_Regi_Amt       IN NUMBER                          /* 등록비 추가 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT
     SS.RENT_AMT,           /* 기본 월 렌탈료 */
     CASE WHEN SS.CD != 'S05' THEN SS.ADD_RENT_AMT
     ELSE 0
     END ADD_RENT_AMT,       /* 추가렌탈료     */
     SS.TOTAL_AMT,          /* 총렌탈료       */
     SS.REGI_AMT,           /* 렌탈등록비     */
     SS.DC_AMT,             /* 할인액         */
     CASE WHEN SS.CD != 'S05' THEN TRUNC((NVL(v_Regi_Amt,0)+NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1) 
     ELSE TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0))-NVL(SS.DC_AMT,0)),-1)
     END AS TOTAL_RENT_AMT, /* 총 납입금액  (36:납부기간 파라미터 값) */
     SS.SALE_CD,            /* 판매상품코드                           */
     SS.SALE_NM,            /* 판매상품명                             */
     '01' AS PRDT_GRP,
     '01' AS PRDT_GRP_DTL,
     '고객님을 위한 렌탈 상품입니다.' AS BIGO
    FROM (  
        SELECT
         CASE WHEN S.CD='S02' THEN SUM(NVL(S.AMT,0)+3000) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM((NVL(S.AMT,0)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM(((NVL(S.AMT,0)+3000)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)) OVER (PARTITION BY S.SALE_CD) 
         END AS RENT_AMT,
         CASE WHEN S.CD='S02' THEN SUM((NVL(S.AMT,0)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM(((NVL(S.AMT,0)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM((((NVL(S.AMT,0)+3000)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
         END AS TOTAL_AMT,
         --SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         --SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (
         SELECT 
             SUM(BB.SERV_CNT * AA.SERV_AMT)  AS SERV_AMT_SUM                           -- 서비스횟수별 최종금액
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      A.SERV_INF_YN,
                      B.SERV_AMT, 
                      B.SERV_INF_AMT                        
                 FROM RTSD0028 A, RTSD0043 B
                WHERE A.PRS_DCD = B.PRS_DCD
                AND A.SEQ = B.SEQ) AA,  --[20191001_01] SEQ컬럼추가   
              (SELECT PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE PERIOD_CD != 'ZZ'
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND BB.PERIOD_CD = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd) --36:납부기간 파마미터 값
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd)) -- 02:타이어본수 파라미터 값
         ) AS ADD_RENT_AMT,
         S.CD
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS SALE_NM,
              T3.CD
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTCM0051 T3
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width /* 단면폭              */
            AND T.ASPECT_RATIO     = v_Aspect_Ratio  /* 편평비              */
            AND T.WHEEL_INCHES     = v_Wheel_Inches  /* 인치                */
            AND T.PLY_RATING       = v_Ply_Rating    /* PR(강도)            */
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd        /* 타이어본수 파라미터 값 */
            AND T1.PERIOD_CD       = v_Period_cd     /* 납부기간*/
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = (CASE WHEN T3.CD = 'S05' THEN '0008' ELSE '0002' END)
            AND T2.SALE_CD         = T3.CD_NM
            AND T3.CD_GRP_CD       = 'S220'
            AND T3.CD              NOT IN ('S05', 'S06', 'S07')
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;
    
  END sRtsd0005ShopTotAddRegiAmt;
  
  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 멤버십 온라인
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopMmTotAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_cd      IN RTSD0004.MODEL_CD%TYPE,
    v_Contents_cd   IN RTSD0004.CONTENTS_CD%TYPE,
    v_Cnt_cd        IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd     IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    SELECT
         SS.RENT_AMT,                                                                                       /* 기본 월 렌탈료 */
         SS.ADD_RENT_AMT,                                                                                   /* 추가렌탈료     */
         NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0) AS TOTAL_AMT,                                            /* 총렌탈료       */
         SS.REGI_AMT,                                                                                       /* 렌탈등록비     */
         SS.DC_AMT,                                                                                         /* 할인액         */
         ((NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0))*v_Period_cd)+NVL(SS.REGI_AMT,0) AS TOTAL_RENT_AMT,    /* 총납입금액     */
         SS.SALE_CD,                                                                                        /* 판매상품코드   */
         SS.SALE_NM,                                                                                        /* 판매상품명     */
         SS.PRDT_GRP,
         SS.PRDT_GRP_DTL,
         SS.CONTENTS,
         SS.HASH_TAG1,              /* 해쉬태그1 */
         SS.HASH_TAG2,              /* 해쉬태그2 */
         SS.HASH_TAG3,              /* 해쉬태그3 */
         SS.HASH_TAG4               /* 해쉬태그4 */
    FROM (  
        SELECT
         0 AS RENT_AMT,
         0 AS REGI_AMT,
         0 AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (
         SELECT AA.AMT AS SERV_AMT 
         FROM RTSD0042 AA
         WHERE AA.SALE_CD = S.SALE_CD
         AND AA.PERIOD_CD = v_Period_cd
         AND AA.CNT_CD = v_Cnt_cd) AS ADD_RENT_AMT,
--         (
--         SELECT SUM(DECODE(BB.SERV_CNT, 1, AA.SERV_AMT_1,
--                                2, AA.SERV_AMT_2,
--                                3, AA.SERV_AMT_3,
--                                4, AA.SERV_AMT_4,
--                                5, AA.SERV_AMT_5,
--                                6, AA.SERV_AMT_6,
--                                7, AA.SERV_AMT_7,
--                                8, AA.SERV_AMT_8,
--                                9, AA.SERV_AMT_9,
--                                10, AA.SERV_AMT_10)) AS SERV_AMT 
--         FROM 
--              (SELECT A.SALE_CD, 
--                      A.PRS_DCD, 
--                      B.SERV_AMT_1, 
--                      B.SERV_AMT_2, 
--                      B.SERV_AMT_3, 
--                      B.SERV_AMT_4, 
--                      B.SERV_AMT_5, 
--                      B.SERV_AMT_6, 
--                      B.SERV_AMT_7, 
--                      B.SERV_AMT_8, 
--                      B.SERV_AMT_9, 
--                      B.SERV_AMT_10                        
--                 FROM RTSD0028 A, 
--                      (
--                      SELECT
--                          T.PRS_DCD 
--                          ,T.PERIOD_CD
--                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
--                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
--                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
--                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
--                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
--                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
--                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
--                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
--                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
--                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
--                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
--                      FROM RTSD0043 T
--                      WHERE 1=1
--                      AND T.PERIOD_CD = DECODE(v_Period_cd, NULL, T.PERIOD_CD, v_Period_cd)
--                      GROUP BY T.PRS_DCD,T.PERIOD_CD
--                      ) B
--                WHERE A.PRS_DCD = B.PRS_DCD) AA,   
--              (SELECT PS_CD,
--                      PRS_DCD,
--                      PERIOD_CD,         
--                      CNT_CD,
--                      MAX(SERV_CNT) SERV_CNT
--                 FROM RTSD0012
--                WHERE 1=1
--                  AND SERV_CNT != 0 
--                  AND USE_YN = 'Y' 
--                GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) BB
--         WHERE AA.PRS_DCD           = BB.PRS_DCD
--           AND AA.SALE_CD IN (S.SALE_CD)
--           AND AA.SALE_CD           = BB.PS_CD
--           AND BB.PERIOD_CD         = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd)
--           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd))
--         ) AS ADD_RENT_AMT,
         S.PRDT_GRP,
         S.PRDT_GRP_DTL,
         S.CONTENTS,
         S.HASH_TAG1,
         S.HASH_TAG2,
         S.HASH_TAG3,
         S.HASH_TAG4
        FROM (
             SELECT 
              T.SALE_CD,
              T.SALE_NM,
              T1.CHAN_CD,
              T.PRDT_GRP,
              T.PRDT_GRP_DTL,
              T.CONTENTS,
              T.HASH_TAG1,
              T.HASH_TAG2,
              T.HASH_TAG3,
              T.HASH_TAG4
            FROM RTSD0020 T, RTSD0045 T1           
            WHERE 1=1
            AND T.PRDT_GRP        = '04'               --판매유형 Lv1
            AND T.PRDT_GRP_DTL    = '09'               --판매유형 Lv2
            AND T.SALE_CD         = T1.SALE_CD
            AND T1.CHAN_CD        = '02'    --채널구분
            AND T.USE_YN          = 'Y'
        ) S    
    ) SS;
    
    /*
    SELECT
     SS.RENT_AMT,           -- 기본 월 렌탈료 
     CASE WHEN SS.CD != 'S05' THEN SS.ADD_RENT_AMT
     ELSE 0
     END ADD_RENT_AMT,       -- 추가렌탈료     
     SS.TOTAL_AMT,          -- 총렌탈료       
     '0' AS REGI_AMT,           -- 렌탈등록비     
     SS.DC_AMT,             -- 할인액         
     CASE WHEN SS.CD != 'S05' THEN TRUNC((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1) 
     ELSE TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0))-NVL(SS.DC_AMT,0)),-1)
     END AS TOTAL_RENT_AMT, -- 총 납입금액  (36:납부기간 파라미터 값) 
     'S000000286' AS SALE_CD,            -- 판매상품코드                           
     SS.SALE_NM,            -- 판매상품명                             
     '04' AS PRDT_GRP,
     '09' AS PRDT_GRP_DTL,
     '고객님을 위한 멤버십 상품입니다.' AS CONTENTS
    FROM (  
        SELECT
         CASE WHEN S.CD='S02' THEN SUM(NVL(S.AMT,0)+3000) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM((NVL(S.AMT,0)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM(((NVL(S.AMT,0)+3000)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)) OVER (PARTITION BY S.SALE_CD) 
         END AS RENT_AMT,
         CASE WHEN S.CD='S02' THEN SUM((NVL(S.AMT,0)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM(((NVL(S.AMT,0)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM((((NVL(S.AMT,0)+3000)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
         END AS TOTAL_AMT,
         --SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         --SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (
         SELECT 
             SUM(BB.SERV_CNT * AA.SERV_AMT)  AS SERV_AMT_SUM                           -- 서비스횟수별 최종금액
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      A.SERV_INF_YN,
                      B.SERV_AMT, 
                      B.SERV_INF_AMT                        
                 FROM RTSD0028 A, RTSD0043 B
                WHERE A.PRS_DCD = B.PRS_DCD) AA,   
              (SELECT PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE PERIOD_CD != 'ZZ'
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND BB.PERIOD_CD = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd) --36:납부기간 파마미터 값
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd)) -- 02:타이어본수 파라미터 값
         ) AS ADD_RENT_AMT,
         S.CD
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS SALE_NM,
              'S08' AS CD
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTCM0051 T3,                 
                 (SELECT   SECTION_WIDTH
                            ,ASPECT_RATIO
                            ,WHEEL_INCHES
                            ,PLY_RATING
                    FROM    RTSD0004
                    WHERE   MODEL_CD = v_Model_cd
                    AND     CONTENTS_CD = v_Contents_cd
                    AND     USE_YN = 'Y'
                    AND     ROWNUM = '1') T4             
            WHERE 1=1
            AND T.SECTION_WIDTH    = T4.SECTION_WIDTH
            AND T.ASPECT_RATIO     = T4.ASPECT_RATIO
            AND T.WHEEL_INCHES     = T4.WHEEL_INCHES
            AND T.PLY_RATING       = T4.PLY_RATING
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd        -- 타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd     -- 납부기간
            AND T.PETTERN_CD       = 'NFERA AU5'
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = (CASE WHEN T3.CD = 'S05' THEN '0008' ELSE '0002' END)
            AND T2.SALE_CD         = T3.CD_NM
            AND T3.CD_GRP_CD       = 'S220'
            AND T3.CD              NOT IN ('S05', 'S06', 'S07')
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;
    */
  END sRtsd0005ShopMmTotAmt;

  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 멤버십 상품별 온라인
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopMmSaleAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_cd      IN RTSD0004.MODEL_CD%TYPE,
    v_Contents_cd   IN RTSD0004.CONTENTS_CD%TYPE,
    v_Cnt_cd        IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd     IN RTSD0008.PERIOD_CD%TYPE,         /* 기간 */
    v_Sale_cd        IN RTSD0021.SALE_CD%TYPE
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    SELECT
         SS.RENT_AMT,                                                                                       /* 기본 월 렌탈료 */
         SS.ADD_RENT_AMT,                                                                                   /* 추가렌탈료     */
         NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0) AS TOTAL_AMT,                                            /* 총렌탈료       */
         SS.REGI_AMT,                                                                                       /* 렌탈등록비     */
         SS.DC_AMT,                                                                                         /* 할인액         */
         ((NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0))*v_Period_cd)+NVL(SS.REGI_AMT,0) AS TOTAL_RENT_AMT,    /* 총납입금액     */
         SS.SALE_CD,                                                                                        /* 판매상품코드   */
         SS.SALE_NM,                                                                                        /* 판매상품명     */
         SS.PRDT_GRP,
         SS.PRDT_GRP_DTL,
         SS.CONTENTS,
         SS.HASH_TAG1,              /* 해쉬태그1 */
         SS.HASH_TAG2,              /* 해쉬태그2 */
         SS.HASH_TAG3,              /* 해쉬태그3 */
         SS.HASH_TAG4               /* 해쉬태그4 */
    FROM (  
        SELECT
         0 AS RENT_AMT,
         0 AS REGI_AMT,
         0 AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (
         SELECT AA.AMT AS SERV_AMT 
         FROM RTSD0042 AA
         WHERE AA.SALE_CD = S.SALE_CD
         AND AA.PERIOD_CD = v_Period_cd
         AND AA.CNT_CD = v_Cnt_cd) AS ADD_RENT_AMT,
--         (
--         SELECT SUM(DECODE(BB.SERV_CNT, 1, AA.SERV_AMT_1,
--                                2, AA.SERV_AMT_2,
--                                3, AA.SERV_AMT_3,
--                                4, AA.SERV_AMT_4,
--                                5, AA.SERV_AMT_5,
--                                6, AA.SERV_AMT_6,
--                                7, AA.SERV_AMT_7,
--                                8, AA.SERV_AMT_8,
--                                9, AA.SERV_AMT_9,
--                                10, AA.SERV_AMT_10)) AS SERV_AMT 
--         FROM 
--              (SELECT A.SALE_CD, 
--                      A.PRS_DCD, 
--                      B.SERV_AMT_1, 
--                      B.SERV_AMT_2, 
--                      B.SERV_AMT_3, 
--                      B.SERV_AMT_4, 
--                      B.SERV_AMT_5, 
--                      B.SERV_AMT_6, 
--                      B.SERV_AMT_7, 
--                      B.SERV_AMT_8, 
--                      B.SERV_AMT_9, 
--                      B.SERV_AMT_10                        
--                 FROM RTSD0028 A, 
--                      (
--                      SELECT
--                          T.PRS_DCD 
--                          ,T.PERIOD_CD
--                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
--                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
--                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
--                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
--                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
--                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
--                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
--                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
--                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
--                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
--                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
--                      FROM RTSD0043 T
--                      WHERE 1=1
--                      AND T.PERIOD_CD = DECODE(v_Period_cd, NULL, T.PERIOD_CD, v_Period_cd)
--                      GROUP BY T.PRS_DCD,T.PERIOD_CD
--                      ) B
--                WHERE A.PRS_DCD = B.PRS_DCD) AA,   
--              (SELECT PS_CD,
--                      PRS_DCD,
--                      PERIOD_CD,         
--                      CNT_CD,
--                      MAX(SERV_CNT) SERV_CNT
--                 FROM RTSD0012
--                WHERE 1=1
--                  AND SERV_CNT != 0 
--                  AND USE_YN = 'Y' 
--                GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) BB
--         WHERE AA.PRS_DCD           = BB.PRS_DCD
--           AND AA.SALE_CD IN (S.SALE_CD)
--           AND AA.SALE_CD           = BB.PS_CD
--           AND BB.PERIOD_CD         = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd)
--           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd))
--         ) AS ADD_RENT_AMT,
         S.PRDT_GRP,
         S.PRDT_GRP_DTL,
         S.CONTENTS,
         S.HASH_TAG1,
         S.HASH_TAG2,
         S.HASH_TAG3,
         S.HASH_TAG4
        FROM (
             SELECT 
              T.SALE_CD,
              T.SALE_NM,
              T1.CHAN_CD,
              T.PRDT_GRP,
              T.PRDT_GRP_DTL,
              T.CONTENTS,
              T.HASH_TAG1,
              T.HASH_TAG2,
              T.HASH_TAG3,
              T.HASH_TAG4
            FROM RTSD0020 T, RTSD0045 T1           
            WHERE 1=1
            AND T.PRDT_GRP        = '04'               --판매유형 Lv1
            AND T.PRDT_GRP_DTL    = '09'               --판매유형 Lv2
            AND T.SALE_CD         = T1.SALE_CD
            AND T1.CHAN_CD        = '02'               --채널구분
            AND T.SALE_CD         = v_Sale_cd          --판매상품코드
            AND T.USE_YN          = 'Y'
        ) S    
    ) SS;    
    
    /*
    SELECT
     SS.RENT_AMT,           -- 기본 월 렌탈료 
     CASE WHEN SS.CD != 'S05' THEN SS.ADD_RENT_AMT
     ELSE 0
     END ADD_RENT_AMT,       -- 추가렌탈료     
     SS.TOTAL_AMT,          -- 총렌탈료       
     '0' AS REGI_AMT,           -- 렌탈등록비     
     SS.DC_AMT,             -- 할인액         
     CASE WHEN SS.CD != 'S05' THEN TRUNC((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0)+NVL(SS.ADD_RENT_AMT,0))/v_Period_cd-NVL(SS.DC_AMT,0),-1) 
     ELSE TRUNC(((NVL(SS.REGI_AMT,0)+NVL(SS.TOTAL_AMT,0))-NVL(SS.DC_AMT,0)),-1)
     END AS TOTAL_RENT_AMT, -- 총 납입금액  (36:납부기간 파라미터 값) 
     'S000000286' AS SALE_CD,            -- 판매상품코드                           
     SS.SALE_NM,            -- 판매상품명                             
     '04' AS PRDT_GRP,
     '09' AS PRDT_GRP_DTL,
     '고객님을 위한 멤버십 상품입니다.' AS CONTENTS
    FROM (  
        SELECT
         CASE WHEN S.CD='S02' THEN SUM(NVL(S.AMT,0)+3000) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM((NVL(S.AMT,0)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM(((NVL(S.AMT,0)+3000)+3000)+3000) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)) OVER (PARTITION BY S.SALE_CD) 
         END AS RENT_AMT,
         CASE WHEN S.CD='S02' THEN SUM((NVL(S.AMT,0)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
              WHEN S.CD='S03' THEN SUM(((NVL(S.AMT,0)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
              WHEN S.CD='S04' THEN SUM((((NVL(S.AMT,0)+3000)+3000)+3000)*v_Period_cd) OVER (PARTITION BY S.SALE_CD)
         ELSE SUM(NVL(S.AMT,0)*v_Period_cd) OVER (PARTITION BY S.SALE_CD) 
         END AS TOTAL_AMT,
         --SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         --SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (
         SELECT 
             SUM(BB.SERV_CNT * AA.SERV_AMT)  AS SERV_AMT_SUM                           -- 서비스횟수별 최종금액
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      A.SERV_INF_YN,
                      B.SERV_AMT, 
                      B.SERV_INF_AMT                        
                 FROM RTSD0028 A, RTSD0043 B
                WHERE A.PRS_DCD = B.PRS_DCD) AA,   
              (SELECT PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE PERIOD_CD != 'ZZ'
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND BB.PERIOD_CD = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd) --36:납부기간 파마미터 값
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd)) -- 02:타이어본수 파라미터 값
         ) AS ADD_RENT_AMT,
         S.CD
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              (SELECT A.SALE_NM FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS SALE_NM,
              'S08' AS CD
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTCM0051 T3,                 
                 (SELECT   SECTION_WIDTH
                            ,ASPECT_RATIO
                            ,WHEEL_INCHES
                            ,PLY_RATING
                    FROM    RTSD0004
                    WHERE   MODEL_CD = v_Model_cd
                    AND     CONTENTS_CD = v_Contents_cd
                    AND     USE_YN = 'Y'
                    AND     ROWNUM = '1') T4             
            WHERE 1=1
            AND T.SECTION_WIDTH    = T4.SECTION_WIDTH
            AND T.ASPECT_RATIO     = T4.ASPECT_RATIO
            AND T.WHEEL_INCHES     = T4.WHEEL_INCHES
            AND T.PLY_RATING       = T4.PLY_RATING
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd        -- 타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd     -- 납부기간
            AND T.PETTERN_CD       = 'NFERA AU5'
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = (CASE WHEN T3.CD = 'S05' THEN '0008' ELSE '0002' END)
            AND T2.SALE_CD         = v_Sale_cd
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
            AND ROWNUM = 1            
        ) S    
    ) SS;
    */
  END sRtsd0005ShopMmSaleAmt;


  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 임직원
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopEmployeesAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    SELECT
         SS.RENT_AMT,           /* 기본 월 렌탈료 */
         SS.ADD_RENT_AMT,       /* 추가렌탈료     */
         NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0) AS TOTAL_AMT, /* 총렌탈료       */
         SS.REGI_AMT,           /* 렌탈등록비     */
         CASE WHEN SS.DC_RATE = 0 THEN NVL(SS.DC_AMT,0)
         ELSE TRUNC(NVL(SS.ADD_RENT_AMT * SS.DC_RATE/100,0) + NVL(SS.DC_AMT,0), -1)
         END AS DC_AMT,             /* 할인액         */
         ((NVL(SS.RENT_AMT,0)+NVL(SS.ADD_RENT_AMT,0))*v_Period_cd)+NVL(SS.REGI_AMT,0) - (NVL(SS.RENT_AMT, 0)*EXCEPT_CNT) AS TOTAL_RENT_AMT, /* 총 납입금액  (36:납부기간 파라미터 값) */
         SS.SALE_CD,            /* 판매상품코드                           */
         SS.SALE_NM,             /* 판매상품명                             */
         SS.PRDT_GRP,
         SS.PRDT_GRP_DTL,
         SS.CONTENTS,
         SS.HASH_TAG1,              /* 해쉬태그1 */
         SS.HASH_TAG2,              /* 해쉬태그2 */
         SS.HASH_TAG3,              /* 해쉬태그3 */
         SS.HASH_TAG4               /* 해쉬태그4 */
    FROM (  
        SELECT
         SUM(S.AMT) OVER (PARTITION BY S.SALE_CD) AS RENT_AMT,
         SUM(S.AMT*v_Period_cd) OVER (PARTITION BY S.SALE_CD) AS TOTAL_AMT,
         SUM(S.REGI_AMT) OVER(PARTITION BY S.SALE_CD) AS REGI_AMT,
         SUM(S.DC_AMT) OVER(PARTITION BY S.SALE_CD) AS DC_AMT,
         S.SALE_CD,
         S.SALE_NM,
         (SELECT COUNT(*) FROM RTSD0044 WHERE SALE_CD = S.SALE_CD) AS EXCEPT_CNT,
         (SELECT DC_RATE FROM RTSD0020 WHERE SALE_CD = S.SALE_CD) AS DC_RATE,
         (
         SELECT SUM(DECODE(BB.SERV_CNT, 1, AA.SERV_AMT_1,
                                2, AA.SERV_AMT_2,
                                3, AA.SERV_AMT_3,
                                4, AA.SERV_AMT_4,
                                5, AA.SERV_AMT_5,
                                6, AA.SERV_AMT_6,
                                7, AA.SERV_AMT_7,
                                8, AA.SERV_AMT_8,
                                9, AA.SERV_AMT_9,
                                10, AA.SERV_AMT_10)) AS SERV_AMT 
         FROM 
              (SELECT A.SALE_CD, 
                      A.PRS_DCD, 
                      B.SERV_AMT_1, 
                      B.SERV_AMT_2, 
                      B.SERV_AMT_3, 
                      B.SERV_AMT_4, 
                      B.SERV_AMT_5, 
                      B.SERV_AMT_6, 
                      B.SERV_AMT_7, 
                      B.SERV_AMT_8, 
                      B.SERV_AMT_9, 
                      B.SERV_AMT_10                        
                 FROM RTSD0028 A, 
                      (
                      SELECT
                          T.PRS_DCD 
                          ,T.PERIOD_CD
                          ,T.SEQ    --[20191001_01] SEQ컬럼추가
                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                      FROM RTSD0043 T
                      WHERE 1=1
                      AND T.PERIOD_CD = DECODE(v_Period_cd, NULL, T.PERIOD_CD, v_Period_cd)
                      GROUP BY T.PRS_DCD,T.PERIOD_CD, T.SEQ --[20191001_01] SEQ컬럼 추가
                      ) B
                WHERE A.PRS_DCD = B.PRS_DCD
                AND A.SEQ = B.SEQ) AA,  --[20191001_01] SEQ컬럼추가   
              (SELECT PS_CD,
                      PRS_DCD,
                      PERIOD_CD,         
                      CNT_CD,
                      MAX(SERV_CNT) SERV_CNT
                 FROM RTSD0012
                WHERE 1=1
                  AND SERV_CNT != 0 
                  AND USE_YN = 'Y' 
                GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) BB
         WHERE AA.PRS_DCD           = BB.PRS_DCD
           AND AA.SALE_CD IN (S.SALE_CD)
           AND AA.SALE_CD           = BB.PS_CD
           AND BB.PERIOD_CD         = DECODE(v_Period_cd, NULL, BB.PERIOD_CD, v_Period_cd)
           AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_cd, NULL, BB.CNT_CD, v_Cnt_cd))
         ) AS ADD_RENT_AMT,
         S.CONTENTS,
         S.PRDT_GRP,
         S.PRDT_GRP_DTL,
         S.HASH_TAG1,
         S.HASH_TAG2,
         S.HASH_TAG3,
         S.HASH_TAG4
        FROM (
             SELECT 
              T1.PRICE_CD,
              T.PETTERN_CD, 
              T1.MAT_CD,
              T1.PERIOD_CD, 
              T1.CNT_CD, 
              (SELECT A.AMT FROM RTSD0029 A WHERE A.SALE_CD = T2.SALE_CD AND '0'||A.CNT_CD = T1.CNT_CD) AS REGI_AMT,
              (SELECT CASE WHEN A.DC_RATE = 0 THEN A.DC_AMT
                      ELSE TRUNC(T1.AMT * A.DC_RATE/100 )
                      END
               FROM RTSD0020 A WHERE A.SALE_CD = T2.SALE_CD) AS DC_AMT,  
              T1.STR_DAY, 
              T1.END_DAY, 
              T1.SEQ, 
              T1.AMT,
              T2.SALE_CD,
              T3.SALE_NM,
              T3.CONTENTS,
              T3.PRDT_GRP,
              T3.PRDT_GRP_DTL,
              T4.CHAN_CD,
              T3.HASH_TAG1,
              T3.HASH_TAG2,
              T3.HASH_TAG3,
              T3.HASH_TAG4
            FROM RTSD0005 T, RTSD0008 T1, RTSD0021 T2, RTSD0020 T3, RTSD0045 T4
            WHERE 1=1
            AND T.SECTION_WIDTH    = v_Section_Width -- 단면폭            
            AND T.ASPECT_RATIO     = v_Aspect_Ratio  -- 편평비              
            AND T.WHEEL_INCHES     = v_Wheel_Inches  -- 인치                
            AND T.PLY_RATING       = v_Ply_Rating    -- PR(강도)            
            AND T.MAT_CD           = T1.MAT_CD
            AND T1.CNT_CD          = v_Cnt_cd        -- 타이어본수 파라미터 값 
            AND T1.PERIOD_CD       = v_Period_cd     -- 납부기간
            AND T.PETTERN_CD       = v_Pettern_cd
            AND T.PETTERN_CD       = T2.SALE_GDS_CD
            AND T1.PRICE_CD        = '0003'
            AND T2.SALE_CD         = T3.SALE_CD
            AND T3.PRDT_GRP        = '01'        --판매유형 Lv1
            AND T3.PRDT_GRP_DTL    = '02'        --판매유형 Lv2
            AND T3.SALE_CD         = T4.SALE_CD
            AND T4.CHAN_CD         IN('02')    --채널구분
            AND T3.USE_YN          = 'Y'
            AND TO_CHAR(SYSDATE,'YYYYMMDD') BETWEEN T1.STR_DAY AND T1.END_DAY
        ) S    
    ) SS;         
    
  END sRtsd0005ShopEmployeesAmt;


END Pkg_Rtsd0005;
/