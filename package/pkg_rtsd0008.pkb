CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0008 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0008
   PURPOSE   가격 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-29  jemcarry         1. Created this package body.
   1.1        2017-03-13  wjim             [20170313_01] B2B일시불 가격정책 추가에 따른 수정
*******************************************************************************/

  /*****************************************************************************
  -- 가격 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0008Count(
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,          /*가격적용 시작일     */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,          /*가격적용 완료일     */
    v_Seq            IN RTSD0008.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0008
    WHERE   PRICE_CD  = v_Price_Cd
    AND     MAT_CD    = v_Mat_Cd
    AND     PERIOD_CD = v_Period_Cd
    AND     CNT_CD    = v_Cnt_Cd
    AND     REGI_CD   = v_Regi_Cd
    AND     STR_DAY   = v_Str_Day
    AND     END_DAY   = v_End_Day
    AND     SEQ       = v_Seq;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0008Count;

  /*****************************************************************************
  -- 가격 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PRICE_CD,                  /*가격,금액유형       */
            A.MAT_CD,                    /*상품코드            */
            (SELECT MAT_NM FROM RTSD0005 B WHERE B.MAT_CD = A.MAT_CD) MAT_NM,
            A.PERIOD_CD,                 /*기간코드            */
            A.CNT_CD,                    /*타이어본수          */
            A.REGI_CD,                   /*등록비코드          */
            A.STR_DAY,                   /*가격적용 시작일     */
            A.END_DAY,                   /*가격적용 완료일     */
            A.SEQ,                       /*순번                */
            A.AMT,                       /*금액                */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0008 A
    WHERE   A.PRICE_CD  = DECODE(v_Price_Cd  , NULL, A.PRICE_CD  , v_Price_Cd)
    AND     A.MAT_CD    = DECODE(v_Mat_Cd    , NULL, A.MAT_CD    , v_Mat_Cd)
    AND     A.PERIOD_CD = DECODE(v_Period_Cd , NULL, A.PERIOD_CD , v_Period_Cd)
    AND     A.CNT_CD    = DECODE(v_Cnt_Cd    , NULL, A.CNT_CD    , v_Cnt_Cd)
    AND     A.REGI_CD   = DECODE(v_Regi_Cd   , NULL, A.REGI_CD   , v_Regi_Cd)
    AND     A.STR_DAY   = DECODE(v_Str_Day   , NULL, A.STR_DAY   , v_Str_Day)
    AND     A.END_DAY   = DECODE(v_End_Day   , NULL, A.END_DAY   , v_End_Day)
    AND     A.SEQ       = DECODE(v_Seq       , NULL, A.SEQ       , v_Seq)
    AND     A.AMT       = DECODE(v_Amt       , NULL, A.AMT       , v_Amt)
    AND     A.USE_YN    = DECODE(v_Use_Yn    , NULL, A.USE_YN    , v_Use_Yn)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id)
