CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0220 AS
/*******************************************************************************
   NAME    : Pkg_Rtre0220
   PURPOSE : 가상계좌 현황
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-02  ncho             1. Created this package body.
   1.1        2019-04-01  kstka           [20190401_01] 가상계좌결과반영시 만료일자 확인
   1.2        2019-06-04  wjim            [20190604_01] 입금일자 추가
   1.3        2019-06-05  wjim            [20190605_01] 기간만료 계좌정리 보완
                                          [20190605_02] 가상계좌 발급일시 시간기준 변경
   1.4        2019-10-15  kstka           [20191015_01] 가상계좌 취소건 제외
   1.5        2022-10-04  kstka           [20221004_01] 가상계좌 발급 오류건 처리 (계좌번호 TRIM처리)
                                                        가상계좌 잔여 수량이 남아있지 않을시 알림 적용
 *******************************************************************************/
    /*****************************************************************************
     -- 가상계좌 거래내역 집계 Select
     *****************************************************************************/
    PROCEDURE p_sRtre0220_vaccTransTotal(  Ref_Cursor IN OUT SYS_REFCURSOR
                                         , v_Recv_Ym  IN VARCHAR                /* 수납년월 */
                                         , v_Bank_Cd  IN VACS_TOTL.BANK_CD%TYPE /* 은행코드 */
                                        )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
        
        SELECT ORG_CD
             , TR_IL
             , BANK_CD
             , BANK_NM
             , SUM(NORINP_CNT) AS NORINP_CNT
             , SUM(NORINP_AMT) AS NORINP_AMT
             , SUM(CANINP_CNT) AS CANINP_CNT
             , SUM(CANINP_AMT) AS CANINP_AMT
             , SUM(NOROUT_CNT) AS NOROUT_CNT
             , SUM(NOROUT_AMT) AS NOROUT_AMT
             , SUM(CANOUT_CNT) AS CANOUT_CNT
             , SUM(CANOUT_AMT) AS CANOUT_AMT
             , SUM(NORQUE_CNT) AS NORQUE_CNT
             , SUM(UMS_CNT)    AS UMS_CNT
             , SUM(AUTH_CNT)   AS AUTH_CNT
             , SUM(NAME_CNT)   AS NAME_CNT
             , MAX(LST_IL)     AS LST_IL
          FROM (   
            SELECT  A.ORG_CD                                                       /* 기관코드 */
                  --, A.TR_IL                                                        /* 거래일자 */
                  , SUBSTR(A.TR_IL, 0, 6) AS TR_IL
                  , A.BANK_CD                                                      /* 은행코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R001', A.BANK_CD) AS BANK_NM /* 은행명 */
                  , A.NORINP_CNT                                                   /* 정상입금건수 */
                  , A.NORINP_AMT                                                   /* 정상입금금액 */
                  , A.CANINP_CNT                                                   /* 취소입금건수 */
                  , A.CANINP_AMT                                                   /* 취소입금금액 */
                  , A.NOROUT_CNT                                                   /* 정상송금건수 */
                  , A.NOROUT_AMT                                                   /* 정상송금금액 */
                  , A.CANOUT_CNT                                                   /* 취소송금건수 */
                  , A.CANOUT_AMT                                                   /* 취소송금금액 */
                  , A.NORQUE_CNT                                                   /* 정상성명조회건수 */
                  , A.UMS_CNT                                                      /* UMS 사용총건수 */
                  , A.AUTH_CNT                                                     /* 성명인증조회건수 */
                  , A.NAME_CNT                                                     /* 실명인증조회건수 */
                  , A.LST_IL                                                       /* 최종Update날짜 */
            FROM    VACS_TOTL A
            WHERE   SUBSTR(A.TR_IL, 0, 6) = DECODE(v_Recv_Ym, NULL, SUBSTR(A.TR_IL, 0, 6), v_Recv_Ym)
            AND     A.BANK_CD             = DECODE(v_Bank_Cd, NULL, A.BANK_CD,             v_Bank_Cd)
            AND     A.BANK_CD != '000'
            )
            GROUP BY ORG_CD, TR_IL, BANK_CD, BANK_NM
            ORDER BY BANK_CD;                        
                    
