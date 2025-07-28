CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0116 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0116
   PURPOSE   배송완료 대상 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 배송완료 대상 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0116Count(
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,           /*계약번호            */
    v_Vbeln          IN RTSD0116.VBELN%TYPE             /*SAP 주문번호        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 배송완료 대상 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0116 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS 발송일자          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS 발송여부          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 배송완료 대상 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0116 (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS 발송일자          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS 발송여부          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 배송완료 대상 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0116 (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS 발송일자          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS 발송여부          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 배송완료 대상 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0116 (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 배송완료 대상 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0116 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS 발송일자          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS 발송여부          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 배송완료 대상 Update - Erprecvdelivery
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0116Recv (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtsd0116;