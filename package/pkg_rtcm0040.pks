CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0040 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0040
   PURPOSE:    이미지 관리 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 이미지 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0040Count(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE        /*업로드파일번호        */
    ) RETURN NUMBER;
 
  /*****************************************************************************
  -- 이미지 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0040 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Reg_Fdt        IN VARCHAR,                      /*업로드일자FROM        */
    v_Reg_Tdt        IN VARCHAR,                      /*업로드일자TO          */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*주문번호              */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*논리적 파일명         */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE        /*업로드 프로그램       */
    );

  /*****************************************************************************
  -- 이미지 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*업로드파일번호        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*업로드파일그룹번호    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*논리적 파일명         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*물리적 파일명         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*파일사이즈            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*업로드 프로그램       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*주문번호              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 이미지 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*업로드파일번호        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*업로드파일그룹번호    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*논리적 파일명         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*물리적 파일명         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*파일사이즈            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*업로드 프로그램       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*주문번호              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 이미지 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*업로드파일번호        */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 이미지 관리 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0040(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*업로드파일번호        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*업로드파일그룹번호    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*논리적 파일명         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*물리적 파일명         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*파일사이즈            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*업로드 프로그램       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*주문번호              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

        
  /*****************************************************************************
  -- 이미지 관리 Count - 업로드파일번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcm0040Seq RETURN NUMBER;
  
  /*****************************************************************************
  -- 이미지 관리 Count - 업로드파일그룹번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcm0040GrpSeq RETURN NUMBER;
  
  PROCEDURE p_sRtcm0040FileGrpList (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_File_Grp_Seq        IN RTCM0040.FILE_GRP_SEQ%TYPE         /*업로드일자FROM        */
    );
    
  PROCEDURE p_sRtcm0040FileOne (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_File_Seq        IN RTCM0040.FILE_SEQ%TYPE         /*업로드일자FROM        */
  );
  
END Pkg_Rtcm0040;