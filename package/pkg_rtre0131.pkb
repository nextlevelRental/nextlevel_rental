CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0131 AS
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
  ) IS
    
    v_Recv_Seq  RTRE0041.RECV_SEQ%TYPE DEFAULT NULL;  /*수납거래번호          */
    e_Error EXCEPTION;
    
  BEGIN
  
    -- 필수값:주문번호, 등록자 ID, 상세서비스    
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '고객번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    v_Recv_Seq := Pkg_Rtre0041.f_sRtre0041RecvSeq();
        
    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    
  EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0131.p_CreateRtre0131Prepay(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0131.p_CreateRtre0131Prepay(2)', v_ErrorText, v_Return_Message);
        
  END p_CreateRtre0131Prepay;
  
END Pkg_Rtre0131;
/