CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5060 AS
/*******************************************************************************
   NAME      Pkg_Rtre5060
   PURPOSE   서비스수수료 기초 집계 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-24  choidh           1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가
   1.3        2016-10-29  임욱재           [20161029_01] 엔진오일 서비스수수료 지급기준 변경
   1.4        2017-05-30  wjim             [20170519_01] 방문점검수수료 신설
   1.5        2017-08-03  wjim             [20170713_01] 방문점검수수료 집계중복 보완
   1.6        2018-03-27  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가 및 서비스별 엔진오일 수수료 분리
   1.7		  2025-06-24  10244015		   [20250624_01] 프리미엄퍼플점 추가 위치교환수수료 부여    	
*******************************************************************************/

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Count
  *****************************************************************************/
  FUNCTION f_sRtre5060Count(
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,          /*마감년월            */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,          /*수수료항목          */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,           /*계약번호            */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE          /*수수료순번          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE5060
    WHERE   SLCM_YM        = v_Slcm_Ym
    AND     COMM_TP        = v_Comm_Tp
    AND     ORD_NO         = v_Ord_No
    AND     COMM_SEQ       = v_Comm_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre5060Count;

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5060 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Cust_No        IN RTRE5060.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5060.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5060.CHAN_CD%TYPE,        /*채널구분              */
    v_Mat_Cd         IN RTRE5060.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Class_Cd       IN RTRE5060.CLASS_CD%TYPE,       /*차량분류              */
    v_Svcc_Amt       IN RTRE5060.SVCC_AMT%TYPE,       /*서비스수수료          */
    v_Ppob_Yn        IN RTRE5060.PPOB_YN%TYPE,        /*이연대상              */
    v_Svcp_Day       IN RTRE5060.SVCP_DAY%TYPE,       /*서비스처리일자        */
    v_Equ_No         IN RTRE5060.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTRE5060.SERV_SEQ%TYPE,       /*서비스순번            */
    v_Serv_Iseq      IN RTRE5060.SERV_ISEQ%TYPE,      /*서비스항목순번        */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SLCM_YM,                   /*마감년월            */
            A.COMM_TP,                   /*수수료항목          */
            A.ORD_NO,                    /*계약번호            */
            A.COMM_SEQ,                  /*수수료순번          */
            A.CUST_NO,                   /*고객번호            */
            A.AGENCY_CD,                 /*렌탈전문점          */
            A.CHAN_CD,                   /*채널구분            */
            A.MAT_CD,                    /*상품코드            */
            A.CNT_CD,                    /*타이어본수          */
            A.CLASS_CD,                  /*차량분류            */
            A.SVCC_AMT,                  /*서비스수수료        */
            A.PPOB_YN,                   /*이연대상            */
            A.SVCP_DAY,                  /*서비스처리일자      */
            A.EQU_NO,                    /*설비번호            */
            A.SERV_SEQ,                  /*서비스순번          */
            A.SERV_ISEQ,                 /*서비스항목순번      */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE5060 A
    WHERE   A.SLCM_YM          = DECODE(v_Slcm_Ym        , NULL, A.SLCM_YM         , v_Slcm_Ym)
    AND     A.COMM_TP          = DECODE(v_Comm_Tp        , NULL, A.COMM_TP         , v_Comm_Tp)
    AND     A.ORD_NO           = DECODE(v_Ord_No         , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.COMM_SEQ         = DECODE(v_Comm_Seq       , NULL, A.COMM_SEQ        , v_Comm_Seq)
    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
    AND     A.AGENCY_CD        = DECODE(v_Agency_Cd      , NULL, A.AGENCY_CD       , v_Agency_Cd)
    AND     A.CHAN_CD          = DECODE(v_Chan_Cd        , NULL, A.CHAN_CD         , v_Chan_Cd)
    AND     A.MAT_CD           = DECODE(v_Mat_Cd         , NULL, A.MAT_CD          , v_Mat_Cd)
    AND     A.CNT_CD           = DECODE(v_Cnt_Cd         , NULL, A.CNT_CD          , v_Cnt_Cd)
    AND     A.CLASS_CD         = DECODE(v_Class_Cd       , NULL, A.CLASS_CD        , v_Class_Cd)
    AND     A.SVCC_AMT         = DECODE(v_Svcc_Amt       , NULL, A.SVCC_AMT        , v_Svcc_Amt)
    AND     A.PPOB_YN          = DECODE(v_Ppob_Yn        , NULL, A.PPOB_YN         , v_Ppob_Yn)
    AND     A.SVCP_DAY         = DECODE(v_Svcp_Day       , NULL, A.SVCP_DAY        , v_Svcp_Day)
    AND     A.EQU_NO           = DECODE(v_Equ_No         , NULL, A.EQU_NO          , v_Equ_No)
    AND     A.SERV_SEQ         = DECODE(v_Serv_Seq       , NULL, A.SERV_SEQ        , v_Serv_Seq)
    AND     A.SERV_ISEQ        = DECODE(v_Serv_Iseq      , NULL, A.SERV_ISEQ       , v_Serv_Iseq)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre5060;

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5060 (
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Cust_No        IN RTRE5060.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5060.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5060.CHAN_CD%TYPE,        /*채널구분              */
    v_Mat_Cd         IN RTRE5060.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Class_Cd       IN RTRE5060.CLASS_CD%TYPE,       /*차량분류              */
    v_Svcc_Amt       IN RTRE5060.SVCC_AMT%TYPE,       /*서비스수수료          */
    v_Ppob_Yn        IN RTRE5060.PPOB_YN%TYPE,        /*이연대상              */
    v_Svcp_Day       IN RTRE5060.SVCP_DAY%TYPE,       /*서비스처리일자        */
    v_Equ_No         IN RTRE5060.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTRE5060.SERV_SEQ%TYPE,       /*서비스순번            */
    v_Serv_Iseq      IN RTRE5060.SERV_ISEQ%TYPE,      /*서비스항목순번        */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE5060 (
            SLCM_YM,
            COMM_TP,
            ORD_NO,
            COMM_SEQ,
            CUST_NO,
            AGENCY_CD,
            CHAN_CD,
            MAT_CD,
            CNT_CD,
            CLASS_CD,
            SVCC_AMT,
            PPOB_YN,
            SVCP_DAY,
            EQU_NO,
            SERV_SEQ,
            SERV_ISEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Slcm_Ym,
            v_Comm_Tp,
            v_Ord_No,
            v_Comm_Seq,
            v_Cust_No,
            v_Agency_Cd,
            v_Chan_Cd,
            v_Mat_Cd,
            v_Cnt_Cd,
            v_Class_Cd,
            v_Svcc_Amt,
            v_Ppob_Yn,
            v_Svcp_Day,
            v_Equ_No,
            v_Serv_Seq,
            v_Serv_Iseq,
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

  END f_InsertRtre5060;

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5060 (
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Cust_No        IN RTRE5060.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5060.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5060.CHAN_CD%TYPE,        /*채널구분              */
    v_Mat_Cd         IN RTRE5060.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Class_Cd       IN RTRE5060.CLASS_CD%TYPE,       /*차량분류              */
    v_Svcc_Amt       IN RTRE5060.SVCC_AMT%TYPE,       /*서비스수수료          */
    v_Ppob_Yn        IN RTRE5060.PPOB_YN%TYPE,        /*이연대상              */
    v_Svcp_Day       IN RTRE5060.SVCP_DAY%TYPE,       /*서비스처리일자        */
    v_Equ_No         IN RTRE5060.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTRE5060.SERV_SEQ%TYPE,       /*서비스순번            */
    v_Serv_Iseq      IN RTRE5060.SERV_ISEQ%TYPE,      /*서비스항목순번        */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5060
    SET    CUST_NO          = v_Cust_No,
           AGENCY_CD        = v_Agency_Cd,
           CHAN_CD          = v_Chan_Cd,
           MAT_CD           = v_Mat_Cd,
           CNT_CD           = v_Cnt_Cd,
           CLASS_CD         = v_Class_Cd,
           SVCC_AMT         = v_Svcc_Amt,
           PPOB_YN          = v_Ppob_Yn,
           SVCP_DAY         = v_Svcp_Day,
           EQU_NO           = v_Equ_No,
           SERV_SEQ         = v_Serv_Seq,
           SERV_ISEQ        = v_Serv_Iseq,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  SLCM_YM          = v_Slcm_Ym
    AND    COMM_TP          = v_Comm_Tp
    AND    ORD_NO           = v_Ord_No
    AND    COMM_SEQ         = v_Comm_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5060;

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5060 (
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM    RTRE5060
    WHERE  SLCM_YM          = v_Slcm_Ym
    AND    COMM_TP          = v_Comm_Tp
    AND    ORD_NO           = v_Ord_No
    AND    COMM_SEQ         = v_Comm_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.f_DeleteRtre5060(2)', '마감년월', v_Slcm_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.f_DeleteRtre5060(2)', '수수료항목', v_Comm_Tp);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.f_DeleteRtre5060(2)', '계약번호', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.f_DeleteRtre5060(2)', '수수료순번', v_Comm_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.f_DeleteRtre5060(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre5060;

  /*****************************************************************************
  -- 서비스수수료 기초 집계 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5060 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Cust_No        IN RTRE5060.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5060.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5060.CHAN_CD%TYPE,        /*채널구분              */
    v_Mat_Cd         IN RTRE5060.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Class_Cd       IN RTRE5060.CLASS_CD%TYPE,       /*차량분류              */
    v_Svcc_Amt       IN RTRE5060.SVCC_AMT%TYPE,       /*서비스수수료          */
    v_Ppob_Yn        IN RTRE5060.PPOB_YN%TYPE,        /*이연대상              */
    v_Svcp_Day       IN RTRE5060.SVCP_DAY%TYPE,       /*서비스처리일자        */
    v_Equ_No         IN RTRE5060.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTRE5060.SERV_SEQ%TYPE,       /*서비스순번            */
    v_Serv_Iseq      IN RTRE5060.SERV_ISEQ%TYPE,      /*서비스항목순번        */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 마감년월, 수수료항목, 계약번호, 수수료순번, 등록자 ID
    IF (TRIM(v_Slcm_Ym) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Slcm_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Comm_Tp) IS NULL) THEN
        v_Return_Message := '수수료항목('||v_Comm_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_No) IS NULL) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Comm_Seq) IS NULL) THEN
        v_Return_Message := '수수료순번('||v_Comm_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;



    IF v_Comm_Dvsn IN ('I','U') THEN

        IF (TRIM(v_Cust_No) IS NULL) THEN
            v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Agency_Cd) IS NULL) THEN
            v_Return_Message := '렌탈전문점('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Chan_Cd) IS NULL) THEN
            v_Return_Message := '채널구분('||v_Chan_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Mat_Cd) IS NULL) THEN
            v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Cnt_Cd) IS NULL) THEN
            v_Return_Message := '타이어개수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Class_Cd) IS NULL) THEN
            v_Return_Message := '차량분류('||v_Class_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Svcc_Amt) IS NULL) THEN
            v_Return_Message := '서비스수수료('||v_Svcc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Ppob_Yn) IS NULL) THEN
            v_Return_Message := '이연대상('||v_Ppob_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Svcp_Day) IS NULL) THEN
            v_Return_Message := '서비스처리일자('||v_Svcp_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Equ_No) IS NULL) THEN
            v_Return_Message := '설비번호('||v_Equ_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Serv_Seq) IS NULL) THEN
            v_Return_Message := '서비스순번('||v_Serv_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Serv_Iseq) IS NULL) THEN
            v_Return_Message := '서비스항목순번('||v_Serv_Iseq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'I' THEN
            IF 0 != f_InsertRtre5060( v_Slcm_Ym,  v_Comm_Tp,   v_Ord_No,    v_Comm_Seq,
                                      v_Cust_No,  v_Agency_Cd, v_Chan_Cd,   v_Mat_Cd,
                                      v_Cnt_Cd,   v_Class_Cd,  v_Svcc_Amt,  v_Ppob_Yn,
                                      v_Svcp_Day, v_Equ_No,    v_Serv_Seq,  v_Serv_Iseq,
                                      v_Reg_Id,   v_ErrorText
                                    ) THEN
                v_Return_Message := '서비스수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        ELSE
            IF 0 != f_UpdateRtre5060( v_Slcm_Ym,  v_Comm_Tp,   v_Ord_No,    v_Comm_Seq,
                                      v_Cust_No,  v_Agency_Cd, v_Chan_Cd,   v_Mat_Cd,
                                      v_Cnt_Cd,   v_Class_Cd,  v_Svcc_Amt,  v_Ppob_Yn,
                                      v_Svcp_Day, v_Equ_No,    v_Serv_Seq,  v_Serv_Iseq,
                                      v_Reg_Id,   v_ErrorText
                                    ) THEN
                v_Return_Message := '서비스수수료 기초 집계 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtre5060( v_Slcm_Ym,  v_Comm_Tp,   v_Ord_No,   v_Comm_Seq,
                                  v_Reg_Id,   v_ErrorText
                                ) THEN
            v_Return_Message := '서비스수수료 기초 집계 삭제 실패!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.p_IUDRtre5060(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.p_IUDRtre5060(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5060;


  /*****************************************************************************
  -- 서비스수수료 기초 집계 처리
  
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2016-04-01  이영근           SERVICE_CD 조건 추가
   1.2        2016-04-25  이영근           채널 대/중분류별 집계 처리 
   1.3        2016-10-29  wjim             [20161029_01] 엔진오일 서비스수수료 지급기준 변경
                                           - 기존 : 엔진오일 배송지점 > 변경 : 서비스처리점 
   1.4        2017-05-30  wjim             [20170519_01] 방문점검수수료 신설
   1.5        2017-08-03  wjim             [20170713_01] 방문점검수수료 집계중복 보완
   1.6        2018-03-27  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가 및 서비스별 엔진오일 수수료 분리
   1.7		  2025-06-24  10244015		   [20250624_01] 프리미엄퍼플점 추가 위치교환수수료 부여
  *****************************************************************************/
