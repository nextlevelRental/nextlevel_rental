CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0003 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0003
   PURPOSE   렌탈 매출원가 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-09  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 렌탈 매출원가 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0003Count(
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,           /*마감년월            */
    v_Matnr          IN RTCS0003.MATNR%TYPE             /*상품코드            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0003
    WHERE   ZMONTH = v_Zmonth
    AND     MATNR  = v_Matnr;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0003Count;

  /*****************************************************************************
  -- 렌탈 매출원가 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0003 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*상품수량              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*마감여부              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ZMONTH,                    /*마감년월            */
            A.MATNR,                     /*상품코드            */
            A.MENGE,                     /*상품수량            */
            A.COSGAMT,                   /*매출원가            */
            A.CLOSE_YN,                  /*마감여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0003 A
    WHERE   A.ZMONTH           = DECODE(v_Zmonth         , NULL, A.ZMONTH          , v_Zmonth)
    AND     A.MATNR            = DECODE(v_Matnr          , NULL, A.MATNR           , v_Matnr)
    AND     A.MENGE            = DECODE(v_Menge          , NULL, A.MENGE           , v_Menge)
    AND     A.COSGAMT          = DECODE(v_Cosgamt        , NULL, A.COSGAMT         , v_Cosgamt)
    AND     A.CLOSE_YN         = DECODE(v_Close_Yn       , NULL, A.CLOSE_YN        , v_Close_Yn)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtcs0003;

  /*****************************************************************************
  -- 렌탈 매출원가 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*상품수량              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*마감여부              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0003 (
            ZMONTH,
            MATNR,
            MENGE,
            COSGAMT,
            CLOSE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Zmonth,
            v_Matnr,
            v_Menge,
            v_Cosgamt,
            v_Close_Yn,
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

  END f_InsertRtcs0003;

  /*****************************************************************************
  -- 렌탈 매출원가 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*상품수량              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*마감여부              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0003
    SET    MENGE    = v_Menge,
           COSGAMT  = v_Cosgamt,
           CLOSE_YN = v_Close_Yn,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  ZMONTH   = v_Zmonth
    AND    MATNR    = v_Matnr;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0003;

  /*****************************************************************************
  -- 렌탈 매출원가 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0003
    SET    CLOSE_YN = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  ZMONTH   = v_Zmonth
    AND    MATNR    = v_Matnr;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0003;

  /*****************************************************************************
  -- 렌탈 매출원가 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0003 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*상품수량              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*마감여부              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcs0003Count(v_Zmonth, v_Matnr) THEN

        IF 0 != f_InsertRtcs0003(v_Zmonth, v_Matnr, v_Menge, v_Cosgamt, 
                                 v_Close_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '등록 실패!!!';
            RAISE e_Error;

        END IF;
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRtcs0003(v_Zmonth, v_Matnr, v_Menge, v_Cosgamt, 
                                     v_Close_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수정 실패!!!';
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtcs0003(v_Zmonth, v_Matnr, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '삭제 실패!!!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0003.p_IUDRtcs0003(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0003.p_IUDRtcs0003(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0003;

  /*****************************************************************************
  -- 렌탈 매출원가 마감여부 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0003CloseCount(
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE        /*마감여부              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0003
    WHERE   ZMONTH    = v_Zmonth
    AND     CLOSE_YN  = v_Close_Yn;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0003CloseCount;

END Pkg_Rtcs0003;