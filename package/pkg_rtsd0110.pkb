CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0110 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0110
   PURPOSE   본인인증 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 본인인증 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0110Count(
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,          /*고객번호            */
    v_Seq            IN RTSD0110.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0110
    WHERE   CUST_NO = v_Cust_No
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0110Count;

  /*****************************************************************************
  -- 본인인증 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0110 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Cert_FDay      IN RTSD0110.CERT_DAY%TYPE,       /*인증일자FROM          */
    v_Cert_TDay      IN RTSD0110.CERT_DAY%TYPE        /*인증일자TO            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.SEQ,                       /*순번                */
            A.CERT_DAY,                  /*인증일자            */
            A.SAFEKEY,                   /*인증번호            */
            A.CERT_CD,                   /*본인인증방법        */
            A.CERT_YN,                   /*인증여부            */
            A.MOB_NO,                    /*휴대폰번호          */
            A.MOB_FIRM,                  /*통신사              */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0110 A
    WHERE   A.CUST_NO  = v_Cust_No
    AND     A.CERT_DAY BETWEEN v_Cert_FDay AND v_Cert_TDay;

  END p_sRtsd0110;

  /*****************************************************************************
  -- 본인인증 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*순번                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*인증일자              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*인증번호              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*인증여부              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*통신사                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0110 (
            CUST_NO,
            SEQ,
            CERT_DAY,
            SAFEKEY,
            CERT_CD,
            CERT_YN,
            MOB_NO,
            MOB_FIRM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Cust_No,
            v_Seq,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
            v_Safekey,
            v_Cert_Cd,
            v_Cert_Yn,
            v_Mob_No,
            v_Mob_Firm,
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

  END f_InsertRtsd0110;

  /*****************************************************************************
  -- 본인인증 이력 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*순번                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*인증일자              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*인증번호              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*인증여부              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*통신사                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0110
    SET    CERT_DAY = v_Cert_Day,
           SAFEKEY  = v_Safekey,
           CERT_CD  = v_Cert_Cd,
           CERT_YN  = v_Cert_Yn,
           MOB_NO   = v_Mob_No,
           MOB_FIRM = v_Mob_Firm,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  CUST_NO  = v_Cust_No
    AND    SEQ      = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0110;

  /*****************************************************************************
  -- 본인인증 이력 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0110
    WHERE  CUST_NO = v_Cust_No
    AND    SEQ     = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.f_DeleteRtsd0110(2)', '고객번호', v_Cust_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.f_DeleteRtsd0110(2)', '순번', v_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.f_DeleteRtsd0110(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0110;

  /*****************************************************************************
  -- 본인인증 이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0110 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Seq            IN OUT RTSD0110.SEQ%TYPE,        /*순번                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*인증일자              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*인증번호              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*인증여부              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*통신사                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 고객번호 , 인증일자 , 인증번호 , 본인인증방법 , 인증여부 , 휴대폰번호 , 통신사 , 등록자 ID
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

--    IF 0 != ISDATE(v_Cert_Day) THEN
--        v_Return_Message := '인증일자('||v_Cert_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;

    IF TRIM(v_Safekey) IS NULL THEN
        v_Return_Message := '인증번호('||v_Safekey||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cert_Cd) IS NULL THEN
        v_Return_Message := '본인인증방법('||v_Cert_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cert_Yn) IS NULL) OR (TRIM(v_Cert_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '인증여부('||v_Cert_Yn ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_No) IS NULL THEN
        v_Return_Message := '휴대폰번호('||v_Mob_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_Firm) IS NULL THEN
        v_Return_Message := '통신사('||v_Mob_Firm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN


        IF 0 != f_sRtsd0110Count(v_Cust_No, v_Seq) THEN
            v_Return_Message := '해당 본인인증 이력('||v_Cust_No||'-'||v_Seq||')은 이미 등록된 상태이므로 신규등록처리가 불가합니다.!';
            RAISE e_Error;
        END IF;

        v_Seq := f_sRtsd0110Seq(v_Cust_No);

        IF 0 != f_InsertRtsd0110(v_Cust_No, v_Seq, v_Cert_Day, v_Safekey,
                                 v_Cert_Cd, v_Cert_Yn, v_Mob_No, v_Mob_Firm,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '본인인증 이력 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE

        IF 0 = f_sRtsd0110Count(v_Cust_No, v_Seq) THEN
            v_Return_Message := '해당 본인인증 이력('||v_Cust_No||'-'||v_Seq||')은 등록 안된 상태이므로 수정/삭제 처리가 불가합니다.!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0110(v_Cust_No, v_Seq, v_Cert_Day, v_Safekey,
                                     v_Cert_Cd, v_Cert_Yn, v_Mob_No, v_Mob_Firm,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '본인인증 이력 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0110(v_Cust_No, v_Seq, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '본인인증 이력 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.p_IUDRtsd0110(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0110.p_IUDRtsd0110(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0110;

  /*****************************************************************************
  -- 본인인증 이력 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0110Seq(
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER IS
    v_Seq RTSD0110.SEQ%TYPE DEFAULT NULL;               /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTSD0110
                 WHERE   CUST_NO = v_Cust_No)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0110Seq;

  /*****************************************************************************
  -- 본인인증 이력 Select Max Seq
  *****************************************************************************/
  PROCEDURE p_sRtsd0110_MaxSeq (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE         /*고객번호              */
    ) IS
  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.SEQ,                       /*순번                */
            A.CERT_DAY,                  /*인증일자            */
            A.SAFEKEY,                   /*인증번호            */
            A.CERT_CD,                   /*본인인증방법        */
            A.CERT_YN,                   /*인증여부            */
            A.MOB_NO,                    /*휴대폰번호          */
            A.MOB_FIRM,                  /*통신사              */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0110 A
    WHERE   A.CUST_NO = v_Cust_No
    AND     A.SEQ     = (SELECT MAX(SEQ) FROM RTSD0110 WHERE CUST_NO  = v_Cust_No);
    
  END p_sRtsd0110_MaxSeq;

END Pkg_Rtsd0110;