--    AND     A.STR_DAY   <= TO_CHAR(sysdate, 'YYYYMMDD')
--    AND     A.END_DAY   >= TO_CHAR(sysdate, 'YYYYMMDD')
    ;

  END p_sRtsd0008;

  /*****************************************************************************
  -- 가격 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN OUT RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    v_Seq := f_sRtsd0008MaxSeq(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd, v_Str_Day, v_End_Day);

    INSERT  INTO RTSD0008 (
            PRICE_CD,
            MAT_CD,
            PERIOD_CD,
            CNT_CD,
            REGI_CD,
            STR_DAY,
            END_DAY,
            SEQ,
            AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Price_Cd,
            v_Mat_Cd,
            v_Period_Cd,
            v_Cnt_Cd,
            v_Regi_Cd,
            v_Str_Day,
            v_End_Day,
            v_Seq,
            v_Amt,
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

  END f_InsertRtsd0008;

  /*****************************************************************************
  -- 가격 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0008
    SET    AMT       = v_Amt,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0008;

  /*****************************************************************************
  -- 가격 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0008
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0008;

  /*****************************************************************************
  -- 가격 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0008 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN OUT RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 가격_금액유형 , 상품코드,기간코드,타이어본수, 등록비코드,가격적용 시작일,가격적용 완료일,  사용여부 ,등록자 ID
    IF TRIM(v_Price_Cd) IS NULL THEN
        v_Return_Message := '가격_금액유형 ('||v_Price_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Period_Cd) IS NULL THEN
        v_Return_Message := '기간코드('||v_Period_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cnt_Cd) IS NULL THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Regi_Cd) IS NULL THEN
        v_Return_Message := '등록비코드('||v_Regi_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Str_Day) IS NULL THEN
        v_Return_Message := '가격적용 시작일('||v_Str_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_End_Day) IS NULL THEN
        v_Return_Message := '가격적용 완료일('||v_End_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF 0 = f_sRtsd0008Count(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                            v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq) THEN

        IF 0 != f_InsertRtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                 v_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '가격 관리 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF
        ;
    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                     v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                     v_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '가격 관리 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                     v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '가격 관리 삭제 실패!!!'||'-'||v_ErrorText;
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

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0008.p_IUDRtsd0008(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0008.p_IUDRtsd0008(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0008;

  /*****************************************************************************
  -- 가격 관리 Select - 상품 및 가격조회 POPUP
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-13  wjim             [20170313_01] B2B일시불 가격정책 추가에 따른 수정
  *****************************************************************************/
  PROCEDURE p_sRtsd0008PoPup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용일            */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE          /*타이어본수            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PRICE_CD,                  /*가격,금액유형       */
            A.MAT_CD,                    /*상품코드            */
            Pkg_Rtsd0005.f_sRtsd0005MatName(A.MAT_CD) MAT_NM, /*상품명  */
            A.PERIOD_CD,                 /*기간코드            */
            A.CNT_CD,                    /*타이어본수          */
            A.REGI_CD,                   /*등록비코드          */
            TO_NUMBER(Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',A.REGI_CD)) REGI_AMT, /*랜탈등록비 */
            A.AMT  RENT_AMT,             /*금액(월렌탈료)      */
            A.STR_DAY,                   /*가격적용 시작일     */
            A.END_DAY,                   /*가격적용 완료일     */
            A.SEQ                        /*순번                */
    FROM    RTSD0008 A
    WHERE   v_Ord_Day BETWEEN A.STR_DAY AND  END_DAY
    AND     A.MAT_CD    = DECODE(v_Mat_Cd    , NULL, A.MAT_CD    , v_Mat_Cd)
    AND     A.PERIOD_CD = DECODE(v_Period_Cd , NULL, A.PERIOD_CD , v_Period_Cd)
    AND     A.CNT_CD    = DECODE(v_Cnt_Cd    , NULL, A.CNT_CD    , v_Cnt_Cd)
    AND     A.USE_YN = 'Y'
    AND     A.PRICE_CD = '0002'          /* [20170313_01] 렌탈료만 조회 */
    ORDER   BY A.SEQ;

  END p_sRtsd0008PoPup;

    /*****************************************************************************
    -- 상품가격 Select - 상품 및 가격조회 POPUP
    REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-13  wjim             [20170313_01] B2B일시불 가격정책 추가에 따른 파라미터 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0008_Pro_Pri_PoPup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,         /*가격적용일          */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,          /*상품코드            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,       /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,          /*타이어본수          */
    v_regi_Amt       IN RTSD0106.REGI_AMT%TYPE,        /*렌탈등록비          */
    v_Amt            IN RTSD0008.AMT%TYPE,             /*금액                */
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE         /*가격금액유형        */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAT_CD,               /*상품코드*/
            A.MAT_NM,               /*상품명*/
            A.PETTERN_CD,           /*패턴코드*/
            A.SECTION_WIDTH,        /*단면폭*/
            A.ASPECT_RATIO,         /*편평비*/
            A.WHEEL_INCHES,         /*인치*/
            A.PLY_RATING,           /*PR(강도)*/
            A.DEMEND_QTY,           /*타이어소요량*/
            A.PG_CD,                /*Pricing Group Code*/
            A.SEASON_CD,            /*계절구분*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S014',A.SEASON_CD) AS SEASON_NM, /*계절구분명            */
            B.FR_CD,                /*전후 구분*/
            B.CONTENTS_CD,          /*사양*/
            B.MODEL_CD,             /*차종*/
            B.WHEEL_QTY,            /*바퀴수*/
            B.WHEEL_LIMIT_QTY,      /*장착가능 바퀴수*/
            B.CLASS_CD,             /*차량분류*/
            C.MAKER_CD,             /*카메이커*/
            D.SEQ,                  /*순번*/
            D.END_DAY,              /*가격적용 완료일*/
            D.STR_DAY,              /*가격적용 시작일*/
            D.REGI_CD,              /*등록비코드*/
            TO_NUMBER(Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',D.REGI_CD)) AS REGI_AMT, /*랜탈등록비 */
            D.CNT_CD,               /*타이어본수*/
            TO_NUMBER( D.CNT_CD ) AS ORD_QTY,     /*타이어수량 */
            D.PERIOD_CD,            /*기간코드*/
            D.PRICE_CD,             /*가격,금액유형*/
            D.AMT AS RENT_AMT       /*금액*/
    FROM    RTSD0005 A,
            RTSD0004 B,
            RTSD0001 C,
            RTSD0008 D
    WHERE   B.MODEL_CD      = v_Model_Cd                 /*차종(S001)          */
    AND     B.CONTENTS_CD   = v_Contents_Cd              /*사양(S002,S003)     */
    AND     B.FR_CD         = v_Fr_Cd                    /*전후 구분           */
    AND     D.MAT_CD        = v_Mat_Cd                   /*상품코드            */
    AND     v_Ord_Day BETWEEN D.STR_DAY AND D.END_DAY    /*가격적용            */
    AND     D.PERIOD_CD     = v_Period_Cd                /*기간코드            */
    AND     D.CNT_CD        = v_Cnt_Cd                   /*타이어본수          */
    AND     (v_regi_Amt IS NULL OR TO_NUMBER(Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',D.REGI_CD)) =  v_regi_Amt)
    AND     (v_Amt      IS NULL OR D.AMT =  v_Amt)
    AND     A.SECTION_WIDTH = B.SECTION_WIDTH            /*단면폭              */
    AND     A.ASPECT_RATIO  = B.ASPECT_RATIO             /*편평비              */
    AND     A.WHEEL_INCHES  = B.WHEEL_INCHES             /*인치                */
    AND     A.PLY_RATING    = B.PLY_RATING               /*PR(강도)            */
    AND     A.USE_YN        = 'Y'
    AND     B.USE_YN        = 'Y'
    AND     B.MODEL_CD      = C.MODEL_CD
    AND     B.CONTENTS_CD   = C.CONTENTS_CD
    AND     C.USE_YN        = 'Y'
    AND     A.MAT_CD        = D.MAT_CD
    AND     D.USE_YN        = 'Y'
    AND     D.PRICE_CD      = v_Price_Cd                 /* [20170313_01]      */
    ORDER BY D.STR_DAY DESC, D.AMT ASC;

  END p_sRtsd0008_Pro_Pri_PoPup;
  
  /*****************************************************************************
    -- 상품가격 Select - 상품 및 가격조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-13  wjim             [20170313_01] B2B일시불 가격정책 추가에 따른 수정
  *****************************************************************************/
  PROCEDURE p_sRtsd0008_ProductList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,    /*휠인치              */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,      /*강도                */    
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,       /*계절 구분           */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,      /*패턴코드            */
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,         /*가격적용일          */    
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,       /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE           /*타이어본수          */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAT_CD,               /*상품코드*/
            A.SECTION_WIDTH || '/' || A.ASPECT_RATIO || '/' || A.WHEEL_INCHES || '/' || A.PLY_RATING AS MAT_NM, /*규격*/
            A.PETTERN_CD,           /*패턴코드*/
            A.SECTION_WIDTH,        /*단면폭*/
            A.ASPECT_RATIO,         /*편평비*/
            A.WHEEL_INCHES,         /*인치*/
            A.PLY_RATING,           /*PR(강도)*/
            A.DEMEND_QTY,           /*타이어소요량*/
            A.PG_CD,                /*Pricing Group Code*/
            A.SEASON_CD,            /*계절구분*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S014',A.SEASON_CD) AS SEASON_NM, /*계절구분명            */
            B.FR_CD,                /*전후 구분*/
            DECODE(B.FR_CD, 'Z', '구분없음', Pkg_Rtcm0051.f_sRtcm0051CodeName('S004',B.FR_CD)) AS FR_CD_NM, /*전후구분명*/
            B.CONTENTS_CD,          /*사양*/
            DECODE(B.CONTENTS_CD, '0001', '사양없음', Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',B.CONTENTS_CD)) AS CONTENTS_CD_NM, /*사양명*/
            B.MODEL_CD,             /*차종*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',B.MODEL_CD) AS MODEL_NM, /*모델명*/
            B.WHEEL_QTY,            /*바퀴수*/
            B.WHEEL_LIMIT_QTY,      /*장착가능 바퀴수*/
            B.CLASS_CD,             /*차량분류*/
            C.MAKER_CD,             /*카메이커*/
            D.SEQ,                  /*순번*/
            D.END_DAY,              /*가격적용 완료일*/
            D.STR_DAY,              /*가격적용 시작일*/
            D.REGI_CD,              /*등록비코드*/
            TO_NUMBER(Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',D.REGI_CD)) AS REGI_AMT, /*랜탈등록비 */
            D.CNT_CD,               /*타이어본수*/
            TO_NUMBER( D.CNT_CD ) AS ORD_QTY,     /*타이어수량 */
            D.PERIOD_CD,            /*기간코드*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S021',D.PERIOD_CD) AS PERIOD_NM, /*렌탈기간 */
            D.PRICE_CD,             /*가격,금액유형*/
            D.AMT AS RENT_AMT       /*금액*/
    FROM    RTSD0005 A,
            RTSD0004 B,
            RTSD0001 C,
            RTSD0008 D
    WHERE   B.MODEL_CD      = v_Model_Cd                 /*차종(S001)          */
    AND     B.CONTENTS_CD   = v_Contents_Cd              /*사양(S002,S003)     */
    AND     (v_Fr_Cd      IS NULL OR B.FR_CD =  v_Fr_Cd) /*전후 구분           */
    AND     v_Ord_Day BETWEEN D.STR_DAY AND D.END_DAY    /*가격적용            */
    AND     (v_Period_Cd      IS NULL OR D.PERIOD_CD =  v_Period_Cd) /*기간코드            */
    AND     (v_Cnt_Cd      IS NULL OR D.CNT_CD =  v_Cnt_Cd) /*타이어본수            */
    AND     A.SECTION_WIDTH = B.SECTION_WIDTH            /*단면폭              */
    AND     A.ASPECT_RATIO  = B.ASPECT_RATIO             /*편평비              */
    AND     A.WHEEL_INCHES  = B.WHEEL_INCHES             /*인치                */
    AND     A.PLY_RATING    = B.PLY_RATING               /*PR(강도)            */
    AND     (v_Section_Width      IS NULL OR A.SECTION_WIDTH =  v_Section_Width) /*단면폭            */
    AND     (v_Aspect_Ratio      IS NULL OR A.ASPECT_RATIO =  v_Aspect_Ratio) /*편평비            */
    AND     (v_Wheel_Inches      IS NULL OR A.WHEEL_INCHES =  v_Wheel_Inches) /*휠인치            */
    AND     (v_Ply_Rating      IS NULL OR A.PLY_RATING =  v_Ply_Rating) /*강도            */
    AND     (v_Season_Cd      IS NULL OR A.SEASON_CD =  v_Season_Cd) /*계절            */
    AND     (v_Pettern_Cd      IS NULL OR A.PETTERN_CD =  v_Pettern_Cd) /*패턴            */              
    AND     A.USE_YN        = 'Y'
    AND     B.USE_YN        = 'Y'
    AND     B.MODEL_CD      = C.MODEL_CD
    AND     B.CONTENTS_CD   = C.CONTENTS_CD
    AND     C.USE_YN        = 'Y'
    AND     A.MAT_CD        = D.MAT_CD
    AND     D.USE_YN        = 'Y'
    AND     D.PRICE_CD      = '0002'  /* [20170313_01] 렌탈료만 조회 */
    ORDER BY A.PETTERN_CD, A.SECTION_WIDTH, A.ASPECT_RATIO, A.WHEEL_INCHES, A.PLY_RATING, D.PERIOD_CD, D.CNT_CD, B.FR_CD;

  END p_sRtsd0008_ProductList;

  FUNCTION f_sRtsd0008MaxSeq (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,          /*가격적용 시작일     */
    v_End_Day        IN RTSD0008.END_DAY%TYPE          /*가격적용 완료일     */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL((SELECT
                        SEQ + 1
                FROM    RTSD0008
                WHERE   PRICE_CD   = v_Price_Cd
                AND     MAT_CD     = v_Mat_Cd
                AND     PERIOD_CD  =  v_Period_Cd
                AND     CNT_CD     = v_Cnt_Cd
                AND     REGI_CD    = v_Regi_Cd
                AND     STR_DAY    = v_Str_Day
                AND     END_DAY    = v_End_Day
                AND     ROWNUM    <= 1), 1)
    INTO    v_curr_cunt
    FROM    DUAL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0008MaxSeq;

   FUNCTION f_sRtsd0008ExistsDay (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Seq            OUT RTSD0008.SEQ%TYPE              /*순번 */
    ) RETURN VARCHAR IS
    v_curr_day   VARCHAR(8) DEFAULT NULL;
  BEGIN

    SELECT  STR_DAY, SEQ
            INTO v_curr_day, v_Seq
    FROM    (
            SELECT  STR_DAY, SEQ
            FROM    RTSD0008
            WHERE   PRICE_CD = v_Price_Cd
            AND     MAT_CD = v_Mat_Cd
            AND     PERIOD_CD = v_Period_Cd
            AND     CNT_CD = v_Cnt_Cd
            AND     REGI_CD = v_Regi_Cd
            AND     USE_YN = 'Y'
            ORDER   BY PRICE_CD, MAT_CD, PERIOD_CD, CNT_CD, REGI_CD, END_DAY DESC)
    WHERE   ROWNUM = 1;

    RETURN v_curr_day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0008ExistsDay;



   /*****************************************************************************
  -- 가격 관리 관리(이전 종료일자 업데이트처리)
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0008EndDay (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_End_Day2       IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일(수정)  */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 가격_금액유형 , 상품코드,기간코드,타이어본수, 등록비코드,가격적용 시작일,가격적용 완료일,  사용여부 ,등록자 ID
    IF TRIM(v_Price_Cd) IS NULL THEN
        v_Return_Message := '가격_금액유형 ('||v_Price_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Period_Cd) IS NULL THEN
        v_Return_Message := '기간코드('||v_Period_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cnt_Cd) IS NULL THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Regi_Cd) IS NULL THEN
        v_Return_Message := '등록비코드('||v_Regi_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Str_Day) IS NULL THEN
        v_Return_Message := '가격적용 시작일('||v_Str_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_End_Day) IS NULL THEN
        v_Return_Message := '가격적용 완료일('||v_End_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    UPDATE RTSD0008
    SET    END_DAY   = v_End_Day2,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

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

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0008.p_IUDRtsd0008EndDay(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0008.p_IUDRtsd0008EndDay(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtsd0008EndDay;
  
  
  
  /*****************************************************************************
  -- 제품추가 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*차종                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*타이어본수          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*판메상품코드        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*차량상세            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,              /*장착위치            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE,
    v_Pettern_cd    IN RTSD0005.PETTERN_CD%TYPE,
    v_Spec_cd   IN VARCHAR2
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    SELECT
        B.MAT_CD||C.PERIOD_CD||C.CNT_CD as PRS_PK,
        E.SALE_GDS_CD,                                             /*패턴코드 */
        B.SECTION_WIDTH||'/'||B.ASPECT_RATIO||'R'||B.WHEEL_INCHES as STANDARD, /* 규 격 */
        B.MAT_CD,                                                      /* 상품코드 */
        B.MAT_NM,                                                     /* 상품명 */
        C.PERIOD_CD,
        PKG_RTCM0051.F_SRTCM0051CODENAME('S021',C.PERIOD_CD) AS PERIOD_NM,      /*렌탈기간 */
        B.SEASON_CD,
        PKG_RTCM0051.F_SRTCM0051CODENAME('S014',B.SEASON_CD) AS SEASON_NM,      /*계절구분명 */
        C.CNT_CD,
        PKG_RTCM0051.F_SRTCM0051CODENAME('S022',C.CNT_CD) AS CNT_NM,         /*본수 */
        C.REGI_CD,
        (SELECT T.AMT FROM RTSD0029 T WHERE '0'||T.CNT_CD = C.CNT_CD AND T.SALE_CD = D.SALE_CD) AS REGI_AMT,         /*랜탈등록비 */
        C.AMT,                                                            /* 월 렌탈료 */
        A.FR_CD,
        PKG_RTCM0051.F_SRTCM0051CODENAME('S004', A.FR_CD) AS FR_NM,             /*장착위치*/
        CASE WHEN D.PRDT_GRP_DTL = '03' THEN 
            CASE WHEN D.DC_RATE = 0 THEN D.DC_AMT
                 ELSE TRUNC(C.AMT * D.DC_RATE/100 )
            END
        END GROUP_SALE,     /* 단체할인 */
        CASE WHEN D.PRDT_GRP_DTL IS NULL OR  D.PRDT_GRP_DTL !='03' THEN 
            CASE WHEN D.DC_RATE = 0 THEN D.DC_AMT
                 ELSE TRUNC(C.AMT * D.DC_RATE/100 ) 
            END
        END CHNL_SALE       /* 판매채널할인 */
        
    FROM RTSD0004 A, RTSD0005 B, RTSD0008 C, RTSD0020 D, RTSD0021 E
    WHERE 1=1
    
        AND A.SECTION_WIDTH = B.SECTION_WIDTH
        AND A.ASPECT_RATIO = B.ASPECT_RATIO
        AND A.WHEEL_INCHES = B.WHEEL_INCHES
        AND A.PLY_RATING = B.PLY_RATING
        AND A.USE_YN = 'Y'
        AND B.USE_YN = 'Y'
        AND C.PRICE_CD = '0002'
        AND B.MAT_CD = C.MAT_CD 
        AND C.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---현재일
        AND C.END_DAY >= to_char(sysdate,'YYYYMMDD') ---현재일
        AND D.SALE_CD = E.SALE_CD 
        AND E.GDS_GB = '1' 
        AND E.SALE_GDS_CD = B.PETTERN_CD
        AND B.MAT_CD NOT IN(SELECT MAT_CD FROM RTSD0046 WHERE SALE_CD=v_Sale_Cd)    
        AND D.SALE_CD = DECODE(v_Sale_Cd  , NULL, D.SALE_CD  , v_Sale_Cd)  --- 차량모델
        AND A.MODEL_CD = DECODE(v_Model_Cd  , NULL, A.MODEL_CD  , v_Model_Cd)  --- 차량모델
        AND C.PERIOD_CD = DECODE(v_Period_Cd  , NULL, C.PERIOD_CD  , v_Period_Cd)  --- 화면입력_렌탈기간
        AND C.CNT_CD = DECODE(v_Cnt_Cd  , NULL, C.CNT_CD  , v_Cnt_Cd)     --- 화면입력_타이어본수   
        AND A.CONTENTS_CD = DECODE(v_contents_Cd  , NULL, A.CONTENTS_CD  , v_contents_Cd)     --- 차량상세
        AND A.FR_CD = DECODE(v_fr_Cd  , NULL, A.FR_CD  , v_fr_Cd)     --- 장착위치
        AND B.SEASON_CD     = DECODE(v_Season_cd  , NULL, B.SEASON_CD  , v_Season_cd)                 ---계절구분
        AND B.PETTERN_CD    = DECODE(replace(v_Pettern_cd,';apos;',''''), NULL, B.PETTERN_CD, replace(v_Pettern_cd,';apos;',''''))
        AND B.SECTION_WIDTH||'/'||B.ASPECT_RATIO||'R'||B.WHEEL_INCHES||' '||B.PLY_RATING||'P' = DECODE(v_Spec_cd, NULL, B.SECTION_WIDTH||'/'||B.ASPECT_RATIO||'R'||B.WHEEL_INCHES||' '||B.PLY_RATING||'P',v_Spec_cd) 
        
    ORDER BY E.SALE_GDS_CD;
    
  END p_sRtsd0008AddProduct;
  
  
  /*****************************************************************************
  -- 계약별 저장된 제품정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddSelProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,          /*차종                */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드            */  
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,            /*타이어본수          */ 
    v_Ord_no         IN RTSD0106.ORD_NO%TYPE,            /*계약번호            */  
    v_Sale_Cd        IN RTSD0020.SALE_CD%TYPE,           /*타이어본수          */
    v_contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE        /*차량상세            */
  ) IS

  BEGIN
    
    IF v_Sale_Cd IS NULL THEN   /* AS-IS 데이터 조회 */
    
    
        OPEN Ref_Cursor FOR
    
        SELECT AA.PRS_PK,
           AA.SALE_GDS_CD,
           AA.STANDARD,
           AA.MAT_CD,
           AA.MAT_NM,
           AA.PERIOD_CD,
           AA.PERIOD_NM,
           AA.SEASON_CD,
           AA.SEASON_NM,
           AA.CNT_CD,
           AA.CNT_NM,
           AA.AMT,
           AA.GROUP_SALE,
           AA.CHNL_SALE,
           BB.ORD_NO,
           BB.SEQ,
           BB.ORD_ID,
           BB.REGI_CD,
           BB.FR_CD,
           PKG_RTCM0051.F_SRTCM0051CODENAME('S004', BB.FR_CD) AS FR_NM,             /*장착위치*/
           BB.LR_CD,
           BB.ORD_QTY,
           BB.REGI_AMT,
           BB.RENT_AMT,
           BB.RENTP_AMT,
           BB.F_DCRATE,
           BB.F_DCAMT,
           BB.MON_DCAMT,
           BB.MON_AMT,
           BB.PLAN_DAY,
           BB.PLAN_TM,
           BB.INST_DAY,
           BB.INST_TM,
           BB.INST_YN,
           BB.VAL_YN,
           BB.EQU_NO,
           BB.OS_ID,
           BB.OS_DAY,
           BB.STAT_CD,
           BB.FL_YN,
           BB.FR_YN,
           BB.RL_YN,
           BB.RR_YN,
           BB.MAT_DESC,
           BB.SALE_CD,
           BB.GDS_GB,
           BB.GDS_GRP
       FROM (SELECT E.MAT_CD||F.PERIOD_CD||F.CNT_CD as PRS_PK,
                   E.PETTERN_CD AS SALE_GDS_CD,
                   E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES as STANDARD,  /* 규 격 */
                   E.MAT_CD,                                                               /* 상품코드 */
                   E.MAT_NM,                                                               /* 상품명 */
                   F.PERIOD_CD,
                   PKG_RTCM0051.F_SRTCM0051CODENAME('S021',F.PERIOD_CD) AS PERIOD_NM,      /*렌탈기간 */
                   E.SEASON_CD,
                   PKG_RTCM0051.F_SRTCM0051CODENAME('S014',E.SEASON_CD) AS SEASON_NM,      /*계절구분명 */
                   F.CNT_CD,
                   PKG_RTCM0051.F_SRTCM0051CODENAME('S022',F.CNT_CD) AS CNT_NM,            /*본수 */
                   F.REGI_CD,
                   F.AMT,                                                                  /* 월 렌탈료 */
                   0 AS GROUP_SALE,
                   0 AS CHNL_SALE
              FROM RTSD0005 E, RTSD0008 F
             WHERE 1=1
               AND E.USE_YN = 'Y'
               AND E.MAT_CD = F.MAT_CD
               AND F.PRICE_CD = '0002'
               AND F.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---현재일
               AND F.END_DAY >= to_char(sysdate,'YYYYMMDD') ---현재일
          ) AA, RTSD0106 BB
        WHERE AA.PERIOD_CD = BB.PERIOD_CD --- 화면입력_렌탈기간
        AND AA.CNT_CD = BB.CNT_CD     --- 화면입력_타이어본수    
        AND AA.MAT_CD = BB.MAT_CD  -- 계약별    
        AND BB.ORD_NO = v_Ord_no;
        
    ELSE  /* TO-BE 데이터 조회 */
    
        OPEN Ref_Cursor FOR
        
        SELECT AA.PRS_PK,
               AA.SALE_GDS_CD,
               AA.STANDARD,
               AA.MAT_CD,
               AA.MAT_NM,
               AA.PERIOD_CD,
               AA.PERIOD_NM,
               AA.SEASON_CD,
               AA.SEASON_NM,
               AA.CNT_CD,
               AA.CNT_NM,
               AA.AMT,
               AA.GROUP_SALE,
               AA.CHNL_SALE,
               BB.ORD_NO,
               BB.SEQ,
               BB.ORD_ID,
               BB.REGI_CD,
               BB.FR_CD,
               PKG_RTCM0051.F_SRTCM0051CODENAME('S004', BB.FR_CD) AS FR_NM,             /*장착위치*/
               BB.LR_CD,
               BB.ORD_QTY,
               AA.REGI_AMT,
               BB.RENT_AMT,
               BB.RENTP_AMT,
               BB.F_DCRATE,
               BB.F_DCAMT,
               BB.MON_DCAMT,
               BB.MON_AMT,
               BB.PLAN_DAY,
               BB.PLAN_TM,
               BB.INST_DAY,
               BB.INST_TM,
               BB.INST_YN,
               BB.VAL_YN,
               BB.EQU_NO,
               BB.OS_ID,
               BB.OS_DAY,
               BB.STAT_CD,
               BB.FL_YN,
               BB.FR_YN,
               BB.RL_YN,
               BB.RR_YN,
               BB.MAT_DESC,
               BB.SALE_CD,
               BB.GDS_GB,
               BB.GDS_GRP
          FROM (SELECT E.MAT_CD||F.PERIOD_CD||F.CNT_CD as PRS_PK,
                       H.SALE_GDS_CD,                                                          /*패턴코드 */
                       E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES as STANDARD,  /* 규 격 */
                       E.MAT_CD,                                                               /* 상품코드 */
                       E.MAT_NM,                                                               /* 상품명 */
                       F.PERIOD_CD,
                       PKG_RTCM0051.F_SRTCM0051CODENAME('S021',F.PERIOD_CD) AS PERIOD_NM,      /*렌탈기간 */
                       E.SEASON_CD,
                       PKG_RTCM0051.F_SRTCM0051CODENAME('S014',E.SEASON_CD) AS SEASON_NM,      /*계절구분명 */
                       F.CNT_CD,
                       PKG_RTCM0051.F_SRTCM0051CODENAME('S022',F.CNT_CD) AS CNT_NM,            /*본수 */
                       F.REGI_CD,
                       --Pkg_Rtcm0051.f_sRtcm0051CodeName('S023',F.REGI_CD) AS REGI_AMT,         /*랜탈등록비 */
                       (SELECT T.AMT FROM RTSD0029 T WHERE '0'||T.CNT_CD = F.CNT_CD AND T.SALE_CD = G.SALE_CD) AS REGI_AMT,         /*랜탈등록비 */
                       F.AMT,                                                                  /* 월 렌탈료 */
                       B.FR_CD,
                       CASE WHEN G.PRDT_GRP_DTL = '03' THEN 
                            CASE WHEN G.DC_RATE = 0 THEN G.DC_AMT
                                 ELSE TRUNC(F.AMT * G.DC_RATE/100 )
                            END
                       END GROUP_SALE,     /* 단체할인 */
                       CASE WHEN G.PRDT_GRP_DTL IS NULL OR  G.PRDT_GRP_DTL !='03' THEN 
                            CASE WHEN G.DC_RATE = 0 THEN G.DC_AMT
                                 ELSE TRUNC(F.AMT * G.DC_RATE/100 ) 
                            END
                       END CHNL_SALE       /* 판매채널할인 */
                  FROM RTSD0001 A, RTSD0002 B, RTSD0004 C, RTSD0005 E, RTSD0008 F, RTSD0020 G, RTSD0021 H
                 WHERE A. MODEL_CD = B.MODEL_CD
                   AND A. MODEL_CD = C.MODEL_CD
                   AND A. CONTENTS_CD = C.CONTENTS_CD
                   AND A. CONTENTS_CD = B.CONTENTS_CD
                   AND B.FR_CD = C.FR_CD
                   AND C.SECTION_WIDTH = E.SECTION_WIDTH
                   AND C.ASPECT_RATIO = E.ASPECT_RATIO
                   AND C.WHEEL_INCHES = E.WHEEL_INCHES
                   AND C.PLY_RATING = E.PLY_RATING
                   AND A.USE_YN = 'Y'
                   AND B.USE_YN = 'Y'
                   AND C.USE_YN = 'Y'
                   AND E.USE_YN = 'Y'
                   AND F.PRICE_CD = '0002'
                   AND E.MAT_CD = F.MAT_CD
                   AND F.PRICE_CD = '0002'
                   AND F.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---현재일
                   AND F.END_DAY >= to_char(sysdate,'YYYYMMDD') ---현재일
                   AND G.SALE_CD = DECODE(v_Sale_Cd  , NULL, G.SALE_CD  , v_Sale_Cd)
                   AND G.SALE_CD = H.SALE_CD 
                   AND H.GDS_GB = '1' 
                   AND H.SALE_GDS_CD = E.PETTERN_CD    
                   AND A.MODEL_CD = DECODE(v_Model_Cd  , NULL, A.MODEL_CD  , v_Model_Cd)  --- 차량모델
                   AND B.CONTENTS_CD = DECODE(v_contents_Cd  , NULL, B.CONTENTS_CD  , v_contents_Cd)
              ) AA, RTSD0106 BB
        WHERE AA.PERIOD_CD = BB.PERIOD_CD --- 화면입력_렌탈기간
          AND AA.CNT_CD = BB.CNT_CD     --- 화면입력_타이어본수    
          AND AA.MAT_CD = BB.MAT_CD  -- 계약별  
          AND AA.FR_CD = BB.FR_CD
          AND BB.ORD_NO = v_Ord_no
        ORDER BY AA.SALE_GDS_CD;
        
    END IF;
    
  END p_sRtsd0008AddSelProduct;





  /*****************************************************************************
  -- 계약별 저장된 제품정보 Select 일시불
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddSelProductDirect (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드            */  
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,            /*타이어본수          */ 
    v_Ord_no         IN RTSD0106.ORD_NO%TYPE,            /*계약번호            */  
    v_Sale_Cd        IN RTSD0020.SALE_CD%TYPE            /*타이어본수          */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    
  SELECT
       T1.MAT_CD||T2.PERIOD_CD||T2.CNT_CD as PRS_PK, 
       T1.MAT_CD,
       T1.MAT_NM,
       T1.SECTION_WIDTH||'/'||T1.ASPECT_RATIO||'R'||T1.WHEEL_INCHES as STANDARD,
       T1.PETTERN_CD,
       T1.SEASON_CD,
       PKG_RTCM0051.F_SRTCM0051CODENAME('S014', T1.SEASON_CD) AS SEASON_NM,      /*계절구분명 */
       T2.PERIOD_CD,
       PKG_RTCM0051.F_SRTCM0051CODENAME('S021',T2.PERIOD_CD) AS PERIOD_NM,      /*렌탈기간 */
       T4.SALE_GDS_CD,
       T2.CNT_CD,
       PKG_RTCM0051.F_SRTCM0051CODENAME('S022',T2.CNT_CD) AS CNT_NM,
       T2.REGI_CD,
       (SELECT X.AMT FROM RTSD0029 X WHERE '0'||X.CNT_CD = T2.CNT_CD AND X.SALE_CD = T3.SALE_CD) AS REGI_AMT,         /*랜탈등록비 */
       T2.AMT,
       T.ORD_NO,
       T.SEQ,
       T.ORD_ID,
       T.REGI_CD,
       T.FR_CD,
       T.LR_CD,
       T.ORD_QTY,
       T.RENT_AMT,
       T.RENTP_AMT,
       T.F_DCRATE,
       T.F_DCAMT,
       T.MON_DCAMT,
       T.MON_AMT,
       T.PLAN_DAY,
       T.PLAN_TM,
       T.INST_DAY,
       T.INST_TM,
       T.INST_YN,
       T.VAL_YN,
       T.EQU_NO,
       T.OS_ID,
       T.OS_DAY,
       T.STAT_CD,
       T.FL_YN,
       T.FR_YN,
       T.RL_YN,
       T.RR_YN,
       T.MAT_DESC,
       T.SALE_CD,
       T.GDS_GB,
       T.GDS_GRP,
       CASE
         WHEN T3.PRDT_GRP_DTL = '3' THEN
         CASE
           WHEN T3.DC_RATE = 0 THEN T3.DC_AMT
           ELSE TRUNC(T2.AMT * T3.DC_RATE/100 )
         END
       END GROUP_SALE,
 /* 단체할인 */
       CASE
         WHEN T3.PRDT_GRP_DTL IS NULL
    OR T3.PRDT_GRP_DTL !='3' THEN
         CASE
           WHEN T3.DC_RATE = 0 THEN T3.DC_AMT
           ELSE TRUNC(T2.AMT * T3.DC_RATE/100 )
         END
       END CHNL_SALE /* 판매채널할인 */
  FROM RTSD0106 T,
       RTSD0005 T1,
       RTSD0008 T2,
       RTSD0020 T3,
       RTSD0021 T4
 WHERE  T.ORD_NO = DECODE(v_Ord_no  , NULL, T.ORD_NO  , v_Ord_no)  --- 차량모델
   AND T.MAT_CD = T1.MAT_CD
   AND T1.MAT_CD = T2.MAT_CD
   AND T.PERIOD_CD = T2.PERIOD_CD
   AND T.CNT_CD = T2.CNT_CD
   AND T2.PRICE_CD = '0002'
   AND T.SALE_CD = T3.SALE_CD
   AND T3.SALE_CD = DECODE(v_Sale_Cd  , NULL, T3.SALE_CD  , v_Sale_Cd)  --- 차량모델
   AND T.SALE_CD = T4.SALE_CD
   AND T4.GDS_GB = '1'
   AND T1.PETTERN_CD = T4.SALE_GDS_CD
   AND TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN T2.STR_DAY AND T2.END_DAY;    
    
  END p_sRtsd0008AddSelProductDirect;


  /*****************************************************************************
  -- 제품추가 패턴 콤보박스  Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028PetternCombo (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*차종                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*타이어본수          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*판메상품코드        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*차량상세            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,              /*장착위치            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
   
    /*SELECT 
        A.SALE_GDS_CD
       
    FROM  RTSD0021 A, RTSD0005 B
    WHERE A.SALE_CD = DECODE(v_Sale_Cd  , NULL, A.SALE_CD  , v_Sale_Cd)  --- 차량모델
    AND   B.SEASON_CD = DECODE(v_Season_Cd  , NULL, B.SEASON_CD  , v_Season_Cd)  --- 차량모델
    AND A.GDS_GB = '1'
    AND A.SALE_GDS_CD = B.PETTERN_CD
    GROUP BY A.SALE_GDS_CD
    ORDER BY A.SALE_GDS_CD;*/
    
    SELECT DISTINCT(AA.SALE_GDS_CD) AS SALE_GDS_CD
    FROM (
            SELECT
                E.SALE_GDS_CD   
            FROM RTSD0004 A, RTSD0005 B, RTSD0008 C, RTSD0021 E
            WHERE 1=1    
                AND A.SECTION_WIDTH = B.SECTION_WIDTH
                AND A.ASPECT_RATIO = B.ASPECT_RATIO
                AND A.WHEEL_INCHES = B.WHEEL_INCHES
                AND A.PLY_RATING = B.PLY_RATING
                AND A.USE_YN = 'Y'
                AND B.USE_YN = 'Y'
                AND C.PRICE_CD = '0002'
                AND B.MAT_CD = C.MAT_CD 
                AND C.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---현재일
                AND C.END_DAY >= to_char(sysdate,'YYYYMMDD') ---현재일
                AND E.GDS_GB = '1' 
                AND E.SALE_GDS_CD = B.PETTERN_CD
                AND B.MAT_CD NOT IN(SELECT MAT_CD FROM RTSD0046 WHERE SALE_CD=v_Sale_Cd)    
                AND E.SALE_CD = DECODE(v_Sale_Cd  , NULL, E.SALE_CD  , v_Sale_Cd)  --- 차량모델
                AND A.MODEL_CD = DECODE(v_Model_Cd  , NULL, A.MODEL_CD  , v_Model_Cd)  --- 차량모델
                AND C.PERIOD_CD = DECODE(v_Period_Cd  , NULL, C.PERIOD_CD  , v_Period_Cd)  --- 화면입력_렌탈기간
                AND C.CNT_CD = DECODE(v_Cnt_Cd  , NULL, C.CNT_CD  , v_Cnt_Cd)     --- 화면입력_타이어본수   
                AND A.CONTENTS_CD = DECODE(v_contents_Cd  , NULL, A.CONTENTS_CD  , v_contents_Cd)     --- 차량상세
                AND A.FR_CD = DECODE(v_fr_Cd  , NULL, A.FR_CD  , v_fr_Cd)     --- 장착위치
                AND B.SEASON_CD  = DECODE(v_Season_cd  , NULL, B.SEASON_CD  , v_Season_cd)                 ---계절구분
            ) AA
    ORDER BY AA.SALE_GDS_CD ASC;
    
    END p_sRtsd0028PetternCombo;

  /*****************************************************************************
  -- 제품추가 규격  콤보박스  Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028PetternComboStan (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*차종                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*타이어본수          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*판메상품코드        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*차량상세            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,              /*장착위치            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE,
    v_Pettern_cd    IN RTSD0005.PETTERN_CD%TYPE
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    
    SELECT DISTINCT(AA.SPEC_NM) AS SPEC_NM
    FROM (
            SELECT
                B.SECTION_WIDTH||'/'||B.ASPECT_RATIO||'R'||B.WHEEL_INCHES||' '||B.PLY_RATING||'P' AS SPEC_NM        
            FROM RTSD0004 A, RTSD0005 B, RTSD0008 C, RTSD0021 E
            WHERE 1=1    
                AND A.SECTION_WIDTH = B.SECTION_WIDTH
                AND A.ASPECT_RATIO = B.ASPECT_RATIO
                AND A.WHEEL_INCHES = B.WHEEL_INCHES
                AND A.PLY_RATING = B.PLY_RATING
                AND A.USE_YN = 'Y'
                AND B.USE_YN = 'Y'
                AND C.PRICE_CD = '0002'
                AND B.MAT_CD = C.MAT_CD 
                AND C.STR_DAY <= to_char(sysdate,'YYYYMMDD')  ---현재일
                AND C.END_DAY >= to_char(sysdate,'YYYYMMDD') ---현재일
                AND E.GDS_GB = '1' 
                AND E.SALE_GDS_CD = B.PETTERN_CD
                AND B.MAT_CD NOT IN(SELECT MAT_CD FROM RTSD0046 WHERE SALE_CD=v_Sale_Cd)    
                AND E.SALE_CD = DECODE(v_Sale_Cd  , NULL, E.SALE_CD  , v_Sale_Cd)  --- 차량모델
                AND A.MODEL_CD = DECODE(v_Model_Cd  , NULL, A.MODEL_CD  , v_Model_Cd)  --- 차량모델
                AND C.PERIOD_CD = DECODE(v_Period_Cd  , NULL, C.PERIOD_CD  , v_Period_Cd)  --- 화면입력_렌탈기간
                AND C.CNT_CD = DECODE(v_Cnt_Cd  , NULL, C.CNT_CD  , v_Cnt_Cd)     --- 화면입력_타이어본수   
                AND A.CONTENTS_CD = DECODE(v_contents_Cd  , NULL, A.CONTENTS_CD  , v_contents_Cd)     --- 차량상세
                AND A.FR_CD = DECODE(v_fr_Cd  , NULL, A.FR_CD  , v_fr_Cd)     --- 장착위치
                AND B.SEASON_CD  = DECODE(v_Season_cd  , NULL, B.SEASON_CD  , v_Season_cd)                 ---계절구분
                AND B.PETTERN_CD = DECODE(replace(v_Pettern_Cd,';apos;',''''), NULL, B.PETTERN_CD, replace(v_Pettern_Cd,';apos;','''')) 
           ) AA
    ORDER BY AA.SPEC_NM ASC;
   
    /*SELECT 
        T1.SEASON_CD
        ,T1.PETTERN_CD
        ,T1.SECTION_WIDTH
        ,T1.ASPECT_RATIO
        ,T1.WHEEL_INCHES
        ,T1.PLY_RATING
        ,T1.SECTION_WIDTH||'/'||T1.ASPECT_RATIO||'R'||T1.WHEEL_INCHES||' '||T1.PLY_RATING||'P' AS SPEC_NM
    FROM  RTSD0021 T, RTSD0005 T1, RTSD0004 T2
    WHERE T.SALE_CD = DECODE(v_Sale_Cd  , NULL, T.SALE_CD  , v_Sale_Cd)  --- 차량모델
    AND   T1.SEASON_CD = DECODE(v_Season_Cd  , NULL, T1.SEASON_CD  , v_Season_Cd)  --- 차량모델
    AND   T1.PETTERN_CD = DECODE(replace(v_Pettern_Cd,';apos;',''''), NULL, T1.PETTERN_CD, replace(v_Pettern_Cd,';apos;','''')) 
    AND T.GDS_GB            = '1'
    AND T1.USE_YN           = 'Y'
    AND T.SALE_GDS_CD       = T1.PETTERN_CD
    AND T2.USE_YN           = 'Y'
    AND T2.MODEL_CD         = DECODE(v_Model_Cd, NULL, T2.MODEL_CD ,v_Model_Cd)
    AND T2.CONTENTS_CD      = DECODE(v_Content_Cd, NULL, T2.CONTENTS_CD ,v_Content_Cd)
    AND T1.SECTION_WIDTH    = T2.SECTION_WIDTH
    AND T1.ASPECT_RATIO     = T2.ASPECT_RATIO
    AND T1.WHEEL_INCHES     = T2.WHEEL_INCHES
    AND T1.PLY_RATING       = T2.PLY_RATING 
    ORDER BY T1.PETTERN_CD;*/
    
    END p_sRtsd0028PetternComboStan;


  /*****************************************************************************
  -- 타이어 본수  체크
  *****************************************************************************/
  FUNCTION f_sRtsd0008GetWheelQty(
    v_Model_Cd      IN RTSD0001.MODEL_CD%TYPE,        /*장착 대리점           */
    v_contents_Cd   IN RTSD0001.CONTENTS_CD%TYPE,     /*장착 대리점           */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE            /*장착 대리점           */
    ) RETURN VARCHAR IS
    v_Wheel_Cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT 
            CASE 
                WHEN v_fr_Cd = 'Z' THEN 
                    MIN(T1.WHEEL_QTY) 
                ELSE 
                    MIN(T1.WHEEL_LIMIT_QTY)
        
            END WHEEL_QTY    
    
            INTO v_Wheel_Cnt
    
    FROM RTSD0001 T, RTSD0004 T1
    WHERE T.MODEL_CD = v_Model_Cd
    AND T.CONTENTS_CD = v_contents_Cd
    AND T1.FR_CD = v_fr_Cd
    AND T.MODEL_CD = T1.MODEL_CD
    AND T.CONTENTS_CD = T1.CONTENTS_CD
    AND T1.WHEEL_QTY = (SELECT MIN(A.WHEEL_QTY)  FROM RTSD0004 A WHERE A.MODEL_CD = T1.MODEL_CD AND A.CONTENTS_CD = T1.CONTENTS_CD AND A.FR_CD = T1.FR_CD);

    RETURN v_Wheel_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0008GetWheelQty;


  /*****************************************************************************
  -- 장착 가능 타이어 본수  체크
  *****************************************************************************/
  FUNCTION f_sRtsd0008GetWheelQtyLt(
    v_Model_Cd      IN RTSD0001.MODEL_CD%TYPE,        /*장착 대리점           */
    v_contents_Cd   IN RTSD0001.CONTENTS_CD%TYPE,     /*장착 대리점           */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE            /*장착 대리점           */
    ) RETURN VARCHAR IS
    v_Wheel_Cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT MIN(T1.WHEEL_QTY) AS WHEEL_QTY    
           INTO v_Wheel_Cnt
    FROM RTSD0001 T, RTSD0004 T1
    WHERE T.MODEL_CD = v_Model_Cd
    AND T.CONTENTS_CD = v_contents_Cd
    AND T1.FR_CD = v_fr_Cd
    AND T.MODEL_CD = T1.MODEL_CD
    AND T.CONTENTS_CD = T1.CONTENTS_CD
    AND T1.WHEEL_QTY = (SELECT MIN(A.WHEEL_QTY)  FROM RTSD0004 A WHERE A.MODEL_CD = T1.MODEL_CD AND A.CONTENTS_CD = T1.CONTENTS_CD AND A.FR_CD = T1.FR_CD);

    RETURN v_Wheel_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0008GetWheelQtyLt;
END Pkg_Rtsd0008;
/
