CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5040 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5040
   PURPOSE   판매수수료 기초 집계 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  이영근             채널 대/중분류 항목 추가
   1.14       2025-04-29  10244015         [20250429_01] 판매인 직접주문 추가수수료 부여 추가   
*******************************************************************************/

  /*****************************************************************************
  -- 판매수수료 기초 집계 Count
  *****************************************************************************/
  FUNCTION f_sRtre5040Count(
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,          /*마감년월            */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매수수료 기초 집계 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5040 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*판매원번호            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*타이어본수            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*예정 판매수수료       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*예정 충당설정금액     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 판매수수료 기초 집계 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5040 (
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*판매원번호            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*타이어본수            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*예정 판매수수료       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*예정 충당설정금액     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매수수료 기초 집계 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5040 (
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*판매원번호            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*타이어본수            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*예정 판매수수료       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*예정 충당설정금액     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매수수료 기초 집계 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5040 (
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매수수료 기초 집계 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5040 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*판매원번호            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*타이어본수            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*예정 판매수수료       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*예정 충당설정금액     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 대리점 판매수수료 기초 집계 처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre5040AgencyComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 오픈몰 판매수수료 기초 집계 처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre5040MallComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 판매인별 수수료 내역 집계 - 판매인별 수수료 집계시 계약번호별 충당금 금액을 확정하여 조정하는 프로시져임
  *****************************************************************************/
  PROCEDURE p_UpdateRtre5040AgentAppFix (
    v_Period         IN  CHAR,                         /*마감월              */
    v_Agency_Cd      IN  RTRE5070.AGENCY_CD%TYPE,      /*판매원번호          */
    v_Btapfd_Amt     IN  RTRE5070.BTAPFD_AMT%TYPE,     /*층당금설정금액      */
    v_Reg_Id         IN  RTRE5070.REG_ID%TYPE,         /*등록자 ID           */
    v_Rtslc_Amt      OUT RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료    */
    v_Ntslc_Amt      OUT RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료      */
    v_Opslc_Amt      OUT RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료    */
    v_Tbslc_Amt      OUT RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료*/
    v_Mfapfd_Amt     OUT RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액  */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 충당금 적립 계약 내역 조회 - 충당금 적립된 판매수수료에 대한 상세 내역 조회
  *****************************************************************************/
  PROCEDURE p_sRtre5040AppSaveOrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_YmF       IN RTRE5040.SLCM_YM%TYPE,        /*조회일자From          */
    v_Slcm_YmT       IN RTRE5040.SLCM_YM%TYPE,        /*조회일자To            */
    v_Agency_Cd      IN RTRE5040.ORD_AGENT%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*사용자 ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );
    
    PROCEDURE p_CreateRtre5040AgencyComm_1 (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre5040;