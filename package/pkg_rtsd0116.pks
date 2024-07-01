CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0116 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0116
   PURPOSE   ��ۿϷ� ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��ۿϷ� ��� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0116Count(
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,           /*����ȣ            */
    v_Vbeln          IN RTSD0116.VBELN%TYPE             /*SAP �ֹ���ȣ        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ۿϷ� ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0116 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ��ۿϷ� ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0116 (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ۿϷ� ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0116 (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ۿϷ� ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0116 (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ۿϷ� ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0116 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*�������              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS �߼�����          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS �߼ۿ���          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ��ۿϷ� ��� Update - Erprecvdelivery
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0116Recv (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*����ȣ              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP �ֹ���ȣ          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP ��۹�ȣ          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*�������              */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtsd0116;
/
