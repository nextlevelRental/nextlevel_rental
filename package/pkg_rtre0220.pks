CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0220 AS
/*******************************************************************************
   NAME    : Pkg_Rtre0220
   PURPOSE : 가상계좌 현황
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-02  ncho             1. Created this package spec.
   1.2        2019-06-04  wjim             [20190604_01] 입금일자 추가
   1.3        2025-05-29  10244015         [20250529_01] 가상계좌 다건 수납시 한건씩 처리
*******************************************************************************/
    /*****************************************************************************
     -- 가상계좌 거래내역 집계 Select
     *****************************************************************************/
    PROCEDURE p_sRtre0220_vaccTransTotal(  Ref_Cursor IN OUT SYS_REFCURSOR
                                         , v_Recv_Ym  IN VARCHAR                /* 수납년월 */
                                         , v_Bank_Cd  IN VACS_TOTL.BANK_CD%TYPE /* 은행코드 */
                                        );
    /*****************************************************************************
     -- 가상계좌 발급내용 조회(쇼핑몰용)
     *****************************************************************************/
    PROCEDURE p_sRtre0220_custVaccInfo(  Ref_Cursor IN OUT SYS_REFCURSOR
                                       , v_safe_key  IN RTSD0100.SAFEKEY%TYPE  /*세이프키*/
                                        );    /*****************************************************************************

    /*****************************************************************************
     -- 가상계좌 현황조회 Select
     *****************************************************************************/
    PROCEDURE p_sRtre0220_vaccMang(  Ref_Cursor IN OUT SYS_REFCURSOR
                                   , v_Bank_Cd  IN VACS_VACT.BANK_CD%TYPE /* 은행코드 */
                                  );

    /*****************************************************************************
     -- 기간만료계좌정리
     *****************************************************************************/
    PROCEDURE p_Rtre0220_prdExprArngm(  v_Bank_Cd_Param  IN  VACS_VACT.BANK_CD%TYPE /* 은행코드 */
                                      , v_Success_Code   OUT NUMBER
                                      , v_Return_Message OUT VARCHAR2
                                      , v_ErrorText      OUT VARCHAR2
                                     );

    /*****************************************************************************
     -- 가상계좌 정리 Update
     *****************************************************************************/
    FUNCTION f_UpdateRtre0220_prdExprArngm(  v_Bank_Cd    IN  VACS_VACT.BANK_CD%TYPE    /* 은행코드 */
                                           , v_Acct_No    IN  VACS_VACT.ACCT_NO%TYPE    /* 계좌번호 */
                                           , v_Cmf_Nm     IN  VACS_VACT.CMF_NM%TYPE     /* 예금주 */
                                           , v_Acct_St    IN  VACS_VACT.ACCT_ST%TYPE    /* 계좌상태 */
                                           , v_Open_Il    IN  VACS_VACT.OPEN_IL%TYPE    /* 할당일자 */
                                           , v_Fst_Il     IN  VACS_VACT.FST_IL%TYPE     /* 최초거래일자 */
                                           , v_Lst_Il     IN  VACS_VACT.LST_IL%TYPE     /* 최종거래일자 */
                                           , v_Tr_Amt     IN  VACS_VACT.TR_AMT%TYPE     /* 총거래금액 */
                                           , v_Tramt_Cond IN  VACS_VACT.TRAMT_COND%TYPE /* 거래금액조건 */
                                           , v_Trmc_Cond  IN  VACS_VACT.TRMC_COND%TYPE  /* 수납회차조건 */
                                           , v_Trbegin_Il IN  VACS_VACT.TRBEGIN_IL%TYPE /* 입금가능시작일 */
                                           , v_Trend_Il   IN  VACS_VACT.TREND_IL%TYPE   /* 입금가능만료일 */
                                           , v_Trbegin_Si IN  VACS_VACT.TRBEGIN_SI%TYPE /* 입금가능시작시간 */
                                           , v_Trend_Si   IN  VACS_VACT.TREND_SI%TYPE   /* 입금가능만료시간 */
                                           , v_Seq_No     IN  VACS_VACT.SEQ_NO%TYPE     /* 기간내수납횟수 */
                                           , v_ErrorText  OUT VARCHAR2
                                          )
    RETURN NUMBER;

