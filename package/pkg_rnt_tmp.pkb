CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RNT_TMP AS
/******************************************************************************
   NAME:       PKG_RNT_TMP
   PURPOSE:    조직관리 COMMON PACKAGE TEMP VER

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-12-20  ncho             1. Created this package.
******************************************************************************/

/******************************************************************************
    인센티브 기초집계 최종수행 내역 조회(Temp Ver)
 ******************************************************************************/
    PROCEDURE PRC_LIST_INC_BAS_AGGR_TMP(  REF_CURSOR IN OUT SYS_REFCURSOR
                                        , V_SLCM_YM  IN RTRE7040.SLCM_YM%TYPE /* 집계년월 */
    )

    IS

    BEGIN
        OPEN REF_CURSOR FOR
            SELECT  DISTINCT
                    '대리점' AS COMM_TP_NM                                 /* 집계구분 */
                  , (CASE WHEN PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID) IS NULL THEN REG_ID
                                                                              ELSE REG_ID || ' / ' || PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID)

                     END
                    ) AS USER_NM                                        /* 수행자 */
                  , TO_CHAR(REG_DT, 'YYYY-MM-DD HH24:MI:SS') AS EXEC_TM /* 수행시각 */
            FROM    RTRE7040
            WHERE   SLCM_YM = V_SLCM_YM
            AND     COMM_TP = 'A1'
            AND     REG_DT  = (SELECT MAX(REG_DT)
                               FROM   RTRE7040
                               WHERE  SLCM_YM = V_SLCM_YM
                               AND    COMM_TP = 'A1'
                              )
            UNION ALL
            SELECT  DISTINCT
                    '대리점' AS COMM_TP_NM
                  , ''    AS USER_NM
                  , ''    AS EXEC_TM
            FROM    RTRE7040
            WHERE   NOT EXISTS(SELECT  0
                               FROM    RTRE7040
                               WHERE  SLCM_YM = V_SLCM_YM
                               AND    COMM_TP = 'A1'
                              )
            UNION ALL
            SELECT  DISTINCT
                    '방문판매' AS COMM_TP_NM
                  , (CASE WHEN PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID) IS NULL THEN REG_ID
                                                                              ELSE REG_ID || ' / ' || PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID)

                     END
                    ) AS USER_NM
                  , TO_CHAR(REG_DT, 'YYYY-MM-DD HH24:MI:SS') AS EXEC_TM
            FROM    RTRE7040
            WHERE   SLCM_YM = V_SLCM_YM
            AND     COMM_TP = 'A2'
            AND     REG_DT  = (SELECT MAX(REG_DT)
                               FROM   RTRE7040
                               WHERE  SLCM_YM = V_SLCM_YM
                               AND    COMM_TP = 'A2'
                              )
            UNION ALL
            SELECT  DISTINCT
                    '방문판매' AS COMM_TP_NM
                  , ''     AS USER_NM
                  , ''     AS EXEC_TM
            FROM    RTRE7040
            WHERE   NOT EXISTS(SELECT 1
                               FROM   RTRE7040
                               WHERE  SLCM_YM = V_SLCM_YM
                               AND    COMM_TP = 'A2'
                              )
            UNION ALL
            SELECT  DISTINCT
                    '로디안'  AS COMM_TP_NM
                  , (CASE WHEN PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID) IS NULL THEN REG_ID
                                                                              ELSE REG_ID || ' / ' || PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID)

                     END
                    ) AS USER_NM
                  , TO_CHAR(REG_DT, 'YYYY-MM-DD HH24:MI:SS') AS EXEC_TM
            FROM    RTRE7040
            WHERE   SLCM_YM = V_SLCM_YM
            AND     COMM_TP = 'A3'
            AND     REG_DT  = (SELECT MAX(REG_DT)
                               FROM   RTRE7040
                               WHERE  SLCM_YM = V_SLCM_YM
                               AND    COMM_TP = 'A3'
                              )
            UNION ALL
            SELECT  DISTINCT
                    '로디안' AS COMM_TP_NM
                  , ''    AS USER_NM
                  , ''    AS EXEC_TM
            FROM    RTRE7040
            WHERE   NOT EXISTS(SELECT 1
                               FROM   RTRE7040
                               WHERE  SLCM_YM = V_SLCM_YM
                               AND    COMM_TP = 'A3'
                              );

    END PRC_LIST_INC_BAS_AGGR_TMP;

