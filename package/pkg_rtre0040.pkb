CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0040 AS
/*******************************************************************************
   NAME      Pkg_Rtre0040
   PURPOSE   ������ �������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ������ �������� Count
  *****************************************************************************/
  FUNCTION f_sRtre0040Count(
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0040
    WHERE   RECV_SEQ = v_Recv_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0040Count;

  /*****************************************************************************
  -- ������ �������� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0040 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*������ ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ,                  /*�����ŷ���ȣ        */
            A.RECV_DAY,                  /*��������            */
            A.ORD_NO,                    /*����ȣ            */
            A.CUST_NO,                   /*����ȣ            */
            A.RECP_AMT,                  /*�����ݾ�            */
            A.RECP_PAY,                  /*�������            */
            A.RECP_FG,                   /*��������            */
            A.BANK_RECP_DAY,             /*�����Ա���          */
            A.CNC_RSEQ,                  /*������Ұŷ���ȣ    */
            A.CNC_STAT,                  /*������ҿ���        */
            A.RECP_ID,                   /*������ ID           */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0040 A
    WHERE   A.RECV_SEQ      = DECODE(v_Recv_Seq      , NULL, A.RECV_SEQ      , v_Recv_Seq)
    AND     A.RECV_DAY      = DECODE(v_Recv_Day      , NULL, A.RECV_DAY      , v_Recv_Day)
    AND     A.ORD_NO        = DECODE(v_Ord_No        , NULL, A.ORD_NO        , v_Ord_No)
    AND     A.CUST_NO       = DECODE(v_Cust_No       , NULL, A.CUST_NO       , v_Cust_No)
    AND     A.RECP_AMT      = DECODE(v_Recp_Amt      , NULL, A.RECP_AMT      , v_Recp_Amt)
    AND     A.RECP_PAY      = DECODE(v_Recp_Pay      , NULL, A.RECP_PAY      , v_Recp_Pay)
    AND     A.RECP_FG       = DECODE(v_Recp_Fg       , NULL, A.RECP_FG       , v_Recp_Fg)
    AND     A.BANK_RECP_DAY = DECODE(v_Bank_Recp_Day , NULL, A.BANK_RECP_DAY , v_Bank_Recp_Day)
    AND     A.CNC_RSEQ      = DECODE(v_Cnc_Rseq      , NULL, A.CNC_RSEQ      , v_Cnc_Rseq)
    AND     A.CNC_STAT      = DECODE(v_Cnc_Stat      , NULL, A.CNC_STAT      , v_Cnc_Stat)
    AND     A.RECP_ID       = DECODE(v_Recp_Id       , NULL, A.RECP_ID       , v_Recp_Id)
    AND     A.REG_ID        = DECODE(v_Reg_Id        , NULL, A.REG_ID        , v_Reg_Id);

  END p_sRtre0040;

  /*****************************************************************************
  -- ������ �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*������ ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0040 (
            RECV_SEQ,
            RECV_DAY,
            ORD_NO,
            CUST_NO,
            RECP_AMT,
            RECP_PAY,
            RECP_FG,
            BANK_RECP_DAY,
            CNC_RSEQ,
            CNC_STAT,
            RECP_ID,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Recv_Day,
            v_Ord_No,
            v_Cust_No,
            v_Recp_Amt,
            v_Recp_Pay,
            v_Recp_Fg,
            v_Bank_Recp_Day,
            v_Cnc_Rseq,
            v_Cnc_Stat,
            v_Recp_Id,
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

  END f_InsertRtre0040;

  /*****************************************************************************
  -- ������ �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*������ ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0040
    SET    RECV_DAY      = v_Recv_Day,
           ORD_NO        = v_Ord_No,
           CUST_NO       = v_Cust_No,
           RECP_AMT      = v_Recp_Amt,
           RECP_PAY      = v_Recp_Pay,
           RECP_FG       = v_Recp_Fg,
           BANK_RECP_DAY = v_Bank_Recp_Day,
           CNC_RSEQ      = v_Cnc_Rseq,
           CNC_STAT      = v_Cnc_Stat,
           RECP_ID       = v_Recp_Id,
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE 
    WHERE  RECV_SEQ      = v_Recv_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0040;

  /*****************************************************************************
  -- ������ �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0040 (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0040
    WHERE   RECV_SEQ = v_Recv_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0040.f_DeleteRtre0040(2)', '�����ŷ���ȣ', v_Recv_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0040.f_DeleteRtre0040(2)', '����� ID', v_Reg_Id);
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0040;

  /*****************************************************************************
  -- ������ �������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0040 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Recv_Seq       IN OUT RTRE0040.RECV_SEQ%TYPE,   /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Amt       IN RTRE0040.RECP_AMT%TYPE,       /*�����ݾ�              */
    v_Recp_Pay       IN RTRE0040.RECP_PAY%TYPE,       /*�������              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Bank_Recp_Day  IN RTRE0040.BANK_RECP_DAY%TYPE,  /*�����Ա���            */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Recp_Id        IN RTRE0040.RECP_ID%TYPE,        /*������ ID             */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: �������� ,����ȣ ,����ȣ ,�����ݾ� ,������� ,�������� ,�����Ա��� ,������Ұŷ���ȣ ,������ҿ��� ,����� ID    
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '��������('||v_Recv_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '����ȣ('||v_Ord_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '����ȣ('||v_Cust_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Recp_Amt) IS NULL THEN
        v_Return_Message := '�����ݾ�('||v_Recp_Amt||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Recp_Pay) IS NULL THEN
        v_Return_Message := '�������('||v_Recp_Pay||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;        
    
    IF TRIM(v_Recp_Fg) IS NULL THEN
        v_Return_Message := '��������('||v_Recp_Fg||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
    
    IF 0 != ISDATE(v_Bank_Recp_Day) THEN
        v_Return_Message := '�����Ա���('||v_Bank_Recp_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
