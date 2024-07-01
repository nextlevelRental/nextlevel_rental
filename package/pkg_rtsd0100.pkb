CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0100 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0100
   PURPOSE   고객 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.
   1.1        2017-11-07  wjim             [20171107_02] 쇼핑몰 고객정보 수정 시 전화번호 필수 해제
   1.2        2019-09-03  wjim             [20190903_02] 만 19세 미만 고객생성 불가
   1.3        2021-12-29  kstka            [20211229_01] 만 75세 이상 고객생성 불가
   1.20       2022-01-17  kstka            [20220117_01] kstka 렌탈고객등록 불가 체크로직 위치 변경
*******************************************************************************/

  /*****************************************************************************
  -- 고객 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0100Count(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER IS
    v_Curr_Cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_Curr_Cunt
    FROM    RTSD0100
    WHERE   CUST_NO = v_Cust_No;

    RETURN v_Curr_Cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0100Count;
  
  PROCEDURE p_sRtsd0100Base (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*고객분류              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*성별                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*내외국인              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*통신사                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*팩스번호              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*보조주소-전화번호     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*보조주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*보조주소-우편번호     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*보조주소-주소         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*보조주소-상세주소     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*인증번호              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*법인번호              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*사업주명              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*사업주 법정생년월일   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*사업주 성별           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*사업주 내외국인       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*사업주 휴대폰번호     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*사업주 인증번호       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*담당자 명             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*담당자 전화번호       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*업태                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*개인사업자 면세여부   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP고객번호           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN
    OPEN Ref_Cursor FOR
    
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.CUST_TP,                   /*고객유형            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP) AS CUST_TP_NM,
            A.CUST_TP2,                  /*고객분류            */
            A.CUST_NM,                   /*고객명/법인명       */
            A.BIRTH_DAY,                 /*법정생년월일        */
            A.GENDER_CD,                 /*성별                */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,
            A.LF_CD,                     /*내외국인            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,
            A.MOB_NO,                    /*휴대폰번호          */
            A.MOB_FIRM,                  /*통신사              */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S039', A.MOB_FIRM) AS LF_NM,
            A.TEL_NO,                    /*전화번호            */
            A.FAX_NO,                    /*팩스번호            */
            A.BLD_MNG_NO,                /*고객주소-우편번호PK(*/
            A.POS_CD,                    /*고객주소-우편번호   */
            A.ADDR1,                     /*고객주소-주소       */
            A.ADDR2,                     /*고객주소-상세주소   */
            A.TEL_NO2,                   /*보조주소-전화번호   */
            A.BLD_MNG_NO2,               /*보조주소-우편번호PK(*/
            A.POS_CD2,                   /*보조주소-우편번호   */
            A.ADDR1_2,                   /*보조주소-주소       */
            A.ADDR2_2,                   /*보조주소-상세주소   */
            A.ADDR1||' '||A.ADDR2 AS ADDR_SUM1,     /*고객주소-주소       */
            A.ADDR1_2||' '||A.ADDR2_2 AS ADDR_SUM2, /*고객주소-주소       */
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
    FROM    RTSD0100 A
    WHERE   A.USE_YN       = 'Y'
    AND     (v_Cust_No      IS NULL OR A.CUST_NO     =  v_Cust_No)
    AND     (v_Cust_Tp      IS NULL OR A.CUST_TP     =  v_Cust_Tp)
    AND     (v_Cust_Tp2     IS NULL OR A.CUST_TP2    =  v_Cust_Tp2)
    AND     (v_Cust_Nm      IS NULL OR A.CUST_NM     LIKE '%'||REPLACE(v_Cust_Nm, ' ' ,'')||'%' )
    AND     (v_Birth_Day    IS NULL OR A.BIRTH_DAY   =  v_Birth_Day)
    AND     (v_Gender_Cd    IS NULL OR A.GENDER_CD   =  v_Gender_Cd)
    AND     (v_Lf_Cd        IS NULL OR A.LF_CD       =  v_Lf_Cd)
    AND     (v_Mob_No       IS NULL OR A.MOB_NO      =  v_Mob_No)
    AND     (v_Mob_Firm     IS NULL OR A.MOB_FIRM    =  v_Mob_Firm)
    AND     (v_Tel_No       IS NULL OR A.TEL_NO      =  REPLACE(v_Tel_No, '-','') )
    AND     (v_Fax_No       IS NULL OR A.FAX_NO      =  v_FAX_NO)
    AND     (v_Bld_Mng_No   IS NULL OR A.BLD_MNG_NO  =  v_Bld_Mng_No)
    AND     (v_Pos_Cd       IS NULL OR A.POS_CD      =  v_Pos_Cd)
    AND     (v_Addr1        IS NULL OR A.ADDR1       =  v_Addr1)
    AND     (v_Addr2        IS NULL OR A.ADDR2       =  v_Addr2)
    AND     (v_Tel_No2      IS NULL OR A.TEL_NO2     =  REPLACE(v_Tel_No2, '-','') )
    AND     (v_Bld_Mng_No2  IS NULL OR A.BLD_MNG_NO2 =  v_Bld_Mng_No2)
    AND     (v_Pos_Cd2      IS NULL OR A.POS_CD2     =  v_Pos_Cd2)
    AND     (v_Addr1_2      IS NULL OR A.ADDR1_2     =  v_Addr1_2)
    AND     (v_Addr2_2      IS NULL OR A.ADDR2_2     =  v_Addr2_2)
    AND     (v_Safekey      IS NULL OR A.SAFEKEY     =  v_Safekey)
    AND     (v_Busl_No      IS NULL OR A.BUSL_NO     =  v_Busl_No)
    AND     (v_Corp_No      IS NULL OR A.CORP_NO     =  v_Corp_No)
    AND     (v_Rep_Nm       IS NULL OR A.REP_NM      =  v_Rep_Nm)
    AND     (v_O_Custnm     IS NULL OR A.O_CUSTNM    =  v_O_Custnm)
    AND     (v_O_Birthday   IS NULL OR A.O_BIRTHDAY  =  v_O_Birthday)
    AND     (v_O_Gendercd   IS NULL OR A.O_GENDERCD  =  v_O_Gendercd)
    AND     (v_O_Lfcd       IS NULL OR A.O_LFCD      =  v_O_Lfcd)
    AND     (v_O_Mobno      IS NULL OR A.O_MOBNO     =  v_O_Mobno)
    AND     (v_O_Safekey    IS NULL OR A.O_SAFEKEY   =  v_O_Safekey)
    AND     (v_C_Custnm     IS NULL OR A.C_CUSTNM    =  v_C_Custnm)
    AND     (v_C_Telno      IS NULL OR A.C_TELNO     =  v_C_Telno)
    AND     (v_Email_Addr   IS NULL OR A.EMAIL_ADDR  =  v_Email_Addr)
    AND     (v_Busi_Type    IS NULL OR A.BUSI_TYPE   =  v_Busi_Type)
    AND     (v_Busi_Cond    IS NULL OR A.BUSI_COND   =  v_Busi_Cond)
    AND     (v_Tax_Yn       IS NULL OR A.TAX_YN      =  v_Tax_Yn)
    AND     (v_Kunnr        IS NULL OR A.KUNNR       =  v_Kunnr)
    AND     (v_Ci_Cd        IS NULL OR A.CI_CD       =  v_Ci_Cd)
    AND     (v_Di_Cd        IS NULL OR A.DI_CD       =  v_Di_Cd)
    ORDER BY A.CUST_NM ASC;
  END p_sRtsd0100Base;  

  /*****************************************************************************
  -- 고객 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0100 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*고객분류              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*성별                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*내외국인              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*통신사                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*팩스번호              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*보조주소-전화번호     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*보조주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*보조주소-우편번호     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*보조주소-주소         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*보조주소-상세주소     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*인증번호              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*법인번호              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*사업주명              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*사업주 법정생년월일   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*사업주 성별           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*사업주 내외국인       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*사업주 휴대폰번호     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*사업주 인증번호       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*담당자 명             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*담당자 전화번호       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*업태                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*개인사업자 면세여부   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP고객번호           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,          /*등록자 ID             */
    v_Ord_Id         IN RTSD0104.ORD_ID%TYPE           /*일시불 멤버십 구분 */
    ) IS

  BEGIN
    IF (v_Ord_Id = '03')  THEN

    OPEN Ref_Cursor FOR
    
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.CUST_TP,                   /*고객유형            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP) AS CUST_TP_NM,
            A.CUST_TP2,                  /*고객분류            */
            A.CUST_NM,                   /*고객명/법인명       */
            A.BIRTH_DAY,                 /*법정생년월일        */
            A.GENDER_CD,                 /*성별                */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,
            A.LF_CD,                     /*내외국인            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,
            A.MOB_NO,                    /*휴대폰번호          */
            A.MOB_FIRM,                  /*통신사              */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S039', A.MOB_FIRM) AS LF_NM,
            A.TEL_NO,                    /*전화번호            */
            A.FAX_NO,                    /*팩스번호            */
            A.BLD_MNG_NO,                /*고객주소-우편번호PK(*/
            A.POS_CD,                    /*고객주소-우편번호   */
            A.ADDR1,                     /*고객주소-주소       */
            A.ADDR2,                     /*고객주소-상세주소   */
            A.TEL_NO2,                   /*보조주소-전화번호   */
            A.BLD_MNG_NO2,               /*보조주소-우편번호PK(*/
            A.POS_CD2,                   /*보조주소-우편번호   */
            A.ADDR1_2,                   /*보조주소-주소       */
            A.ADDR2_2,                   /*보조주소-상세주소   */
            A.ADDR1||' '||A.ADDR2 AS ADDR_SUM1,     /*고객주소-주소       */
            A.ADDR1_2||' '||A.ADDR2_2 AS ADDR_SUM2, /*고객주소-주소       */
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
    FROM    RTSD0100 A
    WHERE   A.USE_YN       = 'Y'
    AND     (v_Cust_No      IS NULL OR A.CUST_NO     =  v_Cust_No)
    AND     (v_Cust_Tp      IS NULL OR A.CUST_TP     =  v_Cust_Tp)
    AND     (v_Cust_Tp2     IS NULL OR A.CUST_TP2    =  v_Cust_Tp2)
    AND     (v_Cust_Nm      IS NULL OR A.CUST_NM     LIKE '%'||REPLACE(v_Cust_Nm, ' ' ,'')||'%' )
    AND     (v_Birth_Day    IS NULL OR A.BIRTH_DAY   =  v_Birth_Day)
    AND     (v_Gender_Cd    IS NULL OR A.GENDER_CD   =  v_Gender_Cd)
    AND     (v_Lf_Cd        IS NULL OR A.LF_CD       =  v_Lf_Cd)
    AND     (v_Mob_No       IS NULL OR A.MOB_NO      =  v_Mob_No)
    AND     (v_Mob_Firm     IS NULL OR A.MOB_FIRM    =  v_Mob_Firm)
    AND     (v_Tel_No       IS NULL OR A.TEL_NO      =  REPLACE(v_Tel_No, '-','') )
    AND     (v_Fax_No       IS NULL OR A.FAX_NO      =  v_FAX_NO)
    AND     (v_Bld_Mng_No   IS NULL OR A.BLD_MNG_NO  =  v_Bld_Mng_No)
    AND     (v_Pos_Cd       IS NULL OR A.POS_CD      =  v_Pos_Cd)
    AND     (v_Addr1        IS NULL OR A.ADDR1       =  v_Addr1)
    AND     (v_Addr2        IS NULL OR A.ADDR2       =  v_Addr2)
    AND     (v_Tel_No2      IS NULL OR A.TEL_NO2     =  REPLACE(v_Tel_No2, '-','') )
    AND     (v_Bld_Mng_No2  IS NULL OR A.BLD_MNG_NO2 =  v_Bld_Mng_No2)
    AND     (v_Pos_Cd2      IS NULL OR A.POS_CD2     =  v_Pos_Cd2)
    AND     (v_Addr1_2      IS NULL OR A.ADDR1_2     =  v_Addr1_2)
    AND     (v_Addr2_2      IS NULL OR A.ADDR2_2     =  v_Addr2_2)
    AND     (v_Safekey      IS NULL OR A.SAFEKEY     =  v_Safekey)
    AND     (v_Busl_No      IS NULL OR A.BUSL_NO     =  v_Busl_No)
    AND     (v_Corp_No      IS NULL OR A.CORP_NO     =  v_Corp_No)
    AND     (v_Rep_Nm       IS NULL OR A.REP_NM      =  v_Rep_Nm)
    AND     (v_O_Custnm     IS NULL OR A.O_CUSTNM    =  v_O_Custnm)
    AND     (v_O_Birthday   IS NULL OR A.O_BIRTHDAY  =  v_O_Birthday)
    AND     (v_O_Gendercd   IS NULL OR A.O_GENDERCD  =  v_O_Gendercd)
    AND     (v_O_Lfcd       IS NULL OR A.O_LFCD      =  v_O_Lfcd)
    AND     (v_O_Mobno      IS NULL OR A.O_MOBNO     =  v_O_Mobno)
    AND     (v_O_Safekey    IS NULL OR A.O_SAFEKEY   =  v_O_Safekey)
    AND     (v_C_Custnm     IS NULL OR A.C_CUSTNM    =  v_C_Custnm)
    AND     (v_C_Telno      IS NULL OR A.C_TELNO     =  v_C_Telno)
    AND     (v_Email_Addr   IS NULL OR A.EMAIL_ADDR  =  v_Email_Addr)
    AND     (v_Busi_Type    IS NULL OR A.BUSI_TYPE   =  v_Busi_Type)
    AND     (v_Busi_Cond    IS NULL OR A.BUSI_COND   =  v_Busi_Cond)
    AND     (v_Tax_Yn       IS NULL OR A.TAX_YN      =  v_Tax_Yn)
    AND     (v_Kunnr        IS NULL OR A.KUNNR       =  v_Kunnr)
    AND     (v_Ci_Cd        IS NULL OR A.CI_CD       =  v_Ci_Cd)
    AND     (v_Di_Cd        IS NULL OR A.DI_CD       =  v_Di_Cd)
    ORDER BY A.CUST_NM ASC;
    
    ELSE
    
    OPEN Ref_Cursor FOR
        SELECT  A.CUST_NO,                   /*고객번호            */
                A.CUST_TP,                   /*고객유형            */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP) AS CUST_TP_NM,
                A.CUST_TP2,                  /*고객분류            */
                A.CUST_NM,                   /*고객명/법인명       */
                A.BIRTH_DAY,                 /*법정생년월일        */
                A.GENDER_CD,                 /*성별                */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,
                A.LF_CD,                     /*내외국인            */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,
                A.MOB_NO,                    /*휴대폰번호          */
                A.MOB_FIRM,                  /*통신사              */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S039', A.MOB_FIRM) AS LF_NM,
                A.TEL_NO,                    /*전화번호            */
                A.FAX_NO,                    /*팩스번호            */
                A.BLD_MNG_NO,                /*고객주소-우편번호PK(*/
                A.POS_CD,                    /*고객주소-우편번호   */
                A.ADDR1,                     /*고객주소-주소       */
                A.ADDR2,                     /*고객주소-상세주소   */
                A.TEL_NO2,                   /*보조주소-전화번호   */
                A.BLD_MNG_NO2,               /*보조주소-우편번호PK(*/
                A.POS_CD2,                   /*보조주소-우편번호   */
                A.ADDR1_2,                   /*보조주소-주소       */
                A.ADDR2_2,                   /*보조주소-상세주소   */
                A.ADDR1||' '||A.ADDR2 AS ADDR_SUM1,     /*고객주소-주소       */
                A.ADDR1_2||' '||A.ADDR2_2 AS ADDR_SUM2, /*고객주소-주소       */
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
        FROM    RTSD0100 A
        WHERE   A.USE_YN       = 'Y'
        AND     (v_Cust_No      IS NULL OR A.CUST_NO     =  v_Cust_No)
        AND     (v_Cust_Tp      IS NULL OR A.CUST_TP     =  v_Cust_Tp)
        AND     (v_Cust_Tp2     IS NULL OR A.CUST_TP2    =  v_Cust_Tp2)
        AND     (v_Cust_Nm      IS NULL OR A.CUST_NM     LIKE '%'||REPLACE(v_Cust_Nm, ' ' ,'')||'%' )
        AND     (v_Birth_Day    IS NULL OR A.BIRTH_DAY   =  v_Birth_Day)
        AND     (v_Gender_Cd    IS NULL OR A.GENDER_CD   =  v_Gender_Cd)
        AND     (v_Lf_Cd        IS NULL OR A.LF_CD       =  v_Lf_Cd)
        AND     (v_Mob_No       IS NULL OR A.MOB_NO      =  v_Mob_No)
        AND     (v_Mob_Firm     IS NULL OR A.MOB_FIRM    =  v_Mob_Firm)
        AND     (v_Tel_No       IS NULL OR A.TEL_NO      =  REPLACE(v_Tel_No, '-','') )
        AND     (v_Fax_No       IS NULL OR A.FAX_NO      =  v_FAX_NO)
        AND     (v_Bld_Mng_No   IS NULL OR A.BLD_MNG_NO  =  v_Bld_Mng_No)
        AND     (v_Pos_Cd       IS NULL OR A.POS_CD      =  v_Pos_Cd)
        AND     (v_Addr1        IS NULL OR A.ADDR1       =  v_Addr1)
        AND     (v_Addr2        IS NULL OR A.ADDR2       =  v_Addr2)
        AND     (v_Tel_No2      IS NULL OR A.TEL_NO2     =  REPLACE(v_Tel_No2, '-','') )
        AND     (v_Bld_Mng_No2  IS NULL OR A.BLD_MNG_NO2 =  v_Bld_Mng_No2)
        AND     (v_Pos_Cd2      IS NULL OR A.POS_CD2     =  v_Pos_Cd2)
        AND     (v_Addr1_2      IS NULL OR A.ADDR1_2     =  v_Addr1_2)
        AND     (v_Addr2_2      IS NULL OR A.ADDR2_2     =  v_Addr2_2)
        AND     (v_Safekey      IS NULL OR A.SAFEKEY     =  v_Safekey)
        AND     (v_Busl_No      IS NULL OR A.BUSL_NO     =  v_Busl_No)
        AND     (v_Corp_No      IS NULL OR A.CORP_NO     =  v_Corp_No)
        AND     (v_Rep_Nm       IS NULL OR A.REP_NM      =  v_Rep_Nm)
        AND     (v_O_Custnm     IS NULL OR A.O_CUSTNM    =  v_O_Custnm)
        AND     (v_O_Birthday   IS NULL OR A.O_BIRTHDAY  =  v_O_Birthday)
        AND     (v_O_Gendercd   IS NULL OR A.O_GENDERCD  =  v_O_Gendercd)
        AND     (v_O_Lfcd       IS NULL OR A.O_LFCD      =  v_O_Lfcd)
        AND     (v_O_Mobno      IS NULL OR A.O_MOBNO     =  v_O_Mobno)
        AND     (v_O_Safekey    IS NULL OR A.O_SAFEKEY   =  v_O_Safekey)
        AND     (v_C_Custnm     IS NULL OR A.C_CUSTNM    =  v_C_Custnm)
        AND     (v_C_Telno      IS NULL OR A.C_TELNO     =  v_C_Telno)
        AND     (v_Email_Addr   IS NULL OR A.EMAIL_ADDR  =  v_Email_Addr)
        AND     (v_Busi_Type    IS NULL OR A.BUSI_TYPE   =  v_Busi_Type)
        AND     (v_Busi_Cond    IS NULL OR A.BUSI_COND   =  v_Busi_Cond)
        AND     (v_Tax_Yn       IS NULL OR A.TAX_YN      =  v_Tax_Yn)
        AND     (v_Kunnr        IS NULL OR A.KUNNR       =  v_Kunnr)
        AND     (v_Ci_Cd        IS NULL OR A.CI_CD       =  v_Ci_Cd)
        AND     (v_Di_Cd        IS NULL OR A.DI_CD       =  v_Di_Cd)
        AND A.CUST_TP3 IS NULL
        ORDER BY A.CUST_NM ASC;
    END IF;
  END p_sRtsd0100;

  /*****************************************************************************
  -- 고객 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0100 (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*고객분류              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*성별                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*내외국인              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*통신사                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*팩스번호              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*보조주소-전화번호     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*보조주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*보조주소-우편번호     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*보조주소-주소         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*보조주소-상세주소     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*인증번호              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*법인번호              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*사업주명              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*사업주 법정생년월일   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*사업주 성별           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*사업주 내외국인       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*사업주 휴대폰번호     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*사업주 인증번호       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*담당자 명             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*담당자 전화번호       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*업태                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*개인사업자 면세여부   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP고객번호           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0100 (
            CUST_NO,
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
    VALUES  (
            v_Cust_No,
            v_Cust_Tp,
            v_Cust_Tp2,
            REPLACE(v_Cust_Nm,' ',''),
            v_Birth_Day,
            v_Gender_Cd,
            v_Lf_Cd,
            TRIM(v_Mob_No),
            v_Mob_Firm,
            TRIM(v_Tel_No),
            v_Fax_No,
            v_Bld_Mng_No,
            v_Pos_Cd,
            v_Addr1,
            v_Addr2,
            v_Tel_No2,
            v_Bld_Mng_No2,
            v_Pos_Cd2,
            v_Addr1_2,
            v_Addr2_2,
            v_Safekey,
            v_Busl_No,
            v_Corp_No,
            v_Rep_Nm,
            v_O_Custnm,
            v_O_Birthday,
            v_O_Gendercd,
            v_O_Lfcd,
            v_O_Mobno,
            v_O_Safekey,
            v_C_Custnm,
            v_C_Telno,
            v_Email_Addr,
            v_Busi_Type,
            v_Busi_Cond,
            v_Tax_Yn,
            v_Kunnr,
            v_Ci_Cd,
            v_Di_Cd,
            v_Use_Yn,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0100;

  /*****************************************************************************
  -- 고객 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0100 (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*고객분류              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*성별                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*내외국인              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*통신사                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*팩스번호              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*보조주소-전화번호     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*보조주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*보조주소-우편번호     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*보조주소-주소         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*보조주소-상세주소     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*인증번호              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*법인번호              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*사업주명              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*사업주 법정생년월일   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*사업주 성별           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*사업주 내외국인       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*사업주 휴대폰번호     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*사업주 인증번호       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*담당자 명             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*담당자 전화번호       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*업태                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*개인사업자 면세여부   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP고객번호           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0100
    SET    CUST_TP      = v_Cust_Tp,
           CUST_TP2     = v_Cust_Tp2,
           CUST_NM      = REPLACE(v_Cust_Nm,' ',''),
           BIRTH_DAY    = v_Birth_Day,
           GENDER_CD    = v_Gender_Cd,
           LF_CD        = v_Lf_Cd,
           MOB_NO       = TRIM(v_Mob_No),
           MOB_FIRM     = v_Mob_Firm,
           TEL_NO       = TRIM(v_Tel_No),
           FAX_NO       = v_Fax_No,
           BLD_MNG_NO   = v_Bld_Mng_No,
           POS_CD       = v_Pos_Cd,
           ADDR1        = v_Addr1,
           ADDR2        = v_Addr2,
           TEL_NO2      = v_Tel_No2,
           BLD_MNG_NO2  = v_Bld_Mng_No2,
           POS_CD2      = v_Pos_Cd2,
           ADDR1_2      = v_Addr1_2,
           ADDR2_2      = v_Addr2_2,
           SAFEKEY      = v_Safekey,
           BUSL_NO      = v_Busl_No,
           CORP_NO      = v_Corp_No,
           REP_NM       = v_Rep_Nm,
           O_CUSTNM     = v_O_Custnm,
           O_BIRTHDAY   = v_O_Birthday,
           O_GENDERCD   = v_O_Gendercd,
           O_LFCD       = v_O_Lfcd,
           O_MOBNO      = v_O_Mobno,
           O_SAFEKEY    = v_O_Safekey,
           C_CUSTNM     = v_C_Custnm,
           C_TELNO      = v_C_Telno,
           EMAIL_ADDR   = v_Email_Addr,
           BUSI_TYPE    = v_Busi_Type,
           BUSI_COND    = v_Busi_Cond,
           TAX_YN       = v_Tax_Yn,
           KUNNR        = v_Kunnr,
           CI_CD        = v_Ci_Cd,
           DI_CD        = v_Di_Cd,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  CUST_NO      = v_Cust_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0100;

  /*****************************************************************************
  -- 고객 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0100 (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0100
    SET    USE_YN   = 'N',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  CUST_NO  = v_Cust_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0100;


  /*****************************************************************************
  -- 고객 마스터 관리(IUD)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2019-09-03  wjim             [20190903_02] 만 19세 미만 고객생성 불가
   1.3        2021-12-29  kstka            [20211229_01] 만 75세 이상 고객생성 불가
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0100 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN OUT RTSD0100.CUST_NO%TYPE,    /*고객번호              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*고객분류              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*성별                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*내외국인              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*통신사                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*팩스번호              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*보조주소-전화번호     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*보조주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*보조주소-우편번호     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*보조주소-주소         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*보조주소-상세주소     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*인증번호              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*법인번호              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*사업주명              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*사업주 법정생년월일   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*사업주 성별           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*사업주 내외국인       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*사업주 휴대폰번호     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*사업주 인증번호       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*담당자 명             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*담당자 전화번호       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*업태                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*개인사업자 면세여부   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP고객번호           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    v_Age   NUMBER;     --법정생년월일 기준 만나이 [20190903_02]

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Tax_Yn) IS NULL THEN
        v_Return_Message := '개인사업자 면세여부('||v_Tax_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Tp) IS NULL THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Tp2 ) IS NULL THEN
        v_Return_Message := '고객분류('||v_Cust_Tp2 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm ) IS NULL THEN
        v_Return_Message := '고객명/법인명('||v_Cust_Nm ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_No ) IS NULL THEN
        v_Return_Message := '휴대폰번호('||v_Mob_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_Firm) IS NULL THEN
        v_Return_Message := '통신사('||v_Mob_Firm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Tel_No ) IS NULL THEN
        v_Return_Message := '전화번호('||v_Tel_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    

/*
    IF TRIM(v_Bld_Mng_No ) IS NULL THEN
        v_Return_Message := '고객주소-우편번호PK(건물관리번호)('||v_Bld_Mng_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Pos_Cd ) IS NULL THEN
        v_Return_Message := '고객주소-우편번호('||v_Pos_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Addr1 ) IS NULL THEN
        v_Return_Message := '고객주소-주소('||v_Addr1 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
*/
    IF 0 = f_sRtsd0100Count(v_Cust_No) THEN
    
        -- [20190903_02] 만 19세 미만 고객등록 불가
        -- [20220117_01] kstka 렌탈고객등록 불가 체크로직 위치 변경
        SELECT TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE(v_Birth_Day,'YYYYMMDD')) / 12) INTO v_Age FROM  dual;
        
        IF v_Age < 19 THEN
            v_Return_Message := '만나이('||v_Age ||') : 19세 이상만 고객등록 가능합니다!';
            RAISE e_Error;
        END IF;
        
        -- [20211229_01] 만 75세 이상 고객등록 불가
        IF v_Age >= 75 THEN
            v_Return_Message := '렌탈 가입 가능 연령이 아니어서 렌탈이 불가능합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Cust_Tp) = '01' THEN
          IF 0 != Pkg_Rtsd0100.f_sRtsd0100SafekeyCount(v_Safekey) THEN
              v_Return_Message := '인증번호로 이미 등록된 고객이 있습니다!';
              RAISE e_Error;
          END IF;
        END IF;

        IF TRIM(v_Cust_Tp) = '02' THEN
          IF 0 != Pkg_Rtsd0100.f_sRtsd0100BuslCount(v_Busl_No) THEN
              v_Return_Message := '사업자번호로 이미 등록된 고객이 있습니다!';
              RAISE e_Error;
          END IF;
        END IF;

        v_Cust_No := f_sRtsd0100CustNo();

        IF 0 != f_InsertRtsd0100(v_Cust_No,v_Cust_Tp,v_Cust_Tp2,v_Cust_Nm,
                                 v_Birth_Day,v_Gender_Cd,v_Lf_Cd,v_Mob_No,
                                 v_Mob_Firm,v_Tel_No,v_Fax_No,v_Bld_Mng_No,
                                 v_Pos_Cd,v_Addr1,v_Addr2,v_Tel_No2,
                                 v_Bld_Mng_No2,v_Pos_Cd2,v_Addr1_2,v_Addr2_2,
                                 v_Safekey,v_Busl_No,v_Corp_No,v_Rep_Nm,
                                 v_O_Custnm,v_O_Birthday,v_O_Gendercd,v_O_Lfcd,
                                 v_O_Mobno,v_O_Safekey,v_C_Custnm,v_C_Telno,
                                 v_Email_Addr,v_Busi_Type,v_Busi_Cond,v_Tax_Yn,
                                 v_Kunnr,v_Ci_Cd,v_Di_Cd,v_Use_Yn,
                                 v_Reg_Id,v_Errortext) THEN
            v_Return_Message := '고객 마스터 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0100(v_Cust_No,v_Cust_Tp,v_Cust_Tp2,v_Cust_Nm,
                                     v_Birth_Day,v_Gender_Cd,v_Lf_Cd,v_Mob_No,
                                     v_Mob_Firm,v_Tel_No,v_Fax_No,v_Bld_Mng_No,
                                     v_Pos_Cd,v_Addr1,v_Addr2,v_Tel_No2,
                                     v_Bld_Mng_No2,v_Pos_Cd2,v_Addr1_2,v_Addr2_2,
                                     v_Safekey,v_Busl_No,v_Corp_No,v_Rep_Nm,
                                     v_O_Custnm,v_O_Birthday,v_O_Gendercd,v_O_Lfcd,
                                     v_O_Mobno,v_O_Safekey,v_C_Custnm,v_C_Telno,
                                     v_Email_Addr,v_Busi_Type,v_Busi_Cond,v_Tax_Yn,
                                     v_Kunnr,v_Ci_Cd,v_Di_Cd,v_Use_Yn,
                                     v_Reg_Id,v_Errortext) THEN
                v_Return_Message := '고객 마스터 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0100(v_Cust_No, v_Reg_Id, v_Errortext) THEN
                v_Return_Message := '고객 마스터 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;

    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0101.f_InsertRtsd0101(v_Cust_No, v_ErrorText) THEN
        v_Return_Message := '이력 등록 실패!!!';
        RAISE e_Error;
    END IF;

    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_IUDRtsd0100(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_IUDRtsd0100(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0100;

  /*****************************************************************************
  -- 고객 마스터 - 고객번호 체번
  *****************************************************************************/
  FUNCTION f_sRtsd0100CustNo RETURN VARCHAR IS
    v_Cust_No   RTSD0100.CUST_NO%TYPE DEFAULT NULL; /*고객번호            */
  BEGIN

    SELECT  NVL(MAX(CUST_NO)+1,'1000000001') 
    INTO    v_Cust_No
    FROM    RTSD0100 
    WHERE LENGTH(CUST_NO) = 10
    AND SUBSTR(CUST_NO, 0, 1) <> '9';

    RETURN v_Cust_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0100CustNo;


  /*****************************************************************************
  -- 고객 마스터 - 고객명 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0100CustName(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE         /*고객번호              */
    ) RETURN VARCHAR2 IS
    v_Cust_Nm     RTSD0100.CUST_NM%TYPE DEFAULT NULL; /*고객명/법인명         */
  BEGIN

    SELECT  CUST_NM
    INTO    v_Cust_Nm
    FROM    RTSD0100
    WHERE   CUST_NO = v_Cust_No;

    RETURN v_Cust_Nm;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0100CustName;


  /*****************************************************************************
  -- 고객 마스터 Select - 고객정보-CI,DI로_고객정보_조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0100CiDiCustTp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE         /*사업자번호            */
    ) IS

  BEGIN

    OPEN REF_CURSOR FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.CUST_TP,                   /*고객유형            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP) CUST_TP_NM, /*고객유형명 */
            A.CUST_TP2,                  /*고객분류            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S025', A.CUST_TP2) CUST_TP2_NM, /*고객유형명 */
            A.CUST_NM,                   /*고객명/법인명       */
            A.BIRTH_DAY,                 /*법정생년월일        */
            A.GENDER_CD,                 /*성별                */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) GENDER_NM, /*성별  */
            A.LF_CD,                     /*내외국인            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) LF_NM, /*내외국인  */
            A.MOB_NO,                    /*휴대폰번호          */
            A.MOB_FIRM,                  /*통신사              */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S039', A.MOB_FIRM) MOBF_NM, /*통신사  */
            A.TEL_NO,                    /*전화번호            */
            A.FAX_NO,                    /*팩스번호            */
            A.BLD_MNG_NO,                /*고객주소-우편번호PK(*/
            A.POS_CD,                    /*고객주소-우편번호   */
            A.ADDR1,                     /*고객주소-주소       */
            A.ADDR2,                     /*고객주소-상세주소   */
            A.TEL_NO2,                   /*보조주소-전화번호   */
            A.BLD_MNG_NO2,               /*보조주소-우편번호PK(*/
            A.POS_CD2,                   /*보조주소-우편번호   */
            A.ADDR1_2,                   /*보조주소-주소       */
            A.ADDR2_2,                   /*보조주소-상세주소   */
            A.SAFEKEY,                   /*인증번호            */
            A.BUSL_NO,                   /*사업자번호          */
            A.CORP_NO,                   /*법인번호            */
            A.REP_NM,                    /*대표자명            */
            A.EMAIL_ADDR,                /*E-Mail주소          */
            A.BUSI_TYPE,                 /*업종                */
            A.BUSI_COND,                 /*업태                */
            A.CI_CD,                     /*CI                  */
            A.DI_CD                      /*DI                  */
    FROM    RTSD0100 A
    WHERE   ((v_Cust_Tp = '01' AND A.CUST_TP = '01' AND (A.CI_CD = v_Ci_Cd OR A.DI_CD = v_Di_Cd))
            OR
             (v_Cust_Tp = '02' AND A.CUST_TP = '02' AND A.BUSL_NO = v_Busl_No))
    AND     A.USE_YN = 'Y';


  END p_sRtsd0100CiDiCustTp;

  /*****************************************************************************
  -- 고객 마스터 Select - 고객정보 SAFEKEY Count
  *****************************************************************************/
  FUNCTION f_sRtsd0100Count_Safekey(
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE           /*SAFEKEY            */
    ) RETURN VARCHAR2 IS

    v_Cust_No   RTSD0100.CUST_NO%TYPE DEFAULT '';
  BEGIN

    SELECT  CUST_NO
    INTO    v_Cust_No
    FROM    RTSD0100
    WHERE   SAFEKEY = v_Safekey
    AND     USE_YN  = 'Y';

    RETURN v_Cust_No;

    EXCEPTION
      WHEN  NO_DATA_FOUND THEN
        RETURN '0';

      WHEN OTHERS  THEN
        RETURN 'ERROR';

  END f_sRtsd0100Count_Safekey;


  /*****************************************************************************
  -- 고객 마스터 Select - 사업자번호 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0100Count_checkBuslNo(
    v_BuslNo        IN RTSD0100.BUSL_NO%TYPE           /*사업자번            */
    ) RETURN NUMBER IS

    v_Buslno_Cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_Buslno_Cunt
    FROM    RTSD0100
    WHERE   BUSL_NO = v_BuslNo;

    RETURN v_Buslno_Cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0100Count_checkBuslNo;


  /*****************************************************************************
  -- 고객 마스터 - 고객번호로 SAFEKEY  획득
  *****************************************************************************/
  FUNCTION f_sRtsd0100Safekey(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*고객번호            */
    ) RETURN VARCHAR IS

    v_Safekey RTSD0100.SAFEKEY%TYPE DEFAULT NULL;       /*SAFEKEY             */
  BEGIN

    SELECT  SAFEKEY
    INTO    v_Safekey
    FROM    RTSD0100
    WHERE   CUST_NO = v_Cust_No;

    RETURN v_Safekey;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0100Safekey;

  /*****************************************************************************
  -- 고객 마스터 - SAFEKEY로 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0100SafekeyCount(
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE           /*SAFEKEY            */
    ) RETURN NUMBER IS

    v_Safekey_Cnt NUMBER DEFAULT 0;

  BEGIN

    SELECT  COUNT(SAFEKEY)
    INTO    v_Safekey_Cnt
    FROM    RTSD0100
    WHERE   SAFEKEY = v_Safekey;

    RETURN v_Safekey_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0100SafekeyCount;

  /*****************************************************************************
  -- 고객 마스터 - SAFEKEY로 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0100BuslCount(
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE           /*사업자번호          */
    ) RETURN NUMBER IS

    v_Busl_No_Cnt NUMBER DEFAULT 0;

  BEGIN

    SELECT  COUNT(SAFEKEY)
    INTO    v_Busl_No_Cnt
    FROM    RTSD0100
    WHERE   BUSL_NO = v_Busl_No;

    RETURN v_Busl_No_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0100BuslCount;

  /*****************************************************************************
  -- 고객 마스터 - 고객번호로 고객유형  획득
  *****************************************************************************/
  FUNCTION f_sRtsd0100CustTp(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*고객번호            */
    ) RETURN VARCHAR IS

    v_Cust_Tp RTSD0100.CUST_TP%TYPE DEFAULT NULL;       /*고객유형             */
  BEGIN

    SELECT  CUST_TP
    INTO    v_Cust_Tp
    FROM    RTSD0100
    WHERE   CUST_NO = v_Cust_No;

    RETURN v_Cust_Tp;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0100CustTp;

  /*****************************************************************************
  -- 고객 마스터 변경 - 온라인 I/F
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-11-07  wjim             [20171107_02] 전화번호 필수 해제
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0100Online (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*핸드폰                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*상세주소              */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*이메일                */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = f_sRtsd0100Count(v_Cust_No))THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_No ) IS NULL THEN
        v_Return_Message := '휴대폰번호('||v_Mob_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    /* [20171107_02]
    IF TRIM(v_Tel_No ) IS NULL THEN
        v_Return_Message := '전화번호('||v_Tel_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    */

    IF TRIM(v_Bld_Mng_No ) IS NULL THEN
        v_Return_Message := '고객주소-우편번호PK(건물관리번호)('||v_Bld_Mng_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Pos_Cd ) IS NULL THEN
        v_Return_Message := '고객주소-우편번호('||v_Pos_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Addr1 ) IS NULL THEN
        v_Return_Message := '고객주소-주소('||v_Addr1 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Addr2 ) IS NULL THEN
        v_Return_Message := '상세주소('||v_Addr1 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Email_Addr ) IS NULL THEN
        v_Return_Message := '이메일('||v_Addr1 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF '01' <> f_sRtsd0100CustTp(TRIM(v_Cust_No)) THEN
        v_Return_Message := '해당 고객유형은 개인고객('||v_Cust_No||')이 아니므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    UPDATE  RTSD0100
    SET     MOB_NO     = v_Mob_No,
            TEL_NO     = NVL2(TRIM(v_Tel_No), v_Tel_No, TEL_NO),
            BLD_MNG_NO = v_Bld_Mng_No,
            POS_CD     = v_Pos_cd,
            ADDR1      = v_Addr1,
            ADDR2      = v_Addr2,
            EMAIL_ADDR = v_Email_Addr,
            CHG_ID     = v_Reg_Id,
            CHG_DT     = SYSDATE
    WHERE   CUST_NO    = v_Cust_No;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0101.f_InsertRtsd0101(v_Cust_No, v_ErrorText) THEN
        v_Return_Message := '이력 등록 실패!!!';
        RAISE e_Error;
    END IF;

    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_UpdateRtsd0100Online(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_UpdateRtsd0100Online(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtsd0100Online;


  /*****************************************************************************
  -- 고객 마스터 Select  - 고객현황 - 고객정보
  *****************************************************************************/
  PROCEDURE p_sRtsd0100CustAnalysis01 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE          /*계약번호              */
    ) IS

    v_Serch_Flag NUMBER DEFAULT 0;
  BEGIN

    -- 최소 하나이상의 조건값이 입력되어야 함
    IF  (v_Cust_Nm   IS NULL) AND
        (v_Birth_Day IS NULL) AND
        (v_Mob_No    IS NULL) AND
        (v_Mob_No    IS NULL) AND
        (v_Car_No    IS NULL) AND
        (v_Ord_No    IS NULL) THEN
        v_Serch_Flag := -1;
    END IF;

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                                                       /*고객번호     */
            A.CUST_NM,                                                       /*고객명       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP) CUST_TP_NM,  /*고객유형     */
            DECODE(A.CUST_TP,'01',A.BIRTH_DAY,NULL) BIRTH_DAY,               /*법정생년월일 */
            DECODE(A.CUST_TP,'01',Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD),NULL) AS GENDER_NM, /*성별         */
            A.MOB_NO,                                                        /*휴대폰       */
            A.EMAIL_ADDR,                                                    /*이메일주소   */
            '('||A.POS_CD||')'||' '||A.ADDR1||' '||A.ADDR2 AS ADDR           /*주소         */
    FROM    RTSD0100 A
    WHERE   v_Serch_Flag = 0
    AND     A.CUST_NM   LIKE v_Cust_Nm||'%'
    AND     A.BIRTH_DAY = DECODE(v_Birth_Day, NULL, A.BIRTH_DAY, v_Birth_Day)
    AND     A.MOB_NO    = DECODE(v_Mob_No, NULL, A.MOB_NO, v_Mob_No)
    AND     EXISTS (
            SELECT  B.CUST_NO
            FROM    RTSD0108 B
            WHERE   B.CUST_NO(+) = A.CUST_NO
            AND     B.CAR_NO    = DECODE(v_Car_No, NULL, B.CAR_NO, v_Car_No)
            AND     B.ORD_NO    = DECODE(v_Ord_No, NULL, B.ORD_NO, v_Ord_No)
            )
    ORDER   BY A.CUST_NM;


  END p_sRtsd0100CustAnalysis01;


  /*****************************************************************************
  -- 고객 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0100DirectOrder (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN OUT RTSD0100.CUST_NO%TYPE,    /*고객번호              */   
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */   
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */    
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Cust_Tp3       IN RTSD0100.CUST_TP3%TYPE,       /*고객분류              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN


    IF 0 = f_sRtsd0100Count(v_Cust_No) THEN

        
        v_Cust_No := f_sRtsd0100CustNo();

        IF 0 != f_InsertRtsd0100Direct(v_Cust_No,v_Cust_Nm,
                                 v_Birth_Day,v_Mob_No, v_Use_Yn,v_Cust_Tp3,
                                 v_Cust_Tp,v_Busl_No,v_Rep_Nm,v_Reg_Id,v_Errortext) THEN
            v_Return_Message := '고객 마스터 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

             IF 0 != f_UpdateRtsd0100Direct(v_Cust_No,v_Cust_Nm,
                                 v_Birth_Day,v_Mob_No, v_Use_Yn,v_Cust_Tp3,
                                 v_Cust_Tp,v_Busl_No,v_Rep_Nm,v_Reg_Id,v_Errortext) THEN
                v_Return_Message := '고객 마스터 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

             v_Success_code := 0;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;

    END IF;


    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_IUDRtsd0100DirectOrder(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_IUDRtsd0100DirectOrder(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0100DirectOrder;


  /*****************************************************************************
  -- 고객 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0100Direct (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Cust_Tp3       IN RTSD0100.CUST_TP3%TYPE,       /*고객분류              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */   
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0100(
            CUST_NO,
            CUST_TP3,
            CUST_TP,
            BUSL_NO,
            REP_NM,
            CUST_NM,
            BIRTH_DAY,
            MOB_NO, 
            TEL_NO,
            USE_YN,            
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Cust_No,          
            v_Cust_Tp3,
            v_Cust_Tp,
            v_Busl_No,
            v_Rep_Nm,
            REPLACE(v_Cust_Nm,' ',''),
            v_Birth_Day,           
            TRIM(v_Mob_No), 
            TRIM(v_Mob_No), 
            v_Use_Yn,            
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0100Direct;


 /*****************************************************************************
  -- 고객 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0100Direct (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */    
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */    
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */    
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Cust_Tp3       IN RTSD0100.CUST_TP3%TYPE,        /*고객유형              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */   
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN


    UPDATE RTSD0100
    SET    CUST_TP3      = v_Cust_Tp3,
           CUST_NM      = REPLACE(v_Cust_Nm,' ',''),
           BIRTH_DAY    = v_Birth_Day,
           REP_NM       = v_Rep_Nm,
           CUST_TP      = v_Cust_Tp,
           BUSL_NO      = v_Busl_No,          
           MOB_NO       = TRIM(v_Mob_No),
           TEL_NO       = TRIM(v_Mob_No), 
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  CUST_NO      = v_Cust_No;


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0100Direct;
  
  
  
  /*****************************************************************************
  -- 고객 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0100Member (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN OUT RTSD0100.CUST_NO%TYPE,    /*고객번호              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*고객분류              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*성별                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*내외국인              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*통신사                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*팩스번호              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*보조주소-전화번호     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*보조주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*보조주소-우편번호     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*보조주소-주소         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*보조주소-상세주소     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*인증번호              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*법인번호              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*사업주명              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*사업주 법정생년월일   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*사업주 성별           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*사업주 내외국인       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*사업주 휴대폰번호     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*사업주 인증번호       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*담당자 명             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*담당자 전화번호       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*업태                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*개인사업자 면세여부   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP고객번호           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Tp) IS NULL THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Tp2 ) IS NULL THEN
        v_Return_Message := '고객분류('||v_Cust_Tp2 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm ) IS NULL THEN
        v_Return_Message := '고객명/법인명('||v_Cust_Nm ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_No ) IS NULL THEN
        v_Return_Message := '휴대폰번호('||v_Mob_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_Firm) IS NULL THEN
        v_Return_Message := '통신사('||v_Mob_Firm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Tel_No ) IS NULL THEN
        v_Return_Message := '전화번호('||v_Tel_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

/*
    IF TRIM(v_Bld_Mng_No ) IS NULL THEN
        v_Return_Message := '고객주소-우편번호PK(건물관리번호)('||v_Bld_Mng_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Pos_Cd ) IS NULL THEN
        v_Return_Message := '고객주소-우편번호('||v_Pos_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Addr1 ) IS NULL THEN
        v_Return_Message := '고객주소-주소('||v_Addr1 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
*/
    IF 0 = f_sRtsd0100Count(v_Cust_No) THEN

        IF TRIM(v_Cust_Tp) = '01' THEN
          IF 0 != Pkg_Rtsd0100.f_sRtsd0100SafekeyCount(v_Safekey) THEN
              v_Return_Message := '인증번호로 이미 등록된 고객이 있습니다!';
              RAISE e_Error;
          END IF;
        END IF;

        IF TRIM(v_Cust_Tp) = '02' THEN
          IF 0 != Pkg_Rtsd0100.f_sRtsd0100BuslCount(v_Busl_No) THEN
              v_Return_Message := '사업자번호로 이미 등록된 고객이 있습니다!';
              RAISE e_Error;
          END IF;
        END IF;

        v_Cust_No := f_sRtsd0100CustNo();

        IF 0 != f_InsertRtsd0100(v_Cust_No,v_Cust_Tp,v_Cust_Tp2,v_Cust_Nm,
                                 v_Birth_Day,v_Gender_Cd,v_Lf_Cd,v_Mob_No,
                                 v_Mob_Firm,v_Tel_No,v_Fax_No,v_Bld_Mng_No,
                                 v_Pos_Cd,v_Addr1,v_Addr2,v_Tel_No2,
                                 v_Bld_Mng_No2,v_Pos_Cd2,v_Addr1_2,v_Addr2_2,
                                 v_Safekey,v_Busl_No,v_Corp_No,v_Rep_Nm,
                                 v_O_Custnm,v_O_Birthday,v_O_Gendercd,v_O_Lfcd,
                                 v_O_Mobno,v_O_Safekey,v_C_Custnm,v_C_Telno,
                                 v_Email_Addr,v_Busi_Type,v_Busi_Cond,v_Tax_Yn,
                                 v_Kunnr,v_Ci_Cd,v_Di_Cd,v_Use_Yn,
                                 v_Reg_Id,v_Errortext) THEN
            v_Return_Message := '고객 마스터 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0100(v_Cust_No,v_Cust_Tp,v_Cust_Tp2,v_Cust_Nm,
                                     v_Birth_Day,v_Gender_Cd,v_Lf_Cd,v_Mob_No,
                                     v_Mob_Firm,v_Tel_No,v_Fax_No,v_Bld_Mng_No,
                                     v_Pos_Cd,v_Addr1,v_Addr2,v_Tel_No2,
                                     v_Bld_Mng_No2,v_Pos_Cd2,v_Addr1_2,v_Addr2_2,
                                     v_Safekey,v_Busl_No,v_Corp_No,v_Rep_Nm,
                                     v_O_Custnm,v_O_Birthday,v_O_Gendercd,v_O_Lfcd,
                                     v_O_Mobno,v_O_Safekey,v_C_Custnm,v_C_Telno,
                                     v_Email_Addr,v_Busi_Type,v_Busi_Cond,v_Tax_Yn,
                                     v_Kunnr,v_Ci_Cd,v_Di_Cd,v_Use_Yn,
                                     v_Reg_Id,v_Errortext) THEN
                v_Return_Message := '고객 마스터 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0100(v_Cust_No, v_Reg_Id, v_Errortext) THEN
                v_Return_Message := '고객 마스터 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;

    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0101.f_InsertRtsd0101(v_Cust_No, v_ErrorText) THEN
        v_Return_Message := '이력 등록 실패!!!';
        RAISE e_Error;
    END IF;

    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_IUDRtsd0100(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_IUDRtsd0100(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0100Member;  
  
  
  
   /*****************************************************************************
  -- 고객 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_sRtcs010saveAdviceCust (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN OUT RTSD0100.CUST_NO%TYPE,    /*고객번호              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*고객분류              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*성별                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*내외국인              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*통신사                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*팩스번호              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*보조주소-전화번호     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*보조주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*보조주소-우편번호     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*보조주소-주소         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*보조주소-상세주소     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*인증번호              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*법인번호              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*사업주명              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*사업주 법정생년월일   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*사업주 성별           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*사업주 내외국인       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*사업주 휴대폰번호     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*사업주 인증번호       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*담당자 명             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*담당자 전화번호       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*업태                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*개인사업자 면세여부   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP고객번호           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
  
    IF TRIM(v_Cust_Tp) IS NULL THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm ) IS NULL THEN
        v_Return_Message := '고객명/법인명('||v_Cust_Nm ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_No ) IS NULL THEN
        v_Return_Message := '휴대폰번호('||v_Mob_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_Firm) IS NULL THEN
        v_Return_Message := '통신사('||v_Mob_Firm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Tel_No ) IS NULL THEN
        v_Return_Message := '전화번호('||v_Tel_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF 0 = f_sRtsd0100Count(v_Cust_No) THEN

        IF TRIM(v_Cust_Tp) = '01' THEN
          IF 0 != Pkg_Rtsd0100.f_sRtsd0100SafekeyCount(v_Safekey) THEN
              v_Return_Message := '인증번호로 이미 등록된 고객이 있습니다!';
              RAISE e_Error;
          END IF;
        END IF;

        IF TRIM(v_Cust_Tp) = '02' THEN
          IF 0 != Pkg_Rtsd0100.f_sRtsd0100BuslCount(v_Busl_No) THEN
              v_Return_Message := '사업자번호로 이미 등록된 고객이 있습니다!';
              RAISE e_Error;
          END IF;
        END IF;

        v_Cust_No := f_sRtsd0100CustNo();

        IF 0 != f_InsertRtsd0100(v_Cust_No,v_Cust_Tp,v_Cust_Tp2,v_Cust_Nm,
                                 v_Birth_Day,v_Gender_Cd,v_Lf_Cd,v_Mob_No,
                                 v_Mob_Firm,v_Tel_No,v_Fax_No,v_Bld_Mng_No,
                                 v_Pos_Cd,v_Addr1,v_Addr2,v_Tel_No2,
                                 v_Bld_Mng_No2,v_Pos_Cd2,v_Addr1_2,v_Addr2_2,
                                 v_Safekey,v_Busl_No,v_Corp_No,v_Rep_Nm,
                                 v_O_Custnm,v_O_Birthday,v_O_Gendercd,v_O_Lfcd,
                                 v_O_Mobno,v_O_Safekey,v_C_Custnm,v_C_Telno,
                                 v_Email_Addr,v_Busi_Type,v_Busi_Cond,v_Tax_Yn,
                                 v_Kunnr,v_Ci_Cd,v_Di_Cd,v_Use_Yn,
                                 v_Reg_Id,v_Errortext) THEN
            v_Return_Message := '고객 마스터 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0100(v_Cust_No,v_Cust_Tp,v_Cust_Tp2,v_Cust_Nm,
                                     v_Birth_Day,v_Gender_Cd,v_Lf_Cd,v_Mob_No,
                                     v_Mob_Firm,v_Tel_No,v_Fax_No,v_Bld_Mng_No,
                                     v_Pos_Cd,v_Addr1,v_Addr2,v_Tel_No2,
                                     v_Bld_Mng_No2,v_Pos_Cd2,v_Addr1_2,v_Addr2_2,
                                     v_Safekey,v_Busl_No,v_Corp_No,v_Rep_Nm,
                                     v_O_Custnm,v_O_Birthday,v_O_Gendercd,v_O_Lfcd,
                                     v_O_Mobno,v_O_Safekey,v_C_Custnm,v_C_Telno,
                                     v_Email_Addr,v_Busi_Type,v_Busi_Cond,v_Tax_Yn,
                                     v_Kunnr,v_Ci_Cd,v_Di_Cd,v_Use_Yn,
                                     v_Reg_Id,v_Errortext) THEN
                v_Return_Message := '고객 마스터 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0100(v_Cust_No, v_Reg_Id, v_Errortext) THEN
                v_Return_Message := '고객 마스터 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;

    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0101.f_InsertRtsd0101(v_Cust_No, v_ErrorText) THEN
        v_Return_Message := '이력 등록 실패!!!';
        RAISE e_Error;
    END IF;

    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_sRtcs010saveAdviceCust(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Rtsd0100.p_sRtcs010saveAdviceCust(2)', v_ErrorText, v_Return_Message);

  END p_sRtcs010saveAdviceCust; 

END Pkg_Rtsd0100;
/