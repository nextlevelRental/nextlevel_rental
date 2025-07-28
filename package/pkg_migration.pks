CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Migration AS
/*******************************************************************************
   NAME      Pkg_Migration
   PURPOSE    ; 마이그레이션
   
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-01-05  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 점검대상 재집계를 위한 기존 집계내역 Migration
  *****************************************************************************/
  PROCEDURE p_TargetAggMigration(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 계약번호 기준 관련 데이터 삭제처리
  *****************************************************************************/
  PROCEDURE p_OrdNoDelete (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 삭제 된 계약정보(RTSD0104) 기준  관련 테이블 및 삭제 대상 계약번호 조회
  *****************************************************************************/
  PROCEDURE p_DeleteOrdNoSelect (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*계약번호              */
    );
      
END Pkg_Migration;