CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0204 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0204
   PURPOSE   기업신용조회결과 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 기업신용조회결과 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0204Count(
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*사업자번호          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,          /*생성일              */
    v_Seq            IN RTSD0204.SEQ%TYPE               /*생성순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0204
    WHERE   BUSL_NO = v_Busl_No
    AND     CRE_DAY = v_Cre_Day
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0204Count;
  
  /*****************************************************************************
  -- 기업신용조회결과 Count(사업자번호 + 당일)
  *****************************************************************************/
  PROCEDURE p_sRtsd0204TodayCount(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*사업자번호          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE          /*생성일              */
    ) 
    IS
  BEGIN
    OPEN Ref_Cursor FOR
    
    SELECT  T1.BUSL_NO ,
            T1.CRE_DAY ,
            T1.CO_GRADE
    FROM    RTSD0204 T1
    WHERE   BUSL_NO = v_Busl_No
    AND     CRE_DAY = v_Cre_Day
    AND ROWNUM = 1;


  END p_sRtsd0204TodayCount;
  
 
  /*****************************************************************************
  -- 기업신용조회결과 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0204 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*생성순번              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*기업신용등급          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.BUSL_NO,                   /*사업자번호          */
            A.CRE_DAY,                   /*생성일              */
            A.SEQ,                       /*생성순번            */
            A.CO_GRADE,                  /*기업신용등급        */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0204 A
    WHERE   A.BUSL_NO  = DECODE(v_Busl_No  , NULL, A.BUSL_NO  , v_Busl_No)
    AND     A.CRE_DAY  = DECODE(v_Cre_Day  , NULL, A.CRE_DAY  , v_Cre_Day)
    AND     A.SEQ      = DECODE(v_Seq      , NULL, A.SEQ      , v_Seq)
    AND     A.CO_GRADE = DECODE(v_Co_Grade , NULL, A.CO_GRADE , v_Co_Grade)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtsd0204;

  /*****************************************************************************
  -- 기업신용조회결과 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*생성순번              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*기업신용등급          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0204 (
            BUSL_NO,
            CRE_DAY,
            SEQ,
            CO_GRADE,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Busl_No,
            v_Cre_Day,
            v_Seq,
            v_Co_Grade,
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

  END f_InsertRtsd0204;

  /*****************************************************************************
  -- 기업신용조회결과 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*생성순번              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*기업신용등급          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0204
    SET    CO_GRADE = v_Co_Grade,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  BUSL_NO  = v_Busl_No
    AND    CRE_DAY  = v_Cre_Day
    AND    SEQ      = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0204;

  /*****************************************************************************
  -- 기업신용조회결과 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*생성순번              */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0204
    WHERE  BUSL_NO  = v_Busl_No
    AND    CRE_DAY  = v_Cre_Day
    AND    SEQ      = v_Seq;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.f_DeleteRtsd0204(1)', '사업자번호', v_Busl_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.f_DeleteRtsd0204(1)', '생성일', v_Cre_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.f_DeleteRtsd0204(1)', '생성순번', v_Seq);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0204;

  /*****************************************************************************
  -- 기업신용조회결과 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0204 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN OUT RTSD0204.SEQ%TYPE,        /*생성순번              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*기업신용등급          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 사업자번호,생성일,기업신용등급, 등록자 ID
    IF TRIM(v_Busl_No) IS NULL THEN
        v_Return_Message := '사업자번호('||v_Busl_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Cre_Day) THEN
        v_Return_Message := '생성일('||v_Cre_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Co_Grade) IS NULL THEN
        v_Return_Message := '기업신용등급('||v_Co_Grade||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        v_Seq := f_sRtsd0204Seq(v_Busl_No, v_Cre_Day);
        
        IF 0 != f_InsertRtsd0204(v_Busl_No, v_Cre_Day, v_Seq, v_Co_Grade, 
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '기업신용조회결과 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
        
    ELSE
    
        IF 0 = f_sRtsd0204Count(v_Busl_No, v_Cre_Day, v_Seq) THEN
            v_Return_Message := '등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0204(v_Busl_No, v_Cre_Day, v_Seq, v_Co_Grade, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기업신용조회결과 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0204(v_Busl_No, v_Cre_Day, v_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기업신용조회결과 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.p_IUDRtsd0204(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0204.p_IUDRtsd0204(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0204;

  /*****************************************************************************
  -- 기업신용조회결과 - 순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0204Seq(
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*사업자번호          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE           /*생성일              */
    ) RETURN NUMBER IS
    v_Seq   RTSD0204.SEQ%TYPE DEFAULT NULL;             /*생성순번            */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ) 
                 FROM    RTSD0204
                 WHERE   BUSL_NO = v_Busl_No
                 AND     CRE_DAY = v_Cre_Day)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;
    
    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0204Seq;
  
END Pkg_Rtsd0204;
/
