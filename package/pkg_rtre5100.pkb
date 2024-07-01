CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE5100 AS
/*******************************************************************************
    NAME        PKG_RTRE5100
    PURPOSE     �湮���˼����� ���� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-25  wjim            [20170519_01] �ű��ۼ�
*******************************************************************************/

  /*****************************************************************************
  -- �۾�ȸ�� ä��
  *****************************************************************************/
  FUNCTION f_sRtre5100JobSeq (
    v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE           /*�������            */
  ) RETURN NUMBER IS
  
    ln_Job_Seq RTRE5100.JOB_SEQ%TYPE DEFAULT NULL;      /*�۾�ȸ��            */
    
  BEGIN

    SELECT  NVL((   
                    SELECT  MAX(JOB_SEQ)
                      FROM  RTRE5100
                     WHERE  SLCM_YM  = v_Slcm_Ym
                 ) + 1, 1) AS JOB_SEQ
      INTO  ln_Job_Seq
      FROM  DUAL;

    RETURN ln_Job_Seq;

  EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre5100JobSeq;

  /*****************************************************************************
  -- �湮���˼����� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5100 (
      v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*�������            */
    , v_Job_Seq        IN RTRE5100.JOB_SEQ%TYPE         /*�۾�ȸ��            */
    , v_Std_Ym         IN RTRE5100.STD_YM%TYPE          /*�������س��        */
    , v_Ord_No         IN RTRE5100.ORD_NO%TYPE          /*����ȣ            */
    , v_Amt_Comm       IN RTRE5100.AMT_COMM%TYPE        /*���������          */    
    , v_Reg_Id         IN RTRE5100.REG_ID%TYPE          /*�۾��� ID           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    INSERT INTO RTRE5100 (
          SLCM_YM
        , JOB_SEQ
        , STD_YM
        , ORD_NO
        , AMT_COMM
        , REG_ID        
        , REG_DT
        , CHG_ID
        , CHG_DT              
    ) VALUES (
          v_Slcm_Ym
        , v_Job_Seq
        , v_Std_Ym
        , v_Ord_No
        , v_Amt_Comm        
        , v_Reg_Id
        , SYSDATE
        , v_Reg_Id
        , SYSDATE       
    );

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre5100;
  
  /*****************************************************************************
  -- �湮���˼����� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5100 (
      v_Comm_Dvsn      IN CHAR                          /*ó������(I,U,D)     */
    , v_Slcm_Ym        IN RTRE5100.SLCM_YM%TYPE         /*�������            */
    , v_Job_Seq        IN RTRE5100.JOB_SEQ%TYPE         /*�۾�ȸ��            */
    , v_Std_Ym         IN RTRE5100.STD_YM%TYPE          /*�������س��        */
    , v_Ord_No         IN RTRE5100.ORD_NO%TYPE          /*����ȣ            */
    , v_Amt_Comm       IN RTRE5100.AMT_COMM%TYPE        /*���������          */    
    , v_Reg_Id         IN RTRE5100.REG_ID%TYPE          /*�۾��� ID           */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    v_Chk   number;
    e_Error EXCEPTION;
    
  BEGIN

    -- �ʼ��� Ȯ��   
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '�����ID('||v_Reg_Id||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    /*
     * ��� ���񽺼����� ���� ���࿩�� Ȯ��
     */
    SELECT  COUNT(*)
      INTO  v_Chk
      FROM  RTRE5060
     WHERE  SLCM_YM = v_Slcm_Ym;
    
    IF v_Chk > 0 THEN
        v_Return_Message := '�ش��('||v_Slcm_Ym||') ���񽺼����� ���������۾��� �Ϸ�Ǿ� ó���� �Ұ��մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN        
        
        -- �湮���˼����� ���� ���
        IF 0 != f_InsertRtre5100 (
              v_Slcm_Ym
            , v_Job_Seq
            , v_Std_Ym
            , v_Ord_No
            , v_Amt_Comm            
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '�湮���˼����� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        -- �湮���˼����� ����
        IF 0 != PKG_RTRE5090.f_UpdateRtre5090Commamt (
              v_Slcm_Ym
            , v_Std_Ym
            , v_Ord_No
            , v_Amt_Comm
            , v_Job_Seq
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '�湮���˼����� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;    

    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText      := '';

  EXCEPTION
    WHEN e_Error THEN
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5100.p_IUDRtre5100(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5100.p_IUDRtre5100(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5100;

END PKG_RTRE5100;
/
