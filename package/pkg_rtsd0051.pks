CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0051 AS
/*******************************************************************************
   NAME:     PKG_RTSD0051
   Title:    렌탈 마스터 관리지역

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-09  Sean             1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- 렌탈 마스터 관리지역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0051 (
    v_Comm_Dvsn      IN CHAR,                           /* 처리구분(I,U,D)     */
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* 렌탈지역            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* 등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 렌탈 마스터 관리지역 Count
  *****************************************************************************/
  FUNCTION f_sRTSD0051Count(
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE     /* 렌탈지역            */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 렌탈 마스터 관리지역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0051 (
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* 렌탈지역            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* 등록자 ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈 마스터 관리지역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0051 ( 
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* 렌탈지역            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* 등록자 ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 렌탈 마스터 관리지역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRTSD0051 ( 
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* 렌탈지역            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* 등록자 ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;      
END PKG_RTSD0051;