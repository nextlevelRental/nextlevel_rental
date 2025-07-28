CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0218 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0218
   PURPOSE   Paysign발송이력(동의, 약관)

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2025-03-13  10243054         1. Created this package body.
*******************************************************************************/

/*****************************************************************************
-- Paysign발송이력(동의, 약관) Insert
*****************************************************************************/
  PROCEDURE p_InsertRtsd0218 (
    v_Template_Seq   IN RTSD0218.TEMPLATE_SEQ%TYPE,   /*템플릿번호*/
    v_Receiver_Seq   IN RTSD0218.RECEIVER_SEQ%TYPE,   /*수신인번호*/
    v_Doc_Seq        IN RTSD0218.DOC_SEQ%TYPE,        /*문서번호*/
    v_Send_Code      IN RTSD0218.SEND_CODE%TYPE,      /*응답코드*/
    v_Send_Message   IN RTSD0218.SEND_MESSAGE%TYPE,   /*응답메시지*/
    v_Ord_No   		 IN RTSD0218.ORD_NO%TYPE,   	  /*주문번호*/
    v_Cust_No		 IN RTSD0218.CUST_NO%TYPE,   	  /*고객번호*/
    v_Cust_Nm        IN RTSD0218.CUST_NM%TYPE,        /*고객이름*/
    v_Mob_No         IN RTSD0218.MOB_NO%TYPE,         /*휴대폰번호*/
    v_Birth_Day      IN RTSD0218.BIRTH_DAY%TYPE,      /*법정생년월일*/
    v_State      	 IN RTSD0218.STATE%TYPE,      	  /*상태*/
    v_Reg_Id         IN RTSD0218.REG_ID%TYPE,         /*등록자ID*/
    v_Chg_Id         IN RTSD0218.CHG_ID%TYPE,         /*변경자ID*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

/*****************************************************************************
-- Paysign발송이력(동의, 약관) Update
*****************************************************************************/
  PROCEDURE p_UpdateRtsd0218 (
    v_Receiver_Seq   IN RTSD0218.RECEIVER_SEQ%TYPE,   /*수신인번호            */
    v_Doc_Seq        IN RTSD0218.DOC_SEQ%TYPE,        /*문서번호              */
    v_Send_Code      IN RTSD0218.SEND_CODE%TYPE,      /*응답코드              */
    v_Send_Message   IN RTSD0218.SEND_MESSAGE%TYPE,   /*응답메시지            */
    v_State          IN RTSD0218.STATE%TYPE,          /*상태                 */
    v_Chg_Id         IN RTSD0218.CHG_ID%TYPE,         /*변경자ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

/*****************************************************************************
-- Paysign발송이력(동의, 약관) CUST_NO Update
*****************************************************************************/
  PROCEDURE p_UpdateCustNoRtsd0218 (
    v_Receiver_Seq   IN RTSD0218.RECEIVER_SEQ%TYPE,   /*수신인번호            */
    v_Doc_Seq        IN RTSD0218.DOC_SEQ%TYPE,        /*문서번호              */
    v_Cust_No        IN RTSD0218.CUST_NO%TYPE,        /*고객번호              */
    v_Chg_Id         IN RTSD0218.CHG_ID%TYPE,         /*변경자ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

/*****************************************************************************
-- Paysign발송이력(동의, 약관) ORD_NO Update
*****************************************************************************/
  PROCEDURE p_UpdateOrdNoRtsd0218 (
    v_Receiver_Seq   IN RTSD0218.RECEIVER_SEQ%TYPE,   /*수신인번호            */
    v_Doc_Seq        IN RTSD0218.DOC_SEQ%TYPE,        /*문서번호              */
    v_Ord_No         IN RTSD0218.ORD_NO%TYPE,         /*주문번호              */
    v_Chg_Id         IN RTSD0218.CHG_ID%TYPE,         /*변경자ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

/*****************************************************************************
-- Paysign 전후륜 구분 타입 주문 만족도조사 발송 여부
*****************************************************************************/
  PROCEDURE p_sRtsd0218FrontRearSendYn (
    v_OrdNo			 	IN VARCHAR2,					/*주문번호*/
    v_FrontRearSendYn	OUT VARCHAR2                   	/*발송여부*/
    );

END Pkg_Rtsd0218;