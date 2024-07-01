CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0080 AS
/*******************************************************************************
   NAME      Pkg_Rtre0080
   PURPOSE   카드이체 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
   1.1        2019-08-27  wjim             [20190827_01] 출금결과 반영 시 table lock 현상 해결
*******************************************************************************/

  /*****************************************************************************
  -- 카드이체 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0080Count(
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,         /*카드이체일자        */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE          /*카드이체일련번호    */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0080
    WHERE   RCRD_DAY = v_Rcrd_Day
    AND     RCRD_SEQ = v_Rcrd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0080Count;

  /*****************************************************************************
  -- 카드이체 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0080 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0080.CRD_SEQ%TYPE,        /*카드순번              */
    v_Rcrd_Amt       IN RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Cardcom_Cd     IN RTRE0080.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*PG거래번호            */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RCRD_DAY,                  /*카드이체일자        */
            A.RCRD_SEQ,                  /*카드이체일련번호    */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.CRD_SEQ,                   /*카드순번            */
            A.RCRD_AMT,                  /*카드이체요청금액    */
            A.RQST_STAT,                 /*이체상태            */
            A.CARDCOM_CD,                /*카드사코드          */
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.TNO,                       /*PG거래번호          */
            A.CRERCD,                    /*카드이체 오류코드   */
            A.RECP_AMT,                  /*수납금액            */
            A.RECV_SEQ,                  /*수납거래번호        */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0080 A
    WHERE   A.RCRD_DAY   = DECODE(v_Rcrd_Day   , NULL, A.RCRD_DAY   , v_Rcrd_Day)
    AND     A.RCRD_SEQ   = DECODE(v_Rcrd_Seq   , NULL, A.RCRD_SEQ   , v_Rcrd_Seq)
    AND     A.ORD_NO     = DECODE(v_Ord_No     , NULL, A.ORD_NO     , v_Ord_No)
    AND     A.CUST_NO    = DECODE(v_Cust_No    , NULL, A.CUST_NO    , v_Cust_No)
    AND     A.CRD_SEQ    = DECODE(v_Crd_Seq    , NULL, A.CRD_SEQ    , v_Crd_Seq)
    AND     A.RCRD_AMT   = DECODE(v_Rcrd_Amt   , NULL, A.RCRD_AMT   , v_Rcrd_Amt)
    AND     A.CARDCOM_CD = DECODE(v_Cardcom_Cd , NULL, A.CARDCOM_CD , v_Cardcom_Cd)
    AND     A.BATCH_KEY  = DECODE(v_Batch_Key  , NULL, A.BATCH_KEY  , v_Batch_Key)
    AND     A.RQST_STAT  = DECODE(v_Rqst_Stat  , NULL, A.RQST_STAT  , v_Rqst_Stat)
    AND     A.TNO        = DECODE(v_Tno        , NULL, A.TNO        , v_Tno)
    AND     A.CRERCD     = DECODE(v_Crercd     , NULL, A.CRERCD     , v_Crercd)
    AND     A.RECP_AMT   = DECODE(v_Recp_Amt   , NULL, A.RECP_AMT   , v_Recp_Amt)
    AND     A.RECV_SEQ   = DECODE(v_Recv_Seq   , NULL, A.RECV_SEQ   , v_Recv_Seq)
    AND     A.REG_ID     = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtre0080;

  /*****************************************************************************
  -- 카드이체 내역 Select(계약번호별 내역조회)
  *****************************************************************************/
  PROCEDURE p_sRtre0080CrdTranByOrdNo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day_F     IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자FROM       */
    v_Rcrd_Day_T     IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자TO         */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE       /*이체상태              */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RCRD_DAY,                                                       /*카드이체일자       */
            A.ORD_NO,                                                         /*계약번호           */
            A.CUST_NO,                                                        /*고객번호           */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM,              /*고객명             */
            A.RCRD_AMT,                                                       /*카드이체요청금액   */
            A.RECP_AMT,                                                       /*수납금액           */
            A.CRERCD,                                                         /*카드이체 오류코드  */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R028', A.CRERCD) CRERNM,        /*카드이체 오류코드명*/
            A.CARDCOM_CD,                                                     /*카드사코드         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002', A.CARDCOM_CD) CARDCOM_NM,/*카드사명           */
            (
            SELECT  CARD_NO 
            FROM    RTRE0020 X 
            WHERE   A.CRD_SEQ = X.CRD_SEQ  
            AND     A.CUST_NO = X.CUST_NO) CARD_NO,                             /*카드번호          */
            A.RQST_STAT,                                                       /*카드이체 상태     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R022', A.RQST_STAT) RQST_STAT_NM,/*카드이체 상태명   */
            A.RCRD_SEQ,                                                        /*카드이체 일련번호 */
            A.RECV_SEQ                                                         /*수납거래번호      */
    FROM    RTRE0080 A
    WHERE   A.RCRD_DAY BETWEEN v_Rcrd_Day_F AND v_Rcrd_Day_T
    AND     (v_Ord_No    IS NULL OR A.ORD_NO    = v_Ord_No)      
    AND     (v_Cust_No   IS NULL OR A.CUST_NO   = v_Cust_No)
    AND     (v_Rqst_Stat IS NULL OR A.RQST_STAT = v_Rqst_Stat);   

  END p_sRtre0080CrdTranByOrdNo;    
  
  /*****************************************************************************
  -- 카드이체 내역 Select(카드사별 내역조회)
  *****************************************************************************/
  PROCEDURE p_sRtre0080CrdTranByCard (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day_F     IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자FROM       */
    v_Rcrd_Day_T     IN RTRE0080.RCRD_DAY%TYPE        /*카드이체일자TO         */
    ) IS
  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  B.RCRD_DAY,                                                            /*카드이체일자  */
            B.CARDCOM_CD,                                                          /*카드사코드    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002', B.CARDCOM_CD) AS CARDCOM_NM,  /*카드사명      */
            SUM( B.RCRD_CNT ) AS REQST_CNT,                                        /*청구건수      */
            SUM( B.RCRD_AMT) AS REQST_AMT,                                         /*청구금액      */
            SUM( DECODE( B.RQST_STAT, '5', B.RCRD_CNT, 0 )) AS SRECP_CNT,          /*정상출금건수   */
            SUM( DECODE( B.RQST_STAT, '5', B.RECP_AMT, 0 )) AS SRECP_AMT,          /*정상출금금액   */
            SUM( DECODE( B.RQST_STAT, '4', B.RCRD_CNT, 0 )) AS HSRCP_CNT,          /*부분출금건수   */
            SUM( DECODE( B.RQST_STAT, '4', B.RECP_AMT, 0 )) AS HSRCP_AMT,          /*부분출금금액   */
            SUM( B.RECP_AMT ) AS TRECP_AMT,                                        /*출금금액합계   */
            SUM( DECODE( B.RQST_STAT, '3', B.RCRD_CNT, 0 )) AS ERECP_CNT,          /*오류건수       */
            SUM( B.FEE_AMT ) AS FEE_AMT                                            /*수수료        */
    FROM    (    
            SELECT  A.RCRD_DAY,    
                    A.CARDCOM_CD,    
                    A.RQST_STAT,    
                    COUNT(A.RCRD_DAY) AS RCRD_CNT,    
                    SUM(A.RCRD_AMT) AS RCRD_AMT,    
                    SUM(A.RECP_AMT) AS RECP_AMT,    
                    SUM(CASE WHEN A.RQST_STAT = '3' THEN 0    
                        WHEN A.RQST_STAT = '4' THEN A.RECP_AMT * 2.28    
                        WHEN A.RQST_STAT = '5' THEN A.RECP_AMT * 2.28    
                        ELSE 0 END ) AS FEE_AMT    
            FROM    RTRE0080 A    
            WHERE   A.RCRD_DAY BETWEEN v_Rcrd_Day_F AND v_Rcrd_Day_T
            GROUP   BY A.RCRD_DAY, A.CARDCOM_CD, A.RQST_STAT    
            ) B
    GROUP BY B.RCRD_DAY, B.CARDCOM_CD;
             
  END p_sRtre0080CrdTranByCard;  
  
 /*****************************************************************************
  -- 수금관리 > 카드이체관리 > 카드이체처리 > 카드이체대상조회 Select
  *****************************************************************************/  
  PROCEDURE p_sRtre0080CrdTranTargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,        /*카드이체일자          */
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
    SELECT  A.RCRD_DAY,                                                          /*출금이체일자 */
            A.CARDCOM_CD,                                                        /*카드사코드   */
            PKG_RTCM0051.F_SRTCM0051CODENAME('R002', A.CARDCOM_CD) CARDCOM_NM,   /*카드사명     */
            A.RQST_STAT,                                                         /*이체상태     */
            PKG_RTCM0051.F_SRTCM0051CODENAME('R022', A.RQST_STAT) RQST_STAT_NM,  /*이체상태명   */
            A.RQCNT,                                                             /*신청건수     */
            A.RQAMT,                                                              /*카드이체요청금액*/
            A.FEE_AMT                                                            /*수수료*/                                      
    FROM    ( 
            SELECT  C.RCRD_DAY,            
                    C.CARDCOM_CD,            
                    C.RQST_STAT,             
                    COUNT(*) AS RQCNT,            
                    SUM(C.RCRD_AMT) RQAMT,
                    SUM(CASE WHEN C.RQST_STAT = '3' THEN 0    
                        WHEN C.RQST_STAT = '4' THEN C.RECP_AMT * 0.0228    
                        WHEN C.RQST_STAT = '5' THEN C.RECP_AMT * 0.0228    
                        ELSE 0 END ) AS FEE_AMT                                   
            FROM    RTRE0080 C      
            WHERE   C.RCRD_DAY = v_Rcrd_Day          
            GROUP   BY C.RCRD_DAY, C.CARDCOM_CD, C.RQST_STAT ) A;

    SELECT  COUNT (*)
    INTO    v_cnt1 --조회카운트1
    FROM    RTRE0080 C, 
            RTRE0020 B
    WHERE   C.RCRD_DAY = v_Rcrd_Day 
    AND     B.CRD_SEQ  = C.CRD_SEQ;
           
    SELECT  COUNT (RCRD_DAY)
    INTO    v_cnt2 --조회카운트2
    FROM    RTRE0080
    WHERE   RCRD_DAY = v_Rcrd_Day;

    IF v_cnt1 <>  v_cnt2 THEN
    
        v_Success_code := -1;
        v_Return_Message := '대상건수에 문제가 있습니다. 시스템 담당자에게 확인하세요.';  
                
    ELSIF v_cnt1 =  v_cnt2 THEN
     
        SELECT  COUNT (*)
        INTO    v_cnt3
        FROM    RTRE0099
        WHERE   FILE_TP = 'BC02_INX'
        AND     RQST_DAY = v_Rcrd_Day
        AND     FILE_NM = 'KCP_BATCH_FILE_BC02_INX_V5407_' || v_Rcrd_Day
        AND     DEL_YN = 'N';
                  
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
            WHERE   FILE_TP  = 'BC02_INX'
            AND     RQST_DAY = v_Rcrd_Day
            AND     FILE_NM  = 'KCP_BATCH_FILE_BC02_INX_V5407_'|| v_Rcrd_Day
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
              v_Return_Message := '카드이체 처리 완료 되었습니다.';    
            ELSE
              v_Success_code := -1;
              v_Return_Message := '시스템 담당자에게 확인하세요.';            
            END IF;
            
        END IF;   
        
    END IF;


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_sRtre0080CrdTranTargetList(2)', v_ErrorText, v_Return_Message);

  END p_sRtre0080CrdTranTargetList;   
  
  /*****************************************************************************
  -- 카드이체 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0080 (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0080.CRD_SEQ%TYPE,        /*카드순번              */
    v_Rcrd_Amt       IN RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Cardcom_Cd     IN RTRE0080.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*PG거래번호            */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0080 (
            RCRD_DAY,
            RCRD_SEQ,
            ORD_NO,
            CUST_NO,
            CRD_SEQ,
            RCRD_AMT,
            RQST_STAT,
            CARDCOM_CD,
            BATCH_KEY,
            TNO,
            CRERCD,
            RECP_AMT,
            RECV_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Rcrd_Day,
            v_Rcrd_Seq,
            v_Ord_No,
            v_Cust_No,
            v_Crd_Seq,
            v_Rcrd_Amt,
            v_Rqst_Stat,
            v_Cardcom_Cd,
            v_Batch_Key,
            v_Tno,
            v_Crercd,
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

  END f_InsertRtre0080;

  /*****************************************************************************
  -- 카드이체 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0080 (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0080.CRD_SEQ%TYPE,        /*카드순번              */
    v_Rcrd_Amt       IN RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Cardcom_Cd     IN RTRE0080.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*PG거래번호            */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0080
    SET    ORD_NO     = v_Ord_No,
           CUST_NO    = v_Cust_No,
           CRD_SEQ    = v_Crd_Seq,
           RCRD_AMT   = v_Rcrd_Amt,
           RQST_STAT  = v_Rqst_Stat,
           CARDCOM_CD = v_Cardcom_Cd,
           BATCH_KEY  = v_Batch_Key,
           TNO        = v_Tno,
           CRERCD     = v_Crercd,
           RECP_AMT   = v_Recp_Amt,
           RECV_SEQ   = v_Recv_Seq,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  RCRD_DAY   = v_Rcrd_Day
    AND    RCRD_SEQ   = v_Rcrd_Seq;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0080;

  /*****************************************************************************
  -- 카드이체 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0080 (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0080
    WHERE  RCRD_DAY = v_Rcrd_Day
    AND    RCRD_SEQ = v_Rcrd_Seq;
        
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_IUDRtre0080(1)', '카드이체일자', v_Rcrd_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_IUDRtre0080(1)', '카드이체일련번호', v_Rcrd_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_IUDRtre0080(1)', '등록자 ID', v_Reg_Id);


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0080;

  /*****************************************************************************
  -- 카드이체 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0080 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN OUT RTRE0080.RCRD_SEQ%TYPE,   /*카드이체일련번호      */
    v_Ord_No         IN RTRE0080.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0080.CUST_NO%TYPE,        /*고객번호              */
    v_Crd_Seq        IN RTRE0080.CRD_SEQ%TYPE,        /*카드순번              */
    v_Rcrd_Amt       IN RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Cardcom_Cd     IN RTRE0080.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*PG거래번호            */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 카드이체일자 ,계약번호 ,고객번호 ,카드순번 ,카드이체요청금액 ,이체상태 ,수납금액 ,수납거래번호 ,등록자 ID    
    IF 0 != ISDATE(v_Rcrd_Day) THEN
        v_Return_Message := '카드이체일자('||v_Rcrd_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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
        
    IF TRIM(v_Crd_Seq) IS NULL THEN
        v_Return_Message := '카드순번('||v_Crd_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        
    
    IF TRIM(v_Rcrd_Amt) IS NULL THEN
        v_Return_Message := '카드이체요청금액('||v_Rcrd_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Rqst_Stat) IS NULL THEN
        v_Return_Message := '이체상태('||v_Rqst_Stat||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cardcom_cd) IS NULL THEN
        v_Return_Message := '카드사코드('||v_Cardcom_cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Batch_Key) IS NULL THEN
        v_Return_Message := 'BATCH KEY('||v_Batch_Key||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_sRtre0080Count(v_Rcrd_Day, v_Rcrd_Seq) THEN
            v_Return_Message := '해당건('||v_Rcrd_Day||'-'||v_Rcrd_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtre0080(v_Rcrd_Day, v_Rcrd_Seq, v_Ord_No, v_Cust_No, v_Crd_Seq, 
                                 v_Rcrd_Amt, v_Rqst_Stat, v_Cardcom_Cd, v_Batch_Key, v_Tno,
                                 v_Crercd, v_Recp_Amt, v_Recv_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '카드이체 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0080Count(v_Rcrd_Day, v_Rcrd_Seq) THEN
            v_Return_Message := '해당건('||v_Rcrd_Day||'-'||v_Rcrd_Seq||')으로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;   
        
        v_Rcrd_Seq := f_sRtre0080RcrdSeq(v_Rcrd_Day);
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0080(v_Rcrd_Day, v_Rcrd_Seq, v_Ord_No, v_Cust_No, v_Crd_Seq,
                                     v_Rcrd_Amt, v_Rqst_Stat, v_Cardcom_Cd, v_Batch_Key, v_Tno,
                                     v_Crercd, v_Recp_Amt, v_Recv_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '카드이체 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0080(v_Rcrd_Day, v_Rcrd_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '카드이체 내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_IUDRtre0080(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_IUDRtre0080(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0080;


  /*****************************************************************************
  -- 카드이체 내역 
  *****************************************************************************/
  FUNCTION f_sRtre0080RcrdSeq(
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE          /*카드이체일자        */
    ) RETURN NUMBER IS
    v_Rcrd_Seq  RTRE0080.RCRD_SEQ%TYPE DEFAULT NULL;    /*카드이체일련번호    */
  BEGIN

    SELECT  NVL((SELECT  MAX(RCRD_SEQ)
                 FROM    RTRE0080
                 WHERE   RCRD_DAY = v_Rcrd_Day)+ 1, 1) AS RCRD_SEQ
    INTO    v_Rcrd_Seq
    FROM    DUAL;
    
    RETURN v_Rcrd_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0080RcrdSeq;


  /*****************************************************************************
  -- 카드이체 대상 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre0080CardTrans (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,        /*카드이체일자          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,          /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
 
    ) IS
   
    e_Error EXCEPTION;
    v_Rcrd_Amt  RTRE0080.RCRD_AMT%TYPE DEFAULT NULL;    /*카드이체요청금액    */
    
  BEGIN
  

    INSERT INTO RTRE0080 (
            RCRD_DAY,
            RCRD_SEQ,
            ORD_NO,
            CUST_NO,
            CRD_SEQ,
            RCRD_AMT,
            RQST_STAT,
            CARDCOM_CD,
            BATCH_KEY,
            TNO,
            CRERCD,
            RECP_AMT,
            RECV_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  RCRD_DAY, ROWNUM RCRD_SEQ, ORD_NO, CUST_NO, CRD_SEQ,
            RCRD_AMT, '1' RQST_STAT, CARDCOM_CD, BATCH_KEY,
            NULL TNO,  NULL CRERCD, 
            0 RECP_AMT, NULL RECV_SEQ,
            v_Reg_Id REG_ID, SYSDATE REG_DT,  
            v_Reg_Id CHG_ID, SYSDATE CHG_DT
    FROM    (
            SELECT  A.RCRD_DAY, A.TORD_NO ORD_NO, A.CUST_NO, A.CRD_SEQ, 
                    A.CARDCOM_CD, A.BATCH_KEY, SUM(A.ARRE_AMT) RCRD_AMT
            FROM    RTRE0081 A
            WHERE   A.RCRD_DAY = v_Rcrd_Day
            GROUP   BY A.RCRD_DAY, A.TORD_NO, A.CUST_NO, A.CRD_SEQ, A.CARDCOM_CD, A.BATCH_KEY
            ORDER   BY A.RCRD_DAY, A.TORD_NO, A.CUST_NO, A.CRD_SEQ, A.CARDCOM_CD, A.BATCH_KEY
            );

    SELECT  NVL(SUM(RCRD_AMT),0)
    INTO    v_Rcrd_Amt
    FROM    RTRE0080
    WHERE   RCRD_DAY = v_Rcrd_Day;
    
    IF v_Rcrd_Amt = 0 THEN
        v_Success_code := -2;
        v_Return_Message := '카드이체 대상금액(RTRE0080)이 없습니다.';
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_CreateRtre0080CardTrans(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_CreateRtre0080CardTrans(2)', v_ErrorText, v_Return_Message);
    
  END p_CreateRtre0080CardTrans;


  /*****************************************************************************
  -- 카드이체 - 수납처리
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2019-08-27  wjim             [20190827_01] 출금결과 반영 시 table lock 현상 해결
                                           - 수납처리 대상건이 많은 경우 table lock 현상 발생하여 서비스 불가 현상 발생 (2019-08-26 기준 49,551 건) 
                                           - 건별 commit 처리  
  *****************************************************************************/
  PROCEDURE p_CreateRtre0080CardReceive (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS

    CURSOR  Cur_Rtre0080 IS
    SELECT  A.RCRD_SEQ, A.ORD_NO, A.CUST_NO, A.RCRD_AMT, A.RQST_STAT, A.RECP_AMT
    FROM    RTRE0080 A
    WHERE   A.RCRD_DAY = v_Rcrd_Day
    AND     A.RECP_AMT > 0
    AND     A.RECV_SEQ IS NULL --[20190827_01] 건별 commit 으로 변경됨에 따라 추가 (재실행 시 이중수납 방지)
    ORDER BY A.ORD_NO;

    CURSOR  Cur_Rtre0081 (v_Tord_No VARCHAR) IS
    SELECT  A.ORD_NO, A.CUST_NO, SUM(A.ARRE_AMT) ARRE_AMT
    FROM    RTRE0081 A
    WHERE   A.RCRD_DAY = v_Rcrd_Day
    AND     A.TORD_NO  = v_Tord_No
    GROUP BY A.ORD_NO, A.CUST_NO
    ORDER BY A.ORD_NO;

    CURSOR  Cur_Rtsd0109 (v_Ord_No VARCHAR, v_Cust_No VARCHAR) IS
    SELECT  A.SCHD_SEQ, A.ARRE_AMT
    FROM    RTSD0109 A
    WHERE   A.CUST_NO  = v_Cust_No
    AND     A.SCD_STAT = 'S'
    AND     A.ZLSPR    = 'N'
    AND     A.RC_YN   <> 'Y'
    AND     A.USE_YN   = 'Y'
    AND     A.ZFB_DAY <= v_Rcrd_Day
    AND     A.ORD_NO   = v_Ord_No
    ORDER BY A.DEMD_DT, A.RECP_TP;


    e_Error EXCEPTION;
    v_Count     NUMBER;
    v_Table_Count   NUMBER;
    Ref_Cursor  SYS_REFCURSOR;
    v_Recv_Seq  RTRE0030.RECV_SEQ%TYPE;
    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL;   /*송수신 파일구분       */
    v_File_Nm   RTRE0099.FILE_NM%TYPE DEFAULT NULL;   /*송수신 파일명         */
    v_Rqst_Day  RTRE0099.RQST_DAY%TYPE DEFAULT NULL;  /*출금일자              */
    v_Recp_Amt  RTRE0080.RECP_AMT%TYPE;
    v_Rear_Amt  RTRE0080.RECP_AMT%TYPE;
    v_Pend_Amt  RTRE0080.RECP_AMT%TYPE;
    v_Arre_Amt  RTRE0081.ARRE_AMT%TYPE;
    v_Tarre_Amt RTRE0081.ARRE_AMT%TYPE;
    v_Trecp_Amt RTRE0081.ARRE_AMT%TYPE;
    v_Remain_Amt RTRE0081.ARRE_AMT%TYPE;
    v_Tord_No   RTRE0081.TORD_NO%TYPE;


  BEGIN

    -- 필수값: 카드이체일자 ,등록자 ID
    IF 0 != ISDATE(v_Rcrd_Day) THEN
        v_Return_Message := '카드이체일자('||v_Rcrd_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 카드이체  반영 결과내역 확인    
    SELECT  NVL(COUNT(1),0)
    INTO    v_Count
    FROM    RTRE0080
    WHERE   RCRD_DAY = v_Rcrd_Day
    AND     RQST_STAT IN ('4', '5')
    AND     RECV_SEQ IS NULL;
    
    IF v_Count = 0 THEN
        v_Return_Message := '해당건('||v_Rcrd_Day||')은 카드이체내역(RTRE0080)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    --카드이체고객번호와 청구스케쥴고객번호가 다른건 확인
    --- [20190827_01] 주석처리
    --- 이 쿼리에서 20분 이상 소요되는 경우 발생
    --- 명의변경 프로세스가 없어 특별히 필요없다고 판단되어 주석 처리  
    v_Count := 0;
    
--    SELECT  NVL(COUNT(B.CUST_NO), 0)
--    INTO    v_Count
--    FROM    RTRE0080 A, RTRE0081 B, RTSD0109 C
--    WHERE   A.RCRD_DAY = v_Rcrd_Day
--    AND     A.RQST_STAT IN ('4', '5')
--    AND     A.RECV_SEQ IS NULL
--    AND     A.RCRD_DAY = B.RCRD_DAY
--    AND     A.ORD_NO   = B.TORD_NO
--    AND     B.ORD_NO   = C.ORD_NO
--    AND     B.SCHD_SEQ = C.SCHD_SEQ
--    AND     B.CUST_NO <> C.CUST_NO 
--    AND     ROWNUM = 1;
--    
--    IF v_Count <> 0 THEN
--        v_Return_Message := '해당 카드이체자료는('||v_Rcrd_Day||')은 고객번호가 출금과 스케쥴읙  고객이 같지 않아 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
    
    
    -- 카드이체 송수신내역 확인
    v_File_Tp  := 'BC02_OUT';
    v_File_Nm  := 'KCP_BACH_FILE_'||v_File_Tp||'_V5407_'||TO_CHAR( TO_DATE( SUBSTR(v_Rcrd_Day, 1, 8)) + 1, 'YYYYMMDD' );
    v_Rqst_Day := v_Rcrd_Day;

    IF 0 = Pkg_Rtre0099.f_sRtre0099CountCheck(v_File_TP, v_Rqst_Day, v_File_Nm) THEN
        v_Return_Message := '해당건('||v_File_Tp||'-'||v_Rqst_Day||')은 송수신내역(RTRE0099)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


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
            
     

    -- 카드이체 처리건 대상
    FOR CUR_0080 IN Cur_Rtre0080 LOOP
        EXIT WHEN Cur_Rtre0080%NOTFOUND;  

        v_Remain_Amt := 0;
        
        IF CUR_0080.RQST_STAT = '4' THEN     -- 부분출금
        
            -- 단수발생 확인
            SELECT  SUM ( ROUND(ARRE_AMT * ( CUR_0080.RECP_AMT / CUR_0080.RCRD_AMT ), 0) )
            INTO    v_Trecp_Amt
            FROM  (
                    SELECT  A.ORD_NO, SUM(ARRE_AMT) ARRE_AMT
                    FROM    RTRE0081 A
                    WHERE   A.RCRD_DAY = v_Rcrd_Day
                    AND     A.TORD_NO  = CUR_0080.ORD_NO
                    GROUP BY A.ORD_NO
                  )
            ;

            IF CUR_0080.RECP_AMT <> v_Trecp_Amt THEN
                v_Remain_Amt := v_Recp_Amt - CUR_0080.RECP_AMT; 
            ELSE
                v_Remain_Amt := 0;
            END IF;
            
        END IF;
        
        v_Count := 1;
        v_Tord_NO := CUR_0080.ORD_NO;
        
        FOR CUR_0081 IN Cur_Rtre0081(v_Tord_No) LOOP
            EXIT WHEN Cur_Rtre0081%NOTFOUND;  
            
            -- 수납처리 대상 카드이체 금액
            v_Tarre_Amt := ROUND(CUR_0081.ARRE_AMT * ( CUR_0080.RECP_AMT / CUR_0080.RCRD_AMT ), 0);
            IF v_Count = 1 THEN
                v_Tarre_Amt := v_Tarre_Amt + v_Remain_Amt;
            END IF;
            
            v_Trecp_Amt := v_Tarre_Amt;     -- 수납처리 대상 전체금액
            
            -- 미수자료에대해 수납처리함
            FOR CUR_0109 IN Cur_Rtsd0109(CUR_0081.ORD_NO, CUR_0081.CUST_NO) LOOP
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
                    VALUES ( CUR_0081.ORD_NO, CUR_0081.CUST_NO, CUR_0109.SCHD_SEQ,
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
                VALUES ( CUR_0081.ORD_NO, CUR_0081.CUST_NO, NULL,
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
            AND     A.ORD_NO  = CUR_0081.ORD_NO
            AND     A.CUST_NO = CUR_0081.CUST_NO
            ORDER   BY NVL(A.SCHD_SEQ,999); -- 선수금을 무조건 마지막에 위치함.

                    
            -- 수납거래번호 채번
            v_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();
            
            Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, v_Rcrd_Day, CUR_0081.ORD_NO, CUR_0081.CUST_NO, 
                                           v_Reg_Id,   v_Recp_Amt, 'C2', '01', v_Recv_Seq, 
                                           v_Rear_Amt, v_Pend_Amt, v_Reg_Id, v_Success_Code, 
                                           v_Return_Message, v_ErrorText);
            IF 0 != v_Success_Code THEN
                v_Return_Message := '수납내역 생성처리 실패!!('||CUR_0080.ORD_NO||')-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;  
      
             
            v_Count := v_Count + 1;
            
        END LOOP;    

        IF Cur_Rtre0081%ISOPEN THEN
            CLOSE Cur_Rtre0081;
        END IF;    

        -- 수납처리 완료후 수납거래번호 Update
        IF 0 <> f_UpdateRtre0080RecvSeq(v_Rcrd_Day, CUR_0080.RCRD_SEQ, v_Recv_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '수정 실패!!!';
            RAISE e_Error;
        END IF;
            
        COMMIT; --[20190827_01] 에 의해 추가
        
    END LOOP;    
    
    IF Cur_Rtre0080%ISOPEN THEN
        CLOSE Cur_Rtre0080;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_CreateRtre0080CardReceive(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_CreateRtre0080CardReceive(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0080CardReceive;

  
  /*****************************************************************************
  -- 카드이체 내역 Update-상태 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0080RqstStat (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0080
    SET    RQST_STAT = v_Rqst_Stat,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  RCRD_DAY  = v_Rcrd_Day;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0080RqstStat;


  /*****************************************************************************
  -- 수금관리 > 카드이체처리 > 카드이체대상조회 Select(Batch_Key, Rcrd_Amt)
  *****************************************************************************/
  PROCEDURE p_sRtre0080BatchAndAmt (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,        /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,        /*카드이체일련번호      */
    v_Rcrd_Amt       OUT RTRE0080.RCRD_AMT%TYPE,       /*카드이체요청금액      */
    v_Batch_Key      OUT RTRE0080.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    
    ) IS  
    
    e_Error EXCEPTION;

  BEGIN

    SELECT  BATCH_KEY, NVL(RCRD_AMT,0)
    INTO    v_Batch_Key, v_Rcrd_Amt
    FROM    RTRE0080
    WHERE   RCRD_DAY = v_Rcrd_Day
    AND     RCRD_SEQ = v_Rcrd_Seq;
    
    IF v_Rcrd_Amt = 0 THEN
        v_Success_code := -2;
        v_Return_Message := '카드이체 대상금액(RTRE0080)이 없습니다.';
        RAISE e_Error;
    END IF;
              

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_sRtre0080BatchAndAmt(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0080.p_sRtre0080BatchAndAmt(2)', v_ErrorText, v_Return_Message);
    
  END p_sRtre0080BatchAndAmt;


  /*****************************************************************************
  -- 카드이체 내역 Update-처리결과 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0080RqstResult (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Rqst_Stat      IN RTRE0080.RQST_STAT%TYPE,      /*이체상태              */
    v_Tno            IN RTRE0080.TNO%TYPE,            /*KCP 거래번호          */
    v_Crercd         IN RTRE0080.CRERCD%TYPE,         /*카드이체 오류코드     */
    v_Recp_Amt       IN RTRE0080.RECP_AMT%TYPE,       /*수납금액              */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2

    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0080
    SET    RQST_STAT = v_Rqst_Stat,
           CRERCD    = v_Crercd,
           TNO       = v_Tno,
           RECP_AMT  = v_Recp_Amt,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  RCRD_DAY  = v_Rcrd_Day
    AND    RCRD_SEQ  = v_Rcrd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0080RqstResult;


  /*****************************************************************************
  -- 카드이체 내역 Update - 수납처리후 수납거래번호 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0080RecvSeq (
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0080.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Recv_Seq       IN RTRE0080.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Reg_Id         IN RTRE0080.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTRE0080
    SET    RECV_SEQ = v_Recv_Seq,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RCRD_DAY = v_Rcrd_Day
    AND    RCRD_SEQ = v_Rcrd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0080RecvSeq;
      
  
  /*****************************************************************************
  -- 카드이체 내역 미 완료건 Count
  *****************************************************************************/
  FUNCTION f_sRtre0080ProcessCount(
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE          /*카드이체일자        */
    ) RETURN NUMBER IS
    
    v_curr_cunt   NUMBER DEFAULT 0;
    
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0080
    WHERE   RCRD_DAY <= v_Rcrd_Day
    AND     RQST_STAT = '2'
    AND     ROWNUM = 1;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0080ProcessCount;

  /*****************************************************************************
  -- 카드이체 결과 반여 미 완료건 Count
  *****************************************************************************/
  FUNCTION f_sRtre0080ResultCount(
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE          /*카드이체일자        */
    ) RETURN NUMBER IS
    
    v_curr_cunt   NUMBER DEFAULT 0;
    
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0080
    WHERE   RCRD_DAY = v_Rcrd_Day
    AND     RECP_AMT > 0
    AND     RECV_SEQ IS NULL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0080ResultCount;
  
END Pkg_Rtre0080;
/