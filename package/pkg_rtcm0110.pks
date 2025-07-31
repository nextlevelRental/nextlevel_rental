CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTCM0110 AS
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
    v_AGENCY_GBN     IN CHAR, /* �Ǹ��ڱ��� */
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
  -- ��Ż����/�Ǹ��ڿ��� RTSD0007  update
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

  /*****************************************************************************
  -- �Ǹź�������å �׸� ���� list
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
  -- �Ǹź�������å �׸� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDSaleSubsidy (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
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
  -- �Ǹź�������å �׸� ���� UPDATE
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
  -- ��Ż�����ͱ��� ������ ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRentalAuthMst (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_USER_NM           IN RTCM0001.USER_NM%TYPE /* �ڵ�� */
    );
    
        
  /*****************************************************************************
  -- ��Ż�����ͱ��� ������ ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRentalAuthDtl (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_USER_ID           IN RTCM0001.USER_ID%TYPE, /* �����ID */
    v_CD_NM             IN RTCM0051.CD_NM%TYPE /* �ڵ�� */
    );
  
  
  /*****************************************************************************
  -- ��Ż���� ����(DELETE)
  *****************************************************************************/  
  PROCEDURE p_DRentalMstAuth (
    v_RNT_MST_ID     IN RTCM0110.RNT_MST_ID%TYPE,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2
    );
        
  /*****************************************************************************
  -- ��Ż�����ͱ��� ����(IUD)
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
  -- ��Ż�����ͱ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalMstAuth (
    v_RNT_MST_ID     IN RTCM0110.RNT_MST_ID%TYPE,
    v_RNT_OFC        IN RTCM0110.RNT_OFC%TYPE,
    v_RNT_PNT        IN RTCM0110.RNT_PNT%TYPE,
    v_REG_ID         IN RTCM0110.REG_ID%TYPE,      
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ����� ��Ż�׷� ��ȸ
  *****************************************************************************/
  PROCEDURE p_userRentalGroup (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_USER_ID         IN RTSD0007.AGENCY_CD%TYPE 
    );
  
  /*****************************************************************************
   -- �̹ݿ��Ǹ��� ��ȸ Select
   *****************************************************************************/
  PROCEDURE p_sUnRlsSelerList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                              , v_Agency_Gbn IN VARCHAR2
                             );

  /*****************************************************************************
  -- ��Ż���� ����� ���� �޴��� list ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRentalAuthCttpcList (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_RNT_MST_ID      IN RTCM0113.RNT_MST_ID%TYPE   /* �����ID */
    );

  /*****************************************************************************
  -- ��Ż������ ���ѱ׷� ������ ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRentalAuthMstGrp (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_USER_NM           IN RTCM0001.USER_NM%TYPE, /* �̸� */
	v_USER_ID           IN RTCM0001.USER_ID%TYPE /* ���̵� */
    );

  /*****************************************************************************
  -- 2������ ����� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalAuthPhone (
    v_dvsn           IN VARCHAR2,     				  -- ó������: I/U/D
    v_rntMstId       IN RTCM0113.RNT_MST_ID%TYPE,     -- ��Ż������ID
    v_userNm         IN RTCM0113.USER_NM%TYPE,     	  -- ����ڸ�
    v_mobNo          IN RTCM0113.MOB_NO%TYPE,     	  -- �޴���ȭ
    v_emailAddr      IN RTCM0113.EMAIL_ADDR%TYPE,     -- �̸����ּ�
    v_useYn          IN RTCM0113.USE_YN%TYPE,         -- ��뿩��
    v_regId          IN RTCM0113.REG_ID%TYPE,         -- �����ID
    v_successCode    OUT NUMBER,      				  -- ���� �ڵ�
    v_returnMessage  OUT VARCHAR2,    				  -- ���� �޽���
    v_errorText      OUT VARCHAR2     				  -- ���� �ؽ�Ʈ
    );

  /*****************************************************************************
  -- 2������ ��������� Insert
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
  -- 2������ ��������� Update
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
  -- 2������ ��������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRentalAuthPhone (
    v_rntMstId     IN RTCM0113.RNT_MST_ID%TYPE,
    v_mobNo        IN RTCM0113.MOB_NO%TYPE,
    v_regId        IN RTCM0113.REG_ID%TYPE,
    v_ErrorText    OUT VARCHAR2
  ) RETURN NUMBER;


END PKG_RTCM0110;
/
