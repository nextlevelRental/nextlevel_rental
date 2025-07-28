CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RNT_COM AS

/******************************************************************************
    렌탈지사 리스트 추출
******************************************************************************/
  PROCEDURE PRC_LIST_RENTAL_GROUP (
    PO_REF_CURSOR   IN OUT SYS_REFCURSOR,
    PI_USR_GROUP    IN VARCHAR2,    -- 사용자 그룹
    PI_USR_ID       IN VARCHAR2,    -- 사용자 ID
    PI_KEYWORD      IN VARCHAR2
  ) IS

    BEGIN
        CASE
            WHEN PI_USR_GROUP IN ('01', '02') THEN
                OPEN PO_REF_CURSOR FOR
                SELECT A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.ORDER_PT    
                  FROM (
                        SELECT CD RENTAL_GROUP,
                               CD_NM RENTAL_GROUP_NM,
                               ORDER_PT
                          FROM RTCM0051 A
                         WHERE 1=1
                           AND USE_YN = 'Y'
                           AND CD_GRP_CD = 'S301'
                       ) A
                  WHERE 1=1
                    AND ((PI_KEYWORD IS NULL) OR (PI_KEYWORD IS NOT NULL AND A.RENTAL_GROUP_NM LIKE '%' || PI_KEYWORD || '%'))
                  GROUP BY
                       A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.ORDER_PT
                  ORDER BY
                        A.ORDER_PT,
                        A.RENTAL_GROUP;
            WHEN PI_USR_GROUP = 'RM' THEN
                OPEN PO_REF_CURSOR FOR
                SELECT A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM    
                  FROM (
                         SELECT CD RENTAL_GROUP,
                               CD_NM RENTAL_GROUP_NM,
                               ORDER_PT
                          FROM RTCM0051 A
                         WHERE 1=1
                           AND USE_YN = 'Y'
                           AND CD_GRP_CD = 'S301'
                       ) A 
                        INNER JOIN  (
                            SELECT RNT_MST_ID USER_ID,
                                   RNT_OFC RENTAL_GROUP,
                                   RNT_PNT RENTAL_OFFICE
                              FROM RTCM0110
                       ) B ON
                              A.RENTAL_GROUP = B.RENTAL_GROUP
                          AND ((PI_USR_ID IS NULL) OR (PI_USR_ID IS NOT NULL AND B.USER_ID = PI_USR_ID))
                          AND ((PI_KEYWORD IS NULL) OR (PI_KEYWORD IS NOT NULL AND A.RENTAL_GROUP_NM LIKE '%' || PI_KEYWORD || '%'))
                  GROUP BY
                       A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.ORDER_PT
                  ORDER BY
                        A.ORDER_PT,
                        A.RENTAL_GROUP;
            ELSE
                OPEN PO_REF_CURSOR FOR
                SELECT A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM
                  FROM (
                         SELECT CD RENTAL_GROUP,
                               CD_NM RENTAL_GROUP_NM,
                               ORDER_PT
                          FROM RTCM0051 A
                         WHERE 1=1
                           AND USE_YN = 'Y'
                           AND CD_GRP_CD = 'S301'
                       ) A 
                        INNER JOIN  (
                            SELECT ORD_AGENT USER_ID,
                                   RENTAL_GROUP,
                                   RENTAL_OFFICE
                              FROM RTSD0113
                            UNION
                            SELECT AGENCY_CD USER_ID,
                                   RENTAL_GROUP,
                                   RENTAL_OFFICE
                              FROM RTSD0007
                            UNION
                            SELECT CARMASTER_NU USER_ID,
                                   RENTAL_GROUP,
                                   RENTAL_OFFICE
                              FROM RTCS0002
                       ) B ON
                              A.RENTAL_GROUP = B.RENTAL_GROUP
                          AND ((PI_USR_ID IS NULL) OR (PI_USR_ID IS NOT NULL AND B.USER_ID = PI_USR_ID))
                          AND ((PI_KEYWORD IS NULL) OR (PI_KEYWORD IS NOT NULL AND A.RENTAL_GROUP_NM LIKE '%' || PI_KEYWORD || '%'))
                  GROUP BY
                       A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.ORDER_PT
                  ORDER BY
                       A.ORDER_PT,
                       A.RENTAL_GROUP;
        END CASE;
        
    END PRC_LIST_RENTAL_GROUP;


