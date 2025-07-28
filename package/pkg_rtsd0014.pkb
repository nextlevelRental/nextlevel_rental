CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0014 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0014
   PURPOSE   계약별 캠페인 적용 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계약별 캠페인 적용 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0014Count(
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0014
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0014Count;

  /*****************************************************************************
  -- 계약별 캠페인 적용 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0014 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE          /*주문번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*주문번호            */
            A.DC_TP,                     /*할인유형            */
            A.MAT_CD,                    /*상품코드            */
            A.SEQ,                       /*순번                */
            A.DC_RATE,                   /*할인율              */
            A.DC_AMT,                    /*할인금액            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0014 A
    WHERE   A.ORD_NO = v_Ord_No;

  END p_sRtsd0014;

  /*****************************************************************************
  -- 계약별 캠페인 적용 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0014 (
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE,         /*주문번호              */
    v_Dc_Tp          IN RTSD0014.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0014.MAT_CD%TYPE,         /*상품코드              */
    v_Seq            IN RTSD0014.SEQ%TYPE,            /*순번                  */
    v_Dc_Rate        IN RTSD0014.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0014.DC_AMT%TYPE,         /*할인금액              */
    v_Reg_Id         IN RTSD0014.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0014 (
            ORD_NO,
            DC_TP,
            MAT_CD,
            SEQ,
            DC_RATE,
            DC_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Dc_Tp,
            v_Mat_Cd,
            v_Seq,
            v_Dc_Rate,
            v_Dc_Amt,
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

  END f_InsertRtsd0014;

  /*****************************************************************************
  -- 계약별 캠페인 적용 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0014 (
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE          /*주문번호              */
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0014
    WHERE  ORD_NO = v_Ord_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0014.f_DeleteRtsd0014(1)', '주문번호', v_Ord_No);

    RETURN SQLCODE;

  END f_DeleteRtsd0014;

  /*****************************************************************************
  -- 계약별 캠페인 적용 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0014 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE,         /*주문번호              */
    v_Dc_Tp          IN RTSD0014.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0014.MAT_CD%TYPE,         /*상품코드              */
    v_Seq            IN RTSD0014.SEQ%TYPE,            /*순번                  */
    v_Dc_Rate        IN RTSD0014.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0014.DC_AMT%TYPE,         /*할인금액              */
    v_Reg_Id         IN RTSD0014.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:주문번호,할인유형, 상품코드,  등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Dc_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S028', v_Dc_Tp)) THEN
        v_Return_Message := '할인유형('||v_Dc_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

--    IF (TRIM(v_Mat_Cd) IS NULL) OR (0 = Pkg_Rtsd0005.f_sRtsd0005Count(v_Mat_Cd)) THEN : 상품코드 'Z' 로 인해서 주석처리함.
--        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
    
    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_InsertRtsd0014(v_Ord_No, v_Dc_Tp, v_Mat_Cd, v_Seq, v_Dc_Rate,
                                 v_Dc_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '계약별 캠페인 적용 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
        
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0014.p_IUDRtsd0014(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0014.p_IUDRtsd0014(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0014;


  /*****************************************************************************
  -- 계약별 캠페인 저장 - 온라인
  *****************************************************************************/
  PROCEDURE p_Online_InsertRtsd0014 (
    v_Ord_No      IN RTSD0014.ORD_NO%TYPE,            /*주문번호              */
    v_Ord_Day     IN RtSD0104.ORD_DAY%TYPE,           /*접수일자              */
    v_Mat_Cd      IN RTSD0014.MAT_CD%TYPE,            /*상품코드              */
    v_Cust_No     IN RTSD0100.CUST_NO%TYPE,           /*고객번호              */
    v_Cnt_Cd      IN RTSD0008.CNT_CD%TYPE,            /*타이어본수            */
    v_Period_Cd   IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드              */
    v_Reg_Id      IN RTSD0014.REG_ID%TYPE,            /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  ) IS

  e_Error EXCEPTION;
  
  BEGIN
      
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.F_SRTSD0104COUNT(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
          
    IF TRIM(v_Ord_Day) IS NULL THEN
        v_Return_Message := '접수일자('||v_Ord_Day ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE E_ERROR;
    END IF;
          
    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
          
    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
          
    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '기간코드('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
          
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
          
    INSERT INTO RTSD0014
            (
            ORD_NO
            ,DC_TP
            ,MAT_CD
            ,SEQ
            ,DC_RATE
            ,DC_AMT
            ,REG_ID
            ,REG_DT
            ,CHG_ID
            ,CHG_DT
            )
    SELECT  v_Ord_No,
            DC_TP,
            MAT_CD,
            ROWNUM AS SEQ,
            DC_RATE,
            DC_AMT,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    (
            SELECT  DC_TP   AS DC_TP,
                    MAT_CD  AS MAT_CD,
                    DC_RATE AS DC_RATE,
                    DC_AMT   AS DC_AMT
            FROM    RTSD0009  /*캠페인(상품)체크*/
            WHERE   USE_YN = 'Y'
            AND     DC_TP  = '0001'
            AND     MAT_CD = v_Mat_Cd                      /*PARAMETER : 상품코드*/
            AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY  /*PARAMETER : 계약일자*/
            UNION   ALL
            SELECT  DC_TP    AS DC_TP,
                    MAT_CD   AS MAT_CD,
                    DC_RATE  AS DC_RATE,
                    DC_AMT   AS DC_AMT
            FROM    RTSD0009  /*고객결합 체크*/
            WHERE   USE_YN = 'Y'
            AND     MAT_CD = 'Z'
            AND     DC_TP  = '0002'
            AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY /*PARAMETER : 계약일자*/
            AND     1 < (
                        SELECT  COUNT(CUST_NO)
                        FROM    RTSD0103
                        WHERE   CUST_NO = v_Cust_No
                        AND     GRP_YN = 'Y'
                        )
            UNION   ALL
            SELECT  DC_TP    AS DC_TP,
                    MAT_CD   AS MAT_CD,
                    DC_RATE  AS DC_RATE,
                    DC_AMT   AS DC_AMT
            FROM    RTSD0009 /*캠페인(수량)체크*/
            WHERE   USE_YN = 'Y'
            AND     MAT_CD = 'Z'
            AND     DC_TP  = DECODE(v_Cnt_Cd,'01','0004','02','0005','03','0006','04','0007') /*PARAMETER : 타이어본수 코드값*/
            AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY                                     /*PARAMETER : 계약일자*/
            UNION   ALL
            SELECT  DC_TP    AS DC_TP,
                    MAT_CD   AS MAT_CD,
                    DC_RATE  AS DC_RATE,
                    DC_AMT   AS DC_AMT
            FROM    RTSD0009 /*캠페인(기간)체크*/
            WHERE   USE_YN = 'Y'
            AND     MAT_CD = 'Z'
            AND     DC_TP  = DECODE(v_Period_Cd,'12','0008','24','0009','36','0010') /*PARAMETER : 렌탈기간 코드값*/
            AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY                            /*PARAMETER : 계약일자       */
            UNION   ALL
            SELECT  DC_TP    AS DC_TP,
                    MAT_CD   AS MAT_CD,
                    DC_RATE  AS DC_RATE,
                    DC_AMT   AS DC_AMT
            FROM    RTSD0009 /*캠페인(기간)체크*/
            WHERE   USE_YN = 'Y'
            AND     MAT_CD = 'Z'
            AND     DC_TP  = '0003'
            AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY /*PARAMETER : 계약일자*/
            );

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
      Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0014.p_Online_InsertRtsd0014(1)', v_ErrorText, v_Return_Message);

  WHEN OTHERS THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := v_Return_Message;
      v_ErrorText := SUBSTR(SQLERRM, 1, 200);
      Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0014.p_Online_InsertRtsd0014(2)', v_ErrorText, v_Return_Message);

  END p_Online_InsertRtsd0014;
  
  
END Pkg_Rtsd0014;