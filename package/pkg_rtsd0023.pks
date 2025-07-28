CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0023 AS
/*******************************************************************************
   NAME:      PKG_RTSD0023
   PURPOSE:   부가제품 등록 Spec

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-11  Sean             1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 부가제품 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0023 (
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_ADD_GDS_NM   RTSD0023.ADD_GDS_NM%TYPE,
    v_MAKER_NM     RTSD0023.MAKER_NM%TYPE,
    v_USE_YN       RTSD0023.USE_YN%TYPE
  );

  /*****************************************************************************
  -- 부가제품 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0023 (
    v_ADD_GDS_CD  IN OUT RTSD0023.ADD_GDS_CD%TYPE, 
    v_ADD_GDS_NM  IN RTSD0023.ADD_GDS_NM%TYPE, 
    v_AMT         IN RTSD0023.AMT%TYPE,        
    v_MAKER_NM    IN RTSD0023.MAKER_NM%TYPE,   
    v_GDS_GB      IN RTSD0023.GDS_GB%TYPE,     
    v_GDS_DESC    IN RTSD0023.GDS_DESC%TYPE,   
    v_GDS_DESC_DT IN RTSD0023.GDS_DESC_DT%TYPE,
    v_REG_ID      IN RTSD0023.REG_ID%TYPE,     
    v_GDS_GRP     IN RTSD0023.GDS_GRP%TYPE,    
    v_USE_YN      IN RTSD0023.USE_YN%TYPE,     
    v_DC_AMT      IN RTSD0023.DC_AMT%TYPE,
    v_DC_YN       IN RTSD0023.DC_YN%TYPE,    
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 부가제품 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0023 (
    v_ADD_GDS_CD  IN RTSD0023.ADD_GDS_CD%TYPE, 
    v_ADD_GDS_NM  IN RTSD0023.ADD_GDS_NM%TYPE, 
    v_AMT         IN RTSD0023.AMT%TYPE,        
    v_MAKER_NM    IN RTSD0023.MAKER_NM%TYPE,   
    v_GDS_GB      IN RTSD0023.GDS_GB%TYPE,     
    v_GDS_DESC    IN RTSD0023.GDS_DESC%TYPE,   
    v_GDS_DESC_DT IN RTSD0023.GDS_DESC_DT%TYPE, 
    v_REG_ID      IN RTSD0023.REG_ID%TYPE,     
    v_GDS_GRP     IN RTSD0023.GDS_GRP%TYPE,    
    v_USE_YN      IN RTSD0023.USE_YN%TYPE,     
    v_DC_AMT      IN RTSD0023.DC_AMT%TYPE,
    v_DC_YN       IN RTSD0023.DC_YN%TYPE,    
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 부가제품 순번채번
  *****************************************************************************/
  FUNCTION f_sRTSD0023MaxSeq(
    v_ADD_GDS_NM  IN RTSD0023.ADD_GDS_NM%TYPE
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- 부가제품 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0023 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_ADD_GDS_CD     IN OUT RTSD0023.ADD_GDS_CD%TYPE, 
    v_ADD_GDS_NM     IN RTSD0023.ADD_GDS_NM%TYPE, 
    v_AMT            IN RTSD0023.AMT%TYPE,        
    v_MAKER_NM       IN RTSD0023.MAKER_NM%TYPE,   
    v_GDS_GB         IN RTSD0023.GDS_GB%TYPE,     
    v_GDS_DESC       IN RTSD0023.GDS_DESC%TYPE,   
    v_GDS_DESC_DT    IN RTSD0023.GDS_DESC_DT%TYPE,
    v_REG_ID         IN RTSD0023.REG_ID%TYPE,     
    v_GDS_GRP        IN RTSD0023.GDS_GRP%TYPE,    
    v_USE_YN         IN RTSD0023.USE_YN%TYPE,     
    v_DC_AMT         IN RTSD0023.DC_AMT%TYPE,
    v_DC_YN       IN RTSD0023.DC_YN%TYPE,    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 부가제품 관리 Count
  *****************************************************************************/
  FUNCTION f_sRTSD0023Count(
    v_ADD_GDS_CD  IN RTSD0023.ADD_GDS_CD%TYPE
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 부가제품추가팝업 조회 Select(Deprecated)
  *****************************************************************************/
  PROCEDURE p_sRTSD0023_pop(
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_ADD_GDS_NM   RTSD0023.ADD_GDS_NM%TYPE
  );

  /*****************************************************************************
  -- 부가제품추가팝업 조회 Select(2018.11.14)
  *****************************************************************************/
  PROCEDURE p_sRTSD0023_popNew(
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_ADD_GDS_NM   RTSD0023.ADD_GDS_NM%TYPE,
    v_SALE_CD      RTSD0021.SALE_CD%TYPE
  );

  /*****************************************************************************
  -- 주문번호별 부가제품 조회 
  *****************************************************************************/
  PROCEDURE p_sRTSD0023Sel(
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_Ord_No       IN RTSD0041.ORD_NO%TYPE              /*계약번호            */ 
  );
END PKG_RTSD0023;