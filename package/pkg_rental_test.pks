CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RENTAL_TEST AS
/*******************************************************************************
   NAME:     p_sRentalMst
   PURPOSE   ·»Å» Áö»ç °ü¸®

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-12-13  JYS         1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- ·»Å»Áö»çÁ¶È¸ Select
  *****************************************************************************/
  PROCEDURE p_sRentalMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* ÄÚµå¸í */
    );
    
  /*****************************************************************************
  -- ·»Å»ÁöÁ¡Á¶È¸ Select
  *****************************************************************************/
  PROCEDURE p_sRentalDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD              IN RTCM0051.CD%TYPE, /*¸ÅÇÎÄÚµå */
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* ÄÚµå¸í */
    );
    
  /*****************************************************************************
  -- ·»Å»Áö»ç °ü¸®(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalMst (
    v_Comm_Dvsn      IN CHAR,                         /* Ã³¸®±¸ºÐ(I,U,D) */
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
  -- ·»Å»Áö»ç Insert
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
  -- ·»Å»Áö»ç Update
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
  -- ·»Å»Áö»ç Delete
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
  -- ·»Å»ÁöÁ¡ °ü¸®(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalDtl (
    v_Comm_Dvsn      IN CHAR,                         /* Ã³¸®±¸ºÐ(I,U,D) */
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
  -- ·»Å»ÁöÁ¡ Insert
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
  -- ·»Å»ÁöÁ¡ Update
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
  -- ·»Å»ÁöÁ¡ Delete
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
  -- ·»Å»ÁöÁ¡/ÆÇ¸ÅÀÚ¿¬°áÁ¶È¸ MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRentalCustMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* ÄÚµå¸í */
    );
    
    
  /*****************************************************************************
  -- ·»Å»ÁöÁ¡/ÆÇ¸ÅÀÚ¿¬°áÁ¶È¸ DETAIL Select
  *****************************************************************************/
  PROCEDURE p_sRentalCustDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_GRP_CD          IN RTSD0007.RENTAL_GROUP%TYPE, /*Áö»çÄÚµå */
    v_CD              IN RTSD0007.RENTAL_OFFICE%TYPE, /*ÁöÁ¡ÄÚµå */
    v_AGENCY_GBN      IN VARCHAR2, /* ÆÇ¸ÅÀÚ±¸ºÐ */
    v_AGENCY_NM       IN RTSD0007.AGENCY_NM%TYPE /* ÆÇ¸ÅÀÚ¸í */
    );
    
    
  /*****************************************************************************
  -- ·»Å»ÁöÁ¡/ÆÇ¸ÅÀÚ¿¬°á ÀúÀå(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalCust (
    v_Comm_Dvsn      IN CHAR,                         /* Ã³¸®±¸ºÐ(I,U,D) */
    v_AGENCY_GBN     IN VARCHAR2, /* ÆÇ¸ÅÀÚ±¸ºÐ */
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   

  /*****************************************************************************
  -- ·»Å»ÁöÁ¡/ÆÇ¸ÅÀÚ¿¬°á RTSD0007  update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust1 (
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,       
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ·»Å»ÁöÁ¡/ÆÇ¸ÅÀÚ¿¬°á RTSD0113  update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust2 (
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,       
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ·»Å»ÁöÁ¡/ÆÇ¸ÅÀÚ¿¬°á RTCS0002  update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust3 (
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,       
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;




END PKG_RENTAL_TEST;
/