--  PROCEDURE p_CreateRtre5060ServiceComm (
--    v_Period         IN CHAR,                           /*마감월              */
--    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,           /*등록자 ID           */
--    v_Success_Code   OUT NUMBER,
--    v_Return_Message OUT VARCHAR2,
--    v_ErrorText      OUT VARCHAR2
--    ) IS
--
--    /*
--     * 엔진오일, 위치교환, 윈터교체, 얼라인먼트, 걱정제로장착, 무상얼라인먼트 수수료 집계
--     */
--    CURSOR  Cur_Rtre5060 IS
--    SELECT  v_Period                        SLCM_YM,
--            B.SERVICE_CD,
--            A.ORD_NO,
--            C.CUST_NO,
--            --A.PROC_IN_CD                    AGENCY_CD,
--            G.AGENCY_CD,
--            C.CHAN_CD,
--            D.MAT_CD,
--            C.CNT_CD,
--            E.CLASS_CD,
--            'N'                             PPOB_YN,
--            A.PROC_DAY                      PROC_DAY,
--            A.PROC_DAY                      SVCP_DAY,
--            A.EQU_NO,
--            A.SERV_SEQ,
--            B.SEQ                           SERV_ISEQ,
--            G.CHAN_LCLS_CD,
--            G.CHAN_MCLS_CD,
--            C.PS_CD,                                                            -- [20170713_01] 프리미엄서비스별로 엔진오일 수수료 차등적용하기 위해 추가
--            DECODE(B.SERVICE_CD,'B00007',NVL(H.KWMENG, 0),0) KWMENG,             -- [20170713_01] 걱정제로 장착수수료 계산을 위한 본수
--            SUBSTR(C.MAKER_CD, 0, 1) AS CAR_TYPE                                          --[20200810_01] 무상얼라이먼트 수수료 계산을 위한 국산차/수입차 구분
--    FROM    RTCS0007 A,
--            RTCS0008 B,
--            RTSD0108 C,
--            RTCS0001 D,
--            RTSD0004 E,
--            RTSD0005 F,
--            RTSD0007 G,
--            RTCS0010 H
--    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
--    AND     A.ORD_NO    = B.ORD_NO
--    AND     A.EQU_NO    = B.EQU_NO
--    AND     A.SERV_SEQ  = B.SERV_SEQ
--    AND     B.DLVC_YN   = 'Y'
--    AND     A.ORD_NO    = C.ORD_NO
--    AND     A.ORD_NO    = D.ORD_NO
--    AND     C.MODEL_CD  = E.MODEL_CD
--    AND     C.CONTENTS_CD = E.CONTENTS_CD
--    AND     C.FR_CD     = E.FR_CD
--    AND     D.MAT_CD    = F.MAT_CD
--    AND     E.SECTION_WIDTH = F.SECTION_WIDTH
--    AND     E.ASPECT_RATIO  = F.ASPECT_RATIO
--    AND     E.WHEEL_INCHES  = F.WHEEL_INCHES
--    AND     E.PLY_RATING    = F.PLY_RATING
--    AND     A.PROC_IN_CD    = G.AGENCY_CD                                       -- [20161029_01] 주석을 복구 
----    AND     DECODE(B.SERVICE_CD,'B00001',(SELECT I.AGENCY_CD FROM RTCS0009 I WHERE I.ORD_NO = A.ORD_NO AND A.SERV_SEQ = I.SERV_SEQ),A.PROC_IN_CD) = G.AGENCY_CD /* [20161029_01]  주석처리 */
--    AND     B.SERVICE_CD IN ('B00001','B00002','B00006','B00007','B00008', 'B00009')      -- 2016-04-01 이영근 ADD, [20170713_01] 걱정제로, 얼라인먼트 추가
--    AND     B.DLVR_DAY = H.DLVR_DAY(+)
--    AND     B.DLVR_SEQ = H.DLVR_SEQ(+)
--    ;
--    
--    /*
--     * [20170519_01] 방문점검 수수료 집계
--     * - [20170713_01] 방문점검수수료 집계중복 보완 
--     */
--    CURSOR  Cur_Rtre5060_02 IS
--    SELECT  A1.ORD_NO
--         ,  A1.EQU_NO         
--         ,  A1.SERV_SEQ
--         ,  A1.PROC_DAY
--         ,  A1.SERV_DSEQ
--         ,  A1.AMT_COMM
--         ,  B1.CUST_NO
--         ,  B1.CHAN_CD
--         ,  B1.CNT_CD
--         ,  C1.MAT_CD
--         ,  D1.CLASS_CD
--         ,  E1.ORD_AGENT
--      FROM  RTRE5090 A1
--         ,  RTSD0108 B1
--         ,  RTCS0001 C1
--         ,  RTSD0005 F1 
--         ,  RTSD0004 D1              
--         ,  RTCS0002 E1
--     WHERE  1=1
--       AND  A1.SLCM_YM       = v_Period
--       AND  A1.ORD_NO        = B1.ORD_NO
--       AND  A1.EQU_NO        = C1.EQU_NO
--       AND  C1.MAT_CD        = F1.MAT_CD
--       AND  B1.MODEL_CD      = D1.MODEL_CD
--       AND  B1.CONTENTS_CD   = D1.CONTENTS_CD
--       AND  B1.FR_CD         = D1.FR_CD   
--       AND  D1.SECTION_WIDTH = F1.SECTION_WIDTH
--       AND  D1.ASPECT_RATIO  = F1.ASPECT_RATIO
--       AND  D1.WHEEL_INCHES  = F1.WHEEL_INCHES
--       AND  D1.PLY_RATING    = F1.PLY_RATING
--       AND  A1.R_MRCD        = E1.CARMASTER_NU(+)
--    ;
--
--    
--    /*
--     * [20200506_01] PickUp And Delivery 수수료 집계
--     */
--    CURSOR  Cur_Rtre5060_03 IS
--    SELECT  A.ORD_NO,                                   /*계약번호            */
--            A.CUST_NO,                                  /*고객번호            */ 
--            A.AGENCY_CD,                                /*판매원번호          */
--            A.CHAN_CD,                                  /*채널구분            */ 
--            B.MAT_CD,                                   /*상품코드            */ 
--            A.CNT_CD,                                   /*타이어본수          */ 
--            A.PROC_DAY,                                 /*장착일자            */
--            A.MFP_YN,                                   /*종료여부            */ 
--            A.END_TP,                                   /*중도해지            */  
--            A.CANC_DAY,                                 /*해지일자            */ 
--            A.ORD_DAY,                                  /*접수일자            */
--            C.CHAN_LCLS_CD,
--            C.CHAN_MCLS_CD,
--            A.ORD_AGENT,
--            B.EQU_NO,
--            30000  AS AMT_COMM,
--            D.CLASS_CD
--    FROM    RTSD0108 A, RTCS0001 B, RTSD0007 C, RTSD0004 D, RTSD0005 E
--    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
--    AND     A.ORD_NO       = B.ORD_NO
--    AND     A.AGENCY_CD    = C.AGENCY_CD
--    AND     A.CHAN_CD NOT IN ( '01', '05' )
--    AND     A.MODEL_CD = D.MODEL_CD
--    AND     A.CONTENTS_CD = D.CONTENTS_CD
--    AND     A.FR_CD = D.FR_CD   
--    AND     B.MAT_CD = E.MAT_CD
--    AND     D.SECTION_WIDTH = E.SECTION_WIDTH
--    AND     D.ASPECT_RATIO = E.ASPECT_RATIO
--    AND     D.WHEEL_INCHES = E.WHEEL_INCHES
--    AND     D.PLY_RATING = E.PLY_RATING
--    AND    NVL(A.INST_CD, '1000') IN ('1020');
--    
--    
--    e_Error         EXCEPTION;
--    v_curr_cunt     NUMBER DEFAULT 0;
--
--    v_Svcm_Amt      RTRE5030.SVCM_AMT%TYPE;
--    v_Svcc_Amt      RTRE5060.SVCC_AMT%TYPE;
--    v_Comm_Tp       RTRE5060.COMM_TP%TYPE;
--    v_Comm_Seq      RTRE5060.COMM_SEQ%TYPE;
--
--  BEGIN
--
--
--    -- 필수값: 마감년월, 등록자 ID
--    IF (TRIM(v_Period) IS NULL) OR (0 <> ISDATE(v_Period)) OR (6 <> LENGTH(TRIM(v_Period))) THEN
--        v_Return_Message := '마감월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
--
--    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
--        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
--
--
--    -- 이미처리되었는지 확인
--    v_curr_cunt := 0;
--    BEGIN
--
--        SELECT  COUNT(*)
--        INTO    v_curr_cunt
--        FROM    RTRE5070
--        WHERE   SLCM_YM = v_Period
--        AND     ROWNUM =  1;
--
--        EXCEPTION
--        WHEN OTHERS THEN
--            v_curr_cunt := 0;
--    END;
--
--    IF v_curr_cunt > 0 THEN
--        v_Return_Message := '마감월('||v_Period||') : 이미 처리되어 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
--
--
--    -- 기존자료 삭제
--    BEGIN
--
--        SELECT  COUNT(*)
--        INTO    v_curr_cunt
--        FROM    RTRE5060
--        WHERE   SLCM_YM = v_Period
--        AND     ROWNUM =  1;
--
--        EXCEPTION
--        WHEN OTHERS THEN
--            v_curr_cunt := 0;
--    END;
--
--    IF  v_curr_cunt > 0 THEN
--
--        BEGIN
--
--            DELETE
--            FROM    RTRE5060
--            WHERE   SLCM_YM = v_Period;
--
--            EXCEPTION
--            WHEN OTHERS THEN
--                v_curr_cunt := 0;
--        END;
--
--    END IF;
--
--    -- 서비스수수료 기초 집계 생성
--    v_curr_cunt := 0;
--
--    FOR CUR_5060 IN Cur_Rtre5060 LOOP
--        EXIT WHEN Cur_Rtre5060%NOTFOUND;
--
--        -- 엔진오일
--        IF  CUR_5060.SERVICE_CD = 'B00001' THEN
--
--            v_Comm_Tp   := 'C1';
--
--            BEGIN
--
--                SELECT  SVCM_AMT
--                INTO    v_Svcm_Amt
--                FROM    RTRE5030
--                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
--                AND     STR_DAY     <= CUR_5060.PROC_DAY
--                AND     END_DAY     >= CUR_5060.PROC_DAY
--                AND     CLASS_CD     = CUR_5060.CLASS_CD
--                AND     CHAN_LCLS_CD = CUR_5060.CHAN_LCLS_CD
--                AND     CHAN_MCLS_CD = CUR_5060.CHAN_MCLS_CD
--                AND     PS_CD        = CUR_5060.PS_CD                           --[20180326_01] 프리미엄서비스별 수수료 차등 적용            
--                AND     USE_YN       = 'Y';
--
--                EXCEPTION
--                WHEN OTHERS THEN
--                    v_Return_Message := '서비스수수료 조견표(서비스코드1-'||CUR_5060.SERVICE_CD||',주문번호-'||CUR_5060.ORD_NO||',장착일자-'||CUR_5060.PROC_DAY||',상품코드-'||CUR_5060.MAT_CD||',대분류-'||CUR_5060.CHAN_LCLS_CD||',중분류-'||CUR_5060.CHAN_MCLS_CD||',프리미엄서비스-'||CUR_5060.PS_CD||') : 자료가 존재하지 않습니다!';
--                    RAISE e_Error;
--            END;
--
--        -- 위치교환
--        ELSIF  CUR_5060.SERVICE_CD = 'B00002' THEN
--
--            v_Comm_Tp   := 'C2';
--
--            BEGIN
--
--                SELECT  SVCM_AMT
--                INTO    v_Svcm_Amt
--                FROM    RTRE5030
--                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
--                AND     STR_DAY     <= CUR_5060.PROC_DAY
--                AND     END_DAY     >= CUR_5060.PROC_DAY
--                AND     USE_YN       = 'Y';
--
--                EXCEPTION
--                WHEN OTHERS THEN
--                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||') : 자료가 존재하지 않습니다!';
--                    RAISE e_Error;
--            END;
--
--        -- 윈터교체
--        ELSIF  CUR_5060.SERVICE_CD = 'B00006' THEN
--
--            v_Comm_Tp   := 'C6';
--
--            BEGIN
--
--                SELECT  SVCM_AMT * TO_NUMBER( CUR_5060.CNT_CD )
--                INTO    v_Svcm_Amt
--                FROM    RTRE5030
--                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
--                AND     STR_DAY     <= CUR_5060.PROC_DAY
--                AND     END_DAY     >= CUR_5060.PROC_DAY
--                AND     MAT_CD       = CUR_5060.MAT_CD
--                AND     USE_YN       = 'Y';
--
--                EXCEPTION
--                WHEN OTHERS THEN
--                    v_Return_Message := '서비스수수료 조견표(서비스코드4-'||CUR_5060.SERVICE_CD||') : 자료가 존재하지 않습니다!';
--                    RAISE e_Error;
--            END;
--            
--        -- 걱정제로 [20180326_01]    
--        ELSIF  CUR_5060.SERVICE_CD = 'B00007' THEN
--
--            v_Comm_Tp   := 'C5';
--
--            BEGIN
--
--                SELECT  SVCM_AMT * CUR_5060.KWMENG
--                INTO    v_Svcm_Amt
--                FROM    RTRE5030
--                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
--                AND     STR_DAY     <= CUR_5060.PROC_DAY
--                AND     END_DAY     >= CUR_5060.PROC_DAY
--                AND     USE_YN       = 'Y';
--
--                EXCEPTION
--                WHEN OTHERS THEN
--                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||') : 자료가 존재하지 않습니다!';
--                    RAISE e_Error;
--            END;
--
--        -- 얼라인먼트 [20180326_01]    
--        ELSIF  CUR_5060.SERVICE_CD = 'B00008' THEN
--
--            v_Comm_Tp   := 'C4';
--
--            BEGIN
--
--                SELECT  SVCM_AMT
--                INTO    v_Svcm_Amt
--                FROM    RTRE5030
--                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
--                AND     STR_DAY     <= CUR_5060.PROC_DAY
--                AND     END_DAY     >= CUR_5060.PROC_DAY
--                AND     USE_YN       = 'Y';
--
--                EXCEPTION
--                WHEN OTHERS THEN
--                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||') : 자료가 존재하지 않습니다!';
--                    RAISE e_Error;
--            END;
--        
--        -- 무상얼라인먼트 [20200810_01]    
--        ELSIF  CUR_5060.SERVICE_CD = 'B00009' THEN
--
--            v_Comm_Tp   := 'C8';
--
--            BEGIN
--
--                SELECT  SVCM_AMT
--                INTO    v_Svcm_Amt
--                FROM    RTRE5030
--                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
--                AND     STR_DAY     <= CUR_5060.PROC_DAY
--                AND     END_DAY     >= CUR_5060.PROC_DAY
--                AND     CAR_TYPE    = CUR_5060.CAR_TYPE             --[20200810_01] 무상얼라인먼트 서비스는 국산차/수입차에 따라 수수료 구분
--                AND     USE_YN       = 'Y';
--
--                EXCEPTION
--                WHEN OTHERS THEN
--                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||') : 자료가 존재하지 않습니다!';
--                    RAISE e_Error;
--            END;
--            
--        END IF;
--
--         v_curr_cunt  := v_curr_cunt + 1;
--         v_Svcc_Amt   := v_Svcm_Amt;
--         v_Comm_Seq   := v_curr_cunt;
--         v_Comm_Tp    := v_Comm_Tp;
--
----        IF 0 != f_InsertRtre5060( v_Slcm_Ym,  v_Comm_Tp,   v_Ord_No,   v_Comm_Seq,
----                                  v_Cust_No,  v_Agency_Cd, v_Chan_Cd,  v_Mat_Cd,
----                                  v_Class_Cd, v_Svcc_Amt,  v_Ppob_Yn,  v_Svcp_Day,
----                                  v_Equ_No,   v_Serv_Seq,  v_Serv_Iseq,
--        IF 0 != f_InsertRtre5060( v_Period,   v_Comm_Tp ,   CUR_5060.ORD_NO,   v_Comm_Seq,
--                                  CUR_5060.CUST_NO,  CUR_5060.AGENCY_CD, CUR_5060.CHAN_CD,  CUR_5060.MAT_CD,
--                                  CUR_5060.CNT_CD,   CUR_5060.CLASS_CD,  v_Svcc_Amt,  CUR_5060.PPOB_YN,
--                                  CUR_5060.SVCP_DAY, CUR_5060.EQU_NO,    CUR_5060.SERV_SEQ, CUR_5060.SERV_ISEQ,
--                                  v_Reg_Id,          v_ErrorText
--                                ) THEN
--            v_Return_Message := '서비스수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
--            v_Errortext := v_Errortext;
--            RAISE e_Error;
--        END IF;
--
--    END LOOP;
--
--    IF Cur_Rtre5060%ISOPEN THEN
--        CLOSE Cur_Rtre5060;
--    END IF;
--    dbms_output.put_line('11');
--    /*
--     * 방문점검수수료 집계 [20170519_01]
--     */
--    FOR CUR_5060_02 IN Cur_Rtre5060_02 LOOP
--        EXIT WHEN Cur_Rtre5060_02%NOTFOUND;
--        
--        v_curr_cunt := v_curr_cunt + 1;
--        v_Comm_Seq  := v_curr_cunt;
--        
--        IF 0 != f_InsertRtre5060( 
--              v_Period              , 'C3'                  , CUR_5060_02.ORD_NO    , v_Comm_Seq
--            , CUR_5060_02.CUST_NO   , CUR_5060_02.ORD_AGENT , CUR_5060_02.CHAN_CD   , CUR_5060_02.MAT_CD
--            , CUR_5060_02.CNT_CD    , CUR_5060_02.CLASS_CD  , CUR_5060_02.AMT_COMM  , 'N'
--            , CUR_5060_02.PROC_DAY  , CUR_5060_02.EQU_NO    , CUR_5060_02.SERV_SEQ  , CUR_5060_02.SERV_DSEQ
--            , v_Reg_Id              , v_ErrorText
--        ) THEN
--            v_Return_Message := '방문점검수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
--            v_Errortext := v_Errortext;
--            RAISE e_Error;
--        END IF;
--        
--    END LOOP;
--
--     IF Cur_Rtre5060_02%ISOPEN THEN
--        CLOSE Cur_Rtre5060_02;
--    END IF;
--
--    /*
--     * PickUp And Delviery수수료 집계 [20200506_01]
--     */
----    v_curr_cunt := 0;
--    FOR CUR_5060_03 IN Cur_Rtre5060_03 LOOP
--        EXIT WHEN Cur_Rtre5060_03%NOTFOUND;
--        
--        v_curr_cunt := v_curr_cunt + 1;
--        v_Comm_Seq  := v_curr_cunt;
--        
--        IF 0 != f_InsertRtre5060( v_Period,   'C7' ,   CUR_5060_03.ORD_NO,   v_Comm_Seq,
--                                  CUR_5060_03.CUST_NO,  CUR_5060_03.AGENCY_CD, CUR_5060_03.CHAN_CD,  CUR_5060_03.MAT_CD,
--                                  CUR_5060_03.CNT_CD,   CUR_5060_03.CLASS_CD,  CUR_5060_03.AMT_COMM,  'N',
--                                  CUR_5060_03.PROC_DAY, CUR_5060_03.EQU_NO,    0, 0,
--                                  v_Reg_Id,          v_ErrorText
--                                ) THEN
--            v_Return_Message := 'PickUp And Delivery서비스수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
--            v_Errortext := v_Errortext;
--            RAISE e_Error;
--        END IF;
--        
--    END LOOP;
--
--     IF Cur_Rtre5060_03%ISOPEN THEN
--        CLOSE Cur_Rtre5060_03;
--    END IF;
--    
--    IF v_curr_cunt > 0 THEN
--        v_Success_code := 0;
--        v_Return_Message := '정상적으로 처리되었습니다';
--        v_ErrorText := '';
--        --COMMIT;
--    ELSE
--        v_Return_Message := '마감월('||v_Period||') : 처리건이 존재하지 않습니다!';
--        RAISE e_Error;
--    END IF;
--
--
--    EXCEPTION
--      WHEN e_Error THEN
--        IF Cur_Rtre5060%ISOPEN THEN
--            CLOSE Cur_Rtre5060;
--        END IF;
--
--        ROLLBACK;
--        v_Success_code := -1;
--        v_Return_Message := v_Return_Message;
--        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.p_CreateRtre5060ServiceComm(1)', v_ErrorText, v_Return_Message);
--
--      WHEN OTHERS THEN
--        IF Cur_Rtre5060%ISOPEN THEN
--            CLOSE Cur_Rtre5060;
--        END IF;
--
--        ROLLBACK;
--        v_Success_code := -1;
--        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
--        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.p_CreateRtre5060ServiceComm(2)', v_ErrorText, v_Return_Message);
--
--  END p_CreateRtre5060ServiceComm;

PROCEDURE p_CreateRtre5060ServiceComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    /*
     * 엔진오일, 위치교환, 윈터교체, 얼라인먼트, 걱정제로장착, 무상얼라인먼트 수수료 집계
     */
    CURSOR  Cur_Rtre5060 IS
    SELECT  v_Period                        SLCM_YM,
            B.SERVICE_CD,
            A.ORD_NO,
            C.CUST_NO,
            --A.PROC_IN_CD                    AGENCY_CD,
            G.AGENCY_CD,
            C.CHAN_CD,
            D.MAT_CD,
            C.CNT_CD,
            NVL((SELECT CLASS_CD FROM RTSD0004 X 
                WHERE X.MODEL_CD = C.MODEL_CD 
                AND X.CONTENTS_CD = C.CONTENTS_CD 
                AND X.FR_CD = C.FR_CD
                AND X.SECTION_WIDTH = F.SECTION_WIDTH 
                AND X.ASPECT_RATIO = F.ASPECT_RATIO 
                AND X.WHEEL_INCHES = F.WHEEL_INCHES 
                AND X.PLY_RATING = F.PLY_RATING),
                (SELECT Y.CLASS_CD FROM RTSD0105 X, RTSD0004 Y 
                 WHERE X.ORD_NO = C.ORD_NO 
                        AND X.SEQ = 1
                        AND X.MODEL_CD = Y.MODEL_CD
                        AND X.CONTENTS_CD = Y.CONTENTS_CD
                        AND X.FR_CD = Y.FR_CD
                        AND Y.SECTION_WIDTH = F.SECTION_WIDTH 
                        AND Y.ASPECT_RATIO = F.ASPECT_RATIO 
                        AND Y.WHEEL_INCHES = F.WHEEL_INCHES 
                        AND Y.PLY_RATING = F.PLY_RATING))  AS CLASS_CD,
            'N'                             PPOB_YN,
            A.PROC_DAY                      PROC_DAY,
            A.PROC_DAY                      SVCP_DAY,
            A.EQU_NO,
            A.SERV_SEQ,
            B.SEQ                           SERV_ISEQ,
            G.CHAN_LCLS_CD,
            G.CHAN_MCLS_CD,
            C.PS_CD,                                                  -- [20170713_01] 프리미엄서비스별로 엔진오일 수수료 차등적용하기 위해 추가
--            DECODE(B.SERVICE_CD,'B00007',NVL(H.KWMENG, 0),0) KWMENG,             -- [20170713_01] 걱정제로 장착수수료 계산을 위한 본수
            CASE WHEN B.SERVICE_CD IN ('B00007') THEN NVL(H.KWMENG, 0) 
                 WHEN B.SERVICE_CD IN ('B00011', 'B00012') THEN NVL(I.KWMENG, 0) 
                 ELSE '0' END  AS KWMENG,
            CASE WHEN B.SERVICE_CD IN ('B00002') AND G.PREM_PRPL_YN = 'Y' THEN (SELECT DECODE(MAX(Z.CD_DESC), NULL, '0', MAX(Z.CD_DESC)) --[20250624_01] 프리미엄퍼플점 추가 위치교환수수료 부여
																		          FROM RTCM0051 Z
																		         WHERE Z.CD_GRP_CD = 'R085'
																		           AND J.TOT_EVAL_POINT >= Z.CD)
           		 ELSE '0' END  AS ADD_SVCM_AMT,     
            SUBSTR(C.MAKER_CD, 0, 1) AS CAR_TYPE                                          --[20200810_01] 무상얼라이먼트 수수료 계산을 위한 국산차/수입차 구분
    FROM    RTCS0007 A,
            RTCS0008 B,
            RTSD0108 C,
            RTCS0001 D,
--            RTSD0004 E,
            RTSD0005 F,
            RTSD0007 G,
            RTCS0010 H,
            RTCS0208 I,
            (SELECT AGENCY_CD
				  , ROUND(AVG(TOT_EVAL_POINT),1) AS TOT_EVAL_POINT
			   FROM RTCS0130										--[20250624_01]프리미엄퍼플점을 위한 만족도조사 평점
			  WHERE 1=1
				AND DP_YN = 'Y'
				AND TO_CHAR(SUBT_DAY,'YYYYMM') BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-3),'YYYYMM') AND TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM')
			  GROUP BY AGENCY_CD
			) J
    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
    AND     A.ORD_NO    = B.ORD_NO
    AND     A.EQU_NO    = B.EQU_NO
    AND     A.SERV_SEQ  = B.SERV_SEQ
    AND     B.DLVC_YN   = 'Y'
    AND     A.ORD_NO    = C.ORD_NO
    AND     A.ORD_NO    = D.ORD_NO
