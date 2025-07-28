CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RNT_RTRE7000 AS
/*******************************************************************************
   NAME:      PKG_RNT_RTRE7000
   PURPOSE   

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2019-02-14  강신규           1. Created this package body.
   1.1        2019-09-26  wjim             [20190926_01] 집계 시 사용중인 판매정책조견표만 적용
   1.2        2020-07-01  kstka            [20200701_01] 판매장려수수료 대상 중분류 채널 공통코드로 전환 
   1.3        2022-01-20  kstka            [20220120_01] 특정계절 및 패턴에 따른 수수료 집계처리
*******************************************************************************/

    /***************************************************************************
        판매인센티브 통합 집계
            대리점 판매인센티브 집계
            제휴방판 판매인센티브 집계
            MR.Roadian 판매인센티브 집계
    ***************************************************************************/
    PROCEDURE PRC_SALE_INCENTIVE_AGG (
        PI_YYYYMM   IN VARCHAR2,    /* 집계년월 */
        PI_REG_ID   IN VARCHAR2,    /* 실행자ID */
        PO_RET_CODE OUT VARCHAR2,     /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2   /* RETURN MESSAGE */
    ) IS
    V_E_ERROR       EXCEPTION;
    
    V_S_TIME        TIMESTAMP;
    V_A_COUNT       NUMBER DEFAULT 0;
    V_V_COUNT       NUMBER DEFAULT 0;
    V_R_COUNT       NUMBER DEFAULT 0;
    BEGIN
        /* 필수값: 마감년월, 실행자ID */
        IF (ISDATE(PI_YYYYMM) <> 0) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY( '집계년월(' || PI_YYYYMM || '): ');
            RAISE V_E_ERROR;
        END IF;  
    
        IF (TRIM(PI_REG_ID) IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY('실행자ID(' || PI_REG_ID || '): ');
            RAISE V_E_ERROR;
        END IF;
        
        /* 대리점 인센티브 처리 */
        SELECT SYSTIMESTAMP INTO V_S_TIME FROM DUAL;
        PRC_INNER_INCENTIVE(PI_YYYYMM, 'A1', PI_REG_ID, V_A_COUNT, PO_RET_CODE, PO_RET_MESG);
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        PRC_AGG_HISTORY_INSERT(
            PI_YYYYMM, PI_REG_ID, 'A', 
            'I', 'TIRE', V_S_TIME,
            SYSTIMESTAMP, V_A_COUNT, PO_RET_CODE,
            PO_RET_MESG
        );
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        
        /* 방문판매 인센티브 처리 */
        SELECT SYSTIMESTAMP INTO V_S_TIME FROM DUAL;
        PRC_INNER_INCENTIVE(PI_YYYYMM, 'A2', PI_REG_ID, V_V_COUNT, PO_RET_CODE, PO_RET_MESG);
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        PRC_AGG_HISTORY_INSERT(
            PI_YYYYMM, PI_REG_ID, 'V', 
            'I', 'TIRE', V_S_TIME,
            SYSTIMESTAMP, V_V_COUNT, PO_RET_CODE,
            PO_RET_MESG
        );
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        
        
        /* 로디안 인센티브 처리 */
        SELECT SYSTIMESTAMP INTO V_S_TIME FROM DUAL;
        PRC_INNER_INCENTIVE(PI_YYYYMM, 'A3', PI_REG_ID, V_R_COUNT, PO_RET_CODE, PO_RET_MESG);
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        PRC_AGG_HISTORY_INSERT(
            PI_YYYYMM, PI_REG_ID, 'R', 
            'I', 'TIRE', V_S_TIME,
            SYSTIMESTAMP, V_R_COUNT, PO_RET_CODE,
            PO_RET_MESG
        );
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        
        
        PO_RET_CODE := TO_CHAR(0);
        PO_RET_MESG := FNC_MESG_OK(' [대리점:' || V_A_COUNT || ', 방문판매:' || V_V_COUNT || ', 로디안:' || V_R_COUNT || ']');
        
        EXCEPTION 
            WHEN V_E_ERROR THEN
                PO_RET_CODE := TO_CHAR(-1);
                
            WHEN OTHERS THEN
                PO_RET_CODE := SQLCODE;
                PO_RET_MESG := SQLERRM;
    END PRC_SALE_INCENTIVE_AGG;
    

    /***************************************************************************
        인센티브 처리 프로시저
    ***************************************************************************/
    PROCEDURE PRC_INNER_INCENTIVE (
        PI_YYYYMM   IN VARCHAR2,   
        PI_COMM_TP  IN VARCHAR2,
        PI_REG_ID   IN VARCHAR2,        /* 실행자ID */
        PO_RET_CNT  OUT NUMBER,         /* 적용 COUNT */
        PO_RET_CODE OUT VARCHAR2,       /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2        /* RETURN MESSAGE */
    ) IS
    
    V_E_ERROR       EXCEPTION;
    V_TMP_TEXT      VARCHAR2(500);
    
    V_CURSOR        SYS_REFCURSOR;
    V_TYPE          GT_INCENTIVE;
    BEGIN
        PO_RET_CNT := TO_CHAR(0);
        
        IF (PI_YYYYMM IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY( 'PI_YYYYMM(NULL): ' );
            RAISE V_E_ERROR;
        END IF;
        
        IF (TRIM(PI_REG_ID) IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY('실행자ID(' || PI_REG_ID || '): ');
            RAISE V_E_ERROR;
        END IF;
        
        CASE PI_COMM_TP
            WHEN 'A1' THEN
                V_CURSOR := FNC_CURSOR_AGENCY_INCENTIVE(PI_YYYYMM);
            WHEN 'A2' THEN
                V_CURSOR := FNC_CURSOR_VISIT_INCENTIVE(PI_YYYYMM);
            WHEN 'A3' THEN
                V_CURSOR := FNC_CURSOR_ROAD_INCENTIVE(PI_YYYYMM);
            ELSE
                PO_RET_MESG := FNC_ERR_MANDATORY('PI_COMM_TP(' || PI_COMM_TP || '): ');
                RAISE V_E_ERROR;
        END CASE;
        
        BEGIN
            DELETE
              FROM RTRE7040
            WHERE SLCM_YM = PI_YYYYMM
              AND COMM_TP = PI_COMM_TP;
              
            EXCEPTION
                WHEN OTHERS THEN
                    PO_RET_MESG := FNC_ERR_DELETE(' [PI_YYYYMM:' || PI_YYYYMM || ', PI_COMM_TP:' || PI_COMM_TP || '] ' || SQLERRM);
                    RAISE V_E_ERROR;
        END;
        
        LOOP
            FETCH V_CURSOR INTO V_TYPE;
            EXIT WHEN V_CURSOR%NOTFOUND;
            
            BEGIN
                V_TMP_TEXT := V_TYPE.ORD_NO;
                
                -- IF (V_TYPE.APL_AMT <> 0) THEN
                    INSERT INTO RTRE7040 (
                        SLCM_YM,    ORD_NO,     CUST_NO,    ORD_AGENT, 
                        CHAN_CD,    COMM_TP,    MAT_CD,     CNT_CD,
                        SSLCM_AMT,  SAPFDS_AMT, SLCM_AMT,   APFDS_AMT,
                        PPOB_YN,    PROC_DAY,   REG_ID,     CHG_ID
                    )
                    SELECT
                        V_TYPE.YYYYMM,  V_TYPE.ORD_NO,  V_TYPE.CUST_NO, V_TYPE.ORD_AGENT,
                        V_TYPE.CHAN_CD, V_TYPE.COMM_TP, V_TYPE.MAT_CD,  V_TYPE.CNT_CD,
                        V_TYPE.LAST_AMT,V_TYPE.APL_AMT, 0,              0,
                        'Y',            V_TYPE.PROC_DAY,PI_REG_ID,      PI_REG_ID
                      FROM DUAL;
                      
                    PO_RET_CNT := PO_RET_CNT + 1;
                -- END IF;
                
                EXCEPTION
                    WHEN OTHERS THEN
                        PO_RET_MESG := FNC_ERR_INSERT(' [ORD_NO:' || V_TMP_TEXT || '] ' || SQLERRM);
                        RAISE V_E_ERROR;
            END;
        END LOOP;
        CLOSE V_CURSOR;
        
        PO_RET_CODE := TO_CHAR(0);
        PO_RET_MESG := FNC_MESG_OK(' [COUNT:' || PO_RET_CNT || ']');
        
        EXCEPTION 
            WHEN V_E_ERROR THEN
                PO_RET_CODE := TO_CHAR(-1);
                
            WHEN OTHERS THEN
                PO_RET_CODE := SQLCODE;
                PO_RET_MESG := SQLERRM;
        
    END PRC_INNER_INCENTIVE;
    
    /***************************************************************************
        판매장려금 통합 집계
            집계년월 인센티브 집계 > 2차 집계
            대리점 + 제휴방판 + MR.Roadian 판매장려금 집계
    ***************************************************************************/
    PROCEDURE PRC_SALE_SBS_AGG (
        PI_YYYYMM   IN VARCHAR2,    /* 집계년월 */
        PI_REG_ID   IN VARCHAR2,    /* 실행자ID */
        PO_RET_CODE OUT VARCHAR2,   /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2    /* RETURN MESSAGE */
    ) IS
    V_E_ERROR   EXCEPTION;
    
    V_S_TIME    TIMESTAMP;
    
    V_COUNT     NUMBER DEFAULT 0;
    BEGIN
        /* 필수값: 마감년월, 실행자ID */
        IF (ISDATE(PI_YYYYMM) <> 0) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY( '집계년월(' || PI_YYYYMM || '): ');
            RAISE V_E_ERROR;
        END IF;  
    
        IF (TRIM(PI_REG_ID) IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY('실행자ID(' || PI_REG_ID || '): ');
            RAISE V_E_ERROR;
        END IF;
        
        /* 장려금 집계처리 */
        SELECT SYSTIMESTAMP INTO V_S_TIME FROM DUAL;
        PRC_INNER_SBS(PI_YYYYMM, PI_REG_ID, V_COUNT, PO_RET_CODE, PO_RET_MESG);
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        PRC_AGG_HISTORY_INSERT(
            PI_YYYYMM, PI_REG_ID, '', 
            'S', 'PORT', V_S_TIME,
            SYSTIMESTAMP, V_COUNT, PO_RET_CODE,
            PO_RET_MESG
        );
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        
        
        PO_RET_CODE := TO_CHAR(0);
        PO_RET_MESG := FNC_MESG_OK(' [장려금 및 인센티브 2차 집계:' || V_COUNT || ']');
        
        EXCEPTION 
            WHEN V_E_ERROR THEN
                PO_RET_CODE := TO_CHAR(-1);
                
            WHEN OTHERS THEN
                PO_RET_CODE := SQLCODE;
                PO_RET_MESG := SQLERRM;
    END PRC_SALE_SBS_AGG;
    
    
    /***************************************************************************
        인센티브/장려금 집계처리 프로시저
    ***************************************************************************/
    PROCEDURE PRC_INNER_SBS(
        PI_YYYYMM   IN VARCHAR2,
        PI_REG_ID   IN VARCHAR2,        /* 실행자ID */
        PO_RET_CNT  OUT NUMBER,         /* 적용 COUNT */
        PO_RET_CODE OUT VARCHAR2,       /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2        /* RETURN MESSAGE */
    ) IS
    V_E_ERROR       EXCEPTION;
    V_TMP_TEXT      VARCHAR2(500);
    V_TMP_NUM       NUMBER;
    
    V_CURSOR        SYS_REFCURSOR;
    V_TYPE          GT_SBS;
    BEGIN
        PO_RET_CNT := TO_CHAR(0);
        
        IF (PI_YYYYMM IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY( 'PI_YYYYMM(NULL): ' );
            RAISE V_E_ERROR;
        END IF;
        
        IF (TRIM(PI_REG_ID) IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY('실행자ID(' || PI_REG_ID || '): ');
            RAISE V_E_ERROR;
        END IF;
        
        /** 
          * 해당월의 인센티브 집계가 수행되었는가? 
          * RTRE7040.SLCM_YM
          */
        BEGIN
            SELECT COUNT(*)
              INTO V_TMP_NUM
              FROM RTRE7040
             WHERE SLCM_YM = PI_YYYYMM;
            
            IF (V_TMP_NUM <= 0) THEN
                PO_RET_MESG := FNC_ERR_SEARCH(' [' || PI_YYYYMM || '] 해당월의 인센티브 집계가 수행되지 않았습니다.');
                RAISE V_E_ERROR;
            END IF;
        END;
        
        /** 해당월의 장려금 집계정보 삭제 */
        BEGIN
            DELETE
              FROM RTRE7070
             WHERE 1=1
               AND SLCM_YM = PI_YYYYMM;
            
            EXCEPTION
                WHEN OTHERS THEN
                    PO_RET_MESG := FNC_ERR_DELETE(' [' || PI_YYYYMM || ': 이전 수행된 장려금 집계정보 삭제] ' || SQLERRM);
                    RAISE V_E_ERROR;
        END;
        
        /** 집계커서 추출 */
        V_CURSOR := FNC_CURSOR_SBS(PI_YYYYMM);
        
        /** 집계데이터 입력 */
        LOOP
            FETCH V_CURSOR INTO V_TYPE;
            EXIT WHEN V_CURSOR%NOTFOUND;
            
            BEGIN
                V_TMP_TEXT := V_TYPE.AGENCY_CD;
                
                INSERT INTO RTRE7070 (
                    SLCM_YM,    AGENCY_CD,  AGNC_INCN,      AFL_VSLS_INCN,
                    RDN_INCN,   AGNC_SBS,   AFL_VSLS_SBS,   RDN_SBS,
                    VST_CHC_FEE,REG_ID,     CHG_ID
                )
                SELECT
                    V_TYPE.YYYYMM, V_TYPE.AGENCY_CD, V_TYPE.AGNC_INCN, V_TYPE.AFL_VSLS_INCN,
                    V_TYPE.RDN_INCN, V_TYPE.AGNC_SBS, V_TYPE.AFL_VSLS_SBS, V_TYPE.RDN_SBS,
                    V_TYPE.VST_CHC_FEE, PI_REG_ID, PI_REG_ID
                  FROM DUAL;
                  
                PO_RET_CNT := PO_RET_CNT + 1;
                
                EXCEPTION
                    WHEN OTHERS THEN
                        PO_RET_MESG := FNC_ERR_INSERT(' [AGENCY_CD:' || V_TMP_TEXT || '] ' || SQLERRM);
                        RAISE V_E_ERROR;
            END;
        END LOOP;
        CLOSE V_CURSOR;
        
        PO_RET_CODE := TO_CHAR(0);
        PO_RET_MESG := FNC_MESG_OK(' [COUNT:' || PO_RET_CNT || ']');
        
        EXCEPTION 
            WHEN V_E_ERROR THEN
                PO_RET_CODE := TO_CHAR(-1);
                
            WHEN OTHERS THEN
                PO_RET_CODE := SQLCODE;
                PO_RET_MESG := SQLERRM;
    END PRC_INNER_SBS;
    
    
    /*****************************************************************************
    -- 대리점 판매인센티브 집계 CURSOR
  
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------                                              
    1.1        2019-09-26  wjim             [20190926_01] 집계 시 사용중인 판매정책조견표만 적용
    1.2        2020-07-01  kstka            [20200701_01] 판매장려수수료 대상 중분류 채널 공통코드로 전환 
    *****************************************************************************/
    FUNCTION FNC_CURSOR_AGENCY_INCENTIVE(
        PI_YYYYMM   IN VARCHAR2     /* 집계년월 */
    ) RETURN SYS_REFCURSOR IS
        V_RETURN  SYS_REFCURSOR;
    BEGIN
        OPEN V_RETURN FOR
            SELECT A.*,
                   NVL(B.APL_AMT, 0) APL_AMT,
                   A.CNT_CD * NVL(B.APL_AMT, 0) LAST_AMT 
              FROM (
                    SELECT PI_YYYYMM YYYYMM,
                           A.ORD_NO,
                           A.CUST_NO,
                           CASE A.CHAN_CD WHEN '01' THEN A.AGENCY_CD
                                          WHEN '05' THEN A.AGENCY_CD
                                          ELSE A.ORD_AGENT
                           END ORD_AGENT,
                           'A1' COMM_TP,
                           B.MAT_CD,
                           A.CNT_CD,
                           A.PROC_DAY,
                           A.MFP_YN,
                           A.END_TP,
                           A.CANC_DAY,
                           A.ORD_DAY,
                           A.CHAN_CD,
                           E.CHAN_LCLS_CD,
                           E.CHAN_MCLS_CD,
                           SUM(A.CNT_CD) OVER(PARTITION BY A.AGENCY_CD) CNT_SUM,
                           H.WHEEL_INCHES,
                           H.SEASON_CD,
                           H.PETTERN_CD AS PATTERN_CD
                      FROM RTSD0108 A -- 장착정보
                            INNER JOIN RTCS0001 B ON -- 설비정보
                                    A.ORD_NO = B.ORD_NO
                            INNER JOIN RTSD0007 E ON -- 대리점정보
                                    A.AGENCY_CD = E.AGENCY_CD
                                AND E.CHAN_LCLS_CD = '01' -- 대리점
--                                AND E.CHAN_MCLS_CD IN ('0101' ,'0102', '0103', '0104', '0107', '0108') -- 타이어테크, 카포스, 애니카, 프로미
                                AND E.CHAN_MCLS_CD IN (SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R080' AND USE_YN = 'Y') --[20200701_01] 판매장려수수료 중분류 채널 설정
                                AND E.PRPL_YN = 'Y' -- 퍼플점만 대상
                            LEFT OUTER JOIN RTSD0113 F ON -- 판매인정보
                                    A.ORD_AGENT = F.ORD_AGENT
                            INNER JOIN RTSD0106 G ON
                                    A.ORD_NO = G.ORD_NO
                                AND G.SEQ = 1
                            INNER JOIN RTSD0005 H ON
                                    G.MAT_CD = H.MAT_CD
--                                AND H.WHEEL_INCHES > '14' --[20201214_01] kstka 14인치휠은 수수료집계 제외
                     WHERE 1=1
                       AND A.PROC_DAY BETWEEN PI_YYYYMM || '01' 
                                          AND TO_CHAR(LAST_DAY(TO_DATE(PI_YYYYMM || '01', 'YYYYMMDD')), 'YYYYMMDD')
                       AND A.CHAN_CD = '01'
                ) A
                    LEFT OUTER JOIN RTRE5000 B ON
                            B.SLS_CD = 'A'
                        AND B.BNS_CD = 'I'
                        AND B.PYM_CD = 'TIRE'
                        AND B.USE_YN = 'Y' --[20190926_01]
                        AND A.CNT_SUM BETWEEN (CASE WHEN B.SALE_MIN = -1 THEN A.CNT_SUM ELSE B.SALE_MIN END)
                                          AND (CASE WHEN B.SALE_MAX = -1 THEN A.CNT_SUM ELSE B.SALE_MAX END) 
             WHERE 1=1
--             AND WHEEL_INCHES > '14'  --[20210928_01] kstka 14인치 제약조건 제거 [20211101_01] 다시 추가 [20220504_01] 인치 제한 조건 제거
             AND (CHAN_CD, SEASON_CD, PATTERN_CD) IN (
                    SELECT CHAN_CD, SEASON_CD, PATTERN_CD 
                            FROM RTSD0450 
                            WHERE CHAN_CD = '01' 
                            AND USE_YN = 'Y')       --[20220120_01] kstka 특정조건에 해당하는 건만 집계처리 
            ;
        
        RETURN V_RETURN;
    END FNC_CURSOR_AGENCY_INCENTIVE;

    /*****************************************************************************
    -- 방문판매 판매인센티브 집계 CURSOR
  
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------                                              
    1.1        2019-09-26  wjim             [20190926_01] 집계 시 사용중인 판매정책조견표만 적용 
    *****************************************************************************/
    FUNCTION FNC_CURSOR_VISIT_INCENTIVE(
        PI_YYYYMM   IN VARCHAR2     /* 집계년월 */
    ) RETURN SYS_REFCURSOR IS
      V_RETURN  SYS_REFCURSOR;
    BEGIN
        OPEN V_RETURN FOR
        SELECT A.*,
               NVL(B.APL_AMT, 0) APL_AMT,
               A.CNT_CD * NVL(B.APL_AMT, 0) LAST_AMT 
          FROM (
                SELECT PI_YYYYMM YYYYMM,
                       A.ORD_NO,
                       A.CUST_NO,
                       CASE A.CHAN_CD WHEN '01' THEN A.AGENCY_CD
                                      WHEN '05' THEN A.AGENCY_CD
                                      ELSE A.ORD_AGENT
                       END ORD_AGENT,
                       'A2' COMM_TP,
                       B.MAT_CD,
                       A.CNT_CD,
                       A.PROC_DAY,
                       A.MFP_YN,
                       A.END_TP,
                       A.CANC_DAY,
                       A.ORD_DAY,
                       A.CHAN_CD,
                       F.CHAN_LCLS_CD,
                       F.CHAN_MCLS_CD,
                       SUM(A.CNT_CD) OVER(PARTITION BY A.ORD_AGENT) CNT_SUM,
                       '' AS WHEEL_INCHES,
                       H.SEASON_CD,
                       H.PETTERN_CD AS PATTERN_CD
                  FROM RTSD0108 A -- 장착정보
                        INNER JOIN RTCS0001 B ON -- 설비정보
                              A.ORD_NO = B.ORD_NO
                        INNER JOIN RTSD0113 F ON -- 판매인정보
                              A.ORD_AGENT = F.ORD_AGENT
                          AND F.CHAN_LCLS_CD = '03'    -- 방판
                          AND F.CHAN_MCLS_CD IN ('0303', '0302')  -- 제휴방판
                          AND F.ORD_AGENT NOT IN ('402819')  -- 판매수수료제외 [라이브커머스_그립] [20201202_01]
                        INNER JOIN RTSD0106 G ON
                                    A.ORD_NO = G.ORD_NO
                                AND G.SEQ = 1
                        INNER JOIN RTSD0005 H ON
                                G.MAT_CD = H.MAT_CD
                 WHERE 1=1
                   AND A.PROC_DAY BETWEEN PI_YYYYMM || '01' 
                                  AND TO_CHAR(LAST_DAY(TO_DATE(PI_YYYYMM || '01', 'YYYYMMDD')), 'YYYYMMDD')
               ) A
                LEFT OUTER JOIN RTRE5000 B ON
                        B.SLS_CD = 'V'
                    AND B.BNS_CD = 'I'
                    AND B.PYM_CD = 'TIRE'
                    AND B.USE_YN = 'Y' --[20190926_01] 
                    AND A.CNT_SUM BETWEEN (CASE WHEN B.SALE_MIN = -1 THEN A.CNT_SUM ELSE B.SALE_MIN END)
                                      AND (CASE WHEN B.SALE_MAX = -1 THEN A.CNT_SUM ELSE B.SALE_MAX END) 
         WHERE 1=1
         AND (CHAN_CD, SEASON_CD, PATTERN_CD, CHAN_MCLS_CD, CHAN_LCLS_CD) IN (
                SELECT CHAN_CD, SEASON_CD, PATTERN_CD, CHAN_MCLS_CD, CHAN_LCLS_CD 
                        FROM RTSD0450 
                        WHERE CHAN_CD = '03' 
                        AND CHAN_LCLS_CD = '03' 
                        AND CHAN_MCLS_CD = '0303' 
                        AND USE_YN = 'Y')       --[20220120_01] kstka 특정조건에 해당하는 건만 집계처리 
         ;
        
        RETURN V_RETURN;
    END FNC_CURSOR_VISIT_INCENTIVE;
    
    
    /*****************************************************************************
    -- 로디안 판매인센티브 집계 CURSOR
  
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------                                              
    1.1        2019-09-26  wjim             [20190926_01] 집계 시 사용중인 판매정책조견표만 적용 
    *****************************************************************************/
    FUNCTION FNC_CURSOR_ROAD_INCENTIVE(
        PI_YYYYMM   IN VARCHAR2     /* 집계년월 */
    ) RETURN SYS_REFCURSOR IS
        V_RETURN  SYS_REFCURSOR;
    BEGIN
        OPEN V_RETURN FOR
        SELECT A.*,
               NVL(B.APL_AMT, 0) APL_AMT,
               A.CNT_CD * NVL(B.APL_AMT, 0) LAST_AMT 
          FROM (
                SELECT PI_YYYYMM YYYYMM,
                       A.ORD_NO,
                       A.CUST_NO,
                       CASE A.CHAN_CD WHEN '01' THEN A.AGENCY_CD
                                      WHEN '05' THEN A.AGENCY_CD
                                      ELSE A.ORD_AGENT
                       END ORD_AGENT,
                       'A3' COMM_TP,
                       B.MAT_CD,
                       A.CNT_CD,
                       A.PROC_DAY,
                       A.MFP_YN,
                       A.END_TP,
                       A.CANC_DAY,
                       A.ORD_DAY,
                       A.CHAN_CD,
                       F.CHAN_LCLS_CD,
                       F.CHAN_MCLS_CD,
                       SUM(A.CNT_CD) OVER(PARTITION BY A.ORD_AGENT) CNT_SUM,
                       H.WHEEL_INCHES,
                       H.SEASON_CD,
                       H.PETTERN_CD AS PATTERN_CD
                  FROM RTSD0108 A -- 장착정보
                        INNER JOIN RTCS0001 B ON -- 설비정보
                              A.ORD_NO = B.ORD_NO
                        INNER JOIN RTSD0113 F ON -- 판매인정보
                              A.ORD_AGENT = F.ORD_AGENT
                          AND F.CHAN_LCLS_CD = '03'    -- 방판
                          AND F.CHAN_MCLS_CD = '0308'  -- Mr.Roadian
                        INNER JOIN RTSD0106 G ON
                                    A.ORD_NO = G.ORD_NO
                                AND G.SEQ = 1
                        INNER JOIN RTSD0005 H ON
                                G.MAT_CD = H.MAT_CD
--                            AND H.WHEEL_INCHES > '14' --[20201214_01] kstka 14인치휠은 수수료집계 제외
                 WHERE 1=1
                   AND A.PROC_DAY BETWEEN PI_YYYYMM || '01' 
                                  AND TO_CHAR(LAST_DAY(TO_DATE(PI_YYYYMM || '01', 'YYYYMMDD')), 'YYYYMMDD')
               ) A
                LEFT OUTER JOIN RTRE5000 B ON
                        B.SLS_CD = 'R'
                    AND B.BNS_CD = 'I'
                    AND B.PYM_CD = 'TIRE'
                    AND B.USE_YN = 'Y' --[20190926_01]
                    AND A.CNT_SUM BETWEEN (CASE WHEN B.SALE_MIN = -1 THEN A.CNT_SUM ELSE B.SALE_MIN END)
                                      AND (CASE WHEN B.SALE_MAX = -1 THEN A.CNT_SUM ELSE B.SALE_MAX END) 
         WHERE 1=1
--         AND WHEEL_INCHES > '14'  --[20210928_01] kstka 14인치 제약조건 제거 [20211101_01] 다시 추가 [20220504_01] 인치 제한조건 제거
         AND (CHAN_CD, SEASON_CD, PATTERN_CD, CHAN_MCLS_CD, CHAN_LCLS_CD) IN (
                SELECT CHAN_CD, SEASON_CD, PATTERN_CD, CHAN_MCLS_CD, CHAN_LCLS_CD 
                        FROM RTSD0450 
                        WHERE CHAN_CD = '03' 
                        AND CHAN_LCLS_CD = '03' 
                        AND CHAN_MCLS_CD = '0308' 
                        AND USE_YN = 'Y')   --[20220120_01] kstka 특정조건에 해당하는 건만 집계처리 
         ;
        
        RETURN V_RETURN;
    END FNC_CURSOR_ROAD_INCENTIVE;
    
    
    /*****************************************************************************
    -- 대리점, 제휴방판, 로디안 인센티브/장려금 집계 CURSOR
  
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------                                              
    1.1        2019-09-26  wjim             [20190926_01] 집계 시 사용중인 판매정책조견표만 적용 
    *****************************************************************************/
    FUNCTION FNC_CURSOR_SBS (
        PI_YYYYMM   VARCHAR2
    ) RETURN SYS_REFCURSOR IS
        V_RETURN    SYS_REFCURSOR;
    BEGIN
        OPEN V_RETURN FOR
                SELECT A.YYYYMM,
               A.AGENCY_CD,
               A.AGNC_INCN,
               A.AFL_VSLS_INCN,
               A.RDN_INCN,
               NVL(B.APL_AMT, A.AGNC_SBS) AGNC_SBS,
               A.AFL_VSLS_SBS,
               A.RDN_SBS,
               A.VST_CHC_FEE
          FROM (
                SELECT SLCM_YM YYYYMM,
                       ORD_AGENT AGENCY_CD,
                       SUM(SSLCM_AMT) AGNC_INCN,    /* 대리점인센티브 */
                       0 AFL_VSLS_INCN,             /* 제휴방판인센티브 */
                       0 RDN_INCN,                  /* 로디안인센티브 */
                       0 AGNC_SBS,                  /* 대리점장려금 */
                       0 AFL_VSLS_SBS,              /* 제휴방판장려금 */
                       0 RDN_SBS,                   /* 로디안장려금 */
                       0 VST_CHC_FEE,               /* 방문점검수수료 */
                       SUM(CNT_CD) CNT_SUM
                  FROM RTRE7040
                 WHERE 1=1
                   AND SLCM_YM = PI_YYYYMM
                   AND COMM_TP = 'A1'
                 GROUP BY
                       SLCM_YM,
                       ORD_AGENT
               ) A
                LEFT OUTER JOIN RTRE5000 B ON
                        B.SLS_CD = 'A'
                    AND B.BNS_CD = 'S'
                    AND B.PYM_CD = 'PORT'
                    AND B.USE_YN = 'Y' --[20190926_01]
                    AND A.CNT_SUM BETWEEN (CASE WHEN B.SALE_MIN = -1 THEN A.CNT_SUM ELSE B.SALE_MIN END)
                                      AND (CASE WHEN B.SALE_MAX = -1 THEN A.CNT_SUM ELSE B.SALE_MAX END)
         WHERE 1=1
        UNION
        SELECT A.YYYYMM,
               A.AGENCY_CD,
               A.AGNC_INCN,
               A.AFL_VSLS_INCN,
               A.RDN_INCN,
               A.AGNC_SBS,
               NVL(B.APL_AMT, A.AFL_VSLS_SBS) AFL_VSLS_SBS,
               A.RDN_SBS,
               A.VST_CHC_FEE
          FROM (
                SELECT SLCM_YM YYYYMM,
                       ORD_AGENT AGENCY_CD,
                       0 AGNC_INCN,                 /* 대리점인센티브 */
                       SUM(SSLCM_AMT) AFL_VSLS_INCN,/* 제휴방판인센티브 */
                       0 RDN_INCN,                  /* 로디안인센티브 */
                       0 AGNC_SBS,                  /* 대리점장려금 */
                       0 AFL_VSLS_SBS,              /* 제휴방판장려금 */
                       0 RDN_SBS,                   /* 로디안장려금 */
                       0 VST_CHC_FEE,               /* 방문점검수수료 */
                       SUM(CNT_CD) CNT_SUM
                  FROM RTRE7040
                 WHERE 1=1
                   AND SLCM_YM = PI_YYYYMM
                   AND COMM_TP = 'A2'
                 GROUP BY
                       SLCM_YM,
                       ORD_AGENT
               ) A
                LEFT OUTER JOIN RTRE5000 B ON
                        B.SLS_CD = 'V'
                    AND B.BNS_CD = 'S'
                    AND B.PYM_CD = 'PORT'
                    AND B.USE_YN = 'Y' --[20190926_01]
                    AND A.CNT_SUM BETWEEN (CASE WHEN B.SALE_MIN = -1 THEN A.CNT_SUM ELSE B.SALE_MIN END)
                                      AND (CASE WHEN B.SALE_MAX = -1 THEN A.CNT_SUM ELSE B.SALE_MAX END)
         WHERE 1=1
        UNION
        SELECT A.YYYYMM,
               A.AGENCY_CD,
               A.AGNC_INCN,
               A.AFL_VSLS_INCN,
               A.RDN_INCN,
               A.AGNC_SBS,
               A.AFL_VSLS_SBS,
               NVL(B.APL_AMT, A.RDN_SBS) RDN_SBS,
               A.VST_CHC_FEE
          FROM (
                SELECT SLCM_YM YYYYMM,
                       ORD_AGENT AGENCY_CD,
                       0 AGNC_INCN,                 /* 대리점인센티브 */
                       0 AFL_VSLS_INCN,             /* 제휴방판인센티브 */
                       SUM(SSLCM_AMT) RDN_INCN,     /* 로디안인센티브 */
                       0 AGNC_SBS,                  /* 대리점장려금 */
                       0 AFL_VSLS_SBS,              /* 제휴방판장려금 */
                       0 RDN_SBS,                   /* 로디안장려금 */
                       0 VST_CHC_FEE,               /* 방문점검수수료 */
                       SUM(CNT_CD) CNT_SUM
                  FROM RTRE7040
                 WHERE 1=1
                   AND SLCM_YM = PI_YYYYMM
                   AND COMM_TP = 'A3'
                 GROUP BY
                       SLCM_YM,
                       ORD_AGENT
               ) A
                LEFT OUTER JOIN RTRE5000 B ON
                        B.SLS_CD = 'R'
                    AND B.BNS_CD = 'S'
                    AND B.PYM_CD = 'PORT'
                    AND B.USE_YN = 'Y' --[20190926_01]
                    AND A.CNT_SUM BETWEEN (CASE WHEN B.SALE_MIN = -1 THEN A.CNT_SUM ELSE B.SALE_MIN END)
                                      AND (CASE WHEN B.SALE_MAX = -1 THEN A.CNT_SUM ELSE B.SALE_MAX END)
         WHERE 1=1
        ;
        
        RETURN V_RETURN;
    END FNC_CURSOR_SBS;
    
    PROCEDURE PRC_AGG_HISTORY_INSERT(
        PI_YYYYMM   IN VARCHAR2,
        PI_REG_ID   IN VARCHAR2,
        PI_SLS_CD   IN VARCHAR2,    /* 판매코드 */
        PI_BNS_CD   IN VARCHAR2,    /* 보너스코드 */
        PI_PYM_CD   IN VARCHAR2,    /* 지급코드 */
        PI_S_TIME   IN TIMESTAMP,   /* 시작시간 */
        PI_E_TIME   IN TIMESTAMP,   /* 종료시간 */
        PI_COUNT    IN NUMBER,      /* 적용건수 */
        PO_RET_CODE OUT VARCHAR2,   /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2   /* RETURN MESSAGE */
    ) IS
    V_E_ERROR       EXCEPTION;
    BEGIN
        /* 필수값: 마감년월, 실행자ID */
        IF (ISDATE(PI_YYYYMM) <> 0) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY( 'HISTORY 집계년월(' || PI_YYYYMM || '): ');
            RAISE V_E_ERROR;
        END IF;  
    
        IF (TRIM(PI_REG_ID) IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY('HISTORY 실행자ID(' || PI_REG_ID || '): ');
            RAISE V_E_ERROR;
        END IF;
        
        INSERT INTO RTHS7000 (
            ID,         SLCM_YM,    USER_ID,
            SLS_CD,     BNS_CD,     PYM_CD,
            START_TM,   END_TM,     APL_CNT,
            REG_ID,     REG_DT,
            CHG_ID,     CHG_DT
        )
        SELECT
            FNC_GET_SERIAL_ID('HS'), PI_YYYYMM, PI_REG_ID,
            PI_SLS_CD, PI_BNS_CD, PI_PYM_CD,
            PI_S_TIME, PI_E_TIME, PI_COUNT,
            PI_REG_ID, SYSDATE, 
            PI_REG_ID, SYSDATE
          FROM DUAL;
          
        EXCEPTION 
            WHEN V_E_ERROR THEN
                PO_RET_CODE := TO_CHAR(-1);
                
            WHEN OTHERS THEN
                PO_RET_CODE := SQLCODE;
                PO_RET_MESG := SQLERRM;
    END PRC_AGG_HISTORY_INSERT;
    
    FUNCTION FNC_GET_SERIAL_ID RETURN VARCHAR2 IS
    BEGIN
        RETURN FNC_GET_SERIAL_ID('DF');
    END FNC_GET_SERIAL_ID;
    
    FUNCTION FNC_GET_SERIAL_ID(
        PI_PREFIX   IN VARCHAR2
    ) RETURN VARCHAR2 IS
        V_OUT   VARCHAR2(25);
    BEGIN 
        SELECT SUBSTR(PI_PREFIX, 1, 7) || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') || SEQ_RTHS7000.NEXTVAL
          INTO V_OUT
          FROM DUAL;
        
        RETURN V_OUT;
    END FNC_GET_SERIAL_ID;
    
    /***************************************************************************
        에러 메시지 GET
    ***************************************************************************/
    FUNCTION FNC_ERR_MESG RETURN VARCHAR2 IS
    BEGIN
        RETURN GV_MESG_ERR_DEFAULT;
    END FNC_ERR_MESG;
    
    FUNCTION FNC_ERR_MANDATORY(
        PI_DINAMIC  IN VARCHAR2
    ) RETURN VARCHAR2 IS
    
    BEGIN
        RETURN FNC_ERR_MESG(PI_DINAMIC, GV_MESG_ERR_MANDATORY);
    END FNC_ERR_MANDATORY;
    
    FUNCTION FNC_ERR_SEARCH(
        PI_DINAMIC  IN VARCHAR2
    ) RETURN VARCHAR2 IS
    
    BEGIN
        RETURN FNC_ERR_MESG(PI_DINAMIC, GV_MESG_ERR_SEARCH);
    END FNC_ERR_SEARCH;
    
    FUNCTION FNC_ERR_INSERT(
        PI_DINAMIC  IN VARCHAR2
    ) RETURN VARCHAR2 IS
    
    BEGIN
        RETURN FNC_ERR_MESG(PI_DINAMIC, GV_MESG_ERR_INSERT);
    END FNC_ERR_INSERT;
    
    FUNCTION FNC_ERR_UPDATE(
        PI_DINAMIC  IN VARCHAR2
    ) RETURN VARCHAR2 IS
    
    BEGIN
        RETURN FNC_ERR_MESG(PI_DINAMIC, GV_MESG_ERR_UPDATE);
    END FNC_ERR_UPDATE;
    
    FUNCTION FNC_ERR_DELETE(
        PI_DINAMIC  IN VARCHAR2
    ) RETURN VARCHAR2 IS
    
    BEGIN
        RETURN FNC_ERR_MESG(PI_DINAMIC, GV_MESG_ERR_DELETE);
    END FNC_ERR_DELETE;
    
    FUNCTION FNC_MESG_OK RETURN VARCHAR2 IS
    BEGIN
        RETURN FNC_MESG_OK('');
    END FNC_MESG_OK;
    
    FUNCTION FNC_MESG_OK(PI_DINAMIC     IN VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
        RETURN FNC_UNION_MESG(PI_DINAMIC, GV_MESG_RET_OK, '<REP>');
    END FNC_MESG_OK;
    
    FUNCTION FNC_ERR_MESG(
        PI_DINAMIC  IN VARCHAR2,
        PI_STATIC   IN VARCHAR2
    ) RETURN VARCHAR2 IS
    V_OUT   VARCHAR2(1000);
    
    BEGIN
        V_OUT := FNC_UNION_MESG(PI_DINAMIC, PI_STATIC, '<REP>');
        IF (V_OUT IS NULL) THEN
            V_OUT := GV_MESG_ERR_DEFAULT;
        END IF;
        
        RETURN V_OUT;
        
    END FNC_ERR_MESG;
    
    /***************************************************************************
        메시지 결합
    ***************************************************************************/
    FUNCTION FNC_UNION_MESG(
        PI_DINAMIC  IN VARCHAR2,
        PI_STATIC   IN VARCHAR2,
        PI_OLDSUB   IN VARCHAR2
    ) RETURN VARCHAR2 IS
    V_OUT   VARCHAR2(1000);
    
    BEGIN
        IF (PI_DINAMIC IS NULL AND PI_STATIC IS NULL) THEN
            RETURN NULL;
        END IF;
        
        IF (PI_STATIC IS NULL) THEN
            RETURN NULL;
        END IF;
        
        IF (PI_OLDSUB IS NULL) THEN
            RETURN NULL;
        END IF;
        
        SELECT REPLACE(PI_STATIC, PI_OLDSUB, PI_DINAMIC)
          INTO V_OUT
          FROM DUAL;
        
        RETURN V_OUT;
        
    END FNC_UNION_MESG;
    
    BEGIN
        GV_MESG_RET_OK := '정상적으로 처리되었습니다<REP>';
        
        GV_MESG_ERR_DEFAULT := '시스템관리자에게 문의 바랍니다!';
        GV_MESG_ERR_MANDATORY := '<REP>필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다';
        GV_MESG_ERR_SEARCH := '데이터조회 중 오류가 발생했습니다<REP>';
        GV_MESG_ERR_INSERT := '데이터입력 중 오류가 발생했습니다<REP>';
        GV_MESG_ERR_UPDATE := '데이터수정 중 오류가 발생했습니다<REP>';
        GV_MESG_ERR_DELETE := '데이터삭제 중 오류가 발생했습니다<REP>';
    END;