/*******************************************************************************
 -- 요청일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0220RvaSeq
    RETURN NUMBER;

/*******************************************************************************
 -- 가상계좌번호 추출
 *******************************************************************************/
    FUNCTION f_sRtre0220AcctNo(v_Bank_Cd IN RTRE0220.BANK_CD%TYPE)
    RETURN VARCHAR;

/*******************************************************************************
 -- 가상계좌(VAN) 발급 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0220VaccIssuedMst(  v_Rva_Seq          IN  RTRE0220.RVA_SEQ%TYPE          /* 요청일련번호 */
                                            , v_Cust_No          IN  RTRE0220.CUST_NO%TYPE          /* 고객번호 */
                                            , v_Cust_Nm          IN  RTRE0220.CUST_NM%TYPE          /* 고객명 */
                                            , v_Tord_No          IN  RTRE0220.TORD_NO%TYPE          /* 통합청구계약번호 */
                                            , v_Rva_Amt          IN  RTRE0220.RVA_AMT%TYPE          /* 요청금액 */
                                            , v_Bank_Cd          IN  RTRE0220.BANK_CD%TYPE          /* 은행코드 */
                                            , v_Acct_No          IN  RTRE0220.VACCOUNT%TYPE         /* 가상계좌번호 */
                                            , v_Expiry_Acc       IN  RTRE0220.RVA_DAY%TYPE          /* 결제만료일 */
                                            , v_Dps_Nm           IN  RTRE0220.DPS_NM%TYPE           /* 입금자명 */
                                            , v_Sms_Send_Trgt_No IN  RTRE0220.SMS_SEND_TRGT_NO%TYPE /* 입금자명 */
                                            , v_Reg_Id           IN  RTRE0220.REG_ID%TYPE           /* 등록자 ID */
                                            , v_Success_Code     OUT NUMBER
                                            , v_Return_Message   OUT VARCHAR2
                                            , v_Error_Text       OUT VARCHAR2
                                           );

/*******************************************************************************
 -- 가상계좌(VAN) 상세 발급 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0221VaccIssuedDtl(  v_Rva_Seq        IN  RTRE0221.RVA_SEQ%TYPE  /* 요청일련번호 */
                                            , v_Cust_No        IN  RTRE0221.CUST_NO%TYPE  /* 고객번호 */
                                            , v_Tord_No        IN  RTRE0221.TORD_NO%TYPE  /* 통합청구계약번호 */
                                            , v_Ord_No         IN  RTRE0221.ORD_NO%TYPE   /* 계약번호 */
                                            , v_Schd_Seq       IN  RTRE0221.SCHD_SEQ%TYPE /* 청구순번 */
                                            , v_Recp_Tp        IN  RTRE0221.RECP_TP%TYPE  /* 청구구분 */
                                            , v_Demd_Dt        IN  RTRE0221.DEMD_DT%TYPE  /* 청구일자 */
                                            , v_Zfbdt          IN  RTRE0221.ZFBDT%TYPE    /* 만기계산기준일 */
                                            , v_Sale_Amt       IN  RTRE0221.SALE_AMT%TYPE /* 청구금액 */
                                            , v_Arre_Amt       IN  RTRE0221.ARRE_AMT%TYPE /* 연체금액 */
                                            , v_Reg_Id         IN  RTRE0221.REG_ID%TYPE   /* 등록자 ID */
                                            , v_Success_Code   OUT NUMBER
                                            , v_Return_Message OUT VARCHAR2
                                            , v_Error_Text     OUT VARCHAR2
                                           );

