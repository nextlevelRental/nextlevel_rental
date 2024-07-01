CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0009 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0009
   PURPOSE   기간별 할인 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-07  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 기간별 할인 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0009Count(
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,            /*할인유형            */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,           /*상품코드            */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE           /*가격적용 시작일     */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0009
    WHERE   DC_TP   = v_Dc_Tp
    AND     MAT_CD  = v_Mat_Cd
    AND     STR_DAY = v_Str_Day;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0009Count;

  /*****************************************************************************
  -- 기간별 할인 관리 Select - 캠페인 등록 내역 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0009 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Stand_Day      IN RTSD0009.STR_DAY%TYPE         /*기준일                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.DC_TP,                     /*할인유형            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S028', A.DC_TP) DC_TP_NM,     /*할인유형     */
            A.MAT_CD,                    /*상품코드            */
            NVL(Pkg_Rtsd0005.f_sRtsd0005MatName(A.MAT_CD),'전체 상품') AS MAT_NM, /*상품명*/
            A.STR_DAY,                   /*가격적용 시작일     */
            A.END_DAY,                   /*가격적용 완료일     */
            A.DC_RATE,                   /*할인율              */
            A.DC_AMT,                    /*할인금액            */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0009 A
    WHERE   A.DC_TP  = v_Dc_Tp
    AND     A.MAT_CD = DECODE(v_Mat_Cd, NULL, A.MAT_CD, v_Mat_Cd)
    AND     v_Stand_Day BETWEEN A.STR_DAY AND A.END_DAY;

  END p_sRtsd0009;

  /*****************************************************************************
  -- 기간별 할인 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0009 (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Dc_Rate        IN RTSD0009.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0009.DC_AMT%TYPE,         /*할인금액              */
    v_Use_Yn         IN RTSD0009.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0009 (
            DC_TP,
            MAT_CD,
            STR_DAY,
            END_DAY,
            DC_RATE,
            DC_AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Dc_Tp,
            v_Mat_Cd,
            v_Str_Day,
            v_End_Day,
            v_Dc_Rate,
            v_Dc_Amt,
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

  END f_InsertRtsd0009;

  /*****************************************************************************
  -- 기간별 할인 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0009 (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Dc_Rate        IN RTSD0009.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0009.DC_AMT%TYPE,         /*할인금액              */
    v_Use_Yn         IN RTSD0009.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0009
    SET    END_DAY = v_End_Day,
           DC_RATE = v_Dc_Rate,
           DC_AMT  = v_Dc_Amt,
           USE_YN  = v_Use_Yn,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  DC_TP   = v_Dc_Tp
    AND    MAT_CD  = v_Mat_Cd
    AND    STR_DAY = v_Str_Day;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0009;

  /*****************************************************************************
  -- 기간별 할인 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0009 (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0009
    SET    USE_YN  = 'Y',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  DC_TP   = v_Dc_Tp
    AND    MAT_CD  = v_Mat_Cd
    AND    STR_DAY = v_Str_Day;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0009;

  /*****************************************************************************
  -- 기간별 할인 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0009 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Dc_Rate        IN RTSD0009.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0009.DC_AMT%TYPE,         /*할인금액              */
    v_Use_Yn         IN RTSD0009.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 할인유형, 상품코드, 가격적용 시작일, 가격적용 완료일, 순번, 할인율, 할인금액, 사용여부, 등록자 ID
    IF (TRIM(v_Dc_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S028', v_Dc_Tp)) THEN
        v_Return_Message := '할인유형('||v_Dc_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Str_Day) IS NULL THEN
        v_Return_Message := '가격적용 시작일('||v_Str_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_End_Day) IS NULL THEN
        v_Return_Message := '가격적용 완료일('||v_End_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Dc_Rate) IS NULL) AND (TRIM(v_Dc_Amt) IS NULL) THEN
        v_Return_Message := '할인율/할인금액('||v_Dc_Rate||'/'||v_Dc_Amt||') : 할인율과 할인금액 하나는 반듯이 입력되어야 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Use_Yn) IS NULL) OR (v_Use_Yn NOT IN ('Y','N')) THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 해당 제품(모든)과 할인율 기간에 등록된 오더가 이미 존재하면 에러처리함
    IF 0 != f_sRtsd0009OrdCount(v_Mat_Cd, v_Str_Day, v_End_Day) THEN
        v_Return_Message := '해당건('||v_Mat_Cd||'-'||v_Str_Day||'-'||v_End_Day||')으로 이미 접수된 건이 있습니다. 할인내역 등록/수정/삭제 불가합니다.!!!';
        RAISE e_Error;
    END IF;

    -- 이후일자 데이터가 존재하면 에러처리(이후 데이터를  삭제처리 후 등록 가능)
    IF 0 != f_sRtsd0009NextCount(v_Dc_Tp, v_Mat_Cd, v_Str_Day) THEN
        v_Return_Message := '해당 적용일자 이후에 이미 캠패인 할인율 데이터이 존재하므로 처리가 불가합니다(이후 데이터 삭제처리 후 가능함).!!!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        -- 신규로 등록을 시도하더라도 기존 데이터가 있으면 업데이트함
        IF 0 < f_sRtsd0009Count(v_Dc_Tp, v_Mat_Cd, v_Str_Day) THEN

            IF 0 != f_UpdateRtsd0009(v_Dc_Tp, v_Mat_Cd, v_Str_Day, v_End_Day,
                                     v_Dc_Rate, v_Dc_Amt, v_Use_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기간별 할인 정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE

            IF 0 != f_InsertRtsd0009(v_Dc_Tp, v_Mat_Cd, v_Str_Day, v_End_Day,
                                     v_Dc_Rate, v_Dc_Amt, v_Use_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기간별 할인 정보 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;
        END IF;

        -- 이전일자 데이터가 존재하면 이전 완료일을 현재 시작일로 업데이트
        IF 0 != f_UpdateRtsd0009Before(v_Dc_Tp, v_Mat_Cd, v_Str_Day, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '이전 할인율의 완료일 업데이트 실패!!!';
            RAISE e_Error;
        END IF;

    ELSE
    
        IF 0 = f_sRtsd0009Count(v_Dc_Tp, v_Mat_Cd, v_Str_Day) THEN
            v_Return_Message := '해당건('||v_Dc_Tp||'-'||v_Mat_Cd||'-'||v_Str_Day||')은 미등록 상태이므로 수정 또는 삭제가 처리 불가합니다.!!!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0009(v_Dc_Tp, v_Mat_Cd, v_Str_Day, v_End_Day,
                                     v_Dc_Rate, v_Dc_Amt, v_Use_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기간별 할인 정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0009(v_Dc_Tp, v_Mat_Cd, v_Str_Day,
                                     v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '기간별 할인 정보 삭제 실패!!!'||'-'||v_ErrorText;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0009.p_IUDRtsd0009(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0009.p_IUDRtsd0009(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0009;

  /*****************************************************************************
  -- 기간별 할인 관리 Count - 해당 할인율로 등록된 오더 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0009OrdCount(
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE         /*가격적용 완료일       */
    ) RETURN NUMBER IS
    v_Ord_Count   NUMBER DEFAULT NULL;
  BEGIN


    SELECT  COUNT(*)
    INTO    v_Ord_Count
    FROM    RTSD0104 A,
            RTSD0106 B
    WHERE   A.ORD_DAY BETWEEN v_Str_Day AND v_End_Day
    AND     A.ORD_NO = B.ORD_NO
    AND     (v_Mat_Cd = 'Z' OR B.MAT_CD = v_Mat_Cd);

    RETURN v_Ord_Count;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0009OrdCount;


  /*****************************************************************************
  -- 기간별 할인 관리 Count -  시작일 기준 이후 데이터 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0009NextCount(
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE         /*가격적용 시작일       */
    ) RETURN NUMBER IS
    v_Next_Count   NUMBER DEFAULT NULL;
  BEGIN


    SELECT  COUNT(*)
    INTO    v_Next_Count
    FROM    RTSD0009 A
    WHERE   A.DC_TP   = v_Dc_Tp
    AND     A.MAT_CD  = v_Mat_Cd
    AND     A.STR_DAY > v_Str_Day
    AND     A.USE_YN  = 'Y';

    RETURN v_Next_Count;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0009NextCount;


  /*****************************************************************************
  -- 기간별 할인 관리 Update - 이전 할인율 완료일 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0009Before (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0009
    SET    END_DAY  = TO_CHAR(TO_DATE(v_Str_Day,'YYYYMMDD')-1,'YYYYMMDD'),
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  (DC_TP, MAT_CD, STR_DAY) = (
            SELECT DC_TP, MAT_CD, MAX(STR_DAY) STR_DAY
            FROM   RTSD0009
            WHERE  DC_TP    = v_Dc_Tp
            AND    MAT_CD   = v_Mat_Cd
            AND    STR_DAY  < v_Str_Day
            AND    USE_YN   = 'Y'
            GROUP  BY DC_TP, MAT_CD
           )
    AND    USE_YN  = 'Y';

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0009Before;


  /*****************************************************************************
  -- 계약등록 - 할인금액계산 조회
  *****************************************************************************/
  PROCEDURE p_SELECTrateAmt0009(
      Ref_Cursor    IN OUT SYS_REFCURSOR,
      v_Mat_Cd      IN RTSD0008.MAT_CD%TYPE,        /*상품코드*/
      v_Cust_No     IN RTSD0100.CUST_NO%TYPE,       /*고객번호*/
      v_Cnt_Cd      IN RTSD0008.CNT_CD%TYPE,        /*타이어본수*/
      v_Period_Cd   IN RTSD0008.PERIOD_CD%TYPE,     /*기간코드*/
      v_Rent_Amt    IN RTSD0008.AMT%TYPE,           /*금액*/
      v_Ord_Day     IN RtSD0104.ORD_DAY%TYPE        /*접수일자*/
  ) IS
  BEGIN
        OPEN Ref_Cursor FOR
        WITH rateAmt AS
        (

            SELECT
                       TRUNC( (v_Rent_Amt * SUM(DC_RATE_1) ) / 100, -2 )
                      +TRUNC( (v_Rent_Amt * SUM(DC_RATE_3) ) / 100, -2 )
                      +TRUNC( (v_Rent_Amt * SUM(DC_RATE_4) ) / 100, -2 )          AS C_DCRATE
                    ,  SUM(DC_AMT_1)+SUM(DC_AMT_3)+SUM(DC_AMT_4)                  AS C_DCAMT


                    ,  SUM(DC_RATE_2)                                             AS G_DCRATE
                    ,  CASE WHEN SUM(DC_RATE_2) != 0 THEN TRUNC( (v_Rent_Amt * SUM(DC_RATE_2) ) / 100, -2 )
                                                     ELSE SUM(DC_AMT_2)
                                                     END                          AS G_DCAMT


                    ,  SUM(DC_RATE_5)                                             AS L_DCRATE
                    ,  CASE WHEN SUM(DC_RATE_5) != 0 THEN TRUNC( (v_Rent_Amt * SUM(DC_RATE_5) ) / 100, -2 )
                                                     ELSE SUM(DC_AMT_5)
                                                     END                          AS L_DCAMT
            FROM
            (
                      SELECT
                               DC_RATE        AS DC_RATE_1
                              ,0              AS DC_RATE_2
                              ,0              AS DC_RATE_3
                              ,0              AS DC_RATE_4
                              ,0              AS DC_RATE_5
                              ,DC_AMT         AS DC_AMT_1
                              ,0              AS DC_AMT_2
                              ,0              AS DC_AMT_3
                              ,0              AS DC_AMT_4
                              ,0              AS DC_AMT_5
                      FROM RTSD0009                                       /*캠페인(상품)체크*/
                      WHERE   USE_YN = 'Y'
                      AND     DC_TP = '0001'
                      AND     MAT_CD = v_Mat_Cd                           /*PARAMETER : 상품코드*/
                      AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY       /*PARAMETER : 계약일자*/

                      UNION ALL

                      SELECT
                               0              AS DC_RATE_1
                              ,DC_RATE        AS DC_RATE_2
                              ,0              AS DC_RATE_3
                              ,0              AS DC_RATE_4
                              ,0              AS DC_RATE_5
                              ,0              AS DC_AMT_1
                              ,DC_AMT         AS DC_AMT_2
                              ,0              AS DC_AMT_3
                              ,0              AS DC_AMT_4
                              ,0              AS DC_AMT_5
                      FROM RTSD0009                                       /*고객결합 체크*/
                      WHERE   USE_YN = 'Y'
                      AND     MAT_CD = 'Z'
                      AND     DC_TP = '0002'
                      AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY       /*PARAMETER : 계약일자*/
                      AND        1 < (
                                      SELECT COUNT(CUST_NO)
                                      FROM RTSD0103
                                      WHERE CUST_NO = v_Cust_No
                                      AND   GRP_YN = 'Y'
                                  )

                      UNION ALL

                      SELECT
                               0              AS DC_RATE_1
                              ,0              AS DC_RATE_2
                              ,DC_RATE        AS DC_RATE_3
                              ,0              AS DC_RATE_4
                              ,0              AS DC_RATE_5
                              ,0              AS DC_AMT_1
                              ,0              AS DC_AMT_2
                              ,DC_AMT         AS DC_AMT_3
                              ,0              AS DC_AMT_4
                              ,0              AS DC_AMT_5
                      FROM RTSD0009                                                                         /*캠페인(수량)체크*/
                      WHERE   USE_YN = 'Y'
                      AND     MAT_CD = 'Z'
                      AND     DC_TP  = DECODE(v_Cnt_Cd,'01','0004','02','0005','03','0006','04','0007')     /*PARAMETER : 타이어본수 코드값*/
                      AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY                                         /*PARAMETER : 계약일자*/

                      UNION ALL

                      SELECT
                               0              AS DC_RATE_1
                              ,0              AS DC_RATE_2
                              ,0              AS DC_RATE_3
                              ,DC_RATE        AS DC_RATE_4
                              ,0              AS DC_RATE_5
                              ,0              AS DC_AMT_1
                              ,0              AS DC_AMT_2
                              ,0              AS DC_AMT_3
                              ,DC_AMT         AS DC_AMT_4
                              ,0              AS DC_AMT_5
                      FROM RTSD0009                                                                 /*캠페인(기간)체크*/
                      WHERE   USE_YN = 'Y'
                      AND     MAT_CD = 'Z'
                      AND     DC_TP  = DECODE(v_Period_Cd,'12','0008','24','0009','36','0010')      /*PARAMETER : 렌탈기간 코드값*/
                      AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY                                 /*PARAMETER : 계약일자       */

                      UNION ALL

                      SELECT
                               0              AS DC_RATE_1
                              ,0              AS DC_RATE_2
                              ,0              AS DC_RATE_3
                              ,0              AS DC_RATE_4
                              ,DC_RATE        AS DC_RATE_5
                              ,0              AS DC_AMT_1
                              ,0              AS DC_AMT_2
                              ,0              AS DC_AMT_3
                              ,0              AS DC_AMT_4
                              ,DC_AMT         AS DC_AMT_5
                      FROM RTSD0009                                       /*캠페인(기간)체크*/
                      WHERE   USE_YN = 'Y'
                      AND     MAT_CD = 'Z'
                      AND     DC_TP  = '0003'
                      AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY       /*PARAMETER : 계약일자*/
            )
        )
        SELECT
             C_DCRATE + C_DCAMT                                                 AS C_DCAMT  /*캠페인할인금액*/
            ,CASE WHEN C_DCRATE + C_DCAMT != 0 THEN 'Y'
                                               ELSE 'N'
                                               END                              AS CAMP_YN  /*캠페인적용여부*/

            ,G_DCRATE                                                           AS G_DCRATE /*결합할인율*/
            ,G_DCAMT                                                            AS G_DCAMT  /*결합할인액*/

            ,L_DCRATE                                                           AS L_DCRATE /*제한할인율*/
            ,L_DCAMT                                                            AS L_DCAMT  /*제한할인액*/

            ,CASE WHEN C_DCRATE + C_DCAMT + G_DCAMT < L_DCAMT THEN C_DCRATE + C_DCAMT + G_DCAMT
                                                              ELSE L_DCAMT
                                                              END               AS F_DCAMT  /*최종할인액*/

            ,CASE WHEN C_DCRATE + C_DCAMT + G_DCAMT < L_DCAMT THEN v_Rent_Amt - ( C_DCRATE + C_DCAMT + G_DCAMT )
                                                              ELSE v_Rent_Amt - L_DCAMT
                                                              END               AS MON_AMT  /*최종월렌탈료*/
        FROM rateAmt;
        
  END p_SELECTrateAmt0009;


/*****************************************************************************
  -- 계약등록 - 할인금액계산 조회
  *****************************************************************************/
  PROCEDURE p_SELECTrateAmt0009Detail(
      Ref_Cursor    IN OUT SYS_REFCURSOR,
      v_Mat_Cd      IN RTSD0008.MAT_CD%TYPE,        /*상품코드*/
      v_Cust_No     IN RTSD0100.CUST_NO%TYPE,       /*고객번호*/
      v_Cnt_Cd      IN RTSD0008.CNT_CD%TYPE,        /*타이어본수*/
      v_Period_Cd   IN RTSD0008.PERIOD_CD%TYPE,     /*기간코드*/
      v_Ord_Day     IN RtSD0104.ORD_DAY%TYPE        /*접수일자*/
  ) IS
  BEGIN
        OPEN Ref_Cursor FOR
        WITH rateAmt AS
        (
          SELECT
                   DC_TP          AS DC_TP
                  ,MAT_CD         AS MAT_CD
                  ,DC_RATE        AS DC_RATE
                  ,DC_AMT         AS DC_AMT
          FROM RTSD0009                                                         /*캠페인(상품)체크*/
          WHERE   USE_YN = 'Y'
          AND     DC_TP = '0001'
          AND     MAT_CD = v_Mat_Cd                                             /*PARAMETER : 상품코드*/
          AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY                         /*PARAMETER : 계약일자*/

          UNION ALL

          SELECT
                   DC_TP          AS DC_TP
                  ,MAT_CD         AS MAT_CD
                  ,DC_RATE        AS DC_RATE
                  ,DC_AMT         AS DC_AMT
          FROM RTSD0009                                                         /*고객결합 체크*/
          WHERE   USE_YN = 'Y'
          AND     MAT_CD = 'Z'
          AND     DC_TP = '0002'
          AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY                         /*PARAMETER : 계약일자*/
          AND        1 < (
                          SELECT COUNT(CUST_NO)
                          FROM RTSD0103
                          WHERE CUST_NO = v_Cust_No
                          AND   GRP_YN = 'Y'
                      )

          UNION ALL

          SELECT
                   DC_TP          AS DC_TP
                  ,MAT_CD         AS MAT_CD
                  ,DC_RATE        AS DC_RATE
                  ,DC_AMT         AS DC_AMT
          FROM RTSD0009                                                                         /*캠페인(수량)체크*/
          WHERE   USE_YN = 'Y'
          AND     MAT_CD = 'Z'
          AND     DC_TP  = DECODE(v_Cnt_Cd,'01','0004','02','0005','03','0006','04','0007')     /*PARAMETER : 타이어본수 코드값*/
          AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY                                         /*PARAMETER : 계약일자*/

          UNION ALL

          SELECT
                   DC_TP          AS DC_TP
                  ,MAT_CD         AS MAT_CD
                  ,DC_RATE        AS DC_RATE
                  ,DC_AMT         AS DC_AMT
          FROM RTSD0009                                                                 /*캠페인(기간)체크*/
          WHERE   USE_YN = 'Y'
          AND     MAT_CD = 'Z'
          AND     DC_TP  = DECODE(v_Period_Cd,'12','0008','24','0009','36','0010')      /*PARAMETER : 렌탈기간 코드값*/
          AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY                                 /*PARAMETER : 계약일자       */

          UNION ALL

          SELECT
                   DC_TP          AS DC_TP
                  ,MAT_CD         AS MAT_CD
                  ,DC_RATE        AS DC_RATE
                  ,DC_AMT         AS DC_AMT
          FROM RTSD0009                                                         /*캠페인(기간)체크*/
          WHERE   USE_YN = 'Y'
          AND     MAT_CD = 'Z'
          AND     DC_TP  = '0003'
          AND     v_Ord_Day BETWEEN STR_DAY AND END_DAY                         /*PARAMETER : 계약일자*/
        )
        SELECT
             DC_TP
            ,MAT_CD
            ,ROWNUM AS SEQ
            ,DC_RATE
            ,DC_AMT
        FROM rateAmt;
        
        
  END p_SELECTrateAmt0009Detail;


END Pkg_Rtsd0009;
/