CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0042 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0042
   PURPOSE   온라인 결제 카드정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-15  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 온라인 결제 카드정보 Count
  *****************************************************************************/
  FUNCTION f_sRtre0042Count(
    v_Tno            IN RTRE0042.TNO%TYPE               /*PG거래번호          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 온라인 결제 카드정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0042 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Crd_No         IN RTRE0042.CRD_NO%TYPE,         /*카드번호              */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 온라인 결제 카드정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0042 (
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Crd_No         IN RTRE0042.CRD_NO%TYPE,         /*카드번호              */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 온라인 결제 카드정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0042 (
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Crd_No         IN RTRE0042.CRD_NO%TYPE,         /*카드번호              */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 온라인 결제 카드정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0042 (
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 온라인 결제 카드정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0042 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Tno            IN RTRE0042.TNO%TYPE,            /*PG거래번호            */
    v_Crd_No         IN RTRE0042.CRD_NO%TYPE,         /*카드번호              */
    v_Reg_Id         IN RTRE0042.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtre0042;