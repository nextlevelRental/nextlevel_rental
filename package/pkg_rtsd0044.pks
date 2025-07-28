CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0044 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0044
   PURPOSE:   면제회차

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-11-21   sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- 면제회차 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0044 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0044.SALE_CD%TYPE     /* 판매상품코드            */
  );
        
  /*****************************************************************************
  -면제회차 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0044 (
    v_Sale_Cd           IN RTSD0044.SALE_CD%TYPE,           /* 판매코드         */
    v_Exm_Mnt           IN RTSD0044.EXM_MNT%TYPE,           /* 면제회차         */
    v_Reg_Id            IN RTSD0044.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -면제회차 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0044 (
    v_Sale_Cd         IN RTSD0044.SALE_CD%TYPE          /* 판매코드              */
    ) RETURN NUMBER;  
  
  /*****************************************************************************
  --면제회차 (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0044 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)  */
    v_Sale_Cd           IN RTSD0044.SALE_CD%TYPE,           /* 판매코드         */
    v_Exm_Mnt           IN RTSD0044.EXM_MNT%TYPE,           /* 면제회차         */
    v_Reg_Id            IN RTSD0044.REG_ID%TYPE,            /* 등록자 ID        */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  ); 
   
END Pkg_Rtsd0044;