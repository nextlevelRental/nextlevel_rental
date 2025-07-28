CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0023 AS
/*******************************************************************************
   NAME:      PKG_RTSD0023
   PURPOSE:   부가제품 등록 Body

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-11  Sean             1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- 부가제품 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0023 (
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_ADD_GDS_NM   RTSD0023.ADD_GDS_NM%TYPE,
    v_MAKER_NM     RTSD0023.MAKER_NM%TYPE,
    v_USE_YN       RTSD0023.USE_YN%TYPE
  ) AS
  BEGIN
    OPEN Ref_Cursor for  
  SELECT ADD_GDS_CD       /* 시퀀 */ 
       , ADD_GDS_NM       /* 부가제품명 */
       , NVL(AMT, 0) AMT  /* 금액 */     
       , MAKER_NM         /* 제조사 */
       , GDS_GB           /* 제품구분 */
       , GDS_DESC         /* 제품설명 */
       , GDS_DESC_DT      /* 제품상세설명 */
       , REG_ID           /* 등록자 ID */
       , REG_DT           /* 등록일 */
       , CHG_ID           /* 변경자 ID */
       , CHG_DT           /* 변경일 */
       , GDS_GRP          /* 제품군 */
       , USE_YN           /* 사용여부 */
       , NVL(DC_AMT, 0) DC_AMT  /* 할인금액 */
       , NVL(AMT, 0) - NVL(DC_AMT, 0) ACT_AMT  /* 실판매금액 */
       , DC_YN            /* 할부여부 */
   FROM RTSD0023
  WHERE 1=1
    AND ADD_GDS_NM  LIKE v_ADD_GDS_NM || '%'
    AND MAKER_NM  LIKE v_MAKER_NM || '%'
    AND USE_YN LIKE v_USE_YN || '%'
  ORDER BY ADD_GDS_CD    
  ;
  END p_sRTSD0023;

  /*****************************************************************************
  -- 부가제품 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0023 (
    v_ADD_GDS_CD  IN OUT RTSD0023.ADD_GDS_CD%TYPE, 
    v_ADD_GDS_NM  IN RTSD0023.ADD_GDS_NM%TYPE, 
    v_AMT         IN RTSD0023.AMT%TYPE,        
    v_MAKER_NM    IN RTSD0023.MAKER_NM%TYPE,   
    v_GDS_GB      IN RTSD0023.GDS_GB%TYPE,     
    v_GDS_DESC    IN RTSD0023.GDS_DESC%TYPE,   
    v_GDS_DESC_DT IN RTSD0023.GDS_DESC_DT%TYPE,
    v_REG_ID      IN RTSD0023.REG_ID%TYPE,     
    v_GDS_GRP     IN RTSD0023.GDS_GRP%TYPE,    
    v_USE_YN      IN RTSD0023.USE_YN%TYPE,
    v_DC_AMT      IN RTSD0023.DC_AMT%TYPE,
    v_DC_YN       IN RTSD0023.DC_YN%TYPE,        
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS
    
    v_ADD_GDS_CD_TMP VARCHAR2(10);
  BEGIN
  
    v_ADD_GDS_CD_TMP := f_sRTSD0023MaxSeq(v_ADD_GDS_NM);

    INSERT  INTO RTSD0023 (
            ADD_GDS_CD,
            ADD_GDS_NM,
            AMT,
            MAKER_NM,
            GDS_GB,
            GDS_DESC,
            GDS_DESC_DT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            GDS_GRP,
            USE_YN,
            DC_AMT,
            DC_YN
            )
    VALUES  (
            v_ADD_GDS_CD_TMP,
            v_ADD_GDS_NM,
            v_AMT,
            v_MAKER_NM,
            v_GDS_GB,
            v_GDS_DESC,
            v_GDS_DESC_DT,
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE,
            v_GDS_GRP,
            v_USE_YN,
            v_DC_AMT,
            v_DC_YN
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_InsertRTSD0023; 
  
  /*****************************************************************************
  -- 부가제품 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0023 (
    v_ADD_GDS_CD  IN RTSD0023.ADD_GDS_CD%TYPE, 
    v_ADD_GDS_NM  IN RTSD0023.ADD_GDS_NM%TYPE, 
    v_AMT         IN RTSD0023.AMT%TYPE,        
    v_MAKER_NM    IN RTSD0023.MAKER_NM%TYPE,   
    v_GDS_GB      IN RTSD0023.GDS_GB%TYPE,     
    v_GDS_DESC    IN RTSD0023.GDS_DESC%TYPE,   
    v_GDS_DESC_DT IN RTSD0023.GDS_DESC_DT%TYPE, 
    v_REG_ID      IN RTSD0023.REG_ID%TYPE,     
    v_GDS_GRP     IN RTSD0023.GDS_GRP%TYPE,    
    v_USE_YN      IN RTSD0023.USE_YN%TYPE,     
    v_DC_AMT      IN RTSD0023.DC_AMT%TYPE,
    v_DC_YN       IN RTSD0023.DC_YN%TYPE,        
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0023
    SET     ADD_GDS_NM = v_ADD_GDS_NM,
            AMT        = v_AMT,
            MAKER_NM   = v_MAKER_NM,
            GDS_GB     = v_GDS_GB,
            GDS_DESC   = v_GDS_DESC,
            GDS_DESC_DT = v_GDS_DESC_DT,
            CHG_ID     = v_REG_ID,
            CHG_DT     = SYSDATE, 
            GDS_GRP    = v_GDS_GRP,
            USE_YN     = v_USE_YN,
            DC_AMT     = v_DC_AMT,
            DC_YN      = v_DC_YN
    WHERE  ADD_GDS_CD  = v_ADD_GDS_CD;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRTSD0023;    

  /*****************************************************************************
  -- 부가제품 순번채번
  *****************************************************************************/
  FUNCTION f_sRTSD0023MaxSeq(
    v_ADD_GDS_NM  IN RTSD0023.ADD_GDS_NM%TYPE
    ) RETURN VARCHAR2 IS

    v_curr_seq  varchar2(10) default 0;
    BEGIN
    SELECT DECODE(LENGTH(SUB_NEXT_VAL), 
                  10, 
                  SUB_NEXT_VAL, 
                  (SELECT 'B' || TO_CHAR(SYSDATE, 'YYYY') || '00001' FROM DUAL))
      INTO v_curr_seq                  
      FROM
      (
      SELECT 'B' || TO_CHAR(SYSDATE, 'YYYY') || TO_CHAR(LPAD(MAX(nvl(SUBSTR(Z.ADD_GDS_CD, 6), 0)) + 1, 5, '0')) 
             AS SUB_NEXT_VAL
        FROM RTSD0023 Z
       WHERE TO_CHAR(sysdate, 'YYYY') = SUBSTR(Z.ADD_GDS_CD, 2, 4)
      )
    ;

    RETURN v_curr_seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRTSD0023MaxSeq;

  /*****************************************************************************
  -- 부가제품 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0023 (
    v_Comm_Dvsn   IN CHAR,                         /*처리구분(I,U,D)       */
    v_ADD_GDS_CD  IN OUT RTSD0023.ADD_GDS_CD%TYPE, 
    v_ADD_GDS_NM  IN RTSD0023.ADD_GDS_NM%TYPE, 
    v_AMT         IN RTSD0023.AMT%TYPE,        
    v_MAKER_NM    IN RTSD0023.MAKER_NM%TYPE,   
    v_GDS_GB      IN RTSD0023.GDS_GB%TYPE,     
    v_GDS_DESC    IN RTSD0023.GDS_DESC%TYPE,   
    v_GDS_DESC_DT IN RTSD0023.GDS_DESC_DT%TYPE,
    v_REG_ID      IN RTSD0023.REG_ID%TYPE,     
    v_GDS_GRP     IN RTSD0023.GDS_GRP%TYPE,    
    v_USE_YN      IN RTSD0023.USE_YN%TYPE,     
    v_DC_AMT      IN RTSD0023.DC_AMT%TYPE,
    v_DC_YN       IN RTSD0023.DC_YN%TYPE,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;    
    
  BEGIN

    -- SEQ중복 확인
    IF v_Comm_Dvsn = 'I' THEN
      IF (0 < f_sRTSD0023Count(v_ADD_GDS_CD)) THEN
          v_Return_Message := '부가제품코드('||v_ADD_GDS_CD||') : 이미 존재하는 값은 추가가 아닌 조회 후 수정으로 저장해주세요!';
          RAISE e_Error;
      END IF;    
    
      IF 0 != f_InsertRTSD0023(v_ADD_GDS_CD, v_ADD_GDS_NM,v_AMT, v_MAKER_NM,
                               v_GDS_GB, v_GDS_DESC, v_GDS_DESC_DT, v_REG_ID,
                               v_GDS_GRP, v_USE_YN, v_DC_AMT, v_DC_YN, v_ErrorText) THEN
            v_Return_Message := '부가제품 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF
        ;
    ELSIF v_Comm_Dvsn = 'U' THEN     
        IF 0 != f_UpdateRTSD0023(v_ADD_GDS_CD, v_ADD_GDS_NM,v_AMT, v_MAKER_NM,
                               v_GDS_GB, v_GDS_DESC, v_GDS_DESC_DT, v_REG_ID,
                               v_GDS_GRP, v_USE_YN, v_DC_AMT, v_DC_YN, v_ErrorText) THEN
            v_Return_Message := '부가제품 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0023.p_IUDRTSD0023(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0023.p_IUDRTSD0023(2)', v_ErrorText, v_Return_Message);
  END p_IUDRTSD0023;

  /*****************************************************************************
  -- 부가제품 관리 Count
  *****************************************************************************/
  FUNCTION f_sRTSD0023Count(
    v_ADD_GDS_CD  IN RTSD0023.ADD_GDS_CD%TYPE
    ) RETURN NUMBER IS
    v_curr_count NUMBER DEFAULT 0;
  BEGIN
    SELECT  COUNT(*)
      INTO  v_curr_count
      FROM RTSD0023
     WHERE ADD_GDS_CD = v_ADD_GDS_CD;
    RETURN v_curr_count;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRTSD0023Count;

  /*****************************************************************************
  -- 부가제품추가팝업 조회 Select(Deprecated)
  *****************************************************************************/
  PROCEDURE p_sRTSD0023_pop(
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_ADD_GDS_NM   RTSD0023.ADD_GDS_NM%TYPE
  ) AS
  BEGIN
    OPEN Ref_Cursor for  
