CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0113 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0113
   PURPOSE   판매인정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가
   1.1.1      2016-12-06  wjim             [20161206_02] '콜센터(아웃바운드)' 사용자그룹 추가
*******************************************************************************/

  /*****************************************************************************
  -- 판매인정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0113Count(
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE         /*판매인번호          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0113
    WHERE   ORD_AGENT = v_Ord_Agent;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0113Count;

  /*****************************************************************************
  -- 판매인정보 Select
  -- 변경이력: 2016-04-21 이영근, 채널 대/중분류 항목 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0113 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*판매인명              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE       /*연락처                */    
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_AGENT,                 /*판매인번호          */
            A.ORG_AGNM,                  /*판매인명            */
            A.ORG_AGTEL,                 /*연락처              */
            A.CHAN_CD,                   /*채널구분            */
            A.LIFNR,                     /*벤더코드            */
            A.NUM,                       /*노출순서            */
            A.SALES_GROUP,               /*지사                */
            A.SALES_OFFICE,              /*지점                */
            A.TAX_RQCD,                  /*세금계산서 발행방법 */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */            
    FROM    RTSD0113 A
    WHERE   A.ORD_AGENT LIKE v_Ord_Agent||'%'
    AND     A.ORG_AGNM  LIKE v_Org_Agnm||'%'
    AND     A.ORG_AGTEL LIKE REPLACE(v_Org_Agtel,'-','')||'%'
    AND     A.USE_YN = 'Y';

  END p_sRtsd0113;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0113 (
            ORD_AGENT,
            ORG_AGNM,
            ORG_AGTEL,
            CHAN_CD,
            LIFNR,
            NUM,
            SALES_GROUP,
            SALES_OFFICE,
            TAX_RQCD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            CHAN_LCLS_CD,
            CHAN_MCLS_CD,
            RENTAL_GROUP,
            RENTAL_OFFICE
            )
    VALUES  (
            v_Ord_Agent,
            v_Org_Agnm,
            v_Org_Agtel,
            v_Chan_Cd,
            v_Lifnr,
            v_Num,
            v_Sales_Group,
            v_Sales_Office,
            v_Tax_Rqcd,
            v_Use_Yn,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_chan_Lcls_Cd,
            v_chan_Mcls_Cd,
            v_Rental_Group,
            v_Rental_Office
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0113;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0113
    SET    ORG_AGNM      = v_Org_Agnm,
           ORG_AGTEL     = v_Org_Agtel,
           CHAN_CD       = v_Chan_Cd,
           LIFNR         = v_Lifnr,
           NUM           = v_Num,
           SALES_GROUP   = v_Sales_Group,
           SALES_OFFICE  = v_Sales_Office,
           TAX_RQCD      = v_Tax_Rqcd,
           USE_YN        = v_Use_Yn,
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE,
           CHAN_LCLS_CD  = v_chan_Lcls_Cd,
           CHAN_MCLS_CD  = v_chan_Mcls_Cd,
           RENTAL_GROUP  = v_Rental_Group,
           RENTAL_OFFICE = v_Rental_Office
    WHERE  ORD_AGENT     = v_Ord_Agent;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0113;

  /*****************************************************************************
  -- 판매인정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0113
    SET    USE_YN    = 'Y',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ORD_AGENT = v_Ord_Agent;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0113;

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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 판매인번호, 판매인명,연락처, 사용여부, 등록자 ID
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '판매인번호('||v_Reg_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Org_Agnm) IS NULL THEN
        v_Return_Message := '판매인명('||v_Org_Agnm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Org_Agtel) IS NULL THEN
        v_Return_Message := '연락처('||v_Org_Agtel||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Use_Yn) IS NULL) OR (TRIM(v_Use_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0113Count(v_Ord_Agent) THEN

        IF 0 != f_InsertRtsd0113(v_Ord_Agent, v_Org_Agnm, v_Org_Agtel, v_Chan_Cd,
                                 v_Lifnr, v_Num, v_Sales_Group, v_Sales_Office,
                                 v_Tax_Rqcd, v_Use_Yn, v_Reg_Id, v_chan_Lcls_Cd, v_chan_Mcls_Cd, v_Rental_Group, v_Rental_Office, v_ErrorText) THEN
            v_Return_Message := '판매인정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRtsd0113(v_Ord_Agent, v_Org_Agnm, v_Org_Agtel, v_Chan_Cd,
                                     v_Lifnr, v_Num, v_Sales_Group, v_Sales_Office,
                                     v_Tax_Rqcd, v_Use_Yn, v_Reg_Id, v_chan_Lcls_Cd, v_chan_Mcls_Cd, v_Rental_Group, v_Rental_Office, v_ErrorText) THEN
                v_Return_Message := '판매인정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtsd0113(v_Ord_Agent, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '판매인정보 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0120.f_InsertRtsd0120(v_Ord_Agent, v_ErrorText) THEN
        v_Return_Message := '판매인 정보 변경 이력 생성 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0113.p_IUDRtsd0113(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0113.p_IUDRtsd0113(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0113;

  /*****************************************************************************
  -- 판매인정보 Select - 판매인 정보 조회 팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0113Popup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인코드            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*판매인명              */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*사용여부              */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE         /*채널정보              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_AGENT                                                , /*판매인코드 */
            A.ORG_AGNM                                                 , /*판매인명   */
            A.ORG_AGTEL                                                , /*연락처     */
            A.CHAN_CD                                                  , /*채널구분   */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S030', A.CHAN_CD) CHAN_NM, /*채널명     */
            A.LIFNR                                                    , /*벤더코드   */
            A.NUM                                                      , /*노출순서   */
            A.SALES_GROUP                                              , /*지사       */
            A.SALES_OFFICE                                             , /*지점       */
            A.TAX_RQCD                                                 , /*세금계산서 발행방법 */
            A.USE_YN                                                     /*사용여부   */
    FROM    RTSD0113 A
    WHERE   A.ORG_AGNM  LIKE '%'||v_Org_Agnm||'%'
    AND     A.ORD_AGENT = DECODE(v_Ord_Agent, NULL, A.ORD_AGENT, v_Ord_Agent)
    AND     A.USE_YN    = DECODE(v_Use_Yn   , NULL, A.USE_YN   , v_Use_Yn)
    AND     A.CHAN_CD   = DECODE(v_Chan_Cd  , NULL, A.CHAN_CD  , v_Chan_Cd)
    ORDER   BY A.NUM, A.ORD_AGENT;

  END p_sRtsd0113Popup;

  /*****************************************************************************
  -- 판매인정보 Select - 권한그룹별 조회
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가
   1.1.1      2016-12-06  wjim             [20161206_02] '콜센터(아웃바운드)' 사용자그룹 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0113UserGrp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE        /*권한그룹              */
    ) IS
                                                                                                                                                                                                                       
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  CD    ,                                   /*판매인코드            */
            CD_NM ,                                   /*판매인명              */
            TEL   ,                                   /*연락처                */
            CHAN_CD
    FROM    (
       --USER_GRP:'01' 영업관리자 - 방판,오픈몰,B2B
       SELECT  A.ORD_AGENT CD    ,                    /*판매인코드            */
               A.ORG_AGNM  CD_NM ,                    /*판매인명              */
               A.ORG_AGTEL TEL   ,                    /*연락처                */
               A.NUM       NUM   ,                    /*노출순서              */
               A.CHAN_CD
       FROM    RTSD0113 A
       WHERE   A.CHAN_CD       IN ('03','04','06')
       AND     A.USE_YN         = 'Y'
       AND     TRIM(v_User_Grp) = '01'
       UNION ALL
       --USER_GRP:'02' 콜센터 - 방판,오픈몰
       SELECT  A.ORD_AGENT CD    ,                    /*판매인코드            */
               A.ORG_AGNM  CD_NM ,                    /*판매인명              */
               A.ORG_AGTEL TEL   ,                    /*연락처                */
               A.NUM       NUM   ,                    /*노출순서              */
               A.CHAN_CD
       FROM    RTSD0113 A
       WHERE   A.CHAN_CD       IN ('03','04','06')
       AND     A.USE_YN         = 'Y'
       AND     TRIM(v_User_Grp) IN ('02','13')        /*[20161206_02]         */
       UNION ALL
       --USER_GRP:'09' 방문판매 - 방판
       SELECT  A.ORD_AGENT CD    ,                    /*판매인코드            */
               A.ORG_AGNM  CD_NM ,                    /*판매인명              */
               A.ORG_AGTEL TEL   ,                    /*연락처                */
               A.NUM       NUM   ,                    /*노출순서              */
               A.CHAN_CD
       FROM    RTSD0113 A
       WHERE   A.CHAN_CD        = '03'
       AND     A.USE_YN         = 'Y'
       AND     TRIM(v_User_Grp) = '09'
    )
    ORDER   BY NUM, CD;

  END p_sRtsd0113UserGrp;

  /*****************************************************************************
  -- 판매인정보 Select - 판매인 등록
  *****************************************************************************/
  PROCEDURE p_sRtsd0113List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*사용여부              */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    
    SELECT  A.ORD_AGENT,                                                   /*판매인번호          */
            A.ORG_AGNM,                                                    /*판매인명            */
            A.ORG_AGTEL,                                                   /*연락처              */
            A.CHAN_CD,                                                     /*채널구분            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S030', A.CHAN_CD) CHAN_NM,   /*채널                */
            A.LIFNR,                                                       /*벤더코드            */
            A.NUM,                                                         /*노출순서            */
            A.SALES_GROUP,                                                 /*지사코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.SALES_GROUP) SG_NM, /*지사                */
            A.SALES_OFFICE,                                                /*지점코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) SO_NM,/*지점                */
            A.TAX_RQCD,                                                    /*계산서 발행방법 코드*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S078', A.TAX_RQCD) TAX_RQNM, /*세금계산서 발행방법 */
            A.USE_YN,                                                      /*사용여부 코드       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_NM,     /*사용여부            */
            A.REG_ID,                                                      /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) AS REG_NM,            /*등록자 명           */
            A.REG_DT,                                                      /*등록일              */
            A.CHG_ID,                                                      /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) AS CHG_NM,            /*변경자 명           */
            A.CHG_DT,                                                      /*변경일              */
            A.CHAN_LCLS_CD,                                                /*채널 대분류         */
            A.CHAN_MCLS_CD,                                                /*채널 중분류         */
           A.RENTAL_GROUP,
           A.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',A.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',A.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
    FROM    RTSD0113 A
    WHERE   A.ORD_AGENT = DECODE(v_Ord_Agent   , NULL, A.ORD_AGENT   , v_Ord_Agent)
    AND     DECODE(v_chan_Lcls_Cd,NULL,' ',A.CHAN_LCLS_CD) = DECODE(v_chan_Lcls_Cd,NULL,' ',v_chan_Lcls_Cd)
    AND     DECODE(v_chan_Mcls_Cd,NULL,' ',A.CHAN_MCLS_CD) = DECODE(v_chan_Mcls_Cd,NULL,' ',v_chan_Mcls_Cd)     
    AND     A.USE_YN    = v_Use_Yn
    ;

  END p_sRtsd0113List;

  /*****************************************************************************
  -- 판매인정보 -  판매인번호 기준 필드정보 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0113FieldValue(
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,        /*판매인번호          */
    v_Field_Nm       IN VARCHAR,                        /*필드명              */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE            /*사용여부            */    
    ) RETURN VARCHAR2 IS
    v_Field_Value VARCHAR(2000);                         /*필드값              */
  BEGIN

    SELECT  TO_CHAR(DECODE(UPPER(TRIM(v_Field_Nm)), 
                           'ORG_AGNM',     ORG_AGNM,
                           'ORG_AGTEL',    ORG_AGTEL,
                           'CHAN_CD',      CHAN_CD,
                           'LIFNR',        LIFNR,
                           'NUM',          NUM,
                           'SALES_GROUP',  SALES_GROUP,
                           'SALES_OFFICE', SALES_OFFICE,
                           'TAX_RQCD',     TAX_RQCD,
                           'USE_YN',       USE_YN,
                           'REG_ID',       REG_ID,
                           'REG_DT',       REG_DT,
                           'CHG_ID',       CHG_ID,
                           'CHG_DT',       CHG_DT)) FIELD_VALUE                  
    INTO    v_Field_Value
    FROM    RTSD0113    
    WHERE   ORD_AGENT = v_Ord_Agent
    AND     USE_YN    LIKE v_Use_Yn||'%';

    RETURN v_Field_Value;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0113FieldValue;
  
END Pkg_Rtsd0113;