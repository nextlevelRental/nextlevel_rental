CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0101 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0101
   PURPOSE   고객 마스터 변경이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-07  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 고객 마스터 변경이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0101Count(
    v_Cust_No        IN RTSD0101.CUST_NO%TYPE,          /*고객번호            */
    v_Seq            IN RTSD0101.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0101
    WHERE   CUST_NO = v_Cust_No
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0101Count;

  /*****************************************************************************
  -- 고객 마스터 변경이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0101 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0101.CUST_NO%TYPE         /*고객번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.SEQ,                       /*순번                */
            A.CUST_TP,                   /*고객유형            */
            A.CUST_TP2,                  /*고객분류            */
            A.CUST_NM,                   /*고객명/법인명       */
            A.BIRTH_DAY,                 /*법정생년월일        */
            A.GENDER_CD,                 /*성별                */
            A.LF_CD,                     /*내외국인            */
            A.MOB_NO,                    /*휴대폰번호          */
            A.MOB_FIRM,                  /*통신사(S039)        */
            A.TEL_NO,                    /*전화번호            */
            A.FAX_NO,                    /*팩스번호            */
            A.BLD_MNG_NO,                /*우편번호PK(건물관리 */
            A.POS_CD,                    /*우편번호            */
            A.ADDR1,                     /*주소                */
            A.ADDR2,                     /*상세주소            */
            A.TEL_NO2    ,               /*보조주소-전화번호   */
            A.BLD_MNG_NO2,               /*고객주소-우편번호(B)*/
            A.POS_CD2    ,               /*고객주소-우편번호   */
            A.ADDR1_2    ,               /*고객주소-주소       */
            A.ADDR2_2    ,               /*고객주소-상세주소   */
            A.SAFEKEY,                   /*인증번호            */
            A.BUSL_NO,                   /*사업자번호          */
            A.CORP_NO,                   /*법인번호            */
            A.REP_NM,                    /*대표자명            */
            A.O_CUSTNM,                  /*사업주명            */
            A.O_BIRTHDAY,                /*사업주 법정생년월일 */
            A.O_GENDERCD,                /*사업주 성별         */
            A.O_LFCD,                    /*사업주 내외국인     */
            A.O_MOBNO,                   /*사업주 휴대폰번호   */
            A.O_SAFEKEY,                 /*사업주 인증번호     */
            A.C_CUSTNM,                  /*담당자 명           */
            A.C_TELNO,                   /*담당자 전화번호     */
            A.EMAIL_ADDR,                /*E-Mail주소          */
            A.BUSI_TYPE,                 /*업종                */
            A.BUSI_COND,                 /*업태                */
            A.TAX_YN,                    /*개인사업자 면세여부 */
            A.KUNNR,                     /*SAP고객번호         */
            A.CI_CD,                     /*CI                  */
            A.DI_CD,                     /*DI                  */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0101 A
    WHERE   A.CUST_NO = v_Cust_No;

  END p_sRtsd0101;

  /*****************************************************************************
  -- 고객 마스터 변경이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0101 (
    v_Cust_No        IN RTSD0101.CUST_NO%TYPE,        /*고객번호              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
        
    INSERT  INTO RTSD0101 (
            CUST_NO,
            SEQ,
            CUST_TP,
            CUST_TP2,
            CUST_NM,
            BIRTH_DAY,
            GENDER_CD,
            LF_CD,
            MOB_NO,
            MOB_FIRM,
            TEL_NO,
            FAX_NO,
            BLD_MNG_NO,
            POS_CD,
            ADDR1,
            ADDR2,
            TEL_NO2,
            BLD_MNG_NO2,
            POS_CD2,
            ADDR1_2,
            ADDR2_2,
            SAFEKEY,
            BUSL_NO,
            CORP_NO,
            REP_NM,
            O_CUSTNM,
            O_BIRTHDAY,
            O_GENDERCD,
            O_LFCD,
            O_MOBNO,
            O_SAFEKEY,
            C_CUSTNM,
            C_TELNO,
            EMAIL_ADDR,
            BUSI_TYPE,
            BUSI_COND,
            TAX_YN,
            KUNNR,
            CI_CD,
            DI_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  A.CUST_NO,
            NVL((SELECT  MAX(B.SEQ)
                 FROM    RTSD0101 B
                 WHERE   B.CUST_NO = A.CUST_NO)+ 1, 1) AS SEQ,
            A.CUST_TP,
            A.CUST_TP2,
            A.CUST_NM,
            A.BIRTH_DAY,
            A.GENDER_CD,
            A.LF_CD,
            A.MOB_NO,
            A.MOB_FIRM,
            A.TEL_NO,
            A.FAX_NO,
            A.BLD_MNG_NO,
            A.POS_CD,
            A.ADDR1,
            A.ADDR2,
            A.TEL_NO2,
            A.BLD_MNG_NO2,
            A.POS_CD2,
            A.ADDR1_2,
            A.ADDR2_2,
            A.SAFEKEY,
            A.BUSL_NO,
            A.CORP_NO,
            A.REP_NM,
            A.O_CUSTNM,
            A.O_BIRTHDAY,
            A.O_GENDERCD,
            A.O_LFCD,
            A.O_MOBNO,
            A.O_SAFEKEY,
            A.C_CUSTNM,
            A.C_TELNO,
            A.EMAIL_ADDR,
            A.BUSI_TYPE,
            A.BUSI_COND,
            A.TAX_YN,
            A.KUNNR,
            A.CI_CD,
            A.DI_CD,
            A.USE_YN,
            A.REG_ID,
            A.REG_DT,
            A.CHG_ID,
            A.CHG_DT
    FROM    RTSD0100 A
    WHERE   A.CUST_NO = v_Cust_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0101;

END Pkg_Rtsd0101;