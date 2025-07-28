CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0007 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0007
   PURPOSE   서비스 처리내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 서비스 처리내역 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0007Count(
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,           /*설비번호            */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE          /*서비스 순번         */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0007
    WHERE   ORD_NO   = v_Ord_No
    AND     EQU_NO   = v_Equ_No
    AND     SERV_SEQ = v_Serv_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0007Count;

  /*****************************************************************************
  -- 서비스 처리내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0007 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Per_Tp         IN RTCS0007.PER_TP%TYPE,         /*정기,비정기구분       */
    v_Proc_In_Cd     IN RTCS0007.PROC_IN_CD%TYPE,     /*처리자ID              */
    v_A_Mileage      IN RTCS0007.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Proc_Day       IN RTCS0007.PROC_DAY%TYPE,       /*처리일자              */
    v_Proc_Tm        IN RTCS0007.PROC_TM%TYPE,        /*처리시간              */
    v_Serv_Sign_Seq  IN RTCS0007.SERV_SIGN_SEQ%TYPE,  /*서비스확인서 서명순번 */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.EQU_NO,                    /*설비번호            */
            A.SERV_SEQ,                  /*서비스 순번         */
            A.PER_TP,                    /*정기,비정기구분     */
            A.PROC_IN_CD,                /*처리자ID            */
            A.A_MILEAGE,                 /*주행거리(평균)      */
            A.PROC_DAY,                  /*처리일자            */
            A.PROC_TM,                   /*처리시간            */
            A.SERV_SIGN_SEQ,             /*서비스확인서 서명순 */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0007 A
    WHERE   A.ORD_NO        = DECODE(v_Ord_No       , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.EQU_NO        = DECODE(v_Equ_No       , NULL, A.EQU_NO        , v_Equ_No)
    AND     A.SERV_SEQ      = DECODE(v_Serv_Seq     , NULL, A.SERV_SEQ      , v_Serv_Seq)
    AND     A.PER_TP        = DECODE(v_Per_Tp       , NULL, A.PER_TP        , v_Per_Tp)
    AND     A.PROC_IN_CD    = DECODE(v_Proc_In_Cd   , NULL, A.PROC_IN_CD    , v_Proc_In_Cd)
    AND     A.A_MILEAGE     = DECODE(v_A_Mileage    , NULL, A.A_MILEAGE     , v_A_Mileage)
    AND     A.PROC_DAY      = DECODE(v_Proc_Day     , NULL, A.PROC_DAY      , v_Proc_Day)
    AND     A.PROC_TM       = DECODE(v_Proc_Tm      , NULL, A.PROC_TM       , v_Proc_Tm)
    AND     A.SERV_SIGN_SEQ = DECODE(v_Serv_Sign_Seq, NULL, A.SERV_SIGN_SEQ , v_Serv_Sign_Seq)
    AND     A.REG_ID        = DECODE(v_Reg_Id       , NULL, A.REG_ID        , v_Reg_Id);

  END p_sRtcs0007;

  /*****************************************************************************
  -- 서비스 처리내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0007 (
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Per_Tp         IN RTCS0007.PER_TP%TYPE,         /*정기,비정기구분       */
    v_Proc_In_Cd     IN RTCS0007.PROC_IN_CD%TYPE,     /*처리자ID              */
    v_A_Mileage      IN RTCS0007.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Proc_Day       IN RTCS0007.PROC_DAY%TYPE,       /*처리일자              */
    v_Proc_Tm        IN RTCS0007.PROC_TM%TYPE,        /*처리시간              */
    v_Serv_Sign_Seq  IN RTCS0007.SERV_SIGN_SEQ%TYPE,  /*서비스확인서 서명순번 */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0007 (
            ORD_NO,
            EQU_NO,
            SERV_SEQ,
            PER_TP,
            PROC_IN_CD,
            A_MILEAGE,
            PROC_DAY,
            PROC_TM,
            SERV_SIGN_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Equ_No,
            v_Serv_Seq,
            v_Per_Tp,
            v_Proc_In_Cd,
            v_A_Mileage,
            v_Proc_Day,
            v_Proc_Tm,
            v_Serv_Sign_Seq,
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

  END f_InsertRtcs0007;

  /*****************************************************************************
  -- 서비스 처리내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0007 (
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Per_Tp         IN RTCS0007.PER_TP%TYPE,         /*정기,비정기구분       */
    v_Proc_In_Cd     IN RTCS0007.PROC_IN_CD%TYPE,     /*처리자ID              */
    v_A_Mileage      IN RTCS0007.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Proc_Day       IN RTCS0007.PROC_DAY%TYPE,       /*처리일자              */
    v_Proc_Tm        IN RTCS0007.PROC_TM%TYPE,        /*처리시간              */
    v_Serv_Sign_Seq  IN RTCS0007.SERV_SIGN_SEQ%TYPE,  /*서비스확인서 서명순번 */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0007
    SET    PER_TP        = v_Per_Tp,
           PROC_IN_CD    = v_Proc_In_Cd,
           A_MILEAGE     = v_A_Mileage,
           PROC_DAY      = v_Proc_Day,
           PROC_TM       = v_Proc_Tm,
           SERV_SIGN_SEQ = v_Serv_Sign_Seq,
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE 
    WHERE  ORD_NO        = v_Ord_No
    AND    EQU_NO        = v_Equ_No
    AND    SERV_SEQ      = v_Serv_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0007;

  /*****************************************************************************
  -- 서비스 처리내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0007 (
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTCS0007
    WHERE  ORD_NO   = v_Ord_No
    AND    EQU_NO   = v_Equ_No
    AND    SERV_SEQ = v_Serv_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0007.f_DeleteRtcs0007(2)', '계약번호    ', v_Ord_No  );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0007.f_DeleteRtcs0007(2)', '설비번호    ', v_Equ_No  );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0007.f_DeleteRtcs0007(2)', '서비스 순번 ', v_Serv_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0007.f_DeleteRtcs0007(2)', '등록자 ID   ', v_Reg_Id  );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0007;

  /*****************************************************************************
  -- 서비스 처리내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0007 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN OUT RTCS0007.SERV_SEQ%TYPE,   /*서비스 순번           */
    v_Per_Tp         IN RTCS0007.PER_TP%TYPE,         /*정기,비정기구분       */
    v_Proc_In_Cd     IN RTCS0007.PROC_IN_CD%TYPE,     /*처리자ID              */
    v_A_Mileage      IN RTCS0007.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Proc_Day       IN RTCS0007.PROC_DAY%TYPE,       /*처리일자              */
    v_Proc_Tm        IN RTCS0007.PROC_TM%TYPE,        /*처리시간              */
    v_Serv_Sign_Seq  IN RTCS0007.SERV_SIGN_SEQ%TYPE,  /*서비스확인서 서명순번 */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE,         /*등록자 ID             */
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
        
    IF (TRIM(v_Per_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H009', v_Per_Tp)) THEN
        v_Return_Message := '정기,비정기구분('||v_Per_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
                
    IF (TRIM(v_Proc_In_Cd) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Proc_In_Cd)) THEN
        v_Return_Message := '처리자ID('||v_Proc_In_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
       
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        v_Serv_Seq := f_sRtcs0007ServSeq(v_Ord_No, v_Equ_No);
        
        IF 0 != f_InsertRtcs0007(v_Ord_No, v_Equ_No, v_Serv_Seq, v_Per_Tp, 
                                 v_Proc_In_Cd, v_A_Mileage, v_Proc_Day, v_Proc_Tm, 
                                 v_Serv_Sign_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '서비스 처리내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 = f_sRtcs0007Count(v_Ord_No, v_Equ_No, v_Serv_Seq) THEN
            v_Return_Message := '해당 정보는 등록된 데이터가 아니므로 변경/삭제 처리가 불가 합니다!';
            RAISE e_Error;        
        END IF;        
        
        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcs0007(v_Ord_No, v_Equ_No, v_Serv_Seq, v_Per_Tp, 
                                     v_Proc_In_Cd, v_A_Mileage, v_Proc_Day, v_Proc_Tm, 
                                     v_Serv_Sign_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '서비스 처리내역 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0007(v_Ord_No, v_Equ_No, v_Serv_Seq, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '서비스 처리내역 삭제 실패!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0007.p_IUDRtcs0007(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0007.p_IUDRtcs0007(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0007;

  /*****************************************************************************
  -- 서비스 처리내역 - 서비스 순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtcs0007ServSeq(
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE            /*설비번호            */
    ) RETURN NUMBER IS
    v_Serv_Seq RTCS0007.SERV_SEQ%TYPE DEFAULT NULL;     /*서비스 순번         */
  BEGIN

    SELECT  NVL((SELECT  MAX(SERV_SEQ)
                 FROM    RTCS0007
                 WHERE   ORD_NO   = v_Ord_No
                 AND     EQU_NO   = v_Equ_No)+ 1, 1) AS SERV_SEQ
    INTO    v_Serv_Seq
    FROM    DUAL;
    
    RETURN v_Serv_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0007ServSeq;

  /*****************************************************************************
  -- 서비스 처리내역 Select - 점검 작업목록 조회 - 서비스이력TAB
  *****************************************************************************/
  PROCEDURE p_sRtcs0007ServiceHistory (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE          /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.EQU_NO,                    /*설비번호            */
            A.SERV_SEQ,                  /*서비스 순번         */
            B.SEQ,                       /*순번                */
            A.PROC_DAY,                  /*처리일자            */
            A.PROC_TM,                   /*처리시간            */
            B.SERVICE_CD,                /*서비스 코드         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', B.SERVICE_CD) SERVICE_NM, /*서비스명       */
            A.PROC_IN_CD,                /*처리자ID            */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.PROC_IN_CD) PROC_IN_NM            /*처리자명       */
    FROM    RTCS0007 A,                  /*서비스 처리내역     */
            RTCS0008 B                   /*서비스 처리내역 상세*/
    WHERE   A.ORD_NO   = v_Ord_No
    AND     A.ORD_NO   = B.ORD_NO
    AND     A.EQU_NO   = B.EQU_NO
    AND     A.SERV_SEQ = B.SERV_SEQ;

  END p_sRtcs0007ServiceHistory;
    
   /*****************************************************************************
  -- 서비스 처리내역 Select - 점검 작업목록 조회 - 서비스이력TAB
  *****************************************************************************/
  PROCEDURE p_sRtcs0007ServiceHistoryByDt (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,          /*계약번호              */
    v_Proc_Day_S         IN RTCS0007.PROC_DAY%TYPE,          /*계약번호              */
    v_Proc_Day_E         IN RTCS0007.PROC_DAY%TYPE,          /*계약번호              */
    v_Dlvc_Yn         IN RTCS0008.DLVC_YN%TYPE,          /*계약번호              */
    v_Service_Cd         IN RTCS0008.SERVICE_CD%TYPE          /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  CASE WHEN B.DLVC_YN = 'Y' THEN '1' ELSE '0' END DLVC_YN,
            A.ORD_NO,                    /*계약번호            */
            A.EQU_NO,                    /*설비번호            */
            A.SERV_SEQ,                  /*서비스 순번         */
            B.SEQ,                       /*순번                */
            A.PROC_DAY,                  /*처리일자            */
            A.PROC_TM,                   /*처리시간            */
            B.SERVICE_CD,                /*서비스 코드         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', B.SERVICE_CD) SERVICE_NM, /*서비스명       */
            A.PROC_IN_CD,                /*처리자ID            */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.PROC_IN_CD) PROC_IN_NM            /*처리자명       */
    FROM    RTCS0007 A,                  /*서비스 처리내역     */
            RTCS0008 B                   /*서비스 처리내역 상세*/
    WHERE   (v_Ord_No      IS NULL OR A.ORD_NO = v_Ord_No)
    AND     (v_Proc_Day_S     IS NULL OR A.PROC_DAY BETWEEN v_Proc_Day_S AND TO_CHAR(TO_DATE(v_Proc_Day_S) + 7, 'YYYYMMDD')) --조회속도로 인해 일주일 데이터만 조회
    AND     (v_Dlvc_Yn      IS NULL OR B.DLVC_YN = v_Dlvc_Yn)
    AND     (v_Service_Cd      IS NULL OR B.SERVICE_CD = v_Service_Cd)
    AND     A.ORD_NO   = B.ORD_NO
    AND     A.EQU_NO   = B.EQU_NO
    AND     A.SERV_SEQ = B.SERV_SEQ;

  END p_sRtcs0007ServiceHistoryByDt;
  
END Pkg_Rtcs0007;