--    AND     C.MODEL_CD  = E.MODEL_CD
--    AND     C.CONTENTS_CD = E.CONTENTS_CD
--    AND     C.FR_CD     = E.FR_CD
    AND     D.MAT_CD    = F.MAT_CD
--    AND     E.SECTION_WIDTH = F.SECTION_WIDTH
--    AND     E.ASPECT_RATIO  = F.ASPECT_RATIO
--    AND     E.WHEEL_INCHES  = F.WHEEL_INCHES
--    AND     E.PLY_RATING    = F.PLY_RATING
    AND     A.PROC_IN_CD    = G.AGENCY_CD                                       -- [20161029_01] 주석을 복구 
--    AND     DECODE(B.SERVICE_CD,'B00001',(SELECT I.AGENCY_CD FROM RTCS0009 I WHERE I.ORD_NO = A.ORD_NO AND A.SERV_SEQ = I.SERV_SEQ),A.PROC_IN_CD) = G.AGENCY_CD /* [20161029_01]  주석처리 */
    AND     B.SERVICE_CD IN ('B00001','B00002','B00006','B00007','B00008', 'B00009', 'B00011', 'B00012')      -- 2016-04-01 이영근 ADD, [20170713_01] 걱정제로, 얼라인먼트 추가
    AND     B.DLVR_DAY = H.DLVR_DAY(+)
    AND     B.DLVR_SEQ = H.DLVR_SEQ(+)
    AND     B.DLVR_DAY = I.DLVR_DAY(+)
    AND     B.DLVR_SEQ = I.DLVR_SEQ(+)
    AND		G.AGENCY_CD = J.AGENCY_CD(+)
    ;
    
    /*
     * [20170519_01] 방문점검 수수료 집계
     * - [20170713_01] 방문점검수수료 집계중복 보완 
     */
    CURSOR  Cur_Rtre5060_02 IS
    SELECT  A1.ORD_NO
         ,  A1.EQU_NO         
         ,  A1.SERV_SEQ
         ,  A1.PROC_DAY
         ,  A1.SERV_DSEQ
         ,  A1.AMT_COMM
         ,  B1.CUST_NO
         ,  B1.CHAN_CD
         ,  B1.CNT_CD
         ,  C1.MAT_CD
         ,  NVL((SELECT CLASS_CD FROM RTSD0004 X 
                WHERE X.MODEL_CD = B1.MODEL_CD 
                AND X.CONTENTS_CD = B1.CONTENTS_CD 
                AND X.FR_CD = B1.FR_CD
                AND X.SECTION_WIDTH = F1.SECTION_WIDTH 
                AND X.ASPECT_RATIO = F1.ASPECT_RATIO 
                AND X.WHEEL_INCHES = F1.WHEEL_INCHES 
                AND X.PLY_RATING = F1.PLY_RATING),
                (SELECT Y.CLASS_CD FROM RTSD0105 X, RTSD0004 Y 
                 WHERE X.ORD_NO = B1.ORD_NO 
                        AND X.SEQ = 1
                        AND X.MODEL_CD = Y.MODEL_CD
                        AND X.CONTENTS_CD = Y.CONTENTS_CD
                        AND X.FR_CD = Y.FR_CD
                        AND Y.SECTION_WIDTH = F1.SECTION_WIDTH 
                        AND Y.ASPECT_RATIO = F1.ASPECT_RATIO 
                        AND Y.WHEEL_INCHES = F1.WHEEL_INCHES 
                        AND Y.PLY_RATING = F1.PLY_RATING)) AS CLASS_CD
         ,  E1.ORD_AGENT
      FROM  RTRE5090 A1
         ,  RTSD0108 B1
         ,  RTCS0001 C1
         ,  RTSD0005 F1 
