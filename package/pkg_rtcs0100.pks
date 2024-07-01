CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0100 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0100
   PURPOSE   �����ݴ�� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ݴ�� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0100Count(
    v_Call_No        IN RTCS0100.CALL_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ݻ��� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0100 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day1       IN RTCS0100.JOB_DAY%TYPE,        /*ó������FROM          */
    v_Job_Day2       IN RTCS0100.JOB_DAY%TYPE,        /*ó������TO            */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE      /*��������              */
    );

  /*****************************************************************************
  -- �����ݴ�� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0100 (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*����ȣ              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*ó������              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*�����ID(����)      */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*��������              */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*��������              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*�õ� �Ǽ�             */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Proc_Day       IN RTCS0100.PROC_DAY%TYPE,       /*��������              */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*�����븮��            */
    v_Mat_Cd         IN RTCS0100.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Mat_Nm         IN RTCS0100.MAT_NM%TYPE,         /*��ǰ��                */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Car_No         IN RTCS0100.CAR_NO%TYPE,         /*������ȣ              */
    v_Vkbur          IN RTCS0100.VKBUR%TYPE,          /*����                  */
    v_Vkgrp          IN RTCS0100.VKGRP%TYPE,          /*����                  */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */
    v_Serv_Seq       IN RTCS0100.SERV_SEQ%TYPE,       /*���� ����           */
    v_Proc_In_Cd     IN RTCS0100.PROC_IN_CD%TYPE,     /*���� ó����         */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

    /*****************************************************************************
    -- �����ݴ�� Update
    *****************************************************************************/
  FUNCTION f_UpdateRtcs0100 (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*����ȣ              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*ó������              */
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*����� ID             */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*��������              */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*��������              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �����ݴ�� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0100 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Call_No        IN OUT RTCS0100.CALL_NO%TYPE,    /*����ȣ              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*ó������              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*�����ID(����)      */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*��������              */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*��������              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*�õ� �Ǽ�             */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*����ȣ              */
    v_Proc_Day       IN RTCS0100.PROC_DAY%TYPE,       /*��������              */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*�����븮��            */
    v_Mat_Cd         IN RTCS0100.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Mat_Nm         IN RTCS0100.MAT_NM%TYPE,         /*��ǰ��                */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Car_No         IN RTCS0100.CAR_NO%TYPE,         /*������ȣ              */
    v_Vkbur          IN RTCS0100.VKBUR%TYPE,          /*����                  */
    v_Vkgrp          IN RTCS0100.VKGRP%TYPE,          /*����                  */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */
    v_Serv_Seq       IN RTCS0100.SERV_SEQ%TYPE,       /*���� ����           */
    v_Proc_In_Cd     IN RTCS0100.PROC_IN_CD%TYPE,     /*���� ó����         */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �����ݴ�� - ����ȣ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0100CallNo RETURN NUMBER;

  /*****************************************************************************
  -- �����ݻ�� ��� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0100Regf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day1       IN RTCS0100.JOB_DAY%TYPE,        /*ó������FROM          */
    v_Job_Day2       IN RTCS0100.JOB_DAY%TYPE,        /*ó������TO            */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*����ID              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*����                */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*�����븮��            */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*�޴��ȣ              */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    );

  /*****************************************************************************
  -- �����ݻ�� ��� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0100Ctf (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE           /*����ȣ              */
    );

  /*****************************************************************************
  -- �����ݻ�� ���
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0100Reg (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*����ȣ              */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*�õ��Ǽ�              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ݴ�� ��� ���
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0100reg (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*����ȣ              */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*�õ��Ǽ�              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- �����ݻ�� ���� ó��������ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0100ServiceHistory(
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE,          /*����ȣ              */
    v_Serv_Seq      IN RTCS0100.SERV_SEQ%TYPE         /*���� ����           */
    );


  /*****************************************************************************
  -- ������ ����̷� ��ȸ 
  *****************************************************************************/
  PROCEDURE p_sRtcs0100AdviceHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE          /*����ȣ              */
    );
    
   /*****************************************************************************
  -- ������ �޽����̷� ��ȸ 
  *****************************************************************************/
  PROCEDURE p_sRtcs0100MessageHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Mob_No        IN RTCS0100.MOB_NO%TYPE          /*����ȣ              */
    );    
 
  /*****************************************************************************
  -- ������ In ������� 
  *****************************************************************************/
  PROCEDURE p_sRtcs010SaveAdvice (
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*����/���θ�         */    
    v_Call_No        IN OUT RTCS0100.CALL_NO%TYPE,    /*����ȣ              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*�����ID(����)      */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */    
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_Bonus_Gb       IN VARCHAR2,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );      
    
END Pkg_Rtcs0100;
/
