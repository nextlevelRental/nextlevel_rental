CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0024 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0024
   PURPOSE:   할인등록

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-10-12   sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- 할인등록 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0024 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Dc_Gb         IN     RTSD0024.DC_GB%TYPE     /* 할인구분코드            */
  );
        
  /*****************************************************************************
  -할인등록 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0024 (
    v_Dc_Gb             IN RTSD0024.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0024.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Rate           IN RTSD0024.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0024.DC_AMT%TYPE,            /* 할인금액       */
    v_Mlt_Dc_Yn         IN RTSD0024.MLT_DC_YN%TYPE,         /* 중복할인여부   */
    v_Std_End_Day       IN RTSD0024.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* 할인상세여부   */
    v_Reg_Id            IN RTSD0024.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER; 
    
  /*****************************************************************************
  -할인등록 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0024 (
    v_Dc_Gb             IN RTSD0024.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0024.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Rate           IN RTSD0024.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0024.DC_AMT%TYPE,            /* 할인금액       */
    v_Mlt_Dc_Yn         IN RTSD0024.MLT_DC_YN%TYPE,         /* 중복할인여부   */
    v_Std_End_Day       IN RTSD0024.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* 할인상세여부   */
    v_Reg_Id            IN RTSD0024.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;    

  /*****************************************************************************
  -할인등록DB Copy
  *****************************************************************************/
  FUNCTION f_InsertRtsd0026 (
    v_Dc_Gb             IN RTSD0026.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0026.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Rate           IN RTSD0026.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0026.DC_AMT%TYPE,            /* 할인금액       */
    v_Mlt_Dc_Yn         IN RTSD0026.MLT_DC_YN%TYPE,         /* 중복할인여부   */
    v_Std_End_Day       IN RTSD0026.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* 할인상세여부   */
    v_Reg_Id            IN RTSD0026.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  --할인등록(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0024 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)*/
    v_Dc_Gb             IN RTSD0024.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0024.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Rate           IN RTSD0024.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0024.DC_AMT%TYPE,            /* 할인금액       */
    v_Mlt_Dc_Yn         IN RTSD0024.MLT_DC_YN%TYPE,         /* 중복할인여부   */
    v_Std_End_Day       IN RTSD0024.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* 할인상세여부   */
    v_Reg_Id            IN RTSD0024.REG_ID%TYPE,            /* 등록자 ID      */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 재랜탈 등록비 할인율
  *****************************************************************************/
  FUNCTION f_regiAmtRt
  RETURN VARCHAR;    
    
END Pkg_Rtsd0024;
/
