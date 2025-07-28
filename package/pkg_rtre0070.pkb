CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0070 AS
/*******************************************************************************
   NAME      Pkg_Rtre0070
   PURPOSE   출금이체 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
   1.1        2019-08-27  wjim             [20190827_01] 출금결과 반영 시 table lock 현상 해결                                             
*******************************************************************************/

  /*****************************************************************************
  -- 출금이체 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0070Count(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE          /*출금이체일련번호    */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day
    AND     RCMS_SEQ = v_Rcms_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0070Count;

  /*****************************************************************************
  -- 출금이체 내역 Count-Ord별 건수
  *****************************************************************************/
  FUNCTION f_sRtre0070OrdCount(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,         /*출금이체일련번호    */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day
    AND     RCMS_SEQ = v_Rcms_Seq
    AND     ORD_NO   = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0070OrdCount;

  /*****************************************************************************
  -- 출금이체 내역 Count-전체 건수
  *****************************************************************************/
  FUNCTION f_sRtre0070TotCount(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0070TotCount;

  /*****************************************************************************
  -- 출금이체 내역 Count-Ord별 출금요청금액
  *****************************************************************************/
  FUNCTION f_sRtre0070RcmsAmt(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,         /*출금이체일련번호    */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_Rcms_Amt NUMBER;
  BEGIN

    SELECT  SUM(RCMS_AMT)
    INTO    v_Rcms_Amt
    FROM    RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day
    AND     RCMS_SEQ = v_Rcms_Seq
    AND     ORD_NO   = v_Ord_No;

    RETURN v_Rcms_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0070RcmsAmt;

  /*****************************************************************************
  -- 출금이체 내역 Count-전체 출금요청금액
  *****************************************************************************/
  FUNCTION f_sRtre0070TotAmt(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER IS
    v_Rcms_Amt NUMBER;
  BEGIN

    SELECT  SUM(RCMS_AMT)
    INTO    v_Rcms_Amt
    FROM    RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day;

    RETURN v_Rcms_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0070TotAmt;

  /*****************************************************************************
  -- 출금이체 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0070 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0070.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Rcms_Amt       IN RTRE0070.RCMS_AMT%TYPE,       /*출금이체요청금액      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Bank_Cd        IN RTRE0070.BANK_CD%TYPE,        /*은행코드              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RCMS_DAY,                  /*출금이체일자        */
            A.RCMS_SEQ,                  /*출금이체일련번호    */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.ACC_SEQ,                   /*계좌순번            */
            A.RCMS_AMT,                  /*출금이체요청금액    */
            A.RQST_STAT,                 /*이체상태            */
            A.BANK_CD,                   /*은행코드            */
            A.RCERCD,                    /*출금이체 오류코드   */
            A.RECP_AMT,                  /*수납금액            */
            A.RECV_SEQ,                  /*수납거래번호        */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0070 A
    WHERE   A.RCMS_DAY  = DECODE(v_Rcms_Day  , NULL, A.RCMS_DAY  , v_Rcms_Day)
    AND     A.RCMS_SEQ  = DECODE(v_Rcms_Seq  , NULL, A.RCMS_SEQ  , v_Rcms_Seq)
    AND     A.ORD_NO    = DECODE(v_Ord_No    , NULL, A.ORD_NO    , v_Ord_No)
    AND     A.CUST_NO   = DECODE(v_Cust_No   , NULL, A.CUST_NO   , v_Cust_No)
    AND     A.ACC_SEQ   = DECODE(v_Acc_Seq   , NULL, A.ACC_SEQ   , v_Acc_Seq)
    AND     A.RCMS_AMT  = DECODE(v_Rcms_Amt  , NULL, A.RCMS_AMT  , v_Rcms_Amt)
    AND     A.RQST_STAT = DECODE(v_Rqst_Stat , NULL, A.RQST_STAT , v_Rqst_Stat)
    AND     A.BANK_CD   = DECODE(v_Bank_Cd   , NULL, A.BANK_CD   , v_Bank_Cd)
    AND     A.RCERCD    = DECODE(v_Rcercd    , NULL, A.RCERCD    , v_Rcercd)
    AND     A.RECP_AMT  = DECODE(v_Recp_Amt  , NULL, A.RECP_AMT  , v_Recp_Amt)
    AND     A.RECV_SEQ  = DECODE(v_Recv_Seq  , NULL, A.RECV_SEQ  , v_Recv_Seq)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtre0070;

  /*****************************************************************************
  -- 출금이체 내역 Select(계약번호별 내역조회)
  *****************************************************************************/
  PROCEDURE p_sRtre0070AccTranByOrdNo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day_F     IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자FROM       */
    v_Rcms_Day_T     IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자TO         */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE       /*이체상태              */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RCMS_DAY,                                                       /*출금이체일자      */
            A.ORD_NO,                                                         /*계약번호          */
            A.CUST_NO,                                                        /*고객번호          */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM,              /*고객명            */
            A.RCMS_AMT,                                                       /*출금이체요청금액  */
            A.RECP_AMT,                                                       /*수납금액          */
            A.RCERCD,                                                         /*출금이체 오류코드 */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R003', A.RCERCD) RCERNM,        /*출금이체 오류코드명*/
            A.BANK_CD,                                                        /*은행코드          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001', A.BANK_CD) BANK_NM,      /*은행명            */
            (
            SELECT  ACCT_NO 
            FROM    RTRE0010 X 
            WHERE   A.ACC_SEQ = X.ACC_SEQ 
            AND     A.CUST_NO = X.CUST_NO
            ) ACCT_NO,                                                        /*계좌번호          */
            A.RQST_STAT,                                                      /*출금이체 상태     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R022', A.RQST_STAT) RQST_STAT_NM, /*출금이체 상태명 */
            A.RCMS_SEQ,                                                         /*출금이체 일련번호*/
            A.RECV_SEQ                                                          /*수납거래번호    */
    FROM    RTRE0070 A
    WHERE   A.RCMS_DAY BETWEEN v_Rcms_Day_F AND v_Rcms_Day_T
    AND     (v_Ord_No    IS NULL OR A.ORD_NO    = v_Ord_No)      
    AND     (v_Cust_No   IS NULL OR A.CUST_NO   = v_Cust_No)
    AND     (v_Rqst_Stat IS NULL OR A.RQST_STAT = v_Rqst_Stat);     

  END p_sRtre0070AccTranByOrdNo;    
  
  /*****************************************************************************
  -- 출금이체 내역 Select(은행별 내역조회)
  *****************************************************************************/
  PROCEDURE p_sRtre0070AccTranByBank (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day_F     IN RTRE0070.RCMS_DAY%TYPE,      /*출금이체일자FROM       */
    v_Rcms_Day_T     IN RTRE0070.RCMS_DAY%TYPE       /*출금이체일자TO         */
    ) IS
  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  B.RCMS_DAY,                                                      /*출금이체일자    */
            B.BANK_CD,                                                       /*은행코드        */
            PKG_RTCM0051.F_SRTCM0051CODENAME('R001', B.BANK_CD) AS BANK_NM,  /*은행명          */
            SUM( B.RCMS_CNT ) AS REQST_CNT,                                  /*청구건수        */
            SUM( B.RCMS_AMT) AS REQST_AMT,                                   /*청구금액        */
            SUM( DECODE( B.RQST_STAT, '5', B.RCMS_CNT, 0 )) AS SRECP_CNT,    /*정상출금건수    */
            SUM( DECODE( B.RQST_STAT, '5', B.RECP_AMT, 0 )) AS SRECP_AMT,    /*정상출금금액    */
            SUM( DECODE( B.RQST_STAT, '4', B.RCMS_CNT, 0 )) AS HSRCP_CNT,    /*부분출금건수    */
            SUM( DECODE( B.RQST_STAT, '4', B.RECP_AMT, 0 )) AS HSRCP_AMT,    /*부분출금금액    */
            SUM( B.RECP_AMT ) AS TRECP_AMT,                                  /*출금금액합계    */
            SUM( DECODE( B.RQST_STAT, '3', B.RCMS_CNT, 0 )) AS ERECP_CNT,    /*오류건수        */
            SUM( B.FEE_AMT ) AS FEE_AMT                                      /*수수료          */
    FROM    (
            SELECT  A.RCMS_DAY,
                    A.BANK_CD,
                    A.RQST_STAT,
                    COUNT(A.RCMS_DAY) AS RCMS_CNT,
                    SUM(A.RCMS_AMT) AS RCMS_AMT,
                    SUM(A.RECP_AMT) AS RECP_AMT,
                    SUM( CASE WHEN A.RQST_STAT = '3' THEN 
                                CASE WHEN A.RCERCD = '0075' THEN 0
                                ELSE 40 END
                    WHEN A.RQST_STAT = '4' THEN 200
                    WHEN A.RQST_STAT = '5' THEN 200
                    ELSE 0 END ) AS FEE_AMT    
            FROM    RTRE0070 A
            WHERE   A.RCMS_DAY BETWEEN v_Rcms_Day_F AND v_Rcms_Day_T
            GROUP   BY A.RCMS_DAY, A.BANK_CD, A.RQST_STAT
            ) B
    GROUP   BY B.RCMS_DAY, B.BANK_CD;
         
  END p_sRtre0070AccTranByBank;
  
 /*****************************************************************************
  -- 수금관리 > CMS관리 > 출금이체처리 >  [STEP2] 출금이체대상조회 Select
  *****************************************************************************/  
  PROCEDURE p_sRtre0070AccTranTargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS
    v_cnt1   NUMBER DEFAULT 0;
    v_cnt2   NUMBER DEFAULT 0;
    v_cnt3   NUMBER DEFAULT 0;    
    v_Extrc_Yn VARCHAR(1);
    v_Confi_Yn VARCHAR(1);
    v_Fcret_Yn VARCHAR(1);
    v_Ftran_Yn VARCHAR(1);
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RCMS_DAY,                                                        /*출금이체일자 */
            A.BANK_CD,                                                     /*은행코드    */
            PKG_RTCM0051.F_SRTCM0051CODENAME('R001', A.BANK_CD) BANK_NM,   /*은행명 */
            A.RQST_STAT,                                                   /*이체상태*/
            PKG_RTCM0051.F_SRTCM0051CODENAME('R022', A.RQST_STAT) RQST_STAT_NM,/*이체상태명*/
            A.RQCNT,                                                       /*신청건수  */
            A.RQAMT                                                        /*출금이체요청금액*/
    FROM    ( 
            SELECT  C.RCMS_DAY,
                    C.BANK_CD,
                    C.RQST_STAT,
                    COUNT (*) RQCNT,
                    SUM(C.RCMS_AMT) RQAMT
            FROM    RTRE0070 C
            WHERE   C.RCMS_DAY = v_Rcms_Day
            GROUP   BY C.RCMS_DAY, C.BANK_CD, C.RQST_STAT
            ) A;

    SELECT  COUNT (*)
    INTO    v_cnt1 --조회카운트1
    FROM    RTRE0070 C, 
            RTRE0010 B
    WHERE   C.RCMS_DAY = v_Rcms_Day 
    AND     B.ACC_SEQ  = C.ACC_SEQ;
               
    SELECT  COUNT (RCMS_DAY)
    INTO    v_cnt2 --조회카운트2
    FROM    RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day;

     IF v_cnt1 <>  v_cnt2 THEN
        v_Success_code := -1;
        v_Return_Message := '대상건수에 문제가 있습니다. 시스템 담당자에게 확인하세요.';  
     ELSIF v_cnt1 =  v_cnt2 THEN
             
        SELECT  COUNT (*)
        INTO    v_cnt3
        FROM    RTRE0099
        WHERE   FILE_TP = 'EB21'
        AND     RQST_DAY = v_Rcms_Day
        AND     FILE_NM  = 'EB21' || SUBSTR (v_Rcms_Day, 5, 4)
        AND     DEL_YN   = 'N';
          
        IF v_cnt3 = 0 THEN 
            v_Success_code := -1;
            v_Return_Message := '결제신청 대상없음(RTRE0099). 시스템 담당자에게 확인하세요.';
        ELSE
        
            SELECT  EXTRC_YN,
                    CONFI_YN,
                    FCRET_YN,
                    FTRAN_YN
            INTO    v_Extrc_Yn,
                    v_Confi_Yn,
                    v_Fcret_Yn,
                    v_Ftran_Yn
            FROM    RTRE0099
            WHERE   FILE_TP  = 'EB21'
            AND     RQST_DAY = v_Rcms_Day
            AND     FILE_NM  = 'EB21' || SUBSTR (v_Rcms_Day, 5, 4)
            AND     DEL_YN   = 'N';
              
            --EXTRC_YN(대상집계여부)/CONFI_YN(대상확인여부)/FCRET_YN(파일생성여부)/FTRAN_YN(파일전송여부)
            IF  v_Extrc_Yn  = 'N' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '대상집계가 완료 되지 않았습니다.';  
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '대상집계 완료, 대상확인 하시기 바랍니다.';       
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '대상확인 완료, 파일생성 하시기 바랍니다.';   
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '파일생성 완료, 전송완료 하시기 바랍니다.';    
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'Y' THEN
              v_Success_code := 0;
              v_Return_Message := '계좌신청 처리 완료 되었습니다.';    
            ELSE
              v_Success_code := -1;
              v_Return_Message := '시스템 담당자에게 확인하세요.';            
            END IF;
         END IF;   
     END IF;

  END p_sRtre0070AccTranTargetList; 
  
  /*****************************************************************************
  -- 출금이체 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0070 (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0070.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Rcms_Amt       IN RTRE0070.RCMS_AMT%TYPE,       /*출금이체요청금액      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Bank_Cd        IN RTRE0070.BANK_CD%TYPE,        /*은행코드              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0070 (
            RCMS_DAY,
            RCMS_SEQ,
            ORD_NO,
            CUST_NO,
            ACC_SEQ,
            RCMS_AMT,
            RQST_STAT,
            BANK_CD,
            RCERCD,
            RECP_AMT,
            RECV_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Rcms_Day,
            v_Rcms_Seq,
            v_Ord_No,
            v_Cust_No,
            v_Acc_Seq,
            v_Rcms_Amt,
            v_Rqst_Stat,
            v_Bank_Cd,
            v_Rcercd,
            v_Recp_Amt,
            v_Recv_Seq,
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

  END f_InsertRtre0070;

  /*****************************************************************************
  -- 출금이체 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0070 (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0070.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Rcms_Amt       IN RTRE0070.RCMS_AMT%TYPE,       /*출금이체요청금액      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Bank_Cd        IN RTRE0070.BANK_CD%TYPE,        /*은행코드              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0070
    SET    ORD_NO    = v_Ord_No,
           CUST_NO   = v_Cust_No,
           ACC_SEQ   = v_Acc_Seq,
           RCMS_AMT  = v_Rcms_Amt,
           RQST_STAT = v_Rqst_Stat,
           BANK_CD   = v_Bank_Cd,
           RCERCD    = v_Rcercd,
           RECP_AMT  = v_Recp_Amt,
           RECV_SEQ  = v_Recv_Seq,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  RCMS_DAY  = v_Rcms_Day
    AND    RCMS_SEQ  = v_Rcms_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0070;

  /*****************************************************************************
  -- 출금이체 내역 Update-상태 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0070RqstStat (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0070
    SET     RQST_STAT = v_Rqst_Stat,
            CHG_ID    = v_Reg_Id,
            CHG_DT    = SYSDATE 
    WHERE   RCMS_DAY  = v_Rcms_Day;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0070RqstStat;

  /*****************************************************************************
  -- 출금이체 내역 Update-수납처리후 수납거래번호 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0070RecvSeq (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0070
    SET     RECV_SEQ = v_Recv_Seq,
            CHG_ID   = v_Reg_Id,
            CHG_DT   = SYSDATE 
    WHERE   RCMS_DAY = v_Rcms_Day
    AND     RCMS_SEQ = v_Rcms_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0070RecvSeq;


  /*****************************************************************************
  -- 출금이체 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0070RqstResult (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0070
    SET     RQST_STAT = v_Rqst_Stat,
            RCERCD    = v_Rcercd,
            RECP_AMT  = v_Recp_Amt,
            CHG_ID    = v_Reg_Id,
            CHG_DT    = SYSDATE 
    WHERE   RCMS_DAY  = v_Rcms_Day
    AND     RCMS_SEQ  = v_Rcms_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0070RqstResult;

  /*****************************************************************************
  -- 출금이체 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0070 (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0070.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day
    AND     RCMS_SEQ = v_Rcms_Seq;
        
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0070.f_DeleteRtre0070(1)', '출금이체일자', v_Rcms_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0070.f_DeleteRtre0070(1)', '출금이체일련번호', v_Rcms_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0070.f_DeleteRtre0070(1)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0070;

  /*****************************************************************************
  -- 출금이체 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0070 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN OUT RTRE0070.RCMS_SEQ%TYPE,   /*출금이체일련번호      */
    v_Ord_No         IN RTRE0070.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0070.CUST_NO%TYPE,        /*고객번호              */
    v_Acc_Seq        IN RTRE0070.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Rcms_Amt       IN RTRE0070.RCMS_AMT%TYPE,       /*출금이체요청금액      */
    v_Rqst_Stat      IN RTRE0070.RQST_STAT%TYPE,      /*이체상태              */
    v_Bank_Cd        IN RTRE0070.BANK_CD%TYPE,        /*은행코드              */
    v_Rcercd         IN RTRE0070.RCERCD%TYPE,         /*출금이체 오류코드     */
    v_Recp_Amt       IN RTRE0070.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0070.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 출금이체일자 ,계약번호 ,고객번호 ,계좌순번 ,출금이체요청금액 ,이체상태 ,수납금액 ,수납거래번호 ,등록자 ID
    IF 0 != ISDATE(v_Rcms_Day) THEN
        v_Return_Message := '출금이체일자('||v_Rcms_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF TRIM(v_Acc_Seq) IS NULL THEN
        v_Return_Message := '계좌순번('||v_Acc_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;            
    
    IF TRIM(v_Rcms_Amt) IS NULL THEN
        v_Return_Message := '출금이체요청금액('||v_Rcms_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        
    
    IF TRIM(v_Rqst_Stat) IS NULL THEN
        v_Return_Message := '이체상태('||v_Rqst_Stat||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Bank_Cd) IS NULL THEN
        v_Return_Message := '은행코드('||v_Bank_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Recp_Amt) IS NULL THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_sRtre0070Count(v_Rcms_Day, v_Rcms_Seq) THEN
            v_Return_Message := '해당건('||v_Rcms_Day||'-'||v_Rcms_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;   
        
        v_Rcms_Seq := f_sRtre0070RcmsSeq(v_Rcms_Day);
        
        IF 0 != f_InsertRtre0070(v_Rcms_Day, v_Rcms_Seq, v_Ord_No, v_Cust_No, 
                                 v_Acc_Seq, v_Rcms_Amt, v_Rqst_Stat, v_Bank_Cd, v_Rcercd, 
                                 v_Recp_Amt, v_Recv_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '출금이체 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0070Count(v_Rcms_Day, v_Rcms_Seq) THEN
            v_Return_Message := '해당건('||v_Rcms_Day||'-'||v_Rcms_Seq||')으로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;   

        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0070(v_Rcms_Day, v_Rcms_Seq, v_Ord_No, v_Cust_No, 
                                     v_Acc_Seq, v_Rcms_Amt, v_Rqst_Stat, v_Bank_Cd, v_Rcercd, 
                                     v_Recp_Amt, v_Recv_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '출금이체 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0070(v_Rcms_Day, v_Rcms_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '출금이체 내역 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0070.p_IUDRtre0070(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0070.p_IUDRtre0070(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0070;

  /*****************************************************************************
  -- 출금이체 내역 - 출금이체일련번호 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0070RcmsSeq(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER IS
    v_Rcms_Seq  RTRE0070.RCMS_SEQ%TYPE DEFAULT NULL;    /*출금이체일련번호    */
  BEGIN
  
    SELECT  NVL((SELECT  MAX(RCMS_SEQ)
                 FROM    RTRE0070
                 WHERE   RCMS_DAY = v_Rcms_Day)+ 1, 1) AS RCMS_SEQ
    INTO    v_Rcms_Seq
    FROM    DUAL;
    
    RETURN v_Rcms_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0070RcmsSeq;


  /*****************************************************************************
  -- 출금이체 대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0070TransAccum (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS
   
    e_Error EXCEPTION;
    v_Rcms_Amt  RTRE0070.RCMS_AMT%TYPE DEFAULT NULL;    /*출금이체요청금액    */
    
  BEGIN
  

    INSERT INTO RTRE0070 (
            RCMS_DAY,
            RCMS_SEQ,
            ORD_NO,
            CUST_NO,
            ACC_SEQ,
            RCMS_AMT,
            RQST_STAT,
            BANK_CD,
            RCERCD,
            RECP_AMT,
            RECV_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  RCMS_DAY, ROWNUM RCMS_SEQ, ORD_NO, CUST_NO, ACC_SEQ,
            RCMS_AMT, '1' RQST_STAT, BANK_CD, NULL RCERCD, 
            0 RECP_AMT, NULL RECV_SEQ,
            v_Reg_Id REG_ID, SYSDATE REG_DT,  
            v_Reg_Id CHG_ID, SYSDATE CHG_DT
    FROM    (
            SELECT  A.RCMS_DAY, A.TORD_NO ORD_NO, A.CUST_NO, A.ACC_SEQ, 
                    A.BANK_CD, SUM(A.ARRE_AMT) RCMS_AMT
            FROM    RTRE0071 A
            WHERE   A.RCMS_DAY = v_Rcms_Day
            GROUP   BY A.RCMS_DAY, A.TORD_NO, A.CUST_NO, A.ACC_SEQ, A.BANK_CD
            ORDER   BY A.RCMS_DAY, A.TORD_NO, A.CUST_NO, A.ACC_SEQ, A.BANK_CD
            );

    SELECT  NVL(SUM(RCMS_AMT),0)
    INTO    v_Rcms_Amt
    FROM    RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day;
    
    IF v_Rcms_Amt = 0 THEN
        v_Success_code := -2;
        v_Return_Message := '출금이체 대상금액이 없습니다.';
    END IF;
              
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0070.p_CreateRtre0070TransAccum(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0070.p_CreateRtre0070TransAccum(2)', v_ErrorText, v_Return_Message);
    
  END p_CreateRtre0070TransAccum;

  /*****************************************************************************
  -- 출금이체 - 수납처리
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2019-08-27  wjim             [20190827_01] 출금결과 반영 시 table lock 현상 해결
                                           - 카드 정기출금 수납처리 대상건이 많은 경우 table lock 현상 발생하여 서비스 불가 현상 발생 (2019-08-26 기준 49,551 건)
                                           - CMS는 건 자체가 많지 않아 발생한 적이 없으나, 향후를 위해 함께 수정 
                                           - 건별 commit 처리  
  *****************************************************************************/
  PROCEDURE p_CreateRtre0070TransReceive (
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Reg_Id         IN RTRE0070.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS

    CURSOR  Cur_Rtre0070 IS
    SELECT  A.RCMS_SEQ, A.ORD_NO, A.CUST_NO, A.RCMS_AMT, A.RQST_STAT, A.RECP_AMT
    FROM    RTRE0070 A
    WHERE   A.RCMS_DAY = v_Rcms_Day
    AND     A.RECP_AMT > 0
    AND     A.RECV_SEQ IS NULL
    ORDER   BY A.ORD_NO;

    CURSOR  Cur_Rtre0071 (v_Tord_No VARCHAR) IS
    SELECT  A.ORD_NO, A.CUST_NO, SUM(A.ARRE_AMT) ARRE_AMT
    FROM    RTRE0071 A
    WHERE   A.RCMS_DAY = v_Rcms_Day
    AND     A.TORD_NO  = v_Tord_No
    GROUP   BY A.ORD_NO, A.CUST_NO
    ORDER   BY A.ORD_NO;

    CURSOR  Cur_Rtsd0109 (v_Ord_No VARCHAR, v_Cust_No VARCHAR) IS
    SELECT  A.SCHD_SEQ, A.ARRE_AMT
    FROM    RTSD0109 A
    WHERE   A.CUST_NO  = v_Cust_No
    AND     A.SCD_STAT = 'S'
    AND     A.ZLSPR    = 'N'
    AND     A.RC_YN   <> 'Y'
    AND     A.USE_YN   = 'Y'
    AND     A.ZFB_DAY <= v_Rcms_Day
    AND     A.ORD_NO   = v_Ord_No
    ORDER   BY A.DEMD_DT, A.RECP_TP;

    e_Error EXCEPTION;
    v_Count     NUMBER;
    v_Table_Count   NUMBER;
    Ref_Cursor  SYS_REFCURSOR;
    v_Recv_Seq  RTRE0030.RECV_SEQ%TYPE;
    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL;   /*송수신 파일구분       */
    v_File_Nm   RTRE0099.FILE_NM%TYPE DEFAULT NULL;   /*송수신 파일명         */
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;  /*FILE 순번             */
    v_Rqst_Day  RTRE0099.RQST_DAY%TYPE DEFAULT NULL;  /*출금일자              */
    v_Recp_Amt  RTRE0070.RECP_AMT%TYPE;
    v_Rear_Amt  RTRE0070.RECP_AMT%TYPE;
    v_Pend_Amt  RTRE0070.RECP_AMT%TYPE;
    v_Arre_Amt  RTRE0071.ARRE_AMT%TYPE;
    v_Tarre_Amt RTRE0071.ARRE_AMT%TYPE;
    v_Trecp_Amt RTRE0071.ARRE_AMT%TYPE;
    v_Remain_Amt RTRE0071.ARRE_AMT%TYPE;
    v_Tord_No   RTRE0071.TORD_NO%TYPE;


  BEGIN

    -- 필수값: 출금이체일자 ,등록자 ID
    IF 0 != ISDATE(v_Rcms_Day) THEN
        v_Return_Message := '출금이체일자('||v_Rcms_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 출금이체  반영 결과내역 확인    
    SELECT  NVL(COUNT(1),0)
    INTO    v_Count
    FROM    RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day
    AND     RQST_STAT IN ('4', '5')
    AND     RECV_SEQ IS NULL;
    
    IF v_Count = 0 THEN
        v_Return_Message := '해당건('||v_Rcms_Day||')은 출금이체내역(RTRE0070)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    --출금이체고객번호와 총구스케쥴고객번호가 다른건 확인
    --- [20190827_01] 명의변경 프로세스가 없어 특별히 필요없다고 판단되어 주석 처리  
    v_Count := 0;
    
--    SELECT  NVL(COUNT(B.CUST_NO), 0)
--    INTO    v_Count
--    FROM    RTRE0070 A, RTRE0071 B, RTSD0109 C
--    WHERE   A.RCMS_DAY = v_Rcms_Day
--    AND     A.RQST_STAT IN ('4', '5')
--    AND     A.RECV_SEQ IS NULL
--    AND     A.RCMS_DAY = B.RCMS_DAY
--    AND     A.ORD_NO   = B.TORD_NO
--    AND     B.ORD_NO   = C.ORD_NO
--    AND     B.SCHD_SEQ = C.SCHD_SEQ
--    AND     B.CUST_NO <> C.CUST_NO 
--    AND     ROWNUM = 1;
--    
--    IF v_Count <> 0 THEN
--        v_Return_Message := '해당 출금자료는('||v_Rcms_Day||')은 고객번호가 출금과 스케쥴이 같지 않아 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
    
--        v_Return_Message := '강제 ERROR 처리!';
--       RAISE e_Error;
    
    -- 출금이체 송수신내역 확인
    v_File_Tp  := 'EB22';
    v_File_Nm  := 'EB22'||SUBSTR(v_Rcms_Day,5,4);
    v_Rqst_Day := v_Rcms_Day;
    
    IF 0 = Pkg_Rtre0099.f_sRtre0099CountCheck(v_File_TP, v_Rqst_Day, v_File_Nm) THEN
        v_Return_Message := '해당건('||v_File_Tp||'-'||v_Rqst_Day||')은 송수신내역(RTRE0099)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 기존 등록  자료  check(RTre0099)
    v_File_Seq := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);


    -- 수납대상리스트 임시테이블 존재여부 확인
    SELECT COUNT(*)
    INTO   v_Table_Count
    FROM   USER_TABLES
    WHERE  TABLE_NAME = 'RTTEMP01';

    IF (SQL%NOTFOUND) OR (v_Table_Count = 0) THEN

        -- 수납대상리스트 임시테이블 생성
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
            
     

    -- 출금이체 처리건 대상
    FOR CUR_0070 IN Cur_Rtre0070 LOOP
        EXIT WHEN Cur_Rtre0070%NOTFOUND;  

        v_Remain_Amt := 0;
        IF CUR_0070.RQST_STAT = '4' THEN -- 부분출금
        
            -- 단수발생 확인
            SELECT  SUM ( ROUND(ARRE_AMT * ( CUR_0070.RECP_AMT / CUR_0070.RCMS_AMT ), 0) ) AS TRECP_AMT
            INTO    v_Trecp_Amt
            FROM    (
                    SELECT  A.ORD_NO, SUM(ARRE_AMT) ARRE_AMT
                    FROM    RTRE0071 A
                    WHERE   A.RCMS_DAY = v_Rcms_Day
                    AND     A.TORD_NO  = CUR_0070.ORD_NO
                    GROUP BY A.ORD_NO
                    );

            IF CUR_0070.RECP_AMT <> v_Trecp_Amt THEN
                v_Remain_Amt := v_Recp_Amt - CUR_0070.RECP_AMT; 
            ELSE
                v_Remain_Amt := 0;
            END IF;
            
        END IF;
        
        v_Count := 1;
        v_Tord_NO := CUR_0070.ORD_NO;
        
        FOR CUR_0071 IN Cur_Rtre0071(v_Tord_No) LOOP
            EXIT WHEN Cur_Rtre0071%NOTFOUND;  
            
            -- 수납처리 대상출금이체 금액
            v_Tarre_Amt := ROUND(CUR_0071.ARRE_AMT * ( CUR_0070.RECP_AMT / CUR_0070.RCMS_AMT ), 0);
            
            IF v_Count = 1 THEN
                v_Tarre_Amt := v_Tarre_Amt + v_Remain_Amt;
            END IF;
            
            v_Trecp_Amt := v_Tarre_Amt;     -- 수납처리 대상 전체금액
            
            -- 미수자료에대해 수납처리함
            FOR CUR_0109 IN Cur_Rtsd0109(CUR_0071.ORD_NO, CUR_0071.CUST_NO) LOOP
                EXIT WHEN Cur_Rtsd0109%NOTFOUND;  
            
                IF v_Tarre_Amt >= CUR_0109.ARRE_AMT THEN
                    v_Arre_Amt := CUR_0109.ARRE_AMT;
                    v_Recp_Amt := CUR_0109.ARRE_AMT;
                    v_Tarre_Amt := v_Tarre_Amt - CUR_0109.ARRE_AMT; 
                ELSE
                    v_Arre_Amt := CUR_0109.ARRE_AMT;
                    v_Recp_Amt := v_Tarre_Amt;
                    v_Tarre_Amt := 0;
                END IF;
                
                -- 수납대상리스트 임시테이블에 생성 
                IF v_Recp_Amt > 0 THEN
                
                    INSERT INTO RTTEMP01
                           ( ORD_NO,                    /*계약번호            */
                             CUST_NO,                   /*고객번호            */
                             SCHD_SEQ,                  /*청구순번            */
                             ARRE_AMT,                  /*연체금액(VAT포함)   */
                             RECP_AMT                   /*수납금액(VAT포함)   */
                           )
                    VALUES ( CUR_0071.ORD_NO, CUR_0071.CUST_NO, CUR_0109.SCHD_SEQ,
                             v_Arre_Amt, v_Recp_Amt ); 
                END  IF;
            
            END LOOP;   
            
            -- 선수금액이  남아 있는 경우 청구순번없이 TEMP Table 생성
            v_Pend_Amt := v_Tarre_Amt;
            
            IF  v_Tarre_Amt > 0 THEN
            
                -- 수납대상리스트 임시테이블에 생성 
                INSERT INTO RTTEMP01
                           ( ORD_NO,                    /*계약번호            */
                             CUST_NO,                   /*고객번호            */
                             SCHD_SEQ,                  /*청구순번            */
                             ARRE_AMT,                  /*연체금액(VAT포함)   */
                             RECP_AMT                   /*수납금액(VAT포함)   */
                           )
                VALUES ( CUR_0071.ORD_NO, CUR_0071.CUST_NO, NULL,
                         0, v_Pend_Amt ); 
            END IF;

            IF Cur_Rtsd0109%ISOPEN THEN
                CLOSE Cur_Rtsd0109;
            END IF;    

            -- 처리금액 설정
            v_Recp_Amt := v_Trecp_Amt;
            v_Rear_Amt := v_Trecp_Amt - v_Pend_Amt;
            
            -- 수납내역 생성처리    
            -- 수납대상리스트 조회(미납리스트와 선수금 내역)
            OPEN  Ref_Cursor FOR    
            SELECT  A.ORD_NO,               /*계약번호 */
                    A.CUST_NO,              /*고객번호 */
                    A.SCHD_SEQ,             /*청구순번 */
                    A.ARRE_AMT,             /*미납금액 */
                    A.RECP_AMT              /*수납처리금액 */
            FROM    RTTEMP01 A
            WHERE   A.RECP_AMT > 0          /*수납금액이 존재하는 것만 */
            AND     A.ORD_NO  = CUR_0071.ORD_NO
            AND     A.CUST_NO = CUR_0071.CUST_NO
            ORDER   BY NVL(A.SCHD_SEQ,999); -- 선수금을 무조건 마지막에 위치함.

                    
            -- 수납거래번호 채번
            v_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();
            
            Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Rcms_Day, CUR_0071.ORD_NO, CUR_0071.CUST_NO, 
                                           v_Reg_Id,   v_Recp_Amt, 'C1', '01', v_Recv_Seq, 
                                           v_Rear_Amt, v_Pend_Amt, v_Reg_Id, v_Success_Code, 
                                           v_Return_Message, v_ErrorText);
            IF 0 != v_Success_Code THEN
                v_Return_Message := '수납내역 생성처리 실패!!('||CUR_0070.ORD_NO||')-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;  
      
             
            v_Count := v_Count + 1;
            
        END LOOP;    

        IF Cur_Rtre0071%ISOPEN THEN
            CLOSE Cur_Rtre0071;
        END IF;    

        -- 수납처리 완료후 수납거래번호 Update
        IF 0 <> f_UpdateRtre0070RecvSeq(v_Rcms_Day, CUR_0070.RCMS_SEQ, v_Recv_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '수정 실패!!!';
            RAISE e_Error;
        END IF;
        
        COMMIT; --[20190827_01] 에 의해 추가
            
    END LOOP;    
    
    IF Cur_Rtre0070%ISOPEN THEN
        CLOSE Cur_Rtre0070;
    END IF;    

    -- 송수신 처리 내역 상태 업데이트
    IF 0!= Pkg_Rtre0099.f_UpdateRtre0099FileUpResult (v_File_Tp, v_Rqst_Day , 'Y', v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' 송수신 처리내역(RTRE0099) 업데이트 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 수납처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0070.p_CreateRtre0070TransReceive(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0070.p_CreateRtre0070TransReceive(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0070TransReceive;    


  /*****************************************************************************
  -- 출금이체 내역 미 완료건 Count
  *****************************************************************************/
  FUNCTION f_sRtre0070ProcessCount(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER IS
    
    v_curr_cunt   NUMBER DEFAULT 0;
    
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0070
    WHERE   RCMS_DAY <= v_Rcms_Day
    AND     RQST_STAT = '2'
    AND     ROWNUM = 1;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0070ProcessCount;
  
  /*****************************************************************************
  -- 출금이체 내역 결과 미반영 Count
  *****************************************************************************/
  FUNCTION f_sRtre0070ResultCount(
    v_Rcms_Day       IN RTRE0070.RCMS_DAY%TYPE          /*출금이체일자        */
    ) RETURN NUMBER IS
    
    v_curr_cunt   NUMBER DEFAULT 0;
    
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0070
    WHERE   RCMS_DAY = v_Rcms_Day
    AND     (RQST_STAT IN ('1', '2') OR (RECP_AMT > 0 AND RECV_SEQ IS NULL))
    AND     ROWNUM = 1;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0070ResultCount;
    
END Pkg_Rtre0070;