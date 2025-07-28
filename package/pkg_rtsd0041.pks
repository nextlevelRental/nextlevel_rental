CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0041 AS
/*******************************************************************************
   NAME:      PKG_RTSD0041
   PURPOSE    계약별 부가서비스 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-06  pc2288         1. Created this package body.
*******************************************************************************/


  /*****************************************************************************
  -- 계약별 부가제품 서비스 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0041 (
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 부가제품 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0041 (
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0041.SEQ%TYPE,			  /*순번				  */
    v_Add_Gds_Cd     IN RTSD0041.ADD_GDS_CD%TYPE,     /*부가제품코드          */
    v_Amt			 IN RTSD0041.AMT%TYPE,            /*금액	              */
    v_DC_Amt         IN RTSD0041.DC_AMT%TYPE,         /*할인금액              */
    v_L_Amt          IN RTSD0041.L_AMT%TYPE,          /*최종금액              */
    v_Gds_Grp        IN RTSD0041.GDS_GRP%TYPE,        /*제품군                */
    v_Dc_Yn          IN RTSD0041.DC_YN%TYPE,          /*할부여부              */
	v_Mon_Amt        IN RTSD0041.MON_AMT%TYPE,        /*월렌탈료              */
	v_Reg_Id         IN RTSD0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 부가제품 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0041 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0041.SEQ%TYPE,			  /*순번				  */
    v_Add_Gds_Cd     IN RTSD0041.ADD_GDS_CD%TYPE,     /*부가제품코드          */
    v_Amt			 IN RTSD0041.AMT%TYPE,            /*금액	              */
    v_DC_Amt         IN RTSD0041.DC_AMT%TYPE,         /*할인금액              */
    v_L_Amt          IN RTSD0041.L_AMT%TYPE,          /*최종금액              */
    v_Gds_Grp        IN RTSD0041.GDS_GRP%TYPE,        /*제품군                */
    v_Dc_Yn          IN RTSD0041.DC_YN%TYPE,          /*할부여부              */
	v_Mon_Amt        IN RTSD0041.MON_AMT%TYPE,        /*월렌탈료              */
	v_Reg_Id         IN RTSD0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 계약별 부가서비스 관리(IUD) 일시불
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0041Direct (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0041.SEQ%TYPE,              /*순번                  */
    v_Add_Gds_Cd     IN RTSD0041.ADD_GDS_CD%TYPE,     /*부가제품코드          */
    v_Amt             IN RTSD0041.AMT%TYPE,            /*금액                  */
    v_DC_Amt         IN RTSD0041.DC_AMT%TYPE,         /*할인금액              */
    v_L_Amt          IN RTSD0041.L_AMT%TYPE,          /*최종금액              */
    v_Gds_Grp        IN RTSD0041.GDS_GRP%TYPE,        /*제품군                */
    v_Dc_Yn          IN RTSD0041.DC_YN%TYPE,          /*할부여부              */
    v_Mon_Amt        IN RTSD0041.MON_AMT%TYPE,        /*월렌탈료              */
    v_Reg_Id         IN RTSD0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
        
END PKG_RTSD0041;