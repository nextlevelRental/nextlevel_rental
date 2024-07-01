CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0060 AS
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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 휴일관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0060 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_H_Fdate        IN RTCM0060.H_DATE%TYPE,         /*일자FROM              */
    v_H_Tdate        IN RTCM0060.H_DATE%TYPE,         /*일자TO                */
    v_Holi_Desc      IN RTCM0060.HOLI_DESC%TYPE       /*공휴일내용            */
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 휴일관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0060 (
    v_H_Date         IN RTCM0060.H_DATE%TYPE,         /*일자                  */
    v_H_Gubun        IN RTCM0060.H_GUBUN%TYPE,        /*달력구분              */
    v_Reg_Id         IN RTCM0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

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
    );

  /*****************************************************************************
  -- 휴일관리 - 두 기간 사이의 영업일 건수 구하기
  *****************************************************************************/
  FUNCTION f_sRtcm0060OffDayCount(
    v_From           IN VARCHAR,                        /*FROM DAY            */
    v_TO_Day         IN VARCHAR                         /*TOO DAY             */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 휴일관리 - 영업일 기준으로 STD_DAY로부터 DAYS 떨어진 날짜를 찾는 함수임.
  *****************************************************************************/
  FUNCTION f_sRtcm0060BeforeAfterDay(
    v_Serch_Gb       IN VARCHAR,                        /*작업구분(-.+)       */
    v_Days           IN NUMBER,                         /*검색기간(일자)      */
    v_Std_Day        IN VARCHAR                         /*기준일자            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 휴일관리 -  Std_Day로부터 Days 이후 영업일 날짜를 찾는 함수임.(토요일 영업일 포함)
  *****************************************************************************/
  FUNCTION f_sRtcm0060AfterDay(
    v_Days           IN NUMBER,                         /*검색기간(일자)      */
    v_Std_Day        IN VARCHAR                         /*기준일자            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 휴일관리 -  판매인 장착일자 Std_Day로부터 Days 이후 영업일 여부.(토요일 영업일 포함)
  *****************************************************************************/
  FUNCTION f_sRtcm0060AfterInDay(
    v_Ord_Day        IN VARCHAR,                        /*접수일자            */
    v_Proc_Day       IN VARCHAR                         /*장착일자            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 휴일관리 -  영업관리자가 로그인한경우 첫번째 영업일 리턴
  *****************************************************************************/
  FUNCTION f_sRtcm0060firstDay(
    v_Ord_Day        IN VARCHAR                         /*접수일자            */
    ) RETURN VARCHAR;
  
  /*****************************************************************************
  -- 휴일관리 -  영업관리자가 로그인한경우 첫번째 영업일 리턴 (가변)
  *****************************************************************************/
  FUNCTION f_sRtcm0060firstDayByTerm(
    v_Ord_Day        IN VARCHAR,                        /*접수일자            */
    v_Term           IN VARCHAR                         /*영업일기준 D+v_Term            */
    ) RETURN VARCHAR;
    
END Pkg_Rtcm0060;
/