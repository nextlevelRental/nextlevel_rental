CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0004 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0004
   PURPOSE   관리계정 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
   1.1        2017-04-17  wjim             [20170417_01] 일괄배정 프로세스 개선
   1.2        2017-04-24  wjim             [20170424_01] 일괄배정 수행구분 추가
*******************************************************************************/

  /*****************************************************************************
  -- 관리계정 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0004Count(
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE            /*설비번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 관리계정 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0004 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*주행거리(장착)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*조정관련 계약번호     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 관리계정 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0004 (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*주행거리(장착)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*조정관련 계약번호     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 관리계정 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0004 (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*주행거리(장착)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*조정관련 계약번호     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 관리계정 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0004 (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 관리계정 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0004 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*주행거리(장착)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*조정관련 계약번호     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 관리계정 정보 Update -  서비스 확인서 서명완료 등록
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0004AMileage (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 점검대상 집계
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob;
  
  /*****************************************************************************
  -- 점검대상 집계
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregate (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 관리계정 정보 - 계약번호로 기준년월 기준 검검예정일 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0004PlanDay(
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE            /*계약번호            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 점검대상 재집계를 위한 기존 집계내역 일괄 삭제처리
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAllDelete (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 점검대상 집계 (M-1월 20일)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 신규개발
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob1(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );  
  
  /*****************************************************************************
  -- 점검대상 집계 (M월 1일)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 신규개발
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob2(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
    
  /*****************************************************************************
  -- 점검대상 집계2+2 (M-1월 20일)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 신규개발
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob3(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );  
  
  /*****************************************************************************
  -- 점검대상 집계2+2 (M월 1일)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 신규개발
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob4(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  /*****************************************************************************
  -- 점검대상 집계 Ver.2
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 추가
   1.2        2017-04-24  wjim             [20170424_01] 수행구분 추가
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateNew (
      v_Std_Ym         IN RTCS0004.STD_YM%TYPE         /*기준년월              */
    , v_Mode           IN CHAR                         /*수행구분 (A : M-1월 20일 수행, B : M월 1일 수행)*/
    , v_Reg_Id         IN RTCS0004.REG_ID%TYPE         /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );

  /*****************************************************************************
  -- 점검대상 집계 Ver.2 2By2
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2019-03-22  kstka             [20190322_01] 추가
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregate2By2 (
      v_Std_Ym         IN RTCS0004.STD_YM%TYPE         /*기준년월              */
    , v_Mode           IN CHAR                         /*수행구분 (A : M-1월 20일 수행, B : M월 1일 수행)*/
    , v_Reg_Id         IN RTCS0004.REG_ID%TYPE         /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
END Pkg_Rtcs0004;