--         ,  RTSD0004 D1              
         ,  RTCS0002 E1
     WHERE  1=1
       AND  A1.SLCM_YM       = v_Period
       AND  A1.ORD_NO        = B1.ORD_NO
       AND  A1.EQU_NO        = C1.EQU_NO
       AND  C1.MAT_CD        = F1.MAT_CD
--       AND  B1.MODEL_CD      = D1.MODEL_CD
--       AND  B1.CONTENTS_CD   = D1.CONTENTS_CD
--       AND  B1.FR_CD         = D1.FR_CD   
--       AND  D1.SECTION_WIDTH = F1.SECTION_WIDTH
--       AND  D1.ASPECT_RATIO  = F1.ASPECT_RATIO
--       AND  D1.WHEEL_INCHES  = F1.WHEEL_INCHES
--       AND  D1.PLY_RATING    = F1.PLY_RATING
       AND  A1.R_MRCD        = E1.CARMASTER_NU(+)
    ;

    
    /*
     * [20200506_01] PickUp And Delivery 수수료 집계
     */
    CURSOR  Cur_Rtre5060_03 IS
    SELECT  A.ORD_NO,                                   /*계약번호            */
            A.CUST_NO,                                  /*고객번호            */ 
            A.AGENCY_CD,                                /*판매원번호          */
            A.CHAN_CD,                                  /*채널구분            */ 
            B.MAT_CD,                                   /*상품코드            */ 
            A.CNT_CD,                                   /*타이어본수          */ 
            A.PROC_DAY,                                 /*장착일자            */
            A.MFP_YN,                                   /*종료여부            */ 
            A.END_TP,                                   /*중도해지            */  
            A.CANC_DAY,                                 /*해지일자            */ 
            A.ORD_DAY,                                  /*접수일자            */
            C.CHAN_LCLS_CD,
            C.CHAN_MCLS_CD,
            A.ORD_AGENT,
            B.EQU_NO,
            30000  AS AMT_COMM
