CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0111 AS
/*******************************************************************************
   NAME      Pkg_Rtre0111
   PURPOSE   ä�� ���� ���γ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ä�� ���� ���γ��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0111Count(
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,          /*ä�ǰ������        */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,           /*����ȣ            */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,          /*����ȣ            */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE           /*û������            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0111
    WHERE   RAMG_YM = v_Ramg_Ym
    AND     ORD_NO  = v_Ord_No
    AND     CUST_NO = v_Cust_No
    AND     RECP_TP = v_Recp_Tp;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0111Count;

  /*****************************************************************************
  -- ä�� ���� ���γ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0111 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RAMG_YM,                   /*ä�ǰ������        */
            A.ORD_NO,                    /*����ȣ            */
            A.CUST_NO,                   /*����ȣ            */
            A.RECP_TP,                   /*û������            */
            A.PAY_MTHD,                  /*�������            */
            A.PAY_DD,                    /*������              */
            A.APPR_SCNT,                 /*��üȸ��            */
            A.RAMG_AMT,                  /*ä�ǰ����ݾ�        */
            A.ARRE_AMT,                  /*��ü�ݾ�            */
            A.RMON_AMT,                  /*���û���ݾ�        */
            A.RAMGRE_AMT,                /*ä�ǰ��������ݾ�    */
            A.ARRERE_AMT,                /*��ü�����ݾ�        */
            A.RMONRE_AMT,                /*���û�������ݾ�    */
            A.OVIN_AMT,                  /*��ü���ڱݾ�        */
            A.OVINRE_AMT,                /*��ü���� �����ݾ�   */
            A.MFP_YN,                    /*�ߵ��ϳ�����        */
            A.TCAN_YN,                   /*�ӽ��ؾ࿩��        */
            A.OS_YN,                     /*��������������      */
            A.FST_DEL_YM,                /*��ü���۳��        */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0111 A
    WHERE   A.RAMG_YM   = DECODE(v_Ramg_Ym    , NULL, A.RAMG_YM    , v_Ramg_Ym)
    AND     A.ORD_NO    = DECODE(v_Ord_No     , NULL, A.ORD_NO     , v_Ord_No)
    AND     A.CUST_NO   = DECODE(v_Cust_No    , NULL, A.CUST_NO    , v_Cust_No)
    AND     A.RECP_TP   = DECODE(v_Recp_Tp    , NULL, A.RECP_TP    , v_Recp_Tp)
    AND     A.PAY_MTHD  = DECODE(v_Pay_Mthd   , NULL, A.PAY_MTHD   , v_Pay_Mthd)
    AND     A.PAY_DD    = DECODE(v_Pay_Dd     , NULL, A.PAY_DD     , v_Pay_Dd)
    AND     A.APPR_SCNT = DECODE(v_Appr_Scnt  , NULL, A.APPR_SCNT  , v_Appr_Scnt)
    AND     A.RAMG_AMT  = DECODE(v_Ramg_Amt   , NULL, A.RAMG_AMT   , v_Ramg_Amt)
    AND     A.ARRE_AMT  = DECODE(v_Arre_Amt   , NULL, A.ARRE_AMT   , v_Arre_Amt)
    AND     A.RMON_AMT  = DECODE(v_Rmon_Amt   , NULL, A.RMON_AMT   , v_Rmon_Amt)
    AND     A.RAMGRE_AMT= DECODE(v_Ramgre_Amt , NULL, A.RAMGRE_AMT , v_Ramgre_Amt)
    AND     A.ARRERE_AMT= DECODE(v_Arrere_Amt , NULL, A.ARRERE_AMT , v_Arrere_Amt)
    AND     A.RMONRE_AMT= DECODE(v_Rmonre_Amt , NULL, A.RMONRE_AMT , v_Rmonre_Amt)
    AND     A.OVIN_AMT  = DECODE(v_Ovin_Amt   , NULL, A.OVIN_AMT   , v_Ovin_Amt)
    AND     A.OVINRE_AMT= DECODE(v_Ovinre_Amt , NULL, A.OVINRE_AMT , v_Ovinre_Amt)
    AND     A.MFP_YN    = DECODE(v_Mfp_Yn     , NULL, A.MFP_YN     , v_Mfp_Yn)
    AND     A.TCAN_YN   = DECODE(v_Tcan_Yn    , NULL, A.TCAN_YN    , v_Tcan_Yn)
    AND     A.OS_YN     = DECODE(v_Os_Yn      , NULL, A.OS_YN      , v_Os_Yn)
    AND     A.FST_DEL_YM= DECODE(v_Fst_Del_Ym , NULL, A.FST_DEL_YM , v_Fst_Del_Ym)
    AND     A.REG_ID    = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtre0111;

  /*****************************************************************************
  -- ä�� ���� ���γ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0111 (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0111 (
            RAMG_YM,
            ORD_NO,
            CUST_NO,
            RECP_TP,
            PAY_MTHD,
            PAY_DD,
            APPR_SCNT,
            RAMG_AMT,
            ARRE_AMT,
            RMON_AMT,
            RAMGRE_AMT,
            ARRERE_AMT,
            RMONRE_AMT,
            OVIN_AMT,
            OVINRE_AMT,
            MFP_YN,
            TCAN_YN,
            OS_YN,
            FST_DEL_YM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ramg_Ym,
            v_Ord_No,
            v_Cust_No,
            v_Recp_Tp,
            v_Pay_Mthd,
            v_Pay_Dd,
            v_Appr_Scnt,
            v_Ramg_Amt,
            v_Arre_Amt,
            v_Rmon_Amt,
            v_Ramgre_Amt,
            v_Arrere_Amt,
            v_Rmonre_Amt,
            v_Ovin_Amt,
            v_Ovinre_Amt,
            v_Mfp_Yn,
            v_Tcan_Yn,
            v_Os_Yn,
            v_Fst_Del_Ym,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0111;

  /*****************************************************************************
  -- ä�� ���� ���γ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0111 (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0111
    SET    PAY_MTHD   = v_Pay_Mthd,
           PAY_DD     = v_Pay_Dd,
           APPR_SCNT  = v_Appr_Scnt,
           RAMG_AMT   = v_Ramg_Amt,
           ARRE_AMT   = v_Arre_Amt,
           RMON_AMT   = v_Rmon_Amt,
           RAMGRE_AMT = v_Ramgre_Amt,
           ARRERE_AMT = v_Arrere_Amt,
           RMONRE_AMT = v_Rmonre_Amt,
           OVIN_AMT   = v_Ovin_Amt,
           OVINRE_AMT = v_Ovinre_Amt,
           MFP_YN     = v_Mfp_Yn,
           TCAN_YN    = v_Tcan_Yn,
           OS_YN      = v_Os_Yn,
           FST_DEL_YM = v_Fst_Del_Ym,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  RAMG_YM    = v_Ramg_Ym
    AND    ORD_NO     = v_Ord_No
    AND    CUST_NO    = v_Cust_No
    AND    RECP_TP    = v_Recp_Tp;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0111;

  /*****************************************************************************
  -- ä�� ���� ���γ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0111 (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0111
    WHERE  RAMG_YM = v_Ramg_Ym
    AND    ORD_NO  = v_Ord_No
    AND    CUST_NO = v_Cust_No
    AND    RECP_TP = v_Recp_Tp;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0111;

  /*****************************************************************************
  -- ä�� ���� ���γ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0111 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����� ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtre0111Count(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Recp_Tp) THEN                            

        IF 0 != f_InsertRtre0111(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Recp_Tp, 
                                 v_Pay_Mthd, v_Pay_Dd, v_Appr_Scnt, v_Ramg_Amt, 
                                 v_Arre_Amt, v_Rmon_Amt, v_Ramgre_Amt, v_Arrere_Amt, 
                                 v_Rmonre_Amt, v_Ovin_Amt, v_Ovinre_Amt, v_Mfp_Yn, 
                                 v_Tcan_Yn, v_Os_Yn, v_Fst_Del_Ym, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := 'ä�� ���� ���γ��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0111(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Recp_Tp, 
                                     v_Pay_Mthd, v_Pay_Dd, v_Appr_Scnt, v_Ramg_Amt, 
                                     v_Arre_Amt, v_Rmon_Amt, v_Ramgre_Amt, v_Arrere_Amt, 
                                     v_Rmonre_Amt, v_Ovin_Amt, v_Ovinre_Amt, v_Mfp_Yn, 
                                     v_Tcan_Yn, v_Os_Yn, v_Fst_Del_Ym, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := 'ä�� ���� ���γ��� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0111(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Recp_Tp, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'ä�� ���� ���γ��� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0111.p_IUDRtre0111(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0111.p_IUDRtre0111(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0111;

  /*****************************************************************************
  -- ä�� ���� ���γ��� ���� - ä�Ǵ�� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtre0111Aggregate (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����� ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtre0111Count(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Recp_Tp) THEN                            

        IF 0 != f_InsertRtre0111(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Recp_Tp, 
                                 v_Pay_Mthd, v_Pay_Dd, v_Appr_Scnt, v_Ramg_Amt, 
                                 v_Arre_Amt, v_Rmon_Amt, v_Ramgre_Amt, v_Arrere_Amt, 
                                 v_Rmonre_Amt, v_Ovin_Amt, v_Ovinre_Amt, v_Mfp_Yn, 
                                 v_Tcan_Yn, v_Os_Yn, v_Fst_Del_Ym, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := 'ä�� ���� ���γ��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 != f_UpdateRtre0111Aggregate(v_Ramg_Ym, v_Ord_No, v_Cust_No, v_Recp_Tp, 
                                         v_Pay_Mthd, v_Pay_Dd, v_Appr_Scnt, v_Ramg_Amt, 
                                         v_Arre_Amt, v_Rmon_Amt, v_Ramgre_Amt, v_Arrere_Amt, 
                                         v_Rmonre_Amt, v_Ovin_Amt, v_Ovinre_Amt, v_Mfp_Yn, 
                                         v_Tcan_Yn, v_Os_Yn, v_Fst_Del_Ym, v_Reg_Id, 
                                         v_ErrorText) THEN
            v_Return_Message := 'ä�� ���� ���γ��� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0111.p_IUDRtre0111(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0111.p_IUDRtre0111(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0111Aggregate;

  /*****************************************************************************
  -- ä�� ���� ���γ��� Update - ä�Ǵ�� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0111Aggregate (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Ord_No         IN RTRE0111.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Tp        IN RTRE0111.RECP_TP%TYPE,        /*û������              */
    v_Pay_Mthd       IN RTRE0111.PAY_MTHD%TYPE,       /*�������              */
    v_Pay_Dd         IN RTRE0111.PAY_DD%TYPE,         /*������                */
    v_Appr_Scnt      IN RTRE0111.APPR_SCNT%TYPE,      /*��üȸ��              */
    v_Ramg_Amt       IN RTRE0111.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0111.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0111.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0111.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0111.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0111.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0111.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0111.OVINRE_AMT%TYPE,     /*��ü���� �����ݾ�     */
    v_Mfp_Yn         IN RTRE0111.MFP_YN%TYPE,         /*�ߵ��ϳ�����          */
    v_Tcan_Yn        IN RTRE0111.TCAN_YN%TYPE,        /*�ӽ��ؾ࿩��          */
    v_Os_Yn          IN RTRE0111.OS_YN%TYPE,          /*��������������        */
    v_Fst_Del_Ym     IN RTRE0111.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0111
    SET    --PAY_MTHD   = v_Pay_Mthd,
           --PAY_DD     = v_Pay_Dd,
           APPR_SCNT  = NVL(APPR_SCNT,0) + NVL(v_Appr_Scnt,0),
           RAMG_AMT   = NVL(RAMG_AMT,0) + NVL(v_Ramg_Amt,0),
           ARRE_AMT   = NVL(ARRE_AMT,0) + NVL(v_Arre_Amt,0),
           RMON_AMT   = NVL(RMON_AMT,0) + NVL(v_Rmon_Amt,0),
           --RAMGRE_AMT = v_Ramgre_Amt,
           --ARRERE_AMT = v_Arrere_Amt,
           --RMONRE_AMT = v_Rmonre_Amt,
           OVIN_AMT   = NVL(OVIN_AMT,0) + NVL(v_Ovin_Amt,0),
           --OVINRE_AMT = v_Ovinre_Amt,
           --MFP_YN     = v_Mfp_Yn,
           --TCAN_YN    = v_Tcan_Yn,
           --OS_YN      = v_Os_Yn,
           FST_DEL_YM = NVL(v_Fst_Del_Ym, FST_DEL_YM),
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  RAMG_YM    = v_Ramg_Ym
    AND    ORD_NO     = v_Ord_No
    AND    CUST_NO    = v_Cust_No
    AND    RECP_TP    = v_Recp_Tp;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0111Aggregate;


  /*****************************************************************************
  -- ä�� ���� ���γ��� Select - ä�� ��� ��ະ ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtre0111OrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0111.CUST_NO%TYPE         /*����ȣ              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RAMG_YM,       /*ä�ǰ������        */
            A.CUST_NO,       /*����ȣ            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM,                /*����              */
            A.ORD_NO,        /*����ȣ            */
            B.RAMG_STAT,     /*ä�ǰ������        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R035', B.RAMG_STAT) RAMG_STAT_NM, /*ä�ǰ������        */
            A.RAMG_AMT,      /*ä�ǰ����ݾ�        */
            A.ARRE_AMT,      /*��ü�ݾ�            */
            A.RMON_AMT,      /*���û���ݾ�        */
            A.RAMGRE_AMT,    /*ä�ǰ��������ݾ�    */
            A.ARRERE_AMT,    /*��ü�����ݾ�        */
            A.RMONRE_AMT,    /*���û�������ݾ�    */
            A.OVIN_AMT,      /*��ü���ڱݾ�        */
            A.OVINRE_AMT,    /*��ü���� �����ݾ�   */
            A.FST_DEL_YM     /*��ü���۳��        */
    FROM    (
            SELECT  A.RAMG_YM,
                    A.CUST_NO,
                    A.ORD_NO,
                    SUM( A.RAMG_AMT   ) AS RAMG_AMT,
                    SUM( A.ARRE_AMT   ) AS ARRE_AMT,
                    SUM( A.RMON_AMT   ) AS RMON_AMT,
                    SUM( A.RAMGRE_AMT ) AS RAMGRE_AMT,
                    SUM( A.ARRERE_AMT ) AS ARRERE_AMT,
                    SUM( A.RMONRE_AMT ) AS RMONRE_AMT,
                    SUM( A.OVIN_AMT   ) AS OVIN_AMT,
                    SUM( A.OVINRE_AMT ) AS OVINRE_AMT,
                    MAX( A.FST_DEL_YM ) AS FST_DEL_YM
            FROM    RTRE0111 A
            WHERE   A.RAMG_YM = v_Ramg_Ym
            AND     A.CUST_NO = v_Cust_No
            GROUP   BY A.RAMG_YM, A.CUST_NO, A.ORD_NO
            ) A,
            RTRE0110 B
    WHERE   A.RAMG_YM = B.RAMG_YM
    AND     A.CUST_NO = B.CUST_NO;

  END p_sRtre0111OrdList;

  /*****************************************************************************
  -- ä�� ���� ���γ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0111Equal (
    v_Ramg_Ym        IN RTRE0111.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Reg_Id         IN RTRE0111.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0111
    WHERE  RAMG_YM = v_Ramg_Ym;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0111.f_DeleteRtre0111Equal', 'ä�ǰ������', v_Ramg_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0111.f_DeleteRtre0111Equal', '����� ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0111Equal;
  
END Pkg_Rtre0111;
/
