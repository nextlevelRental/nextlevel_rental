CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0003 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0003
   PURPOSE   Ÿ�̾� �԰� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0003Count(
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,    /*�ܸ���              */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,     /*�����              */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,     /*��ġ                */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE        /*PR(����)            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0003 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*�԰�                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*�԰�2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*�԰�                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*�԰�2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*�԰�                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*�԰�2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0003 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*�԰�                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*�԰�2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtsd0003;
/