--            SELECT  A.ORG_CD                                                       /* 기관코드 */
--                  , A.TR_IL                                                        /* 거래일자 */
--                  , A.BANK_CD                                                      /* 은행코드 */
--                  , PKG_RTCM0051.f_sRtcm0051CodeName('R001', A.BANK_CD) AS BANK_NM /* 은행명 */
--                  , A.NORINP_CNT                                                   /* 정상입금건수 */
--                  , A.NORINP_AMT                                                   /* 정상입금금액 */
--                  , A.CANINP_CNT                                                   /* 취소입금건수 */
--                  , A.CANINP_AMT                                                   /* 취소입금금액 */
--                  , A.NOROUT_CNT                                                   /* 정상송금건수 */
--                  , A.NOROUT_AMT                                                   /* 정상송금금액 */
--                  , A.CANOUT_CNT                                                   /* 취소송금건수 */
--                  , A.CANOUT_AMT                                                   /* 취소송금금액 */
--                  , A.NORQUE_CNT                                                   /* 정상성명조회건수 */
--                  , A.UMS_CNT                                                      /* UMS 사용총건수 */
--                  , A.AUTH_CNT                                                     /* 성명인증조회건수 */
--                  , A.NAME_CNT                                                     /* 실명인증조회건수 */
--                  , A.LST_IL                                                       /* 최종Update날짜 */
--            FROM    VACS_TOTL A
--            WHERE   SUBSTR(A.TR_IL, 0, 6) = DECODE(v_Recv_Ym, NULL, SUBSTR(A.TR_IL, 0, 6), v_Recv_Ym)
--            AND     A.BANK_CD             = DECODE(v_Bank_Cd, NULL, A.BANK_CD,             v_Bank_Cd);
--            --AND     ORG_CD <> '31000788';   -- 12월중순에는 주석삭제할 것
    END p_sRtre0220_vaccTransTotal;

    /*****************************************************************************
     -- 가상계좌 발급내용 조회(쇼핑몰용)
     *****************************************************************************/
    PROCEDURE p_sRtre0220_custVaccInfo(  Ref_Cursor IN OUT SYS_REFCURSOR
                                       , v_safe_key  IN RTSD0100.SAFEKEY%TYPE  /*세이프키*/
                                        )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT DISTINCT B.CUST_NO
                 , B.VA_DATE
                 , B.BANK_CD
                 , B.BANK_NM
                 , B.VACCOUNT
                 , B.RVA_AMT
              FROM RTSD0100 A
                 , RTRE0220 B
             WHERE 1=1
               AND A.SAFEKEY = v_safe_key
               AND A.USE_YN  = 'Y'
               AND A.CUST_NO = B.CUST_NO
               AND B.VA_DATE >= TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
               AND B.RQST_STAT = '3';
    END p_sRtre0220_custVaccInfo ;


    /*****************************************************************************
     -- 가상계좌 현황조회 Select
     *****************************************************************************/
    PROCEDURE p_sRtre0220_vaccMang(  Ref_Cursor IN OUT SYS_REFCURSOR
                                   , v_Bank_Cd  IN VACS_VACT.BANK_CD%TYPE /* 은행코드 */
                                  )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A.BANK_CD                                                            /* 은행코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R001', A.BANK_CD)  AS BANK_NM      /* 은행명 */
                  , COUNT(A.ACCT_NO)                                     AS TOTL_CNT     /* 총건수 */
                  , COUNT(CASE WHEN A.ACCT_ST      = '1'     THEN 1 END) AS ISNC_CNT     /* 발급건수 */
                  , COUNT(CASE WHEN     A.TREND_IL > SYSDATE
                                    AND A.ACCT_ST  = '1'     THEN 1 END) AS ACTV_CNT     /* 활성건수 */
                  , COUNT(CASE WHEN A.TREND_IL     < SYSDATE THEN 1 END) AS PRD_EXPR_CNT /* 기간만료건수 */
                  , COUNT(CASE WHEN A.ACCT_ST      = '0'     THEN 1 END) AS ISNC_AVL_CNT /* 발급가능건수 */
            FROM    VACS_VACT A
            WHERE   A.BANK_CD = DECODE(v_Bank_Cd, NULL, A.BANK_CD, v_Bank_Cd)
            GROUP BY A.BANK_CD;
    END p_sRtre0220_vaccMang;

    /*****************************************************************************
     -- 기간만료계좌정리
     
     REVISIONS
     Ver        Date        Author           Description
     ---------  ----------  ---------------  -------------------------------------
     1.3        2019-06-05  wjim            [20190605_01] 가상계좌 발급내역 상태값 수정 추가
     *****************************************************************************/
    PROCEDURE p_Rtre0220_prdExprArngm(  v_Bank_Cd_Param  IN  VACS_VACT.BANK_CD%TYPE /* 은행코드 */
                                      , v_Success_Code   OUT NUMBER
                                      , v_Return_Message OUT VARCHAR2
                                      , v_ErrorText      OUT VARCHAR2
                                     )
    IS

    CURSOR Cur_Rtre0220
    IS
        SELECT  A.BANK_CD
              , A.ACCT_NO
        FROM    VACS_VACT A
        WHERE   A.TREND_IL < SYSDATE
        AND     A.BANK_CD  = DECODE(v_Bank_Cd_Param, NULL, A.BANK_CD, v_Bank_Cd_Param);

    e_Error   EXCEPTION;
    v_Count   NUMBER;
    v_Bank_Cd VACS_VACT.BANK_CD%TYPE; /* 은행코드 */
    v_Acct_No VACS_VACT.ACCT_NO%TYPE; /* 계좌번호 */

    BEGIN
        OPEN Cur_Rtre0220;
            LOOP
                FETCH Cur_Rtre0220 INTO v_Bank_Cd, v_Acct_No;
                EXIT WHEN Cur_Rtre0220%NOTFOUND;

                IF 0 <> f_UpdateRtre0220_prdExprArngm(  v_Bank_Cd
                                                      , v_Acct_No
                                                      , ''
                                                      , '0'
                                                      , ''
                                                      , ''
                                                      , ''
                                                      , '0'
                                                      , '1'
                                                      , '0'
                                                      , ''
                                                      , ''
                                                      , '000000'
                                                      , '235959'
                                                      , '0'
                                                      , v_ErrorText
                                                     ) THEN v_Return_Message := '가상계좌 정리 Update(RTRE0220) 실패!!(계좌번호-' || v_Acct_No || ')';
                    RAISE e_Error;
                END IF;

                IF v_Success_Code <> 0 THEN
                    CLOSE Cur_Rtre0220;
                    RAISE e_Error;
                END IF;
                
                -- 가상계좌 내역의 상태를 '기간만료'로 변경 [20190605_01] 
                BEGIN
                    UPDATE  RTRE0220
                       SET  RQST_STAT  = '7'        --기간만료
            --             ,  CHG_ID     = 'BATCH' --향후 작업자 파라미터 추가 예정
                         ,  CHG_DT     = SYSDATE
                     WHERE  RQST_STAT IN ('3')      --입금대기
                       AND  VA_DATE   < TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
                       AND  BANK_CD    = v_Bank_Cd
                       AND  VACCOUNT   = TRIM(v_Acct_No);
                EXCEPTION
                    WHEN OTHERS THEN
                        v_Return_Message := '가상계좌 내역정보 기간만료 변경실패!';
                        RAISE e_Error;                           
                END;
        
            END LOOP;

        IF Cur_Rtre0220%ISOPEN THEN
            CLOSE Cur_Rtre0220;
        END IF;
        
        v_Success_code   := 0;
        v_Return_Message := '정상적으로 가상계좌가 정리되었습니다';
        v_ErrorText      := '';
        --COMMIT;

        EXCEPTION
            WHEN e_Error THEN
                ROLLBACK;
                v_Success_code   := -1;
                v_Return_Message := v_Return_Message;
                v_ErrorText      := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_ErrorText);
                Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0220.f_UpdateRtre0220_prdExprArngm(1)', v_ErrorText, v_Return_Message);
            WHEN OTHERS THEN
                ROLLBACK;
                v_Success_code   := -2;
                v_Return_Message := v_Return_Message;
                v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
                Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0220.f_UpdateRtre0220_prdExprArngm(2)', v_ErrorText, v_Return_Message);
    END p_Rtre0220_prdExprArngm;

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
    RETURN NUMBER
    IS

    BEGIN
        UPDATE  VACS_VACT
        SET     CMF_NM     = v_Cmf_Nm
              , ACCT_ST    = v_Acct_St
              , OPEN_IL    = v_Open_Il
              , FST_IL     = v_Fst_Il
              , LST_IL     = v_Lst_Il
              , TR_AMT     = v_Tr_Amt
              , TRAMT_COND = v_Tramt_Cond
              , TRMC_COND  = v_Trmc_Cond
              , TRBEGIN_IL = v_Trbegin_Il
              , TREND_IL   = v_Trend_Il
              , TRBEGIN_SI = v_Trbegin_Si
              , TREND_SI   = v_Trend_Si
              , SEQ_NO     = v_Seq_No
        WHERE   BANK_CD = v_Bank_Cd
        AND     ACCT_NO = v_Acct_No;
        RETURN SQLCODE;

        EXCEPTION
            WHEN OTHERS THEN v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RETURN SQLCODE;
    END f_UpdateRtre0220_prdExprArngm;

/*******************************************************************************
 -- 요청일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0220RvaSeq
    RETURN NUMBER

    IS

    v_Rva_Seq RTRE0220.RVA_SEQ%TYPE DEFAULT 0; /* 요청일련번호 */

    BEGIN

        SELECT NVL2(MAX(RVA_SEQ), TO_NUMBER(MAX(RVA_SEQ)) + 1, 1)
        INTO   v_Rva_Seq
        FROM   RTRE0220
        WHERE  RVA_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD');  
        RETURN v_Rva_Seq;

    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0220RvaSeq;

/*******************************************************************************
 -- 가상계좌번호 추출
 *******************************************************************************/
    FUNCTION f_sRtre0220AcctNo(v_Bank_Cd IN RTRE0220.BANK_CD%TYPE)
    RETURN VARCHAR

    IS

    v_Acct_No VACS_VACT.ACCT_NO%TYPE;

    BEGIN
        SELECT ACCT_NO
        INTO   v_Acct_No
        FROM   (SELECT TRIM(ACCT_NO) AS ACCT_NO
                FROM   VACS_VACT
                WHERE  BANK_CD = v_Bank_Cd
                AND    ACCT_ST = '0'
                ORDER BY DBMS_RANDOM.RANDOM
               )
        WHERE  ROWNUM = 1;
        RETURN v_Acct_No;
    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0220AcctNo;

