CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0118 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0118
   PURPOSE   전자서명 조회정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-11-20  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 전자서명 조회정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0118Count(
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0118.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 전자서명 조회정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0118 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE          /*계약번호              */
    );

  /*****************************************************************************
  -- 전자서명 조회정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0118 (
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0118.SEQ%TYPE,            /*순번                  */
    v_Cust_No        IN RTSD0118.CUST_NO%TYPE,        /*고객번호              */
    v_Sheet_Id       IN RTSD0118.SHEET_ID%TYPE,       /*서식종류              */
    v_File_Path      IN RTSD0118.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Name      IN RTSD0118.FILE_NAME%TYPE,      /*파일명                */
    v_Job_Cd         IN RTSD0118.JOB_CD%TYPE,         /*조회구분              */
    v_Auto_Yn        IN RTSD0118.AUTO_YN%TYPE,        /*자동발송여부          */
    v_Email_Addr     IN RTSD0118.EMAIL_ADDR%TYPE,     /*이메일 주소           */   
    v_Disp_Id        IN RTSD0118.DISP_ID%TYPE,        /*조회자ID              */
    v_Disp_Nm        IN RTSD0118.DISP_NM%TYPE,        /*조회자명              */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 전자서명 조회정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0118 (
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0118.SEQ%TYPE,            /*순번                  */
    v_Cust_No        IN RTSD0118.CUST_NO%TYPE,        /*고객번호              */
    v_Sheet_Id       IN RTSD0118.SHEET_ID%TYPE,       /*서식종류              */
    v_File_Path      IN RTSD0118.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Name      IN RTSD0118.FILE_NAME%TYPE,      /*파일명                */
    v_Job_Cd         IN RTSD0118.JOB_CD%TYPE,         /*조회구분              */
    v_Auto_Yn        IN RTSD0118.AUTO_YN%TYPE,        /*자동발송여부          */
    v_Email_Addr     IN RTSD0118.EMAIL_ADDR%TYPE,     /*이메일 주소           */   
    v_Disp_Id        IN RTSD0118.DISP_ID%TYPE,        /*조회자ID              */
    v_Disp_Nm        IN RTSD0118.DISP_NM%TYPE,        /*조회자명              */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 전자서명 조회정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0118 (
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0118.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 전자서명 조회정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0118 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN OUT RTSD0118.SEQ%TYPE,        /*순번                  */
    v_Cust_No        IN RTSD0118.CUST_NO%TYPE,        /*고객번호              */
    v_Sheet_Id       IN RTSD0118.SHEET_ID%TYPE,       /*서식종류              */
    v_File_Path      IN RTSD0118.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Name      IN RTSD0118.FILE_NAME%TYPE,      /*파일명                */
    v_Job_Cd         IN RTSD0118.JOB_CD%TYPE,         /*조회구분              */
    v_Auto_Yn        IN RTSD0118.AUTO_YN%TYPE,        /*자동발송여부          */
    v_Email_Addr     IN RTSD0118.EMAIL_ADDR%TYPE,     /*이메일 주소           */   
    v_Disp_Id        IN RTSD0118.DISP_ID%TYPE,        /*조회자ID              */
    v_Disp_Nm        IN RTSD0118.DISP_NM%TYPE,        /*조회자명              */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 전자서명 조회정보 - 순번(Seq) 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0118Seq(
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;
    
        
END Pkg_Rtsd0118;