CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0094 AS
/*******************************************************************************
   NAME      Pkg_Rtcm0094
   PURPOSE   프로시져 변수 로그 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 프로시져 변수 로그 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0094Count(
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,           /*로그순번            */
    v_Pseq           IN RTCM0094.PSEQ%TYPE              /*매개변수 순서       */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0094
    WHERE   LOGSEQ = v_Logseq
    AND     PSEQ   = v_Pseq;
    
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0094Count;

  /*****************************************************************************
  -- 프로시져 변수 로그 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0094 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE          /*로그순번              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.LOGSEQ,                    /*로그순번            */
            A.PSEQ,                      /*매개변수 순서       */
            A.PAR_NM,                    /*매개변수 명         */
            A.PAR_VALUE                  /*매개변수 값         */
    FROM    RTCM0094 A
    WHERE   A.LOGSEQ = v_Logseq
    ORDER   BY A.PSEQ;

  END p_sRtcm0094;

  /*****************************************************************************
  -- 프로시져 변수 로그 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*로그순번              */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*매개변수 명           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*매개변수 값           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0094 (
            LOGSEQ,
            PSEQ,
            PAR_NM,
            PAR_VALUE
            )
    VALUES  (
            v_Logseq,
            NVL((SELECT MAX(PSEQ)+1
                 FROM    RTCM0094
                 WHERE   LOGSEQ = v_Logseq), 1),
            v_Par_Nm,
            v_Par_Value
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0094;

  /*****************************************************************************
  -- 프로시져 변수 로그 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*로그순번              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*매개변수 순서         */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*매개변수 명           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*매개변수 값           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0094
    SET    PAR_NM    = v_Par_Nm,
           PAR_VALUE = v_Par_Value 
    WHERE  LOGSEQ    = v_Logseq
    AND    PSEQ      = v_Pseq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0094;

  /*****************************************************************************
  -- 프로시져 변수 로그 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*로그순번              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*매개변수 순서         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
  
    DELETE RTCM0094
    WHERE  LOGSEQ = v_Logseq
    AND    PSEQ   = v_Pseq;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0094.f_DeleteRtcm0094(1)', 'v_Logseq', v_Logseq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0094.f_DeleteRtcm0094(1)', 'v_Pseq', v_Pseq);
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0094;

  /*****************************************************************************
  -- 프로시져 변수 로그 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0094 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*로그순번              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*매개변수 순서         */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*매개변수 명           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*매개변수 값           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:로그순번, 매개변수 명    
    IF TRIM(v_Logseq) IS NULL THEN
        v_Return_Message := '로그순번('||v_Logseq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Par_Nm) IS NULL  THEN
        v_Return_Message := '매개변수 명('||v_Par_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtcm0094(v_Logseq, v_Par_Nm, v_Par_Value, v_ErrorText) THEN
            v_Return_Message := '프로시져 변수 로그 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtcm0094Count(v_Logseq, v_Pseq) THEN
            v_Return_Message := '해당 로그순번('||v_Logseq||'),매개순번('||v_Pseq||')은 미등록 상태이므로 처리불가!!';
            RAISE e_Error;        
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0094(v_Logseq, v_Pseq, v_Par_Nm, v_Par_Value, v_ErrorText) THEN
                v_Return_Message := '프로시져 변수 로그 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0094(v_Logseq, v_Pseq, v_ErrorText) THEN
                v_Return_Message := '프로시져 변수 로그 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0094.p_IUDRtcm0094(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0094.p_IUDRtcm0094(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0094;

END Pkg_Rtcm0094;