--            ,D.CLASS_CD
           ,  NVL((SELECT CLASS_CD FROM RTSD0004 X 
                WHERE X.MODEL_CD = A.MODEL_CD 
                AND X.CONTENTS_CD = A.CONTENTS_CD 
                AND X.FR_CD = A.FR_CD
                AND X.SECTION_WIDTH = E.SECTION_WIDTH 
                AND X.ASPECT_RATIO = E.ASPECT_RATIO 
                AND X.WHEEL_INCHES = E.WHEEL_INCHES 
                AND X.PLY_RATING = E.PLY_RATING),
                (SELECT Y.CLASS_CD FROM RTSD0105 X, RTSD0004 Y 
                 WHERE X.ORD_NO = A.ORD_NO 
                        AND X.SEQ = 1
                        AND X.MODEL_CD = Y.MODEL_CD
                        AND X.CONTENTS_CD = Y.CONTENTS_CD
                        AND X.FR_CD = Y.FR_CD
                        AND Y.SECTION_WIDTH = E.SECTION_WIDTH 
                        AND Y.ASPECT_RATIO = E.ASPECT_RATIO 
                        AND Y.WHEEL_INCHES = E.WHEEL_INCHES 
                        AND Y.PLY_RATING = E.PLY_RATING)) AS CLASS_CD
    FROM    RTSD0108 A
          , RTCS0001 B
          , RTSD0007 C
