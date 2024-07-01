CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0131 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0131
   PURPOSE   선납정보관리 

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2017-01-16  wjim             1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- 선납등록
  *****************************************************************************/
  PROCEDURE p_CreateRtre0131Prepay (
      v_Ord_No         IN VARCHAR2                            /* 계약번호     */
    , v_Prepay_Cd      IN VARCHAR2                            /* 선납개월코드 */
    , v_Str_Ym         IN VARCHAR2                            /* 선납시작년월 */
    , v_End_Ym         IN VARCHAR2                            /* 선납종료년월 */
    , v_Recp_Pay       IN VARCHAR2                            /* 결제방법     */
    , v_Prepay_Amt     IN NUMBER                              /* 선납결제금액 */
    , v_Tno            IN VARCHAR2                            /* PG거래번호   */
    , v_Id             IN VARCHAR2                            /* 등록자 ID    */    
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
END Pkg_Rtre0131;
/
