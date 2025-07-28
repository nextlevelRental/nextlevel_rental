CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0003 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0003
   PURPOSE   렌탈 매출원가 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-09  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 렌탈 매출원가 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0003Count(
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,           /*마감년월            */
    v_Matnr          IN RTCS0003.MATNR%TYPE             /*상품코드            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈 매출원가 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0003 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*상품수량              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*마감여부              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 렌탈 매출원가 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*상품수량              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*마감여부              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈 매출원가 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*상품수량              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*마감여부              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈 매출원가 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0003 (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈 매출원가 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0003 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*상품코드              */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*상품수량              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE,       /*마감여부              */
    v_Reg_Id         IN RTCS0003.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 렌탈 매출원가 마감여부 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0003CloseCount(
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Close_Yn       IN RTCS0003.CLOSE_YN%TYPE        /*마감여부              */
    ) RETURN NUMBER;

END Pkg_Rtcs0003;