--    IF TRIM(v_Cnc_Rseq) IS NULL THEN
--        v_Return_Message := '������Ұŷ���ȣ('||v_Cnc_Rseq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
--        RAISE e_Error;
--    END IF;
    
    IF TRIM(v_Cnc_Stat) IS NULL THEN
        v_Return_Message := '������ҿ���('||v_Cnc_Stat||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;      
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
    
    
    IF v_Comm_Dvsn = 'I' THEN     

        IF 0 != f_sRtre0040Count(v_Recv_Seq) THEN
            v_Return_Message := '�ش��('||v_Recv_Seq||')���� �̹� ��ϵ� �����Ͱ� �����ϹǷ� �űԵ�� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;   
            
        v_Recv_Seq := f_sRtre0040RecvSeq();
        
        IF 0 != f_InsertRtre0040(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No, 
                                 v_Recp_Amt, v_Recp_Pay, v_Recp_Fg, v_Bank_Recp_Day, 
                                 v_Cnc_Rseq, v_Cnc_Stat, v_Recp_Id, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := '������ �������� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0040Count(v_Recv_Seq) THEN
            v_Return_Message := '�ش��('||v_Recv_Seq||')���� ��ϵ� �����Ͱ� �������� �������� ����/���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;           
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0040(v_Recv_Seq, v_Recv_Day, v_Ord_No, v_Cust_No, 
                                     v_Recp_Amt, v_Recp_Pay, v_Recp_Fg, v_Bank_Recp_Day, 
                                     v_Cnc_Rseq, v_Cnc_Stat, v_Recp_Id, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '������ �������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0040(v_Recv_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '������ �������� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0040.p_IUDRtre0040(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0040.p_IUDRtre0040(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0040;

  /*****************************************************************************
  -- ������ �������� - �����ŷ���ȣ ü�� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0040RecvSeq RETURN NUMBER IS
    v_Recv_Seq  RTRE0040.RECV_SEQ%TYPE DEFAULT NULL;     /*�����ŷ���ȣ        */
  BEGIN
  
    -- �ŷ��Ϸù�ȣ ������ ���� �����    
    SELECT  SEQ_Rtre0030Recv_Seq.NEXTVAL RPC_SEQ
    INTO    v_Recv_Seq
    FROM    DUAL;
    
    RETURN v_Recv_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0040RecvSeq;


  /*****************************************************************************
  -- ������ �������� - ��Ұ��ɿ��� �Ǵ� - ��Ұ��ɻ��� �Ǽ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0040CncCount(
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN
  
    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0040
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     CNC_RSEQ IS NULL -- ������Ұŷ���ȣ
    AND     CNC_STAT = 'N';  -- ������ҿ���

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0040CncCount;
    
  /*****************************************************************************
  -- ������ �������� - ������� - ���ŷ���������
  *****************************************************************************/
  FUNCTION f_UpdateRtre0040Cancel (
    v_Recv_Seq       IN RTRE0040.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Recv_Day       IN RTRE0040.RECV_DAY%TYPE,       /*��������              */
    v_Ord_No         IN RTRE0040.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTRE0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Recp_Fg        IN RTRE0040.RECP_FG%TYPE,        /*��������              */
    v_Cnc_Rseq       IN RTRE0040.CNC_RSEQ%TYPE,       /*������Ұŷ���ȣ      */
    v_Cnc_Stat       IN RTRE0040.CNC_STAT%TYPE,       /*������ҿ���          */
    v_Reg_Id         IN RTRE0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0040
    SET    CNC_RSEQ = v_Cnc_Rseq,
           CNC_STAT = v_Cnc_Stat,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RECV_SEQ = v_Recv_Seq;
    
    IF 0 = SQL%ROWCOUNT THEN
        v_ErrorText := '�ش��('||v_Recv_Seq||')���� ��ϵ� ������(������ ��������:RTRE0040)�� �������� �ʾ� ���ó���� �Ұ� �մϴ�!';
        RETURN -1;
    END IF;

    INSERT  INTO RTRE0040 (
            RECV_SEQ,
            RECV_DAY,
            ORD_NO,
            CUST_NO,
            RECP_AMT,
            RECP_PAY,
            RECP_FG,
            BANK_RECP_DAY,
            CNC_RSEQ,
            CNC_STAT,
            RECP_ID,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  v_Cnc_Rseq RECV_SEQ,
            v_Recv_Day RECV_DAY,
            v_Ord_No   ORD_NO,
            v_Cust_No  CUST_NO,
            - RECP_AMT,
            RECP_PAY,
            v_Recp_Fg RECP_FG,
            BANK_RECP_DAY,
            v_Recv_Seq CNC_RSEQ,
            v_Cnc_Stat CNC_STAT,
            RECP_ID,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0040
    WHERE   RECV_SEQ = v_Recv_Seq;
            
    IF 0 = SQL%ROWCOUNT THEN
        v_ErrorText := '�ش��('||v_Cnc_Rseq||')���� ��� ������(������ ��������:RTRE0040) 0������ ��Ͽ� �����Ͽ����ϴ�.!';
        RETURN -1;
    END IF;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0040Cancel;

END Pkg_Rtre0040;
/
