CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0200 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0200
   PURPOSE   SAFE KEY 발급(WEB) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Count
  *****************************************************************************/
  FUNCTION f_sRtsd0200Count(
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,         /*SAFE_KEY            */
    --v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,          /*생성일              */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE            /*구분(C:생성,R:조회) */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Birth_Day      IN RTSD0200.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Cust_Nm        IN RTSD0200.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTSD0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Gender_Cd      IN RTSD0200.GENDER_CD%TYPE,      /*성별                  */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0200 (
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Birth_Day      IN RTSD0200.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Cust_Nm        IN RTSD0200.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTSD0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Gender_Cd      IN RTSD0200.GENDER_CD%TYPE,      /*성별                  */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0200 (
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Birth_Day      IN RTSD0200.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Cust_Nm        IN RTSD0200.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTSD0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Gender_Cd      IN RTSD0200.GENDER_CD%TYPE,      /*성별                  */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0200 (
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SAFE KEY 발급(WEB) 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0200 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Safe_Key       IN RTSD0200.SAFE_KEY%TYPE,       /*SAFE_KEY              */
    v_Cre_Day        IN RTSD0200.CRE_DAY%TYPE,        /*생성일                */
    v_Cre_Tp         IN RTSD0200.CRE_TP%TYPE,         /*구분(C:생성,R:조회)   */
    v_Birth_Day      IN RTSD0200.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Cust_Nm        IN RTSD0200.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTSD0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Gender_Cd      IN RTSD0200.GENDER_CD%TYPE,      /*성별                  */
    v_Reg_Id         IN RTSD0200.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  --SAFE KEY 확인 : return -> SAFE_KEY
  *****************************************************************************/
  FUNCTION f_sRtsd0200_safeKeyConfirm(
    v_custNm          IN RTSD0200.CUST_NM%TYPE,         /*고객명/법인명       */
    v_birthDay        IN RTSD0200.BIRTH_DAY%TYPE,       /*법정생년월일        */
    v_genderCd        IN RTSD0200.GENDER_CD%TYPE,       /*성별                */
    v_mobNo           IN RTSD0200.MOB_NO%TYPE           /*휴대폰번호          */
    ) RETURN VARCHAR2;
    
     /*****************************************************************************
  --SAFE KEY 확인 : return -> SAFE_KEY
  *****************************************************************************/
  FUNCTION f_sRtsd0200_safeKeyConfirmNew(
    v_custNm          IN RTSD0200.CUST_NM%TYPE,         /*고객명/법인명       */
    v_birthDay        IN RTSD0200.BIRTH_DAY%TYPE,       /*법정생년월일        */
    v_genderCd        IN RTSD0200.GENDER_CD%TYPE,       /*성별                */
    v_mobNo           IN RTSD0200.MOB_NO%TYPE,           /*휴대폰번호          */
    v_custNo           IN RTSD0100.CUST_NO%TYPE           /*고객번호          */
    ) RETURN VARCHAR2;
              
END Pkg_Rtsd0200;
/
