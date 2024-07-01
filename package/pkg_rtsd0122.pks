CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0122 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0122
    PURPOSE     ����� ������� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2016-07-28  wjim            1. Created this package body.
    1.1     2016-09-20  wjim            ����������,�ð� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- ����� ������� Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0122 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE      /* ������ȣ         */
  );
  
  /*****************************************************************************
  -- ����� ������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0122 (
      v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* ������ȣ */
    , v_Call_Day        IN RTSD0122.CALL_DAY%TYPE   /* �������   */
    , v_Call_Tm         IN RTSD0122.CALL_TM%TYPE    /* ���ð�   */
    , v_Call_Dtl        IN RTSD0122.CALL_DTL%TYPE   /* ��㳻��   */ 
    , v_Reg_Id          IN RTSD0122.REG_ID%TYPE     /* �����ID   */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE /* ���������� */
    , v_Recall_Tm       IN RTSD0122.RECALL_TM%TYPE  /* �����ýð� */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- ����� ������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0122 (
      v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* ������ȣ */      
    , v_Call_Seq        IN RTSD0122.CALL_SEQ%TYPE   /* ������   */
    , v_Call_Day        IN RTSD0122.CALL_DAY%TYPE   /* �������   */
    , v_Call_Tm         IN RTSD0122.CALL_TM%TYPE    /* ���ð�   */
    , v_Call_Dtl        IN RTSD0122.CALL_DTL%TYPE   /* ��㳻��   */ 
    , v_Reg_Id          IN RTSD0122.REG_ID%TYPE     /* �����ID   */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE /* ���������� */
    , v_Recall_Tm       IN RTSD0122.RECALL_TM%TYPE  /* �����ýð� */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ����� ������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0122 (
      v_Comm_Dvsn       IN CHAR                     /* ó������(I,U,D) */
    , v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* ������ȣ      */
    , v_Call_Seq        IN RTSD0122.CALL_SEQ%TYPE   /* ������        */
    , v_Call_Day        IN RTSD0122.CALL_DAY%TYPE   /* �������        */
    , v_Call_Tm         IN RTSD0122.CALL_TM%TYPE    /* ���ð�        */
    , v_Call_Dtl        IN RTSD0122.CALL_DTL%TYPE   /* ��㳻��        */   
    , v_Reg_Id          IN RTSD0122.REG_ID%TYPE     /* �����ID        */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE /* ����������      */
    , v_Recall_Tm       IN RTSD0122.RECALL_TM%TYPE  /* �����ýð�      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �緻Ż�����  Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0121Rental (
    v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* ������ȣ      */
    ) RETURN NUMBER;
            
END Pkg_Rtsd0122;
/
