CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RENTAL_TEST AS
/*******************************************************************************
   NAME:     p_sRentalMst
   PURPOSE   렌탈 지사 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-12-13  JYS         1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- 렌탈지사조회 Select
  *****************************************************************************/
  PROCEDURE p_sRentalMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* 코드명 */
    );
    
  /*****************************************************************************
  -- 렌탈지점조회 Select
  *****************************************************************************/
  PROCEDURE p_sRentalDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD              IN RTCM0051.CD%TYPE, /*매핑코드 */
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* 코드명 */
    );
    
  /*****************************************************************************
  -- 렌탈지사 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalMst (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,
    v_CD             IN RTCM0051.CD%TYPE,
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   

  /*****************************************************************************
  -- 렌탈지사 Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalMst (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,
    v_CD             IN RTCM0051.CD%TYPE,
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,   
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈지사 Update
  *****************************************************************************/
  FUNCTION f_UpdateRentalMst (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,
    v_CD             IN RTCM0051.CD%TYPE,
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,   
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈지사 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRentalMst (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,
    v_CD             IN RTCM0051.CD%TYPE,
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,   
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈지점 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalDtl (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,
    v_CD             IN RTCM0051.CD%TYPE,
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,   
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   

  /*****************************************************************************
  -- 렌탈지점 Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalDtl (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,
    v_CD             IN RTCM0051.CD%TYPE,
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,  
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,   
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈지점 Update
  *****************************************************************************/
  FUNCTION f_UpdateRentalDtl (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,
    v_CD             IN RTCM0051.CD%TYPE,
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,  
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈지점 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRentalDtl (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,
    v_CD             IN RTCM0051.CD%TYPE,
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,  
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


    
  /*****************************************************************************
  -- 렌탈지점/판매자연결조회 MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRentalCustMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* 코드명 */
    );
    
    
  /*****************************************************************************
  -- 렌탈지점/판매자연결조회 DETAIL Select
  *****************************************************************************/
  PROCEDURE p_sRentalCustDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_GRP_CD          IN RTSD0007.RENTAL_GROUP%TYPE, /*지사코드 */
    v_CD              IN RTSD0007.RENTAL_OFFICE%TYPE, /*지점코드 */
    v_AGENCY_GBN      IN VARCHAR2, /* 판매자구분 */
    v_AGENCY_NM       IN RTSD0007.AGENCY_NM%TYPE /* 판매자명 */
    );
    
    
  /*****************************************************************************
  -- 렌탈지점/판매자연결 저장(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalCust (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_AGENCY_GBN     IN VARCHAR2, /* 판매자구분 */
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   

  /*****************************************************************************
  -- 렌탈지점/판매자연결 RTSD0007  update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust1 (
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,       
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈지점/판매자연결 RTSD0113  update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust2 (
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,       
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈지점/판매자연결 RTCS0002  update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust3 (
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,       
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;




END PKG_RENTAL_TEST;