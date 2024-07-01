CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0101 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0101
   PURPOSE   �� ������ �����̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-07  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �� ������ �����̷� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0101Count(
    v_Cust_No        IN RTSD0101.CUST_NO%TYPE,          /*����ȣ            */
    v_Seq            IN RTSD0101.SEQ%TYPE               /*����                */
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
  -- �� ������ �����̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0101 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0101.CUST_NO%TYPE         /*����ȣ              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*����ȣ            */
            A.SEQ,                       /*����                */
            A.CUST_TP,                   /*������            */
            A.CUST_TP2,                  /*���з�            */
            A.CUST_NM,                   /*����/���θ�       */
            A.BIRTH_DAY,                 /*�����������        */
            A.GENDER_CD,                 /*����                */
            A.LF_CD,                     /*���ܱ���            */
            A.MOB_NO,                    /*�޴�����ȣ          */
            A.MOB_FIRM,                  /*��Ż�(S039)        */
            A.TEL_NO,                    /*��ȭ��ȣ            */
            A.FAX_NO,                    /*�ѽ���ȣ            */
            A.BLD_MNG_NO,                /*�����ȣPK(�ǹ����� */
            A.POS_CD,                    /*�����ȣ            */
            A.ADDR1,                     /*�ּ�                */
            A.ADDR2,                     /*���ּ�            */
            A.TEL_NO2    ,               /*�����ּ�-��ȭ��ȣ   */
            A.BLD_MNG_NO2,               /*���ּ�-�����ȣ(B)*/
            A.POS_CD2    ,               /*���ּ�-�����ȣ   */
            A.ADDR1_2    ,               /*���ּ�-�ּ�       */
            A.ADDR2_2    ,               /*���ּ�-���ּ�   */
            A.SAFEKEY,                   /*������ȣ            */
            A.BUSL_NO,                   /*����ڹ�ȣ          */
            A.CORP_NO,                   /*���ι�ȣ            */
            A.REP_NM,                    /*��ǥ�ڸ�            */
            A.O_CUSTNM,                  /*����ָ�            */
            A.O_BIRTHDAY,                /*����� ����������� */
            A.O_GENDERCD,                /*����� ����         */
            A.O_LFCD,                    /*����� ���ܱ���     */
            A.O_MOBNO,                   /*����� �޴�����ȣ   */
            A.O_SAFEKEY,                 /*����� ������ȣ     */
            A.C_CUSTNM,                  /*����� ��           */
            A.C_TELNO,                   /*����� ��ȭ��ȣ     */
            A.EMAIL_ADDR,                /*E-Mail�ּ�          */
            A.BUSI_TYPE,                 /*����                */
            A.BUSI_COND,                 /*����                */
            A.TAX_YN,                    /*���λ���� �鼼���� */
            A.KUNNR,                     /*SAP����ȣ         */
            A.CI_CD,                     /*CI                  */
            A.DI_CD,                     /*DI                  */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0101 A
    WHERE   A.CUST_NO = v_Cust_No;

  END p_sRtsd0101;

  /*****************************************************************************
  -- �� ������ �����̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0101 (
    v_Cust_No        IN RTSD0101.CUST_NO%TYPE,        /*����ȣ              */
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
/
