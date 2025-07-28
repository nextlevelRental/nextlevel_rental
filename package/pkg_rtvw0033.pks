CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTVW0033 AS
/*******************************************************************************
   NAME:     PKG_RTVW0033
   PURPOSE:  소속판매인

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-13  Sean             1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- 렌탈지사/지역 조회
  *****************************************************************************/
  PROCEDURE p_sRtvw0033 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP   IN RTVIEW33.RENTAL_GROUP%TYPE,        /* 렌탈 지사 */
    v_RENTAL_OFFICE  IN RTVIEW33.RENTAL_OFFICE%TYPE,       /* 렌탈 지역 */
    v_CHN_CD         IN CHAR                               /* 구분: 0, 1, 2, 3 */
    );
    
  /*****************************************************************************
  -- 렌탈지사/지역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtvw0033 (
    v_Comm_Dvsn      IN CHAR,                           /* 처리구분(I,U,D)     */
    v_CHN_CL         IN CHAR,                           /* 구분코드            */
    v_AGENCY_CD      IN RTVIEW33.AGENCY_CD%TYPE,        /* 대리점코드          */
    v_RENTAL_GROUP_NEW IN RTVIEW33.RENTAL_GROUP%TYPE,   /* 렌탈지사            */
    v_RENTAL_OFFICE_NEW IN RTVIEW33.RENTAL_OFFICE%TYPE, /* 렌탈지역            */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,           /* 등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 렌탈지사/지역(대리점) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0007 ( 
    v_AGENCY_CD         IN RTSD0007.AGENCY_CD%TYPE,     /* 대리점코드          */
    v_RENTAL_GROUP_NEW  IN RTSD0007.RENTAL_GROUP%TYPE,  /* 렌탈지사            */
    v_RENTAL_OFFICE_NEW IN RTSD0007.RENTAL_OFFICE%TYPE, /* 렌탈지역            */
    v_Reg_Id            IN RTSD0007.REG_ID%TYPE,        /* 등록자 ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈지사/지역(판매인) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0113 ( 
    v_AGENCY_CD         IN RTSD0113.ORD_AGENT%TYPE,     /* 판매인번호          */
    v_RENTAL_GROUP_NEW  IN RTSD0113.RENTAL_GROUP%TYPE,  /* 렌탈지사            */
    v_RENTAL_OFFICE_NEW IN RTSD0113.RENTAL_OFFICE%TYPE, /* 렌탈지역            */
    v_Reg_Id            IN RTSD0113.REG_ID%TYPE,        /* 등록자 ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 렌탈지사/지역(로디안) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCS0002 ( 
    v_AGENCY_CD         IN RTCS0002.ORD_AGENT%TYPE,     /* 대리점코드          */
    v_RENTAL_GROUP_NEW  IN RTCS0002.RENTAL_GROUP%TYPE,  /* 렌탈지사            */
    v_RENTAL_OFFICE_NEW IN RTCS0002.RENTAL_OFFICE%TYPE, /* 렌탈지역            */
    v_Reg_Id            IN RTCS0002.REG_ID%TYPE,        /* 등록자 ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;    
    
END PKG_RTVW0033;