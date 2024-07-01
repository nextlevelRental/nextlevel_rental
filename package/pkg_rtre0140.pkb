CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE0140 AS
/*******************************************************************************
    NAME        PKG_RTRE0140
    PURPOSE     가상계좌 내역 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] 신규 생성
    1.1     2017-10-27  wjim            [20170227_01] 가상계좌 발급 SMS 발송 추가
    1.2     2017-11-15  wjim            [20171115_01] 가상계좌내역조회 조회조건 추가
                                        - 요청자그룹
    1.3     2018-01-05  wjim            [20180104_01] 가상계좌 연체조회 기능 추가
    1.4     2018-11-28  ncho            세틀뱅크 고정형 가상계좌 추가
    1.5     2019-06-04  wjim            [20190604_01] 입금일자 추가
*******************************************************************************/

/*****************************************************************************
 -- 가상계좌 내역 Select

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.2     2017-11-15  wjim            [20171115_01] 요청자그룹 조회조건 추가
    1.4     2018-11-28  ncho            세틀뱅크 고정형 가상계좌 추가
    1.5     2019-06-04  wjim            [20190604_01] 입금일자 추가
 *****************************************************************************/
    PROCEDURE p_sRtre0140(  Ref_Cursor      IN OUT SYS_REFCURSOR
                          , v_Cust_No       IN RTRE0140.CUST_NO%TYPE    /* 고객번호 */
                          , v_Ord_No        IN RTRE0141.ORD_NO%TYPE     /* 계약번호 */
                          , v_Rva_Fday      IN RTRE0140.RVA_DAY%TYPE    /* 요청일자(from) */
                          , v_Rva_Tday      IN RTRE0140.RVA_DAY%TYPE    /* 요청일자(to) */
                          , v_Rqst_Stat     IN RTRE0140.RQST_STAT%TYPE  /* 상태 */
                          , v_Tno           IN RTRE0140.TNO%TYPE        /* 거래고유번호 */
                          , v_Vaccount      IN RTRE0140.VACCOUNT%TYPE   /* 가상계좌번호 */
                          , v_Va_Fday       IN RTRE0140.VA_DATE%TYPE    /* 가상계좌 입금마감일(from) */
                          , v_Va_Tday       IN RTRE0140.VA_DATE%TYPE    /* 가상계좌 입금마감일(to) */
                          , v_App_Fday      IN RTRE0140.APP_TIME%TYPE   /* 가상계좌 발급일(from) */
                          , v_App_Tday      IN RTRE0140.APP_TIME%TYPE   /* 가상계좌 발급일(to) */
                          , v_App_Reg_Id    IN RTRE0140.APP_REG_ID%TYPE /* 가상계좌 발급자ID */
                          , v_Reg_Id        IN RTRE0140.REG_ID%TYPE     /* 발급요청 등록자ID */
                          , v_Ipgm_Fday     IN RTRE0142.IPGM_TIME%TYPE  /* 입금일(from) */
                          , v_Ipgm_Tday     IN RTRE0142.IPGM_TIME%TYPE  /* 입금일(to) */
                          , v_Noti_Id       IN RTRE0142.NOTI_ID%TYPE    /* 입금통보ID */
                          , v_Remitter      IN RTRE0142.REMITTER%TYPE   /* 입금자명 */
                          , v_User_Grp      IN RTCM0001.USER_GRP%TYPE   /* 요청자그룹 */
                         )
    IS

    BEGIN
        OPEN Ref_Cursor FOR
            SELECT  A.CHK          /* Check */
                  , A.RVA_DAY      /* 요청일자 */
                  , A.RVA_SEQ      /* 요청일련번호 */
                  , A.CUST_NO      /* 고객번호 */
                  , A.CUST_NM      /* 고객명 */
                  , A.TORD_NO      /* 통합청구계약번호 */
                  , A.RECP_PAY     /* 수납방법코드 */
                  , A.RECP_PAY_NM  /* 수납방법명 */
                  , A.WORK_SCOPE   /* 업무구분 */
                  , A.RVA_AMT      /* 요청금액 */
                  , A.RQST_STAT    /* 상태 */
                  , A.RQST_STAT_NM /* 상태명 */
                  , A.REG_DT       /* 등록일 */
                  , A.REG_ID       /* 등록자 ID */
                  , A.RES_CD       /* 요청결과코드 */
                  , A.RES_MSG      /* 요청결과메시지 */
                  , A.APP_TIME     /* 가상계좌발급일시 */
                  , A.APP_REG_ID   /* 가상계좌발급자 ID */
                  , A.TNO          /* 거래고유번호 */
                  , A.BANK_NM      /* 은행명 */
                  , A.VACCOUNT     /* 가상계좌번호 */
                  , A.AMOUNT       /* 결제요청금액 */
                  , A.VA_DATE      /* 가상계좌 입금마감일시 */
                  , A.TX_CD        /* 업무처리구분코드 */
                  , A.TX_TM        /* 업무처리완료일시 */
                  , A.OP_CD        /* 입금결과코드 */
                  , A.IPGM_TIME    /* 입금일시 */
                  , A.REMITTER     /* 입금자명 */
                  , A.TOTAL_MNYX   /* 입금금액합계 */
                  , A.RECV_SEQ     /* 수납거래번호 */
                  , A.USER_GRP     /* 사용자 그룹(c001) */
                  , A.USER_GRP_NM  /* 사용자 그룹 코드명 */
                  , CASE WHEN CORD_NO IS NULL THEN 'N' ELSE 'Y' END AS CMFP_YN
            FROM    (SELECT  DISTINCT ''                                    AS CHK
                           , B1.RVA_DAY
                           , B1.RVA_SEQ
                           , B1.CUST_NO
                           , B1.CUST_NM
                           , B1.TORD_NO
                           , 'P4'                                           AS RECP_PAY
                           , PKG_RTCM0051.f_sRtcm0051CodeName('R019', 'P4') AS RECP_PAY_NM
                           , ''                                             AS WORK_SCOPE
                           , B1.RVA_AMT
                           , B1.RQST_STAT
                           , D1.CD_NM                                       AS RQST_STAT_NM
                           , TO_CHAR(B1.REG_DT, 'YYYYMMDDHH24MISS')         AS REG_DT
                           , B1.REG_ID
                           , B1.RES_CD
                           , B1.RES_MSG
                           , B1.APP_TIME
                           , B1.APP_REG_ID
                           , B1.TNO
                           , B1.BANK_NM
                           , B1.VACCOUNT
                           , B1.AMOUNT
                           , B1.VA_DATE
                           , C1.TX_CD
                           , C1.TX_TM
                           , C1.OP_CD
                           , C1.IPGM_TIME
                           , C1.REMITTER
                           , C1.TOTAL_MNYX
                           , B1.RECV_SEQ
                           , E1.USER_GRP
                           , F1.CD_NM                                       AS USER_GRP_NM
                           , G1.COL_01                                      AS CORD_NO
                     FROM    RTRE0141 A1 /* 계좌즉시출금세부내역 */
                           , RTRE0140 B1 /* 가상계좌 내역 */
                           , RTRE0142 C1 /* 가상계좌 통보내역 */
                           , RTCM0051 D1 /* 공통코드 Detail */
                           , RTCM0001 E1 /* 사용자 MASTER */
                           , RTCM0051 F1 /* 공통코드 Detail */
                           , RTTEMPIWJ_190429_01 G1
                     WHERE   A1.RVA_DAY      = B1.RVA_DAY
                     AND     A1.RVA_SEQ      = B1.RVA_SEQ
                     AND     B1.TNO          = C1.TNO(+)
                     AND     B1.NOTI_SEQ     = C1.NOTI_SEQ(+)
                     AND     B1.RQST_STAT    = D1.CD(+)
                     AND     D1.CD_GRP_CD(+) = 'R052'
                     AND     B1.REG_ID       = E1.USER_ID(+)
                     AND     E1.USER_GRP     = F1.CD(+)
                     AND     F1.CD_GRP_CD(+) = 'C001'
                     AND     (v_Rva_Fday    IS NULL OR (v_Rva_Fday  IS NOT NULL AND B1.RVA_DAY   BETWEEN v_Rva_Fday              AND v_Rva_Tday))
                     AND     (v_Va_Fday     IS NULL OR (v_Va_Fday   IS NOT NULL AND B1.APP_TIME  BETWEEN v_Va_Fday   || '000001' AND v_Va_Tday   || '235959'))
                     AND     (v_App_Fday    IS NULL OR (v_App_Fday  IS NOT NULL AND B1.APP_TIME  BETWEEN v_App_Fday  || '000001' AND v_App_Tday  || '235959'))
                     AND     (v_Ipgm_Fday   IS NULL OR (v_Ipgm_Fday IS NOT NULL AND C1.IPGM_TIME BETWEEN v_Ipgm_Fday || '000001' AND v_Ipgm_Tday || '235959'))
                     AND     A1.CUST_NO      = DECODE(v_Cust_No,   NULL, A1.CUST_NO,   v_Cust_No)
                     AND     A1.ORD_NO       = DECODE(v_Ord_No,    NULL, A1.ORD_NO,    v_Ord_No)
                     AND     B1.RQST_STAT    = DECODE(v_Rqst_Stat, NULL, B1.RQST_STAT, v_Rqst_Stat)
                     AND     B1.REG_ID       = DECODE(v_Reg_Id,    NULL, B1.REG_ID,    v_Reg_Id)
                     AND     (v_Tno         IS NULL OR B1.TNO        =  v_Tno)
                     AND     (v_Vaccount    IS NULL OR B1.VACCOUNT   =  v_Vaccount)
                     AND     (v_App_Reg_Id  IS NULL OR B1.APP_REG_ID =  v_App_Reg_Id)
                     AND     (v_Noti_Id     IS NULL OR C1.NOTI_ID    =  v_Noti_Id)
                     AND     (v_Remitter    IS NULL OR C1.REMITTER   =  v_Remitter)
                     AND     (v_User_Grp    IS NULL OR E1.USER_GRP   =  v_User_Grp)
                     AND     A1.ORD_NO       = G1.COL_01(+)

                     UNION ALL

                     SELECT  DISTINCT ''                                      AS CHK
                           , B1.RVA_DAY
                           , B1.RVA_SEQ
                           , B1.CUST_NO
                           , B1.CUST_NM
                           , B1.TORD_NO
                           , 'P5'                                             AS RECP_PAY
                           , PKG_RTCM0051.f_sRtcm0051CodeName('R019', 'P5')   AS RECP_PAY_NM
                           , B1.WORK_SCOPE
                           , B1.RVA_AMT
                           , B1.RQST_STAT
                           , D1.CD_NM                                         AS RQST_STAT_NM
                           , TO_CHAR(B1.REG_DT, 'YYYYMMDDHH24MISS')           AS REG_DT
                           , B1.REG_ID
                           , '0000'                                           AS RES_CD
                           , PKG_RTCM0051.f_sRtcm0051CodeName('R028', '0000') AS RES_MSG
                           , B1.APP_TIME
                           , B1.APP_REG_ID
                           , B1.TNO
                           , B1.BANK_NM
                           , B1.VACCOUNT
                           , B1.AMOUNT
                           , B1.VA_DATE
                           , ''                                               AS TX_CD
                           , C1.TR_IL || C1.TR_SI                             AS TX_TM
                           , C1.INP_ST                                        AS OP_CD
                           , C1.TR_IL || C1.TR_SI                             AS IPGM_TIME
                           , C1.IACCT_NM                                      AS REMITTER
                           , C1.TR_AMT                                        AS TOTAL_MNYX
                           , B1.RECV_SEQ
                           , E1.USER_GRP
                           , F1.CD_NM                                         AS USER_GRP_NM
                           , G1.COL_01                                        AS CORD_NO
                     FROM    RTRE0221  A1 /* 가상계좌(VAN) 세부내역 */
                           , RTRE0220  B1 /* 가상계좌(VAN) 내역 */
                           , VACS_AHST C1 /* 가상계좌 거래내역 원장 */
                           , RTCM0051  D1 /* 공통코드 Detail */
                           , RTCM0001  E1 /* 사용자 MASTER */
                           , RTCM0051  F1 /* 공통코드 Detail */
                           , RTTEMPIWJ_190429_01 G1
                     WHERE   A1.RVA_DAY      = B1.RVA_DAY
                     AND     A1.RVA_SEQ      = B1.RVA_SEQ
                     AND     B1.TR_DAY       = C1.TR_IL(+) --[20190604_01]
                     AND     B1.TNO          = C1.TR_NO(+)
                     AND     B1.RQST_STAT    = D1.CD(+)
                     AND     D1.CD_GRP_CD(+) = 'R052'
                     AND     B1.REG_ID       = E1.USER_ID(+)
                     AND     E1.USER_GRP     = F1.CD(+)
                     AND     F1.CD_GRP_CD(+) = 'C001'
                     AND     (v_Rva_Fday    IS NULL OR (v_Rva_Fday  IS NOT NULL AND B1.RVA_DAY           BETWEEN v_Rva_Fday              AND v_Rva_Tday))
                     AND     (v_Va_Fday     IS NULL OR (v_Va_Fday   IS NOT NULL AND B1.APP_TIME          BETWEEN v_Va_Fday   || '000001' AND v_Va_Tday   || '235959'))
                     AND     (v_App_Fday    IS NULL OR (v_App_Fday  IS NOT NULL AND B1.APP_TIME          BETWEEN v_App_Fday  || '000001' AND v_App_Tday  || '235959'))
                     AND     (v_Ipgm_Fday   IS NULL OR (v_Ipgm_Fday IS NOT NULL AND C1.TR_IL || C1.TR_SI BETWEEN v_Ipgm_Fday || '000001' AND v_Ipgm_Tday || '235959'))
                     AND     A1.CUST_NO      = DECODE(v_Cust_No,   NULL, A1.CUST_NO,   v_Cust_No)
                     AND     A1.ORD_NO       = DECODE(v_Ord_No,    NULL, A1.ORD_NO,    v_Ord_No)
                     AND     B1.RQST_STAT    = DECODE(v_Rqst_Stat, NULL, B1.RQST_STAT, v_Rqst_Stat)
                     AND     B1.REG_ID       = DECODE(v_Reg_Id,    NULL, B1.REG_ID,    v_Reg_Id)
                     AND     (v_Tno         IS NULL OR B1.TNO        =  v_Tno)
                     AND     (v_Vaccount    IS NULL OR B1.VACCOUNT   =  v_Vaccount)
                     AND     (v_App_Reg_Id  IS NULL OR B1.APP_REG_ID =  v_App_Reg_Id)
                     AND     (v_Remitter    IS NULL OR C1.IACCT_NM   =  v_Remitter)
                     AND     (v_User_Grp    IS NULL OR E1.USER_GRP   =  v_User_Grp)
                     AND     A1.ORD_NO       = G1.COL_01(+)
                    ) A
            ORDER BY  A.RVA_DAY
                    , A.RVA_SEQ;
    END p_sRtre0140;

