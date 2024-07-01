CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0100 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0100
   PURPOSE   �� ������ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �� ������ Count
  *****************************************************************************/
  FUNCTION f_sRtsd0100Count(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER;

  PROCEDURE p_sRtsd0100Base (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*���з�              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*����                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*���ܱ���              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*�����ּ�-��ȭ��ȣ     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*�����ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*�����ּ�-�����ȣ     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*�����ּ�-�ּ�         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*�����ּ�-���ּ�     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*������ȣ              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*���ι�ȣ              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*����ָ�              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*����� �����������   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*����� ����           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*����� ���ܱ���       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*����� �޴�����ȣ     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*����� ������ȣ       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*����� ��             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*����� ��ȭ��ȣ       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*����                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*���λ���� �鼼����   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP����ȣ           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �� ������ Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0100 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*���з�              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*����                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*���ܱ���              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*�����ּ�-��ȭ��ȣ     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*�����ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*�����ּ�-�����ȣ     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*�����ּ�-�ּ�         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*�����ּ�-���ּ�     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*������ȣ              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*���ι�ȣ              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*����ָ�              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*����� �����������   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*����� ����           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*����� ���ܱ���       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*����� �޴�����ȣ     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*����� ������ȣ       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*����� ��             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*����� ��ȭ��ȣ       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*����                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*���λ���� �鼼����   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP����ȣ           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,          /*����� ID             */
    v_Ord_Id         IN RTSD0104.ORD_ID%TYPE           /*�Ͻú� ����� ���� */
    );

  /*****************************************************************************
  -- �� ������ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0100 (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*���з�              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*����                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*���ܱ���              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*�����ּ�-��ȭ��ȣ     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*�����ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*�����ּ�-�����ȣ     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*�����ּ�-�ּ�         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*�����ּ�-���ּ�     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*������ȣ              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*���ι�ȣ              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*����ָ�              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*����� �����������   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*����� ����           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*����� ���ܱ���       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*����� �޴�����ȣ     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*����� ������ȣ       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*����� ��             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*����� ��ȭ��ȣ       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*����                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*���λ���� �鼼����   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP����ȣ           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0100 (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*���з�              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*����                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*���ܱ���              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*�����ּ�-��ȭ��ȣ     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*�����ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*�����ּ�-�����ȣ     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*�����ּ�-�ּ�         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*�����ּ�-���ּ�     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*������ȣ              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*���ι�ȣ              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*����ָ�              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*����� �����������   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*����� ����           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*����� ���ܱ���       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*����� �޴�����ȣ     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*����� ������ȣ       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*����� ��             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*����� ��ȭ��ȣ       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*����                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*���λ���� �鼼����   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP����ȣ           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ������ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0100 (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0100 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Cust_No        IN OUT RTSD0100.CUST_NO%TYPE,    /*����ȣ              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*���з�              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*����                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*���ܱ���              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*�����ּ�-��ȭ��ȣ     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*�����ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*�����ּ�-�����ȣ     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*�����ּ�-�ּ�         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*�����ּ�-���ּ�     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*������ȣ              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*���ι�ȣ              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*����ָ�              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*����� �����������   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*����� ����           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*����� ���ܱ���       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*����� �޴�����ȣ     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*����� ������ȣ       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*����� ��             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*����� ��ȭ��ȣ       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*����                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*���λ���� �鼼����   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP����ȣ           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �� ������ - ����ȣ ü��
  *****************************************************************************/
  FUNCTION f_sRtsd0100CustNo RETURN VARCHAR;

  /*****************************************************************************
  -- �� ������ - ���� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0100CustName(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN VARCHAR2;


  /*****************************************************************************
  -- �� ������ Select - ������-CI,DI��_������_��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0100CiDiCustTp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE         /*����ڹ�ȣ            */
    );

  /*****************************************************************************
  -- �� ������ Select - ������ SAFEKEY Count
  *****************************************************************************/
  FUNCTION f_sRtsd0100Count_Safekey(
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE           /*SAFEKEY            */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- �� ������ Select - ����ڹ�ȣ ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0100Count_checkBuslNo(
    v_BuslNo        IN RTSD0100.BUSL_NO%TYPE           /*����ڹ�            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �� ������ - ����ȣ�� SAFEKEY  ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0100Safekey(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- �� ������ - SAFEKEY�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0100SafekeyCount(
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE           /*SAFEKEY            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �� ������ - ����ڹ�ȣ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0100BuslCount(
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE           /*����ڹ�ȣ          */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �� ������ - ����ȣ�� ������  ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0100CustTp(
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- �� ������ ���� - �¶��� I/F
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0100Online (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�ڵ���                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*������ȣ              */
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*���ּ�              */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*�̸���                */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �� ������ Select  - ����Ȳ - ������
  *****************************************************************************/
  PROCEDURE p_sRtsd0100CustAnalysis01 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*������ȣ              */
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE          /*����ȣ              */
    );



  /*****************************************************************************
  -- �� ������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0100DirectOrder (
   v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Cust_No        IN OUT RTSD0100.CUST_NO%TYPE,    /*����ȣ              */   
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */   
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */    
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Cust_Tp3       IN RTSD0100.CUST_TP3%TYPE,       /*���з�              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );  

  /*****************************************************************************
  -- �� ������ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0100Direct (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Cust_Tp3       IN RTSD0100.CUST_TP3%TYPE,       /*���з�              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */   
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;   
 


 /*****************************************************************************
  -- �� ������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0100Direct (
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*����ȣ              */    
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */    
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */    
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Cust_Tp3        IN RTSD0100.CUST_TP3%TYPE,        /*������              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */   
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;   
    
    
  /*****************************************************************************
  -- �� ������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0100Member (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Cust_No        IN OUT RTSD0100.CUST_NO%TYPE,    /*����ȣ              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*���з�              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*����                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*���ܱ���              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*�����ּ�-��ȭ��ȣ     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*�����ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*�����ּ�-�����ȣ     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*�����ּ�-�ּ�         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*�����ּ�-���ּ�     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*������ȣ              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*���ι�ȣ              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*����ָ�              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*����� �����������   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*����� ����           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*����� ���ܱ���       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*����� �޴�����ȣ     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*����� ������ȣ       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*����� ��             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*����� ��ȭ��ȣ       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*����                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*���λ���� �鼼����   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP����ȣ           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );   


   /*****************************************************************************
  -- �� ������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_sRtcs010saveAdviceCust (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Cust_No        IN OUT RTSD0100.CUST_NO%TYPE,    /*����ȣ              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*������              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*���з�              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*�����������          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*����                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*���ܱ���              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*�����ּ�-��ȭ��ȣ     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*�����ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*�����ּ�-�����ȣ     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*�����ּ�-�ּ�         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*�����ּ�-���ּ�     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*������ȣ              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*���ι�ȣ              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*��ǥ�ڸ�              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*����ָ�              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*����� �����������   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*����� ����           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*����� ���ܱ���       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*����� �޴�����ȣ     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*����� ������ȣ       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*����� ��             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*����� ��ȭ��ȣ       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*����                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*���λ���� �鼼����   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP����ȣ           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );    
END Pkg_Rtsd0100;
/
