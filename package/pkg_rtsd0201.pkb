CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0201 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0201
   PURPOSE   SAFE KEY IR ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- SAFE KEY IR ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0201Count(
    v_Birth_Day      IN RTSD0201.BIRTH_DAY%TYPE,        /*�����������        */
    v_Cust_Nm        IN RTSD0201.CUST_NM%TYPE,          /*����_���θ�       */
    v_Mob_No         IN RTSD0201.MOB_NO%TYPE,           /*�޴�����ȣ          */
    v_Gender_Cd      IN RTSD0201.GENDER_CD%TYPE,        /*����                */
    v_Seq            IN RTSD0201.SEQ%TYPE               /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0201
    WHERE   BIRTH_DAY = v_Birth_Day
    AND     CUST_NM   = v_Cust_Nm
    AND     MOB_NO    = v_Mob_No
    AND     GENDER_CD = v_Gender_Cd
    AND     SEQ       = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0201Count;

  /*****************************************************************************
  -- SAFE KEY IR ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0201 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Birth_Day      IN RTSD0201.BIRTH_DAY%TYPE,      /*�����������          */
    v_Cust_Nm        IN RTSD0201.CUST_NM%TYPE,        /*����_���θ�         */
    v_Mob_No         IN RTSD0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Gender_Cd      IN RTSD0201.GENDER_CD%TYPE,      /*����                  */
    v_Seq            IN RTSD0201.SEQ%TYPE,            /*����                  */
    v_Yn             IN RTSD0201.YN%TYPE,             /*IF ��������           */
    v_Prgm_Cd        IN RTSD0201.PRGM_CD%TYPE,        /*���α׷� �ڵ�         */
    v_I_Nd01_N       IN RTSD0201.I_ND01_N%TYPE,       /*Transaction Code      */
    v_I_Nd02_N       IN RTSD0201.I_ND02_N%TYPE,       /*�����׷��ڵ�          */
    v_I_Nd03_N       IN RTSD0201.I_ND03_N%TYPE,       /*�ŷ������ڵ�          */
    v_I_Nd04_N       IN RTSD0201.I_ND04_N%TYPE,       /*�ŷ������ڵ�          */
    v_I_Nd05_N       IN RTSD0201.I_ND05_N%TYPE,       /*�ۼ��� Flag           */
    v_I_Nd06_N       IN RTSD0201.I_ND06_N%TYPE,       /*�ܸ��ⱸ��            */
    v_I_Nd07_N       IN RTSD0201.I_ND07_N%TYPE,       /*�����ڵ�              */
    v_I_Nd08_N       IN RTSD0201.I_ND08_N%TYPE,       /*User_ID               */
    v_I_Nd09_N       IN RTSD0201.I_ND09_N%TYPE,       /*������� ������ȣ     */
    v_I_Nd10_N       IN RTSD0201.I_ND10_N%TYPE,       /*������� ���۽ð�     */
    v_I_Nd11_N       IN RTSD0201.I_ND11_N%TYPE,       /*Nice ���� ������ȣ    */
    v_I_Nd12_N       IN RTSD0201.I_ND12_N%TYPE,       /*Nice �������۽ð�     */
    v_I_Nd13_N       IN RTSD0201.I_ND13_N%TYPE,       /*����                  */
    v_I_Nd14_N       IN RTSD0201.I_ND14_N%TYPE,       /*��ȸ���� ����         */
    v_I_Nd15_N       IN RTSD0201.I_ND15_N%TYPE,       /*�������              */
    v_I_Nd16_N       IN RTSD0201.I_ND16_N%TYPE,       /*����                  */
    v_I_Nd17_N       IN RTSD0201.I_ND17_N%TYPE,       /*�޴�����ȣ            */
    v_I_Nd18_N       IN RTSD0201.I_ND18_N%TYPE,       /*����                  */
    v_I_Nd19_N       IN RTSD0201.I_ND19_N%TYPE,       /*����                  */
    v_E_Nd01_N       IN RTSD0201.E_ND01_N%TYPE,       /*Transaction Code      */
    v_E_Nd02_N       IN RTSD0201.E_ND02_N%TYPE,       /*�����׷��ڵ�          */
    v_E_Nd03_N       IN RTSD0201.E_ND03_N%TYPE,       /*�ŷ������ڵ�          */
    v_E_Nd04_N       IN RTSD0201.E_ND04_N%TYPE,       /*�ŷ������ڵ�          */
    v_E_Nd05_N       IN RTSD0201.E_ND05_N%TYPE,       /*�ۼ��� Flag           */
    v_E_Nd06_N       IN RTSD0201.E_ND06_N%TYPE,       /*�ܸ��ⱸ��            */
    v_E_Nd07_N       IN RTSD0201.E_ND07_N%TYPE,       /*�����ڵ�              */
    v_E_Nd08_N       IN RTSD0201.E_ND08_N%TYPE,       /*User_ID               */
    v_E_Nd09_N       IN RTSD0201.E_ND09_N%TYPE,       /*������� ������ȣ     */
    v_E_Nd10_N       IN RTSD0201.E_ND10_N%TYPE,       /*������� ���۽ð�     */
    v_E_Nd11_N       IN RTSD0201.E_ND11_N%TYPE,       /*Nice ���� ������ȣ    */
    v_E_Nd12_N       IN RTSD0201.E_ND12_N%TYPE,       /*Nice �������۽ð�     */
    v_E_Nd13_N       IN RTSD0201.E_ND13_N%TYPE,       /*����                  */
    v_E_Nd14_N       IN RTSD0201.E_ND14_N%TYPE,       /*��ȸ���ǻ���          */
    v_E_Nd15_N       IN RTSD0201.E_ND15_N%TYPE,       /*�������              */
    v_E_Nd16_N       IN RTSD0201.E_ND16_N%TYPE,       /*����                  */
    v_E_Nd17_N       IN RTSD0201.E_ND17_N%TYPE,       /*�޴�����ȣ            */
    v_E_Nd18_N       IN RTSD0201.E_ND18_N%TYPE,       /*SAFE_KEY              */
    v_E_Nd19_N       IN RTSD0201.E_ND19_N%TYPE,       /*����                  */
    v_E_Nd20_N       IN RTSD0201.E_ND20_N%TYPE,       /*����                  */
    v_Reg_Id         IN RTSD0201.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.BIRTH_DAY,                 /*�����������        */
            A.CUST_NM,                   /*����_���θ�       */
            A.MOB_NO,                    /*�޴�����ȣ          */
            A.GENDER_CD,                 /*����                */
            A.SEQ,                       /*����                */
            A.YN,                        /*IF ��������         */
            A.PRGM_CD,                   /*���α׷� �ڵ�       */
            A.I_ND01_N,                  /*Transaction Code    */
            A.I_ND02_N,                  /*�����׷��ڵ�        */
            A.I_ND03_N,                  /*�ŷ������ڵ�        */
            A.I_ND04_N,                  /*�ŷ������ڵ�        */
            A.I_ND05_N,                  /*�ۼ��� Flag         */
            A.I_ND06_N,                  /*�ܸ��ⱸ��          */
            A.I_ND07_N,                  /*�����ڵ�            */
            A.I_ND08_N,                  /*User_ID             */
            A.I_ND09_N,                  /*������� ������ȣ   */
            A.I_ND10_N,                  /*������� ���۽ð�   */
            A.I_ND11_N,                  /*Nice ���� ������ȣ  */
            A.I_ND12_N,                  /*Nice �������۽ð�   */
            A.I_ND13_N,                  /*����                */
            A.I_ND14_N,                  /*��ȸ���� ����       */
            A.I_ND15_N,                  /*�������            */
            A.I_ND16_N,                  /*����                */
            A.I_ND17_N,                  /*�޴�����ȣ          */
            A.I_ND18_N,                  /*����                */
            A.I_ND19_N,                  /*����                */
            A.E_ND01_N,                  /*Transaction Code    */
            A.E_ND02_N,                  /*�����׷��ڵ�        */
            A.E_ND03_N,                  /*�ŷ������ڵ�        */
            A.E_ND04_N,                  /*�ŷ������ڵ�        */
            A.E_ND05_N,                  /*�ۼ��� Flag         */
            A.E_ND06_N,                  /*�ܸ��ⱸ��          */
            A.E_ND07_N,                  /*�����ڵ�            */
            A.E_ND08_N,                  /*User_ID             */
            A.E_ND09_N,                  /*������� ������ȣ   */
            A.E_ND10_N,                  /*������� ���۽ð�   */
            A.E_ND11_N,                  /*Nice ���� ������ȣ  */
            A.E_ND12_N,                  /*Nice �������۽ð�   */
            A.E_ND13_N,                  /*����                */
            A.E_ND14_N,                  /*��ȸ���ǻ���        */
            A.E_ND15_N,                  /*�������            */
            A.E_ND16_N,                  /*����                */
            A.E_ND17_N,                  /*�޴�����ȣ          */
            A.E_ND18_N,                  /*SAFE_KEY            */
            A.E_ND19_N,                  /*����                */
            A.E_ND20_N,                  /*����                */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0201 A
    WHERE   A.BIRTH_DAY = DECODE(v_Birth_Day , NULL, A.BIRTH_DAY , v_Birth_Day)
    AND     A.CUST_NM   = DECODE(v_Cust_Nm   , NULL, A.CUST_NM   , v_Cust_Nm)
    AND     A.MOB_NO    = DECODE(v_Mob_No    , NULL, A.MOB_NO    , v_Mob_No)
    AND     A.GENDER_CD = DECODE(v_Gender_Cd , NULL, A.GENDER_CD , v_Gender_Cd)
    AND     A.SEQ       = DECODE(v_Seq       , NULL, A.SEQ       , v_Seq)
    AND     A.YN        = DECODE(v_Yn        , NULL, A.YN        , v_Yn)
    AND     A.PRGM_CD   = DECODE(v_Prgm_Cd   , NULL, A.PRGM_CD   , v_Prgm_Cd)
    AND     A.I_ND01_N  = DECODE(v_I_Nd01_N  , NULL, A.I_ND01_N  , v_I_Nd01_N)
    AND     A.I_ND02_N  = DECODE(v_I_Nd02_N  , NULL, A.I_ND02_N  , v_I_Nd02_N)
    AND     A.I_ND03_N  = DECODE(v_I_Nd03_N  , NULL, A.I_ND03_N  , v_I_Nd03_N)
    AND     A.I_ND04_N  = DECODE(v_I_Nd04_N  , NULL, A.I_ND04_N  , v_I_Nd04_N)
    AND     A.I_ND05_N  = DECODE(v_I_Nd05_N  , NULL, A.I_ND05_N  , v_I_Nd05_N)
    AND     A.I_ND06_N  = DECODE(v_I_Nd06_N  , NULL, A.I_ND06_N  , v_I_Nd06_N)
    AND     A.I_ND07_N  = DECODE(v_I_Nd07_N  , NULL, A.I_ND07_N  , v_I_Nd07_N)
    AND     A.I_ND08_N  = DECODE(v_I_Nd08_N  , NULL, A.I_ND08_N  , v_I_Nd08_N)
    AND     A.I_ND09_N  = DECODE(v_I_Nd09_N  , NULL, A.I_ND09_N  , v_I_Nd09_N)
    AND     A.I_ND10_N  = DECODE(v_I_Nd10_N  , NULL, A.I_ND10_N  , v_I_Nd10_N)
    AND     A.I_ND11_N  = DECODE(v_I_Nd11_N  , NULL, A.I_ND11_N  , v_I_Nd11_N)
    AND     A.I_ND12_N  = DECODE(v_I_Nd12_N  , NULL, A.I_ND12_N  , v_I_Nd12_N)
    AND     A.I_ND13_N  = DECODE(v_I_Nd13_N  , NULL, A.I_ND13_N  , v_I_Nd13_N)
    AND     A.I_ND14_N  = DECODE(v_I_Nd14_N  , NULL, A.I_ND14_N  , v_I_Nd14_N)
    AND     A.I_ND15_N  = DECODE(v_I_Nd15_N  , NULL, A.I_ND15_N  , v_I_Nd15_N)
    AND     A.I_ND16_N  = DECODE(v_I_Nd16_N  , NULL, A.I_ND16_N  , v_I_Nd16_N)
    AND     A.I_ND17_N  = DECODE(v_I_Nd17_N  , NULL, A.I_ND17_N  , v_I_Nd17_N)
    AND     A.I_ND18_N  = DECODE(v_I_Nd18_N  , NULL, A.I_ND18_N  , v_I_Nd18_N)
    AND     A.I_ND19_N  = DECODE(v_I_Nd19_N  , NULL, A.I_ND19_N  , v_I_Nd19_N)
    AND     A.E_ND01_N  = DECODE(v_E_Nd01_N  , NULL, A.E_ND01_N  , v_E_Nd01_N)
    AND     A.E_ND02_N  = DECODE(v_E_Nd02_N  , NULL, A.E_ND02_N  , v_E_Nd02_N)
    AND     A.E_ND03_N  = DECODE(v_E_Nd03_N  , NULL, A.E_ND03_N  , v_E_Nd03_N)
    AND     A.E_ND04_N  = DECODE(v_E_Nd04_N  , NULL, A.E_ND04_N  , v_E_Nd04_N)
    AND     A.E_ND05_N  = DECODE(v_E_Nd05_N  , NULL, A.E_ND05_N  , v_E_Nd05_N)
    AND     A.E_ND06_N  = DECODE(v_E_Nd06_N  , NULL, A.E_ND06_N  , v_E_Nd06_N)
    AND     A.E_ND07_N  = DECODE(v_E_Nd07_N  , NULL, A.E_ND07_N  , v_E_Nd07_N)
    AND     A.E_ND08_N  = DECODE(v_E_Nd08_N  , NULL, A.E_ND08_N  , v_E_Nd08_N)
    AND     A.E_ND09_N  = DECODE(v_E_Nd09_N  , NULL, A.E_ND09_N  , v_E_Nd09_N)
    AND     A.E_ND10_N  = DECODE(v_E_Nd10_N  , NULL, A.E_ND10_N  , v_E_Nd10_N)
    AND     A.E_ND11_N  = DECODE(v_E_Nd11_N  , NULL, A.E_ND11_N  , v_E_Nd11_N)
    AND     A.E_ND12_N  = DECODE(v_E_Nd12_N  , NULL, A.E_ND12_N  , v_E_Nd12_N)
    AND     A.E_ND13_N  = DECODE(v_E_Nd13_N  , NULL, A.E_ND13_N  , v_E_Nd13_N)
    AND     A.E_ND14_N  = DECODE(v_E_Nd14_N  , NULL, A.E_ND14_N  , v_E_Nd14_N)
    AND     A.E_ND15_N  = DECODE(v_E_Nd15_N  , NULL, A.E_ND15_N  , v_E_Nd15_N)
    AND     A.E_ND16_N  = DECODE(v_E_Nd16_N  , NULL, A.E_ND16_N  , v_E_Nd16_N)
    AND     A.E_ND17_N  = DECODE(v_E_Nd17_N  , NULL, A.E_ND17_N  , v_E_Nd17_N)
    AND     A.E_ND18_N  = DECODE(v_E_Nd18_N  , NULL, A.E_ND18_N  , v_E_Nd18_N)
    AND     A.E_ND19_N  = DECODE(v_E_Nd19_N  , NULL, A.E_ND19_N  , v_E_Nd19_N)
    AND     A.E_ND20_N  = DECODE(v_E_Nd20_N  , NULL, A.E_ND20_N  , v_E_Nd20_N)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtsd0201;

  /*****************************************************************************
  -- SAFE KEY IR ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0201 (
    v_Birth_Day      IN RTSD0201.BIRTH_DAY%TYPE,      /*�����������          */
    v_Cust_Nm        IN RTSD0201.CUST_NM%TYPE,        /*����_���θ�         */
    v_Mob_No         IN RTSD0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Gender_Cd      IN RTSD0201.GENDER_CD%TYPE,      /*����                  */
    v_Seq            IN VARCHAR2,                     /*����                  */
    v_Yn             IN RTSD0201.YN%TYPE,             /*IF ��������           */
    v_Prgm_Cd        IN RTSD0201.PRGM_CD%TYPE,        /*���α׷� �ڵ�         */
    v_I_Nd01_N       IN RTSD0201.I_ND01_N%TYPE,       /*Transaction Code      */
    v_I_Nd02_N       IN RTSD0201.I_ND02_N%TYPE,       /*�����׷��ڵ�          */
    v_I_Nd03_N       IN RTSD0201.I_ND03_N%TYPE,       /*�ŷ������ڵ�          */
    v_I_Nd04_N       IN RTSD0201.I_ND04_N%TYPE,       /*�ŷ������ڵ�          */
    v_I_Nd05_N       IN RTSD0201.I_ND05_N%TYPE,       /*�ۼ��� Flag           */
    v_I_Nd06_N       IN RTSD0201.I_ND06_N%TYPE,       /*�ܸ��ⱸ��            */
    v_I_Nd07_N       IN RTSD0201.I_ND07_N%TYPE,       /*�����ڵ�              */
    v_I_Nd08_N       IN RTSD0201.I_ND08_N%TYPE,       /*User_ID               */
    v_I_Nd09_N       IN RTSD0201.I_ND09_N%TYPE,       /*������� ������ȣ     */
    v_I_Nd10_N       IN RTSD0201.I_ND10_N%TYPE,       /*������� ���۽ð�     */
    v_I_Nd11_N       IN RTSD0201.I_ND11_N%TYPE,       /*Nice ���� ������ȣ    */
    v_I_Nd12_N       IN RTSD0201.I_ND12_N%TYPE,       /*Nice �������۽ð�     */
    v_I_Nd13_N       IN RTSD0201.I_ND13_N%TYPE,       /*����                  */
    v_I_Nd14_N       IN RTSD0201.I_ND14_N%TYPE,       /*��ȸ���� ����         */
    v_I_Nd15_N       IN RTSD0201.I_ND15_N%TYPE,       /*�������              */
    v_I_Nd16_N       IN RTSD0201.I_ND16_N%TYPE,       /*����                  */
    v_I_Nd17_N       IN RTSD0201.I_ND17_N%TYPE,       /*�޴�����ȣ            */
    v_I_Nd18_N       IN RTSD0201.I_ND18_N%TYPE,       /*����                  */
    v_I_Nd19_N       IN RTSD0201.I_ND19_N%TYPE,       /*����                  */
    v_E_Nd01_N       IN RTSD0201.E_ND01_N%TYPE,       /*Transaction Code      */
    v_E_Nd02_N       IN RTSD0201.E_ND02_N%TYPE,       /*�����׷��ڵ�          */
    v_E_Nd03_N       IN RTSD0201.E_ND03_N%TYPE,       /*�ŷ������ڵ�          */
    v_E_Nd04_N       IN RTSD0201.E_ND04_N%TYPE,       /*�ŷ������ڵ�          */
    v_E_Nd05_N       IN RTSD0201.E_ND05_N%TYPE,       /*�ۼ��� Flag           */
    v_E_Nd06_N       IN RTSD0201.E_ND06_N%TYPE,       /*�ܸ��ⱸ��            */
    v_E_Nd07_N       IN RTSD0201.E_ND07_N%TYPE,       /*�����ڵ�              */
    v_E_Nd08_N       IN RTSD0201.E_ND08_N%TYPE,       /*User_ID               */
    v_E_Nd09_N       IN RTSD0201.E_ND09_N%TYPE,       /*������� ������ȣ     */
    v_E_Nd10_N       IN RTSD0201.E_ND10_N%TYPE,       /*������� ���۽ð�     */
    v_E_Nd11_N       IN RTSD0201.E_ND11_N%TYPE,       /*Nice ���� ������ȣ    */
    v_E_Nd12_N       IN RTSD0201.E_ND12_N%TYPE,       /*Nice �������۽ð�     */
    v_E_Nd13_N       IN RTSD0201.E_ND13_N%TYPE,       /*����                  */
    v_E_Nd14_N       IN RTSD0201.E_ND14_N%TYPE,       /*��ȸ���ǻ���          */
    v_E_Nd15_N       IN RTSD0201.E_ND15_N%TYPE,       /*�������              */
    v_E_Nd16_N       IN RTSD0201.E_ND16_N%TYPE,       /*����                  */
    v_E_Nd17_N       IN RTSD0201.E_ND17_N%TYPE,       /*�޴�����ȣ            */
    v_E_Nd18_N       IN RTSD0201.E_ND18_N%TYPE,       /*SAFE_KEY              */
    v_E_Nd19_N       IN RTSD0201.E_ND19_N%TYPE,       /*����                  */
    v_E_Nd20_N       IN RTSD0201.E_ND20_N%TYPE,       /*����                  */
    v_Reg_Id         IN RTSD0201.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0201 (
            BIRTH_DAY,
            CUST_NM,
            MOB_NO,
            GENDER_CD,
            SEQ,
            YN,
            PRGM_CD,
            I_ND01_N,
            I_ND02_N,
            I_ND03_N,
            I_ND04_N,
            I_ND05_N,
            I_ND06_N,
            I_ND07_N,
            I_ND08_N,
            I_ND09_N,
            I_ND10_N,
            I_ND11_N,
            I_ND12_N,
            I_ND13_N,
            I_ND14_N,
            I_ND15_N,
            I_ND16_N,
            I_ND17_N,
            I_ND18_N,
            I_ND19_N,
            E_ND01_N,
            E_ND02_N,
            E_ND03_N,
            E_ND04_N,
            E_ND05_N,
            E_ND06_N,
            E_ND07_N,
            E_ND08_N,
            E_ND09_N,
            E_ND10_N,
            E_ND11_N,
            E_ND12_N,
            E_ND13_N,
            E_ND14_N,
            E_ND15_N,
            E_ND16_N,
            E_ND17_N,
            E_ND18_N,
            E_ND19_N,
            E_ND20_N,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Birth_Day,
            v_Cust_Nm,
            v_Mob_No,
            v_Gender_Cd,
            v_Seq,
            v_Yn,
            v_Prgm_Cd,
            v_I_Nd01_N,
            v_I_Nd02_N,
            v_I_Nd03_N,
            v_I_Nd04_N,
            v_I_Nd05_N,
            v_I_Nd06_N,
            v_I_Nd07_N,
            v_I_Nd08_N,
            v_I_Nd09_N,
            v_I_Nd10_N,
            v_I_Nd11_N,
            v_I_Nd12_N,
            v_I_Nd13_N,
            v_I_Nd14_N,
            v_I_Nd15_N,
            v_I_Nd16_N,
            v_I_Nd17_N,
            v_I_Nd18_N,
            v_I_Nd19_N,
            v_E_Nd01_N,
            v_E_Nd02_N,
            v_E_Nd03_N,
            v_E_Nd04_N,
            v_E_Nd05_N,
            v_E_Nd06_N,
            v_E_Nd07_N,
            v_E_Nd08_N,
            v_E_Nd09_N,
            v_E_Nd10_N,
            v_E_Nd11_N,
            v_E_Nd12_N,
            v_E_Nd13_N,
            v_E_Nd14_N,
            v_E_Nd15_N,
            v_E_Nd16_N,
            v_E_Nd17_N,
            v_E_Nd18_N,
            v_E_Nd19_N,
            v_E_Nd20_N,
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

  END f_InsertRtsd0201;

  /*****************************************************************************
  -- SAFE KEY IR ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0201 (
    v_Birth_Day      IN RTSD0201.BIRTH_DAY%TYPE,      /*�����������          */
    v_Cust_Nm        IN RTSD0201.CUST_NM%TYPE,        /*����_���θ�         */
    v_Mob_No         IN RTSD0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Gender_Cd      IN RTSD0201.GENDER_CD%TYPE,      /*����                  */
    v_Seq            IN RTSD0201.SEQ%TYPE,            /*����                  */
    v_Yn             IN RTSD0201.YN%TYPE,             /*IF ��������           */
    v_Prgm_Cd        IN RTSD0201.PRGM_CD%TYPE,        /*���α׷� �ڵ�         */
    v_I_Nd01_N       IN RTSD0201.I_ND01_N%TYPE,       /*Transaction Code      */
    v_I_Nd02_N       IN RTSD0201.I_ND02_N%TYPE,       /*�����׷��ڵ�          */
    v_I_Nd03_N       IN RTSD0201.I_ND03_N%TYPE,       /*�ŷ������ڵ�          */
    v_I_Nd04_N       IN RTSD0201.I_ND04_N%TYPE,       /*�ŷ������ڵ�          */
    v_I_Nd05_N       IN RTSD0201.I_ND05_N%TYPE,       /*�ۼ��� Flag           */
    v_I_Nd06_N       IN RTSD0201.I_ND06_N%TYPE,       /*�ܸ��ⱸ��            */
    v_I_Nd07_N       IN RTSD0201.I_ND07_N%TYPE,       /*�����ڵ�              */
    v_I_Nd08_N       IN RTSD0201.I_ND08_N%TYPE,       /*User_ID               */
    v_I_Nd09_N       IN RTSD0201.I_ND09_N%TYPE,       /*������� ������ȣ     */
    v_I_Nd10_N       IN RTSD0201.I_ND10_N%TYPE,       /*������� ���۽ð�     */
    v_I_Nd11_N       IN RTSD0201.I_ND11_N%TYPE,       /*Nice ���� ������ȣ    */
    v_I_Nd12_N       IN RTSD0201.I_ND12_N%TYPE,       /*Nice �������۽ð�     */
    v_I_Nd13_N       IN RTSD0201.I_ND13_N%TYPE,       /*����                  */
    v_I_Nd14_N       IN RTSD0201.I_ND14_N%TYPE,       /*��ȸ���� ����         */
    v_I_Nd15_N       IN RTSD0201.I_ND15_N%TYPE,       /*�������              */
    v_I_Nd16_N       IN RTSD0201.I_ND16_N%TYPE,       /*����                  */
    v_I_Nd17_N       IN RTSD0201.I_ND17_N%TYPE,       /*�޴�����ȣ            */
    v_I_Nd18_N       IN RTSD0201.I_ND18_N%TYPE,       /*����                  */
    v_I_Nd19_N       IN RTSD0201.I_ND19_N%TYPE,       /*����                  */
    v_E_Nd01_N       IN RTSD0201.E_ND01_N%TYPE,       /*Transaction Code      */
    v_E_Nd02_N       IN RTSD0201.E_ND02_N%TYPE,       /*�����׷��ڵ�          */
    v_E_Nd03_N       IN RTSD0201.E_ND03_N%TYPE,       /*�ŷ������ڵ�          */
    v_E_Nd04_N       IN RTSD0201.E_ND04_N%TYPE,       /*�ŷ������ڵ�          */
    v_E_Nd05_N       IN RTSD0201.E_ND05_N%TYPE,       /*�ۼ��� Flag           */
    v_E_Nd06_N       IN RTSD0201.E_ND06_N%TYPE,       /*�ܸ��ⱸ��            */
    v_E_Nd07_N       IN RTSD0201.E_ND07_N%TYPE,       /*�����ڵ�              */
    v_E_Nd08_N       IN RTSD0201.E_ND08_N%TYPE,       /*User_ID               */
    v_E_Nd09_N       IN RTSD0201.E_ND09_N%TYPE,       /*������� ������ȣ     */
    v_E_Nd10_N       IN RTSD0201.E_ND10_N%TYPE,       /*������� ���۽ð�     */
    v_E_Nd11_N       IN RTSD0201.E_ND11_N%TYPE,       /*Nice ���� ������ȣ    */
    v_E_Nd12_N       IN RTSD0201.E_ND12_N%TYPE,       /*Nice �������۽ð�     */
    v_E_Nd13_N       IN RTSD0201.E_ND13_N%TYPE,       /*����                  */
    v_E_Nd14_N       IN RTSD0201.E_ND14_N%TYPE,       /*��ȸ���ǻ���          */
    v_E_Nd15_N       IN RTSD0201.E_ND15_N%TYPE,       /*�������              */
    v_E_Nd16_N       IN RTSD0201.E_ND16_N%TYPE,       /*����                  */
    v_E_Nd17_N       IN RTSD0201.E_ND17_N%TYPE,       /*�޴�����ȣ            */
    v_E_Nd18_N       IN RTSD0201.E_ND18_N%TYPE,       /*SAFE_KEY              */
    v_E_Nd19_N       IN RTSD0201.E_ND19_N%TYPE,       /*����                  */
    v_E_Nd20_N       IN RTSD0201.E_ND20_N%TYPE,       /*����                  */
    v_Reg_Id         IN RTSD0201.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0201
    SET    YN        = v_Yn,
           PRGM_CD   = v_Prgm_Cd,
           I_ND01_N  = v_I_Nd01_N,
           I_ND02_N  = v_I_Nd02_N,
           I_ND03_N  = v_I_Nd03_N,
           I_ND04_N  = v_I_Nd04_N,
           I_ND05_N  = v_I_Nd05_N,
           I_ND06_N  = v_I_Nd06_N,
           I_ND07_N  = v_I_Nd07_N,
           I_ND08_N  = v_I_Nd08_N,
           I_ND09_N  = v_I_Nd09_N,
           I_ND10_N  = v_I_Nd10_N,
           I_ND11_N  = v_I_Nd11_N,
           I_ND12_N  = v_I_Nd12_N,
           I_ND13_N  = v_I_Nd13_N,
           I_ND14_N  = v_I_Nd14_N,
           I_ND15_N  = v_I_Nd15_N,
           I_ND16_N  = v_I_Nd16_N,
           I_ND17_N  = v_I_Nd17_N,
           I_ND18_N  = v_I_Nd18_N,
           I_ND19_N  = v_I_Nd19_N,
           E_ND01_N  = v_E_Nd01_N,
           E_ND02_N  = v_E_Nd02_N,
           E_ND03_N  = v_E_Nd03_N,
           E_ND04_N  = v_E_Nd04_N,
           E_ND05_N  = v_E_Nd05_N,
           E_ND06_N  = v_E_Nd06_N,
           E_ND07_N  = v_E_Nd07_N,
           E_ND08_N  = v_E_Nd08_N,
           E_ND09_N  = v_E_Nd09_N,
           E_ND10_N  = v_E_Nd10_N,
           E_ND11_N  = v_E_Nd11_N,
           E_ND12_N  = v_E_Nd12_N,
           E_ND13_N  = v_E_Nd13_N,
           E_ND14_N  = v_E_Nd14_N,
           E_ND15_N  = v_E_Nd15_N,
           E_ND16_N  = v_E_Nd16_N,
           E_ND17_N  = v_E_Nd17_N,
           E_ND18_N  = v_E_Nd18_N,
           E_ND19_N  = v_E_Nd19_N,
           E_ND20_N  = v_E_Nd20_N,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  BIRTH_DAY = v_Birth_Day
    AND    CUST_NM   = v_Cust_Nm
    AND    MOB_NO    = v_Mob_No
    AND    GENDER_CD = v_Gender_Cd
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0201;

  /*****************************************************************************
  -- SAFE KEY IR ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0201 (
    v_Birth_Day      IN RTSD0201.BIRTH_DAY%TYPE,      /*�����������          */
    v_Cust_Nm        IN RTSD0201.CUST_NM%TYPE,        /*����_���θ�         */
    v_Mob_No         IN RTSD0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Gender_Cd      IN RTSD0201.GENDER_CD%TYPE,      /*����                  */
    v_Seq            IN RTSD0201.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0201.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0201
    WHERE  BIRTH_DAY = v_Birth_Day
    AND    CUST_NM   = v_Cust_Nm
    AND    MOB_NO    = v_Mob_No
    AND    GENDER_CD = v_Gender_Cd
    AND    SEQ       = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0201.f_DeleteRtsd0201(2)', '�����������', v_Birth_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0201.f_DeleteRtsd0201(2)', '����_���θ�', v_Cust_Nm);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0201.f_DeleteRtsd0201(2)', '�޴�����ȣ', v_Mob_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0201.f_DeleteRtsd0201(2)', '����', v_Gender_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0201.f_DeleteRtsd0201(2)', '����', v_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0201.f_DeleteRtsd0201(2)', '����� ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0201;

  /*****************************************************************************
  -- SAFE KEY IR ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0201 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Birth_Day      IN RTSD0201.BIRTH_DAY%TYPE,      /*�����������          */
    v_Cust_Nm        IN RTSD0201.CUST_NM%TYPE,        /*����_���θ�         */
    v_Mob_No         IN RTSD0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Gender_Cd      IN RTSD0201.GENDER_CD%TYPE,      /*����                  */
    v_Seq            IN OUT varchar2,        /*����                  */
    v_Yn             IN RTSD0201.YN%TYPE,             /*IF ��������           */
    v_Prgm_Cd        IN RTSD0201.PRGM_CD%TYPE,        /*���α׷� �ڵ�         */
    v_I_Nd01_N       IN RTSD0201.I_ND01_N%TYPE,       /*Transaction Code      */
    v_I_Nd02_N       IN RTSD0201.I_ND02_N%TYPE,       /*�����׷��ڵ�          */
    v_I_Nd03_N       IN RTSD0201.I_ND03_N%TYPE,       /*�ŷ������ڵ�          */
    v_I_Nd04_N       IN RTSD0201.I_ND04_N%TYPE,       /*�ŷ������ڵ�          */
    v_I_Nd05_N       IN RTSD0201.I_ND05_N%TYPE,       /*�ۼ��� Flag           */
    v_I_Nd06_N       IN RTSD0201.I_ND06_N%TYPE,       /*�ܸ��ⱸ��            */
    v_I_Nd07_N       IN RTSD0201.I_ND07_N%TYPE,       /*�����ڵ�              */
    v_I_Nd08_N       IN RTSD0201.I_ND08_N%TYPE,       /*User_ID               */
    v_I_Nd09_N       IN RTSD0201.I_ND09_N%TYPE,       /*������� ������ȣ     */
    v_I_Nd10_N       IN RTSD0201.I_ND10_N%TYPE,       /*������� ���۽ð�     */
    v_I_Nd11_N       IN RTSD0201.I_ND11_N%TYPE,       /*Nice ���� ������ȣ    */
    v_I_Nd12_N       IN RTSD0201.I_ND12_N%TYPE,       /*Nice �������۽ð�     */
    v_I_Nd13_N       IN RTSD0201.I_ND13_N%TYPE,       /*����                  */
    v_I_Nd14_N       IN RTSD0201.I_ND14_N%TYPE,       /*��ȸ���� ����         */
    v_I_Nd15_N       IN RTSD0201.I_ND15_N%TYPE,       /*�������              */
    v_I_Nd16_N       IN RTSD0201.I_ND16_N%TYPE,       /*����                  */
    v_I_Nd17_N       IN RTSD0201.I_ND17_N%TYPE,       /*�޴�����ȣ            */
    v_I_Nd18_N       IN RTSD0201.I_ND18_N%TYPE,       /*����                  */
    v_I_Nd19_N       IN RTSD0201.I_ND19_N%TYPE,       /*����                  */
    v_E_Nd01_N       IN RTSD0201.E_ND01_N%TYPE,       /*Transaction Code      */
    v_E_Nd02_N       IN RTSD0201.E_ND02_N%TYPE,       /*�����׷��ڵ�          */
    v_E_Nd03_N       IN RTSD0201.E_ND03_N%TYPE,       /*�ŷ������ڵ�          */
    v_E_Nd04_N       IN RTSD0201.E_ND04_N%TYPE,       /*�ŷ������ڵ�          */
    v_E_Nd05_N       IN RTSD0201.E_ND05_N%TYPE,       /*�ۼ��� Flag           */
    v_E_Nd06_N       IN RTSD0201.E_ND06_N%TYPE,       /*�ܸ��ⱸ��            */
    v_E_Nd07_N       IN RTSD0201.E_ND07_N%TYPE,       /*�����ڵ�              */
    v_E_Nd08_N       IN RTSD0201.E_ND08_N%TYPE,       /*User_ID               */
    v_E_Nd09_N       IN RTSD0201.E_ND09_N%TYPE,       /*������� ������ȣ     */
    v_E_Nd10_N       IN RTSD0201.E_ND10_N%TYPE,       /*������� ���۽ð�     */
    v_E_Nd11_N       IN RTSD0201.E_ND11_N%TYPE,       /*Nice ���� ������ȣ    */
    v_E_Nd12_N       IN RTSD0201.E_ND12_N%TYPE,       /*Nice �������۽ð�     */
    v_E_Nd13_N       IN RTSD0201.E_ND13_N%TYPE,       /*����                  */
    v_E_Nd14_N       IN RTSD0201.E_ND14_N%TYPE,       /*��ȸ���ǻ���          */
    v_E_Nd15_N       IN RTSD0201.E_ND15_N%TYPE,       /*�������              */
    v_E_Nd16_N       IN RTSD0201.E_ND16_N%TYPE,       /*����                  */
    v_E_Nd17_N       IN RTSD0201.E_ND17_N%TYPE,       /*�޴�����ȣ            */
    v_E_Nd18_N       IN RTSD0201.E_ND18_N%TYPE,       /*SAFE_KEY              */
    v_E_Nd19_N       IN RTSD0201.E_ND19_N%TYPE,       /*����                  */
    v_E_Nd20_N       IN RTSD0201.E_ND20_N%TYPE,       /*����                  */
    v_Reg_Id         IN RTSD0201.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:�����������, ����_���θ�, �޴�����ȣ, ����� ID
    IF TRIM(v_Birth_Day) IS NULL THEN
        v_Return_Message := '�����������('||v_Birth_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm) IS NULL THEN
        v_Return_Message := '����_���θ�('||v_Cust_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_No) IS NULL THEN
        v_Return_Message := '�޴�����ȣ('||v_Mob_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Gender_Cd) IS NULL THEN
        v_Return_Message := '����('||v_Gender_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        v_Seq := f_sRtsd0201Seq(v_Birth_Day, v_Cust_Nm, v_Mob_No, v_Gender_Cd);

        IF 0 != f_InsertRtsd0201(v_Birth_Day, v_Cust_Nm, v_Mob_No, v_Gender_Cd,
                                 v_Seq, v_Yn, v_Prgm_Cd, v_I_Nd01_N, v_I_Nd02_N,
                                 v_I_Nd03_N, v_I_Nd04_N, v_I_Nd05_N, v_I_Nd06_N,
                                 v_I_Nd07_N, v_I_Nd08_N, v_I_Nd09_N, v_I_Nd10_N,
                                 v_I_Nd11_N, v_I_Nd12_N, v_I_Nd13_N, v_I_Nd14_N,
                                 v_I_Nd15_N, v_I_Nd16_N, v_I_Nd17_N, v_I_Nd18_N,
                                 v_I_Nd19_N, v_E_Nd01_N, v_E_Nd02_N, v_E_Nd03_N,
                                 v_E_Nd04_N, v_E_Nd05_N, v_E_Nd06_N, v_E_Nd07_N,
                                 v_E_Nd08_N, v_E_Nd09_N, v_E_Nd10_N, v_E_Nd11_N,
                                 v_E_Nd12_N, v_E_Nd13_N, v_E_Nd14_N, v_E_Nd15_N,
                                 v_E_Nd16_N, v_E_Nd17_N, v_E_Nd18_N, v_E_Nd19_N,
                                 v_E_Nd20_N, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'SAFE KEY IR ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtsd0201Count(v_Birth_Day, v_Cust_Nm, v_Mob_No, v_Gender_Cd,v_Seq) THEN
            v_Return_Message := '��ϵ� �����Ͱ� �������� �������� ����/���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0201(v_Birth_Day, v_Cust_Nm, v_Mob_No, v_Gender_Cd,
                                     v_Seq, v_Yn, v_Prgm_Cd, v_I_Nd01_N, v_I_Nd02_N,
                                     v_I_Nd03_N, v_I_Nd04_N, v_I_Nd05_N, v_I_Nd06_N,
                                     v_I_Nd07_N, v_I_Nd08_N, v_I_Nd09_N, v_I_Nd10_N,
                                     v_I_Nd11_N, v_I_Nd12_N, v_I_Nd13_N, v_I_Nd14_N,
                                     v_I_Nd15_N, v_I_Nd16_N, v_I_Nd17_N, v_I_Nd18_N,
                                     v_I_Nd19_N, v_E_Nd01_N, v_E_Nd02_N, v_E_Nd03_N,
                                     v_E_Nd04_N, v_E_Nd05_N, v_E_Nd06_N, v_E_Nd07_N,
                                     v_E_Nd08_N, v_E_Nd09_N, v_E_Nd10_N, v_E_Nd11_N,
                                     v_E_Nd12_N, v_E_Nd13_N, v_E_Nd14_N, v_E_Nd15_N,
                                     v_E_Nd16_N, v_E_Nd17_N, v_E_Nd18_N, v_E_Nd19_N,
                                     v_E_Nd20_N, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'SAFE KEY IR ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0201(v_Birth_Day, v_Cust_Nm, v_Mob_No, v_Gender_Cd,
                                     v_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'SAFE KEY IR ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0201.p_IUDRtsd0201(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0201.p_IUDRtsd0201(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0201;

  /*****************************************************************************
  -- SAFE KEY IR ���� - ���� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0201Seq(
    v_Birth_Day      IN RTSD0201.BIRTH_DAY%TYPE,        /*�����������        */
    v_Cust_Nm        IN RTSD0201.CUST_NM%TYPE,          /*����_���θ�       */
    v_Mob_No         IN RTSD0201.MOB_NO%TYPE,           /*�޴�����ȣ          */
    v_Gender_Cd      IN RTSD0201.GENDER_CD%TYPE         /*����                */
    ) RETURN NUMBER IS
    v_Seq   RTSD0201.SEQ%TYPE DEFAULT NULL;             /*����                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTSD0201
                 WHERE   BIRTH_DAY = v_Birth_Day
                 AND     CUST_NM   = v_Cust_Nm
                 AND     MOB_NO    = v_Mob_No
                 AND     GENDER_CD = v_Gender_Cd)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0201Seq;
  
END Pkg_Rtsd0201;
/