/*****************************************************************************
 -- 가상계좌 연체조회

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.3     2018-01-05  wjim            [20180104_01] 신규개발 (p_sRtre0140를 베이스로 개발)
    1.4     2018-11-28  ncho            세틀뱅크 고정형 가상계좌 추가
    1.5     2019-06-04  wjim            [20190604_01] 입금일자 추가
  *****************************************************************************/
    PROCEDURE p_sRtre0140OrdDelay(  Ref_Cursor  IN OUT SYS_REFCURSOR
                                  , v_Cust_No   IN RTRE0140.CUST_NO%TYPE   /* 고객번호 */
                                  , v_Ord_No    IN RTRE0141.ORD_NO%TYPE    /* 계약번호 */
                                  , v_Dely_Day  IN RTRE0100.DELY_DAY%TYPE  /* 연체기준일자 */
                                  , v_Rva_Fday  IN RTRE0140.RVA_DAY%TYPE   /* 요청일자(from) */
                                  , v_Rva_Tday  IN RTRE0140.RVA_DAY%TYPE   /* 요청일자(to) */
                                  , v_Rqst_Stat IN RTRE0140.RQST_STAT%TYPE /* 상태 */
                                  , v_App_Fday  IN RTRE0140.APP_TIME%TYPE  /* 가상계좌 발급일(from) */
                                  , v_App_Tday  IN RTRE0140.APP_TIME%TYPE  /* 가상계좌 발급일(to) */
                                  , v_Ipgm_Fday IN RTRE0142.IPGM_TIME%TYPE /* 입금일(from) */
                                  , v_Ipgm_Tday IN RTRE0142.IPGM_TIME%TYPE /* 입금일(to) */
                                 )
  IS

  BEGIN
      OPEN Ref_Cursor FOR
          SELECT  A.RVA_DAY      /* 요청일자 */
                , A.RVA_SEQ      /* 요청일련번호 */
                , A.CUST_NO      /* 고객번호 */
                , A.CUST_NM      /* 고객명 */
                , A.TORD_NO      /* 통합청구계약번호 */
                , A.ORD_NO       /* 계약번호 */
                , A.RECP_PAY     /* 수납방법코드 */
                , A.RECP_PAY_NM  /* 수납방법명 */
                , A.WORK_SCOPE   /* 업무구분 */
                , A.APPR_SCNT    /* 연체회차 */
                , A.PAY_DD_DELY  /* 결제일(연체) */
                , A.PAY_DD_CUR   /* 결제일 */
                , A.RVA_AMT      /* 요청금액 */
                , A.USER_GRP     /* 사용자 그룹(c001) */
                , A.USER_GRP_NM  /* 사용자 그룹 코드명 */
                , A.REG_ID       /* 등록자 ID */
                , A.RQST_STAT    /* 상태 */
                , A.RQST_STAT_NM /* 상태명 */
                , A.RES_CD       /* 요청결과코드 */
                , A.RES_MSG      /* 요청결과메시지 */
                , A.APP_TIME     /* 가상계좌발급일시 */
                , A.APP_REG_ID   /* 가상계좌발급자 ID */
                , A.OP_CD        /* 입금결과코드 */
                , A.IPGM_TIME    /* 입금일시 */
                , A.REMITTER     /* 입금자명 */
                , A.TOTAL_MNYX   /* 입금금액합계 */
          FROM    (SELECT  DISTINCT
                           B1.RVA_DAY
                         , B1.RVA_SEQ
                         , B1.CUST_NO
                         , B1.CUST_NM
                         , B1.TORD_NO
                         , A1.ORD_NO
                         , 'P4'                                           AS RECP_PAY
                         , PKG_RTCM0051.f_sRtcm0051CodeName('R019', 'P4') AS RECP_PAY_NM
                         , ''                                             AS WORK_SCOPE
                         , G1.APPR_SCNT
                         , G1.PAY_DD                                      AS PAY_DD_DELY
                         , H1.PAY_DD                                      AS PAY_DD_CUR
                         , B1.RVA_AMT
                         , E1.USER_GRP
                         , F1.CD_NM                                       AS USER_GRP_NM
                         , B1.REG_ID
                         , B1.RQST_STAT
                         , D1.CD_NM                                       AS RQST_STAT_NM
                         , B1.RES_CD
                         , B1.RES_MSG
                         , B1.APP_TIME
                         , B1.APP_REG_ID
                         , C1.OP_CD
                         , C1.IPGM_TIME
                         , C1.REMITTER
                         , C1.TOTAL_MNYX
                   FROM    RTRE0141 A1 /* 계좌즉시출금 세부내역 */
                         , RTRE0140 B1 /* 가상계좌 내역 */
                         , RTRE0142 C1 /* 가상계좌 통보내역 */
                         , RTCM0051 D1 /* 공통코드 Detail */
                         , RTCM0001 E1 /* 사용자 MASTER */
                         , RTCM0051 F1 /* 공통코드 Detail */
                         , RTRE0100 G1 /* 연체대상 집계 내역 */
                         , RTSD0108 H1 /* 장착 정보 */
                   WHERE   A1.RVA_DAY      = B1.RVA_DAY
                   AND     A1.RVA_SEQ      = B1.RVA_SEQ
                   AND     B1.TNO          = C1.TNO(+)
                   AND     B1.NOTI_SEQ     = C1.NOTI_SEQ(+)
                   AND     B1.RQST_STAT    = D1.CD(+)
                   AND     D1.CD_GRP_CD(+) = 'R052'
                   AND     B1.REG_ID       = E1.USER_ID(+)
                   AND     E1.USER_GRP     = F1.CD(+)
                   AND     F1.CD_GRP_CD(+) = 'C001'
                   AND     A1.ORD_NO       = G1.ORD_NO(+)
                   AND     G1.DELY_DAY(+)  = v_Dely_Day
                   AND     G1.RECP_TP(+)   = '11'
                   AND     A1.ORD_NO       = H1.ORD_NO(+)
                   AND     (v_Rva_Fday    IS NULL OR (v_Rva_Fday  IS NOT NULL AND B1.RVA_DAY   BETWEEN v_Rva_Fday              AND v_Rva_Tday))
                   AND     (v_App_Fday    IS NULL OR (v_App_Fday  IS NOT NULL AND B1.APP_TIME  BETWEEN v_App_Fday  || '000001' AND v_App_Tday  || '235959'))
                   AND     (v_Ipgm_Fday   IS NULL OR (v_Ipgm_Fday IS NOT NULL AND C1.IPGM_TIME BETWEEN v_Ipgm_Fday || '000001' AND v_Ipgm_Tday || '235959'))
                   AND     A1.CUST_NO      = DECODE(v_Cust_No,   NULL, A1.CUST_NO,   v_Cust_No)
                   AND     A1.ORD_NO       = DECODE(v_Ord_No,    NULL, A1.ORD_NO,    v_Ord_No)
                   AND     B1.RQST_STAT    = DECODE(v_Rqst_Stat, NULL, B1.RQST_STAT, v_Rqst_Stat)

                   UNION ALL

                   SELECT  DISTINCT
                           B1.RVA_DAY
                         , B1.RVA_SEQ
                         , B1.CUST_NO
                         , B1.CUST_NM
                         , B1.TORD_NO
                         , A1.ORD_NO
                         , 'P5'                                             AS RECP_PAY
                         , PKG_RTCM0051.f_sRtcm0051CodeName('R019', 'P5')   AS RECP_PAY_NM
                         , B1.WORK_SCOPE
                         , G1.APPR_SCNT
                         , G1.PAY_DD                                        AS PAY_DD_DELY
                         , H1.PAY_DD                                        AS PAY_DD_CUR
                         , B1.RVA_AMT
                         , E1.USER_GRP
                         , F1.CD_NM                                         AS USER_GRP_NM
                         , B1.REG_ID
                         , B1.RQST_STAT
                         , D1.CD_NM                                         AS RQST_STAT_NM
                         , '0000'                                           AS RES_CD
                         , PKG_RTCM0051.f_sRtcm0051CodeName('R028', '0000') AS RES_MSG
                         , B1.APP_TIME
                         , B1.APP_REG_ID
                         , C1.INP_ST                                        AS OP_CD
                         , C1.TR_IL || C1.TR_SI                             AS IPGM_TIME
                         , C1.IACCT_NM                                      AS REMITTER
                         , C1.TR_AMT                                        AS TOTAL_MNYX
                   FROM    RTRE0221  A1 /* 가상계좌(VAN) 세부내역 */
                         , RTRE0220  B1 /* 가상계좌(VAN) 내역 */
                         , VACS_AHST C1 /* 가상계좌 거래내역 원장 */
                         , RTCM0051  D1 /* 공통코드 Detail */
                         , RTCM0001  E1 /* 사용자 MASTER */
                         , RTCM0051  F1 /* 공통코드 Detail */
                         , RTRE0100  G1 /* 연체대상 집계 내역 */
                         , RTSD0108  H1 /* 장착 정보 */
                   WHERE   A1.RVA_DAY      = B1.RVA_DAY
                   AND     A1.RVA_SEQ      = B1.RVA_SEQ
                   AND     B1.TR_DAY       = C1.TR_IL(+) --[20190604_01]
                   AND     B1.TNO          = C1.TR_NO(+)
                   AND     B1.RQST_STAT    = D1.CD(+)
                   AND     D1.CD_GRP_CD(+) = 'R052'
                   AND     B1.REG_ID       = E1.USER_ID(+)
                   AND     E1.USER_GRP     = F1.CD(+)
                   AND     F1.CD_GRP_CD(+) = 'C001'
                   AND     A1.ORD_NO       = G1.ORD_NO(+)
                   AND     G1.DELY_DAY(+)  = v_Dely_Day
                   AND     G1.RECP_TP(+)   = '11'
                   AND     A1.ORD_NO       = H1.ORD_NO(+)
                   AND     (v_Rva_Fday    IS NULL OR (v_Rva_Fday  IS NOT NULL AND B1.RVA_DAY           BETWEEN v_Rva_Fday              AND v_Rva_Tday))
                   AND     (v_App_Fday    IS NULL OR (v_App_Fday  IS NOT NULL AND B1.APP_TIME          BETWEEN v_App_Fday  || '000001' AND v_App_Tday  || '235959'))
                   AND     (v_Ipgm_Fday   IS NULL OR (v_Ipgm_Fday IS NOT NULL AND C1.TR_IL || C1.TR_SI BETWEEN v_Ipgm_Fday || '000001' AND v_Ipgm_Tday || '235959'))
                   AND     A1.CUST_NO      = DECODE(v_Cust_No,   NULL, A1.CUST_NO,   v_Cust_No)
                   AND     A1.ORD_NO       = DECODE(v_Ord_No,    NULL, A1.ORD_NO,    v_Ord_No)
                   AND     B1.RQST_STAT    = DECODE(v_Rqst_Stat, NULL, B1.RQST_STAT, v_Rqst_Stat)
                  ) A
          ORDER BY  A.RVA_DAY
                  , A.RVA_SEQ;

  END p_sRtre0140OrdDelay;

  /*****************************************************************************
  -- 가상계좌 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0140 (
      v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* 고객번호              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* 고객명                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* 통합청구계약번호      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* 요청금액              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* 상태                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* 유효기간              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* 유효시간              */
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* 요청결과코드          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* 요청결과메시지        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* 거래고유번호          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* 결제요청금액          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* 은행코드              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* 은행명                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* 가상계좌번호          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* 가상계좌 입금마감일시 */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* 가상계좌 발급일시     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* 가상계좌 발급자ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* 통보순번              */
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* 수납거래번호          */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* 등록자ID              */
    , v_Rva_Day        OUT VARCHAR2
    , v_Rva_Seq        OUT NUMBER
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

    ls_Rva_Day    RTRE0140.RVA_DAY%TYPE;
    ln_Rva_Seq    RTRE0140.RVA_SEQ%TYPE;

  BEGIN

    /*
     * 요청일자 획득
     */
    SELECT  TO_CHAR(SYSDATE, 'YYYYMMDD')
      INTO  ls_Rva_Day
      FROM  DUAL;

    /*
     * 요청일련번호 획득
     */
    SELECT  NVL2(MAX(RVA_SEQ), TO_NUMBER(MAX(RVA_SEQ))+1, 1)
      INTO  ln_Rva_Seq
      FROM  RTRE0140
     WHERE  RVA_DAY = ls_Rva_Day;

    INSERT  INTO RTRE0140 (
          RVA_DAY
        , RVA_SEQ
        , CUST_NO
        , CUST_NM
        , TORD_NO
        , RVA_AMT
        , RQST_STAT
        , EXPIRE_TERM
        , EXPIRE_TIME
        , RES_CD
        , RES_MSG
        , TNO
        , AMOUNT
        , BANK_CD
        , BANK_NM
        , VACCOUNT
        , VA_DATE
        , APP_TIME
        , APP_REG_ID
        , NOTI_SEQ
        , RECV_SEQ
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    ) VALUES (
          ls_Rva_Day        /* 요청일자              */
        , ln_Rva_Seq        /* 요청일련번호          */
        , v_Cust_No         /* 고객번호              */
        , v_Cust_Nm         /* 고객명                */
        , v_Tord_No         /* 통합청구계약번호      */
        , v_Rva_Amt         /* 요청금액              */
        , v_Rqst_Stat       /* 상태                  */
        , v_Expire_Term     /* 유효기간              */
        , v_Expire_Time     /* 유효시간              */
        , v_Res_Cd          /* 요청결과코드          */
        , v_Res_Msg         /* 요청결과메시지        */
        , v_Tno             /* 거래고유번호          */
        , v_Amount          /* 결제요청금액          */
        , v_Bank_Cd         /* 은행코드              */
        , v_Bank_Nm         /* 은행명                */
        , v_Vaccount        /* 가상계좌번호          */
        , v_Va_Date         /* 가상계좌 입금마감일시 */
        , v_App_Time        /* 가상계좌 발급일시     */
        , v_App_Reg_Id      /* 가상계좌 발급자ID     */
        , v_Noti_Seq        /* 통보순번              */
        , v_Recv_Seq        /* 수납거래번호          */
        , v_Reg_Id          /* 등록자ID              */
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );

    v_Rva_Seq := ln_Rva_Seq;
    v_Rva_Day := ls_Rva_Day;

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0140;

  /*****************************************************************************
  -- 가상계좌 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0140 (
      v_Rva_Day         IN RTRE0140.RVA_DAY%TYPE     /* 요청일자              */
    , v_Rva_Seq         IN RTRE0140.RVA_SEQ%TYPE     /* 요청일련번호          */
    , v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* 고객번호              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* 고객명                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* 통합청구계약번호      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* 요청금액              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* 상태                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* 유효기간              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* 유효시간              */
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* 요청결과코드          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* 요청결과메시지        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* 거래고유번호          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* 결제요청금액          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* 은행코드              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* 은행명                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* 가상계좌번호          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* 가상계좌 입금마감일시 */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* 가상계좌 발급일시     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* 가상계좌 발급자ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* 통보순번              */
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* 수납거래번호          */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* 등록자ID              */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTRE0140
       SET  RVA_DAY     = v_Rva_Day         /* 요청일자              */
         ,  RVA_SEQ     = v_Rva_Seq         /* 요청일련번호          */
         ,  CUST_NO     = v_Cust_No         /* 고객번호              */
         ,  CUST_NM     = v_Cust_Nm         /* 고객명                */
         ,  TORD_NO     = v_Tord_No         /* 통합청구계약번호      */
         ,  RVA_AMT     = v_Rva_Amt         /* 요청금액              */
         ,  RQST_STAT   = v_Rqst_Stat       /* 상태                  */
         ,  EXPIRE_TERM = v_Expire_Term     /* 유효기간              */
         ,  EXPIRE_TIME = v_Expire_Time     /* 유효시간              */
         ,  RES_CD      = v_Res_Cd          /* 요청결과코드          */
         ,  RES_MSG     = v_Res_Msg         /* 요청결과메시지        */
         ,  TNO         = v_Tno             /* 거래고유번호          */
         ,  AMOUNT      = v_Amount          /* 결제요청금액          */
         ,  BANK_CD     = v_Bank_Cd         /* 은행코드              */
         ,  BANK_NM     = v_Bank_Nm         /* 은행명                */
         ,  VACCOUNT    = v_Vaccount        /* 가상계좌번호          */
         ,  VA_DATE     = v_Va_Date         /* 가상계좌 입금마감일시 */
         ,  APP_TIME    = v_App_Time        /* 가상계좌 발급일시     */
         ,  APP_REG_ID  = v_App_Reg_Id      /* 가상계좌 발급일시     */
         ,  NOTI_SEQ    = v_Noti_Seq        /* 통보순번              */
         ,  RECV_SEQ    = v_Recv_Seq        /* 수납거래번호          */
         ,  CHG_ID      = v_Reg_Id
         ,  CHG_DT      = SYSDATE
     WHERE  RVA_DAY     = v_Rva_Day
       AND  RVA_SEQ     = v_Rva_Seq
    ;

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0140;

  /*****************************************************************************
  -- 가상계좌 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0140 (
      v_Comm_Dvsn       IN CHAR                      /* 처리구분(I,U,D)       */
    , v_Rva_Day     IN OUT RTRE0140.RVA_DAY%TYPE     /* 요청일자              */
    , v_Rva_Seq     IN OUT RTRE0140.RVA_SEQ%TYPE     /* 요청일련번호          */
    , v_Cust_No         IN RTRE0140.CUST_NO%TYPE     /* 고객번호              */
    , v_Cust_Nm         IN RTRE0140.CUST_NM%TYPE     /* 고객명                */
    , v_Tord_No         IN RTRE0140.TORD_NO%TYPE     /* 통합청구계약번호      */
    , v_Rva_Amt         IN RTRE0140.RVA_AMT%TYPE     /* 요청금액              */
    , v_Rqst_Stat       IN RTRE0140.RQST_STAT%TYPE   /* 상태                  */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* 유효기간              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* 유효시간              */
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* 요청결과코드          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* 요청결과메시지        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* 거래고유번호          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* 결제요청금액          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* 은행코드              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* 은행명                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* 가상계좌번호          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* 가상계좌 입금마감일시 */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* 가상계좌 발급일시     */
    , v_App_Reg_Id      IN RTRE0140.APP_REG_ID%TYPE  /* 가상계좌 발급자ID     */
    , v_Noti_Seq        IN RTRE0140.NOTI_SEQ%TYPE    /* 통보순번              */
    , v_Recv_Seq        IN RTRE0140.RECV_SEQ%TYPE    /* 수납거래번호          */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* 등록자ID              */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값 확인
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '고객번호 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0140 (
              v_Cust_No         /* 고객번호              */
            , v_Cust_Nm         /* 고객명                */
            , v_Tord_No         /* 통합청구계약번호      */
            , v_Rva_Amt         /* 요청금액              */
            , v_Rqst_Stat       /* 상태                  */
            , v_Expire_Term     /* 유효기간              */
            , v_Expire_Time     /* 유효시간              */
            , v_Res_Cd          /* 요청결과코드          */
            , v_Res_Msg         /* 요청결과메시지        */
            , v_Tno             /* 거래고유번호          */
            , v_Amount          /* 결제요청금액          */
            , v_Bank_Cd         /* 은행코드              */
            , v_Bank_Nm         /* 은행명                */
            , v_Vaccount        /* 가상계좌번호          */
            , v_Va_Date         /* 가상계좌 입금마감일시 */
            , v_App_Time        /* 가상계좌 발급일시     */
            , v_App_Reg_Id      /* 가상계좌 발급자ID     */
            , v_Noti_Seq        /* 통보순번              */
            , v_Recv_Seq        /* 수납거래번호          */
            , v_Reg_Id          /* 등록자ID              */
            , v_Rva_Day
            , v_Rva_Seq
            , v_ErrorText
        ) THEN
            v_Return_Message := '가상계좌 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtre0140 (
              v_Rva_Day         /* 요청일자              */
            , v_Rva_Seq         /* 요청일련번호          */
            , v_Cust_No         /* 고객번호              */
            , v_Cust_Nm         /* 고객명                */
            , v_Tord_No         /* 통합청구계약번호      */
            , v_Rva_Amt         /* 요청금액              */
            , v_Rqst_Stat       /* 상태                  */
            , v_Expire_Term     /* 유효기간              */
            , v_Expire_Time     /* 유효시간              */
            , v_Res_Cd          /* 요청결과코드          */
            , v_Res_Msg         /* 요청결과메시지        */
            , v_Tno             /* 거래고유번호          */
            , v_Amount          /* 결제요청금액          */
            , v_Bank_Cd         /* 은행코드              */
            , v_Bank_Nm         /* 은행명                */
            , v_Vaccount        /* 가상계좌번호          */
            , v_Va_Date         /* 가상계좌 입금마감일시 */
            , v_App_Time        /* 가상계좌 발급일시     */
            , v_App_Reg_Id      /* 가상계좌 발급자ID     */
            , v_Noti_Seq        /* 통보순번              */
            , v_Recv_Seq        /* 수납거래번호          */
            , v_Reg_Id          /* 등록자ID              */
            , v_ErrorText
        ) THEN
            v_Return_Message := '가상계좌 내역 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0140.p_IUDRtre0140(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0140.p_IUDRtre0140(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0140;

  /*****************************************************************************
  -- 가상계좌 요청결과 저장

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.1     2017-10-27  wjim            [20170227_01] 가상계좌 발급 SMS 발송 추가
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0140ReqResult (
      v_Rva_Day         IN RTRE0140.RVA_DAY%TYPE     /* 요청일자              */
    , v_Rva_Seq         IN RTRE0140.RVA_SEQ%TYPE     /* 요청일련번호          */
    , v_Expire_Term     IN RTRE0140.EXPIRE_TERM%TYPE /* 유효기간              */
    , v_Expire_Time     IN RTRE0140.EXPIRE_TIME%TYPE /* 유효시간              */
    , v_Res_Cd          IN RTRE0140.RES_CD%TYPE      /* 요청결과코드          */
    , v_Res_Msg         IN RTRE0140.RES_MSG%TYPE     /* 요청결과메시지        */
    , v_Tno             IN RTRE0140.TNO%TYPE         /* 거래고유번호          */
    , v_Amount          IN RTRE0140.AMOUNT%TYPE      /* 결제요청금액          */
    , v_Bank_Cd         IN RTRE0140.BANK_CD%TYPE     /* 은행코드              */
    , v_Bank_Nm         IN RTRE0140.BANK_NM%TYPE     /* 은행명                */
    , v_Vaccount        IN RTRE0140.VACCOUNT%TYPE    /* 가상계좌번호          */
    , v_Va_Date         IN RTRE0140.VA_DATE%TYPE     /* 가상계좌 입금마감일시 */
    , v_App_Time        IN RTRE0140.APP_TIME%TYPE    /* 가상계좌 발급일시     */
    , v_Reg_Id          IN RTRE0140.REG_ID%TYPE      /* 등록자ID              */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    ls_Cust_Nm      RTRE0140.CUST_NM%TYPE;          /*고객명                  */
    ls_Mob_No       RTSD0100.MOB_NO%TYPE;           /*SMS발송번호=고객 휴대폰 */
    ls_Sms_Msg      RTSD0205.SND_MSG%TYPE;          /*발송 SMS메시지          */

    e_Error EXCEPTION;

  BEGIN

    UPDATE  RTRE0140
       SET  RQST_STAT   = DECODE(v_Res_Cd,'0000','3','2')
         ,  EXPIRE_TERM = v_Expire_Term
         ,  EXPIRE_TIME = v_Expire_Time
         ,  RES_CD      = v_Res_Cd
         ,  RES_MSG     = v_Res_Msg
         ,  TNO         = v_Tno
         ,  AMOUNT      = v_Amount
         ,  BANK_CD     = v_Bank_Cd
         ,  BANK_NM     = v_Bank_Nm
         ,  VACCOUNT    = v_Vaccount
         ,  VA_DATE     = v_Va_Date
         ,  APP_TIME    = v_App_Time
         ,  APP_REG_ID  = v_Reg_Id
         ,  CHG_ID      = v_Reg_Id
         ,  CHG_DT      = SYSDATE
     WHERE  RVA_DAY     = v_Rva_Day
       AND  RVA_SEQ     = v_Rva_Seq;

    /*
     * SMS 발송 [20170227_01]
     */
    SELECT  A1.CUST_NM
         ,  B1.MOB_NO
      INTO  ls_Cust_Nm
         ,  ls_Mob_No
      FROM  RTRE0140 A1
         ,  RTSD0100 B1
     WHERE  A1.RVA_DAY = v_Rva_Day
       AND  A1.RVA_SEQ = v_Rva_Seq
       AND  A1.CUST_NO = B1.CUST_NO;

    ls_Sms_Msg := '[넥센타이어] 안녕하세요 '||ls_Cust_Nm||'고객님, 넥스트레벨입니다. 신청하신 가상계좌 정보 안내드립니다.';
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'은행정보 : '||v_Bank_Nm;
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'계좌번호 : '||v_Vaccount;
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'입금자명 : '||ls_Cust_Nm;
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'입금금액 : '||TRIM(TO_CHAR(v_Amount, '999,999,999,999'))||'원';
    ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
    ls_Sms_Msg := ls_Sms_Msg||'계좌 유효기간 : '||REGEXP_REPLACE(SUBSTR(v_Va_Date, 1, 12), '(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})', '\1년 \2월 \3일 \4시 \5분')||' 까지';

    NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
          'I'               /*예약 전송여부         */
        , '00000000000000'  /*예약 전송시간         */
        , ls_Mob_No         /*받는 전화번호         */
        , '18550100'        /*보내는 전화번호       */
        , ls_Sms_Msg        /*메시지내용            */
        , 'S032'            /*사용자지정 필드       */
        , v_Tno             /*사용자지정 필드       */
        , '2'
        , 'RENTAL00000000000012'
        , v_Reg_Id          /*등록자 ID             */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '가상계좌발급 SMS 발송 실패!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0140.p_UpdateRtre0140ReqResult(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0140.p_UpdateRtre0140ReqResult(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0140ReqResult;

  /*****************************************************************************
  -- 가상계좌 입금 수납처리 결과 저장
  *****************************************************************************/
  FUNCTION f_UpdateRtre0140RecvResult (
      v_Rva_Day        IN RTRE0140.RVA_DAY%TYPE       /*요청일자              */
    , v_Rva_Seq        IN RTRE0140.RVA_SEQ%TYPE       /*요청일련번호          */
    , v_Noti_Seq       IN RTRE0140.NOTI_SEQ%TYPE      /*통보순번              */
    , v_Recv_Seq       IN RTRE0140.RECV_SEQ%TYPE      /*수납거래번호          */
    , v_Reg_Id         IN RTRE0140.REG_ID%TYPE        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTRE0140
       SET  RQST_STAT = '6'
         ,  NOTI_SEQ  = v_Noti_Seq
         ,  RECV_SEQ  = v_Recv_Seq
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  RVA_DAY   = v_Rva_Day
       AND  RVA_SEQ   = v_Rva_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0140RecvResult;

END PKG_RTRE0140;
/
