CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0012 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0012
   PURPOSE   �����̾����� ����(���μ���) ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
   1.1        2018-02-19  wjim             [20180212_01] ������ �����̾� ���� ����
*******************************************************************************/

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Count
  *****************************************************************************/
  FUNCTION f_sRtsd0012Count(
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,            /*�����̾�����      */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,          /*�󼼼���          */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE            /*Ÿ�̾��          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0012 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����̾����� ����(���μ���) ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0012 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- Ư�� �����̾� ���񽺿� �� ���� ��ȸ
      
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-02-21  wjim             [20180212_01] �ű� ���� 
  *****************************************************************************/
  PROCEDURE p_sRtsd0012_ByPrmSvc (
      Ref_Cursor     IN OUT SYS_REFCURSOR
    , v_Ps_Cd        IN RTSD0012.PS_CD%TYPE           /*�����ڵ�            */
    , v_Period_Cd    IN RTSD0012.PERIOD_CD%TYPE       /*�Ⱓ�ڵ�(S021)        */
    , v_Cnt_Cd       IN RTSD0012.CNT_CD%TYPE          /*����(S022)            */
  );    
      
  /*****************************************************************************
  -- ���� ����˾�
  *****************************************************************************/
  PROCEDURE p_sRtsd0012_srvcPopup (
      Ref_Cursor           IN OUT SYS_REFCURSOR
  );

END Pkg_Rtsd0012;
/
