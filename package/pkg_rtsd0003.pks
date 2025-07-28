CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0003 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0003
   PURPOSE   타이어 규격 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 타이어 규격 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0003Count(
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,    /*단면폭              */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,     /*편평비              */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,     /*인치                */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE        /*PR(강도)            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 타이어 규격 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0003 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*규격                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*규격2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 타이어 규격 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*규격                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*규격2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 타이어 규격 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*규격                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*규격2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 타이어 규격 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 타이어 규격 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0003 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*규격                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*규격2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtsd0003;