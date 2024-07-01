CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RENTAL_TEST AS
/*******************************************************************************
   NAME:     p_sRentalMst
   PURPOSE   ��Ż ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-12-13  JYS         1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- ��Ż������ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRentalMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* �ڵ�� */
    );
    
  /*****************************************************************************
  -- ��Ż������ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRentalDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD              IN RTCM0051.CD%TYPE, /*�����ڵ� */
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* �ڵ�� */
    );
    
  /*****************************************************************************
  -- ��Ż���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalMst (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
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
  -- ��Ż���� Insert
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
  -- ��Ż���� Update
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
  -- ��Ż���� Delete
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
  -- ��Ż���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalDtl (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
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
  -- ��Ż���� Insert
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
  -- ��Ż���� Update
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
  -- ��Ż���� Delete
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
  -- ��Ż����/�Ǹ��ڿ�����ȸ MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRentalCustMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* �ڵ�� */
    );
    
    
  /*****************************************************************************
  -- ��Ż����/�Ǹ��ڿ�����ȸ DETAIL Select
  *****************************************************************************/
  PROCEDURE p_sRentalCustDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_GRP_CD          IN RTSD0007.RENTAL_GROUP%TYPE, /*�����ڵ� */
    v_CD              IN RTSD0007.RENTAL_OFFICE%TYPE, /*�����ڵ� */
    v_AGENCY_GBN      IN VARCHAR2, /* �Ǹ��ڱ��� */
    v_AGENCY_NM       IN RTSD0007.AGENCY_NM%TYPE /* �Ǹ��ڸ� */
    );
    
    
  /*****************************************************************************
  -- ��Ż����/�Ǹ��ڿ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalCust (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
    v_AGENCY_GBN     IN VARCHAR2, /* �Ǹ��ڱ��� */
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   

  /*****************************************************************************
  -- ��Ż����/�Ǹ��ڿ��� RTSD0007  update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust1 (
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,       
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż����/�Ǹ��ڿ��� RTSD0113  update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust2 (
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,       
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż����/�Ǹ��ڿ��� RTCS0002  update
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
