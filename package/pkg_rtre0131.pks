CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0131 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0131
   PURPOSE   ������������ 

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2017-01-16  wjim             1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- �������
  *****************************************************************************/
  PROCEDURE p_CreateRtre0131Prepay (
      v_Ord_No         IN VARCHAR2                            /* ����ȣ     */
    , v_Prepay_Cd      IN VARCHAR2                            /* ���������ڵ� */
    , v_Str_Ym         IN VARCHAR2                            /* �������۳�� */
    , v_End_Ym         IN VARCHAR2                            /* ���������� */
    , v_Recp_Pay       IN VARCHAR2                            /* �������     */
    , v_Prepay_Amt     IN NUMBER                              /* ���������ݾ� */
    , v_Tno            IN VARCHAR2                            /* PG�ŷ���ȣ   */
    , v_Id             IN VARCHAR2                            /* ����� ID    */    
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
END Pkg_Rtre0131;
/
