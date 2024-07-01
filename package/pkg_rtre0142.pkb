CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE0142 AS
/*******************************************************************************
    NAME        PKG_RTRE0142
    PURPOSE     ������� �뺸���� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] �ű� ����
    1.1     2017-11-21  wjim            [20171121_01] �Ա��뺸 ������� catch �߰�
*******************************************************************************/
  
  /*****************************************************************************
  -- ������� �뺸���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0142 (
      v_Tno             IN RTRE0142.TNO%TYPE        /* �ŷ�������ȣ        */
    , v_Site_Cd         IN RTRE0142.SITE_CD%TYPE    /* �������ڵ�          */
    , v_Order_No        IN RTRE0142.ORDER_NO%TYPE   /* �ֹ���ȣ            */
    , v_Tx_Cd           IN RTRE0142.TX_CD%TYPE      /* ����ó�������ڵ�    */
    , v_Tx_Tm           IN RTRE0142.TX_TM%TYPE      /* ����ó���Ϸ��Ͻ�    */
    , v_Ipgm_Name       IN RTRE0142.IPGM_NAME%TYPE  /* �ֹ��ڸ�            */
    , v_Mnyx            IN RTRE0142.IPGM_MNYX%TYPE  /* �����Աݱݾ�        */
    , v_Total_Mnyx      IN RTRE0142.TOTAL_MNYX%TYPE /* �Աݱݾ��հ�        */
    , v_Ipgm_Time       IN RTRE0142.IPGM_TIME%TYPE  /* �Ա��Ͻ�            */
    , v_Vaccount        IN RTRE0142.VACCOUNT%TYPE   /* �Աݰ�����¹�ȣ    */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* �Ա��뺸ID          */
    , v_Op_Cd           IN RTRE0142.OP_CD%TYPE      /* �Աݰ���ڵ�        */
    , v_Remitter        IN RTRE0142.REMITTER%TYPE   /* �Ա��ڸ�            */
    , v_Cash_No         IN RTRE0142.CASH_NO%TYPE    /* ���ݿ����� �ŷ���ȣ */
    , v_Cash_A_No       IN RTRE0142.CASH_A_NO%TYPE  /* ���ݿ����� ���ι�ȣ */
    , v_Cash_A_Dt       IN RTRE0142.CASH_A_DT%TYPE  /* ���ݿ����� ���νð� */       
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* �����ID            */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    INSERT  INTO RTRE0142 (
          TNO
        , NOTI_SEQ
        , SITE_CD
        , ORDER_NO
        , TX_CD
        , TX_TM
        , IPGM_NAME
        , IPGM_MNYX
        , TOTAL_MNYX
        , IPGM_TIME
        , VACCOUNT
        , NOTI_ID
        , OP_CD
        , REMITTER
        , CASH_NO
        , CASH_A_NO
        , CASH_A_DT
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    ) VALUES (
          v_Tno             /* �ŷ�������ȣ        */
        , (
            SELECT  NVL2(MAX(NOTI_SEQ), TO_NUMBER(MAX(NOTI_SEQ))+1, 1) 
              FROM  RTRE0142
             WHERE  TNO = v_Tno         
          )                 /* �뺸����            */
        , v_Site_Cd         /* �������ڵ�          */
        , v_Order_No        /* �ֹ���ȣ            */
        , v_Tx_Cd           /* ����ó�������ڵ�    */
        , v_Tx_Tm           /* ����ó���Ϸ��Ͻ�    */
        , v_Ipgm_Name       /* �ֹ��ڸ�            */
        , v_Mnyx            /* �����Աݱݾ�        */
        , v_Total_Mnyx      /* �Աݱݾ��հ�        */
        , v_Ipgm_Time       /* �Ա��Ͻ�            */
        , v_Vaccount        /* �Աݰ�����¹�ȣ    */
        , v_Noti_Id         /* �Ա��뺸ID          */
        , v_Op_Cd           /* �Աݰ���ڵ�        */
        , v_Remitter        /* �Ա��ڸ�            */
        , v_Cash_No         /* ���ݿ����� �ŷ���ȣ */
        , v_Cash_A_No       /* ���ݿ����� ���ι�ȣ */
        , v_Cash_A_Dt       /* ���ݿ����� ���νð� */
        , v_Reg_Id          /* �����ID            */   
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0142;
  
  /*****************************************************************************
  -- ������� �뺸���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0142 (
      v_Tno             IN RTRE0142.TNO%TYPE        /* �ŷ�������ȣ        */
    , v_Noti_Seq        IN RTRE0142.NOTI_SEQ%TYPE   /* �뺸����            */
    , v_Site_Cd         IN RTRE0142.SITE_CD%TYPE    /* �������ڵ�          */
    , v_Order_No        IN RTRE0142.ORDER_NO%TYPE   /* �ֹ���ȣ            */
    , v_Tx_Cd           IN RTRE0142.TX_CD%TYPE      /* ����ó�������ڵ�    */
    , v_Tx_Tm           IN RTRE0142.TX_TM%TYPE      /* ����ó���Ϸ��Ͻ�    */
    , v_Ipgm_Name       IN RTRE0142.IPGM_NAME%TYPE  /* �ֹ��ڸ�            */
    , v_Mnyx            IN RTRE0142.IPGM_MNYX%TYPE  /* �����Աݱݾ�        */
    , v_Total_Mnyx      IN RTRE0142.TOTAL_MNYX%TYPE /* �Աݱݾ��հ�        */
    , v_Ipgm_Time       IN RTRE0142.IPGM_TIME%TYPE  /* �Ա��Ͻ�            */
    , v_Vaccount        IN RTRE0142.VACCOUNT%TYPE   /* �Աݰ�����¹�ȣ    */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* �Ա��뺸ID          */
    , v_Op_Cd           IN RTRE0142.OP_CD%TYPE      /* �Աݰ���ڵ�        */
    , v_Remitter        IN RTRE0142.REMITTER%TYPE   /* �Ա��ڸ�            */
    , v_Cash_No         IN RTRE0142.CASH_NO%TYPE    /* ���ݿ����� �ŷ���ȣ */
    , v_Cash_A_No       IN RTRE0142.CASH_A_NO%TYPE  /* ���ݿ����� ���ι�ȣ */
    , v_Cash_A_Dt       IN RTRE0142.CASH_A_DT%TYPE  /* ���ݿ����� ���νð� */       
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* �����ID            */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTRE0142
       SET  NOTI_SEQ   = v_Noti_Seq         /* �뺸����            */
         ,  SITE_CD    = v_Site_Cd          /* �������ڵ�          */
         ,  ORDER_NO   = v_Order_No         /* �ֹ���ȣ            */
         ,  TX_CD      = v_Tx_Cd            /* ����ó�������ڵ�    */
         ,  TX_TM      = v_Tx_Tm            /* ����ó���Ϸ��Ͻ�    */
         ,  IPGM_NAME  = v_Ipgm_Name        /* �ֹ��ڸ�            */
         ,  IPGM_MNYX  = v_Mnyx             /* �����Աݱݾ�        */
         ,  TOTAL_MNYX = v_Total_Mnyx       /* �Աݱݾ��հ�        */
         ,  IPGM_TIME  = v_Ipgm_Time        /* �Ա��Ͻ�            */
         ,  VACCOUNT   = v_Vaccount         /* �Աݰ�����¹�ȣ    */
         ,  NOTI_ID    = v_Noti_Id          /* �Ա��뺸ID          */
         ,  OP_CD      = v_Op_Cd            /* �Աݰ���ڵ�        */
         ,  REMITTER   = v_Remitter         /* �Ա��ڸ�            */
         ,  CASH_NO    = v_Cash_No          /* ���ݿ����� �ŷ���ȣ */
         ,  CASH_A_NO  = v_Cash_A_No        /* ���ݿ����� ���ι�ȣ */
         ,  CASH_A_DT  = v_Cash_A_Dt        /* ���ݿ����� ���νð� */
         ,  REG_ID     = v_Reg_Id           /* �����ID            */
         ,  CHG_ID     = v_Reg_Id
         ,  CHG_DT     = SYSDATE
     WHERE  TNO        = v_Tno
    ;     

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0142;
  
  /*****************************************************************************
  -- ������� �뺸���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0142 (
      v_Comm_Dvsn       IN CHAR                     /* ó������(I,U,D)       */
    , v_Tno             IN RTRE0142.TNO%TYPE        /* �ŷ�������ȣ        */
    , v_Noti_Seq        IN RTRE0142.NOTI_SEQ%TYPE   /* �뺸����            */
    , v_Site_Cd         IN RTRE0142.SITE_CD%TYPE    /* �������ڵ�          */
    , v_Order_No        IN RTRE0142.ORDER_NO%TYPE   /* �ֹ���ȣ            */
    , v_Tx_Cd           IN RTRE0142.TX_CD%TYPE      /* ����ó�������ڵ�    */
    , v_Tx_Tm           IN RTRE0142.TX_TM%TYPE      /* ����ó���Ϸ��Ͻ�    */ 
    , v_Ipgm_Name       IN RTRE0142.IPGM_NAME%TYPE  /* �ֹ��ڸ�            */
    , v_Mnyx            IN RTRE0142.IPGM_MNYX%TYPE  /* �����Աݱݾ�        */
    , v_Total_Mnyx      IN RTRE0142.TOTAL_MNYX%TYPE /* �Աݱݾ��հ�        */
    , v_Ipgm_Time       IN RTRE0142.IPGM_TIME%TYPE  /* �Ա��Ͻ�            */
    , v_Vaccount        IN RTRE0142.VACCOUNT%TYPE   /* �Աݰ�����¹�ȣ    */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* �Ա��뺸ID          */
    , v_Op_Cd           IN RTRE0142.OP_CD%TYPE      /* �Աݰ���ڵ�        */
    , v_Remitter        IN RTRE0142.REMITTER%TYPE   /* �Ա��ڸ�            */
    , v_Cash_No         IN RTRE0142.CASH_NO%TYPE    /* ���ݿ����� �ŷ���ȣ */
    , v_Cash_A_No       IN RTRE0142.CASH_A_NO%TYPE  /* ���ݿ����� ���ι�ȣ */
    , v_Cash_A_Dt       IN RTRE0142.CASH_A_DT%TYPE  /* ���ݿ����� ���νð� */       
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* �����ID            */     
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ��� Ȯ��
    IF TRIM(v_Tno) IS NULL THEN
        v_Return_Message := '�ŷ�������ȣ : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0142 (
              v_Tno             /* �ŷ�������ȣ        */
            , v_Site_Cd         /* �������ڵ�          */
            , v_Order_No        /* �ֹ���ȣ            */
            , v_Tx_Cd           /* ����ó�������ڵ�    */
            , v_Tx_Tm           /* ����ó���Ϸ��Ͻ�    */ 
            , v_Ipgm_Name       /* �ֹ��ڸ�            */
            , v_Mnyx            /* �����Աݱݾ�        */
            , v_Total_Mnyx      /* �Աݱݾ��հ�        */
            , v_Ipgm_Time       /* �Ա��Ͻ�            */
            , v_Vaccount        /* �Աݰ�����¹�ȣ    */
            , v_Noti_Id         /* �Ա��뺸ID          */
            , v_Op_Cd           /* �Աݰ���ڵ�        */
            , v_Remitter        /* �Ա��ڸ�            */
            , v_Cash_No         /* ���ݿ����� �ŷ���ȣ */
            , v_Cash_A_No       /* ���ݿ����� ���ι�ȣ */
            , v_Cash_A_Dt       /* ���ݿ����� ���νð� */
            , v_Reg_Id          /* �����ID            */    
            , v_ErrorText
        ) THEN
            v_Return_Message := '������� �뺸���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtre0142 (
              v_Tno             /* �ŷ�������ȣ        */
            , v_Noti_Seq        /* �뺸����            */
            , v_Site_Cd         /* �������ڵ�          */
            , v_Order_No        /* �ֹ���ȣ            */
            , v_Tx_Cd           /* ����ó�������ڵ�    */
            , v_Tx_Tm           /* ����ó���Ϸ��Ͻ�    */ 
            , v_Ipgm_Name       /* �ֹ��ڸ�            */
            , v_Mnyx            /* �����Աݱݾ�        */
            , v_Total_Mnyx      /* �Աݱݾ��հ�        */
            , v_Ipgm_Time       /* �Ա��Ͻ�            */
            , v_Vaccount        /* �Աݰ�����¹�ȣ    */
            , v_Noti_Id         /* �Ա��뺸ID          */
            , v_Op_Cd           /* �Աݰ���ڵ�        */
            , v_Remitter        /* �Ա��ڸ�            */
            , v_Cash_No         /* ���ݿ����� �ŷ���ȣ */
            , v_Cash_A_No       /* ���ݿ����� ���ι�ȣ */
            , v_Cash_A_Dt       /* ���ݿ����� ���νð� */
            , v_Reg_Id          /* �����ID            */    
            , v_ErrorText
        ) THEN
            v_Return_Message := '������� �뺸���� ���� ����!!!'||'-'||v_ErrorText;
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
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0142.p_IUDRtre0142(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0142.p_IUDRtre0142(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0142;
  
  /*****************************************************************************
  -- ������� KCP �����뺸 ó��
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.1     2017-11-21  wjim            [20171121_01] �Ա��뺸 ������� catch �߰�
  *****************************************************************************/
  PROCEDURE p_CreateRtre0142KcpNoti (
      v_Tno             IN RTRE0142.TNO%TYPE        /* �ŷ�������ȣ        */
    , v_Site_Cd         IN RTRE0142.SITE_CD%TYPE    /* �������ڵ�          */
    , v_Order_No        IN RTRE0142.ORDER_NO%TYPE   /* �ֹ���ȣ            */
    , v_Tx_Cd           IN RTRE0142.TX_CD%TYPE      /* ����ó�������ڵ�    */
    , v_Tx_Tm           IN RTRE0142.TX_TM%TYPE      /* ����ó���Ϸ��Ͻ�    */ 
    , v_Ipgm_Name       IN RTRE0142.IPGM_NAME%TYPE  /* �ֹ��ڸ�            */
    , v_Mnyx            IN RTRE0142.IPGM_MNYX%TYPE  /* �����Աݱݾ�        */
    , v_Total_Mnyx      IN RTRE0142.TOTAL_MNYX%TYPE /* �Աݱݾ��հ�        */
    , v_Ipgm_Time       IN RTRE0142.IPGM_TIME%TYPE  /* �Ա��Ͻ�            */
    , v_Vaccount        IN RTRE0142.VACCOUNT%TYPE   /* �Աݰ�����¹�ȣ    */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* �Ա��뺸ID          */
    , v_Op_Cd           IN RTRE0142.OP_CD%TYPE      /* �Աݰ���ڵ�        */
    , v_Remitter        IN RTRE0142.REMITTER%TYPE   /* �Ա��ڸ�            */
    , v_Cash_No         IN RTRE0142.CASH_NO%TYPE    /* ���ݿ����� �ŷ���ȣ */
    , v_Cash_A_No       IN RTRE0142.CASH_A_NO%TYPE  /* ���ݿ����� ���ι�ȣ */
    , v_Cash_A_Dt       IN RTRE0142.CASH_A_DT%TYPE  /* ���ݿ����� ���νð� */            
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
    
  BEGIN

    -------------------
    -- �뺸��� ���� --
    -------------------
    p_IUDRtre0142 (
          'I'               /* ó������(I,U,D)     */
        , v_Tno             /* �ŷ�������ȣ        */
        , NULL              /* �뺸����            */
        , v_Site_Cd         /* �������ڵ�          */
        , v_Order_No        /* �ֹ���ȣ            */
        , v_Tx_Cd           /* ����ó�������ڵ�    */
        , v_Tx_Tm           /* ����ó���Ϸ��Ͻ�    */ 
        , v_Ipgm_Name       /* �ֹ��ڸ�            */
        , v_Mnyx            /* �����Աݱݾ�        */
        , v_Total_Mnyx      /* �Աݱݾ��հ�        */
        , v_Ipgm_Time       /* �Ա��Ͻ�            */
        , v_Vaccount        /* �Աݰ�����¹�ȣ    */
        , v_Noti_Id         /* �Ա��뺸ID          */
        , v_Op_Cd           /* �Աݰ���ڵ�        */
        , v_Remitter        /* �Ա��ڸ�            */
        , v_Cash_No         /* ���ݿ����� �ŷ���ȣ */
        , v_Cash_A_No       /* ���ݿ����� ���ι�ȣ */
        , v_Cash_A_Dt       /* ���ݿ����� ���νð� */
        , 'KCP_NOTI'        /* �����ID            */     
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    -- [20171121_01]
    IF 0 != v_Success_Code THEN
        v_Return_Message := '�뺸��� ���� ����!!('||v_Order_No||')-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText      := '';
        

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0142.p_exeRtre0142KcpNoti(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0142.p_exeRtre0142KcpNoti(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0142KcpNoti;
  
  /*****************************************************************************
  -- ������� ����ó�� 
  -- - Pkg_Rtre0080.p_CreateRtre0080CardReceive �� �����Ͽ� ����
  *****************************************************************************/
  PROCEDURE p_CreateRtre0142VaReceive (
      v_Tno             IN RTRE0142.TNO%TYPE        /* �ŷ�������ȣ        */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* �Ա��뺸ID          */
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* �����ID            */       
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    ln_Chk_Cnt      NUMBER;
    ln_Exe_Cnt      NUMBER;
    
    ln_Remain_Amt   RTRE0141.ARRE_AMT%TYPE;
    ln_Tarre_Amt    RTRE0141.ARRE_AMT%TYPE;
    ln_Trecp_Amt    RTRE0141.ARRE_AMT%TYPE;
    ln_Arre_Amt     RTRE0141.ARRE_AMT%TYPE;
    ln_Recp_Amt     RTRE0142.TOTAL_MNYX%TYPE;
    ln_Pend_Amt     RTRE0142.TOTAL_MNYX%TYPE;
    ln_Rear_Amt     RTRE0142.TOTAL_MNYX%TYPE;
    ln_Recv_Seq     RTRE0030.RECV_SEQ%TYPE;
    
    lr_Re0140       RTRE0140%ROWTYPE;
    lr_Re0142       RTRE0142%ROWTYPE;
    
    Ref_Cursor      SYS_REFCURSOR;
    
    e_Error         EXCEPTION;
    
  BEGIN

    /*
     * �ʼ��� �Է� Ȯ��
     */
    IF (TRIM(v_Tno) IS NULL) OR (TRIM(v_Tno) = '') THEN
        v_Return_Message := '�ŷ�������ȣ : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (TRIM(v_Reg_Id) = '') THEN
        v_Return_Message := '�����ID : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    /*
     * �ش� �ŷ�������ȣ�� ����ó����� ����
     */
   -- ��������뺸���� ���� ����
    SELECT  NVL(COUNT(1), 0)
      INTO  ln_Chk_Cnt
      FROM  RTRE0142
     WHERE  TNO = v_Tno;
     
    IF ln_Chk_Cnt = 0 THEN
        v_Return_Message := '�ش� �ŷ�������ȣ('||v_Tno||')�� ����� ��������뺸����(RTRE0142)�� �������� �ʽ��ϴ�!';
        RAISE e_Error;
    END IF;
    
    -- ������³��� ���� ����
    SELECT  NVL(COUNT(1), 0)
      INTO  ln_Chk_Cnt
      FROM  RTRE0140
     WHERE  TNO = v_Tno
       AND  RQST_STAT IN ('3');
     
    IF ln_Chk_Cnt = 0 THEN
        v_Return_Message := '�ش� �ŷ�������ȣ('||v_Tno||')�� ��ȿ�� ������³���(RTRE0140)�� �������� �ʾ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    /*
     * ������󸮽�Ʈ �ӽ����̺� ���翩�� Ȯ��
     * - ������� �ӽ����̺� ����
     */
    SELECT  COUNT(*)
      INTO  ln_Chk_Cnt
      FROM  USER_TABLES
     WHERE  TABLE_NAME = 'RTTEMP01';     
         
    IF (SQL%NOTFOUND) OR (ln_Chk_Cnt = 0) THEN
    
        EXECUTE IMMEDIATE
        'CREATE GLOBAL TEMPORARY TABLE RTTEMP01 (
              ORD_NO        VARCHAR2(15 BYTE),
              CUST_NO       VARCHAR2(10 BYTE),
              SCHD_SEQ      NUMBER(3),
              ARRE_AMT      NUMBER(10),
              RECP_AMT      NUMBER(10)
         ) ON COMMIT DELETE ROWS;
        COMMENT ON TABLE NXRADMIN.RTTEMP01 IS ''�����ü �������ó��(Pkg_Rtre0070)�� ��� TEMPORARY TABLE'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ORD_NO IS ''����ȣ'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.CUST_NO IS ''����ȣ'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCHD_SEQ IS ''û������'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ARRE_AMT IS ''�̳��ݾ� '';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_AMT IS ''����ó���ݾ�'';';
    
    END IF;
    
    -- ������� �뺸���� ��ȸ
    -- - NOTI_ID �� KCP�� �����ִ� ��� ���
    -- - NOTI_ID �� ���� ��� ������ �뺸������ ���
    IF TRIM(v_Noti_Id) IS NOT NULL THEN
        SELECT  *
          INTO  lr_Re0142
          FROM  RTRE0142
         WHERE  TNO      = v_Tno
           AND  NOTI_ID  = v_Noti_Id
           AND  NOTI_SEQ = (SELECT MAX(NOTI_SEQ) FROM RTRE0142 WHERE TNO = v_Tno);
    ELSE
        SELECT  *
          INTO  lr_Re0142
          FROM  RTRE0142
         WHERE  TNO      = v_Tno
           AND  NOTI_SEQ = (SELECT MAX(NOTI_SEQ) FROM RTRE0142 WHERE TNO = v_Tno);
    END IF;
    
    -- ������� ���� ��ȸ
    SELECT  *
      INTO  lr_Re0140
      FROM  RTRE0140
     WHERE  TNO = v_Tno
       AND  RQST_STAT IN ('3');
    
    ln_Remain_Amt := 0;
    ln_Exe_Cnt    := 1;
    
    -- �����ŷ���ȣ ä��
    -- - CMS, ī��������� : ����ȣ�� �����ŷ���ȣ ä��
    -- - ������� : �Ա��뺸�� �����ŷ���ȣ ä��
    ln_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();
    
    /*
     * ������� ���γ��� ��ະ�� LOOP ���鼭 ����
     */
    FOR cur_Re0141 IN (
        SELECT  RVA_DAY
             ,  CUST_NO
             ,  ORD_NO
             ,  SUM(ARRE_AMT) ARRE_AMT
          FROM  RTRE0141
         WHERE  (RVA_DAY, RVA_SEQ) IN (
                    SELECT  RVA_DAY, RVA_SEQ
                      FROM  RTRE0140
                     WHERE  TNO = v_Tno
                       AND  RQST_STAT IN ('3')
                )  
         GROUP  BY RVA_DAY
             ,  CUST_NO
             ,  ORD_NO                
    ) LOOP
        -- ����ó�� ��� ������� �ݾ�(?)
        ln_Tarre_Amt := ROUND(cur_Re0141.ARRE_AMT * (lr_Re0142.TOTAL_MNYX / lr_Re0140.AMOUNT), 0);
        
        IF ln_Exe_Cnt = 1 THEN
            ln_Tarre_Amt := ln_Tarre_Amt + ln_Remain_Amt;
        END IF;
        
        ln_Trecp_Amt := ln_Tarre_Amt;     -- ����ó�� ��� ��ü�ݾ�
        
        /*
         * ��ະ û�������� �����Ͽ� ó��
         */
        FOR cur_SD0109 IN (
            SELECT  SCHD_SEQ, ARRE_AMT
              FROM  RTSD0109
             WHERE  CUST_NO  = cur_Re0141.CUST_NO
               AND  SCD_STAT = 'S'
               AND  ZLSPR    = 'N'
               AND  RC_YN   <> 'Y'
               AND  USE_YN   = 'Y'
               AND  ZFB_DAY <= cur_Re0141.RVA_DAY
               AND  ORD_NO   = cur_Re0141.ORD_NO
             ORDER  BY DEMD_DT, RECP_TP
        ) LOOP
        
            IF ln_Tarre_Amt >= cur_SD0109.ARRE_AMT THEN
                ln_Arre_Amt  := cur_SD0109.ARRE_AMT;
                ln_Recp_Amt  := cur_SD0109.ARRE_AMT;
                ln_Tarre_Amt := ln_Tarre_Amt - cur_SD0109.ARRE_AMT; 
            ELSE
                ln_Arre_Amt  := cur_SD0109.ARRE_AMT;
                ln_Recp_Amt  := ln_Tarre_Amt;
                ln_Tarre_Amt := 0;
            END IF;
            
            -- ������󸮽�Ʈ �ӽ����̺� ���� 
            IF ln_Recp_Amt > 0 THEN
                
                INSERT INTO RTTEMP01 ( 
                      ORD_NO                    /*����ȣ            */
                    , CUST_NO                   /*����ȣ            */
                    , SCHD_SEQ                  /*û������            */
                    , ARRE_AMT                  /*��ü�ݾ�(VAT����)   */
                    , RECP_AMT                  /*�����ݾ�(VAT����)   */
                ) VALUES ( 
                      cur_Re0141.ORD_NO
                    , cur_Re0141.CUST_NO
                    , cur_SD0109.SCHD_SEQ
                    , ln_Arre_Amt
                    , ln_Recp_Amt
                );
                 
            END  IF;
                
        END LOOP;
        
        -- �����ݾ���  ���� �ִ� ��� û���������� TEMP Table ����
        ln_Pend_Amt := ln_Tarre_Amt;
            
        IF  ln_Tarre_Amt > 0 THEN
            
            INSERT INTO RTTEMP01 ( 
                  ORD_NO                    /*����ȣ            */
                , CUST_NO                   /*����ȣ            */
                , SCHD_SEQ                  /*û������            */
                , ARRE_AMT                  /*��ü�ݾ�(VAT����)   */
                , RECP_AMT                  /*�����ݾ�(VAT����)   */
            ) VALUES ( 
                  cur_Re0141.ORD_NO
                , cur_Re0141.CUST_NO
                , NULL
                , 0
                , ln_Pend_Amt
            );
                 
        END IF;
            
        -- ó���ݾ� ����
        ln_Recp_Amt := ln_Trecp_Amt;
        ln_Rear_Amt := ln_Trecp_Amt - ln_Pend_Amt;
        
        -- �������� ����ó��    
        -- ������󸮽�Ʈ ��ȸ(�̳�����Ʈ�� ������ ����)
        OPEN  Ref_Cursor FOR    
        SELECT  ORD_NO               /*����ȣ */
             ,  CUST_NO              /*����ȣ */
             ,  SCHD_SEQ             /*û������ */
             ,  ARRE_AMT             /*�̳��ݾ� */
             ,  RECP_AMT             /*����ó���ݾ� */
          FROM  RTTEMP01
         WHERE  RECP_AMT > 0          /*�����ݾ��� �����ϴ� �͸� */
           AND  ORD_NO   = cur_Re0141.ORD_NO
           AND  CUST_NO  = cur_Re0141.CUST_NO
         ORDER  BY NVL(SCHD_SEQ,999); -- �������� �������� ��ġ��Ŵ
                
        -- ���� ó��
        Pkg_Rtre0030.p_InsertRtre0030(
              Ref_Cursor
            , SUBSTR(lr_Re0142.IPGM_TIME, 1, 8) 
            , cur_Re0141.ORD_NO
            , cur_Re0141.CUST_NO
            , v_Reg_Id
            , ln_Recp_Amt
            , 'P4'
            , '01'
            , ln_Recv_Seq
            , ln_Rear_Amt
            , ln_Pend_Amt
            , v_Reg_Id
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );
        
        IF 0 != v_Success_Code THEN
            v_Return_Message := '�������� ����ó�� ����!!('||cur_Re0141.ORD_NO||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;  
      
        ln_Exe_Cnt := ln_Exe_Cnt + 1;
            
    END LOOP;
    
    -- ����ó�� �Ϸ��� �����ŷ���ȣ Update
    IF 0 <> PKG_RTRE0140.f_UpdateRtre0140RecvResult(
          lr_Re0140.RVA_DAY
        , lr_Re0140.RVA_SEQ
        , lr_Re0142.NOTI_SEQ
        , ln_Recv_Seq
        , v_Reg_Id
        , v_ErrorText
    ) THEN
        v_Return_Message := '������� ���� ����!!!';
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '���������� ������� ����ó���Ǿ����ϴ�';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0142.p_CreateRtre0142VaReceive(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0142.p_CreateRtre0142VaReceive(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0142VaReceive;
        
END PKG_RTRE0142;
/
