CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0121 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0121
    PURPOSE     가계약정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2016-07-27  wjim            1. Created this package body.
    1.1     2016-09-19  wjim            고객요청사항 항목 추가
    1.3     2016-11-09  wjim            홈쇼핑 관련 조회조건 및 조회항목 추가
    1.3.6   2017-04-12  wjim            [20170412_01] '첨부파일 유무' 조회조건 추가
    1.7     2019-07-16  wjim            [20190716_01] 조회 exception 처리 추가
    1.8     2019-07-25  wjim            [20190716_01] 조건2, 조건3 조회 추가
    1.9     2019-08-08  wjim            [20190808_01] 조건3에 '상담사사번' 조회조건 추가
*******************************************************************************/

  /*****************************************************************************
  -- 가계약정보 조건1 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2016-07-27  wjim            1. Created this package body.
    1.3     2016-11-09  wjim            홈쇼핑 관련 조회조건 및 조회항목 추가
    1.3.6   2017-04-12  wjim            [20170412_01] '첨부파일 유무' 조회조건 추가
    1.7     2019-07-16  wjim            [20190716_01] 조회 exception 처리 추가
  *****************************************************************************/
  PROCEDURE p_sRTSD0121 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Provsn_Day_F    IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일(from)*/
    , v_Provsn_Day_T    IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일(to)  */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자 ID          */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사사번         */
    , v_Call_Day_F      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자(from)     */
    , v_Call_Day_T      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자(to)       */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Provsn_No_F     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(from)   */
    , v_Provsn_No_T     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(to)     */
    , v_Atfl_Yn         IN CHAR                         /* 첨부파일 여부      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 가계약정보 조건2 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.8     2019-07-25  wjim            [20190716_01] Created this package body.
  *****************************************************************************/
  PROCEDURE p_sRTSD0121_02 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Provsn_No_F     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(from)   */
    , v_Provsn_No_T     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(to)     */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );  
  
  /*****************************************************************************
  -- 가계약정보 조건3 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.8     2019-07-25  wjim            [20190716_01] Created this package body.
    1.9     2019-08-08  wjim            [20190808_01] 조건3에 '상담사사번' 조회조건 추가
  *****************************************************************************/
  PROCEDURE p_sRTSD0121_03 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사사번         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );  
  
  /*****************************************************************************
  -- 가계약정보+가계약상담정보 Select (엑셀 다운로드용)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2016-07-27  wjim            1. Created this package body.
    1.3     2016-11-09  wjim            홈쇼핑 관련 조회조건 및 조회항목 추가
    1.3.6   2017-04-12  wjim            [20170412_01] '첨부파일 유무' 조회조건 추가
    1.7     2019-07-16  wjim            [20190716_01] 조회 exception 처리 추가
  *****************************************************************************/
  PROCEDURE p_sContactRTSD0121 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Provsn_Day_F    IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일(from)*/
    , v_Provsn_Day_T    IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일(to)  */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자 ID          */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사사번         */
    , v_Call_Day_F      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자(from)     */
    , v_Call_Day_T      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자(to)       */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Provsn_No_F     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(from)   */
    , v_Provsn_No_T     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(to)     */
    , v_Atfl_Yn         IN CHAR                         /* 첨부파일 여부      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 가계약정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0121 (
      v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Provsn_Day      IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일      */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Addr            IN RTSD0121.ADDR%TYPE           /* 주소               */
    , v_Mc_Nm           IN RTSD0121.MC_NM%TYPE          /* 차종사양명         */
    , v_Spec_Nm         IN RTSD0121.SPEC_NM%TYPE        /* 타이어규격         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0121.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt             IN RTSD0121.CNT%TYPE            /* 타이어개수         */
    , v_Period          IN RTSD0121.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0121.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0121.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Email_Addr      IN RTSD0121.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자ID           */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Contact_Get     IN RTSD0121.CONTACT_GET%TYPE    /* 연락처수집         */
    , v_Cust_Req        IN RTSD0121.CUST_REQ%TYPE       /* 고객요청사항       */
    , v_Prod_Cd         IN RTSD0121.PROD_CD%TYPE        /* 상품코드           */
    , v_Prod_Nm         IN RTSD0121.PROD_NM%TYPE        /* 상품명             */
    , v_Rsrv_Day        IN RTSD0121.RSRV_DAY%TYPE       /* 예약접수일         */
    , v_Rsrv_Tm         IN RTSD0121.RSRV_TM%TYPE        /* 예약접수시간       */
    , v_Media           IN RTSD0121.MEDIA%TYPE          /* 매체               */
    , v_Req_Cust_Nm     IN RTSD0121.REQ_CUST_NM%TYPE    /* 신청고객명         */
    , v_Res_Cust_No     IN RTSD0121.RES_CUST_NO%TYPE    /* 고객번호(홈쇼핑용) */
    , v_Add_Mob_No      IN RTSD0121.ADD_MOB_NO%TYPE     /* 추가연락처         */
    , v_Res_Cust        IN RTSD0121.RES_CUST%TYPE       /* 고객반응           */
    , v_Cncl_Day        IN RTSD0121.CNCL_DAY%TYPE       /* 반품/취소일        */
    , v_Inst_Day        IN RTSD0121.INST_DAY%TYPE       /* 설치일             */
    , v_Join_Req        IN RTSD0121.JOIN_REQ%TYPE       /* 비고-협력사        */
    , v_Zip_Cd          IN RTSD0121.ZIP_CD%TYPE         /* 우편번호           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 가계약정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0121 (
      v_Provsn_No       IN RTSD0121.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Provsn_Day      IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약접수일       */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Addr            IN RTSD0121.ADDR%TYPE           /* 주소               */
    , v_Mc_Nm           IN RTSD0121.MC_NM%TYPE          /* 차종사양명         */
    , v_Spec_Nm         IN RTSD0121.SPEC_NM%TYPE        /* 타이어규격         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0121.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt             IN RTSD0121.CNT%TYPE            /* 타이어개수         */
    , v_Period          IN RTSD0121.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0121.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0121.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Email_Addr      IN RTSD0121.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자ID           */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Contact_Get     IN RTSD0121.CONTACT_GET%TYPE    /* 연락처수집         */
    , v_Cust_Req        IN RTSD0121.CUST_REQ%TYPE       /* 고객요청사항       */
    , v_Prod_Cd         IN RTSD0121.PROD_CD%TYPE        /* 상품코드           */
    , v_Prod_Nm         IN RTSD0121.PROD_NM%TYPE        /* 상품명             */
    , v_Rsrv_Day        IN RTSD0121.RSRV_DAY%TYPE       /* 예약접수일         */
    , v_Rsrv_Tm         IN RTSD0121.RSRV_TM%TYPE        /* 예약접수시간       */
    , v_Media           IN RTSD0121.MEDIA%TYPE          /* 매체               */
    , v_Req_Cust_Nm     IN RTSD0121.REQ_CUST_NM%TYPE    /* 신청고객명         */
    , v_Res_Cust_No     IN RTSD0121.RES_CUST_NO%TYPE    /* 고객번호(홈쇼핑용) */
    , v_Add_Mob_No      IN RTSD0121.ADD_MOB_NO%TYPE     /* 추가연락처         */
    , v_Res_Cust        IN RTSD0121.RES_CUST%TYPE       /* 고객반응           */
    , v_Cncl_Day        IN RTSD0121.CNCL_DAY%TYPE       /* 반품/취소일        */
    , v_Inst_Day        IN RTSD0121.INST_DAY%TYPE       /* 설치일             */
    , v_Join_Req        IN RTSD0121.JOIN_REQ%TYPE       /* 비고-협력사        */
    , v_Zip_Cd          IN RTSD0121.ZIP_CD%TYPE         /* 우편번호           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 가계약정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0121 (
      v_Comm_Dvsn       IN CHAR                         /*처리구분(I,U,D)     */
    , v_Provsn_No       IN RTSD0121.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Provsn_Day      IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일      */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Addr            IN RTSD0121.ADDR%TYPE           /* 주소               */
    , v_Mc_Nm           IN RTSD0121.MC_NM%TYPE          /* 차종사양명         */
    , v_Spec_Nm         IN RTSD0121.SPEC_NM%TYPE        /* 타이어규격         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0121.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt             IN RTSD0121.CNT%TYPE            /* 타이어개수         */
    , v_Period          IN RTSD0121.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0121.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0121.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Email_Addr      IN RTSD0121.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자ID           */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Contact_Get     IN RTSD0121.CONTACT_GET%TYPE    /* 연락처수집         */
    , v_Cust_Req        IN RTSD0121.CUST_REQ%TYPE       /* 고객요청사항       */
    , v_Prod_Cd         IN RTSD0121.PROD_CD%TYPE        /* 상품코드           */
    , v_Prod_Nm         IN RTSD0121.PROD_NM%TYPE        /* 상품명             */
    , v_Rsrv_Day        IN RTSD0121.RSRV_DAY%TYPE       /* 예약접수일         */
    , v_Rsrv_Tm         IN RTSD0121.RSRV_TM%TYPE        /* 예약접수시간       */
    , v_Media           IN RTSD0121.MEDIA%TYPE          /* 매체               */
    , v_Req_Cust_Nm     IN RTSD0121.REQ_CUST_NM%TYPE    /* 신청고객명         */
    , v_Res_Cust_No     IN RTSD0121.RES_CUST_NO%TYPE    /* 고객번호(홈쇼핑용) */
    , v_Add_Mob_No      IN RTSD0121.ADD_MOB_NO%TYPE     /* 추가연락처         */
    , v_Res_Cust        IN RTSD0121.RES_CUST%TYPE       /* 고객반응           */
    , v_Cncl_Day        IN RTSD0121.CNCL_DAY%TYPE       /* 반품/취소일        */
    , v_Inst_Day        IN RTSD0121.INST_DAY%TYPE       /* 설치일             */
    , v_Join_Req        IN RTSD0121.JOIN_REQ%TYPE       /* 비고-협력사        */
    , v_Zip_Cd          IN RTSD0121.ZIP_CD%TYPE         /* 우편번호           */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
