CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0120_back AS
/*******************************************************************************
   NAME      Pkg_Rtre0120
   PURPOSE   [RE] 이연대상 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-16  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [RE] 이연대상 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0120Count(
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,           /*계약번호            */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE          /*이연항목            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0120
    WHERE   ORD_NO         = v_Ord_No
    AND     POSTP_TP       = v_Postp_Tp;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0120Count;


  /*****************************************************************************
  -- [RE] 이연대상 내역 Count(마감월 기처리 확인용)
  *****************************************************************************/
  FUNCTION f_sRtre0120Pstr_YmCount(
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE        /*이연항목              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0120
    WHERE   PSTR_YM     = v_Pstr_Ym
    AND     POSTP_TP    = v_Postp_Tp
    AND     ROWNUM      = 1;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0120Pstr_YmCount;
  
  
  /*****************************************************************************
  -- [RE] 이연대상 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0120 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*이연종료월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*월이연처리금액        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*막달 이연처리금액     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.POSTP_TP,                  /*이연항목            */
            A.PSTR_YM,                   /*이연시작월          */
            A.PEND_YM,                   /*이연종료월          */
            A.PPTRM,                     /*이연기간            */
            A.ACQ_AMT,                   /*이연처리대상금액    */
            A.RES_AMT,                   /*잔존가액            */
            A.MPP_AMT,                   /*월이연처리금액      */
            A.LPP_AMT,                   /*막달 이연처리금액   */
            A.PROST_TP,                  /*처리구분            */
            A.CHAN_CD,                   /*채널구분            */
            A.AGENCY_CD,                 /*취득조직            */
            A.CUST_TP,                   /*고객유형            */
            A.MAT_CD,                    /*상품코드            */
            A.ORD_QTY,                   /*장착갯수            */
            A.PP_STAT,                   /*이연대상상태        */
            A.PPCH_YM,                   /*이연대상상태변경년월*/
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0120 A
    WHERE   A.ORD_NO           = DECODE(v_Ord_No         , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.POSTP_TP         = DECODE(v_Postp_Tp       , NULL, A.POSTP_TP        , v_Postp_Tp)
    AND     A.PSTR_YM          = DECODE(v_Pstr_Ym        , NULL, A.PSTR_YM         , v_Pstr_Ym)
    AND     A.PEND_YM          = DECODE(v_Pend_Ym        , NULL, A.PEND_YM         , v_Pend_Ym)
    AND     A.PPTRM            = DECODE(v_Pptrm          , NULL, A.PPTRM           , v_Pptrm)
    AND     A.ACQ_AMT          = DECODE(v_Acq_Amt        , NULL, A.ACQ_AMT         , v_Acq_Amt)
    AND     A.RES_AMT          = DECODE(v_Res_Amt        , NULL, A.RES_AMT         , v_Res_Amt)
    AND     A.MPP_AMT          = DECODE(v_Mpp_Amt        , NULL, A.MPP_AMT         , v_Mpp_Amt)
    AND     A.LPP_AMT          = DECODE(v_Lpp_Amt        , NULL, A.LPP_AMT         , v_Lpp_Amt)
    AND     A.PROST_TP         = DECODE(v_Prost_Tp       , NULL, A.PROST_TP        , v_Prost_Tp)
    AND     A.CHAN_CD          = DECODE(v_Chan_Cd        , NULL, A.CHAN_CD         , v_Chan_Cd)
    AND     A.AGENCY_CD        = DECODE(v_Agency_Cd      , NULL, A.AGENCY_CD       , v_Agency_Cd)
    AND     A.CUST_TP          = DECODE(v_Cust_Tp        , NULL, A.CUST_TP         , v_Cust_Tp)
    AND     A.MAT_CD           = DECODE(v_Mat_Cd         , NULL, A.MAT_CD          , v_Mat_Cd)
    AND     A.ORD_QTY          = DECODE(v_Ord_Qty        , NULL, A.ORD_QTY         , v_Ord_Qty)
    AND     A.PP_STAT          = DECODE(v_Pp_Stat        , NULL, A.PP_STAT         , v_Pp_Stat)
    AND     A.PPCH_YM          = DECODE(v_Ppch_Ym        , NULL, A.PPCH_YM         , v_Ppch_Ym)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre0120;

  /*****************************************************************************
  -- [RE] 이연대상 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0120 (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*이연종료월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*월이연처리금액        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*막달 이연처리금액     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0120 (
            ORD_NO,
            POSTP_TP,
            PSTR_YM,
            PEND_YM,
            PPTRM,
            ACQ_AMT,
            RES_AMT,
            MPP_AMT,
            LPP_AMT,
            PROST_TP,
            CHAN_CD,
            AGENCY_CD,
            CUST_TP,
            MAT_CD,
            ORD_QTY,
            PP_STAT,
            PPCH_YM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Postp_Tp,
            v_Pstr_Ym,
            v_Pend_Ym,
            v_Pptrm,
            v_Acq_Amt,
            v_Res_Amt,
            v_Mpp_Amt,
            v_Lpp_Amt,
            v_Prost_Tp,
            v_Chan_Cd,
            v_Agency_Cd,
            v_Cust_Tp,
            v_Mat_Cd,
            v_Ord_Qty,
            v_Pp_Stat,
            v_Ppch_Ym,
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

  END f_InsertRtre0120;

  /*****************************************************************************
  -- [RE] 이연대상 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120 (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*이연종료월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*월이연처리금액        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*막달 이연처리금액     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0120
    SET    PSTR_YM          = v_Pstr_Ym,
           PEND_YM          = v_Pend_Ym,
           PPTRM            = v_Pptrm,
           ACQ_AMT          = v_Acq_Amt,
           RES_AMT          = v_Res_Amt,
           MPP_AMT          = v_Mpp_Amt,
           LPP_AMT          = v_Lpp_Amt,
           PROST_TP         = v_Prost_Tp,
           CHAN_CD          = v_Chan_Cd,
           AGENCY_CD        = v_Agency_Cd,
           CUST_TP          = v_Cust_Tp,
           MAT_CD           = v_Mat_Cd,
           ORD_QTY          = v_Ord_Qty,
           PP_STAT          = v_Pp_Stat,
           PPCH_YM          = v_Ppch_Ym,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE 
    WHERE  ORD_NO           = v_Ord_No
    AND    POSTP_TP         = v_Postp_Tp;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0120;

  /*****************************************************************************
  -- [RE] 이연대상 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0120 (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTRE0120
    WHERE  ORD_NO           = v_Ord_No
    AND    POSTP_TP         = v_Postp_Tp;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.f_DeleteRtre0120(2)', '계약번호', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.f_DeleteRtre0120(2)', '이연항목', v_Postp_Tp);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0037.f_DeleteRtre0120(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0120;

  /*****************************************************************************
  -- [RE] 이연대상 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0120 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pend_Ym        IN RTRE0120.PEND_YM%TYPE,        /*이연종료월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Mpp_Amt        IN RTRE0120.MPP_AMT%TYPE,        /*월이연처리금액        */
    v_Lpp_Amt        IN RTRE0120.LPP_AMT%TYPE,        /*막달 이연처리금액     */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */ 
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 계약번호, 이연항목, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Postp_Tp) IS NULL) THEN
        v_Return_Message := '이연항목('||v_Postp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_InsertRtre0120( v_Ord_No,  v_Postp_Tp, v_Pstr_Ym, v_Pend_Ym,
                                  v_Pptrm,   v_Acq_Amt,  v_Res_Amt, v_Mpp_Amt,
                                  v_Lpp_Amt, v_Prost_Tp, v_Chan_Cd, v_Agency_Cd,
                                  v_Cust_Tp, v_Mat_Cd,   v_Ord_Qty, v_Pp_Stat,
                                  v_Ppch_Ym, v_Reg_Id,   v_ErrorText
                                ) THEN
            v_Return_Message := '[RE] 이연대상 내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtre0120( v_Ord_No,  v_Postp_Tp, v_Pstr_Ym, v_Pend_Ym,
                                  v_Pptrm,   v_Acq_Amt,  v_Res_Amt, v_Mpp_Amt,
                                  v_Lpp_Amt, v_Prost_Tp, v_Chan_Cd, v_Agency_Cd,
                                  v_Cust_Tp, v_Mat_Cd,   v_Ord_Qty, v_Pp_Stat,
                                  v_Ppch_Ym, v_Reg_Id,   v_ErrorText
                                ) THEN
            v_Return_Message := '[RE] 이연대상 내역 수정 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN
        
        IF 0 != f_DeleteRtre0120( v_Ord_No,  v_Postp_Tp, v_Reg_Id,   v_ErrorText ) THEN
            v_Return_Message := '[RE] 이연대상 내역 삭제 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_IUDRtre0120(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_IUDRtre0120(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0120;


  /*****************************************************************************
  -- [RE] 이연대상 내역 생성 처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120Postpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    
    v_Chan_Cd1   RTSD0108.CHAN_CD%TYPE DEFAULT NULL;
    v_Agency_Cd1 RTSD0108.AGENCY_CD%TYPE DEFAULT NULL;
    v_Ord_Qty1   RTSD0108.CNT_CD%TYPE DEFAULT NULL;
    v_Cust_Tp1   RTSD0100.CUST_TP%TYPE DEFAULT NULL;
    v_Mat_Cd1    RTCS0001.MAT_CD%TYPE DEFAULT NULL;
    
    v_Pend_Ym    RTRE0120.PEND_YM%TYPE DEFAULT NULL;
    v_Mpp_Amt    RTRE0120.MPP_AMT%TYPE DEFAULT NULL;
    v_Lpp_Amt    RTRE0120.LPP_AMT%TYPE DEFAULT NULL;
    v_Pp_Stat    RTRE0120.PP_STAT%TYPE DEFAULT NULL;
    v_Ppch_Ym    RTRE0120.PPCH_YM%TYPE DEFAULT NULL;
    
    v_Postp_Seq  RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
    v_Postp_Stat RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_Postp_Ym   RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Ly_Tpp_Amt RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;
    
    
  BEGIN

    -- 필수값: 계약번호, 이연항목, 이연시작월, 이연기간, 이연처리대상금액, 잔존가액, 
    -- 처리구분, 채널구분, 취득조직, 고객유형, 상품코드, 장착갯수, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) = 0 THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Postp_Tp) IS NULL) THEN
        v_Return_Message := '이연항목('||v_Postp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pstr_Ym) IS NULL) THEN
        v_Return_Message := '이연시작월('||v_Pstr_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pptrm) IS NULL) OR v_Pptrm = 0 THEN
        v_Return_Message := '이연기간('||v_Pptrm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Acq_Amt) IS NULL) OR v_Acq_Amt = 0 THEN
        v_Return_Message := '이연처리대상금액('||v_Acq_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Res_Amt) IS NULL) THEN
        v_Return_Message := '잔존가액('||v_Res_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Prost_Tp) IS NULL) THEN
        v_Return_Message := '처리구분('||v_Prost_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Chan_Cd) IS NULL) THEN
        v_Return_Message := '채널구분('||v_Chan_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Agency_Cd) IS NULL) AND
       (TRIM(V_CHAN_CD) <> '02')   THEN
        v_Return_Message := '취득조직('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_Tp) IS NULL) THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Mat_Cd) IS NULL) THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_Qty) IS NULL) OR v_Ord_Qty = 0 THEN
        v_Return_Message := '장착갯수('||v_Ord_Qty||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


--  DBMS_OUTPUT.Put_Line('SELECT  이전 ' || v_Chan_Cd1);

    -- 주문 check
    v_Ord_Qty1 := 0;
    v_Mat_Cd1  := '';
    BEGIN
    SELECT  A.CHAN_CD,
            DECODE( v_Postp_Tp, '08',  A.AGENCY_CD, 
                DECODE( A.CHAN_CD, '01', A.AGENCY_CD, 
                        DECODE(A.CHAN_CD, '05', A.AGENCY_CD, A.ORD_AGENT))) AGENCY_CD,   
            A.CNT_CD ORD_QTY, NVL(B.MAT_CD, '') MAT_CD
    INTO    v_Chan_Cd1, v_Agency_Cd1, v_Ord_Qty1, v_Mat_Cd1
    FROM    RTSD0108 A,
            RTCS0001 B
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.ORD_NO = B.ORD_NO(+)
    AND     ROWNUM = 1;

    EXCEPTION 
        WHEN OTHERS THEN 
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120Postpone(1)', v_ErrorText, v_Return_Message);
    END;  
    
    
      
--  DBMS_OUTPUT.Put_Line('v_Chan_Cd = ' || v_Chan_Cd || ',  v_Chan_Cd1 = ' || v_Chan_Cd1);

    IF v_Ord_Qty1 = 0 THEN 
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 주문장착의 갯수 수량이 0 입니다. 처리할 수 없습니다!';
        RAISE e_Error;
    ELSIF v_Chan_Cd1 <> v_Chan_Cd THEN
        v_Return_Message := '채널구분('||v_Chan_Cd||'-'||v_Chan_Cd1||') : 이주문과 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    ELSIF v_Agency_Cd1 <> v_Agency_Cd THEN
        v_Return_Message := '취득조직('||v_Agency_Cd||'-'||v_Agency_Cd1||') : 이주문과 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    ELSIF v_Ord_Qty1 <> v_Ord_Qty THEN
        v_Return_Message := '장착갯수('||v_Ord_Qty||'-'||v_Ord_Qty1||') : 가 주문과 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    ELSIF v_Mat_Cd1 <> v_Mat_Cd THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||'-'||v_Mat_Cd1||') : 가 설치와 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    END IF;
    
    -- 장착정보 check
    v_Cust_Tp1  := '';
    BEGIN
    SELECT  NVL(B.CUST_TP, '') CUST_TP
    INTO    v_Cust_Tp1
    FROM    RTSD0108 A,
            RTSD0100 B
    WHERE   A.ORD_NO  = v_Ord_No
    AND     A.CUST_NO = B.CUST_NO(+)
    AND     ROWNUM = 1;

    EXCEPTION 
        WHEN OTHERS THEN 
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 장착정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120Postpone(1)', v_ErrorText, v_Return_Message);
    END;  
    
        
    IF v_Cust_Tp1 <> v_Cust_Tp THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||'-'||v_Cust_Tp1||') : 가 장착정보와 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    END IF;
        
    
    v_Postp_Seq := 1;
    v_Ly_Tpp_Amt := 0;
    v_Cy_Pp_Amt  := 0;
    v_Cy_Tpp_Amt := 0;
    v_Cm_Pp_Amt  := 0;
    LOOP
    
        IF v_Postp_Seq = 1 THEN     -- MASTER 생성
        
            -- 이연종료월
            v_Pend_Ym := TO_CHAR(ADD_MONTHS(TO_DATE(v_Pstr_Ym, 'YYYYMM'), (v_Pptrm - 1)), 'YYYYMM');
            -- 월처리금액
            v_Mpp_Amt := TRUNC((v_Acq_Amt - v_Res_Amt) / v_Pptrm, 0);
            -- 마지막달 처리금액
            v_Lpp_Amt := (v_Acq_Amt - v_Res_Amt) - v_Mpp_Amt * (v_Pptrm - 1);
            v_Pp_Stat := 'A';
            v_Ppch_Ym := v_Pstr_Ym;
--            IF 0 != f_InsertRtre0120( v_Ord_No,  v_Postp_Tp, v_Pstr_Ym, v_Pend_Ym,
--                                      v_Pptrm,   v_Acq_Amt,  v_Res_Amt, v_Mpp_Amt,
--                                      v_Lpp_Amt, v_Prost_Tp, v_Chan_Cd, v_Agency_Cd,
--                                      v_Cust_Tp, v_Mat_Cd,   v_Ord_Qty, v_Pp_Stat,
--                                      v_Ppch_Ym, v_Reg_Id,   v_ErrorText
            IF 0 != f_InsertRtre0120( v_Ord_No,  v_Postp_Tp, v_Pstr_Ym, v_Pend_Ym,
                                      v_Pptrm,   v_Acq_Amt,  v_Res_Amt, v_Mpp_Amt,
                                      v_Lpp_Amt, v_Prost_Tp, v_Chan_Cd, v_Agency_Cd,
                                      v_Cust_Tp, v_Mat_Cd,   v_Ord_Qty, v_Pp_Stat,
                                      v_Ppch_Ym, v_Reg_Id,   v_ErrorText
                                    ) THEN
                v_Return_Message := '계약번호('||v_Ord_No||')[RE] 이연대상 MASTER 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        
        END IF;
    
        -- 이연상태
        IF v_Postp_Seq = 1 THEN     -- 1차분
            v_Postp_Stat := 'N';
            -- 대상년월 시작
            v_Postp_Ym := v_Pstr_Ym;
        ELSE
            --  대상년월 ADD
            v_Postp_Ym := TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), 1), 'YYYYMM');
            IF v_Postp_Seq = 60 THEN -- 소유권인 경우
                v_Postp_Stat := 'O';    -- 소유권이전
            ELSE
                v_Postp_Stat := 'A';    -- 기존
            END IF;
        END IF;
        
        -- 전기말 누적액
        IF SUBSTR(v_Postp_Ym,1,4) <> TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), -1), 'YYYY') THEN
            v_Ly_Tpp_Amt := v_Cy_Tpp_Amt;   -- 다른 년도면 전년까지 누적분 
        ELSE
            v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;   -- 같은 년도는 동일
        END IF;

        -- 당월 처리금액
        IF v_Postp_Seq <> v_Pptrm THEN     
            v_Cm_Pp_Amt := v_Mpp_Amt;
        ELSE                                -- 최종분
            v_Cm_Pp_Amt := v_Lpp_Amt;
        END IF;

        -- 당기 처리액
        IF SUBSTR(v_Postp_Ym,1,4) <> TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), -1), 'YYYY') THEN
            v_Cy_Pp_Amt  := v_Cm_Pp_Amt;    -- 첫달은 당월분
        ELSE
            v_Cy_Pp_Amt  := v_Cy_Pp_Amt + v_Cm_Pp_Amt; -- 같은 년도면 누적
        END IF;

        -- 당기 총 누적액
        v_Cy_Tpp_Amt  := v_Ly_Tpp_Amt + v_Cy_Pp_Amt;    -- 전기말 누적액 + 당기처리액
        
        -- 당월 잔존가액
        v_Cm_R_Amt  := v_Acq_Amt - v_Cy_Tpp_Amt;        -- 전체금액 - 당기 총 누적액
        
        
--        IF 0 != f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
--                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
--                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText 
        IF 0 != Pkg_Rtre0125.f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText 
                                ) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') 순번('||v_Postp_Seq||')[RE] 이연처리 월별내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;


        v_Postp_Seq := v_Postp_Seq + 1; 
        EXIT WHEN v_Postp_Seq > v_Pptrm; 
        
    END LOOP;



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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120Postpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120Postpone(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0120Postpone;
  
 /*****************************************************************************
  -- [RE] 이연대상 내역 생성 처리--걱정제로 관련 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ZeroPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    
    v_Chan_Cd1   RTSD0108.CHAN_CD%TYPE DEFAULT NULL;
    v_Agency_Cd1 RTSD0108.AGENCY_CD%TYPE DEFAULT NULL;
    v_Ord_Qty1   RTSD0108.CNT_CD%TYPE DEFAULT NULL;
    v_Cust_Tp1   RTSD0100.CUST_TP%TYPE DEFAULT NULL;
    v_Mat_Cd1    RTCS0001.MAT_CD%TYPE DEFAULT NULL;
    
    v_Pend_Ym    RTRE0120.PEND_YM%TYPE DEFAULT NULL;
    v_Mpp_Amt    RTRE0120.MPP_AMT%TYPE DEFAULT NULL;
    v_Lpp_Amt    RTRE0120.LPP_AMT%TYPE DEFAULT NULL;
    v_Pp_Stat    RTRE0120.PP_STAT%TYPE DEFAULT NULL;
    v_Ppch_Ym    RTRE0120.PPCH_YM%TYPE DEFAULT NULL;
    
    v_Postp_Seq  RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
    v_Postp_Stat RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_Postp_Ym   RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Ly_Tpp_Amt RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;
    v_Acq_Amt_R  RTRE0120.ACQ_AMT%TYPE;
    
  BEGIN

    -- 필수값: 계약번호, 이연항목, 이연시작월, 이연기간, 이연처리대상금액, 잔존가액, 
    -- 처리구분, 채널구분, 취득조직, 고객유형, 상품코드, 장착갯수, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) = 0 THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Postp_Tp) IS NULL) THEN
        v_Return_Message := '이연항목('||v_Postp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pstr_Ym) IS NULL) THEN
        v_Return_Message := '이연시작월('||v_Pstr_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pptrm) IS NULL) OR v_Pptrm = 0 THEN
        v_Return_Message := '이연기간('||v_Pptrm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Acq_Amt) IS NULL) OR v_Acq_Amt = 0 THEN
        v_Return_Message := '이연처리대상금액('||v_Acq_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Res_Amt) IS NULL) THEN
        v_Return_Message := '잔존가액('||v_Res_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Prost_Tp) IS NULL) THEN
        v_Return_Message := '처리구분('||v_Prost_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Chan_Cd) IS NULL) THEN
        v_Return_Message := '채널구분('||v_Chan_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Agency_Cd) IS NULL) AND
       (TRIM(V_CHAN_CD) <> '02')   THEN
        v_Return_Message := '취득조직('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_Tp) IS NULL) THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Mat_Cd) IS NULL) THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_Qty) IS NULL) OR v_Ord_Qty = 0 THEN
        v_Return_Message := '장착갯수('||v_Ord_Qty||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


--  DBMS_OUTPUT.Put_Line('SELECT  이전 ' || v_Chan_Cd1);

    -- 주문 check
    v_Ord_Qty1 := 0;
    v_Mat_Cd1  := '';
    BEGIN
    SELECT  A.CHAN_CD,
            DECODE( v_Postp_Tp, '08',  A.AGENCY_CD, 
                DECODE( A.CHAN_CD, '01', A.AGENCY_CD, 
                        DECODE(A.CHAN_CD, '05', A.AGENCY_CD, A.ORD_AGENT))) AGENCY_CD,   
            decode(A.CNT_CD,'04','01',A.CNT_CD) ORD_QTY, NVL(B.MAT_CD, '') MAT_CD
    INTO    v_Chan_Cd1, v_Agency_Cd1, v_Ord_Qty1, v_Mat_Cd1
    FROM    RTSD0108 A,
            RTCS0001 B
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.ORD_NO = B.ORD_NO(+)
    AND     A.CNT_CD = '04'
    AND     ROWNUM = 1;

    EXCEPTION 
        WHEN OTHERS THEN 
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '타이어본수 4개 계약번호('||v_Ord_No||') : 가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120ZeroPostpone(1)', v_ErrorText, v_Return_Message);
    END;  
    
    
      
--  DBMS_OUTPUT.Put_Line('v_Chan_Cd = ' || v_Chan_Cd || ',  v_Chan_Cd1 = ' || v_Chan_Cd1);

    IF v_Ord_Qty1 = 0 THEN 
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 주문장착의 갯수 수량이 0 입니다. 처리할 수 없습니다!';
        RAISE e_Error;
    ELSIF v_Chan_Cd1 <> v_Chan_Cd THEN
        v_Return_Message := '채널구분('||v_Chan_Cd||'-'||v_Chan_Cd1||') : 이주문과 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    ELSIF v_Agency_Cd1 <> v_Agency_Cd THEN
        v_Return_Message := '취득조직('||v_Agency_Cd||'-'||v_Agency_Cd1||') : 이주문과 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    ELSIF v_Ord_Qty1 <> v_Ord_Qty THEN
        v_Return_Message := '서비스개수('||v_Ord_Qty||'-'||v_Ord_Qty1||') : 가 주문시 서비스 개수와 과 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    ELSIF v_Mat_Cd1 <> v_Mat_Cd THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||'-'||v_Mat_Cd1||') : 가 설치와 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    END IF;
    
    -- 장착정보 check
    v_Cust_Tp1  := '';
    BEGIN
    SELECT  NVL(B.CUST_TP, '') CUST_TP
    INTO    v_Cust_Tp1
    FROM    RTSD0108 A,
            RTSD0100 B
    WHERE   A.ORD_NO  = v_Ord_No
    AND     A.CUST_NO = B.CUST_NO(+)
    AND     A.CNT_CD = '04'
    AND     ROWNUM = 1;

    EXCEPTION 
        WHEN OTHERS THEN 
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 장착정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120Postpone(1)', v_ErrorText, v_Return_Message);
    END;  
    
        
    IF v_Cust_Tp1 <> v_Cust_Tp THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||'-'||v_Cust_Tp1||') : 가 장착정보와 맞지않아 처리할 수 없습니다!';
        RAISE e_Error;
    END IF;
        
    
    v_Postp_Seq := 1;
    v_Ly_Tpp_Amt := 0;
    v_Cy_Pp_Amt  := 0;
    v_Cy_Tpp_Amt := 0;
    v_Cm_Pp_Amt  := 0;
    LOOP
        v_Acq_Amt_R := TRUNC(round(v_Acq_Amt / 4),0);
        IF v_Postp_Seq = 1 THEN     -- MASTER 생성
            
            -- 이연종료월
            v_Pend_Ym := TO_CHAR(ADD_MONTHS(TO_DATE(v_Pstr_Ym, 'YYYYMM'), (v_Pptrm - 1)), 'YYYYMM');
            -- 월처리금액
            --v_Mpp_Amt := TRUNC((v_Acq_Amt - v_Res_Amt) / v_Pptrm, 0);   --한나 변경
            v_Mpp_Amt := TRUNC(( round(v_Acq_Amt/4) - v_Res_Amt) / v_Pptrm, 0);   --한나 변경 --( 타이어본수자산가 / 타이어본수 )-잔존가액0 / 기간 
            -- 마지막달 처리금액
           -- v_Lpp_Amt := (v_Acq_Amt - v_Res_Amt) - v_Mpp_Amt * (v_Pptrm - 1);--한나 변경
           v_Lpp_Amt := (round(v_Acq_Amt/4) - v_Res_Amt) - v_Mpp_Amt * (v_Pptrm - 1); --한나 변경
           
            v_Pp_Stat := 'A';
            v_Ppch_Ym := v_Pstr_Ym;
--            IF 0 != f_InsertRtre0120( v_Ord_No,  v_Postp_Tp, v_Pstr_Ym, v_Pend_Ym,
--                                      v_Pptrm,   v_Acq_Amt,  v_Res_Amt, v_Mpp_Amt,
--                                      v_Lpp_Amt, v_Prost_Tp, v_Chan_Cd, v_Agency_Cd,
--                                      v_Cust_Tp, v_Mat_Cd,   v_Ord_Qty, v_Pp_Stat,
--                                      v_Ppch_Ym, v_Reg_Id,   v_ErrorText
            IF 0 != f_InsertRtre0120( v_Ord_No,  v_Postp_Tp, v_Pstr_Ym, v_Pend_Ym,
                                      v_Pptrm,   v_Acq_Amt_R,  v_Res_Amt, v_Mpp_Amt,
                                      v_Lpp_Amt, v_Prost_Tp, v_Chan_Cd, v_Agency_Cd,
                                      v_Cust_Tp, v_Mat_Cd,   v_Ord_Qty, v_Pp_Stat,
                                      v_Ppch_Ym, v_Reg_Id,   v_ErrorText
                                    ) THEN
                v_Return_Message := '계약번호('||v_Ord_No||')[RE] 이연대상 MASTER 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        
        END IF;
    
        -- 이연상태
        IF v_Postp_Seq = 1 THEN     -- 1차분
            v_Postp_Stat := 'N';
            -- 대상년월 시작
            v_Postp_Ym := v_Pstr_Ym;
        ELSE
            --  대상년월 ADD
            v_Postp_Ym := TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), 1), 'YYYYMM');
            IF v_Postp_Seq = 60 THEN -- 소유권인 경우
                v_Postp_Stat := 'O';    -- 소유권이전
            ELSE
                v_Postp_Stat := 'A';    -- 기존
            END IF;
        END IF;
        
        -- 전기말 누적액
        IF SUBSTR(v_Postp_Ym,1,4) <> TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), -1), 'YYYY') THEN
            v_Ly_Tpp_Amt := v_Cy_Tpp_Amt;   -- 다른 년도면 전년까지 누적분 
        ELSE
            v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;   -- 같은 년도는 동일
        END IF;

        -- 당월 처리금액
        IF v_Postp_Seq <> v_Pptrm THEN     
            v_Cm_Pp_Amt := v_Mpp_Amt;
        ELSE                                -- 최종분
            v_Cm_Pp_Amt := v_Lpp_Amt;
        END IF;

        -- 당기 처리액
        IF SUBSTR(v_Postp_Ym,1,4) <> TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), -1), 'YYYY') THEN
            v_Cy_Pp_Amt  := v_Cm_Pp_Amt;    -- 첫달은 당월분
        ELSE
            v_Cy_Pp_Amt  := v_Cy_Pp_Amt + v_Cm_Pp_Amt; -- 같은 년도면 누적
        END IF;

        -- 당기 총 누적액
        v_Cy_Tpp_Amt  := v_Ly_Tpp_Amt + v_Cy_Pp_Amt;    -- 전기말 누적액 + 당기처리액
        
        -- 당월 잔존가액
        v_Cm_R_Amt  := v_Acq_Amt_R - v_Cy_Tpp_Amt;        -- 전체금액 - 당기 총 누적액
        
        
--        IF 0 != f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
--                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
--                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText 
        IF 0 != Pkg_Rtre0125.f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText 
                                ) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') 순번('||v_Postp_Seq||')[RE] 이연처리 월별내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;


        v_Postp_Seq := v_Postp_Seq + 1; 
        EXIT WHEN v_Postp_Seq > v_Pptrm; 
        
    END LOOP;



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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120Postpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120Postpone(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0120ZeroPostpone;  
  

  /*****************************************************************************
  -- [RE] 이연대상 중도변경 UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120Postpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0120
    SET    PP_STAT          = v_Pp_Stat,
           PPCH_YM          = v_Ppch_Ym,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE 
    WHERE  ORD_NO           = v_Ord_No
    AND    POSTP_TP         = v_Postp_Tp;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0120Postpone;
  
  /*****************************************************************************
  -- [RE] 이연대상 걱정제로이연처리 UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120SvrPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Ord_Qty_Now    IN RTRE0120.Ord_Qty_Now%TYPE,    /*현재장착   */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0120
    SET    PP_STAT          = v_Pp_Stat,
           PPCH_YM          = v_Ppch_Ym,
           Ord_Qty_Now      = v_Ord_Qty_Now,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE 
    WHERE  ORD_NO           = v_Ord_No
    AND    POSTP_TP         = v_Postp_Tp;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0120SvrPostpone; 


  /*****************************************************************************
  -- [RE] 이연대상 중도변경 처리
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangePostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre0125 IS
    SELECT  ORD_NO, POSTP_TP, POSTP_SEQ
    FROM    RTRE0125
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = v_Postp_Tp
    AND     POSTP_YM >= v_Ppch_Ym;
                            
    e_Error EXCEPTION;
    
    v_Prost_Tp   RTRE0120.PROST_TP%TYPE DEFAULT NULL;
    
    v_Postp_Seq  RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
    v_Postp_Stat RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_Postp_Ym   RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Ly_Tpp_Amt RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;
    
    v_curr_cunt  NUMBER;
    
    
  BEGIN

    -- 필수값: 계약번호, 이연항목, 이연대상상태, 이연대상상태변경년월, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) = 0 THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Postp_Tp) IS NULL) OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R037', v_Postp_Tp) THEN
        v_Return_Message := '이연항목('||v_Postp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pp_Stat) IS NULL) OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R038', v_Pp_Stat) THEN
        v_Return_Message := '이연대상상태('||v_Pp_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ppch_Ym) IS NULL) THEN
        v_Return_Message := '이연대상상태변경년월('||v_Ppch_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


--  DBMS_OUTPUT.Put_Line('SELECT  이전 ' || v_Postp_Tp);

    v_Ly_Tpp_Amt := 0;
    v_Cy_Pp_Amt  := 0;
    v_Cy_Tpp_Amt := 0;
    v_Cm_Pp_Amt  := 0;
    v_Cm_R_Amt   := 0;

    BEGIN
    -- 이연처리 처리구분 발췌
    SELECT  PROST_TP
    INTO    v_Prost_Tp
    FROM    RTRE0120
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = v_Postp_Tp;
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;
    
    
    BEGIN
    -- 이연처리  월별에서 금액자료발췌
    SELECT  LY_TPP_AMT,   CY_PP_AMT,   CY_TPP_AMT,   CM_PP_AMT,   CM_R_AMT
    INTO    v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt, v_Cm_Pp_AMT, v_Cm_R_Amt
    FROM    RTRE0125
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = v_Postp_Tp
    AND     POSTP_YM  = v_Ppch_Ym;
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '변경년월('||v_Postp_Ym||') : 의 이연 월별정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;
    
    
--    IF 0 = f_sRtre0120Count(v_Ord_No, v_Postp_Tp) THEN
--        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보가 존재하지 않아 처리가 불가 합니다!';
--        RAISE e_Error;
--    END;
              
    -- 이연정보 중도변경으로 UPDATE
    IF 0 <> f_UpdateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pp_Stat, v_Ppch_Ym, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보 UPDATE 오류입니다!';
        RAISE e_Error;
    END IF;  
    

    -- 이연처리 월별내역 UPDATE
    FOR CUR_0125 IN Cur_Rtre0125 LOOP
        EXIT WHEN Cur_Rtre0125%NOTFOUND;  

        v_Postp_Stat := 'Z';
        IF 0 <> Pkg_Rtre0125.f_UpdateRtre0125Postpone(v_Ord_No, v_Postp_Tp, CUR_0125.POSTP_SEQ, 
                                                      v_Postp_Stat, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보 월별내역 중도변경 오류입니다!';
            RAISE e_Error;
        END IF;  

    END LOOP;    
    
    IF Cur_Rtre0125%ISOPEN THEN
        CLOSE Cur_Rtre0125;
    END IF;    


    -- 이연회차
    v_Postp_Seq := Pkg_Rtre0125.f_sRtre0125MaxSeq(v_Ord_No, v_Postp_Tp) + 1;
    -- 이연상태
    v_Postp_Stat := v_Pp_Stat;
    -- 대상년월
    v_Postp_Ym   := v_Ppch_Ym;
    
    IF v_Prost_Tp = 'A'  THEN       -- 자산자료 금액 계산
        -- 전기말 누적액
        v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;
        -- 당기 처리액
        v_Cy_Pp_Amt  := v_Cy_Pp_Amt  - v_Cm_Pp_Amt;  
        -- 당기 총 누적액
        v_Cy_Tpp_Amt := v_Cy_Tpp_Amt - v_Cm_Pp_Amt;  
        -- 당월 잔존가액
        v_Cm_R_Amt   := v_Cm_R_Amt   + v_Cm_Pp_Amt;
        -- 당월 처리금액
        v_Cm_Pp_Amt := 0;
    ELSE                            -- 매출/비용
        -- 전기말 누적액
        v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;
        -- 당기 처리액
        v_Cy_Pp_Amt  := v_Cy_Pp_Amt  + v_Cm_R_Amt;  
        -- 당기 총 누적액
        v_Cy_Tpp_Amt := v_Cy_Tpp_Amt + v_Cm_R_Amt;  
        -- 당월 처리금액
        v_Cm_Pp_Amt  := v_Cm_Pp_Amt  + v_Cm_R_Amt;
        -- 당월 잔존가액
        v_Cm_R_Amt   := 0;
    END IF;        
        
        
--        IF 0 != f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
--                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
--                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText 
    IF 0 != Pkg_Rtre0125.f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
                              v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
                              v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText 
                            ) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') 순번('||v_Postp_Seq||')[RE] 이연처리 월별내역 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        IF Cur_Rtre0125%ISOPEN THEN
            CLOSE Cur_Rtre0125;
        END IF;    
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre0125%ISOPEN THEN
            CLOSE Cur_Rtre0125;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(2)', v_ErrorText, v_Return_Message);

  END p_Rtre0120ChangePostpone;
  

  /*****************************************************************************
  -- [RE] 이연대상 중도변경 처리 Main
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangeMain (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre0120 IS
    SELECT  ORD_NO, POSTP_TP
    FROM    RTRE0120
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = DECODE(NVL(v_Postp_Tp,''),'', POSTP_TP, v_Postp_Tp) ;
                            
    e_Error EXCEPTION;
    
    v_curr_cunt  NUMBER;
    
    
  BEGIN

    -- 필수값: 계약번호, 이연항목, 이연대상상태, 이연대상상태변경년월, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) = 0 THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 이연항목 NULL로 넘어올 수 있음
    IF (TRIM(v_Postp_Tp) IS NOT NULL) THEN
        IF 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R037', v_Postp_Tp) THEN
            v_Return_Message := '이연항목('||v_Postp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    IF (TRIM(v_Pp_Stat) IS NULL) OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R038', v_Pp_Stat) THEN
        v_Return_Message := '이연대상상태('||v_Pp_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ppch_Ym) IS NULL) THEN
        v_Return_Message := '이연대상상태변경년월('||v_Ppch_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;





    -- 이연처리 월별내역 UPDATE
    FOR CUR_0120 IN Cur_Rtre0120 LOOP
        EXIT WHEN Cur_Rtre0120%NOTFOUND;  

        BEGIN
        -- 이연처리  월별에서 대상존재여부 확인
        v_curr_cunt := 0;
        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE0125
        WHERE   ORD_NO    = v_Ord_No
        AND     POSTP_TP  = CUR_0120.POSTP_TP
        AND     POSTP_YM >= v_Ppch_Ym
        AND     POSTP_STAT IN ('A', 'O');
        
        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
        END;
    
        IF v_curr_cunt > 0 THEN
            p_Rtre0120ChangePostpone(v_Ord_No, CUR_0120.POSTP_TP, v_Pp_Stat, v_Ppch_Ym, 
                                     v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
            IF  v_Success_Code <> 0 THEN
                RAISE e_Error;
            END IF;
        END IF;  

    END LOOP;    
    
    IF Cur_Rtre0120%ISOPEN THEN
        CLOSE Cur_Rtre0120;
    END IF;    



    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtre0120%ISOPEN THEN
            CLOSE Cur_Rtre0120;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangeMain(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre0120%ISOPEN THEN
            CLOSE Cur_Rtre0120;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangeMain(2)', v_ErrorText, v_Return_Message);

  END p_Rtre0120ChangeMain;
  

  /*****************************************************************************
  -- 등록비 이연대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120RegiPostpone (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtcs0001 IS
    SELECT  A.ORD_NO, SUBSTR(A.PROC_DAY,1,6) PSTR_YM,
            ROUND( B.REGI_AMT / 1.1 ) REGI_AMT, 
            B.PERIOD_CD, B.CHAN_CD, 
            DECODE( B.CHAN_CD, '01', B.AGENCY_CD, 
                DECODE(B.CHAN_CD, '05', B.AGENCY_CD, B.ORD_AGENT)) AGENCY_CD,   
            C.CUST_TP, A.MAT_CD, B.CNT_CD
    FROM    RTCS0001 A,
            RTSD0108 B,
            RTSD0100 C
    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
    AND     A.ORD_NO    = B.ORD_NO
    AND     B.CUST_NO   = C.CUST_NO
    ORDER BY  A.PROC_DAY,  A.ORD_NO ;
                            
    e_Error EXCEPTION;
    v_curr_cunt  NUMBER;
    
    v_Ord_No          RTRE0120.ORD_NO%TYPE;         /*계약번호              */
    v_Postp_Tp        RTRE0120.POSTP_TP%TYPE;       /*이연항목              */
    v_Pstr_Ym         RTRE0120.PSTR_YM%TYPE;        /*이연시작월            */
    v_Pptrm           RTRE0120.PPTRM%TYPE;          /*이연기간              */
    v_Acq_Amt         RTRE0120.ACQ_AMT%TYPE;        /*이연처리대상금액      */
    v_Res_Amt         RTRE0120.RES_AMT%TYPE;        /*잔존가액              */
    v_Prost_Tp        RTRE0120.PROST_TP%TYPE;       /*처리구분              */
    v_Chan_Cd         RTRE0120.CHAN_CD%TYPE;        /*채널구분              */
    v_Agency_Cd       RTRE0120.AGENCY_CD%TYPE;      /*취득조직              */
    v_Cust_Tp         RTRE0120.CUST_TP%TYPE;        /*고객유형              */
    v_Mat_Cd          RTRE0120.MAT_CD%TYPE;         /*상품코드              */
    v_Ord_Qty         RTRE0120.ORD_QTY%TYPE;        /*장착갯수              */
   
  BEGIN

    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Pstr_Ym   := v_Period;
    v_Prost_Tp  := 'P';     -- 매출(P)
    v_Postp_Tp  := '01';    -- 등록비(01)
    -- 이미처리되었는지 확인
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_curr_cunt := 0;
    -- 이연처리 월별내역 UPDATE
    FOR CUR_0001 IN Cur_Rtcs0001 LOOP
        EXIT WHEN Cur_Rtcs0001%NOTFOUND;  

        v_curr_cunt := v_curr_cunt + 1;
