CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0122 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0122
    PURPOSE     가계약 상담정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2016-07-28  wjim            1. Created this package body.
    1.1     2016-09-20  wjim            재컨택일자,시간 추가
*******************************************************************************/

  /*****************************************************************************
  -- 가계약 상담정보 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0122 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호         */
  );
  
  /*****************************************************************************
  -- 가계약 상담정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0122 (
      v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* 가계약번호 */
    , v_Call_Day        IN RTSD0122.CALL_DAY%TYPE   /* 상담일자   */
    , v_Call_Tm         IN RTSD0122.CALL_TM%TYPE    /* 상담시간   */
    , v_Call_Dtl        IN RTSD0122.CALL_DTL%TYPE   /* 상담내용   */ 
    , v_Reg_Id          IN RTSD0122.REG_ID%TYPE     /* 등록자ID   */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE /* 재컨택일자 */
    , v_Recall_Tm       IN RTSD0122.RECALL_TM%TYPE  /* 재컨택시간 */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 가계약 상담정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0122 (
      v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* 가계약번호 */      
    , v_Call_Seq        IN RTSD0122.CALL_SEQ%TYPE   /* 상담순번   */
    , v_Call_Day        IN RTSD0122.CALL_DAY%TYPE   /* 상담일자   */
    , v_Call_Tm         IN RTSD0122.CALL_TM%TYPE    /* 상담시간   */
    , v_Call_Dtl        IN RTSD0122.CALL_DTL%TYPE   /* 상담내용   */ 
    , v_Reg_Id          IN RTSD0122.REG_ID%TYPE     /* 등록자ID   */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE /* 재컨택일자 */
    , v_Recall_Tm       IN RTSD0122.RECALL_TM%TYPE  /* 재컨택시간 */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 가계약 상담정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0122 (
      v_Comm_Dvsn       IN CHAR                     /* 처리구분(I,U,D) */
    , v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* 가계약번호      */
    , v_Call_Seq        IN RTSD0122.CALL_SEQ%TYPE   /* 상담순번        */
    , v_Call_Day        IN RTSD0122.CALL_DAY%TYPE   /* 상담일자        */
    , v_Call_Tm         IN RTSD0122.CALL_TM%TYPE    /* 상담시간        */
    , v_Call_Dtl        IN RTSD0122.CALL_DTL%TYPE   /* 상담내용        */   
    , v_Reg_Id          IN RTSD0122.REG_ID%TYPE     /* 등록자ID        */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE /* 재컨택일자      */
    , v_Recall_Tm       IN RTSD0122.RECALL_TM%TYPE  /* 재컨택시간      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 재렌탈계약상담  Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0121Rental (
    v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* 가계약번호      */
    ) RETURN NUMBER;
            
END Pkg_Rtsd0122;