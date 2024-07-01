CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0216 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0216
   PURPOSE   Paysign�߼��̷�

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-03-29  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- Paysign�߼��̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0216 (
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE,        /*�ֹ���ȣ              */
    v_Seq            IN RTSD0216.SEQ%TYPE,           /*����                 */
    v_Work_Gb        IN RTSD0216.WORK_GB%TYPE,       /*�۾�����              */
    v_Params         IN RTSD0216.PARAMS%TYPE,        /*�Ķ��������           */
    v_Result         IN RTSD0216.RESULT%TYPE,        /*���                 */
    v_Reg_Id         IN RTSD0216.REG_ID%TYPE,        /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- Paysign�߼��̷� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0216 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE,        /*�ֹ���ȣ              */
    v_Work_Gb        IN RTSD0216.WORK_GB%TYPE,       /*�۾�����              */
    v_Params         IN RTSD0216.PARAMS%TYPE,        /*�Ķ��������           */
    v_Result         IN RTSD0216.RESULT%TYPE,        /*���                 */
    v_Reg_Id         IN RTSD0216.REG_ID%TYPE,        /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- Paysign�߼��̷� - ���� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0216Seq(
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE           /*�ֹ���ȣ            */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0216;
/