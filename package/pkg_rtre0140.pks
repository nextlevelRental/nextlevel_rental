CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE0140 AS
/*******************************************************************************
    NAME        PKG_RTRE0140
    PURPOSE     ������� ���� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] �ű� ����
    1.2     2017-11-15  wjim            [20171115_01] ������³�����ȸ ��ȸ���� �߰�
                                        - ��û�ڱ׷�
    1.3     2018-01-05  wjim            [20180104_01] ������� ��ü��ȸ ��� �߰�
*******************************************************************************/
  /*****************************************************************************
  -- ������� ���� Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.2     2017-11-15  wjim            [20171115_01] ��û�ڱ׷� ��ȸ���� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtre0140 (
      Ref_Cursor      IN OUT SYS_REFCURSOR    
    , v_Cust_No       IN RTRE0140.CUST_NO%TYPE     /*����ȣ                 */
    , v_Ord_No        IN RTRE0141.ORD_NO%TYPE      /*����ȣ                 */
    , v_Rva_Fday      IN RTRE0140.RVA_DAY%TYPE     /*��û����(from)           */
    , v_Rva_Tday      IN RTRE0140.RVA_DAY%TYPE     /*��û����(to)             */
    , v_Rqst_Stat     IN RTRE0140.RQST_STAT%TYPE   /*����                     */
    , v_Tno           IN RTRE0140.TNO%TYPE         /*�ŷ�������ȣ             */
    , v_Vaccount      IN RTRE0140.VACCOUNT%TYPE    /*������¹�ȣ             */
    , v_Va_Fday       IN RTRE0140.VA_DATE%TYPE     /*������� �Աݸ�����(from)*/
    , v_Va_Tday       IN RTRE0140.VA_DATE%TYPE     /*������� �Աݸ�����(to)  */
    , v_App_Fday      IN RTRE0140.APP_TIME%TYPE    /*������� �߱���(from)    */
    , v_App_Tday      IN RTRE0140.APP_TIME%TYPE    /*������� �߱���(to)      */
    , v_App_Reg_Id    IN RTRE0140.APP_REG_ID%TYPE  /*������� �߱���ID        */
    , v_Reg_Id        IN RTRE0140.REG_ID%TYPE      /*�߱޿�û �����ID        */
    , v_Ipgm_Fday     IN RTRE0142.IPGM_TIME%TYPE   /*�Ա���(from)             */
    , v_Ipgm_Tday     IN RTRE0142.IPGM_TIME%TYPE   /*�Ա���(to)               */
    , v_Noti_Id       IN RTRE0142.NOTI_ID%TYPE     /*�Ա��뺸ID               */
    , v_Remitter      IN RTRE0142.REMITTER%TYPE    /*�Ա��ڸ�                 */
    , v_User_Grp      IN RTCM0001.USER_GRP%TYPE    /*��û�ڱ׷�               */
  );
  
  /*****************************************************************************
  -- ������� ��ü��ȸ
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.3     2018-01-05  wjim            [20180104_01] �ű԰���
  *****************************************************************************/
  PROCEDURE p_sRtre0140OrdDelay (
      Ref_Cursor      IN OUT SYS_REFCURSOR    
    , v_Cust_No       IN RTRE0140.CUST_NO%TYPE     /*����ȣ                 */
    , v_Ord_No        IN RTRE0141.ORD_NO%TYPE      /*����ȣ                 */
    , v_Dely_Day      IN RTRE0100.DELY_DAY%TYPE    /*��ü��������             */
    , v_Rva_Fday      IN RTRE0140.RVA_DAY%TYPE     /*��û����(from)           */
    , v_Rva_Tday      IN RTRE0140.RVA_DAY%TYPE     /*��û����(to)             */
    , v_Rqst_Stat     IN RTRE0140.RQST_STAT%TYPE   /*����                     */
    , v_App_Fday      IN RTRE0140.APP_TIME%TYPE    /*������� �߱���(from)    */
    , v_App_Tday      IN RTRE0140.APP_TIME%TYPE    /*������� �߱���(to)      */
    , v_Ipgm_Fday     IN RTRE0142.IPGM_TIME%TYPE   /*�Ա���(from)             */
    , v_Ipgm_Tday     IN RTRE0142.IPGM_TIME%TYPE   /*�Ա���(to)               */
  );
  
  /*****************************************************************************
  -- ������� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0140 (
      v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* ����ȣ              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* ����                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* ����û������ȣ      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* ��û�ݾ�              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* ����                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* ��ȿ�Ⱓ              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* ��ȿ�ð�              */ 
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* ��û����ڵ�          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* ��û����޽���        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* �ŷ�������ȣ          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* ������û�ݾ�          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* �����ڵ�              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* �����                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* ������¹�ȣ          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* ������� �Աݸ����Ͻ� */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* ������� �߱��Ͻ�     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* ������� �߱���ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* �뺸����              */        
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* �����ŷ���ȣ          */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* �����ID              */
    , v_Rva_Day        OUT VARCHAR2
    , v_Rva_Seq        OUT NUMBER
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- ������� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0140 (
      v_Rva_Day         IN RTRE0140.RVA_DAY%TYPE     /* ��û����              */
    , v_Rva_Seq         IN RTRE0140.RVA_SEQ%TYPE     /* ��û�Ϸù�ȣ          */
    , v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* ����ȣ              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* ����                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* ����û������ȣ      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* ��û�ݾ�              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* ����                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* ��ȿ�Ⱓ              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* ��ȿ�ð�              */ 
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* ��û����ڵ�          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* ��û����޽���        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* �ŷ�������ȣ          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* ������û�ݾ�          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* �����ڵ�              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* �����                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* ������¹�ȣ          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* ������� �Աݸ����Ͻ� */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* ������� �߱��Ͻ�     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* ������� �߱���ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* �뺸����              */ 
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* �����ŷ���ȣ          */        
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* �����ID              */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ������� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0140 (
      v_Comm_Dvsn       IN CHAR                      /* ó������(I,U,D)       */
    , v_Rva_Day     IN OUT RTRE0140.RVA_DAY%TYPE     /* ��û����              */
    , v_Rva_Seq     IN OUT RTRE0140.RVA_SEQ%TYPE     /* ��û�Ϸù�ȣ          */
    , v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* ����ȣ              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* ����                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* ����û������ȣ      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* ��û�ݾ�              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* ����                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* ��ȿ�Ⱓ              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* ��ȿ�ð�              */ 
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* ��û����ڵ�          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* ��û����޽���        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* �ŷ�������ȣ          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* ������û�ݾ�          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* �����ڵ�              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* �����                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* ������¹�ȣ          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* ������� �Աݸ����Ͻ� */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* ������� �߱��Ͻ�     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* ������� �߱���ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* �뺸����              */     
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* �����ŷ���ȣ          */   
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* �����ID              */ 
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- ������� ��û��� ����
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0140ReqResult (
      v_Rva_Day         IN RTRE0140.RVA_DAY%TYPE     /* ��û����              */
    , v_Rva_Seq         IN RTRE0140.RVA_SEQ%TYPE     /* ��û�Ϸù�ȣ          */    
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* ��ȿ�Ⱓ              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* ��ȿ�ð�              */ 
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* ��û����ڵ�          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* ��û����޽���        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* �ŷ�������ȣ          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* ������û�ݾ�          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* �����ڵ�              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* �����                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* ������¹�ȣ          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* ������� �Աݸ����Ͻ� */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* ������� �߱��Ͻ�     */        
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* �����ID              */ 
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- ������� �Ա� ����ó�� ��� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0140RecvResult (
      v_Rva_Day        IN RTRE0140.RVA_DAY%TYPE       /*��û����              */
    , v_Rva_Seq        IN RTRE0140.RVA_SEQ%TYPE       /*��û�Ϸù�ȣ          */
    , v_Noti_Seq       IN RTRE0140.NOTI_SEQ%TYPE      /*�뺸����              */
    , v_Recv_Seq       IN RTRE0140.RECV_SEQ%TYPE      /*�����ŷ���ȣ          */
    , v_Reg_Id         IN RTRE0140.REG_ID%TYPE        /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
        
END PKG_RTRE0140;
/