--          , RTSD0004 D
          , RTSD0005 E
    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
    AND     A.ORD_NO       = B.ORD_NO
    AND     A.AGENCY_CD    = C.AGENCY_CD
    AND     A.CHAN_CD NOT IN ( '01', '05' )
--    AND     A.MODEL_CD = D.MODEL_CD
--    AND     A.CONTENTS_CD = D.CONTENTS_CD
--    AND     A.FR_CD = D.FR_CD   
    AND     B.MAT_CD = E.MAT_CD
--    AND     D.SECTION_WIDTH = E.SECTION_WIDTH
--    AND     D.ASPECT_RATIO = E.ASPECT_RATIO
--    AND     D.WHEEL_INCHES = E.WHEEL_INCHES
--    AND     D.PLY_RATING = E.PLY_RATING
    AND    NVL(A.INST_CD, '1000') IN ('1020');
    
    
    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;

    v_Svcm_Amt      RTRE5030.SVCM_AMT%TYPE;
    v_Svcc_Amt      RTRE5060.SVCC_AMT%TYPE;
    v_Comm_Tp       RTRE5060.COMM_TP%TYPE;
    v_Comm_Seq      RTRE5060.COMM_SEQ%TYPE;

  BEGIN


    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) OR (0 <> ISDATE(v_Period)) OR (6 <> LENGTH(TRIM(v_Period))) THEN
        v_Return_Message := '마감월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 이미처리되었는지 확인
    v_curr_cunt := 0;
    BEGIN

        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE5070
        WHERE   SLCM_YM = v_Period
        AND     ROWNUM =  1;

        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;

    IF v_curr_cunt > 0 THEN
        v_Return_Message := '마감월('||v_Period||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 기존자료 삭제
    BEGIN

        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE5060
        WHERE   SLCM_YM = v_Period
        AND     ROWNUM =  1;

        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;

    IF  v_curr_cunt > 0 THEN

        BEGIN

            DELETE
            FROM    RTRE5060
            WHERE   SLCM_YM = v_Period;

            EXCEPTION
            WHEN OTHERS THEN
                v_curr_cunt := 0;
        END;

    END IF;

    -- 서비스수수료 기초 집계 생성
    v_curr_cunt := 0;

    FOR CUR_5060 IN Cur_Rtre5060 LOOP
        EXIT WHEN Cur_Rtre5060%NOTFOUND;

        -- 엔진오일
        IF  CUR_5060.SERVICE_CD = 'B00001' THEN

            v_Comm_Tp   := 'C1';

            BEGIN

                SELECT  SVCM_AMT
                INTO    v_Svcm_Amt
                FROM    RTRE5030
                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
                AND     STR_DAY     <= CUR_5060.PROC_DAY
                AND     END_DAY     >= CUR_5060.PROC_DAY
                AND     CLASS_CD     = CUR_5060.CLASS_CD
                AND     CHAN_LCLS_CD = CUR_5060.CHAN_LCLS_CD
                AND     CHAN_MCLS_CD = CUR_5060.CHAN_MCLS_CD
                AND     PS_CD        = CUR_5060.PS_CD                           --[20180326_01] 프리미엄서비스별 수수료 차등 적용            
                AND     USE_YN       = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '서비스수수료 조견표(서비스코드1-'||CUR_5060.SERVICE_CD||',주문번호-'||CUR_5060.ORD_NO||',장착일자-'||CUR_5060.PROC_DAY||',상품코드-'||CUR_5060.MAT_CD||',대분류-'||CUR_5060.CHAN_LCLS_CD||',중분류-'||CUR_5060.CHAN_MCLS_CD||',프리미엄서비스-'||CUR_5060.PS_CD||') : 자료가 존재하지 않습니다!';
                    RAISE e_Error;
            END;

        -- 위치교환
        ELSIF  CUR_5060.SERVICE_CD = 'B00002' THEN

            v_Comm_Tp   := 'C2';

            BEGIN

                SELECT  SVCM_AMT + TO_NUMBER( CUR_5060.ADD_SVCM_AMT )		--[20250624_01] 프리미엄퍼플점 추가 위치교환수수료 부여
                INTO    v_Svcm_Amt
                FROM    RTRE5030
                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
                AND     STR_DAY     <= CUR_5060.PROC_DAY
                AND     END_DAY     >= CUR_5060.PROC_DAY
                AND     USE_YN       = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||',상품코드-'||CUR_5060.MAT_CD||') : 자료가 존재하지 않습니다!';
                    RAISE e_Error;
            END;

        -- 윈터교체
        ELSIF  CUR_5060.SERVICE_CD = 'B00006' THEN

            v_Comm_Tp   := 'C6';

            BEGIN

                SELECT  SVCM_AMT * TO_NUMBER( CUR_5060.CNT_CD )
                INTO    v_Svcm_Amt
                FROM    RTRE5030
                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
                AND     STR_DAY     <= CUR_5060.PROC_DAY
                AND     END_DAY     >= CUR_5060.PROC_DAY
                AND     MAT_CD       = CUR_5060.MAT_CD
                AND     USE_YN       = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '서비스수수료 조견표(서비스코드4-'||CUR_5060.SERVICE_CD||',상품코드-'||CUR_5060.MAT_CD||') : 자료가 존재하지 않습니다!';
                    RAISE e_Error;
            END;
            
        -- 걱정제로 [20180326_01]    
        ELSIF  CUR_5060.SERVICE_CD = 'B00007' THEN

            v_Comm_Tp   := 'C5';

            BEGIN

                SELECT  SVCM_AMT * CUR_5060.KWMENG
                INTO    v_Svcm_Amt
                FROM    RTRE5030
                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
                AND     STR_DAY     <= CUR_5060.PROC_DAY
                AND     END_DAY     >= CUR_5060.PROC_DAY
                AND     MAT_CD       = CUR_5060.MAT_CD              --[20201117_01] 걱정제로 서비스는 제품코드에 따라 수수료 구분
                AND     USE_YN       = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||',상품코드-'||CUR_5060.MAT_CD||') : 자료가 존재하지 않습니다!';
                    RAISE e_Error;
            END;

        -- 얼라인먼트 [20180326_01]    
        ELSIF  CUR_5060.SERVICE_CD = 'B00008' THEN

            v_Comm_Tp   := 'C4';

            BEGIN

                SELECT  SVCM_AMT
                INTO    v_Svcm_Amt
                FROM    RTRE5030
                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
                AND     STR_DAY     <= CUR_5060.PROC_DAY
                AND     END_DAY     >= CUR_5060.PROC_DAY
                AND     CAR_TYPE    = CUR_5060.CAR_TYPE             --[20201117_01] 무상얼라인먼트 서비스는 국산차/수입차에 따라 수수료 구분
                AND     USE_YN       = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||',상품코드-'||CUR_5060.MAT_CD||') : 자료가 존재하지 않습니다!';
                    RAISE e_Error;
            END;
        
        -- 무상얼라인먼트 [20200810_01]    
        ELSIF  CUR_5060.SERVICE_CD = 'B00009' THEN

            v_Comm_Tp   := 'C8';

            BEGIN

                SELECT  SVCM_AMT
                INTO    v_Svcm_Amt
                FROM    RTRE5030
                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
                AND     STR_DAY     <= CUR_5060.PROC_DAY
                AND     END_DAY     >= CUR_5060.PROC_DAY
                AND     CAR_TYPE    = CUR_5060.CAR_TYPE             --[20200810_01] 무상얼라인먼트 서비스는 국산차/수입차에 따라 수수료 구분
                AND     USE_YN       = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||',상품코드-'||CUR_5060.MAT_CD||') : 자료가 존재하지 않습니다!';
                    RAISE e_Error;
            END;
        
        -- 조기마모파손보증 [20201117_01]    
        ELSIF  CUR_5060.SERVICE_CD = 'B00011' THEN

            v_Comm_Tp   := 'C9';

            BEGIN

                SELECT  SVCM_AMT * CUR_5060.KWMENG
                INTO    v_Svcm_Amt
                FROM    RTRE5030
                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
                AND     STR_DAY     <= CUR_5060.PROC_DAY
                AND     END_DAY     >= CUR_5060.PROC_DAY
                AND     MAT_CD       = CUR_5060.MAT_CD              --[20201117_01] 걱정제로 서비스는 제품코드에 따라 수수료 구분
                AND     USE_YN       = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||',상품코드-'||CUR_5060.MAT_CD||') : 자료가 존재하지 않습니다!' || CUR_5060.PROC_DAY || ' ' || CUR_5060.ORD_NO;
                    RAISE e_Error;
            END;
           
        -- 파손보증 [20201117_01]    
        ELSIF  CUR_5060.SERVICE_CD = 'B00012' THEN

            v_Comm_Tp   := 'C10';

            BEGIN

                SELECT  SVCM_AMT * CUR_5060.KWMENG
                INTO    v_Svcm_Amt
                FROM    RTRE5030
                WHERE   SERVICE_CD   = CUR_5060.SERVICE_CD
                AND     STR_DAY     <= CUR_5060.PROC_DAY
                AND     END_DAY     >= CUR_5060.PROC_DAY
                AND     MAT_CD       = CUR_5060.MAT_CD              --[20201117_01] 걱정제로 서비스는 제품코드에 따라 수수료 구분
                AND     USE_YN       = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '서비스수수료 조견표(서비스코드2-'||CUR_5060.SERVICE_CD||',상품코드-'||CUR_5060.MAT_CD||') : 자료가 존재하지 않습니다!';
                    RAISE e_Error;
            END;
            
        END IF;

         v_curr_cunt  := v_curr_cunt + 1;
         v_Svcc_Amt   := v_Svcm_Amt;
         v_Comm_Seq   := v_curr_cunt;
         v_Comm_Tp    := v_Comm_Tp;

