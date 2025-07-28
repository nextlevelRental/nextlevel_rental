CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0007 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0007
   PURPOSE   대리점 정보 관리

   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------
   1.0      2015-06-29  jemcarry    1. Created this package body.
   1.1      2016-04-21  이영근        채널 대/중분류 항목 추가    
   1.2      2016-09-05  wjim        온라인장착 가능여부 항목 추가
   1.2.1    2016-11-28  wjim        [20161125_01] 콜센터용 대리점조회 기능 추가          
   1.3      2017-09-21  wjim        [20170921_02] 콜센터용 대리점 조회 정렬기준 추가
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.6      2018-11-22  wjim        [20181122_01] 방문점검구분 추가
   1.7      2019-02-21  wjim        [20190221_01] 대리점 정보 조회 팝업 항목 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
   1.9      2025-05-27  yhchoi      [레드마인 1955] 만족도 조사 정보 추가
   2.0		2025-06-10  10244015    [20250610_01] 프리미엄퍼플점여부 추가 
*******************************************************************************/

  /*****************************************************************************
  -- 대리점 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0007Count(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE         /*대리점코드          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0007
    WHERE   AGENCY_CD = v_Agency_Cd;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0007Count;

  /*****************************************************************************
  -- 대리점 정보 Select
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0007 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*렌탈대리점 여부       */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Lm_Yn          IN RTSD0007.LM_YN%TYPE,          /*경정비 가능여부       */
    v_Fm_Yn          IN RTSD0007.FM_YN%TYPE,          /*1급정비 가능여부      */
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*온라인장착 가능여부   */
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*탈착기 코드           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*얼라인먼트 코드       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE      /*밸런스 코드           */ --[20180312_01]
    ) IS

  BEGIN


    OPEN Ref_Cursor FOR
    SELECT  A.AGENCY_CD,                 /*대리점코드          */
            A.AGENCY_NM,                 /*대리점명            */
            A.SALES_GROUP,               /*지사코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.SALES_GROUP) SALES_GROUP_NM,   /*지사명         */
            A.SALES_OFFICE,              /*지점코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) SALES_OFFICE_NM, /*지점명         */
            A.POS_CD,                    /*우편번호            */
            A.CITY,                      /*주소                */
            A.STREET,                    /*상세주소            */
            A.SIDO_CD,                   /*시,도 코드          */
            A.SIGUN_CD,                  /*시,군,구 코드       */
            A.SER_NO,                    /*우편일련번호        */
            A.TEL_NO,                    /*전화번호            */
            A.MOB_NO,                    /*핸드폰번호          */
            A.FAX_NO,                    /*FAX번호             */
            A.TAX_NO,                    /*사업자번호          */
            A.REP_NM,                    /*대표명              */
            A.BUSI_TYPE,                 /*업종                */
            A.BUSI_COND,                 /*업태                */
            A.RENTAL_YN,                 /*렌탈대리점 여부     */
            A.STR_DAY,                   /*렌탈대리점 시작일   */
            A.END_DAY,                   /*렌탈대리점 종료일   */
            A.POS_X,                     /*X좌표               */
            A.POS_Y,                     /*Y좌표               */
            A.SEASON_GBN,                /*계절구분            */
            A.LM_YN,                     /*경정비 가능여부     */
            A.FM_YN,                     /*1급정비 가능여부    */
            A.CW_YN,                     /*세차 가능여부       */
            A.CH_YN,                     /*추천장착점 여부     */
            A.OLIMIT_CNT,                /*대리점일주문제한건수*/
            A.LIFNR,                     /*벤더코드            */
            A.TAX_RQCD,                  /*세금계산서 발행방법 */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                  /*등록자명       */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                  /*변경자명       */
            A.CHG_DT,                    /*변경일              */
            A.OP_YN,                     /*온라인장착 가능여부 */     
            A.MEMO,                                                             /*비고                */ --[20171226_01]
            A.DESORPT_CD,                                                       /*탈착기 코드         */ --[20180312_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S100', A.DESORPT_CD) DESORPT_NM,  /*탈착기명            */ --[20180312_01]
            A.ALIGN_CD,                                                         /*얼라인먼트 코드     */ --[20180312_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S101', A.ALIGN_CD  ) ALIGN_NM,    /*얼라인먼트명        */ --[20180312_01]
            A.BALANCE_CD,                                                       /*밸런스 코드         */ --[20180312_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S102', A.BALANCE_CD) BALANCE_NM,  /*밸런스명            */ --[20180312_01]
            NVL(TRIM(A.APFD_END_YN),'N') AS APFD_END_YN                         /*충당금반환여부      */ --[20190731_01]
    FROM    RTSD0007 A
    WHERE   A.AGENCY_NM LIKE '%'||v_Agency_Nm||'%'
    AND     A.SALES_GROUP  = DECODE(v_Sales_Group  , NULL, A.SALES_GROUP    , v_Sales_Group)
    AND     A.SALES_OFFICE = DECODE(v_Sales_Office , NULL, A.SALES_OFFICE   , v_Sales_Office)
    AND     A.RENTAL_YN    = DECODE(v_Rental_Yn    , NULL, A.RENTAL_YN      , v_Rental_Yn)
    AND     A.LM_YN        = DECODE(v_Lm_Yn        , NULL, A.LM_YN          , v_Lm_Yn)
    AND     A.FM_YN        = DECODE(v_Fm_Yn        , NULL, A.FM_YN          , v_Fm_Yn)
    AND     NVL(A.OP_YN, 'N') = DECODE(v_Op_Yn     , NULL, NVL(A.OP_YN, 'N'), v_Op_Yn) --온라인장착 가능여부 : 값이 없는 경우 '불가'로 기본판단
    AND     (v_Sido_Cd    IS NULL OR A.SIDO_CD    = v_Sido_Cd   )
    AND     (v_Sigun_Cd   IS NULL OR A.SIGUN_CD   = v_Sigun_Cd  )
    AND     (v_Desorpt_Cd IS NULL OR A.DESORPT_CD = v_Desorpt_Cd)
    AND     (v_Align_Cd   IS NULL OR A.ALIGN_CD   = v_Align_Cd  )
    AND     (v_Balance_Cd IS NULL OR A.BALANCE_CD = v_Balance_Cd)
    AND     A.USE_YN = 'Y';
    
  END p_sRtsd0007;


  /*****************************************************************************
  -- 대리점 정보 Select

   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------  
   1.1      2016-04-18  이영근      채널 대분류,중분류 코드 추가 
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0007AgencyCode (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,     /*대리점코드              */
    v_LOGIN_ID       IN VARCHAR2,                    /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                     /* 로그인 사용자 그룹 */
    ) IS

  BEGIN


    OPEN Ref_Cursor FOR
    SELECT A.*,
       B.RENTAL_GROUP,
       B.RENTAL_OFFICE,
       Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
       Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM ,/*렌탈지점           */
       C.RNT_MST_ID,                                                                 /*담당영업사원 ID           */
       C.RNT_MST_NM,                                                                 /*담당영업사원 이름           */
       C.RNT_MST_MOB                                                                 /*담당영업사원 휴대폰번호           */
      FROM (
    SELECT  A.AGENCY_CD,                                                        /*대리점코드          */
            A.AGENCY_NM,                                                        /*대리점명            */
            A.SALES_GROUP,                                                      /*지사코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.SALES_GROUP) SALES_GROUP_NM,   /*지사명        */
            A.SALES_OFFICE,                                                     /*지점코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) SALES_OFFICE_NM, /*지점명        */
            A.POS_CD,                                                           /*우편번호            */
            A.CITY,                                                             /*주소                */
            A.STREET,                                                           /*상세주소            */
            A.SIDO_CD,                                                          /*시,도 코드          */
            A.SIGUN_CD,                                                         /*시,군,구 코드       */
            A.SER_NO,                                                           /*우편일련번호        */
            A.TEL_NO,                                                           /*전화번호            */
            A.MOB_NO,                                                           /*핸드폰번호          */
            A.FAX_NO,                                                           /*FAX번호             */
            A.TAX_NO,                                                           /*사업자번호          */
            A.REP_NM,                                                           /*대표명              */
            A.BUSI_TYPE,                                                        /*업종                */
            A.BUSI_COND,                                                        /*업태                */
            A.RENTAL_YN,                                                        /*렌탈대리점 여부     */
            A.STR_DAY,                                                          /*렌탈대리점 시작일   */
            A.END_DAY,                                                          /*렌탈대리점 종료일   */
            A.POS_X,                                                            /*X좌표               */
            A.POS_Y,                                                            /*Y좌표               */
            A.TAX_RQCD,                                                         /*세금계산서 발행방법 */
            A.USE_YN,                                                           /*사용여부            */
            A.SEASON_GBN,                                                       /*계절구분            */
            A.LM_YN,                                                            /* 경정비 가능여부    */
            A.FM_YN,                                                            /*1급정비 가능여부    */
            A.CW_YN,                                                            /*세차 가능여부       */
            A.CH_YN,                                                            /*추천장착점 여부     */
            A.OLIMIT_CNT,                                                       /*대리점일주문제한건수*/
            A.LIFNR,                                                            /*벤더코드            */
            A.REG_ID,                                                           /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                    /*등록자명            */
            A.REG_DT,                                                           /*등록일              */
            A.CHG_ID,                                                           /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                    /*변경자명            */
            A.CHG_DT,                                                           /*변경일              */
            A.CHAN_LCLS_CD,                                                     /*채널 대분류         */
            A.CHAN_MCLS_CD,                                                     /*채널 중분류         */
            A.OP_YN,                                                            /*온라인장착 가능여부 */
            A.MEMO,                                                             /*비고                */ --[20171226_01]
            A.DESORPT_CD,                                                       /*탈착기 코드         */ --[20180312_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S100', A.DESORPT_CD) DESORPT_NM,  /*탈착기명            */ --[20180312_01]
            A.ALIGN_CD,                                                         /*얼라인먼트 코드     */ --[20180312_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S101', A.ALIGN_CD) ALIGN_NM,      /*얼라인먼트명        */ --[20180312_01]
            A.BALANCE_CD,                                                       /*밸런스 코드         */ --[20180312_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S102', A.BALANCE_CD) BALANCE_NM,  /*밸런스명            */ --[20180312_01]
            A.PRPL_YN,															 /*퍼플점 여부*/ 
            A.PREM_PRPL_YN,														 /*프리미엄 퍼플점 여부*/ 
            NVL(TRIM(A.APFD_END_YN),'N') AS APFD_END_YN,                         /*충당금반환여부      */ --[20190731_01]
            CHAIN_YN,                                                            /*직영도매 거래선 여부*/ --[20210806_01]
            NVL(TRIM(A.EGOL_NCHRG_CHK_YN),'N') AS EGOL_NCHRG_CHK_YN,			 /*엔진 오일 무료 점검*/ --[20241231]
            NVL(TRIM(A.BKPD_NCHRG_CHK_YN),'N') AS BKPD_NCHRG_CHK_YN,			 /*브레이크 패드 무료 점검*/ --[20241231]
            NVL(TRIM(A.WASHER_NCHRG_PAY_YN),'N') AS WASHER_NCHRG_PAY_YN,		 /*워셔액 무료 지급*/ --[20241231]
            NVL(A.HP_AGENCY_NM, REPLACE(A.AGENCY_NM,'(RC)','')) AS HP_AGENCY_NM						 /* 홈페이지 대리점명 */
    FROM    RTSD0007 A
    WHERE   A.AGENCY_CD =  v_Agency_Cd
           ) A
           LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
        LEFT OUTER JOIN (
         SELECT A.RNT_MST_ID,
                A.RNT_MST_NM,
                A.MOB_NO AS RNT_MST_MOB,
                B.AGENCY_CD
          FROM RTCM0111 A,
               RTCM0112 B
          WHERE A.RNT_MST_ID = B.RNT_MST_ID
        ) C ON
           A.AGENCY_CD = C.AGENCY_CD
    ;

  END p_sRtsd0007AgencyCode;

  /*****************************************************************************
  -- 대리점 정보 Insert
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------  
   1.1      2016-04-18  이영근      채널 대분류,중분류 코드 추가 
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
                                    - 충당금반환여부가 '예'인 경우 렌탈가능여부, 사용여부 미사용 처리
  *****************************************************************************/
  FUNCTION f_InsertRtsd0007 (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTSD0007.CITY%TYPE,           /*주소                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*상세주소              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*우편일련번호          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX번호               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*사업자번호            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*대표명                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*업태                  */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*렌탈대리점 여부       */
    v_Str_Day        IN RTSD0007.STR_DAY%TYPE,        /*렌탈대리점 시작일     */
    v_End_Day        IN RTSD0007.END_DAY%TYPE,        /*렌탈대리점 종료일     */
    v_Pos_X          IN RTSD0007.POS_X%TYPE,          /*X좌표                 */
    v_Pos_Y          IN RTSD0007.POS_Y%TYPE,          /*Y좌표                 */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*계절구분              */
    v_Lm_Yn          IN RTSD0007.LM_YN %TYPE,         /*경정비 가능여부       */
    v_Fm_Yn          IN RTSD0007.FM_YN %TYPE,         /*1급정비 가능여부      */
    v_Cw_Yn          IN RTSD0007.CW_YN %TYPE,         /*세차 가능여부         */
    v_Ch_Yn          IN RTSD0007.CH_YN %TYPE,         /*추천장착점 여부       */
    v_Olimit_Cnt     IN RTSD0007.OLIMIT_CNT%TYPE,     /*대리점 일 주문제한건수*/
    v_Lifnr          IN RTSD0007.LIFNR%TYPE,          /*벤더코드              */
    v_Tax_Rqcd       IN RTSD0007.TAX_RQCD%TYPE,       /*세금계산서 발행방법   */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTSD0007.CHAN_LCLS_CD%TYPE,   /*채널 대분류           */
    v_chan_Mcls_Cd   IN RTSD0007.CHAN_MCLS_CD%TYPE,   /*채널 중분류           */     
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*온라인장착 가능여부   */
    v_Memo           IN RTSD0007.MEMO%TYPE,           /*비고                  */ --[20171226_01]
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*탈착기 코드           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*얼라인먼트 코드       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE,     /*밸런스 코드           */ --[20180312_01]
    v_Egol_Nchrg_Chk_Yn    IN RTSD0007.EGOL_NCHRG_CHK_YN%TYPE,    /*엔진오일 무료 점검 */
    v_Bkpd_Nchrg_Chk_Yn    IN RTSD0007.BKPD_NCHRG_CHK_YN%TYPE,    /*브레이크 패드 무료 점검 */
    v_Washer_Nchrg_Pay_Yn  IN RTSD0007.WASHER_NCHRG_PAY_YN%TYPE,    /*워셔액 무료 지급 */
    v_Rental_Group   IN RTSD0007.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTSD0007.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */
    v_Prpl_Yn        IN RTSD0007.PRPL_YN%TYPE,    /*퍼플 코드 */
    v_Apfd_End_Yn    IN RTSD0007.APFD_END_YN%TYPE,    /*충당금반환여부        */ --[20190731_01]
    v_Chain_Yn       IN RTSD0007.CHAIN_YN%TYPE,       /*직영도매거래선여부        */ --[20210809_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0007 (
            AGENCY_CD,
            AGENCY_NM,
            SALES_GROUP,
            SALES_OFFICE,
            POS_CD,
            CITY,
            STREET,
            SIDO_CD,
            SIGUN_CD,
            SER_NO,
            TEL_NO,
            MOB_NO,
            FAX_NO,
            TAX_NO,
            REP_NM,
            BUSI_TYPE,
            BUSI_COND,
            RENTAL_YN,
            STR_DAY,
            END_DAY,
            POS_X,
            POS_Y,
            SEASON_GBN,
            LM_YN ,
            FM_YN ,
            CW_YN ,
            CH_YN ,
            OLIMIT_CNT,
            LIFNR,
            TAX_RQCD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            CHAN_LCLS_CD,
            CHAN_MCLS_CD,
            OP_YN,
            MEMO,
            DESORPT_CD,
            ALIGN_CD,
            BALANCE_CD,
            EGOL_NCHRG_CHK_YN,
		    BKPD_NCHRG_CHK_YN,
		    WASHER_NCHRG_PAY_YN,
            RENTAL_GROUP,
            RENTAL_OFFICE,
            PRPL_YN,
            APFD_END_YN,
            CHAIN_YN
            )
    VALUES  (
            TO_NUMBER(v_Agency_Cd),
            v_Agency_Nm,
            v_Sales_Group,
            v_Sales_Office,
            v_Pos_Cd,
            v_City,
            v_Street,
            v_Sido_Cd,
            v_Sigun_Cd,
            v_Ser_No,
            v_Tel_No,
            v_Mob_No,
            v_Fax_No,
            v_Tax_No,
            v_Rep_Nm,
            v_Busi_Type,
            v_Busi_Cond,
            DECODE(NVL(TRIM(v_Apfd_End_Yn),'N'),'Y','N',v_Rental_Yn), --[20190731_01]
            v_Str_Day,
            v_End_Day,
            v_Pos_X,
            v_Pos_Y,
            v_Season_Gbn,
            v_Lm_Yn     ,
            v_Fm_Yn     ,
            v_Cw_Yn     ,
            v_Ch_Yn     ,
            v_Olimit_Cnt,
            v_Lifnr,
            v_Tax_Rqcd,
            DECODE(NVL(TRIM(v_Apfd_End_Yn),'N'),'Y','N',v_Use_Yn),    --[20190731_01]
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_chan_Lcls_Cd,
            v_chan_Mcls_Cd,
            v_Op_Yn,
            v_Memo,
            v_Desorpt_Cd,
            v_Align_Cd,
            v_Balance_Cd,
            v_Egol_Nchrg_Chk_Yn,
            v_Bkpd_Nchrg_Chk_Yn,
            v_Washer_Nchrg_Pay_Yn,
            v_Rental_Group,
            v_Rental_Office,
            v_Prpl_Yn,
            NVL(TRIM(v_Apfd_End_Yn),'N'),
            v_Chain_Yn
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0007;

  /*****************************************************************************
  -- 대리점 정보 Update
 
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------  
   1.1      2016-04-18  이영근      채널 대분류,중분류 코드 추가 
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
                                    - 충당금반환여부가 '예'인 경우 렌탈가능여부, 사용여부 미사용 처리
   2.0		2025-06-10  10244015	[20250610_01] 프리미엄퍼플점여부 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0007 (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTSD0007.CITY%TYPE,           /*주소                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*상세주소              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*우편일련번호          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX번호               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*사업자번호            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*대표명                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*업태                  */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*렌탈대리점 여부       */
    v_Str_Day        IN RTSD0007.STR_DAY%TYPE,        /*렌탈대리점 시작일     */
    v_End_Day        IN RTSD0007.END_DAY%TYPE,        /*렌탈대리점 종료일     */
    v_Pos_X          IN RTSD0007.POS_X%TYPE,          /*X좌표                 */
    v_Pos_Y          IN RTSD0007.POS_Y%TYPE,          /*Y좌표                 */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*계절구분              */
    v_Lm_Yn          IN RTSD0007.LM_YN %TYPE,         /*경정비 가능여부       */
    v_Fm_Yn          IN RTSD0007.FM_YN %TYPE,         /*1급정비 가능여부      */
    v_Cw_Yn          IN RTSD0007.CW_YN %TYPE,         /*세차 가능여부         */
    v_Ch_Yn          IN RTSD0007.CH_YN %TYPE,         /*추천장착점 여부       */
    v_Olimit_Cnt     IN RTSD0007.OLIMIT_CNT%TYPE,     /*대리점 일 주문제한건수*/
    v_Lifnr          IN RTSD0007.LIFNR%TYPE,          /*벤더코드              */
    v_Tax_Rqcd       IN RTSD0007.TAX_RQCD%TYPE,       /*세금계산서 발행방법   */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTSD0007.CHAN_LCLS_CD%TYPE,   /*채널 대분류           */
    v_chan_Mcls_Cd   IN RTSD0007.CHAN_MCLS_CD%TYPE,   /*채널 중분류           */  
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*온라인장착 가능여부   */  
    v_Memo           IN RTSD0007.MEMO%TYPE,           /*비고                  */ --[20171226_01]
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*탈착기 코드           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*얼라인먼트 코드       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE,     /*밸런스 코드           */ --[20180312_01]
    v_Egol_Nchrg_Chk_Yn    IN RTSD0007.EGOL_NCHRG_CHK_YN%TYPE,    /*엔진오일 무료 점검 */
    v_Bkpd_Nchrg_Chk_Yn    IN RTSD0007.BKPD_NCHRG_CHK_YN%TYPE,    /*브레이크 패드 무료 점검 */
    v_Washer_Nchrg_Pay_Yn  IN RTSD0007.WASHER_NCHRG_PAY_YN%TYPE,    /*워셔액 무료 지급 */
    v_Rental_Group   IN RTSD0007.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTSD0007.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */
    v_Prpl_Yn        IN RTSD0007.PRPL_YN%TYPE,    	  /*퍼플 코드 */
    v_Prem_Prpl_Yn   IN RTSD0007.PREM_PRPL_YN%TYPE,   /*프리미엄퍼플점 여부 */	--[20250610_01]
    v_Apfd_End_Yn    IN RTSD0007.APFD_END_YN%TYPE,    /*충당금반환여부        */ --[20190731_01]
    v_Chain_Yn       IN RTSD0007.CHAIN_YN%TYPE,       /*직영도매거래선여부        */ --[20210809_01]
    v_Hp_Agency_Nm   IN RTSD0007.HP_AGENCY_NM%TYPE,   /*홈페이지 대리점명              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0007
    SET    AGENCY_NM     = v_Agency_Nm,
           SALES_GROUP   = v_Sales_Group,
           SALES_OFFICE  = v_Sales_Office,
           POS_CD        = v_Pos_Cd,
           CITY          = v_City,
           STREET        = v_Street,
           SIDO_CD       = v_Sido_Cd,
           SIGUN_CD      = v_Sigun_Cd,
           SER_NO        = v_Ser_No,
           TEL_NO        = v_Tel_No,
           MOB_NO        = v_Mob_No,
           FAX_NO        = v_Fax_No,
           TAX_NO        = v_Tax_No,
           REP_NM        = v_Rep_Nm,
           BUSI_TYPE     = v_Busi_Type,
           BUSI_COND     = v_Busi_Cond,
           RENTAL_YN     = DECODE(NVL(TRIM(v_Apfd_End_Yn),'N'),'Y','N',v_Rental_Yn), --[20190731_01]
           STR_DAY       = v_Str_Day,
           END_DAY       = v_End_Day,
           POS_X         = v_Pos_X,
           POS_Y         = v_Pos_Y,
           SEASON_GBN    = v_Season_Gbn,
           LM_YN         = v_Lm_Yn     ,
           FM_YN         = v_Fm_Yn     ,
           CW_YN         = v_Cw_Yn     ,
           CH_YN         = v_Ch_Yn     ,
           OLIMIT_CNT    = v_Olimit_Cnt,
           LIFNR         = v_Lifnr,
           TAX_RQCD      = v_Tax_Rqcd,
           USE_YN        = DECODE(NVL(TRIM(v_Apfd_End_Yn),'N'),'Y','N',v_Use_Yn),    --[20190731_01]
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE,
           CHAN_LCLS_CD  = v_chan_Lcls_Cd,
           CHAN_MCLS_CD  = v_chan_Mcls_Cd,
           OP_YN         = v_Op_Yn,
           MEMO          = v_Memo,
           DESORPT_CD    = v_Desorpt_Cd,
           ALIGN_CD      = v_Align_Cd,
           BALANCE_CD    = v_Balance_Cd,
           EGOL_NCHRG_CHK_YN = v_Egol_Nchrg_Chk_Yn,
		   BKPD_NCHRG_CHK_YN = v_Bkpd_Nchrg_Chk_Yn,
		   WASHER_NCHRG_PAY_YN = v_Washer_Nchrg_Pay_Yn,
           RENTAL_GROUP  = v_Rental_Group,
           RENTAL_OFFICE = v_Rental_Office,
           PRPL_YN       = v_Prpl_Yn,
           PREM_PRPL_YN  = v_Prem_Prpl_Yn,
           APFD_END_YN   = NVL(TRIM(v_Apfd_End_Yn),'N'),
           CHAIN_YN      = v_Chain_Yn,
           HP_AGENCY_NM  = v_Hp_Agency_Nm
    WHERE  AGENCY_CD     = v_Agency_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0007;

  /*****************************************************************************
  -- 대리점 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0007 (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0007
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  AGENCY_CD = v_Agency_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0007;

  /*****************************************************************************
  -- 대리점 정보 관리(IUD)
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------  
   1.1      2016-04-18  이영근     채널 대분류,중분류 코드 추가 
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
   2.0		2025-06-10  10244015	[20250610_01] 프리미엄퍼플점여부 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0007 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTSD0007.CITY%TYPE,           /*주소                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*상세주소              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*우편일련번호          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX번호               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*사업자번호            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*대표명                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*업태                  */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*렌탈대리점 여부       */
    v_Str_Day        IN RTSD0007.STR_DAY%TYPE,        /*렌탈대리점 시작일     */
    v_End_Day        IN RTSD0007.END_DAY%TYPE,        /*렌탈대리점 종료일     */
    v_Pos_X          IN RTSD0007.POS_X%TYPE,          /*X좌표                 */
    v_Pos_Y          IN RTSD0007.POS_Y%TYPE,          /*Y좌표                 */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*계절구분              */
    v_Lm_Yn          IN RTSD0007.LM_YN %TYPE,         /*경정비 가능여부       */
    v_Fm_Yn          IN RTSD0007.FM_YN %TYPE,         /*1급정비 가능여부      */
    v_Cw_Yn          IN RTSD0007.CW_YN %TYPE,         /*세차 가능여부         */
    v_Ch_Yn          IN RTSD0007.CH_YN %TYPE,         /*추천장착점 여부       */
    v_Olimit_Cnt     IN RTSD0007.OLIMIT_CNT%TYPE,     /*대리점 일 주문제한건수*/
    v_Lifnr          IN RTSD0007.LIFNR%TYPE,          /*벤더코드              */
    v_Tax_Rqcd       IN RTSD0007.TAX_RQCD%TYPE,       /*세금계산서 발행방법   */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTSD0007.CHAN_LCLS_CD%TYPE,   /*채널 대분류           */
    v_chan_Mcls_Cd   IN RTSD0007.CHAN_MCLS_CD%TYPE,   /*채널 중분류           */
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*온라인장착 가능여부   */
    v_Memo           IN RTSD0007.MEMO%TYPE,           /*비고                  */ --[20171226_01]
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*탈착기 코드           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*얼라인먼트 코드       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE,     /*밸런스 코드           */ --[20180312_01]
    v_Egol_Nchrg_Chk_Yn    IN RTSD0007.EGOL_NCHRG_CHK_YN%TYPE,    /*엔진오일 무료 점검 */
    v_Bkpd_Nchrg_Chk_Yn    IN RTSD0007.BKPD_NCHRG_CHK_YN%TYPE,    /*브레이크 패드 무료 점검 */
    v_Washer_Nchrg_Pay_Yn  IN RTSD0007.WASHER_NCHRG_PAY_YN%TYPE,    /*워셔액 무료 지급 */
    v_Rental_Group   IN RTSD0007.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTSD0007.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */
    v_Prpl_Yn        IN RTSD0007.PRPL_YN%TYPE,    	  /*퍼플 코드 */
    v_Prem_Prpl_Yn   IN RTSD0007.PREM_PRPL_YN%TYPE,   /*프리미엄퍼플점 여부 */	--[20250610_01]
    v_Apfd_End_Yn    IN RTSD0007.APFD_END_YN%TYPE,    /*충당금반환여부        */ --[20190731_01]
    v_Chain_Yn       IN RTSD0007.CHAIN_YN%TYPE,        /*직영도매거래선여부        */ --[20210809_01]
    v_Hp_Agency_Nm   IN RTSD0007.HP_AGENCY_NM%TYPE,    /*홈페이지 대리점명              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 대리점코드, 대리점명, 사용여부 ,등록자 ID
    IF TRIM(v_Agency_Cd) IS NULL THEN
        v_Return_Message := '대리점코드('||v_Agency_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Agency_Nm) IS NULL THEN
        v_Return_Message := '대리점명('||v_Agency_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0007Count(TO_NUMBER(v_Agency_Cd)) THEN

        IF 0 != f_InsertRtsd0007(v_Agency_Cd , v_Agency_Nm , v_Sales_Group , v_Sales_Office ,
                                 v_Pos_Cd , v_City , v_Street , v_Sido_Cd ,
                                 v_Sigun_Cd , v_Ser_No , v_Tel_No , v_Mob_No ,
                                 v_Fax_No , v_Tax_No , v_Rep_Nm , v_Busi_Type ,
                                 v_Busi_Cond , v_Rental_Yn , v_Str_Day , v_End_Day ,
                                 v_Pos_X, v_Pos_Y, v_Season_Gbn, v_Lm_Yn,
                                 v_Fm_Yn, v_Cw_Yn, v_Ch_Yn, v_Olimit_Cnt,
                                 v_Lifnr, v_Tax_Rqcd, v_Use_Yn , v_Reg_Id,
                                 v_chan_Lcls_Cd,  v_chan_Mcls_Cd, v_Op_Yn, v_Memo,
                                 v_Desorpt_Cd,  v_Align_Cd, v_Balance_Cd,
                                 v_Egol_Nchrg_Chk_Yn, v_Bkpd_Nchrg_Chk_Yn, v_Washer_Nchrg_Pay_Yn,
                                 v_Rental_Group, v_Rental_Office, v_Prpl_Yn, v_Apfd_End_Yn,
                                 v_Chain_Yn, v_ErrorText) THEN
            v_Return_Message := '대리점 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0007(v_Agency_Cd , v_Agency_Nm , v_Sales_Group , v_Sales_Office ,
                                     v_Pos_Cd , v_City , v_Street , v_Sido_Cd ,
                                     v_Sigun_Cd , v_Ser_No , v_Tel_No , v_Mob_No ,
                                     v_Fax_No , v_Tax_No , v_Rep_Nm , v_Busi_Type ,
                                     v_Busi_Cond , v_Rental_Yn , v_Str_Day , v_End_Day ,
                                     v_Pos_X, v_Pos_Y,v_Season_Gbn, v_Lm_Yn,
                                     v_Fm_Yn, v_Cw_Yn, v_Ch_Yn, v_Olimit_Cnt,
                                     v_Lifnr, v_Tax_Rqcd, v_Use_Yn , v_Reg_Id, 
                                     v_chan_Lcls_Cd,  v_chan_Mcls_Cd, v_Op_Yn, v_Memo,
                                     v_Desorpt_Cd,  v_Align_Cd, v_Balance_Cd,
                                     v_Egol_Nchrg_Chk_Yn, v_Bkpd_Nchrg_Chk_Yn, v_Washer_Nchrg_Pay_Yn,
                                     v_Rental_Group, v_Rental_Office, v_Prpl_Yn, v_Prem_Prpl_Yn, v_Apfd_End_Yn,
                                     v_Chain_Yn, v_Hp_Agency_Nm, v_ErrorText) THEN
                v_Return_Message := '대리점 정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0007(v_Agency_Cd , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '대리점 정보 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;

    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0119.f_InsertRtsd0119(v_Agency_Cd , v_ErrorText) THEN
        v_Return_Message := '대리점 정보 변경 이력 생성 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0007.p_IUDRtsd0007(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0007.p_IUDRtsd0007(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0007;



  /*****************************************************************************
  -- 대리점 정보 조회 - 대리점코드로 대리점명 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0007AgencyNm(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE         /*대리점코드          */
    ) RETURN VARCHAR IS
    v_Agency_Nm      RTSD0007.AGENCY_NM%TYPE; /*대리점명   */
  BEGIN

    SELECT  AGENCY_NM
    INTO    v_Agency_Nm
    FROM    RTSD0007
    WHERE   AGENCY_CD = v_Agency_Cd;

    RETURN  v_Agency_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtsd0007AgencyNm;


  /*****************************************************************************
  -- 대리점 정보 Select - 대리점 정보 조회 팝업
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------     
   1.1      2016-04-18  이영근     채널 대분류,중분류 코드 추가 
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.6      2018-11-22  wjim        [20181122_01] 방문점검구분 추가
   1.7      2019-02-21  wjim        [20190221_01] 조회항목 (퍼플점 여부) 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
   1.9      2025-05-27  yhchoi      [레드마인 1955] 만족도 조사 정보 추가 
  *****************************************************************************/
  PROCEDURE p_sRtsd0007Popup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*렌탈대리점 여부       */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Lm_Yn          IN RTSD0007.LM_YN%TYPE,          /*경정비 가능여부       */
    v_Fm_Yn          IN RTSD0007.FM_YN%TYPE,          /*1급정비 가능여부      */
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /* 온라인장착 가능여부  */
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*탈착기 코드           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*얼라인먼트 코드       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE,      /*밸런스 코드           */ --[20180312_01]
    v_RENTAL_GROUP   IN VARCHAR2,                       /*렌탈지사*/
    v_RENTAL_OFFICE  IN VARCHAR2,                       /*렌탈지점*/
    v_LOGIN_ID       IN VARCHAR2,                      /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                       /* 로그인 사용자 그룹 */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
SELECT *
  FROM (
    SELECT A.*,
           B.USER_ID,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM ,/*렌탈지점           */
           C.RNT_MST_ID,                                                                 /*렌탈마스터 ID           */
           C.RNT_MST_NM,                                                                 /*렌탈마스터 이름           */
           C.RNT_MST_MOB,                                                                 /*렌탈마스터 휴대폰번호           */
           D.TOT_EVAL_POINT,	/*만족도조사 총평점*/
		   D.STFY_POINT_CD1,	/*만족도조사 장착응대 평점*/
		   D.STFY_POINT_CD2,	/*만족도조사 렌탈혜택 평점*/
		   D.STFY_POINT_CD3		/*만족도조사 친절 평점*/
      FROM (
    SELECT  A.AGENCY_CD,                 /*대리점코드          */
            A.AGENCY_NM,                 /*대리점명            */
            A.SALES_GROUP AS SALES_GROUP,               /*지사코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.SALES_GROUP) SALES_GROUP_NM,   /*지사명         */
            A.SALES_OFFICE AS SALES_OFFICE,              /*지점코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.RENTAL_OFFICE) SALES_OFFICE_NM, /*지점명         */
            A.POS_CD,                    /*우편번호            */
            A.CITY,                      /*주소                */
            A.STREET,                    /*상세주소            */
            A.SIDO_CD,                   /*시,도 코드          */
            A.SIGUN_CD,                  /*시,군,구 코드       */
            A.SER_NO,                    /*우편일련번호        */
            A.TEL_NO,                    /*전화번호            */
            A.MOB_NO,                    /*핸드폰번호          */
            A.FAX_NO,                    /*FAX번호             */
            A.TAX_NO,                    /*사업자번호          */
            A.REP_NM,                    /*대표명              */
            A.BUSI_TYPE,                 /*업종                */
            A.BUSI_COND,                 /*업태                */
            A.RENTAL_YN,                 /*렌탈대리점 여부     */
            A.STR_DAY,                   /*렌탈대리점 시작일   */
            A.END_DAY,                   /*렌탈대리점 종료일   */
            A.POS_X,                     /*X좌표               */
            A.POS_Y,                     /*Y좌표               */
            A.LM_YN,                     /* 경정비 가능여부    */
            A.FM_YN,                     /*1급정비 가능여부    */
            A.LIFNR,                     /*벤더코드            */
            A.TAX_RQCD,                  /*세금계산서 발행방법 */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                  /*등록자명       */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                  /*변경자명       */
            A.CHG_DT,                    /*변경일              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S090', A.CHAN_LCLS_CD) AS CHAN_LCLS_NM,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S091', A.CHAN_MCLS_CD) AS CHAN_MCLS_NM,
            A.CHAN_LCLS_CD,
            A.CHAN_MCLS_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S079', A.TAX_RQCD)     AS TAX_RQCD_NM,            
            A.CW_YN,                     /*세차 가능여부       */
            A.CH_YN,                     /*추천장착점 여부     */      
            A.OP_YN,                     /*온라인장착가능여부  */      
            A.MEMO,                      /*비고                */               --[20171226_01]
            A.DESORPT_CD,                                                                   /*탈착기 코드     */ --[20171226_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S100', A.DESORPT_CD)   AS DESORPT_NM,         /*탈착기명        */ --[20171226_01]
            A.ALIGN_CD,                                                                     /*얼라인먼트 코드 */ --[20171226_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S101', A.ALIGN_CD)     AS ALIGN_NM,           /*얼라인먼트명    */ --[20171226_01]
            A.BALANCE_CD,                                                                   /*밸런스 코드     */ --[20171226_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S102', A.BALANCE_CD)   AS BALANCE_NM,          /*밸런스명        */ --[20171226_01]
           -- A.RENTAL_GROUP,
           -- (select RENTAL_GROUP_NM from rtsd0052 B where a.RENTAL_GROUP=b.RENTAL_GROUP) as RENTAL_GROUP_NM,
           -- A.RENTAL_OFFICE,
           -- (select RENTAL_OFFICE_NM from rtsd0053 C ,rtsd0052 B where a.RENTAL_OFFICE=c.RENTAL_OFFICE and B.RENTAL_GROUP=c.RENTAL_GROUP) as RENTAL_OFFICE_NM,
            A.VISIT_YN,
            A.PRPL_YN,
            NVL(TRIM(A.APFD_END_YN),'N'),                                        /*충당금반환여부      */ --[20190731_01]
            PKG_EXIF0003.f_sExif0003O2OAgency(A.AGENCY_CD) AS O2O_YN,                        /*O2O거점대리점구분*/ --[20191205_01]
            A.PREM_PRPL_YN	/*프리미엄 퍼플점 여부*/ 
    FROM    RTSD0007 A
    WHERE   A.AGENCY_NM LIKE '%'||v_Agency_Nm||'%'
    AND     (v_Sales_Group  IS NULL OR A.SALES_GROUP  = v_Sales_Group)
    AND     (v_Sales_Office IS NULL OR A.SALES_OFFICE = v_Sales_Office)
    AND     A.RENTAL_YN       = DECODE(v_Rental_Yn    , NULL, A.RENTAL_YN      , v_Rental_Yn)
    AND     A.LM_YN           = DECODE(v_Lm_Yn        , NULL, A.LM_YN          , v_Lm_Yn)
    AND     A.FM_YN           = DECODE(v_Fm_Yn        , NULL, A.FM_YN          , v_Fm_Yn)
    AND     NVL(A.OP_YN, 'N') = DECODE(v_Op_Yn        , NULL, NVL(A.OP_YN, 'N'), v_Op_Yn) --온라인장착 가능여부 : 값이 없는 경우 '불가'로 기본판단
    AND     (v_Sido_Cd    IS NULL OR A.SIDO_CD    = v_Sido_Cd )
    AND     (v_Sigun_Cd   IS NULL OR A.SIGUN_CD   = v_Sigun_Cd)    
    AND     (v_Desorpt_Cd IS NULL OR A.DESORPT_CD = v_Desorpt_Cd)
    AND     (v_Align_Cd   IS NULL OR A.ALIGN_CD   = v_Align_Cd)
    AND     (v_Balance_Cd IS NULL OR A.BALANCE_CD = v_Balance_Cd)
    ORDER BY A.CHAN_LCLS_CD, A.CHAN_MCLS_CD, A.AGENCY_CD
        ) A
        LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
        LEFT OUTER JOIN (
         SELECT A.RNT_MST_ID,
                A.RNT_MST_NM,
                A.MOB_NO AS RNT_MST_MOB,
                B.AGENCY_CD
          FROM RTCM0111 A,
               RTCM0112 B
          WHERE A.RNT_MST_ID = B.RNT_MST_ID
        ) C ON
           A.AGENCY_CD = C.AGENCY_CD
		LEFT OUTER JOIN (
			SELECT
				AGENCY_CD
				, ROUND(AVG(TOT_EVAL_POINT),1) AS TOT_EVAL_POINT
				, ROUND(AVG(STFY_POINT_CD1),1) AS STFY_POINT_CD1
				, ROUND(AVG(STFY_POINT_CD2),1) AS STFY_POINT_CD2
				, ROUND(AVG(STFY_POINT_CD3),1) AS STFY_POINT_CD3
			FROM RTCS0130
			WHERE 1=1
				AND DP_YN = 'Y'
				AND TO_CHAR(SUBT_DAY,'YYYYMM') BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-3),'YYYYMM') AND TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM')
			GROUP BY AGENCY_CD
		) D ON 
			A.AGENCY_CD = D.AGENCY_CD
  ) A
    WHERE 1=1
      AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
      AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
    ;
    
  END p_sRtsd0007Popup;


/*****************************************************************************
  -- 대리점 정보 Update - EAI Interface 대리점 정보 변경
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0007Interface (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTSD0007.CITY%TYPE,           /*주소                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*상세주소              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*우편일련번호          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX번호               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*사업자번호            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*대표명                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*업태                  */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*계절구분              */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0007
    SET    AGENCY_NM    = v_Agency_Nm,
           SALES_GROUP  = v_Sales_Group,
           SALES_OFFICE = v_Sales_Office,
           POS_CD       = v_Pos_Cd,
           CITY         = v_City,
           STREET       = v_Street,
           SIDO_CD      = v_Sido_Cd,
           SIGUN_CD     = v_Sigun_Cd,
           SER_NO       = v_Ser_No,
           TEL_NO       = v_Tel_No,
           MOB_NO       = v_Mob_No,
           FAX_NO       = v_Fax_No,
           TAX_NO       = v_Tax_No,
           REP_NM       = v_Rep_Nm,
           BUSI_TYPE    = v_Busi_Type,
           BUSI_COND    = v_Busi_Cond,
           SEASON_GBN   = v_Season_Gbn,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  AGENCY_CD    = v_Agency_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0007Interface;


  /*****************************************************************************
  -- 대리점 일 주문제한건수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0007SetOlimitCntCount(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE       /*장착 대리점           */
    ) RETURN NUMBER IS
    v_Olimit_Cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT A.OLIMIT_CNT
    INTO v_Olimit_Cnt
    FROM RTSD0007 A
    WHERE A.AGENCY_CD = v_Agency_Cd;

    RETURN v_Olimit_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0007SetOlimitCntCount;

  /*****************************************************************************
  -- 대리점 계절구분 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0007GetSeasonGbn(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE       /*장착 대리점           */
    ) RETURN VARCHAR IS
    v_Season_Gbn   RTSD0007.SEASON_GBN%TYPE;          /*계절구분   */
  BEGIN

    SELECT A.SEASON_GBN
    INTO v_Season_Gbn
    FROM RTSD0007 A
    WHERE A.AGENCY_CD = v_Agency_Cd;

    RETURN v_Season_Gbn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0007GetSeasonGbn;

  /*****************************************************************************
  -- 판매인정보VIEW List   
  *****************************************************************************/
  PROCEDURE p_sRtview02List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Lifnr          IN RTSD0007.LIFNR%TYPE,          /*벤더코드              */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
           B.USER_ID,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  A.AGENCY_CD   , /*판매인코드  */
            A.AGENCY_NM   , /*판매점명    */
            A.RENTAL_GROUP AS SALES_GROUP , /*지사코드    */
            A.RENTAL_OFFICE AS SALES_OFFICE, /*지점코드    */
            A.TEL_NO      , /*전화번호    */
            A.CHAN_CD     , /*체널구분    */
            A.LIFNR       , /*벤더코드    */
            A.TAX_RQCD      /*세금계산서 발행방법*/
    FROM    RTVIEW02 A
    WHERE   A.AGENCY_CD     LIKE v_Agency_Cd||'%'
    AND     A.AGENCY_NM     LIKE '%'||v_Agency_Nm||'%'
    AND     (v_Sales_Group  IS NULL OR A.RENTAL_GROUP   = v_Sales_Group )
    AND     (v_Sales_Office IS NULL OR A.RENTAL_OFFICE  = v_Sales_Office)
    AND     (v_Chan_Cd      IS NULL OR A.CHAN_CD       = v_Chan_Cd     )
    AND     (v_Lifnr        IS NULL OR A.LIFNR         = v_Lifnr       )
    AND     A.RENTAL_YN     = 'Y'
           ) A
           LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
     ) A
    WHERE 1=1
      AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
      AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
    ;

  END p_sRtview02List;

  /*****************************************************************************
  -- 콜센터용 대리점 정보 Select
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------
   1.2.1    2016-11-28  wjim        [20161125_01] 콜센터용 대리점조회 기능 추가
   1.3      2017-09-21  wjim        [20170921_02] 콜센터용 대리점 조회 정렬기준 추가
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   2.0		2025-06-12  10244015    [20250610_01] 프리미엄퍼플점여부, 만족도조사 총평점 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0007Call (
      Ref_Cursor       IN OUT SYS_REFCURSOR    
    , v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE        /*시,도 코드           */
    , v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE       /*시,군,구 코드        */
    , v_Chan_Mcls_Cd   IN RTSD0007.CHAN_MCLS_CD%TYPE   /*채널 중분류          */
    , v_Ch_Yn          IN RTSD0007.CH_YN %TYPE         /*추천장착점 여부      */
    , v_Lm_Yn          IN RTSD0007.LM_YN%TYPE          /*경정비 가능여부      */
    , v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE     /*계절구분             */   
    , v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE     /*탈착기 코드          */ --[20180312_01]
    , v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE       /*얼라인먼트 코드      */ --[20180312_01]
    , v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE     /*밸런스 코드          */ --[20180312_01] 
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A2.AGENCY_CD                              /* 장착점(대리점)코드 */
         ,  B2.SIDO_CD                                /* 광역시도코드       */
         ,  C2.CD_NM                AS SIDO_NM        /* 광역시도명         */
         ,  B2.SIGUN_CD                               /* 시군구코드         */
         ,  D2.CD_NM                AS SIGUN_NM       /* 시군구명           */
         ,  B2.AGENCY_NM                              /* 당착점명           */
         ,  B2.CITY||' '||B2.STREET AS ADDR           /* 주소               */
         ,  B2.SEASON_GBN                             /* 계절구분코드       */
         ,  E2.CD_NM                AS SEASON_GBN_NM  /* 계절구분명         */
         ,  B2.TEL_NO                                 /* 연락처             */
         ,  B2.CH_YN                                  /* 추천점 여부        */ 
         ,  B2.LM_YN                                  /* 경정비 여부        */
         ,  B2.CHAN_MCLS_CD                           /* 채널중분류코드     */
         ,  F2.CD_NM                AS CHAN_MCLS_NM   /* 채널중분류명       */
         ,  A2.CNT_PROC                               /* 렌탈계정=현재까지 장착건수(대리점 실적조회 화면과 일치) */
         ,  B2.MEMO                                   /* 비고               */  --[20171226_01]
         ,  B2.DESORPT_CD                             /* 탈착기 코드        */  --[20180312_01]
         ,  G2.CD_NM                AS DESORPT_NM     /* 탈착기명           */  --[20180312_01]
         ,  B2.ALIGN_CD                               /* 얼라인먼트 코드    */  --[20180312_01]
         ,  H2.CD_NM                AS ALIGN_NM       /* 얼라인먼트명       */  --[20180312_01]
         ,  B2.BALANCE_CD                             /* 밸런스 코드        */  --[20180312_01]
         ,  I2.CD_NM                AS BALANCE_NM     /* 밸런스명           */  --[20180312_01]
         ,  B2.PREM_PRPL_YN							  /* 프리미엄퍼플점 여부   */  --[20250610_01]
         ,  J2.TOT_EVAL_POINT						  /* 만족도조사 총평점    */  --[20250610_01]
      FROM  (
                SELECT  A1.AGENCY_CD
                     ,  COUNT(B1.ORD_NO) AS CNT_PROC
                  FROM  RTSD0007 A1
                     ,  RTSD0108 B1
                 WHERE  1=1
                   AND  A1.RENTAL_YN    = 'Y'
                   AND  A1.OP_YN        = 'Y'
                   AND  A1.AGENCY_CD    = B1.AGENCY_CD(+)
                   AND  A1.SALES_GROUP  = B1.SALES_GROUP(+)
                   AND  A1.SALES_OFFICE = B1.SALES_OFFICE(+)
                   AND  B1.PROC_DAY(+) <= TO_CHAR(SYSDATE,'YYYYMMDD')
                   AND  (v_Sido_Cd      IS NULL OR A1.SIDO_CD      = v_Sido_Cd     ) /* 광역시도        */
                   AND  (v_Sigun_Cd     IS NULL OR A1.SIGUN_CD     = v_Sigun_Cd    ) /* 시군구          */
                   AND  (v_Chan_Mcls_Cd IS NULL OR A1.CHAN_MCLS_CD = v_Chan_Mcls_Cd) /* 채널            */
                   AND  (v_Ch_Yn        IS NULL OR A1.CH_YN        = v_Ch_Yn       ) /* 추천점          */
                   AND  (v_Lm_Yn        IS NULL OR A1.LM_YN        = v_Lm_Yn       ) /* 경정비          */ 
                   AND  (v_Season_Gbn   IS NULL OR A1.SEASON_GBN   = v_Season_Gbn  ) /* 계절구분        */
                   AND  (v_Desorpt_Cd   IS NULL OR A1.DESORPT_CD   = v_Desorpt_Cd  ) /* 탈착기 코드     */ --[20180312_01]
                   AND  (v_Align_Cd     IS NULL OR A1.ALIGN_CD     = v_Align_Cd    ) /* 얼라인먼트 코드 */ --[20180312_01]
                   AND  (v_Balance_Cd   IS NULL OR A1.BALANCE_CD   = v_Balance_Cd  ) /* 밸런스 코드     */ --[20180312_01]
                 GROUP  BY A1.AGENCY_CD
            ) A2
         ,  RTSD0007 B2
         ,  RTCM0051 C2
         ,  RTCM0051 D2
         ,  RTCM0051 E2
         ,  RTCM0051 F2
         ,  RTCM0051 G2
         ,  RTCM0051 H2
         ,  RTCM0051 I2
         ,  (SELECT AGENCY_CD
				  , ROUND(AVG(TOT_EVAL_POINT),1) AS TOT_EVAL_POINT
				  , ROUND(AVG(STFY_POINT_CD1),1) AS STFY_POINT_CD1
				  , ROUND(AVG(STFY_POINT_CD2),1) AS STFY_POINT_CD2
				  , ROUND(AVG(STFY_POINT_CD3),1) AS STFY_POINT_CD3
			   FROM RTCS0130														/* 만족도조사	    */  --[20250610_01]
			  WHERE 1=1
				AND DP_YN = 'Y'
				AND TO_CHAR(SUBT_DAY,'YYYYMM') BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-3),'YYYYMM') AND TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM')
			  GROUP BY AGENCY_CD
		    ) J2
     WHERE  1=1
       AND  A2.AGENCY_CD    = B2.AGENCY_CD
       AND  B2.SIDO_CD      = C2.CD(+)
       AND  C2.CD_GRP_CD(+) = 'S016'  
       AND  B2.SIGUN_CD     = D2.CD(+)
       AND  D2.CD_GRP_CD(+) = 'S017'
       AND  B2.SEASON_GBN   = E2.CD(+)
       AND  E2.CD_GRP_CD(+) = 'S014'
       AND  B2.CHAN_MCLS_CD = F2.CD(+)
       AND  F2.CD_GRP_CD(+) = 'S091'
       AND  B2.DESORPT_CD   = G2.CD(+)
       AND  G2.CD_GRP_CD(+) = 'S100'
       AND  B2.ALIGN_CD     = H2.CD(+)
       AND  H2.CD_GRP_CD(+) = 'S101'
       AND  B2.BALANCE_CD   = I2.CD(+)
       AND  I2.CD_GRP_CD(+) = 'S102'
       AND  B2.AGENCY_CD    = J2.AGENCY_CD(+)
     ORDER  BY TRIM(B2.AGENCY_NM)  --[20170921_02]     
    ;

  END p_sRtsd0007Call;  


  /*****************************************************************************
  -- 주문, 단체주문, 일시불 -  대리점 정보 조회 팝업
  
  REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.9      2019-12-05  kstka        [20191205_01] o2o거점여부 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0007OrdPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Lm_Yn          IN RTSD0007.LM_YN%TYPE,          /*경정비 가능여부       */
    v_Fm_Yn          IN RTSD0007.FM_YN%TYPE,          /*1급정비 가능여부      */
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /* 온라인장착 가능여부  */
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*탈착기 코드           */ 
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*얼라인먼트 코드       */ 
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE      /*밸런스 코드           */ 
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.AGENCY_CD,                 /*대리점코드          */
            A.AGENCY_NM,                 /*대리점명            */
            A.SALES_GROUP,               /*지사코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.SALES_GROUP) SALES_GROUP_NM,   /*지사명         */
            A.SALES_OFFICE,              /*지점코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) SALES_OFFICE_NM, /*지점명         */
            A.POS_CD,                    /*우편번호            */
            A.CITY,                      /*주소                */
            A.STREET,                    /*상세주소            */
            A.SIDO_CD,                   /*시,도 코드          */
            A.SIGUN_CD,                  /*시,군,구 코드       */
            A.SER_NO,                    /*우편일련번호        */
            A.TEL_NO,                    /*전화번호            */
            A.MOB_NO,                    /*핸드폰번호          */
            A.FAX_NO,                    /*FAX번호             */
            A.TAX_NO,                    /*사업자번호          */
            A.REP_NM,                    /*대표명              */
            A.BUSI_TYPE,                 /*업종                */
            A.BUSI_COND,                 /*업태                */
            A.RENTAL_YN,                 /*렌탈대리점 여부     */
            A.STR_DAY,                   /*렌탈대리점 시작일   */
            A.END_DAY,                   /*렌탈대리점 종료일   */
            A.POS_X,                     /*X좌표               */
            A.POS_Y,                     /*Y좌표               */
            A.LM_YN,                     /* 경정비 가능여부    */
            A.FM_YN,                     /*1급정비 가능여부    */
            A.LIFNR,                     /*벤더코드            */
            A.TAX_RQCD,                  /*세금계산서 발행방법 */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                  /*등록자명       */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                  /*변경자명       */
            A.CHG_DT,                    /*변경일              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S090', A.CHAN_LCLS_CD) AS CHAN_LCLS_NM,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S091', A.CHAN_MCLS_CD) AS CHAN_MCLS_NM,
            A.CHAN_LCLS_CD,
            A.CHAN_MCLS_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S079', A.TAX_RQCD)     AS TAX_RQCD_NM,            
            A.CW_YN,                     /*세차 가능여부       */
            A.CH_YN,                     /*추천장착점 여부     */      
            A.OP_YN,                     /*온라인장착가능여부  */      
            A.MEMO,                      /*비고                */               --[20171226_01]
            A.DESORPT_CD,                                                                   /*탈착기 코드     */ --[20171226_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S100', A.DESORPT_CD)   AS DESORPT_NM,         /*탈착기명        */ --[20171226_01]
            A.ALIGN_CD,                                                                     /*얼라인먼트 코드 */ --[20171226_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S101', A.ALIGN_CD)     AS ALIGN_NM,           /*얼라인먼트명    */ --[20171226_01]
            A.BALANCE_CD,                                                                   /*밸런스 코드     */ --[20171226_01]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S102', A.BALANCE_CD)   AS BALANCE_NM,         /*밸런스명        */ --[20171226_01]
            A.VISIT_YN,                                                                     /*방문점검구분    */ --[20181122_01]
            PKG_EXIF0003.f_sExif0003O2OAgency(A.AGENCY_CD) AS O2O_YN                        /*O2O거점대리점구분*/ --[20191205_01] 
    FROM    RTSD0007 A
    WHERE   A.AGENCY_NM LIKE '%'||v_Agency_Nm||'%'
    AND     A.SALES_GROUP     = DECODE(v_Sales_Group  , NULL, A.SALES_GROUP    , v_Sales_Group)
    AND     A.SALES_OFFICE    = DECODE(v_Sales_Office , NULL, A.SALES_OFFICE   , v_Sales_Office)
    AND     A.LM_YN           = DECODE(v_Lm_Yn        , NULL, A.LM_YN          , v_Lm_Yn)
    AND     A.FM_YN           = DECODE(v_Fm_Yn        , NULL, A.FM_YN          , v_Fm_Yn)
    AND     (v_Sido_Cd    IS NULL OR A.SIDO_CD    = v_Sido_Cd )
    AND     (v_Sigun_Cd   IS NULL OR A.SIGUN_CD   = v_Sigun_Cd)    
    AND     (v_Desorpt_Cd IS NULL OR A.DESORPT_CD = v_Desorpt_Cd)
    AND     (v_Align_Cd   IS NULL OR A.ALIGN_CD   = v_Align_Cd)
    AND     (v_Balance_Cd IS NULL OR A.BALANCE_CD = v_Balance_Cd)
    AND     A.OP_YN = 'Y'
    ORDER BY A.CHAN_LCLS_CD, A.CHAN_MCLS_CD, A.AGENCY_CD;

  END p_sRtsd0007OrdPopup;


END Pkg_Rtsd0007;