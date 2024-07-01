CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5040 AS
/*******************************************************************************
   NAME:      Pkg_Rtre5040
   PURPOSE   �Ǹż����� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  �̿���           ä�� ��/�ߺз� �׸� �߰�   
*******************************************************************************/

  /*****************************************************************************
  -- �Ǹż����� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre5040Count(
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,          /*�������            */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE            /*����ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹż����� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre5040 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*�������              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*�Ǹſ���ȣ            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*ä�α���              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*�������׸�            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*���� �Ǹż�����       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*���� ��缳���ݾ�     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*��缳�����ɱݾ�      */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*�̿����              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*��������              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �Ǹż����� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5040 (
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*�������              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*�Ǹſ���ȣ            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*ä�α���              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*�������׸�            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*���� �Ǹż�����       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*���� ��缳���ݾ�     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*��缳�����ɱݾ�      */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*�̿����              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*��������              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹż����� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5040 (
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*�������              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*�Ǹſ���ȣ            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*ä�α���              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*�������׸�            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*���� �Ǹż�����       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*���� ��缳���ݾ�     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*��缳�����ɱݾ�      */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*�̿����              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*��������              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹż����� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5040 (
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*�������              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*����ȣ              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹż����� ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5040 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Slcm_Ym        IN RTRE5040.SLCM_YM%TYPE,        /*�������              */
    v_Ord_No         IN RTRE5040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE5040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_Agent      IN RTRE5040.ORD_AGENT%TYPE,      /*�Ǹſ���ȣ            */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*ä�α���              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*�������׸�            */
    v_Mat_Cd         IN RTRE5040.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Cnt_Cd         IN RTRE5040.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Sslcm_Amt      IN RTRE5040.SSLCM_AMT%TYPE,      /*���� �Ǹż�����       */
    v_Sapfds_Amt     IN RTRE5040.SAPFDS_AMT%TYPE,     /*���� ��缳���ݾ�     */
    v_Slcm_Amt       IN RTRE5040.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfds_Amt      IN RTRE5040.APFDS_AMT%TYPE,      /*��缳�����ɱݾ�      */
    v_Ppob_Yn        IN RTRE5040.PPOB_YN%TYPE,        /*�̿����              */
    v_Proc_Day       IN RTRE5040.PROC_DAY%TYPE,       /*��������              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- �븮�� �Ǹż����� ���� ���� ó��
  *****************************************************************************/
  PROCEDURE p_CreateRtre5040AgencyComm (
    v_Period         IN CHAR,                           /*������              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���¸� �Ǹż����� ���� ���� ó��
  *****************************************************************************/
  PROCEDURE p_CreateRtre5040MallComm (
    v_Period         IN CHAR,                           /*������              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �Ǹ��κ� ������ ���� ���� - �Ǹ��κ� ������ ����� ����ȣ�� ���� �ݾ��� Ȯ���Ͽ� �����ϴ� ���ν�����
  *****************************************************************************/
  PROCEDURE p_UpdateRtre5040AgentAppFix (
    v_Period         IN  CHAR,                         /*������              */
    v_Agency_Cd      IN  RTRE5070.AGENCY_CD%TYPE,      /*�Ǹſ���ȣ          */
    v_Btapfd_Amt     IN  RTRE5070.BTAPFD_AMT%TYPE,     /*����ݼ����ݾ�      */
    v_Reg_Id         IN  RTRE5070.REG_ID%TYPE,         /*����� ID           */
    v_Rtslc_Amt      OUT RTRE5070.RTSLC_AMT%TYPE,      /*�븮���Ǹż�����    */
    v_Ntslc_Amt      OUT RTRE5070.NTSLC_AMT%TYPE,      /*�湮�Ǹż�����      */
    v_Opslc_Amt      OUT RTRE5070.OPSLC_AMT%TYPE,      /*���¸��Ǹż�����    */
    v_Tbslc_Amt      OUT RTRE5070.TBSLC_AMT%TYPE,      /*Ÿ�̾��ũ�Ǹż�����*/
    v_Mfapfd_Amt     OUT RTRE5070.MFAPFD_AMT%TYPE,     /*������ݼ����ݾ�  */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���� ���� ��� ���� ��ȸ - ���� ������ �Ǹż����ῡ ���� �� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre5040AppSaveOrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_YmF       IN RTRE5040.SLCM_YM%TYPE,        /*��ȸ����From          */
    v_Slcm_YmT       IN RTRE5040.SLCM_YM%TYPE,        /*��ȸ����To            */
    v_Agency_Cd      IN RTRE5040.ORD_AGENT%TYPE,      /*��Ż������            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*����� ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    );
    
    PROCEDURE p_CreateRtre5040AgencyComm_1 (
    v_Period         IN CHAR,                           /*������              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtre5040;
/