/******************************************************************************
    인센티브 / 장려금 판매집계 최종수행 내역 조회(Temp Ver)
 ******************************************************************************/
    PROCEDURE PRC_LIST_INC_SBS_SLS_AGGR_TMP(  REF_CURSOR IN OUT SYS_REFCURSOR
                                            , V_SLCM_YM  IN VARCHAR2 /* 집계년월 */
                                            , V_AGG_GRP  IN VARCHAR2 /* 집계그룹 */
    )

    IS

    BEGIN
        OPEN REF_CURSOR FOR
          SELECT  TO_CHAR(TO_DATE(SLCM_YM, 'YYYY-MM'), 'YYYY-MM') AS SLCM_YM /* 집계년월 */
                , AGENCY_CD                                                  /* 판매인코드 */
                , AGENCY_NM                                                  /* 판매인명 */
                , USER_GRP_CD                                                /* 판매인구분코드 */
                , USER_GRP_NM                                                /* 판매인구분명 */
                , AGNC_INCN                                                  /* 대리점인센티브 */
                , AFL_VSLS_INCN                                              /* 제휴방판인센티브 */
                , RDN_INCN                                                   /* 로디안인센티브 */
                , AGNC_SBS                                                   /* 대리점장려금 */
                , AFL_VSLS_SBS                                               /* 제휴방판장려금 */
                , RDN_SBS                                                    /* 로디안장려금 */
                , USER_NM                                                    /* 수행자 */
                , EXEC_TM                                                    /* 수행시각 */
          FROM   (SELECT  A.SLCM_YM
                        , A.AGENCY_CD
                        , B.USER_NM                                            AS AGENCY_NM
                        , (CASE B.USER_GRP WHEN '05' THEN 'A1'
                                           WHEN '08' THEN 'A2'
                                           WHEN '09' THEN 'A3'
                                                     ELSE 'ZZ'
                           END
                          ) AS USER_GRP_CD
                        , PKG_RTCM0051.f_sRtcm0051CodeName('C001', B.USER_GRP) AS USER_GRP_NM
                        , A.AGNC_INCN
                        , A.AFL_VSLS_INCN
                        , A.RDN_INCN
                        , A.AGNC_SBS
                        , A.AFL_VSLS_SBS
                        , A.RDN_SBS
                        , (CASE WHEN PKG_RTCM0001.f_sRtcm0001UserNm(A.REG_ID) IS NULL THEN A.REG_ID
                                                                                      ELSE A.REG_ID || ' / ' || PKG_RTCM0001.f_sRtcm0001UserNm(A.REG_ID)
                           END
                          ) AS USER_NM
                        , TO_CHAR(A.REG_DT, 'YYYY-MM-DD HH24:MI:SS')           AS EXEC_TM
                  FROM            RTRE7070 A
                  LEFT OUTER JOIN RTCM0001 B
                  ON      A.AGENCY_CD = B.USER_ID
                 ) A
          WHERE  A.SLCM_YM = V_SLCM_YM
          AND    (CASE WHEN V_AGG_GRP    IS NULL      THEN 1
                       WHEN A.USER_GRP_CD = V_AGG_GRP THEN 1
                                                      ELSE 0
                  END)     = 1
          ORDER BY  A.SLCM_YM
                  , A.AGENCY_CD;

    END PRC_LIST_INC_SBS_SLS_AGGR_TMP;

/******************************************************************************
    집계수행이력 조회(Temp Ver)
 ******************************************************************************/
    PROCEDURE PRC_LIST_AGGR_EXEC_HST_TMP(  REF_CURSOR IN OUT SYS_REFCURSOR
                                         , V_SLCM_YM  IN RTHS7000.SLCM_YM%TYPE /* 집계년월 */
    )

    IS

    BEGIN
        OPEN REF_CURSOR FOR
            SELECT  SLCM_YM      /* 마감년월 */
                  , (CASE WHEN PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID) IS NULL THEN REG_ID
                                                                              ELSE REG_ID || ' / ' || PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID)

                     END
                    ) AS USER_NM /* 수행자 */
                  , SLS_CD       /* 판매코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R060', SLS_CD) AS SLS_NM /* 판매코드명 */
                  , BNS_CD       /* 보너스코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R061', BNS_CD) AS BNS_NM /* 보너스코드명 */
                  , PYM_CD       /* 지급코드 */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R062', PYM_CD) AS PYM_NM /* 지급코드명 */
                  , START_TM     /* 시작시간 */
                  , END_TM       /* 종료시간 */
                  , TO_CHAR(TO_TIMESTAMP(END_TM, 'YYYY-MM-DD HH24:MI:SS.FF3'), 'YYYY-MM-DD HH24:MI:SS.FF3') AS EXEC_TM /* 수행시각 */
                  , APL_CNT      /* 적용건수 */
            FROM    RTHS7000
            WHERE   SLCM_YM = V_SLCM_YM;

    END PRC_LIST_AGGR_EXEC_HST_TMP;
END PKG_RNT_TMP;
/
