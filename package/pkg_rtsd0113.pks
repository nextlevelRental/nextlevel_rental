CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0113 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0113
   PURPOSE   판매인정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가
*******************************************************************************/

  /*****************************************************************************
  -- 판매인정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0113Count(
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE         /*판매인번호          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매인정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0113 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*판매인명              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE       /*연락처                */
    );

  /*****************************************************************************
  -- 판매인정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*판매인명              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE,      /*연락처                */    
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE,        /*채널구분              */
    v_Lifnr          IN RTSD0113.LIFNR%TYPE,          /*벤더코드              */
    v_Num            IN RTSD0113.NUM%TYPE,            /*노출순서              */
    v_Sales_Group    IN RTSD0113.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0113.SALES_OFFICE%TYPE,   /*지점                  */
    v_Tax_Rqcd       IN RTSD0113.TAX_RQCD%TYPE,       /*세금계산서 발행방법   */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */
    v_Rental_Group   IN RTSD0113.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTSD0113.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */      
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매인정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*판매인명              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE,      /*연락처                */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE,        /*채널구분              */
    v_Lifnr          IN RTSD0113.LIFNR%TYPE,          /*벤더코드              */
    v_Num            IN RTSD0113.NUM%TYPE,            /*노출순서              */
    v_Sales_Group    IN RTSD0113.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0113.SALES_OFFICE%TYPE,   /*지점                  */
    v_Tax_Rqcd       IN RTSD0113.TAX_RQCD%TYPE,       /*세금계산서 발행방법   */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */
    v_Rental_Group   IN RTSD0113.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTSD0113.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */          
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매인정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매인정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0113 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*판매인명              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE,      /*연락처                */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE,        /*채널구분              */
    v_Lifnr          IN RTSD0113.LIFNR%TYPE,          /*벤더코드              */
    v_Num            IN RTSD0113.NUM%TYPE,            /*노출순서              */
    v_Sales_Group    IN RTSD0113.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0113.SALES_OFFICE%TYPE,   /*지점                  */
    v_Tax_Rqcd       IN RTSD0113.TAX_RQCD%TYPE,       /*세금계산서 발행방법   */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */
    v_Rental_Group   IN RTSD0113.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTSD0113.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 판매인정보 Select - 판매인 정보 조회 팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0113Popup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인코드            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*판매인명              */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*사용여부              */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE         /*채널정보              */
    );

  /*****************************************************************************
  -- 판매인정보 Select - 권한그룹별 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0113UserGrp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE        /*권한그룹              */
    );

  /*****************************************************************************
  -- 판매인정보 Select - 판매인 등록
  *****************************************************************************/
  PROCEDURE p_sRtsd0113List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /* 판매인번호            */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /* 사용여부              */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );

  /*****************************************************************************
  -- 판매인정보 -  판매인번호 기준 필드정보 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0113FieldValue(
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,        /*판매인번호          */
    v_Field_Nm       IN VARCHAR,                        /*필드명              */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE            /*사용여부            */    
    ) RETURN VARCHAR2;
        
END Pkg_Rtsd0113;
/
