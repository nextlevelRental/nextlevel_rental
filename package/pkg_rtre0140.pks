CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE0140 AS
/*******************************************************************************
    NAME        PKG_RTRE0140
    PURPOSE     가상계좌 내역 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] 신규 생성
    1.2     2017-11-15  wjim            [20171115_01] 가상계좌내역조회 조회조건 추가
                                        - 요청자그룹
    1.3     2018-01-05  wjim            [20180104_01] 가상계좌 연체조회 기능 추가
*******************************************************************************/
  /*****************************************************************************
  -- 가상계좌 내역 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.2     2017-11-15  wjim            [20171115_01] 요청자그룹 조회조건 추가
  *****************************************************************************/
  PROCEDURE p_sRtre0140 (
      Ref_Cursor      IN OUT SYS_REFCURSOR    
    , v_Cust_No       IN RTRE0140.CUST_NO%TYPE     /*고객번호                 */
    , v_Ord_No        IN RTRE0141.ORD_NO%TYPE      /*계약번호                 */
    , v_Rva_Fday      IN RTRE0140.RVA_DAY%TYPE     /*요청일자(from)           */
    , v_Rva_Tday      IN RTRE0140.RVA_DAY%TYPE     /*요청일자(to)             */
    , v_Rqst_Stat     IN RTRE0140.RQST_STAT%TYPE   /*상태                     */
    , v_Tno           IN RTRE0140.TNO%TYPE         /*거래고유번호             */
    , v_Vaccount      IN RTRE0140.VACCOUNT%TYPE    /*가상계좌번호             */
    , v_Va_Fday       IN RTRE0140.VA_DATE%TYPE     /*가상계좌 입금마감일(from)*/
    , v_Va_Tday       IN RTRE0140.VA_DATE%TYPE     /*가상계좌 입금마감일(to)  */
    , v_App_Fday      IN RTRE0140.APP_TIME%TYPE    /*가상계좌 발급일(from)    */
    , v_App_Tday      IN RTRE0140.APP_TIME%TYPE    /*가상계좌 발급일(to)      */
    , v_App_Reg_Id    IN RTRE0140.APP_REG_ID%TYPE  /*가상계좌 발급자ID        */
    , v_Reg_Id        IN RTRE0140.REG_ID%TYPE      /*발급요청 등록자ID        */
    , v_Ipgm_Fday     IN RTRE0142.IPGM_TIME%TYPE   /*입금일(from)             */
    , v_Ipgm_Tday     IN RTRE0142.IPGM_TIME%TYPE   /*입금일(to)               */
    , v_Noti_Id       IN RTRE0142.NOTI_ID%TYPE     /*입금통보ID               */
    , v_Remitter      IN RTRE0142.REMITTER%TYPE    /*입금자명                 */
    , v_User_Grp      IN RTCM0001.USER_GRP%TYPE    /*요청자그룹               */
  );
  
  /*****************************************************************************
  -- 가상계좌 연체조회
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.3     2018-01-05  wjim            [20180104_01] 신규개발
  *****************************************************************************/
  PROCEDURE p_sRtre0140OrdDelay (
      Ref_Cursor      IN OUT SYS_REFCURSOR    
    , v_Cust_No       IN RTRE0140.CUST_NO%TYPE     /*고객번호                 */
    , v_Ord_No        IN RTRE0141.ORD_NO%TYPE      /*계약번호                 */
    , v_Dely_Day      IN RTRE0100.DELY_DAY%TYPE    /*연체기준일자             */
    , v_Rva_Fday      IN RTRE0140.RVA_DAY%TYPE     /*요청일자(from)           */
    , v_Rva_Tday      IN RTRE0140.RVA_DAY%TYPE     /*요청일자(to)             */
    , v_Rqst_Stat     IN RTRE0140.RQST_STAT%TYPE   /*상태                     */
    , v_App_Fday      IN RTRE0140.APP_TIME%TYPE    /*가상계좌 발급일(from)    */
    , v_App_Tday      IN RTRE0140.APP_TIME%TYPE    /*가상계좌 발급일(to)      */
    , v_Ipgm_Fday     IN RTRE0142.IPGM_TIME%TYPE   /*입금일(from)             */
    , v_Ipgm_Tday     IN RTRE0142.IPGM_TIME%TYPE   /*입금일(to)               */
  );
  
  /*****************************************************************************
  -- 가상계좌 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0140 (
      v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* 고객번호              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* 고객명                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* 통합청구계약번호      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* 요청금액              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* 상태                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* 유효기간              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* 유효시간              */ 
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* 요청결과코드          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* 요청결과메시지        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* 거래고유번호          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* 결제요청금액          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* 은행코드              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* 은행명                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* 가상계좌번호          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* 가상계좌 입금마감일시 */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* 가상계좌 발급일시     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* 가상계좌 발급자ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* 통보순번              */        
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* 수납거래번호          */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* 등록자ID              */
    , v_Rva_Day        OUT VARCHAR2
    , v_Rva_Seq        OUT NUMBER
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 가상계좌 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0140 (
      v_Rva_Day         IN RTRE0140.RVA_DAY%TYPE     /* 요청일자              */
    , v_Rva_Seq         IN RTRE0140.RVA_SEQ%TYPE     /* 요청일련번호          */
    , v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* 고객번호              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* 고객명                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* 통합청구계약번호      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* 요청금액              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* 상태                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* 유효기간              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* 유효시간              */ 
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* 요청결과코드          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* 요청결과메시지        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* 거래고유번호          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* 결제요청금액          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* 은행코드              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* 은행명                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* 가상계좌번호          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* 가상계좌 입금마감일시 */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* 가상계좌 발급일시     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* 가상계좌 발급자ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* 통보순번              */ 
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* 수납거래번호          */        
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* 등록자ID              */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 가상계좌 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0140 (
      v_Comm_Dvsn       IN CHAR                      /* 처리구분(I,U,D)       */
    , v_Rva_Day     IN OUT RTRE0140.RVA_DAY%TYPE     /* 요청일자              */
    , v_Rva_Seq     IN OUT RTRE0140.RVA_SEQ%TYPE     /* 요청일련번호          */
    , v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* 고객번호              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* 고객명                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* 통합청구계약번호      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* 요청금액              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* 상태                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* 유효기간              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* 유효시간              */ 
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* 요청결과코드          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* 요청결과메시지        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* 거래고유번호          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* 결제요청금액          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* 은행코드              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* 은행명                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* 가상계좌번호          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* 가상계좌 입금마감일시 */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* 가상계좌 발급일시     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* 가상계좌 발급자ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* 통보순번              */     
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* 수납거래번호          */   
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* 등록자ID              */ 
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 가상계좌 요청결과 저장
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0140ReqResult (
      v_Rva_Day         IN RTRE0140.RVA_DAY%TYPE     /* 요청일자              */
    , v_Rva_Seq         IN RTRE0140.RVA_SEQ%TYPE     /* 요청일련번호          */    
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* 유효기간              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* 유효시간              */ 
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* 요청결과코드          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* 요청결과메시지        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* 거래고유번호          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* 결제요청금액          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* 은행코드              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* 은행명                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* 가상계좌번호          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* 가상계좌 입금마감일시 */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* 가상계좌 발급일시     */        
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* 등록자ID              */ 
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 가상계좌 입금 수납처리 결과 저장
  *****************************************************************************/
  FUNCTION f_UpdateRtre0140RecvResult (
      v_Rva_Day        IN RTRE0140.RVA_DAY%TYPE       /*요청일자              */
    , v_Rva_Seq        IN RTRE0140.RVA_SEQ%TYPE       /*요청일련번호          */
    , v_Noti_Seq       IN RTRE0140.NOTI_SEQ%TYPE      /*통보순번              */
    , v_Recv_Seq       IN RTRE0140.RECV_SEQ%TYPE      /*수납거래번호          */
    , v_Reg_Id         IN RTRE0140.REG_ID%TYPE        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
        
END PKG_RTRE0140;
/
