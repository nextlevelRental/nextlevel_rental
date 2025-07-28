CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0007 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0007
   PURPOSE   서비스 처리내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 서비스 처리내역 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0007Count(
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,           /*설비번호            */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE          /*서비스 순번         */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 처리내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0007 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Per_Tp         IN RTCS0007.PER_TP%TYPE,         /*정기,비정기구분       */
    v_Proc_In_Cd     IN RTCS0007.PROC_IN_CD%TYPE,     /*처리자ID              */
    v_A_Mileage      IN RTCS0007.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Proc_Day       IN RTCS0007.PROC_DAY%TYPE,       /*처리일자              */
    v_Proc_Tm        IN RTCS0007.PROC_TM%TYPE,        /*처리시간              */
    v_Serv_Sign_Seq  IN RTCS0007.SERV_SIGN_SEQ%TYPE,  /*서비스확인서 서명순번 */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 서비스 처리내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0007 (
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Per_Tp         IN RTCS0007.PER_TP%TYPE,         /*정기,비정기구분       */
    v_Proc_In_Cd     IN RTCS0007.PROC_IN_CD%TYPE,     /*처리자ID              */
    v_A_Mileage      IN RTCS0007.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Proc_Day       IN RTCS0007.PROC_DAY%TYPE,       /*처리일자              */
    v_Proc_Tm        IN RTCS0007.PROC_TM%TYPE,        /*처리시간              */
    v_Serv_Sign_Seq  IN RTCS0007.SERV_SIGN_SEQ%TYPE,  /*서비스확인서 서명순번 */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 처리내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0007 (
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Per_Tp         IN RTCS0007.PER_TP%TYPE,         /*정기,비정기구분       */
    v_Proc_In_Cd     IN RTCS0007.PROC_IN_CD%TYPE,     /*처리자ID              */
    v_A_Mileage      IN RTCS0007.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Proc_Day       IN RTCS0007.PROC_DAY%TYPE,       /*처리일자              */
    v_Proc_Tm        IN RTCS0007.PROC_TM%TYPE,        /*처리시간              */
    v_Serv_Sign_Seq  IN RTCS0007.SERV_SIGN_SEQ%TYPE,  /*서비스확인서 서명순번 */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 처리내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0007 (
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTCS0007.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 처리내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0007 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN OUT RTCS0007.SERV_SEQ%TYPE,   /*서비스 순번           */
    v_Per_Tp         IN RTCS0007.PER_TP%TYPE,         /*정기,비정기구분       */
    v_Proc_In_Cd     IN RTCS0007.PROC_IN_CD%TYPE,     /*처리자ID              */
    v_A_Mileage      IN RTCS0007.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Proc_Day       IN RTCS0007.PROC_DAY%TYPE,       /*처리일자              */
    v_Proc_Tm        IN RTCS0007.PROC_TM%TYPE,        /*처리시간              */
    v_Serv_Sign_Seq  IN RTCS0007.SERV_SIGN_SEQ%TYPE,  /*서비스확인서 서명순번 */
    v_Reg_Id         IN RTCS0007.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 서비스 처리내역 - 서비스 순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtcs0007ServSeq(
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0007.EQU_NO%TYPE            /*설비번호            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 서비스 처리내역 Select - 점검 작업목록 조회 - 서비스이력TAB
  *****************************************************************************/
  PROCEDURE p_sRtcs0007ServiceHistory (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE          /*계약번호              */
    );
 
  /*****************************************************************************
  -- 서비스 처리내역 Select - 점검 작업목록 조회 - 서비스이력TAB
  *****************************************************************************/
  PROCEDURE p_sRtcs0007ServiceHistoryByDt (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0007.ORD_NO%TYPE,          /*계약번호              */
    v_Proc_Day_S         IN RTCS0007.PROC_DAY%TYPE,          /*계약번호              */
    v_Proc_Day_E         IN RTCS0007.PROC_DAY%TYPE,          /*계약번호              */
    v_Dlvc_Yn         IN RTCS0008.DLVC_YN%TYPE,          /*계약번호              */
    v_Service_Cd         IN RTCS0008.SERVICE_CD%TYPE          /*계약번호              */
    );
         
END Pkg_Rtcs0007;