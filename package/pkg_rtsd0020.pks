CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0020 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0020
   PURPOSE:   판매상품등록

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-10-16   sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- 공통코드명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0051CodeName(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- 공통코드 코드조회
  *****************************************************************************/
  FUNCTION f_sRtcm0051Code(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN VARCHAR;

    
  /*****************************************************************************
  -- 할인등록 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0020 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0020.SALE_CD%TYPE         /* 판매코드   */
  );


  /*****************************************************************************
  -- 판매상품조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0020SellProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_NM       IN RTSD0020.SALE_NM%TYPE,         /* 판매코드       */
    v_Sale_STR_DAY  IN RTSD0020.SALE_STR_DAY%TYPE,    /* 판매시작일자   */
    v_Prdt_Grp      IN RTSD0020.  PRDT_GRP%TYPE,      /* 판매유형(Lv1)  */
    v_Prdt_Grp2     IN RTSD0020.  PRDT_GRP_DTL%TYPE,      /* 판매유형(Lv2)  */   
    v_Chan_Cd       VARCHAR2 DEFAULT NULL             /* 주문등록에서 판매채널 값 */
  );

  /*****************************************************************************
  -- 판매상품 판매코드 채번 
  *****************************************************************************/
  FUNCTION f_sRTSD0020Seq RETURN VARCHAR2;

  /*****************************************************************************
  -판매상품등록 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0020 (
    v_Sale_Cd           IN RTSD0020.SALE_CD%TYPE,         /* 판매코드                        */
    v_Sale_Nm           IN RTSD0020.SALE_NM%TYPE,         /* 판매상품명                      */
    v_Sale_Str_Day      IN RTSD0020.SALE_STR_DAY%TYPE,    /* 판매시작일자                    */
    v_Sale_End_Day      IN RTSD0020.SALE_END_DAY%TYPE,    /* 판매종료일자                    */
    v_Chan_Cd           IN RTSD0020.CHAN_CD%TYPE,         /* 채널구분코드                    */
    v_Hshop_Gb          IN RTSD0020.HSHOP_GB%TYPE,        /* 홈쇼핑구분코드                  */
    v_Dc_Rate           IN RTSD0020.DC_RATE%TYPE,         /* 할인율                          */
    v_Dc_Amt            IN RTSD0020.DC_AMT%TYPE,          /* 할인금액                        */
    v_Prdt_Grp          IN RTSD0020.PRDT_GRP%TYPE,        /* 상품군코드(렌탈상품코드)        */
    v_Pkg_Dc_Yn         IN RTSD0020.PKG_DC_YN%TYPE,       /* 패키지중복할인여부              */
    v_Pre_Dc_Yn         IN RTSD0020.PRE_DC_YN%TYPE,       /* 선납중복할인여부                */
    v_Fpay_Yn           IN RTSD0020.FPAY_YN%TYPE,         /* 일시납판매여부                  */
    v_Regi_Cal_Gb       IN RTSD0020.REGI_CAL_GB%TYPE,     /* 등록비계산구분                  */
    v_Use_Yn            IN RTSD0020.USE_YN%TYPE,          /* 사용여부                        */
    v_Grp_Sale_Gb       IN RTSD0020.GRP_SALE_GB%TYPE,     /* 단체판매구분코드                */
    v_Prdt_Grp_Dtl      IN RTSD0020.PRDT_GRP_DTL%TYPE,    /* 판매유형(Lv2)                   */
    v_Rerental_Dc_Yn    IN RTSD0020.RERENTAL_DC_YN%TYPE,  /* 재렌탈중복할인여부              */
    v_Cust_Type         IN RTSD0020.CUST_TYPE%TYPE,       /* 고객유형                        */
    v_Age_Limit         IN RTSD0020.AGE_LIMIT%TYPE,       /* 연령제한                        */
    v_Age               IN RTSD0020.AGE%TYPE,             /* 연령                            */
    v_Contents          IN RTSD0020.CONTENTS%TYPE,        /* 비고 */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,          /* 등록자 ID                       */
    v_hashTag1          IN RTSD0020.HASH_TAG1%TYPE,       /* 해시태그1                       */
    v_hashTag2          IN RTSD0020.HASH_TAG2%TYPE,       /* 해시태그2                       */
    v_hashTag3          IN RTSD0020.HASH_TAG3%TYPE,       /* 해시태그3                       */
    v_hashTag4          IN RTSD0020.HASH_TAG4%TYPE,       /* 해시태그4                       */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;   
  
  /*****************************************************************************
  -판매상품등록 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0020 (
    v_Sale_Cd           IN RTSD0020.SALE_CD%TYPE,         /* 판매코드                        */
    v_Sale_Nm           IN RTSD0020.SALE_NM%TYPE,         /* 판매상품명                      */
    v_Sale_Str_Day      IN RTSD0020.SALE_STR_DAY%TYPE,    /* 판매시작일자                    */
    v_Sale_End_Day      IN RTSD0020.SALE_END_DAY%TYPE,    /* 판매종료일자                    */
    v_Chan_Cd           IN RTSD0020.CHAN_CD%TYPE,         /* 채널구분코드                    */
    v_Hshop_Gb          IN RTSD0020.HSHOP_GB%TYPE,        /* 홈쇼핑구분코드                  */
    v_Dc_Rate           IN RTSD0020.DC_RATE%TYPE,         /* 할인율                          */
    v_Dc_Amt            IN RTSD0020.DC_AMT%TYPE,          /* 할인금액                        */
    v_Prdt_Grp          IN RTSD0020.PRDT_GRP%TYPE,        /* 상품군코드(렌탈상품코드)        */
    v_Pkg_Dc_Yn         IN RTSD0020.PKG_DC_YN%TYPE,       /* 패키지중복할인여부              */
    v_Pre_Dc_Yn         IN RTSD0020.PRE_DC_YN%TYPE,       /* 선납중복할인여부                */
    v_Fpay_Yn           IN RTSD0020.FPAY_YN%TYPE,         /* 일시납판매여부                  */
    v_Regi_Cal_Gb       IN RTSD0020.REGI_CAL_GB%TYPE,     /* 등록비계산구분                  */
    v_Use_Yn            IN RTSD0020.USE_YN%TYPE,          /* 사용여부                        */
    v_Grp_Sale_Gb       IN RTSD0020.GRP_SALE_GB%TYPE,     /* 단체판매구분코드                */
    v_Prdt_Grp_Dtl      IN RTSD0020.PRDT_GRP_DTL%TYPE,    /* 판매유형(Lv2)                   */
    v_Rerental_Dc_Yn    IN RTSD0020.RERENTAL_DC_YN%TYPE,  /* 재렌탈중복할인여부              */
    v_Cust_Type         IN RTSD0020.CUST_TYPE%TYPE,       /* 고객유형                        */
    v_Age_Limit         IN RTSD0020.AGE_LIMIT%TYPE,       /* 연령제한                        */
    v_Age               IN RTSD0020.AGE%TYPE,             /* 연령                            */
    v_Contents          IN RTSD0020.CONTENTS%TYPE,        /* 비고 */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,          /* 등록자 ID                       */
    v_hashTag1          IN RTSD0020.HASH_TAG1%TYPE,       /* 해시태그1                       */
    v_hashTag2          IN RTSD0020.HASH_TAG2%TYPE,       /* 해시태그2                       */
    v_hashTag3          IN RTSD0020.HASH_TAG3%TYPE,       /* 해시태그3                       */
    v_hashTag4          IN RTSD0020.HASH_TAG4%TYPE,       /* 해시태그4                       */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;   
  
  /*****************************************************************************
  --판매상품정보등록(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0020 (
    v_Comm_Dvsn         IN CHAR,                          /* 처리구분(I,U,D)                 */
    v_Sale_Cd           IN RTSD0020.SALE_CD%TYPE,         /* 판매코드                        */
    v_Sale_Nm           IN RTSD0020.SALE_NM%TYPE,         /* 판매상품명                      */
    v_Sale_Str_Day      IN RTSD0020.SALE_STR_DAY%TYPE,    /* 판매시작일자                    */
    v_Sale_End_Day      IN RTSD0020.SALE_END_DAY%TYPE,    /* 판매종료일자                    */
    v_Chan_Cd           IN RTSD0020.CHAN_CD%TYPE,         /* 채널구분코드                    */
    v_Hshop_Gb          IN RTSD0020.HSHOP_GB%TYPE,        /* 홈쇼핑구분코드                  */
    v_Dc_Rate           IN RTSD0020.DC_RATE%TYPE,         /* 할인율                          */
    v_Dc_Amt            IN RTSD0020.DC_AMT%TYPE,          /* 할인금액                        */
    v_Prdt_Grp          IN RTSD0020.PRDT_GRP%TYPE,        /* 상품군코드(렌탈상품코드)        */
    v_Pkg_Dc_Yn         IN RTSD0020.PKG_DC_YN%TYPE,       /* 패키지중복할인여부              */
    v_Pre_Dc_Yn         IN RTSD0020.PRE_DC_YN%TYPE,       /* 선납중복할인여부                */
    v_Fpay_Yn           IN RTSD0020.FPAY_YN%TYPE,         /* 일시납판매여부                  */
    v_Regi_Cal_Gb       IN RTSD0020.REGI_CAL_GB%TYPE,     /* 등록비계산구분                  */
    v_Use_Yn            IN RTSD0020.USE_YN%TYPE,          /* 사용여부                        */
    v_Grp_Sale_Gb       IN RTSD0020.GRP_SALE_GB%TYPE,     /* 단체판매구분코드                */
    v_Prdt_Grp_Dtl      IN RTSD0020.PRDT_GRP_DTL%TYPE,    /* 판매유형(Lv2)                   */
    v_Rerental_Dc_Yn    IN RTSD0020.RERENTAL_DC_YN%TYPE,  /* 재렌탈중복할인여부              */
    v_Cust_Type         IN RTSD0020.CUST_TYPE%TYPE,       /* 고객유형                        */
    v_Age_Limit         IN RTSD0020.AGE_LIMIT%TYPE,       /* 연령제한                        */
    v_Age               IN RTSD0020.AGE%TYPE,             /* 연령                            */
    v_Contents          IN RTSD0020.CONTENTS%TYPE,        /* 비고 */
    v_Reg_Id            IN RTSD0020.REG_ID%TYPE,          /* 등록자 ID                       */
    v_hashTag1          IN RTSD0020.HASH_TAG1%TYPE,       /* 해시태그1                       */
    v_hashTag2          IN RTSD0020.HASH_TAG2%TYPE,       /* 해시태그2                       */
    v_hashTag3          IN RTSD0020.HASH_TAG3%TYPE,       /* 해시태그3                       */
    v_hashTag4          IN RTSD0020.HASH_TAG4%TYPE,       /* 해시태그4                       */    
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  );  

END Pkg_Rtsd0020;
/
