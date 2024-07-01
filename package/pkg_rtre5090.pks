CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE5090 AS
/*******************************************************************************
    NAME        PKG_RTRE5090
    PURPOSE     �湮���˼����� �������� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            �ű��ۼ�
*******************************************************************************/

  /*****************************************************************************
  -- �湮���˼����� �������� Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            �ű��ۼ�
  *****************************************************************************/
  PROCEDURE p_sRtre5090 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE         /*�������            */    
  );

  /*****************************************************************************
   -- �湮���˼����� ���� ����
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            �ű��ۼ�
   *****************************************************************************/
  PROCEDURE p_CreateRtre5090RegularchkComm(  v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE  /* ������� */
                                           , v_Amt_Comm       IN RTRE5090.AMT_COMM%TYPE /*�⺻������ */
                                           , v_Reg_Id         IN RTRE5090.REG_ID%TYPE   /* �۾��� ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_ErrorText      OUT VARCHAR2
                                          );
  
  /*****************************************************************************
  -- �湮���˼����� ����
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            �ű��ۼ�
  *****************************************************************************/
  FUNCTION f_UpdateRtre5090Commamt (
      v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE         /*�������            */
    , v_Std_Ym         IN RTRE5090.STD_YM%TYPE          /*�������س��        */
    , v_Ord_No         IN RTRE5090.ORD_NO%TYPE          /*����ȣ            */
    , v_Amt_Comm       IN RTRE5090.AMT_COMM%TYPE        /*���������          */
    , v_Chg_Job_Seq    IN RTRE5090.CHG_JOB_SEQ%TYPE     /*�����۾�ȸ��        */        
    , v_Reg_Id         IN RTRE5090.REG_ID%TYPE          /*�۾��� ID           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

/*****************************************************************************
  -- NEW �湮���˼����� ���� ����
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            �ű��ۼ�
  *****************************************************************************/
  PROCEDURE p_CreateRtre5090RegularchkNew (
      v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE         /*�������          */
    , v_Reg_Id         IN RTRE5090.REG_ID%TYPE       /*�۾��� ID           */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );

END PKG_RTRE5090;
/
