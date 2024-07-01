CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0011 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0011
   PURPOSE:    ���α׷� Master ���

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- ���α׷� Master CountT
  *****************************************************************************/
  FUNCTION f_sRtcm0011Count(
    v_Prgm_Cd    IN     RTCM0011.PRGM_CD%TYPE           /*���α׷��ڵ�        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���α׷� Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0011 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Prgm_Cd    IN     RTCM0011.PRGM_CD%TYPE,          /*���α׷��ڵ�        */
    v_Prgm_Nm    IN     RTCM0011.PRGM_NM%TYPE           /*���α׷���          */
    );

  /*****************************************************************************
  -- ���α׷� Master Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0011(
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE,        /*���α׷���            */
    v_Prgm_Path      IN RTCM0011.PRGM_PATH%TYPE,      /*���α׷����          */
    v_Prgm_Desc      IN RTCM0011.PRGM_DESC%TYPE,      /*���α׷�����          */
    v_Mdl_Cd         IN RTCM0011.MDL_CD%TYPE,         /*����ڵ�              */
    v_Use_Yn         IN RTCM0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0011.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- ���α׷� Master Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0011(
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE,        /*���α׷���            */
    v_Prgm_Path      IN RTCM0011.PRGM_PATH%TYPE,      /*���α׷����          */
    v_Prgm_Desc      IN RTCM0011.PRGM_DESC%TYPE,      /*���α׷�����          */
    v_Mdl_Cd         IN RTCM0011.MDL_CD%TYPE,         /*����ڵ�              */
    v_Use_Yn         IN RTCM0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0011.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���α׷� Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0011(
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Reg_Id         IN RTCM0011.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���α׷� Master ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0011(
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D)      */
    v_Prgm_Cd        IN RTCM0011.PRGM_CD%TYPE,        /*���α׷��ڵ�          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE,        /*���α׷���            */
    v_Prgm_Path      IN RTCM0011.PRGM_PATH%TYPE,      /*���α׷����          */
    v_Prgm_Desc      IN RTCM0011.PRGM_DESC%TYPE,      /*���α׷�����          */
    v_Mdl_Cd         IN RTCM0011.MDL_CD%TYPE,         /*����ڵ�              */
    v_Use_Yn         IN RTCM0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0011.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
  
END Pkg_Rtcm0011;
/