--        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
--                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
--                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
        p_CreateRtre0120Postpone(CUR_0001.ORD_NO, v_Postp_Tp, v_Pstr_Ym, CUR_0001.PERIOD_CD,
                                 CUR_0001.REGI_AMT, 0, v_Prost_Tp, CUR_0001.CHAN_CD,
                                 CUR_0001.AGENCY_CD, CUR_0001.CUST_TP, CUR_0001.MAT_CD, CUR_0001.CNT_CD,
                                 v_Reg_Id, 
                                 v_Success_Code, v_Return_Message, v_ErrorText);
        IF  v_Success_Code <> 0 THEN
            RAISE e_Error;
        END IF;

    END LOOP;    
    
    IF Cur_Rtcs0001%ISOPEN THEN
        CLOSE Cur_Rtcs0001;
    END IF;    


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감년월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtcs0001%ISOPEN THEN
            CLOSE Cur_Rtcs0001;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120RegiPostpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtcs0001%ISOPEN THEN
            CLOSE Cur_Rtcs0001;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120RegiPostpone(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0120RegiPostpone;
    

  /*****************************************************************************
  -- 감가상각비 이연대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120DeprePostpone (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtcs0003 IS
    SELECT  A.MATNR, A.MENGE,  A.COSGAMT
    FROM    RTCS0003 A
    WHERE   A.ZMONTH = v_Period
    ORDER BY A.MATNR;
                            
    CURSOR  Cur_Rtcs0001 (v_Mat_Cd VARCHAR) IS
    SELECT  COUNT(*) OVER() CNT,
            A.ORD_NO, SUBSTR(A.PROC_DAY,1,6) PSTR_YM,
            B.PERIOD_CD, B.CHAN_CD, 
            DECODE( B.CHAN_CD, '01', B.AGENCY_CD, 
                DECODE(B.CHAN_CD, '05', B.AGENCY_CD, B.ORD_AGENT)) AGENCY_CD,   
            C.CUST_TP, A.MAT_CD, B.CNT_CD, B.ORD_DAY
    FROM    RTCS0001 A,
            RTSD0108 B,
            RTSD0100 C
    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
    AND     A.ORD_NO    = B.ORD_NO
    AND     B.CUST_NO   = C.CUST_NO
    AND     A.MAT_CD    = v_Mat_Cd
    ORDER BY  A.PROC_DAY,  A.ORD_NO;
                            
    e_Error EXCEPTION;
    v_curr_cunt  NUMBER;
    
    v_Ord_No          RTRE0120.ORD_NO%TYPE;         /*계약번호              */
    v_Postp_Tp        RTRE0120.POSTP_TP%TYPE;       /*이연항목              */
    v_Pstr_Ym         RTRE0120.PSTR_YM%TYPE;        /*이연시작월            */
    v_Pptrm           RTRE0120.PPTRM%TYPE;          /*이연기간              */
    v_Acq_Amt         RTRE0120.ACQ_AMT%TYPE;        /*이연처리대상금액      */
    v_Res_Amt         RTRE0120.RES_AMT%TYPE;        /*잔존가액              */
    v_Prost_Tp        RTRE0120.PROST_TP%TYPE;       /*처리구분              */
    v_Chan_Cd         RTRE0120.CHAN_CD%TYPE;        /*채널구분              */
    v_Agency_Cd       RTRE0120.AGENCY_CD%TYPE;      /*취득조직              */
    v_Cust_Tp         RTRE0120.CUST_TP%TYPE;        /*고객유형              */
    v_Mat_Cd          RTRE0120.MAT_CD%TYPE;         /*상품코드              */
    v_Ord_Qty         RTRE0120.ORD_QTY%TYPE;        /*장착갯수              */
    v_Acq_Tot         RTRE0120.ACQ_AMT%TYPE;        /*이연처리전체금액      */
   
  BEGIN

    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Pstr_Ym   := v_Period;
    -- 이미처리되었는지 확인
    v_Postp_Tp  := '03';    -- 감가상각 계약기간(03)
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Postp_Tp  := '02';    -- 감가상각 60개월(02)
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    v_Postp_Tp  := '09';    -- 감가상각 계약기간--걱정제로1
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Postp_Tp  := '10';    -- 감가상각 계약기간--걱정제로2
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 제품별 갯수 check
    v_Mat_Cd := '';
    v_curr_cunt := 0;
    BEGIN
    SELECT  MATNR   --, CNT_COST, CNT_ORD
    INTO    v_Mat_Cd
--    SELECT  COUNT(*)
--    INTO    v_curr_cunt
    FROM    (  
        SELECT  MATNR, SUM(CNT_COST) CNT_COST, SUM(CNT_ORD) CNT_ORD
        FROM  (
                SELECT  MATNR MATNR, SUM(MENGE) CNT_COST, 0 CNT_ORD
                FROM    RTCS0003
                WHERE   ZMONTH = v_Period
                GROUP BY MATNR
                UNION ALL
                SELECT  A.MAT_CD MATNR, 0 CNT_COST, SUM(B.CNT_CD) CNT_ORD
                FROM    RTCS0001 A,
                        RTSD0108 B
                WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                                       AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
                AND     A.ORD_NO = B.ORD_NO
                GROUP BY A.MAT_CD
              )
        GROUP BY MATNR
        HAVING SUM(CNT_COST) <> SUM(CNT_ORD)
        )
    WHERE   ROWNUM = 1; 
    
    EXCEPTION
    WHEN OTHERS THEN
        v_curr_cunt := 0;
    END;    
    
    IF v_curr_cunt <> 0 THEN
        v_Return_Message := '상품코드별 : 수량이 맞지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
--  DBMS_OUTPUT.Put_Line('SELECT 후222 v_curr_cunt' || TO_CHAR(v_curr_cunt));
    
    -- 이연처리 월별내역 생성
    FOR CUR_0003 IN Cur_Rtcs0003 LOOP
        EXIT WHEN Cur_Rtcs0003%NOTFOUND;
        
        v_Mat_Cd := CUR_0003.MATNR;
        v_curr_cunt := 1;
        v_Acq_Tot := 0;
          
        FOR CUR_0001 IN Cur_Rtcs0001(v_Mat_Cd) LOOP
            EXIT WHEN Cur_Rtcs0001%NOTFOUND;  

            -- 대상금액 처리(마지막인 경우 나머지금액 전체로)
            IF v_curr_cunt = CUR_0001.CNT THEN
                v_Acq_Amt := CUR_0003.COSGAMT - v_Acq_Tot;
            ELSE
                v_Acq_Amt := TRUNC(CUR_0003.COSGAMT * (CUR_0001.CNT_CD/CUR_0003.MENGE));
                v_Acq_Tot := v_Acq_Tot + v_Acq_Amt;
            END IF;
            
            -- 처리구분
            v_Prost_Tp := 'A';
            -- 잔존가액
            v_Res_Amt := CUR_0001.CNT_CD * 1000;        -- 잔존가액 : 갯수당 1000원            
            -- 1.감가상각 계약기간 처리
            v_Postp_Tp  := '03';    -- 감가상각 계약기간(03)
            v_Pptrm := CUR_0001.PERIOD_CD;
    --        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
    --                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
    --                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
            p_CreateRtre0120Postpone(CUR_0001.ORD_NO, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
                                     v_Acq_Amt, v_Res_Amt, v_Prost_Tp, CUR_0001.CHAN_CD,
                                     CUR_0001.AGENCY_CD, CUR_0001.CUST_TP, CUR_0001.MAT_CD, CUR_0001.CNT_CD,
                                     v_Reg_Id, 
                                     v_Success_Code, v_Return_Message, v_ErrorText);
            IF  v_Success_Code <> 0 THEN
                RAISE e_Error;
            END IF;

            -- 2.감가상각 60개월 처리
            v_Postp_Tp  := '02';    -- 감가상각 60개월(02)
            v_Pptrm := 60;
            p_CreateRtre0120Postpone(CUR_0001.ORD_NO, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
                                     v_Acq_Amt, v_Res_Amt, v_Prost_Tp, CUR_0001.CHAN_CD,
                                     CUR_0001.AGENCY_CD, CUR_0001.CUST_TP, CUR_0001.MAT_CD, CUR_0001.CNT_CD,
                                     v_Reg_Id, 
                                     v_Success_Code, v_Return_Message, v_ErrorText);
            IF  v_Success_Code <> 0 THEN
                RAISE e_Error;
            END IF; 
            
            /*김한나 추가 바퀴의 개수가 네개인 경우 이연처리 대상 */
            IF CUR_0001.CNT_CD = '04' THEN
         --     IF CUR_0001.ORD_DAY > '20151231' THEN  /*12/31 경우 이연 대상*/
                    -- 처리구분
                    v_Prost_Tp := 'A';
                    -- 잔존가액
                    v_Res_Amt := 0;        -- 잔존가액 : 갯수당 1000원1개만 할거니 개수는 1000원            
                    -- 1.감가상각 계약기간 처리-- 타이어 1개
                    v_Postp_Tp  := '09';    -- 감가상각 계약기간(03)
                    v_Pptrm := CUR_0001.PERIOD_CD;
            --        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
            --                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
            --                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
                    p_CreateRtre0120ZeroPostpone(CUR_0001.ORD_NO, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
                                             v_Acq_Amt, v_Res_Amt, v_Prost_Tp, CUR_0001.CHAN_CD,
                                             CUR_0001.AGENCY_CD, CUR_0001.CUST_TP, CUR_0001.MAT_CD, '01',
                                             v_Reg_Id, 
                                             v_Success_Code, v_Return_Message, v_ErrorText);
                    IF  v_Success_Code <> 0 THEN
                        RAISE e_Error;
                    END IF;
                    
                    -- 1.감가상각 계약기간 처리--타이어 1개 
                    v_Postp_Tp  := '10';    -- 감가상각 계약기간(03)
                    v_Pptrm := CUR_0001.PERIOD_CD;
            --        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
            --                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
            --                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
                    p_CreateRtre0120ZeroPostpone(CUR_0001.ORD_NO, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
                                             v_Acq_Amt, v_Res_Amt, v_Prost_Tp, CUR_0001.CHAN_CD,
                                             CUR_0001.AGENCY_CD, CUR_0001.CUST_TP, CUR_0001.MAT_CD, '01',
                                             v_Reg_Id, 
                                             v_Success_Code, v_Return_Message, v_ErrorText);
                    IF  v_Success_Code <> 0 THEN
                        RAISE e_Error;
                    END IF;
                    

                  /*  -- 2.감가상각 60개월 처리
                    v_Postp_Tp  := '09';    -- 감가상각 60개월(02)
                    v_Pptrm := 60;
                    p_CreateRtre0120ZeroPostpone(CUR_0001.ORD_NO, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
                                             v_Acq_Amt, v_Res_Amt, v_Prost_Tp, CUR_0001.CHAN_CD,
                                             CUR_0001.AGENCY_CD, CUR_0001.CUST_TP, CUR_0001.MAT_CD, '01',
                                             v_Reg_Id, 
                                             v_Success_Code, v_Return_Message, v_ErrorText);
                    IF  v_Success_Code <> 0 THEN
                        RAISE e_Error;
                    END IF;     
                    
                    -- 2.감가상각 60개월 처리
                    v_Postp_Tp  := '10';    -- 감가상각 60개월(02)
                    v_Pptrm := 60;
                    p_CreateRtre0120ZeroPostpone(CUR_0001.ORD_NO, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
                                             v_Acq_Amt, v_Res_Amt, v_Prost_Tp, CUR_0001.CHAN_CD,
                                             CUR_0001.AGENCY_CD, CUR_0001.CUST_TP, CUR_0001.MAT_CD, '01',
                                             v_Reg_Id, 
                                             v_Success_Code, v_Return_Message, v_ErrorText);
                    IF  v_Success_Code <> 0 THEN
                        RAISE e_Error;
                    END IF;    */       
         --      END IF;              
            END IF;
            
            
            /*김한나 추가 끝 */
            v_curr_cunt := v_curr_cunt + 1;

        END LOOP;    

        IF Cur_Rtcs0001%ISOPEN THEN
            CLOSE Cur_Rtcs0001;
        END IF;    

    END LOOP;    
    
    IF Cur_Rtcs0003%ISOPEN THEN
        CLOSE Cur_Rtcs0003;
    END IF;    


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감년월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtcs0001%ISOPEN THEN
            CLOSE Cur_Rtcs0001;
        END IF;    
        IF Cur_Rtcs0003%ISOPEN THEN
            CLOSE Cur_Rtcs0003;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120DeprePostpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtcs0001%ISOPEN THEN
            CLOSE Cur_Rtcs0001;
        END IF;    
        IF Cur_Rtcs0003%ISOPEN THEN
            CLOSE Cur_Rtcs0003;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120DeprePostpone(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0120DeprePostpone;
    

  /*****************************************************************************
  -- 이연처리 변경사항 반영-기존타이어 감가상각 변경 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ChangePost (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtsd0108 IS
    SELECT  A.ORD_NO, A.END_TP, B.POSTP_TP 
    FROM    RTSD0108 A,
            RTRE0120 B
    WHERE   A.CANC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
    AND     A.MFP_YN = 'Y'
    AND     A.ORD_NO = B.ORD_NO;
                           
                            
    e_Error EXCEPTION;
    v_curr_cunt  NUMBER;
    
    v_Ord_No          RTRE0120.ORD_NO%TYPE;         /*계약번호              */
    v_Postp_Tp        RTRE0120.POSTP_TP%TYPE;       /*이연항목              */
    v_Pstr_Ym         RTRE0120.PSTR_YM%TYPE;        /*이연시작월            */
    v_Pptrm           RTRE0120.PPTRM%TYPE;          /*이연기간              */
    v_Acq_Amt         RTRE0120.ACQ_AMT%TYPE;        /*이연처리대상금액      */
    v_Res_Amt         RTRE0120.RES_AMT%TYPE;        /*잔존가액              */
    v_Prost_Tp        RTRE0120.PROST_TP%TYPE;       /*처리구분              */
    v_Chan_Cd         RTRE0120.CHAN_CD%TYPE;        /*채널구분              */
    v_Agency_Cd       RTRE0120.AGENCY_CD%TYPE;      /*취득조직              */
    v_Cust_Tp         RTRE0120.CUST_TP%TYPE;        /*고객유형              */
    v_Mat_Cd          RTRE0120.MAT_CD%TYPE;         /*상품코드              */
    v_Ord_Qty         RTRE0120.ORD_QTY%TYPE;        /*장착갯수              */
    v_Acq_Tot         RTRE0120.ACQ_AMT%TYPE;        /*이연처리전체금액      */
   
  BEGIN

    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Pstr_Ym   := v_Period;

    -- 이미처리되었는지 확인
    v_curr_cunt := 0;
    BEGIN
    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0108 A,
            RTRE0120 B
    WHERE   A.CANC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
    AND     A.MFP_YN = 'Y'
    AND     A.ORD_NO = B.ORD_NO
    AND     B.PP_STAT <> 'A'
    AND     ROWNUM =  1;
    
    EXCEPTION
    WHEN OTHERS THEN
        v_curr_cunt := 0;
    END;
    
    IF NVL(v_curr_cunt, 0) > 0 THEN
        v_Return_Message := '마감년월('||v_Period||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    -- 이연처리 변경내역 생성
    FOR CUR_0108 IN Cur_Rtsd0108 LOOP
        EXIT WHEN Cur_Rtsd0108%NOTFOUND;
        
        v_curr_cunt := v_curr_cunt + 1;
    --        p_Rtre0120ChangeMain(v_Ord_No, v_Postp_Tp, v_Pp_Stat, v_Ppch_Ym,
            p_Rtre0120ChangeMain(CUR_0108.ORD_NO, CUR_0108.POSTP_TP, CUR_0108.END_TP, v_Period,
                                     v_Reg_Id, 
                                     v_Success_Code, v_Return_Message, v_ErrorText);
            IF  v_Success_Code <> 0 THEN
                RAISE e_Error;
            END IF;
            
    END LOOP;    
    
    IF Cur_Rtsd0108%ISOPEN THEN
        CLOSE Cur_Rtsd0108;
    END IF;    


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감년월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtsd0108%ISOPEN THEN
            CLOSE Cur_Rtsd0108;
        END IF;    

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtsd0108%ISOPEN THEN
            CLOSE Cur_Rtsd0108;
        END IF;    
    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0120ChangePost;
    

  /*****************************************************************************
  -- 수수료 이연대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120CommPostpone (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre0120 IS
    SELECT  A.ORD_NO,
            A.COMM_TP,
            A.SLCM_YM                   PSRT_YM,
            ROUND( A.SLCM_AMT / 1.1)    ACQ_AMT,
            B.PERIOD_CD,
            A.CHAN_CD,
            A.ORD_AGENT                 AGENCY_CD,
            C.CUST_TP,
            A.MAT_CD,
            A.CNT_CD
    FROM    RTRE5040 A, RTSD0108 B, RTSD0100 C
    WHERE   A.SLCM_YM = v_Period
    AND     A.PPOB_YN = 'Y'
    AND     A.ORD_NO  = B.ORD_NO
    AND     A.CUST_NO = C.CUST_NO
    UNION
    SELECT  A.ORD_NO,
            A.COMM_TP,
            A.SLCM_YM                   PSRT_YM,
            ROUND( A.PROCC_AMT / 1.1 )  ACQ_AMT,
            B.PERIOD_CD,
            A.CHAN_CD,
            A.AGENCY_CD,
            C.CUST_TP,
            A.MAT_CD,
            A.CNT_CD
    FROM    RTRE5050 A, RTSD0108 B, RTSD0100 C
    WHERE   A.SLCM_YM = v_Period
    AND     A.PPOB_YN = 'Y'
    AND     A.ORD_NO  = B.ORD_NO
    AND     A.CUST_NO = C.CUST_NO;
    
                                
    e_Error EXCEPTION;
    v_curr_cunt  NUMBER;
    
    v_Ord_No          RTRE0120.ORD_NO%TYPE;         /*계약번호              */
    v_Postp_Tp        RTRE0120.POSTP_TP%TYPE;       /*이연항목              */
    v_Pstr_Ym         RTRE0120.PSTR_YM%TYPE;        /*이연시작월            */
    v_Pptrm           RTRE0120.PPTRM%TYPE;          /*이연기간              */
    v_Acq_Amt         RTRE0120.ACQ_AMT%TYPE;        /*이연처리대상금액      */
    v_Res_Amt         RTRE0120.RES_AMT%TYPE;        /*잔존가액              */
    v_Prost_Tp        RTRE0120.PROST_TP%TYPE;       /*처리구분              */
    v_Chan_Cd         RTRE0120.CHAN_CD%TYPE;        /*채널구분              */
    v_Agency_Cd       RTRE0120.AGENCY_CD%TYPE;      /*취득조직              */
    v_Cust_Tp         RTRE0120.CUST_TP%TYPE;        /*고객유형              */
    v_Mat_Cd          RTRE0120.MAT_CD%TYPE;         /*상품코드              */
    v_Ord_Qty         RTRE0120.ORD_QTY%TYPE;        /*장착갯수              */
   
  BEGIN

    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) OR (0 <> ISDATE(v_Period)) OR (6 <> LENGTH(TRIM(v_Period))) THEN
        v_Return_Message := '마감년월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Pstr_Ym   := v_Period;
    v_Prost_Tp  := 'C';     -- 비용(C)
    
    -- 이미처리되었는지 확인
    v_Postp_Tp  := '04';    -- 대리점 판매수수료(04)
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Postp_Tp  := '05';    -- 방판 판매수수료(05)
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Postp_Tp  := '06';    -- 오픈몰 판매수수료(06)
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Postp_Tp  := '07';    -- 타이어뱅크 판매수수료(07)
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Postp_Tp  := '08';    -- 장착수수료(08)
    IF 0 <> f_sRtre0120Pstr_YmCount(v_Pstr_Ym, v_Postp_Tp) THEN
        v_Return_Message := '마감년월('||v_Period||') 이연항목('||v_Postp_Tp||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_curr_cunt := 0;
    
    -- 이연처리 월별내역 UPDATE
    FOR CUR_0120 IN Cur_Rtre0120 LOOP
        EXIT WHEN Cur_Rtre0120%NOTFOUND;  

        v_curr_cunt := v_curr_cunt + 1;
        
        IF    CUR_0120.COMM_TP = 'A1' THEN v_Postp_Tp := '04';
        ELSIF CUR_0120.COMM_TP = 'A2' THEN v_Postp_Tp := '05';
        ELSIF CUR_0120.COMM_TP = 'A3' THEN v_Postp_Tp := '06';
        ELSIF CUR_0120.COMM_TP = 'A4' THEN v_Postp_Tp := '07';
        ELSIF CUR_0120.COMM_TP = 'B1' THEN v_Postp_Tp := '08';
        END IF;
        
--        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
--                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
--                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
        p_CreateRtre0120Postpone(CUR_0120.ORD_NO, v_Postp_Tp, v_Pstr_Ym, CUR_0120.PERIOD_CD,
                                 CUR_0120.ACQ_AMT, 0, v_Prost_Tp, CUR_0120.CHAN_CD,
                                 CUR_0120.AGENCY_CD, CUR_0120.CUST_TP, CUR_0120.MAT_CD, CUR_0120.CNT_CD,
                                 v_Reg_Id, 
                                 v_Success_Code, v_Return_Message, v_ErrorText);
        IF  v_Success_Code <> 0 THEN
            RAISE e_Error;
        END IF;

    END LOOP;    
    
    IF Cur_Rtre0120%ISOPEN THEN
        CLOSE Cur_Rtre0120;
    END IF;    


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감년월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtre0120%ISOPEN THEN
            CLOSE Cur_Rtre0120;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120CommPostpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre0120%ISOPEN THEN
            CLOSE Cur_Rtre0120;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120CommPostpone(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0120CommPostpone;
    
/*****************************************************************************
  -- 이연처리 변경사항 반영-- 걱정제로 서비스 이연 변경           <시작 
  로직설명 : 걱정제로 타이어의 충당금을 중도완납 프로세스와 유사하게 보내서 충당처리 하는 프로시저
  구분==> 'C' / 당월감가상각액 ==>  0 / 당월 잔존가액==> 전달의 당월 잔존가액으로 보내야 한다
  그리고 나머지는 모두 Z처리하여 향후이연내역을 보내지 않도록 처리하는 로직   
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ChangePostSer (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

/*****************************************************************************
      추출 대상 : QNT 2인 경우 충당금 2개 감가상각돌리는 것 추출 
                  QNT 1인 경우 충당금 1개 
*****************************************************************************/
    CURSOR  Cur_Rtcs0010 IS
    SELECT A.ORD_NO, MIN(A.POSTP_TP) AS POSTP_TP,  A.END_TP 
    FROM (
        SELECT   A.ORD_NO, B.POSTP_TP,  'S' AS END_TP, A.KWMENG , B.PP_STAT
        FROM    RTCS0010 A,
                RTRE0120 B
        WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                               AND TO_CHAR(LAST_DAY(TO_DATE('201602', 'YYYYMM')), 'YYYYMMDD')
        AND     A.DLV_STAT <> '06'
        AND     A.ORD_NO = B.ORD_NO
        AND     B.POSTP_TP IN ('09','10')
        AND     B.PP_STAT NOT IN ('Z','C','E','S') 
        AND     A.KWMENG = '1') A
    GROUP BY A.ORD_NO,A.END_TP
    UNION ALL 
    SELECT  A.ORD_NO, B.POSTP_TP, 'S' AS END_TP
      FROM    RTCS0010 A,
            RTRE0120 B
     WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE('201602', 'YYYYMM')), 'YYYYMMDD')
       AND     A.DLV_STAT <> '06'
       AND     A.ORD_NO = B.ORD_NO
       AND     B.POSTP_TP IN ('09','10')
       AND     B.PP_STAT NOT IN ('Z','C','E','S') 
       AND     A.KWMENG = '2';
                           
                            
    e_Error EXCEPTION;
    v_curr_cunt  NUMBER;
    
    v_Ord_No          RTRE0120.ORD_NO%TYPE;         /*계약번호              */
    v_Postp_Tp        RTRE0120.POSTP_TP%TYPE;       /*이연항목              */
    v_Pstr_Ym         RTRE0120.PSTR_YM%TYPE;        /*이연시작월            */
    v_Pptrm           RTRE0120.PPTRM%TYPE;          /*이연기간              */
    v_Acq_Amt         RTRE0120.ACQ_AMT%TYPE;        /*이연처리대상금액      */
    v_Res_Amt         RTRE0120.RES_AMT%TYPE;        /*잔존가액              */
    v_Prost_Tp        RTRE0120.PROST_TP%TYPE;       /*처리구분              */
    v_Chan_Cd         RTRE0120.CHAN_CD%TYPE;        /*채널구분              */
    v_Agency_Cd       RTRE0120.AGENCY_CD%TYPE;      /*취득조직              */
    v_Cust_Tp         RTRE0120.CUST_TP%TYPE;        /*고객유형              */
    v_Mat_Cd          RTRE0120.MAT_CD%TYPE;         /*상품코드              */
    v_Ord_Qty         RTRE0120.ORD_QTY%TYPE;        /*장착갯수              */
    v_Acq_Tot         RTRE0120.ACQ_AMT%TYPE;        /*이연처리전체금액      */
   
  BEGIN

    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Pstr_Ym   := v_Period;

    -- 이미처리되었는지 확인
    v_curr_cunt := 0;
    BEGIN
    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0010 A,
            RTRE0120 B
    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
    AND     A.DLV_STAT <> '06'
    AND     A.ORD_NO = B.ORD_NO
    AND     B.PP_STAT <> 'A'
    AND     B.POSTP_TP IN ('09','10') 
    AND     ROWNUM =  1;
    
    EXCEPTION
    WHEN OTHERS THEN
        v_curr_cunt := 0;
    END;
    
    IF NVL(v_curr_cunt, 0) > 0 THEN
        v_Return_Message := '마감년월('||v_Period||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    -- 이연처리 변경내역 생성
    FOR CUR_0010 IN Cur_Rtcs0010 LOOP
        EXIT WHEN Cur_Rtcs0010%NOTFOUND;

        v_curr_cunt := v_curr_cunt + 1;
    --        p_Rtre0120ChangeMain(v_Ord_No, v_Postp_Tp, v_Pp_Stat, v_Ppch_Ym,
            p_Rtre0120ChangeMainSer(CUR_0010.ORD_NO, CUR_0010.POSTP_TP, CUR_0010.END_TP, v_Period,
                                     v_Reg_Id, 
                                     v_Success_Code, v_Return_Message, v_ErrorText);
                                  
            IF  v_Success_Code <> 0 THEN
                RAISE e_Error;
            END IF;
            
    END LOOP;    
    
    IF Cur_Rtcs0010%ISOPEN THEN
        CLOSE Cur_Rtcs0010;
    END IF;    


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감년월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtcs0010%ISOPEN THEN
            CLOSE Cur_Rtcs0010;
        END IF;    

        ROLLBACK;
       -- v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtcs0010%ISOPEN THEN
            CLOSE Cur_Rtcs0010;
        END IF;    
    
        ROLLBACK; 
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0120ChangePostSer; 
  
/*****************************************************************************
  -- 이연처리 변경사항 반영-- 걱정제로 서비스 이연 변경      감가상각    <시작 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0120ChangePostSer1 (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

/*****************************************************************************
      추출 대상 : QNT 2인 경우 충당금 2개 감가상각돌리는 것 추출 
                  QNT 1인 경우 충당금 1개 
*****************************************************************************/
    CURSOR  Cur_Rtcs0010 IS
    SELECT   A.ORD_NO, B.POSTP_TP,  'S' AS END_TP, B.ORD_QTY   , B.PP_STAT
        FROM    RTCS0010 A,
                RTRE0120 B
        WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                               AND TO_CHAR(LAST_DAY(TO_DATE('201602', 'YYYYMM')), 'YYYYMMDD')
        AND     A.DLV_STAT <> '06'
        AND     A.ORD_NO = B.ORD_NO
        AND     B.POSTP_TP IN ('02','03')
        AND     B.PP_STAT IN ('A', 'O');
                           
                            
    e_Error EXCEPTION;
    v_curr_cunt  NUMBER;
    
    v_Ord_No          RTRE0120.ORD_NO%TYPE;         /*계약번호              */
    v_Postp_Tp        RTRE0120.POSTP_TP%TYPE;       /*이연항목              */
    v_Pstr_Ym         RTRE0120.PSTR_YM%TYPE;        /*이연시작월            */
    v_Pptrm           RTRE0120.PPTRM%TYPE;          /*이연기간              */
    v_Acq_Amt         RTRE0120.ACQ_AMT%TYPE;        /*이연처리대상금액      */
    v_Res_Amt         RTRE0120.RES_AMT%TYPE;        /*잔존가액              */
    v_Prost_Tp        RTRE0120.PROST_TP%TYPE;       /*처리구분              */
    v_Chan_Cd         RTRE0120.CHAN_CD%TYPE;        /*채널구분              */
    v_Agency_Cd       RTRE0120.AGENCY_CD%TYPE;      /*취득조직              */
    v_Cust_Tp         RTRE0120.CUST_TP%TYPE;        /*고객유형              */
    v_Mat_Cd          RTRE0120.MAT_CD%TYPE;         /*상품코드              */
    v_Ord_Qty         RTRE0120.ORD_QTY%TYPE;        /*장착갯수              */
    v_Acq_Tot         RTRE0120.ACQ_AMT%TYPE;        /*이연처리전체금액      */
   
  BEGIN

    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Pstr_Ym   := v_Period;

    -- 이미처리되었는지 확인
    v_curr_cunt := 0;
    BEGIN
    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0010 A,
            RTRE0120 B
    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
    AND     A.DLV_STAT <> '06'
    AND     A.ORD_NO = B.ORD_NO
    AND     B.PP_STAT <> 'A'
    AND     B.POSTP_TP IN ('02','03') 
    AND     ROWNUM =  1;
    
    EXCEPTION
    WHEN OTHERS THEN
        v_curr_cunt := 0;
    END;
    
    IF NVL(v_curr_cunt, 0) > 0 THEN
        v_Return_Message := '마감년월('||v_Period||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    -- 이연처리 변경내역 생성
    FOR CUR_0010 IN Cur_Rtcs0010 LOOP
        EXIT WHEN Cur_Rtcs0010%NOTFOUND;

        v_curr_cunt := v_curr_cunt + 1;
    --        p_Rtre0120ChangeMain(v_Ord_No, v_Postp_Tp, v_Pp_Stat, v_Ppch_Ym,
            p_Rtre0120ChangeMainSer(CUR_0010.ORD_NO, CUR_0010.POSTP_TP, CUR_0010.END_TP, v_Period,
                                     v_Reg_Id, 
                                     v_Success_Code, v_Return_Message, v_ErrorText);
                                     
                                  
            IF  v_Success_Code <> 0 THEN
                RAISE e_Error;
            END IF;
            V_RETURN_MESSAGE := V_RETURN_MESSAGE || '04';
    END LOOP;    
    
    IF Cur_Rtcs0010%ISOPEN THEN
        CLOSE Cur_Rtcs0010;
    END IF;    


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감년월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtcs0010%ISOPEN THEN
            CLOSE Cur_Rtcs0010;
        END IF;    

        ROLLBACK;
       -- v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtcs0010%ISOPEN THEN
            CLOSE Cur_Rtcs0010;
        END IF;    
    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0120ChangePostSer1;  

  /*****************************************************************************
  -- [RE] 걱정제로 이연대상 중도변경 처리 Main
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangeMainSer (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre0120 IS
    SELECT  ORD_NO, POSTP_TP
    FROM    RTRE0120
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = DECODE(NVL(v_Postp_Tp,''),'', POSTP_TP, v_Postp_Tp) ;
                            
    e_Error EXCEPTION;
    
    v_curr_cunt  NUMBER;
    
    
  BEGIN

    -- 필수값: 계약번호, 이연항목, 이연대상상태, 이연대상상태변경년월, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) = 0 THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 이연항목 NULL로 넘어올 수 있음
    IF (TRIM(v_Postp_Tp) IS NOT NULL) THEN
        IF 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R037', v_Postp_Tp) THEN
            v_Return_Message := '이연항목('||v_Postp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    IF (TRIM(v_Pp_Stat) IS NULL) OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R038', v_Pp_Stat) THEN
        v_Return_Message := '이연대상상태('||v_Pp_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ppch_Ym) IS NULL) THEN
        v_Return_Message := '이연대상상태변경년월('||v_Ppch_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 이연처리 월별내역 UPDATE
    FOR CUR_0120 IN Cur_Rtre0120 LOOP
        EXIT WHEN Cur_Rtre0120%NOTFOUND;  

        BEGIN
        -- 이연처리  월별에서 대상존재여부 확인
        v_curr_cunt := 0;
        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE0125
        WHERE   ORD_NO    = v_Ord_No
        AND     POSTP_TP  = v_Postp_Tp
        AND     POSTP_YM >= v_Ppch_Ym
        AND     POSTP_STAT IN ('A', 'O');
        
        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
        END;
    
        IF v_curr_cunt > 0 THEN
           -- p_Rtre0120ChangePostpone(v_Ord_No, CUR_0120.POSTP_TP, v_Pp_Stat, v_Ppch_Ym, 
            --                         v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
            p_Rtre0120ChangePostponeSer(v_Ord_No, v_Postp_Tp, v_Pp_Stat, v_Ppch_Ym, 
                                     v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText); 
           /* IF  v_Success_Code <> 0 THEN
                RAISE e_Error;
            END IF;*/
        END IF;  

    END LOOP;    
    
  --  IF Cur_Rtre0120%ISOPEN THEN
  --      CLOSE Cur_Rtre0120;
  --  END IF;    
V_RETURN_MESSAGE := V_RETURN_MESSAGE || '02';


    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtre0120%ISOPEN THEN
            CLOSE Cur_Rtre0120;
        END IF;    
         ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangeMain(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre0120%ISOPEN THEN
            CLOSE Cur_Rtre0120;
        END IF;    
      --  ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangeMain(2)', v_ErrorText, v_Return_Message);

  END p_Rtre0120ChangeMainSer;  
 
 /*****************************************************************************
  -- [RE] 걱정제로 이연 02,03 감가상각 변경 처리---------이게 진짜임
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangePostponeSer (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre0125 IS
    SELECT  ORD_NO, POSTP_TP, POSTP_SEQ, POSTP_STAT, POSTP_YM
    FROM    RTRE0125
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = v_Postp_Tp
    AND     POSTP_YM >= v_Ppch_Ym
    AND     POSTP_STAT  IN ('A','O');
                            
    e_Error EXCEPTION;
    
    v_Prost_Tp   RTRE0120.PROST_TP%TYPE DEFAULT NULL;
    
    v_Postp_Seq  RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
    v_Postp_Stat RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_Postp_Ym   RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Ly_Tpp_Amt RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;
    v_Ly_Tpp_Amt1 RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt1  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt1 RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt1  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt1   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;    
    
    v_curr_cunt  NUMBER;
    v_Kwmeng          NUMBER; --RTCS0010.KWMENG%TYPE;
    v_OrdQtyNow       NUMBER;
    
    v_Before_Ymd      RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Postp_Stat_Chk  RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_Ord_Qty    RTRE0120.ORD_QTY%TYPE DEFAULT NULL;   
    
  BEGIN

    -- 필수값: 계약번호, 이연항목, 이연대상상태, 이연대상상태변경년월, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) = 0 THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Postp_Tp) IS NULL) OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R037', v_Postp_Tp) THEN
        v_Return_Message := '이연항목('||v_Postp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pp_Stat) IS NULL) OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R038', v_Pp_Stat) THEN
        v_Return_Message := '이연대상상태('||v_Pp_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ppch_Ym) IS NULL) THEN
        v_Return_Message := '이연대상상태변경년월('||v_Ppch_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


--  DBMS_OUTPUT.Put_Line('SELECT  이전 ' || v_Postp_Tp);

    v_Ly_Tpp_Amt := 0;
    v_Cy_Pp_Amt  := 0;
    v_Cy_Tpp_Amt := 0;
    v_Cm_Pp_Amt  := 0;
    v_Cm_R_Amt   := 0;
    
    v_Ly_Tpp_Amt1 := 0;
    v_Cy_Pp_Amt1  := 0;
    v_Cy_Tpp_Amt1 := 0;
    v_Cm_Pp_Amt1  := 0;
    v_Cm_R_Amt1   := 0;    
   
    BEGIN
    -- 이연처리 처리구분 발췌
    SELECT  PROST_TP, DECODE(ORD_QTY_NOW,'',ORD_QTY,ORD_QTY_NOW)
    INTO    v_Prost_Tp, v_OrdQtyNow
    FROM    RTRE0120
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = v_Postp_Tp;
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;      
    
    BEGIN
    -- 이연처리 처리구분 발췌
    SELECT to_number(sum(B.KWMENG)) 
    INTO v_Kwmeng 
    FROM RTCS0010 B 
    WHERE ORD_NO =  v_Ord_No
    AND PROC_DAY BETWEEN v_Ppch_Ym||'01' AND v_Ppch_Ym||'31';
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 서비스 처리 정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;            
                     
/*    -- 이연정보 중도변경으로 UPDAT 기존
    IF 0 <> f_UpdateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pp_Stat, v_Ppch_Ym, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보 UPDATE 오류입니다!';
        RAISE e_Error;
    END IF;  */
    

    
    BEGIN
    -- 이연처리  월별에서 금액자료발췌 해당달 
    SELECT  ROUND(B.LY_TPP_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng)),  ROUND(B.CY_PP_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng)) , ROUND(B.CY_TPP_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng)),  ROUND(B.CM_PP_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng)),ROUND(B.CM_R_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng)), 
            ROUND(B.LY_TPP_AMT/ v_OrdQtyNow * v_Kwmeng),                ROUND(B.CY_PP_AMT/ v_OrdQtyNow * v_Kwmeng) ,               ROUND(B.CY_TPP_AMT/ v_OrdQtyNow * v_Kwmeng),                ROUND(B.CM_PP_AMT/ v_OrdQtyNow * v_Kwmeng),              ROUND(B.CM_R_AMT/ v_OrdQtyNow * v_Kwmeng) 
    INTO    v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt, v_Cm_Pp_AMT, v_Cm_R_Amt,
            v_Ly_Tpp_Amt1, v_Cy_Pp_Amt1, v_Cy_Tpp_Amt1, v_Cm_Pp_AMT1, v_Cm_R_Amt1
    FROM    RTRE0125 B
    WHERE   B.ORD_NO    = v_Ord_No
    AND     B.POSTP_TP  = v_Postp_Tp
    AND     B.POSTP_YM  = v_Ppch_Ym;
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '변경년월('||v_Ppch_Ym||') : 의 이연 월별정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;
    
    
   -- 이연정보 중도변경으로 UPDATE
    IF 0 <> f_UpdateRtre0120SvrPostpone(v_Ord_No, v_Postp_Tp, 'T', v_Ppch_Ym, v_OrdQtyNow - v_Kwmeng , v_Reg_Id,  v_ErrorText) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보 UPDATE 오류입니다!';
        RAISE e_Error;
    END IF;  
    /*
    
    IF 0 != f_InsertRtre0120( v_Ord_No,  v_Postp_Tp, v_Pstr_Ym, v_Pend_Ym,
                              v_Pptrm,   v_Acq_Amt,  v_Res_Amt, v_Mpp_Amt,
                              v_Lpp_Amt, v_Prost_Tp, v_Chan_Cd, v_Agency_Cd,
                              v_Cust_Tp, v_Mat_Cd,   v_Ord_Qty, v_Pp_Stat,
                              v_Ppch_Ym, v_Reg_Id,   v_ErrorText
                             ) THEN
      v_Return_Message := '계약번호('||v_Ord_No||')[RE] 이연대상 MASTER 등록 실패!!!'||'-'||v_Errortext;
      v_Errortext := v_Errortext;
      RAISE e_Error;
     END IF;*/
    BEGIN
