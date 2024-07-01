CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5080 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5080
   PURPOSE   ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-24  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre5080Count(
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,        /*��Ż������          */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,         /*����ó������      */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE          /*���ݼ���          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre5080 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*���ݱ���            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*���ݹ߻��ݾ�        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*���������ݾ�        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*����ó�� ����       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*���ݱ���            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*���ݹ߻��ݾ�        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*���������ݾ�        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*����ó�� ����       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*���ݱ���            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*���ݹ߻��ݾ�        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*���������ݾ�        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*����ó�� ����       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5080 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*���ݱ���            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*���ݹ߻��ݾ�        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*���������ݾ�        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*����ó�� ����       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���� ���� ó��
  *****************************************************************************/
  PROCEDURE p_CreateRtre5080Allowance (
    v_Period         IN CHAR,                           /*������              */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �Ǹ��κ� ���� ��Ȳ - �Ǹ��κ� ���� �ܾ��� ��ȸ�ϴ� ���
  *****************************************************************************/
  PROCEDURE p_sRtre5080AgencyAppStatus (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    );


  /*****************************************************************************
  -- �Ǹ��κ� ���� ��Ȳ - ���� �߻�/���� ���� ����
  *****************************************************************************/
  PROCEDURE p_sRtre5080AgencyAppList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE       /*��Ż������            */
    );
        
END Pkg_Rtre5080;
/