SELECT A.ADD_GDS_CD             /* 부가제품코드 */
     , A.ADD_GDS_NM             /* 부가제품명 */
     , NVL(B.AMT, 0) AMT        /* 금액 */     
     , NVL(B.DC_AMT, 0) DC_AMT  /* 할인금액 */
     , NVL(B.AMT, 0) - NVL(B.DC_AMT, 0) ACT_AMT /* 실판매금액 */
     , A.DC_YN      /* 할부여부 */
     , NVL(B.MON_AMT, 0) MON_AMT    /* 월렌탈료 */
     , A.MAKER_NM   /* 제조사 */
     , A.GDS_GRP    /* 제품군 */
     , A.GDS_DESC   /* 특징 */
  FROM RTSD0023 A   /* 부가제품 정보 */
     , RTSD0041 B   /* 계약부가제품 */
 WHERE 1=1
   AND A.ADD_GDS_CD = B.ADD_GDS_CD(+)    
   AND A.ADD_GDS_NM  LIKE v_ADD_GDS_NM || '%'  /* 부가제품명 */
   AND A.USE_YN = 'Y'
ORDER BY A.ADD_GDS_CD   
  ;
  END p_sRTSD0023_pop;

  /*****************************************************************************
  -- 부가제품추가팝업 조회 Select(2018.11.14)
  *****************************************************************************/
  PROCEDURE p_sRTSD0023_popNew(
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_ADD_GDS_NM   RTSD0023.ADD_GDS_NM%TYPE,
    v_SALE_CD      RTSD0021.SALE_CD%TYPE
  )
