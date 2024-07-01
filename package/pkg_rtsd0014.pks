CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0014 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0014
   PURPOSE   계약별 캠페인 적용 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계약별 캠페인 적용 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0014Count(
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 캠페인 적용 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0014 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE          /*주문번호              */
    );

  /*****************************************************************************
  -- 계약별 캠페인 적용 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0014 (
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE,         /*주문번호              */
    v_Dc_Tp          IN RTSD0014.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0014.MAT_CD%TYPE,         /*상품코드              */
    v_Seq            IN RTSD0014.SEQ%TYPE,            /*순번                  */
    v_Dc_Rate        IN RTSD0014.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0014.DC_AMT%TYPE,         /*할인금액              */
    v_Reg_Id         IN RTSD0014.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 캠페인 적용 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0014 (
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE          /*주문번호              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 캠페인 적용 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0014 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0014.ORD_NO%TYPE,         /*주문번호              */
    v_Dc_Tp          IN RTSD0014.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0014.MAT_CD%TYPE,         /*상품코드              */
    v_Seq            IN RTSD0014.SEQ%TYPE,            /*순번                  */
    v_Dc_Rate        IN RTSD0014.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0014.DC_AMT%TYPE,         /*할인금액              */
    v_Reg_Id         IN RTSD0014.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약별 캠페인 저장 - 온라인
  *****************************************************************************/
  PROCEDURE p_Online_InsertRtsd0014 (
    v_Ord_No      IN RTSD0014.ORD_NO%TYPE,          /*주문번호              */
    v_Ord_Day     IN RtSD0104.ORD_DAY%TYPE,         /*접수일자              */
    v_Mat_Cd      IN RTSD0014.MAT_CD%TYPE,          /*상품코드              */
    v_Cust_No     IN RTSD0100.CUST_NO%TYPE,         /*고객번호              */
    v_Cnt_Cd      IN RTSD0008.CNT_CD%TYPE,          /*타이어본수            */
    v_Period_Cd   IN RTSD0008.PERIOD_CD%TYPE,       /*기간코드              */
    v_Reg_Id      IN RTSD0014.REG_ID%TYPE,          /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
  
  
END Pkg_Rtsd0014;
/
