CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0125 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0125
   PURPOSE   [RE] 이연처리 월별내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-16  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [RE] 이연처리 월별내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0125Count(
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,           /*계약번호            */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,         /*이연항목            */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE         /*이연회차            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] 이연처리 월별내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0125 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*이연회차              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*이연상태              */
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*대상년월              */
    v_Ly_Tpp_Amt     IN RTRE0125.LY_TPP_AMT%TYPE,     /*전기말 누계액         */
    v_Cy_Pp_Amt      IN RTRE0125.CY_PP_AMT%TYPE,      /*당기 처리액           */
    v_Cy_Tpp_Amt     IN RTRE0125.CY_TPP_AMT%TYPE,     /*당기 총누계액         */
    v_Cm_Pp_Amt      IN RTRE0125.CM_PP_AMT%TYPE,      /*당월 처리액           */
    v_Cm_R_Amt       IN RTRE0125.CM_R_AMT%TYPE,       /*당월 잔존가액         */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- [RE] 이연처리 월별내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0125 (
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*이연회차              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*이연상태              */
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*대상년월              */
    v_Ly_Tpp_Amt     IN RTRE0125.LY_TPP_AMT%TYPE,     /*전기말 누계액         */
    v_Cy_Pp_Amt      IN RTRE0125.CY_PP_AMT%TYPE,      /*당기 처리액           */
    v_Cy_Tpp_Amt     IN RTRE0125.CY_TPP_AMT%TYPE,     /*당기 총누계액         */
    v_Cm_Pp_Amt      IN RTRE0125.CM_PP_AMT%TYPE,      /*당월 처리액           */
    v_Cm_R_Amt       IN RTRE0125.CM_R_AMT%TYPE,       /*당월 잔존가액         */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] 이연처리 월별내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0125 (
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*이연회차              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*이연상태              */
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*대상년월              */
    v_Ly_Tpp_Amt     IN RTRE0125.LY_TPP_AMT%TYPE,     /*전기말 누계액         */
    v_Cy_Pp_Amt      IN RTRE0125.CY_PP_AMT%TYPE,      /*당기 처리액           */
    v_Cy_Tpp_Amt     IN RTRE0125.CY_TPP_AMT%TYPE,     /*당기 총누계액         */
    v_Cm_Pp_Amt      IN RTRE0125.CM_PP_AMT%TYPE,      /*당월 처리액           */
    v_Cm_R_Amt       IN RTRE0125.CM_R_AMT%TYPE,       /*당월 잔존가액         */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] 이연처리 월별내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0125 (
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*이연회차              */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [RE] 이연처리 월별내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0125 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*이연회차              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*이연상태              */
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*대상년월              */
    v_Ly_Tpp_Amt     IN RTRE0125.LY_TPP_AMT%TYPE,     /*전기말 누계액         */
    v_Cy_Pp_Amt      IN RTRE0125.CY_PP_AMT%TYPE,      /*당기 처리액           */
    v_Cy_Tpp_Amt     IN RTRE0125.CY_TPP_AMT%TYPE,     /*당기 총누계액         */
    v_Cm_Pp_Amt      IN RTRE0125.CM_PP_AMT%TYPE,      /*당월 처리액           */
    v_Cm_R_Amt       IN RTRE0125.CM_R_AMT%TYPE,       /*당월 잔존가액         */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- [RE] 이연처리 월별내역 중도변경 UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtre0125Postpone (
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Seq      IN RTRE0125.POSTP_SEQ%TYPE,      /*이연회차              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*이연상태              */
    v_Reg_Id         IN RTRE0125.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- [RE] 이연처리 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0125MaxSeq(
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,           /*계약번호            */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE          /*이연항목            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 이연처리 내역 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0125Postpone (
    Ref_Cursor       OUT SYS_REFCURSOR,
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*대상년월              */
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*이연상태              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 이연처리 내역 조회 - 부분범위처리를 위해 page 처리
  *****************************************************************************/
  PROCEDURE p_sRtre0125PostponePage (
    Ref_Cursor       OUT SYS_REFCURSOR,
    v_Postp_Ym       IN RTRE0125.POSTP_YM%TYPE,       /*대상년월              */
    v_Ord_No         IN RTRE0125.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Stat     IN RTRE0125.POSTP_STAT%TYPE,     /*이연상태              */
    v_Page_No        IN NUMBER,                       /*페이지                */
    v_Get_Cnt        IN NUMBER,                       /*획득건수              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 마감 내역 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0125Close (
    Ref_Cursor       OUT SYS_REFCURSOR,
    v_Close_Ym       IN VARCHAR2,                     /*마감년월              */
    v_Close_Tp       IN VARCHAR2,                     /*마감구분              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


END Pkg_Rtre0125;
/
