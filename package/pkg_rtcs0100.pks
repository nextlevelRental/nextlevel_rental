CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0100 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0100
   PURPOSE   해피콜대상 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 해피콜대상 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0100Count(
    v_Call_No        IN RTCS0100.CALL_NO%TYPE           /*상담번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 해피콜상담사 배정 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0100 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day1       IN RTCS0100.JOB_DAY%TYPE,        /*처리일자FROM          */
    v_Job_Day2       IN RTCS0100.JOB_DAY%TYPE,        /*처리일자TO            */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE      /*배정여부              */
    );

  /*****************************************************************************
  -- 해피콜대상 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0100 (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*상담번호              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*처리일자              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*배정일자              */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*배정여부              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*시도 건수             */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*주문번호              */
    v_Proc_Day       IN RTCS0100.PROC_DAY%TYPE,       /*장착일자              */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*장착대리점            */
    v_Mat_Cd         IN RTCS0100.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTCS0100.MAT_NM%TYPE,         /*상품명                */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*전화번호              */
    v_Car_No         IN RTCS0100.CAR_NO%TYPE,         /*차량번호              */
    v_Vkbur          IN RTCS0100.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCS0100.VKGRP%TYPE,          /*지사                  */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */
    v_Serv_Seq       IN RTCS0100.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Proc_In_Cd     IN RTCS0100.PROC_IN_CD%TYPE,     /*서비스 처리자         */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

    /*****************************************************************************
    -- 해피콜대상 Update
    *****************************************************************************/
  FUNCTION f_UpdateRtcs0100 (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*상담번호              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*처리일자              */
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 ID             */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*배정여부              */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*배정일자              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 해피콜대상 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0100 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Call_No        IN OUT RTCS0100.CALL_NO%TYPE,    /*상담번호              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*처리일자              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*배정일자              */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*배정여부              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*시도 건수             */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTCS0100.PROC_DAY%TYPE,       /*장착일자              */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*장착대리점            */
    v_Mat_Cd         IN RTCS0100.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTCS0100.MAT_NM%TYPE,         /*상품명                */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*전화번호              */
    v_Car_No         IN RTCS0100.CAR_NO%TYPE,         /*차량번호              */
    v_Vkbur          IN RTCS0100.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCS0100.VKGRP%TYPE,          /*지사                  */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */
    v_Serv_Seq       IN RTCS0100.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Proc_In_Cd     IN RTCS0100.PROC_IN_CD%TYPE,     /*서비스 처리자         */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 해피콜대상 - 상담번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0100CallNo RETURN NUMBER;

  /*****************************************************************************
  -- 해피콜상담 등록 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0100Regf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day1       IN RTCS0100.JOB_DAY%TYPE,        /*처리일자FROM          */
    v_Job_Day2       IN RTCS0100.JOB_DAY%TYPE,        /*처리일자TO            */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*상담사ID              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*장착대리점            */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*휴대번호              */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*전화번호              */
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );

  /*****************************************************************************
  -- 해피콜상담 계약 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0100Ctf (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE           /*계약번호              */
    );

  /*****************************************************************************
  -- 해피콜상담 등록
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0100Reg (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*상담번호              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*계약번호              */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*시도건수              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 해피콜대상 상담 등록
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0100reg (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*상담번호              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*계약번호              */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*시도건수              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 해피콜상담 서비스 처리내역조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0100ServiceHistory(
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE,          /*계약번호              */
    v_Serv_Seq      IN RTCS0100.SERV_SEQ%TYPE         /*서비스 순번           */
    );


  /*****************************************************************************
  -- 상담메인 상담이력 조회 
  *****************************************************************************/
  PROCEDURE p_sRtcs0100AdviceHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE          /*계약번호              */
    );
    
   /*****************************************************************************
  -- 상담메인 메시지이력 조회 
  *****************************************************************************/
  PROCEDURE p_sRtcs0100MessageHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Mob_No        IN RTCS0100.MOB_NO%TYPE          /*계약번호              */
    );    
 
  /*****************************************************************************
  -- 상담관리 In 저장관리 
  *****************************************************************************/
  PROCEDURE p_sRtcs010SaveAdvice (
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*고객명/법인명         */    
    v_Call_No        IN OUT RTCS0100.CALL_NO%TYPE,    /*상담번호              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */    
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Bonus_Gb       IN VARCHAR2,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );      
    
END Pkg_Rtcs0100;