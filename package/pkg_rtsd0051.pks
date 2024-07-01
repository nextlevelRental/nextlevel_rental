CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0051 AS
/*******************************************************************************
   NAME:     PKG_RTSD0051
   Title:    ·»Å» ¸¶½ºÅÍ °ü¸®Áö¿ª

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-09  Sean             1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- ·»Å» ¸¶½ºÅÍ °ü¸®Áö¿ª °ü¸®(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0051 (
    v_Comm_Dvsn      IN CHAR,                           /* Ã³¸®±¸ºÐ(I,U,D)     */
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ·»Å» ¸¶½ºÅÍ »ç¹ø     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ·»Å»Áö»ç            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* ·»Å»Áö¿ª            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* µî·ÏÀÚ ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ·»Å» ¸¶½ºÅÍ °ü¸®Áö¿ª Count
  *****************************************************************************/
  FUNCTION f_sRTSD0051Count(
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ·»Å» ¸¶½ºÅÍ »ç¹ø     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ·»Å»Áö»ç            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE     /* ·»Å»Áö¿ª            */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ·»Å» ¸¶½ºÅÍ °ü¸®Áö¿ª Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0051 (
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ·»Å» ¸¶½ºÅÍ »ç¹ø     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ·»Å»Áö»ç            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* ·»Å»Áö¿ª            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* µî·ÏÀÚ ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ·»Å» ¸¶½ºÅÍ °ü¸®Áö¿ª Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0051 ( 
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ·»Å» ¸¶½ºÅÍ »ç¹ø     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ·»Å»Áö»ç            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* ·»Å»Áö¿ª            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* µî·ÏÀÚ ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ·»Å» ¸¶½ºÅÍ °ü¸®Áö¿ª Delete
  *****************************************************************************/
  FUNCTION f_DeleteRTSD0051 ( 
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ·»Å» ¸¶½ºÅÍ »ç¹ø     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ·»Å»Áö»ç            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* ·»Å»Áö¿ª            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* µî·ÏÀÚ ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;      
END PKG_RTSD0051;
/
