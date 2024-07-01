CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0025 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0025
   PURPOSE:   할인세부정보

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-10-11      sePark       1. Created this package.
******************************************************************************/

  PROCEDURE p_sRtsd0025 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Dc_Gb         IN     RTSD0025.DC_GB%TYPE,     /* 할인구분코드            */
    v_Std_Str_Day   IN     RTSD0025.STD_STR_DAY%TYPE     /* 할인시작일(기준시작일   */
  );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

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
    );


/*****************************************************************************
-- 단쳏할인금액
*****************************************************************************/
FUNCTION f_sRtsd0025SearchAmt(
  rest_cnt         IN RTSD0031.REST_CNT%TYPE           /* 단체번호            */
) RETURN NUMBER;

/*****************************************************************************
-- 단체할인율
*****************************************************************************/
FUNCTION f_sRtsd0025SearchRate(
  rest_cnt         IN RTSD0031.REST_CNT%TYPE           /* 단체번호            */
) RETURN NUMBER;

END Pkg_Rtsd0025;
/
