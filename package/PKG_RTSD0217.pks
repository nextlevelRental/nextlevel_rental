CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0217 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0217
   PURPOSE   Paysign발송이력 Main

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-04-17  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- Paysign발송이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0217 (
    v_Ord_No         IN RTSD0217.ORD_NO%TYPE,        /*주문번호              */
    v_Send_Day       IN RTSD0217.SEND_DAY%TYPE,      
    v_Send_Yn        IN RTSD0217.SEND_YN%TYPE,
    v_Reg_Id         IN RTSD0217.REG_ID%TYPE,        /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- Paysign발송이력 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0217 (
    v_Ord_No         IN RTSD0217.ORD_NO%TYPE,        /*주문번호              */      
    v_Send_Yn        IN RTSD0217.SEND_YN%TYPE,
    v_Reg_Id         IN RTSD0217.REG_ID%TYPE,        /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- Paysign발송이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0217 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0217.ORD_NO%TYPE,        /*주문번호              */
    v_Send_Day       IN RTSD0217.SEND_DAY%TYPE,      
    v_Send_Yn        IN RTSD0217.SEND_YN%TYPE,
    v_Reg_Id         IN RTSD0217.REG_ID%TYPE,        /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- Paysign발송이력 - 저장여부확인
  *****************************************************************************/
  FUNCTION f_sRtsd0217Count(
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE           /*주문번호            */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0217;
/