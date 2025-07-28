CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0020 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0020
   PURPOSE:   판매상품등록
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-16  sePark         1. Created this package body.
   1.1        2019-03-21  wjim           [20190321_01] 판매상품 조회 기준 보완
   1.2        2020-01-06  kstka          [2020-00003781_01] 부모컬럼 자식컬럼 위치 변경  
*******************************************************************************/

  /*****************************************************************************
  -- 공통코드명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0051CodeName(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN VARCHAR IS

    v_Cd_Nm      RTCM0051.CD_NM%TYPE; /*코드명      */
  BEGIN

    SELECT  CD_NM
    INTO    v_Cd_Nm
    FROM    RTCM0051
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;
    RETURN v_Cd_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0051CodeName;  

  /*****************************************************************************
  -- 공통코드 코드조회
  *****************************************************************************/
  FUNCTION f_sRtcm0051Code(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN VARCHAR IS

    r_Cd      RTCM0051.CD_NM%TYPE; /* 코드      */
  BEGIN

    SELECT  CD
    INTO    r_Cd
    FROM    RTCM0051
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;
    RETURN r_Cd;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0051Code;  


  /*****************************************************************************
  -- 판매상품조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0020 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0020.SALE_CD%TYPE         /* 판매코드   */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  T.SALE_CD,                                                      /* 판매코드                */
            T.SALE_NM,                                                      /* 판매상품명              */
            T.SALE_STR_DAY,                                                 /* 판매시작일자            */
            T.SALE_END_DAY,                                                 /* 판매종료일자            */
            f_sRtcm0051Code('S214',T.CHAN_CD) AS CHAN_CD,                   /* 채널구분코드            */
            f_sRtcm0051CodeName('S214',T.CHAN_CD) AS CHAN_NM,               /* 채널구분코드명          */
            f_sRtcm0051Code('S096',T.HSHOP_GB) AS HSHOP_GB,                 /* 홈쇼핑구분코드          */
            f_sRtcm0051CodeName('S096',T.HSHOP_GB) AS HSHOP_GB_NM,          /* 홈쇼핑구분코드명        */
            RTRIM(TO_CHAR(T.DC_RATE,'FM9990D99'),'.')||'%' AS DC_RATE,      /* 할인율                  */
            T.DC_AMT,                                                       /* 할인금액                */
            f_sRtcm0051Code('S205',T.PRDT_GRP) AS PRDT_GRP,                 /* 상품군코드(렌탈상품코드 */
            f_sRtcm0051CodeName('S205',T.PRDT_GRP) AS PRDT_GRP_NM,          /* 상품군명(렌탈상품명)    */
            T.PKG_DC_YN,                                                    /* 패키지중복할인여부      */
            T.PRE_DC_YN,                                                    /* 선납중복할인여부        */
            f_sRtcm0051Code('S212',T.FPAY_YN) AS FPAY_YN,                   /* 일시납판매여부          */
            f_sRtcm0051CodeName('S212',T.FPAY_YN) AS FPAY_YN_NM,            /* 일시납판매여부명        */
            f_sRtcm0051Code('S211',T.REGI_CAL_GB) AS REGI_CAL_GB,           /* 등록비계산구분          */
            f_sRtcm0051CodeName('S211',T.REGI_CAL_GB) AS REGI_CAL_GB_NM,    /* 등록비계산구분명        */
            T.USE_YN,                                                       /* 사용여부                */
            f_sRtcm0051Code('S209',T.GRP_SALE_GB) AS GRP_SALE_GB,           /* 단체판매구분코드        */
            f_sRtcm0051CodeName('S209',T.GRP_SALE_GB) AS GRP_SALE_GB_NM,    /* 단체판매구분명          */
            f_sRtcm0051Code('S219',T.PRDT_GRP_DTL) AS PRDT_GRP_DTL,         /* 상품군코드(렌탈상품코드 */
            f_sRtcm0051CodeName('S219',T.PRDT_GRP_DTL) AS PRDT_GRP_DTL_NM,  /* 상품군명(렌탈상품명)    */
            T.CUST_TYPE,                                                    /* 고객유형코드            */
            f_sRtcm0051CodeName('S221',T.CUST_TYPE) AS CUST_TYPE_NM,        /* 고객유형명              */
            T.AGE_LIMIT,                                                    /* 연령제한코드            */
            f_sRtcm0051CodeName('S222',T.AGE_LIMIT) AS AGE_LIMIT_NM,        /* 연령제한명              */
            T.AGE,                                                          /* 연령                    */
            T.CONTENTS,                                                     /* 비고 */
            T.RERENTAL_DC_YN,                                               /* 재렌탈중복할인          */
            T.REG_DT,                                                       /* 등록일                  */
            T.REG_ID,                                                       /* 등록자 ID               */
            T.CHG_ID,                                                       /* 변경자 ID               */
            T.CHG_DT,                                                       /* 변경일                  */
            T.HASH_TAG1,                                                    /* 해시태그1                       */
            T.HASH_TAG2,                                                    /* 해시태그2                       */
            T.HASH_TAG3,                                                    /* 해시태그3                       */
            T.HASH_TAG4                                                     /* 해시태그4                       */
            
    FROM RTSD0020 T
    WHERE T.SALE_CD = DECODE(v_Sale_Cd, NULL, T.SALE_CD, v_Sale_Cd)
    ORDER BY T.SALE_CD;
    
  END p_sRtsd0020;



  /*****************************************************************************
  -- 판매상품조회 Select
  
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2019-03-21  wjim           [20190321_01] 특정 판매인(대리점)에게만 노출 기능 추가 
   1.2        2020-01-06  kstka          [2020-00003781_01] 부모컬럼 자식컬럼 위치 변경
   1.3        2020-09-14  kstka          [20200914_01] 판매채널별 상품 조회 가능하게 진행  
  *****************************************************************************/
  PROCEDURE p_sRtsd0020SellProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_NM       IN RTSD0020.SALE_NM%TYPE,         /* 판매코드       */
    v_Sale_STR_DAY  IN RTSD0020.SALE_STR_DAY%TYPE,    /* 판매시작일자   */
    v_Prdt_Grp      IN RTSD0020.  PRDT_GRP%TYPE,      /* 판매유형(Lv1)  */
    v_Prdt_Grp2     IN RTSD0020.  PRDT_GRP_DTL%TYPE,      /* 판매유형(Lv2)  */    
    v_Chan_Cd       VARCHAR2 DEFAULT NULL             /* 주문등록에서 판매채널 값 */
  ) IS

  BEGIN
  
    IF v_Chan_Cd IS NULL THEN
        OPEN Ref_Cursor FOR
        SELECT  SALE_CD,                                                      /* 판매코드                */
                SALE_NM,                                                      /* 판매상품명              */
                SALE_STR_DAY,                                                 /* 판매시작일자            */
                SALE_END_DAY,                                                 /* 판매종료일자            */
                f_sRtcm0051Code('S214',CHAN_CD) AS CHAN_CD,                   /* 채널구분코드            */
                f_sRtcm0051CodeName('S214',CHAN_CD) AS CHAN_NM,               /* 채널구분코드명          */
                f_sRtcm0051Code('S096',HSHOP_GB) AS HSHOP_GB,                 /* 홈쇼핑구분코드          */
                f_sRtcm0051CodeName('S096',HSHOP_GB) AS HSHOP_GB_NM,          /* 홈쇼핑구분코드명        */
                RTRIM(TO_CHAR(DC_RATE,'FM9990D99'),'.')||'%' AS DC_RATE,      /* 할인율                  */
                DC_AMT,                                                       /* 할인금액                */
                PRDT_GRP,                                                     /* 상품군코드(렌탈상품코드 */
                f_sRtcm0051CodeName('S205',PRDT_GRP) AS PRDT_GRP_NM,          /* 상품군명(렌탈상품명)    */
                PKG_DC_YN,                                                    /* 패키지중복할인여부      */
                PRE_DC_YN,                                                    /* 선납중복할인여부        */
                CASE FPAY_YN WHEN 'Y' THEN '일시납판매'
                                                         WHEN 'N' THEN '일시납불가' END AS FPAY_YN,
                f_sRtcm0051Code('S211',REGI_CAL_GB) AS REGI_CAL_GB,           /* 등록비계산구분          */
                f_sRtcm0051CodeName('S211',REGI_CAL_GB) AS REGI_CAL_GB_NM,    /* 등록비계산구분명        */
                USE_YN,                                                       /* 사용여부                */
                f_sRtcm0051Code('S209',GRP_SALE_GB) AS GRP_SALE_GB,           /* 단체판매구분코드        */
                f_sRtcm0051CodeName('S209',GRP_SALE_GB) AS GRP_SALE_GB_NM,    /* 단체판매구분명          */
                f_sRtcm0051Code('S219',PRDT_GRP_DTL) AS PRDT_GRP_DTL,         /* 상품군코드(렌탈상품코드 */
                f_sRtcm0051CodeName('S219',PRDT_GRP_DTL) AS PRDT_GRP_DTL_NM,  /* 상품군명(렌탈상품명)    */
                RERENTAL_DC_YN,                                               /* 재렌탈중복할인          */
                PRDT_GRP_DTL,                                                 /* 판매유형Lv2             */  
                REG_DT,                                                       /* 등록일                  */
                REG_ID,                                                       /* 등록자 ID               */
                CHG_ID,                                                       /* 변경자 ID               */
                CHG_DT                                                        /* 변경일                  */
        FROM RTSD0020
        WHERE  SALE_NM LIKE '%' || v_Sale_NM || '%'
        --AND SALE_STR_DAY >= v_Sale_STR_DAY
        AND PRDT_GRP = v_Prdt_Grp
        AND PRDT_GRP_DTL = DECODE(v_Prdt_Grp2, NULL,PRDT_GRP_DTL, v_Prdt_Grp2)
        ORDER BY SALE_STR_DAY;
    ELSE
        OPEN Ref_Cursor FOR
        SELECT  SALE_CD,                                                      /* 판매코드                */
                SALE_NM,                                                      /* 판매상품명              */
                SALE_STR_DAY,                                                 /* 판매시작일자            */
                SALE_END_DAY,                                                 /* 판매종료일자            */
                f_sRtcm0051Code('S214',CHAN_CD) AS CHAN_CD,                   /* 채널구분코드            */
                f_sRtcm0051CodeName('S214',CHAN_CD) AS CHAN_NM,               /* 채널구분코드명          */
                f_sRtcm0051Code('S096',HSHOP_GB) AS HSHOP_GB,                 /* 홈쇼핑구분코드          */
                f_sRtcm0051CodeName('S096',HSHOP_GB) AS HSHOP_GB_NM,          /* 홈쇼핑구분코드명        */
                RTRIM(TO_CHAR(DC_RATE,'FM9990D99'),'.')||'%' AS DC_RATE,      /* 할인율                  */
                DC_AMT,                                                       /* 할인금액                */
                PRDT_GRP,                                                     /* 상품군코드(렌탈상품코드 */
                f_sRtcm0051CodeName('S205',PRDT_GRP) AS PRDT_GRP_NM,          /* 상품군명(렌탈상품명)    */
                PKG_DC_YN,                                                    /* 패키지중복할인여부      */
                PRE_DC_YN,                                                    /* 선납중복할인여부        */
                CASE FPAY_YN WHEN 'Y' THEN '일시납판매'
                                                         WHEN 'N' THEN '일시납불가' END AS FPAY_YN,
                f_sRtcm0051Code('S211',REGI_CAL_GB) AS REGI_CAL_GB,           /* 등록비계산구분          */
                f_sRtcm0051CodeName('S211',REGI_CAL_GB) AS REGI_CAL_GB_NM,    /* 등록비계산구분명        */
                USE_YN,                                                       /* 사용여부                */
                f_sRtcm0051Code('S209',GRP_SALE_GB) AS GRP_SALE_GB,           /* 단체판매구분코드        */
                f_sRtcm0051CodeName('S209',GRP_SALE_GB) AS GRP_SALE_GB_NM,    /* 단체판매구분명          */
                f_sRtcm0051Code('S219',PRDT_GRP_DTL) AS PRDT_GRP_DTL,         /* 상품군코드(렌탈상품코드 */
                f_sRtcm0051CodeName('S219',PRDT_GRP_DTL) AS PRDT_GRP_DTL_NM,  /* 상품군명(렌탈상품명)    */
                RERENTAL_DC_YN,                                               /* 재렌탈중복할인          */
                PRDT_GRP_DTL,                                                 /* 판매유형Lv2             */
                REG_DT,                                                       /* 등록일                  */
                REG_ID,                                                       /* 등록자 ID               */
                CHG_ID,                                                       /* 변경자 ID               */
                CHG_DT                                                        /* 변경일                  */
        FROM RTSD0020 T
        WHERE  SALE_NM LIKE '%' || v_Sale_NM || '%'
        --AND SALE_STR_DAY >= v_Sale_STR_DAY
        AND PRDT_GRP = v_Prdt_Grp
        AND SALE_CD IN (
                        SELECT SALE_CD FROM (
                            SELECT A.*, LEVEL LV FROM RTSD0045 A
                            WHERE NVL(ORG_CD, '*') IN (v_Chan_Cd, '*')
                            START WITH CHAN_CD = (CASE WHEN LENGTH(v_Chan_Cd) = '2' THEN CASE WHEN v_Chan_Cd = '05' THEN '01'
                                                                                         ELSE v_Chan_Cd
                                                                                         END 
                                                 ELSE (SELECT AA.CHAN_CD FROM RTSD0113 AA WHERE AA.ORD_AGENT = v_Chan_Cd)
                                                 END)
                            CONNECT BY P_CHAN_CD = PRIOR CHAN_CD
                            ) WHERE (SALE_CD, LV) IN (                           
                                SELECT SALE_CD, MAX(LEVEL) LV FROM RTSD0045 A
                                START WITH CHAN_CD = (CASE WHEN LENGTH(v_Chan_Cd) = '2' THEN CASE WHEN v_Chan_Cd = '05' THEN '01'
                                                                                         ELSE v_Chan_Cd
                                                                                         END 
                                                 ELSE (SELECT AA.CHAN_CD FROM RTSD0113 AA WHERE AA.ORD_AGENT = v_Chan_Cd)
                                                 END)
                                CONNECT BY P_CHAN_CD = PRIOR CHAN_CD
                                GROUP BY SALE_CD
                            )
                        GROUP BY SALE_CD, CHAN_CD, P_CHAN_CD, ORG_CD
                        )
                        
