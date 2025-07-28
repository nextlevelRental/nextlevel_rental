CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0120 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0120
   PURPOSE   판매인 정보 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-16  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 판매인 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0120Count(
    v_Ord_Agent      IN RTSD0120.ORD_AGENT%TYPE,        /*판매인번호          */
    v_Seq            IN RTSD0120.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0120
    WHERE   ORD_AGENT = v_Ord_Agent
    AND     SEQ       = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0120Count;

  /*****************************************************************************
  -- 판매인 정보 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0120 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0120.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Seq            IN RTSD0120.SEQ%TYPE             /*순번                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_AGENT,                 /*판매인번호          */
            A.SEQ,                       /*순번                */
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
    FROM    RTSD0120 A
    WHERE   A.ORD_AGENT = v_Ord_Agent
    AND     A.SEQ       = v_Seq;

  END p_sRtsd0120;

  /*****************************************************************************
  -- 판매인 정보 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0120 (
    v_Ord_Agent      IN RTSD0120.ORD_AGENT%TYPE,      /*판매인번호            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0120 (
            ORD_AGENT,
            SEQ,
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
            CHG_DT
            )
    SELECT  A.ORD_AGENT,                 /*판매인번호          */
            NVL((SELECT  MAX(B.SEQ)
                 FROM    RTSD0120 B
                 WHERE   B.ORD_AGENT = A.ORD_AGENT)+ 1, 1) AS SEQ, /*순번                */   
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
    WHERE   A.ORD_AGENT = v_Ord_Agent;
    
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0120;

END Pkg_Rtsd0120;