CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RNT_COM AS
/******************************************************************************
   NAME:       PKG_RNT_COM
   PURPOSE:    조직관리 COMMON PACKAGE

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-12-20      강신규       1. Created this package.
******************************************************************************/

    TYPE TYP_ARR_VARCHAR IS TABLE OF VARCHAR2(4000) INDEX BY BINARY_INTEGER;
    
    /** 기본 에러 메시지 */
    GV_ARR_ERR_MESG     TYP_ARR_VARCHAR;
    GV_ERR_OK           NUMBER(3);  -- OK!
    GV_ERR_OPN          NUMBER(3);  -- OPERATION ERROR
    GV_ERR_DUP          NUMBER(3);  -- DUPLICATION ERROR
    GV_ERR_NOF          NUMBER(3);  -- NOT FOUND ERROR
    GV_ERR_SQL          NUMBER(3);  -- SQL ERROR


/******************************************************************************
    렌탈지사 리스트 추출
******************************************************************************/
  PROCEDURE PRC_LIST_RENTAL_GROUP (
    PO_REF_CURSOR   IN OUT SYS_REFCURSOR,
    PI_USR_GROUP    IN VARCHAR2,    -- 사용자 그룹
    PI_USR_ID       IN VARCHAR2,    -- 사용자 ID
    PI_KEYWORD      IN VARCHAR2
  );


/******************************************************************************
    렌탈지점 리스트 추출
******************************************************************************/
  PROCEDURE PRC_LIST_RENTAL_OFFICE (
    PO_REF_CURSOR   IN OUT SYS_REFCURSOR,
    PI_USR_GROUP    IN VARCHAR2,    -- 사용자 그룹
    PI_USR_ID       IN VARCHAR2,    -- 사용자 ID
    PI_RNT_GROUP    IN VARCHAR2,    -- 렌탈그룹
    PI_KEYWORD      IN VARCHAR2
  );

/******************************************************************************
    인센티브 기초집계 최종수행 내역 조회
******************************************************************************/
  PROCEDURE PRC_LIST_INC_BAS_AGGR(
    REF_CURSOR IN OUT SYS_REFCURSOR,
    V_SLCM_YM  IN RTRE7040.SLCM_YM%TYPE /* 집계년월 */
  );

/******************************************************************************
    인센티브 / 장려금 판매집계 최종수행 내역 조회
******************************************************************************/
  PROCEDURE PRC_LIST_INC_SBS_SLS_AGGR(
    REF_CURSOR IN OUT SYS_REFCURSOR,
    V_SLCM_YM  IN VARCHAR2, /* 집계년월 */
    V_AGG_GRP  IN VARCHAR2  /* 집계그룹 */
  );

/******************************************************************************
    집계수행이력 조회
******************************************************************************/
  PROCEDURE PRC_LIST_AGGR_EXEC_HST(
    REF_CURSOR IN OUT SYS_REFCURSOR,
    V_SLCM_YM  IN RTHS7000.SLCM_YM%TYPE /* 집계년월 */
  );
END PKG_RNT_COM;
