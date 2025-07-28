CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0060 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0060
   PURPOSE:   휴일관리 관리

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 휴일관리 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0060Count(
    v_H_Date         IN RTCM0060.H_DATE%TYPE,           /*휴일관리            */
    v_H_Gubun        IN RTCM0060.H_GUBUN%TYPE           /*휴일관리            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0060
    WHERE   H_DATE  = v_H_Date
    AND     H_GUBUN = v_H_Gubun;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0060Count;

  /*****************************************************************************
  -- 휴일관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0060 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_H_Fdate        IN RTCM0060.H_DATE%TYPE,         /*일자FROM              */
    v_H_Tdate        IN RTCM0060.H_DATE%TYPE,         /*일자TO                */
    v_Holi_Desc      IN RTCM0060.HOLI_DESC%TYPE       /*공휴일내용            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.H_DATE,                    /*일자                */
            A.H_GUBUN,                   /*달력구분            */
            A.H_YEAR,                    /*년도                */
            A.H_MONTH,                   /*월                  */
            A.H_DAY,                     /*일                  */
            A.HOLI_YN,                   /*공휴일여부          */
            A.HOLI_DESC,                 /*공휴일내용          */
            A.WEEK_YN,                   /*주말여부            */
            A.REMARK,                    /*적요                */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCM0060 A
    WHERE   A.H_DATE BETWEEN v_H_Fdate AND v_H_Tdate
    AND     A.HOLI_DESC LIKE '%'||v_Holi_Desc||'%'
    AND     A.HOLI_YN = 'Y'
    AND     A.USE_YN  = 'Y'
    ORDER   BY A.H_DATE;


  END p_sRtcm0060;

  /*****************************************************************************
  -- 휴일관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0060 (
    v_H_Date         IN RTCM0060.H_DATE%TYPE,         /*일자                  */
    v_H_Gubun        IN RTCM0060.H_GUBUN%TYPE,        /*달력구분              */
    v_H_Year         IN RTCM0060.H_YEAR%TYPE,         /*년도                  */
    v_H_Month        IN RTCM0060.H_MONTH%TYPE,        /*월                    */
    v_H_Day          IN RTCM0060.H_DAY%TYPE,          /*일                    */
    v_Holi_Yn        IN RTCM0060.HOLI_YN%TYPE,        /*공휴일여부            */
    v_Holi_Desc      IN RTCM0060.HOLI_DESC%TYPE,      /*공휴일내용            */
    v_Week_Yn        IN RTCM0060.WEEK_YN%TYPE,        /*주말여부              */
    v_Remark         IN RTCM0060.REMARK%TYPE,         /*적요                  */
    v_Use_Yn         IN RTCM0060.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCM0060 (
            H_DATE,
            H_GUBUN,
            H_YEAR,
            H_MONTH,
            H_DAY,
            HOLI_YN,
            HOLI_DESC,
            WEEK_YN,
            REMARK,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_H_Date,
            v_H_Gubun,
            v_H_Year,
            v_H_Month,
            v_H_Day,
            v_Holi_Yn,
            v_Holi_Desc,
            v_Week_Yn,
            v_Remark,
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

  END f_InsertRtcm0060;

  /*****************************************************************************
  -- 휴일관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0060 (
    v_H_Date         IN RTCM0060.H_DATE%TYPE,         /*일자                  */
    v_H_Gubun        IN RTCM0060.H_GUBUN%TYPE,        /*달력구분              */
    v_H_Year         IN RTCM0060.H_YEAR%TYPE,         /*년도                  */
    v_H_Month        IN RTCM0060.H_MONTH%TYPE,        /*월                    */
    v_H_Day          IN RTCM0060.H_DAY%TYPE,          /*일                    */
    v_Holi_Yn        IN RTCM0060.HOLI_YN%TYPE,        /*공휴일여부            */
    v_Holi_Desc      IN RTCM0060.HOLI_DESC%TYPE,      /*공휴일내용            */
    v_Week_Yn        IN RTCM0060.WEEK_YN%TYPE,        /*주말여부              */
    v_Remark         IN RTCM0060.REMARK%TYPE,         /*적요                  */
    v_Use_Yn         IN RTCM0060.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0060
    SET    H_YEAR    = v_H_Year,
           H_MONTH   = v_H_Month,
           H_DAY     = v_H_Day,
           HOLI_YN   = v_Holi_Yn,
           HOLI_DESC = v_Holi_Desc,
           WEEK_YN   = v_Week_Yn,
           REMARK    = v_Remark,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  H_DATE    = v_H_Date
    AND    H_GUBUN   = v_H_Gubun;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0060;

  /*****************************************************************************
  -- 휴일관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0060 (
    v_H_Date         IN RTCM0060.H_DATE%TYPE,         /*일자                  */
    v_H_Gubun        IN RTCM0060.H_GUBUN%TYPE,        /*달력구분              */
    v_Reg_Id         IN RTCM0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTCM0060
    SET    USE_YN  = 'N',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  H_DATE  = v_H_Date
    AND    H_GUBUN = v_H_Gubun;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0060;

  /*****************************************************************************
  -- 휴일관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0060 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_H_Date         IN RTCM0060.H_DATE%TYPE,         /*일자                  */
    v_Holi_Yn        IN RTCM0060.HOLI_YN%TYPE,        /*공휴일여부            */
    v_Holi_Desc      IN RTCM0060.HOLI_DESC%TYPE,      /*공휴일내용            */
    v_Remark         IN RTCM0060.REMARK%TYPE,         /*적요                  */
    v_Use_Yn         IN RTCM0060.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_H_Gubun RTCM0060.H_GUBUN%TYPE DEFAULT 'HOLI'; -- 달력구분: 현재는 휴일(HOLI)만 관리하므로 디폴트 값 설정함
    v_H_Year  RTCM0060.H_YEAR%TYPE;                   /*년도                  */
    v_H_Month RTCM0060.H_MONTH%TYPE;                  /*월                    */
    v_H_Day   RTCM0060.H_DAY%TYPE;                    /*일                    */
    v_Week_Yn RTCM0060.WEEK_YN%TYPE;                  /*주말여부              */

  BEGIN

    -- 필수값: 일자(8), 공휴일여부, 사용여부 ,등록자 ID
    IF TRIM(v_H_Date) IS NULL THEN
        v_Return_Message := '일자('||v_H_Date||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF LENGTH(TRIM(v_H_Date)) != 8 THEN
        v_Return_Message := '일자('||v_H_Date||') : 자릿수(8) 오류로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Holi_Yn) IS NULL) OR (v_Holi_Yn NOT IN ('Y','N')) THEN
        v_Return_Message := '공휴일여부(Y,N)('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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


    v_H_Year  := SUBSTR(v_H_Date, 1, 4); /*년도 */
    v_H_Month := SUBSTR(v_H_Date, 5, 2); /*월   */
    v_H_Day   := SUBSTR(v_H_Date, 7, 2); /*일   */

    /*주말여부  */
    IF TO_CHAR(TO_DATE(v_H_Date,'YYYYMMDD'),'D') IN ('1','7') THEN
        v_Week_Yn := 'Y';
    ELSE
        v_Week_Yn := 'N';
    END IF;

    IF 0 = f_sRtcm0060Count(v_H_Date, v_H_Gubun) THEN

        IF 0 != f_InsertRtcm0060(v_H_Date, v_H_Gubun, v_H_Year,
                                 v_H_Month, v_H_Day, v_Holi_Yn, v_Holi_Desc,
                                 v_Week_Yn, v_Remark, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '휴일정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn IN ('I', 'U') THEN

            IF 0 != f_UpdateRtcm0060(v_H_Date, v_H_Gubun, v_H_Year,
                                     v_H_Month, v_H_Day, v_Holi_Yn, v_Holi_Desc,
                                     v_Week_Yn, v_Remark, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '휴일정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcm0060(v_H_Date, v_H_Gubun, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '휴일정보 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0060.p_IUDRtcm0060(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0060.p_IUDRtcm0060(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0060;


  /*****************************************************************************
  -- 휴일관리 - 두 기간 사이의 영업일 건수 구하기
  *****************************************************************************/
  FUNCTION f_sRtcm0060OffDayCount(
    v_From           IN VARCHAR,                        /*FROM DAY            */
    v_TO_Day         IN VARCHAR                         /*TOO DAY             */
    ) RETURN NUMBER IS
    v_Off_Day   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*) CNT
    INTO    v_Off_Day
    FROM    (
            SELECT TO_CHAR(SDT + LEVEL - 1, 'YYYYMMDD') DT,
                   TO_CHAR(SDT + LEVEL - 1, 'd') D
            FROM   (
                    SELECT TO_DATE(V_FROM, 'YYYYMMDD') SDT,
                           TO_DATE(V_TO_DAY, 'YYYYMMDD') EDT
                    FROM DUAL
                    )
            CONNECT BY LEVEL <= EDT - SDT + 1
            ) A,
            (
            SELECT  B.H_DATE DT
            FROM    RTCM0060 B
            WHERE   B.H_DATE BETWEEN V_FROM AND V_TO_DAY
            AND     USE_YN = 'Y'
            ) B
    WHERE   A.D NOT IN ('1', '7')
    AND     A.DT = B.DT(+)
    AND     B.DT IS NULL;

    RETURN v_Off_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0060OffDayCount;


  /*****************************************************************************
  -- 휴일관리 - 영업일 기준으로 STD_DAY로부터 DAYS 떨어진 날짜를 찾는 함수임.
  *****************************************************************************/
  FUNCTION f_sRtcm0060BeforeAfterDay(
    v_Serch_Gb       IN VARCHAR,                        /*작업구분(-.+)       */
    v_Days           IN NUMBER,                         /*검색기간(일자)      */
    v_Std_Day        IN VARCHAR                         /*기준일자            */
    ) RETURN VARCHAR IS
    v_BfAf_Day   VARCHAR(8) DEFAULT NULL;
  BEGIN


    IF 0 != ISDATE(v_Std_Day) THEN
        RETURN NULL;
    END IF;

    IF 0 > TO_NUMBER(v_Days) OR 99 < TO_NUMBER(v_Days) THEN
        RETURN NULL;
    END IF;

    IF v_Serch_Gb = '+' THEN

        SELECT  DAY
        INTO    v_BfAf_Day
        FROM    (
                SELECT  A.DAY,
                        ROWNUM RN
                FROM    (
                        SELECT  LEVEL LV,
                                TO_CHAR(SDT -1 + LEVEL , 'd') D,
                                TO_CHAR(SDT -1 + LEVEL, 'YYYYMMDD') DAY
                        FROM    (
                                SELECT  TO_DATE(v_Std_Day, 'YYYYMMDD') + 1 SDT,
                                        TO_DATE(v_Std_Day, 'YYYYMMDD') + (v_Days +100) EDT
                                FROM    DUAL
                                )
                        CONNECT BY LEVEL<= EDT - SDT + 1
                        ) A,
                        (
                        SELECT  B.H_DATE DT
                        FROM    RTCM0060 B
                        WHERE   B.H_DATE BETWEEN TO_DATE(v_Std_Day, 'YYYYMMDD') AND TO_DATE(v_Std_Day, 'YYYYMMDD') + (v_Days +100)
                        AND     USE_YN = 'Y'
                        ) B
                WHERE   A.DAY = B.DT(+)
                AND     A.D NOT IN ('1', '7')
                AND     B.DT IS NULL
                ) A
        WHERE   RN = v_Days;

    ELSIF v_Serch_Gb = '-' THEN

        SELECT  DAY
        INTO    v_BfAf_Day
        FROM    (
                SELECT  A.DAY,
                        ROWNUM RN
                FROM    (
                        SELECT  LEVEL LV,
                                TO_CHAR(EDT +1 - LEVEL, 'd') D,
                                TO_CHAR(EDT +1 - LEVEL, 'YYYYMMDD') DAY
                        FROM    (
                                SELECT  TO_DATE(v_Std_Day, 'YYYYMMDD') - (v_Days + 100) SDT,
                                        TO_DATE(v_Std_Day, 'YYYYMMDD') - 1  EDT
                                FROM    DUAL
                                )
                        CONNECT BY LEVEL<= EDT - SDT + 1
                        ) A,
                        (
                        SELECT  B.H_DATE DT
                        FROM    RTCM0060 B
                        WHERE   B.H_DATE BETWEEN TO_DATE(v_Std_Day, 'YYYYMMDD') - (v_Days + 100) AND TO_DATE(v_Std_Day, 'YYYYMMDD')
                        AND     USE_YN = 'Y'
                        ) B
                WHERE   A.DAY = B.DT(+)
                AND     A.D NOT IN ('1', '7')
                AND     B.DT IS NULL
                ) A
       WHERE    RN = v_Days;

    ELSE
        RETURN NULL;
    END IF;


    RETURN v_BfAf_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcm0060BeforeAfterDay;


  /*****************************************************************************
  -- 휴일관리 -  Std_Day로부터 Days 이후 영업일 날짜를 찾는 함수임.(토요일 영업일 포함)
  *****************************************************************************/
  FUNCTION f_sRtcm0060AfterDay(
    v_Days           IN NUMBER,                         /*검색기간(일자)      */
    v_Std_Day        IN VARCHAR                         /*기준일자            */
    ) RETURN VARCHAR IS
    v_After_Day   VARCHAR(8) DEFAULT NULL;
  BEGIN


    IF 0 != ISDATE(v_Std_Day) THEN
        RETURN NULL;
    END IF;

    IF 0 > TO_NUMBER(v_Days) OR 99 < TO_NUMBER(v_Days) THEN
        RETURN NULL;
    END IF;

    SELECT  DAY
    INTO    v_After_Day
    FROM    (
            SELECT  A.DAY,
                    ROWNUM RN
            FROM    (
                    SELECT  LEVEL LV,
                            TO_CHAR(SDT -1 + LEVEL , 'd') D,
                            TO_CHAR(SDT -1 + LEVEL, 'YYYYMMDD') DAY
                    FROM    (
                            SELECT  TO_DATE(v_Std_Day, 'YYYYMMDD') SDT,
                                    TO_DATE(v_Std_Day, 'YYYYMMDD') + (v_Days +100) EDT
                            FROM    DUAL
                            )
                    CONNECT BY LEVEL<= EDT - SDT + 1
                    ) A,
                    (
                    SELECT  B.H_DATE DT
                    FROM    RTCM0060 B
                    WHERE   B.H_DATE BETWEEN TO_DATE(v_Std_Day, 'YYYYMMDD') AND TO_DATE(v_Std_Day, 'YYYYMMDD') + (v_Days +100)
                    AND     USE_YN = 'Y'
                    ) B
            WHERE   A.DAY = B.DT(+)
            AND     A.D NOT IN ('1')
            --AND     B.DT IS NULL -- 2016-05-30 이영근, 휴일 포함
            ) A
    WHERE   RN = v_Days;

    RETURN v_After_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcm0060AfterDay;

  /*****************************************************************************
  -- 휴일관리 -  Std_Day로부터 Days 이후 영업일 날짜를 찾는 함수임.(토요일 영업일 포함)
  *****************************************************************************/
  FUNCTION f_sRtcm0060AfterInDay(
    v_Ord_Day        IN VARCHAR,                        /*접수일자            */
    v_Proc_Day       IN VARCHAR                         /*장착일자            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN


    IF 0 != ISDATE(v_Ord_Day) THEN
        RETURN NULL;
    END IF;

    IF 0 != ISDATE(v_Proc_Day) THEN
        RETURN NULL;
    END IF;

    SELECT  COUNT(DAY)
    INTO    v_curr_cunt
    FROM    (
            SELECT  A.DAY,
                    ROWNUM RN
            FROM    (
                    SELECT  LEVEL LV,
                            TO_CHAR(SDT -1 + LEVEL , 'd') D,
                            TO_CHAR(SDT -1 + LEVEL, 'YYYYMMDD') DAY
                    FROM    (
                            SELECT  TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 SDT,
                                    TO_DATE(v_Ord_Day, 'YYYYMMDD')+100 EDT
                            FROM    DUAL
                            )
                    CONNECT BY LEVEL<= EDT - SDT + 1
                    ) A
--                   ,(
--                      SELECT  B.H_DATE DT
--                      FROM    RTCM0060 B
--                      WHERE   B.H_DATE BETWEEN TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 AND TO_DATE(v_Ord_Day, 'YYYYMMDD')+100
--                      AND     USE_YN = 'Y'
--                    ) B
            WHERE   A.D NOT IN ('1')
--            AND     A.DAY = B.DT(+)
--            AND     B.DT IS NULL
            ) A
    --WHERE    RN BETWEEN 3 AND 10
    WHERE    RN BETWEEN 3 AND 20
    AND      DAY = v_Proc_Day;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0060AfterInDay;

  /*****************************************************************************
  -- 휴일관리 -  영업관리자가 로그인한경우 첫번째 영업일 리턴
  *****************************************************************************/
  FUNCTION f_sRtcm0060firstDay(
    v_Ord_Day        IN VARCHAR                         /*접수일자            */
    ) RETURN VARCHAR IS
    v_After_Day   VARCHAR(8) DEFAULT NULL;
  BEGIN


    IF 0 != ISDATE(v_Ord_Day) THEN
        RETURN NULL;
    END IF;

    SELECT  DAY
    INTO    v_After_Day
    FROM    (
            SELECT  A.DAY,
                    ROWNUM RN
            FROM    (
                    SELECT  LEVEL LV,
                            TO_CHAR(SDT -1 + LEVEL , 'd') D,
                            TO_CHAR(SDT -1 + LEVEL, 'YYYYMMDD') DAY
                    FROM    (
                            SELECT  TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 SDT,
                                    TO_DATE(v_Ord_Day, 'YYYYMMDD')+100 EDT
                            FROM    DUAL
                            )
                    CONNECT BY LEVEL<= EDT - SDT + 1
                    ) A,
                    (
                    SELECT  B.H_DATE DT
                    FROM    RTCM0060 B
                    WHERE   B.H_DATE BETWEEN TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 AND TO_DATE(v_Ord_Day, 'YYYYMMDD')+100
                    AND     USE_YN = 'Y'
                    ) B
            WHERE   A.DAY = B.DT(+)
            AND     A.D NOT IN ('1')
            AND     B.DT IS NULL
            ) A
    WHERE RN = 3;

    RETURN v_After_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcm0060firstDay;

  /*****************************************************************************
  -- 휴일관리 -  영업관리자가 로그인한경우 첫번째 영업일 리턴
  *****************************************************************************/
  FUNCTION f_sRtcm0060firstDay_Tmp(
    v_Ord_Day        IN VARCHAR                         /*접수일자            */
    ) RETURN VARCHAR IS
    v_After_Day   VARCHAR(8) DEFAULT NULL;
  BEGIN


    IF 0 != ISDATE(v_Ord_Day) THEN
        RETURN NULL;
    END IF;

    SELECT  DAY
    INTO    v_After_Day
    FROM    (
            SELECT  A.DAY,
                    ROWNUM RN
            FROM    (
                    SELECT  LEVEL LV,
                            TO_CHAR(SDT -1 + LEVEL , 'd') D,
                            TO_CHAR(SDT -1 + LEVEL, 'YYYYMMDD') DAY
                    FROM    (
                            SELECT  TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 SDT,
                                    TO_DATE(v_Ord_Day, 'YYYYMMDD')+100 EDT
                            FROM    DUAL
                            )
                    CONNECT BY LEVEL<= EDT - SDT + 1
                    ) A,
                    (
                    SELECT  B.H_DATE DT
                    FROM    RTCM0060 B
                    WHERE   B.H_DATE BETWEEN TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 AND TO_DATE(v_Ord_Day, 'YYYYMMDD')+100
                    AND     USE_YN = 'Y'
                    ) B
            WHERE   A.DAY = B.DT(+)
            AND     A.D NOT IN ('1')
            AND     B.DT IS NULL
            ) A
    WHERE RN = 2;

    RETURN v_After_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcm0060firstDay_Tmp;
  
  /*****************************************************************************
  -- 휴일관리 -  영업관리자가 로그인한경우 첫번째 영업일 리턴 (가변)
  *****************************************************************************/
  FUNCTION f_sRtcm0060firstDayByTerm(
    v_Ord_Day        IN VARCHAR,                        /*접수일자            */
    v_Term           IN VARCHAR                         /*영업일기준 D+v_Term            */
    ) RETURN VARCHAR IS
    v_After_Day   VARCHAR(8) DEFAULT NULL;
  BEGIN


    IF 0 != ISDATE(v_Ord_Day) THEN
        RETURN NULL;
    END IF;

    SELECT  DAY
    INTO    v_After_Day
    FROM    (
            SELECT  A.DAY,
                    ROWNUM RN
            FROM    (
                    SELECT  LEVEL LV,
                            TO_CHAR(SDT -1 + LEVEL , 'd') D,
                            TO_CHAR(SDT -1 + LEVEL, 'YYYYMMDD') DAY
                    FROM    (
                            SELECT  TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 SDT,
                                    TO_DATE(v_Ord_Day, 'YYYYMMDD')+100 EDT
                            FROM    DUAL
                            )
                    CONNECT BY LEVEL<= EDT - SDT + 1
                    ) A,
                    (
                    SELECT  B.H_DATE DT
                    FROM    RTCM0060 B
                    WHERE   B.H_DATE BETWEEN TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 AND TO_DATE(v_Ord_Day, 'YYYYMMDD')+100
                    AND     USE_YN = 'Y'
                    ) B
            WHERE   A.DAY = B.DT(+)
            AND     A.D NOT IN ('1')
            AND     B.DT IS NULL
            ) A
    WHERE RN = v_Term;

    RETURN v_After_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcm0060firstDayByTerm;
  
  /*****************************************************************************
  -- 휴일관리 -  Std_Day로부터 Days 이후 영업일 날짜를 찾는 함수임.(토요일 영업일 포함)
  *****************************************************************************/
  FUNCTION f_sRtcm0060AfterInDayByTerm(
    v_Ord_Day        IN VARCHAR,                        /*접수일자            */
    v_Proc_Day       IN VARCHAR,                        /*장착일자            */
    v_Term           IN VARCHAR                         /*기간               */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN


    IF 0 != ISDATE(v_Ord_Day) THEN
        RETURN NULL;
    END IF;

    IF 0 != ISDATE(v_Proc_Day) THEN
        RETURN NULL;
    END IF;

    SELECT  COUNT(DAY)
    INTO    v_curr_cunt
    FROM    (
            SELECT  A.DAY,
                    ROWNUM RN
            FROM    (
                    SELECT  LEVEL LV,
                            TO_CHAR(SDT -1 + LEVEL , 'd') D,
                            TO_CHAR(SDT -1 + LEVEL, 'YYYYMMDD') DAY
                    FROM    (
                            SELECT  TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 SDT,
                                    TO_DATE(v_Ord_Day, 'YYYYMMDD')+100 EDT
                            FROM    DUAL
                            )
                    CONNECT BY LEVEL<= EDT - SDT + 1
                    ) A
--                   ,(
--                      SELECT  B.H_DATE DT
--                      FROM    RTCM0060 B
--                      WHERE   B.H_DATE BETWEEN TO_DATE(v_Ord_Day, 'YYYYMMDD')+1 AND TO_DATE(v_Ord_Day, 'YYYYMMDD')+100
--                      AND     USE_YN = 'Y'
--                    ) B
            WHERE   A.D NOT IN ('1')
--            AND     A.DAY = B.DT(+)
--            AND     B.DT IS NULL
            ) A
    --WHERE    RN BETWEEN 3 AND 10
    WHERE    RN BETWEEN v_Term AND 20
    AND      DAY = v_Proc_Day;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0060AfterInDayByTerm;
  
END Pkg_Rtcm0060;