AS
  BEGIN
    OPEN Ref_Cursor for  
  SELECT A.ADD_GDS_CD             /* 부가제품코드 */
       , A.ADD_GDS_NM             /* 부가제품명 */
       , NVL(A.AMT, 0) AMT        /* 금액 */     
       , NVL(A.DC_AMT, 0) DC_AMT  /* 할인금액 */
       , NVL(A.AMT, 0) - NVL(A.DC_AMT, 0) ACT_AMT /* 실판매금액 */
       , A.DC_YN                  /* 할부여부 */
       , A.MAKER_NM               /* 제조사 */
       , A.GDS_GRP                /* 제품군 */
       , A.GDS_DESC               /* 특징 */
       , S.SALE_CD
       , S.GDS_GB
    FROM RTSD0021 S   /* 판매 제품 정보 */
       , RTSD0023 A   /* 부가제품 정보 */
   WHERE 1=1
     AND S.SALE_GDS_CD = A.ADD_GDS_CD
     AND S.GDS_GB = A.GDS_GB
     AND S.GDS_GRP = A.GDS_GRP     
     AND S.SALE_CD = DECODE(v_SALE_CD, NULL, S.SALE_CD, v_SALE_CD)
     AND S.GDS_GB = 2
     AND A.USE_YN = 'Y'
     AND A.ADD_GDS_NM  LIKE v_ADD_GDS_NM || '%'  /* 부가제품명 */   
  ORDER BY A.ADD_GDS_CD
;
  END p_sRTSD0023_popNew;  
  
  /*****************************************************************************
  -- 주문번호별 부가제품 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0023Sel(
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_Ord_No       IN RTSD0041.ORD_NO%TYPE              /*계약번호            */ 
  ) AS
  BEGIN
    OPEN Ref_Cursor for  
    SELECT B.ORD_NO
         , A.ADD_GDS_CD             /* 부가제품코드 */
         , A.ADD_GDS_NM             /* 부가제품명 */
         , NVL(B.AMT, 0) AMT        /* 금액 */     
         , NVL(B.DC_AMT, 0) DC_AMT  /* 할인금액 */
         , NVL(B.AMT, 0) - NVL(B.DC_AMT, 0) ACT_AMT /* 실판매금액 */
         , A.DC_YN      /* 할부여부 */
         , NVL(B.MON_AMT, 0) MON_AMT    /* 월렌탈료 */
         , A.MAKER_NM   /* 제조사 */
         , A.GDS_GRP    /* 제품군 */
         , Pkg_Rtcm0051.f_sRtcm0051CodeName('S210', A.GDS_GRP) AS GDS_GRP_NM
         , A.GDS_DESC   /* 특징 */
      FROM RTSD0023 A   /* 부가제품 정보 */
         , RTSD0041 B   /* 계약부가제품 */
     WHERE A.ADD_GDS_CD = B.ADD_GDS_CD(+)    
       AND ORD_NO = v_Ord_No
    ORDER BY A.ADD_GDS_CD;
  END p_sRTSD0023Sel;
  
END PKG_RTSD0023;