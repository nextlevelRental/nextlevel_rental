CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE0142 AS
/*******************************************************************************
    NAME        PKG_RTRE0142
    PURPOSE     가상계좌 통보내역 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] 신규 생성
*******************************************************************************/
  
  /*****************************************************************************
  -- 가상계좌 통보내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0142 (
      v_Tno             IN RTRE0142.TNO%TYPE        /* 거래고유번호        */
    , v_Site_Cd         IN RTRE0142.SITE_CD%TYPE    /* 가맹점코드          */
    , v_Order_No        IN RTRE0142.ORDER_NO%TYPE   /* 주문번호            */
    , v_Tx_Cd           IN RTRE0142.TX_CD%TYPE      /* 업무처리구분코드    */
    , v_Tx_Tm           IN RTRE0142.TX_TM%TYPE      /* 업무처리완료일시    */
    , v_Ipgm_Name       IN RTRE0142.IPGM_NAME%TYPE  /* 주문자명            */
    , v_Mnyx            IN RTRE0142.IPGM_MNYX%TYPE  /* 실제입금금액        */    
    , v_Total_Mnyx      IN RTRE0142.TOTAL_MNYX%TYPE /* 입금금액합계        */
    , v_Ipgm_Time       IN RTRE0142.IPGM_TIME%TYPE  /* 입금일시            */
    , v_Vaccount        IN RTRE0142.VACCOUNT%TYPE   /* 입금가상계좌번호    */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* 입금통보ID          */
    , v_Op_Cd           IN RTRE0142.OP_CD%TYPE      /* 입금결과코드        */
    , v_Remitter        IN RTRE0142.REMITTER%TYPE   /* 입금자명            */
    , v_Cash_No         IN RTRE0142.CASH_NO%TYPE    /* 현금영수증 거래번호 */
    , v_Cash_A_No       IN RTRE0142.CASH_A_NO%TYPE  /* 현금영수증 승인번호 */
    , v_Cash_A_Dt       IN RTRE0142.CASH_A_DT%TYPE  /* 현금영수증 승인시간 */       
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* 등록자ID            */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 가상계좌 통보내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0142 (
      v_Tno             IN RTRE0142.TNO%TYPE        /* 거래고유번호        */
    , v_Noti_Seq        IN RTRE0142.NOTI_SEQ%TYPE   /* 통보순번            */
    , v_Site_Cd         IN RTRE0142.SITE_CD%TYPE    /* 가맹점코드          */
    , v_Order_No        IN RTRE0142.ORDER_NO%TYPE   /* 주문번호            */
    , v_Tx_Cd           IN RTRE0142.TX_CD%TYPE      /* 업무처리구분코드    */
    , v_Tx_Tm           IN RTRE0142.TX_TM%TYPE      /* 업무처리완료일시    */ 
    , v_Ipgm_Name       IN RTRE0142.IPGM_NAME%TYPE  /* 주문자명            */
    , v_Mnyx            IN RTRE0142.IPGM_MNYX%TYPE  /* 실제입금금액        */
    , v_Total_Mnyx      IN RTRE0142.TOTAL_MNYX%TYPE /* 입금금액합계        */
    , v_Ipgm_Time       IN RTRE0142.IPGM_TIME%TYPE  /* 입금일시            */
    , v_Vaccount        IN RTRE0142.VACCOUNT%TYPE   /* 입금가상계좌번호    */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* 입금통보ID          */
    , v_Op_Cd           IN RTRE0142.OP_CD%TYPE      /* 입금결과코드        */
    , v_Remitter        IN RTRE0142.REMITTER%TYPE   /* 입금자명            */
    , v_Cash_No         IN RTRE0142.CASH_NO%TYPE    /* 현금영수증 거래번호 */
    , v_Cash_A_No       IN RTRE0142.CASH_A_NO%TYPE  /* 현금영수증 승인번호 */
    , v_Cash_A_Dt       IN RTRE0142.CASH_A_DT%TYPE  /* 현금영수증 승인시간 */       
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* 등록자ID            */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 가상계좌 통보내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0142 (
      v_Comm_Dvsn       IN CHAR                     /* 처리구분(I,U,D)       */
    , v_Tno             IN RTRE0142.TNO%TYPE        /* 거래고유번호        */
    , v_Noti_Seq        IN RTRE0142.NOTI_SEQ%TYPE   /* 통보순번            */
    , v_Site_Cd         IN RTRE0142.SITE_CD%TYPE    /* 가맹점코드          */
    , v_Order_No        IN RTRE0142.ORDER_NO%TYPE   /* 주문번호            */
    , v_Tx_Cd           IN RTRE0142.TX_CD%TYPE      /* 업무처리구분코드    */
    , v_Tx_Tm           IN RTRE0142.TX_TM%TYPE      /* 업무처리완료일시    */ 
    , v_Ipgm_Name       IN RTRE0142.IPGM_NAME%TYPE  /* 주문자명            */
    , v_Mnyx            IN RTRE0142.IPGM_MNYX%TYPE  /* 실제입금금액        */
    , v_Total_Mnyx      IN RTRE0142.TOTAL_MNYX%TYPE /* 입금금액합계        */
    , v_Ipgm_Time       IN RTRE0142.IPGM_TIME%TYPE  /* 입금일시            */
    , v_Vaccount        IN RTRE0142.VACCOUNT%TYPE   /* 입금가상계좌번호    */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* 입금통보ID          */
    , v_Op_Cd           IN RTRE0142.OP_CD%TYPE      /* 입금결과코드        */
    , v_Remitter        IN RTRE0142.REMITTER%TYPE   /* 입금자명            */
    , v_Cash_No         IN RTRE0142.CASH_NO%TYPE    /* 현금영수증 거래번호 */
    , v_Cash_A_No       IN RTRE0142.CASH_A_NO%TYPE  /* 현금영수증 승인번호 */
    , v_Cash_A_Dt       IN RTRE0142.CASH_A_DT%TYPE  /* 현금영수증 승인시간 */
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* 등록자ID            */     
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 가상계좌 KCP 공통통보 처리 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0142KcpNoti (
      v_Tno             IN RTRE0142.TNO%TYPE        /* 거래고유번호        */
    , v_Site_Cd         IN RTRE0142.SITE_CD%TYPE    /* 가맹점코드          */
    , v_Order_No        IN RTRE0142.ORDER_NO%TYPE   /* 주문번호            */
    , v_Tx_Cd           IN RTRE0142.TX_CD%TYPE      /* 업무처리구분코드    */
    , v_Tx_Tm           IN RTRE0142.TX_TM%TYPE      /* 업무처리완료일시    */ 
    , v_Ipgm_Name       IN RTRE0142.IPGM_NAME%TYPE  /* 주문자명            */
    , v_Mnyx            IN RTRE0142.IPGM_MNYX%TYPE  /* 실제입금금액        */
    , v_Total_Mnyx      IN RTRE0142.TOTAL_MNYX%TYPE /* 입금금액합계        */
    , v_Ipgm_Time       IN RTRE0142.IPGM_TIME%TYPE  /* 입금일시            */
    , v_Vaccount        IN RTRE0142.VACCOUNT%TYPE   /* 입금가상계좌번호    */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* 입금통보ID          */
    , v_Op_Cd           IN RTRE0142.OP_CD%TYPE      /* 입금결과코드        */
    , v_Remitter        IN RTRE0142.REMITTER%TYPE   /* 입금자명            */
    , v_Cash_No         IN RTRE0142.CASH_NO%TYPE    /* 현금영수증 거래번호 */
    , v_Cash_A_No       IN RTRE0142.CASH_A_NO%TYPE  /* 현금영수증 승인번호 */
    , v_Cash_A_Dt       IN RTRE0142.CASH_A_DT%TYPE  /* 현금영수증 승인시간 */            
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 가상계좌 수납처리 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0142VaReceive (
      v_Tno             IN RTRE0142.TNO%TYPE        /* 거래고유번호        */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* 입금통보ID          */
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* 등록자ID            */       
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
        
END PKG_RTRE0142;