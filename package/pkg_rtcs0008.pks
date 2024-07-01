CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0008 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0008
   PURPOSE   서비스 처리내역 상세 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 서비스 처리내역 상세 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0008Count(
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,           /*설비번호            */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,         /*서비스 순번         */
    v_Seq            IN RTCS0008.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 처리내역 상세 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0008 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Service_Cd     IN RTCS0008.SERVICE_CD%TYPE,     /*서비스 코드           */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 서비스 처리내역 상세 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0008 (
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Service_Cd     IN RTCS0008.SERVICE_CD%TYPE,     /*서비스 코드           */
    v_Dlvc_Yn        IN RTCS0008.DLVC_YN%TYPE,        /*수수료 적용여부       */
    v_Dlvr_Day       IN RTCS0008.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0008.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 처리내역 상세 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0008 (
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Service_Cd     IN RTCS0008.SERVICE_CD%TYPE,     /*서비스 코드           */
    v_Dlvc_Yn        IN RTCS0008.DLVC_YN%TYPE,        /*수수료 적용여부       */
    v_Dlvr_Day       IN RTCS0008.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0008.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 처리내역 상세 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0008 (
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 처리내역 상세 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0008 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN OUT RTCS0008.SEQ%TYPE,        /*순번                  */
    v_Service_Cd     IN RTCS0008.SERVICE_CD%TYPE,     /*서비스 코드           */
    v_Dlvc_Yn        IN RTCS0008.DLVC_YN%TYPE,        /*수수료 적용여부       */
    v_Dlvr_Day       IN RTCS0008.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Dlvr_Seq       IN RTCS0008.DLVR_SEQ%TYPE,       /*순번                  */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 서비스 처리내역 상세 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0008Seq(
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,           /*설비번호            */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE          /*서비스 순번         */
    ) RETURN NUMBER;
   
  /*****************************************************************************
  -- 서비스 처리내역 상세 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0008DlvcYn (
    v_Ord_No         IN RTCS0008.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0008.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0008.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Seq            IN RTCS0008.SEQ%TYPE,            /*순번                  */
    v_Dlvc_Yn        IN RTCS0008.DLVC_YN%TYPE,        /*수수료 적용여부       */
    v_Reg_Id         IN RTCS0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
     
     
END Pkg_Rtcs0008;
/
