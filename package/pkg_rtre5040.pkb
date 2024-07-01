CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5040 AS
/*******************************************************************************
   NAME      Pkg_Rtre5040
   PURPOSE   판매수수료 기초 집계 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가
   1.2        2016-04-22  이영근           채널 대/중분류별 수수료 집계   
   1.3        2017-03-01  wjim             [20170301_02] CJ홈쇼핑 추가에 따른 수정
   1.4        2017-04-06  wjim             [20170406_01] 특정계약 수수료 집계 제외
   1.5        2017-05-29  wjim             [20170529_04] 지급금액 기준 변경
   1.6        2017-06-01  wjim             [20170601_01] K쇼핑 추가
   1.7        2017-08-18  wjim             [20170818_01] 홈앤쇼핑, 쇼핑엔티 추가에 따른 집계 제외
   1.8        2017-09-01  wjim             [20170901_05] 실수요자(홈쇼핑) 집계 제외
   1.9        2017-10-26  wjim             [20171026_02] (오픈몰)판매수수료 집계기준 변경
   1.12       2019-02-28  wjim             [20190228_01] 인센티브, 서비스 판매수수료 추가
   1.13       2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료(=인센티브) 분리
*******************************************************************************/

  /*****************************************************************************
  -- 판매수수료 기초 집계 Count
  *****************************************************************************/
  FUNCTION f_sRtre5040Count(
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,          /*마감년월            */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE5040
    WHERE   SLCM_YM        = v_Slcm_Ym
    AND     ORD_NO         = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre5040Count;

  /*****************************************************************************
  -- 판매수수료 기초 집계 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5040 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*판매원번호            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*타이어본수            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*예정 판매수수료       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*예정 충당설정금액     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*충당설정금액          */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SLCM_YM,                   /*마감년월            */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.ORD_AGENT,                 /*판매원번호          */
            A.CHAN_CD,                   /*채널구분            */
            A.COMM_TP,                   /*수수료항목          */
            A.MAT_CD,                    /*상품코드            */
            A.CNT_CD,                    /*타이어본수          */
            A.SSLCM_AMT,                 /*예정 판매수수료     */
            A.SAPFDS_AMT,                /*예정 충당설정금액   */
            A.SLCM_AMT,                  /*판매수수료          */
            A.APFDS_AMT,                 /*충당설정금액        */
            A.PPOB_YN,                   /*이연대상            */
            A.PROC_DAY,                  /*장착일자            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE5040 A
    WHERE   A.SLCM_YM          = DECODE(v_Slcm_Ym        , NULL, A.SLCM_YM         , v_Slcm_Ym)
    AND     A.ORD_NO           = DECODE(v_Ord_No         , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
    AND     A.ORD_AGENT        = DECODE(v_Ord_Agent      , NULL, A.ORD_AGENT       , v_Ord_Agent)
    AND     A.CHAN_CD          = DECODE(v_Chan_Cd        , NULL, A.CHAN_CD         , v_Chan_Cd)
    AND     A.COMM_TP          = DECODE(v_Comm_Tp        , NULL, A.COMM_TP         , v_Comm_Tp)
    AND     A.MAT_CD           = DECODE(v_Mat_Cd         , NULL, A.MAT_CD          , v_Mat_Cd)
    AND     A.CNT_CD           = DECODE(v_Cnt_Cd         , NULL, A.CNT_CD          , v_Cnt_Cd)
    AND     A.SSLCM_AMT        = DECODE(v_Sslcm_Amt      , NULL, A.SSLCM_AMT       , v_Sslcm_Amt)
    AND     A.SAPFDS_AMT       = DECODE(v_Sapfds_Amt     , NULL, A.SAPFDS_AMT      , v_Sapfds_Amt)
    AND     A.SLCM_AMT         = DECODE(v_Slcm_Amt       , NULL, A.SLCM_AMT        , v_Slcm_Amt)
    AND     A.APFDS_AMT        = DECODE(v_Apfds_Amt      , NULL, A.APFDS_AMT       , v_Apfds_Amt)
    AND     A.PPOB_YN          = DECODE(v_Ppob_Yn        , NULL, A.PPOB_YN         , v_Ppob_Yn)
    AND     A.PROC_DAY         = DECODE(v_Proc_Day       , NULL, A.PROC_DAY        , v_Proc_Day)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre5040;

  /*****************************************************************************
  -- 판매수수료 기초 집계 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5040 (
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*판매원번호            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*타이어본수            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*예정 판매수수료       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*예정 충당설정금액     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*충당설정금액          */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE5040 (
            SLCM_YM,
            ORD_NO,
            CUST_NO,
            ORD_AGENT,
            CHAN_CD,
            COMM_TP,
            MAT_CD,
            CNT_CD,
            SSLCM_AMT,
            SAPFDS_AMT,
            SLCM_AMT,
            APFDS_AMT,
            PPOB_YN,
            PROC_DAY,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Slcm_Ym,
            v_Ord_No,
            v_Cust_No,
            v_Ord_Agent,
            v_Chan_Cd,
            v_Comm_Tp,
            v_Mat_Cd,
            v_Cnt_Cd,
            v_Sslcm_Amt,
            v_Sapfds_Amt,
            v_Slcm_Amt,
            v_Apfds_Amt,
            v_Ppob_Yn,
            v_Proc_Day,
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

  END f_InsertRtre5040;

  /*****************************************************************************
  -- 판매수수료 기초 집계 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.13       2019-06-11  wjim             [20190611_01] PK항목에 수수료항목 추가 
  *****************************************************************************/
  FUNCTION f_UpdateRtre5040 (
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*판매원번호            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*타이어본수            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*예정 판매수수료       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*예정 충당설정금액     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*충당설정금액          */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5040
    SET    CUST_NO          = v_Cust_No,
           ORD_AGENT        = v_Ord_Agent,
           CHAN_CD          = v_Chan_Cd,
           COMM_TP          = v_Comm_Tp,
           MAT_CD           = v_Mat_Cd,
           CNT_CD           = v_Cnt_Cd,
           SSLCM_AMT        = v_Sslcm_Amt,
           SAPFDS_AMT       = v_Sapfds_Amt,
           SLCM_AMT         = v_Slcm_Amt,
           APFDS_AMT        = v_Apfds_Amt,
           PPOB_YN          = v_Ppob_Yn,
           PROC_DAY         = v_Proc_Day,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  SLCM_YM          = v_Slcm_Ym
    AND    ORD_NO           = v_Ord_No
    AND    COMM_TP          = v_Comm_Tp; --[20190611_01]

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5040;

  /*****************************************************************************
  -- 판매수수료 기초 집계 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5040 (
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTRE5040
    WHERE  SLCM_YM          = v_Slcm_Ym
    AND    ORD_NO           = v_Ord_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5010.f_DeleteRtre5010(2)', '마감년월', v_Slcm_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5010.f_DeleteRtre5010(2)', '계약번호', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5010.f_DeleteRtre5010(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre5040;

  /*****************************************************************************
  -- 판매수수료 기초 집계 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5040 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*판매원번호            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*타이어본수            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*예정 판매수수료       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*예정 충당설정금액     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*충당설정금액          */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN


    -- 필수값: 마감년월, 계약번호, 등록자 ID
    IF (TRIM(v_Slcm_Ym) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Slcm_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_No) IS NULL) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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

        IF (TRIM(v_Ord_Agent) IS NULL) THEN
            v_Return_Message := '판매원번호('||v_Ord_Agent||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Chan_Cd) IS NULL) THEN
            v_Return_Message := '채널구분('||v_Chan_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Comm_Tp) IS NULL) THEN
            v_Return_Message := '수수료항목('||v_Comm_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Mat_Cd) IS NULL) THEN
            v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Cnt_Cd) IS NULL) THEN
            v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Sslcm_Amt) IS NULL) THEN
            v_Return_Message := '예정 판매수수료('||v_Sslcm_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Sapfds_Amt) IS NULL) THEN
            v_Return_Message := '예정 충당설정금액('||v_Sapfds_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        IF (TRIM(v_Slcm_Amt) IS NULL) THEN
            v_Return_Message := '판매수수료('||v_Slcm_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Apfds_Amt) IS NULL) THEN
            v_Return_Message := '충당설정금액('||v_Apfds_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Ppob_Yn) IS NULL) THEN
            v_Return_Message := '이연대상('||v_Ppob_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Proc_Day) IS NULL) THEN
            v_Return_Message := '장착일자('||v_Proc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'I' THEN
            IF 0 != f_InsertRtre5040( v_Slcm_Ym,  v_Ord_No,    v_Cust_No, v_Ord_Agent,
                                      v_Chan_Cd,  v_Comm_Tp,   v_Mat_Cd,  v_Cnt_Cd,
                                      v_Sslcm_Amt, v_Sapfds_Amt, v_Slcm_Amt, v_Apfds_Amt,
                                      v_Ppob_Yn, v_Proc_Day, v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '판매수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        ELSE
            IF 0 != f_UpdateRtre5040( v_Slcm_Ym,  v_Ord_No,    v_Cust_No, v_Ord_Agent,
                                      v_Chan_Cd,  v_Comm_Tp,   v_Mat_Cd,  v_Cnt_Cd,
                                      v_Sslcm_Amt, v_Sapfds_Amt, v_Slcm_Amt, v_Apfds_Amt,
                                      v_Ppob_Yn, v_Proc_Day, v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '판매수수료 기초 집계 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtre5040( v_Slcm_Ym,  v_Ord_No,
                                  v_Reg_Id,   v_ErrorText
                                 ) THEN
            v_Return_Message := '판매수수료 기초 집계 삭제 실패!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_IUDRtre5040(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_IUDRtre5040(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5040;


  /*****************************************************************************
  -- 대리점 판매수수료 기초 집계 처리
    
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2016-04-02  이영근           '방문판매(사업부)' 집계 포함하도록 수정
   1.2        2016-04-22  이영근           채널 대/중분류별 수수료 집계
   1.3        2017-03-01  wjim             [20170301_02] CJ홈쇼핑 추가에 따른 수정   
   1.4        2017-04-06  wjim             [20170406_01] 특정계약 수수료 집계 제외
                                           - D17000088858 오계약으로 D17000091191 재계약
                                           - 기존 계약으로 판매수수료 지급되어 수정계약으로 수수료 미지급 필요
   1.5        2017-05-29  wjim             [20170529_04] 지급금액 기준 변경
                                           - 계약일 기준(기존) > 장착일 기준(변경) 
   1.6        2017-06-01  wjim             [20170601_01] K쇼핑 추가          
   1.7        2017-08-18  wjim             [20170818_01] 홈앤쇼핑, 쇼핑엔티 추가에 따른 집계 제외      
   1.8        2017-09-01  wjim             [20170901_05] 실수요자(홈쇼핑) 집계 제외
   1.9        2017-10-26  wjim             [20171026_02] 당월 중도완납/해약 계약도 집계대상에 포함
   1.10       2018-04-20  kstka            [20180420_01] W쇼핑 추가
   1.11       2018-06-01  kstka            [20180601_01] 홈쇼핑 하드코딩 제거 (쿼리변경)
   1.12       2019-02-28  wjim             [20190228_01] 인센티브, 서비스 판매수수료 추가
   1.13       2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 분리
  *****************************************************************************/
  PROCEDURE p_CreateRtre5040AgencyComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtsd0108 IS
    SELECT ORD_NO, CUST_NO, ORD_AGENT, CHAN_CD, COMM_TP, MAT_CD, CNT_CD, PROC_DAY,
           MFP_YN, END_TP, CANC_DAY, ORD_DAY, CHAN_LCLS_CD, CHAN_MCLS_CD FROM ( 
           SELECT A.ORD_NO,                                          /*계약번호            */
                   A.CUST_NO,                                         /*고객번호            */
                   DECODE (A.CHAN_CD,
                           '01', A.AGENCY_CD,
                           DECODE (A.CHAN_CD, '05', A.AGENCY_CD, A.ORD_AGENT))
                      ORD_AGENT,
                   /*판매원번호          */
                   A.CHAN_CD,                                         /*채널구분            */
                   CASE
                      WHEN A.CHAN_CD = '01' THEN 'A1'
                      WHEN A.CHAN_CD = '03' THEN 'A2'
                      WHEN A.CHAN_CD = '04' THEN 'A3'
                      WHEN A.CHAN_CD = '05' THEN 'A4'
                   END
                      COMM_TP,                                        /*수수료항목          */
                   B.MAT_CD,                                          /*상품코드            */
                   A.CNT_CD,                                          /*타이어본수          */
                   A.PROC_DAY,                                        /*장착일자            */
                   A.MFP_YN,                                          /*종료여부            */
                   A.END_TP,                                          /*중도해지            */
                   A.CANC_DAY,                                        /*해지일자            */
                   A.ORD_DAY,                                         /*접수일자            */
                   DECODE(A.CHAN_CD,'03',F.CHAN_LCLS_CD,E.CHAN_LCLS_CD) AS CHAN_LCLS_CD,
                   DECODE(A.CHAN_CD,'03',F.CHAN_MCLS_CD,E.CHAN_MCLS_CD) AS CHAN_MCLS_CD
              FROM RTSD0108 A, RTCS0001 B, RTSD0007 E, RTSD0113 F
             WHERE     A.PROC_DAY BETWEEN v_Period|| '01'
                                      AND TO_CHAR (
                                             LAST_DAY (
                                                TO_DATE (v_Period|| '01', 'YYYYMMDD')),
                                             'YYYYMMDD')
                   AND A.ORD_NO = B.ORD_NO
                   AND A.CHAN_CD IN ('01', '03', '05')
                   AND A.AGENCY_CD = E.AGENCY_CD(+)
                   AND A.ORD_AGENT = F.ORD_AGENT(+)
                   --AND F.CHAN_MCLS_CD(+) <> '0305' -- 홈쇼핑 계약은 제외
                   --AND nvl(A.ORD_AGENT,'0') NOT IN ('400564','412633','412893','402818','100687','100688','413099','413100','777777','413636','401309', '412634') --[20170301_02] 외
                   AND A.ORD_NO NOT IN
                          (SELECT A.ORD_NO
                             FROM RTSD0108 A,
                                  RTCS0001 B,
                                  RTSD0113 C,
                                  RTCM0001 D
                            WHERE     A.PROC_DAY BETWEEN v_Period||'01' AND TO_CHAR (LAST_DAY(TO_DATE(v_Period||'01','YYYYMMDD')),'YYYYMMDD')
                                  AND A.ORD_NO = B.ORD_NO
                                  AND A.CHAN_CD IN ('01', '03', '05')
                                  AND A.ORD_AGENT = C.ORD_AGENT(+)
                                  AND C.ORD_AGENT = D.USER_ID
                                  AND D.USER_GRP = '09'
                                  AND D.VKGRP = 'REA'
                                  AND D.VKBUR != 'REA5') -- 2016-04-02 이영근 ADD                                  
    )
    WHERE 1=1 
    AND ORD_NO NOT IN ('D17000091191') --[20170406_01]
    AND CHAN_MCLS_CD(+) <> '0305' -- 홈쇼핑 계약은 제외       
    ;        
        

    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;

    v_Slcm_Amt      RTRE5010.SLCM_AMT%TYPE;
    v_Apfd_Amt      RTRE5010.APFD_AMT%TYPE;
    v_Slcm_Amt1     RTRE5040.SLCM_AMT%TYPE;
    v_Apfds_Amt1    RTRE5040.APFDS_AMT%TYPE;
    v_Svc_Amt       RTRE5120.AMT%TYPE;          --서비스 판매수수료
    v_Inctv_Amt     RTRE7040.SSLCM_AMT%TYPE;    --인센티브

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
        FROM    RTRE5040
        WHERE   SLCM_YM = v_Period
        AND     CHAN_CD IN ( '01', '03', '05' )
        AND     ROWNUM =  1;

        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;

    IF  v_curr_cunt > 0 THEN

        BEGIN

            DELETE
            FROM    RTRE5040
            WHERE   SLCM_YM = v_Period
            AND     CHAN_CD IN ( '01', '03', '05' );

            EXCEPTION
            WHEN OTHERS THEN
                v_curr_cunt := 0;
        END;

    END IF;
    
    -- 서비스 판매수수료 기존 집계 삭제 [20190228_01]
    DELETE  RTRE5120
     WHERE  SLCM_YM = v_Period
    ;
    
    -- 서비스 판매수수료 집계 생성 [20190228_01]
    INSERT  INTO RTRE5120
    SELECT  v_Period
         ,  A1.ORD_NO                 
         ,  A1.CHAN_CD
         ,  A1.ORD_DAY 
         ,  SUM(PER_AMT) AS AMT
         ,  v_Reg_Id
         ,  SYSDATE
         ,  v_Reg_Id
         ,  SYSDATE
      FROM  RTSD0108 A1
         ,  RTSD0013 B1
         ,  RTRE5110 C1
     WHERE  A1.PROC_DAY  BETWEEN v_Period||'01' AND TO_CHAR (LAST_DAY(TO_DATE(v_Period||'01','YYYYMMDD')),'YYYYMMDD')
       AND  A1.PS_CD     = '999999'       --렌탈고도화(2019.02.07) 이후만 적용
       AND  A1.CHAN_CD   IN ('01')        --적용채널 : 대리점에만 적용
       AND  A1.ORD_NO    = B1.ORD_NO
       AND  B1.PRS_DCD   = C1.SERVICE_CD
       AND  B1.SERV_CNT0 = C1.SERVICE_CNT   
       AND  C1.USE_YN    = 'Y'
       AND  C1.STR_DAY  <= A1.ORD_DAY
       AND  C1.END_DAY  >= A1.ORD_DAY
     GROUP  BY A1.ORD_NO                 
         ,  A1.CHAN_CD
         ,  A1.ORD_DAY
    ;

    -- 대리점 판매수수료 기초 집계 생성
    v_curr_cunt := 0;
    FOR CUR_0108 IN Cur_Rtsd0108 LOOP
        EXIT WHEN Cur_Rtsd0108%NOTFOUND;

        -- 제외 대상
        -- - [20171026_02]에 의해 주석처리
--        IF  CUR_0108.MFP_YN = 'Y' AND
--            CUR_0108.END_TP = 'C' AND
--            SUBSTR(CUR_0108.CANC_DAY,1,6) = v_Period THEN
--
--            -- 제외함
--            v_curr_cunt := v_curr_cunt;
--        ELSE

            BEGIN

                SELECT  SLCM_AMT, APFD_AMT
                INTO    v_Slcm_Amt, v_Apfd_Amt
                FROM    RTRE5010
                WHERE   CHAN_CD  = CUR_0108.CHAN_CD
                AND     MAT_CD   = CUR_0108.MAT_CD
                AND     STR_DAY <= CUR_0108.PROC_DAY --[20170529_04] ORD_DAY > PROC_DAY
                AND     END_DAY >= CUR_0108.PROC_DAY --[20170529_04] ORD_DAY > PROC_DAY                
                AND     CHAN_LCLS_CD = CUR_0108.CHAN_LCLS_CD
                AND     CHAN_MCLS_CD = CUR_0108.CHAN_MCLS_CD
                AND     USE_YN   = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    --v_Return_Message := '판매수수료 조견표(주문번호:'||CUR_0108.ORD_NO||',주문일자:'||CUR_0108.ORD_DAY||',채널구분:'||CUR_0108.CHAN_CD||',대리점코드:'||CUR_0108.ORD_AGENT||',상품코드:'||CUR_0108.MAT_CD||',대분류:'||CUR_0108.CHAN_LCLS_CD||',중분류:'||CUR_0108.CHAN_MCLS_CD||') : 자료가 존재하지 않습니다!';
                    v_Return_Message := '판매수수료 조견표(주문번호:'||CUR_0108.ORD_NO||',장착일자:'||CUR_0108.PROC_DAY||',채널구분:'||CUR_0108.CHAN_CD||',대리점코드:'||CUR_0108.ORD_AGENT||',상품코드:'||CUR_0108.MAT_CD||',대분류:'||CUR_0108.CHAN_LCLS_CD||',중분류:'||CUR_0108.CHAN_MCLS_CD||') : 자료가 존재하지 않습니다!'; --[20170529_04]
                    RAISE e_Error;
            END;

            v_curr_cunt  := v_curr_cunt + 1;
            v_Slcm_Amt1  := CUR_0108.CNT_CD * v_Slcm_Amt;
            v_Apfds_Amt1 := CUR_0108.CNT_CD * v_Apfd_Amt;
            
            -- 서비스 판매수수료 추가 [20190228_01]
            SELECT  NVL(SUM(AMT), 0)
              INTO  v_Svc_Amt
              FROM  RTRE5120
             WHERE  SLCM_YM = v_Period
               AND  ORD_NO  = CUR_0108.ORD_NO
            ;
            
            -- 인센티브 추가 [20190228_01]
            SELECT  NVL(SUM(SSLCM_AMT), 0)
              INTO  v_Inctv_Amt
              FROM  RTRE7040
             WHERE  SLCM_YM = v_Period
               AND  ORD_NO  = CUR_0108.ORD_NO
               AND  PPOB_YN = 'Y'
            ;
            
            -- 기존 판매수수료 + 서비스 판매수수료 + 인센티브 [20190228_01] 
            -- - 서비스 판매수수료, 인센티브 항목 분리에 따라 주석처리
--            v_Slcm_Amt1  := v_Slcm_Amt1 + v_Svc_Amt + v_Inctv_Amt;

            -- 판매수수료 집계등록
            IF 0 != f_InsertRtre5040( v_Period,         CUR_0108.ORD_NO,   CUR_0108.CUST_NO, CUR_0108.ORD_AGENT,
                                      CUR_0108.CHAN_CD, CUR_0108.COMM_TP,  CUR_0108.MAT_CD,  CUR_0108.CNT_CD,
                                      v_Slcm_Amt1,      v_Apfds_Amt1, 0, 0,
                                      'Y', CUR_0108.PROC_DAY, v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '판매수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            -- 서비스 판매수수료 집계등록 [20190611_01]
--            IF v_Svc_Amt > 0 THEN
--                IF 0 != f_InsertRtre5040( v_Period,         CUR_0108.ORD_NO,   CUR_0108.CUST_NO, CUR_0108.ORD_AGENT,
--                                          CUR_0108.CHAN_CD, 'A5',  CUR_0108.MAT_CD,  CUR_0108.CNT_CD,
--                                          v_Svc_Amt,      0, 0, 0,
--                                          'Y', CUR_0108.PROC_DAY, v_Reg_Id, v_ErrorText
--                                         ) THEN
--                    v_Return_Message := '서비스 판매수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
--                    v_Errortext := v_Errortext;
--                    RAISE e_Error;
--                END IF;
--            END IF;
            
            -- 판매장려수수료 집계등록 [20190611_01]
            IF v_Inctv_Amt > 0 THEN
                IF 0 != f_InsertRtre5040( v_Period,         CUR_0108.ORD_NO,   CUR_0108.CUST_NO, CUR_0108.ORD_AGENT,
                                          CUR_0108.CHAN_CD, 'A6',  CUR_0108.MAT_CD,  CUR_0108.CNT_CD,
                                          v_Inctv_Amt,      0, 0, 0,
                                          'Y', CUR_0108.PROC_DAY, v_Reg_Id, v_ErrorText
                                         ) THEN
                    v_Return_Message := '판매장려수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
            END IF;

--        END IF;

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
        v_Return_Message := '마감월('||v_Period||') : 처리건이 존재하지 않습니다!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_CreateRtre5040AgencyComm(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtsd0108%ISOPEN THEN
            CLOSE Cur_Rtsd0108;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_CreateRtre5040AgencyComm(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5040AgencyComm;


  /*****************************************************************************
  -- 오픈몰 판매수수료 기초 집계 처리
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.5        2017-05-29  wjim             [20170529_04] 지급금액 기준 변경
                                           - 계약일 기준(기존) > 장착일 기준(변경) 
   1.9        2017-10-26  wjim             [20171026_02] 당월 중도완납/해약 계약도 집계대상에 포함
  *****************************************************************************/
  PROCEDURE p_CreateRtre5040MallComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtsd0108 IS
    SELECT  A.ORD_NO,                                   /*계약번호            */
            A.CUST_NO,                                  /*고객번호            */
            DECODE( A.CHAN_CD, '01', A.AGENCY_CD,
                    DECODE(A.CHAN_CD, '05', A.AGENCY_CD, A.ORD_AGENT)) ORD_AGENT,
                                                        /*판매원번호          */
            A.CHAN_CD,                                  /*채널구분            */
            CASE WHEN A.CHAN_CD = '01' THEN 'A1'
                 WHEN A.CHAN_CD = '03' THEN 'A2'
                 WHEN A.CHAN_CD = '04' THEN 'A3'
                 WHEN A.CHAN_CD = '05' THEN 'A4'
            END COMM_TP,                                /*수수료항목          */
            B.MAT_CD,                                   /*상품코드            */
            A.CNT_CD,                                   /*타이어본수          */
            A.PROC_DAY,                                 /*장착일자            */
            A.MFP_YN,                                   /*종료여부            */
            A.END_TP,                                   /*중도해지            */
            A.CANC_DAY,                                 /*해지일자            */
            A.ORD_DAY                                   /*접수일자            */
    FROM    RTSD0108 A, RTCS0001 B
    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
    AND     A.ORD_NO = B.ORD_NO
    AND     A.CHAN_CD IN ( '04' );

    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;

    v_Slcm_Amt      RTRE5010.SLCM_AMT%TYPE;
    v_Apfd_Amt      RTRE5010.APFD_AMT%TYPE;

    v_Slcm_Amt1     RTRE5040.SLCM_AMT%TYPE;
    v_Apfds_Amt1    RTRE5040.APFDS_AMT%TYPE;

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
        FROM    RTRE5040
        WHERE   SLCM_YM = v_Period
        AND     CHAN_CD IN ( '04' )
        AND     ROWNUM =  1;

        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;

    IF  v_curr_cunt > 0 THEN

        BEGIN

            DELETE
            FROM    RTRE5040
            WHERE   SLCM_YM = v_Period
            AND     CHAN_CD IN ( '04' );

            EXCEPTION
            WHEN OTHERS THEN
                v_curr_cunt := 0;
        END;
    END IF;


    -- 오픈몰 판매수수료 기초 집계 생성
    v_curr_cunt := 0;
    FOR CUR_0108 IN Cur_Rtsd0108 LOOP
        EXIT WHEN Cur_Rtsd0108%NOTFOUND;

        -- 제외 대상
        -- - [20171026_02]에 의해 주석처리
--        IF  CUR_0108.MFP_YN = 'Y' AND
--            CUR_0108.END_TP = 'C' AND
--            SUBSTR(CUR_0108.CANC_DAY,1,6) = v_Period THEN
--
--            -- 제외함
--            v_curr_cunt := v_curr_cunt;
--        ELSE

            BEGIN

                SELECT  SLCM_AMT, APFD_AMT
                INTO    v_Slcm_Amt, v_Apfd_Amt
                FROM    RTRE5011
                WHERE   ORD_AGENT = CUR_0108.ORD_AGENT
                AND     STR_DAY  <= CUR_0108.PROC_DAY --[20170529_04] ORD_DAY > PROC_DAY
                AND     END_DAY  >= CUR_0108.PROC_DAY --[20170529_04] ORD_DAY > PROC_DAY
                AND     USE_YN    = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '판매수수료 조견표(판매원구분-'||CUR_0108.ORD_AGENT||') : 자료가 존재하지 않습니다!';
                    RAISE e_Error;
            END;

            v_curr_cunt  := v_curr_cunt + 1;
--            v_Slcm_Amt1  := CUR_0108.CNT_CD * v_Slcm_Amt;
--            v_Apfds_Amt1 := CUR_0108.CNT_CD * v_Apfd_Amt;
            v_Slcm_Amt1  := v_Slcm_Amt;
            v_Apfds_Amt1 := v_Apfd_Amt;

--            IF 0 != f_InsertRtre5040( v_Slcm_Ym,  v_Ord_No,    v_Cust_No, v_Ord_Agent,
--                                      v_Chan_Cd,  v_Comm_Tp,   v_Mat_Cd,  v_Cnt_Cd,
--                                      v_Slcm_Amt, v_Apfds_Amt, v_Ppob_Yn, v_Proc_Day,
            IF 0 != f_InsertRtre5040( v_Period,         CUR_0108.ORD_NO,   CUR_0108.CUST_NO, CUR_0108.ORD_AGENT,
                                      CUR_0108.CHAN_CD, CUR_0108.COMM_TP,  CUR_0108.MAT_CD,  CUR_0108.CNT_CD,
                                      v_Slcm_Amt1, v_Apfds_Amt1, 0, 0,
                                      'N', CUR_0108.PROC_DAY, v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '판매수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

--        END IF;

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
        v_Return_Message := '마감월('||v_Period||') : 처리건이 존재하지 않습니다!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_CreateRtre5040MallComm(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtsd0108%ISOPEN THEN
            CLOSE Cur_Rtsd0108;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_CreateRtre5040MallComm(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5040MallComm;


  /*****************************************************************************
  -- 판매인별 수수료 내역 집계 - 판매인별 수수료 집계시 계약번호별 충당금 금액을 확정하여 조정하는 프로시져임
  *****************************************************************************/
  PROCEDURE p_UpdateRtre5040AgentAppFix (
    v_Period         IN  CHAR,                         /*마감월              */
    v_Agency_Cd      IN  RTRE5070.AGENCY_CD%TYPE,      /*판매원번호          */
    v_Btapfd_Amt     IN  RTRE5070.BTAPFD_AMT%TYPE,     /*층당금설정금액      */
    v_Reg_Id         IN  RTRE5070.REG_ID%TYPE,         /*등록자 ID           */
    v_Rtslc_Amt      OUT RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료    */
    v_Ntslc_Amt      OUT RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료      */
    v_Opslc_Amt      OUT RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료    */
    v_Tbslc_Amt      OUT RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료*/
    v_Mfapfd_Amt     OUT RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액  */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre5040 IS
    SELECT  A.SLCM_YM,                   /*마감년월            */
            A.ORD_NO,                    /*계약번호            */
            A.COMM_TP,                   /*수수료항목          */
            A.SSLCM_AMT,                 /*예정 판매수수료     */
            A.SAPFDS_AMT                 /*예정 충당설정금액   */
    FROM    RTRE5040 A                   /*판매수수료 기초 집계*/
    WHERE   A.SLCM_YM = v_Period
    AND     A.ORD_AGENT = v_Agency_Cd
    ORDER   BY SUBSTR( ORD_NO, 2);

    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;

    v_Slcm_Amt      RTRE5040.SLCM_AMT%TYPE;   /*판매수수료            */
    v_Apfds_Amt     RTRE5040.APFDS_AMT%TYPE;  /*충당설정금액          */
  BEGIN

    -- 필수값:
    IF (TRIM(v_Period) IS NULL) OR (0 <> ISDATE(v_Period)) OR (6 <> LENGTH(TRIM(v_Period))) THEN
        v_Return_Message := '마감월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Agency_Cd) IS NULL THEN
        v_Return_Message := '판매원번호('||v_Agency_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Btapfd_Amt) IS NULL THEN
        v_Return_Message := '층당금설정금액('||v_Btapfd_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 이전충당금액 > 300만원
    IF v_Btapfd_Amt > 3000000 THEN
        v_Return_Message := '이전충당금액('||TO_CHAR(v_Btapfd_Amt)||') : 300만원을 초과하므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    v_curr_cunt := 0;

    -- 당월충당금설정금액 = 이전충당금액
    v_Mfapfd_Amt := v_Btapfd_Amt;

    FOR CUR_5040 IN Cur_Rtre5040 LOOP
        EXIT WHEN Cur_Rtre5040%NOTFOUND;

        -- 당월충당금설정금액+특정계약건.예정충당설정금액 > 300만원
        IF (v_Mfapfd_Amt + NVL(CUR_5040.SAPFDS_AMT,0)) > 3000000 THEN

            -- 판매수수료 :=  특정계약건.예정판매수수료 + (당월충당금설정금액+특정계약건.예정충당설정금액 - 300만원)
            v_Slcm_Amt := NVL(CUR_5040.SSLCM_AMT,0) + ((v_Mfapfd_Amt + NVL(CUR_5040.SAPFDS_AMT,0)) - 3000000);

            -- 충당설정금액:= 300만원 - 당월충당금설정금액
            v_Apfds_Amt := 3000000 - v_Mfapfd_Amt;

            -- 당월충당금설정금액 := 300만원
            v_Mfapfd_Amt := 3000000;

        ELSE
            -- 판매수수료 :=  특정계약건.예정판매수수료
            v_Slcm_Amt := NVL(CUR_5040.SSLCM_AMT,0);

            -- 충당설정금액:= 특정계약건.예정충당설정금액
            v_Apfds_Amt := NVL(CUR_5040.SAPFDS_AMT,0);

            -- 당월충당금설정금액 := 당월충당금설정금액+특정계약건.예정충당설정금액
            v_Mfapfd_Amt := v_Mfapfd_Amt + NVL(CUR_5040.SAPFDS_AMT,0);
        END IF;

        -- 판매수수료,충당설정금액 업데이트
        UPDATE  RTRE5040 A
        SET     SLCM_AMT  = v_Slcm_Amt,
                APFDS_AMT = v_Apfds_Amt,
                CHG_ID    = v_Reg_Id,
                CHG_DT    = SYSDATE
        WHERE   SLCM_YM   = CUR_5040.SLCM_YM
        AND     ORD_NO    = CUR_5040.ORD_NO
        AND     COMM_TP   = CUR_5040.COMM_TP;

        v_curr_cunt := v_curr_cunt + 1;

    END LOOP;

    IF Cur_Rtre5040%ISOPEN THEN
        CLOSE Cur_Rtre5040;
    END IF;

    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;

        -- 각각의 판매수수료와 충당금설정금액 획득
        SELECT  SUM( DECODE( A.COMM_TP, 'A1', A.SLCM_AMT, 0 ))  RTSLC_AMT,
                                                            /*대리점 판매수수료    */
                SUM( DECODE( A.COMM_TP, 'A2', A.SLCM_AMT, 0 ))  NTSLC_AMT,
                                                            /*방판 판매수수료      */
                SUM( DECODE( A.COMM_TP, 'A3', A.SLCM_AMT, 0 ))  OPSLC_AMT,
                                                            /*오픈몰 판매수수료    */
                SUM( DECODE( A.COMM_TP, 'A4', A.SLCM_AMT, 0 ))  TBSLC_AMT,
                                                            /*타어어뱅크 판매수수료*/
                SUM( A.APFDS_AMT )                              APFDS_AMT
                                                            /*충당금설정가능금액   */
        INTO    v_Rtslc_Amt, v_Ntslc_Amt, v_Opslc_Amt, v_Tbslc_Amt, v_Mfapfd_Amt
        FROM    RTRE5040 A
        WHERE   A.SLCM_YM = v_Period
        AND     A.ORD_AGENT = v_Agency_Cd
        GROUP   BY A.ORD_AGENT;
    ELSE

        v_Rtslc_Amt  := 0;
        v_Ntslc_Amt  := 0;
        v_Opslc_Amt  := 0;
        v_Tbslc_Amt  := 0;
        v_Mfapfd_Amt := 0;

    END IF;


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_UpdateRtre5040AgentAppFix(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_UpdateRtre5040AgentAppFix(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre5040AgentAppFix;

  /*****************************************************************************
  -- 충당금 적립 계약 내역 조회 - 충당금 적립된 판매수수료에 대한 상세 내역 조회
  *****************************************************************************/
  PROCEDURE p_sRtre5040AppSaveOrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_YmF       IN RTRE5040.SLCM_YM%TYPE,        /*조회일자From          */
    v_Slcm_YmT       IN RTRE5040.SLCM_YM%TYPE,        /*조회일자To            */
    v_Agency_Cd      IN RTRE5040.ORD_AGENT%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*사용자 ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    ) IS

    v_Serch_Flag NUMBER DEFAULT 0;
    v_ErrorText  VARCHAR2(2000) DEFAULT NULL;
  BEGIN

    IF TRIM(v_Slcm_YmF) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '조회일자From('||v_Slcm_YmF||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_sRtre5040AppSaveOrdList(1)', v_ErrorText);
    END IF;

    IF TRIM(v_Slcm_YmT) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '조회일자To('||v_Slcm_YmT||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_sRtre5040AppSaveOrdList(1)', v_ErrorText);
    END IF;

    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '사용자 ID('||v_Reg_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_sRtre5040AppSaveOrdList(1)', v_ErrorText);
    END IF;

    -- 사용자 그룹에 따른 조회 범위 권한 체크
    v_Serch_Flag := Pkg_Rtre5070.f_sRtre5070UserInputValueCheck('Pkg_Rtre5040.p_sRtre5040AppSaveOrdList',v_Agency_Cd, v_Sales_Group, v_Sales_Office, v_Reg_Id);

    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
       B.USER_ID,
       B.RENTAL_GROUP,
       B.RENTAL_OFFICE,
       Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
       Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  A.SLCM_YM                                                   AS SLCM_YM        , /*마감년월    */
            B.SALES_GROUP                                              AS SALES_GROUP    , /*지사        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', B.SALES_GROUP)    AS SALES_GROUP_NM , /*지사명      */
            B.SALES_OFFICE                                             AS SALES_OFFICE   , /*지점        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', B.SALES_OFFICE)   AS SALES_OFFICE_NM, /*지점명      */
            A.ORD_AGENT                                                 AS AGENCY_CD      , /*판매처코드  */
            B.AGENCY_NM                                                 AS AGENCY_NM      , /*판매처명    */
            B.LIFNR                                                     AS LIFNR          , /*벤더코드    */
            A.ORD_NO                                                    AS ORD_NO         , /*계약번호    */
            A.PROC_DAY                                                  AS PROC_DAY       , /*설치일자    */
            A.MAT_CD                                                    AS MAT_CD         , /*상품코드    */
            C.PETTERN_CD                                                AS PETTERN_CD     , /*패턴        */
            C.SECTION_WIDTH||'/'||C.ASPECT_RATIO||'R'||C.WHEEL_INCHES   AS TIRE_SIZE      , /*사이즈      */
            A.CNT_CD                                                    AS CNT_CD         , /*수량        */
            A.APFDS_AMT / A.CNT_CD                                      AS APFD_AMT       , /*개당충당금  */
            A.APFDS_AMT                                                 AS APFDS_AMT        /*총 충당금   */
    FROM    RTRE5040 A, -- 판매수수료 기초 집계
            RTRE5070 B, -- 판매원 수수료 내역
            RTSD0005 C  -- 상품 마스터
    WHERE   v_Serch_Flag   = 0
    AND     A.SLCM_YM BETWEEN v_Slcm_YmF AND v_Slcm_YmT
    AND     A.ORD_AGENT    = DECODE( v_Agency_Cd, NULL, A.ORD_AGENT, v_Agency_Cd)
    AND     A.SLCM_YM      = B.SLCM_YM
    AND     A.ORD_AGENT    = B.AGENCY_CD
    AND     (v_Sales_Group  IS NULL OR B.SALES_GROUP  = v_Sales_Group)
    AND     (v_Sales_Office IS NULL OR B.SALES_OFFICE = v_Sales_Office)
    AND     A.MAT_CD       = C.MAT_CD
          ) A
          LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
  ) A
    WHERE 1=1
      AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
      AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
    ;

  END p_sRtre5040AppSaveOrdList;


  PROCEDURE p_CreateRtre5040AgencyComm_1 (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtsd0108 IS
    SELECT ORD_NO, CUST_NO, ORD_AGENT, CHAN_CD, COMM_TP, MAT_CD, CNT_CD, PROC_DAY,
           MFP_YN, END_TP, CANC_DAY, ORD_DAY, CHAN_LCLS_CD, CHAN_MCLS_CD FROM ( 
           SELECT A.ORD_NO,                                          /*계약번호            */
                   A.CUST_NO,                                         /*고객번호            */
                   DECODE (A.CHAN_CD,
                           '01', A.AGENCY_CD,
                           DECODE (A.CHAN_CD, '05', A.AGENCY_CD, A.ORD_AGENT))
                      ORD_AGENT,
                   /*판매원번호          */
                   A.CHAN_CD,                                         /*채널구분            */
                   CASE
                      WHEN A.CHAN_CD = '01' THEN 'A1'
                      WHEN A.CHAN_CD = '03' THEN 'A2'
                      WHEN A.CHAN_CD = '04' THEN 'A3'
                      WHEN A.CHAN_CD = '05' THEN 'A4'
                   END
                      COMM_TP,                                        /*수수료항목          */
                   B.MAT_CD,                                          /*상품코드            */
                   A.CNT_CD,                                          /*타이어본수          */
                   A.PROC_DAY,                                        /*장착일자            */
                   A.MFP_YN,                                          /*종료여부            */
                   A.END_TP,                                          /*중도해지            */
                   A.CANC_DAY,                                        /*해지일자            */
                   A.ORD_DAY,                                         /*접수일자            */
                   DECODE(A.CHAN_CD,'03',F.CHAN_LCLS_CD,E.CHAN_LCLS_CD) AS CHAN_LCLS_CD,
                   DECODE(A.CHAN_CD,'03',F.CHAN_MCLS_CD,E.CHAN_MCLS_CD) AS CHAN_MCLS_CD
              FROM RTSD0108 A, RTCS0001 B, RTSD0007 E, RTSD0113 F
             WHERE     A.PROC_DAY BETWEEN v_Period|| '01'
                                      AND TO_CHAR (
                                             LAST_DAY (
                                                TO_DATE (v_Period|| '01', 'YYYYMMDD')),
                                             'YYYYMMDD')
                   AND A.ORD_NO = B.ORD_NO
                   AND A.CHAN_CD IN ('01', '03', '05', '04')
                   AND A.AGENCY_CD = E.AGENCY_CD(+)
                   AND A.ORD_AGENT = F.ORD_AGENT(+)
                   --AND F.CHAN_MCLS_CD(+) <> '0305' -- 홈쇼핑 계약은 제외
                   --AND nvl(A.ORD_AGENT,'0') NOT IN ('400564','412633','412893','402818','100687','100688','413099','413100','777777','413636','401309', '412634') --[20170301_02] 외
                   AND A.ORD_NO NOT IN
                          (SELECT A.ORD_NO
                             FROM RTSD0108 A,
                                  RTCS0001 B,
                                  RTSD0113 C,
                                  RTCM0001 D
                            WHERE     A.PROC_DAY BETWEEN v_Period||'01' AND TO_CHAR (LAST_DAY(TO_DATE(v_Period||'01','YYYYMMDD')),'YYYYMMDD')
                                  AND A.ORD_NO = B.ORD_NO
                                  AND A.CHAN_CD IN ('01', '03', '05')
                                  AND A.ORD_NO IN ('M19000227706')
                                  AND A.ORD_AGENT = C.ORD_AGENT(+)
                                  AND C.ORD_AGENT = D.USER_ID
                                  AND D.USER_GRP = '09'
                                  AND D.VKGRP = 'REA'
                                  AND D.VKBUR != 'REA5') -- 2016-04-02 이영근 ADD                                  
    )
    WHERE 1=1 
    AND ORD_NO NOT IN ('D17000091191') --[20170406_01]
    AND ORD_NO IN ('M19000227706')
    AND CHAN_MCLS_CD(+) <> '0305' -- 홈쇼핑 계약은 제외       
    ;        
        

    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;

    v_Slcm_Amt      RTRE5010.SLCM_AMT%TYPE;
    v_Apfd_Amt      RTRE5010.APFD_AMT%TYPE;
    v_Slcm_Amt1     RTRE5040.SLCM_AMT%TYPE;
    v_Apfds_Amt1    RTRE5040.APFDS_AMT%TYPE;
    v_Svc_Amt       RTRE5120.AMT%TYPE;          --서비스 판매수수료
    v_Inctv_Amt     RTRE7040.SSLCM_AMT%TYPE;    --인센티브

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
   

    -- 대리점 판매수수료 기초 집계 생성
    v_curr_cunt := 0;
    FOR CUR_0108 IN Cur_Rtsd0108 LOOP
        EXIT WHEN Cur_Rtsd0108%NOTFOUND;

            
            v_curr_cunt  := v_curr_cunt + 1;
            v_Slcm_Amt1  := 100000;
            v_Apfds_Amt1 := 10000;
            
            -- 서비스 판매수수료 추가 [20190228_01]
            SELECT  NVL(SUM(AMT), 0)
              INTO  v_Svc_Amt
              FROM  RTRE5120
             WHERE  SLCM_YM = v_Period
               AND  ORD_NO  = CUR_0108.ORD_NO
            ;
            
            -- 인센티브 추가 [20190228_01]
            SELECT  NVL(SUM(SSLCM_AMT), 0)
              INTO  v_Inctv_Amt
              FROM  RTRE7040
             WHERE  SLCM_YM = v_Period
               AND  ORD_NO  = CUR_0108.ORD_NO
               AND  PPOB_YN = 'Y'
            ;
            
            -- 기존 판매수수료 + 서비스 판매수수료 + 인센티브 [20190228_01] 
            -- - 서비스 판매수수료, 인센티브 항목 분리에 따라 주석처리
--            v_Slcm_Amt1  := v_Slcm_Amt1 + v_Svc_Amt + v_Inctv_Amt;

            -- 판매수수료 집계등록
            IF 0 != f_InsertRtre5040( v_Period,         CUR_0108.ORD_NO,   CUR_0108.CUST_NO, CUR_0108.ORD_AGENT,
                                      CUR_0108.CHAN_CD, CUR_0108.COMM_TP,  CUR_0108.MAT_CD,  CUR_0108.CNT_CD,
                                      v_Slcm_Amt1,      v_Apfds_Amt1, 0, 0,
                                      'Y', CUR_0108.PROC_DAY, v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '판매수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            -- 서비스 판매수수료 집계등록 [20190611_01]
            IF v_Svc_Amt > 0 THEN
                IF 0 != f_InsertRtre5040( v_Period,         CUR_0108.ORD_NO,   CUR_0108.CUST_NO, CUR_0108.ORD_AGENT,
                                          CUR_0108.CHAN_CD, 'A5',  CUR_0108.MAT_CD,  CUR_0108.CNT_CD,
                                          v_Svc_Amt,      0, 0, 0,
                                          'Y', CUR_0108.PROC_DAY, v_Reg_Id, v_ErrorText
                                         ) THEN
                    v_Return_Message := '서비스 판매수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
            END IF;
            
            -- 판매장려수수료 집계등록 [20190611_01]
            IF v_Inctv_Amt > 0 THEN
                IF 0 != f_InsertRtre5040( v_Period,         CUR_0108.ORD_NO,   CUR_0108.CUST_NO, CUR_0108.ORD_AGENT,
                                          CUR_0108.CHAN_CD, 'A6',  CUR_0108.MAT_CD,  CUR_0108.CNT_CD,
                                          v_Inctv_Amt,      0, 0, 0,
                                          'Y', CUR_0108.PROC_DAY, v_Reg_Id, v_ErrorText
                                         ) THEN
                    v_Return_Message := '판매장려수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
            END IF;

--        END IF;

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
        v_Return_Message := '마감월('||v_Period||') : 처리건이 존재하지 않습니다!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_CreateRtre5040AgencyComm(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtsd0108%ISOPEN THEN
            CLOSE Cur_Rtsd0108;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5040.p_CreateRtre5040AgencyComm(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5040AgencyComm_1;
  
END Pkg_Rtre5040;
/