/* Formatted on 2016-03-09 오후 2:35:08 (QP5 v5.227.12220.39754) */
        INSERT INTO RTRE0120
           SELECT ORD_NO,
                  POSTP_TP,
                  PSTR_YM,
                  PEND_YM,
                  PPTRM,
                  ROUND (ACQ_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS ACQ_AMT,
                  ROUND (RES_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS RES_AMT,
                  ROUND (MPP_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS MPP_AMT,
                  ROUND (LPP_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS LPP_AMT,
                  PROST_TP,
                  CHAN_CD,
                  AGENCY_CD,
                  CUST_TP,
                  MAT_CD,
                  ROUND (ORD_QTY / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS ORD_QTY, --변경할것
                  'A',
                  PPCH_YM,
                  REG_ID,
                  REG_DT,
                  CHG_ID,
                  CHG_DT,
                  Ord_Qty_Now
             FROM RTRE0120
            WHERE ORD_NO = v_Ord_No AND POSTP_TP = v_Postp_Tp AND PP_STAT = 'T'
           UNION ALL
           SELECT ORD_NO,
                  POSTP_TP,
                  PSTR_YM,
                  PEND_YM,
                  PPTRM,
                  ROUND (ACQ_AMT / v_OrdQtyNow * v_Kwmeng) as ACQ_AMT,
                  ROUND (RES_AMT / v_OrdQtyNow * v_Kwmeng) as RES_AMT,
                  ROUND (MPP_AMT / v_OrdQtyNow * v_Kwmeng) AS MPP_AMT,                  
                  ROUND (LPP_AMT / v_OrdQtyNow * v_Kwmeng) as LPP_AMT,
                  PROST_TP,
                  CHAN_CD,
                  AGENCY_CD,
                  CUST_TP,
                  MAT_CD,
                  ROUND (ORD_QTY / v_OrdQtyNow * v_Kwmeng) AS ORD_QTY,          --변경할것
                  'S',
                  PPCH_YM,
                  REG_ID,
                  REG_DT,
                  CHG_ID,
                  CHG_DT,
                  Ord_Qty_Now
             FROM RTRE0120
            WHERE ORD_NO = v_Ord_No AND POSTP_TP = v_Postp_Tp AND PP_STAT = 'T';
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '변경년월('||v_Postp_Ym||') : 의 이연 월별정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;
    
    BEGIN
        UPDATE RTRE0120 
        SET PP_STAT = 'Z'    
        WHERE ORD_NO = v_Ord_No
        AND POSTP_TP = v_Postp_Tp
        AND PP_STAT = 'T';
        EXCEPTION
    WHEN OTHERS THEN
      --  ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '변경년월('||v_Ppch_Ym||') : 의 이연 월별정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;
     
    
    --이연회차 충당금처리 
    v_Postp_Seq := Pkg_Rtre0125.f_sRtre0125MaxSeq(v_Ord_No, v_Postp_Tp) + 1;
        
    IF 0 != Pkg_Rtre0125.f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, 'S',
                              v_Ppch_Ym,  v_Ly_Tpp_Amt1, v_Cy_Pp_Amt1, v_Cy_Tpp_Amt1,
                              v_Cm_Pp_Amt1, v_Cm_R_Amt1,   v_Reg_Id,    v_ErrorText 
                            ) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') 순번('||v_Postp_Seq||')[RE] 이연처리 월별내역 등록 실패[S]!!!'||
        '-'||v_Errortext||'v_Ly_Tpp_Amt1-'||v_Ly_Tpp_Amt1||'v_Cy_Pp_Amt1-'||v_Cy_Pp_Amt1||'v_Cy_Tpp_Amt1-'||v_Cy_Tpp_Amt1||'v_Cm_Pp_Amt1-'||v_Cm_Pp_Amt1||'v_Cm_R_Amt1-'||v_Cm_R_Amt1||'v_Ord_No'||v_Ord_No||'-'||v_Postp_Tp||'-'||v_Ppch_Ym||'-'|| v_OrdQtyNow ||'-'||v_OrdQtyNow||'-'||v_Kwmeng;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
    
        
    -- 이연처리 월별내역 UPDATE
    FOR CUR_0125 IN Cur_Rtre0125 LOOP
        EXIT WHEN Cur_Rtre0125%NOTFOUND;  
        
        v_Postp_Stat := 'T';
        IF 0 <> Pkg_Rtre0125.f_UpdateRtre0125Postpone(v_Ord_No, v_Postp_Tp, CUR_0125.POSTP_SEQ, 
                                                      v_Postp_Stat, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보 월별내역 중도변경 오류입니다!';
            RAISE e_Error;
        END IF;    
        
        IF CUR_0125.Postp_Stat <> 'S' THEN --충당금 이외만 다시,, 기존감가상각만 돌린다 계산해서           
            BEGIN 
                SELECT  TRUNC(B.LY_TPP_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng)),  TRUNC(B.CY_PP_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng)) , TRUNC(B.CY_TPP_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng)),  TRUNC(B.CM_PP_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng)),TRUNC(B.CM_R_AMT/ v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng))              
                INTO    v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt, v_Cm_Pp_AMT, v_Cm_R_Amt
                FROM    RTRE0125 B
                WHERE   B.ORD_NO    = v_Ord_No
                AND     B.POSTP_TP  = v_Postp_Tp
                AND     B.POSTP_YM  = CUR_0125.POSTP_YM
                AND     B.Postp_Stat = 'T';
            
            EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                v_Success_code := -1;
                v_Return_Message := '변경년월('||CUR_0125.POSTP_YM||') : 의 이연 월별정보가 존재하지 않아 처리가 불가 합니다!';
                v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText)||'TT';
                Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
            END;
            
            -- 이연회차
            v_Postp_Seq := Pkg_Rtre0125.f_sRtre0125MaxSeq(v_Ord_No, v_Postp_Tp) + 1;
            
            IF 0 != Pkg_Rtre0125.f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, CUR_0125.Postp_Stat,
                                      CUR_0125.POSTP_YM,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
                                      v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText 
                                    ) THEN
                v_Return_Message := '계약번호('||v_Ord_No||') 순번('||v_Postp_Seq||')[RE] 이연처리 월별내역 등록 실패[A]!!!'||'-'||v_Errortext;
                v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText)||'ERROR';
                RAISE e_Error;
            END IF;
        END IF;
        
    END LOOP;    
