CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0103 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0103
   PURPOSE   결합 고객 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-08  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 결합 고객 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0103Count(
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,           /*고객결합번호        */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결합 고객 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0103 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE            /*고객결합번호          */
    --v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*고객번호              */
    --v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*결합일자              */
    --v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*분리일자              */
    --v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*결합여부              */
    --v_Reg_Id         IN RTSD0103.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 결합 고객 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0103 (
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*고객결합번호          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*고객번호              */
    v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결합 고객 이력 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0103 (
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*고객결합번호          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*고객번호              */
    v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결합 고객 이력 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0103 (
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*고객결합번호          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*고객번호              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결합 고객 이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0103 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*고객결합번호          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*고객번호              */
    v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 결합 고객 INSERT - 저장에 따른 고객 체크 RETURN  : 고객결합번호
  *****************************************************************************/
  FUNCTION p_sRtsd0103_SelectCustNo(
  	v_Cust_No         IN RTSD0103.CUST_NO%TYPE          /*고객번호            */
  ) RETURN VARCHAR2;


  /*****************************************************************************
  -- 결합 고객 할인 처리
  *****************************************************************************/
  PROCEDURE p_BatchRtsd0103Discount (
    v_Appl_Ym        IN VARCHAR2,                     /*적용년월              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtsd0103;
/
