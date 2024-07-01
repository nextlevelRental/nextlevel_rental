CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0100 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0100
   PURPOSE   고객 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 고객 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0100Count(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER;

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
    );

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
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0100 (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 마스터 관리(IUD)
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
    );

  /*****************************************************************************
  -- 고객 마스터 - 고객번호 체번
  *****************************************************************************/
  FUNCTION f_sRtsd0100CustNo RETURN VARCHAR;

  /*****************************************************************************
  -- 고객 마스터 - 고객명 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0100CustName(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*고객번호            */
    ) RETURN VARCHAR2;


  /*****************************************************************************
  -- 고객 마스터 Select - 고객정보-CI,DI로_고객정보_조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0100CiDiCustTp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE         /*사업자번호            */
    );

  /*****************************************************************************
  -- 고객 마스터 Select - 고객정보 SAFEKEY Count
  *****************************************************************************/
  FUNCTION f_sRtsd0100Count_Safekey(
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE           /*SAFEKEY            */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- 고객 마스터 Select - 사업자번호 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0100Count_checkBuslNo(
    v_BuslNo        IN RTSD0100.BUSL_NO%TYPE           /*사업자번            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 고객 마스터 - 고객번호로 SAFEKEY  획득
  *****************************************************************************/
  FUNCTION f_sRtsd0100Safekey(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*고객번호            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 고객 마스터 - SAFEKEY로 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0100SafekeyCount(
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE           /*SAFEKEY            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 고객 마스터 - 사업자번호로 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0100BuslCount(
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE           /*사업자번호          */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 고객 마스터 - 고객번호로 고객유형  획득
  *****************************************************************************/
  FUNCTION f_sRtsd0100CustTp(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*고객번호            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 고객 마스터 변경 - 온라인 I/F
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
    );

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
    );



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
    );  

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
    ) RETURN NUMBER;   
 


 /*****************************************************************************
  -- 고객 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0100Direct (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*고객번호              */    
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */    
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */    
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Cust_Tp3        IN RTSD0100.CUST_TP3%TYPE,        /*고객유형              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */   
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;   
    
    
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
    );   


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
    );    
END Pkg_Rtsd0100;
/
