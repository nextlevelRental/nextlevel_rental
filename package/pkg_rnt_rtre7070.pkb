CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RNT_RTRE7070 AS
/*******************************************************************************
   NAME:      PKG_RNT_RTRE7000
   PURPOSE   

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2022-01-20  김선태           [20220120_01] kstka 특정조건에 해당하는 건만 집계처리
   1.0        2022-01-27  김선태           [20220127_01] kstka 조견표상 사용여부가 Y인 내역만 적용
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
    
    V_A_COUNT       NUMBER DEFAULT 0;
    V_V_COUNT       NUMBER DEFAULT 0;
    V_R_COUNT       NUMBER DEFAULT 0;
    BEGIN
        
        PRC_INNER_AGENT_INCENTIVE(
            PI_YYYYMM, PI_REG_ID, V_A_COUNT, PO_RET_CODE, PO_RET_MESG
        );
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        
        PRC_INNER_VISIT_INCENTIVE(
            PI_YYYYMM, PI_REG_ID, V_V_COUNT, PO_RET_CODE, PO_RET_MESG
        );
        IF (TO_NUMBER(PO_RET_CODE) < 0) THEN
            RAISE V_E_ERROR;
        END IF;
        
        PRC_INNER_ROADIAN_INCENTIVE(
            PI_YYYYMM, PI_REG_ID, V_R_COUNT, PO_RET_CODE, PO_RET_MESG
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
        대리점 판매인센티브 집계
    ***************************************************************************/
    PROCEDURE PRC_INNER_AGENT_INCENTIVE (
        PI_YYYYMM   IN VARCHAR2,    /* 집계년월 */
        PI_REG_ID   IN VARCHAR2,    /* 실행자ID */
        PO_RET_CNT  OUT NUMBER,     /* 적용 COUNT */
        PO_RET_CODE OUT VARCHAR2,     /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2    /* RETURN MESSAGE */
    ) IS
    
    CURSOR C_AGENT IS
    SELECT A.*,
           NVL(B.APL_AMT, 0) APL_AMT,
           A.CNT_CD * NVL(B.APL_AMT, 0) LAST_AMT 
      FROM (
            SELECT A.ORD_NO,
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
                        AND E.CHAN_MCLS_CD IN ('0101' ,'0102', '0103', '0104') -- 타이어테크, 카포스, 애니카, 프로미
                    LEFT OUTER JOIN RTSD0113 F ON -- 판매인정보
                            A.ORD_AGENT = F.ORD_AGENT
                    INNER JOIN RTSD0106 G ON
                            A.ORD_NO = G.ORD_NO
                        AND G.SEQ = 1
                    INNER JOIN RTSD0005 H ON
                            G.MAT_CD = H.MAT_CD
--                        AND H.WHEEL_INCHES > '14' --[20201214_01] kstka 14인치휠은 수수료집계 제외
             WHERE 1=1
               AND A.PROC_DAY BETWEEN PI_YYYYMM || '01' 
                                  AND TO_CHAR(LAST_DAY(TO_DATE(PI_YYYYMM || '01', 'YYYYMMDD')), 'YYYYMMDD')
               AND A.CHAN_CD = '01'
        ) A
            LEFT OUTER JOIN RTRE5000 B ON
                    B.SLS_CD = 'A'
                AND B.BNS_CD = 'I'
                AND B.PYM_CD = 'TIRE'
                AND B.USE_YN = 'Y' --[20220127_01]
                AND A.CNT_SUM BETWEEN (CASE WHEN B.SALE_MIN = -1 THEN A.CNT_SUM ELSE B.SALE_MIN END)
                                  AND (CASE WHEN B.SALE_MAX = -1 THEN A.CNT_SUM ELSE B.SALE_MAX END) 
     WHERE 1=1
