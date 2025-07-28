CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5030 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5030
   PURPOSE   서비스수수료 조견표 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-24  choidh           1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가
*******************************************************************************/

  /*****************************************************************************
  -- 서비스수수료 조견표 Count
  *****************************************************************************/
  FUNCTION f_sRtre5030Count(
    v_Service_Cd     IN RTRE5030.SERVICE_CD%TYPE,       /*서비스코드          */
    v_Chr_Seq        IN RTRE5030.CHR_SEQ%TYPE,          /*조견표순번          */
    v_chan_Lcls_Cd   IN RTRE5030.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5030.CHAN_MCLS_CD%TYPE    /* 채널 중분류          */     
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스수수료 조견표 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5030 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Standard_Day   IN RTRE5030.STR_DAY%TYPE,        /*시작일자              */
    v_Service_Cd     IN RTRE5030.SERVICE_CD%TYPE,     /*서비스코드            */
    v_Mat_Cd         IN RTRE5030.MAT_CD%TYPE,         /*상품코드              */
    v_chan_Lcls_Cd   IN RTRE5030.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5030.CHAN_MCLS_CD%TYPE    /* 채널 중분류          */     
    );

  /*****************************************************************************
  -- 서비스수수료 조견표 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5030 (
    v_Service_Cd     IN RTRE5030.SERVICE_CD%TYPE,     /*서비스코드            */
    v_Chr_Seq        IN RTRE5030.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5030.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5030.END_DAY%TYPE,        /*종료일자              */
    v_Svcm_Amt       IN RTRE5030.SVCM_AMT%TYPE,       /*장착수수료            */
    v_Mat_Cd         IN RTRE5030.MAT_CD%TYPE,         /*상품코드              */
    v_Class_Cd       IN RTRE5030.CLASS_CD%TYPE,       /*차량분류              */
    v_Use_Yn         IN RTRE5030.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5030.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5030.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5030.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_Ps_Cd          IN RTRE5030.PS_CD%TYPE,   /* 프리미엄서비스          */
    v_CarType_Cd     IN RTRE5030.CAR_TYPE%TYPE,   /* 국산/수입          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스수수료 조견표 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5030 (
    v_Service_Cd     IN RTRE5030.SERVICE_CD%TYPE,     /*서비스코드            */
    v_Chr_Seq        IN RTRE5030.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5030.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5030.END_DAY%TYPE,        /*종료일자              */
    v_Svcm_Amt       IN RTRE5030.SVCM_AMT%TYPE,       /*장착수수료            */
    v_Mat_Cd         IN RTRE5030.MAT_CD%TYPE,         /*상품코드              */
    v_Class_Cd       IN RTRE5030.CLASS_CD%TYPE,       /*차량분류              */
    v_Use_Yn         IN RTRE5030.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5030.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5030.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5030.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스수수료 조견표 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5030 (
    v_Service_Cd     IN RTRE5030.SERVICE_CD%TYPE,     /*서비스코드            */
    v_Chr_Seq        IN RTRE5030.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Reg_Id         IN RTRE5030.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5030.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5030.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스수수료 조견표 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5030 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Service_Cd     IN RTRE5030.SERVICE_CD%TYPE,     /*서비스코드            */
    v_Chr_Seq        IN OUT RTRE5030.CHR_SEQ%TYPE,    /*조견표순번            */
    v_Str_Day        IN RTRE5030.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5030.END_DAY%TYPE,        /*종료일자              */
    v_Svcm_Amt       IN RTRE5030.SVCM_AMT%TYPE,       /*장착수수료            */
    v_Mat_Cd         IN RTRE5030.MAT_CD%TYPE,         /*상품코드              */
    v_Class_Cd       IN RTRE5030.CLASS_CD%TYPE,       /*차량분류              */
    v_Use_Yn         IN RTRE5030.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5030.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5030.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5030.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_Ps_Cd         IN RTRE5030.PS_CD%TYPE,   /* 프리미엄서비스          */
    v_CarType_Cd     IN RTRE5030.CAR_TYPE%TYPE,   /* 국산/수입          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 서비스수수료 조견표 - 이전이력 종료일자 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre5030EndDay (
    v_Service_Cd     IN RTRE5030.SERVICE_CD%TYPE,     /*서비스코드            */
    v_Chr_Seq        IN RTRE5030.CHR_SEQ%TYPE,        /*조견표순번            */
    v_End_Day        IN RTRE5030.END_DAY%TYPE,        /*종료일자              */
    v_Reg_Id         IN RTRE5030.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5030.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5030.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스수수료 조견표 - 조견표순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtre5030ChrSeq(
    v_Service_Cd     IN RTRE5030.SERVICE_CD%TYPE,       /*서비스코드          */
    v_chan_Lcls_Cd   IN RTRE5030.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5030.CHAN_MCLS_CD%TYPE    /* 채널 중분류          */     
    ) RETURN NUMBER;

END Pkg_Rtre5030;