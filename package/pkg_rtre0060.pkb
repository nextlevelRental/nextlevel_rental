CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0060 AS
/*******************************************************************************
   NAME      Pkg_Rtre0060
   PURPOSE   ���½�û ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���½�û ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0060Count(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*���½�û �߻�����   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,         /*���½�û��          */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE          /*���½�û����        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day
    AND     ACRQ_SEQ = v_Acrq_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0060Count;

  /*****************************************************************************
  -- ���½�û ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE        /*���½�û��            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACRQ_FG,                   /*���½�û �߻�����   */
            A.ACRQ_DAY,                  /*���½�û��          */
            A.ACRQ_SEQ,                  /*���½�û����        */
            A.ORD_NO,                    /*����ȣ            */
            A.CUST_NO,                   /*���ڵ�            */
            A.BANK_CD,                   /*�����ڵ�            */
            A.ACC_SEQ,                   /*���¼���            */
            A.ACRQ_TP,                   /*���½�û����        */
            A.RPC_SEQ,                   /*���������û����    */
            A.ACRQ_ST,                   /*���½�û ó������   */
            A.ACERCD,                    /*���½�û ����ڵ�   */
            A.ACBRCD,                    /*���½�û ���ڵ�     */
            A.RQBRCD,                    /*��� ���ڵ�         */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0060 A
    WHERE   A.ACRQ_FG  = DECODE(v_Acrq_Fg , NULL, A.ACRQ_FG , v_Acrq_Fg)
    AND     A.ACRQ_DAY = DECODE(v_Acrq_Day, NULL, A.ACRQ_DAY, v_Acrq_Day);

  END p_sRtre0060;

  /*****************************************************************************
  -- ���½�û ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*���°��� ���ڵ�       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*��� ���ڵ�           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0060 (
            ACRQ_FG,
            ACRQ_DAY,
            ACRQ_SEQ,
            ORD_NO,
            CUST_NO,
            BANK_CD,
            ACC_SEQ,
            ACRQ_TP,
            RPC_SEQ,
            ACRQ_ST,
            ACERCD,
            ACBRCD,
            RQBRCD,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Acrq_Fg,
            v_Acrq_Day,
            v_Acrq_Seq,
            v_Ord_No,
            v_Cust_No,
            v_Bank_Cd,
            v_Acc_Seq,
            v_Acrq_Tp,
            v_Rpc_Seq,
            v_Acrq_St,
            v_Acercd,
            v_Acbrcd,
            v_Rqbrcd,
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

  END f_InsertRtre0060;


  /*****************************************************************************
  -- ���½�û ���� Insert(ARS������������)
  *****************************************************************************/
  FUNCTION f_InsertRtre0060RecData (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*���°��� ���ڵ�       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*��� ���ڵ�           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_Txt_No         IN RTRE0060.TXT_NO%TYPE,         /*ARS���� ����������ȣ  */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0060 (
            ACRQ_FG,
            ACRQ_DAY,
            ACRQ_SEQ,
            ORD_NO,
            CUST_NO,
            BANK_CD,
            ACC_SEQ,
            ACRQ_TP,
            RPC_SEQ,
            ACRQ_ST,
            ACERCD,
            ACBRCD,
            RQBRCD,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            TXT_NO
    ) VALUES (
            v_Acrq_Fg,
            v_Acrq_Day,
            v_Acrq_Seq,
            v_Ord_No,
            v_Cust_No,
            v_Bank_Cd,
            v_Acc_Seq,
            v_Acrq_Tp,
            v_Rpc_Seq,
            v_Acrq_St,
            v_Acercd,
            v_Acbrcd,
            v_Rqbrcd,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Txt_No
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0060RecData;
  
  /*****************************************************************************
  -- ���½�û ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*���°��� ���ڵ�       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*��� ���ڵ�           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0060
    SET    ACRQ_FG  = v_Acrq_Fg,
           ACRQ_DAY = v_Acrq_Day,
           ACRQ_SEQ = v_Acrq_Seq,
           ORD_NO   = v_Ord_No,
           CUST_NO  = v_Cust_No,
           BANK_CD  = v_Bank_Cd,
           ACC_SEQ  = v_Acc_Seq,
           ACRQ_TP  = v_Acrq_Tp,
           RPC_SEQ  = v_Rpc_Seq,
           ACRQ_ST  = v_Acrq_St,
           ACERCD   = v_Acercd,
           ACBRCD   = V_Acbrcd,
           RQBRCD   = V_Rqbrcd,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ACRQ_FG  = v_Acrq_Fg
    AND    ACRQ_DAY = v_Acrq_Day
    AND    ACRQ_SEQ = v_Acrq_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060;

  /*****************************************************************************
  -- ���½�û ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day
    AND     ACRQ_SEQ = v_Acrq_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060(1)', 'v_Acrq_Fg', v_Acrq_Fg);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060(1)', 'v_Acrq_Day', v_Acrq_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060(1)', 'v_Acrq_Seq', v_Acrq_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060(1)', 'v_Reg_Id', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0060;


  /*****************************************************************************
  -- ���½�û ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0060 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN OUT RTRE0060.ACRQ_SEQ%TYPE,   /*���½�û����          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*�����ڵ�              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*���¼���              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*���°��� ���ڵ�       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*��� ���ڵ�           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:���½�û �߻�����,���½�û��,  ����ȣ,���¼���,���½�û����,���½�û ó������,���½�û ����ڵ�, ����� ID
    IF TRIM(v_Acrq_Fg) IS NULL THEN
        v_Return_Message := '���½�û �߻�����('||v_Acrq_Fg||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Acrq_Day) IS NULL THEN
        v_Return_Message := '���½�û��('||v_Acrq_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '����ȣ('||v_Ord_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

--    IF TRIM(v_Cust_No) IS NULL THEN
--        v_Return_Message := '���ڵ�('||v_Cust_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
--        RAISE e_Error;
--    END IF;
--
--    IF TRIM(v_Acc_Seq) IS NULL THEN
--        v_Return_Message := '���¼���('||v_Acc_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
--        RAISE e_Error;
--    END IF;

    IF TRIM(v_Bank_Cd) IS NULL THEN
        v_Return_Message := '�����ڵ�('||v_Bank_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    IF TRIM(v_Acrq_Tp) IS NULL THEN
        v_Return_Message := '���½�û����('||v_Acrq_Tp||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rpc_Seq) IS NULL THEN
        v_Return_Message := '���������û����('||v_Rpc_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Acrq_St) IS NULL THEN
        v_Return_Message := '���½�û ó������('||v_Acrq_St||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Acercd) IS NULL THEN
        v_Return_Message := '���½�û ����ڵ�('||v_Acercd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtre0060Count(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq) THEN
            v_Return_Message := '�ش� ���½�û����('||v_Acrq_Seq||')�� ��ϵ� �����̹Ƿ� �űԵ�� ó�� �Ұ�!!';
            RAISE e_Error;
        END IF;

        v_Acrq_Seq := f_sRtre0060AcrqSeq(v_Acrq_Fg, v_Acrq_Day);

        IF 0 != f_InsertRtre0060(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq, v_Ord_No,
                                 v_Cust_No, v_Bank_Cd, v_Acc_Seq, v_Acrq_Tp, v_Rpc_Seq,
                                 v_Acrq_St, v_Acercd, v_Acbrcd, v_Rqbrcd,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���½�û ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;

    ELSE

        IF TRIM(v_Acrq_Seq) IS NULL THEN
            v_Return_Message := '���½�û����('||v_Acrq_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF 0 = f_sRtre0060Count(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq) THEN
            v_Return_Message := '�ش� ���½�û����('||v_Acrq_Seq||')�� �̵�� �����̹Ƿ� ó��(����/����)�Ұ�!!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0060(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq, v_Ord_No,
                                     v_Cust_No, v_Bank_Cd, v_Acc_Seq, v_Acrq_Tp, v_Rpc_Seq,
                                     v_Acrq_St, v_Acercd, v_Acbrcd, v_Rqbrcd,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���½�û ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0060(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '���½�û ���� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_IUDRtre0060(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_IUDRtre0060(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0060;

  /*****************************************************************************
  -- ���½�û ���� - ���½�û�������
  *****************************************************************************/
  FUNCTION f_sRtre0060AcrqSeq(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*���½�û �߻�����   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE          /*���½�û��          */
    ) RETURN NUMBER IS
    v_Acrq_Seq  RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL;    /*���½�û����        */
  BEGIN

    SELECT  NVL((SELECT  MAX(ACRQ_SEQ)
                 FROM    RTRE0060 B
                 WHERE   ACRQ_FG  = v_Acrq_Fg
                 AND     ACRQ_DAY = v_Acrq_Day)+ 1, 1)
    INTO    v_Acrq_Seq
    FROM    DUAL;

    RETURN v_Acrq_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0060AcrqSeq;



 /*****************************************************************************
  -- ���ݰ��� > CMS���� > ���½�û ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtreAccReq0060List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_From_Dt        IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��             */
    v_To_Dt          IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��             */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����           */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*����ȣ               */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*���ڵ�               */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������      */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE         /*���������û��         */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,               /*����ȣ          */
            A.CUST_NO,              /*���ڵ�          */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM, /*����  */
            B.CAR_NO,               /*������ȣ          */
            C.RPC_DAY,              /*��������        */
            D.BANK_CD,              /*�����ڵ�          */
            D.ACCT_NO,              /*���¹�ȣ          */
            D.CUST_NM  AS DEPOSITOR,/*������            */
            D.EBIR_DAY,             /*�����������      */
            D.BUSL_NO,              /*����ڹ�ȣ        */
            A.ACRQ_DAY,             /*��û��            */
            A.ACRQ_ST,              /*��û����          */
            A.ACERCD,               /*��������(���½�û����ڵ�)*/
            A.ACRQ_TP,              /*��û����(��������)*/
            C.AFPAY_DD AS PAY_DD,   /*������            */
            A.ACRQ_FG,              /*���½�û�߻�����  */
            C.RPC_UID               /*���������û��    */
    FROM    RTRE0060 A,             /*���½�û����T     */
            RTSD0108 B,             /*��������T         */
            RTRE0050 C,             /*�������������̷�T */
            RTRE0010 D              /*����������      */
    WHERE   A.ORD_NO   = B.ORD_NO
    AND     A.ACC_SEQ  = B.ACC_SEQ
    AND     A.ORD_NO   = C.ORD_NO
    AND     A.ACC_SEQ  = C.AFACC_SEQ
    AND     A.ACRQ_FG  = C.AFACRQ_FG
    AND     A.ACRQ_DAY = C.AFACRQ_DAY
    AND     A.ACRQ_SEQ = C.AFACRQ_SEQ
    AND     A.ACC_SEQ  = D.ACC_SEQ
    AND     A.ACRQ_DAY BETWEEN v_From_Dt AND v_To_Dt
    AND     (v_Acrq_Tp IS NULL OR A.ACRQ_TP =  v_Acrq_Tp)
    AND     A.ORD_NO   = DECODE(v_Ord_No  , NULL, A.ORD_NO,  v_Ord_No)
    AND     A.CUST_NO  = DECODE(v_Cust_No , NULL, A.CUST_NO, v_Cust_No)
    AND     (v_Acrq_St IS NULL OR A.ACRQ_ST =  v_Acrq_St)
    AND     NVL( C.RPC_UID, ' ')  = NVL( DECODE(v_Rpc_Uid , NULL, C.RPC_UID, v_Rpc_Uid), ' ')

    UNION ALL

    SELECT  A.ORD_NO,             /*����ȣ          */
            A.CUST_NO,            /*���ڵ�          */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM, /*����  */
            B.CAR_NO,             /*������ȣ          */
            C.RPC_DAY,            /*��������        */
            D.BANK_CD,            /*�����ڵ�          */
            D.ACCT_NO,            /*���¹�ȣ          */
            D.CUST_NM  AS DEPOSITOR, /*������         */
            D.EBIR_DAY,           /*�����������      */
            D.BUSL_NO,            /*����ڹ�ȣ        */
            A.ACRQ_DAY,           /*��û��            */
            A.ACRQ_ST,            /*��û����          */
            A.ACERCD,             /*��������(���½�û����ڵ�)*/
            A.ACRQ_TP,            /*��û����(��������)*/
            C.BFPAY_DD  AS PAY_DD,/*������            */
            A.ACRQ_FG,            /*���½�û�߻�����  */
            C.RPC_UID             /*���������û��    */
     FROM   RTRE0060 A,           /*���½�û����T    */
            RTSD0108 B,           /*��������T        */
            RTRE0050 C,           /*�������������̷�T*/
            RTRE0010 D            /*����������     */
     WHERE  A.ORD_NO   = B.ORD_NO
     AND    A.ACC_SEQ  = B.ACC_SEQ
     AND    A.ORD_NO   = C.ORD_NO
     AND    A.ACC_SEQ  = C.BFACC_SEQ
     AND    A.ACRQ_FG  = C.BFACRQ_FG
     AND    A.ACRQ_DAY = C.BFACRQ_DAY
     AND    A.ACRQ_SEQ = C.BFACRQ_SEQ
     AND    A.ACC_SEQ  = D.ACC_SEQ
     AND    A.ACRQ_DAY BETWEEN v_From_Dt AND v_To_Dt
     AND    (v_Acrq_Tp IS NULL OR A.ACRQ_TP =  v_Acrq_Tp)
     AND    A.ORD_NO   = DECODE(v_Ord_No  , NULL, A.ORD_NO,  v_Ord_No)
     AND    A.CUST_NO  = DECODE(v_Cust_No , NULL, A.CUST_NO, v_Cust_No)
     AND    (v_Acrq_St IS NULL OR A.ACRQ_ST =  v_Acrq_St)
     AND    NVL( C.RPC_UID, ' ')  = NVL( DECODE(v_Rpc_Uid , NULL, C.RPC_UID, v_Rpc_Uid), ' ');

  END p_sRtreAccReq0060List;

 /*****************************************************************************
  -- ���ݰ��� > CMS���� > ���½�ûó�� >  [STEP2] ���½�û�����ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060AccReqTargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*���½�û����          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    v_cnt1   NUMBER DEFAULT 0;
    v_cnt2   NUMBER DEFAULT 0;
    v_cnt3   NUMBER DEFAULT 0;
    v_Extrc_Yn VARCHAR(1);
    v_Confi_Yn VARCHAR(1);
    v_Fcret_Yn VARCHAR(1);
    v_Ftran_Yn VARCHAR(1);
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.ACRQ_DAY,                                                         /*���½�û��*/
            A.ACRQ_TP,                                                         /*���½�û����*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R015', A.ACRQ_TP) AS ACRQ_TP_NM,/*���½�û���и�*/
            A.BANK_CD,                                                         /*�����ڵ�*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R001', A.BANK_CD) AS BANK_NM,   /*�����*/
            A.CNT ROW_CNT                                                      /*�Ǽ�*/
            FROM (SELECT C.ACRQ_DAY,
            C.ACRQ_TP,
            B.BANK_CD,
            COUNT (*) CNT
    FROM    RTRE0060 C,
            RTRE0010 B
    WHERE   C.ACRQ_FG  = 'A' -- ȸ������
    AND     C.ACRQ_DAY = v_Acrq_Day
    AND     B.ACC_SEQ  = C.ACC_SEQ
    GROUP   BY C.ACRQ_DAY, C.ACRQ_TP, B.BANK_CD) A;

    SELECT  COUNT (*)
    INTO    v_cnt1  -- ��ȸī��Ʈ1
    FROM    RTRE0060 C, RTRE0010 B
    WHERE   C.ACRQ_FG  = 'A' -- ȸ������
    AND     C.ACRQ_DAY = v_Acrq_Day
    AND     B.ACC_SEQ  = C.ACC_SEQ;

    SELECT  COUNT (ACRQ_DAY)
    INTO    v_cnt2  -- ��ȸī��Ʈ2
    FROM    RTRE0060
    WHERE   ACRQ_FG  = 'A' -- ȸ������
    AND     ACRQ_DAY = v_Acrq_Day;

     IF v_cnt1 <>  v_cnt2 THEN
        v_Success_code := -1;
        v_Return_Message := '���Ǽ��� ������ �ֽ��ϴ�. �ý��� ����ڿ��� Ȯ���ϼ���.';
     ELSIF v_cnt1 =  v_cnt2 THEN

        SELECT  COUNT (*)
        INTO    v_cnt3
        FROM    RTRE0099
        WHERE   FILE_TP  = 'EB13'
        AND     RQST_DAY = v_Acrq_Day
        AND     FILE_NM  = 'EB13' || SUBSTR (v_Acrq_Day, 5, 4)
        AND     DEL_YN   = 'N';

        IF v_cnt3 = 0 THEN
            v_Success_code := -1;
            v_Return_Message := '������û ������(RTRE0099). �ý��� ����ڿ��� Ȯ���ϼ���.';
        ELSE

            SELECT  EXTRC_YN,
                    CONFI_YN,
                    FCRET_YN,
                    FTRAN_YN
            INTO    v_Extrc_Yn,
                    v_Confi_Yn,
                    v_Fcret_Yn,
                    v_Ftran_Yn
            FROM    RTRE0099
            WHERE   FILE_TP  = 'EB13'
            AND     RQST_DAY = v_Acrq_Day
            AND     FILE_NM  = 'EB13' || SUBSTR (v_Acrq_Day, 5, 4)
            AND     DEL_YN   = 'N';

            --EXTRC_YN(������迩��)/CONFI_YN(���Ȯ�ο���)/FCRET_YN(���ϻ�������)/FTRAN_YN(�������ۿ���)
            IF  v_Extrc_Yn  = 'N' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '������谡 �Ϸ� ���� �ʾҽ��ϴ�.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '������� �Ϸ�, ���Ȯ�� �Ͻñ� �ٶ��ϴ�.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '���Ȯ�� �Ϸ�, ���ϻ��� �Ͻñ� �ٶ��ϴ�.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '���ϻ��� �Ϸ�, ���ۿϷ� �Ͻñ� �ٶ��ϴ�.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'Y' THEN
              v_Success_code := 0;
              v_Return_Message := '���½�û ó�� �Ϸ� �Ǿ����ϴ�.';
            ELSE
              v_Success_code := -1;
              v_Return_Message := '�ý��� ����ڿ��� Ȯ���ϼ���.';
            END IF;
         END IF;
     END IF;

  END p_sRtre0060AccReqTargetList;

  /*****************************************************************************
  -- ���ݰ��� > CMS���� > ���½�û ��� �ݿ� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060AccResultList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*���½�û����          */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,         /*�۾�����(��û����)     */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    v_cnt1      NUMBER DEFAULT 0;
    v_cnt2      NUMBER DEFAULT 0;
    v_cnt3      NUMBER DEFAULT 0;
    v_Extrc_Yn  VARCHAR(1);
    v_Confi_Yn  VARCHAR(1);
    v_Fcret_Yn  VARCHAR(1);
    v_Ftran_Yn  VARCHAR(1);
    v_Job_Gubun VARCHAR2(10);
  BEGIN
    --ȸ��������
    IF v_Acrq_Fg = 'A' THEN
      v_Job_Gubun := 'EB14';
    END IF;
    --����������
    IF v_Acrq_Fg = 'B' THEN
      v_Job_Gubun := 'EB11';
    END IF;

    OPEN Ref_Cursor FOR
    SELECT  A.ACRQ_DAY,                                                          /*���½�û��*/
            A.ACRQ_TP,                                                           /*���½�û����*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R015', A.ACRQ_TP) AS ACRQ_TP_NM,  /*���½�û���и�*/
            A.BANK_CD,                                                           /*�����ڵ�*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R001', A.BANK_CD) AS BANK_NM,     /*�����*/
            A.ACRQ_ST,                                                           /*��û���*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R009', A.ACRQ_ST) AS ACRQ_ST_NM,  /*��û�����*/
            A.CNT ROW_CNT                                                        /*�Ǽ�*/
    FROM    (
            SELECT  C.ACRQ_DAY, C.ACRQ_TP, B.BANK_CD,
                    C.ACRQ_ST, COUNT (*) AS CNT
            FROM    RTRE0060 C,
                    RTRE0010 B
            WHERE   'A'  = v_Acrq_Fg
            AND     C.ACRQ_FG  = v_Acrq_Fg
            AND     C.ACRQ_DAY = v_Acrq_Day
            AND     B.ACC_SEQ  = C.ACC_SEQ(+)
            GROUP   BY C.ACRQ_DAY, C.ACRQ_TP, B.BANK_CD, C.ACRQ_ST, C.ACRQ_ST
            UNION
            SELECT  C.ACRQ_DAY, C.ACRQ_TP, C.BANK_CD,
                    C.ACRQ_ST, COUNT (*) AS CNT
            FROM    RTRE0060 C
            WHERE   'B'  = v_Acrq_Fg
            AND     C.ACRQ_FG  = v_Acrq_Fg
            AND     C.ACRQ_DAY = v_Acrq_Day
            GROUP   BY C.ACRQ_DAY, C.ACRQ_TP, C.BANK_CD, C.ACRQ_ST, C.ACRQ_ST

            ) A;

     IF v_Acrq_Fg = 'A' THEN
        SELECT  COUNT (*)
        INTO    v_cnt1 --��ȸī��Ʈ1
        FROM    RTRE0060 C,
                RTRE0010 B
        WHERE   C.ACRQ_FG  = v_Acrq_Fg
        AND     C.ACRQ_DAY = v_Acrq_Day
        AND     B.ACC_SEQ  = C.ACC_SEQ(+);

        SELECT  COUNT (ACRQ_DAY)
        INTO    v_cnt2 --��ȸī��Ʈ2
        FROM    RTRE0060
        WHERE   ACRQ_FG  = v_Acrq_Fg
        AND     ACRQ_DAY = v_Acrq_Day;
     END IF;

     IF v_cnt1 <>  v_cnt2 THEN
        v_Success_code := -1;
        v_Return_Message := '���Ǽ��� ������ �ֽ��ϴ�. �ý��� ����ڿ��� Ȯ���ϼ���.';
     ELSIF v_cnt1 =  v_cnt2 THEN

        SELECT  COUNT (*)
        INTO    v_cnt3
        FROM    RTRE0099
        WHERE   FILE_TP  = v_JOB_GUBUN
        AND     RQST_DAY = v_Acrq_Day
        AND     FILE_NM  = v_JOB_GUBUN || SUBSTR (v_Acrq_Day, 5, 4)
        AND     DEL_YN   = 'N';

        IF v_cnt3 = 0 THEN
            v_Success_code := -1;
            v_Return_Message := '������û ������(RTRE0099). �ý��� ����ڿ��� Ȯ���ϼ���.';
        ELSE

            SELECT  EXTRC_YN,
                    CONFI_YN,
                    FCRET_YN,
                    FTRAN_YN
            INTO    v_Extrc_Yn,
                    v_Confi_Yn,
                    v_Fcret_Yn,
                    v_Ftran_Yn
            FROM    RTRE0099
            WHERE   FILE_TP  = v_Job_Gubun
            AND     RQST_DAY = v_Acrq_Day
            AND     FILE_NM  = v_JOB_GUBUN || SUBSTR (v_Acrq_Day, 5, 4)
            AND     DEL_YN   = 'N';

            --EXTRC_YN(������迩��)/CONFI_YN(���Ȯ�ο���)/FCRET_YN(���ϻ�������)/FTRAN_YN(�������ۿ���)
            IF  v_Extrc_Yn  = 'N' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '������谡 �Ϸ� ���� �ʾҽ��ϴ�.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '������� �Ϸ�, ���Ȯ�� �Ͻñ� �ٶ��ϴ�.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '���Ȯ�� �Ϸ�, ���ϻ��� �Ͻñ� �ٶ��ϴ�.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '���ϻ��� �Ϸ�, ���ۿϷ� �Ͻñ� �ٶ��ϴ�.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'Y' THEN
              v_Success_code := 0;
              v_Return_Message := '���½�û ó�� �Ϸ� �Ǿ����ϴ�.';
            ELSE
              v_Success_code := -1;
              v_Return_Message := '�ý��� ����ڿ��� Ȯ���ϼ���.';
            END IF;
         END IF;
     END IF;

  END p_sRtre0060AccResultList;

  /*****************************************************************************
  -- ���½�û ���� ���� - RE-020201_���½�û �������
  *****************************************************************************/
  PROCEDURE p_InsertRtre0060Aggregate (
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Fr_Rpc_Day     IN VARCHAR,                      /*�������� ����������� */
    v_To_Rpc_Day     IN VARCHAR,                      /*�������� ������������ */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*�ۼ������ϱ���      */
    v_Rqst_Day  RTRE0099.RQST_DAY%TYPE DEFAULT NULL;/*��û����            */
    v_File_Nm   RTRE0099.FILE_NM%TYPE DEFAULT NULL; /*���ϸ�              */
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;/*���ϼ���            */

    v_Acrq_Cnt   RTRE0099.ACRQ_CNT%TYPE DEFAULT NULL;  /*���½�û�Ǽ�          */
    v_Accnrq_Cnt RTRE0099.ACCNRQ_CNT%TYPE DEFAULT NULL;/*���������Ǽ�          */

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:���½�û��,�������� ����������� , ����� ID
    IF 0 != ISDATE(v_Acrq_Day) THEN
        v_Return_Message := '���½�û��('||v_Acrq_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Fr_Rpc_Day) THEN
        v_Return_Message := '�������� �����������('||v_Fr_Rpc_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_To_Rpc_Day) THEN
        v_Return_Message := '�������� ������������('||v_To_Rpc_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �ʱⰪ ����
    v_File_Tp  := 'EB13';
    v_File_Nm  := v_File_Tp||SUBSTR(v_Acrq_Day, 5, 4);
    v_Rqst_Day := v_Acrq_Day;

    -- 1. �������� �������� ������� ������ �����ϴ��� Ȯ���ϰ� �����ϸ� ������ ����ó���ϰ� �����޽��� ����
    IF 0 != Pkg_Rtre0099.f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') THEN
        v_Return_Message := '�ش� �������ڷ� ������� ����('||v_File_Nm||')�� �̹� �����ϹǷ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    -- �ۼ������ϱ���/��û����/���ϸ� ����  ���ϼ��� ȹ��
    v_File_Seq := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);

    -- 2. �������� �������� ������� ���� �������� �ʴ� ��� �ۼ��� �۾�( RTRE0099)�� ������ ����
    IF 0 != Pkg_Rtre0099.f_InsertRtre0099 (
                v_File_Tp   ,        /*(File_Tp  )�ۼ������ϱ���    */
                v_Rqst_Day  ,        /*(Rqst_Day )��û����          */
                v_File_Nm   ,        /*(File_Nm  )���ϸ�            */
                v_File_Seq  ,        /*(File_Seq )���ϼ���          */
                NULL,                /*(File_Data)���ϵ�����        */
                'N',                 /*(Extrc_Yn )������迩��      */
                'N',                 /*(Confi_Yn )���Ȯ�ο���      */
                'N',                 /*(Fcret_Yn )���ϻ�������      */
                'N',                 /*(Ftran_Yn )�������ۿ���      */
                NULL,                /*(Stdex_Dd )��������ü����    */
                v_Fr_Rpc_Day,        /*(Str_Day  )������ ������   */
                v_To_Rpc_Day,        /*(End_Day  )������ ������   */
                'N',                 /*(Header_Yn)HEADER ���翩��   */
                'N',                 /*(Trailer_Y)TRAILER ���翩��  */
                0,                   /*(Tdata_Cnt)������ �ѰǼ�     */
                0,                   /*(Tdata_Amt)������ �ѱݾ�     */
                0,                   /*(Acrq_Cnt )���½�û�Ǽ�      */
                0,                   /*(Accnrq_Cn)���������Ǽ�      */
                0,                   /*(Rmcnrq_Cn)�������������Ǽ�  */
                0,                   /*(Reqst_Cnt)��û�Ǽ�          */
                0,                   /*(Reqst_Amt)��û�ݾ�          */
                0,                   /*(Cncrq_Cnt)��ҿ�û�Ǽ�      */
                0,                   /*(Cncrq_Amt)��ҿ�û�ݾ�      */
                0,                   /*(Srecp_Cnt)������� ó���Ǽ� */
                0,                   /*(Srecp_Amt)������� ó���ݾ� */
                0,                   /*(Hsrcp_Cnt)�κа��� ó���Ǽ� */
                0,                   /*(Hsrcp_Amt)�κа��� ó���ݾ� */
                0,                   /*(Erecp_Cnt)�������� ó���Ǽ� */
                0,                   /*(Erecp_Amt)�������� ó���ݾ� */
                0,                   /*(Scnrq_Cnt)������� ó���Ǽ� */
                0,                   /*(Scnrq_Amt)������� ó���ݾ� */
                0,                   /*(Ecnrq_Cnt)��ҿ��� ó���Ǽ� */
                0,                   /*(Ecnrq_Amt)��ҿ��� ó���ݾ� */
                'N',                 /*(Del_Yn   )��������          */
                v_Reg_Id,            /*(Reg_Id   )����� ID         */
                v_ErrorText
                ) THEN

        v_Return_Message := ' �ۼ��� �۾�(RTRE0099) Insert ����!!!'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 3. �������� ���� ��� ���� ���½�û ���� ���� �� �ۼ����۾� ������ ������Ʈ
    p_InsertRtre0060Batch(v_Acrq_Day, v_Fr_Rpc_Day, v_To_Rpc_Day, v_Reg_Id, v_Acrq_Cnt, v_Accnrq_Cnt,
                          v_Success_Code, v_Return_Message, v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '�������� ���� ��� ���� ���½�û ���� ���� �� �ۼ����۾� ������ ������Ʈ ����!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;

    -- �ۼ��� �۾� Update - ���½��� ��� ��ġ ��� ������Ʈ
    IF 0 !=Pkg_Rtre0099.f_UpdateRtre0099BatchResult (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                                     'Y',  v_Acrq_Cnt, v_Accnrq_Cnt, 0, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾� Update - ���½��� ��� ��ġ ��� ������Ʈ ����!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;
    
    -- �ʱⰪ ����
    v_File_Tp  := 'EI13';
    v_File_Nm  := v_File_Tp||SUBSTR(v_Acrq_Day, 5, 4);

    -- 1. �������� �������� ������� ������ �����ϴ��� Ȯ���ϰ� �����ϸ� ������ ����ó���ϰ� �����޽��� ����
    IF 0 != Pkg_Rtre0099.f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') THEN
        v_Return_Message := '�ش� �������ڷ� ������� ����('||v_File_Nm||')�� �̹� �����ϹǷ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �ۼ������ϱ���/��û����/���ϸ� ����  ���ϼ��� ȹ��
    v_File_Seq := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);

    -- 2. �������� �������� ������� ���� �������� �ʴ� ��� �ۼ��� �۾�( RTRE0099)�� ������ ����
    IF 0 != Pkg_Rtre0099.f_InsertRtre0099 (
                v_File_Tp   ,        /*(File_Tp  )�ۼ������ϱ���    */
                v_Rqst_Day  ,        /*(Rqst_Day )��û����          */
                v_File_Nm   ,        /*(File_Nm  )���ϸ�            */
                v_File_Seq  ,        /*(File_Seq )���ϼ���          */
                NULL,                /*(File_Data)���ϵ�����        */
                'N',                 /*(Extrc_Yn )������迩��      */
                'N',                 /*(Confi_Yn )���Ȯ�ο���      */
                'N',                 /*(Fcret_Yn )���ϻ�������      */
                'N',                 /*(Ftran_Yn )�������ۿ���      */
                NULL,                /*(Stdex_Dd )��������ü����    */
                v_Fr_Rpc_Day,        /*(Str_Day  )������ ������   */
                v_To_Rpc_Day,        /*(End_Day  )������ ������   */
                'N',                 /*(Header_Yn)HEADER ���翩��   */
                'N',                 /*(Trailer_Y)TRAILER ���翩��  */
                0,                   /*(Tdata_Cnt)������ �ѰǼ�     */
                0,                   /*(Tdata_Amt)������ �ѱݾ�     */
                0,                   /*(Acrq_Cnt )���½�û�Ǽ�      */
                0,                   /*(Accnrq_Cn)���������Ǽ�      */
                0,                   /*(Rmcnrq_Cn)�������������Ǽ�  */
                0,                   /*(Reqst_Cnt)��û�Ǽ�          */
                0,                   /*(Reqst_Amt)��û�ݾ�          */
                0,                   /*(Cncrq_Cnt)��ҿ�û�Ǽ�      */
                0,                   /*(Cncrq_Amt)��ҿ�û�ݾ�      */
                0,                   /*(Srecp_Cnt)������� ó���Ǽ� */
                0,                   /*(Srecp_Amt)������� ó���ݾ� */
                0,                   /*(Hsrcp_Cnt)�κа��� ó���Ǽ� */
                0,                   /*(Hsrcp_Amt)�κа��� ó���ݾ� */
                0,                   /*(Erecp_Cnt)�������� ó���Ǽ� */
                0,                   /*(Erecp_Amt)�������� ó���ݾ� */
                0,                   /*(Scnrq_Cnt)������� ó���Ǽ� */
                0,                   /*(Scnrq_Amt)������� ó���ݾ� */
                0,                   /*(Ecnrq_Cnt)��ҿ��� ó���Ǽ� */
                0,                   /*(Ecnrq_Amt)��ҿ��� ó���ݾ� */
                'N',                 /*(Del_Yn   )��������          */
                v_Reg_Id,            /*(Reg_Id   )����� ID         */
                v_ErrorText
                ) THEN

        v_Return_Message := ' �ۼ��� �۾�(RTRE0099) Insert ����!!!'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- �ۼ��� �۾� Update - ���½��� ��� ��ġ ��� ������Ʈ
    IF 0 !=Pkg_Rtre0099.f_UpdateRtre0099BatchResult (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                                     'Y',  v_Acrq_Cnt, v_Accnrq_Cnt, 0, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾� Update - ���½��� ��� ��ġ ��� ������Ʈ ����!!!'||'-'||v_Return_Message;
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_InsertRtre0060Aggregate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_InsertRtre0060Aggregate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0060Aggregate;

  /*****************************************************************************
  -- ���½�û ���� ���� - ���½�û ������� �ϰ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0060Batch (
    v_Acrq_Day       IN  RTRE0060.ACRQ_DAY%TYPE,      /*���½�û��            */
    v_Fr_Rpc_Day     IN  VARCHAR,                     /*�������� ����������� */
    v_To_Rpc_Day     IN  VARCHAR,                     /*�������� ������������ */
    v_Reg_Id         IN  RTRE0060.REG_ID%TYPE,        /*����� ID             */
    v_Acrq_Cnt       OUT RTRE0099.ACRQ_CNT%TYPE,      /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     OUT RTRE0099.ACCNRQ_CNT%TYPE,    /*���������Ǽ�          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- ����������
    CURSOR  Cur_Terminate IS
    SELECT  '3'  ACRQ_TP, ORD_NO, BFCUST_NO, BFACC_SEQ, RPC_SEQ, BFACRQ_ST
    FROM    RTRE0050
    WHERE   RPC_DAY BETWEEN v_Fr_Rpc_Day AND v_To_Rpc_Day
    AND     BFPAY_MTHD  = 'A'
    AND     BFACRQ_ST   = '6'
    AND     DEL_YN      = 'N'
    AND     BFACC_SEQ IS NOT NULL;

    -- ���½�û��
--    CURSOR  Cur_Application IS
--    SELECT  '1' ACRQ_TP, ORD_NO, AFCUST_NO, AFACC_SEQ, RPC_SEQ, AFACC_STAT, AFACRQ_ST
--    FROM    RTRE0050
--    WHERE   RPC_DAY BETWEEN v_Fr_Rpc_Day AND v_To_Rpc_Day
--    AND     AFPAY_MTHD  = 'A'
--    AND     AFACC_STAT  = '0'
--    AND     AFACRQ_ST   = '0'
--    AND     DEL_YN      = 'N'
--    AND     AFACC_SEQ IS NOT NULL;
    
    CURSOR  Cur_Application IS
    SELECT  '1' ACRQ_TP, A.ORD_NO, A.AFCUST_NO, A.AFACC_SEQ, A.RPC_SEQ, A.AFACC_STAT, A.AFACRQ_ST, C.TXT_NO
      FROM  RTRE0050 A
         ,  RTRE0010 B
         ,  (
                SELECT  ROW_NUMBER() OVER (PARTITION BY X.CUST_NM, X.BANK_CD, X.ACCT_NO ORDER BY X.REG_DT DESC) AS ROW_NUM
                     ,  X.*
                  FROM  RTRE0013 X
                 WHERE  RSLT_CD = '0000'                     
            ) C
     WHERE  A.RPC_DAY BETWEEN v_Fr_Rpc_Day AND v_To_Rpc_Day  
       AND  A.AFPAY_MTHD  = 'A'
       AND  A.AFACC_STAT  = '0'
       AND  A.AFACRQ_ST   = '0'
       AND  A.DEL_YN      = 'N'
       AND  A.AFACC_SEQ  IS NOT NULL
       AND  A.AFACC_SEQ   = B.ACC_SEQ
--       AND  B.CUST_NM     = C.CUST_NM
       AND  B.BANK_CD     = C.BANK_CD
       AND  B.ACCT_NO     = C.ACCT_NO
       AND  C.ROW_NUM     = 1;                          /*�����ֱ� ������     */


    v_Acrq_Seq   RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL;   /*���½�û����        */
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;    /*���½�û ó������   */
    v_Bank_Cd    RTRE0060.BANK_CD%TYPE DEFAULT NULL;    /*�����ڵ�            */

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;      -- ����Ÿ ���翩��
  BEGIN

    -- ������ �ʱ�ȭ
    v_Acrq_Cnt := 0;
    v_Accnrq_Cnt := 0;
    v_Acrq_St := '2';           -- �������� �����̷»� �������� �������� ����


    -- ���������� ������ ó��
    FOR CUR IN Cur_Terminate LOOP
        EXIT WHEN Cur_Terminate%NOTFOUND;
        v_Acrq_Cnt := v_Acrq_Cnt+1;

        -- ���½�û���� ȹ��
        v_Acrq_Seq := f_sRtre0060AcrqSeq('A', v_Acrq_Day);

        -- �����ڵ�ȸ��
        v_Bank_Cd := Pkg_Rtre0010.f_sRtre0010BankCd( CUR.BFACC_SEQ );

        -- ���½�û���� ����
        IF 0!= f_InsertRtre0060 (
                      'A',            /*(Acrq_Fg )���½�û �߻�����     */
                      v_Acrq_Day,     /*(Acrq_Day)���½�û��            */
                      v_Acrq_Seq,     /*(Acrq_Seq)���½�û����          */
                      CUR.ORD_NO,     /*(Ord_No  )����ȣ              */
                      CUR.BFCUST_NO,  /*(Cust_No )���ڵ�              */
                      v_Bank_Cd,      /*(Bank_Cd )�����ڵ�              */
                      CUR.BFACC_SEQ,  /*(Acc_Seq )���¼���              */
                      CUR.ACRQ_TP,    /*(Acrq_Tp )���½�û����          */
                      CUR.RPC_SEQ,    /*(Rpc_Seq )���������û����      */
                      CUR.BFACRQ_ST,  /*(Acrq_St )���½�û ó������     */
                      NULL,           /*(Acercd  )���½�û ����ڵ�     */
                      NULL,           /*(v_Acbrcd)���°��� ���ڵ�       */
                      NULL,           /*(v_Rqbrcd)��� ���ڵ�           */
                      v_Reg_Id,       /*(Reg_Id  )����� ID             */
                      v_ErrorText
                      ) THEN
            v_Return_Message := '���������� ���½�û ���� ����� ���� �߻�!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;


        -- �������������̷�(RTRQ0050)�� ���½�û �߻�����, ���½�û��, ���½�û���� ������Ʈ
        IF 0!= Pkg_Rtre0050.f_UpdateRtre0050Terminate(CUR.RPC_SEQ, 'A', v_Acrq_Day, v_Acrq_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���������� �������������̷�(RTRQ0050)�� ���½�û �߻�����, ���½�û��, ���½�û���� ������Ʈ ����!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;

        -- �������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°�(������) Update
        IF 0!= Pkg_Rtre0050.f_UpdateRtre0050BeforeResult (CUR.RPC_SEQ, v_Acrq_St, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°� Update ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END LOOP;


    IF Cur_Terminate%ISOPEN THEN
        CLOSE Cur_Terminate;
    END IF;

    -- ���½�û�� ������ ó��
    FOR CUR IN Cur_Application LOOP
        EXIT WHEN Cur_Application%NOTFOUND;
        v_Accnrq_Cnt := v_Accnrq_Cnt+1;

        -- ���½�û���� ȹ��
        v_Acrq_Seq := f_sRtre0060AcrqSeq('A', v_Acrq_Day);

        -- �����ڵ�ȸ��
        v_Bank_Cd := Pkg_Rtre0010.f_sRtre0010BankCd( CUR.AFACC_SEQ );

        -- ���½�û���� ����
        IF 0!= f_InsertRtre0060RecData (
                      'A',             /*(Acrq_Fg    )���½�û �߻�����     */
                      v_Acrq_Day,      /*(Acrq_Day   )���½�û��            */
                      v_Acrq_Seq,      /*(Acrq_Seq   )���½�û����          */
                      CUR.ORD_NO,      /*(Ord_No     )����ȣ              */
                      CUR.AFCUST_NO,   /*(Cust_No    )���ڵ�              */
                      v_Bank_Cd,       /*(Bank_Cd    )�����ڵ�              */
                      CUR.AFACC_SEQ,   /*(Acc_Seq    )���¼���              */
                      CUR.ACRQ_TP,     /*(Acrq_Tp    )���½�û����          */
                      CUR.RPC_SEQ,     /*(Rpc_Seq    )���������û����      */
                      CUR.AFACRQ_ST,   /*(Acrq_St    )���½�û ó������     */
                      NULL,            /*(Acercd     )���½�û ����ڵ�     */
                      NULL,            /*(v_Acbrcd   )���°��� ���ڵ�       */
                      NULL,            /*(v_Rqbrcd   )��� ���ڵ�           */
                      v_Reg_Id,        /*(Reg_Id     )����� ID             */
                      CUR.TXT_NO,      /*(Txt_No     )����������ȣ          */
                      v_ErrorText
                      ) THEN
            v_Return_Message := '���½�û�� ���½�û ���� ����� ���� �߻�!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;

        -- �������������̷�(RTRQ0050)�� ���½�û �߻�����, ���½�û��, ���½�û���� ������Ʈ
        IF 0!= Pkg_Rtre0050.f_UpdateRtre0050Application(CUR.RPC_SEQ, 'A', v_Acrq_Day, v_Acrq_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���½�û�� �������������̷�(RTRQ0050)�� ���½�û �߻�����, ���½�û��, ���½�û���� ������Ʈ ����!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;

        -- �������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°�(������) Update
        IF 0!= Pkg_Rtre0050.f_UpdateRtre0050AfterResult (CUR.RPC_SEQ, CUR.AFACC_STAT, v_Acrq_St, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°� Update ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    END LOOP;

    IF Cur_Application%ISOPEN THEN
        CLOSE Cur_Application;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_InsertRtre0060Batch(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_InsertRtre0060Batch(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0060Batch;


  /*****************************************************************************
  -- ���½�û ����(RTRE0060) Update - ���½�ûó�� ���¸� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0060
    SET    ACRQ_ST  = v_Acrq_St,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ACRQ_FG  = v_Acrq_Fg
    AND    ACRQ_DAY = v_Acrq_Day;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060AcrqSt;

  /*****************************************************************************
  -- ���½�û ���� Count - ����ȣ ���� ���翩�� Ȯ��
  *****************************************************************************/
  FUNCTION f_sRtre0060OrdCount(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*���½�û �߻�����   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,         /*���½�û��          */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,         /*���½�û����        */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE            /*����ȣ            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day
    AND     ACRQ_SEQ = v_Acrq_Seq
    AND     ORD_NO   = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0060OrdCount;


  /*****************************************************************************
  -- ���½�û ����(RTRE0060) Update - ���½�ûó������ ���� ���½�ûó�� ���¸� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqTpSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    --���½�û����(ACRQ_TP - R015) 1�̸� 3, 3�̸� 7, 7�̸� 7, �׿ܴ� ����ó��(����ó���� ���� ������ �ڸ���(1) ���� �߻���Ŵ)
    UPDATE RTRE0060
    SET    ACRQ_ST   = DECODE(ACRQ_TP, '1', '3', '3', '7', '7', '999'),
           ACERCD    = v_Acercd,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACRQ_FG   = v_Acrq_Fg
    AND    ACRQ_DAY  = v_Acrq_Day
    AND    ACRQ_SEQ  = v_Acrq_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060AcrqTpSt;


  /*****************************************************************************
  -- ���½�û ����(RTRE0060) Update - ���½�û ó�����¿� ����ڵ� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqcdSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0060
    SET    ACRQ_ST   = v_Acrq_St,
           ACERCD    = v_Acercd,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACRQ_FG   = v_Acrq_Fg
    AND    ACRQ_DAY  = v_Acrq_Day
    AND    ACRQ_SEQ  = v_Acrq_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060AcrqcdSt;

  /*****************************************************************************
  -- ���½�û ����(RTRE0060) Update - ���½�û ó�����¿� ���������û���� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqStRpcSeq (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*���½�û����          */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*���½�û ó������     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*���½�û ����ڵ�     */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*���������û����      */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0060
    SET    ACRQ_ST   = v_Acrq_St,
           ACERCD    = v_Acercd,
           RPC_SEQ   = v_Rpc_Seq,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACRQ_FG   = v_Acrq_Fg
    AND    ACRQ_DAY  = v_Acrq_Day
    AND    ACRQ_SEQ  = v_Acrq_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060AcrqStRpcSeq;


  /*****************************************************************************
  -- ���½�û ���� Delete - ���½�û �߻�����, ���½�û�� ���� ��� ����
  *****************************************************************************/
  FUNCTION f_DeleteRtre0060All (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*���½�û��            */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060All(1)', 'v_Acrq_Fg', v_Acrq_Fg);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060All(1)', 'v_Acrq_Day', v_Acrq_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060All(1)', 'v_Reg_Id', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0060All;


  /*****************************************************************************
  -- ���½�û ���� - ����ȣ ���� ���翩�� Ȯ��
  *****************************************************************************/
  FUNCTION f_sRtre0060AcrqSt(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE        /*���½�û��            */
    ) RETURN VARCHAR IS
    v_Acrq_St   RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;   /*���½�û ó������     */
  BEGIN

    SELECT  ACRQ_ST
    INTO    v_Acrq_St
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day;

    RETURN v_Acrq_St;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0060AcrqSt;

END Pkg_Rtre0060;
/
