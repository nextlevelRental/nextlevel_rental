CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0160 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0160
    PURPOSE : 선납내역 저장
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-11  ncho             1. Created this package body.
 *******************************************************************************/

/*****************************************************************************
 -- 선납개월 선택항목 조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrptMonList(Ref_Cursor IN OUT SYS_REFCURSOR)

    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  DC_CD           AS CD
                  , MAX_CNT || '개월' AS CD_NM
                  , MAX_CNT         AS CD_VAL
            FROM   RTSD0025
            WHERE  DC_GB = 'A'
            AND    STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
            --AND    STD_END_DAY >= '20181231'
            ORDER BY DC_CD;
    END p_sRtre0160PrptMonList;

/*****************************************************************************
 -- 선납금액계산
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePymntAmtCalc(  Ref_Cursor IN OUT SYS_REFCURSOR
                                         , v_Ord_No   IN RTSD0109.ORD_NO%TYPE  /* 계약번호 */
                                         , v_Dc_Cd    IN RTSD0025.DC_CD%TYPE   /* 할인코드 */
                                         , v_Prpt_Mon IN RTSD0025.MAX_CNT%TYPE /* 선납개월 */
                                        )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
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
          , TOT_ARRE_AMT - ((TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT , -1) * TOT_SLS_CNT) + ARRE_AMT)   AS REMAIN_AMT         /* 남은금액 */
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
        
