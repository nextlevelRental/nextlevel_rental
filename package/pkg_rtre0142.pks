CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE0142 AS
/*******************************************************************************
    NAME        PKG_RTRE0142
    PURPOSE     ������� �뺸���� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] �ű� ����
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
  ) RETURN NUMBER;

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
  ) RETURN NUMBER;
  
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
  );
  
  /*****************************************************************************
  -- ������� KCP �����뺸 ó�� 
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
  );
  
  /*****************************************************************************
  -- ������� ����ó�� 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0142VaReceive (
      v_Tno             IN RTRE0142.TNO%TYPE        /* �ŷ�������ȣ        */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* �Ա��뺸ID          */
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* �����ID            */       
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
        
END PKG_RTRE0142;
/
