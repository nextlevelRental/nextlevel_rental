CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0042 AS
/*******************************************************************************
   NAME      Pkg_Rtre0042
   PURPOSE   온라인 결제 카드정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-15  jemcarry         1. Created this package body.
*******************************************************************************/ 

  /*****************************************************************************
  -- 온라인 결제 카드정보 Count
  *****************************************************************************/
  FUNCTION f_sRtre0042Count(
    v_Tno            IN RTRE0042.TNO%TYPE               /*PG거래번호          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0042
    WHERE   TNO = v_Tno;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0042Count;

  /*****************************************************************************
  -- 온라인 결제 카드정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0042 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Crd_No         IN RTRE0042.CRD_NO%TYPE,         /*카드번호              */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.TNO,                       /*PG거래번호          */
            A.CRD_NO,                    /*카드번호            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0042 A
    WHERE   A.TNO    = DECODE(v_Tno    , NULL, A.TNO    , v_Tno)
    AND     A.CRD_NO = DECODE(v_Crd_No , NULL, A.CRD_NO , v_Crd_No)
    AND     A.REG_ID = DECODE(v_Reg_Id , NULL, A.REG_ID , v_Reg_Id);

  END p_sRtre0042;

  /*****************************************************************************
  -- 온라인 결제 카드정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0042 (
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Crd_No         IN RTRE0042.CRD_NO%TYPE,         /*카드번호              */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0042 (
            TNO,
            CRD_NO,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Tno,
            v_Crd_No,
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

  END f_InsertRtre0042;

  /*****************************************************************************
  -- 온라인 결제 카드정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0042 (
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Crd_No         IN RTRE0042.CRD_NO%TYPE,         /*카드번호              */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0042
    SET    CRD_NO = v_Crd_No,
           CHG_ID = v_Reg_Id,
           CHG_DT = SYSDATE 
    WHERE  TNO    = v_Tno;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0042;

  /*****************************************************************************
  -- 온라인 결제 카드정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0042 (
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0042
    WHERE  TNO = v_Tno;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0042.f_DeleteRtre0042(1)', 'PG거래번호', v_Tno);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0042.f_DeleteRtre0042(1)', '등록자 ID', v_Reg_Id);
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0042;

  /*****************************************************************************
  -- 온라인 결제 카드정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0042 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Crd_No         IN RTRE0042.CRD_NO%TYPE,         /*카드번호              */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: PG거래번호,카드번호, 등록자 ID
    IF TRIM(v_Tno) IS NULL THEN
        v_Return_Message := 'PG거래번호('||v_Tno||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Crd_No) IS NULL THEN
        v_Return_Message := '카드번호('||v_Crd_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtre0042Count(v_Tno) THEN

        IF 0 != f_InsertRtre0042(v_Tno, v_Crd_No, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '온라인 결제 카드정보 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn IN ('I', 'U') THEN
        
            IF 0 != f_UpdateRtre0042(v_Tno, v_Crd_No, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '온라인 결제 카드정보 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0042(v_Tno, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '온라인 결제 카드정보 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;
        
    END IF;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0042.p_IUDRtre0042(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0042.p_IUDRtre0042(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0042;

END Pkg_Rtre0042;