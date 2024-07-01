CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0210 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0210
    PURPOSE : 계좌즉시출금 내역조회
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-11-05  ncho             1. Created this package body.
 *******************************************************************************/

/*******************************************************************************
 -- 계좌즉시출금 내역조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0210_accImmWthdrList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                          , v_Ract_F_Day IN RTRE0210.RACT_DAY%TYPE /* 수납일자 StartDay */
                                          , v_Ract_T_Day IN RTRE0210.RACT_DAY%TYPE /* 수납일자 EndDay */
                                          , v_Ord_No     IN RTRE0210.TORD_NO%TYPE  /* 통합청구계약번호 */
                                          , v_Cust_No    IN RTRE0210.CUST_NO%TYPE  /* 고객번호 */
                                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A.RACT_DAY                                                        /* 계좌수납일자 */
                  , A.RACT_SEQ                                                        /* 계좌수납 순번 */
                  , A.TORD_NO                                                         /* 통합청구계약번호 */
                  , A.CUST_NO                                                         /* 고객번호 */
                  , Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO)         AS CUST_NM    /* 고객명 */
                  , A.RECP_TP                                                         /* 청구구분코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R007', A.RECP_TP) AS RECP_TP_NM /* 청구구분명 */
                  , A.TNO                                                             /* 거래번호 */
                  , B.BNK_CD                                                          /* 은행코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R001', B.BNK_CD)  AS BNK_NM     /* 은행명 */
                  , A.RECP_AMT                                                        /* 수납금액 */
                  , A.CNC_STAT                                                        /* 수납취소여부 */
                  , A.PRT_CNC_RMNN_AMT                                                /* 수납취소 후 남은금액 */
                  , A.RECV_SEQ                                                        /* 수납거래번호 */
                  , A.CNC_RSEQ                                                        /* 수납취소거래번호 */
                  , A.REFUND_YN                                                       /* 환불여부  */
                  , A.P_OID_SEQ                                                       /* 주문일련번호 */
            FROM    RTRE0210 A /* 계좌즉시출금 수납내역 */
                  , RTRE0212 B /* 계좌즉시출금 계좌정보 */
            WHERE   A.TNO            = B.TNO
            AND     A.RACT_DAY BETWEEN v_Ract_F_Day
                               AND     v_Ract_T_Day
            AND     A.TORD_NO        = DECODE(v_Ord_No,  NULL, A.TORD_NO, v_Ord_No)
            AND     A.CUST_NO        = DECODE(v_Cust_No, NULL, A.CUST_NO, v_Cust_No);
    END p_sRtre0210_accImmWthdrList;

/*******************************************************************************
 -- 수납내역 상세조회 Select
 *******************************************************************************/
    PROCEDURE p_sRtre0210_accImmWthdrDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
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
            FROM    RTRE0030 A /* 계좌즉시출금 상세수납내역 */
            WHERE   A.RECV_SEQ = v_Recv_Seq
            ORDER BY  A.ORD_NO
                    , A.SCHD_SEQ;
    END p_sRtre0210_accImmWthdrDtlList;

/*******************************************************************************
 -- 계좌수납일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0210RactSeq
    
    RETURN NUMBER

    IS

    v_Ract_Seq RTRE0210.RACT_SEQ%TYPE DEFAULT 0; /* 계좌수납일련번호 */

    BEGIN

        SELECT NVL2(MAX(RACT_SEQ), TO_NUMBER(MAX(RACT_SEQ)) + 1, 1)
        INTO   v_Ract_Seq
        FROM   RTRE0210
        WHERE  RACT_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD');
    
    RETURN v_Ract_Seq;

    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0210RactSeq;

/*******************************************************************************
 -- 계좌주문일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0210POidSeq(v_Tord_No IN RTRE0210.TORD_NO%TYPE) /* 계약번호 */
    
    RETURN NUMBER
    
    IS
    
    v_P_Oid_Seq RTRE0210.P_OID_SEQ%TYPE DEFAULT 0; /* 계좌주문일련번호 */
    
    BEGIN
        SELECT NVL2(MAX(P_OID_SEQ), TO_NUMBER(MAX(P_OID_SEQ)) + 1, 1)
        INTO   v_P_Oid_Seq
        FROM   RTRE0210
        WHERE  TORD_NO = v_Tord_No;
    
    RETURN v_P_Oid_Seq;
    
    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0210POidSeq;

