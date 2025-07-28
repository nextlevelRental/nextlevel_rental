CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0123 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0123
    PURPOSE     재레탈 가계약정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2019-07-19  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 가계약정보 Select
  
     REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2019-07-19  kstka            1. Created this package body.
    1.0.1   2019-07-22  kstka            [20190722] 페이징처리
  *****************************************************************************/
  PROCEDURE p_sRTSD0123 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Ord_Day_F       IN RTSD0123.ORD_DAY%TYPE        /* 주문일자           */
    , v_Ord_Day_T       IN RTSD0123.ORD_DAY%TYPE        /* 주문일자           */
    , v_Proc_Day_F      IN RTSD0123.PROC_DAY%TYPE       /* 장착일자           */
    , v_Proc_Day_T      IN RTSD0123.PROC_DAY%TYPE       /* 장착일자           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY%TYPE         /* 계약종료일자       */    
    , v_Os_Day_T        IN RTSD0123.OS_DAY%TYPE         /* 계약종료일자       */    
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 채널코드           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Call_Day_F      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자          */
    , v_Call_Day_T      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자          */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사 ID         */
    , v_Provsn_No_F     IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Provsn_No_T     IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Rows_Start      IN NUMBER
    , v_Rows_End        IN NUMBER
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 가계약정보 Excel Select
  
     REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2023-09-01  kstka            1. Created this package body.
  *****************************************************************************/
  PROCEDURE p_sRTSD0123ForExcel (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Ord_Day_F       IN RTSD0123.ORD_DAY%TYPE        /* 주문일자           */
    , v_Ord_Day_T       IN RTSD0123.ORD_DAY%TYPE        /* 주문일자           */
    , v_Proc_Day_F      IN RTSD0123.PROC_DAY%TYPE       /* 장착일자           */
    , v_Proc_Day_T      IN RTSD0123.PROC_DAY%TYPE       /* 장착일자           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY%TYPE         /* 계약종료일자       */    
    , v_Os_Day_T        IN RTSD0123.OS_DAY%TYPE         /* 계약종료일자       */    
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 채널코드           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Call_Day_F      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자          */
    , v_Call_Day_T      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자          */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사 ID         */
    , v_Provsn_No_F     IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Provsn_No_T     IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 가계약정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0123 (
      v_Cust_No         IN RTSD0123.CUST_NO%TYPE        /* 고객명             */
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Pos_Cd          IN RTSD0123.POS_CD%TYPE         /* 주소               */
    , v_Addr1           IN RTSD0123.ADDR1%TYPE          /* 주소               */
    , v_Addr2           IN RTSD0123.ADDR2%TYPE          /* 주소               */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0123.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt_Cd          IN RTSD0123.CNT_CD%TYPE         /* 타이어개수         */
    , v_Period          IN RTSD0123.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0123.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0123.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Email_Addr      IN RTSD0123.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Real_OrdNo      IN RTSD0123.REAL_ORDNO%TYPE     /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 계약번호           */
    , v_Plan_Day        IN RTSD0123.PLAN_DAY%TYPE       /* 계약번호           */
    , v_Ord_Day         IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Proc_Day        IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Os_Day          IN RTSD0123.OS_DAY%TYPE         /* 계약번호           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY_F%TYPE       /* 계약번호           */
    , v_Os_Day_T        IN RTSD0123.OS_DAY_T%TYPE       /* 계약번호           */
    , v_Ps_Cd           IN RTSD0123.PS_CD%TYPE          /* 계약번호           */
    , v_Cust_Req        IN RTSD0123.CUST_REQ%TYPE       /* 계약번호           */
    , v_Contact_Get     IN RTSD0123.CONTACT_GET%TYPE    /* 계약번호           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Call_Seq        IN RTSD0123.CALL_SEQ%TYPE       /* 등록자ID           */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 홈쇼핑구분         */
    , v_Recall_Tm       IN RTSD0123.RECALL_TM%TYPE      /* 홈쇼핑주문번호     */    
    , v_Reg_Id          IN RTSD0123.REG_ID%TYPE         /* 반품/취소일        */
    , v_ErrorText       OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 가계약정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0123 (
      v_Provsn_No       IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Cust_No         IN RTSD0123.CUST_NO%TYPE        /* 고객명             */
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Pos_Cd          IN RTSD0123.POS_CD%TYPE         /* 주소               */
    , v_Addr1           IN RTSD0123.ADDR1%TYPE          /* 주소               */
    , v_Addr2           IN RTSD0123.ADDR2%TYPE          /* 주소               */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0123.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt_Cd          IN RTSD0123.CNT_CD%TYPE         /* 타이어개수         */
    , v_Period          IN RTSD0123.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0123.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0123.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Email_Addr      IN RTSD0123.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Real_OrdNo      IN RTSD0123.REAL_ORDNO%TYPE     /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 계약번호           */
    , v_Plan_Day        IN RTSD0123.PLAN_DAY%TYPE       /* 계약번호           */
    , v_Ord_Day         IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Proc_Day        IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Os_Day          IN RTSD0123.OS_DAY%TYPE         /* 계약번호           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY_F%TYPE       /* 계약번호           */
    , v_Os_Day_T        IN RTSD0123.OS_DAY_T%TYPE       /* 계약번호           */
    , v_Ps_Cd           IN RTSD0123.PS_CD%TYPE          /* 계약번호           */
    , v_Cust_Req        IN RTSD0123.CUST_REQ%TYPE       /* 계약번호           */
    , v_Contact_Get     IN RTSD0123.CONTACT_GET%TYPE    /* 계약번호           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Call_Seq        IN RTSD0123.CALL_SEQ%TYPE       /* 등록자ID           */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 홈쇼핑구분         */
    , v_Recall_Tm       IN RTSD0123.RECALL_TM%TYPE      /* 홈쇼핑주문번호     */    
    , v_Reg_Id          IN RTSD0123.REG_ID%TYPE         /* 반품/취소일        */
    , v_ErrorText       OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 가계약정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0123 (
      v_Comm_Dvsn       IN CHAR                         /*처리구분(I,U,D)     */
    , v_Provsn_No       IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Cust_No         IN RTSD0123.CUST_NO%TYPE        /* 고객명             */
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Pos_Cd          IN RTSD0123.POS_CD%TYPE         /* 주소               */
    , v_Addr1           IN RTSD0123.ADDR1%TYPE          /* 주소               */
    , v_Addr2           IN RTSD0123.ADDR2%TYPE          /* 주소               */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0123.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt_Cd          IN RTSD0123.CNT_CD%TYPE         /* 타이어개수         */
    , v_Period          IN RTSD0123.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0123.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0123.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Email_Addr      IN RTSD0123.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Real_OrdNo      IN RTSD0123.REAL_ORDNO%TYPE     /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 계약번호           */
    , v_Plan_Day        IN RTSD0123.PLAN_DAY%TYPE       /* 계약번호           */
    , v_Ord_Day         IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Proc_Day        IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Os_Day          IN RTSD0123.OS_DAY%TYPE         /* 계약번호           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY_F%TYPE       /* 계약번호           */
    , v_Os_Day_T        IN RTSD0123.OS_DAY_T%TYPE       /* 계약번호           */
    , v_Ps_Cd           IN RTSD0123.PS_CD%TYPE          /* 계약번호           */
    , v_Cust_Req        IN RTSD0123.CUST_REQ%TYPE       /* 계약번호           */
    , v_Contact_Get     IN RTSD0123.CONTACT_GET%TYPE    /* 계약번호           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Call_Seq        IN RTSD0123.CALL_SEQ%TYPE       /* 등록자ID           */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 홈쇼핑구분         */
    , v_Recall_Tm       IN RTSD0123.RECALL_TM%TYPE      /* 홈쇼핑주문번호     */    
    , v_Reg_Id          IN RTSD0123.REG_ID%TYPE         /* 반품/취소일        */
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  ); 
        
  /*****************************************************************************
  -- 가계약정보 Insert(실시간)
  *****************************************************************************/
  PROCEDURE p_CreateRTSD0123 (
      v_Ord_No          IN RTSD0108.ORD_NO%TYPE
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  );
  
  
END Pkg_Rtsd0123;