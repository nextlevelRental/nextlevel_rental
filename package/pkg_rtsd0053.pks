CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0053 AS
/*******************************************************************************
   NAME:     PKG_RTSD0053
   PURPOSE   ��Ż ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-01  Sean         1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- ��Ż���� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0053 ( 
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP IN RTSD0053.RENTAL_GROUP%TYPE,          /* ��Ż����  */
    v_USE_YN          IN RTSD0052.USE_YN%TYPE,	
    v_USE_YN2         IN RTSD0053.USE_YN%TYPE    
    );

  /*****************************************************************************
  -- ��Ż��������˾� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0053_pop ( 
    Ref_Cursor         IN OUT SYS_REFCURSOR,
    v_RENTAL_OFFICE_NM IN RTSD0053.RENTAL_OFFICE_NM%TYPE        /* ��Ż������  */
    );
    
  /*****************************************************************************
  -- ��Ż���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0053 (
    v_Comm_Dvsn         IN CHAR,                         /* ó������(I,U,D) */
    v_RENTAL_GROUP	    IN RTSD0053.RENTAL_GROUP%TYPE,		  
    v_RENTAL_OFFICE     IN RTSD0053.RENTAL_OFFICE%TYPE,		  
    v_RENTAL_OFFICE_NM  IN RTSD0053.RENTAL_OFFICE_NM%TYPE,		  
    v_USE_YN            IN RTSD0053.USE_YN%TYPE,	
    v_REG_ID    		    IN RTSD0053.REG_ID%TYPE,		  
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ��Ż���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0053 (
    v_RENTAL_GROUP	    IN RTSD0053.RENTAL_GROUP%TYPE,		  
    v_RENTAL_OFFICE     IN RTSD0053.RENTAL_OFFICE%TYPE,		  
    v_RENTAL_OFFICE_NM  IN RTSD0053.RENTAL_OFFICE_NM%TYPE,		  
    v_USE_YN            IN RTSD0053.USE_YN%TYPE,	
    v_REG_ID    		    IN RTSD0053.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0053 ( 
    v_RENTAL_GROUP	    IN RTSD0053.RENTAL_GROUP%TYPE,		  
    v_RENTAL_OFFICE     IN RTSD0053.RENTAL_OFFICE%TYPE,		  
    v_RENTAL_OFFICE_NM  IN RTSD0053.RENTAL_OFFICE_NM%TYPE,		  
    v_USE_YN            IN RTSD0053.USE_YN%TYPE,	
    v_REG_ID    		    IN RTSD0053.REG_ID%TYPE,  
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;    
END PKG_RTSD0053;
/
