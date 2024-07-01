CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0029 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0029
   PURPOSE :  등록비관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-23  sePark            1. Created this package.             
*******************************************************************************/


  /*****************************************************************************
  -- 등록비관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0029 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0029.SALE_CD%TYPE           /* 판매코드         */
  );
  
  /*****************************************************************************
  -등록비관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* 판매코드         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -등록비관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* 판매코드         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;    


  /*****************************************************************************
  -등록비관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* 판매코드         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -등록비관리 DB Copy
  *****************************************************************************/
  FUNCTION f_InsertRtsd0030DbCopy (
    v_Cnt_Cd            IN RTSD0030.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0030.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0030.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;  
        
  /*****************************************************************************
  --등록비관리 (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0029 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)  */
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* 판매코드         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* 등록자 ID        */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 주문등록 판매코드에 따른 등록비 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0029RegAmtInfo (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0029.SALE_CD%TYPE           /* 판매코드         */
  );  
END Pkg_Rtsd0029;
/
