CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTCM0110 AS
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
    v_AGENCY_GBN     IN CHAR, /* 판매자구분 */
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_PRPL_YN        IN RTSD0007.PRPL_YN%TYPE,
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
    v_PRPL_YN        IN RTSD0007.PRPL_YN%TYPE,
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

  /*****************************************************************************
  -- 판매보조금정책 항목 관리 list
  *****************************************************************************/
  PROCEDURE p_sSaleSubsidyList (
    Ref_Cursor     IN OUT SYS_REFCURSOR,
    v_PLC_CD_NM    IN RTRE5000.PLC_CD_NM%TYPE,
    v_SLS_CD       IN RTRE5000.SLS_CD%TYPE,
    v_BNS_CD       IN RTRE5000.BNS_CD%TYPE,
    v_PYM_CD       IN RTRE5000.PYM_CD%TYPE,     
    v_ACN_CD       IN RTRE5000.ACN_CD%TYPE
    );
    
    
  /*****************************************************************************
  -- 판매보조금정책 항목 관리 저장(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDSaleSubsidy (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_PLC_CD         IN RTRE5000.PLC_CD%TYPE,
    v_PLC_CD_NM      IN RTRE5000.PLC_CD_NM%TYPE,   
    v_SALE_MIN       IN RTRE5000.SALE_MIN%TYPE,   
    v_SALE_MAX       IN RTRE5000.SALE_MAX%TYPE,   
    v_APL_AMT        IN RTRE5000.APL_AMT%TYPE,   
    v_ORDER_PT       IN RTRE5000.ORDER_PT%TYPE,   
    v_USE_YN         IN RTRE5000.USE_YN%TYPE,   
    v_REG_ID         IN RTRE5000.REG_ID%TYPE,       
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   


  /*****************************************************************************
  -- 판매보조금정책 항목 관리 UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateSaleSubsidy (
    v_PLC_CD         IN RTRE5000.PLC_CD%TYPE,
    v_PLC_CD_NM      IN RTRE5000.PLC_CD_NM%TYPE,   
    v_SALE_MIN       IN RTRE5000.SALE_MIN%TYPE,   
    v_SALE_MAX       IN RTRE5000.SALE_MAX%TYPE,   
    v_APL_AMT        IN RTRE5000.APL_AMT%TYPE,   
    v_ORDER_PT       IN RTRE5000.ORDER_PT%TYPE,   
    v_USE_YN         IN RTRE5000.USE_YN%TYPE,   
    v_REG_ID         IN RTRE5000.REG_ID%TYPE,       
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  -- 렌탈마스터권한 마스터 조회
  *****************************************************************************/
  PROCEDURE p_sRentalAuthMst (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_USER_NM           IN RTCM0001.USER_NM%TYPE /* 코드명 */
    );
    
        
  /*****************************************************************************
  -- 렌탈마스터권한 디테일 조회
  *****************************************************************************/
  PROCEDURE p_sRentalAuthDtl (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_USER_ID           IN RTCM0001.USER_ID%TYPE, /* 사용자ID */
    v_CD_NM             IN RTCM0051.CD_NM%TYPE /* 코드명 */
    );
  
  
  /*****************************************************************************
  -- 렌탈지사 관리(DELETE)
  *****************************************************************************/  
  PROCEDURE p_DRentalMstAuth (
    v_RNT_MST_ID     IN RTCM0110.RNT_MST_ID%TYPE,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2
    );
        
  /*****************************************************************************
  -- 렌탈마스터권한 저장(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalMstAuth (
    v_RNT_MST_ID     IN RTCM0110.RNT_MST_ID%TYPE,
    v_RNT_OFC        IN RTCM0110.RNT_OFC%TYPE,
    v_RNT_PNT        IN RTCM0110.RNT_PNT%TYPE,
    v_REG_ID         IN RTCM0110.REG_ID%TYPE,             
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2
    );   


  /*****************************************************************************
  -- 렌탈마스터권한 Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalMstAuth (
    v_RNT_MST_ID     IN RTCM0110.RNT_MST_ID%TYPE,
    v_RNT_OFC        IN RTCM0110.RNT_OFC%TYPE,
    v_RNT_PNT        IN RTCM0110.RNT_PNT%TYPE,
    v_REG_ID         IN RTCM0110.REG_ID%TYPE,      
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 사용자 렌탈그룹 조회
  *****************************************************************************/
  PROCEDURE p_userRentalGroup (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_USER_ID         IN RTSD0007.AGENCY_CD%TYPE 
    );
  
  /*****************************************************************************
   -- 미반영판매자 조회 Select
   *****************************************************************************/
  PROCEDURE p_sUnRlsSelerList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                              , v_Agency_Gbn IN VARCHAR2
                             );

  /*****************************************************************************
  -- 렌탈지점 사용자 인증 휴대폰 list 조회
  *****************************************************************************/
  PROCEDURE p_sRentalAuthCttpcList (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_RNT_MST_ID      IN RTCM0113.RNT_MST_ID%TYPE   /* 사용자ID */
    );

  /*****************************************************************************
  -- 렌탈마스터 권한그룹 마스터 조회
  *****************************************************************************/
  PROCEDURE p_sRentalAuthMstGrp (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_USER_NM           IN RTCM0001.USER_NM%TYPE, /* 이름 */
	v_USER_ID           IN RTCM0001.USER_ID%TYPE /* 아이디 */
    );

  /*****************************************************************************
  -- 2차인증 사용자 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalAuthPhone (
    v_dvsn           IN VARCHAR2,     				  -- 처리구분: I/U/D
    v_rntMstId       IN RTCM0113.RNT_MST_ID%TYPE,     -- 렌탈마스터ID
    v_userNm         IN RTCM0113.USER_NM%TYPE,     	  -- 사용자명
    v_mobNo          IN RTCM0113.MOB_NO%TYPE,     	  -- 휴대전화
    v_emailAddr      IN RTCM0113.EMAIL_ADDR%TYPE,     -- 이메일주소
    v_useYn          IN RTCM0113.USE_YN%TYPE,         -- 사용여부
    v_regId          IN RTCM0113.REG_ID%TYPE,         -- 등록자ID
    v_successCode    OUT NUMBER,      				  -- 성공 코드
    v_returnMessage  OUT VARCHAR2,    				  -- 리턴 메시지
    v_errorText      OUT VARCHAR2     				  -- 에러 텍스트
    );

  /*****************************************************************************
  -- 2차인증 사용자정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalAuthPhone (
	v_rntMstId     IN RTCM0113.RNT_MST_ID%TYPE,
	v_mobNo        IN RTCM0113.MOB_NO%TYPE,
	v_emailAddr    IN RTCM0113.EMAIL_ADDR%TYPE,
	v_userNm       IN RTCM0113.USER_NM%TYPE,
	v_useYn        IN RTCM0113.USE_YN%TYPE,
	v_regId        IN RTCM0113.REG_ID%TYPE,
	v_ErrorText    OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 2차인증 사용자정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRentalAuthPhone (
    v_rntMstId     IN RTCM0113.RNT_MST_ID%TYPE,
    v_mobNo        IN RTCM0113.MOB_NO%TYPE,
    v_emailAddr    IN RTCM0113.EMAIL_ADDR%TYPE,
    v_userNm       IN RTCM0113.USER_NM%TYPE,
    v_useYn        IN RTCM0113.USE_YN%TYPE,
    v_regId        IN RTCM0113.REG_ID%TYPE,
    v_ErrorText    OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 2차인증 사용자정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRentalAuthPhone (
    v_rntMstId     IN RTCM0113.RNT_MST_ID%TYPE,
    v_mobNo        IN RTCM0113.MOB_NO%TYPE,
    v_regId        IN RTCM0113.REG_ID%TYPE,
    v_ErrorText    OUT VARCHAR2
  ) RETURN NUMBER;


END PKG_RTCM0110;
/
