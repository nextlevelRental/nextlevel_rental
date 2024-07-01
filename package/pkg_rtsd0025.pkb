CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0025 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0025
   PURPOSE:   할인세부정보

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-11  sePark           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 할인세부정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0025 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Dc_Gb         IN     RTSD0025.DC_GB%TYPE,         /* 할인구분코드            */
    v_Std_Str_Day   IN     RTSD0025.STD_STR_DAY%TYPE    /* 할인시작일(기준시작일   */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.DC_GB,                                                        /* 할인구분코드  */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S207', A.DC_GB) GRP_STD_NM,   /* 할인구분명    */
            TO_CHAR(TO_DATE(A.STD_STR_DAY),'YYYY-MM-DD') AS STD_STR_DAY,    /* 할인시작일    */
            A.DC_CD,                                                        /* 할인코드      */
            RTRIM(TO_CHAR(A.DC_RATE,'FM9990D99'),'.')||'%' AS DC_RATE,      /* 할인율        */
            A.DC_AMT,                                                       /* 할인금액      */
            A.MIN_CNT,                                                      /* 최소건        */
            A.MAX_CNT,                                                      /* 최대건        */
            TO_CHAR(TO_DATE(A.STD_END_DAY),'YYYY-MM-DD') AS STD_END_DAY,    /* 할인종료일    */
            A.DC_DESC,                                                      /* 비고          */
            A.REG_DT,                                                       /* 등록일        */
            A.REG_ID,                                                       /* 등록자 ID     */
            A.CHG_ID,                                                       /* 변경자 ID     */
            A.CHG_DT                                                        /* 변경일        */
    FROM    RTSD0025    A
    WHERE   A.DC_GB       = DECODE(v_Dc_Gb, NULL, A.DC_GB, v_Dc_Gb)
    AND     A.STD_STR_DAY = DECODE(v_Std_Str_Day, NULL, A.STD_STR_DAY, v_Std_Str_Day)
    AND     A.STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
    ORDER BY A.DC_CD;
  END p_sRtsd0025;

  /*****************************************************************************
  -할인상세정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0025 (
    v_Dc_Gb             IN RTSD0025.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0025.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Cd             IN RTSD0025.DC_CD%TYPE,             /* 할인코드       */
    v_Dc_Rate           IN RTSD0025.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0025.DC_AMT%TYPE,            /* 할인금액       */
    v_Min_Cnt           IN RTSD0025.MIN_CNT%TYPE,           /* 최소건         */
    v_Max_Cnt           IN RTSD0025.MAX_CNT%TYPE,           /* 최대건         */
    v_Std_End_Day       IN RTSD0025.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Desc           IN RTSD0025.DC_DESC%TYPE,           /* 비고           */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0025 (
            DC_GB,
            STD_STR_DAY,
            DC_CD,
            DC_RATE,
            DC_AMT,
            MIN_CNT,
            MAX_CNT,
            STD_END_DAY,
            DC_DESC,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Dc_Gb,
            REGEXP_REPLACE(v_Std_Str_Day,'-',''),
            v_Dc_Cd,
            v_Dc_Rate,
            v_Dc_Amt,
            v_Min_Cnt,
            v_Max_Cnt,
            REGEXP_REPLACE(v_Std_End_Day,'-',''),
            v_Dc_Desc,
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

  END f_InsertRtsd0025;

  /*****************************************************************************
  -할인상세정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0025 (
    v_Dc_Gb             IN RTSD0025.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0025.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Cd             IN RTSD0025.DC_CD%TYPE,             /* 할인코드       */
    v_Dc_Rate           IN RTSD0025.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0025.DC_AMT%TYPE,            /* 할인금액       */
    v_Min_Cnt           IN RTSD0025.MIN_CNT%TYPE,           /* 최소건         */
    v_Max_Cnt           IN RTSD0025.MAX_CNT%TYPE,           /* 최대건         */
    v_Std_End_Day       IN RTSD0025.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Desc           IN RTSD0025.DC_DESC%TYPE,           /* 비고           */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0025
    SET    DC_RATE      = v_Dc_Rate,
           DC_AMT       = v_Dc_Amt,
           MIN_CNT      = v_Min_Cnt,
           MAX_CNT      = v_Max_Cnt,
           STD_END_DAY  = REGEXP_REPLACE(v_Std_End_Day,'-',''),
           DC_DESC      = v_Dc_Desc,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  DC_GB        = v_Dc_Gb
    AND    STD_STR_DAY  = REGEXP_REPLACE(v_Std_Str_Day,'-','')
    AND    STD_END_DAY  = REGEXP_REPLACE(v_Std_End_Day,'-','')
    AND    DC_CD        = v_Dc_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0025;

  /*****************************************************************************
  -할인상세정보DB Copy
  *****************************************************************************/
  FUNCTION f_InsertRtsd0027 (
    v_Dc_Gb             IN RTSD0027.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0027.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Cd             IN RTSD0027.DC_CD%TYPE,             /* 할인코드       */
    v_Dc_Rate           IN RTSD0027.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0027.DC_AMT%TYPE,            /* 할인금액       */
    v_Min_Cnt           IN RTSD0027.MIN_CNT%TYPE,           /* 최소건         */
    v_Max_Cnt           IN RTSD0027.MAX_CNT%TYPE,           /* 최대건         */
    v_Std_End_Day       IN RTSD0027.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Desc           IN RTSD0027.DC_DESC%TYPE,           /* 비고           */
    v_Reg_Id            IN RTSD0027.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0027 (
            RTSD0027_SEQ,
            DC_GB,
            STD_STR_DAY,
            DC_CD,
            DC_RATE,
            DC_AMT,
            MIN_CNT,
            MAX_CNT,
            STD_END_DAY,
            DC_DESC,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            'SD'||LPAD(SEQ_RTSD0027RTSD0027_SEQ.NEXTVAL, 7, 0),
            v_Dc_Gb,
            REGEXP_REPLACE(v_Std_Str_Day,'-',''),
            v_Dc_Cd,
            v_Dc_Rate,
            v_Dc_Amt,
            v_Min_Cnt,
            v_Max_Cnt,
            REGEXP_REPLACE(v_Std_End_Day,'-',''),
            v_Dc_Desc,
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

  END f_InsertRtsd0027;

  /*****************************************************************************
  --할인세부정보등록(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0025 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)*/
    v_Dc_Gb             IN RTSD0025.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0025.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Cd             IN RTSD0025.DC_CD%TYPE,             /* 할인코드       */
    v_Dc_Rate           IN RTSD0025.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0025.DC_AMT%TYPE,            /* 할인금액       */
    v_Min_Cnt           IN RTSD0025.MIN_CNT%TYPE,           /* 최소건         */
    v_Max_Cnt           IN RTSD0025.MAX_CNT%TYPE,           /* 최대건         */
    v_Std_End_Day       IN RTSD0025.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Desc           IN RTSD0025.DC_DESC%TYPE,           /* 비고           */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,            /* 등록자 ID      */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

  BEGIN

    IF v_Comm_Dvsn = 'I' THEN
        IF 0 != f_InsertRtsd0025(v_Dc_Gb, v_Std_Str_Day, v_Dc_Cd, v_Dc_Rate,
                                 v_Dc_Amt, v_Min_Cnt, v_Max_Cnt, v_Std_End_Day,
                                 v_Dc_Desc, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '할인상세정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtsd0027(v_Dc_Gb, v_Std_Str_Day, v_Dc_Cd, v_Dc_Rate,
                                 v_Dc_Amt, v_Min_Cnt, v_Max_Cnt, v_Std_End_Day,
                                 v_Dc_Desc, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '할인상세정보DB Copy 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtsd0025(v_Dc_Gb, v_Std_Str_Day, v_Dc_Cd, v_Dc_Rate,
                                 v_Dc_Amt, v_Min_Cnt, v_Max_Cnt, v_Std_End_Day,
                                 v_Dc_Desc, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '할인상세정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtsd0027(v_Dc_Gb, v_Std_Str_Day, v_Dc_Cd, v_Dc_Rate,
                                 v_Dc_Amt, v_Min_Cnt, v_Max_Cnt, v_Std_End_Day,
                                 v_Dc_Desc, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '할인상세정보DB Copy 등록 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0025.p_IUDRtsd0025(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0025.p_IUDRtsd0025(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0025;


/*****************************************************************************
-- 단체할인금액
*****************************************************************************/
FUNCTION f_sRtsd0025SearchAmt(
  rest_cnt         IN RTSD0031.REST_CNT%TYPE           /* 단체번호            */
) RETURN NUMBER IS
  v_Curr_Cnt NUMBER Default 0;

  BEGIN
    SELECT NVL(DC_AMT, 0)
    INTO v_Curr_Cnt
    from RTSD0025
    WHERE DC_GB='C'
    AND     STD_STR_DAY<=to_char(sysdate,'YYYYMMDD')
    AND     MIN_CNT<=rest_cnt
    AND     MAX_CNT>=rest_cnt;

    RETURN v_Curr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRtsd0025SearchAmt;

/*****************************************************************************
 -- 단체할인금액
 *****************************************************************************/
FUNCTION f_sRtsd0025SearchRate(
  rest_cnt         IN RTSD0031.REST_CNT%TYPE           /* 단체번호            */
) RETURN NUMBER IS
  v_Curr_Cnt NUMBER Default 0;

  BEGIN
    SELECT NVL(DC_RATE, 0)
    INTO v_Curr_Cnt
    from RTSD0025
    WHERE DC_GB='C'
    AND     STD_STR_DAY<=to_char(sysdate,'YYYYMMDD')
    AND     MIN_CNT<=rest_cnt
    AND     MAX_CNT>=rest_cnt;

    RETURN v_Curr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRtsd0025SearchRate;
END Pkg_Rtsd0025;
/
