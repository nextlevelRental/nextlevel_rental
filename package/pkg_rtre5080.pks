CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5080 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5080
   PURPOSE   충당금 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-24  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 충당금 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre5080Count(
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,        /*렌탈전문점          */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,         /*충당금처리일자      */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE          /*충당금순번          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 충당금 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5080 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*충당금구분            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*충당금발생금액        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*충당금차감금액        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*충당금처리 사유       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 충당금 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*충당금구분            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*충당금발생금액        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*충당금차감금액        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*충당금처리 사유       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 충당금 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*충당금구분            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*충당금발생금액        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*충당금차감금액        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*충당금처리 사유       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 충당금 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 충당금 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5080 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*충당금처리일자        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*충당금순번            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*충당금구분            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*충당금발생금액        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*충당금차감금액        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*충당금처리 사유       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 충당금 설정 처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre5080Allowance (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 판매인별 충당금 현황 - 판매인별 충당금 잔액을 조회하는 기능
  *****************************************************************************/
  PROCEDURE p_sRtre5080AgencyAppStatus (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*등록자 ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );


  /*****************************************************************************
  -- 판매인별 충당금 현황 - 충당금 발생/차감 세부 내역
  *****************************************************************************/
  PROCEDURE p_sRtre5080AgencyAppList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE       /*렌탈전문점            */
    );
        
END Pkg_Rtre5080;
/
