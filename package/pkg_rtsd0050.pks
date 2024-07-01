CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0050 AS
/*******************************************************************************
   NAME:     PKG_RTSD0050
   PURPOSE:  ·»Å»¸¶½ºÅÍ

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-05  Sean             1. Created this package spec.
*******************************************************************************/

  /*****************************************************************************
  -- ·»Å»¸¶½ºÅÍ Á¶È¸
  *****************************************************************************/
  PROCEDURE p_sRtsd0050 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RTMASTER_NM    IN RTSD0050.RTMASTER_NM%TYPE        /* ·»Å» ¸¶½ºÅÍ ¸í */
    );

  /*****************************************************************************
  -- ·»Å»¸¶½ºÅÍ °ü¸®Áö¿ª Á¶È¸
  *****************************************************************************/
  PROCEDURE p_sRtsd0050MgmtArea (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RTMASTER_NU    IN RTSD0050.RTMASTER_NU%TYPE        /* ·»Å» ¸¶½ºÅÍ »ç¹ø */
    );

  /*****************************************************************************
  -- ¼Ò¼ÓÆÇ¸ÅÀÎ Á¶È¸
  *****************************************************************************/
  PROCEDURE p_sRtsd0050SalesAgent (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP   IN RTSD0052.RENTAL_GROUP%TYPE,      /* ·»Å»Áö»ç */
    v_RTMASTER_NU    IN RTSD0050.RTMASTER_NU%TYPE        /* ·»Å» ¸¶½ºÅÍ »ç¹ø */    
    );
    
   /*****************************************************************************
  -- ·»Å»¸¶½ºÅÍ °ü¸®(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0050 (
    v_Comm_Dvsn       IN CHAR,                         /* Ã³¸®±¸ºÐ(I,U,D) */
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE,
    v_RTMASTER_NM     IN RTSD0050.RTMASTER_NM%TYPE,
    v_MOB_NO          IN RTSD0050.MOB_NO%TYPE,
    v_TEL_NO          IN RTSD0050.TEL_NO%TYPE,
    v_USE_YN          IN RTSD0050.USE_YN%TYPE,	
    v_REG_ID    		  IN RTSD0050.REG_ID%TYPE,		  
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    

  /*****************************************************************************
  -- ·»Å»¸¶½ºÅÍ Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0050 (
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE,
    v_RTMASTER_NM     IN RTSD0050.RTMASTER_NM%TYPE,
    v_MOB_NO          IN RTSD0050.MOB_NO%TYPE,
    v_TEL_NO          IN RTSD0050.TEL_NO%TYPE,
    v_USE_YN          IN RTSD0050.USE_YN%TYPE,	
    v_REG_ID    		  IN RTSD0050.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ·»Å»¸¶½ºÅÍ Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0050 ( 
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE,
    v_RTMASTER_NM     IN RTSD0050.RTMASTER_NM%TYPE,
    v_MOB_NO          IN RTSD0050.MOB_NO%TYPE,
    v_TEL_NO          IN RTSD0050.TEL_NO%TYPE,
    v_USE_YN          IN RTSD0050.USE_YN%TYPE,
    v_REG_ID    		  IN RTSD0050.REG_ID%TYPE, 
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;    

  /*****************************************************************************
  -- ·»Å»¸¶½ºÅÍ - ·»Å» ¸¶½ºÅÍ »ç¹ø È¹µæ
  *****************************************************************************/
  FUNCTION f_sRtsd0050NuSeq RETURN VARCHAR2;
  
  /*****************************************************************************
  -- ·»Å»¸¶½ºÅÍ Count
  *****************************************************************************/
  FUNCTION f_sRTSD0050Count ( 
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE
    ) RETURN NUMBER;
END PKG_RTSD0050;
/
