CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0005 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0005
   PURPOSE   방문점검 작업목록 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
   1.1        2017-03-24  wjim             [20170324_02] 방문점검 컨택 관련기능 추가
   1.2        2017-04-06  wjim             [20170406_01] 로디안별 방문점검 컨택 확정건수 조회기능 추가
   1.9        2017-06-08  wjim             [20170608_01] 방문점검 컨택목록 조회조건(처리상태) 추가
   1.11       2017-08-22  wjim             [20170822_01] 방문점검 바이럴 프로모션 신청대상 등록 추가
   1.13       2017-12-12  wjim             [20171212_01] 방문점검 컨택목록 조회조건 추가
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검 작업목록 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0005Count(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,           /*설비번호            */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE           /*작업순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업목록 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0005 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*처리여부              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*점검예정일자(최초)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*점검예정시간(최초)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 방문점검 작업목록 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0005 (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*처리여부              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*점검예정일자(최초)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*점검예정시간(최초)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업목록 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0005 (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*처리여부              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*점검예정일자(최초)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*점검예정시간(최초)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업목록 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0005 (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업목록 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0005 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN OUT RTCS0005.JOB_SEQ%TYPE,    /*작업순번              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*처리여부              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*점검예정일자(최초)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*점검예정시간(최초)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 방문점검 작업목록 - 작업순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtcs0005JobSeq(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE            /*설비번호            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 방문점검 작업목록 Select  - 검검 작업목록 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0005JobList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE           /*Mr. Roadian코드       */
    );

  /*****************************************************************************
  -- 방문점검 작업목록 Update - 검검 작업목록 조회-정보변경-저장시 정보변경
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0005Info (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업목록 Select - 점검 작업목록조회 - 처리결과 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0005Result (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 방문점검 작업목록 - 미처리사유 업데이트
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0005NpDesc (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Np_Cd          IN RTCS0005.NP_CD%TYPE,          /*미처리코드            */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 방문점검 작업목록 Update -  서비스 확인서 서명완료 등록
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0005ServiceSign (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문점검 작업목록 - 작업상태 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0005ChkStat(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,           /*설비번호            */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE           /*작업순번            */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- 방문점검 컨택목록 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-24  wjim             [20170324_02] 신규개발
   1.9        2017-06-08  wjim             [20170608_01] 방문점검 컨택목록 조회조건(처리상태) 추가
   1.13       2017-12-12  wjim             [20171212_01] 계약번호 조회조건 추가
  *****************************************************************************/
  PROCEDURE p_sRtcs0005CallList (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*기준년월              */
    , v_Do_Nm          IN RTSD0010.DO_NM%TYPE         /*광역시도              */
    , v_Ct_Nm          IN RTSD0010.CT_NM%TYPE         /*시군구                */
    , v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*고객명                */
    , v_Mob_No         IN RTCS0006.MOB_NO%TYPE        /*연락처                */
    , v_Ob_St          IN RTCS0005.OB_ST%TYPE         /*컨택상태              */
    , v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE     /*컨택세부상태          */
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*예정일자              */
    , v_Reg_Id         IN RTCS0005.REG_ID%TYPE        /*등록자 ID             */ 
    , v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE      /*처리상태              */
    , v_Ord_No         IN RTCS0005.ORD_NO%TYPE        /*계약번호              */ --[20171212_01]
  );
  
  /*****************************************************************************
  -- 방문점검 컨택목록 조회(엑셀다운로드용)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-29  wjim             [20170324_02] 신규개발
   1.9        2017-06-08  wjim             [20170608_01] 방문점검 컨택목록 조회조건(처리상태) 추가
   1.13       2017-12-12  wjim             [20171212_01] 계약번호 조회조건 추가
  *****************************************************************************/
  PROCEDURE p_sRtcs0005CallExcelList (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*기준년월              */
    , v_Do_Nm          IN RTSD0010.DO_NM%TYPE         /*광역시도              */
    , v_Ct_Nm          IN RTSD0010.CT_NM%TYPE         /*시군구                */
    , v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*고객명                */
    , v_Mob_No         IN RTCS0006.MOB_NO%TYPE        /*연락처                */
    , v_Ob_St          IN RTCS0005.OB_ST%TYPE         /*컨택상태              */
    , v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE     /*컨택세부상태          */
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*예정일자              */
    , v_Reg_Id         IN RTCS0005.REG_ID%TYPE        /*등록자 ID             */
    , v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE      /*처리상태              */
    , v_Ord_No         IN RTCS0005.ORD_NO%TYPE        /*계약번호              */ --[20171212_01]
  );
  
  /*****************************************************************************
  -- 월별 로디안별 방문점검 컨택 완료건수 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-04-06  wjim             [20170406_01] 신규개발
  *****************************************************************************/
  PROCEDURE p_sRtcs0005MrMonDecideCnt (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*조회년월              */
  );
  
  /*****************************************************************************
  -- 일자별 로디안별 방문점검 컨택 완료건 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-04-06  wjim             [20170406_01] 신규개발
  *****************************************************************************/
  PROCEDURE p_sRtcs0005MrDayDecide (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*조회일                */
  );
  
  /*****************************************************************************
  -- 방문점검 바이럴 프로모션 신청대상 등록
     - 쇼핑몰에서 고객이 직접 등록한 경우 해당 방문점검의 컨택상태를 '완료-이벤트대상'으로 변경
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.11    2017-08-22  wjim            [20170822_01]
  *****************************************************************************/
  PROCEDURE p_UpdatePromoApply (
      v_Cust_Nm         IN RTSD0100.CUST_NM%TYPE     /* 고객명        */
    , v_Birth_Day       IN RTSD0100.BIRTH_DAY%TYPE   /* 법정생년월일  */
    , v_std_ym_f        IN RTCS0005.STD_YM%TYPE      /* 프로모션 대상 방문점검 기준년월(from) */
    , v_std_ym_t        IN RTCS0005.STD_YM%TYPE      /* 프로모션 대상 방문점검 기준년월(to)   */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 방문점검 컨택목록 조회(미래회차정보 포함)
  *****************************************************************************/
  PROCEDURE p_sRtcs0005CallRglrList (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*기준년월              */
    , v_Do_Nm          IN RTSD0010.DO_NM%TYPE         /*광역시도              */
    , v_Ct_Nm          IN RTSD0010.CT_NM%TYPE         /*시군구                */
    , v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*고객명                */
    , v_Mob_No         IN RTCS0006.MOB_NO%TYPE        /*연락처                */
    , v_Ob_St          IN RTCS0005.OB_ST%TYPE         /*컨택상태              */
    , v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE     /*컨택세부상태          */
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*예정일자              */
    , v_Reg_Id         IN RTCS0005.REG_ID%TYPE        /*등록자 ID             */
    , v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE      /*처리상태              */
    , v_Ord_No         IN RTCS0005.ORD_NO%TYPE        /*계약번호              */ --[20171212_01]
  );

  /*******************************************************************************
 -- 정기점검 처리현황 Select
 *******************************************************************************/
  PROCEDURE p_sRtcs0005RegisterProcStat (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_std_Ym         IN RTCS0005.STD_YM%TYPE              /*년도월           */
  );

END Pkg_Rtcs0005;
/