/*
    SELECT  sum(B.LY_TPP_AMT),  sum(B.CY_PP_AMT) , sum(B.CY_TPP_AMT) , sum(B.CM_PP_AMT), sum(B.CM_R_AMT)            
    INTO    v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt, v_Cm_Pp_AMT, v_Cm_R_Amt
    FROM    RTRE0125 B
   WHERE   B.ORD_NO    = v_Ord_No
    AND     B.POSTP_TP  = v_Postp_Tp
    AND     B.Postp_Stat = 'T';    
    
    SELECT  sum(B.LY_TPP_AMT),  sum(B.CY_PP_AMT) , sum(B.CY_TPP_AMT) , sum(B.CM_PP_AMT), sum(B.CM_R_AMT)            
    INTO    v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt, v_Cm_Pp_AMT, v_Cm_R_Amt
    FROM    RTRE0125 B
   WHERE   B.ORD_NO    = v_Ord_No
    AND     B.POSTP_TP  = v_Postp_Tp
    AND     B.Postp_Stat = 'T';    */
    
    
    IF Cur_Rtre0125%ISOPEN THEN
        CLOSE Cur_Rtre0125;
    END IF;        

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;
    V_RETURN_MESSAGE := '01'||v_Success_code;
    EXCEPTION
      WHEN e_Error THEN
     --   ROLLBACK;
        IF Cur_Rtre0125%ISOPEN THEN
            CLOSE Cur_Rtre0125;
        END IF;    
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre0125%ISOPEN THEN
            CLOSE Cur_Rtre0125;
        END IF;    
   --     ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(2)', v_ErrorText, v_Return_Message);

  END p_Rtre0120ChangePostponeSer;

 /*****************************************************************************
  -- 참고 [RE] 걱정제로 이연 02,03 감가상각 변경 처리
  *****************************************************************************/
  PROCEDURE p_Rtre0120ChangeSerPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre0125 IS
    SELECT  ORD_NO, POSTP_TP, POSTP_SEQ, POSTP_STAT, POSTP_YM
    FROM    RTRE0125
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = v_Postp_Tp
    AND     POSTP_YM >= v_Ppch_Ym;
                            
    e_Error EXCEPTION;
    
    v_Prost_Tp   RTRE0120.PROST_TP%TYPE DEFAULT NULL;
    
    v_Postp_Seq  RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
    v_Postp_Stat RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_Postp_Ym   RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Ly_Tpp_Amt RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;
    v_Ord_Qty    RTRE0120.ORD_QTY%TYPE DEFAULT NULL;
    
    v_Before_Ymd      RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Postp_Stat_Chk  RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_F_Cm_Pp_Amt     RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_L_Cm_Pp_Amt     RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Max_Postp_Seq   RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
    v_Acq_Amt         RTRE0120.ACQ_AMT%TYPE;
    v_Kwmeng          NUMBER; --RTCS0010.KWMENG%TYPE;
    v_OrdQtyNow       NUMBER;
    
    v_curr_cunt  NUMBER;
    
    
  BEGIN

    -- 필수값: 계약번호, 이연항목, 이연대상상태, 이연대상상태변경년월, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) = 0 THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Postp_Tp) IS NULL) OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R037', v_Postp_Tp) THEN
        v_Return_Message := '이연항목('||v_Postp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pp_Stat) IS NULL) OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count('R038', v_Pp_Stat) THEN
        v_Return_Message := '이연대상상태('||v_Pp_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ppch_Ym) IS NULL) THEN
        v_Return_Message := '이연대상상태변경년월('||v_Ppch_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
  

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  
    


