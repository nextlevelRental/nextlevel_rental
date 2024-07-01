CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0012 AS
/*******************************************************************************
    NAME        Pkg_Rtcs0012
    PURPOSE     �湮���� �������� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-03-27  wjim            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �湮���� �������� Select
  *****************************************************************************/
  PROCEDURE p_sRTCS0012 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE           /* ����ȣ         */
  );
  
  /*****************************************************************************
  -- �湮���� �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRTCS0012 (
      v_Std_Ym          IN RTCS0012.STD_YM%TYPE     /* ���س��   */
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE     /* ����ȣ   */
    , v_Equ_No          IN RTCS0012.EQU_NO%TYPE     /* �����ȣ   */
    , v_Job_Seq         IN RTCS0012.JOB_SEQ%TYPE    /* �۾�����   */
    , v_Seq             IN RTCS0012.SEQ%TYPE        /* �������   */
    , v_Call_Day        IN RTCS0012.CALL_DAY%TYPE   /* �������   */
    , v_Call_Tm         IN RTCS0012.CALL_TM%TYPE    /* ���ð�   */
    , v_Call_Dtl        IN RTCS0012.CALL_DTL%TYPE   /* ��㳻��   */ 
    , v_Reg_Id          IN RTCS0012.REG_ID%TYPE     /* �����ID   */
    , v_Recall_Day      IN RTCS0012.RECALL_DAY%TYPE /* ���������� */
    , v_Recall_Tm       IN RTCS0012.RECALL_TM%TYPE  /* �����ýð� */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCS0012 (
      v_Std_Ym          IN RTCS0012.STD_YM%TYPE     /* ���س��   */
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE     /* ����ȣ   */
    , v_Equ_No          IN RTCS0012.EQU_NO%TYPE     /* �����ȣ   */
    , v_Job_Seq         IN RTCS0012.JOB_SEQ%TYPE    /* �۾�����   */
    , v_Seq             IN RTCS0012.SEQ%TYPE        /* �������   */
    , v_Call_Seq        IN RTCS0012.CALL_SEQ%TYPE   /* ������   */
    , v_Call_Day        IN RTCS0012.CALL_DAY%TYPE   /* �������   */
    , v_Call_Tm         IN RTCS0012.CALL_TM%TYPE    /* ���ð�   */
    , v_Call_Dtl        IN RTCS0012.CALL_DTL%TYPE   /* ��㳻��   */ 
    , v_Reg_Id          IN RTCS0012.REG_ID%TYPE     /* �����ID   */
    , v_Recall_Day      IN RTCS0012.RECALL_DAY%TYPE /* ���������� */
    , v_Recall_Tm       IN RTCS0012.RECALL_TM%TYPE  /* �����ýð� */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �湮���� �������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0012 (
      v_Comm_Dvsn       IN CHAR                     /* ó������(I,U,D) */
    , v_Std_Ym          IN RTCS0012.STD_YM%TYPE     /* ���س��        */
    , v_Ord_No          IN RTCS0012.ORD_NO%TYPE     /* ����ȣ        */
    , v_Equ_No          IN RTCS0012.EQU_NO%TYPE     /* �����ȣ        */
    , v_Job_Seq         IN RTCS0012.JOB_SEQ%TYPE    /* �۾�����        */
    , v_Seq             IN RTCS0012.SEQ%TYPE        /* �������        */
    , v_Call_Seq        IN RTCS0012.CALL_SEQ%TYPE   /* ������        */
    , v_Call_Day        IN RTCS0012.CALL_DAY%TYPE   /* �������        */
    , v_Call_Tm         IN RTCS0012.CALL_TM%TYPE    /* ���ð�        */
    , v_Call_Dtl        IN RTCS0012.CALL_DTL%TYPE   /* ��㳻��        */   
    , v_Reg_Id          IN RTCS0012.REG_ID%TYPE     /* �����ID        */
    , v_Recall_Day      IN RTCS0012.RECALL_DAY%TYPE /* ����������      */
    , v_Recall_Tm       IN RTCS0012.RECALL_TM%TYPE  /* �����ýð�      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );  
        
END Pkg_Rtcs0012;
/
