CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0102 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0102
   PURPOSE   결합 고객 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-08  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 결합 고객 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0102Count(
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE            /*고객결합번호        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결합 고객 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0102 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,           /*고객결합번호        */
    v_Grp_Day_Start  IN RTSD0102.GRP_DAY%TYPE,          /*결합일자            */
    v_Grp_Day_End    IN RTSD0102.GRP_DAY%TYPE,          /*결합일자            */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,           /*결합여부            */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE           /*고객번호            */
    );

  /*****************************************************************************
  -- 결합 고객 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*고객결합번호          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결합 고객 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*고객결합번호          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결합 고객 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*고객결합번호          */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 결합 고객 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0102 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Grp_No         IN OUT RTSD0102.GRP_NO%TYPE,     /*고객결합번호          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 결합 고객 마스터 - 결합 고객 번호 체번
  *****************************************************************************/
  FUNCTION f_sRtsd0102GrpNo RETURN VARCHAR;
END Pkg_Rtsd0102;
/
