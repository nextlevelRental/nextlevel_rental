CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0052 AS
/*******************************************************************************
   NAME:     PKG_RTSD0052
   PURPOSE   ��Ż ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-31  Sean         1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- ��Ż������ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0052 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP_NM IN RTSD0052.RENTAL_GROUP_NM%TYPE          /* ��Ż�����  */
    );
    
   /*****************************************************************************
  -- ��Ż���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0052 (
    v_Comm_Dvsn         IN CHAR,                         /* ó������(I,U,D) */
    v_RENTAL_GROUP	    IN RTSD0052.RENTAL_GROUP%TYPE,
    v_RENTAL_GROUP_NM   IN RTSD0052.RENTAL_GROUP_NM%TYPE,
    v_USE_YN            IN RTSD0052.USE_YN%TYPE,	
    v_REG_ID    		    IN RTSD0052.REG_ID%TYPE,		  
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   

  /*****************************************************************************
  -- ��Ż���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0052 (
    v_RENTAL_GROUP	    IN RTSD0052.RENTAL_GROUP%TYPE,		  
    v_RENTAL_GROUP_NM   IN RTSD0052.RENTAL_GROUP_NM%TYPE,
    v_USE_YN            IN RTSD0052.USE_YN%TYPE,	
    v_REG_ID    		    IN RTSD0052.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0052 ( 
    v_RENTAL_GROUP	    IN RTSD0052.RENTAL_GROUP%TYPE,		  
    v_RENTAL_GROUP_NM   IN RTSD0052.RENTAL_GROUP_NM%TYPE,
    v_USE_YN            IN RTSD0052.USE_YN%TYPE,	
    v_REG_ID    		    IN RTSD0052.REG_ID%TYPE,  
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;    
END PKG_RTSD0052;
/
