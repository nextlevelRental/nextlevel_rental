CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0216 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0216
   PURPOSE   Paysign발송이력

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-03-29  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- Paysign발송이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0216 (
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE,        /*주문번호              */
    v_Seq            IN RTSD0216.SEQ%TYPE,           /*순번                 */
    v_Work_Gb        IN RTSD0216.WORK_GB%TYPE,       /*작업구분              */
    v_Params         IN RTSD0216.PARAMS%TYPE,        /*파라미터정보           */
    v_Result         IN RTSD0216.RESULT%TYPE,        /*결과                 */
    v_Reg_Id         IN RTSD0216.REG_ID%TYPE,        /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- Paysign발송이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0216 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE,        /*주문번호              */
    v_Work_Gb        IN RTSD0216.WORK_GB%TYPE,       /*작업구분              */
    v_Params         IN RTSD0216.PARAMS%TYPE,        /*파라미터정보           */
    v_Result         IN RTSD0216.RESULT%TYPE,        /*결과                 */
    v_Reg_Id         IN RTSD0216.REG_ID%TYPE,        /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- Paysign발송이력 - 순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0216Seq(
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE           /*주문번호            */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0216;
/