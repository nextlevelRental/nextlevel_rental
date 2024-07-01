CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0001 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0001
   PURPOSE   ���� ������ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� ������ Count
  *****************************************************************************/
  FUNCTION f_sRtsd0001Count(
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,         /*����                */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE       /*���                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ������ Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0001 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*ī����Ŀ              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*���                  */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���� ������ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*���                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*ī����Ŀ              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*���                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*ī����Ŀ              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ������ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*���                  */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0001 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*���                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*ī����Ŀ              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���� ������ Select - ī����Ŀ�� �𵨸� ��ȸ(������ ���)- ��ǰ ������ ��ȸ �˾�
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelName(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE        /*ī����Ŀ              */
    );

  /*****************************************************************************
  -- ���� ������ Select - ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*ī����Ŀ              */
	v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE         /*����              	 */
    );

  /*****************************************************************************
  -- ���� ������ Select - ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelByClassSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*ī����Ŀ              */
    v_Class_Cd       IN RTSD0004.CLASS_CD%TYPE         /*�����з�              */
  );
    
  /*****************************************************************************
  -- ���� ������ Select - ��� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ContentsSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*ī����Ŀ              */
	v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE         /*����              	 */
    );

  /*****************************************************************************
  -- ���� ������ Select - ������������  ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0001CarMasterSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*ī����Ŀ              */
	v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,        /*����              	  */
	v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,        /*����              	  */
	v_Use_Yn		 IN RTSD0002.USE_YN%TYPE          /*��뿩��              */
    );

  /*****************************************************************************
  -- ���� ������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0001UseYn (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*���                  */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
END Pkg_Rtsd0001;
/
