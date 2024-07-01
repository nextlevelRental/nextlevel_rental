CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE5090 AS
/*******************************************************************************
    NAME        PKG_RTRE5090
    PURPOSE     방문점검수수료 기초집계 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검수수료 기초집계 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
  *****************************************************************************/
  PROCEDURE p_sRtre5090 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE         /*마감년월            */    
  );

  /*****************************************************************************
   -- 방문점검수수료 기초 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
   *****************************************************************************/
  PROCEDURE p_CreateRtre5090RegularchkComm(  v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE  /* 마감년월 */
                                           , v_Amt_Comm       IN RTRE5090.AMT_COMM%TYPE /*기본수수료 */
                                           , v_Reg_Id         IN RTRE5090.REG_ID%TYPE   /* 작업자 ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_ErrorText      OUT VARCHAR2
                                          );
  
  /*****************************************************************************
  -- 방문점검수수료 변경
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
  *****************************************************************************/
  FUNCTION f_UpdateRtre5090Commamt (
      v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE         /*마감년월            */
    , v_Std_Ym         IN RTRE5090.STD_YM%TYPE          /*배정기준년월        */
    , v_Ord_No         IN RTRE5090.ORD_NO%TYPE          /*계약번호            */
    , v_Amt_Comm       IN RTRE5090.AMT_COMM%TYPE        /*변경수수료          */
    , v_Chg_Job_Seq    IN RTRE5090.CHG_JOB_SEQ%TYPE     /*변경작업회차        */        
    , v_Reg_Id         IN RTRE5090.REG_ID%TYPE          /*작업자 ID           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

/*****************************************************************************
  -- NEW 방문점검수수료 기초 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5090RegularchkNew (
      v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE         /*마감년월          */
    , v_Reg_Id         IN RTRE5090.REG_ID%TYPE       /*작업자 ID           */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );

END PKG_RTRE5090;
/