/******************************************************************************
    렌탈지점 리스트 추출
******************************************************************************/
  PROCEDURE PRC_LIST_RENTAL_OFFICE (
    PO_REF_CURSOR   IN OUT SYS_REFCURSOR,
    PI_USR_GROUP    IN VARCHAR2,    -- 사용자 그룹
    PI_USR_ID       IN VARCHAR2,    -- 사용자 ID
    PI_RNT_GROUP    IN VARCHAR2,    -- 렌탈그룹
    PI_KEYWORD      IN VARCHAR2
  ) IS
  
  BEGIN
        CASE 
            WHEN PI_USR_GROUP IN ('01', '02') THEN
                OPEN PO_REF_CURSOR FOR
                SELECT A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.RENTAL_OFFICE,
                       A.RENTAL_OFFICE_NM    
                  FROM (
                        SELECT B.CD RENTAL_GROUP,
                               B.CD_NM RENTAL_GROUP_NM,
                               B.ORDER_PT B_ORDER,
                               A.CD RENTAL_OFFICE,
                               A.CD_NM RENTAL_OFFICE_NM,
                               A.ORDER_PT A_ORDER
                          FROM RTCM0051 A
                                INNER JOIN RTCM0051 B ON
                                        A.RFR_1 = B.CD_GRP_CD
                                    AND A.RFR_2 = B.CD
                         WHERE 1=1
                           AND A.USE_YN = 'Y'
                           AND B.USE_YN = 'Y'
                           AND A.RFR_1 = 'S301'
                           AND A.RFR_2 IS NOT NULL
                           AND ((PI_RNT_GROUP IS NULL) OR (PI_RNT_GROUP IS NOT NULL AND A.RFR_2 = PI_RNT_GROUP))
                       ) A
                  WHERE 1=1
                    AND ((PI_KEYWORD IS NULL) OR (PI_KEYWORD IS NOT NULL AND A.RENTAL_OFFICE_NM LIKE '%' || PI_KEYWORD || '%'))
                  GROUP BY
                       A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.RENTAL_OFFICE,
                       A.RENTAL_OFFICE_NM,
                       B_ORDER,
                       A_ORDER
                  ORDER BY
                        A.B_ORDER,
                        A.A_ORDER,
                        A.RENTAL_OFFICE;
            WHEN PI_USR_GROUP = 'RM' THEN
                OPEN PO_REF_CURSOR FOR
                SELECT A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.RENTAL_OFFICE,
                       A.RENTAL_OFFICE_NM    
                  FROM (
                        SELECT B.CD RENTAL_GROUP,
                               B.CD_NM RENTAL_GROUP_NM,
                               B.ORDER_PT B_ORDER,
                               A.CD RENTAL_OFFICE,
                               A.CD_NM RENTAL_OFFICE_NM,
                               A.ORDER_PT A_ORDER
                          FROM RTCM0051 A
                                INNER JOIN RTCM0051 B ON
                                        A.RFR_1 = B.CD_GRP_CD
                                    AND A.RFR_2 = B.CD
                         WHERE 1=1
                           AND A.USE_YN = 'Y'
                           AND B.USE_YN = 'Y'
                           AND A.RFR_1 = 'S301'
                           AND A.RFR_2 IS NOT NULL
                           AND ((PI_RNT_GROUP IS NULL) OR (PI_RNT_GROUP IS NOT NULL AND A.RFR_2 = PI_RNT_GROUP))
                       ) A 
                        INNER JOIN  (
                            SELECT RNT_MST_ID USER_ID,
                                   RNT_OFC RENTAL_GROUP,
                                   RNT_PNT RENTAL_OFFICE
                              FROM RTCM0110
                       ) B ON
                              A.RENTAL_GROUP = B.RENTAL_GROUP
                          AND A.RENTAL_OFFICE = B.RENTAL_OFFICE
                          AND ((PI_USR_ID IS NULL) OR (PI_USR_ID IS NOT NULL AND B.USER_ID = PI_USR_ID))
                          AND ((PI_KEYWORD IS NULL) OR (PI_KEYWORD IS NOT NULL AND A.RENTAL_OFFICE_NM LIKE '%' || PI_KEYWORD || '%'))
                  GROUP BY
                       A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.RENTAL_OFFICE,
                       A.RENTAL_OFFICE_NM,
                       A.B_ORDER,
                       A.A_ORDER
                  ORDER BY
                        A.B_ORDER,
                        A.A_ORDER,
                        A.RENTAL_OFFICE;
            ELSE
                OPEN PO_REF_CURSOR FOR
                SELECT A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.RENTAL_OFFICE,
                       A.RENTAL_OFFICE_NM
                  FROM (
                        SELECT B.CD RENTAL_GROUP,
                               B.CD_NM RENTAL_GROUP_NM,
                               B.ORDER_PT B_ORDER,
                               A.CD RENTAL_OFFICE,
                               A.CD_NM RENTAL_OFFICE_NM,
                               A.ORDER_PT A_ORDER
                          FROM RTCM0051 A
                                INNER JOIN RTCM0051 B ON
                                        A.RFR_1 = B.CD_GRP_CD
                                    AND A.RFR_2 = B.CD
                         WHERE 1=1
                           AND A.USE_YN = 'Y'
                           AND B.USE_YN = 'Y'
                           AND A.RFR_1 = 'S301'
                           AND A.RFR_2 IS NOT NULL
                           AND ((PI_RNT_GROUP IS NULL) OR (PI_RNT_GROUP IS NOT NULL AND A.RFR_2 = PI_RNT_GROUP))
                       ) A 
                        INNER JOIN  (
                            SELECT ORD_AGENT USER_ID,
                                   RENTAL_GROUP,
                                   RENTAL_OFFICE
                              FROM RTSD0113
                            UNION
                            SELECT AGENCY_CD USER_ID,
                                   RENTAL_GROUP,
                                   RENTAL_OFFICE
                              FROM RTSD0007
                            UNION
                            SELECT CARMASTER_NU USER_ID,
                                   RENTAL_GROUP,
                                   RENTAL_OFFICE
                              FROM RTCS0002
                       ) B ON
                              A.RENTAL_GROUP = B.RENTAL_GROUP
                          AND A.RENTAL_OFFICE = B.RENTAL_OFFICE
                          AND ((PI_USR_ID IS NULL) OR (PI_USR_ID IS NOT NULL AND B.USER_ID = PI_USR_ID))
                          AND ((PI_KEYWORD IS NULL) OR (PI_KEYWORD IS NOT NULL AND A.RENTAL_OFFICE_NM LIKE '%' || PI_KEYWORD || '%'))
                  GROUP BY
                       A.RENTAL_GROUP,
                       A.RENTAL_GROUP_NM,
                       A.RENTAL_OFFICE,
                       A.RENTAL_OFFICE_NM,
                       A.B_ORDER,
                       A.A_ORDER
                  ORDER BY
                        A.B_ORDER,
                        A.A_ORDER,
                        A.RENTAL_OFFICE;
        END CASE;
  END PRC_LIST_RENTAL_OFFICE;

