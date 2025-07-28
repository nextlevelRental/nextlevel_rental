CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0120 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0120
   PURPOSE   사용자구매전제조사정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-06  kimhanna         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 사용자구매전제조사정보 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0120Count(
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자구매전제조사정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0120 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 사용자구매전제조사정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0120 (
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자구매전제조사정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0120 (
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자구매전제조사정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0120 (
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자구매전제조사정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0120 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0120.ORD_NO%TYPE,         /*주문번호              */
    v_Mf_Cd          IN RTCS0120.MF_CD%TYPE,          /*제조사코드            */
    v_Model_Nm       IN RTCS0120.MODEL_NM%TYPE,       /*모델명                */
    v_Width_Cd       IN RTCS0120.WIDTH_CD%TYPE,       /*단면폭                */
    v_Ratio_Cd       IN RTCS0120.RATIO_CD%TYPE,       /*편평비                */
    v_Inch_Cd        IN RTCS0120.INCH_CD%TYPE,        /*인치                  */
    v_Reg_Id         IN RTCS0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtcs0120;