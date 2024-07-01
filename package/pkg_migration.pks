CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Migration AS
/*******************************************************************************
   NAME      Pkg_Migration
   PURPOSE    ; ���̱׷��̼�
   
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-01-05  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���˴�� �����踦 ���� ���� ���賻�� Migration
  *****************************************************************************/
  PROCEDURE p_TargetAggMigration(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*���س��              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ����ȣ ���� ���� ������ ����ó��
  *****************************************************************************/
  PROCEDURE p_OrdNoDelete (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*����ȣ              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���� �� �������(RTSD0104) ����  ���� ���̺� �� ���� ��� ����ȣ ��ȸ
  *****************************************************************************/
  PROCEDURE p_DeleteOrdNoSelect (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*����ȣ              */
    );
      
END Pkg_Migration;
/
