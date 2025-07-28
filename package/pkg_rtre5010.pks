CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5010 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5010
   PURPOSE   판매수수료 조견표 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가      
*******************************************************************************/

  /*****************************************************************************
  -- 판매수수료 조견표 Count
  *****************************************************************************/
  FUNCTION f_sRtre5010Count(
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,           /*상품코드            */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,          /*채널구분            */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,          /*조견표순번          */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE    /* 채널 중분류          */      
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매수수료 조견표 Select
  -- 변경이력: 2016-04-18 이영근, 채널 대분류,중분류 코드 추가    
  *****************************************************************************/
  PROCEDURE p_sRtre5010 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Standard_Day   IN RTRE5010.STR_DAY%TYPE,        /*시작일자              */
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*채널구분              */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE    /* 채널 중분류          */    
    );

  /*****************************************************************************
  -- 판매수수료 조견표 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5010 (
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*채널구분              */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5010.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5010.END_DAY%TYPE,        /*종료일자              */
    v_Slcm_Amt       IN RTRE5010.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfd_Amt       IN RTRE5010.APFD_AMT%TYPE,       /*충당설정금액          */
    v_Use_Yn         IN RTRE5010.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매수수료 조견표 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5010 (
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*채널구분              */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5010.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5010.END_DAY%TYPE,        /*종료일자              */
    v_Slcm_Amt       IN RTRE5010.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfd_Amt       IN RTRE5010.APFD_AMT%TYPE,       /*충당설정금액          */
    v_Use_Yn         IN RTRE5010.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매수수료 조견표 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5010 (
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*채널구분              */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매수수료 조견표 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5010 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*채널구분              */
    v_Chr_Seq        IN OUT RTRE5010.CHR_SEQ%TYPE,    /*조견표순번            */
    v_Str_Day        IN RTRE5010.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5010.END_DAY%TYPE,        /*종료일자              */
    v_Slcm_Amt       IN RTRE5010.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfd_Amt       IN RTRE5010.APFD_AMT%TYPE,       /*충당설정금액          */
    v_Use_Yn         IN RTRE5010.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 판매수수료 조견표 - 이전이력 종료일자 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre5010EndDay (
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,        /*채널구분              */
    v_Chr_Seq        IN RTRE5010.CHR_SEQ%TYPE,        /*조견표순번            */
    v_End_Day        IN RTRE5010.END_DAY%TYPE,        /*종료일자              */
    v_Reg_Id         IN RTRE5010.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */      
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 판매수수료 조견표 - 조견표순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtre5010ChrSeq(
    v_Mat_Cd         IN RTRE5010.MAT_CD%TYPE,           /*상품코드            */
    v_Chan_Cd        IN RTRE5010.CHAN_CD%TYPE,          /*채널구분            */
    v_chan_Lcls_Cd   IN RTRE5010.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5010.CHAN_MCLS_CD%TYPE    /* 채널 중분류          */      
    ) RETURN NUMBER;
    
END Pkg_Rtre5010;