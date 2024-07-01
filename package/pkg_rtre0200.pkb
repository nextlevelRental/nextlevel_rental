CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0200 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0200
    PURPOSE : 카드즉시출금 내역조회
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-11-06  ncho             1. Created this package body.
 *******************************************************************************/

/*******************************************************************************
 -- 카드즉시출금 내역조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0200_crdImmWthdrList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                          , v_Rcrd_F_Day IN RTRE0200.RCRD_DAY%TYPE /* 수납일자 StartDay */
                                          , v_Rcrd_T_Day IN RTRE0200.RCRD_DAY%TYPE /* 수납일자 EndDay */
                                          , v_Ord_No     IN RTRE0200.TORD_NO%TYPE  /* 통합청구계약번호 */
                                          , v_Cust_No    IN RTRE0200.CUST_NO%TYPE  /* 고객번호 */
                                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A.RCRD_DAY                                                        /* 카드수납일자 */
                  , A.RCRD_SEQ                                                        /* 수납일련번호 */
                  , A.TORD_NO                                                         /* 통합청구계약번호 */
                  , A.CUST_NO                                                         /* 고객번호 */
                  , Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO)         AS CUST_NM    /* 고객명 */
                  , A.RECP_TP                                                         /* 청구구분코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R007', A.RECP_TP) AS RECP_TP_NM /* 청구구분명 */
                  , A.TNO                                                             /* 거래번호 */
                  , B.CRD_CD                                                          /* 카드사코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R002', B.CRD_CD)  AS CRD_NM     /* 카드사명 */
                  , A.RECP_AMT                                                        /* 수납금액 */
                  , A.CNC_STAT                                                        /* 수납취소여부 */
                  , A.PRT_CNC_RMNN_AMT                                                /* 수납취소 후 남은금액 */
                  , A.RECV_SEQ                                                        /* 수납거래번호 */
                  , A.CNC_RSEQ                                                        /* 수납취소거래번호 */
                  , A.REFUND_YN                                                       /* 환불여부  */
            FROM    RTRE0200 A /* 카드즉시출금 수납내역 */
                  , RTRE0202 B /* 카드즉시출금 카드정보 */
            WHERE   A.TNO            = B.TNO
            AND     A.RCRD_DAY BETWEEN v_Rcrd_F_Day
                               AND     v_Rcrd_T_Day
            AND     A.TORD_NO        = DECODE(v_Ord_No,  NULL, A.TORD_NO, v_Ord_No)
            AND     A.CUST_NO        = DECODE(v_Cust_No, NULL, A.CUST_NO, v_Cust_No);
    END p_sRtre0200_crdImmWthdrList;

/*******************************************************************************
 -- 수납내역 상세조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0200_crdImmWthdrDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                             , v_Recv_Seq IN RTRE0030.RECV_SEQ%TYPE /* 수납거래번호 */
                                            )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A.ORD_NO                                                          /* 계약번호 */
                  , A.SCHD_SEQ                                                        /* 청구회차 */
                  , A.RECP_FG                                                         /* 수납유형코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R020', A.RECP_FG) AS RECP_FG_NM /* 수납유형명 */
                  , A.RECP_AMT                                                        /* 수납금액 */
                  , A.CNC_STAT                                                        /* 수납취소여부 */
            FROM    RTRE0030 A /* 카드즉시출금 상세수납내역 */
            WHERE   A.RECV_SEQ = v_Recv_Seq
            ORDER BY  A.ORD_NO
                    , A.SCHD_SEQ;
    END p_sRtre0200_crdImmWthdrDtlList;

/*******************************************************************************
 -- 카드수납일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0200RcrdSeq

    RETURN NUMBER

    IS

    v_Rcrd_Seq RTRE0200.RCRD_SEQ%TYPE DEFAULT 0; /* 카드수납일련번호 */

    BEGIN
    
        SELECT  NVL2(MAX(RCRD_SEQ), TO_NUMBER(MAX(RCRD_SEQ))+1, 1)
          INTO  v_Rcrd_Seq
          FROM  RTRE0200
         WHERE  RCRD_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD');     
        RETURN v_Rcrd_Seq;

    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0200RcrdSeq;

