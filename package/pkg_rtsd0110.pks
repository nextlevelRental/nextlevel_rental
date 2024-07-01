CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0110 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0110
   PURPOSE   �������� �̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �������� �̷� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0110Count(
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,          /*����ȣ            */
    v_Seq            IN RTSD0110.SEQ%TYPE               /*����                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0110 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Cert_FDay      IN RTSD0110.CERT_DAY%TYPE,       /*��������FROM          */
    v_Cert_TDay      IN RTSD0110.CERT_DAY%TYPE        /*��������TO            */
    );

  /*****************************************************************************
  -- �������� �̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*����                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*��������              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*�����������          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*��������              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �̷� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*����                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*��������              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*�����������          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*��������              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �̷� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0110 (
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Seq            IN RTSD0110.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� �̷� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0110 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Seq            IN OUT RTSD0110.SEQ%TYPE,        /*����                  */
    v_Cert_Day       IN RTSD0110.CERT_DAY%TYPE,       /*��������              */
    v_Safekey        IN RTSD0110.SAFEKEY%TYPE,        /*������ȣ              */
    v_Cert_Cd        IN RTSD0110.CERT_CD%TYPE,        /*�����������          */
    v_Cert_Yn        IN RTSD0110.CERT_YN%TYPE,        /*��������              */
    v_Mob_No         IN RTSD0110.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Mob_Firm       IN RTSD0110.MOB_FIRM%TYPE,       /*��Ż�                */
    v_Reg_Id         IN RTSD0110.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �������� �̷� - ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0110Seq(
    v_Cust_No        IN RTSD0110.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER;

 /*****************************************************************************
  -- �������� �̷� Select Max Seq
  *****************************************************************************/
  PROCEDURE p_sRtsd0110_MaxSeq (
  Ref_Cursor       IN OUT SYS_REFCURSOR,
  v_Cust_No        IN RTSD0110.CUST_NO%TYPE           /*����ȣ              */
  );
  
END Pkg_Rtsd0110;
/