/*****************************************************************************
  -- 상담관리 가계약정보 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------    
    1.3.2   2016-12-08  wjim            [20161208_01] 
                                        - 고객이 쇼핑몰에서 업로드한 타이어 이미지 첨부파일 추가
    1.3.6   2017-04-12  wjim            [20170412_01] '첨부파일 유무' 조회조건 추가 
    1.5     2017-09-22  wjim            [20170922_02] '추가연락처' 추가                                       
  *****************************************************************************/
  PROCEDURE p_sRTSD0121Provsn (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE   /* 계약번호           */
  );  
   
  /*****************************************************************************
  -- 상담 배정 정보 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------    
    1.0     2023-07-18  kstka            [20230718_01] 상담 배정 정보 조회                                       
  *****************************************************************************/
  PROCEDURE p_sOutboundAssignList (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Day_F    IN RTSD0121.PROVSN_DAY%TYPE      /* 가계약일자 FROM */
    , v_Provsn_Day_T    IN RTSD0121.PROVSN_DAY%TYPE      /* 가계약일자 TO   */
    , v_Proc_Day_F      IN RTSD0123.PROC_DAY%TYPE        /* 장착일자 FROM  */
    , v_Proc_Day_T      IN RTSD0123.PROC_DAY%TYPE        /* 장착일자 TO    */
    , v_Os_Day_F        IN RTSD0123.OS_DAY%TYPE          /* 계약만료일자 FROM*/
    , v_Os_Day_T        IN RTSD0123.OS_DAY%TYPE          /* 계약만료일자 TO */
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE       /* 가계약 구분     */
  );
  
  /*****************************************************************************
  -- 가계약 분배 배치 프로세스 (전체)
  *****************************************************************************/
  PROCEDURE p_CreateOutboundListDivideT (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Cnt       IN NUMBER                       /* 분배 건수         */
    , v_Contract_Type  IN VARCHAR                      /* 계약유형          */    
    , v_Provsn_Day_F   IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 등록 일자 FROM*/
    , v_Provsn_Day_T   IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 등록 일자 TO*/
    , v_Os_Day_F       IN RTSD0123.OS_DAY%TYPE         /* 계약만료일자 FROM     */
    , v_Os_Day_T       IN RTSD0123.OS_DAY%TYPE         /* 계약만료일자 TO       */
    , v_Proc_Day_F     IN RTSD0123.PROC_DAY%TYPE       /* 장착일자 FROM     */
    , v_Proc_Day_T     IN RTSD0123.PROC_DAY%TYPE       /* 장착일자 TO       */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 가계약 분배 배치 프로세스 (가계약)
  *****************************************************************************/
  PROCEDURE p_CreateOutboundListDivideP (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Cnt       IN NUMBER                       /* 분배 건수         */
    , v_Provsn_Day_F   IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 등록 일자 FROM*/
    , v_Provsn_Day_T   IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 등록 일자 TO*/
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 가계약 분배 배치 프로세스 (재렌탈)
  *****************************************************************************/
  PROCEDURE p_CreateOutboundListDivideR (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Cnt       IN NUMBER                       /* 분배 건수         */
    , v_Os_Day_F       IN RTSD0123.OS_DAY%TYPE         /* 계약만료일자 FROM     */
    , v_Os_Day_T       IN RTSD0123.OS_DAY%TYPE         /* 계약만료일자 TO       */
    , v_Proc_Day_F     IN RTSD0123.PROC_DAY%TYPE       /* 장착일자 FROM     */
    , v_Proc_Day_T     IN RTSD0123.PROC_DAY%TYPE       /* 장착일자 TO       */
    , v_Reg_Id         IN RTSD0123.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );
  
  /*****************************************************************************
  -- 배정된 상담리스트 회수
  *****************************************************************************/
  PROCEDURE p_RevokeOutboundListT (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Day       IN VARCHAR                      /* 배정일자          */
    , v_Contract_Type  IN VARCHAR                      /* 상담구분          */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );
     
  /*****************************************************************************
  -- 배정된 상담리스트 회수(가계약)
  *****************************************************************************/
  PROCEDURE p_RevokeOutboundListP (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Day       IN VARCHAR                      /* 배정일자          */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 배정된 상담리스트 회수(재렌탈)
  *****************************************************************************/
  PROCEDURE p_RevokeOutboundListR (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Day       IN VARCHAR                      /* 배정일자          */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );
         
    
END Pkg_Rtsd0121;