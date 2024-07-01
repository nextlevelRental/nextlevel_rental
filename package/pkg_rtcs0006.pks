CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0006 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0006
   PURPOSE   방문점검 작업정보 변경 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
   1.1        2017-03-28  wjim             [20170324_02] 방문점검 컨택 관련기능 추가
   1.3        2017-04-04  wjim             [20170404_02] 시군구별 담당 로디안 조회기능 추가
   1.10       2017-12-20  wjim             [20171220_01] 정기점검 컨택관리 연락처 수정기능 추가
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검 작업정보 변경 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0006Count(
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,           /*설비번호            */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,          /*작업순번            */
    v_Seq            IN RTCS0006.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업정보 변경 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0006 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE             /*순번                  */
    );

  /*****************************************************************************
  -- 방문점검 작업정보 변경 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*지도 X좌표            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*지도 Y좌표            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
 /*****************************************************************************
  -- 방문점검 작업정보 변경 Insert 20181217고도화 v_Real_Mob_No 추가
  *****************************************************************************/
  FUNCTION f_InsertRtcs0006_New (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Real_Mob_No    IN RTCS0006.REAL_MOB_NO%TYPE,    /*실핸드폰                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*지도 X좌표            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*지도 Y좌표            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  /*****************************************************************************
  -- 방문점검 작업정보 변경 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*지도 X좌표            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*지도 Y좌표            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
/*****************************************************************************
  -- 방문점검 작업정보 변경 Update 20181217고도화 v_Real_Mob_No 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0006_New (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Real_Mob_No    IN RTCS0006.REAL_MOB_NO%TYPE,    /*실 핸드폰                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*지도 X좌표            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*지도 Y좌표            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업정보 변경 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업정보 변경 관리
  *****************************************************************************/
  PROCEDURE p_InsertRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN OUT RTCS0006.SEQ%TYPE,        /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 방문점검 작업정보 변경 - 순번 췌번 조회
  *****************************************************************************/
  FUNCTION f_sRtcs0006Seq(
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,           /*설비번호            */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE           /*작업순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업정보 - 우편번호(빌딩번호) 기준 Mr. Roadian 코드 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0006MrCd(
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE      /*빌딩번호              */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 우편번호(빌딩번호) 기준 Mr. Roadian 정보 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-28  wjim             [20170324_02] 신규개발
  *****************************************************************************/
  PROCEDURE p_sRtcs0006Mr(
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE      /*빌딩번호            */
  );
  
  /*****************************************************************************
  -- 시군구별 담당 로디안 정보 조회
  -- - 주소1 형태로 입력하면 파싱하여 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-04-04  wjim             [20170404_02] 시군구별 담당 로디안 조회기능 추가
  *****************************************************************************/
  PROCEDURE p_sRtcs0006MrAddr1(
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Addr1          IN RTCS0006.ADDR1%TYPE          /*주소1                */
  );

  /*****************************************************************************
  -- 방문점검 작업정보 컨택변경 관리
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-27  wjim             [20170324_02] 신규개발
   1.10       2017-12-20  wjim             [20171220_01] 핸드폰, 전화번호 수정기능 추가
  *****************************************************************************/
  PROCEDURE p_InsertRtcs0006Contact (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */    
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Ob_St          IN RTCS0005.OB_ST%TYPE,          /*상담상태              */    
    v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE,      /*상담세부상태          */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */--[20171220_01]
    v_Real_Mob_No    IN RTCS0006.REAL_MOB_NO%TYPE,    /*핸드폰                */--[20181217_01]
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */--[20171220_01]
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*정기점검상태          */--[20180419]
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*특이사항              */--[20180419]
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    

END Pkg_Rtcs0006;
/
