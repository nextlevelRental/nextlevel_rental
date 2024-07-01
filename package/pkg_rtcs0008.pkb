CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0008 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0008
   PURPOSE   서비스 처리내역 상세 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 서비스 처리내역 상세 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0008Count(
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,           /*설비번호            */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,         /*서비스 순번         */
    v_Seq            IN RTCS0008.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0008
    WHERE   ORD_NO   = v_Ord_No
    AND     EQU_NO   = v_Equ_No
    AND     SERV_SEQ = v_Serv_Seq
    AND     SEQ      = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0008Count;

  /*****************************************************************************
  -- 서비스 처리내역 상세 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0008 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Service_Cd     IN RTCS0008.SERVICE_CD%TYPE,     /*서비스 코드           */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.EQU_NO,                    /*설비번호            */
            A.SERV_SEQ,                  /*서비스 순번         */
            A.SEQ,                       /*순번                */
            A.SERVICE_CD,                /*서비스 코드         */
            A.DLVC_YN,                   /*수수료 적용여부     */
            A.DLVR_DAY,                  /*배송신청일자        */
            A.DLVR_SEQ,                  /*순번                */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0008 A
    WHERE   A.ORD_NO     = DECODE(v_Ord_No     , NULL, A.ORD_NO     , v_Ord_No)
    AND     A.EQU_NO     = DECODE(v_Equ_No     , NULL, A.EQU_NO     , v_Equ_No)
    AND     A.SERV_SEQ   = DECODE(v_Serv_Seq   , NULL, A.SERV_SEQ   , v_Serv_Seq)
    AND     A.SEQ        = DECODE(v_Seq        , NULL, A.SEQ        , v_Seq)
    AND     A.SERVICE_CD = DECODE(v_Service_Cd , NULL, A.SERVICE_CD , v_Service_Cd)
    AND     A.REG_ID     = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtcs0008;

  /*****************************************************************************
  -- 서비스 처리내역 상세 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0008 (
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Service_Cd     IN RTCS0008.SERVICE_CD%TYPE,     /*서비스 코드           */
    v_Dlvc_Yn        IN RTCS0008.DLVC_YN%TYPE,        /*수수료 적용여부       */
    v_Dlvr_Day       IN RTCS0008.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0008.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0008 (
            ORD_NO,
            EQU_NO,
            SERV_SEQ,
            SEQ,
            SERVICE_CD,
            DLVC_YN,
            DLVR_DAY,
            DLVR_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Equ_No,
            v_Serv_Seq,
            v_Seq,
            v_Service_Cd,
            v_Dlvc_Yn,
            v_Dlvr_Day,
            v_Dlvr_Seq,
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

  END f_InsertRtcs0008;

  /*****************************************************************************
  -- 서비스 처리내역 상세 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0008 (
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Service_Cd     IN RTCS0008.SERVICE_CD%TYPE,     /*서비스 코드           */
    v_Dlvc_Yn        IN RTCS0008.DLVC_YN%TYPE,        /*수수료 적용여부       */
    v_Dlvr_Day       IN RTCS0008.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0008.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0008
    SET    SERVICE_CD = v_Service_Cd,
           DLVC_YN    = v_Dlvc_Yn,
           DLVR_DAY   = v_Dlvr_Day, 
           DLVR_SEQ   = v_Dlvr_Seq,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  ORD_NO     = v_Ord_No
    AND    EQU_NO     = v_Equ_No
    AND    SERV_SEQ   = v_Serv_Seq
    AND    SEQ        = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0008;

  /*****************************************************************************
  -- 서비스 처리내역 상세 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0008 (
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTCS0008
    WHERE  ORD_NO   = v_Ord_No
    AND    EQU_NO   = v_Equ_No
    AND    SERV_SEQ = v_Serv_Seq
    AND    SEQ      = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0008.f_DeleteRtcs0008(2)', '계약번호    ', v_Ord_No  );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0008.f_DeleteRtcs0008(2)', '설비번호    ', v_Equ_No  );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0008.f_DeleteRtcs0008(2)', '서비스 순번 ', v_Serv_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0008.f_DeleteRtcs0008(2)', '순번        ', v_Seq     );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0008.f_DeleteRtcs0008(2)', '등록자 ID   ', v_Reg_Id  );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0008;

  /*****************************************************************************
  -- 서비스 처리내역 상세 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0008 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN OUT RTCS0008.SEQ%TYPE,        /*순번                  */
    v_Service_Cd     IN RTCS0008.SERVICE_CD%TYPE,     /*서비스 코드           */
    v_Dlvc_Yn        IN RTCS0008.DLVC_YN%TYPE,        /*수수료 적용여부       */
    v_Dlvr_Day       IN RTCS0008.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0008.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID 
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Equ_No) IS NULL) OR (0 = Pkg_Rtcs0001.f_sRtcs0001Count(v_Equ_No)) THEN
        v_Return_Message := '설비번호('||v_Equ_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Serv_Seq) IS NULL) OR (0 = Pkg_Rtcs0007.f_sRtcs0007Count(v_Ord_No, v_Equ_No, v_Serv_Seq)) THEN
        v_Return_Message := '서비스 순번('||v_Serv_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Dlvc_Yn) IS NULL) OR (TRIM(v_Dlvc_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '수수료 적용여부('||v_Dlvc_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        v_Seq := f_sRtcs0008Seq(v_Ord_No, v_Equ_No, v_Serv_Seq);
       
        IF 0 != f_InsertRtcs0008(v_Ord_No, v_Equ_No, v_Serv_Seq, v_Seq, 
                                 v_Service_Cd, v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq, 
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '서비스 처리내역 상세 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
    
        IF 0 = f_sRtcs0008Count(v_Ord_No, v_Equ_No, v_Serv_Seq, v_Seq) THEN
            v_Return_Message := '해당 정보는 등록된 데이터가 아니므로 변경/삭제 처리가 불가 합니다!';
            RAISE e_Error;        
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcs0008(v_Ord_No, v_Equ_No, v_Serv_Seq, v_Seq, 
                                     v_Service_Cd, v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '서비스 처리내역 상세 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0008(v_Ord_No, v_Equ_No, v_Serv_Seq, v_Seq, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '서비스 처리내역 상세 삭제 실패!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0008.p_IUDRtcs0008(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0008.p_IUDRtcs0008(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0008;

  /*****************************************************************************
  -- 서비스 처리내역 상세 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0008Seq(
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,           /*설비번호            */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE          /*서비스 순번         */
    ) RETURN NUMBER IS
    v_Seq   RTCS0008.SEQ%TYPE DEFAULT NULL;             /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTCS0008
                 WHERE   ORD_NO   = v_Ord_No
                 AND     EQU_NO   = v_Equ_No
                 AND     SERV_SEQ = v_Serv_Seq)+ 1, 1) AS SEQ
    INTO    v_Seq
    FROM    DUAL;
    
    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0008Seq;

  /*****************************************************************************
  -- 서비스 처리내역 상세 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0008DlvcYn (
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Dlvc_Yn        IN RTCS0008.DLVC_YN%TYPE,        /*수수료 적용여부       */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0008
    SET    
           DLVC_YN    = v_Dlvc_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  ORD_NO     = v_Ord_No
    AND    EQU_NO     = v_Equ_No
    AND    SERV_SEQ   = v_Serv_Seq
    AND    SEQ        = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0008DlvcYn;
  
  
END Pkg_Rtcs0008;
/
