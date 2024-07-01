CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RNT_RTRE7000 AS
    /** 기본 에러 메시지 */
    GV_MESG_RET_OK          VARCHAR2(100);
    
    GV_MESG_ERR_DEFAULT     VARCHAR2(500);
    GV_MESG_ERR_MANDATORY   VARCHAR2(500);
    GV_MESG_ERR_SEARCH      VARCHAR2(500);
    GV_MESG_ERR_INSERT      VARCHAR2(500);
    GV_MESG_ERR_UPDATE      VARCHAR2(500);
    GV_MESG_ERR_DELETE      VARCHAR2(500);
    
    /***************************************************************************
        대리점, 제휴방판, 로디안 인센티브 저장용 레코드 타입
        2022.01.27 kstka 신규 추가 컬럼 적용
    ***************************************************************************/
    TYPE GT_INCENTIVE IS RECORD (
        YYYYMM      VARCHAR2(10),
        ORD_NO      VARCHAR2(12),
        CUST_NO     VARCHAR2(10),
        ORD_AGENT   VARCHAR2(10),
        COMM_TP     VARCHAR2(5),
        MAT_CD      VARCHAR2(18),
        CNT_CD      VARCHAR2(2),
        PROC_DAY    VARCHAR2(8),
        MFP_YN      VARCHAR2(1),
        END_TP      VARCHAR2(1),
        CANC_DAY    VARCHAR2(8),
        ORD_DAY     VARCHAR2(8),
        CHAN_CD     VARCHAR2(2),
        CHAN_LCLS_CD    VARCHAR2(2),
        CHAN_MCLS_CD    VARCHAR2(4),
        CNT_SUM         NUMBER,
        WHEEL_INCHES VARCHAR2(4),
        SEASON_CD   VARCHAR2(40),
        PATTERN_CD  VARCHAR2(40),
        APL_AMT         NUMBER,
        LAST_AMT        NUMBER
    );
    
    /***************************************************************************
        대리점, 제휴방판, 로디안 장려금 집계용 레코드 타입
    ***************************************************************************/
    TYPE GT_SBS IS RECORD (
        YYYYMM          VARCHAR2(10),   /* 마감년월 */
        AGENCY_CD       VARCHAR2(10),   /* 렌탈전문점 */
        AGNC_INCN       NUMBER(13),     /* 대리점인센티브 */
        AFL_VSLS_INCN   NUMBER(13),     /* 제휴방판인센티브 */
        RDN_INCN        NUMBER(13),     /* 로디안인센티브 */
        AGNC_SBS        NUMBER(13),     /* 대리점장려금 */
        AFL_VSLS_SBS    NUMBER(13),     /* 제휴방판장려금 */
        RDN_SBS         NUMBER(13),     /* 로디안장려금 */
        VST_CHC_FEE     NUMBER(13)      /* 방문점검수수료 */
    );
    
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
    );
    
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
    );
    
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
    );
    
    /***************************************************************************
        인센티브/장려금 집계처리 프로시저
    ***************************************************************************/
    PROCEDURE PRC_INNER_SBS(
        PI_YYYYMM   IN VARCHAR2,
        PI_REG_ID   IN VARCHAR2,        /* 실행자ID */
        PO_RET_CNT  OUT NUMBER,         /* 적용 COUNT */
        PO_RET_CODE OUT VARCHAR2,       /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2        /* RETURN MESSAGE */
    );
    
    FUNCTION FNC_CURSOR_AGENCY_INCENTIVE(
        PI_YYYYMM   IN VARCHAR2     /* 집계년월 */
    ) RETURN SYS_REFCURSOR;
    
    FUNCTION FNC_CURSOR_VISIT_INCENTIVE(
        PI_YYYYMM   IN VARCHAR2     /* 집계년월 */
    ) RETURN SYS_REFCURSOR;
    
    FUNCTION FNC_CURSOR_ROAD_INCENTIVE(
        PI_YYYYMM   IN VARCHAR2     /* 집계년월 */
    ) RETURN SYS_REFCURSOR;
    
    /***************************************************************************
        대리점, 제휴방판, 로디안 인센티브/장려금 집계 CURSOR
    ***************************************************************************/
    FUNCTION FNC_CURSOR_SBS (
        PI_YYYYMM   VARCHAR2
    ) RETURN SYS_REFCURSOR;
    
    PROCEDURE PRC_AGG_HISTORY_INSERT(
        PI_YYYYMM   IN VARCHAR2,
        PI_REG_ID   IN VARCHAR2,
        PI_SLS_CD   IN VARCHAR2,    /* 판매코드 */
        PI_BNS_CD   IN VARCHAR2,    /* 보너스코드 */
        PI_PYM_CD   IN VARCHAR2,    /* 지급코드 */
        PI_S_TIME   IN TIMESTAMP,        /* 시작시간 */
        PI_E_TIME   IN TIMESTAMP,        /* 종료시간 */
        PI_COUNT    IN NUMBER,      /* 적용건수 */
        PO_RET_CODE OUT VARCHAR2,     /* RETURN CODE */
        PO_RET_MESG OUT VARCHAR2   /* RETURN MESSAGE */
    );
    
    FUNCTION FNC_GET_SERIAL_ID RETURN VARCHAR2;
    FUNCTION FNC_GET_SERIAL_ID(
        PI_PREFIX   IN VARCHAR2
    ) RETURN VARCHAR2;
    
    FUNCTION FNC_ERR_MESG RETURN VARCHAR2;
    FUNCTION FNC_ERR_MESG(
        PI_DINAMIC  IN VARCHAR2,
        PI_STATIC   IN VARCHAR2
    ) RETURN VARCHAR2;
    FUNCTION FNC_ERR_MANDATORY(PI_DINAMIC   IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION FNC_ERR_SEARCH(PI_DINAMIC      IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION FNC_ERR_INSERT(PI_DINAMIC      IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION FNC_ERR_UPDATE(PI_DINAMIC      IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION FNC_ERR_DELETE(PI_DINAMIC      IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION FNC_MESG_OK RETURN VARCHAR2;
    FUNCTION FNC_MESG_OK(PI_DINAMIC         IN VARCHAR2) RETURN VARCHAR2;
    FUNCTION FNC_UNION_MESG(
        PI_DINAMIC  IN VARCHAR2,
        PI_STATIC   IN VARCHAR2,
        PI_OLDSUB   IN VARCHAR2
    ) RETURN VARCHAR2;
    
END PKG_RNT_RTRE7000;
/