--     AND WHEEL_INCHES > '14'  --[20210928_01] kstka 14인치 제약조건 제거 [20211101_01] 다시 추가 [20220504_01] 인치 제한 조건 제거
     AND (CHAN_CD, SEASON_CD, PATTERN_CD) IN (
                    SELECT CHAN_CD, SEASON_CD, PATTERN_CD 
                            FROM RTSD0450 
                            WHERE CHAN_CD = '01' 
                            AND USE_YN = 'Y') --[20220120_01] kstka 특정조건에 해당하는 건만 집계처리
    ;
    
    V_E_ERROR       EXCEPTION;
    V_TMP_TEXT      VARCHAR2(500);
    V_TMP_NUM       NUMBER;
    BEGIN
        PO_RET_CNT := TO_CHAR(0);
    
        /* 필수값: 마감년월, 실행자ID */
        IF (ISDATE(PI_YYYYMM) <> 0) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY( '집계년월(' || PI_YYYYMM || '): ');
            RAISE V_E_ERROR;
        END IF;  
    
        IF (TRIM(PI_REG_ID) IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY('실행자ID(' || PI_REG_ID || '): ');
            RAISE V_E_ERROR;
        END IF;
        
        -- 집계년월 데이터 초기화
        BEGIN
            DELETE
              FROM RTRE7040
             WHERE SLCM_YM = PI_YYYYMM
               AND COMM_TP = 'A1';
        END;
        
        FOR C_ITEM IN C_AGENT LOOP EXIT WHEN C_AGENT%NOTFOUND;
            BEGIN
                V_TMP_TEXT := C_ITEM.ORD_NO;
                
                IF (C_ITEM.APL_AMT <> 0) THEN
                    INSERT INTO RTRE7040 (
                        SLCM_YM,    ORD_NO,     CUST_NO,    ORD_AGENT, 
                        CHAN_CD,    COMM_TP,    MAT_CD,     CNT_CD,
                        SSLCM_AMT,  SAPFDS_AMT, SLCM_AMT,   APFDS_AMT,
                        PPOB_YN,    PROC_DAY,   REG_ID,     CHG_ID
                    )
                    SELECT
                        PI_YYYYMM,      C_ITEM.ORD_NO,  C_ITEM.CUST_NO, C_ITEM.ORD_AGENT,
                        C_ITEM.CHAN_CD, C_ITEM.COMM_TP, C_ITEM.MAT_CD,  C_ITEM.CNT_CD,
                        C_ITEM.LAST_AMT,C_ITEM.APL_AMT, 0,              0,
                        'Y',            C_ITEM.PROC_DAY,PI_REG_ID,      PI_REG_ID
                      FROM DUAL;
                      
                    PO_RET_CNT := PO_RET_CNT + 1;
                END IF;
                
                EXCEPTION
                    WHEN OTHERS THEN
                        PO_RET_MESG := FNC_ERR_INSERT(' [ORD_NO:' || V_TMP_TEXT || '] ' || SQLERRM);
                        RAISE V_E_ERROR;
            END;
        END LOOP;
        
        PO_RET_CODE := TO_CHAR(0);
        PO_RET_MESG := FNC_MESG_OK(' [COUNT:' || PO_RET_CNT || ']');
        
        EXCEPTION 
            WHEN V_E_ERROR THEN
                PO_RET_CODE := TO_CHAR(-1);
                
            WHEN OTHERS THEN
                PO_RET_CODE := SQLCODE;
                PO_RET_MESG := SQLERRM;
        
    END PRC_INNER_AGENT_INCENTIVE;
    
    
    /***************************************************************************
        제휴방판 판매인센티브 집계
    ***************************************************************************/
    PROCEDURE PRC_INNER_VISIT_INCENTIVE (
        PI_YYYYMM   IN VARCHAR2,    /* 집계년월 */
        PI_REG_ID   IN VARCHAR2,    /* 실행자ID */
        PO_RET_CNT  OUT NUMBER,     /* 적용 COUNT */
        PO_RET_CODE OUT VARCHAR2,   /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2    /* RETURN MESSAGE */
    ) IS
    
    CURSOR C_VISIT IS
    SELECT A.*,
           NVL(B.APL_AMT, 0) APL_AMT,
           A.CNT_CD * NVL(B.APL_AMT, 0) LAST_AMT 
      FROM (
            SELECT A.ORD_NO,
                   A.CUST_NO,
                   CASE A.CHAN_CD WHEN '01' THEN A.AGENCY_CD
                                  WHEN '05' THEN A.AGENCY_CD
                                  ELSE A.ORD_AGENT
                   END ORD_AGENT,
                   A.CHAN_CD,
                   'A2' COMM_TP,
                   B.MAT_CD,
                   A.CNT_CD,
                   A.PROC_DAY,
                   A.MFP_YN,
                   A.END_TP,
                   A.CANC_DAY,
                   A.ORD_DAY,
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
                AND B.USE_YN = 'Y' --[20220127_01]
                AND A.CNT_SUM BETWEEN (CASE WHEN B.SALE_MIN = -1 THEN A.CNT_SUM ELSE B.SALE_MIN END)
                                  AND (CASE WHEN B.SALE_MAX = -1 THEN A.CNT_SUM ELSE B.SALE_MAX END) 
     WHERE 1=1
     AND (CHAN_CD, SEASON_CD, PATTERN_CD, CHAN_LCLS_CD, CHAN_MCLS_CD) IN (
                    SELECT CHAN_CD, SEASON_CD, PATTERN_CD, CHAN_LCLS_CD, CHAN_MCLS_CD 
                            FROM RTSD0450 
                            WHERE CHAN_CD = '03'
                            AND CHAN_LCLS_CD = '03'
                            AND CHAN_MCLS_CD = '0303' 
                            AND USE_YN = 'Y') --[20220120_01] kstka 특정조건에 해당하는 건만 집계처리
                            ;
    
    V_E_ERROR       EXCEPTION;
    V_TMP_TEXT      VARCHAR2(500);
    BEGIN
        PO_RET_CNT := 0;
        
        /* 필수값: 마감년월, 실행자ID */
        IF (ISDATE(PI_YYYYMM) <> 0) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY( '집계년월(' || PI_YYYYMM || '): ');
            RAISE V_E_ERROR;
        END IF;  
    
        IF (TRIM(PI_REG_ID) IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY('실행자ID(' || PI_REG_ID || '): ');
            RAISE V_E_ERROR;
        END IF;
        
        -- 집계년월 데이터 초기화
        BEGIN
            DELETE
              FROM RTRE7040
             WHERE SLCM_YM = PI_YYYYMM
               AND COMM_TP = 'A2';
        END;
        
        FOR C_ITEM IN C_VISIT LOOP EXIT WHEN C_VISIT%NOTFOUND;
            BEGIN
                V_TMP_TEXT := C_ITEM.ORD_NO;
                
                IF (C_ITEM.APL_AMT <> 0) THEN
                    INSERT INTO RTRE7040 (
                        SLCM_YM,    ORD_NO,     CUST_NO,    ORD_AGENT, 
                        CHAN_CD,    COMM_TP,    MAT_CD,     CNT_CD,
                        SSLCM_AMT,  SAPFDS_AMT, SLCM_AMT,   APFDS_AMT,
                        PPOB_YN,    PROC_DAY,   REG_ID,     CHG_ID
                    )
                    SELECT
                        PI_YYYYMM,      C_ITEM.ORD_NO,  C_ITEM.CUST_NO, C_ITEM.ORD_AGENT,
                        C_ITEM.CHAN_CD, C_ITEM.COMM_TP, C_ITEM.MAT_CD,  C_ITEM.CNT_CD,
                        C_ITEM.LAST_AMT,C_ITEM.APL_AMT, 0,              0,
                        'Y',            C_ITEM.PROC_DAY,PI_REG_ID,      PI_REG_ID
                      FROM DUAL;
                      
                    PO_RET_CNT := PO_RET_CNT + 1;
                END IF;
                
                EXCEPTION
                    WHEN OTHERS THEN
                        PO_RET_MESG := FNC_ERR_INSERT(' [ORD_NO:' || V_TMP_TEXT || '] ' || SQLERRM);
                        RAISE V_E_ERROR;
            END;
        END LOOP;
        
        PO_RET_CODE := TO_CHAR(0);
        PO_RET_MESG := FNC_MESG_OK(' [COUNT:' || PO_RET_CNT || ']');
        
        EXCEPTION 
            WHEN V_E_ERROR THEN
                PO_RET_CODE := TO_CHAR(-1);
                
            WHEN OTHERS THEN
                PO_RET_CODE := SQLCODE;
                PO_RET_MESG := SQLERRM;
        
    END PRC_INNER_VISIT_INCENTIVE;
    
    
    /***************************************************************************
        MR.ROADIAN 판매인센티브 집계
    ***************************************************************************/
    PROCEDURE PRC_INNER_ROADIAN_INCENTIVE (
        PI_YYYYMM   IN VARCHAR2,    /* 집계년월 */
        PI_REG_ID   IN VARCHAR2,    /* 실행자ID */
        PO_RET_CNT  OUT NUMBER,     /* 적용 COUNT */
        PO_RET_CODE OUT VARCHAR2,     /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2    /* RETURN MESSAGE */
    ) IS
    
    CURSOR C_ROAD IS
    SELECT A.*,
           NVL(B.APL_AMT, 0) APL_AMT,
           A.CNT_CD * NVL(B.APL_AMT, 0) LAST_AMT 
      FROM (
            SELECT A.ORD_NO,
                   A.CUST_NO,
                   CASE A.CHAN_CD WHEN '01' THEN A.AGENCY_CD
                                  WHEN '05' THEN A.AGENCY_CD
                                  ELSE A.ORD_AGENT
                   END ORD_AGENT,
                   A.CHAN_CD,
                   'A3' COMM_TP,
                   B.MAT_CD,
                   A.CNT_CD,
                   A.PROC_DAY,
                   A.MFP_YN,
                   A.END_TP,
                   A.CANC_DAY,
                   A.ORD_DAY,
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
--                        AND H.WHEEL_INCHES > '14' --[20201214_01] kstka 14인치휠은 수수료집계 제외
             WHERE 1=1
               AND A.PROC_DAY BETWEEN PI_YYYYMM || '01' 
                              AND TO_CHAR(LAST_DAY(TO_DATE(PI_YYYYMM || '01', 'YYYYMMDD')), 'YYYYMMDD')
           ) A
            LEFT OUTER JOIN RTRE5000 B ON
                    B.SLS_CD = 'R'
                AND B.BNS_CD = 'I'
                AND B.PYM_CD = 'TIRE'
                AND B.USE_YN = 'Y' --[20220127_01]
                AND A.CNT_SUM BETWEEN (CASE WHEN B.SALE_MIN = -1 THEN A.CNT_SUM ELSE B.SALE_MIN END)
                                  AND (CASE WHEN B.SALE_MAX = -1 THEN A.CNT_SUM ELSE B.SALE_MAX END) 
     WHERE 1=1
--     AND WHEEL_INCHES > '14'  --[20210928_01] kstka 14인치 제약조건 제거 [20211101_01] 다시 추가 [20220504_01] 인치 제한 조건 제거
     AND (CHAN_CD, SEASON_CD, PATTERN_CD, CHAN_LCLS_CD, CHAN_MCLS_CD) IN (
                    SELECT CHAN_CD, SEASON_CD, PATTERN_CD, CHAN_LCLS_CD, CHAN_MCLS_CD 
                            FROM RTSD0450 
                            WHERE CHAN_CD = '03'
                            AND CHAN_LCLS_CD = '03'
                            AND CHAN_MCLS_CD = '0308' 
                            AND USE_YN = 'Y') --[20220120_01] kstka 특정조건에 해당하는 건만 집계처리
     ;
    
    V_E_ERROR       EXCEPTION;
    V_TMP_TEXT      VARCHAR2(500);
    
    BEGIN
        PO_RET_CNT := 0;
        
        /* 필수값: 마감년월, 실행자ID */
        IF (ISDATE(PI_YYYYMM) <> 0) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY( '집계년월(' || PI_YYYYMM || '): ');
            RAISE V_E_ERROR;
        END IF;  
    
        IF (TRIM(PI_REG_ID) IS NULL) THEN
            PO_RET_MESG := FNC_ERR_MANDATORY('실행자ID(' || PI_REG_ID || '): ');
            RAISE V_E_ERROR;
        END IF;
        
        -- 집계년월 데이터 초기화
        BEGIN
            DELETE
              FROM RTRE7040
             WHERE SLCM_YM = PI_YYYYMM
               AND COMM_TP = 'A3';
        END;
        
        FOR C_ITEM IN C_ROAD LOOP EXIT WHEN C_ROAD%NOTFOUND;
            BEGIN
                V_TMP_TEXT := C_ITEM.ORD_NO;
                
                IF (C_ITEM.APL_AMT <> 0) THEN
                    INSERT INTO RTRE7040 (
                        SLCM_YM,    ORD_NO,     CUST_NO,    ORD_AGENT, 
                        CHAN_CD,    COMM_TP,    MAT_CD,     CNT_CD,
                        SSLCM_AMT,  SAPFDS_AMT, SLCM_AMT,   APFDS_AMT,
                        PPOB_YN,    PROC_DAY,   REG_ID,     CHG_ID
                    )
                    SELECT
                        PI_YYYYMM,      C_ITEM.ORD_NO,  C_ITEM.CUST_NO, C_ITEM.ORD_AGENT,
                        C_ITEM.CHAN_CD, C_ITEM.COMM_TP, C_ITEM.MAT_CD,  C_ITEM.CNT_CD,
                        C_ITEM.LAST_AMT,C_ITEM.APL_AMT, 0,              0,
                        'Y',            C_ITEM.PROC_DAY,PI_REG_ID,      PI_REG_ID
                      FROM DUAL;
                      
                    PO_RET_CNT := PO_RET_CNT + 1;
                END IF;
                
                EXCEPTION
                    WHEN OTHERS THEN
                        PO_RET_MESG := FNC_ERR_INSERT(' [ORD_NO:' || V_TMP_TEXT || '] ' || SQLERRM);
                        RAISE V_E_ERROR;
            END;
        END LOOP;
        
        PO_RET_CODE := TO_CHAR(0);
        PO_RET_MESG := FNC_MESG_OK(' [COUNT:' || PO_RET_CNT || ']');
        
        EXCEPTION 
            WHEN V_E_ERROR THEN
                PO_RET_CODE := TO_CHAR(-1);
                
            WHEN OTHERS THEN
                PO_RET_CODE := SQLCODE;
                PO_RET_MESG := SQLERRM;
        
    END PRC_INNER_ROADIAN_INCENTIVE;
    
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
        GV_MESG_ERR_INSERT := '데이터입력 중 오류가 발생했습니다<REP>';
        GV_MESG_ERR_UPDATE := '데이터수정 중 오류가 발생했습니다<REP>';
        GV_MESG_ERR_DELETE := '데이터삭제 중 오류가 발생했습니다<REP>';
    END;