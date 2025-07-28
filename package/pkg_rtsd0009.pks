CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0009 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0009
   PURPOSE   기간별 할인 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-07  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 기간별 할인 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0009Count(
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,            /*할인유형            */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,           /*상품코드            */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE           /*가격적용 시작일     */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기간별 할인 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0009 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Stand_Day      IN RTSD0009.STR_DAY%TYPE         /*기준일                */
    );

  /*****************************************************************************
  -- 기간별 할인 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0009 (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Dc_Rate        IN RTSD0009.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0009.DC_AMT%TYPE,         /*할인금액              */
    v_Use_Yn         IN RTSD0009.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기간별 할인 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0009 (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Dc_Rate        IN RTSD0009.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0009.DC_AMT%TYPE,         /*할인금액              */
    v_Use_Yn         IN RTSD0009.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기간별 할인 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0009 (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기간별 할인 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0009 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Dc_Rate        IN RTSD0009.DC_RATE%TYPE,        /*할인율                */
    v_Dc_Amt         IN RTSD0009.DC_AMT%TYPE,         /*할인금액              */
    v_Use_Yn         IN RTSD0009.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 기간별 할인 관리 Count - 해당 할인율로 등록된 오더 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0009OrdCount(
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0009.END_DAY%TYPE         /*가격적용 완료일       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기간별 할인 관리 Count -  시작일 기준 이후 데이터 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0009NextCount(
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE         /*가격적용 시작일       */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 기간별 할인 관리 Update - 이전 할인율 완료일 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0009Before (
    v_Dc_Tp          IN RTSD0009.DC_TP%TYPE,          /*할인유형              */
    v_Mat_Cd         IN RTSD0009.MAT_CD%TYPE,         /*상품코드              */
    v_Str_Day        IN RTSD0009.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_Reg_Id         IN RTSD0009.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약등록 - 할인금액계산 조회
  *****************************************************************************/
  PROCEDURE p_SELECTrateAmt0009(
    Ref_Cursor			    IN OUT SYS_REFCURSOR,
    v_Mat_Cd                IN RTSD0008.MAT_CD%TYPE,        /*상품코드        */
    v_Cust_No			    IN RTSD0100.CUST_NO%TYPE,       /*고객번호		  */
    v_Cnt_Cd			    IN RTSD0008.CNT_CD%TYPE,        /*타이어본수		 */
    v_Period_Cd			    IN RTSD0008.PERIOD_CD%TYPE,     /*기간코드        */
    v_Rent_Amt			    IN RTSD0008.AMT%TYPE,           /*금액            */
    v_Ord_Day               IN RtSD0104.ORD_DAY%TYPE        /*접수일자        */
  );

  /*****************************************************************************
  -- 계약등록 - 할인금액계산 상세조회
  *****************************************************************************/
  PROCEDURE p_SELECTrateAmt0009Detail(
    Ref_Cursor			    IN OUT SYS_REFCURSOR,
    v_Mat_Cd                IN RTSD0008.MAT_CD%TYPE,        /*상품코드        */
    v_Cust_No			    IN RTSD0100.CUST_NO%TYPE,       /*고객번호		  */
    v_Cnt_Cd			    IN RTSD0008.CNT_CD%TYPE,        /*타이어본수		 */
    v_Period_Cd			    IN RTSD0008.PERIOD_CD%TYPE,     /*기간코드        */
    v_Ord_Day               IN RtSD0104.ORD_DAY%TYPE        /*접수일자        */
  );
  
END Pkg_Rtsd0009;