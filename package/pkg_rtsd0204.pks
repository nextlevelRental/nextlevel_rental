CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0204 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0204
   PURPOSE   기업신용조회결과 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 기업신용조회결과 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0204Count(
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*사업자번호          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,          /*생성일              */
    v_Seq            IN RTSD0204.SEQ%TYPE               /*생성순번            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 기업신용조회결과 Count(사업자번호 + 당일)
  *****************************************************************************/
  PROCEDURE p_sRtsd0204TodayCount(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*사업자번호          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE          /*생성일              */
    ) ;

  /*****************************************************************************
  -- 기업신용조회결과 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0204 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*생성순번              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*기업신용등급          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 기업신용조회결과 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*생성순번              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*기업신용등급          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기업신용조회결과 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*생성순번              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*기업신용등급          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기업신용조회결과 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0204 (
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0204.SEQ%TYPE,            /*생성순번              */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기업신용조회결과 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0204 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,        /*사업자번호            */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN OUT RTSD0204.SEQ%TYPE,        /*생성순번              */
    v_Co_Grade       IN RTSD0204.CO_GRADE%TYPE,       /*기업신용등급          */
    v_Reg_Id         IN RTSD0204.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 기업신용조회결과 - 순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0204Seq(
    v_Busl_No        IN RTSD0204.BUSL_NO%TYPE,          /*사업자번호          */
    v_Cre_Day        IN RTSD0204.CRE_DAY%TYPE           /*생성일              */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0204;