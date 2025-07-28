CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Exif0002 AS
/*******************************************************************************
   NAME:      Pkg_EXIF0002
   PURPOSE  EAI시스템 인터페이스 

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-07  jemcarry         1. Created this package body.
   1.1        2016-04-28  이영근           대리점 인터페이스 INPUT 수정   
   1.11       2018-09-20  wjim             [20180920_01] Sales Order 정보 수신 항목 추가
*******************************************************************************/

    
  /*****************************************************************************
  -- RTSD0007(대리점마스터) INSERT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_Erprecvcustomer (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTSD0007.CITY%TYPE,           /*주소                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*상세주소              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*우편일련번호          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX번호               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*사업자번호            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*대표명                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*업태                  */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*계절구분              */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*사용여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- RTSD0005(상품마스터) INSERT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_Erprecvmatrial (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
      
  /*****************************************************************************
  -- 주문정보 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_Erpsendorder (
    v_Gubun          IN CHAR,        /*구분 N:주문, R:반품주문              */
    Ref_Cursor       OUT SYS_REFCURSOR
    );

  /*****************************************************************************
  -- RTSD0115(SAL SO LOG) INSERT INTERFACE(EAI)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------                                              
   1.11       2018-09-20  wjim             [20180920_01] 배송번호, 출고요청상품, 실제출고상품, 택배여부 추가 
  *****************************************************************************/
  PROCEDURE p_Erprecvordernumber (
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0115.VBELN_D%TYPE,        /*SAP 배송번호          */ --[20180920_01]
    v_Matnr_O        IN RTSD0115.MATNR_O%TYPE,        /*출고예정 상품코드     */ --[20180920_01]
    v_Matnr_S        IN RTSD0115.MATNR_S%TYPE,        /*실제출고 상품코드     */ --[20180920_01]
    v_Bezei          IN RTSD0115.BEZEI%TYPE,          /*택배여부              */ --[20180920_01]
    v_Zad_Order      IN VARCHAR2,                     /*마모파손서비스여부      */ --[20201202_01]
    v_Zcompany       IN RTSD0115.ZCOMPANY%TYPE,       /*택배사               */ --[20210917_01]
    v_ZParcelInvoice IN RTSD0115.ZPARCELINVOICE%TYPE, /*송장번호                */ --[20210917_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );  
    
  /*****************************************************************************
  -- 인바운드 지역코드 관리 INSERT INTERFACE (EAI)
  *****************************************************************************/
  PROCEDURE p_Qmsrecvsaleoffice (
    v_Sales_Office_Id IN RTCS0103.SALES_OFFICE_ID%TYPE,  /*담당지구 코드      */
    v_Emp_Id          IN RTCS0103.EMP_ID%TYPE,           /*담당자 사번        */
    v_Region_No       IN RTCS0103.REGION_NO%TYPE,        /*지역코드           */
    v_City_No         IN RTCS0103.CITY_NO%TYPE,          /*도시코드           */
    v_Sales_Office_Nm IN RTCS0103.SALES_OFFICE_NAME%TYPE,/*담당지구 명        */
    v_Emp_Name        IN RTCS0103.EMP_NAME%TYPE,         /*담당자명           */
    v_Region_Name     IN RTCS0103.REGION_NAME%TYPE,      /*지역명             */
    v_City_Name       IN RTCS0103.CITY_NAME%TYPE,        /*도시명             */
    v_Emp_Mobileno    IN RTCS0103.EMP_MOBILENO%TYPE,     /*담당자Mobile No    */
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText       OUT VARCHAR2
    ); 
    
  /*****************************************************************************
  -- SMS 발송대상 INTERFACE 
  *****************************************************************************/
  PROCEDURE p_Smssendcontent (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2    
   );
   
  /*****************************************************************************
  --배송완료 정보  INTERFACE
  *****************************************************************************/
  PROCEDURE p_Erprecvdelivery (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송완료일            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );           

   
  /*****************************************************************************
  --1) 매출원가(렌탈타이어)RTCS0003 INSERT  INTERFACE
  *****************************************************************************/
  PROCEDURE p_Erprecvsalescost (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*Material  Number      */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*Quantuty              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );           
    
  /*****************************************************************************
  -- FI-8) 법인 고객 정보 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_Erpbusicustinfo (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
    );

  /*****************************************************************************
   월 매출 정보 집계
  *****************************************************************************/
  PROCEDURE p_ErpSendSale_Data (
    v_Period         IN CHAR,                         /*년월                  */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
    );
    
  /*****************************************************************************
  -- 월 매출 정보 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendSale (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
    );


  /*****************************************************************************
  -- 월 수납내역 집계
  *****************************************************************************/
  PROCEDURE p_ErpSendReceipt_Data (
    v_Period         IN CHAR,                         /*년월                  */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
    );
    
  /*****************************************************************************
  -- 월 수납내역 정보 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendReceipt (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
    );


  /*****************************************************************************
  -- 선수내역 정보 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendPreReceipt (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
    );

  
  /*****************************************************************************
  -- 미납내역 집계
  *****************************************************************************/
  PROCEDURE p_ErpSendDefault_Data (
    v_Period         IN CHAR,                         /*년월                  */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
    );
    
  /*****************************************************************************
  -- 미납내역 정보 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendDefault (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
    );

  /*****************************************************************************
  -- 등록비 이연처리내역 집계
  *****************************************************************************/
  PROCEDURE p_ErpSendRegiPostpone_Data (
    v_Period         IN CHAR,                         /*년월                  */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
    );
    
  /*****************************************************************************
  -- 등록비 이연처리내역  SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendRegiPostpone (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
    );

  /*****************************************************************************
  -- 감가상각 이연처리내역 집계
  *****************************************************************************/
  PROCEDURE p_ErpSendDeprePostpone_Data (
    v_Period         IN CHAR,                           /*년월                */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,          /*이연항목            */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
    );
    
  /*****************************************************************************
  -- 감가상각 이연처리내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendDeprePostpone (
    v_Period         IN CHAR,                           /*년월                */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,         /*이연항목            */
    Ref_Cursor       OUT SYS_REFCURSOR
    );


  /*****************************************************************************
  -- 현금영수증 발행내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendCashReceipt (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );


  /*****************************************************************************
  -- 카드(PG) 결제 내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendCardPayment (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );

  /*****************************************************************************
  -- 카드이체 내역 집계
  *****************************************************************************/
  PROCEDURE p_ErpSendCardTransfer_Data (
    v_Period         IN CHAR,                           /*년월                */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
    );
    
  /*****************************************************************************
  -- 카드이체 내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendCardTransfer (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );

  
  /*****************************************************************************
  -- 수수료 이연처리 내역 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendCommPostpone_Data (
    v_Period         IN CHAR,                           /*년월                */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
     );
     
  /*****************************************************************************
  -- 수수료 이연처리 내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendCommPostpone (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );


  /*****************************************************************************
  -- 판매수수료 기초내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendSalesComm (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );


  /*****************************************************************************
  -- 장착수수료 기초내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendInstallComm (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );


  /*****************************************************************************
  -- 서비스수수료 기초내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendServiceComm (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );


  /*****************************************************************************
  -- 수수료 합산내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendCommSummary (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );


  /*****************************************************************************
  -- 충당금 내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendAllowance (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );
    
  /*****************************************************************************
  --배송중 정보  INTERFACE
  *****************************************************************************/
  PROCEDURE p_ErprecvdeliveryIng (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*배송완료일            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );  
    
  /*****************************************************************************
  -- 대리점 벤더 내역 INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendAgencyVender (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ); 
    
  /*****************************************************************************
  -- 28) 대리점 방판 벤더 정보 I/F SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendAllAgencyVender (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    );        

  /*****************************************************************************
  -- 30) 카카오 조회 I/F SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_EaiKakaoSelect (
    Ref_Cursor       OUT SYS_REFCURSOR
    );
    
  /*****************************************************************************
  -- 31) KT SMS 조회 I/F SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_EaiKtSmsSelect (
    Ref_Cursor       OUT SYS_REFCURSOR
    );    

  /*****************************************************************************
   * 32) 마감전료인터페이스 I/F SELECT INTERFACE(EAI)
   * REVISIONS
   * Ver        Date        Author      Description
   * ---------  ----------  --------    -------------------------------------
   * 1.0        2020-08-11  kstka  Create Pkg
  *****************************************************************************/
  PROCEDURE p_ErpSendClosePosting (
    v_Period         IN CHAR,                           /*년월                */
    v_StmtCd        IN CHAR,                           /*전표항목코드      */
    Ref_Cursor       OUT SYS_REFCURSOR
    );
    
  /*****************************************************************************
  --인사시스템 인사발령 EAI INTERFACE
  *****************************************************************************/
  PROCEDURE p_EhrRecvPrsnlAppmnt (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );    
    
END Pkg_Exif0002;