CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5060 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5060
   PURPOSE   서비스수수료 기초 집계 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-24  choidh           1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가      
*******************************************************************************/

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Count
  *****************************************************************************/
  FUNCTION f_sRtre5060Count(
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,          /*마감년월            */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,          /*수수료항목          */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,           /*계약번호            */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE          /*수수료순번          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5060 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Cust_No        IN RTRE5060.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5060.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5060.CHAN_CD%TYPE,        /*채널구분              */
    v_Mat_Cd         IN RTRE5060.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Class_Cd       IN RTRE5060.CLASS_CD%TYPE,       /*차량분류              */
    v_Svcc_Amt       IN RTRE5060.SVCC_AMT%TYPE,       /*서비스수수료          */
    v_Ppob_Yn        IN RTRE5060.PPOB_YN%TYPE,        /*이연대상              */
    v_Svcp_Day       IN RTRE5060.SVCP_DAY%TYPE,       /*서비스처리일자        */
    v_Equ_No         IN RTRE5060.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTRE5060.SERV_SEQ%TYPE,       /*서비스순번            */
    v_Serv_Iseq      IN RTRE5060.SERV_ISEQ%TYPE,      /*서비스항목순번        */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5060 (
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Cust_No        IN RTRE5060.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5060.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5060.CHAN_CD%TYPE,        /*채널구분              */
    v_Mat_Cd         IN RTRE5060.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Class_Cd       IN RTRE5060.CLASS_CD%TYPE,       /*차량분류              */
    v_Svcc_Amt       IN RTRE5060.SVCC_AMT%TYPE,       /*서비스수수료          */
    v_Ppob_Yn        IN RTRE5060.PPOB_YN%TYPE,        /*이연대상              */
    v_Svcp_Day       IN RTRE5060.SVCP_DAY%TYPE,       /*서비스처리일자        */
    v_Equ_No         IN RTRE5060.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTRE5060.SERV_SEQ%TYPE,       /*서비스순번            */
    v_Serv_Iseq      IN RTRE5060.SERV_ISEQ%TYPE,      /*서비스항목순번        */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5060 (
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Cust_No        IN RTRE5060.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5060.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5060.CHAN_CD%TYPE,        /*채널구분              */
    v_Mat_Cd         IN RTRE5060.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Class_Cd       IN RTRE5060.CLASS_CD%TYPE,       /*차량분류              */
    v_Svcc_Amt       IN RTRE5060.SVCC_AMT%TYPE,       /*서비스수수료          */
    v_Ppob_Yn        IN RTRE5060.PPOB_YN%TYPE,        /*이연대상              */
    v_Svcp_Day       IN RTRE5060.SVCP_DAY%TYPE,       /*서비스처리일자        */
    v_Equ_No         IN RTRE5060.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTRE5060.SERV_SEQ%TYPE,       /*서비스순번            */
    v_Serv_Iseq      IN RTRE5060.SERV_ISEQ%TYPE,      /*서비스항목순번        */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스수수료 기초 집계 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5060 (
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스수수료 기초 집계 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5060 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Slcm_Ym        IN RTRE5060.SLCM_YM%TYPE,        /*마감년월              */
    v_Comm_Tp        IN RTRE5060.COMM_TP%TYPE,        /*수수료항목            */
    v_Ord_No         IN RTRE5060.ORD_NO%TYPE,         /*계약번호              */
    v_Comm_Seq       IN RTRE5060.COMM_SEQ%TYPE,       /*수수료순번            */
    v_Cust_No        IN RTRE5060.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5060.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5060.CHAN_CD%TYPE,        /*채널구분              */
    v_Mat_Cd         IN RTRE5060.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Class_Cd       IN RTRE5060.CLASS_CD%TYPE,       /*차량분류              */
    v_Svcc_Amt       IN RTRE5060.SVCC_AMT%TYPE,       /*서비스수수료          */
    v_Ppob_Yn        IN RTRE5060.PPOB_YN%TYPE,        /*이연대상              */
    v_Svcp_Day       IN RTRE5060.SVCP_DAY%TYPE,       /*서비스처리일자        */
    v_Equ_No         IN RTRE5060.EQU_NO%TYPE,         /*설비번호              */
    v_Serv_Seq       IN RTRE5060.SERV_SEQ%TYPE,       /*서비스순번            */
    v_Serv_Iseq      IN RTRE5060.SERV_ISEQ%TYPE,      /*서비스항목순번        */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 서비스수수료 기초 집계 처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre5060ServiceComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5060.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


END Pkg_Rtre5060;
/
