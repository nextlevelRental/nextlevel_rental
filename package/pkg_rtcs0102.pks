CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0102 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0102
   PURPOSE   인바운드 상담등록 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-12  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 인바운드 상담등록 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0102Count(
    v_Call_No        IN RTCS0102.CALL_NO%TYPE           /*인바운드 상담번호   */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 인바운드 상담등록 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0102 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0102.CALL_NO%TYPE,        /*인바운드 상담번호     */
    v_Recv_FDay      IN RTCS0102.RECV_DAY%TYPE,       /*통화일자FROM          */
    v_Recv_TDay      IN RTCS0102.RECV_DAY%TYPE,       /*통화일자TO            */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE          /*등록자ID              */
    );

  /*****************************************************************************
  -- 인바운드 상담등록 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0102 (
    v_Call_No        IN OUT RTCS0102.CALL_NO%TYPE,    /*인바운드 상담번호     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Sms_Tx         IN RTCS0102.SMS_TX%TYPE,         /*SMS내용               */
    v_Region_No      IN RTCS0102.REGION_NO%TYPE,      /*지역코드              */
    v_City_No        IN RTCS0102.CITY_NO%TYPE,        /*도시코드              */
    v_Car_No         IN RTCS0102.CAR_NO%TYPE,         /*차량번호              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*등록자ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 인바운드 상담등록 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0102 (
    v_Call_No        IN OUT RTCS0102.CALL_NO%TYPE,    /*인바운드 상담번호     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Sms_Tx         IN RTCS0102.SMS_TX%TYPE,         /*SMS내용               */
    v_Region_No      IN RTCS0102.REGION_NO%TYPE,      /*지역코드              */
    v_City_No        IN RTCS0102.CITY_NO%TYPE,        /*도시코드              */
    v_Car_No         IN RTCS0102.CAR_NO%TYPE,         /*차량번호              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*등록자ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 인바운드 상담등록 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0102 (
    v_Call_No        IN RTCS0102.CALL_NO%TYPE,        /*인바운드 상담번호     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*등록자ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 인바운드 상담등록 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0102 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Call_No        IN OUT RTCS0102.CALL_NO%TYPE,    /*인바운드 상담번호     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Sms_Tx         IN RTCS0102.SMS_TX%TYPE,         /*SMS내용               */
    v_Region_No      IN RTCS0102.REGION_NO%TYPE,      /*지역코드              */
    v_City_No        IN RTCS0102.CITY_NO%TYPE,        /*도시코드              */
    v_Car_No         IN RTCS0102.CAR_NO%TYPE,         /*차량번호              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*등록자ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0102Ctf (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cust_No       IN RTCS0102.CUST_NO%TYPE,                  /*거래처번호   */
    v_Cust_Nm       IN RTCS0102.CUST_NM%TYPE,                  /*고객명/법인명*/
    v_Mob_No        IN RTSD0100.MOB_NO%TYPE,                   /*휴대폰번호   */
    v_StartDay      IN RTSD0106.PLAN_DAY%TYPE,                 /*장착예정일   */
    v_EndDay        IN RTSD0106.PLAN_DAY%TYPE                  /*장착예정일   */
    );

  /*****************************************************************************
  -- 아웃바운드상담리스트  조회
 *****************************************************************************/
  PROCEDURE p_sRtcs0102Obf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객코드              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_StartDay      IN RTCS0100.JOB_DAY%TYPE,         /*처리일자              */
    v_EndDay        IN RTCS0100.JOB_DAY%TYPE          /*처리일자              */
    ) ;

  /*****************************************************************************
  -- 인바운드상담리스트  조회
 *****************************************************************************/
  PROCEDURE p_sRtcs0102Ibf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객코드              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_StartDay       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_EndDay         IN RTCS0102.RECV_DAY%TYPE        /*통화일자              */
    );

  /*****************************************************************************
  -- 인바운드 상담등록시간 조회
  *****************************************************************************/
  FUNCTION f_sRtcs0102SelectSysdate
  RETURN VARCHAR;

 /*****************************************************************************
 -- 인바운드상담리스트  조회 - 고객현황 - 인바운드콜
 *****************************************************************************/
  PROCEDURE p_sRtcs0102CustAnalysis08 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE          /*상담전화번호          */
    );

 /*****************************************************************************
 -- 인바운드상담리스트  조회 - 고객현황 - 아웃바운드상담
 *****************************************************************************/
  PROCEDURE p_sRtcs0102CustAnalysis09 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE          /*주문번호              */
    );

 /*****************************************************************************
 -- 인바운드상담리스트  조회 - 고객현황 - 클레임접수
 *****************************************************************************/
  PROCEDURE p_sRtcs0102CustAnalysis10 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE          /*주문번호              */
    );
        
END Pkg_Rtcs0102;
/
