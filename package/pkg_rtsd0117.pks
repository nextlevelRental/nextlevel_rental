CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_RTSD0117 AS
/*******************************************************************************
   NAME:      Pkg_RTSD0117
   PURPOSE   ��ۿϷ� ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��ۿϷ� ��� Count
  *****************************************************************************/
  FUNCTION f_sRTSD0117Count(
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,           /*����ȣ            */
    v_Vbeln          IN RTSD0117.VBELN%TYPE             /*SAP �ֹ���ȣ        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ۿϷ� ��� Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0117 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0117.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0117.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ��ۿϷ� ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0117 (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0117.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0117.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ۿϷ� ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0117 (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0117.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0117.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ۿϷ� ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRTSD0117 (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ۿϷ� ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0117 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0117.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0117.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ��ۿϷ� ��� Update - Erprecvdelivery
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0117Recv (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*�������              */
    v_Reg_Id         IN RTSD0117.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_RTSD0117;
/
