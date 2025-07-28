CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0028 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0028
   PURPOSE   프리미엄서비스 관리(세부서비스) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-19  chul             [20181019_00] 프리미엄 서비스 팝업 도입
*******************************************************************************/
  
  /*****************************************************************************
  -- 쇼핑몰 자유렌탈 프리미엄 서비스 리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0028_shopCafePrsList (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Period_Cd          IN RTSD0012.PERIOD_CD%TYPE,    /* 기간코드         */
      v_Cnt_Cd             IN RTSD0012.CNT_CD%TYPE        /* 타이어본수       */
  );
  
  /*****************************************************************************
  -- 프리미엄 서비스 등록팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0028_srvcOrdPopup (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Sale_Cd            IN RTSD0020.SALE_CD%TYPE,      /* 판매코드         */
      v_Period_Cd          IN RTSD0012.PERIOD_CD%TYPE,    /* 기간코드         */
      v_Cnt_Cd             IN RTSD0012.CNT_CD%TYPE        /* 타이어본수       */
  );
  
  /*****************************************************************************
  -- 주문별 프리미엄 서비스 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0028_srvcOrdList (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Ord_No             IN RTSD0106.ORD_NO%TYPE         /*계약번호         */
  );

  /*****************************************************************************
  -- 판매프리미엄정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0028.SALE_CD%TYPE         /* 판매코드  */
  );
  
  /*****************************************************************************
  -판매프리미엄정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0028 (
    v_Sale_Cd           IN RTSD0028.SALE_CD%TYPE,           /* 판매코드         */
    v_Prs_Dcd           IN RTSD0028.PRS_DCD%TYPE,           /* 상세서비스       */
    v_Serv_Inf_Yn       IN RTSD0028.SERV_INF_YN%TYPE,           /* 상세서비스       */
    v_Seq               IN RTSD0028.SEQ%TYPE,               /* 시퀀스       */
    v_Reg_Id            IN RTSD0028.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -판매프리미엄정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0028 (
    v_Sale_Cd           IN RTSD0028.SALE_CD%TYPE           /* 판매코드         */   
    ) RETURN NUMBER;    

  /*****************************************************************************
  --판매프리미엄정보 (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0028 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)  */
    v_Sale_Cd           IN RTSD0028.SALE_CD%TYPE,           /* 판매코드         */
    v_Prs_Dcd           IN RTSD0028.PRS_DCD%TYPE,           /* 상세서비스       */
    v_Serv_Inf_Yn       IN RTSD0028.SERV_INF_YN%TYPE,           /* 상세서비스       */
    v_Seq               IN RTSD0028.SEQ%TYPE,               /* 시퀀스       */
    v_Reg_Id            IN RTSD0028.REG_ID%TYPE,            /* 등록자 ID        */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  );
  
  
END Pkg_Rtsd0028;