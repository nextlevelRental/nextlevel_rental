CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5011 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5011
   PURPOSE   오픈몰 판매수수료 조견표 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Count
  *****************************************************************************/
  FUNCTION f_sRtre5011Count(
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,        /*판매원코드          */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE           /*조견표순번          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5011 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Standard_Day   IN RTRE5011.STR_DAY%TYPE,        /*시작일자              */
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE       /*판매원코드            */
    );

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*종료일자              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*충당설정금액          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*종료일자              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*충당설정금액          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5011 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN OUT RTRE5011.CHR_SEQ%TYPE,    /*조견표순번            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*종료일자              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*충당설정금액          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 - 이전이력 종료일자 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre5011EndDay (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*조견표순번            */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*종료일자              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 - 조견표순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtre5011ChrSeq(
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE         /*판매원코드          */
    ) RETURN NUMBER;
    
END Pkg_Rtre5011;