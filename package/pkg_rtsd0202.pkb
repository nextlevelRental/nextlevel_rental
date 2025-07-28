CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0202 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0202
   PURPOSE   개인신용조회결과 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 개인신용조회결과 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0202Count(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*인증번호            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,          /*생성일              */
    v_Seq            IN RTSD0202.SEQ%TYPE               /*생성순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0202
    WHERE   SAFEKEY = v_Safekey
    AND     CRE_DAY = v_Cre_Day
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0202Count;
  
  
  /*****************************************************************************
  -- 개인신용조회결과당일기준 (Safekey + 생성일)
  *****************************************************************************/
  FUNCTION f_sRtsd0202TodayCount(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*인증번호            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE          /*생성일              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0202
    WHERE   SAFEKEY = v_Safekey
    AND     CRE_DAY = v_Cre_Day;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0202TodayCount;

  /*****************************************************************************
  -- 개인신용조회결과 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0202 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*생성순번              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*신용등급              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SAFEKEY,                   /*인증번호            */
            A.CRE_DAY,                   /*생성일              */
            A.SEQ,                       /*생성순번            */
            A.CR_GRADE,                  /*신용등급            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0202 A
    WHERE   A.SAFEKEY  = DECODE(v_Safekey , NULL, A.SAFEKEY , v_Safekey)
    AND     A.CRE_DAY  = DECODE(v_Cre_Day , NULL, A.CRE_DAY , v_Cre_Day)
    AND     A.SEQ      = DECODE(v_Seq     , NULL, A.SEQ     , v_Seq)
    AND     A.CR_GRADE = DECODE(v_Cr_Grade, NULL, A.CR_GRADE, v_Cr_Grade)
    AND     A.REG_ID   = DECODE(v_Reg_Id  , NULL, A.REG_ID  , v_Reg_Id)
    ORDER   BY SAFEKEY, CRE_DAY, SEQ DESC;

  END p_sRtsd0202;
  
  
  /*****************************************************************************
  -- 개인신용조회결과 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0202TodayExists (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE         /*생성일                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SAFEKEY,                   /*인증번호            */
            A.CRE_DAY,                   /*생성일              */
            A.SEQ,                       /*생성순번            */
            A.CR_GRADE,                  /*신용등급            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0202 A
    WHERE   A.SAFEKEY = v_Safekey
    AND     A.CRE_DAY = v_Cre_Day
    AND     ROWNUM    <= 1
    ORDER BY SAFEKEY, CRE_DAY, SEQ DESC;

  END p_sRtsd0202TodayExists;

  /*****************************************************************************
  -- 개인신용조회결과 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*생성순번              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*신용등급              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0202 (
            SAFEKEY,
            CRE_DAY,
            SEQ,
            CR_GRADE,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Safekey,
            v_Cre_Day,
            v_Seq,
            v_Cr_Grade,
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

  END f_InsertRtsd0202;

  /*****************************************************************************
  -- 개인신용조회결과 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*생성순번              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*신용등급              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0202
    SET    CR_GRADE = v_Cr_Grade,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  SAFEKEY  = v_Safekey
    AND    CRE_DAY  = v_Cre_Day
    AND    SEQ      = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0202;

  /*****************************************************************************
  -- 개인신용조회결과 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*생성순번              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0202
    WHERE  SAFEKEY  = v_Safekey
    AND    CRE_DAY  = v_Cre_Day
    AND    SEQ      = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', '인증번호', v_Safekey);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', '생성일', v_Cre_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', '생성순번', v_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', '등록자 ID', v_Reg_Id);
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0202;

  /*****************************************************************************
  -- 개인신용조회결과 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0202 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN OUT RTSD0202.SEQ%TYPE,        /*생성순번              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*신용등급              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 인증번호, 생성일,신용등급, 등록자 ID
    IF TRIM(v_Safekey) IS NULL THEN
        v_Return_Message := '인증번호('||v_Safekey||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 != ISDATE(v_Cre_Day) THEN
        v_Return_Message := '생성일('||v_Cre_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cr_Grade) IS NULL THEN
        v_Return_Message := '신용등급('||v_Cr_Grade||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
        
        v_Seq := f_sRtsd0202Seq(v_Safekey, v_Cre_Day);
        
        IF 0 != f_InsertRtsd0202(v_Safekey, v_Cre_Day, v_Seq, v_Cr_Grade, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '개인신용조회결과 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtsd0202Count(v_Safekey, v_Cre_Day, v_Seq) THEN
            v_Return_Message := '등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0202(v_Safekey, v_Cre_Day, v_Seq, v_Cr_Grade, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '개인신용조회결과 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0202(v_Safekey, v_Cre_Day, v_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '개인신용조회결과 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0202.p_IUDRtsd0202(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0202;

  /*****************************************************************************
  -- 개인신용조회결과 - 순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0202Seq(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*인증번호            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE           /*생성일              */
    ) RETURN NUMBER IS
    v_Seq   RTSD0202.SEQ%TYPE DEFAULT NULL;             /*생성순번            */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ) 
                 FROM    RTSD0202
                 WHERE   SAFEKEY = v_Safekey
                 AND     CRE_DAY = v_Cre_Day)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0202Seq;
  
END Pkg_Rtsd0202;