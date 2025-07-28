CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5070 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5070
   PURPOSE   판매원 수수료 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가   
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료(=인센티브) 분리
   1.9        2025-04-29  10244015         [20250429_01] 판매인 직접주문 추가수수료 부여 추가
   2.0        2025-06-19  10244015         [20250619_01] 프리미엄퍼플점 추가 장착수수료 부여
   2.1        2025-06-20  10244015         [20250620_01] 프리미엄퍼플점 추가 서비스수수료 부여
*******************************************************************************/

  /*****************************************************************************
  -- 판매원 수수료 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre5070Count(
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,          /*마감년월            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE         /*렌탈전문점          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매원 수수료 내역 Select
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
  *****************************************************************************/
  PROCEDURE p_sRtre5070 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Rtslc_Amt      IN RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료      */
    v_Ntslc_Amt      IN RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료        */
    v_Opslc_Amt      IN RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료      */
    v_Tbslc_Amt      IN RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료  */
    v_Procc_Amt      IN RTRE5070.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Lcchc_Amt      IN RTRE5070.LCCHC_AMT%TYPE,      /*위치교환수수료        */
    v_Egolc_Amt      IN RTRE5070.EGOLC_AMT%TYPE,      /*엔진오일교환수수료    */
    v_Wchgc_Amt      IN RTRE5070.WCHGC_AMT%TYPE,      /*교환서비스수수료      */
    v_Rgchk_Amt      IN RTRE5070.RGCHK_AMT%TYPE,      /*방문점검수수료        */
    v_Align_Amt      IN RTRE5070.ALIGN_AMT%TYPE,      /*얼라인먼트수수료      */
    v_Zero_Amt       IN RTRE5070.ZERO_AMT%TYPE,       /*걱정제로장착수수료    */
    v_Apfds_Amt      IN RTRE5070.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Btapfd_Amt     IN RTRE5070.BTAPFD_AMT%TYPE,     /*이전충당금액          */
    v_Mfapfd_Amt     IN RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액    */
    v_Tcomm_Amt      IN RTRE5070.TCOMM_AMT%TYPE,      /*총 수수료액           */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 판매원 수수료 내역 Insert
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
  *****************************************************************************/
  FUNCTION f_InsertRtre5070 (
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Rtslc_Amt      IN RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료      */
    v_Ntslc_Amt      IN RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료        */
    v_Opslc_Amt      IN RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료      */
    v_Tbslc_Amt      IN RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료  */
    v_Svslc_Amt      IN RTRE5070.SVSLC_AMT%TYPE,      /*서비스판매수수료      */ --[20190611_01]
    v_Rtbns_Amt      IN RTRE5070.RTSLC_BONUS%TYPE,    /*대리점판매인센티브    */ --[20190611_01]
    v_Ntbns_Amt      IN RTRE5070.NTSLC_BONUS%TYPE,    /*방문판매인센티브      */ --[20190611_01]
    v_Rdbns_Amt      IN RTRE5070.RODIAN_BONUS%TYPE,   /*로디안판매인센티브    */ --[20190611_01]
    v_Bonus_Amt      IN RTRE5070.SLC_BONUS%TYPE,      /*판매장려수수료        */ --[20190611_01]
    v_Procc_Amt      IN RTRE5070.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Lcchc_Amt      IN RTRE5070.LCCHC_AMT%TYPE,      /*위치교환수수료        */
    v_Egolc_Amt      IN RTRE5070.EGOLC_AMT%TYPE,      /*엔진오일교환수수료    */
    v_Wchgc_Amt      IN RTRE5070.WCHGC_AMT%TYPE,      /*교환서비스수수료      */
    v_Rgchk_Amt      IN RTRE5070.RGCHK_AMT%TYPE,      /*방문점검수수료        */
    v_Align_Amt      IN RTRE5070.ALIGN_AMT%TYPE,      /*얼라인먼트수수료      */
    v_Zero_Amt       IN RTRE5070.ZERO_AMT%TYPE,       /*걱정제로장착수수료    */
    v_Pick_Amt       IN RTRE5070.PICK_AMT%TYPE,      /*PickUp And Delivery수수료           */
    v_vProcc_Amt      IN RTRE5070.VPROCC_AMT%TYPE,      /*방문장착수수료           */
    v_Fr_Align_Amt       IN RTRE5070.FR_ALIGN_AMT%TYPE,       /*무상얼라인먼트수수료    */
    v_Func_Amt       IN RTRE5070.FUNC_AMT%TYPE,         /*파손보증수수료           */
    v_Erase_Amt      IN RTRE5070.ERASE_AMT%TYPE,        /*조기마모파손보증수수료           */
    v_Apfds_Amt      IN RTRE5070.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Btapfd_Amt     IN RTRE5070.BTAPFD_AMT%TYPE,     /*이전충당금액          */
    v_Mfapfd_Amt     IN RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액    */
    v_Tcomm_Amt      IN RTRE5070.TCOMM_AMT%TYPE,      /*총 수수료액           */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매원 수수료 내역 Update
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtre5070 (
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Rtslc_Amt      IN RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료      */
    v_Ntslc_Amt      IN RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료        */
    v_Opslc_Amt      IN RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료      */
    v_Tbslc_Amt      IN RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료  */
    v_Svslc_Amt      IN RTRE5070.SVSLC_AMT%TYPE,      /*서비스판매수수료      */ --[20190611_01]
    v_Rtbns_Amt      IN RTRE5070.RTSLC_BONUS%TYPE,    /*대리점판매인센티브    */ --[20190611_01]
    v_Ntbns_Amt      IN RTRE5070.NTSLC_BONUS%TYPE,    /*방문판매인센티브      */ --[20190611_01]
    v_Rdbns_Amt      IN RTRE5070.RODIAN_BONUS%TYPE,   /*로디안판매인센티브    */ --[20190611_01]
    v_Bonus_Amt      IN RTRE5070.SLC_BONUS%TYPE,      /*판매장려수수료        */ --[20190611_01]
    v_Procc_Amt      IN RTRE5070.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Lcchc_Amt      IN RTRE5070.LCCHC_AMT%TYPE,      /*위치교환수수료        */
    v_Egolc_Amt      IN RTRE5070.EGOLC_AMT%TYPE,      /*엔진오일교환수수료    */
    v_Wchgc_Amt      IN RTRE5070.WCHGC_AMT%TYPE,      /*교환서비스수수료      */
    v_Rgchk_Amt      IN RTRE5070.RGCHK_AMT%TYPE,      /*방문점검수수료        */
    v_Align_Amt      IN RTRE5070.ALIGN_AMT%TYPE,      /*얼라인먼트수수료      */
    v_Zero_Amt       IN RTRE5070.ZERO_AMT%TYPE,       /*걱정제로장착수수료    */
    v_Pick_Amt       IN RTRE5070.PICK_AMT%TYPE,      /*PickUp And Delivery수수료           */
    v_vProcc_Amt      IN RTRE5070.VPROCC_AMT%TYPE,      /*방문장착수수료           */
    v_Fr_Align_Amt       IN RTRE5070.FR_ALIGN_AMT%TYPE,       /*무상얼라인먼트수수료    */
    v_Func_Amt       IN RTRE5070.FUNC_AMT%TYPE,         /*파손보증수수료           */
    v_Erase_Amt      IN RTRE5070.ERASE_AMT%TYPE,        /*조기마모파손보증수수료           */
    v_Apfds_Amt      IN RTRE5070.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Btapfd_Amt     IN RTRE5070.BTAPFD_AMT%TYPE,     /*이전충당금액          */
    v_Mfapfd_Amt     IN RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액    */
    v_Tcomm_Amt      IN RTRE5070.TCOMM_AMT%TYPE,      /*총 수수료액           */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매원 수수료 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5070 (
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매원 수수료 내역 관리(IUD)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtre5070 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Rtslc_Amt      IN RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료      */
    v_Ntslc_Amt      IN RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료        */
    v_Opslc_Amt      IN RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료      */
    v_Tbslc_Amt      IN RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료  */
    v_Svslc_Amt      IN RTRE5070.SVSLC_AMT%TYPE,      /*서비스판매수수료      */ --[20190611_01]
    v_Rtbns_Amt      IN RTRE5070.RTSLC_BONUS%TYPE,    /*대리점판매인센티브    */ --[20190611_01]
    v_Ntbns_Amt      IN RTRE5070.NTSLC_BONUS%TYPE,    /*방문판매인센티브      */ --[20190611_01]
    v_Rdbns_Amt      IN RTRE5070.RODIAN_BONUS%TYPE,   /*로디안판매인센티브    */ --[20190611_01]
    v_Bonus_Amt      IN RTRE5070.SLC_BONUS%TYPE,      /*판매장려수수료        */ --[20190611_01]
    v_Procc_Amt      IN RTRE5070.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Lcchc_Amt      IN RTRE5070.LCCHC_AMT%TYPE,      /*위치교환수수료        */
    v_Egolc_Amt      IN RTRE5070.EGOLC_AMT%TYPE,      /*엔진오일교환수수료    */
    v_Wchgc_Amt      IN RTRE5070.WCHGC_AMT%TYPE,      /*교환서비스수수료      */
    v_Rgchk_Amt      IN RTRE5070.RGCHK_AMT%TYPE,      /*방문점검수수료        */
    v_Align_Amt      IN RTRE5070.ALIGN_AMT%TYPE,      /*얼라인먼트수수료      */
    v_Zero_Amt       IN RTRE5070.ZERO_AMT%TYPE,       /*걱정제로장착수수료    */
    v_Pick_Amt       IN RTRE5070.PICK_AMT%TYPE,      /*PickUp And Delivery수수료           */
    v_vProcc_Amt      IN RTRE5070.VPROCC_AMT%TYPE,      /*방문장착수수료           */
    v_Fr_Align_Amt       IN RTRE5070.FR_ALIGN_AMT%TYPE,       /*무상얼라인먼트수수료    */
    v_Func_Amt       IN RTRE5070.FUNC_AMT%TYPE,         /*파손보증수수료           */
    v_Erase_Amt      IN RTRE5070.ERASE_AMT%TYPE,        /*조기마모파손보증수수료           */
    v_Apfds_Amt      IN RTRE5070.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Btapfd_Amt     IN RTRE5070.BTAPFD_AMT%TYPE,     /*이전충당금액          */
    v_Mfapfd_Amt     IN RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액    */
    v_Tcomm_Amt      IN RTRE5070.TCOMM_AMT%TYPE,      /*총 수수료액           */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 판매인별 수수료 내역 집계
  *****************************************************************************/
  PROCEDURE p_CreateRtre5070AgentComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 사용자 그룹에 따른 조회 범위 권한 체크 
  *****************************************************************************/
  FUNCTION f_sRtre5070UserInputValueCheck(
    v_Procedure_Nm   IN VARCHAR,                      /*프로시져명            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE          /*등록자 ID             */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 판매인별 수수료 현황 - 판매인별 기간별 수수료 금액을 조회하는 기능
  *****************************************************************************/
  PROCEDURE p_sRtre5070AgentList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Fr        IN RTRE5070.SLCM_YM%TYPE,        /*조회일자From          */
    v_Slcm_To        IN RTRE5070.SLCM_YM%TYPE,        /*조회일자To            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );

  /*****************************************************************************
  -- 개별 수수료 내역 조회 - 수수료 항목별 상세 내역을 조회한다.
  *****************************************************************************/
  PROCEDURE p_sRtre5070ChargeList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_DayF      IN RTRE5040.PROC_DAY%TYPE,       /*조회일자From          */
    v_Proc_DayT      IN RTRE5040.PROC_DAY%TYPE,       /*조회일자To            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*사용자 ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );

  
  /*****************************************************************************
  -- 개별 수수료 실시간 내역 조회 - 수수료 항목별 상세 내역을 조회한다.
  *****************************************************************************/
  PROCEDURE p_sRtre5070ChargeRealList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_DayF      IN RTRE5040.PROC_DAY%TYPE,       /*조회일자From          */
    v_Proc_DayT      IN RTRE5040.PROC_DAY%TYPE,       /*조회일자To            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*사용자 ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );
    
    PROCEDURE p_CreateRtre5070AgentComm_Org (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre5070;