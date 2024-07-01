CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0119 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0119
   PURPOSE   대리점 정보 이력 관리

   REVISIONS   
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------
   1.0      2015-12-16  jemcarry    1. Created this package body.
   1.1      2016-09-05  임욱재     채널대/중분류, 온라인장착 가능여부 항목 추가          
*******************************************************************************/

  /*****************************************************************************
  -- 대리점 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0119Count(
    v_Agency_Cd      IN RTSD0119.AGENCY_CD%TYPE,        /*대리점코드          */
    v_Seq            IN RTSD0119.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0119
    WHERE   AGENCY_CD = v_Agency_Cd
    AND     SEQ       = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0119Count;

  /*****************************************************************************
  -- 대리점 정보 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0119 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTSD0119.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Seq            IN RTSD0119.SEQ%TYPE             /*순번                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.AGENCY_CD,                 /*대리점코드          */
            A.SEQ,                       /*순번                */
            A.AGENCY_NM,                 /*대리점명            */
            A.SALES_GROUP,               /*지사                */
            A.SALES_OFFICE,              /*지점                */
            A.POS_CD,                    /*우편번호            */
            A.CITY,                      /*주소                */
            A.STREET,                    /*상세주소            */
            A.SIDO_CD,                   /*시,도 코드          */
            A.SIGUN_CD,                  /*시,군,구 코드       */
            A.SER_NO,                    /*우편일련번호        */
            A.TEL_NO,                    /*전화번호            */
            A.MOB_NO,                    /*휴대폰번호          */
            A.FAX_NO,                    /*팩스번호            */
            A.TAX_NO,                    /*사업자번호          */
            A.REP_NM,                    /*대표자명            */
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
            A.OLIMIT_CNT,                /*대리점 일 주문제한건*/
            A.LIFNR,                     /*벤더코드            */
            A.TAX_RQCD,                  /*세금계산서 발행방법 */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            A.CHAN_LCLS_CD,              /*채널 대분류         */
            A.CHAN_MCLS_CD,              /*채널 중분류         */
            A.OP_YN                      /*온라인장착 가능여부 */            
    FROM    RTSD0119 A
    WHERE   A.AGENCY_CD = v_Agency_Cd
    AND     A.SEQ       = v_Seq;

  END p_sRtsd0119;

  /*****************************************************************************
  -- 대리점 정보 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0119 (
    v_Agency_Cd      IN RTSD0119.AGENCY_CD%TYPE,      /*대리점코드            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0119 (
            AGENCY_CD,
            SEQ,
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
            LM_YN,
            FM_YN,
            CW_YN,
            CH_YN,
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
            CHAIN_YN
            )
    SELECT  A.AGENCY_CD,                 /*대리점코드          */
            NVL((SELECT  MAX(B.SEQ)
                 FROM    RTSD0119 B
                 WHERE   B.AGENCY_CD = A.AGENCY_CD)+ 1, 1) AS SEQ, /*순번                */
            A.AGENCY_NM,                 /*대리점명            */
            A.SALES_GROUP,               /*지사                */
            A.SALES_OFFICE,              /*지점                */
            A.POS_CD,                    /*우편번호            */
            A.CITY,                      /*주소                */
            A.STREET,                    /*상세주소            */
            A.SIDO_CD,                   /*시,도 코드          */
            A.SIGUN_CD,                  /*시,군,구 코드       */
            A.SER_NO,                    /*우편일련번호        */
            A.TEL_NO,                    /*전화번호            */
            A.MOB_NO,                    /*휴대폰번호          */
            A.FAX_NO,                    /*팩스번호            */
            A.TAX_NO,                    /*사업자번호          */
            A.REP_NM,                    /*대표자명            */
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
            A.OLIMIT_CNT,                /*대리점 일 주문제한건*/
            A.LIFNR,                     /*벤더코드            */
            A.TAX_RQCD,                  /*세금계산서 발행방법 */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            A.CHAN_LCLS_CD,              /*채널 대분류         */
            A.CHAN_MCLS_CD,              /*채널 중분류         */
            A.OP_YN,                     /*온라인장착 가능여부 */
            A.CHAIN_YN                   /*직영도매 거래선 여부 */
    FROM    RTSD0007 A
    WHERE   A.AGENCY_CD = v_Agency_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0119;


END Pkg_Rtsd0119;
/