--        IF 0 != f_InsertRtre5060( v_Slcm_Ym,  v_Comm_Tp,   v_Ord_No,   v_Comm_Seq,
--                                  v_Cust_No,  v_Agency_Cd, v_Chan_Cd,  v_Mat_Cd,
--                                  v_Class_Cd, v_Svcc_Amt,  v_Ppob_Yn,  v_Svcp_Day,
--                                  v_Equ_No,   v_Serv_Seq,  v_Serv_Iseq,
        IF 0 != f_InsertRtre5060( v_Period,   v_Comm_Tp ,   CUR_5060.ORD_NO,   v_Comm_Seq,
                                  CUR_5060.CUST_NO,  CUR_5060.AGENCY_CD, CUR_5060.CHAN_CD,  CUR_5060.MAT_CD,
                                  CUR_5060.CNT_CD,   CUR_5060.CLASS_CD,  v_Svcc_Amt,  CUR_5060.PPOB_YN,
                                  CUR_5060.SVCP_DAY, CUR_5060.EQU_NO,    CUR_5060.SERV_SEQ, CUR_5060.SERV_ISEQ,
                                  v_Reg_Id,          v_ErrorText
                                ) THEN
            v_Return_Message := '서비스수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre5060%ISOPEN THEN
        CLOSE Cur_Rtre5060;
    END IF;
    dbms_output.put_line('11');
    /*
     * 방문점검수수료 집계 [20170519_01]
     */
    FOR CUR_5060_02 IN Cur_Rtre5060_02 LOOP
        EXIT WHEN Cur_Rtre5060_02%NOTFOUND;
        
        v_curr_cunt := v_curr_cunt + 1;
        v_Comm_Seq  := v_curr_cunt;
        
        IF 0 != f_InsertRtre5060( 
              v_Period              , 'C3'                  , CUR_5060_02.ORD_NO    , v_Comm_Seq
            , CUR_5060_02.CUST_NO   , CUR_5060_02.ORD_AGENT , CUR_5060_02.CHAN_CD   , CUR_5060_02.MAT_CD
            , CUR_5060_02.CNT_CD    , CUR_5060_02.CLASS_CD  , CUR_5060_02.AMT_COMM  , 'N'
            , CUR_5060_02.PROC_DAY  , CUR_5060_02.EQU_NO    , CUR_5060_02.SERV_SEQ  , CUR_5060_02.SERV_DSEQ
            , v_Reg_Id              , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
    END LOOP;

     IF Cur_Rtre5060_02%ISOPEN THEN
        CLOSE Cur_Rtre5060_02;
    END IF;

    /*
     * PickUp And Delviery수수료 집계 [20200506_01]
     */
--    v_curr_cunt := 0;
    FOR CUR_5060_03 IN Cur_Rtre5060_03 LOOP
        EXIT WHEN Cur_Rtre5060_03%NOTFOUND;
        
        v_curr_cunt := v_curr_cunt + 1;
        v_Comm_Seq  := v_curr_cunt;
        
        IF 0 != f_InsertRtre5060( v_Period,   'C7' ,   CUR_5060_03.ORD_NO,   v_Comm_Seq,
                                  CUR_5060_03.CUST_NO,  CUR_5060_03.AGENCY_CD, CUR_5060_03.CHAN_CD,  CUR_5060_03.MAT_CD,
                                  CUR_5060_03.CNT_CD,   CUR_5060_03.CLASS_CD,  CUR_5060_03.AMT_COMM,  'N',
                                  CUR_5060_03.PROC_DAY, CUR_5060_03.EQU_NO,    0, 0,
                                  v_Reg_Id,          v_ErrorText
                                ) THEN
            v_Return_Message := 'PickUp And Delivery서비스수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
    END LOOP;

     IF Cur_Rtre5060_03%ISOPEN THEN
        CLOSE Cur_Rtre5060_03;
    END IF;
    
    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtre5060%ISOPEN THEN
            CLOSE Cur_Rtre5060;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.p_CreateRtre5060ServiceComm(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre5060%ISOPEN THEN
            CLOSE Cur_Rtre5060;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5060.p_CreateRtre5060ServiceComm(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5060ServiceComm;


END Pkg_Rtre5060;