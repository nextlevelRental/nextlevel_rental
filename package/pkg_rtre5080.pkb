CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5080 AS
/*******************************************************************************
   NAME      Pkg_Rtre5080
   PURPOSE   충당금 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-24  choidh           1. Created this package body.
   1.1        2017-11-30  wjim            [20171117_02] 충당금 지급 기능 추가
*******************************************************************************/

  /*****************************************************************************
  -- 충당금 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre5080Count(
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,        /*렌탈전문점          */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,         /*충당금처리일자      */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE          /*충당금순번          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE5080
    WHERE   AGENCY_CD      = v_Agency_Cd
    AND     APFD_DAY       = v_Apfd_Day
    AND     APFD_SEQ       = v_Apfd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre5080Count;

  /*****************************************************************************
  -- 충당금 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5080 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*충당금구분            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*충당금발생금액        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*충당금차감금액        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*충당금처리 사유       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.AGENCY_CD,                 /*렌탈전문점          */
            A.APFD_DAY,                  /*충당금처리일자      */
            A.APFD_SEQ,                  /*충당금순번          */
            A.APFD_TP,                   /*충당금구분          */
            A.APFD_PAMT,                 /*충당금발생금액      */
            A.APFD_MAMT,                 /*충당금차감금액      */
            A.APFD_MSG,                  /*충당금처리 사유     */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE5080 A
    WHERE   A.AGENCY_CD        = DECODE(v_Agency_Cd      , NULL, A.AGENCY_CD       , v_Agency_Cd)
    AND     A.APFD_DAY         = DECODE(v_Apfd_Day       , NULL, A.APFD_DAY        , v_Apfd_Day)
    AND     A.APFD_SEQ         = DECODE(v_Apfd_Seq       , NULL, A.APFD_SEQ        , v_Apfd_Seq)
    AND     A.APFD_TP          = DECODE(v_Apfd_Tp        , NULL, A.APFD_TP         , v_Apfd_Tp)
    AND     A.APFD_PAMT        = DECODE(v_Apfd_Pamt      , NULL, A.APFD_PAMT       , v_Apfd_Pamt)
    AND     A.APFD_MAMT        = DECODE(v_Apfd_Mamt      , NULL, A.APFD_MAMT       , v_Apfd_Mamt)
    AND     A.APFD_MSG         = DECODE(v_Apfd_Msg       , NULL, A.APFD_MSG        , v_Apfd_Msg)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre5080;

  /*****************************************************************************
  -- 충당금 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*충당금구분            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*충당금발생금액        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*충당금차감금액        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*충당금처리 사유       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE5080 (
            AGENCY_CD,
            APFD_DAY,
            APFD_SEQ,
            APFD_TP,
            APFD_PAMT,
            APFD_MAMT,
            APFD_MSG,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Agency_Cd,
            v_Apfd_Day,
            v_Apfd_Seq,
            v_Apfd_Tp,
            v_Apfd_Pamt,
            v_Apfd_Mamt,
            v_Apfd_Msg,
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

  END f_InsertRtre5080;

  /*****************************************************************************
  -- 충당금 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*충당금구분            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*충당금발생금액        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*충당금차감금액        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*충당금처리 사유       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5080
    SET    APFD_TP          = v_Apfd_Tp,
           APFD_PAMT        = v_Apfd_Pamt,
           APFD_MAMT        = v_Apfd_Mamt,
           APFD_MSG         = v_Apfd_Msg,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  AGENCY_CD        = v_Agency_Cd
    AND    APFD_DAY         = v_Apfd_Day
    AND    APFD_SEQ         = v_Apfd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5080;

  /*****************************************************************************
  -- 충당금 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTRE5080
    WHERE  AGENCY_CD        = v_Agency_Cd
    AND    APFD_DAY         = v_Apfd_Day
    AND    APFD_SEQ         = v_Apfd_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.f_DeleteRtre5080(2)', '렌탈전문점', v_Agency_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.f_DeleteRtre5080(2)', '충당금처리일자', v_Apfd_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.f_DeleteRtre5080(2)', '충당금순번', v_Apfd_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.f_DeleteRtre5080(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre5080;

  /*****************************************************************************
  -- 충당금 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5080 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*충당금구분            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*충당금발생금액        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*충당금차감금액        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*충당금처리 사유       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 렌탈전문점, 충당금처리일자, 충당금순번, 등록자 ID
    IF (TRIM(v_Agency_Cd) IS NULL) THEN
        v_Return_Message := '렌탈전문점('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Apfd_Day) IS NULL) THEN
        v_Return_Message := '충당금처리일자('||v_Apfd_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Apfd_Seq) IS NULL) THEN
        v_Return_Message := '충당금순번('||v_Apfd_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn IN ('I','U') THEN

        IF (TRIM(v_Apfd_Tp) IS NULL) THEN
            v_Return_Message := '충당금구분('||v_Apfd_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Apfd_Pamt) IS NULL) THEN
            v_Return_Message := '충당금발생금액('||v_Apfd_Pamt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Apfd_Mamt) IS NULL) THEN
            v_Return_Message := '충당금차감금액('||v_Apfd_Mamt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'I' THEN
            IF 0 != f_InsertRtre5080( v_Agency_Cd, v_Apfd_Day,  v_Apfd_Seq,
                                      v_Apfd_Tp,   v_Apfd_Pamt, v_Apfd_Mamt, v_Apfd_Msg,
                                      v_Reg_Id,    v_ErrorText
                                    ) THEN
                v_Return_Message := '충당금 내역 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        ELSE
            IF 0 != f_UpdateRtre5080( v_Agency_Cd, v_Apfd_Day,  v_Apfd_Seq,
                                      v_Apfd_Tp,   v_Apfd_Pamt, v_Apfd_Mamt, v_Apfd_Msg,
                                      v_Reg_Id,    v_ErrorText
                                    ) THEN
                v_Return_Message := '충당금 내역 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtre5080( v_Agency_Cd, v_Apfd_Day,  v_Apfd_Seq,
                                  v_Reg_Id,    v_ErrorText
                                    ) THEN
            v_Return_Message := '충당금 내역 삭제 실패!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_IUDRtre5080(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_IUDRtre5080(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5080;


  /*****************************************************************************
  -- 충당금 설정 처리
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.1        2017-11-30  wjim             [20171117_02] 충당금 지급 기능 추가
  *****************************************************************************/
  PROCEDURE p_CreateRtre5080Allowance (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  ) IS

    -- 집계대상 조회 
    -- - [20171117_02] 에 의해 쿼리 교체
    CURSOR  Cur_Rtre5070 IS
    SELECT  A2.AGENCY_CD
         ,  A2.APFD_DAY
         ,  ROWNUM                                   AS APFD_SEQ
         ,  A2.APFD_TP
         ,  DECODE(A2.APFD_TP, 'O1', A2.APFD_AMT, 0) AS APFD_PAMT
         ,  DECODE(A2.APFD_TP, 'D1', A2.APFD_AMT, 0) AS APFD_MAMT
         ,  A2.APFD_MSG 
      FROM  (
                SELECT  A1.AGENCY_CD
                     ,  'O1'                   AS APFD_TP
                     ,  TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD') AS APFD_DAY   
                     ,  A1.MFAPFD_AMT          AS APFD_AMT
                     ,  '충당금 설정 - 수수료' AS APFD_MSG
                  FROM  RTRE5070 A1
                 WHERE  A1.SLCM_YM    = v_Period
                   AND  A1.MFAPFD_AMT > 0
                 UNION  ALL   
                SELECT  B1.AGENCY_CD
                     ,  'D1'                   AS APFD_TP
                     ,  B1.PAY_DAY             AS APFD_DAY
                     ,  B1.PAY_AMT             AS APFD_AMT
                     ,  B1.PAY_MSG             AS APFD_MSG
                  FROM  RTRE0150 B1
                 WHERE  B1.PAY_DAY LIKE v_Period||'%'
                   AND  B1.USE_YN  = 'Y'
            ) A2
     WHERE  1=1
     ORDER  BY A2.AGENCY_CD
         ,  A2.APFD_TP DESC;
     
