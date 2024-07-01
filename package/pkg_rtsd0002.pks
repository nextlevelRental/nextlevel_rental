CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0002 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0002
   PURPOSE   ����_��� ��Ī ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ����_��� ��Ī ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0002Count(
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,         /*����                */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,      /*���                */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE             /*���� ����           */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����_��� ��Ī ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*����-����           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ����_��� ��Ī ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*����-����           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����_��� ��Ī ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*����-����           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����_��� ��Ī ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0002 (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����_��� ��Ī ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0002 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0002.FR_CD%TYPE,          /*���� ����             */
    v_Mc_Nm          IN RTSD0002.MC_NM%TYPE,          /*����-����           */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ����_��� ��Ī ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0002UseYnCount(
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,         /*����                */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE       /*���                */
    ) RETURN NUMBER;
    

  /*****************************************************************************
  -- ����_��� ��Ī ���� - ���������� ��ȿ�� ó��
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0002MasterCheck (
    v_Model_Cd       IN RTSD0002.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE,    /*���                  */
    v_Reg_Id         IN RTSD0002.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
        
END Pkg_Rtsd0002;
/
