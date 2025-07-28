CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0012 AS
/*******************************************************************************
    NAME        Pkg_Rtcs0012
    PURPOSE     방문점검 컨택정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-03-27  wjim            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검 컨택정보 Select
  *****************************************************************************/
  PROCEDURE p_sRTCS0012 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE           /* 계약번호         */
  );
  
  /*****************************************************************************
  -- 방문점검 컨택정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTCS0012 (
      v_Std_Ym          IN RTCS0012.STD_YM%TYPE     /* 기준년월   */
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE     /* 계약번호   */
    , v_Equ_No          IN RTCS0012.EQU_NO%TYPE     /* 설비번호   */
    , v_Job_Seq         IN RTCS0012.JOB_SEQ%TYPE    /* 작업순번   */
    , v_Seq             IN RTCS0012.SEQ%TYPE        /* 변경순번   */
    , v_Call_Day        IN RTCS0012.CALL_DAY%TYPE   /* 상담일자   */
    , v_Call_Tm         IN RTCS0012.CALL_TM%TYPE    /* 상담시간   */
    , v_Call_Dtl        IN RTCS0012.CALL_DTL%TYPE   /* 상담내용   */ 
    , v_Reg_Id          IN RTCS0012.REG_ID%TYPE     /* 등록자ID   */
    , v_Recall_Day      IN RTCS0012.RECALL_DAY%TYPE /* 재컨택일자 */
    , v_Recall_Tm       IN RTCS0012.RECALL_TM%TYPE  /* 재컨택시간 */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 컨택정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCS0012 (
      v_Std_Ym          IN RTCS0012.STD_YM%TYPE     /* 기준년월   */
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE     /* 계약번호   */
    , v_Equ_No          IN RTCS0012.EQU_NO%TYPE     /* 설비번호   */
    , v_Job_Seq         IN RTCS0012.JOB_SEQ%TYPE    /* 작업순번   */
    , v_Seq             IN RTCS0012.SEQ%TYPE        /* 변경순번   */
    , v_Call_Seq        IN RTCS0012.CALL_SEQ%TYPE   /* 상담순번   */
    , v_Call_Day        IN RTCS0012.CALL_DAY%TYPE   /* 상담일자   */
    , v_Call_Tm         IN RTCS0012.CALL_TM%TYPE    /* 상담시간   */
    , v_Call_Dtl        IN RTCS0012.CALL_DTL%TYPE   /* 상담내용   */ 
    , v_Reg_Id          IN RTCS0012.REG_ID%TYPE     /* 등록자ID   */
    , v_Recall_Day      IN RTCS0012.RECALL_DAY%TYPE /* 재컨택일자 */
    , v_Recall_Tm       IN RTCS0012.RECALL_TM%TYPE  /* 재컨택시간 */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 방문점검 컨택정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0012 (
      v_Comm_Dvsn       IN CHAR                     /* 처리구분(I,U,D) */
    , v_Std_Ym          IN RTCS0012.STD_YM%TYPE     /* 기준년월        */
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE     /* 계약번호        */
    , v_Equ_No          IN RTCS0012.EQU_NO%TYPE     /* 설비번호        */
    , v_Job_Seq         IN RTCS0012.JOB_SEQ%TYPE    /* 작업순번        */
    , v_Seq             IN RTCS0012.SEQ%TYPE        /* 변경순번        */
    , v_Call_Seq        IN RTCS0012.CALL_SEQ%TYPE   /* 상담순번        */
    , v_Call_Day        IN RTCS0012.CALL_DAY%TYPE   /* 상담일자        */
    , v_Call_Tm         IN RTCS0012.CALL_TM%TYPE    /* 상담시간        */
    , v_Call_Dtl        IN RTCS0012.CALL_DTL%TYPE   /* 상담내용        */   
    , v_Reg_Id          IN RTCS0012.REG_ID%TYPE     /* 등록자ID        */
    , v_Recall_Day      IN RTCS0012.RECALL_DAY%TYPE /* 재컨택일자      */
    , v_Recall_Tm       IN RTCS0012.RECALL_TM%TYPE  /* 재컨택시간      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );  
        
END Pkg_Rtcs0012;