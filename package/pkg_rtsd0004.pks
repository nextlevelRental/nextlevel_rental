CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0004 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0004
   PURPOSE   ����_�������� �԰� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-29  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����_�������� �԰� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0004Count(
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*����                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,      /*���                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,            /*���� ����           */
    v_Section_Width  IN RTSD0004.SECTION_WIDTH%TYPE,    /*�ܸ���              */
    v_Aspect_Ratio   IN RTSD0004.ASPECT_RATIO%TYPE,     /*�����              */
    v_Wheel_Inches   IN RTSD0004.WHEEL_INCHES%TYPE,     /*��ġ                */
    v_Ply_Rating     IN RTSD0004.PLY_RATING%TYPE        /*PR(����)            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0004 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    );

  /*****************************************************************************
  -- ����_�������� �԰� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0004 (
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0004 (
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0004 (
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,          /*���� ����             */
    v_Section_Width  IN RTSD0004.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0004.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0004.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0004.PLY_RATING%TYPE,     /*PR(����)              */
    v_Reg_Id         IN RTSD0004.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����_�������� �԰� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0004 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ����_�������� �԰� ���� Count - ����,���,���ı��� ���� ������� �Ǽ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0004UseYnCount(
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*����                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,      /*���                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE             /*���� ����           */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[���]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004ContentsCd(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    );

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[���ı���]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004FrCd(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    );

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[PR����]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004PlyRatingCd(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    );

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[�ܸ���]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004SectionWidth(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    );

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[�����]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004AspectRatio(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    );

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[��ġ]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004WheelInches(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    );
   
  /*****************************************************************************
  -- ����_�ķ��������� ���� (LTR �̿��� ������ ��� �ķ��� 2������ ����)
  -- ���� ������ �������� ���������� ���� ��� WHEEL_QTY�� �����ϰ� �����ϸ� �ȴ�.
  *****************************************************************************/
  FUNCTION f_sRtsd0004WheelQty (
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,       /*����                  */
    v_Class_Cd       IN RTSD0004.CLASS_CD%TYPE,       /*���                  */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,          /*���� ����             */
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE          /*�ܸ���                */
  ) RETURN VARCHAR2;
    
END Pkg_Rtsd0004;
/