--        AND SALE_CD IN (
--                        SELECT DISTINCT SALE_CD FROM RTSD0045
--                        WHERE 1=1
--                        AND NVL(ORG_CD, '*') IN (v_Chan_Cd, '*') --[201941263321_01]
--                        START WITH CHAN_CD = (CASE WHEN LENGTH(v_Chan_Cd) = '2' THEN CASE WHEN v_Chan_Cd = '05' THEN '01'
--                                                                                     ELSE v_Chan_Cd
--                                                                                     END 
--                                             ELSE (SELECT AA.CHAN_CD FROM RTSD0113 AA WHERE AA.ORD_AGENT = v_Chan_Cd)
--                                             END)
----                        CONNECT BY CHAN_CD = PRIOR P_CHAN_CD
--                        CONNECT BY P_CHAN_CD = PRIOR  CHAN_CD   --[2020-00003781_01] 부모컬럼 자식컬럼 위치 변경
--                       )
----        AND SALE_CD IN (
----                        SELECT DISTINCT SALE_CD FROM RTSD0045
----                        START WITH CHAN_CD = v_Chan_Cd
----                        CONNECT BY CHAN_CD = PRIOR  P_CHAN_CD
----                       )
        AND PRDT_GRP_DTL = DECODE(v_Prdt_Grp2, NULL,PRDT_GRP_DTL, v_Prdt_Grp2)
        ORDER BY SALE_STR_DAY;                          
    END IF;
    
    
  END p_sRtsd0020SellProduct;
  
  /*****************************************************************************
  -- 판매상품 판매코드 채번 
  *****************************************************************************/
  FUNCTION f_sRTSD0020Seq RETURN VARCHAR2 IS
    v_SaleCd_seq  varchar2(10) DEFAULT 0;

    
    BEGIN
    SELECT 'S'||LPAD(SEQ_RTSD0020SALE_CD.NEXTVAL, 9, 0)
      INTO v_SaleCd_seq                  
      FROM DUAL
    ;

    RETURN v_SaleCd_seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRTSD0020Seq;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0020 (
              SALE_CD,
              SALE_NM,
              SALE_STR_DAY,
              SALE_END_DAY,
              CHAN_CD,
              HSHOP_GB,
              DC_RATE,
              DC_AMT,
              PRDT_GRP,
              PKG_DC_YN,
              PRE_DC_YN,
              FPAY_YN,
              REGI_CAL_GB,
              USE_YN,
              GRP_SALE_GB,
              PRDT_GRP_DTL,
              RERENTAL_DC_YN,
              CUST_TYPE,
              AGE_LIMIT,
              AGE,
              CONTENTS,
              REG_ID,
              REG_DT,
              CHG_ID,
              CHG_DT,
              HASH_TAG1,
              HASH_TAG2,
              HASH_TAG3,
              HASH_TAG4
            )
    VALUES  (
            v_Sale_Cd,
            v_Sale_Nm,
            v_Sale_Str_Day,
            v_Sale_End_Day,
            v_Chan_Cd,
            v_Hshop_Gb,
            v_Dc_Rate,
            v_Dc_Amt,
            v_Prdt_Grp,
            v_Pkg_Dc_Yn,
            v_Pre_Dc_Yn,
            v_Fpay_Yn,
            v_Regi_Cal_Gb,
            v_Use_Yn,
            v_Grp_Sale_Gb,
            v_Prdt_Grp_Dtl,
            v_Rerental_Dc_Yn,
            v_Cust_Type,
            v_Age_Limit,
            v_Age,
            v_Contents,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_hashTag1,
            v_hashTag2,
            v_hashTag3,
            v_hashTag4
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0020;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0020
    SET    SALE_CD          = v_Sale_Cd,
           SALE_NM          = v_Sale_Nm,
           SALE_STR_DAY     = v_Sale_Str_Day,
           SALE_END_DAY     = v_Sale_End_Day,
           CHAN_CD          = v_Chan_Cd,
           HSHOP_GB         = v_Hshop_Gb,
           DC_RATE          = v_Dc_Rate,
           DC_AMT           = v_Dc_Amt,
           PRDT_GRP         = v_Prdt_Grp,
           PKG_DC_YN        = v_Pkg_Dc_Yn,
           PRE_DC_YN        = v_Pre_Dc_Yn,
           FPAY_YN          = v_Fpay_Yn,
           REGI_CAL_GB      = v_Regi_Cal_Gb,
           USE_YN           = v_Use_Yn,
           GRP_SALE_GB      = v_Grp_Sale_Gb,
           PRDT_GRP_DTL     = v_Prdt_Grp_Dtl,
           RERENTAL_DC_YN   = v_Rerental_Dc_Yn,
           CUST_TYPE        = v_Cust_Type,
           AGE_LIMIT        = v_Age_Limit,
           AGE              = v_Age,
           CONTENTS         = v_Contents,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE,
           HASH_TAG1        = v_hashTag1,
           HASH_TAG2        = v_hashTag2,
           HASH_TAG3        = v_hashTag3,
           HASH_TAG4        = v_hashTag4
    WHERE  SALE_CD          = v_Sale_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0020;


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
    v_Prdt_Grp          IN RTSD0020.PRDT_GRP%TYPE,        /* 상품군코드(판매유형 Lv1)        */
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
    ) IS

    e_Error EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN
        IF 0 != f_InsertRtsd0020(v_Sale_Cd, v_Sale_Nm, v_Sale_Str_Day, v_Sale_End_Day, 
                                 v_Chan_Cd, v_Hshop_Gb, v_Dc_Rate, v_Dc_Amt,
                                 v_Prdt_Grp, v_Pkg_Dc_Yn, v_Pre_Dc_Yn, v_Fpay_Yn,
                                 v_Regi_Cal_Gb, v_Use_Yn, v_Grp_Sale_Gb, v_Prdt_Grp_Dtl, 
                                 v_Rerental_Dc_Yn, v_Cust_Type, v_Age_Limit, v_Age, v_Contents, v_Reg_Id, 
                                 v_hashTag1, v_hashTag2, v_hashTag3, v_hashTag4, v_ErrorText) THEN
            v_Return_Message := '판매상품등록 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
        
    ELSIF v_Comm_Dvsn = 'U' THEN
        
        IF 0 != f_UpdateRtsd0020(v_Sale_Cd, v_Sale_Nm, v_Sale_Str_Day, v_Sale_End_Day, 
                                 v_Chan_Cd, v_Hshop_Gb, v_Dc_Rate, v_Dc_Amt,
                                 v_Prdt_Grp, v_Pkg_Dc_Yn, v_Pre_Dc_Yn, v_Fpay_Yn,
                                 v_Regi_Cal_Gb, v_Use_Yn, v_Grp_Sale_Gb, v_Prdt_Grp_Dtl, 
                                 v_Rerental_Dc_Yn, v_Cust_Type, v_Age_Limit, v_Age, v_Contents,v_Reg_Id, 
                                 v_hashTag1, v_hashTag2, v_hashTag3, v_hashTag4, v_ErrorText) THEN
            v_Return_Message := '판매상품등록 수정 실패!!!'||'-'||v_ErrorText;    
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;     
  
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0020.p_IUDRtsd0020(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0020.p_IUDRtsd0020(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0020; 
  

END Pkg_Rtsd0020;