--     -- [20171117_02] 이전
--    SELECT  A.AGENCY_CD                 AGENCY_CD,      /*판매원번호          */
--            ROWNUM                      APFD_SEQ,       /*충담금순번          */
--            A.MFAPFD_AMT                MFAPFD_AMT      /*충담금 발생금액     */
--    FROM    RTRE5070 A
--    WHERE   A.SLCM_YM = v_Period
--    AND     A.MFAPFD_AMT > 0;

    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;

    v_Apfd_Day      RTRE5080.APFD_DAY%TYPE;
    v_Apfd_Msg      RTRE5080.APFD_MSG%TYPE;

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
        FROM    RTRE5080
        WHERE   APFD_DAY BETWEEN v_Period||'01'
                             AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
        AND     APFD_PAMT > 0
        AND     ROWNUM =  1;

        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;

    IF v_curr_cunt > 0 THEN
        v_Return_Message := '마감월('||v_Period||') : 충당금 처리된 내역이 존재하여 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 판매인별 수수료 내역 집계 생성
    v_curr_cunt := 0;
--    v_Apfd_Day  := TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD'); --[20171117_02] 에 의해 미사용 처리
--    v_Apfd_Msg  := '충당금 설정 - 수수료'; --[20171117_02] 에 의해 미사용 처리

    FOR CUR_5070 IN Cur_Rtre5070 LOOP
        EXIT WHEN Cur_Rtre5070%NOTFOUND;

        v_curr_cunt  := v_curr_cunt + 1;
        
        IF 0 != f_InsertRtre5080( 
              CUR_5070.AGENCY_CD, CUR_5070.APFD_DAY , CUR_5070.APFD_SEQ
            , CUR_5070.APFD_TP  , CUR_5070.APFD_PAMT, CUR_5070.APFD_MAMT, CUR_5070.APFD_MSG
            , v_Reg_Id          , v_ErrorText
        ) THEN
            v_Return_Message := '충당금 내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

