CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0204 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0204
   PURPOSE   [CS] 윈터교체관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2017-12-08  K.S.T.           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] 윈터교체정보입력(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0204 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0204.ORD_NO%TYPE,         /*계약번호              */
    v_Input_Dt       IN RTCS0204.INPUT_DT%TYPE,       /*교체확인서작성일자    */
    v_Prs_Dcd        IN RTCS0204.PRS_DCD%TYPE,        /*서비스코드            */
    v_Write_Yn       IN RTCS0204.WRITE_YN%TYPE,       /*작성여부              */
    v_Reg_Id         IN RTCS0204.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );        
  
  /*****************************************************************************
  -- 윈터교체 확인서 작성순서
  *****************************************************************************/
  FUNCTION f_sRtcs0204ServCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE           /*주문번호            */
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- [CS] 윈터교체확인서 작성여부
  *****************************************************************************/
  FUNCTION f_sRtcs0204ServYn(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE           /*계약번호            */
  ) RETURN VARCHAR2;
        
END Pkg_Rtcs0204;
/