--            SELECT  TOT_PRPT_AMT                                                                                                 /* 총선납대상금액 */
--                  , TOT_PRPT_AMT / v_Prpt_Mon                                                               AS MON_TOT_PRPT_AMT  /* 총월렌탈료 */
--                  , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon, -1)                                AS REAL_MON_PRPT_AMT /* 할인 월렌탈료 */
--                  , TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon , -1) * v_Prpt_Mon                  AS REAL_PRPT_AMT     /* 선납금액 */
--                  , (TOT_PRPT_AMT - TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon , -1) * v_Prpt_Mon) AS TOT_DC_AMT        /* 총 할인금액 */
--                  , ARRE_AMT                                                                                                     /* 미납금액 */
--                  , (TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / v_Prpt_Mon , -1) * v_Prpt_Mon) + ARRE_AMT     AS TOT_RECP_AMT      /* 총 납부금액 */
--                  , START_SEQ                                                                                                    /* 시작회차 */
--                  , END_SEQ                                                                                                      /* 종료회차 */
--                  , DC_RATE                                                                                                      /* 할인률  */
--                  , DC_AMT                                                                                                       /* 할인금액 */
--                  , TOT_ARRE_AMT - ((TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / 12 , -1) * 12) + ARRE_AMT)   AS REMAIN_AMT         /* 남은금액 */
--            FROM    (SELECT  TOT_PRPT_AMT
--                           , START_SEQ
--                           , END_SEQ
--                           , DC_RATE
--                           , DC_AMT
--                           , NVL(ARRE_AMT, 0) + NVL(REGI_AMT,0) AS ARRE_AMT
--                           , (SELECT SUM(ARRE_AMT) FROM   RTSD0109 WHERE ORD_NO   = v_Ord_No AND ARRE_AMT > 0 AND SCD_STAT = 'S') AS TOT_ARRE_AMT
--                           , (CASE WHEN DC_RATE IS NOT NULL THEN (TOT_PRPT_AMT * DC_RATE) * 0.01
--                                   WHEN DC_RATE IS NULL     THEN (TOT_PRPT_AMT - DC_AMT)
--                              END
--                             ) AS TOT_DC_PRPT_AMT
--                     FROM    (SELECT  SUM(NVL(A.ARRE_AMT,0)) AS TOT_PRPT_AMT /* 총 선납금 */
--                                    , MIN(A.SCHD_SEQ) AS START_SEQ    /* 선납시작회차 */
--                                    , MAX(A.SCHD_SEQ) AS END_SEQ      /* 선납종료회차 */
--                                    , MAX((SELECT DC_RATE FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_RATE
--                                    , MAX((SELECT DC_AMT  FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_AMT
--                                    , MAX((SELECT SUM(NVL(X.ARRE_AMT, 0))
--                                           FROM   RTSD0109 X
--                                           WHERE  X.ORD_NO   = v_Ord_No
--                                           AND    X.ARRE_AMT > 0
--                                           AND    X.RECP_TP = '01'
--                                           AND    X.RC_YN <> 'Y'
--                                           AND    X.SCD_STAT = 'S'
--                                          ))          AS REGI_AMT   /* 등록금*/                                   
--                                    , MAX((SELECT SUM(NVL(Y.ARRE_AMT, 0))
--                                           FROM   RTSD0109 Y
--                                           WHERE  Y.ORD_NO   = v_Ord_No
--                                           AND    Y.ARRE_AMT > 0
--                                           AND    Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                                           AND    Y.SCD_STAT = 'S'
--                                           AND    Y.RECP_TP = '11'
--                                          ))          AS ARRE_AMT     /* 연체금 */
--                              FROM    RTSD0109 A
--                              WHERE   A.ORD_NO   = v_Ord_No
--                              AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                              AND     A.RC_YN    = 'N'
--                              AND     A.SALE_AMT > 0
--                              AND     A.ARRE_AMT > 0
--                              AND     A.USE_YN   = 'Y'
--                              AND     A.SCD_STAT = 'S'
--                              AND     A.RECP_TP = '11'
--                              AND     ROWNUM    <= v_Prpt_Mon
--                             )
--                    );
    END p_sRtre0160PrePymntAmtCalc;

/*****************************************************************************
 -- 납부예정상세 조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PymntSchdlDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Ord_No   IN RTSD0109.ORD_NO%TYPE  /* 계약번호 */
                                           , v_Dc_Cd    IN RTSD0025.DC_CD%TYPE   /* 할인코드 */
                                           , v_Prpt_Mon IN RTSD0025.MAX_CNT%TYPE /* 선납개월 */
                                          )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            -- 등록비
            SELECT  ORD_NO                                                          /* 계약번호 */
                  , SCHD_SEQ                                          AS SCHD_SEQ_U /* 청구순번 Update */
                  , SCHD_SEQ                                          AS SCHD_SEQ_I /* 청구순번 Insert */
                  , RECP_TP                                                         /* 수납유형코드 */
                  , Pkg_rtcm0051.f_sRtcm0051CodeName('R007', RECP_TP) AS RECP_TP_NM /* 수납유형명 */
                  , RECP_NU                                                         /* 납부회차 */
                  , SALE_AMT                                                        /* 월렌탈료 */
                  , SALE_AMT - SALE_AMT                               AS DC_AMT     /* 선납할인금액 */
                  , RECP_AMT                                                        /* 수납금액 */
                  , ARRE_AMT                                                        /* 미납금액 */
                  , ZFB_DAY                                                         /* 청구마감일 */
            FROM    RTSD0109 X
            WHERE   X.ORD_NO   = v_Ord_No
            AND     X.ARRE_AMT > 0
            AND     X.RECP_TP = '01'
            AND     X.SCD_STAT = 'S'        

            UNION ALL
            -- 연체금
            SELECT  ORD_NO                                                          /* 계약번호 */
                  , SCHD_SEQ                                          AS SCHD_SEQ_U /* 청구순번 Update */
                  , SCHD_SEQ                                          AS SCHD_SEQ_I /* 청구순번 Insert */
                  , RECP_TP                                                         /* 수납유형코드 */
                  , Pkg_rtcm0051.f_sRtcm0051CodeName('R007', RECP_TP) AS RECP_TP_NM /* 수납유형명 */
                  , RECP_NU                                                         /* 납부회차 */
                  , SALE_AMT                                                        /* 월렌탈료 */
                  , SALE_AMT - SALE_AMT                               AS DC_AMT     /* 선납할인금액 */
                  , RECP_AMT                                                        /* 수납금액 */
                  , ARRE_AMT                                                        /* 미납금액 */
                  , ZFB_DAY                                                         /* 청구마감일 */
            FROM    RTSD0109 Y
            WHERE   Y.ORD_NO   = v_Ord_No
            AND     Y.ARRE_AMT > 0
            AND     Y.RECP_TP = '11'
            AND     Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
            AND     Y.SCD_STAT = 'S'

            UNION ALL
            -- 선납
            SELECT  /*+ INDEX(A RTSD0109_PK) */  
                    A.ORD_NO
                  , A.SCHD_SEQ                                               AS SCHD_SEQ_U
                  , PKG_RTSD0109.f_sRtsd0109SchdSeq(v_Ord_No) + ROWNUM - 1  AS SCHD_SEQ_I
                  , '51'                                                     AS RECP_TP
                  , '선납'                                                     AS RECP_TP_NM
                  , A.RECP_NU
                  --, B.TOT_DC_PRPT_AMT                                        AS SALE_AMT
                  , CASE WHEN A.SALE_AMT = 0 THEN A.SALE_AMT
                    ELSE B.TOT_DC_PRPT_AMT END                               AS SALE_AMT                  
                  --, A.SALE_AMT - B.TOT_DC_PRPT_AMT                         AS DC_AMT
                  , CASE WHEN A.SALE_AMT = 0 THEN A.SALE_AMT
                    ELSE A.SALE_AMT - B.TOT_DC_PRPT_AMT END                  AS DC_AMT
                  , A.RECP_AMT
                  --, A.ARRE_AMT - (SALE_AMT - B.TOT_DC_PRPT_AMT)            AS ARRE_AMT
                  , CASE WHEN A.ARRE_AMT = 0 THEN A.ARRE_AMT
                    ELSE A.ARRE_AMT - (SALE_AMT - B.TOT_DC_PRPT_AMT) END     AS ARRE_AMT                  
                  , A.ZFB_DAY
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
--                              AND     A.SALE_AMT > 0
--                              AND     A.ARRE_AMT > 0
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
--            AND     A.SALE_AMT > 0
--            AND     A.ARRE_AMT > 0
            AND     A.USE_YN   = 'Y'
            AND     A.SCD_STAT = 'S'
            AND     A.RECP_TP = '11'
            AND     A.ORD_NO   = B.ORD_NO
            AND     ROWNUM    <= v_Prpt_Mon;           
--            SELECT  A.ORD_NO
--                  , A.SCHD_SEQ                                             AS SCHD_SEQ_U
--                  , PKG_RTSD0109.f_sRtsd0109SchdSeq(v_Ord_No) + ROWNUM - 1 AS SCHD_SEQ_I
--                  , '51'                                                   AS RECP_TP
--                  , '선납'                                                   AS RECP_TP_NM
--                  , A.RECP_NU
--                  , B.TOT_DC_PRPT_AMT                                      AS SALE_AMT
--                  , A.SALE_AMT - B.TOT_DC_PRPT_AMT                         AS DC_AMT
--                  , A.RECP_AMT
--                  , A.ARRE_AMT - (SALE_AMT - B.TOT_DC_PRPT_AMT)            AS ARRE_AMT
--                  , A.ZFB_DAY
--            FROM    RTSD0109 A
--                  , (SELECT  ORD_NO
--                           , (CASE WHEN DC_RATE IS NOT NULL THEN TRUNC((TOT_PRPT_AMT - ((TOT_PRPT_AMT * DC_RATE) * 0.01)) / v_Prpt_Mon, -1)
--                                   WHEN DC_RATE IS NULL     THEN TRUNC((TOT_PRPT_AMT - (TOT_PRPT_AMT - DC_AMT)) / v_Prpt_Mon, -1)
--                              END
--                             ) AS TOT_DC_PRPT_AMT
--                     FROM    (SELECT  A.ORD_NO
--                                    , SUM(NVL(A.ARRE_AMT, 0)) AS TOT_PRPT_AMT /* 총 선납금 */
--                                    , MIN(A.SCHD_SEQ)         AS START_SEQ    /* 선납시작회차 */
--                                    , MAX(A.SCHD_SEQ)         AS END_SEQ      /* 선납종료회차 */
--                                    , MAX((SELECT DC_RATE FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_RATE
--                                    , MAX((SELECT DC_AMT  FROM RTSD0025 WHERE DC_CD = v_Dc_Cd AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD'))) AS DC_AMT
--                                    , MAX((SELECT SUM(NVL(Y.ARRE_AMT, 0))
--                                           FROM   RTSD0109 Y
--                                           WHERE  Y.ORD_NO   = v_Ord_No
--                                           AND    Y.ARRE_AMT > 0
--                                           AND    Y.ZFB_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                                           AND    Y.SCD_STAT = 'S'
--                                           AND    Y.RECP_TP = '11'
--                                          ))                  AS ARRE_AMT     /* 연체금 */
--                              FROM    RTSD0109 A
--                              WHERE   A.ORD_NO   = v_Ord_No
--                              AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
--                              AND     A.RC_YN    = 'N'
--                              AND     A.SALE_AMT > 0
--                              AND     A.ARRE_AMT > 0
--                              AND     A.USE_YN   = 'Y'
--                              AND     A.SCD_STAT = 'S'
--                              AND     A.RECP_TP = '11'
--                              AND     ROWNUM    <= v_Prpt_Mon
--                              GROUP BY A.ORD_NO
--                             )
--                    )        B
--            WHERE   A.ORD_NO   = v_Ord_No
--            AND     A.ZFB_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')
--            AND     A.RC_YN    = 'N'
--            AND     A.SALE_AMT > 0
--            AND     A.ARRE_AMT > 0
--            AND     A.USE_YN   = 'Y'
--            AND     A.SCD_STAT = 'S'
--            AND     A.RECP_TP = '11'
--            AND     A.ORD_NO   = B.ORD_NO
--            AND     ROWNUM    <= v_Prpt_Mon;
    END p_sRtre0160PymntSchdlDtlList;

/*******************************************************************************
 -- 선납요청일련번호 채번
 *******************************************************************************/
    FUNCTION f_sRtre0160PrptSeq
    RETURN NUMBER

    IS

    v_Prpt_Seq RTRE0160.PRPT_SEQ%TYPE DEFAULT 0; /* 선납요청일련번호 */

    BEGIN
        SELECT NVL2(MAX(PRPT_SEQ), TO_NUMBER(MAX(PRPT_SEQ)) + 1, 1)
        INTO   v_Prpt_Seq
        FROM   RTRE0160
        WHERE  PRPT_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD');
        RETURN v_Prpt_Seq;

    EXCEPTION
        WHEN OTHERS THEN RETURN 0;
    END f_sRtre0160PrptSeq;

/*******************************************************************************
 -- 선납내역 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0160PrePymntMst(  v_Prpt_Seq       IN  RTRE0160.PRPT_SEQ%TYPE       /* 선납요청일련번호 */
                                          , v_Ord_No         IN  RTRE0160.ORD_NO%TYPE         /* 계약번호 */
                                          , v_Cust_No        IN  RTRE0160.CUST_NO%TYPE        /* 고객번호 */
                                          , v_Recp_Fg        IN  RTRE0160.RECP_FG%TYPE        /* 수납유형 */
                                          , v_Recp_Pay       IN  RTRE0160.RECP_PAY%TYPE       /* 수납방법 */
                                          , v_Recv_Seq       IN  RTRE0160.RECV_SEQ%TYPE       /* 수납거래번호 */
                                          , v_Recp_Trno      IN  RTRE0160.RECP_TRNO%TYPE      /* 납부별수납고유번호 */
                                          , v_Prpt_Mnct      IN  RTRE0160.PRPT_MNCT%TYPE      /* 선납개월 */
                                          , v_Prpt_Dscn_Rt   IN  RTRE0160.PRPT_DSCN_RT%TYPE   /* 선납할인율 */
                                          , v_Tot_Rnt_Amt    IN  RTRE0160.TOT_RNT_AMT%TYPE    /* 총렌탈금액 */
                                          , v_Tot_Prpt_Dcamt IN  RTRE0160.TOT_PRPT_DCAMT%TYPE /* 총할인금액 */
                                          , v_Tot_Prpt_Amt   IN  RTRE0160.TOT_PRPT_AMT%TYPE   /* 납입예정금액 */
                                          , v_Prpt_Blnc_Amt  IN  RTRE0160.PRPT_BLNC_AMT%TYPE  /* 미납금액 */
                                          , v_Prpt_Sttg_Tmbt IN  RTRE0160.PRPT_STTG_TMBT%TYPE /* 선납시작회차 */
                                          , v_Prpt_Fnsh_Tmbt IN  RTRE0160.PRPT_FNSH_TMBT%TYPE /* 선납종료회차 */
                                          , v_Recv_Day       IN  RTRE0160.RECV_DAY%TYPE       /* 선납수납일자 */
                                          , v_Reg_Id         IN  RTRE0160.REG_ID%TYPE         /* 등록자 ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_Error_Text     OUT VARCHAR2
                                         )
    IS

    v_Real_Prpt_Amt RTRE0160.TOT_PRPT_AMT%TYPE;
    v_Arre_Amt      RTRE0160.PRPT_BLNC_AMT%TYPE;
    v_Dc_Cd         RTSD0025.DC_CD%TYPE;
    e_Error EXCEPTION;

    BEGIN
    
        -- DC_CD 가져오기
        SELECT DC_CD
          INTO v_Dc_Cd
          FROM RTSD0025                
         WHERE 1=1
           AND DC_GB = 'A'
           AND MAX_CNT = v_Prpt_Mnct
           AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD');    
    
          -- 선납금액과 연체금액을 구하여 파라미터로 입력된 선납금액과 연체금액이 맞는지 확인
        SELECT  TRUNC((TOT_PRPT_AMT - TOT_DC_PRPT_AMT) / TOT_SLS_CNT , -1) * TOT_SLS_CNT                  AS REAL_PRPT_AMT     /* 선납금액 */
              , ARRE_AMT                                                                                                     /* 미납금액 */
          INTO  v_Real_Prpt_Amt, v_Arre_Amt    
        FROM    (SELECT  TOT_PRPT_AMT
                       , NVL(ARRE_AMT, 0) + NVL(REGI_AMT,0) AS ARRE_AMT
                       , TOT_SLS_CNT
                       , (CASE WHEN DC_RATE IS NOT NULL THEN (TOT_PRPT_AMT * DC_RATE) * 0.01
                               WHEN DC_RATE IS NULL     THEN (TOT_PRPT_AMT - DC_AMT)
                          END
                         ) AS TOT_DC_PRPT_AMT                       
                 FROM    (SELECT  SUM(NVL(A.ARRE_AMT,0)) AS TOT_PRPT_AMT /* 총 선납금 */
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
                                               AND     ROWNUM    <= v_Prpt_Mnct
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
                          AND     A.USE_YN   = 'Y'
                          AND     A.SCD_STAT = 'S'
                          AND     A.RECP_TP = '11'
                          AND     ROWNUM    <= v_Prpt_Mnct
                         )
                ); 
                
        IF v_Tot_Prpt_Amt != v_Real_Prpt_Amt THEN
            v_Return_Message := '선납대상금액('||v_Real_Prpt_Amt||')이 : 입력된 선납대상금액('||v_Tot_Prpt_Amt||')과 다릅니다.!';
            RAISE e_Error;
        END IF; 
        
        IF v_Prpt_Blnc_Amt != v_Arre_Amt THEN
            v_Return_Message := '미납금액('||v_Arre_Amt||')이 : 입력된 미납금액('||v_Prpt_Blnc_Amt||')과 다릅니다.!';
            RAISE e_Error;
        END IF;                    
    
        INSERT INTO RTRE0160(  PRPT_DAY
                             , PRPT_SEQ
                             , ORD_NO
                             , CUST_NO
                             , RECP_FG
                             , RECP_PAY
                             , RECV_SEQ
                             , RECP_TRNO
                             , PRPT_MNCT
                             , PRPT_DSCN_RT
                             , TOT_RNT_AMT
                             , TOT_PRPT_DCAMT
                             , TOT_PRPT_AMT
                             , PRPT_BLNC_AMT
                             , PRPT_STTG_TMBT
                             , PRPT_FNSH_TMBT
                             , RECV_DAY
                             , PRPT_CNC_STAT
                             , PRPT_CNC_RSEQ
                             , PRPT_CNC_DAY
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  TO_CHAR(SYSDATE, 'YYYYMMDD')
                             , v_Prpt_Seq
                             , v_Ord_No
                             , v_Cust_No
                             , v_Recp_Fg
                             , v_Recp_Pay
                             , v_Recv_Seq
                             , v_Recp_Trno
                             , v_Prpt_Mnct
                             , v_Prpt_Dscn_Rt
                             , v_Tot_Rnt_Amt
                             , v_Tot_Prpt_Dcamt
                             , v_Tot_Prpt_Amt
                             , v_Prpt_Blnc_Amt
                             , v_Prpt_Sttg_Tmbt
                             , v_Prpt_Fnsh_Tmbt
                             , v_Recv_Day
                             , 'N'
                             , ''
                             , ''
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
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0160.p_InsertRtre0160PrePymntMst(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0160.p_InsertRtre0160PrePymntMst(2)', v_Error_Text, v_Return_Message);
    END p_InsertRtre0160PrePymntMst;

/*******************************************************************************
 -- 선납내역 상세 Insert
 *******************************************************************************/
    PROCEDURE p_InsertRtre0161PrePymntDtl(  v_Prpt_Seq       IN  RTRE0161.PRPT_SEQ%TYPE       /* 선납요청일련번호 */
                                          , v_Ord_No         IN  RTRE0161.ORD_NO%TYPE         /* 계약번호 */
                                          , v_Schd_Seq_I     IN  RTRE0161.SCHD_SEQ%TYPE       /* 스케쥴순번 Insert */
                                          , v_Sale_Amt       IN  RTRE0161.SALE_AMT%TYPE       /* 월정기금액 */
                                          , v_Prpt_Seq_Dcamt IN  RTRE0161.PRPT_SEQ_DCAMT%TYPE /* 선납할인금액(회차별 위약금) */
                                          , v_Reg_Id         IN  RTRE0161.REG_ID%TYPE         /* 등록자 ID */
                                          , v_Success_Code   OUT NUMBER
                                          , v_Return_Message OUT VARCHAR2
                                          , v_Error_Text     OUT VARCHAR2
                                         )
    IS

    e_Error EXCEPTION;

    BEGIN
        INSERT INTO RTRE0161(  ORD_NO
                             , PRPT_SEQ
                             , SCHD_SEQ
                             , SALE_AMT
                             , PRPT_SEQ_DCAMT
                             , REG_ID
                             , REG_DT
                             , CHG_ID
                             , CHG_DT
                            )
        VALUES              (  v_Ord_No
                             , v_Prpt_Seq
                             , v_Schd_Seq_I
                             , v_Sale_Amt
                             , v_Prpt_Seq_Dcamt
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
            --Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0160.p_InsertRtre0160PrePymntDtl(1)', v_Error_Text, v_Return_Message);

        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_Error_Text     := SUBSTR(SQLERRM, 1, 200);
            --Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0160.p_InsertRtre0160PrePymntDtl(2)', v_Error_Text, v_Return_Message);
    END p_InsertRtre0161PrePymntDtl;

/*****************************************************************************
 -- 선납할인수납 청구스케줄 Update
 *****************************************************************************/
    FUNCTION f_UpdateRtsd0109PrePymnt(  v_Ord_No    IN  RTSD0109.ORD_NO%TYPE   /* 계약번호 */
                                      , v_Schd_Seq  IN  RTSD0109.SCHD_SEQ%TYPE /* 스케쥴순번 */
                                      , v_Sale_Amt  IN  RTSD0109.SALE_AMT%TYPE /* 월정기금액 */
                                      , v_Arre_Amt  IN  RTSD0109.ARRE_AMT%TYPE /* 미납금액 */
                                      , v_Chg_Id    IN  RTSD0109.CHG_ID%TYPE   /* 변경자 ID */
                                      , v_ErrorText OUT VARCHAR2
                                     )
    RETURN NUMBER

    IS

    BEGIN

        UPDATE  RTSD0109
        SET     SALE_AMT  = v_Sale_Amt
              , SALE_NAMT = ROUND(v_Sale_Amt / 1.1, 0)
              , SALE_VAMT = v_Sale_Amt - ROUND(v_Sale_Amt / 1.1, 0)
              , ARRE_AMT  = v_Arre_Amt
              , CHG_ID    = v_Chg_Id
              , CHG_DT    = SYSDATE
        WHERE   ORD_NO    = v_Ord_No
        AND     SCHD_SEQ  = v_Schd_Seq;

        RETURN SQLCODE;

    EXCEPTION
        WHEN OTHERS THEN
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RETURN SQLCODE;
    END f_UpdateRtsd0109PrePymnt;


/*****************************************************************************
 -- 선납할인여부
 *****************************************************************************/
    FUNCTION f_Rtsd0105PrePymnt(  v_Ord_No    IN  RTSD0109.ORD_NO%TYPE  /* 계약번호 */
                                )
     RETURN VARCHAR2 IS
     v_prpt_yn   VARCHAR(1);

    BEGIN

    SELECT CASE WHEN SCHD_SEQ >= START_SEQ                          -- 기존선납계약의 경우
                     AND SCHD_SEQ <= END_SEQ THEN 'Y'
                WHEN (MAX_NU - SCHD_SEQ) <= (SELECT MAX_CNT FROM RTSD0025 
                                              WHERE DC_CD = 'A01'   -- 최소선납개월 기준미달건 확인
                                                AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')) 
                THEN 'Y'   
           ELSE 'N'  END AS PRPT_YN
      INTO v_prpt_yn
      FROM
           (
            SELECT NVL(MAX(B.RECP_NU),0)                       AS SCHD_SEQ
                 , MAX(C.PRPT_FNSH_TMBT)                       AS END_SEQ
                 , MIN(C.PRPT_STTG_TMBT)                       AS START_SEQ
                 , Pkg_Rtsd0109.f_sRtsd0109MaxRecpNu(v_Ord_No) AS MAX_NU
              FROM RTSD0109 B
                 , RTRE0160 C
             WHERE 1=1
               AND B.ORD_NO     = v_Ord_No
               AND B.ORD_NO     = C.ORD_NO(+)
               AND B.CUST_NO    = C.CUST_NO(+)
               AND C.PRPT_CNC_STAT(+) <> 'Y'
               AND C.RECV_SEQ(+) IS NOT NULL --가상계좌는 수납된건만 확인
               AND B.ZFB_DAY    <= TO_CHAR(SYSDATE, 'YYYYMMDD')
               AND B.USE_YN     = 'Y'
               AND B.SCD_STAT   = 'S'
           ); 

--    SELECT CASE WHEN SCHD_SEQ >= START_SEQ 
--                     AND SCHD_SEQ <= END_SEQ THEN 'Y'
--           ELSE 'N'  END AS PRPT_YN
--      INTO v_prpt_yn
--      FROM
--           (
--            SELECT MAX(B.RECP_NU)+1        AS SCHD_SEQ
--                 , MAX(C.PRPT_FNSH_TMBT) AS END_SEQ
--                 , MIN(C.PRPT_STTG_TMBT) AS START_SEQ
--              FROM RTSD0109 B
--                 , RTRE0160 C
--             WHERE 1=1
--               AND C.ORD_NO     = v_Ord_No
--               AND B.ORD_NO     = C.ORD_NO
--               AND B.CUST_NO    = C.CUST_NO
--               AND C.PRPT_CNC_STAT <> 'Y'
--               AND B.ZFB_DAY    <= TO_CHAR(SYSDATE, 'YYYYMMDD')
--               AND B.USE_YN     = 'Y'
--               AND B.SCD_STAT   = 'S'
--           );

    RETURN v_prpt_yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;


    END f_Rtsd0105PrePymnt;

/*****************************************************************************
 -- 선납할인가능여부 체크
 *****************************************************************************/
    FUNCTION f_Rtsd0160PrePymntChk(  v_Ord_No    IN  RTSD0109.ORD_NO%TYPE  /* 계약번호 */
                                   , v_Dc_Cd     IN  RTSD0025.DC_CD%TYPE /* 선납할인코드 */

                                )
     RETURN VARCHAR2 IS
     v_prpt_yn   VARCHAR(1);

    BEGIN
    
    SELECT CASE WHEN SCHD_SEQ >= START_SEQ                          -- 기존선납계약의 경우
                     AND SCHD_SEQ <= END_SEQ THEN 'N'
                WHEN (MAX_NU - SCHD_SEQ) < (SELECT MAX_CNT FROM RTSD0025 
                                             WHERE DC_CD = v_Dc_Cd   -- 최소선납개월 기준미달건 확인
                                               AND STD_END_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD')) 
                THEN 'N'   
           ELSE 'Y'  END AS PRPT_YN
      INTO v_prpt_yn
      FROM
           (
            SELECT NVL(MAX(B.RECP_NU),0)                       AS SCHD_SEQ
                 , MAX(C.PRPT_FNSH_TMBT)                       AS END_SEQ
                 , MIN(C.PRPT_STTG_TMBT)                       AS START_SEQ
                 , Pkg_Rtsd0109.f_sRtsd0109MaxRecpNu(v_Ord_No) AS MAX_NU
              FROM RTSD0109 B
                 , RTRE0160 C
             WHERE 1=1
               AND B.ORD_NO     = v_Ord_No
               AND B.ORD_NO     = C.ORD_NO(+)
               AND B.CUST_NO    = C.CUST_NO(+)
               AND C.PRPT_CNC_STAT(+) <> 'Y'
               AND C.RECV_SEQ(+) IS NOT NULL --가상계좌는 수납된건만 확인
               AND B.ZFB_DAY    <= TO_CHAR(SYSDATE, 'YYYYMMDD')
               AND B.USE_YN     = 'Y'
               AND B.SCD_STAT   = 'S'
           );    

    RETURN v_prpt_yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;


    END f_Rtsd0160PrePymntChk;        


/*****************************************************************************
 -- 선납내역조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePaymentMstList(  Ref_Cursor      IN OUT SYS_REFCURSOR
                                           , v_Prpt_From_Day IN RTRE0160.PRPT_DAY%TYPE /* 요청일자(From) */
                                           , v_Prpt_To_Day   IN RTRE0160.PRPT_DAY%TYPE /* 요청일자(To) */
                                           , v_Recv_From_Day IN RTRE0160.RECV_DAY%TYPE /* 수납일자(From) */
                                           , v_Recv_To_Day   IN RTRE0160.RECV_DAY%TYPE /* 수납일자(To) */
                                           , v_Ord_No        IN RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                           , v_Cust_No       IN RTRE0160.CUST_NO%TYPE  /* 고객번호 */
                                          )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  PRPT_DAY       /* 선납요청일자 */
                  , PRPT_SEQ       /* 요청일련번호 */
                  , ORD_NO         /* 계약번호 */
                  , CUST_NO        /* 고객번호 */
                  , PKG_RTSD0100.f_sRtsd0100CustName(CUST_NO)          AS CUST_NM     /* 고객명 */
                  , RECP_PAY       /* 수납방법코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R019', RECP_PAY) AS RECP_PAY_NM /* 수납방법명 */
                  , RECV_SEQ       /* 수납거래번호 */
                  , RECP_TRNO      /* 납부별수납고유번호 */
                  , PRPT_MNCT      /* 선납개월 */
                  , PRPT_DSCN_RT   /* 선납할인율 */
                  , TOT_PRPT_DCAMT /* 총할인금액 */
                  , TOT_PRPT_AMT   /* 총선납금액 */
                  , PRPT_STTG_TMBT /* 선납시작회차 */
                  , PRPT_FNSH_TMBT /* 선납종료회차 */
                  , RECV_DAY       /* 선납수납일자 */
                  , PRPT_CNC_STAT  /* 선납취소여부 */
                  , PRPT_CNC_DAY   /* 선납취소일자 */
                  , (CASE WHEN RECP_PAY = 'P6' THEN PKG_RTRE0210.f_sRtre0210POidSeq(ORD_NO)
                                               ELSE NULL
                     END
                    )                                                  AS P_OID_SEQ   /* 주문일련번호 */
            FROM    RTRE0160
            WHERE   PRPT_DAY BETWEEN v_Prpt_From_Day AND v_Prpt_To_Day
            --AND     RECV_DAY BETWEEN v_Recv_From_Day AND v_Recv_To_Day
            AND     ORD_NO         = DECODE(v_Ord_No,  NULL, ORD_NO,  v_Ord_No)
            AND     CUST_NO        = DECODE(v_Cust_No, NULL, CUST_NO, v_Cust_No);

    END p_sRtre0160PrePaymentMstList;

/*****************************************************************************
 -- 선납내역상세조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePaymentDtlList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Ord_No   IN RTRE0160.ORD_NO%TYPE /* 계약번호 */
                                          )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  B.RECP_NU                 AS SCHD_SEQ            /* 청구회차 */
                  , '51'                      AS RECP_FG             /* 청구구분코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R020', '51') AS RECP_FG_NM /* 청구구분명 */
                  , A.SALE_AMT + A.PRPT_SEQ_DCAMT AS TOT_SALE_AMT   /* 할인전정기금액 */
                  , A.SALE_AMT                                      /* 월정기금액 */
                  , A.PRPT_SEQ_DCAMT                                /* 할인금액 */
            FROM    RTRE0161 A
                  , RTSD0109 B 
            WHERE   A.ORD_NO   = v_Ord_No
              AND   A.ORD_NO   = B.ORD_NO
              AND   A.SCHD_SEQ = B.SCHD_SEQ;

    END p_sRtre0160PrePaymentDtlList;

/*****************************************************************************
 -- 선납할인금액계산
 *****************************************************************************/
    PROCEDURE p_sRtre0160prePymntDscntCalc(  Ref_Cursor IN OUT SYS_REFCURSOR
                                           , v_Ord_No   IN RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                           , v_Zfb_Day  IN RTRE0160.PRPT_DAY%TYPE /* 취소일자 */
                                          )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  ORD_NO                                     /* 계약번호 */
                  , TOT_PRPT_AMT                               /* 선납할인 수납액 */
                  , PRPT_BLNC_AMT                              /* 연체료 */
                  , TOT_PRPT_DCAMT                             /* 총 선납할인액 */
                  , TOT_RECV_AMT                               /* 총 수납금액 */
                  , TOT_DC_AMT                                 /* 위약금 */
                  , PRPT_REMAIN_AMT                            /* 선납할인잔액 */
                  , PRPT_REMAIN_AMT - TOT_DC_AMT AS REFUND_AMT /* 환불금액 */
                  , 0                            AS RENT_AMT   /* 렌탈료잔액 */
            FROM    (SELECT  A.ORD_NO
                           , NVL(A.TOT_PRPT_AMT, 0)       AS TOT_PRPT_AMT
                           , NVL(A.PRPT_BLNC_AMT, 0)      AS PRPT_BLNC_AMT
                           , NVL(A.TOT_PRPT_DCAMT, 0)     AS TOT_PRPT_DCAMT
                           --, NVL(A.TOT_PRPT_AMT, 0) + NVL(A.PRPT_BLNC_AMT, 0) - NVL(A.TOT_PRPT_DCAMT, 0) AS TOT_RECV_AMT
                           , NVL(A.TOT_PRPT_AMT, 0) + NVL(A.PRPT_BLNC_AMT, 0) AS TOT_RECV_AMT
                           , NVL((SELECT SUM(PRPT_SEQ_DCAMT) 
                                    FROM RTRE0161 
                                   WHERE ORD_NO = A.ORD_NO AND PRPT_SEQ = A.PRPT_SEQ
                                     AND SCHD_SEQ <= (SELECT MAX(SCHD_SEQ) FROM   RTSD0109
                                                       WHERE ORD_NO = v_Ord_No 
                                                         AND ZFB_DAY <= v_Zfb_Day)),0) AS TOT_DC_AMT
                           , NVL((SELECT PND_AMT - SBS_AMT
                                  FROM   RTRE0035
                                  WHERE  ORD_NO    = v_Ord_No
                                  AND    PND_STAT <> 'S'
                                  AND    RECV_SEQ = A.RECV_SEQ
                                 ), 0)                                           AS PRPT_REMAIN_AMT
                     FROM    RTRE0160 A
                     WHERE   A.ORD_NO         = v_Ord_No
                     AND     A.PRPT_CNC_STAT <> 'Y'
                   );

    END p_sRtre0160prePymntDscntCalc;

/*****************************************************************************
 -- 선납 Update Data 조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePymntUpdateList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                                            , v_Ord_No     IN RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                            , v_Prpt_Seq   IN RTRE0160.PRPT_SEQ%TYPE /* 선납순번 */
                                            , v_Schd_Seq_U IN RTRE0161.SCHD_SEQ%TYPE /* 청구순번 Update */
                                            , v_Schd_Seq_I IN RTRE0161.SCHD_SEQ%TYPE /* 청구순번 Insert */
                                           )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A.ORD_NO                                                /* 계약번호 */
                  , C.SCHD_SEQ                                AS SCHD_SEQ_U /* 청구순번 Update */
                  , v_Schd_Seq_I                              AS SCHD_SEQ_I /* 청구순번 Insert */
                  , 'C'                                       AS SCD_STAT_U /* 스케쥴상태코드(Update) */
                  , 'I'                                       AS COMM_DVSN  /* 처리구분(I, U, D) */
                  , '11'                                      AS RECP_TP    /* 청구구분 */
                  , C.RECP_NU                                               /* 청구회차 */
                  , 'S'                                       AS SCD_STAT_I /* 스케쥴상태코드(Insert) */
                  , B.SALE_AMT                                              /* 매출금액(VAT 포함) */
                  , ROUND(B.SALE_AMT / 1.1, 0)                AS SALE_NAMT  /* 원금 */
                  , B.SALE_AMT - ROUND(B.SALE_AMT / 1.1, 0)   AS SALE_VAMT  /* 부가세 */
                  , 0                                         AS RECP_AMT   /* 수납금액(VAT 포함) */
                  , B.SALE_AMT                                AS ARRE_AMT   /* 연체금액(VAT 포함) */
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
            AND     A.ORD_NO   = v_Ord_No
            AND     A.PRPT_SEQ = v_Prpt_Seq
            AND     B.SCHD_SEQ = v_Schd_Seq_I
            AND     C.SCHD_SEQ = v_Schd_Seq_U;

    END p_sRtre0160PrePymntUpdateList;

/*****************************************************************************
 -- 선납 취소 Update Data 조회
 *****************************************************************************/
    PROCEDURE p_sRtre0160PrePymntCancelList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                            , v_Ord_No   IN RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                            , v_Prpt_Seq IN RTRE0160.PRPT_SEQ%TYPE /* 선납순번 */
                                           )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
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
            AND     A.PRPT_SEQ = v_Prpt_Seq;

    END p_sRtre0160PrePymntCancelList;

/*****************************************************************************
 -- 선납취소매출 Update
 *****************************************************************************/
    PROCEDURE p_UpdateRtre0160CancelPrpt(  v_Ord_No         IN  RTRE0160.ORD_NO%TYPE        /* 계약번호 */
                                         , v_Prpt_Seq       IN  RTRE0160.PRPT_SEQ%TYPE      /* 요청일련번호 */
                                         , v_Cnc_Rseq       IN  RTRE0160.PRPT_CNC_RSEQ%TYPE /* 선납취소거래번호 */
                                         , v_Reg_Id         IN  RTRE0160.REG_ID%TYPE        /* 등록자 ID */
                                         , v_Success_Code   OUT NUMBER
                                         , v_Return_Message OUT VARCHAR2
                                         , v_ErrorText      OUT VARCHAR2
                                        )
    IS
    
    e_Error EXCEPTION;
    
    BEGIN
    
    UPDATE  RTRE0160
    SET     PRPT_CNC_STAT = 'Y'
          , PRPT_CNC_RSEQ = v_Cnc_Rseq
          , PRPT_CNC_DAY  = TO_CHAR(SYSDATE, 'YYYYMMDD')
          , CHG_ID   = v_Reg_Id
          , CHG_DT   = SYSDATE
    WHERE   ORD_NO   = v_Ord_No
    AND     PRPT_SEQ = v_Prpt_Seq;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';
    
    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0160.p_UpdateRtre0160CancelPrpt(1)', v_ErrorText, v_Return_Message);
        
        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0160.p_UpdateRtre0160CancelPrpt(2)', v_ErrorText, v_Return_Message);
    END p_UpdateRtre0160CancelPrpt;
    
/*****************************************************************************
 -- 가상계좌 선납할인수납 수납번호 Update
 *****************************************************************************/
    FUNCTION f_UpdateRtre0160PrePymnt(  v_Ord_No    IN  RTRE0160.ORD_NO%TYPE   /* 계약번호 */
                                      , v_Recv_Seq  IN  RTRE0160.RECV_SEQ%TYPE /* 수납번호 */
                                      , v_Recp_Trno IN  RTRE0160.RECP_TRNO%TYPE /* 수납거래번호 */
                                      , v_Recv_Day  IN  RTRE0160.RECV_DAY%TYPE /* 수납일 */
                                      , v_Prpt_Day  IN  RTRE0160.PRPT_DAY%TYPE /* 선납등록일 */
                                      , v_Recp_Pay  IN  RTRE0160.RECP_PAY%TYPE /* 납부방법 */
                                      , v_Chg_Id    IN  RTRE0160.CHG_ID%TYPE   /* 변경자 ID */
                                      , v_ErrorText OUT VARCHAR2
                                     )
    RETURN NUMBER

    IS

    BEGIN

        UPDATE  RTRE0160
        SET     RECV_SEQ  = v_Recv_Seq
              , RECP_TRNO = v_Recp_Trno
              , RECV_DAY  = v_Recv_Day
              , CHG_ID    = v_Chg_Id
              , CHG_DT    = SYSDATE
        WHERE   ORD_NO    = v_Ord_No
        AND     PRPT_DAY  = v_Prpt_Day
        AND     RECP_PAY  = v_Recp_Pay;

        RETURN SQLCODE;

    EXCEPTION
        WHEN OTHERS THEN
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RETURN SQLCODE;
    END f_UpdateRtre0160PrePymnt;
        
END Pkg_Rtre0160;
/