--        -- [20171117_02] 이전
--        IF 0 != f_InsertRtre5080( CUR_5070.AGENCY_CD, v_Apfd_Day,          CUR_5070.APFD_SEQ,
--                                  'O1',               CUR_5070.MFAPFD_AMT, 0, v_Apfd_Msg,
--                                  v_Reg_Id,           v_ErrorText
--                                ) THEN
--            v_Return_Message := '충당금 내역 등록 실패!!!'||'-'||v_Errortext;
--            v_Errortext := v_Errortext;
--            RAISE e_Error;
--        END IF;

    END LOOP;

    IF Cur_Rtre5070%ISOPEN THEN
        CLOSE Cur_Rtre5070;
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
        IF Cur_Rtre5070%ISOPEN THEN
            CLOSE Cur_Rtre5070;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_CreateRtre5080Allowance(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre5070%ISOPEN THEN
            CLOSE Cur_Rtre5070;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_CreateRtre5080Allowance(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5080Allowance;


  /*****************************************************************************
  -- 판매인별 충당금 현황 - 판매인별 충당금 잔액을 조회하는 기능
  *****************************************************************************/
  PROCEDURE p_sRtre5080AgencyAppStatus (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    ) IS

    v_Serch_Flag NUMBER DEFAULT 0;
    v_ErrorText  VARCHAR2(2000) DEFAULT NULL;

  BEGIN

    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '사용자 ID('||v_Reg_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_sRtre5080AgencyAppStatus(1)', v_ErrorText);
    END IF;

    -- 사용자 그룹에 따른 조회 범위 권한 체크
    v_Serch_Flag := Pkg_Rtre5070.f_sRtre5070UserInputValueCheck('Pkg_Rtre5080.p_sRtre5080AgencyAppStatus',v_Agency_Cd, v_Sales_Group, v_Sales_Office, v_Reg_Id);

    
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
    SELECT  A.SALES_GROUP                                             AS SALES_GROUP,      /*지사       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018',A.SALES_GROUP)    AS SALES_GROUP_NM,   /*지사명     */
            A.SALES_OFFICE                                            AS SALES_OFFICE,     /*지점       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019',A.SALES_OFFICE)   AS SALES_OFFICE_NM,  /*지점명     */
            A.AGENCY_CD                                               AS AGENCY_CD,        /*판매처코드 */
            A.AGENCY_NM                                               AS AGENCY_NM,        /*판매처명   */
            A.LIFNR                                                   AS LIFNR,            /*벤더코드   */
            A.APFD_AMT                                                AS APFD_AMT          /*충당금액   */
    FROM    (
            SELECT  MIN(B.SALES_GROUP)  AS SALES_GROUP,
                    MIN(B.SALES_OFFICE) AS SALES_OFFICE,
                    A.AGENCY_CD,
                    MIN(B.AGENCY_NM)    AS AGENCY_NM,
                    MIN(B.LIFNR)        AS LIFNR,
                    SUM(NVL(A.APFD_PAMT,0) - NVL(A.APFD_MAMT,0)) AS APFD_AMT,
                    MIN(B.RENTAL_GROUP) AS RENTAL_GROUP,
                    MIN(B.RENTAL_OFFICE) AS RENTAL_OFFICE
            FROM    RTRE5080 A,
                    RTVIEW02 B
            WHERE   v_Serch_Flag   = 0
            AND     A.AGENCY_CD    = B.AGENCY_CD
           -- AND     A.AGENCY_CD    = DECODE( v_Agency_Cd,    NULL, A.AGENCY_CD,    v_Agency_Cd    )
            --AND     B.SALES_GROUP  = DECODE( v_Sales_Group,  NULL, B.SALES_GROUP,  v_Sales_Group  )
            --AND     B.SALES_OFFICE = DECODE( v_Sales_Office, NULL, B.SALES_OFFICE, v_Sales_Office )
            AND     A.AGENCY_CD = CASE WHEN v_Agency_Cd IS NULL THEN A.AGENCY_CD ELSE v_Agency_Cd END
            AND     B.SALES_GROUP = CASE WHEN v_Sales_Group IS NULL THEN B.SALES_GROUP ELSE v_Sales_Group END
            AND     B.SALES_OFFICE = CASE WHEN v_Sales_Office IS NULL THEN B.SALES_OFFICE ELSE v_Sales_Office END
            GROUP   BY A.AGENCY_CD
            ) A
    ORDER BY A.RENTAL_GROUP, A.RENTAL_OFFICE, A.AGENCY_CD
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

  END p_sRtre5080AgencyAppStatus;


  /*****************************************************************************
  -- 판매인별 충당금 현황 - 충당금 발생/차감 세부 내역
  *****************************************************************************/
  PROCEDURE p_sRtre5080AgencyAppList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE       /*렌탈전문점            */
    ) IS

    v_Serch_Flag NUMBER DEFAULT 0;
    v_ErrorText  VARCHAR2(2000) DEFAULT NULL;

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.AGENCY_CD                                           AS AGENCY_CD, /*판매처코드     */
            B.AGENCY_NM                                           AS AGENCY_NM, /*판매처명       */
            A.APFD_DAY                                            AS APFD_DAY , /*충당금처리일자 */
            A.APFD_TP                                             AS APFD_TP  , /*충당금구분     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R043',A.APFD_TP)    AS APFD_NM  , /*충당금 구분명  */
            A.APFD_PAMT                                           AS APFD_PAMT, /*충당금 발생금액*/
            A.APFD_MAMT                                           AS APFD_MAMT, /*충당금 차감금액*/
            A.APFD_MSG                                            AS APFD_MSG   /*충당금처리 사유*/
    FROM    RTRE5080 A,
            RTVIEW02 B
    WHERE   A.AGENCY_CD = v_Agency_cd
    AND     A.AGENCY_CD = B.AGENCY_CD;

  END p_sRtre5080AgencyAppList;

END Pkg_Rtre5080;
/
