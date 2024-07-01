CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0201 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0201
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
    ) RETURN NUMBER;

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
    );

  /*****************************************************************************
  -- SAFE KEY IR ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0201 (
    v_Birth_Day      IN RTSD0201.BIRTH_DAY%TYPE,      /*�����������          */
    v_Cust_Nm        IN RTSD0201.CUST_NM%TYPE,        /*����_���θ�         */
    v_Mob_No         IN RTSD0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Gender_Cd      IN RTSD0201.GENDER_CD%TYPE,      /*����                  */
    v_Seq            IN VARCHAR2,            /*����                  */
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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

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
    );


  /*****************************************************************************
  -- SAFE KEY IR ���� - ���� ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0201Seq(
    v_Birth_Day      IN RTSD0201.BIRTH_DAY%TYPE,        /*�����������        */
    v_Cust_Nm        IN RTSD0201.CUST_NM%TYPE,          /*����_���θ�       */
    v_Mob_No         IN RTSD0201.MOB_NO%TYPE,           /*�޴�����ȣ          */
    v_Gender_Cd      IN RTSD0201.GENDER_CD%TYPE         /*����                */
    ) RETURN NUMBER;

END Pkg_Rtsd0201;
/
