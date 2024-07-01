CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0202 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0202
   PURPOSE   개인신용조회결과 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 개인신용조회결과 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0202Count(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*인증번호            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,          /*생성일              */
    v_Seq            IN RTSD0202.SEQ%TYPE               /*생성순번            */
    ) RETURN NUMBER;
    
 /*****************************************************************************
  -- 개인신용조회당일기준(SafeKey + 생성일)
  *****************************************************************************/
  FUNCTION f_sRtsd0202TodayCount(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*인증번호            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE          /*생성일              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인신용조회결과 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0202 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*생성순번              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*신용등급              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE          /*등록자 ID             */
    );
    
    /*****************************************************************************
  -- 개인신용조회결과 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0202TodayExists (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE        /*생성일                */
    );


  /*****************************************************************************
  -- 개인신용조회결과 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*생성순번              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*신용등급              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인신용조회결과 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*생성순번              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*신용등급              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인신용조회결과 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0202 (
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN RTSD0202.SEQ%TYPE,            /*생성순번              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인신용조회결과 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0202 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,        /*인증번호              */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE,        /*생성일                */
    v_Seq            IN OUT RTSD0202.SEQ%TYPE,        /*생성순번              */
    v_Cr_Grade       IN RTSD0202.CR_GRADE%TYPE,       /*신용등급              */
    v_Reg_Id         IN RTSD0202.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 개인신용조회결과 - 순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0202Seq(
    v_Safekey        IN RTSD0202.SAFEKEY%TYPE,          /*인증번호            */
    v_Cre_Day        IN RTSD0202.CRE_DAY%TYPE           /*생성일              */
    ) RETURN NUMBER;
    
    
END Pkg_Rtsd0202;
/
