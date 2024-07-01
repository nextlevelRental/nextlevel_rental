CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0021 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0020
   PURPOSE:   판매제품정보

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-10-22      sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- 판매주제품(타이어) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0021 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0021.SALE_CD%TYPE,         /* 판매코드  */
    v_Gds_Gb        IN     RTSD0021.GDS_GB%TYPE           /* 제품구분  */
  );

  /*****************************************************************************
  -- 판매부가제품(결합상품) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0021SaleProd (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0021.SALE_CD%TYPE,         /* 판매코드  */
    v_Gds_Gb        IN     RTSD0021.GDS_GB%TYPE           /* 제품구분  */
  );
  
  /*****************************************************************************
  -판매제품정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0021 (
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* 제품군 */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -판매제품정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0021 (
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* 제품군 */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -판매제품정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0021 (
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* 제품군 */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  --판매제품정보 (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0021 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)*/
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* 제품군 */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* 등록자 ID      */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  );            

  /*****************************************************************************
  -- 판매제품정보 제품구분에 따른 삭제
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0021DeleteGdsGb(
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );        
END Pkg_Rtsd0021;
/
