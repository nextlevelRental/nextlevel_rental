CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0002 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0002
   PURPOSE   차종_사양 명칭 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0002Count(
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,      /*사양                */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE             /*전후 구분           */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*차종-사양명           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*차종-사양명           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*차종-사양명           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종_사양 명칭 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0002 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*전후 구분             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*차종-사양명           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 차종_사양 명칭 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0002UseYnCount(
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE       /*사양                */
    ) RETURN NUMBER;
    

  /*****************************************************************************
  -- 차종_사양 명칭 관리 - 차종마스터 유효성 처리
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0002MasterCheck (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*사양                  */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
        
END Pkg_Rtsd0002;