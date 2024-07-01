CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5050 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5050
   PURPOSE   장착수수료 기초 집계 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가      
*******************************************************************************/

  /*****************************************************************************
  -- 장착수수료 기초 집계 Count
  *****************************************************************************/
  FUNCTION f_sRtre5050Count(
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,          /*마감년월            */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착수수료 기초 집계 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5050 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5050.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5050.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5050.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5050.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5050.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Procc_Amt      IN RTRE5050.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Ppob_Yn        IN RTRE5050.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5050.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 장착수수료 기초 집계 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5050 (
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5050.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5050.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5050.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5050.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5050.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Procc_Amt      IN RTRE5050.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Ppob_Yn        IN RTRE5050.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5050.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착수수료 기초 집계 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5050 (
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5050.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5050.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5050.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5050.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5050.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Procc_Amt      IN RTRE5050.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Ppob_Yn        IN RTRE5050.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5050.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착수수료 기초 집계 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5050 (
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착수수료 기초 집계 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5050 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5050.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5050.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5050.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5050.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5050.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Procc_Amt      IN RTRE5050.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Ppob_Yn        IN RTRE5050.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5050.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 장착수수료 기초 집계 처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre5050InstallComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


END Pkg_Rtre5050;
/
