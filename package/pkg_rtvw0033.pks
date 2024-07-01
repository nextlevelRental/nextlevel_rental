CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTVW0033 AS
/*******************************************************************************
   NAME:     PKG_RTVW0033
   PURPOSE:  ¼Ò¼ÓÆÇ¸ÅÀÎ

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-13  Sean             1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- ·»Å»Áö»ç/Áö¿ª Á¶È¸
  *****************************************************************************/
  PROCEDURE p_sRtvw0033 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP   IN RTVIEW33.RENTAL_GROUP%TYPE,        /* ·»Å» Áö»ç */
    v_RENTAL_OFFICE  IN RTVIEW33.RENTAL_OFFICE%TYPE,       /* ·»Å» Áö¿ª */
    v_CHN_CD         IN CHAR                               /* ±¸ºÐ: 0, 1, 2, 3 */
    );
    
  /*****************************************************************************
  -- ·»Å»Áö»ç/Áö¿ª °ü¸®(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtvw0033 (
    v_Comm_Dvsn      IN CHAR,                           /* Ã³¸®±¸ºÐ(I,U,D)     */
    v_CHN_CL         IN CHAR,                           /* ±¸ºÐÄÚµå            */
    v_AGENCY_CD      IN RTVIEW33.AGENCY_CD%TYPE,        /* ´ë¸®Á¡ÄÚµå          */
    v_RENTAL_GROUP_NEW IN RTVIEW33.RENTAL_GROUP%TYPE,   /* ·»Å»Áö»ç            */
    v_RENTAL_OFFICE_NEW IN RTVIEW33.RENTAL_OFFICE%TYPE, /* ·»Å»Áö¿ª            */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,           /* µî·ÏÀÚ ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ·»Å»Áö»ç/Áö¿ª(´ë¸®Á¡) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0007 ( 
    v_AGENCY_CD         IN RTSD0007.AGENCY_CD%TYPE,     /* ´ë¸®Á¡ÄÚµå          */
    v_RENTAL_GROUP_NEW  IN RTSD0007.RENTAL_GROUP%TYPE,  /* ·»Å»Áö»ç            */
    v_RENTAL_OFFICE_NEW IN RTSD0007.RENTAL_OFFICE%TYPE, /* ·»Å»Áö¿ª            */
    v_Reg_Id            IN RTSD0007.REG_ID%TYPE,        /* µî·ÏÀÚ ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ·»Å»Áö»ç/Áö¿ª(ÆÇ¸ÅÀÎ) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0113 ( 
    v_AGENCY_CD         IN RTSD0113.ORD_AGENT%TYPE,     /* ÆÇ¸ÅÀÎ¹øÈ£          */
    v_RENTAL_GROUP_NEW  IN RTSD0113.RENTAL_GROUP%TYPE,  /* ·»Å»Áö»ç            */
    v_RENTAL_OFFICE_NEW IN RTSD0113.RENTAL_OFFICE%TYPE, /* ·»Å»Áö¿ª            */
    v_Reg_Id            IN RTSD0113.REG_ID%TYPE,        /* µî·ÏÀÚ ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ·»Å»Áö»ç/Áö¿ª(·Îµð¾È) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCS0002 ( 
    v_AGENCY_CD         IN RTCS0002.ORD_AGENT%TYPE,     /* ´ë¸®Á¡ÄÚµå          */
    v_RENTAL_GROUP_NEW  IN RTCS0002.RENTAL_GROUP%TYPE,  /* ·»Å»Áö»ç            */
    v_RENTAL_OFFICE_NEW IN RTCS0002.RENTAL_OFFICE%TYPE, /* ·»Å»Áö¿ª            */
    v_Reg_Id            IN RTCS0002.REG_ID%TYPE,        /* µî·ÏÀÚ ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;    
    
END PKG_RTVW0033;
/
