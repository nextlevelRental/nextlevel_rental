CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0015 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0015
   PURPOSE   WINTER ���μ���(����,��ü) ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-28  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0015Count(
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,            /*�����̾�����      */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,          /*�󼼼���          */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE            /*Ÿ�̾��          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0015 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0015 (
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0015 (
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0015 (
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0015 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtsd0015;
/
