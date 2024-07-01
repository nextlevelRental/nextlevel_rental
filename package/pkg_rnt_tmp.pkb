CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RNT_TMP AS
/******************************************************************************
   NAME:       PKG_RNT_TMP
   PURPOSE:    �������� COMMON PACKAGE TEMP VER

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-12-20  ncho             1. Created this package.
******************************************************************************/

/******************************************************************************
    �μ�Ƽ�� �������� �������� ���� ��ȸ(Temp Ver)
 ******************************************************************************/
    PROCEDURE PRC_LIST_INC_BAS_AGGR_TMP(  REF_CURSOR IN OUT SYS_REFCURSOR
                                        , V_SLCM_YM  IN RTRE7040.SLCM_YM%TYPE /* ������ */
    )

    IS

    BEGIN
        OPEN REF_CURSOR FOR
            SELECT  DISTINCT
                    '�븮��' AS COMM_TP_NM                                 /* ���豸�� */
                  , (CASE WHEN PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID) IS NULL THEN REG_ID
                                                                              ELSE REG_ID || ' / ' || PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID)

                     END
                    ) AS USER_NM                                        /* ������ */
                  , TO_CHAR(REG_DT, 'YYYY-MM-DD HH24:MI:SS') AS EXEC_TM /* ����ð� */
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
                    '�븮��' AS COMM_TP_NM
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
                    '�湮�Ǹ�' AS COMM_TP_NM
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
                    '�湮�Ǹ�' AS COMM_TP_NM
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
                    '�ε��'  AS COMM_TP_NM
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
                    '�ε��' AS COMM_TP_NM
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
    �μ�Ƽ�� / ����� �Ǹ����� �������� ���� ��ȸ(Temp Ver)
 ******************************************************************************/
    PROCEDURE PRC_LIST_INC_SBS_SLS_AGGR_TMP(  REF_CURSOR IN OUT SYS_REFCURSOR
                                            , V_SLCM_YM  IN VARCHAR2 /* ������ */
                                            , V_AGG_GRP  IN VARCHAR2 /* ����׷� */
    )

    IS

    BEGIN
        OPEN REF_CURSOR FOR
          SELECT  TO_CHAR(TO_DATE(SLCM_YM, 'YYYY-MM'), 'YYYY-MM') AS SLCM_YM /* ������ */
                , AGENCY_CD                                                  /* �Ǹ����ڵ� */
                , AGENCY_NM                                                  /* �Ǹ��θ� */
                , USER_GRP_CD                                                /* �Ǹ��α����ڵ� */
                , USER_GRP_NM                                                /* �Ǹ��α��и� */
                , AGNC_INCN                                                  /* �븮���μ�Ƽ�� */
                , AFL_VSLS_INCN                                              /* ���޹����μ�Ƽ�� */
                , RDN_INCN                                                   /* �ε���μ�Ƽ�� */
                , AGNC_SBS                                                   /* �븮������� */
                , AFL_VSLS_SBS                                               /* ���޹�������� */
                , RDN_SBS                                                    /* �ε������� */
                , USER_NM                                                    /* ������ */
                , EXEC_TM                                                    /* ����ð� */
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
    ��������̷� ��ȸ(Temp Ver)
 ******************************************************************************/
    PROCEDURE PRC_LIST_AGGR_EXEC_HST_TMP(  REF_CURSOR IN OUT SYS_REFCURSOR
                                         , V_SLCM_YM  IN RTHS7000.SLCM_YM%TYPE /* ������ */
    )

    IS

    BEGIN
        OPEN REF_CURSOR FOR
            SELECT  SLCM_YM      /* ������� */
                  , (CASE WHEN PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID) IS NULL THEN REG_ID
                                                                              ELSE REG_ID || ' / ' || PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID)

                     END
                    ) AS USER_NM /* ������ */
                  , SLS_CD       /* �Ǹ��ڵ� */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R060', SLS_CD) AS SLS_NM /* �Ǹ��ڵ�� */
                  , BNS_CD       /* ���ʽ��ڵ� */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R061', BNS_CD) AS BNS_NM /* ���ʽ��ڵ�� */
                  , PYM_CD       /* �����ڵ� */
                  , PKG_RTCM0051.f_sRtcm0051CodeName('R062', PYM_CD) AS PYM_NM /* �����ڵ�� */
                  , START_TM     /* ���۽ð� */
                  , END_TM       /* ����ð� */
                  , TO_CHAR(TO_TIMESTAMP(END_TM, 'YYYY-MM-DD HH24:MI:SS.FF3'), 'YYYY-MM-DD HH24:MI:SS.FF3') AS EXEC_TM /* ����ð� */
                  , APL_CNT      /* ����Ǽ� */
            FROM    RTHS7000
            WHERE   SLCM_YM = V_SLCM_YM;

    END PRC_LIST_AGGR_EXEC_HST_TMP;
END PKG_RNT_TMP;
/
