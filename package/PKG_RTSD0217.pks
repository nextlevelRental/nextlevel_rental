CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0217 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0217
   PURPOSE   Paysign�߼��̷� Main

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-04-17  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- Paysign�߼��̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0217 (
    v_Ord_No         IN RTSD0217.ORD_NO%TYPE,        /*�ֹ���ȣ              */
    v_Send_Day       IN RTSD0217.SEND_DAY%TYPE,      
    v_Send_Yn        IN RTSD0217.SEND_YN%TYPE,
    v_Reg_Id         IN RTSD0217.REG_ID%TYPE,        /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- Paysign�߼��̷� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0217 (
    v_Ord_No         IN RTSD0217.ORD_NO%TYPE,        /*�ֹ���ȣ              */      
    v_Send_Yn        IN RTSD0217.SEND_YN%TYPE,
    v_Reg_Id         IN RTSD0217.REG_ID%TYPE,        /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- Paysign�߼��̷� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0217 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0217.ORD_NO%TYPE,        /*�ֹ���ȣ              */
    v_Send_Day       IN RTSD0217.SEND_DAY%TYPE,      
    v_Send_Yn        IN RTSD0217.SEND_YN%TYPE,
    v_Reg_Id         IN RTSD0217.REG_ID%TYPE,        /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- Paysign�߼��̷� - ���忩��Ȯ��
  *****************************************************************************/
  FUNCTION f_sRtsd0217Count(
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE           /*�ֹ���ȣ            */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0217;
/