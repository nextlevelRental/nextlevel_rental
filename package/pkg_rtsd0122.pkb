CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0122 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0122
    PURPOSE     ����� ������� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2016-07-28  wjim            1. Created this package body.
    1.1     2016-09-20  wjim            ����������,�ð� �߰�
    1.2     2019-07-30  kstka           [20190730_1] �緻Ż������� ���̺� ��������� ����
                                        ����Ƚ��, ����������, �����ýð� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- ����� ������� Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0122 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* ������ȣ            */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.PROVSN_NO            /* ������ȣ */
         ,  A1.CALL_SEQ             /* ������   */
         ,  A1.CALL_DAY             /* �������   */
         ,  A1.CALL_TM              /* ���ð�   */
         ,  A1.CALL_DTL             /* ��㳻��   */
         ,  A1.REG_ID               /* �����ID   */
         ,  to_char(A1.REG_DT,'YYYYMMDDHH24MISS') REG_DT    /* �����     */
         ,  A1.CHG_ID               /* ������ID   */
         ,  A1.CHG_DT               /* ������     */
         ,  A1.RECALL_DAY           /* ���������� */
         ,  A1.RECALL_TM            /* �����ýð� */
      FROM  RTSD0122 A1    
     WHERE  A1.PROVSN_NO = DECODE(v_Provsn_No, NULL, A1.PROVSN_NO, v_Provsn_No)
     ORDER BY A1.CALL_SEQ DESC
    ;

  END p_sRTSD0122;
  
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
  ) RETURN NUMBER IS
  
  BEGIN

    INSERT  INTO RTSD0122 (
          PROVSN_NO
        , CALL_SEQ
        , CALL_DAY
        , CALL_TM
        , CALL_DTL
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
        , RECALL_DAY
        , RECALL_TM
    ) VALUES (
          v_Provsn_No
        , (
            SELECT  NVL2(MAX(CALL_SEQ), TO_NUMBER(MAX(CALL_SEQ))+1, 1) 
              FROM  RTSD0122
             WHERE  PROVSN_NO = v_Provsn_No         
          )
        , v_Call_Day
        , v_Call_Tm
        , v_Call_Dtl
        , v_Reg_Id
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
        , v_Recall_Day
        , v_Recall_Tm
    );

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRTSD0122;
  
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
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTSD0122
       SET  CALL_DAY   = v_Call_Day
         ,  CALL_TM    = v_Call_Tm
         ,  CALL_DTL   = v_Call_Dtl
         ,  CHG_ID     = v_Reg_Id
         ,  CHG_DT     = SYSDATE
         ,  RECALL_DAY = v_Recall_Day
         ,  RECALL_TM  = v_Recall_Tm
     WHERE  PROVSN_NO  = v_Provsn_No
       AND  CALL_SEQ   = v_Call_Seq;

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRTSD0122;
  
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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ��� Ȯ��
    IF TRIM(v_Provsn_No) IS NULL THEN
        v_Return_Message := '������ȣ('||v_Provsn_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '�����ID('||v_Reg_Id||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRTSD0122 (
              v_Provsn_No
            , v_Call_Day
            , v_Call_Tm
            , v_Call_Dtl 
            , v_Reg_Id
            , v_Recall_Day
            , v_Recall_Tm
            , v_ErrorText
        ) THEN
            v_Return_Message := '����������� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        --[20190730_1]
        IF SUBSTR(v_Provsn_No, 0, 1) = 'R' THEN
            UPDATE RTSD0123 SET CALL_SEQ = (
                SELECT  NVL(MAX(CALL_SEQ), TO_NUMBER(MAX(CALL_SEQ))+1) 
                  FROM  RTSD0122
                 WHERE  PROVSN_NO = v_Provsn_No         
              )
              , RECALL_DAY = NVL(TRIM(v_Recall_Day), '00000000')
              , RECALL_TM = NVL(TRIM(v_Recall_Tm), '0000')
              , CHG_ID = v_Reg_Id
              , CHG_DT = SYSDATE
            WHERE PROVSN_NO = v_Provsn_No;
        END IF;
        
    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRTSD0122 (
              v_Provsn_No      
            , v_Call_Seq
            , v_Call_Day
            , v_Call_Tm
            , v_Call_Dtl 
            , v_Reg_Id
            , v_Recall_Day
            , v_Recall_Tm
            , v_ErrorText
        ) THEN
            v_Return_Message := '����������� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        --[20190730_1]
        IF SUBSTR(v_Provsn_No, 0, 1) = 'R' THEN
            UPDATE RTSD0123 SET 
                RECALL_DAY = NVL(TRIM(v_Recall_Day), '00000000')
              , RECALL_TM = NVL(TRIM(v_Recall_Tm), '0000')
              , CHG_ID = v_Reg_Id
              , CHG_DT = SYSDATE
            WHERE PROVSN_NO = v_Provsn_No;
        END IF;
        
    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;
     

    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText      := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0122.p_IUDRtsd0122(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0122.p_IUDRtsd0122(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0122;


  /*****************************************************************************
  -- �緻Ż�����  Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0121Rental (
    v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* ������ȣ      */
    ) RETURN NUMBER IS
  BEGIN

    DELETE FROM RTSD0122
    WHERE  PROVSN_NO = v_Provsn_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.f_DeleteRtsd0121New(1)', '������ȣ', v_Provsn_No);

    RETURN SQLCODE;
  END f_DeleteRtsd0121Rental;
  
        
END Pkg_Rtsd0122;
/
