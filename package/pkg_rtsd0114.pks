CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0114 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0114
   PURPOSE   서비스 확인서 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 서비스 확인서 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0114Count(
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0114.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 확인서 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0114 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_FDay      IN RTSD0114.PROC_DAY%TYPE,       /*처리일자FROM          */
    v_Proc_TDay      IN RTSD0114.PROC_DAY%TYPE        /*처리일자TO            */
    );

  /*****************************************************************************
  -- 서비스 확인서 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0114 (
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0114.SEQ%TYPE,            /*순번                  */
    v_Proc_Day       IN RTSD0114.PROC_DAY%TYPE,       /*처리일자              */
    v_Prs_Dcd1       IN RTSD0114.PRS_DCD1%TYPE,       /*서비스명1_엔진오일    */
    v_Prs_Dcd2       IN RTSD0114.PRS_DCD2%TYPE,       /*서비스명2_위치교환    */
    v_Prs_Dcd3       IN RTSD0114.PRS_DCD3%TYPE,       /*서비스명3_방문점검    */
    v_Prs_Dcd4       IN RTSD0114.PRS_DCD4%TYPE,       /*Door-to-Door          */
    v_Prs_Dcd5       IN RTSD0114.PRS_DCD5%TYPE,       /*서비스명5_WINTER교체  */
    v_Prs_Dcd6       IN RTSD0114.PRS_DCD6%TYPE,       /*서비스명6_걱정제로체  */  
    v_Prs_Dcd8       IN RTSD0114.PRS_DCD8%TYPE,       /*서비스명8_얼라인먼트  */ 
    v_Prs_Dcd9       IN RTSD0114.PRS_DCD9%TYPE,       /*서비스명9_무상얼라인먼트  */   
    v_Prs_Dcd10      IN RTSD0114.PRS_DCD10%TYPE,      /*서비스명10_Nexen Check  */
    v_Prs_Dcd11      IN RTSD0114.PRS_DCD11%TYPE,      /*서비스명11_조기마모파손보증  */
    v_Prs_Dcd12      IN RTSD0114.PRS_DCD12%TYPE,      /*서비스명12_파손보증  */   
    v_A_Mileage      IN RTSD0114.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Sv_Sert        IN RTSD0114.SV_SERT%TYPE,        /*서비스 만족도         */
    v_Input_Dt       IN RTSD0114.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0114.FILE_PATH%TYPE,      /*서비스 확인서 파일경로*/
    v_File_Name      IN RTSD0114.FILE_NAME%TYPE,      /*서비스 확인서 파일명  */
    v_Reg_Id         IN RTSD0114.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 확인서 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0114 (
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0114.SEQ%TYPE,            /*순번                  */
    v_Proc_Day       IN RTSD0114.PROC_DAY%TYPE,       /*처리일자              */
    v_Prs_Dcd1       IN RTSD0114.PRS_DCD1%TYPE,       /*서비스명1_엔진오일    */
    v_Prs_Dcd2       IN RTSD0114.PRS_DCD2%TYPE,       /*서비스명2_위치교환    */
    v_Prs_Dcd3       IN RTSD0114.PRS_DCD3%TYPE,       /*서비스명3_방문점검    */
    v_Prs_Dcd4       IN RTSD0114.PRS_DCD4%TYPE,       /*Door-to-Door          */
    v_Prs_Dcd5       IN RTSD0114.PRS_DCD5%TYPE,       /*서비스명5_WINTER교체  */
    v_Prs_Dcd6       IN RTSD0114.PRS_DCD6%TYPE,       /*서비스명6_걱정제로체  */ 
    v_Prs_Dcd8       IN RTSD0114.PRS_DCD8%TYPE,       /*서비스명8_얼라인먼트  */    
    v_Prs_Dcd9       IN RTSD0114.PRS_DCD9%TYPE,       /*서비스명9_무상얼라인먼트  */   
    v_Prs_Dcd10      IN RTSD0114.PRS_DCD10%TYPE,      /*서비스명10_Nexen Check  */    
    v_Prs_Dcd11      IN RTSD0114.PRS_DCD11%TYPE,      /*서비스명11_조기마모파손보증  */
    v_Prs_Dcd12      IN RTSD0114.PRS_DCD12%TYPE,      /*서비스명12_파손보증  */
    v_A_Mileage      IN RTSD0114.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Sv_Sert        IN RTSD0114.SV_SERT%TYPE,        /*서비스 만족도         */
    v_Input_Dt       IN RTSD0114.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0114.FILE_PATH%TYPE,      /*서비스 확인서 파일경로*/
    v_File_Name      IN RTSD0114.FILE_NAME%TYPE,      /*서비스 확인서 파일명  */
    v_Reg_Id         IN RTSD0114.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 확인서 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0114 (
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0114.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0114.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 서비스 확인서 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0114 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN OUT RTSD0114.SEQ%TYPE,        /*순번                  */
    v_Proc_Day       IN RTSD0114.PROC_DAY%TYPE,       /*처리일자              */
    v_Prs_Dcd1       IN RTSD0114.PRS_DCD1%TYPE,       /*서비스명1_엔진오일    */
    v_Prs_Dcd2       IN RTSD0114.PRS_DCD2%TYPE,       /*서비스명2_위치교환    */
    v_Prs_Dcd3       IN RTSD0114.PRS_DCD3%TYPE,       /*서비스명3_방문점검    */
    v_Prs_Dcd4       IN RTSD0114.PRS_DCD4%TYPE,       /*Door-to-Door          */
    v_Prs_Dcd5       IN RTSD0114.PRS_DCD5%TYPE,       /*서비스명5_WINTER교체  */
    v_Prs_Dcd6       IN RTSD0114.PRS_DCD6%TYPE,       /*서비스명6_걱정제로교체  */    
    v_Prs_Dcd8       IN RTSD0114.PRS_DCD8%TYPE,       /*서비스명8_얼라인먼트  */    
    v_Prs_Dcd9       IN RTSD0114.PRS_DCD9%TYPE,       /*서비스명9_무상얼라인먼트  */    
    v_Prs_Dcd10      IN RTSD0114.PRS_DCD10%TYPE,      /*서비스명10_Nexen Check  */ 
    v_Prs_Dcd11      IN RTSD0114.PRS_DCD11%TYPE,      /*서비스명11_조기마모파손보증  */
    v_Prs_Dcd12      IN RTSD0114.PRS_DCD12%TYPE,      /*서비스명12_파손보증  */   
    v_A_Mileage      IN RTSD0114.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Sv_Sert        IN RTSD0114.SV_SERT%TYPE,        /*서비스 만족도         */
    v_Input_Dt       IN RTSD0114.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0114.FILE_PATH%TYPE,      /*서비스 확인서 파일경로*/
    v_File_Name      IN RTSD0114.FILE_NAME%TYPE,      /*서비스 확인서 파일명  */
    v_Reg_Id         IN RTSD0114.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 서비스 확인서 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0114Seq(
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0114;
/