/*******************************************************************************
 -- 계좌즉시출금결제 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0210AccImmWthdrMst(  v_Ract_Seq       IN  RTRE0210.RACT_SEQ%TYPE  /* 계좌수납일련번호 */
                                             , v_Tord_No        IN  RTRE0210.TORD_NO%TYPE   /* 통합청구계약번호 */
                                             , v_Cust_No        IN  RTRE0210.CUST_NO%TYPE   /* 고객번호 */
                                             , v_Recp_Amt       IN  RTRE0210.RECP_AMT%TYPE  /* 수납금액 */
                                             , v_Recp_Tp        IN  RTRE0210.RECP_TP%TYPE   /* 청구구분 */
                                             , v_Recp_Pay       IN  RTRE0210.RECP_PAY%TYPE  /* 수납방법 */
                                             , v_Recp_Fg        IN  RTRE0210.RECP_FG%TYPE   /* 수납유형 */
                                             , v_Tno            IN  RTRE0210.TNO%TYPE       /* 거래번호 */
                                             , v_Recv_Seq       IN  RTRE0210.RECV_SEQ%TYPE  /* 계좌수납거래번호 */
                                             , v_Cnc_Stat       IN  RTRE0210.CNC_STAT%TYPE  /* 수납취소여부 */
                                             , v_P_Oid_Seq      IN  RTRE0210.P_OID_SEQ%TYPE /* 주문일련번호 */
                                             , v_Reg_Id         IN  RTRE0210.REG_ID%TYPE    /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0210(  RACT_DAY
                             , RACT_SEQ
                             , TORD_NO
                             , CUST_NO
                             , RECP_AMT
                             , RECP_TP
                             , RECP_PAY
                             , RECP_FG
                             , TNO
                             , RECV_SEQ
                             , CNC_RSEQ
                             , CNC_TNO
                             , CNC_STAT
                             , PRT_CNC_RMNN_AMT
                             , P_OID_SEQ
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Ract_Seq
                             , v_Tord_No
                             , v_Cust_No
                             , v_Recp_Amt
                             , v_Recp_Tp
                             , v_Recp_Pay
                             , v_Recp_Fg
                             , v_Tno
                             , v_Recv_Seq
                             , ''
                             , ''
                             , v_Cnc_Stat
                             , v_Recp_Amt
                             , v_P_Oid_Seq
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_01', v_Tord_No, v_Tno);                             
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0210AccImmWthdrMst(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0210AccImmWthdrMst(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0210AccImmWthdrMst;

/*******************************************************************************
 -- 계좌즉시출금결제 상세 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0211AccImmWthdrDtl(  v_Ract_Seq       IN  RTRE0211.RACT_SEQ%TYPE /* 계좌수납일련번호 */
                                             , v_Cust_No        IN  RTRE0211.CUST_NO%TYPE  /* 고객번호 */
                                             , v_Tord_No        IN  RTRE0211.TORD_NO%TYPE  /* 통합청구계약번호 */
                                             , v_Ord_No         IN  RTRE0211.ORD_NO%TYPE   /* 계약번호 */
                                             , v_Schd_Seq       IN  RTRE0211.SCHD_SEQ%TYPE /* 청구순번 */
                                             , v_Recp_Tp        IN  RTRE0211.RECP_TP%TYPE  /* 청구구분 */
                                             , v_Zfbdt          IN  RTRE0211.ZFBDT%TYPE    /* 청구일자 */
                                             , v_Sale_Amt       IN  RTRE0211.SALE_AMT%TYPE /* 청구금액 */
                                             , v_Arre_Amt       IN  RTRE0211.ARRE_AMT%TYPE /* 미납금액 */
                                             , v_Reg_Id         IN  RTRE0211.REG_ID%TYPE   /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0211(  RACT_DAY
                             , RACT_SEQ
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
                             , v_Ract_Seq
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
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_02', v_Tord_No, v_Ract_Seq); 
    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0211AccImmWthdrDtl(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0211AccImmWthdrDtl(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0211AccImmWthdrDtl;

/*******************************************************************************
 -- 계좌즉시출금결제 계좌정보 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0212AccImmWthdrAcc(  v_Tno            IN  RTRE0212.TNO%TYPE        /* 거래번호 */
                                             , v_Sec_Bnk_No     IN  RTRE0212.BNK_NO%TYPE /* 계좌번호 */
                                             , v_Bnk_Cd         IN  RTRE0212.BNK_CD%TYPE     /* 은행코드 */
                                             , v_Cust_Nm        IN  RTRE0212.CUST_NM%TYPE    /* 예금주명 */
                                             , v_Reg_Id         IN  RTRE0212.REG_ID%TYPE     /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0212(  TNO
                             , BNK_NO
                             , BNK_CD
                             , CUST_NM
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  v_Tno
                             , v_Sec_Bnk_No
                             , v_Bnk_Cd
                             , v_Cust_Nm
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_03', v_Tno, v_Sec_Bnk_No);                             
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0212AccImmWthdrAcc(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0212AccImmWthdrAcc(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0212AccImmWthdrAcc;

/*****************************************************************************
 -- 계좌즉시출금 수납처리 결과 저장
 *****************************************************************************/
    FUNCTION f_UpdateRTRE0210RecvResult(  v_RACT_Day  IN  RTRE0210.RACT_DAY%TYPE /* 요청일자 */
                                        , v_RACT_Seq  IN  RTRE0210.RACT_SEQ%TYPE /* 요청일련번호 */
                                        , v_Recv_Seq  IN  RTRE0210.RECV_SEQ%TYPE /* 수납거래번호 */
                                        , v_Reg_Id    IN  RTRE0210.REG_ID%TYPE   /* 등록자 ID */
                                        , v_ErrorText OUT VARCHAR2
                                       )
    RETURN NUMBER

    IS

    BEGIN

        UPDATE  RTRE0210
        SET     RECV_SEQ = v_Recv_Seq
              , CHG_ID   = v_Reg_Id
              , CHG_DT   = SYSDATE
        WHERE   RACT_DAY = v_RACT_Day
        AND     RACT_SEQ = v_RACT_Seq;

        RETURN SQLCODE;

    EXCEPTION
        WHEN OTHERS THEN
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RETURN SQLCODE;

    END f_UpdateRTRE0210RecvResult;

/*****************************************************************************
 -- 계좌즉시출금 수납처리
 -- - Pkg_Rtre0080.p_CreateRtre0080CardReceive 를 참조하여 개발
 *****************************************************************************/
    PROCEDURE p_CreateRTRE0210RactReceive(  v_Tno             IN RTRE0210.TNO%TYPE    /* 거래고유번호 */
                                          , v_Reg_Id          IN RTRE0210.REG_ID%TYPE /* 등록자ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_ErrorText      OUT VARCHAR2
                                         )
    IS

    ln_Chk_Cnt    NUMBER;
    ln_Exe_Cnt    NUMBER;

    ln_Remain_Amt RTRE0211.ARRE_AMT%TYPE;
    ln_Tarre_Amt  RTRE0211.ARRE_AMT%TYPE;
    ln_Trecp_Amt  RTRE0211.ARRE_AMT%TYPE;
    ln_Arre_Amt   RTRE0211.ARRE_AMT%TYPE;
    ln_Recp_Amt   RTRE0210.PRT_CNC_RMNN_AMT%TYPE;
    ln_Pend_Amt   RTRE0210.PRT_CNC_RMNN_AMT%TYPE;
    ln_Rear_Amt   RTRE0210.PRT_CNC_RMNN_AMT%TYPE;
    ln_Recv_Seq   RTRE0030.RECV_SEQ%TYPE;
    ln_End_Tp     RTSD0108.END_TP%TYPE;

    lr_Re0210     RTRE0210%ROWTYPE;
    lr_Re0211     RTRE0211%ROWTYPE;

    Ref_Cursor    SYS_REFCURSOR;

    e_Error         EXCEPTION;

    BEGIN
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_04', v_Tno, v_Reg_Id);  
    /*
     * 필수값 입력 확인
     */
    IF(TRIM(v_Tno) IS NULL) OR (TRIM(v_Tno) = '') THEN
        v_Return_Message := '거래고유번호 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 계좌즉시출금내역 존재 여부
    SELECT NVL(COUNT(1), 0)
    INTO   ln_Chk_Cnt
    FROM   RTRE0210
    WHERE  TNO       = v_Tno
    --AND    CNC_STAT <> 'Y';
    AND    REFUND_YN <> 'Y';

    IF ln_Chk_Cnt = 0 THEN
        v_Return_Message := '해당 거래고유번호(' || v_Tno || ')는 유효한 계좌즉시출금내역(RTRE0210)이 존재하지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_05', v_Tno, ln_Chk_Cnt);  
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
                                                   ) ON COMMIT DELETE ROWS;
            COMMENT ON TABLE NXRADMIN.RTTEMP01 IS ''출금이체 수납등록처리(Pkg_Rtre0070)시 사용 TEMPORARY TABLE'';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.ORD_NO   IS ''계약번호'';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.CUST_NO  IS ''고객번호'';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.SCHD_SEQ IS ''청구순번'';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.ARRE_AMT IS ''미납금액 '';
            COMMENT ON COLUMN NXRADMIN.RTTEMP01.RECP_AMT IS ''수납처리금액'';';
    END IF;

    -- 계좌즉시출금 내역 조회
    SELECT *
    INTO   lr_Re0210
    FROM   RTRE0210
    WHERE  TNO       = v_Tno
    --AND    CNC_STAT <> 'Y';
    AND    REFUND_YN <> 'Y';

    ln_Remain_Amt := 0;
    ln_Exe_Cnt    := 1;

    -- 중도완납여부 체크
    IF lr_Re0210.RECP_TP = '90' THEN
        ln_End_Tp := '';
    ELSE 
        SELECT END_TP
        INTO   ln_End_Tp
          FROM RTSD0108
         WHERE 1=1
           AND ORD_NO = lr_Re0210.TORD_NO  ;
       --AND MFP_YN = 'Y';
    END IF;    

    -- 수납거래번호 채번
    -- - CMS, 카드정기출금 : 계약번호별 수납거래번호 채번
    -- - 가상계좌 : 입금통보별 수납거래번호 채번
    ln_Recv_Seq := lr_Re0210.RECV_SEQ;
    --ln_Recv_Seq := Pkg_Rtre0030.f_sRtre0030RecvSeq();

    /*
     * 계좌즉시출금 세부내역 계약별로 LOOP 돌면서 수행
     */
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_06', v_Tno, lr_Re0210.TORD_NO);     
    IF lr_Re0210.RECP_TP = '90'  OR (lr_Re0210.RECP_TP = '42' AND ln_End_Tp = '') THEN
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_07', v_Tno, ln_End_Tp);           
                -- 수납대상리스트에  선수금 데이터 추가(수납금액을 수납처리금액 값에 설정하고 나머지는 NULL 처리함)
        INSERT INTO RTTEMP01
        SELECT lr_Re0210.TORD_NO ORD_NO, NULL SCHD_SEQ, NULL RECP_TP, lr_Re0210.CUST_NO CUST_NO, NULL DEMD_DT, NULL ZFB_DAY, NULL SCD_STAT,
               NULL ZLSPR, NULL RC_YN, NULL USE_YN, NULL SALE_AMT, NULL RECP_AMT, NULL ARRE_AMT, NULL RECP_NU, lr_Re0210.PRT_CNC_RMNN_AMT 
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

        Pkg_Rtre0030.p_InsertRtre0030 (Ref_Cursor, lr_Re0210.RACT_DAY, lr_Re0210.TORD_NO, lr_Re0210.CUST_NO,
                                       0, lr_Re0210.PRT_CNC_RMNN_AMT, lr_Re0210.RECP_PAY, lr_Re0210.RECP_FG, ln_Recv_Seq,
                                       0, lr_Re0210.PRT_CNC_RMNN_AMT, v_Reg_Id, v_Success_Code,
                                       v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '수납내역 생성처리 실패!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSIF ln_End_Tp IN ('E','C')THEN
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_08', v_Tno, ln_End_Tp);       
        ln_Tarre_Amt := lr_Re0210.PRT_CNC_RMNN_AMT;

        IF ln_Exe_Cnt = 1 THEN
            ln_Tarre_Amt := ln_Tarre_Amt + ln_Remain_Amt;
        END IF;

        ln_Trecp_Amt := ln_Tarre_Amt; -- 수납처리 대상 전체금액

        /*
         * 계약별 청구스케쥴 감안하여 처리
         */
        FOR cur_SD0109 IN(SELECT  SCHD_SEQ
                                , ARRE_AMT
                          FROM    RTSD0109
                          WHERE   CUST_NO  = lr_Re0210.CUST_NO
                          AND     SCD_STAT = 'S'
                          AND     ZLSPR    = 'N'
                          AND     RC_YN   <> 'Y'
                          AND     USE_YN   = 'Y'
                          --AND     ZFB_DAY <= lr_Re0210.RACT_DAY
                          --AND     SUBSTR(DEMD_DT, 1, 6) >= SUBSTR(lr_Re0210.RACT_DAY, 1, 6)
                          AND     ORD_NO   = lr_Re0210.TORD_NO
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

            -- 수납대상리스트 임시테이블에 생성
            IF ln_Recp_Amt > 0 THEN
                INSERT INTO RTTEMP01(  ORD_NO   /* 계약번호 */
                                     , CUST_NO  /* 고객번호 */
                                     , SCHD_SEQ /* 청구순번 */
                                     , ARRE_AMT /* 연체금액(VAT포함) */
                                     , RECP_AMT /* 수납금액(VAT포함) */
                                    )
                VALUES              (  lr_Re0210.TORD_NO
                                     , lr_Re0210.CUST_NO
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
            VALUES              (  lr_Re0210.TORD_NO
                                 , lr_Re0210.CUST_NO
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
            AND     ORD_NO   = lr_Re0210.TORD_NO
            AND     CUST_NO  = lr_Re0210.CUST_NO
            ORDER BY NVL(SCHD_SEQ, 999); -- 선수금을 마지막에 위치시킴
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_09', v_Tno, ln_Recp_Amt);   
        -- 수납 처리
        Pkg_Rtre0030.p_InsertRtre0030(  Ref_Cursor
                                      , lr_Re0210.RACT_DAY
                                      , lr_Re0210.TORD_NO
                                      , lr_Re0210.CUST_NO
                                      , v_Reg_Id
                                      , ln_Recp_Amt
                                      , 'P6'
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
            v_Return_Message := '수납내역 생성처리 실패!!(' || lr_Re0210.TORD_NO || ')-' || v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
  
            
    
    ELSE      
        FOR cur_Re0211 IN(SELECT  RACT_DAY
                                , CUST_NO
                                , ORD_NO
                                , SUM(ARRE_AMT) AS ARRE_AMT
                          FROM    RTRE0211
                          WHERE   (RACT_DAY, RACT_SEQ) IN(SELECT  RACT_DAY
                                                                , RACT_SEQ
                                                          FROM    RTRE0210
                                                          WHERE   TNO       = v_Tno
                                                          AND     CNC_STAT <> 'Y'
                                                         )
                          GROUP BY  RACT_DAY
                                  , CUST_NO
                                  , ORD_NO
                         )
        LOOP

            -- 부분환불인 경우에는 환불 후 남은금액으로 셋팅
            IF lr_Re0210.REFUND_YN = 'P' THEN
                ln_Tarre_Amt := lr_Re0210.PRT_CNC_RMNN_AMT;    
                ln_Trecp_Amt := ln_Tarre_Amt;
                IF ln_Exe_Cnt = 1 THEN
                    ln_Tarre_Amt := ln_Tarre_Amt + ln_Remain_Amt;
                END IF;                 
            ELSE
                ln_Tarre_Amt := cur_Re0211.ARRE_AMT;
                IF ln_Exe_Cnt = 1 THEN
                    ln_Tarre_Amt := ln_Tarre_Amt + ln_Remain_Amt;
                END IF;
                ln_Trecp_Amt := ln_Tarre_Amt; -- 수납처리 대상 전체금액                
            END IF;

            /*
             * 계약별 청구스케쥴 감안하여 처리
             */
            FOR cur_SD0109 IN(SELECT  SCHD_SEQ
                                    , ARRE_AMT
                              FROM    RTSD0109
                              WHERE   CUST_NO  = cur_Re0211.CUST_NO
                              AND     SCD_STAT = 'S'
                              AND     ZLSPR    = 'N'
                              AND     RC_YN   <> 'Y'
                              AND     USE_YN   = 'Y'
                              AND     ZFB_DAY <= cur_Re0211.RACT_DAY
                              AND     ORD_NO   = cur_Re0211.ORD_NO
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

                -- 수납대상리스트 임시테이블에 생성
                IF ln_Recp_Amt > 0 THEN
                    INSERT INTO RTTEMP01(  ORD_NO   /* 계약번호 */
                                         , CUST_NO  /* 고객번호 */
                                         , SCHD_SEQ /* 청구순번 */
                                         , ARRE_AMT /* 연체금액(VAT포함) */
                                         , RECP_AMT /* 수납금액(VAT포함) */
                                        )
                    VALUES              (  cur_Re0211.ORD_NO
                                         , cur_Re0211.CUST_NO
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
                VALUES              (  cur_Re0211.ORD_NO
                                     , cur_Re0211.CUST_NO
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
                AND     ORD_NO   = cur_Re0211.ORD_NO
                AND     CUST_NO  = cur_Re0211.CUST_NO
                ORDER BY NVL(SCHD_SEQ, 999); -- 선수금을 마지막에 위치시킴
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_10', v_Tno, ln_Recp_Amt);   
            -- 수납 처리
            Pkg_Rtre0030.p_InsertRtre0030(  Ref_Cursor
                                          , lr_Re0210.RACT_DAY
                                          , cur_Re0211.ORD_NO
                                          , cur_Re0211.CUST_NO
                                          , v_Reg_Id
                                          , ln_Recp_Amt
                                          , 'P6'
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
                v_Return_Message := '수납내역 생성처리 실패!!(' || cur_Re0211.ORD_NO || ')-' || v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            ln_Exe_Cnt := ln_Exe_Cnt + 1;
        END LOOP;
    END IF;
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_11', v_Tno, lr_Re0210.TORD_NO);     
    -- 수납처리 완료후 수납거래번호 Update
    IF 0 <> PKG_RTRE0210.f_UpdateRTRE0210RecvResult(  lr_Re0210.RACT_DAY
                                                    , lr_Re0210.RACT_SEQ
                                                    , ln_Recv_Seq
                                                    , v_Reg_Id
                                                    , v_ErrorText
                                                   ) THEN
        v_Return_Message := '수납결과 수정 실패!!!';
        RAISE e_Error;
    END IF;
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_12', v_Tno, lr_Re0210.TORD_NO); 
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 계좌즉시출금 수납처리되었습니다';
    v_ErrorText      := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_CreateRTRE0210RactReceive(1)', v_ErrorText, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_CreateRTRE0210RactReceive(2)', v_ErrorText, v_Return_Message);
    END p_CreateRTRE0210RactReceive;

/*******************************************************************************
  -- 계좌즉시출금결제이력 수납일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0210HstReqSeq(  v_Ord_Cd  IN RTRE0215.ORD_CD%TYPE  /* 계약번호 */
                                  , v_Cust_No IN RTRE0215.CUST_NO%TYPE /* 거래번호 */
                                 )
    
    RETURN NUMBER

    IS

    v_Req_Seq RTRE0215.REQ_SEQ%TYPE DEFAULT 0; /* 요청순번 */

    BEGIN
        SELECT NVL2(MAX(REQ_SEQ), TO_NUMBER(MAX(REQ_SEQ)) + 1, 1)
        INTO   v_Req_Seq
        FROM   RTRE0215
        WHERE  ORD_CD  = v_Ord_Cd
        AND    CUST_NO = v_Cust_No
        AND    REQ_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD');
    RETURN v_Req_Seq;

    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0210HstReqSeq;

/*****************************************************************************
 -- 계좌즉시출금 결제취소 내역 Update(환불이 아닌 수납취소만)
 *****************************************************************************/
    FUNCTION f_UpdateRtre0210Cancle(  v_Recv_Seq  IN  RTRE0210.RECV_SEQ%TYPE /* 수납거래번호 */
                                    , v_Cnc_Rseq  IN  RTRE0210.CNC_RSEQ%TYPE /* 수납취소거래번호 */
                                    , v_Cnc_Stat  IN  RTRE0210.CNC_STAT%TYPE /* 수납취소여부 */
                                    , v_Reg_Id    IN  RTRE0210.REG_ID%TYPE   /* 등록자 ID */
                                    , v_ErrorText OUT VARCHAR2
                                   )
    RETURN NUMBER

    IS

    BEGIN
        UPDATE  RTRE0210
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
  END f_UpdateRtre0210Cancle;

/*******************************************************************************
 -- 계좌즉시출금취소 저장 Update
 *******************************************************************************/
    PROCEDURE p_UpdateRtre0210AccCancel(  v_Ract_Day         IN  RTRE0210.RACT_DAY%TYPE         /* 카드수납일자 */
                                        , v_Recv_Seq         IN  RTRE0210.RECV_SEQ%TYPE         /* 수납거래번호 */
                                        , v_Cnc_Rseq         IN  RTRE0210.CNC_RSEQ%TYPE         /* 수납취소거래번호 */
                                        , v_Cnc_Tno          IN  RTRE0210.CNC_TNO%TYPE          /* 세틀뱅크취소거래번호 */
                                        , v_Prt_Cnc_Rmnn_Amt IN  RTRE0210.PRT_CNC_RMNN_AMT%TYPE /* 수납취소후남은금액 */
                                        , v_Refund_Yn        IN  RTRE0210.REFUND_YN%TYPE        /* 환불여부 */
                                        , v_Chg_Id           IN  RTRE0210.CHG_ID%TYPE           /* 변경자 ID */
                                        , v_Success_Code     OUT NUMBER
                                        , v_Return_Message   OUT VARCHAR2
                                        , v_Error_Text       OUT VARCHAR2
                                       )
    IS

    e_Error EXCEPTION;

    BEGIN
        UPDATE  RTRE0210
        SET     CNC_RSEQ         = v_Cnc_Rseq
              , CNC_TNO          = v_Cnc_Tno
              , PRT_CNC_RMNN_AMT = v_Prt_Cnc_Rmnn_Amt
              , REFUND_YN        = v_Refund_Yn
              , CHG_ID           = v_Chg_Id
              , CHG_DT           = SYSDATE
        WHERE   RACT_DAY = v_Ract_Day
        AND     RECV_SEQ = v_Recv_Seq;
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_13', v_Cnc_Tno, v_Prt_Cnc_Rmnn_Amt); 
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 수정되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_UpdateRtre0210AccCancel(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_UpdateRtre0210AccCancel(2)', v_Error_Text, v_Return_Message);

    END p_UpdateRtre0210AccCancel;

/*******************************************************************************
 -- 계좌즉시출금결제이력 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0210AccImmWthdrHst(  v_Req_Seq	 	    IN  RTRE0215.REQ_SEQ%TYPE   /* 요청순번 */
                                             , v_Cust_No        IN  RTRE0215.CUST_NO%TYPE   /* 고객번호 */
                                             , v_Ord_Cd         IN  RTRE0215.ORD_CD%TYPE    /* 계약번호 */
                                             , v_Work_Gb        IN  RTRE0215.WORK_GB%TYPE   /* 요청업무 */
                                             , v_Method         IN  RTRE0215.METHOD%TYPE    /* 메소드명 */
                                             , v_Pay_Gb         IN  RTRE0215.PAY_GB%TYPE    /* 업무구분 */
                                             , v_P_Mid          IN  RTRE0215.P_MID%TYPE     /* 상점아이디 */
                                             , v_P_Oid          IN  RTRE0215.P_OID%TYPE     /* 주문번호 */
                                             , v_P_Tr_Dt        IN  RTRE0215.P_TR_DT%TYPE   /* 거래일자 */
                                             , v_P_Tr_Time      IN  RTRE0215.P_TR_TIME%TYPE /* 거래시간 */
                                             , v_P_Acc_No       IN  RTRE0215.P_ACC_NO%TYPE  /* 계좌번호 */
                                             , v_P_Bank_Cd      IN  RTRE0215.P_BANK_CD%TYPE /* 은행코드 */
                                             , v_P_Cust_Id      IN  RTRE0215.P_CUST_ID%TYPE /* 고객ID */
                                             , v_P_Cust_Nm      IN  RTRE0215.P_CUST_NM%TYPE /* 예금주명 */
                                             , v_P_Uname        IN  RTRE0215.P_UNAME%TYPE   /* 결제고객성명 */
                                             , v_P_Goods        IN  RTRE0215.P_GOODS%TYPE   /* 결제상품명 */
                                             , v_P_Amt          IN  RTRE0215.P_AMT%TYPE     /* 거래금액 */
                                             , v_P_Rm           IN  RTRE0215.P_RM%TYPE      /* 생년월일 */
                                             , v_P_Bname        IN  RTRE0215.P_BNAME%TYPE   /* 통장인자명 */
                                             , v_P_Hash         IN  RTRE0215.P_HASH%TYPE    /* Hash데이터 */
                                             , v_P_Tr_No        IN  RTRE0215.P_TR_NO%TYPE   /* 거래번호 */
                                             , v_P_Satus        IN  RTRE0215.P_SATUS%TYPE   /* 거래상태 */
                                             , v_P_Err_Cd       IN  RTRE0215.P_ERR_CD%TYPE  /* 거절코드 */
                                             , v_PRmesg         IN  RTRE0215.P_RMESG%TYPE   /* 메시지 */
                                             , v_Reg_Id         IN  RTRE0215.REG_ID%TYPE     /* 등록자 ID */
                                             , v_Success_Code   OUT NUMBER
                                             , v_Return_Message OUT VARCHAR2
                                             , v_Error_Text     OUT VARCHAR2
                                            )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0215(  REQ_DAY
                             , REQ_SEQ
                             , CUST_NO
                             , ORD_CD
                             , WORK_GB
                             , METHOD
                             , PAY_GB
                             , P_MID
                             , P_OID
                             , P_TR_DT
                             , P_TR_TIME
                             , P_ACC_NO
                             , P_BANK_CD
                             , P_CUST_ID
                             , P_CUST_NM
                             , P_UNAME
                             , P_GOODS
                             , P_AMT
                             , P_RM
                             , P_BNAME
                             , P_HASH
                             , P_TR_NO
                             , P_SATUS
                             , P_ERR_CD
                             , P_RMESG
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Req_Seq
                             , v_Cust_No
                             , v_Ord_Cd
                             , v_Work_Gb
                             , v_Method
                             , v_Pay_Gb
                             , v_P_Mid
                             , v_P_Oid
                             , v_P_Tr_Dt
                             , v_P_Tr_Time
                             , v_P_Acc_No
                             , v_P_Bank_Cd
                             , v_P_Cust_Id
                             , v_P_Cust_Nm
                             , v_P_Uname
                             , v_P_Goods
                             , v_P_Amt
                             , v_P_Rm
                             , v_P_Bname
                             , v_P_Hash
                             , v_P_Tr_No
                             , v_P_Satus
                             , v_P_Err_Cd
                             , v_PRmesg
                             , v_Reg_Id
                             , SYSDATE
                             , v_Reg_Id
                             , SYSDATE
                            );
                            
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_14', v_Ord_Cd, v_P_Acc_No);                             
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_Error_Text);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0210AccImmWthdrHst(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0210AccImmWthdrHst(2)', v_Error_Text, v_Return_Message);
    
    END p_InsertRtre0210AccImmWthdrHst;

/*******************************************************************************
  -- 거래취소번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0210HstCncSeq(v_Tno IN RTRE0216.TNO%TYPE) /* 거래번호 */

    RETURN NUMBER

    IS

    v_Cnc_Seq RTRE0216.CNC_SEQ%TYPE DEFAULT 0; /* 거래취소번호 */

    BEGIN
        SELECT NVL((SELECT MAX(CNC_SEQ)
                    FROM   RTRE0216
                    WHERE  TNO = v_Tno
                   )+ 1, 1)
        INTO   v_Cnc_Seq
        FROM   DUAL;
    RETURN v_Cnc_Seq;
    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0210HstCncSeq;

/*******************************************************************************
  -- 계좌즉시출금취소이력 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0210AccCancelHst(  v_Tno            IN  RTRE0216.TNO%TYPE      /* 거래번호 */
                                           , v_Cnc_Seq        IN  RTRE0216.CNC_SEQ%TYPE  /* 거래취소번호 */
                                           , v_Mod_Type       IN  RTRE0216.MOD_TYPE%TYPE /* 요청종류 */
                                           , v_Mod_Mny        IN  RTRE0216.MOD_MNY%TYPE  /* 취소요청금액 */
                                           , v_Rem_Mny        IN  RTRE0216.REM_MNY%TYPE  /* 취소가능금액 */
                                           , v_Mod_Desc       IN  RTRE0216.MOD_DESC%TYPE /* 취소사유 */
                                           , v_Res_Cd         IN  RTRE0216.RES_CD%TYPE   /* 결과코드 */
                                           , v_Res_Msg        IN  RTRE0216.RES_MSG%TYPE  /* 결과내용 */
                                           , v_Reg_Id         IN  RTRE0216.REG_ID%TYPE   /* 등록자 ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_Error_Text     OUT VARCHAR2
                                          )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0216(  TNO
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
Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.acctRecvRest_15', v_Tno, v_Cnc_Seq);                               
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Error_Text     := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_Error_Text);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0210AccCancelHst(1)', v_Error_Text, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0210.p_InsertRtre0210AccCancelHst(2)', v_Error_Text, v_Return_Message);

    END p_InsertRtre0210AccCancelHst;
END Pkg_Rtre0210;
/
