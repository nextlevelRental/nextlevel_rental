CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE0150 AS
/*******************************************************************************
    NAME        PKG_RTRE0150
    PURPOSE     ���� ���޳���

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-11-17  wjim            [20171117_02] �ű� ����
*******************************************************************************/
  /*****************************************************************************
  -- ���� ���޳��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0150 (
      Ref_Cursor        IN OUT SYS_REFCURSOR    
    , v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*��ϳ��               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*��ϼ���               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*�븮���ڵ�             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*��������               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*���ޱݾ�               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*���޻���               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*��뿩��               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*�����ID               */
    , v_LOGIN_ID        IN VARCHAR2                  /* �α���ID: �����׸� ���� ���� */
    , v_LOGIN_GRP       IN VARCHAR2                  /* �α��� ����� �׷� */
  );
  
  /*****************************************************************************
  -- ���� ���޳��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0150 (    
      v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*��ϳ��               */  
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*�븮���ڵ�             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*��������               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*���ޱݾ�               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*���޻���               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*��뿩��               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*�����ID               */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���޳��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0150 (
      v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*��ϳ��               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*��ϼ���               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*�븮���ڵ�             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*��������               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*���ޱݾ�               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*���޻���               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*��뿩��               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*�����ID               */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ���� ���޳��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0150 (
      v_Comm_Dvsn       IN CHAR                      /* ó������(I,U,D)       */
    , v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*��ϳ��               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*��ϼ���               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*�븮���ڵ�             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*��������               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*���ޱݾ�               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*���޻���               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*��뿩��               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*�����ID               */     
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
        
END PKG_RTRE0150;
/