--  DBMS_OUTPUT.Put_Line('SELECT  이전 ' || v_Postp_Tp);

    v_Ly_Tpp_Amt  := 0;
    v_Cy_Pp_Amt   := 0;
    v_Cy_Tpp_Amt  := 0;
    v_Cm_Pp_Amt   := 0;
    v_Cm_R_Amt    := 0;
    v_Ord_Qty     := 0;
    v_F_Cm_Pp_Amt := 0;
    v_L_Cm_Pp_Amt := 0;

    BEGIN
    -- 이연처리 처리구분 발췌
    SELECT  PROST_TP, DECODE(ORD_QTY_NOW,'',ORD_QTY,ORD_QTY_NOW)
    INTO    v_Prost_Tp, v_OrdQtyNow
    FROM    RTRE0120
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = v_Postp_Tp;
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;      
    
    BEGIN
    -- 이연처리 처리구분 발췌
    SELECT to_number(sum(B.KWMENG)) 
    INTO v_Kwmeng 
    FROM RTCS0010 B 
    WHERE ORD_NO =  v_Ord_No
    AND PROC_DAY BETWEEN v_Postp_Ym||'01' AND v_Postp_Ym||'31'
    AND DLV_STAT IN ('07','04');   
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 서비스 처리 정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;      
           
    -- 이연정보 중도변경으로 UPDATE
    IF 0 <> f_UpdateRtre0120SvrPostpone(v_Ord_No, v_Postp_Tp, v_Pp_Stat, v_Ppch_Ym, v_OrdQtyNow - v_Kwmeng , v_Reg_Id,  v_ErrorText) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보 UPDATE 오류입니다!';
        RAISE e_Error;
    END IF;  

    
    /*김한나 추가== 1) 변경 전달 찾는거임2)v_Postp_Stat_Chk = 'N' 인경우는 첫달이므로 변경전달로 계산식 필요 없음  */   
    
    BEGIN
    
    SELECT to_char(add_months(to_date(POSTP_YM||'01','YYYYMMDD'),-1),'YYYYMM') AS POSTP_YM , POSTP_STAT
    INTO v_Before_Ymd, v_Postp_Stat_Chk
    FROM RTRE0125 
    WHERE ORD_NO = v_Ord_No and POSTP_TP = v_Postp_Tp and POSTP_YM = v_Ppch_Ym;
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '변경년월('||v_Postp_Ym||') : 의 이연 월별정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;     
    
    
    
    
    IF v_Postp_Stat_Chk <> 'N' THEN     --첫달이 아닌경우      
        -- 이연처리  월별에서 금액자료발췌-- 시작 처음 값만 (START)  
      BEGIN 
      SELECT  B.LY_TPP_AMT,   B.CY_PP_AMT,   B.CY_TPP_AMT,  B.CM_PP_AMT, B.CM_R_AMT , A.ORD_QTY      
      INTO    v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt, v_Cm_Pp_AMT, v_Cm_R_Amt, v_Ord_Qty
      FROM    RTRE0120 A, RTRE0125 B
      WHERE   B.ORD_NO    = v_Ord_No
      AND     B.POSTP_TP  = v_Postp_Tp
      AND     B.POSTP_YM  = v_Before_Ymd
      AND     A.ord_no    = B.ord_no
      AND     A.POSTP_TP  = B.POSTP_TP;
      -- 전기말 누적액 v_Ly_Tpp_Amt 당기 처리액 v_Cy_Pp_Amt 당기 총 누적액 v_Cy_Tpp_Amt 당월 잔존가액 v_Cm_R_Amt 당월처리금액 v_Cm_Pp_Amt
      EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '변경년월('||v_Postp_Ym||') : 의 이연 월별정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
      END;  
     
    ELSE 
        --첫달? 고민해봐야 한다 첫달시스템은 
      v_Ly_Tpp_Amt :=0;
      v_Cy_Pp_Amt  :=0;
      v_Cy_Tpp_Amt :=0; 
      v_Cm_R_Amt   :=0;
      v_Ord_Qty    :=0;  
  
    END IF;
    
    v_Max_Postp_Seq := 0;
   
    BEGIN 
      SELECT  Pkg_Rtre0125.f_sRtre0125MaxSeq(v_Ord_No, v_Postp_Tp) + COUNT(*) AS Max_Postp_Seq
              --TRUNC((SUM(CM_PP_AMT)/v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng) ) /COUNT(*)) AS NEW_FzST_CM_PP_AMT , 
              --(SUM(CM_PP_AMT)/v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng) )  - (TRUNC((SUM(CM_PP_AMT)/v_OrdQtyNow * (v_OrdQtyNow-v_Kwmeng) ) /COUNT(*))* (COUNT(*)-1)) AS NEW_LAST_CM_PP_AMT,
      INTO    v_Max_Postp_Seq --v_F_Cm_Pp_AMT , v_L_Cm_Pp_AMT,
      FROM    RTRE0125
      WHERE   ORD_NO    = v_Ord_No
      AND     POSTP_TP  = v_Postp_Tp
      AND     POSTP_YM >= v_Ppch_Ym; 
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := '변경년월('||v_Postp_Ym||') : 의 이연 월별정보가 존재하지 않아 처리가 불가 합니다!';
      v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
      Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
    END;  
    
    
    -- 전기말 누적액
    -- 전달 :  v_Ly_Tpp_Amt 당기 처리액 v_Cy_Pp_Amt 당기 총 누적액 v_Cy_Tpp_Amt 당월 잔존가액 v_Cm_R_Amt 당월처리금액 v_Cm_Pp_Amt
    
    
    -- 이연처리 월별내역 UPDATE
    FOR CUR_0125 IN Cur_Rtre0125 LOOP
        EXIT WHEN Cur_Rtre0125%NOTFOUND;  

        v_Postp_Stat := 'Z';
        IF 0 <> Pkg_Rtre0125.f_UpdateRtre0125Postpone(v_Ord_No, v_Postp_Tp, CUR_0125.POSTP_SEQ, 
                                                      v_Postp_Stat, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보 월별내역 조정 변경 오류입니다!';
            RAISE e_Error;
        END IF;  
       
    /*계산*/      
        -- 이연회차
        v_Postp_Seq := Pkg_Rtre0125.f_sRtre0125MaxSeq(v_Ord_No, v_Postp_Tp) + 1;
        -- 이연상태
        v_Postp_Stat := CUR_0125.POSTP_STAT;
        -- 대상년월
        v_Postp_Ym   := CUR_0125.POSTP_YM;
        
   -- 전기말 누적액
        IF SUBSTR(v_Postp_Ym,1,4) <> TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), -1), 'YYYY') THEN
            v_Ly_Tpp_Amt := v_Cy_Tpp_Amt;   -- 다른 년도면 전년까지 누적분 
        ELSE
            v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;   -- 같은 년도는 동일
        END IF;

        -- 당월 처리금액
        IF v_Postp_Seq <> v_Max_Postp_Seq THEN     
            v_Cm_Pp_Amt := v_F_Cm_Pp_AMT;
        ELSE                                -- 최종분
            v_Cm_Pp_Amt := v_L_Cm_Pp_AMT;
        END IF;

        -- 당기 처리액
        IF SUBSTR(v_Postp_Ym,1,4) <> TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), -1), 'YYYY') THEN
            v_Cy_Pp_Amt  := v_Cm_Pp_Amt;    -- 첫달은 당월분
        ELSE
            v_Cy_Pp_Amt  := v_Cy_Pp_Amt + v_Cm_Pp_Amt; -- 같은 년도면 누적
        END IF;

        -- 당기 총 누적액
        v_Cy_Tpp_Amt  := v_Ly_Tpp_Amt + v_Cy_Pp_Amt;    -- 전기말 누적액 + 당기처리액
        
        -- 당월 잔존가액
        v_Cm_R_Amt  := v_Cm_R_Amt - v_Cm_Pp_Amt;        -- 전체금액 - 당기 총 누적액        
     
             
        IF 0 != Pkg_Rtre0125.f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText 
                                ) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') 순번('||v_Postp_Seq||')[RE] 이연처리 월별내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;        

    END LOOP;    
    
    IF Cur_Rtre0125%ISOPEN THEN
        CLOSE Cur_Rtre0125;
    END IF;    

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다         '||v_OrdQtyNow||'정상적으로 처리되었습니다         '|| v_Kwmeng ;
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        IF Cur_Rtre0125%ISOPEN THEN
            CLOSE Cur_Rtre0125;
        END IF;    
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre0125%ISOPEN THEN
            CLOSE Cur_Rtre0125;
        END IF;    
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangeSerPostpone(2)', v_ErrorText, v_Return_Message);

  END p_Rtre0120ChangeSerPostpone;    
END Pkg_Rtre0120_back;