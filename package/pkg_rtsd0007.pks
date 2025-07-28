CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0007 AS
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
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
   1.9      2025-05-27  yhchoi      [레드마인 1955] 만족도 조사 정보 추가
   2.0		2025-06-10  10244015    [20250610_01] 프리미엄퍼플점여부 추가 
*******************************************************************************/

  /*****************************************************************************
  -- 대리점 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0007Count(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE         /*대리점코드          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 대리점 정보 Select
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
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
    v_Fm_Yn          IN RTSD0007.FM_YN %TYPE,         /*1급정비 가능여부      */
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*온라인장착 가능여부   */
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*탈착기 코드           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*얼라인먼트 코드       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE      /*밸런스 코드           */ --[20180312_01]
  );
    
  /*****************************************************************************
  -- 대리점 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0007AgencyCode (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,     /*대리점명              */
    v_LOGIN_ID       IN VARCHAR2,                    /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                     /* 로그인 사용자 그룹 */
    );

  /*****************************************************************************
  -- 대리점 정보 Insert
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
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
    v_Rental_Group   IN RTSD0007.RENTAL_GROUP%TYPE,   /*렌탈지역 코드         */
    v_Rental_Office  IN RTSD0007.RENTAL_OFFICE%TYPE,  /*렌탈지역 코드         */
    v_Prpl_Yn        IN RTSD0007.PRPL_YN%TYPE,        /*퍼플 코드             */
    v_Apfd_End_Yn    IN RTSD0007.APFD_END_YN%TYPE,    /*충당금반환여부        */ --[20190731_01]
    v_Chain_Yn       IN RTSD0007.CHAIN_YN%TYPE,       /*직영도매거래선여부        */ --[20210809_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 대리점 정보 Update
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.4      2017-12-26  wjim        [20171226_01] 비고 추가
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.8      2019-07-31  wjim        [20190731_01] 충당금반환여부 추가
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
    v_Rental_Group   IN RTSD0007.RENTAL_GROUP%TYPE,   /*렌탈지역 코드         */
    v_Rental_Office  IN RTSD0007.RENTAL_OFFICE%TYPE,  /*렌탈지역 코드         */
    v_Prpl_Yn        IN RTSD0007.PRPL_YN%TYPE,        /*퍼플 코드             */
    v_Prem_Prpl_Yn   IN RTSD0007.PREM_PRPL_YN%TYPE,   /*프리미엄퍼플점 여부 */
    v_Apfd_End_Yn    IN RTSD0007.APFD_END_YN%TYPE,    /*충당금반환여부        */ --[20190731_01]
    v_Chain_Yn       IN RTSD0007.CHAIN_YN%TYPE,       /*직영도매거래선여부        */ --[20210809_01]
    v_Hp_Agency_Nm   IN RTSD0007.HP_AGENCY_NM%TYPE,   /*홈페이지 대리점명              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 대리점 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0007 (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 대리점 정보 관리(IUD)
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
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
    v_Rental_Group   IN RTSD0007.RENTAL_GROUP%TYPE,   /*렌탈지역 코드         */
    v_Rental_Office  IN RTSD0007.RENTAL_OFFICE%TYPE,  /*렌탈지역 코드         */
    v_Prpl_Yn        IN RTSD0007.PRPL_YN%TYPE,        /*퍼플 코드             */
    v_Prem_Prpl_Yn   IN RTSD0007.PREM_PRPL_YN%TYPE,   /*프리미엄퍼플점 여부 */
    v_Apfd_End_Yn    IN RTSD0007.APFD_END_YN%TYPE,    /*충당금반환여부        */ --[20190731_01]
    v_Chain_Yn       IN RTSD0007.CHAIN_YN%TYPE,       /*직영도매거래선여부        */ --[20210809_01]
    v_Hp_Agency_Nm   IN RTSD0007.HP_AGENCY_NM%TYPE,   /*홈페이지 대리점명              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 대리점 정보 조회 - 대리점코드로 대리점명 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0007AgencyNm(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE         /*대리점코드          */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- 대리점 정보 Select - 대리점 정보 조회 팝업
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
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
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*온라인장착 가능여부   */
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*탈착기 코드           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*얼라인먼트 코드       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE,      /*밸런스 코드           */ --[20180312_01]
    v_RENTAL_GROUP   IN VARCHAR2,                       /*렌탈지사*/
    v_RENTAL_OFFICE  IN VARCHAR2,                       /*렌탈지점*/
    v_LOGIN_ID       IN VARCHAR2,                      /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                       /* 로그인 사용자 그룹 */
    );

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 대리점 일 주문제한건수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0007SetOlimitCntCount(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE       /*장착 대리점           */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 대리점 계절구분 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0007GetSeasonGbn(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE       /*장착 대리점           */
    ) RETURN VARCHAR;

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
    );
    
  /*****************************************************************************
  -- 콜센터용 대리점 정보 Select
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------
   1.2.1    2016-11-28  wjim        [20161125_01] 콜센터용 대리점조회 기능 추가   
   1.5      2018-03-12  wjim        [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
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
    );    

  /*****************************************************************************
  -- 주문, 단체주문, 일시불 -  대리점 정보 조회 팝업
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
    ) ;
            
END Pkg_Rtsd0007;