/*******************************************************************************
 -- 가상계좌원장 Update
 *******************************************************************************/
    PROCEDURE p_UpdateVacsVactVaccIssued(  v_Bank_Cd        IN  VACS_VACT.BANK_CD%TYPE  /* 은행코드 */
                                         , v_Acct_No        IN  VACS_VACT.ACCT_NO%TYPE  /* 가상계좌번호 */
                                         , v_Cmf_Nm         IN  VACS_VACT.CMF_NM%TYPE   /* 입금자명 */
                                         , v_Tr_Amt         IN  VACS_VACT.TR_AMT%TYPE   /* 총거래금액 */
                                         , v_Trend_Il       IN  VACS_VACT.TREND_IL%TYPE /* 입금가능만료일 */
                                         , v_Success_Code   OUT NUMBER
                                         , v_Return_Message OUT VARCHAR2
                                         , v_Error_Text     OUT VARCHAR2
                                        );

 /*****************************************************************************
  -- 가상계좌(VAN) 입금 수납처리 결과 저장
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2019-06-04  wjim            [20190604_01] 입금일자 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtre0220RecvResult (
      v_Rva_Day        IN RTRE0220.RVA_DAY%TYPE        /*요청일자             */
    , v_Rva_Seq        IN RTRE0220.RVA_SEQ%TYPE        /*요청일련번호         */
    , v_Rqst_Stat      IN RTRE0220.RQST_STAT%TYPE      /*상태                 */
    , v_Tr_Day         IN RTRE0220.TR_DAY%TYPE         /*입금일자             */ --[20190604_01]
    , v_Tno            IN RTRE0220.TNO%TYPE            /*거래고유번호         */
    , v_Recv_Seq       IN RTRE0220.RECV_SEQ%TYPE       /*수납거래번호         */
    , v_Dps_Nm         IN RTRE0220.DPS_NM%TYPE         /*입금자명             */
    , v_Reg_Id         IN RTRE0220.REG_ID%TYPE         /*등록자 ID            */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;


 /*****************************************************************************
  -- 가상계좌(VAN) 수납처리
  *****************************************************************************/
   PROCEDURE p_CreateRtre0220VaReceive (
      v_Tno               IN RTRE0220.TNO%TYPE        /* 거래고유번호      */
    , v_Work_Spcope       IN RTRE0220.WORK_SCOPE%TYPE /* 업무구분          */
    , v_Vaccount          IN RTRE0220.VACCOUNT%TYPE   /* 가상계좌번호      */
    , v_Cust_No           IN RTRE0220.CUST_NO%TYPE    /* 고객번호          */
    , v_Tord_No           IN RTRE0220.TORD_NO%TYPE    /* 대표계약번호      */
    , v_Tr_Il             IN VACS_AHST.TR_IL%TYPE     /* 통보일자          */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    );

 /*****************************************************************************
  -- 가상계좌(VAN) 입금대상 집계
  *****************************************************************************/
  PROCEDURE p_CreateRtre0220RecvResult (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) ;

 /*****************************************************************************
  -- 가상계좌(VAN) 입금취소 처리 (세틀뱅크에서 요청된 입금취소요청
  *****************************************************************************/
  PROCEDURE p_CreateRtre0220RecvCnclResult (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) ;
  
 /*****************************************************************************
  -- 가상계좌(VAN) 입금 취소처리 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0220RecvCncl (
      v_Rva_Day        IN RTRE0220.RVA_DAY%TYPE       /*요청일자              */
    , v_Rva_Seq        IN RTRE0220.RVA_SEQ%TYPE       /*요청일련번호          */
    , v_Cnc_Rseq       IN RTRE0220.CNC_RSEQ%TYPE      /*요청일련번호          */
    , v_Cnc_Stat      IN RTRE0220.RQST_STAT%TYPE            /*수납거래번호          */
    , v_Reg_Id         IN RTRE0220.REG_ID%TYPE         /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;  

 /*****************************************************************************
  -- 3연체이상 고객 가상계좌 발급 후 SMS발송
  *****************************************************************************/
  PROCEDURE p_CreateRtre0220LtCstVrtAcnIs (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
/*******************************************************************************
 -- 가상계좌(VAN) 발급 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0220VaccMstTmp(  v_Rva_Seq          IN  RTRE0220.RVA_SEQ%TYPE          /* 요청일련번호 */
                                            , v_Cust_No          IN  RTRE0220.CUST_NO%TYPE          /* 고객번호 */
                                            , v_Cust_Nm          IN  RTRE0220.CUST_NM%TYPE          /* 고객명 */
                                            , v_Tord_No          IN  RTRE0220.TORD_NO%TYPE          /* 통합청구계약번호 */
                                            , v_Rva_Amt          IN  RTRE0220.RVA_AMT%TYPE          /* 요청금액 */
                                            , v_Bank_Cd          IN  RTRE0220.BANK_CD%TYPE          /* 은행코드 */
                                            , v_Acct_No          IN  RTRE0220.VACCOUNT%TYPE         /* 가상계좌번호 */
                                            , v_Expiry_Acc       IN  RTRE0220.RVA_DAY%TYPE          /* 결제만료일 */
                                            , v_Dps_Nm           IN  RTRE0220.DPS_NM%TYPE           /* 입금자명 */
                                            , v_Sms_Send_Trgt_No IN  RTRE0220.SMS_SEND_TRGT_NO%TYPE /* 입금자명 */
                                            , v_Reg_Id           IN  RTRE0220.REG_ID%TYPE           /* 등록자 ID */
                                            , v_Success_Code     OUT NUMBER
                                            , v_Return_Message   OUT VARCHAR2
                                            , v_Error_Text       OUT VARCHAR2
                                           );

