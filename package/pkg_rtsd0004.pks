CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0004 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0004
   PURPOSE   차종_장착가능 규격 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-29  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0004Count(
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,      /*사양                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,            /*전후 구분           */
    v_Section_Width  IN RTSD0004.SECTION_WIDTH%TYPE,    /*단면폭              */
    v_Aspect_Ratio   IN RTSD0004.ASPECT_RATIO%TYPE,     /*편평비              */
    v_Wheel_Inches   IN RTSD0004.WHEEL_INCHES%TYPE,     /*인치                */
    v_Ply_Rating     IN RTSD0004.PLY_RATING%TYPE        /*PR(강도)            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0004 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    );

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0004 (
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0004 (
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0004 (
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,          /*전후 구분             */
    v_Section_Width  IN RTSD0004.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0004.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0004.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0004.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Reg_Id         IN RTSD0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0004 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Count - 차종,사양,전후구분 기준 사용중인 건수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0004UseYnCount(
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,      /*사양                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE             /*전후 구분           */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[사양]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004ContentsCd(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    );

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[전후구분]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004FrCd(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    );

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[PR강도]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004PlyRatingCd(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    );

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[단면폭]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004SectionWidth(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    );

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[편평비]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004AspectRatio(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    );

  /*****************************************************************************
  -- 차종_장착가능 규격 관리 Select[인치]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004WheelInches(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(강도)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*바퀴수              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*장착가능 바퀴수     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*차량분류            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*사용여부            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*등록자 ID           */
    );
   
  /*****************************************************************************
  -- 차종_후륜장착가능 수량 (LTR 이외의 차량의 경우 후륜은 2본으로 고정)
  -- 추후 마스터 기준으로 장착본수를 정할 경우 WHEEL_QTY를 조정하게 변경하면 된다.
  *****************************************************************************/
  FUNCTION f_sRtsd0004WheelQty (
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,       /*차종                  */
    v_Class_Cd       IN RTSD0004.CLASS_CD%TYPE,       /*사양                  */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,          /*전후 구분             */
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE          /*단면폭                */
  ) RETURN VARCHAR2;
    
END Pkg_Rtsd0004;