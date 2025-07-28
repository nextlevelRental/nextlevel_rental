CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0015 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0015
   PURPOSE   WINTER 세부서비스(보관,교체) 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-28  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- WINTER 세부서비스(보관,교체) 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0015Count(
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,            /*프리미엄서비스      */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,          /*상세서비스          */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE            /*타이어본수          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- WINTER 세부서비스(보관,교체) 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0015 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- WINTER 세부서비스(보관,교체) 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0015 (
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- WINTER 세부서비스(보관,교체) 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0015 (
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- WINTER 세부서비스(보관,교체) 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0015 (
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*타이어본수            */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- WINTER 세부서비스(보관,교체) 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0015 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtsd0015;