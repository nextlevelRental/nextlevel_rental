CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0012 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0012
   PURPOSE   프리미엄서비스 관리(세부서비스) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
   1.1        2018-02-19  wjim             [20180212_01] 선택형 프리미엄 서비스 도입
*******************************************************************************/

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Count
  *****************************************************************************/
  FUNCTION f_sRtsd0012Count(
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,            /*프리미엄서비스      */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,          /*상세서비스          */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE            /*타이어본수          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0012 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0012 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 특정 프리미엄 서비스용 상세 서비스 조회
      
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-02-21  wjim             [20180212_01] 신규 개발 
  *****************************************************************************/
  PROCEDURE p_sRtsd0012_ByPrmSvc (
      Ref_Cursor     IN OUT SYS_REFCURSOR
    , v_Ps_Cd        IN RTSD0012.PS_CD%TYPE           /*서비스코드            */
    , v_Period_Cd    IN RTSD0012.PERIOD_CD%TYPE       /*기간코드(S021)        */
    , v_Cnt_Cd       IN RTSD0012.CNT_CD%TYPE          /*본수(S022)            */
  );    
      
  /*****************************************************************************
  -- 서비스 등록팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0012_srvcPopup (
      Ref_Cursor           IN OUT SYS_REFCURSOR
  );

END Pkg_Rtsd0012;
/