/******************************************************************************
    인센티브 기초집계 최종수행 내역 조회
******************************************************************************/
  PROCEDURE PRC_LIST_INC_BAS_AGGR(
    REF_CURSOR IN OUT SYS_REFCURSOR,
    V_SLCM_YM  IN RTRE7040.SLCM_YM%TYPE /* 집계년월 */
  ) IS
  
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
  
  END PRC_LIST_INC_BAS_AGGR;
/******************************************************************************
    인센티브 / 장려금 판매집계 최종수행 내역 조회
******************************************************************************/
  PROCEDURE PRC_LIST_INC_SBS_SLS_AGGR(
    REF_CURSOR IN OUT SYS_REFCURSOR,
    V_SLCM_YM  IN VARCHAR2, /* 집계년월 */
    V_AGG_GRP  IN VARCHAR2  /* 집계그룹 */
  ) IS
  
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
  
  END PRC_LIST_INC_SBS_SLS_AGGR;

/******************************************************************************
    집계수행이력 조회
******************************************************************************/
  PROCEDURE PRC_LIST_AGGR_EXEC_HST(
    REF_CURSOR IN OUT SYS_REFCURSOR,
    V_SLCM_YM  IN RTHS7000.SLCM_YM%TYPE /* 집계년월 */
  ) IS
  
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
  
  END PRC_LIST_AGGR_EXEC_HST;
END PKG_RNT_COM;