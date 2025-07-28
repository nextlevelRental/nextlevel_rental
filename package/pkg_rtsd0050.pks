CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0050 AS
/*******************************************************************************
   NAME:     PKG_RTSD0050
   PURPOSE:  렌탈마스터

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-05  Sean             1. Created this package spec.
*******************************************************************************/

  /*****************************************************************************
  -- 렌탈마스터 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0050 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RTMASTER_NM    IN RTSD0050.RTMASTER_NM%TYPE        /* 렌탈 마스터 명 */
    );

  /*****************************************************************************
  -- 렌탈마스터 관리지역 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0050MgmtArea (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RTMASTER_NU    IN RTSD0050.RTMASTER_NU%TYPE        /* 렌탈 마스터 사번 */
    );

  /*****************************************************************************
  -- 소속판매인 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0050SalesAgent (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP   IN RTSD0052.RENTAL_GROUP%TYPE,      /* 렌탈지사 */
    v_RTMASTER_NU    IN RTSD0050.RTMASTER_NU%TYPE        /* 렌탈 마스터 사번 */    
    );
    
   /*****************************************************************************
  -- 렌탈마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0050 (
    v_Comm_Dvsn       IN CHAR,                         /* 처리구분(I,U,D) */
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
  -- 렌탈마스터 Insert
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
  -- 렌탈마스터 Update
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
  -- 렌탈마스터 - 렌탈 마스터 사번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0050NuSeq RETURN VARCHAR2;
  
  /*****************************************************************************
  -- 렌탈마스터 Count
  *****************************************************************************/
  FUNCTION f_sRTSD0050Count ( 
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE
    ) RETURN NUMBER;
END PKG_RTSD0050;