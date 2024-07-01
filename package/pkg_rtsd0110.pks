CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0110 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0110
   PURPOSE   본인인증 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 본인인증 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0110Count(
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,          /*고객번호            */
    v_Seq            IN RTSD0110.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 본인인증 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0110 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Cert_FDay      IN RTSD0110.CERT_DAY%TYPE,       /*인증일자FROM          */
    v_Cert_TDay      IN RTSD0110.CERT_DAY%TYPE        /*인증일자TO            */
    );

  /*****************************************************************************
  -- 본인인증 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*순번                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*인증일자              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*인증번호              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*인증여부              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*통신사                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 본인인증 이력 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*순번                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*인증일자              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*인증번호              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*인증여부              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*통신사                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 본인인증 이력 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 본인인증 이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0110 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*고객번호              */
    v_Seq            IN OUT RTSD0110.SEQ%TYPE,        /*순번                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*인증일자              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*인증번호              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*인증여부              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*통신사                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 본인인증 이력 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0110Seq(
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER;

 /*****************************************************************************
  -- 본인인증 이력 Select Max Seq
  *****************************************************************************/
  PROCEDURE p_sRtsd0110_MaxSeq (
  Ref_Cursor       IN OUT SYS_REFCURSOR,
  v_Cust_No        IN RTSD0110.CUST_NO%TYPE           /*고객번호              */
  );
  
END Pkg_Rtsd0110;
/
