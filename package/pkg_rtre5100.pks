CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE5100 AS
/*******************************************************************************
    NAME        PKG_RTRE5100
    PURPOSE     방문점검수수료 변경 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-25  wjim            신규작성
*******************************************************************************/

  /*****************************************************************************
  -- 작업회차 채번
  *****************************************************************************/
  FUNCTION f_sRtre5100JobSeq (
      v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*마감년월            */
  ) RETURN NUMBER;
 
  /*****************************************************************************
  -- 서비스수수료 변경 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5100 (
      v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*마감년월            */
    , v_Job_Seq        IN RTRE5100.JOB_SEQ%TYPE         /*작업회차            */
    , v_Std_Ym         IN RTRE5100.STD_YM%TYPE          /*배정기준년월        */
    , v_Ord_No         IN RTRE5100.ORD_NO%TYPE          /*계약번호            */
    , v_Amt_Comm       IN RTRE5100.AMT_COMM%TYPE        /*변경수수료          */    
    , v_Reg_Id         IN RTRE5100.REG_ID%TYPE          /*작업자 ID           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 방문점검수수료 변경 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5100 (
      v_Comm_Dvsn      IN CHAR                          /*처리구분(I,U,D)     */
    , v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*마감년월            */
    , v_Job_Seq        IN RTRE5100.JOB_SEQ%TYPE         /*작업회차            */
    , v_Std_Ym         IN RTRE5100.STD_YM%TYPE          /*배정기준년월        */
    , v_Ord_No         IN RTRE5100.ORD_NO%TYPE          /*계약번호            */
    , v_Amt_Comm       IN RTRE5100.AMT_COMM%TYPE        /*변경수수료          */    
    , v_Reg_Id         IN RTRE5100.REG_ID%TYPE          /*작업자 ID           */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
        
END PKG_RTRE5100;
/
