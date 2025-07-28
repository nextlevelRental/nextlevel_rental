CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0113 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0113
   PURPOSE   질문관리(답변번호) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 질문관리(답변번호) Count
  *****************************************************************************/
  FUNCTION f_sRtcs0113Count(
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,        /*답변번호            */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE        /*답변순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0113
    WHERE   ANSWER_NO      = v_Answer_No
    AND     ANSWER_SEQ     = v_Answer_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0113Count;

  /*****************************************************************************
  -- 질문관리(답변번호) Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0113 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*사용여부              */
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*답변내용              */
    v_Score          IN RTCS0113.SCORE%TYPE,          /*점수                  */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ANSWER_NO,                 /*답변번호            */
            A.ANSWER_SEQ,                /*답변순번            */
            A.USE_YN,                    /*사용여부            */
            A.ANSWER,                    /*답변내용            */
            A.SCORE,                     /*점수                */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0113 A
    WHERE   A.ANSWER_NO  = DECODE(v_Answer_No  , NULL, A.ANSWER_NO  , v_Answer_No)
    AND     A.ANSWER_SEQ = DECODE(v_Answer_Seq , NULL, A.ANSWER_SEQ , v_Answer_Seq)
    AND     A.USE_YN     = DECODE(v_Use_Yn     , NULL, A.USE_YN     , v_Use_Yn)
    AND     A.ANSWER     = DECODE(v_Answer     , NULL, A.ANSWER     , v_Answer)
--    AND     (A.SCORE IS NULL OR A.SCORE = v_Score)
    AND   ( A.SCORE     IS NULL OR
            A.SCORE      = DECODE(v_Score      , NULL, A.SCORE      , v_Score))
    AND     A.REG_ID     = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtcs0113;

  /*****************************************************************************
  -- 질문관리(답변번호) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0113 (
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*사용여부              */
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*답변내용              */
    v_Score          IN RTCS0113.SCORE%TYPE,          /*점수                  */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0113 (
            ANSWER_NO,
            ANSWER_SEQ,
            USE_YN,
            ANSWER,
            SCORE,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Answer_No,
            v_Answer_Seq,
            v_Use_Yn,
            v_Answer,
            v_Score,
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

  END f_InsertRtcs0113;

  /*****************************************************************************
  -- 질문관리(답변번호) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0113 (
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*사용여부              */
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*답변내용              */
    v_Score          IN RTCS0113.SCORE%TYPE,          /*점수                  */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0113
    SET    USE_YN     = v_Use_Yn,
           ANSWER     = v_Answer,
           SCORE      = v_Score,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  ANSWER_NO  = v_Answer_No
    AND    ANSWER_SEQ = v_Answer_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0113;

  /*****************************************************************************
  -- 질문관리(답변번호) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0113 (
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0113
    SET    USE_YN     = 'N',
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  ANSWER_NO  = v_Answer_No
    AND    ANSWER_SEQ = v_Answer_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0113;

  /*****************************************************************************
  -- 질문관리(답변번호) 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0113 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*답변번호              */
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*답변순번              */
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*사용여부              */
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*답변내용              */
    v_Score          IN RTCS0113.SCORE%TYPE,          /*점수                  */
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 답변번호,답변순번, 사용여부, 등록자 ID
    IF (TRIM(v_Answer_No) IS NULL) OR (LENGTH(TRIM(v_Answer_No)) != 3) THEN
        v_Return_Message := '답변번호('||v_Answer_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Answer_Seq) IS NULL) OR (LENGTH(TRIM(v_Answer_Seq)) != 3) THEN
        v_Return_Message := '답변순번('||v_Answer_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Use_Yn) IS NULL) OR (TRIM(v_Use_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_sRtcs0113Count(v_Answer_No, v_Answer_Seq) THEN
            v_Return_Message := '해당 답변순번('||v_Reg_Id||')은 이미 등록된 정보이므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtcs0113(v_Answer_No, v_Answer_Seq, v_Use_Yn, v_Answer, 
                                 v_Score, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '질문관리(답변번호) 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtcs0113Count(v_Answer_No, v_Answer_Seq) THEN
            v_Return_Message := '해당 답변순번('||v_Answer_Seq||')은 등록된 정보가 아니므로 수정 또는 삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcs0113(v_Answer_No, v_Answer_Seq, v_Use_Yn, v_Answer, 
                                     v_Score, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '질문관리(답변번호) 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcs0113(v_Answer_No, v_Answer_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '질문관리(답변번호) 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0113.p_IUDRtcs0113(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0113.p_IUDRtcs0113(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0113;
  
  /*****************************************************************************
  -- 평가반영점수조회
  *****************************************************************************/
  FUNCTION f_sRtcs0113_JS(
    v_Answer_No        IN RTCS0113.ANSWER_NO%TYPE,      /*질문번호            */
    v_Answer_Seq       IN RTCS0113.ANSWER_SEQ%TYPE      /*질문번호            */
    ) RETURN NUMBER IS
    v_Score               RTCS0113.SCORE%TYPE;          /*점수                */
  BEGIN

    SELECT  SCORE
    INTO    v_Score
    FROM    RTCS0113
    WHERE   ANSWER_NO = v_Answer_No
    AND     ANSWER_SEQ = v_Answer_Seq;
    
    RETURN  v_Score;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcs0113_JS;
  

END Pkg_Rtcs0113;