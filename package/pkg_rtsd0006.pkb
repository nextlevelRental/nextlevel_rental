CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0006 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0006
   PURPOSE   우편번호 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 우편번호 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0006Count(
    v_Ser_No         IN RTSD0006.SER_NO%TYPE            /*일련번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0006
    WHERE   SER_NO = v_Ser_No;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0006Count;

  /*****************************************************************************
  -- 우편번호 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0006 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*우편번호              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*시도                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*군,구                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*동                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*번지                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SER_NO,                    /*일련번호            */
            A.POS_CD,                    /*우편번호            */
            A.ADDRR1,                    /*시도                */
            A.ADDRR2,                    /*군,구               */
            A.ADDRR3,                    /*동                  */
            A.ADDRR4,                    /*번지                */
            A.SIDO_CD,                   /*시,도 코드          */
            A.SIGUN_CD,                  /*시,군,구 코드       */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0006 A
    WHERE   A.SER_NO   = DECODE(v_Ser_No   , NULL, A.SER_NO   , v_Ser_No)
    AND     A.POS_CD   = DECODE(v_Pos_Cd   , NULL, A.POS_CD   , v_Pos_Cd)
    AND     A.ADDRR1   = DECODE(v_Addrr1   , NULL, A.ADDRR1   , v_Addrr1)
    AND     A.ADDRR2   = DECODE(v_Addrr2   , NULL, A.ADDRR2   , v_Addrr2)
    AND     A.ADDRR3   = DECODE(v_Addrr3   , NULL, A.ADDRR3   , v_Addrr3)
    AND     A.ADDRR4   = DECODE(v_Addrr4   , NULL, A.ADDRR4   , v_Addrr4)
    AND     A.SIDO_CD  = DECODE(v_Sido_Cd  , NULL, A.SIDO_CD  , v_Sido_Cd)
    AND     A.SIGUN_CD = DECODE(v_Sigun_Cd , NULL, A.SIGUN_CD , v_Sigun_Cd)
    AND     A.USE_YN   = DECODE(v_Use_Yn   , NULL, A.USE_YN   , v_Use_Yn)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtsd0006;

  /*****************************************************************************
  -- 우편번호 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0006 (
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*우편번호              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*시도                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*군,구                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*동                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*번지                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0006 (
            SER_NO,
            POS_CD,
            ADDRR1,
            ADDRR2,
            ADDRR3,
            ADDRR4,
            SIDO_CD,
            SIGUN_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ser_No,
            v_Pos_Cd,
            v_Addrr1,
            v_Addrr2,
            v_Addrr3,
            v_Addrr4,
            v_Sido_Cd,
            v_Sigun_Cd,
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

  END f_InsertRtsd0006;

  /*****************************************************************************
  -- 우편번호 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0006 (
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*우편번호              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*시도                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*군,구                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*동                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*번지                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0006
    SET    POS_CD   = v_Pos_Cd,
           ADDRR1   = v_Addrr1,
           ADDRR2   = v_Addrr2,
           ADDRR3   = v_Addrr3,
           ADDRR4   = v_Addrr4,
           SIDO_CD  = v_Sido_Cd,
           SIGUN_CD = v_Sigun_Cd,
           USE_YN   = v_Use_Yn,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  SER_NO   = v_Ser_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0006;

  /*****************************************************************************
  -- 우편번호 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0006 (
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0006
    SET    USE_YN = 'N',
           CHG_ID = v_Reg_Id,
           CHG_DT = SYSDATE 
    WHERE  SER_NO = v_Ser_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0006;

  /*****************************************************************************
  -- 우편번호 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0006 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*우편번호              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*시도                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*군,구                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*동                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*번지                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 우편번호, 시도, 사용여부 ,등록자 ID
    IF TRIM(v_Pos_Cd) IS NULL THEN
        v_Return_Message := '우편번호('||v_Pos_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Addrr1) IS NULL THEN
        v_Return_Message := '시도('||v_Addrr1||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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
    
    IF 0 = f_sRtsd0006Count(v_Ser_No) THEN

        IF 0 != f_InsertRtsd0006(v_Ser_No, v_Pos_Cd, v_Addrr1, v_Addrr2, 
                                 v_Addrr3, v_Addrr4, v_Sido_Cd, v_Sigun_Cd, 
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '우편번호 마스터 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0006(v_Ser_No, v_Pos_Cd, v_Addrr1, v_Addrr2, 
                                 v_Addrr3, v_Addrr4, v_Sido_Cd, v_Sigun_Cd, 
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '우편번호 마스터 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0006(v_Ser_No, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '우편번호 마스터 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0006.p_IUDRtsd0006(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0006.p_IUDRtsd0006(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0006;

END Pkg_Rtsd0006;
/