/*******************************************************************************
 -- 가상계좌(VAN) 상세 발급 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0221VaccDtlTmp(  v_Rva_Seq        IN  RTRE0221.RVA_SEQ%TYPE  /* 요청일련번호 */
                                            , v_Cust_No        IN  RTRE0221.CUST_NO%TYPE  /* 고객번호 */
                                            , v_Tord_No        IN  RTRE0221.TORD_NO%TYPE  /* 통합청구계약번호 */
                                            , v_Ord_No         IN  RTRE0221.ORD_NO%TYPE   /* 계약번호 */
                                            , v_Schd_Seq       IN  RTRE0221.SCHD_SEQ%TYPE /* 청구순번 */
                                            , v_Recp_Tp        IN  RTRE0221.RECP_TP%TYPE  /* 청구구분 */
                                            , v_Demd_Dt        IN  RTRE0221.DEMD_DT%TYPE  /* 청구일자 */
                                            , v_Zfbdt          IN  RTRE0221.ZFBDT%TYPE    /* 만기계산기준일 */
                                            , v_Sale_Amt       IN  RTRE0221.SALE_AMT%TYPE /* 청구금액 */
                                            , v_Arre_Amt       IN  RTRE0221.ARRE_AMT%TYPE /* 연체금액 */
                                            , v_Reg_Id         IN  RTRE0221.REG_ID%TYPE   /* 등록자 ID */
                                            , v_Success_Code   OUT NUMBER
                                            , v_Return_Message OUT VARCHAR2
                                            , v_Error_Text     OUT VARCHAR2
                                           );

    /*******************************************************************************
     -- 가상계좌(VAN) 발급 여부
     *******************************************************************************/
    FUNCTION f_getExistsVacc(   v_Cust_No        IN  RTRE0221.CUST_NO%TYPE  /* 고객번호 */
                                            , v_Tord_No        IN  RTRE0221.TORD_NO%TYPE  /* 통합청구계약번호 */
                                            , v_Ord_No         IN  RTRE0221.ORD_NO%TYPE   /* 계약번호 */
                                            , v_Schd_Seq       IN  RTRE0221.SCHD_SEQ%TYPE /* 청구순번 */
                                           ) RETURN NUMBER;
                                           
END Pkg_Rtre0220;