/*******************************************************************************
 -- 카드즉시출금결제 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0200CrdImmWthdrMst(  v_Rcrd_Seq       IN  RTRE0200.RCRD_SEQ%TYPE /* 카드수납일련번호 */
                                             , v_Tord_No        IN  RTRE0200.TORD_NO%TYPE  /* 통합청구계약번호 */
                                             , v_Cust_No        IN  RTRE0200.CUST_NO%TYPE  /* 고객번호 */
                                             , v_Recp_Amt       IN  RTRE0200.RECP_AMT%TYPE /* 수납금액 */
                                             , v_Recp_Tp        IN  RTRE0200.RECP_TP%TYPE  /* 청구구분 */
                                             , v_Recp_Pay       IN  RTRE0200.RECP_PAY%TYPE /* 수납방법 */
                                             , v_Recp_Fg        IN  RTRE0200.RECP_FG%TYPE  /* 수납유형 */
                                             , v_Tno            IN  RTRE0200.TNO%TYPE      /* 거래번호 */
                                             , v_App_No         IN  RTRE0200.APP_NO%TYPE   /* 승인번호 */
                                             , v_Recv_Seq       IN  RTRE0200.RECV_SEQ%TYPE /* 카드수납거래번호 */
                                             , v_Cnc_Stat       IN  RTRE0200.CNC_STAT%TYPE /* 수납취소여부 */
                                             , v_Reg_Id         IN  RTRE0200.REG_ID%TYPE   /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0200(  RCRD_DAY
                             , RCRD_SEQ
                             , TORD_NO
                             , CUST_NO
                             , RECP_AMT
                             , RECP_TP
                             , RECP_PAY
                             , RECP_FG
                             , TNO
                             , APP_NO
                             , RECV_SEQ
                             , CNC_RSEQ
                             , CNC_TNO
                             , CNC_STAT
                             , PRT_CNC_RMNN_AMT
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Rcrd_Seq
                             , v_Tord_No
                             , v_Cust_No
                             , v_Recp_Amt
                             , v_Recp_Tp
                             , v_Recp_Pay
                             , v_Recp_Fg
                             , v_Tno
                             , v_App_No
                             , v_Recv_Seq
                             , ''
                             , ''
                             , v_Cnc_Stat
                             , v_Recp_Amt
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );
    Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_01', v_Tord_No, v_Tno);                            
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0200CrdImmWthdrMst(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0200CrdImmWthdrMst(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0200CrdImmWthdrMst;

/*******************************************************************************
 -- 카드즉시출금결제 상세 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0201CrdImmWthdrDtl(  v_Rcrd_Seq       IN  RTRE0201.RCRD_SEQ%TYPE /* 카드수납일련번호 */
                                             , v_Cust_No        IN  RTRE0201.CUST_NO%TYPE  /* 고객번호 */
                                             , v_Tord_No        IN  RTRE0201.TORD_NO%TYPE  /* 통합청구계약번호 */
                                             , v_Ord_No         IN  RTRE0201.ORD_NO%TYPE   /* 계약번호 */
                                             , v_Schd_Seq       IN  RTRE0201.SCHD_SEQ%TYPE /* 청구순번 */
                                             , v_Recp_Tp        IN  RTRE0201.RECP_TP%TYPE  /* 청구구분 */
                                             , v_Zfbdt          IN  RTRE0201.ZFBDT%TYPE    /* 청구일자 */
                                             , v_Sale_Amt       IN  RTRE0201.SALE_AMT%TYPE /* 청구금액 */
                                             , v_Arre_Amt       IN  RTRE0201.ARRE_AMT%TYPE /* 미납금액 */
                                             , v_Reg_Id         IN  RTRE0201.REG_ID%TYPE   /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0201(  RCRD_DAY
                             , RCRD_SEQ
                             , CUST_NO
                             , TORD_NO
                             , ORD_NO
                             , SCHD_SEQ
                             , RECP_TP
                             , ZFBDT
                             , SALE_AMT
                             , ARRE_AMT
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Rcrd_Seq
                             , v_Cust_No
                             , v_Tord_No
                             , v_Ord_No
                             , v_Schd_Seq
                             , v_Recp_Tp
                             , v_Zfbdt
                             , v_Sale_Amt
                             , v_Arre_Amt
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );
    Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_02', v_Tord_No, v_Schd_Seq);                             
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0201CrdImmWthdrDtl(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0201CrdImmWthdrDtl(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0201CrdImmWthdrDtl;

/*******************************************************************************
 -- 카드즉시출금결제 카드정보 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0202CrdImmWthdrCrd(  v_Tno            IN  RTRE0202.TNO%TYPE        /* 거래번호 */
                                             , v_Sec_Crd_No     IN  RTRE0202.CRD_NO%TYPE /* 카드번호 */
                                             , v_Crd_Cd         IN  RTRE0202.CRD_CD%TYPE     /* 카드사코드 */
                                             , v_Reg_Id         IN  RTRE0202.REG_ID%TYPE     /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0202(  TNO
                             , CRD_NO
                             , CRD_CD
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  v_Tno
                             , v_Sec_Crd_No
                             , v_Crd_Cd
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );
                            
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_03', v_Tno, v_Sec_Crd_No);                            
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

DBMS_OUTPUT.PUT_LINE('p_InsertRtre0202CrdImmWthdrCrd v_Return_Message::'||v_Return_Message); 
    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0202CrdImmWthdrCrd(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0202CrdImmWthdrCrd(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0202CrdImmWthdrCrd;

/*****************************************************************************
 -- 카드즉시 입금 수납처리 결과 저장
 *****************************************************************************/
    FUNCTION f_UpdateRtre0200RecvResult(  v_Rcrd_Day  IN  RTRE0200.RCRD_DAY%TYPE /* 요청일자 */
                                        , v_Rcrd_Seq  IN  RTRE0200.RCRD_SEQ%TYPE /* 요청일련번호 */
                                        , v_Recv_Seq  IN  RTRE0200.RECV_SEQ%TYPE /* 수납거래번호 */
                                        , v_Reg_Id    IN  RTRE0200.REG_ID%TYPE   /* 등록자 ID */
                                        , v_ErrorText OUT VARCHAR2
                                       )
    RETURN NUMBER

    IS

    BEGIN
        UPDATE  RTRE0200
        SET     RECV_SEQ = v_Recv_Seq
              , CHG_ID   = v_Reg_Id
              , CHG_DT   = SYSDATE
        WHERE   RCRD_DAY = v_Rcrd_Day
        AND     RCRD_SEQ = v_Rcrd_Seq;

        RETURN SQLCODE;

    EXCEPTION
        WHEN OTHERS THEN
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RETURN SQLCODE;
    END f_UpdateRtre0200RecvResult;

/*****************************************************************************
 -- 카드즉시출금 수납처리
 -- - Pkg_Rtre0080.p_CreateRtre0080CardReceive 를 참조하여 개발
 *****************************************************************************/
    PROCEDURE p_CreateRtre0200RcrdReceive(  v_Tno            IN  RTRE0200.TNO%TYPE    /* 거래고유번호 */
                                          , v_Reg_Id         IN  RTRE0200.REG_ID%TYPE /* 등록자 ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_ErrorText      OUT VARCHAR2
                                         )
    IS

    ln_Chk_Cnt    NUMBER;
    ln_Exe_Cnt    NUMBER;

    ln_Remain_Amt RTRE0201.ARRE_AMT%TYPE;
    ln_Tarre_Amt  RTRE0201.ARRE_AMT%TYPE;
    ln_Trecp_Amt  RTRE0201.ARRE_AMT%TYPE;
    ln_Arre_Amt   RTRE0201.ARRE_AMT%TYPE;
    ln_Recp_Amt   RTRE0200.PRT_CNC_RMNN_AMT%TYPE;
    ln_Pend_Amt   RTRE0200.PRT_CNC_RMNN_AMT%TYPE;
    ln_Rear_Amt   RTRE0200.PRT_CNC_RMNN_AMT%TYPE;
    ln_Recv_Seq   RTRE0030.RECV_SEQ%TYPE;
    ln_End_Tp     RTSD0108.END_TP%TYPE;
    ln_recv_seq35 RTRE0035.RECV_SEQ%TYPE;
    ln_ritm_seq35 RTRE0035.RITM_SEQ%TYPE;

    lr_Re0200     RTRE0200%ROWTYPE;
    lr_Re0201     RTRE0201%ROWTYPE;

    Ref_Cursor    SYS_REFCURSOR;

    e_Error       EXCEPTION;

    BEGIN

    /*
     * 필수값 입력 확인
     */
    IF(TRIM(v_Tno) IS NULL) OR (TRIM(v_Tno) = '') THEN
        v_Return_Message := '거래고유번호 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 카드즉시출금내역 존재 여부
    SELECT NVL(COUNT(1), 0)
    INTO   ln_Chk_Cnt
    FROM   RTRE0200
    WHERE  TNO       = v_Tno
    --AND    CNC_STAT <> 'Y'
    AND    REFUND_YN <> 'Y';
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_04', v_Tno, ln_Chk_Cnt); 
    IF ln_Chk_Cnt = 0 THEN
        v_Return_Message := '해당 거래고유번호(' || v_Tno || ')는 유효한 카드즉시출금내역(RTRE0200)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
DBMS_OUTPUT.PUT_LINE('CUR_0200.ln_Chk_Cnt::'||ln_Chk_Cnt);  
    /*
     * 수납대상리스트 임시테이블 존재여부 확인
     * - 미존재시 임시테이블 생성
     */
    SELECT COUNT(*)
    INTO   ln_Chk_Cnt
    FROM   USER_TABLES
    WHERE  TABLE_NAME = 'RTTEMP01';

    IF(SQL%NOTFOUND) OR (ln_Chk_Cnt = 0) THEN
        EXECUTE IMMEDIATE
            'CREATE GLOBAL TEMPORARY TABLE RTTEMP01(  ORD_NO   VARCHAR2(15 BYTE)
                                                    , CUST_NO  VARCHAR2(10 BYTE)
                                                    , SCHD_SEQ NUMBER(3)
                                                    , ARRE_AMT NUMBER(10)
                                                    , RECP_AMT NUMBER(10)
                                                   )
            ON COMMIT DELETE ROWS;
            COMMENT ON TABLE NXRADMIN.RTTEMP01 IS ''출금이체 수납등록처리(Pkg_Rtre0070)시 사용 TEMPORARY TABLE'';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.ORD_NO   IS ''계약번호'';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.CUST_NO  IS ''고객번호'';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCHD_SEQ IS ''청구순번'';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.ARRE_AMT IS ''미납금액 '';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_AMT IS ''수납처리금액'';';
    END IF;

    -- 카드즉시출금 내역 조회
    SELECT *
    INTO   lr_Re0200
    FROM   RTRE0200
    WHERE  TNO       = v_Tno
    --AND    CNC_STAT <> 'Y'
    AND    REFUND_YN <> 'Y';

    ln_Remain_Amt := 0;
    ln_Exe_Cnt    := 1;
DBMS_OUTPUT.PUT_LINE('CUR_0200.RECP_TP::' || lr_Re0200.RECP_TP);      
DBMS_OUTPUT.PUT_LINE('CUR_0200.TORD_NO::' || lr_Re0200.TORD_NO);  
    -- 중도완납여부 체크
    IF lr_Re0200.RECP_TP = '90' THEN
        ln_End_Tp := '';
    ELSE 
        SELECT END_TP
        INTO   ln_End_Tp
          FROM RTSD0108
         WHERE 1=1
           AND ORD_NO = lr_Re0200.TORD_NO;
       --AND MFP_YN = 'Y';
    END IF;
    -- 수납거래번호 채번
    -- - CMS, 카드정기출금 : 계약번호별 수납거래번호 채번
    -- - 가상계좌 : 입금통보별 수납거래번호 채번
    ln_Recv_Seq := lr_Re0200.RECV_SEQ;    
--    IF lr_Re0200.REFUND_YN = 'N' THEN
--        ln_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();
--    ELSIF lr_Re0200.REFUND_YN = 'P' THEN
--        ln_Recv_Seq := lr_Re0200.RECV_SEQ;
--    END IF;
DBMS_OUTPUT.PUT_LINE('CUR_0200.ln_End_Tp::'||ln_End_Tp);      
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_05', v_Tno, lr_Re0200.TORD_NO); 
    /*
     * 카드즉시출금 세부내역 계약별로 LOOP 돌면서 수행
     */
     
    IF lr_Re0200.RECP_TP = '90'  OR (lr_Re0200.RECP_TP = '42' AND ln_End_Tp = '') THEN

        -- 수납대상리스트에  선수금 데이터 추가(수납금액을 수납처리금액 값에 설정하고 나머지는 NULL 처리함)
        INSERT INTO RTTEMP01
        SELECT lr_Re0200.TORD_NO ORD_NO, NULL SCHD_SEQ, NULL RECP_TP, lr_Re0200.CUST_NO CUST_NO, NULL DEMD_DT, NULL ZFB_DAY, NULL SCD_STAT,
               NULL ZLSPR, NULL RC_YN, NULL USE_YN, NULL SALE_AMT, NULL RECP_AMT, NULL ARRE_AMT, NULL RECP_NU, lr_Re0200.PRT_CNC_RMNN_AMT
        FROM   DUAL;

        IF SQL%NOTFOUND THEN
            v_Return_Message := '수납대상리스트에 선수금 데이터 추가 실패!!';
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
        END IF;

            -- 수납대상리스트 조회(미납리스트와 선수금 내역)
        OPEN  Ref_Cursor FOR
        SELECT  A.ORD_NO,               /*계약번호 */
                A.CUST_NO,              /*고객번호 */
                A.SCHD_SEQ,             /*청구순번 */
                A.ARRE_AMT,             /*미납금액 */
                A.RECA_AMT RECP_AMT     /*수납금액 */
        FROM    RTTEMP01 A
        WHERE   A.RECA_AMT > 0          /*수납금액이 존재하는 것만 */
        ORDER   BY A.ZFB_DAY, A.RECP_TP, NVL(A.SCHD_SEQ,999); -- 선수금을 무조건 마지막에 위치함.

        -- 수납거래번호 채번
        --ln_Recv_Seq := f_sRtre0041RecvSeq();

        Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, lr_Re0200.RCRD_DAY, lr_Re0200.TORD_NO, lr_Re0200.CUST_NO,
                                       v_Reg_Id, lr_Re0200.PRT_CNC_RMNN_AMT, lr_Re0200.RECP_PAY, lr_Re0200.RECP_FG, ln_Recv_Seq,
                                       0, lr_Re0200.PRT_CNC_RMNN_AMT, v_Reg_Id, v_Success_Code,
                                       v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납내역 생성처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    -- 중도완납 해지 프로세스
    ELSIF ln_End_Tp IN ('E','C')THEN
   
        ln_Tarre_Amt := lr_Re0200.PRT_CNC_RMNN_AMT;
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_06', v_Tno, lr_Re0200.TORD_NO); 
        IF ln_Exe_Cnt = 1 THEN
            ln_Tarre_Amt := ln_Tarre_Amt + ln_Remain_Amt;
        END IF;

        ln_Trecp_Amt := ln_Tarre_Amt; -- 수납처리 대상 전체금액

        /*
         * 계약별 청구스케쥴 감안하여 처리
         */
        FOR curs_SD0109 IN(SELECT  SCHD_SEQ
                                , ARRE_AMT
                          FROM    RTSD0109
                          WHERE   CUST_NO  = lr_Re0200.CUST_NO
                          AND     SCD_STAT = 'S'
                          AND     ZLSPR    = 'N'
                          AND     RC_YN   <> 'Y'
                          AND     USE_YN   = 'Y'
                          --AND     ZFB_DAY <= lr_Re0200.RCRD_DAY
                          AND     ORD_NO   = lr_Re0200.TORD_NO
                          ORDER BY  DEMD_DT
                                  , RECP_TP
                         )
        LOOP --EXIT WHEN cur_SD0109%NOTFOUND;
            IF ln_Tarre_Amt >= curs_SD0109.ARRE_AMT THEN
                ln_Arre_Amt  := curs_SD0109.ARRE_AMT;
                ln_Recp_Amt  := curs_SD0109.ARRE_AMT;
                ln_Tarre_Amt := ln_Tarre_Amt - curs_SD0109.ARRE_AMT;
            ELSE
                ln_Arre_Amt  := curs_SD0109.ARRE_AMT;
                ln_Recp_Amt  := ln_Tarre_Amt;
                ln_Tarre_Amt := 0;
            END IF;

            -- 수납대상리스트 임시테이블에 생성
            IF ln_Recp_Amt > 0 THEN
                INSERT INTO RTTEMP01(  ORD_NO   /* 계약번호 */
                                     , CUST_NO  /* 고객번호 */
                                     , SCHD_SEQ /* 청구순번 */
                                     , ARRE_AMT /* 연체금액(VAT포함) */
                                     , RECP_AMT /* 수납금액(VAT포함) */
                                    )
                VALUES              (  lr_Re0200.TORD_NO
                                     , lr_Re0200.CUST_NO
                                     , curs_SD0109.SCHD_SEQ
                                     , ln_Arre_Amt
                                     , ln_Recp_Amt
                                    );
            END IF;
        END LOOP;

        -- 선수금액이  남아 있는 경우 청구순번없이 TEMP Table 생성
        ln_Pend_Amt := ln_Tarre_Amt;

        IF ln_Tarre_Amt > 0 THEN
            INSERT INTO RTTEMP01(  ORD_NO   /* 계약번호 */
                                 , CUST_NO  /* 고객번호 */
                                 , SCHD_SEQ /* 청구순번 */
                                 , ARRE_AMT /* 연체금액(VAT포함) */
                                 , RECP_AMT /* 수납금액(VAT포함) */
                                )
            VALUES              (  lr_Re0200.TORD_NO
                                 , lr_Re0200.CUST_NO
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
        OPEN Ref_Cursor FOR
            SELECT  ORD_NO   /* 계약번호 */
                  , CUST_NO  /* 고객번호 */
                  , SCHD_SEQ /* 청구순번 */
                  , ARRE_AMT /* 미납금액 */
                  , RECP_AMT /* 수납처리금액 */
            FROM    RTTEMP01
            WHERE   RECP_AMT > 0 /* 수납금액이 존재하는 것만 */
            AND     ORD_NO   = lr_Re0200.TORD_NO
            AND     CUST_NO  = lr_Re0200.CUST_NO
            ORDER BY NVL(SCHD_SEQ, 999); -- 선수금을 마지막에 위치시킴
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_07', v_Tno, lr_Re0200.TORD_NO); 
        -- 수납 처리
        Pkg_Rtre0030.p_InsertRtre0030(  Ref_Cursor
                                      , lr_Re0200.RCRD_DAY
                                      , lr_Re0200.TORD_NO
                                      , lr_Re0200.CUST_NO
                                      , v_Reg_Id
                                      , ln_Recp_Amt
                                      , 'P7'
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
            v_Return_Message := '수납내역 생성처리 실패!!(' || lr_Re0200.TORD_NO || ')-' || v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        IF Ref_Cursor%ISOPEN THEN
            CLOSE Ref_Cursor;
        END IF;        

    ELSE
DBMS_OUTPUT.PUT_LINE('CUR_0200.cur_Re0202::'||v_Return_Message);
        FOR cur_Re0201 IN(SELECT  RCRD_DAY
                                , CUST_NO
                                , ORD_NO
                                , SUM(ARRE_AMT) AS ARRE_AMT
                          FROM    RTRE0201
                          WHERE   (RCRD_DAY, RCRD_SEQ) IN(SELECT  RCRD_DAY
                                                                , RCRD_SEQ
                                                          FROM    RTRE0200
                                                          WHERE   TNO       = v_Tno
                                                          AND     REFUND_YN <> 'Y'
                                                         )
                          GROUP BY  RCRD_DAY
                                  , CUST_NO
                                  , ORD_NO
                         )
        LOOP
DBMS_OUTPUT.PUT_LINE('CUR_0200.cur_Re0203::'||v_Return_Message);
            -- 부분환불인 경우에는 환불 후 남은금액으로 셋팅
            IF lr_Re0200.REFUND_YN = 'P' THEN
                ln_Tarre_Amt := lr_Re0200.PRT_CNC_RMNN_AMT;
                ln_Trecp_Amt := ln_Tarre_Amt;
                IF ln_Exe_Cnt = 1 THEN
                    ln_Tarre_Amt := ln_Tarre_Amt + ln_Remain_Amt;
                END IF;
            ELSE
                ln_Tarre_Amt := cur_Re0201.ARRE_AMT;
                ln_Trecp_Amt := ln_Tarre_Amt; -- 수납처리 대상 전체금액
                IF ln_Exe_Cnt = 1 THEN
                    ln_Tarre_Amt := ln_Tarre_Amt + ln_Remain_Amt;
                END IF;
            END IF;
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_08', v_Tno, lr_Re0200.TORD_NO); 
            /*
             * 계약별 청구스케쥴 감안하여 처리
             */
            FOR cur_SD0109 IN(SELECT  SCHD_SEQ
                                    , ARRE_AMT
                              FROM    RTSD0109
                              WHERE   CUST_NO  = cur_Re0201.CUST_NO
                              AND     SCD_STAT = 'S'
                              AND     ZLSPR    = 'N'
                              AND     RC_YN   <> 'Y'
                              AND     USE_YN   = 'Y'
                              AND     ZFB_DAY <= cur_Re0201.RCRD_DAY
                              AND     ORD_NO   = cur_Re0201.ORD_NO
                              ORDER BY  DEMD_DT
                                      , RECP_TP
                             )
            LOOP --EXIT WHEN cur_SD0109%NOTFOUND;
                IF ln_Tarre_Amt >= cur_SD0109.ARRE_AMT THEN
                    ln_Arre_Amt  := cur_SD0109.ARRE_AMT;
                    ln_Recp_Amt  := cur_SD0109.ARRE_AMT;
                    ln_Tarre_Amt := ln_Tarre_Amt - cur_SD0109.ARRE_AMT;
                ELSE
                    ln_Arre_Amt  := cur_SD0109.ARRE_AMT;
                    ln_Recp_Amt  := ln_Tarre_Amt;
                    ln_Tarre_Amt := 0;
                END IF;
DBMS_OUTPUT.PUT_LINE('CUR_0200.cur_Re0201::'||v_Return_Message);
                -- 수납대상리스트 임시테이블에 생성
                IF ln_Recp_Amt > 0 THEN
                    INSERT INTO RTTEMP01(  ORD_NO   /* 계약번호 */
                                         , CUST_NO  /* 고객번호 */
                                         , SCHD_SEQ /* 청구순번 */
                                         , ARRE_AMT /* 연체금액(VAT포함) */
                                         , RECP_AMT /* 수납금액(VAT포함) */
                                        )
                    VALUES              (  cur_Re0201.ORD_NO
                                         , cur_Re0201.CUST_NO
                                         , cur_SD0109.SCHD_SEQ
                                         , ln_Arre_Amt
                                         , ln_Recp_Amt
                                        );
                END IF;
            END LOOP;

            -- 선수금액이  남아 있는 경우 청구순번없이 TEMP Table 생성
            ln_Pend_Amt := ln_Tarre_Amt;

            IF ln_Tarre_Amt > 0 THEN
                INSERT INTO RTTEMP01(  ORD_NO   /* 계약번호 */
                                     , CUST_NO  /* 고객번호 */
                                     , SCHD_SEQ /* 청구순번 */
                                     , ARRE_AMT /* 연체금액(VAT포함) */
                                     , RECP_AMT /* 수납금액(VAT포함) */
                                    )
                VALUES              (  cur_Re0201.ORD_NO
                                     , cur_Re0201.CUST_NO
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
            OPEN Ref_Cursor FOR
                SELECT  ORD_NO   /* 계약번호 */
                      , CUST_NO  /* 고객번호 */
                      , SCHD_SEQ /* 청구순번 */
                      , ARRE_AMT /* 미납금액 */
                      , RECP_AMT /* 수납처리금액 */
                FROM    RTTEMP01
                WHERE   RECP_AMT > 0 /* 수납금액이 존재하는 것만 */
                AND     ORD_NO   = cur_Re0201.ORD_NO
                AND     CUST_NO  = cur_Re0201.CUST_NO
                ORDER BY NVL(SCHD_SEQ, 999); -- 선수금을 마지막에 위치시킴
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_09', v_Tno, lr_Re0200.TORD_NO); 
            -- 수납 처리
            Pkg_Rtre0030.p_InsertRtre0030(  Ref_Cursor
                                          , lr_Re0200.RCRD_DAY
                                          , cur_Re0201.ORD_NO
                                          , cur_Re0201.CUST_NO
                                          , v_Reg_Id
                                          , ln_Recp_Amt
                                          , 'P7'
                                          , '01'
                                          , ln_Recv_Seq
                                          , ln_Rear_Amt
                                          , ln_Pend_Amt
                                          , v_Reg_Id
                                          , v_Success_Code
                                          , v_Return_Message
                                          , v_ErrorText
                                         );
DBMS_OUTPUT.PUT_LINE('CUR_0200.v_Success_Code::'||v_Success_Code);
DBMS_OUTPUT.PUT_LINE('CUR_0200.v_Return_Message::'||v_Return_Message);
DBMS_OUTPUT.PUT_LINE('CUR_0200.v_ErrorText::'||v_ErrorText);
            IF 0 != v_Success_Code THEN
                v_Return_Message := '수납내역 생성처리 실패!!(' || cur_Re0201.ORD_NO || ')-' || v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            ln_Exe_Cnt := ln_Exe_Cnt + 1;
        END LOOP;
    END IF;
    -- 수납처리 완료후 수납거래번호 Update
    IF 0 <> PKG_RTRE0200.f_UpdateRtre0200RecvResult(  lr_Re0200.RCRD_DAY
                                                    , lr_Re0200.RCRD_SEQ
                                                    , ln_Recv_Seq
                                                    , v_Reg_Id
                                                    , v_ErrorText
                                                   ) THEN
        v_Return_Message := '수납결과 수정 실패!!!';
        RAISE e_Error;
    END IF;
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_10', v_Tno, lr_Re0200.TORD_NO); 
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 카드즉시출금 수납처리되었습니다';
    v_ErrorText      := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_ErrorText);
            --Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_CreateRtre0200RcrdReceive(1)', v_ErrorText, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
            --Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_CreateRtre0200RcrdReceive(2)', v_ErrorText, v_Return_Message);
    END p_CreateRtre0200RcrdReceive;

/*******************************************************************************
  -- 카드즉시출금결제이력 수납일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0200HstRcrdSeq

    RETURN NUMBER

    IS

    v_Rcrd_Seq RTRE0205.RCRD_SEQ%TYPE DEFAULT 0; /* 수납일련번호 */

    BEGIN
        SELECT NVL2(MAX(RCRD_SEQ), TO_NUMBER(MAX(RCRD_SEQ)) + 1, 1)
        INTO   v_Rcrd_Seq
        FROM   RTRE0205;
    RETURN v_Rcrd_Seq;

    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0200HstRcrdSeq;

/*******************************************************************************
  -- 카드즉시출금결제이력 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0200CrdImmWthdrHst(  v_Rcrd_Seq       IN  RTRE0205.RCRD_SEQ%TYPE   /* 수납일련번호 */
                                             , v_Tord_No        IN  RTRE0205.TORD_NO%TYPE    /* 통합청구계약번호 */
                                             , v_Cust_No        IN  RTRE0205.CUST_NO%TYPE    /* 고객번호 */
                                             , v_Recp_Amt       IN  RTRE0205.RECP_AMT%TYPE   /* 수납금액 */
                                             , v_Email          IN  RTRE0205.EMAIL%TYPE      /* 주문자 E-Mail */
                                             , v_Tno            IN  RTRE0205.TNO%TYPE        /* 거래번호 */
                                             , v_Sec_Crd_No     IN  RTRE0205.CRD_NO%TYPE /* 카드번호 */
                                             , v_Crd_Cd         IN  RTRE0205.CRD_CD%TYPE     /* 카드사코드 */
                                             , v_Crd_Nm         IN  RTRE0205.CRD_NM%TYPE     /* 카드사명 */
                                             , v_App_Time       IN  RTRE0205.APP_TIME%TYPE   /* 결제승인시간 */
                                             , v_App_No         IN  RTRE0205.APP_NO%TYPE     /* 승인번호 */
                                             , v_Noinf          IN  RTRE0205.NOINF%TYPE      /* 무이자할부여부 */
                                             , v_Noinf_Type     IN  RTRE0205.NOINF_TYPE%TYPE /* 무이자할부 이벤트 구분 */
                                             , v_Quota          IN  RTRE0205.QUOTA%TYPE      /* 할부개월 */
                                             , v_Res_Cd         IN  RTRE0205.RES_CD%TYPE     /* 결과코드 */
                                             , v_Res_Msg        IN  RTRE0205.RES_MSG%TYPE    /* 결과내용 */
                                             , v_Reg_Id         IN  RTRE0205.REG_ID%TYPE     /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            )
    IS

    e_Error EXCEPTION;


    BEGIN
        INSERT INTO RTRE0205(  RCRD_DAY
                             , RCRD_SEQ
                             , TORD_NO
                             , CUST_NO
                             , RECP_AMT
                             , EMAIL
                             , TNO
                             , CRD_NO
                             , CRD_CD
                             , CRD_NM
                             , APP_TIME
                             , APP_NO
                             , NOINF
                             , NOINF_TYPE
                             , QUOTA
                             , RES_CD
                             , RES_MSG
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Rcrd_Seq
                             , v_Tord_No
                             , v_Cust_No
                             , v_Recp_Amt
                             , v_Email
                             , v_Tno
                             , v_Sec_Crd_No
                             , v_Crd_Cd
                             , v_Crd_Nm
                             , v_App_Time
                             , v_App_No
                             , v_Noinf
                             , v_Noinf_Type
                             , v_Quota
                             , v_Res_Cd
                             , v_Res_Msg
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.cardrecvtest_11', v_Tord_No, v_Tno);                             
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_Error_Text);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0200CrdImmWthdrHst(1)', v_Error_Text, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0200CrdImmWthdrHst(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0200CrdImmWthdrHst;

/*****************************************************************************
 -- 카드즉시출금 결제취소 내역 Update(환불이 아닌 수납취소만)
 *****************************************************************************/
    FUNCTION f_UpdateRtre0200Cancle(  v_Recv_Seq  IN  RTRE0200.RECV_SEQ%TYPE /* 수납거래번호 */
                                    , v_Cnc_Rseq  IN  RTRE0200.CNC_RSEQ%TYPE /* 수납취소거래번호 */
                                    , v_Cnc_Stat  IN  RTRE0200.CNC_STAT%TYPE /* 수납취소여부 */
                                    , v_Reg_Id    IN  RTRE0200.REG_ID%TYPE   /* 등록자 ID */
                                    , v_ErrorText OUT VARCHAR2
                                   )
    RETURN NUMBER

    IS

    BEGIN

        UPDATE  RTRE0200
        SET     CNC_RSEQ = v_Cnc_Rseq
              , CNC_STAT = v_Cnc_Stat
              , CHG_ID   = v_Reg_Id
              , CHG_DT   = SYSDATE
        WHERE   RECV_SEQ = v_Recv_Seq;

        RETURN SQLCODE;

    EXCEPTION
        WHEN OTHERS THEN
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RETURN SQLCODE;
    END f_UpdateRtre0200Cancle;

/*******************************************************************************
 -- 카드즉시출금취소 저장 Update
 *******************************************************************************/
    PROCEDURE p_UpdateRtre0200CrdCancel(  v_Rcrd_Day         IN  RTRE0200.RCRD_DAY%TYPE         /* 카드수납일자 */
                                        , v_Recv_Seq         IN  RTRE0200.RECV_SEQ%TYPE         /* 수납거래번호 */
                                        , v_Cnc_Rseq         IN  RTRE0200.CNC_RSEQ%TYPE         /* 수납취소거래번호 */
                                        , v_Cnc_Tno          IN  RTRE0200.CNC_TNO%TYPE          /* KCP취소거래번호 */
                                        , v_Prt_Cnc_Rmnn_Amt IN  RTRE0200.PRT_CNC_RMNN_AMT%TYPE /* 수납취소후남은금액 */
                                        , v_Refund_Yn        IN  RTRE0200.REFUND_YN%TYPE        /* 환불여부 */
                                        , v_Chg_Id           IN  RTRE0200.CHG_ID%TYPE           /* 등록자 ID */
                                        , v_Success_Code     OUT NUMBER
                                        , v_Return_Message   OUT VARCHAR2
                                        , v_Error_Text       OUT VARCHAR2
                                       )
    IS

    e_Error EXCEPTION;

    BEGIN
        UPDATE  RTRE0200
        SET     CNC_RSEQ         = v_Cnc_Rseq
              , CNC_TNO          = v_Cnc_Tno
              , PRT_CNC_RMNN_AMT = v_Prt_Cnc_Rmnn_Amt
              , REFUND_YN        = v_Refund_Yn
              , CHG_ID           = v_Chg_Id
              , CHG_DT           = SYSDATE
        --WHERE   RCRD_DAY = v_Rcrd_Day
        --AND     RECV_SEQ = v_Recv_Seq;
        WHERE   RECV_SEQ = v_Recv_Seq;
        
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.CrdCanceltest_01', v_Cnc_Tno, v_Prt_Cnc_Rmnn_Amt); 
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 수정되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_UpdateRtre0200CrdCancel(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_UpdateRtre0200CrdCancel(2)', v_Error_Text, v_Return_Message);

    END p_UpdateRtre0200CrdCancel;

/*******************************************************************************
  -- 거래취소번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0200HstCncSeq(v_Tno IN RTRE0206.TNO%TYPE) /* 거래번호 */

    RETURN NUMBER

    IS

    v_Cnc_Seq RTRE0206.CNC_SEQ%TYPE DEFAULT 0; /* 거래취소번호 */

    BEGIN
        SELECT NVL((SELECT MAX(CNC_SEQ)
                    FROM   RTRE0206
                    WHERE  TNO = v_Tno
                   )+ 1, 1)
        INTO   v_Cnc_Seq
        FROM   DUAL;
    RETURN v_Cnc_Seq;
    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0200HstCncSeq;

/*******************************************************************************
  -- 카드즉시출금취소이력 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0200CrdCancelHst(  v_Tno            IN  RTRE0206.TNO%TYPE      /* 거래번호 */
                                           , v_Cnc_Seq        IN  RTRE0206.CNC_SEQ%TYPE  /* 거래취소번호 */
                                           , v_Mod_Type       IN  RTRE0206.MOD_TYPE%TYPE /* 요청종류 */
                                           , v_Mod_Mny        IN  RTRE0206.MOD_MNY%TYPE  /* 취소요청금액 */
                                           , v_Rem_Mny        IN  RTRE0206.REM_MNY%TYPE  /* 취소가능금액 */
                                           , v_Mod_Desc       IN  RTRE0206.MOD_DESC%TYPE /* 취소사유 */
                                           , v_Res_Cd         IN  RTRE0206.RES_CD%TYPE   /* 결과코드 */
                                           , v_Res_Msg        IN  RTRE0206.RES_MSG%TYPE  /* 결과내용 */
                                           , v_Reg_Id         IN  RTRE0206.REG_ID%TYPE   /* 등록자 ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_Error_Text     OUT VARCHAR2
                                          )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0206(  TNO
                             , CNC_SEQ
                             , MOD_TYPE
                             , MOD_MNY
                             , REM_MNY
                             , MOD_DESC
                             , RES_CD
                             , RES_MSG
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  v_Tno
                             , v_Cnc_Seq
                             , v_Mod_Type
                             , v_Mod_Mny
                             , v_Rem_Mny
                             , v_Mod_Desc
                             , v_Res_Cd
                             , v_Res_Msg
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );
                            
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.CrdCanceltest_02', v_Tno, v_Res_Msg);                             
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_Error_Text);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0200CrdCancelHst(1)', v_Error_Text, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0200CrdCancelHst(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0200CrdCancelHst;

/*****************************************************************************
 -- 카드즉시출금 수납처리 메니져
 --
 *****************************************************************************/
    PROCEDURE p_InsertRtre0200TotCrdRecvMng(  v_Recv_Day       IN  VARCHAR2     /*수납일자  */
                                            , v_Ord_No         IN  VARCHAR2     /* 계약번호 */
                                            , v_Cust_No        IN  VARCHAR2     /* 고객번호 */
                                            , v_Recp_Amt       IN  VARCHAR2     /* 수납금액 */
                                            , v_Tno            IN  VARCHAR2     /* 거래고유번호 */
                                            , v_App_No         IN  VARCHAR2     /* 승인번호 */
                                            , v_Dc_Cd          IN  VARCHAR2     /* 할인코드 */
                                            , v_Prpt_Mon       IN  VARCHAR2     /* 선납개월 */
                                            , v_Cnc_Day        IN  VARCHAR2     /* 취소일자 */
                                            , v_Serv_Amt       IN  VARCHAR2     /* 추가납부금액 */
                                            , v_Mfp_Cd         IN  VARCHAR2     /* 해지구분 */
                                            , v_Mfp_Rsn_Cd     IN  VARCHAR2     /* 완납해지사유코드 */
                                            , v_Mfp_Desc       IN  VARCHAR2     /* 완납해지상세사유 */
                                            , v_Work_Cd        IN  VARCHAR2     /* 수납업무 구분 */
                                            , v_Reg_Id         IN  VARCHAR2     /* 등록자 ID */
                                            , v_Success_Code   OUT NUMBER
                                            , v_Return_Message OUT VARCHAR2
                                            , v_ErrorText      OUT VARCHAR2
                                             )
    IS

    v_Recv_Seq      RTRE0041.RECV_SEQ%TYPE DEFAULT NULL;  /*수납거래번호          */
    v_Mfp_Seq       RTRE0230.MFP_SEQ%TYPE DEFAULT NULL;   /*중도완납순번          */
    v_Proc_Day      RTSD0108.PROC_DAY%TYPE DEFAULT NULL;  /*장착일자          */
    v_Rcrd_Seq      RTRE0200.RCRD_SEQ%TYPE DEFAULT NULL;  /*카드수납일련번호          */
    v_Recp_Tp       RTRE0200.RECP_TP%TYPE DEFAULT NULL;   /*수납유형          */
    v_Mfp_Recv_Seq  RTRE0030.RECV_SEQ%TYPE DEFAULT NULL;  /*중도완납 선수금 거래번호          */
    v_Mfp_Ritm_Seq  RTRE0030.RITM_SEQ%TYPE DEFAULT NULL;  /*중도완납 선수금 거래번호순번          */
    v_Balance_Amt   RTSD0109.ARRE_AMT%TYPE DEFAULT NULL;  /*선납금액            */
    v_Arre1_Amt     RTSD0109.ARRE_AMT%TYPE DEFAULT NULL;  /*할인미대상            */
    v_Sale_Amt      RTRE0230.SERV_AMT%TYPE DEFAULT NULL;  /*추가납부금액          */
    v_Recv_Amt      RTRE0230.RECV_AMT%TYPE DEFAULT NULL;  /*총수납금액          */    

    v_Tot_Ptpt_Amt       RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    v_Mon_Tot_Prpt_Amt   RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    v_Real_Mon_Prpt_Amt  RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    v_Real_Prpt_Amt      RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    v_Tot_Dc_Amt         RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    v_Arre_Amt           RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    v_Tot_Recp_Amt       RTRE0160.TOT_PRPT_AMT%TYPE DEFAULT NULL;
    v_Start_Seq          RTRE0160.PRPT_STTG_TMBT%TYPE DEFAULT NULL;
    v_End_Seq            RTRE0160.PRPT_FNSH_TMBT%TYPE DEFAULT NULL;
    v_Dc_Rate            RTRE0160.PRPT_DSCN_RT%TYPE DEFAULT NULL;
    v_Dc_Amt             RTRE0160.TOT_RNT_AMT%TYPE DEFAULT NULL;
    v_Prpt_Seq           RTRE0161.PRPT_SEQ%TYPE DEFAULT NULL;
    v_Max_Seq            NUMBER DEFAULT 0;
    v_Remain_Amt         RTRE0230.RECV_AMT%TYPE DEFAULT NULL;  /*남은금액          */
    ln_Chk_Cnt           NUMBER DEFAULT 0;
    
    Ref_Cursor    SYS_REFCURSOR;

    e_Error       EXCEPTION;

    BEGIN

    -- 필수값: 수납일자 , 계약번호 , 고객번호 ,수납금액 ,  수납방법 , 연체금액, 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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
           
    IF TRIM(v_Recp_Amt) IS NULL THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;       
    
    -- 수납거래번호 채번 
    v_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();
    
    -- 중도완납처리
    IF v_Work_Cd = 'MFP' THEN 
    
        IF TRIM(v_Mfp_Cd) IS NULL THEN
            v_Return_Message := '종료유형('||v_Mfp_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;           
    
        IF TRIM(v_Cnc_Day) IS NULL THEN
            v_Return_Message := '취소일자('||v_Cnc_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        IF TRIM(v_Mfp_Rsn_Cd) IS NULL THEN
            v_Return_Message := '완납해지사유코드('||v_Mfp_Rsn_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;                          

        -- 할인미대상 금액 및 선수금액 
        SELECT NVL(A.ARRE1_AMT,0), NVL(B.PRPT_AMT,0), (SALE_AMT+REGI_AMT), (RECP_AMT+RGCP_AMT)
          INTO v_Arre1_Amt, v_Balance_Amt, v_Sale_Amt, v_Recv_Amt
          FROM ( 
                SELECT  ORD_NO,
                        SUM(REGI_AMT) AS REGI_AMT,
                        SUM(RGCP_AMT) AS RGCP_AMT,
                        SUM(REGI_AMT) - SUM(RGCP_AMT) AS RGBLANC_AMT,
                        SUM(SALE_AMT) AS SALE_AMT,
                        SUM(RECP_AMT) AS RECP_AMT,
                        SUM(SALE_AMT) - SUM(RECP_AMT) AS BLANC_AMT,
                        SUM(ARRE1_AMT) + (SUM(REGI_AMT) - SUM(RGCP_AMT)) AS ARRE1_AMT,
                        SUM(ARRE2_AMT) AS ARRE2_AMT,
                        SUM(ARRE1_PNLT_AMT) AS ARRE1_PNLT_AMT,
                        SUM(ARRE2_PNLT_AMT) AS ARRE2_PNLT_AMT
                FROM    (
                        SELECT  A1.ORD_NO, A1.RECP_TP,
                                DECODE(A1.RECP_TP, '01', A1.SALE_AMT, 0) REGI_AMT,
                                DECODE(A1.RECP_TP, '01', A1.ARRE_AMT, 0) RGAR_AMT,
                                DECODE(A1.RECP_TP, '01', A1.RECP_AMT, 0) RGCP_AMT,
                                DECODE(A1.RECP_TP, '11', A1.SALE_AMT, 0) SALE_AMT,
                                DECODE(A1.RECP_TP, '11', A1.ARRE_AMT, 0) ARRE_AMT,
                                DECODE(A1.RECP_TP, '11', A1.RECP_AMT, 0) RECP_AMT, A1.DEMD_DT, A1.BEG_DAY, A1.END_DAY,
                                CASE
                                    WHEN A1.DEMD_DT < SUBSTR(v_Cnc_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', A1.ARRE_AMT,0)
                                ELSE 0 END AS ARRE1_AMT,
                                CASE
                                    WHEN A1.DEMD_DT >= SUBSTR(v_Cnc_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', A1.ARRE_AMT,0)
                                ELSE 0 END  AS ARRE2_AMT,
                                CASE
                                    WHEN A1.DEMD_DT < SUBSTR(v_Cnc_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', (B1.MON_AMT - A1.SALE_AMT),0)
                                ELSE 0 END AS ARRE1_PNLT_AMT,
                                CASE
                                    WHEN A1.DEMD_DT >= SUBSTR(v_Cnc_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', B1.MON_AMT - A1.ARRE_AMT,0)
                                ELSE 0 END  AS ARRE2_PNLT_AMT,                                            
                                B1.MON_AMT
                                --B1.*
                        FROM    RTSD0109 A1,
                                RTSD0104 B1
                        WHERE   A1.ORD_NO   = v_Ord_No            
                        AND     A1.SCD_STAT = 'S'
                        AND     A1.ORD_NO = B1.ORD_NO
                        )
                GROUP   BY ORD_NO
               ) A,
               (
               SELECT ORD_NO
                    , NVL(PND_AMT - SBS_AMT,0) AS PRPT_AMT
                 FROM
                      (
                       SELECT ORD_NO
                            , SUM(NVL(PND_AMT,0)) AS PND_AMT
                            , SUM(NVL(SBS_AMT,0)) AS SBS_AMT
                         FROM (
                               SELECT ORD_NO
                                    , PND_AMT
                                    , SBS_AMT
                                 FROM RTRE0035
                                WHERE 1=1
                                  AND ORD_NO = v_Ord_No
                                  AND PND_STAT != 'S'
                              )
                       GROUP BY ORD_NO
                      )
               ) B      
         WHERE 1=1
           AND A.ORD_NO = B.ORD_NO(+);
          
        -- 중도완납 정보 처리
        Pkg_Rtsd0109.p_InsertRtsd0109CancelSave2 (v_Ord_No, v_Mfp_Cd, v_Cnc_Day, v_Recp_Amt + v_Balance_Amt,
                                       v_Arre1_Amt, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
                                       
        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도완납 정보 처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;      

        -- 카드수납내역 순번채번
        v_Rcrd_Seq := f_sRtre0200RcrdSeq();
        
        --완납유형에 따른 납부유형 변경
        IF v_Mfp_Cd = 'C' THEN
            v_Recp_Tp := '42';
        ELSE 
            v_Recp_Tp := '11';
        END IF;
        
        -- 카드수납내역 INSERT
        Pkg_Rtre0200.p_InsertRtre0200CrdImmWthdrMst(v_Rcrd_Seq, v_Ord_No, v_Cust_No, v_Recp_Amt, v_Recp_Tp, 'P7',
                                                    '01', v_Tno, v_App_No, v_Recv_Seq, 'N', v_Reg_Id,
                                                    v_Success_Code,v_Return_Message, v_ErrorText);
                                                    
        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도완납 카드수납내역 처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        -- 창구스케쥴에서 카드수납대상 상세 INSERT
        FOR curs_SD0109 IN(SELECT  SCHD_SEQ, ARRE_AMT, SALE_AMT, RECP_TP, ZFB_DAY
                          FROM    RTSD0109
                          WHERE   CUST_NO  = v_Cust_No
                          AND     SCD_STAT = 'S'
                          AND     ZLSPR    = 'N'
                          AND     RC_YN   <> 'Y'
                          AND     USE_YN   = 'Y'
                          AND     ORD_NO   = v_Ord_No
                          ORDER BY  DEMD_DT
                                  , RECP_TP
                         )
        LOOP
        
            -- 카드수납상세 INSERT
            Pkg_Rtre0200.p_InsertRtre0201CrdImmWthdrDtl(v_Rcrd_Seq, v_Cust_No, v_Ord_No, v_Ord_No, curs_SD0109.SCHD_SEQ, curs_SD0109.RECP_TP,
                                                        curs_SD0109.ZFB_DAY, curs_SD0109.SALE_AMT, curs_SD0109.ARRE_AMT, v_Reg_Id,
                                                        v_Success_Code,v_Return_Message, v_ErrorText);

            IF 0 != v_Success_Code THEN
                v_Return_Message := '중도완납 카드수납내역 상세 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;        
            
        END LOOP;

        -- 카드수납처리
        Pkg_Rtre0200.p_CreateRtre0200RcrdReceive(v_Tno, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
                
        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도완납 카드수납 정보 처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;           

        IF v_Balance_Amt > 0 THEN 
            
            -- 중도완납 계약에 선수금이 0원 이상이면 해당 수납거래번호와 순번을 구해서 성수금정리
            SELECT RECV_SEQ, RITM_SEQ
              INTO v_Mfp_Recv_Seq, v_Mfp_Ritm_Seq
              FROM RTRE0035
             WHERE 1=1
               AND ORD_NO = v_Ord_No
               AND PND_STAT != 'S';
            
            -- 중도완납건중 선수금이 있는 경우 선수금정리           
            Pkg_Rtre0035.p_UpdateRtre0035MfpPartClear(v_Recv_Day, v_Ord_No, v_Cust_No, v_Mfp_Recv_Seq, v_Mfp_Ritm_Seq,
                                                      'P', v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
           
            IF 0 != v_Success_Code THEN
            v_Return_Message := '중도완납 후 선수금 처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
            END IF;          

        END IF;

        -- 중도완납 순번채번               
        v_Mfp_Seq := Pkg_Rtre0230.f_sRtre0230MfpSeq();                    
          
        -- 장착일 수납순번가져오기
        SELECT A.PROC_DAY
        INTO v_Proc_Day
          FROM RTSD0108 A
         WHERE 1=1
           AND A.ORD_NO = v_Ord_No;
        
        -- 중도완납 이력저장  (장착일 가져와서 넣기)
        Pkg_Rtre0230.p_InsertRtsd0230MidFullPymnt (v_Mfp_Seq, v_Ord_No, v_Cust_No, v_Recv_Day, 
                                       SUBSTR(v_Recv_Day, 1,6), v_Mfp_Cd, v_Proc_Day, v_Sale_Amt
                                       ,v_Recv_Amt, v_Arre1_Amt, v_Serv_Amt , v_Recp_Amt, ROUND((v_Recv_Amt+v_Recp_Amt)/v_Sale_Amt, 2) * 100
                                       , 'P7',v_Recv_Seq, '01', '', v_Reg_Id, v_Success_Code
                                       , v_Return_Message, v_ErrorText);
                                    
        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도완납 이력저장 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;     

    -- 선납할인    
    ELSIF v_Work_Cd = 'PRPT' THEN
    
        IF TRIM(v_Dc_Cd) IS NULL THEN
            v_Return_Message := '할인코드('||v_Dc_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        IF TRIM(v_Prpt_Mon) IS NULL THEN
            v_Return_Message := '선납개월('||v_Prpt_Mon||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;   
        
        IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No),' ') THEN

            IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0104.f_sRtsd0104CustNo(v_Ord_No),' ') THEN
                v_Return_Message := '계약번호('||v_Ord_No||')와 고객번호('||v_Cust_No||')가 일치하지 않음으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
        END IF;      
        
        -- 선납요청 일련번호 채번
        v_Prpt_Seq := Pkg_Rtre0160.f_sRtre0160PrptSeq();           
        
        -- 선납대상 정보를 조회한다
    SELECT  TOT_PRPT_AMT                                                                                                 /* 총선납대상금액 */
          , TOT_PRPT_AMT / TOT_SLS_CNT                                                               AS MON_TOT_PRPT_AMT  /* 총월렌탈료 */
          , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT, -1)                                AS REAL_MON_PRPT_AMT /* 할인 월렌탈료 */
          , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT , -1) * TOT_SLS_CNT                  AS REAL_PRPT_AMT     /* 선납금액 */
          , (TOT_PRPT_AMT - TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT , -1) * TOT_SLS_CNT) AS TOT_DC_AMT        /* 총 할인금액 */
          , ARRE_AMT                                                                                                     /* 미납금액 */
          , (TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT , -1) * TOT_SLS_CNT) + ARRE_AMT     AS TOT_RECP_AMT      /* 총 납부금액 */
          , START_SEQ                                                                                                    /* 시작회차 */
          , END_SEQ                                                                                                      /* 종료회차 */
          , DC_RATE                                                                                                      /* 할인률  */
          , DC_AMT                                                                                                       /* 할인금액 */
    INTO  v_Tot_Ptpt_Amt, v_Mon_Tot_Prpt_Amt, v_Real_Mon_Prpt_Amt, v_Real_Prpt_Amt, v_Tot_Dc_Amt, 
          v_Arre_Amt, v_Tot_Recp_Amt, v_Start_Seq, v_End_Seq, v_Dc_Rate, v_Dc_Amt          
--    INTO  v_Tot_Ptpt_Amt, v_MonTotPrptAmt, v_RealMonPrptAmt, vRealPrptAmt, vTotDcAmt, vArreAmt, vTotRecpAmt, vStartSeq, vEndSeq, vDcRate, vDcAmt, vRemainAmt
    FROM    (SELECT  TOT_PRPT_AMT
                   , START_SEQ
                   , END_SEQ
                   , DC_RATE
                   , DC_AMT
                   --, ARRE_AMT
                   , NVL(ARRE_AMT, 0) + NVL(REGI_AMT,0) AS ARRE_AMT
                   , (SELECT SUM(ARRE_AMT) FROM   RTSD0109 WHERE ORD_NO   = v_Ord_No AND ARRE_AMT > 0 AND SCD_STAT = 'S') AS TOT_ARRE_AMT
                   , (CASE WHEN DC_RATE IS NOT NULL THEN (TOT_PRPT_AMT * DC_RATE) * 0.01
                           WHEN DC_RATE IS NULL     THEN (TOT_PRPT_AMT - DC_AMT)
                      END
                     ) AS TOT_DC_PRPT_AMT
                   , TOT_SLS_CNT
             FROM    (SELECT  SUM(NVL(A.ARRE_AMT,0)) AS TOT_PRPT_AMT /* 총 선납금 */
                            , MIN(A.SCHD_SEQ) AS START_SEQ    /* 선납시작회차 */
                            , MAX(A.SCHD_SEQ) AS END_SEQ      /* 선납종료회차 */
                            , MAX((SELECT DC_RATE FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_RATE
                            , MAX((SELECT DC_AMT  FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_AMT
                            , MAX((SELECT SUM(CNT)
                                   FROM   (
                                           SELECT CASE WHEN Z.SALE_AMT > 0 THEN 1
                                                  ELSE 0 END AS CNT
                                           FROM  RTSD0109 Z
                                           WHERE  Z.ORD_NO   = v_Ord_No
                                           AND    Z.RECP_TP = '11'
                                           AND    Z.RC_YN <> 'Y'
                                           AND    Z.SCD_STAT = 'S'
                                           AND    Z.USE_YN   = 'Y'
                                           AND    Z.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                           AND     ROWNUM    <= v_Prpt_Mon
                                         )))          AS TOT_SLS_CNT
                            , MAX((SELECT SUM(NVL(X.ARRE_AMT, 0))
                                   FROM   RTSD0109 X
                                   WHERE  X.ORD_NO   = v_Ord_No
                                   AND    X.ARRE_AMT > 0
                                   AND    X.RECP_TP = '01'
                                   AND    X.RC_YN <> 'Y'
                                   AND    X.SCD_STAT = 'S'
                                  ))          AS REGI_AMT   /* 등록금*/                               
                            , MAX((SELECT SUM(NVL(Y.ARRE_AMT, 0))
                                   FROM   RTSD0109 Y
                                   WHERE  Y.ORD_NO   = v_Ord_No
                                   AND    Y.ARRE_AMT > 0
                                   AND    Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                   AND    Y.SCD_STAT = 'S'
                                   AND    Y.RECP_TP = '11'
                                  ))          AS ARRE_AMT     /* 연체금 */
                      FROM    RTSD0109 A
                      WHERE   A.ORD_NO   = v_Ord_No
                      AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                      AND     A.RC_YN    = 'N'
--                      AND     A.SALE_AMT > 0
--                      AND     A.ARRE_AMT > 0
                      AND     A.USE_YN   = 'Y'
                      AND     A.SCD_STAT = 'S'
                      AND     A.RECP_TP = '11'
                      AND     ROWNUM    <= v_Prpt_Mon
                     )
            );            
--        SELECT  TOT_PRPT_AMT                                                                                                 /* 총선납대상금액 */
--              , TOT_PRPT_AMT / v_Prpt_Mon                                                               AS MON_TOT_PRPT_AMT  /* 총월렌탈료 */
--              , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon, -1)                                AS REAL_MON_PRPT_AMT /* 할인 월렌탈료 */
--              , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon , -1) * v_Prpt_Mon                  AS REAL_PRPT_AMT     /* 선납금액 */
--              , (TOT_PRPT_AMT - TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon , -1) * v_Prpt_Mon) AS TOT_DC_AMT        /* 총 할인금액 */
--              , ARRE_AMT                                                                                                     /* 미납금액 */
--              , (TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon , -1) * v_Prpt_Mon) + ARRE_AMT     AS TOT_RECP_AMT      /* 총 납부금액 */
--              , START_SEQ                                                                                                    /* 시작회차 */
--              , END_SEQ                                                                                                      /* 종료회차 */
--              , DC_RATE                                                                                                      /* 할인률  */
--              , DC_AMT                                                                                                       /* 할인금액 */
--        INTO  v_Tot_Ptpt_Amt, v_Mon_Tot_Prpt_Amt, v_Real_Mon_Prpt_Amt, v_Real_Prpt_Amt, v_Tot_Dc_Amt, 
--              v_Arre_Amt, v_Tot_Recp_Amt, v_Start_Seq, v_End_Seq, v_Dc_Rate, v_Dc_Amt
--        FROM    (SELECT  TOT_PRPT_AMT
--                       , START_SEQ
--                       , END_SEQ
--                       , DC_RATE
--                       , DC_AMT
--                       , NVL(ARRE_AMT, 0) + NVL(REGI_AMT,0) AS ARRE_AMT
--                       , (SELECT SUM(ARRE_AMT) FROM   RTSD0109 WHERE ORD_NO   = v_Ord_No AND ARRE_AMT > 0 AND SCD_STAT = 'S') AS TOT_ARRE_AMT
--                       , (CASE WHEN DC_RATE IS NOT NULL THEN (TOT_PRPT_AMT * DC_RATE) * 0.01
--                               WHEN DC_RATE IS NULL     THEN (TOT_PRPT_AMT - DC_AMT)
--                          END
--                         ) AS TOT_DC_PRPT_AMT
--                 FROM    (SELECT  SUM(NVL(A.ARRE_AMT,0)) AS TOT_PRPT_AMT /* 총 선납금 */
--                                , MIN(A.SCHD_SEQ) AS START_SEQ    /* 선납시작회차 */
--                                , MAX(A.SCHD_SEQ) AS END_SEQ      /* 선납종료회차 */
--                                , MAX((SELECT DC_RATE FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_RATE
--                                , MAX((SELECT DC_AMT  FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_AMT
--                                , MAX((SELECT SUM(NVL(X.ARRE_AMT, 0))
--                                       FROM   RTSD0109 X
--                                       WHERE  X.ORD_NO   = v_Ord_No
--                                       AND    X.ARRE_AMT > 0
--                                       AND    X.RECP_TP = '01'
--                                       AND    X.RC_YN <> 'Y'
--                                       AND    X.SCD_STAT = 'S'
--                                      ))          AS REGI_AMT   /* 등록금*/                               
--                                , MAX((SELECT SUM(NVL(Y.ARRE_AMT, 0))
--                                       FROM   RTSD0109 Y
--                                       WHERE  Y.ORD_NO   = v_Ord_No
--                                       AND    Y.ARRE_AMT > 0
--                                       AND    Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                                       AND    Y.SCD_STAT = 'S'
--                                      ))          AS ARRE_AMT     /* 연체금 */
--                          FROM    RTSD0109 A
--                          WHERE   A.ORD_NO   = v_Ord_No
--                          AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                          AND     A.RC_YN    = 'N'
--                          AND     A.SALE_AMT > 0
--                          AND     A.ARRE_AMT > 0
--                          AND     A.USE_YN   = 'Y'
--                          AND     A.SCD_STAT = 'S'
--                          AND     ROWNUM    <= v_Prpt_Mon
--                         )
--                );    
          
        -- 카드수납내역 순번 채번
        v_Rcrd_Seq := f_sRtre0200RcrdSeq(); 
              
        -- 카드수납내역 INSERT
        Pkg_Rtre0200.p_InsertRtre0200CrdImmWthdrMst(v_Rcrd_Seq, v_Ord_No, v_Cust_No, v_Recp_Amt, '51', 'P7',
                                                    '01', v_Tno, v_App_No, v_Recv_Seq, 'N', v_Reg_Id,
                                                    v_Success_Code,v_Return_Message, v_ErrorText);
                                                    
        IF 0 != v_Success_Code THEN
            v_Return_Message := '선납할인 카드수납내역 처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;        
                  
        -- 선납내역 Insert
        Pkg_Rtre0160.p_InsertRtre0160PrePymntMst(v_Prpt_Seq, v_Ord_No, v_Cust_No, '51', 'P7', v_Recv_Seq,
                                                 v_Tno, v_Prpt_Mon, v_Dc_Rate, v_Tot_Ptpt_Amt, v_Tot_Dc_Amt, v_Real_Prpt_Amt,
                                                 v_Arre_Amt, v_Start_Seq, v_End_Seq, v_Recv_Day, v_Reg_Id,
                                                 v_Success_Code,v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '선납내역 Insert 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;               

        -- 청구스케쥴 생성
        SELECT MAX(SCHD_SEQ) + 1
          INTO v_Max_Seq
          FROM RTSD0109
         WHERE 1=1
           --AND RECP_TP != '01'
           AND ORD_NO =v_Ord_No;
    
        -- 선납정보를 각 TABLE에 저장한다.
        FOR curs_RE0160 IN(
                            -- 등록비
                            SELECT  ORD_NO                                                          /* 계약번호 */
                                  , SCHD_SEQ                                                        /* 청구순번 Update */
                                  , RECP_TP                                                         /* 수납유형코드 */
                                  , Pkg_rtcm0051.f_sRtcm0051CodeName('R007', RECP_TP) AS RECP_TP_NM /* 수납유형명 */                                  
                                  , SALE_AMT                                                        /* 월렌탈료 */
                                  , SALE_AMT - SALE_AMT                               AS DC_AMT     /* 선납할인금액 */
                                  , RECP_AMT                                                        /* 수납금액 */
                                  , ARRE_AMT                                                        /* 미납금액 */                                  
                                  , SCHD_SEQ                                          AS SCHD_SEQ1 /* 청구순번 Insert */
                                  , SCD_STAT                                          AS SCD_STAT   /* 스케쥴상태코드(Update) */
                                  , 'I'                                               AS COMM_DVSN  /* 처리구분(I, U, D) */
                                  , '01'                                              AS RECP_TP1    /* 청구구분 */    
                                  , RECP_NU                                                         /* 납부회차 */
                                  , 0                                                 AS SALE_AMT1   /* 매출금액(VAT 포함) */
                                  , 0                                                 AS SALE_NAMT1  /* 원금 */
                                  , 0                                                 AS SALE_VAMT1  /* 부가세 */
                                  , 0                                                 AS RECP_AMT1   /* 수납금액(VAT 포함) */
                                  , 0                                                 AS ARRE_AMT1   /* 연체금액(VAT 포함) */
                                  , DEMD_DT                                                          /* 청구일자 */
                                  , 'N'                                               AS ZLSPR       /* 청구보류 */
                                  , ''                                                AS RC_DAY      /* 수납일자 */
                                  , 'N'                                               AS RC_YN       /* 수납여부 */
                                  , TAX_DT                                                           /* 세금계산서발행일자(예정) */
                                  , ''                                                AS TAX_NO      /* 세금계산서번호 */
                                  , ZFB_DAY                                                         /* 청구마감일 */
                                  , CANCL_DAY                                                        /* 중도완납일 */
                                  , CUST_NO                                                          /* 고객번호 */
                                  , SALES_GROUP                                                      /* 지사 */
                                  , SALES_OFFICE                                                     /* 지점 */
                                  , AGENCY_CD                                                        /* 장착대리점 */
                                  , BEG_DAY                                                          /* 시작일 */
                                  , END_DAY                                                          /* 종료일 */
                                  , 'N'                                               AS DELAY_YN1   /* 연체이자적용여부 */
                                  , 0                                                 AS DELAY_RATE  /* 연체이자율 */
                                  , PAY_MTHD                                                         /* 결제구분 */
                                  , PAY_DD                                                           /* 이체일 */
                                  , 'Y'                                               AS USE_YN      /* 사용여부 */                                      
                            FROM    RTSD0109 X
                            WHERE   X.ORD_NO   = v_Ord_No
                            AND     X.ARRE_AMT > 0
                            AND     X.RECP_TP = '01'
                            AND     X.SCD_STAT = 'S'        

                            UNION ALL
                            -- 연체금
                            SELECT  ORD_NO                                                          /* 계약번호 */
                                  , SCHD_SEQ                                                        /* 청구순번 Update */
                                  , RECP_TP                                                         /* 수납유형코드 */
                                  , Pkg_rtcm0051.f_sRtcm0051CodeName('R007', RECP_TP) AS RECP_TP_NM /* 수납유형명 */
                                  , SALE_AMT                                                        /* 월렌탈료 */
                                  , SALE_AMT - SALE_AMT                               AS DC_AMT     /* 선납할인금액 */
                                  , RECP_AMT                                                        /* 수납금액 */
                                  , ARRE_AMT                                                        /* 미납금액 */                                  
                                  , SCHD_SEQ                                          AS SCHD_SEQ1 /* 청구순번 Insert */
                                  , SCD_STAT                                          AS SCD_STAT   /* 스케쥴상태코드(Update) */
                                  , 'I'                                               AS COMM_DVSN  /* 처리구분(I, U, D) */
                                  , '11'                                              AS RECP_TP1    /* 청구구분 */                                  
                                  , RECP_NU                                                         /* 납부회차 */
                                  , 0                                                 AS SALE_AMT1   /* 매출금액(VAT 포함) */
                                  , 0                                                 AS SALE_NAMT1  /* 원금 */
                                  , 0                                                 AS SALE_VAMT1  /* 부가세 */
                                  , 0                                                 AS RECP_AMT1   /* 수납금액(VAT 포함) */
                                  , 0                                                 AS ARRE_AMT1   /* 연체금액(VAT 포함) */
                                  , DEMD_DT                                                          /* 청구일자 */
                                  , 'N'                                               AS ZLSPR       /* 청구보류 */
                                  , ''                                                AS RC_DAY      /* 수납일자 */
                                  , 'N'                                               AS RC_YN       /* 수납여부 */
                                  , TAX_DT                                                           /* 세금계산서발행일자(예정) */
                                  , ''                                                AS TAX_NO      /* 세금계산서번호 */
                                  , ZFB_DAY                                                          /* 청구마감일 */
                                  , CANCL_DAY                                                        /* 중도완납일 */
                                  , CUST_NO                                                          /* 고객번호 */
                                  , SALES_GROUP                                                      /* 지사 */
                                  , SALES_OFFICE                                                     /* 지점 */
                                  , AGENCY_CD                                                        /* 장착대리점 */
                                  , BEG_DAY                                                          /* 시작일 */
                                  , END_DAY                                                          /* 종료일 */
                                  , 'N'                                               AS DELAY_YN1   /* 연체이자적용여부 */
                                  , 0                                                 AS DELAY_RATE  /* 연체이자율 */
                                  , PAY_MTHD                                                         /* 결제구분 */
                                  , PAY_DD                                                           /* 이체일 */
                                  , 'Y'                                               AS USE_YN      /* 사용여부 */                                  
                            FROM    RTSD0109 Y
                            WHERE   Y.ORD_NO   = v_Ord_No
                            AND     Y.ARRE_AMT > 0
                            AND     Y.RECP_TP = '11'
                            AND     Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                            AND     Y.SCD_STAT = 'S'

                            UNION ALL
                            -- 선납  
                            SELECT  A.ORD_NO
                                  , A.SCHD_SEQ
                                  , '51'                                        AS RECP_TP
                                  , '선납'                                        AS RECP_TP_NM
                                  , CASE WHEN A.SALE_AMT = 0 THEN A.SALE_AMT
                                    ELSE B.TOT_DC_PRPT_AMT END                  AS SALE_AMT                                    
                                  , CASE WHEN A.SALE_AMT = 0 THEN A.SALE_AMT
                                    ELSE A.SALE_AMT - B.TOT_DC_PRPT_AMT END     AS DC_AMT                                  
                                  , A.RECP_AMT
                                  , CASE WHEN A.ARRE_AMT = 0 THEN A.ARRE_AMT
                                    ELSE A.ARRE_AMT - (SALE_AMT - B.TOT_DC_PRPT_AMT) END     AS ARRE_AMT                                   
                                  , Pkg_Rtsd0109.f_sRtsd0109SchdSeq(v_Ord_No) + ROWNUM -1 AS SCHD_SEQ1     /* 청구순번 */
                                  , A.SCD_STAT                                  AS SCD_STAT   /* 스케쥴상태코드(Update) */
                                  , 'I'                                         AS COMM_DVSN  /* 처리구분(I, U, D) */
                                  , '11'                                        AS RECP_TP1    /* 청구구분 */
                                  , A.RECP_NU                                               /* 청구회차 */
                                  , CASE WHEN A.SALE_AMT = 0 THEN A.SALE_AMT
                                    ELSE B.TOT_DC_PRPT_AMT END                  AS SALE_AMT1
                                  , CASE WHEN A.SALE_AMT = 0 THEN 0
                                    ELSE ROUND(B.TOT_DC_PRPT_AMT / 1.1, 0) END  AS SALE_NAMT1
                                  , CASE WHEN A.SALE_AMT = 0 THEN 0
                                    ELSE B.TOT_DC_PRPT_AMT - ROUND(B.TOT_DC_PRPT_AMT / 1.1, 0) END AS  SALE_VAMT1                                  
                                  , 0                                         AS RECP_AMT1   /* 수납금액(VAT 포함) */
                                  , CASE WHEN A.SALE_AMT = 0 THEN 0
                                    ELSE A.ARRE_AMT - (SALE_AMT - B.TOT_DC_PRPT_AMT)  END AS  ARRE_AMT1
                                  , A.DEMD_DT                                               /* 청구일자 */
                                  , 'N'                                       AS ZLSPR      /* 청구보류 */
                                  , ''                                        AS RC_DAY     /* 수납일자 */
                                  , 'N'                                       AS RC_YN      /* 수납여부 */
                                  , A.TAX_DT                                                /* 세금계산서발행일자(예정) */
                                  , ''                                        AS TAX_NO     /* 세금계산서번호 */
                                  , A.ZFB_DAY                                               /* 만기계산기준일 */
                                  , A.CANCL_DAY                                             /* 중도완납일 */
                                  , A.CUST_NO                                               /* 고객번호 */
                                  , A.SALES_GROUP                                           /* 지사 */
                                  , A.SALES_OFFICE                                          /* 지점 */
                                  , A.AGENCY_CD                                             /* 장착대리점 */
                                  , A.BEG_DAY                                               /* 시작일 */
                                  , A.END_DAY                                               /* 종료일 */
                                  , 'N'                                       AS DELAY_YN1  /* 연체이자적용여부 */
                                  , 0                                         AS DELAY_RATE /* 연체이자율 */
                                  , A.PAY_MTHD                                              /* 결제구분 */
                                  , A.PAY_DD                                                /* 이체일 */
                                  , 'Y'                                       AS USE_YN     /* 사용여부 */
                            FROM    RTSD0109 A
                                  , (SELECT  ORD_NO
                                           , (CASE WHEN DC_RATE IS NOT NULL THEN TRUNC((TOT_PRPT_AMT - ((TOT_PRPT_AMT * DC_RATE) * 0.01)) / TOT_SLS_CNT, -1)
                                                   WHEN DC_RATE IS NULL     THEN TRUNC((TOT_PRPT_AMT - (TOT_PRPT_AMT - DC_AMT)) / TOT_SLS_CNT, -1)
                                              END
                                             ) AS TOT_DC_PRPT_AMT
                                       FROM    (SELECT  /*+ INDEX(A RTSD0109_PK) */  
                                                        A.ORD_NO
                                                      , SUM(NVL(A.ARRE_AMT, 0)) AS TOT_PRPT_AMT /* 총 선납금 */
                                                      , MIN(A.SCHD_SEQ)         AS START_SEQ    /* 선납시작회차 */
                                                      , MAX(A.SCHD_SEQ)         AS END_SEQ      /* 선납종료회차 */
                                                      , MAX((SELECT DC_RATE FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_RATE
                                                      , MAX((SELECT DC_AMT  FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_AMT
                                                      , MAX((SELECT SUM(CNT)
                                                             FROM   (
                                                                    SELECT /*+ INDEX(Z RTSD0109_PK) */  
                                                                            CASE WHEN Z.SALE_AMT > 0 THEN 1
                                                                            ELSE 0 END AS CNT
                                                                            --SELECT *
                                                                      FROM  RTSD0109 Z
                                                                     WHERE  Z.ORD_NO   = v_Ord_No
                                                                     AND    Z.RECP_TP = '11'
                                                                     AND    Z.RC_YN <> 'Y'
                                                                     AND    Z.SCD_STAT = 'S'
                                                                     AND    Z.USE_YN   = 'Y'
                                                                     AND    Z.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                                                     AND     ROWNUM    <= v_Prpt_Mon
                                                                     )))          AS TOT_SLS_CNT
                                                      , MAX((SELECT /*+ INDEX(Y RTSD0109_PK) */  
                                                                    SUM(NVL(Y.ARRE_AMT, 0))
                                                             FROM   RTSD0109 Y
                                                             WHERE  Y.ORD_NO   = v_Ord_No
                                                             AND    Y.ARRE_AMT > 0
                                                             AND    Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                                             AND    Y.SCD_STAT = 'S'
                                                             AND    Y.RECP_TP = '11'
                                                            ))                  AS ARRE_AMT     /* 연체금 */
                                                FROM    RTSD0109 A
                                                WHERE   A.ORD_NO   = v_Ord_No
                                                AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                                AND     A.RC_YN    = 'N'
                                                AND     A.USE_YN   = 'Y'
                                                AND     A.SCD_STAT = 'S'
                                                AND     A.RECP_TP = '11'
                                                AND     ROWNUM    <= v_Prpt_Mon
                                                GROUP BY A.ORD_NO
                                             )
                                    )        B
                            WHERE   A.ORD_NO   = v_Ord_No
                            AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                            AND     A.RC_YN    = 'N'
                            AND     A.USE_YN   = 'Y'
                            AND     A.SCD_STAT = 'S'
                            AND     A.RECP_TP = '11'
                            AND     A.ORD_NO   = B.ORD_NO
                            AND     ROWNUM    <= v_Prpt_Mon                                   
--                            SELECT  A.ORD_NO
--                                  , A.SCHD_SEQ
--                                  , '51'                                        AS RECP_TP
--                                  , '선납'                                      AS RECP_TP_NM
--                                  , B.TOT_DC_PRPT_AMT                           AS SALE_AMT
--                                  , A.SALE_AMT - B.TOT_DC_PRPT_AMT              AS DC_AMT
--                                  , A.RECP_AMT
--                                  , A.ARRE_AMT - (SALE_AMT - B.TOT_DC_PRPT_AMT) AS ARRE_AMT
--                                  , Pkg_Rtsd0109.f_sRtsd0109SchdSeq(v_Ord_No) + ROWNUM -1 AS SCHD_SEQ1     /* 청구순번 */
--                                  , A.SCD_STAT                                  AS SCD_STAT   /* 스케쥴상태코드(Update) */
--                                  , 'I'                                       AS COMM_DVSN  /* 처리구분(I, U, D) */
--                                  , '11'                                      AS RECP_TP1    /* 청구구분 */
--                                  , A.RECP_NU                                               /* 청구회차 */
--                                  , B.TOT_DC_PRPT_AMT                         AS SALE_AMT1   /* 매출금액(VAT 포함) */
--                                  , ROUND(B.TOT_DC_PRPT_AMT / 1.1, 0)         AS SALE_NAMT1  /* 원금 */
--                                  , B.TOT_DC_PRPT_AMT - ROUND(B.TOT_DC_PRPT_AMT / 1.1, 0) AS SALE_VAMT1  /* 부가세 */
--                                  , 0                                         AS RECP_AMT1   /* 수납금액(VAT 포함) */
--                                  , A.ARRE_AMT - (SALE_AMT - B.TOT_DC_PRPT_AMT)           AS ARRE_AMT1   /* 연체금액(VAT 포함) */
--                                  , A.DEMD_DT                                               /* 청구일자 */
--                                  , 'N'                                       AS ZLSPR      /* 청구보류 */
--                                  , ''                                        AS RC_DAY     /* 수납일자 */
--                                  , 'N'                                       AS RC_YN      /* 수납여부 */
--                                  , A.TAX_DT                                                /* 세금계산서발행일자(예정) */
--                                  , ''                                        AS TAX_NO     /* 세금계산서번호 */
--                                  , A.ZFB_DAY                                               /* 만기계산기준일 */
--                                  , A.CANCL_DAY                                             /* 중도완납일 */
--                                  , A.CUST_NO                                               /* 고객번호 */
--                                  , A.SALES_GROUP                                           /* 지사 */
--                                  , A.SALES_OFFICE                                          /* 지점 */
--                                  , A.AGENCY_CD                                             /* 장착대리점 */
--                                  , A.BEG_DAY                                               /* 시작일 */
--                                  , A.END_DAY                                               /* 종료일 */
--                                  , 'N'                                       AS DELAY_YN1  /* 연체이자적용여부 */
--                                  , 0                                         AS DELAY_RATE /* 연체이자율 */
--                                  , A.PAY_MTHD                                              /* 결제구분 */
--                                  , A.PAY_DD                                                /* 이체일 */
--                                  , 'Y'                                       AS USE_YN     /* 사용여부 */
--                            FROM    RTSD0109 A
--                                  , (SELECT  ORD_NO
--                                           , (CASE WHEN DC_RATE IS NOT NULL THEN TRUNC((TOT_PRPT_AMT - ((TOT_PRPT_AMT * DC_RATE) * 0.01)) / v_Prpt_Mon, -1)
--                                                   WHEN DC_RATE IS NULL     THEN TRUNC((TOT_PRPT_AMT - (TOT_PRPT_AMT - DC_AMT)) / v_Prpt_Mon, -1)
--                                              END
--                                             ) AS TOT_DC_PRPT_AMT
--                                     FROM    (SELECT  A.ORD_NO
--                                                    , SUM(NVL(A.ARRE_AMT,0)) AS TOT_PRPT_AMT /* 총 선납금 */
--                                                    , MIN(A.SCHD_SEQ) AS START_SEQ    /* 선납시작회차 */
--                                                    , MAX(A.SCHD_SEQ) AS END_SEQ      /* 선납종료회차 */
--                                                    , MAX((SELECT DC_RATE FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_RATE
--                                                    , MAX((SELECT DC_AMT  FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_AMT
--                                                    , MAX((SELECT SUM(NVL(Y.ARRE_AMT, 0))
--                                                           FROM   RTSD0109 Y
--                                                           WHERE  Y.ORD_NO   = v_Ord_No
--                                                           AND    Y.ARRE_AMT > 0
--                                                           AND    Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                                                           AND    Y.SCD_STAT = 'S'))                          AS ARRE_AMT /* 연체금 */
--                                              FROM    RTSD0109 A
--                                              WHERE   A.ORD_NO   = v_Ord_No
--                                              AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                                              AND     A.RC_YN    = 'N'
--                                              AND     A.SALE_AMT > 0
--                                              AND     A.ARRE_AMT > 0
--                                              AND     A.USE_YN   = 'Y'
--                                              AND     A.SCD_STAT = 'S'
--                                              AND     ROWNUM    <= v_Prpt_Mon
--                                              GROUP BY A.ORD_NO
--                                             )
--                                    )        B
--                            WHERE   A.ORD_NO   = v_Ord_No
--                            AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                            AND     A.RC_YN    = 'N'
--                            AND     A.SALE_AMT > 0
--                            AND     A.ARRE_AMT > 0
--                            AND     A.USE_YN   = 'Y'
--                            AND     A.SCD_STAT = 'S'
--                            AND     A.ORD_NO   = B.ORD_NO
--                            AND     ROWNUM    <= v_Prpt_Mon    
                          )
        LOOP
--DBMS_OUTPUT.PUT_LINE('RtRE0160.RECP_TP::'||curs_RE0160.RECP_TP || ' |RtRE0160.SCHD_SEQ::'||curs_RE0160.SCHD_SEQ|| ' |RtRE0160.RECP_TP_NM::'||curs_RE0160.RECP_TP_NM||' |RtRE0160.SCHD_SEQ1::'||curs_RE0160.SCHD_SEQ1);
--DBMS_OUTPUT.PUT_LINE('RtRE0160.SCHD_SEQ::'||curs_RE0160.SCHD_SEQ); 
--DBMS_OUTPUT.PUT_LINE('RtRE0160.SCHD_SEQ1::'||curs_RE0160.SCHD_SEQ1);         
            IF curs_RE0160.RECP_TP = '51' THEN 
                -- 선납상세정보 insert
DBMS_OUTPUT.PUT_LINE('Rtsd0109.RECP_TP::'||curs_RE0160.RECP_TP || ' |Rtsd0109.SCHD_SEQ::'||curs_RE0160.SCHD_SEQ|| ' |Rtsd0109.RECP_TP_NM::'||curs_RE0160.RECP_TP_NM||' |Rtsd0109.SCHD_SEQ1::'||curs_RE0160.SCHD_SEQ1);

DBMS_OUTPUT.PUT_LINE('Rtsd0109.ORD_NO::'||curs_RE0160.ORD_NO);

DBMS_OUTPUT.PUT_LINE('Rtsd0109.v_Max_Seq::'||v_Max_Seq);                  
                Pkg_Rtre0160.p_InsertRtre0161PrePymntDtl(v_Prpt_Seq, curs_RE0160.ORD_NO, v_Max_Seq, 
                                                         curs_RE0160.SALE_AMT, curs_RE0160.DC_AMT, v_Reg_Id,
                                                         v_Success_Code,v_Return_Message, v_ErrorText);
         
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '선납상세정보 Insert 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;     
                
                -- 청구스케쥴 Update /*임시로 주석 처리 유라클*/
                Pkg_Rtsd0109.p_UpdateRtsd0109SalesPrpt (curs_RE0160.ORD_NO, curs_RE0160.SCHD_SEQ, 'C', v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);        
                            
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '청구스케쥴 Update 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;     
DBMS_OUTPUT.PUT_LINE('Rtsd0108.RECP_TP::'||curs_RE0160.RECP_TP || ' |Rtsd0108.SCHD_SEQ::'||curs_RE0160.SCHD_SEQ|| ' |Rtsd0108.RECP_TP_NM::'||curs_RE0160.RECP_TP_NM||' |Rtsd0108.SCHD_SEQ1::'||curs_RE0160.SCHD_SEQ1);                
                -- 청구스케쥴 Insert
                Pkg_Rtsd0109.p_IUDRtsd0109 (curs_RE0160.COMM_DVSN, curs_RE0160.ORD_NO, v_Max_Seq, curs_RE0160.RECP_TP1, curs_RE0160.RECP_NU,
                                               curs_RE0160.SCD_STAT, curs_RE0160.SALE_AMT1, curs_RE0160.SALE_NAMT1, curs_RE0160.SALE_VAMT1,
                                               0, curs_RE0160.ARRE_AMT1, curs_RE0160.DEMD_DT, curs_RE0160.ZLSPR, curs_RE0160.RC_DAY,
                                               curs_RE0160.RC_YN, curs_RE0160.TAX_DT, curs_RE0160.TAX_NO, curs_RE0160.ZFB_DAY,
                                               curs_RE0160.CANCL_DAY, curs_RE0160.CUST_NO, curs_RE0160.SALES_GROUP, curs_RE0160.SALES_OFFICE, 
                                               curs_RE0160.AGENCY_CD, curs_RE0160.BEG_DAY, curs_RE0160.END_DAY, curs_RE0160.DELAY_YN1,
                                               curs_RE0160.DELAY_RATE, curs_RE0160.PAY_MTHD, curs_RE0160.PAY_DD, curs_RE0160.USE_YN,
                                               v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);

                IF 0 != v_Success_Code THEN
                    v_Return_Message := '청구스케쥴 Insert 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;   
                
                -- 카드수납상세 INSERT
                Pkg_Rtre0200.p_InsertRtre0201CrdImmWthdrDtl(v_Rcrd_Seq, v_Cust_No, v_Ord_No, v_Ord_No, v_Max_Seq, curs_RE0160.RECP_TP,
                                                            curs_RE0160.ZFB_DAY, curs_RE0160.SALE_AMT, curs_RE0160.ARRE_AMT, v_Reg_Id,
                                                            v_Success_Code,v_Return_Message, v_ErrorText);    
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '선납할인 카드수납내역 상세 처리 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;                                                                           
                
            v_Max_Seq := v_Max_Seq +1; 
            ELSE

    DBMS_OUTPUT.PUT_LINE('Rtre0200.RECP_TP::'||curs_RE0160.RECP_TP || ' |Rtre0200.SCHD_SEQ::'||curs_RE0160.SCHD_SEQ|| ' |Rtre0200.RECP_TP_NM::'||curs_RE0160.RECP_TP_NM||' |Rtre0200.SCHD_SEQ1::'||curs_RE0160.SCHD_SEQ1);            
    DBMS_OUTPUT.PUT_LINE('Rtre0200.v_Max_Seq::'||v_Max_Seq);            
    --DBMS_OUTPUT.PUT_LINE('Rtre0200.SCHD_SEQ1::'||curs_RE0160.SCHD_SEQ1);             
                -- 카드수납상세 INSERT
                Pkg_Rtre0200.p_InsertRtre0201CrdImmWthdrDtl(v_Rcrd_Seq, v_Cust_No, v_Ord_No, v_Ord_No, curs_RE0160.SCHD_SEQ1, curs_RE0160.RECP_TP,
                                                            curs_RE0160.ZFB_DAY, curs_RE0160.SALE_AMT, curs_RE0160.ARRE_AMT, v_Reg_Id,
                                                            v_Success_Code,v_Return_Message, v_ErrorText);

                IF 0 != v_Success_Code THEN
                    v_Return_Message := '선납할인 카드수납내역 상세 처리 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;  
               
            END IF;
            
            
        END LOOP;    
    
        -- 카드수납처리
        Pkg_Rtre0200.p_CreateRtre0200RcrdReceive(v_Tno, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
                
        IF 0 != v_Success_Code THEN
            v_Return_Message := '선납할인 카드수납 정보 처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;     
    
    ELSE

        -- 카드수납내역 순번 채번
        v_Rcrd_Seq := f_sRtre0200RcrdSeq(); 
    
        -- 매출이 없으면 선수금 처리
        SELECT  COUNT(*)
        INTO    ln_Chk_Cnt
        FROM    RTSD0109
        WHERE   CUST_NO  = v_Cust_No
        AND     SCD_STAT = 'S'
        AND     ZLSPR    = 'N'
        AND     RC_YN   <> 'Y'
        AND     USE_YN   = 'Y'
        AND     ZFB_DAY  <= v_Recv_Day
        AND     ORD_NO   = v_Ord_No;        
        
        IF ln_Chk_Cnt = 0 THEN
        
            -- 카드수납내역 INSERT (선수금)
            Pkg_Rtre0200.p_InsertRtre0200CrdImmWthdrMst(v_Rcrd_Seq, v_Ord_No, v_Cust_No, v_Recp_Amt, '90', 'P7',
                                                        '01', v_Tno, v_App_No, v_Recv_Seq, 'N', v_Reg_Id,
                                                        v_Success_Code,v_Return_Message, v_ErrorText);
                                                        
            IF 0 != v_Success_Code THEN
                v_Return_Message := '카드수납내역 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;        
        
            -- 카드수납처리
            Pkg_Rtre0200.p_CreateRtre0200RcrdReceive(v_Tno, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
                    
            IF 0 != v_Success_Code THEN
                v_Return_Message := '카드수납 정보 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;        
        
        ELSE

            IF v_Work_Cd = 'PNLT' THEN
            
                -- 카드수납내역 INSERT (선수금)
                Pkg_Rtre0200.p_InsertRtre0200CrdImmWthdrMst(v_Rcrd_Seq, v_Ord_No, v_Cust_No, v_Recp_Amt, '42', 'P7',
                                                            '01', v_Tno, v_App_No, v_Recv_Seq, 'N', v_Reg_Id,
                                                            v_Success_Code,v_Return_Message, v_ErrorText);
                                                            
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '위약금 카드수납내역 처리 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;           
                
                -- 카드수납처리
                Pkg_Rtre0200.p_CreateRtre0200RcrdReceive(v_Tno, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
                        
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '위약금 카드수납 정보 처리 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;                   
            
            ELSE

                -- 카드수납내역 INSERT (선수금)
                Pkg_Rtre0200.p_InsertRtre0200CrdImmWthdrMst(v_Rcrd_Seq, v_Ord_No, v_Cust_No, v_Recp_Amt, '11', 'P7',
                                                            '01', v_Tno, v_App_No, v_Recv_Seq, 'N', v_Reg_Id,
                                                            v_Success_Code,v_Return_Message, v_ErrorText);
                                                            
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '카드수납내역 처리 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;        
                
                -- 매출이 있는 경우 수납금액만큼 카드수납상세 테이블에 INSERT
                v_Remain_Amt := v_Recp_Amt;
                            
                -- 창구스케쥴에서 카드수납대상 상세 INSERT
                FOR curs_RE0201 IN(SELECT  SCHD_SEQ, ARRE_AMT, SALE_AMT, RECP_TP, ZFB_DAY
                                  FROM    RTSD0109
                                  WHERE   CUST_NO  = v_Cust_No
                                  AND     SCD_STAT = 'S'
                                  AND     ZLSPR    = 'N'
                                  AND     RC_YN   <> 'Y'
                                  AND     USE_YN   = 'Y'
                                  AND     ZFB_DAY  <= v_Recv_Day
                                  AND     ORD_NO   = v_Ord_No
                                  ORDER BY  DEMD_DT
                                          , RECP_TP
                                 )
                LOOP    

                    IF v_Remain_Amt > 0 THEN
                    
                        v_Remain_Amt := v_Remain_Amt - curs_RE0201.ARRE_AMT;
                        
                        -- 카드수납상세 INSERT
                        Pkg_Rtre0200.p_InsertRtre0201CrdImmWthdrDtl(v_Rcrd_Seq, v_Cust_No, v_Ord_No, v_Ord_No, curs_RE0201.SCHD_SEQ, curs_RE0201.RECP_TP,
                                                                    curs_RE0201.ZFB_DAY, curs_RE0201.SALE_AMT, curs_RE0201.ARRE_AMT, v_Reg_Id,
                                                                    v_Success_Code,v_Return_Message, v_ErrorText);

                        IF 0 != v_Success_Code THEN
                            v_Return_Message := '선납할인 카드수납내역 상세 처리 실패!!'||'-'||v_Return_Message;
                            v_ErrorText := v_ErrorText;
                            RAISE e_Error;
                        END IF;                  
                    
                    END IF;
                    
                END LOOP;

                -- 카드수납처리
                Pkg_Rtre0200.p_CreateRtre0200RcrdReceive(v_Tno, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
                        
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '카드수납 정보 처리 실패!!'||'-'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF; 
            
            END IF; 
                        
        END IF;
    
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 카드즉시출금 수납처리되었습니다';
    v_ErrorText      := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_CreateRtre0200RcrdReceive(1)', v_ErrorText, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_CreateRtre0200RcrdReceive(2)', v_ErrorText, v_Return_Message);
    END p_InsertRtre0200TotCrdRecvMng;    

/*****************************************************************************
 -- 카드즉시출금 환불처리 메니져
 --
 *****************************************************************************/
    PROCEDURE p_Rtre0200TotCrdRecvRfndMng(  v_Recv_Day       IN  VARCHAR2      /*수납일자  */
                                          , v_Ord_No         IN  VARCHAR2      /* 계약번호 */
                                          , v_Cust_No        IN  VARCHAR2      /* 고객번호 */
                                          , v_Panc_Remn_Amt  IN  VARCHAR2      /* 수납취소후남은금액 */
                                          , v_Recv_Seq       IN  VARCHAR2      /* 수납거래번호 */
                                          , v_Prpt_Seq       IN  VARCHAR2      /* 선납순번 */
                                          , v_Work_Cd        IN  VARCHAR2
                                          , v_Tno            IN  VARCHAR2      /* 거래고유번호 */
                                          , v_Reg_Id         IN  VARCHAR2      /* 등록자 ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_ErrorText      OUT VARCHAR2
                                         )
    IS

    v_Cnc_Recv_Seq        RTRE0030.RECV_SEQ%TYPE;               /* 수납취소거래번호*/
    v_Refund_Yn           RTRE0200.REFUND_YN%TYPE;              /* 환불여부 */  
    v_Mfp_Recv_Seq        RTRE0030.RECV_SEQ%TYPE DEFAULT NULL;  /*중도완납 선수금 거래번호          */
    v_Mfp_Ritm_Seq        RTRE0030.RITM_SEQ%TYPE DEFAULT NULL;  /*중도완납 선수금 거래번호순번          */


    Ref_Cursor    SYS_REFCURSOR;

    e_Error       EXCEPTION;

    BEGIN

    Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_Rtre0200TotCrdRecvRfndMng(test01)', 'v_Recv_Day', v_Recv_Day);
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_Rtre0200TotCrdRecvRfndMng(test02)', 'v_Ord_No', v_Ord_No);
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_Rtre0200TotCrdRecvRfndMng(test03)', 'v_Cust_No', v_Cust_No);
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_Rtre0200TotCrdRecvRfndMng(test04)', 'v_Panc_Remn_Amt', v_Panc_Remn_Amt);
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_Rtre0200TotCrdRecvRfndMng(test05)', 'v_Recv_Seq', v_Recv_Seq);
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_Rtre0200TotCrdRecvRfndMng(test06)', 'v_Prpt_Seq', v_Prpt_Seq);
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_Rtre0200TotCrdRecvRfndMng(test07)', 'v_Work_Cd', v_Work_Cd);
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_Rtre0200TotCrdRecvRfndMng(test08)', 'v_Tno', v_Tno);
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_Rtre0200TotCrdRecvRfndMng(test09)', 'v_Reg_Id', v_Reg_Id);

    -- 필수값: 수납일자 , 계약번호 , 고객번호 ,수납금액 ,  수납방법 , 연체금액, 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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
           
    IF TRIM(v_Panc_Remn_Amt) IS NULL THEN
        v_Return_Message := '수납금액('||v_Panc_Remn_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;       
    
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;       
    
    -- 수납취소거래번호 채번 
    v_Cnc_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();
    
    -- 중도완납이중출금 환불처리
    IF v_Work_Cd = 'MFP' THEN 
    
        -- 수납취소
        Pkg_Rtre0030.p_InsertRtre0030Cancel ( v_Recv_Day, v_Recv_Seq, v_Ord_No, v_Cust_No, v_Cnc_Recv_Seq, 
                                              v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText );
                                                       
        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도완납 수납취소 처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;                                                        
        
        -- 남은금액이 0이면 전체환불, 0이상이면 부분환불
        IF v_Panc_Remn_Amt = '-1'  THEN
            v_Refund_Yn := 'Y';
            
            -- 카드수납내역에 환불 후 남은금액 update
            Pkg_Rtre0200.p_UpdateRtre0200CrdCancel ( v_Recv_Day, v_Recv_Seq, v_Cnc_Recv_Seq, v_Tno, 0,
                                                     v_Refund_Yn, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText );
        
            IF 0 != v_Success_Code THEN
                v_Return_Message := '중도완납 전체환불금액 UPDATE 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;     
                    
        ELSE
            v_Refund_Yn := 'P';
            
            -- 카드수납내역에 환불 후 남은금액 update
            Pkg_Rtre0200.p_UpdateRtre0200CrdCancel ( v_Recv_Day, v_Recv_Seq, v_Cnc_Recv_Seq, v_Tno, v_Panc_Remn_Amt,
                                                     v_Refund_Yn, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText );
        
    dbms_output.put_line('카드수나취소및금액update v_Return_Message == '||v_Return_Message);       
    dbms_output.put_line('카드수나취소및금액update v_Success_Code == '||v_Success_Code); 
            IF 0 != v_Success_Code THEN
                v_Return_Message := '중도완납 부분환불금액 UPDATE 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;                
            
            -- 환불 후 남은금액으로 수납 재처리
            Pkg_Rtre0200.p_CreateRtre0200RcrdReceive(v_Tno, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
            
    dbms_output.put_line('환불 후 남은금액으로 수납 재처리 v_Return_Message == '||v_Return_Message);       
    dbms_output.put_line('환불 후 남은금액으로 수납 재처리 v_Success_Code == '||v_Success_Code);             
            IF 0 != v_Success_Code THEN
                v_Return_Message := '중도완납 카드재수납 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;  
            
            -- 이중출금된 선수금 정리
            SELECT RECV_SEQ, RITM_SEQ
              INTO v_Mfp_Recv_Seq, v_Mfp_Ritm_Seq
              FROM RTRE0035
             WHERE 1=1
               AND ORD_NO = v_Ord_No
               AND PND_STAT != 'S';            
            
            -- 선수금정리
            Pkg_Rtre0035.p_UpdateRtre0035MfpPartClear ( TO_CHAR(SYSDATE, 'YYYYMMDD'), v_Ord_No, v_Cust_No, v_Mfp_Recv_Seq, v_Mfp_Ritm_Seq, 
                                                        'P', v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText );    
                                                        
    dbms_output.put_line('중도완납 선수금 처리 실패 v_Return_Message == '||v_Return_Message);       
    dbms_output.put_line('중도완납 선수금 처리 실패 v_Success_Code == '||v_Success_Code);                                                          
            IF 0 != v_Success_Code THEN
                v_Return_Message := '중도완납 선수금 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF; 
                        
        END IF; 
        
    -- 선납할인    
    ELSIF v_Work_Cd = 'PRPT' THEN

        -- 수납취소
        Pkg_Rtre0030.p_InsertRtre0030Cancel ( v_Recv_Day, v_Recv_Seq, v_Ord_No, v_Cust_No, v_Cnc_Recv_Seq, 
                                              v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText );
                                                           
        IF 0 != v_Success_Code THEN
            v_Return_Message := '선납할인 전체수납취소 처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;   
        
        -- 중도완납 취소UPDATE        
        Pkg_Rtre0160.p_UpdateRtre0160CancelPrpt(v_Ord_No, v_Prpt_Seq, v_Cnc_Recv_Seq, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        
        IF 0 != v_Success_Code THEN
            v_Return_Message := '선납할인이력 취소처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;         

        
        -- 선납청구스케쥴 변경대상 SELECT
        FOR curs_RE0161 IN(
                            SELECT  A.ORD_NO                                                /* 계약번호 */
                                  , C.SCHD_SEQ                                AS SCHD_SEQ_U /* 청구순번 Update */
                                  , PKG_RTSD0109.f_sRtsd0109SchdSeq(A.ORD_NO) AS SCHD_SEQ_I /* 청구순번 Insert */
                                  , 'C'                                       AS SCD_STAT_U /* 스케쥴상태코드(Update) */
                                  , 'I'                                       AS COMM_DVSN  /* 처리구분(I, U, D) */
                                  , '11'                                      AS RECP_TP    /* 청구구분 */
                                  , C.RECP_NU                                               /* 청구회차 */
                                  , 'S'                                       AS SCD_STAT_I /* 스케쥴상태코드(Insert) */
                                  , (B.SALE_AMT + B.PRPT_SEQ_DCAMT)           AS SALE_AMT   /* 매출금액(VAT 포함) */
                                  , ROUND((B.SALE_AMT + B.PRPT_SEQ_DCAMT) / 1.1, 0)                                   AS SALE_NAMT /* 원금 */
                                  , (B.SALE_AMT + B.PRPT_SEQ_DCAMT) - ROUND((B.SALE_AMT + B.PRPT_SEQ_DCAMT) / 1.1, 0) AS SALE_VAMT /* 부가세 */
                                  , 0                                         AS RECP_AMT   /* 수납금액(VAT 포함) */
                                  , (B.SALE_AMT + B.PRPT_SEQ_DCAMT)           AS ARRE_AMT   /* 연체금액(VAT 포함) */
                                  , C.DEMD_DT                                               /* 청구일자 */
                                  , 'N'                                       AS ZLSPR      /* 청구보류 */
                                  , ''                                        AS RC_DAY     /* 수납일자 */
                                  , 'N'                                       AS RC_YN      /* 수납여부 */
                                  , C.TAX_DT                                                /* 세금계산서발행일자(예정) */
                                  , ''                                        AS TAX_NO     /* 세금계산서번호 */
                                  , C.ZFB_DAY                                               /* 만기계산기준일 */
                                  , C.CANCL_DAY                                             /* 중도완납일 */
                                  , A.CUST_NO                                               /* 고객번호 */
                                  , C.SALES_GROUP                                           /* 지사 */
                                  , C.SALES_OFFICE                                          /* 지점 */
                                  , C.AGENCY_CD                                             /* 장착대리점 */
                                  , C.BEG_DAY                                               /* 시작일 */
                                  , C.END_DAY                                               /* 종료일 */
                                  , 'N'                                       AS DELAY_YN   /* 연체이자적용여부 */
                                  , 0                                         AS DELAY_RATE /* 연체이자율 */
                                  , C.PAY_MTHD                                              /* 결제구분 */
                                  , C.PAY_DD                                                /* 이체일 */
                                  , 'Y'                                       AS USE_YN     /* 사용여부 */
                            FROM    RTRE0160 A
                                  , RTRE0161 B
                                  , RTSD0109 C
                            WHERE   A.ORD_NO   = B.ORD_NO
                            AND     A.PRPT_SEQ = B.PRPT_SEQ
                            AND     A.ORD_NO   = C.ORD_NO
                            AND     B.SCHD_SEQ = C.SCHD_SEQ
                            AND     A.ORD_NO   = v_Ord_No
                            AND     A.PRPT_SEQ = v_Prpt_Seq                
                         )
        LOOP  
            
            Pkg_Rtsd0109.p_UpdateRtsd0109SalesPrpt(v_Ord_No, curs_RE0161.SCHD_SEQ_U, curs_RE0161.SCD_STAT_U, v_Reg_Id,
                                                   v_Success_Code,v_Return_Message, v_ErrorText);
        
            IF 0 != v_Success_Code THEN
                v_Return_Message := '선납할인 매출취소 UPDATE 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;  

            -- 청구스케쥴 Insert
            Pkg_Rtsd0109.p_IUDRtsd0109 (curs_RE0161.COMM_DVSN, curs_RE0161.ORD_NO, curs_RE0161.SCHD_SEQ_I, curs_RE0161.RECP_TP, curs_RE0161.RECP_NU,
                                           curs_RE0161.SCD_STAT_I, curs_RE0161.SALE_AMT, curs_RE0161.SALE_NAMT, curs_RE0161.SALE_VAMT,
                                           0, curs_RE0161.ARRE_AMT, curs_RE0161.DEMD_DT, curs_RE0161.ZLSPR, curs_RE0161.RC_DAY,
                                           curs_RE0161.RC_YN, curs_RE0161.TAX_DT, curs_RE0161.TAX_NO, curs_RE0161.ZFB_DAY,
                                           curs_RE0161.CANCL_DAY, curs_RE0161.CUST_NO, curs_RE0161.SALES_GROUP, curs_RE0161.SALES_OFFICE, 
                                           curs_RE0161.AGENCY_CD, curs_RE0161.BEG_DAY, curs_RE0161.END_DAY, curs_RE0161.DELAY_YN,
                                           curs_RE0161.DELAY_RATE, curs_RE0161.PAY_MTHD, curs_RE0161.PAY_DD, curs_RE0161.USE_YN,
                                           v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);

            IF 0 != v_Success_Code THEN
                v_Return_Message := '선납할인 청구스케쥴 Insert 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;   
                    
        END LOOP;

        -- 전체환불이면 v_Panc_Remn_Amt가 -1로 인입됨
        IF v_Panc_Remn_Amt = '-1'  THEN

            -- 전체환불            
            v_Refund_Yn := 'Y';
            
            -- 카드수납내역에 환불 후 남은금액 update
            Pkg_Rtre0200.p_UpdateRtre0200CrdCancel ( v_Recv_Day, v_Recv_Seq, v_Cnc_Recv_Seq, v_Tno, 0,
                                                     v_Refund_Yn, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText );
                                                     
            IF 0 != v_Success_Code THEN
                v_Return_Message := '선납할인 전체환불금액 UPDATE 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;                                                            
        
        ELSE
            -- 부분환불            
            v_Refund_Yn := 'P';
            
            -- 카드수납내역에 환불 후 남은금액 update
            Pkg_Rtre0200.p_UpdateRtre0200CrdCancel ( v_Recv_Day, v_Recv_Seq, v_Cnc_Recv_Seq, v_Tno, v_Panc_Remn_Amt,
                                                     v_Refund_Yn, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText );
        
            IF 0 != v_Success_Code THEN
                v_Return_Message := '선납할인 환부분불금액 UPDATE 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;         
            
            -- 환불 후 남은금액으로 수납 재처리
            Pkg_Rtre0200.p_CreateRtre0200RcrdReceive(v_Tno, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
            
            IF 0 != v_Success_Code THEN
                v_Return_Message := '선납할인 카드재수납 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;                     
        
        END IF;
    
    ELSE
    
        -- 전체환불이면 v_Panc_Remn_Amt가 -1로 인입됨
         IF v_Panc_Remn_Amt = '-1'  THEN
            -- 전체환불
            v_Refund_Yn := 'Y';
            
            -- 카드수납내역에 환불 후 남은금액 update
            Pkg_Rtre0200.p_UpdateRtre0200CrdCancel ( v_Recv_Day, v_Recv_Seq, v_Cnc_Recv_Seq, v_Tno, 0,
                                                     v_Refund_Yn, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText );
        
            IF 0 != v_Success_Code THEN
                v_Return_Message := '전체 환불금액 UPDATE 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;            
            
        ELSE
            -- 부분환불
            v_Refund_Yn := 'P';

            -- 카드수납내역에 환불 후 남은금액 update
            Pkg_Rtre0200.p_UpdateRtre0200CrdCancel ( v_Recv_Day, v_Recv_Seq, v_Cnc_Recv_Seq, v_Tno, v_Panc_Remn_Amt,
                                                     v_Refund_Yn, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText );
        
            IF 0 != v_Success_Code THEN
                v_Return_Message := '부분 환불금액 UPDATE 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;  
            
            -- 환불 후 남은금액으로 수납 재처리
            Pkg_Rtre0200.p_CreateRtre0200RcrdReceive(v_Tno, v_Reg_Id, v_Success_Code,v_Return_Message, v_ErrorText);
            
            IF 0 != v_Success_Code THEN
                v_Return_Message := '카드재수납 처리 실패!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;              
            
        END IF;     
    
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 카드즉시출금 환불처리 되었습니다';
    v_ErrorText      := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_CreateRtre0200RcrdReceive(1)', v_ErrorText, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_CreateRtre0200RcrdReceive(2)', v_ErrorText, v_Return_Message);
    END p_Rtre0200TotCrdRecvRfndMng;    


/*******************************************************************************
  -- 카드즉시출금결제이력 Insert (수납 - 항상)
 *******************************************************************************/
    PROCEDURE p_InsertRtre0205CrdHst(  v_Tord_No        IN  VARCHAR2    /* 통합청구계약번호 */
                                     , v_Cust_No        IN  VARCHAR2    /* 고객번호 */
                                     , v_Recp_Amt       IN  VARCHAR2   /* 수납금액 */
                                     , v_Email          IN  VARCHAR2      /* 주문자 E-Mail */
                                     , v_Tno            IN  VARCHAR2        /* 거래번호 */
                                     , v_Sec_Crd_No     IN  VARCHAR2 /* 카드번호 */
                                     , v_Crd_Cd         IN  VARCHAR2     /* 카드사코드 */
                                     , v_Crd_Nm         IN  VARCHAR2     /* 카드사명 */
                                     , v_App_Time       IN  VARCHAR2   /* 결제승인시간 */
                                     , v_App_No         IN  VARCHAR2    /* 승인번호 */
                                     , v_Noinf          IN  VARCHAR2     /* 무이자할부여부 */
                                     , v_Noinf_Type     IN  VARCHAR2 /* 무이자할부 이벤트 구분 */
                                     , v_Quota          IN  VARCHAR2      /* 할부개월 */
                                     , v_Res_Cd         IN  VARCHAR2     /* 결과코드 */
                                     , v_Res_Msg        IN  VARCHAR2    /* 결과내용 */
                                     , v_Reg_Id         IN  VARCHAR2     /* 등록자 ID */
                                     , v_Success_Code   OUT NUMBER
                                     , v_Return_Message OUT VARCHAR2
                                     , v_Error_Text     OUT VARCHAR2
                                    )
    IS

    e_Error EXCEPTION;


    BEGIN
        INSERT INTO RTRE0205(  RCRD_DAY
                             , RCRD_SEQ
                             , TORD_NO
                             , CUST_NO
                             , RECP_AMT
                             , EMAIL
                             , TNO
                             , CRD_NO
                             , CRD_CD
                             , CRD_NM
                             , APP_TIME
                             , APP_NO
                             , NOINF
                             , NOINF_TYPE
                             , QUOTA
                             , RES_CD
                             , RES_MSG
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , (
                             SELECT NVL(MAX(RCRD_SEQ), 0) + 1
                               FROM RTRE0205
                              WHERE RCRD_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD')
                             )
                             , v_Tord_No
                             , v_Cust_No
                             , v_Recp_Amt
                             , v_Email
                             , v_Tno
                             , v_Sec_Crd_No
                             , v_Crd_Cd
                             , v_Crd_Nm
                             , v_App_Time
                             , v_App_No
                             , v_Noinf
                             , v_Noinf_Type
                             , v_Quota
                             , v_Res_Cd
                             , v_Res_Msg
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
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_Error_Text);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0205CrdHst(1)', v_Error_Text, v_Return_Message);
        
      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0205CrdHst(2)', v_Error_Text, v_Return_Message);
        
    END p_InsertRtre0205CrdHst;


/*******************************************************************************
  -- 카드즉시출금취소이력 Insert (환불 - 항상)
 *******************************************************************************/
    PROCEDURE p_InsertRtre0206CrdHst(  v_Tno            IN  VARCHAR2      /* 거래번호 */
                                       , v_Mod_Type       IN  VARCHAR2 /* 요청종류 */
                                       , v_Mod_Mny        IN  VARCHAR2  /* 취소요청금액 */
                                       , v_Rem_Mny        IN  VARCHAR2  /* 취소가능금액 */
                                       , v_Mod_Desc       IN  VARCHAR2 /* 취소사유 */
                                       , v_Res_Cd         IN  VARCHAR2   /* 결과코드 */
                                       , v_Res_Msg        IN  VARCHAR2  /* 결과내용 */
                                       , v_Reg_Id         IN  VARCHAR2   /* 등록자 ID */
                                       , v_Success_Code   OUT NUMBER
                                       , v_Return_Message OUT VARCHAR2
                                       , v_Error_Text     OUT VARCHAR2
                                      )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0206(  TNO
                             , CNC_SEQ
                             , MOD_TYPE
                             , MOD_MNY
                             , REM_MNY
                             , MOD_DESC
                             , RES_CD
                             , RES_MSG
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  v_Tno
                             , (
                             SELECT NVL(MAX(CNC_SEQ), 0) + 1
                               FROM RTRE0206
                              WHERE TNO = v_Tno
                             )
                             , v_Mod_Type
                             , v_Mod_Mny
                             , v_Rem_Mny
                             , v_Mod_Desc
                             , v_Res_Cd
                             , v_Res_Msg
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
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_Error_Text);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0206CrdHst(1)', v_Error_Text, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0206CrdHst(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0206CrdHst;
    
/*******************************************************************************
 -- 카드즉시출금결제 카드정보 Insert (수납 - 성공)
 *******************************************************************************/
    PROCEDURE p_InsertRtre0202CrdHst(  v_Tno            IN  VARCHAR2        /* 거래번호 */
                                     , v_Sec_Crd_No     IN  VARCHAR2 /* 카드번호 */
                                     , v_Crd_Cd         IN  VARCHAR2     /* 카드사코드 */
                                     , v_Reg_Id         IN  VARCHAR2     /* 등록자 ID */
                                     , v_Success_Code   OUT NUMBER
                                     , v_Return_Message OUT VARCHAR2
                                     , v_Error_Text     OUT VARCHAR2
                                    )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0202(  TNO
                             , CRD_NO
                             , CRD_CD
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  v_Tno
                             , v_Sec_Crd_No
                             , v_Crd_Cd
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
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0202CrdHst(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0200.p_InsertRtre0202CrdHst(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0202CrdHst;
    

END Pkg_Rtre0200;
/