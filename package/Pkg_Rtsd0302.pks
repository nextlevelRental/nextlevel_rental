CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0302 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0302
   PURPOSE   [SD] NexenCheck 서비스 관련

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2019-12-09  kstka            1. Created this package body.
*******************************************************************************/
      
  /*****************************************************************************
  -- 발송이력저장
  -- 2020.09.09 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IRtsd0302 (
    v_Ord_No        RTSD0302.ORD_NO%TYPE,
    v_Proc_Day      RTSD0302.PROC_DAY%TYPE,
    v_Std_Day       RTSD0302.STD_DAY%TYPE,
    v_Cnt_Cd        RTSD0302.CNT_CD%TYPE,
    v_Period_Cd     RTSD0302.PERIOD_CD%TYPE,
    v_Reg_Id        RTSD0302.REG_ID%TYPE
  );

  /*****************************************************************************
  -- 2개월마다 발송처리
  -- 2020.09.09 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_Rtsd0302Aggregate (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
  );
  
  /*****************************************************************************
  -- 발송예정일 계산
  *****************************************************************************/
  FUNCTION f_sRtsd0302PlanDay(
    v_Ord_No    IN  RTSD0302.ORD_NO%TYPE            /*주문번호        */
    ) RETURN VARCHAR;
    
END Pkg_Rtsd0302;
/
