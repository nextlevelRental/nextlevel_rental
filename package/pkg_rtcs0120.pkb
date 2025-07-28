CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0120 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0120
   PURPOSE   사용자구매전제조사정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-06  kimhanna         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 사용자구매전제조사정보 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0120Count(
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0120
    WHERE   ORD_NO         = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0120Count;

  /*****************************************************************************
  -- 사용자구매전제조사정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0120 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*주문번호            */
            A.MF_CD,                     /*제조사코드          */
            A.MODEL_NM,                  /*모델명              */
            A.WIDTH_CD,                  /*단면폭              */
            A.RATIO_CD,                  /*편평비              */
            A.INCH_CD,                   /*인치                */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0120 A
    WHERE   A.ORD_NO           = DECODE(v_Ord_No         , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.MF_CD            = DECODE(v_Mf_Cd          , NULL, A.MF_CD           , v_Mf_Cd)
    AND     A.MODEL_NM         = DECODE(v_Model_Nm       , NULL, A.MODEL_NM        , v_Model_Nm)
    AND     A.WIDTH_CD         = DECODE(v_Width_Cd       , NULL, A.WIDTH_CD        , v_Width_Cd)
    AND     A.RATIO_CD         = DECODE(v_Ratio_Cd       , NULL, A.RATIO_CD        , v_Ratio_Cd)
    AND     A.INCH_CD          = DECODE(v_Inch_Cd        , NULL, A.INCH_CD         , v_Inch_Cd)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtcs0120;

  /*****************************************************************************
  -- 사용자구매전제조사정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0120 (
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0120 (
            ORD_NO,
            MF_CD,
            MODEL_NM,
            WIDTH_CD,
            RATIO_CD,
            INCH_CD,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Mf_Cd,
            v_Model_Nm,
            v_Width_Cd,
            v_Ratio_Cd,
            v_Inch_Cd,
            v_Reg_Id,
            sysdate,
            v_Reg_Id,
            sysdate
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0120;

  /*****************************************************************************
  -- 사용자구매전제조사정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0120 (
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0120
    SET    MF_CD            = v_Mf_Cd,
           MODEL_NM         = v_Model_Nm,
           WIDTH_CD         = v_Width_Cd,
           RATIO_CD         = v_Ratio_Cd,
           INCH_CD          = v_Inch_Cd,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = sysdate
    WHERE  ORD_NO           = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0120;

  /*****************************************************************************
  -- 사용자구매전제조사정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0120 (
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0120
    SET    ORD_NO           = v_Ord_No,
           MF_CD            = v_Mf_Cd,
           MODEL_NM         = v_Model_Nm,
           WIDTH_CD         = v_Width_Cd,
           RATIO_CD         = v_Ratio_Cd,
           INCH_CD          = v_Inch_Cd,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = sysdate
    WHERE  ORD_NO           = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0120;

  /*****************************************************************************
  -- 사용자구매전제조사정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0120 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN


    --오더번호
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '오더번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    --타이어제조사
    IF (TRIM(v_Mf_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S078',v_Mf_Cd)    ) THEN
        v_Return_Message := '타이어제조사('||v_Mf_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcs0120Count(v_Ord_No) THEN

        IF 0 != f_InsertRtcs0120(v_Ord_No,  v_Mf_Cd, v_Model_Nm, v_Width_Cd, v_Ratio_Cd, v_Inch_Cd, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '사용자구매전제조사정보 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
        IF 0 != f_UpdateRtcs0120(v_Ord_No,  v_Mf_Cd, v_Model_Nm, v_Width_Cd, v_Ratio_Cd, v_Inch_Cd, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '사용자구매전제조사정보 수정 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
 /*       IF vp_Comm_Dvsn IN ('U') THEN



        ELSIF vp_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0120(v_Ord_No,  v_Mf_Cd, v_Model_Nm, v_Width_Cd, v_Ratio_Cd, v_Inch_Cd, v_Reg_Id, v_ErrorText)  THEN
                v_Return_Message := '사용자구매전제조사정보 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||vp_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;

    END IF;
*/ END IF;
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0120.p_IUDRtcs0120(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0120.p_IUDRtcs0120(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0120;

 /*
  PROCEDURE p_IUDrtcs0120 (
    v_Call_No         IN RTCS0101.CALL_NO%TYPE,
    v_Ord_No          IN RTCS0120.ORD_NO%TYPE,
    v_Mf_Cd           IN RTCS0120.MF_CD%TYPE,
    v_Model_Nm        IN RTCS0120.MODEL_NM%TYPE,
    v_Width_Cd        IN RTCS0120.WIDTH_CD%TYPE,
    v_Ratio_Cd        IN RTCS0120.RATIO_CD%TYPE,
    v_Inch_Cd         IN RTCS0120.INCH_CD%TYPE,
    v_Reg_Id          IN RTCS0101.REG_ID%TYPE,
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText       OUT VARCHAR2
    )
  AS
    vp_Ord_No            RTCS0101.CALL_NO%TYPE;
    vp_Comm_Dvsn         varchar2(2);
    e_Error EXCEPTION;

  BEGIN

    SELECT NVL(ord_no,'F') INTO vp_Ord_No
    FROM RTCS0120
    WHERE ord_no = v_Ord_No;

    IF (vp_Ord_No IS NULL) THEN
      vp_Comm_Dvsn := 'I';
    ELSE
      vp_Comm_Dvsn := 'U';
    END IF;


    --오더번호
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '오더번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    --타이어제조사
    IF (TRIM(v_Mf_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S078',v_Mf_Cd)    ) THEN
        v_Return_Message := '타이어제조사('||v_Mf_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF vp_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtcs0120Count(v_Ord_no) THEN
            v_Return_Message := '해당 오더번호('||v_Call_No||')로 등록된 정보가 이미 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtcs0120(v_Ord_No,  v_Mf_Cd, v_Model_Nm, v_Width_Cd, v_Ratio_Cd, v_Inch_Cd, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '해피콜 제조사 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 = f_sRtcs0120Count(v_Ord_no) THEN
            v_Return_Message := '해당 오더번호('||v_Call_No||')로 등록된 정보가 없어 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        IF vp_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcs0120(v_Ord_No,  v_Mf_Cd, v_Model_Nm, v_Width_Cd, v_Ratio_Cd, v_Inch_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '해피콜 제조사 정보 수정 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0101.p_IUDRtcs0101(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0101.p_IUDRtcs0101(2)', v_ErrorText, v_Return_Message);

  END p_IUDrtcs0120;
  */

END Pkg_Rtcs0120;