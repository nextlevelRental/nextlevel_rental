CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE0142 AS
/*******************************************************************************
    NAME        PKG_RTRE0142
    PURPOSE     가상계좌 통보내역 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] 신규 생성
    1.1     2017-11-21  wjim            [20171121_01] 입금통보 저장오류 catch 추가
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
          v_Tno             /* 거래고유번호        */
        , (
            SELECT  NVL2(MAX(NOTI_SEQ), TO_NUMBER(MAX(NOTI_SEQ))+1, 1) 
              FROM  RTRE0142
             WHERE  TNO = v_Tno         
          )                 /* 통보순번            */
        , v_Site_Cd         /* 가맹점코드          */
        , v_Order_No        /* 주문번호            */
        , v_Tx_Cd           /* 업무처리구분코드    */
        , v_Tx_Tm           /* 업무처리완료일시    */
        , v_Ipgm_Name       /* 주문자명            */
        , v_Mnyx            /* 실제입금금액        */
        , v_Total_Mnyx      /* 입금금액합계        */
        , v_Ipgm_Time       /* 입금일시            */
        , v_Vaccount        /* 입금가상계좌번호    */
        , v_Noti_Id         /* 입금통보ID          */
        , v_Op_Cd           /* 입금결과코드        */
        , v_Remitter        /* 입금자명            */
        , v_Cash_No         /* 현금영수증 거래번호 */
        , v_Cash_A_No       /* 현금영수증 승인번호 */
        , v_Cash_A_Dt       /* 현금영수증 승인시간 */
        , v_Reg_Id          /* 등록자ID            */   
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
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTRE0142
       SET  NOTI_SEQ   = v_Noti_Seq         /* 통보순번            */
         ,  SITE_CD    = v_Site_Cd          /* 가맹점코드          */
         ,  ORDER_NO   = v_Order_No         /* 주문번호            */
         ,  TX_CD      = v_Tx_Cd            /* 업무처리구분코드    */
         ,  TX_TM      = v_Tx_Tm            /* 업무처리완료일시    */
         ,  IPGM_NAME  = v_Ipgm_Name        /* 주문자명            */
         ,  IPGM_MNYX  = v_Mnyx             /* 실제입금금액        */
         ,  TOTAL_MNYX = v_Total_Mnyx       /* 입금금액합계        */
         ,  IPGM_TIME  = v_Ipgm_Time        /* 입금일시            */
         ,  VACCOUNT   = v_Vaccount         /* 입금가상계좌번호    */
         ,  NOTI_ID    = v_Noti_Id          /* 입금통보ID          */
         ,  OP_CD      = v_Op_Cd            /* 입금결과코드        */
         ,  REMITTER   = v_Remitter         /* 입금자명            */
         ,  CASH_NO    = v_Cash_No          /* 현금영수증 거래번호 */
         ,  CASH_A_NO  = v_Cash_A_No        /* 현금영수증 승인번호 */
         ,  CASH_A_DT  = v_Cash_A_Dt        /* 현금영수증 승인시간 */
         ,  REG_ID     = v_Reg_Id           /* 등록자ID            */
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
  ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값 확인
    IF TRIM(v_Tno) IS NULL THEN
        v_Return_Message := '거래고유번호 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0142 (
              v_Tno             /* 거래고유번호        */
            , v_Site_Cd         /* 가맹점코드          */
            , v_Order_No        /* 주문번호            */
            , v_Tx_Cd           /* 업무처리구분코드    */
            , v_Tx_Tm           /* 업무처리완료일시    */ 
            , v_Ipgm_Name       /* 주문자명            */
            , v_Mnyx            /* 실제입금금액        */
            , v_Total_Mnyx      /* 입금금액합계        */
            , v_Ipgm_Time       /* 입금일시            */
            , v_Vaccount        /* 입금가상계좌번호    */
            , v_Noti_Id         /* 입금통보ID          */
            , v_Op_Cd           /* 입금결과코드        */
            , v_Remitter        /* 입금자명            */
            , v_Cash_No         /* 현금영수증 거래번호 */
            , v_Cash_A_No       /* 현금영수증 승인번호 */
            , v_Cash_A_Dt       /* 현금영수증 승인시간 */
            , v_Reg_Id          /* 등록자ID            */    
            , v_ErrorText
        ) THEN
            v_Return_Message := '가상계좌 통보내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtre0142 (
              v_Tno             /* 거래고유번호        */
            , v_Noti_Seq        /* 통보순번            */
            , v_Site_Cd         /* 가맹점코드          */
            , v_Order_No        /* 주문번호            */
            , v_Tx_Cd           /* 업무처리구분코드    */
            , v_Tx_Tm           /* 업무처리완료일시    */ 
            , v_Ipgm_Name       /* 주문자명            */
            , v_Mnyx            /* 실제입금금액        */
            , v_Total_Mnyx      /* 입금금액합계        */
            , v_Ipgm_Time       /* 입금일시            */
            , v_Vaccount        /* 입금가상계좌번호    */
            , v_Noti_Id         /* 입금통보ID          */
            , v_Op_Cd           /* 입금결과코드        */
            , v_Remitter        /* 입금자명            */
            , v_Cash_No         /* 현금영수증 거래번호 */
            , v_Cash_A_No       /* 현금영수증 승인번호 */
            , v_Cash_A_Dt       /* 현금영수증 승인시간 */
            , v_Reg_Id          /* 등록자ID            */    
            , v_ErrorText
        ) THEN
            v_Return_Message := '가상계좌 통보내역 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;    

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
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
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0142.p_IUDRtre0142(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0142;
  
  /*****************************************************************************
  -- 가상계좌 KCP 공통통보 처리
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.1     2017-11-21  wjim            [20171121_01] 입금통보 저장오류 catch 추가
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
  ) IS

    e_Error EXCEPTION;
    
  BEGIN

    -------------------
    -- 통보결과 저장 --
    -------------------
    p_IUDRtre0142 (
          'I'               /* 처리구분(I,U,D)     */
        , v_Tno             /* 거래고유번호        */
        , NULL              /* 통보순번            */
        , v_Site_Cd         /* 가맹점코드          */
        , v_Order_No        /* 주문번호            */
        , v_Tx_Cd           /* 업무처리구분코드    */
        , v_Tx_Tm           /* 업무처리완료일시    */ 
        , v_Ipgm_Name       /* 주문자명            */
        , v_Mnyx            /* 실제입금금액        */
        , v_Total_Mnyx      /* 입금금액합계        */
        , v_Ipgm_Time       /* 입금일시            */
        , v_Vaccount        /* 입금가상계좌번호    */
        , v_Noti_Id         /* 입금통보ID          */
        , v_Op_Cd           /* 입금결과코드        */
        , v_Remitter        /* 입금자명            */
        , v_Cash_No         /* 현금영수증 거래번호 */
        , v_Cash_A_No       /* 현금영수증 승인번호 */
        , v_Cash_A_Dt       /* 현금영수증 승인시간 */
        , 'KCP_NOTI'        /* 등록자ID            */     
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    -- [20171121_01]
    IF 0 != v_Success_Code THEN
        v_Return_Message := '통보결과 저장 실패!!('||v_Order_No||')-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
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
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0142.p_exeRtre0142KcpNoti(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0142KcpNoti;
  
  /*****************************************************************************
  -- 가상계좌 수납처리 
  -- - Pkg_Rtre0080.p_CreateRtre0080CardReceive 를 참조하여 개발
  *****************************************************************************/
  PROCEDURE p_CreateRtre0142VaReceive (
      v_Tno             IN RTRE0142.TNO%TYPE        /* 거래고유번호        */
    , v_Noti_Id         IN RTRE0142.NOTI_ID%TYPE    /* 입금통보ID          */
    , v_Reg_Id          IN RTRE0142.REG_ID%TYPE     /* 등록자ID            */       
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
     * 필수값 입력 확인
     */
    IF (TRIM(v_Tno) IS NULL) OR (TRIM(v_Tno) = '') THEN
        v_Return_Message := '거래고유번호 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (TRIM(v_Reg_Id) = '') THEN
        v_Return_Message := '등록자ID : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 해당 거래고유번호로 수납처리대상 검증
     */
   -- 가상계좌통보내역 존재 여부
    SELECT  NVL(COUNT(1), 0)
      INTO  ln_Chk_Cnt
      FROM  RTRE0142
     WHERE  TNO = v_Tno;
     
    IF ln_Chk_Cnt = 0 THEN
        v_Return_Message := '해당 거래고유번호('||v_Tno||')로 저장된 가상계좌통보내역(RTRE0142)이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;
    
    -- 가상계좌내역 존재 여부
    SELECT  NVL(COUNT(1), 0)
      INTO  ln_Chk_Cnt
      FROM  RTRE0140
     WHERE  TNO = v_Tno
       AND  RQST_STAT IN ('3');
     
    IF ln_Chk_Cnt = 0 THEN
        v_Return_Message := '해당 거래고유번호('||v_Tno||')는 유효한 가상계좌내역(RTRE0140)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 수납대상리스트 임시테이블 존재여부 확인
     * - 미존재시 임시테이블 생성
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
        COMMENT ON TABLE NXRADMIN.RTTEMP01 IS ''출금이체 수납등록처리(Pkg_Rtre0070)시 사용 TEMPORARY TABLE'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ORD_NO IS ''계약번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.CUST_NO IS ''고객번호'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCHD_SEQ IS ''청구순번'';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.ARRE_AMT IS ''미납금액 '';
        COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_AMT IS ''수납처리금액'';';
    
    END IF;
    
    -- 가상계좌 통보내역 조회
    -- - NOTI_ID 를 KCP가 보내주는 경우 사용
    -- - NOTI_ID 가 없는 경우 마지막 통보내역을 사용
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
    
    -- 가상계좌 내역 조회
    SELECT  *
      INTO  lr_Re0140
      FROM  RTRE0140
     WHERE  TNO = v_Tno
       AND  RQST_STAT IN ('3');
    
    ln_Remain_Amt := 0;
    ln_Exe_Cnt    := 1;
    
    -- 수납거래번호 채번
    -- - CMS, 카드정기출금 : 계약번호별 수납거래번호 채번
    -- - 가상계좌 : 입금통보별 수납거래번호 채번
    ln_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();
    
    /*
     * 가상계좌 세부내역 계약별로 LOOP 돌면서 수행
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
        -- 수납처리 대상 가상계좌 금액(?)
        ln_Tarre_Amt := ROUND(cur_Re0141.ARRE_AMT * (lr_Re0142.TOTAL_MNYX / lr_Re0140.AMOUNT), 0);
        
        IF ln_Exe_Cnt = 1 THEN
            ln_Tarre_Amt := ln_Tarre_Amt + ln_Remain_Amt;
        END IF;
        
        ln_Trecp_Amt := ln_Tarre_Amt;     -- 수납처리 대상 전체금액
        
        /*
         * 계약별 청구스케쥴 감안하여 처리
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
            
            -- 수납대상리스트 임시테이블에 생성 
            IF ln_Recp_Amt > 0 THEN
                
                INSERT INTO RTTEMP01 ( 
                      ORD_NO                    /*계약번호            */
                    , CUST_NO                   /*고객번호            */
                    , SCHD_SEQ                  /*청구순번            */
                    , ARRE_AMT                  /*연체금액(VAT포함)   */
                    , RECP_AMT                  /*수납금액(VAT포함)   */
                ) VALUES ( 
                      cur_Re0141.ORD_NO
                    , cur_Re0141.CUST_NO
                    , cur_SD0109.SCHD_SEQ
                    , ln_Arre_Amt
                    , ln_Recp_Amt
                );
                 
            END  IF;
                
        END LOOP;
        
        -- 선수금액이  남아 있는 경우 청구순번없이 TEMP Table 생성
        ln_Pend_Amt := ln_Tarre_Amt;
            
        IF  ln_Tarre_Amt > 0 THEN
            
            INSERT INTO RTTEMP01 ( 
                  ORD_NO                    /*계약번호            */
                , CUST_NO                   /*고객번호            */
                , SCHD_SEQ                  /*청구순번            */
                , ARRE_AMT                  /*연체금액(VAT포함)   */
                , RECP_AMT                  /*수납금액(VAT포함)   */
            ) VALUES ( 
                  cur_Re0141.ORD_NO
                , cur_Re0141.CUST_NO
                , NULL
                , 0
                , ln_Pend_Amt
            );
                 
        END IF;
            
        -- 처리금액 설정
        ln_Recp_Amt := ln_Trecp_Amt;
        ln_Rear_Amt := ln_Trecp_Amt - ln_Pend_Amt;
        
        -- 수납내역 생성처리    
        -- 수납대상리스트 조회(미납리스트와 선수금 내역)
        OPEN  Ref_Cursor FOR    
        SELECT  ORD_NO               /*계약번호 */
             ,  CUST_NO              /*고객번호 */
             ,  SCHD_SEQ             /*청구순번 */
             ,  ARRE_AMT             /*미납금액 */
             ,  RECP_AMT             /*수납처리금액 */
          FROM  RTTEMP01
         WHERE  RECP_AMT > 0          /*수납금액이 존재하는 것만 */
           AND  ORD_NO   = cur_Re0141.ORD_NO
           AND  CUST_NO  = cur_Re0141.CUST_NO
         ORDER  BY NVL(SCHD_SEQ,999); -- 선수금을 마지막에 위치시킴
                
        -- 수납 처리
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
            v_Return_Message := '수납내역 생성처리 실패!!('||cur_Re0141.ORD_NO||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;  
      
        ln_Exe_Cnt := ln_Exe_Cnt + 1;
            
    END LOOP;
    
    -- 수납처리 완료후 수납거래번호 Update
    IF 0 <> PKG_RTRE0140.f_UpdateRtre0140RecvResult(
          lr_Re0140.RVA_DAY
        , lr_Re0140.RVA_SEQ
        , lr_Re0142.NOTI_SEQ
        , ln_Recv_Seq
        , v_Reg_Id
        , v_ErrorText
    ) THEN
        v_Return_Message := '수납결과 수정 실패!!!';
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 가상계좌 수납처리되었습니다';
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
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0142.p_CreateRtre0142VaReceive(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0142VaReceive;
        
END PKG_RTRE0142;
/