/*******************************************************************************
 -- 가상계좌(VAN) 발급 Insert
 
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.2        2019-06-04  wjim            [20190604_01] 입금일자 추가
   1.3        2019-06-05  wjim            [20190605_02] 가상계좌 발급일시 시간기준을 12시간제에서 24시간제로 변경
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
                                            , v_Sms_Send_Trgt_No IN  RTRE0220.SMS_SEND_TRGT_NO%TYPE /* SMS발송대상번호 */
                                            , v_Reg_Id           IN  RTRE0220.REG_ID%TYPE           /* 등록자 ID */
                                            , v_Success_Code     OUT NUMBER
                                            , v_Return_Message   OUT VARCHAR2
                                            , v_Error_Text       OUT VARCHAR2
                                           )
    IS
    
    ls_Sms_Msg      RTSD0205.SND_MSG%TYPE;          /*발송 SMS메시지          */

    e_Error EXCEPTION;

    BEGIN           
        
        
        INSERT INTO RTRE0220(  RVA_DAY          /* 요청일자 */
                             , RVA_SEQ          /* 요청일련번호 */
                             , CUST_NO          /* 고객번호 */
                             , CUST_NM          /* 고객명 */
                             , TORD_NO          /* 통합청구계약번호 */
                             , WORK_SCOPE       /* 업무구분 - 연체금 : 01 */
                             , RVA_AMT          /* 요청금액 */
                             , RQST_STAT        /* 상태 - 입금대기 : 3 */
                             , EXPIRE_TERM      /* 유효기간 */
                             , EXPIRE_TIME      /* 유효시간 */
                             , TNO              /* 거래고유번호 */
                             , AMOUNT           /* 결제요청금액 */
                             , BANK_CD          /* 은행코드 */
                             , BANK_NM          /* 은행명 */
                             , VACCOUNT         /* 가상계좌번호 */
                             , VA_DATE          /* 가상계좌 입금마감일시 */
                             , APP_TIME         /* 가상계좌 발급일시 */
                             , APP_REG_ID       /* 가상계좌 발급자 ID */
                             , DPS_NM           /* 입금자명 */
                             , SMS_SEND_TRGT_NO /* SMS발송대상번호 */
                             , REG_ID           /* 등록자 ID */
                             , REG_DT           /* 등록일 */
                             , CHG_ID           /* 변경자 ID */
                             , CHG_DT           /* 변경일 */
                             , TR_DAY           /* 입금일자 */ --[20190604_01]
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Rva_Seq
                             , v_Cust_No
                             , v_Cust_Nm
                             , v_Tord_No
                             , '01'
                             , v_Rva_Amt
                             , '3'
                             , (SELECT TO_DATE(TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD')) - TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) FROM DUAL)
                             , '235959'
                             , ''
                             , v_Rva_Amt
                             , v_Bank_Cd
                             , PKG_RTCM0051.f_sRtcm0051CodeName('R001', v_Bank_Cd)
                             , TRIM(v_Acct_No)
                             , v_Expiry_Acc || '235959'
                             , TO_CHAR(SYSDATE, 'YYYYMMDDhh24miss') --[20190605_02] 변경전 : YYYYMMDDhhmiss
                             , v_Reg_Id
                             , v_Dps_Nm
                             , v_Sms_Send_Trgt_No
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                             , NULL
                            );


    -- SMS발송
    ls_Sms_Msg := '[넥센타이어] 안녕하세요 '||v_Cust_Nm||' 고객님, 넥스트레벨입니다. 신청하신 가상계좌 정보 안내드립니다';
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'은행정보 : '||PKG_RTCM0051.f_sRtcm0051CodeName('R001', v_Bank_Cd);
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'계좌번호 : '||TRIM(v_Acct_No);
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'입금자명 : '||v_Cust_Nm;
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'입금금액 : '||TRIM(TO_CHAR(v_Rva_Amt, '999,999,999,999'))||' 원';
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'계좌 유효기간 : '||REGEXP_REPLACE(SUBSTR(v_Expiry_Acc || '235959', 1, 12), '(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})', '\1년 \2월 \3일 \4시 \5분')||'  까지';

    NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
          'I'               /*예약 전송여부         */
        , '00000000000000'  /*예약 전송시간         */
        , v_Sms_Send_Trgt_No  /*받는 전화번호         */
        , '18550100'        /*보내는 전화번호       */
        , ls_Sms_Msg        /*메시지내용            */
        , 'S032'            /*사용자지정 필드       */
        , v_Tord_No             /*사용자지정 필드       */
        , '2'
        , 'RENTAL00000000000012'
        , v_Reg_Id          /*등록자 ID             */
        , v_Success_Code
        , v_Return_Message
        , v_Error_Text
    );

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_InsertRtre0220VaccIssuedMst(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_InsertRtre0220VaccIssuedMst(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0220VaccIssuedMst;

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
                                           )
    IS
    
    e_Error EXCEPTION;

    BEGIN

        INSERT INTO RTRE0221(  RVA_DAY     /* 요청일자 */
                             , RVA_SEQ     /* 요청일련번호 */
                             , CUST_NO     /* 고객번호 */
                             , TORD_NO     /* 통합청구계약번호 */
                             , ORD_NO      /* 계약번호 */
                             , SCHD_SEQ    /* 청구순번 */
                             , RECP_TP     /* 청구구분 */
                             , DEMD_DT     /* 청구일자 */
                             , ZFBDT       /* 만기계산기준일 */
                             , SALE_AMT    /* 청구금액 */
                             , ARRE_AMT    /* 연체금액 */
                             , REG_ID      /* 등록자 ID */
                             , REG_DT      /* 등록일 */
                             , CHG_ID      /* 변경자 ID */
                             , CHG_DT      /* 변경일 */
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Rva_Seq
                             , v_Cust_No
                             , v_Tord_No
                             , v_Ord_No
                             , v_Schd_Seq
                             , v_Recp_Tp
                             , v_Demd_Dt
                             , v_Zfbdt
                             , v_Sale_Amt
                             , v_Arre_Amt
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_InsertRtre0221VaccIssuedDtl(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_InsertRtre0221VaccIssuedDtl(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0221VaccIssuedDtl;

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
                                        )
    IS

    e_Error EXCEPTION;

    BEGIN
        
        --[20221004_01] kstka 잔여 가상계좌가 존재하지 않을 경우 진행 불가 처리
        IF TRIM(v_Acct_No) = 0 OR TRIM(v_Acct_No) IS NULL OR TRIM(v_Acct_No) = '' THEN
            v_Success_code   := -1;
            v_Return_Message := '잔여 가상계좌가 존재하지 않습니다. 가상계좌 정리가 필요합니다.';
            v_Error_Text := v_Return_Message;
            RAISE e_Error;
        END IF;
        
        --[20221004_01] kstka 가상계좌번호내 TRIM처리
        UPDATE  VACS_VACT
        SET     CMF_NM     = TRIM(v_Cmf_Nm)
              , ACCT_ST    = '1'
              , OPEN_IL    = TO_CHAR(SYSDATE, 'YYYYMMDD')
              , TR_AMT     = v_Tr_Amt
              , TRBEGIN_IL = TO_CHAR(SYSDATE, 'YYYYMMDD')
              , TREND_IL   = v_Trend_Il
        WHERE   BANK_CD = v_Bank_Cd
        AND     TRIM(ACCT_NO) = TRIM(v_Acct_No);

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 수정되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_UpdateVacsVactVaccIssued(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_UpdateVacsVactVaccIssued(2)', v_Error_Text, v_Return_Message);

    END p_UpdateVacsVactVaccIssued;

 /*****************************************************************************
  -- 가상계좌(VAN) 입금 수납처리 결과 저장
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2019-06-04  wjim            [20190604_01] 입금일자 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtre0220RecvResult (
      v_Rva_Day        IN RTRE0220.RVA_DAY%TYPE       /*요청일자              */
    , v_Rva_Seq        IN RTRE0220.RVA_SEQ%TYPE       /*요청일련번호          */
    , v_Rqst_Stat      IN RTRE0220.RQST_STAT%TYPE      /*요청일련번호         */
    , v_Tr_Day         IN RTRE0220.TR_DAY%TYPE         /*입금일자             */ --[20190604_01]  
    , v_Tno            IN RTRE0220.TNO%TYPE            /*수납거래번호         */
    , v_Recv_Seq       IN RTRE0220.RECV_SEQ%TYPE       /*수납거래번호         */
    , v_Dps_Nm         IN RTRE0220.DPS_NM%TYPE         /*수납거래번호         */
    , v_Reg_Id         IN RTRE0220.REG_ID%TYPE         /*등록자 ID            */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTRE0220
       SET  RQST_STAT = v_Rqst_Stat
         ,  TR_DAY    = v_Tr_Day    --[20190604_01]
         ,  TNO       = v_Tno
         ,  RECV_SEQ  = v_Recv_Seq
         ,  DPS_NM    = v_Dps_Nm
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  RVA_DAY   = v_Rva_Day
       AND  RVA_SEQ   = v_Rva_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0220RecvResult;

/*****************************************************************************
  -- 가상계좌(VAN) 수납처리
  -- - Pkg_Rtre0080.p_CreateRtre0080CardReceive 를 참조하여 개발
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2019-06-04  wjim            [20190604_01] 입금일자 추가
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
  ) IS

    ln_Chk_Cnt      NUMBER;
    ln_Exe_Cnt      NUMBER;

    ln_Remain_Amt   RTRE0221.ARRE_AMT%TYPE;
    ln_Tarre_Amt    RTRE0221.ARRE_AMT%TYPE;
    ln_Trecp_Amt    RTRE0221.ARRE_AMT%TYPE;
    ln_Arre_Amt     RTRE0221.ARRE_AMT%TYPE;
    ln_Recp_Amt     VACS_AHST.TR_AMT%TYPE;
    ln_Pend_Amt     VACS_AHST.TR_AMT%TYPE;
    ln_Rear_Amt     VACS_AHST.TR_AMT%TYPE;
    ln_Recv_Seq     RTRE0030.RECV_SEQ%TYPE;

    lr_Re0220       RTRE0220%ROWTYPE;
    lr_ReVacs       VACS_AHST%ROWTYPE;

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

    IF (TRIM(v_Vaccount) IS NULL) OR (TRIM(v_Vaccount) = '') THEN
        v_Return_Message := '기상계좌번호 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Tr_Il) IS NULL) OR (TRIM(v_Tr_Il) = '') THEN
        v_Return_Message := '통보일자 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive1:v_Tord_No:'||v_Tord_No);    
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive1:v_Tord_No:'||v_Tord_No);
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive1:v_Tno:'||v_Tno);  
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive1:v_Vaccount:'||v_Vaccount);  
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive1:v_Tr_Il:'||v_Tr_Il);      
    /*
     * 해당 거래고유번호로 수납처리대상 검증
     */
   -- 가상계좌(VAN)통보내역 존재 여부
      
    SELECT  NVL(COUNT(1), 0)
      INTO  ln_Chk_Cnt
      FROM  VACS_AHST
     WHERE  TR_NO = v_Tno
       AND  TRIM(IACCT_NO) = v_Vaccount
       AND  TR_IL = v_Tr_Il
       AND  INP_ST   = '1';
       
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive1:ln_Chk_Cnt:'||ln_Chk_Cnt);
    IF ln_Chk_Cnt = 0 THEN
        v_Return_Message := '해당 거래고유번호('||v_Tno||')로 저장된 가상계좌(VAN)통보내역(VACS_AHST)이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive2::'||v_Return_Message);    
    -- 가상계좌(VAN)내역 존재 여부
    SELECT  NVL(COUNT(1), 0)
      INTO  ln_Chk_Cnt
      FROM  RTRE0220
     WHERE  VACCOUNT = TRIM(v_Vaccount)
       AND  CUST_NO = v_Cust_No
       AND  TORD_NO = v_Tord_No
       AND  RQST_STAT IN ('3');
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive3::'||v_Return_Message);    
    IF ln_Chk_Cnt = 0 THEN
        v_Return_Message := '해당 거래고유번호('||v_Vaccount||')는 유효한 가상계좌(VAN)내역(RTRE0220)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive3-0::'||v_Return_Message); 
    /*
     * 수납대상리스트 임시테이블 존재여부 확인
     * - 미존재시 임시테이블 생성
     */
    SELECT  COUNT(*)
      INTO  ln_Chk_Cnt
      FROM  USER_TABLES
     WHERE  TABLE_NAME = 'RTTEMP01';
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive3-1::'||v_Return_Message); 
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
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive4::'||v_Return_Message);    
    -- 가상계좌(VAN) 통보내역 조회
    -- - NOTI_ID 를 KCP가 보내주는 경우 사용
    -- - NOTI_ID 가 없는 경우 마지막 통보내역을 사용
    SELECT  *
      INTO  lr_ReVacs
      FROM  VACS_AHST
     WHERE  TR_NO      = v_Tno
       AND  TRIM(IACCT_NO) = v_Vaccount     
--       AND  IACCT_NO = v_Vaccount
       AND  TR_IL    = v_Tr_Il
       AND  INP_ST   = '1';
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive5::'||v_Return_Message);           
/*
    IF TRIM(v_Noti_Id) IS NOT NULL THEN
        SELECT  *
          INTO  lr_ReVacs
          FROM  VACS_AHST
         WHERE  TNO      = v_Tno
           AND  NOTI_ID  = v_Noti_Id
           AND  NOTI_SEQ = (SELECT MAX(NOTI_SEQ) FROM VACS_AHST WHERE TNO = v_Tno);
    ELSE
        SELECT  *
          INTO  lr_ReVacs
          FROM  VACS_AHST
         WHERE  TNO      = v_Tno
           AND  NOTI_SEQ = (SELECT MAX(NOTI_SEQ) FROM VACS_AHST WHERE TNO = v_Tno);
    END IF;
*/
    -- 가상계좌(VAN) 내역 조회
    SELECT  *
      INTO  lr_Re0220
      FROM  RTRE0220
     WHERE  VACCOUNT = TRIM(v_Vaccount)
       AND  CUST_NO = v_Cust_No
       AND  TORD_NO = v_Tord_No
       AND  RQST_STAT IN ('3');
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_CreateRtre0220VaReceive6::'||v_Return_Message);    
    ln_Remain_Amt := 0;
    ln_Exe_Cnt    := 1;

    -- 수납거래번호 채번
    -- - CMS, 카드정기출금 : 계약번호별 수납거래번호 채번
    -- - 가상계좌(VAN) : 입금통보별 수납거래번호 채번
    ln_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();

    /*
     * 가상계좌(VAN) 세부내역 계약별로 LOOP 돌면서 수행
     */
    FOR cur_Re0221 IN (
        SELECT  RVA_DAY
             ,  CUST_NO
             ,  ORD_NO
             ,  SUM(ARRE_AMT) ARRE_AMT
          FROM  RTRE0221
         WHERE  (RVA_DAY, RVA_SEQ) IN (
                    SELECT  RVA_DAY, RVA_SEQ
                      FROM  RTRE0220
                     WHERE  VACCOUNT = TRIM(v_Vaccount)
                       AND  CUST_NO = v_Cust_No
                       AND  TORD_NO = v_Tord_No
                       AND  RQST_STAT IN ('3')
                )
         GROUP  BY RVA_DAY
             ,  CUST_NO
             ,  ORD_NO
    ) LOOP
        -- 수납처리 대상 가상계좌(VAN) 금액(?)
        --ln_Tarre_Amt := ROUND(cur_Re0221.ARRE_AMT * (lr_ReVacs.TOTAL_MNYX / lr_Re0220.AMOUNT), 0);
        ln_Tarre_Amt := ROUND(cur_Re0221.ARRE_AMT * (lr_ReVacs.TR_AMT / lr_Re0220.AMOUNT), 0);
DBMS_OUTPUT.PUT_LINE('CUR_0220.ln_Exe_Cnt::'||ln_Exe_Cnt);    
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
             WHERE  CUST_NO  = cur_Re0221.CUST_NO
               AND  SCD_STAT = 'S'
               AND  ZLSPR    = 'N'
               AND  RC_YN   <> 'Y'
               AND  USE_YN   = 'Y'
               AND  ZFB_DAY <= cur_Re0221.RVA_DAY
               AND  ORD_NO   = cur_Re0221.ORD_NO
             ORDER  BY DEMD_DT, RECP_TP
        ) LOOP
DBMS_OUTPUT.PUT_LINE('CUR_0220.ln_Tarre_Amt::'||ln_Tarre_Amt);  
DBMS_OUTPUT.PUT_LINE('CUR_0220.cur_SD0109.ARRE_AMT::'||cur_SD0109.ARRE_AMT);
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
DBMS_OUTPUT.PUT_LINE('CUR_0220.RTTEMP01::'||cur_SD0109.SCHD_SEQ);
DBMS_OUTPUT.PUT_LINE('CUR_0220.RTTEMP01::'||ln_Arre_Amt);
DBMS_OUTPUT.PUT_LINE('CUR_0220.RTTEMP01::'||ln_Recp_Amt);
                INSERT INTO RTTEMP01 (
                      ORD_NO                    /*계약번호            */
                    , CUST_NO                   /*고객번호            */
                    , SCHD_SEQ                  /*청구순번            */
                    , ARRE_AMT                  /*연체금액(VAT포함)   */
                    , RECP_AMT                  /*수납금액(VAT포함)   */
                ) VALUES (
                      cur_Re0221.ORD_NO
                    , cur_Re0221.CUST_NO
                    , cur_SD0109.SCHD_SEQ
                    , ln_Arre_Amt
                    , ln_Recp_Amt
                );

            END  IF;

        END LOOP;

        -- 선수금액이  남아 있는 경우 청구순번없이 TEMP Table 생성
        ln_Pend_Amt := ln_Tarre_Amt;
DBMS_OUTPUT.PUT_LINE('CUR_0220.ln_Tarre_Amt::'||ln_Tarre_Amt);        

        IF  ln_Tarre_Amt > 0 THEN
DBMS_OUTPUT.PUT_LINE('CUR_0220.ln_Pend_Amt::'||ln_Pend_Amt);  
            INSERT INTO RTTEMP01 (
                  ORD_NO                    /*계약번호            */
                , CUST_NO                   /*고객번호            */
                , SCHD_SEQ                  /*청구순번            */
                , ARRE_AMT                  /*연체금액(VAT포함)   */
                , RECP_AMT                  /*수납금액(VAT포함)   */
            ) VALUES (
                  cur_Re0221.ORD_NO
                , cur_Re0221.CUST_NO
                , NULL
                , 0
                , ln_Pend_Amt
            );

        END IF;

        -- 처리금액 설정
        ln_Recp_Amt := ln_Trecp_Amt;
        ln_Rear_Amt := ln_Trecp_Amt - ln_Pend_Amt;
DBMS_OUTPUT.PUT_LINE('CUR_0220.ln_Recp_Amt::'||ln_Recp_Amt);
DBMS_OUTPUT.PUT_LINE('CUR_0220.ln_Rear_Amt::'||ln_Rear_Amt);  
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
           AND  ORD_NO   = cur_Re0221.ORD_NO
           AND  CUST_NO  = cur_Re0221.CUST_NO
         ORDER  BY NVL(SCHD_SEQ,999); -- 선수금을 마지막에 위치시킴

        -- 수납 처리
        Pkg_Rtre0030.p_InsertRtre0030(
              Ref_Cursor
            , v_Tr_Il
            , cur_Re0221.ORD_NO
            , cur_Re0221.CUST_NO
            , lr_Re0220.APP_REG_ID
            , ln_Recp_Amt
            , 'P5'
            , '01'
            , ln_Recv_Seq
            , ln_Rear_Amt
            , ln_Pend_Amt
            , lr_Re0220.APP_REG_ID
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_InsertRtre0030.::'||v_Success_Code);
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_InsertRtre0030.::'||v_Return_Message);
DBMS_OUTPUT.PUT_LINE('CUR_0220.p_InsertRtre0030.::'||v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납내역 생성처리 실패!!('||cur_Re0221.ORD_NO||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        ln_Exe_Cnt := ln_Exe_Cnt + 1;

    END LOOP;
       
    -- 수납처리 완료후 수납거래번호 Update
    IF 0 <> PKG_RTRE0220.f_UpdateRTRE0220RecvResult(
          lr_Re0220.RVA_DAY
        , lr_Re0220.RVA_SEQ
        , '6'
        , v_Tr_Il              --[20190604_01]
        , v_Tno
        , ln_Recv_Seq
        , lr_ReVacs.IACCT_NM
        , lr_Re0220.APP_REG_ID
        , v_ErrorText
    ) THEN
DBMS_OUTPUT.PUT_LINE('CUR_0220.f_UpdateRTRE0220RecvResult.::'||v_ErrorText);    
        v_Return_Message := '가상계좌 수납결과 수정 실패!!!';
        RAISE e_Error;
    END IF;
           
    -- 수납처리 완료후 수납거래번호 Update
    IF 0 <> PKG_RTRE0160.f_UpdateRtre0160PrePymnt(
          v_Tord_No        
        , ln_Recv_Seq      
        , v_Tno            
        , v_Tr_Il
        , lr_Re0220.RVA_DAY
        , 'P5'
        , lr_Re0220.APP_REG_ID
        , v_ErrorText
    ) THEN
DBMS_OUTPUT.PUT_LINE('CUR_0220.f_UpdateRtre0160PrePymnt.::'||v_ErrorText);    
        v_Return_Message := '선납정보 수납결과 수정 실패!!!';
        RAISE e_Error;
    END IF;    
       
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 가상계좌(VAN) 수납처리되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        DBMS_OUTPUT.PUT_LINE(v_ErrorText || v_Return_Message); 
        Pkg_Utility.p_ErrorFileWrite('PKG_VACS_AHST.p_CreateVACS_AHSTVaReceive(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        DBMS_OUTPUT.PUT_LINE(v_ErrorText || v_Return_Message); 
        Pkg_Utility.p_ErrorFileWrite('PKG_VACS_AHST.p_CreateVACS_AHSTVaReceive(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0220VaReceive;

 /*****************************************************************************
  -- 가상계좌(VAN) 입금대상 집계
  *****************************************************************************/
  PROCEDURE p_CreateRtre0220RecvResult (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

-- 가상계좌 수납처리 대상
    CURSOR  Cur_Rtre0220 IS
        SELECT B.TR_IL
             , A.WORK_SCOPE
             , A.CUST_NO
             , A.TORD_NO
             , TRIM(B.IACCT_NO) AS IACCT_NO
             , (SELECT COUNT(ORD_NO) FROM RTRE0160 WHERE ORD_NO = A.TORD_NO
                    AND PRPT_DAY = A.RVA_DAY) AS PRPT_CNT 
             , B.TR_NO AS TNO
          FROM RTRE0220  A
             , VACS_AHST B
             , VACS_VACT C
         WHERE 1=1
           AND B.TR_IL = TO_CHAR(SYSDATE,'YYYYMMDD')
--           AND B.TR_IL = '20190527'
           AND A.RVA_AMT = B.TR_AMT
           AND A.BANK_CD = B.BANK_CD
           AND A.VACCOUNT = TRIM(B.IACCT_NO)
           AND B.TR_AMT = C.TR_AMT
           AND B.BANK_CD = C.BANK_CD
           AND B.IACCT_NO = C.ACCT_NO
           AND A.RQST_STAT = '3'
           AND C.ACCT_ST = '1'
           AND B.CANINP_SI IS NULL --[20191015_01] 가상계좌 취소건 제외
--           AND A.TORD_NO IN ('D18000175867','B18000174675')
           AND A.VA_DATE >= TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
           ;

    e_Error EXCEPTION;  
    
  BEGIN
DBMS_OUTPUT.PUT_LINE('CUR_0220::' );  
/*
    UPDATE  RTRE0220
       SET  RQST_STAT = v_Rqst_Stat
         ,  TNO       = v_Tno
         ,  RECV_SEQ  = v_Recv_Seq
         ,  DPS_NM    = v_Dps_Nm
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  RVA_DAY   = v_Rva_Day
       AND  RVA_SEQ   = v_Rva_Seq;

    RETURN SQLCODE;
*/


    -- 가상계좌 수납처리
    FOR CUR_0220 IN Cur_Rtre0220 LOOP
        EXIT WHEN Cur_Rtre0220%NOTFOUND;

DBMS_OUTPUT.PUT_LINE('CUR_0220.TORD_NO::' || CUR_0220.TORD_NO);
DBMS_OUTPUT.PUT_LINE('CUR_0220.PRPT_CNT::' || CUR_0220.PRPT_CNT);        
        IF CUR_0220.PRPT_CNT = 1 THEN
        
       
            FOR curs_SD0109 IN(
                                SELECT C.ORD_NO
                                     , C.SCHD_SEQ AS SCHD_SEQ_OLD
                                     , B.SCHD_SEQ AS SCHD_SEQ_NEW
                                     , C.RECP_TP
                                     , C.RECP_NU
                                     , C.SCD_STAT
                                     , B.SALE_AMT
                                     , ROUND(B.SALE_AMT / 1.1, 0)    AS SALE_NAMT1
                                     , B.SALE_AMT - ROUND(B.SALE_AMT / 1.1, 0) AS SALE_VAMT1
                                     , 0 AS RECP_AMT1
                                     , B.ARRE_AMT
                                     , C.DEMD_DT
                                     , 'N'                                       AS ZLSPR      /* 청구보류 */
                                     , ''                                        AS RC_DAY     /* 수납일자 */
                                     , 'N'                                       AS RC_YN      /* 수납여부 */
                                     , C.TAX_DT
                                     , '' AS  TAX_NO
                                     , C.ZFB_DAY
                                     , C.CANCL_DAY
                                     , C.CUST_NO
                                     , C.SALES_GROUP
                                     , C.SALES_OFFICE
                                     , C.AGENCY_CD
                                     , C.BEG_DAY
                                     , C.END_DAY
                                     , 'N'  AS DELAY_YN1
                                     , 0 AS DELAY_RATE
                                     , C.PAY_MTHD
                                     , C.PAY_DD
                                     , 'Y'  AS USE_YN
                                     , A.REG_ID
                                  FROM RTRE0220 A
                                     , RTRE0221 B
                                     , RTSD0109 C
                                 WHERE 1=1
                                   AND A.VACCOUNT = CUR_0220.IACCT_NO
                                   AND A.TORD_NO = B.TORD_NO
                                   AND A.TORD_NO = C.ORD_NO
                                   AND B.ZFBDT   = C.ZFB_DAY
                                   AND B.RECP_TP = '51'
                                   AND C.SCD_STAT = 'S'
                                 )
            LOOP
DBMS_OUTPUT.PUT_LINE('curs_SD0109.SCHD_SEQ_OLD::' || curs_SD0109.SCHD_SEQ_OLD); 
                -- 청구스케쥴 Update /*임시로 주석 처리 유라클*/
                Pkg_Rtsd0109.p_UpdateRtsd0109SalesPrpt (curs_SD0109.ORD_NO, curs_SD0109.SCHD_SEQ_OLD, 'C', curs_SD0109.REG_ID, v_Success_Code,v_Return_Message, v_ErrorText);        
                            
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '청구스케쥴 Update 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;     
DBMS_OUTPUT.PUT_LINE('curs_SD0109.SCHD_SEQ_NEW::' || curs_SD0109.SCHD_SEQ_NEW);                 
                -- 청구스케쥴 Insert
                Pkg_Rtsd0109.p_IUDRtsd0109 ('I', curs_SD0109.ORD_NO, curs_SD0109.SCHD_SEQ_NEW, curs_SD0109.RECP_TP, curs_SD0109.RECP_NU,
                                               curs_SD0109.SCD_STAT, curs_SD0109.SALE_AMT, curs_SD0109.SALE_NAMT1, curs_SD0109.SALE_VAMT1,
                                               0, curs_SD0109.ARRE_AMT, curs_SD0109.DEMD_DT, curs_SD0109.ZLSPR, curs_SD0109.RC_DAY,
                                               curs_SD0109.RC_YN, curs_SD0109.TAX_DT, curs_SD0109.TAX_NO, curs_SD0109.ZFB_DAY,
                                               curs_SD0109.CANCL_DAY, curs_SD0109.CUST_NO, curs_SD0109.SALES_GROUP, curs_SD0109.SALES_OFFICE, 
                                               curs_SD0109.AGENCY_CD, curs_SD0109.BEG_DAY, curs_SD0109.END_DAY, curs_SD0109.DELAY_YN1,
                                               curs_SD0109.DELAY_RATE, curs_SD0109.PAY_MTHD, curs_SD0109.PAY_DD, curs_SD0109.USE_YN,
                                               curs_SD0109.REG_ID, v_Success_Code,v_Return_Message, v_ErrorText);

                IF 0 != v_Success_Code THEN
                    v_Return_Message := '청구스케쥴 Insert 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF; 

            END LOOP;
        END IF;
        -- 기싱계좌(VAN) 수납
--        Pkg_Rtre0220.p_CreateRtre0220VaReceive (CUR_0220.TR_IL, CUR_0220.WORK_SCOPE, CUR_0220.CUST_NO, CUR_0220.TORD_NO,
--                                                 CUR_0220.IACCT_NO,   CUR_0220.TNO, v_Success_Code, v_Return_Message, v_ErrorText);
                                                 
        Pkg_Rtre0220.p_CreateRtre0220VaReceive ( CUR_0220.TNO, CUR_0220.WORK_SCOPE, CUR_0220.IACCT_NO,CUR_0220.CUST_NO, 
                                                 CUR_0220.TORD_NO, CUR_0220.TR_IL , v_Success_Code, v_Return_Message, v_ErrorText);  
DBMS_OUTPUT.PUT_LINE(v_Success_Code);
DBMS_OUTPUT.PUT_LINE(v_Return_Message);
DBMS_OUTPUT.PUT_LINE(v_ErrorText);                                                       
        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납내역 생성처리 실패!!('||CUR_0220.TORD_NO||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0220%ISOPEN THEN
        CLOSE Cur_Rtre0220;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 수납처리되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_CreateRtre0220RecvResult(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_CreateRtre0220RecvResult(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0220RecvResult;

 /*****************************************************************************
  -- 가상계좌(VAN) 입금취소 처리 (세틀뱅크에서 요청된 입금취소요청
  *****************************************************************************/
  PROCEDURE p_CreateRtre0220RecvCnclResult (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    v_Cnc_Rseq  RTRE0030.CNC_RSEQ%TYPE;       /*수납취소거래번호      */
    -- 가상계좌 수납처리 대상
    CURSOR  Cur_Rtre0220 IS
        SELECT A.TR_IL
             , B.RECV_SEQ
             , B.TORD_NO
             , B.CUST_NO
             , B.RVA_DAY
             , B.RVA_SEQ
--             , B.TORD_NO
          FROM VACS_AHST A
             , RTRE0220  B
         WHERE 1=1
           --AND TRIM(A.TR_NO) = B.TNO
           AND A.TR_NO = B.TNO  
           AND A.IACCT_NO = B.VACCOUNT
           AND A.TR_AMT = B.RVA_AMT
           AND A.TR_IL = TO_CHAR(SYSDATE, 'YYYYMMDD')
           AND B.RQST_STAT = '6'
           AND A.INP_ST = '2'
           AND A.CANINP_SI IS NOT NULL;      

    e_Error EXCEPTION;  
    
  BEGIN

    -- 가상계좌 수납처리
    FOR CUR_0220 IN Cur_Rtre0220 LOOP
        EXIT WHEN Cur_Rtre0220%NOTFOUND;

        v_Cnc_Rseq := Pkg_Rtre0030.f_sRtre0030RecvSeq();
        -- 기싱계좌(VAN) 수납취소
        Pkg_Rtre0030.p_InsertRtre0030Cancel (CUR_0220.TR_IL, CUR_0220.RECV_SEQ, CUR_0220.TORD_NO, CUR_0220.CUST_NO, 
                                v_Cnc_Rseq, 'SB_VACS', v_Success_Code, v_Return_Message, v_ErrorText);  
                                                 
        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납내역 생성처리 실패!!('||CUR_0220.TORD_NO||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            --RAISE e_Error;
        END IF;

        -- 가상계좌 취소내역 업데이트
        IF 0 <> Pkg_Rtre0220.f_UpdateRtre0220RecvCncl(
              CUR_0220.RVA_DAY
            , CUR_0220.RVA_SEQ
            , v_Cnc_Rseq
            , 'Y'
            , 'SB_VACS'
            , v_ErrorText
        ) THEN
            v_Return_Message := '가상계좌 취소내역 수정 실패!!!';
            RAISE e_Error;
        END IF;
        
    END LOOP;

    IF Cur_Rtre0220%ISOPEN THEN
        CLOSE Cur_Rtre0220;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 수납처리되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_CreateRtre0220RecvCnclResult(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_CreateRtre0220RecvCnclResult(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0220RecvCnclResult;
  
 /*****************************************************************************
  -- 가상계좌(VAN) 입금 취소처리 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0220RecvCncl (
      v_Rva_Day        IN RTRE0220.RVA_DAY%TYPE       /*요청일자              */
    , v_Rva_Seq        IN RTRE0220.RVA_SEQ%TYPE       /*요청일련번호          */
    , v_Cnc_Rseq       IN RTRE0220.CNC_RSEQ%TYPE      /*요청일련번호          */
    , v_Cnc_Stat       IN RTRE0220.RQST_STAT%TYPE            /*수납거래번호          */
    , v_Reg_Id         IN RTRE0220.REG_ID%TYPE         /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTRE0220
       SET  CNC_RSEQ  = v_Cnc_Rseq
         ,  CNC_STAT  = v_Cnc_Stat
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  RVA_DAY   = v_Rva_Day
       AND  RVA_SEQ   = v_Rva_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0220RecvCncl;  

 /*****************************************************************************
  -- 3연체이상 고객 가상계좌 발급 후 SMS발송
  *****************************************************************************/
  PROCEDURE p_CreateRtre0220LtCstVrtAcnIs (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    ln_Chk_Cnt      NUMBER;
    ln_Exe_Cnt      NUMBER;
    ln_Cd_Cnt       NUMBER;
    
    ls_Sms_Msg      RTSD0205.SND_MSG%TYPE;          /*발송 SMS메시지          */
    v_Dely_Day      RTRE0100.DELY_DAY%TYPE;
    v_Last_Day      RTRE0100.DELY_DAY%TYPE;
    v_Non_Bank_Cd   RTRE0220.BANK_CD%TYPE;
    v_Bank_Cd       RTRE0220.BANK_CD%TYPE;
    v_Bank_Nm       RTRE0220.BANK_NM%TYPE;
    v_Acc_No        RTRE0220.VACCOUNT%TYPE;
    v_Rva_Seq       RTRE0220.RVA_SEQ%TYPE;
    v_Chk_Cd        RTCM0051.CD%TYPE;

    ln_Trecp_Amt    RTRE0221.ARRE_AMT%TYPE;
    ln_Arre_Amt     RTRE0221.ARRE_AMT%TYPE;
    ln_Recp_Amt     VACS_AHST.TR_AMT%TYPE;
    ln_Pend_Amt     VACS_AHST.TR_AMT%TYPE;
    ln_Rear_Amt     VACS_AHST.TR_AMT%TYPE;
    ln_Recv_Seq     RTRE0030.RECV_SEQ%TYPE;

    lr_Re0100       RTRE0100%ROWTYPE;
    lr_Re0101       RTRE0101%ROWTYPE;
    lr_ReVacs       VACS_AHST%ROWTYPE;

    Ref_Cursor      SYS_REFCURSOR;
    e_Error EXCEPTION;
  
-- 가상계좌 수납처리 대상
    CURSOR  Cur_Rtre0220 IS
        SELECT  A.DELY_DAY,                  /*연체기준일자        */
                A.ORD_NO,                    /*계약번호            */
                A.CUST_NO,                   /*고객번호            */
                Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) AS CUST_NM, /*고객명*/
                A.APPR_AMT,                  /*연체금액            */
                A.APPR_SCNT,                 /*연체회차            */
                A.PAY_MTHD,                  /*결제방법            */
                A.ACC_SEQ,                   /*계좌순번            */
                A.ACC_STAT,                  /*계좌신청상태        */
                B.BANK_CD,                   /*은행코드*/
                C.MOB_NO,                    /*핸드폰번호*/
                PKG_RTCM0051.f_sRtcm0051CodeName('R001', BANK_CD) AS BANK_NM,
                Pkg_Rtre0100.f_sRtre0100ErrMsg(A.ORD_NO,A.CUST_NO,A.DELY_DAY,A.PAY_MTHD,A.ACC_STAT) AS ERR_MSG /*에러메시지 */
        FROM    RTRE0100 A,
                RTRE0010 B,
                RTSD0100 C
        WHERE  1=1
        AND    A.DELY_DAY = (SELECT MAX(DELY_DAY) FROM RTRE0100)
        AND    A.APPR_SCNT >= '3'
        AND    A.CUST_NO = C.CUST_NO
        AND    A.ACC_SEQ = B.ACC_SEQ(+);  
    
  BEGIN

    -- 연체집계 MAX일자 구하기
    SELECT MAX(DELY_DAY)
      INTO v_Dely_Day
      FROM RTRE0100
     WHERE 1=1;

    -- 가상계좌 발급 만기일
    SELECT TO_CHAR((SYSDATE +3),'YYYYMMDD') 
      INTO v_Last_Day
      FROM DUAL;

    -- 가장많이 발급된 은행코드 확인
    SELECT BANK_CD
      INTO v_Non_Bank_Cd
      FROM 
          (
           SELECT BANK_CD
                , BANK_CNT
                , RANK() OVER (ORDER BY BANK_CNT DESC ) AS BANK_RANK
             FROM
                (
                SELECT BANK_CD
                     , COUNT(*) BANK_CNT
                  FROM VACS_VACT
                 WHERE 1=1
                   AND ACCT_ST = '1'
                GROUP BY BANK_CD
                )
         )    
    WHERE 1=1
      AND BANK_RANK = 1;


    -- 가상계좌 수납처리
    FOR CUR_0220 IN Cur_Rtre0220 LOOP
        EXIT WHEN Cur_Rtre0220%NOTFOUND;
        
        -- 가상계좌 발급SEQ 채번
        v_Rva_Seq := Pkg_Rtre0220.f_sRtre0220RvaSeq();
        --  CMS고객중에 가상계좌 발급가능한 은행과 일치하면 해당 은행코드 발급
        SELECT  NVL(COUNT(1), 0)
          INTO ln_Cd_Cnt
          FROM RTCM0051 
         WHERE CD_GRP_CD = 'R054' 
           AND USE_YN  = 'Y' 
           AND CD = CUR_0220.BANK_CD;
        
        -- CMS고객중에 가상계좌 발급가능 은행코드가 있으면 바로해당 은행코드로 채번, 없으면 렌덤체번
        IF ln_Cd_Cnt = 1 THEN
            v_Acc_No := Pkg_Rtre0220.f_sRtre0220AcctNo(CUR_0220.BANK_CD);
            v_Bank_Cd := CUR_0220.BANK_CD;
            v_Bank_Nm := CUR_0220.BANK_NM;
        ELSE
            -- 가상계좌번호 발급
            SELECT ACCT_NO, BANK_CD, BANK_NM
            INTO   v_Acc_No, v_Bank_Cd, v_Bank_Nm
            FROM   (
                    SELECT ACCT_NO, BANK_CD, BANK_NM
                    FROM   (SELECT TRIM(ACCT_NO) AS ACCT_NO
                                 , BANK_CD
                                 , PKG_RTCM0051.f_sRtcm0051CodeName('R001', BANK_CD) AS BANK_NM
                            FROM   VACS_VACT
                            WHERE  BANK_CD != v_Non_Bank_Cd
                            AND    ACCT_ST = '0'
                            ORDER BY DBMS_RANDOM.RANDOM
                           )
                    WHERE  ROWNUM = 1
                    )    ;
        END IF;        
        
        
 -- 가상계좌(VAN) 발급 Insert
        Pkg_Rtre0220.p_InsertRtre0220VaccMstTmp(v_Rva_Seq, CUR_0220.CUST_NO, CUR_0220.CUST_NM,CUR_0220.ORD_NO, CUR_0220.APPR_AMT, 
                                                v_Bank_Cd, v_Acc_No, v_Last_Day,  CUR_0220.CUST_NM, CUR_0220.MOB_NO, 'uracle01', 
                                                v_Success_Code, v_Return_Message, v_ErrorText); 

        IF 0 != v_Success_Code THEN
            v_Return_Message := '가상계좌내역 입력실패!!('||CUR_0220.ORD_NO||')-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        FOR cur_RE0101 IN (
            SELECT A.DELY_DAY
                 , A.ORD_NO
                 , A.CUST_NO
                 , A.SCHD_SEQ
                 , A.RECP_TP
                 , A.SALE_AMT
                 , A.ARRE_AMT
                 , B.DEMD_DT
                 , B.ZFB_DAY
              FROM  RTRE0101 A
                   ,RTSD0109 B
             WHERE 1=1
               AND A.ORD_NO   = B.ORD_NO
               AND A.SCHD_SEQ = B.SCHD_SEQ
               AND A.DELY_DAY = v_Dely_Day
               AND A.ORD_NO   = CUR_0220.ORD_NO
        ) LOOP        
        
            Pkg_Rtre0220.p_InsertRtre0221VaccDtlTmp(v_Rva_Seq, cur_RE0101.CUST_NO, cur_RE0101.ORD_NO, cur_RE0101.ORD_NO, cur_RE0101.SCHD_SEQ,
                                                    cur_RE0101.RECP_TP, cur_RE0101.DEMD_DT, cur_RE0101.ZFB_DAY, cur_RE0101.SALE_AMT, 
                                                    cur_RE0101.ARRE_AMT, 'uracle01',v_Success_Code, v_Return_Message, v_ErrorText );
            IF 0 != v_Success_Code THEN
                v_Return_Message := '가상계좌상세내역 입력실패!!('||cur_RE0101.ORD_NO||')-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;                                                       
        
        END LOOP;
        
        
        -- 가상계좌원장 Update
--        Pkg_Rtre0220.p_UpdateVacsVactVaccIssued(v_Bank_Cd, v_Acc_No, CUR_0220.CUST_NM, CUR_0220.APPR_AMT, v_Last_Day,
--                                                v_Success_Code, v_Return_Message, v_ErrorText );
--                                                
--        IF 0 != v_Success_Code THEN
--            v_Return_Message := '가상계좌원장 업데이트실패!!('||CUR_0220.ORD_NO||')-'||v_Return_Message;
--            v_ErrorText := v_ErrorText;
--            RAISE e_Error;
--        END IF;                                 
--        
--        -- SMS발송
--        ls_Sms_Msg := '[넥센타이어] '||CUR_0220.CUST_NM||' 고객님, '||v_Dely_Day||' 기준 '||CUR_0220.ORD_NO||' 계약의 렌탈료가 '||CUR_0220.APPR_SCNT||'회차 연체중에 있습니다.';
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||'연체금액은 '||CUR_0220.APPR_AMT||'원입니다.';
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||'아래의 가상계좌 정보로 렌탈료를 납부해 주시기 바랍니다.';        
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);                
--        ls_Sms_Msg := ls_Sms_Msg||'은행정보 : '||PKG_RTCM0051.f_sRtcm0051CodeName('R001', v_Bank_Cd);
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||'계좌번호 : '||TRIM(v_Acc_No);
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||'입금자명 : '||CUR_0220.CUST_NM;
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||'입금금액 : '||TRIM(TO_CHAR(CUR_0220.APPR_AMT, '999,999,999,999'))||'원';
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||REGEXP_REPLACE(v_Last_Day, '(\d{4})(\d{2})(\d{2})', '\1년 \2월 \3일');
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||'렌탈료 연체시 당사 제공 모든 서비스가 중단되오니, 빠른 시일내 미납요금이 납부될 수 있도록 하여주시기 바랍니다.';
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||'3회차 이상 연체 고객의 경우 신용평가기관에 채무불이행 정보가 제공될 수 있습니다.';
--        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--        ls_Sms_Msg := ls_Sms_Msg||'문의사항이 있으실 경우 넥스트레벨 콜센터(1855-0100)로 문의주세요. 감사합니다.';
--
--        NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
--              'I'               /*예약 전송여부         */
--            , '00000000000000'  /*예약 전송시간         */
--            , CUR_0220.MOB_NO  /*받는 전화번호         */
--            , '18550100'        /*보내는 전화번호       */
--            , ls_Sms_Msg        /*메시지내용            */
--            , 'S032'            /*사용자지정 필드       */
--            , CUR_0220.ORD_NO             /*사용자지정 필드       */
--            , '2'
--            , 'RENTAL00000000000087'
--            , 'uracle01'          /*등록자 ID             */
--            , v_Success_Code
--            , v_Return_Message
--            , v_ErrorText
--        );        
        
    END LOOP;

    IF Cur_Rtre0220%ISOPEN THEN
        CLOSE Cur_Rtre0220;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 수납처리되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_CreateRtre0220RecvCnclResult(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_CreateRtre0220RecvCnclResult(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0220LtCstVrtAcnIs;
  
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
                                            , v_Sms_Send_Trgt_No IN  RTRE0220.SMS_SEND_TRGT_NO%TYPE /* SMS발송대상번호 */
                                            , v_Reg_Id           IN  RTRE0220.REG_ID%TYPE           /* 등록자 ID */
                                            , v_Success_Code     OUT NUMBER
                                            , v_Return_Message   OUT VARCHAR2
                                            , v_Error_Text       OUT VARCHAR2
                                           )
    IS
    
    ls_Sms_Msg      RTSD0205.SND_MSG%TYPE;          /*발송 SMS메시지          */

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0220_TMP(  RVA_DAY          /* 요청일자 */
                             , RVA_SEQ          /* 요청일련번호 */
                             , CUST_NO          /* 고객번호 */
                             , CUST_NM          /* 고객명 */
                             , TORD_NO          /* 통합청구계약번호 */
                             , WORK_SCOPE       /* 업무구분 - 연체금 : 01 */
                             , RVA_AMT          /* 요청금액 */
                             , RQST_STAT        /* 상태 - 입금대기 : 3 */
                             , EXPIRE_TERM      /* 유효기간 */
                             , EXPIRE_TIME      /* 유효시간 */
                             , TNO              /* 거래고유번호 */
                             , AMOUNT           /* 결제요청금액 */
                             , BANK_CD          /* 은행코드 */
                             , BANK_NM          /* 은행명 */
                             , VACCOUNT         /* 가상계좌번호 */
                             , VA_DATE          /* 가상계좌 입금마감일시 */
                             , APP_TIME         /* 가상계좌 발급일시 */
                             , APP_REG_ID       /* 가상계좌 발급자 ID */
                             , DPS_NM           /* 입금자명 */
                             , SMS_SEND_TRGT_NO /* SMS발송대상번호 */
                             , REG_ID           /* 등록자 ID */
                             , REG_DT           /* 등록일 */
                             , CHG_ID           /* 변경자 ID */
                             , CHG_DT           /* 변경일 */
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Rva_Seq
                             , v_Cust_No
                             , v_Cust_Nm
                             , v_Tord_No
                             , '01'
                             , v_Rva_Amt
                             , '3'
                             , (SELECT TO_DATE(TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD')) - TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD')) FROM DUAL)
                             , '235959'
                             , ''
                             , v_Rva_Amt
                             , v_Bank_Cd
                             , PKG_RTCM0051.f_sRtcm0051CodeName('R001', v_Bank_Cd)
                             , TRIM(v_Acct_No)
                             , v_Expiry_Acc || '235959'
                             , TO_CHAR(SYSDATE, 'YYYYMMDDhhmiss')
                             , v_Reg_Id
                             , v_Dps_Nm
                             , v_Sms_Send_Trgt_No
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );


    -- SMS발송
--    ls_Sms_Msg := '[넥센타이어] 안녕하세요 '||v_Cust_Nm||' 고객님, 넥스트레벨입니다. 신청하신 가상계좌 정보 안내드립니다';
--    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--    ls_Sms_Msg := ls_Sms_Msg||'은행정보 : '||PKG_RTCM0051.f_sRtcm0051CodeName('R001', v_Bank_Cd);
--    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--    ls_Sms_Msg := ls_Sms_Msg||'계좌번호 : '||TRIM(v_Acct_No);
--    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--    ls_Sms_Msg := ls_Sms_Msg||'입금자명 : '||v_Cust_Nm;
--    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--    ls_Sms_Msg := ls_Sms_Msg||'입금금액 : '||TRIM(TO_CHAR(v_Rva_Amt, '999,999,999,999'))||' 원';
--    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
--    ls_Sms_Msg := ls_Sms_Msg||'계좌 유효기간 : '||REGEXP_REPLACE(SUBSTR(v_Expiry_Acc || '235959', 1, 12), '(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})', '\1년 \2월 \3일 \4시 \5분')||'  까지';
--
--    NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
--          'I'               /*예약 전송여부         */
--        , '00000000000000'  /*예약 전송시간         */
--        , v_Sms_Send_Trgt_No  /*받는 전화번호         */
--        , '18550100'        /*보내는 전화번호       */
--        , ls_Sms_Msg        /*메시지내용            */
--        , 'S032'            /*사용자지정 필드       */
--        , v_Tord_No             /*사용자지정 필드       */
--        , '2'
--        , 'RENTAL00000000000012'
--        , v_Reg_Id          /*등록자 ID             */
--        , v_Success_Code
--        , v_Return_Message
--        , v_Error_Text
--    );

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_InsertRtre0220VaccIssuedMst(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_InsertRtre0220VaccIssuedMst(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0220VaccMstTmp;

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
                                           )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0221_TMP(  RVA_DAY     /* 요청일자 */
                             , RVA_SEQ     /* 요청일련번호 */
                             , CUST_NO     /* 고객번호 */
                             , TORD_NO     /* 통합청구계약번호 */
                             , ORD_NO      /* 계약번호 */
                             , SCHD_SEQ    /* 청구순번 */
                             , RECP_TP     /* 청구구분 */
                             , DEMD_DT     /* 청구일자 */
                             , ZFBDT       /* 만기계산기준일 */
                             , SALE_AMT    /* 청구금액 */
                             , ARRE_AMT    /* 연체금액 */
                             , REG_ID      /* 등록자 ID */
                             , REG_DT      /* 등록일 */
                             , CHG_ID      /* 변경자 ID */
                             , CHG_DT      /* 변경일 */
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Rva_Seq
                             , v_Cust_No
                             , v_Tord_No
                             , v_Ord_No
                             , v_Schd_Seq
                             , v_Recp_Tp
                             , v_Demd_Dt
                             , v_Zfbdt
                             , v_Sale_Amt
                             , v_Arre_Amt
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_InsertRtre0221VaccIssuedDtl(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0220.p_InsertRtre0221VaccIssuedDtl(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0221VaccDtlTmp;  

    /*******************************************************************************
     -- 가상계좌(VAN) 발급 여부
     *******************************************************************************/
    FUNCTION f_getExistsVacc(   v_Cust_No        IN  RTRE0221.CUST_NO%TYPE  /* 고객번호 */
                                            , v_Tord_No        IN  RTRE0221.TORD_NO%TYPE  /* 통합청구계약번호 */
                                            , v_Ord_No         IN  RTRE0221.ORD_NO%TYPE   /* 계약번호 */
                                            , v_Schd_Seq       IN  RTRE0221.SCHD_SEQ%TYPE /* 청구순번 */
                                           ) RETURN NUMBER IS

    e_Error EXCEPTION;
    
    v_Vacc_Issue NUMBER;
    BEGIN
    
        SELECT COUNT(*) 
        INTO v_Vacc_Issue
        FROM RTRE0220 A, RTRE0221 B
        WHERE A.TORD_NO = B.TORD_NO
        AND A.RVA_SEQ = B.RVA_SEQ
        AND A.TORD_NO = v_Tord_No
        AND A.VA_DATE > TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')
        AND B.SCHD_SEQ = v_Schd_Seq;

        RETURN v_Vacc_Issue;
        
    EXCEPTION
        WHEN OTHERS THEN RETURN 0;

    END f_getExistsVacc;  
    
END Pkg_Rtre0220;
/
