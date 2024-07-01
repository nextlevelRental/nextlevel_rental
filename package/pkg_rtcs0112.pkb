CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0112 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0112
   PURPOSE   질문관리(질문번호) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 질문관리(질문번호) Count
  *****************************************************************************/
  FUNCTION f_sRtcs0112Count(
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE       /*질문번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0112
    WHERE   QUESTION_NO = v_Question_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0112Count;

  /*****************************************************************************
  -- 질문관리(질문번호) Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0112 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*사용여부              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*질문유형              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*질문                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*평가반영여부          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*답변번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.QUESTION_NO,                                                           /*질문번호            */
            A.USE_YN,                                                                /*사용여부            */
            A.QUESTION_TP,                                                           /*질문유형            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H004', A.QUESTION_TP) QUESTION_TP_NM,  /*질문유형            */
            A.QUESTION,                                                              /*질문                */
            A.CONF_YN,                                                               /*평가반영여부        */
            A.ANSWER_NO,                                                             /*답변번호            */
            B.ANSWER,                                                                /*답변내용            */
            A.REG_ID,                                                                /*등록자 ID           */
            A.REG_DT,                                                                /*등록일              */
            A.CHG_ID,                                                                /*변경자 ID           */
            A.CHG_DT                                                                 /*변경일              */
    FROM    RTCS0112 A
            ,RTCS0113 B 
    WHERE   A.ANSWER_NO   = B.ANSWER_NO
    AND     A.QUESTION_NO = DECODE(v_Question_No , NULL, A.QUESTION_NO, v_Question_No)
    AND     A.USE_YN      = DECODE(v_Use_Yn      , NULL, A.USE_YN     , v_Use_Yn)
    AND     A.QUESTION_TP = DECODE(v_Question_Tp , NULL, A.QUESTION_TP, v_Question_Tp)
    AND     A.QUESTION    = DECODE(v_Question    , NULL, A.QUESTION   , v_Question)
    AND     A.CONF_YN     = DECODE(v_Conf_Yn     , NULL, A.CONF_YN    , v_Conf_Yn)
    AND     A.ANSWER_NO   = DECODE(v_Answer_No   , NULL, A.ANSWER_NO  , v_Answer_No)
    AND     A.REG_ID      = DECODE(v_Reg_Id      , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtcs0112;

  /*****************************************************************************
  -- 질문관리(질문번호) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*사용여부              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*질문유형              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*질문                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*평가반영여부          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*답변번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0112 (
            QUESTION_NO,
            USE_YN,
            QUESTION_TP,
            QUESTION,
            CONF_YN,
            ANSWER_NO,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Question_No,
            v_Use_Yn,
            v_Question_Tp,
            v_Question,
            v_Conf_Yn,
            v_Answer_No,
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

  END f_InsertRtcs0112;

  /*****************************************************************************
  -- 질문관리(질문번호) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*사용여부              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*질문유형              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*질문                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*평가반영여부          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*답변번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0112
    SET    USE_YN      = v_Use_Yn,
           QUESTION_TP = v_Question_Tp,
           QUESTION    = v_Question,
           CONF_YN     = v_Conf_Yn,
           ANSWER_NO   = v_Answer_No,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE 
    WHERE  QUESTION_NO = v_Question_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0112;

  /*****************************************************************************
  -- 질문관리(질문번호) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0112 (
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0112
    SET    USE_YN      = 'N',
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE 
    WHERE  QUESTION_NO = v_Question_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0112;

  /*****************************************************************************
  -- 질문관리(질문번호) 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0112 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Question_No    IN RTCS0112.QUESTION_NO%TYPE,    /*질문번호              */
    v_Use_Yn         IN RTCS0112.USE_YN%TYPE,         /*사용여부              */
    v_Question_Tp    IN RTCS0112.QUESTION_TP%TYPE,    /*질문유형              */
    v_Question       IN RTCS0112.QUESTION%TYPE,       /*질문                  */
    v_Conf_Yn        IN RTCS0112.CONF_YN%TYPE,        /*평가반영여부          */
    v_Answer_No      IN RTCS0112.ANSWER_NO%TYPE,      /*답변번호              */
    v_Reg_Id         IN RTCS0112.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 질문번호,사용여부,질문유형,평가반영여부,  등록자 ID
    IF (TRIM(v_Question_No) IS NULL) OR (LENGTH(TRIM(v_Question_No)) != 3) THEN
        v_Return_Message := '질문번호('||v_Question_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Question_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H004', v_Question_Tp)) THEN
        v_Return_Message := '질문유형('||v_Question_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Conf_Yn) IS NULL) OR (TRIM(v_Conf_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '평가반영여부('||v_Conf_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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
    
        IF 0 != f_sRtcs0112Count(v_Question_No) THEN
            v_Return_Message := '해당 질문번호('||v_Question_No||')는 이미 등록된 정보이므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtcs0112(v_Question_No, v_Use_Yn, v_Question_Tp, v_Question, 
                                 v_Conf_Yn, v_Answer_No, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '질문관리(질문번호) 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtcs0112Count(v_Question_No) THEN
            v_Return_Message := '해당 질문번호('||v_Question_No||')는 등록된 정보가 아니므로 수정 또는 삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcs0112(v_Question_No, v_Use_Yn, v_Question_Tp, v_Question, 
                                     v_Conf_Yn, v_Answer_No, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '질문관리(질문번호) 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcs0112(v_Question_No, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '질문관리(질문번호) 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0112.p_IUDRtcs0112(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0112.p_IUDRtcs0112(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0112;

  /*****************************************************************************
  -- 평가반영여부조회
  *****************************************************************************/
  FUNCTION f_sRtcs0112_JSYN(
    v_Question_No        IN RTCS0112.QUESTION_NO%TYPE   /*질문번호            */
    ) RETURN VARCHAR IS
    v_Conf_Nm        RTCS0112.QUESTION%TYPE;            /*반영여부Y           */
  BEGIN

    SELECT  CONF_YN
    INTO    v_Conf_Nm
    FROM    RTCS0112
    WHERE   QUESTION_NO = v_Question_No;
    
    RETURN  v_Conf_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcs0112_JSYN;

END Pkg_Rtcs0112;
/
