CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0031 AS
/*******************************************************************************
   NAME:      PKG_RTSD0031
   PURPOSE:   단체정보 Body

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-15  Sean             1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 단체정보 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0031 (
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_GRP_NO     RTSD0031.GRP_NO%TYPE,
    v_GRP_NM     RTSD0031.GRP_NM%TYPE
  ) AS
  BEGIN
    Open Ref_Cursor for  
  SELECT  A.GRP_NO          
        , A.GRP_NM                                                                       
        , A.GRP_ST          
        , A.MIN_AGR_CNT    
        , (SELECT SUM(TO_NUMBER(CNT_CD)) FROM RTSD0104 WHERE STAT_CD NOT IN ('00', '06' ) AND GRP_NO = A.GRP_NO) AS REST_CNT      
        , A.GRP_TYPE      
        , A.REG_ID          
        , A.REG_DT          
        , A.CHG_ID          
        , A.CHG_DT          
        , A.GRP_DC_RATE    
        , A.GRP_DC_AMT
        , A.SALE_CD
        , (SELECT Z.SALE_NM FROM RTSD0020 Z WHERE Z.SALE_CD = A.SALE_CD) SALE_NM
        , B.PKG_DC_YN   /* 패키지중복할인여부 */
    FROM RTSD0031 A /* 단체정보 */
       , RTSD0020 B /* 판매정보 */    
   WHERE 1=1
    AND A.SALE_CD = B.SALE_CD(+)
    AND NOT GRP_TYPE='F'
    AND GRP_NO   = DECODE(v_GRP_NO, NULL, A.GRP_NO, v_GRP_NO)
    --AND GRP_NM   = DECODE(v_GRP_NM, NULL, A.GRP_NM, v_GRP_NM)
  ORDER BY GRP_NO 
  ;
  END p_sRTSD0031;
 
  /*****************************************************************************
  -- 단체정보 Seq채번
  *****************************************************************************/
  FUNCTION f_sRTSD0031NextSeq(
    v_GRP_NO             IN OUT RTSD0031.GRP_NO%TYPE
    ) RETURN VARCHAR2 IS
    
    v_next_val  varchar2(10) default 0;
    BEGIN
    SELECT 'D' || LPAD(SEQ_RTSD0031GRP_NO.NEXTVAL, 9, 0) 
      INTO v_next_val
      FROM DUAL
    ;

    RETURN v_next_val;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
    END f_sRTSD0031NextSeq;

  /*****************************************************************************
  -- 단체정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0031 (
    v_GRP_NO         IN OUT RTSD0031.GRP_NO%TYPE,          
    v_GRP_NM         IN RTSD0031.GRP_NM%TYPE,          
    v_GRP_ST         IN RTSD0031.GRP_ST%TYPE,          
    v_MIN_AGR_CNT    IN RTSD0031.MIN_AGR_CNT%TYPE,    
    v_REST_CNT       IN RTSD0031.REST_CNT%TYPE,      
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,      
    v_REG_ID         IN RTSD0031.REG_ID%TYPE,          
    v_GRP_DC_RATE    IN RTSD0031.GRP_DC_RATE%TYPE,    
    v_GRP_DC_AMT     IN RTSD0031.GRP_DC_AMT%TYPE,
    v_SALE_CD        IN RTSD0031.SALE_CD%TYPE, 
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER IS
    
    v_GRP_NO_1 VARCHAR2(10);
  BEGIN
    v_GRP_NO_1 := f_sRTSD0031NextSeq(v_GRP_NO);  
  
    INSERT  INTO RTSD0031 (
            GRP_NO,         
            GRP_NM,         
            GRP_ST,         
            MIN_AGR_CNT,
            REST_CNT,     
            GRP_TYPE,     
            REG_ID,         
            REG_DT,         
            CHG_ID,         
            CHG_DT,         
            GRP_DC_RATE,
            GRP_DC_AMT, 
            SALE_CD
            )
    VALUES  (
            v_GRP_NO_1,
            v_GRP_NM,
            v_GRP_ST,
            v_MIN_AGR_CNT,
            v_REST_CNT,
            'D',
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE,
            v_GRP_DC_RATE,
            v_GRP_DC_AMT,
            v_SALE_CD
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRTSD0031;

  /*****************************************************************************
  -- 단체정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0031 (
    v_GRP_NO         IN RTSD0031.GRP_NO%TYPE,          
    v_GRP_NM         IN RTSD0031.GRP_NM%TYPE,          
    v_GRP_ST         IN RTSD0031.GRP_ST%TYPE,          
    v_MIN_AGR_CNT    IN RTSD0031.MIN_AGR_CNT%TYPE,    
    v_REST_CNT       IN RTSD0031.REST_CNT%TYPE,      
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,      
    v_REG_ID         IN RTSD0031.REG_ID%TYPE,          
    v_GRP_DC_RATE    IN RTSD0031.GRP_DC_RATE%TYPE,    
    v_GRP_DC_AMT     IN RTSD0031.GRP_DC_AMT%TYPE,
    v_SALE_CD        IN RTSD0031.SALE_CD%TYPE, 
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0031
    SET     GRP_NM        = v_GRP_NM,
--          GRP_ST        = v_GRP_ST,
            MIN_AGR_CNT   = v_MIN_AGR_CNT,
            REST_CNT      = v_REST_CNT,
--          GRP_TYPE      = v_GRP_TYPE,
            CHG_ID        = v_REG_ID,
            CHG_DT        = SYSDATE,
            GRP_DC_RATE   = v_GRP_DC_RATE,
            GRP_DC_AMT    = v_GRP_DC_AMT,
            SALE_CD       = v_SALE_CD
    WHERE   GRP_NO        = v_GRP_NO;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRTSD0031;

  /*****************************************************************************
  -- 단체정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0031 (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_GRP_NO         IN OUT RTSD0031.GRP_NO%TYPE,          
    v_GRP_NM         IN RTSD0031.GRP_NM%TYPE,          
    v_GRP_ST         IN RTSD0031.GRP_ST%TYPE,          
    v_MIN_AGR_CNT    IN RTSD0031.MIN_AGR_CNT%TYPE,    
    v_REST_CNT       IN RTSD0031.REST_CNT%TYPE,      
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,      
    v_REG_ID         IN RTSD0031.REG_ID%TYPE,          
    v_GRP_DC_RATE    IN RTSD0031.GRP_DC_RATE%TYPE,    
    v_GRP_DC_AMT     IN RTSD0031.GRP_DC_AMT%TYPE,
    v_SALE_CD        IN RTSD0031.SALE_CD%TYPE,    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN
    IF v_Comm_Dvsn = 'I' THEN    
      IF 0 != f_InsertRTSD0031(v_GRP_NO, v_GRP_NM, v_GRP_ST, v_MIN_AGR_CNT,
                               v_REST_CNT, v_GRP_TYPE, v_REG_ID, v_GRP_DC_RATE, 
                               v_GRP_DC_AMT, v_SALE_CD, v_ErrorText) THEN
            v_Return_Message := '단체정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSIF v_Comm_Dvsn = 'U' THEN     
        IF 0 != f_UpdateRTSD0031(v_GRP_NO, v_GRP_NM, v_GRP_ST, v_MIN_AGR_CNT,
                                 v_REST_CNT, v_GRP_TYPE, v_REG_ID, v_GRP_DC_RATE, 
                                 v_GRP_DC_AMT, v_SALE_CD, v_ErrorText) THEN
            v_Return_Message := '단체정보 수정 실패!!!'||'-'||v_ErrorText;
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

        --Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_IUDRTSD0031(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_IUDRTSD0031(2)', v_ErrorText, v_Return_Message);
  END p_IUDRTSD0031;
  
  
  /*****************************************************************************
  -- 단체찾기 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0031GrpAddSelect (
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_GRP_NO  IN   RTSD0031.GRP_NO%TYPE,
    v_GRP_NM  IN   RTSD0031.GRP_NM%TYPE
  ) AS
  BEGIN
    Open Ref_Cursor for  
  
  SELECT 
    A.GRP_NM,
    A.GRP_NO,
    B.SALE_CD,
    B.SALE_NM,
    PKG_RTCM0051.F_SRTCM0051CODENAME('S202',A.GRP_ST) AS GRP_ST,
    A.MIN_AGR_CNT,
    (SELECT SUM(TO_NUMBER(CNT_CD)) FROM RTSD0104 WHERE STAT_CD NOT IN ('00', '06') AND GRP_NO = A.GRP_NO) AS REST_CNT,    
    A.GRP_DC_RATE,
    A.GRP_DC_AMT
    FROM RTSD0031 A , RTSD0020 B 
    WHERE A.SALE_CD = B.SALE_CD
    AND A.GRP_NO  LIKE '%' || v_GRP_NO || '%'
    AND A.GRP_NM  LIKE '%' || v_GRP_NM || '%'
  ORDER BY A.GRP_NO
  ;
  END p_sRTSD0031GrpAddSelect;

  /*****************************************************************************
  -- 단체(묶음)해지 (Cancel)
  *****************************************************************************/
  PROCEDURE p_sRTSD0031cancel (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,     /* 단체번호 */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /* 주문번호 */
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,       /* 단체유형 */
    v_CNT_CD         IN RTSD0104.CNT_CD%TYPE,         /* 타이어본수 */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* 등록자 ID */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_grpSt          IN CHAR,                         /* 단체상태 수정여부 */
    v_chk            IN CHAR,                         /* 체크박스 */    
    v_restCnt        IN CHAR,                         /* 잔여계약(변경후) */
    v_pkgDcYn        IN CHAR,                         /* 패키지중복할인여부 */
    v_dc_Gb          IN CHAR,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Penalt_Amt VARCHAR2(20);
    i_res_cnt NUMBER default 0;     /* 잔여계약 */ 
    i_min_agr_cnt NUMBER default 0; /* 최소약정계약건 */
    i_109_cnt NUMBER default 0; /* 청구스케줄 카운트 */
    v_grp_Yn VARCHAR2(1) default 'Y';
    
    
    e_Error EXCEPTION;
    
  BEGIN
     v_Penalt_Amt := PKG_RTSD0109.f_sRtsd0109PenaltyAmt(v_Ord_No);
     IF v_Penalt_Amt != '0' THEN 
        v_grp_Yn := 'N';
     ELSE
        v_grp_Yn := 'Y';
     END IF;
     
     /* 청구스케줄 이력 여부 */ 
     SELECT  COUNT(1) CNT
       INTO  i_109_cnt
       FROM  RTSD0109
      WHERE  ORD_NO = v_Ord_No;
         
        /* ==================== */
        /* D: 단체              */
        /* ==================== */
        IF v_GRP_TYPE = 'D' THEN    -- 단체
          /* ----------------- */
          /* D-1. 변경 이력 생성 */
          /* ----------------- */
          IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_Errortext) THEN
              v_Return_Message := '단체 이력 등록 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;
        
          /* ----------------------- */
          /* D-2. 단체구분 해지      */
          /* ----------------------- */
          IF 0 != f_UpdateRtsd0104MonAmt(v_Grp_No, v_Ord_No, v_Reg_Id, v_Errortext) THEN
              v_Return_Message := '단체 월렌탈료 수정 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;

          /* ---------------------------- */
          /* D-3. 할인테이블 삭제         */
          /* ---------------------------- */       
          IF 0 != PKG_RTSD0105.f_sRtsd0047DeletePackage(v_Ord_No, v_Errortext) THEN
              v_Return_Message := '단체 할인테이블 삭제 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;
          
          /* --------------------------- - */
          /* D-6.할인테이블 저장           */
          /* ----------------------------- */   
          IF 0 != PKG_RTSD0105.f_sRtsd0047CancelGroup(v_Ord_No, v_Grp_No, v_Reg_Id, v_dc_Gb, v_Errortext) THEN
              v_Return_Message := '단체 할인테이블 저장 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;                    
          
          /* ---------------------------- */
          /* D-4.할인율 이력저장          */
          /* ---------------------------- */       
          IF 0 != PKG_RTSD0105.f_sRtsd0040CancelGroup(v_Ord_No, v_Grp_No, v_Reg_Id, v_dc_Gb,  v_Errortext) THEN
              v_Return_Message := '단체 할인율 이력저장 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;
          
          /* ----------------------------- */
          /* D-5.청구스케쥴 위약금 여부     */
          /* ----------------------------- */
          IF 0 < i_109_cnt THEN
              PKG_RTSD0109.p_InsertRtsd0109SchGrpYnSet(v_Ord_No, v_Reg_Id, 'Y', '0',  v_Success_Code, v_Return_Message, v_Errortext);
              IF 0 != v_Success_Code THEN
                  v_Return_Message := '청구 스케쥴 위약금 여부 실패!!!'||'-'||v_Return_Message;
                  v_Errortext := v_Errortext;
                  RAISE e_Error;
              END IF;
          END IF;
        /* ==================== */
        /* F: 패키지            */
        /* ==================== */        
        ELSIF v_GRP_TYPE = 'F' THEN    -- 패키지
          /* ----------------------*/
          /* F-1. 변경 이력 생성   */
          /* ----------------------*/
          IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_Errortext) THEN
              v_Return_Message := '패키지 이력 등록 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;
          
          /* ------------------------- */
          /* F-2.패키지 번호 수정      */
          /* ------------------------- */
          IF 0 != f_UpdateRtsd0104PkgMonAmt2(v_Grp_No, v_Ord_No, v_restCnt, v_grpSt, v_pkgDcYn, v_chk, v_Reg_Id, v_Errortext) THEN
              v_Return_Message := '패키지 수정 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;         
         
          /* ----------------------------- */ 
          /* F-3.패키지해지일 수정         */
          /* ----------------------------- */          
          IF v_chk = '1' THEN
              IF 0 != f_UpdateRtsd0032GrpCnclDt(v_Grp_No, v_Ord_No, v_Reg_Id, v_Errortext) THEN
                  v_Return_Message := '패키지 해지일 수정 실패!!!'||'-'||v_Errortext;
                  v_Errortext := v_Errortext;
                  RAISE e_Error;
              END IF;
          END IF;
              
          /* ----------------------------- */
          /* F-4.패키지 해지               */
          /* ----------------------------- */       
          IF v_chk = '1' THEN
              IF 0 != PKG_RTSD0105.f_sRtsd0047DeletePackage(v_Ord_No, v_Errortext) THEN
                  v_Return_Message := '패키지 해지 삭제 실패!!!'||'-'||v_Errortext;
                  v_Errortext := v_Errortext;
                  RAISE e_Error;
              END IF;
          END IF;
                    
          /* ----------------------------- */
          /* F-5. 패키지 이력 등록         */
          /* ----------------------------- */       
          IF v_chk = '1' THEN          
             IF 0 != PKG_RTSD0105.f_InsertRTSD0040Contractdc2(v_Ord_No, v_Grp_No,v_REG_ID,v_dc_Cd, v_ErrorText) THEN
                 v_Return_Message := '계약별 할인이력 등록 실패!!!'||'-'||v_ErrorText;
                 v_ErrorText := v_ErrorText;
                 RAISE e_Error;
             END IF;
          END IF;
          
          /* ----------------------------- */
          /* F-6. 패키지 계약별할인        */
          /* ----------------------------- */
          IF v_chk = '1' THEN          
            IF 0 != PKG_RTSD0105.f_InsertRTSD0047Contractdc2(v_Ord_No, v_Grp_No,v_REG_ID,v_dc_Cd, v_ErrorText) THEN
                v_Return_Message := '계약별 할인 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
          END IF;
                      
          /* ----------------------------- */
          /*F-7.청구스케쥴 위약금 여부     */
          /* ----------------------------- */
          IF v_chk = '1' THEN
              IF 0 < i_109_cnt THEN  
                  PKG_RTSD0109.p_InsertRtsd0109SchGrpYnSet(v_Ord_No, v_Reg_Id, v_grp_Yn, v_Penalt_Amt,  v_Success_Code, v_Return_Message, v_Errortext);
                  IF 0 != v_Success_Code THEN
                      v_Return_Message := '청구 스케쥴 위약금 여부 실패!!!'||'-'||v_Return_Message;
                      v_Errortext := v_Errortext;
                      RAISE e_Error;
                  END IF;
              END IF;
          END IF;

          /* ----------------------------- */
          /* F-8.패키지 상태 수정          */
          /* ----------------------------- */       
          IF v_grpSt = 'Y' THEN
              IF 0 != f_UpdateRtsd0031GrpSt(v_Grp_No, v_Reg_Id, v_Errortext) THEN
                  v_Return_Message := '패키지 상태 수정 실패!!!'||'-'||v_Errortext;
                  v_Errortext := v_Errortext;
                  RAISE e_Error;
              END IF;
          END IF;                 
        
          ELSE
             v_Return_Message := '단체/패키지 유형 오류!!!['||v_GRP_TYPE||']';
             RAISE e_Error;        
          END IF; 
  
        v_Success_code := 0;
        v_Return_Message := '정상적으로 해지되었습니다';
        v_ErrorText := '';
        --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_sRTSD0031cancel(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_sRTSD0031cancel(2)', v_ErrorText, v_Return_Message);
  END p_sRTSD0031cancel;

/*****************************************************************************
-- 잔여계약건수
*****************************************************************************/
FUNCTION f_sRtsd0031Cnt(
  v_Grp_No         IN RTSD0031.GRP_NO%TYPE            /* 단체번호            */
) RETURN NUMBER IS
  v_Curr_Cnt NUMBER Default 0;
  BEGIN
    SELECT NVL(REST_CNT, 0)
      INTO v_Curr_Cnt
     from RTSD0031
     where GRP_NO = v_Grp_No;

    RETURN v_Curr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRtsd0031Cnt;

/*****************************************************************************
-- 최소약정계약건수
*****************************************************************************/
FUNCTION f_sRtsd0031MinAgrCnt(
  v_Grp_No         IN RTSD0031.GRP_NO%TYPE            /* 단체번호            */
) RETURN NUMBER IS
  v_Curr_Cnt NUMBER Default 0;
  BEGIN
    SELECT NVL(MIN_AGR_CNT, 0)
      INTO v_Curr_Cnt
     from RTSD0031
     where GRP_NO = v_Grp_No;

    RETURN v_Curr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
END f_sRtsd0031MinAgrCnt;


/*****************************************************************************
-- 타이어본수
*****************************************************************************/
FUNCTION f_sRtsd0104TireCnt(
  v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /* 주문번호            */
) RETURN NUMBER IS
  v_Curr_Cnt NUMBER Default 0;
  BEGIN
    SELECT SUBSTR(CNT_CD, 2)
      INTO v_Curr_Cnt
     from RTSD0104
     where ORD_NO = v_Ord_No;
    RETURN v_Curr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRtsd0104TireCnt;
  
/*****************************************************************************
-- 합계월렌탈료 조회
*****************************************************************************/
FUNCTION f_sRtsd0104SumMonAmt( 
  v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /* 주문번호            */
) RETURN NUMBER IS
  v_Curr_Cnt NUMBER Default 0;
  BEGIN
    SELECT NVL(SUM_MON_AMT, 0)
      INTO v_Curr_Cnt
     from RTSD0104
     where ORD_NO = v_Ord_No;
    RETURN v_Curr_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
END f_sRtsd0104SumMonAmt;

/*****************************************************************************
-- 잔여계약 Update
*****************************************************************************/
FUNCTION f_UpdateRtsd0031RestCnt(  
  v_Grp_No         IN RTSD0031.GRP_NO%TYPE,            /* 단체번호            */
  v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* 주문번호            */
  v_Reg_Id         IN RTSD0031.REG_ID%TYPE,            /* 등록자 ID           */    
  v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
    i_res_cnt NUMBER default 0; /* 잔여계약 */
  
  BEGIN      
        i_res_cnt := f_sRtsd0031Cnt(v_Grp_No) - f_sRtsd0104TireCnt(v_Ord_No);
  
    UPDATE RTSD0031
    SET    REST_CNT = i_res_cnt,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  GRP_NO   = v_Grp_No;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRtsd0031RestCnt;  

/*****************************************************************************
-- 단체상태 Update(해지)
*****************************************************************************/
FUNCTION f_UpdateRtsd0031GrpSt(
  v_Grp_No         IN RTSD0031.GRP_NO%TYPE,            /* 단체번호            */
  v_Reg_Id         IN RTSD0031.REG_ID%TYPE,            /* 등록자 ID           */  
  v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
 BEGIN
    UPDATE RTSD0031
    SET    GRP_ST = 'C',        /* 단체상태: C(해지), N(정상) */
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  GRP_NO   = v_Grp_No;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE; 
 END f_UpdateRtsd0031GrpSt;
  
/*****************************************************************************
-- 단체상태 관리(U)
*****************************************************************************/
PROCEDURE p_IUDRTSD0031GrpSt(
  v_GRP_NO             IN OUT RTSD0031.GRP_NO%TYPE,          
  v_REG_ID             IN RTSD0031.REG_ID%TYPE,          
  v_Success_Code   OUT NUMBER,
  v_Return_Message OUT VARCHAR2,
  v_ErrorText      OUT VARCHAR2
  ) IS
  
  e_Error EXCEPTION;

  BEGIN
  
    
    IF 0 != f_UpdateRtsd0031GrpSt(v_Grp_No, v_Reg_Id, v_Errortext) THEN
        v_Return_Message := '단체상태 수정 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
    
    v_Success_code := 0;
    v_Return_Message := '';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_IUDRTSD0031GrpSt(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_IUDRTSD0031GrpSt(2)', v_ErrorText, v_Return_Message);    
    
  END p_IUDRTSD0031GrpSt;

/*****************************************************************************
-- 월렌탈료, 단체번호 Update
*****************************************************************************/
FUNCTION f_UpdateRtsd0104MonAmt(
  v_Grp_No         IN RTSD0104.GRP_NO%TYPE,            /* 단체번호            */
  v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* 주문번호            */
  v_Reg_Id         IN RTSD0104.REG_ID%TYPE,            /* 등록자 ID           */  
  v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  iSumMonAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */   
BEGIN
    iSumMonAmt := f_sRtsd0104SumMonAmt(v_Ord_No);

    UPDATE RTSD0104
    SET    --MON_AMT  = iSumMonAmt,
           GRP_NO   = '',
           GRP_YN   = 'N',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ORD_NO   = v_Ord_No;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;  
END f_UpdateRtsd0104MonAmt;

/*****************************************************************************
-- Package 월렌탈료, 단체번호 Update
*****************************************************************************/
FUNCTION f_UpdateRtsd0104PkgMonAmt(
  v_Grp_No         IN RTSD0104.GRP_NO%TYPE,            /* 단체번호            */
  v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* 주문번호            */
  v_REST_CNT       IN RTSD0031.REST_CNT%TYPE,          /* 잔여계약            */  
  v_grpSt          IN CHAR,                            /* 단체상태 수정여부    */
  v_pkgDcYn        IN CHAR,                            /* 패키지중복할인여부   */
  v_chk            IN CHAR,                            /* 체크박스            */    
  v_Reg_Id         IN RTSD0104.REG_ID%TYPE,            /* 등록자 ID           */  
  v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  iSumMonAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */
  iDcAmt NUMBER DEFAULT 0;      /* 할인금액 */
  iMonAmt NUMBER DEFAULT 0;     /* 월렌탈료 */
BEGIN
    iSumMonAmt := f_sRtsd0104SumMonAmt(v_Ord_No);
    iDcAmt := Pkg_Rtsd0025.f_sRtsd0025SearchAmt(v_REST_CNT);
    if iDcAmt = 0 then -- 할인율 적용
      iDcAmt := Pkg_Rtsd0025.f_sRtsd0025SearchRate(v_REST_CNT);
      iMonAmt := iSumMonAmt - (iSumMonAmt * iDcAmt);      
    else -- 할인금액 적용
      iMonAmt := iSumMonAmt - iDcAmt;    
    end if;    

    IF v_pkgDcYn = 'Y' THEN -- 패키지중복할인여부가 Y일 경우만 할인율 업데이트
      IF v_grpSt = 'Y' THEN -- 전체해지여부
        UPDATE RTSD0104
        SET    MON_AMT  = iMonAmt,
               GRP_NO   = '',
               CHG_ID   = v_Reg_Id,
               CHG_DT   = SYSDATE
        WHERE  GRP_NO   = v_Grp_No;
      ELSE
        IF v_chk = '1' THEN -- 선택계약만 해지(단체번호 삭제)       
          UPDATE RTSD0104
          SET    MON_AMT  = iMonAmt,
                 GRP_NO   = '',
                 CHG_ID   = v_Reg_Id,
                 CHG_DT   = SYSDATE
          WHERE  ORD_NO   = v_Ord_No;
        ELSE  
          UPDATE RTSD0104
          SET    MON_AMT  = iMonAmt,
                 CHG_ID   = v_Reg_Id,
                 CHG_DT   = SYSDATE
          WHERE  ORD_NO   = v_Ord_No;          
        END IF;          
      END IF;
   ELSE 
      IF v_grpSt = 'Y' THEN -- 전체해지여부
        UPDATE RTSD0104
        SET    
               GRP_NO   = '',
               CHG_ID   = v_Reg_Id,
               CHG_DT   = SYSDATE
        WHERE  GRP_NO   = v_Grp_No;
      ELSE
        IF v_chk = '1' THEN -- 선택계약만 해지(단체번호 삭제)       
          UPDATE RTSD0104
          SET    
                 GRP_NO   = '',
                 CHG_ID   = v_Reg_Id,
                 CHG_DT   = SYSDATE
          WHERE  ORD_NO   = v_Ord_No;
        END IF;
      END IF;
   END IF; 
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;  
END f_UpdateRtsd0104PkgMonAmt;  

/*****************************************************************************
-- 기준종료일, 사용여부 Update
*****************************************************************************/
FUNCTION f_UpdateRtsd0040StdEndDay(
  v_Ord_No         IN RTSD0040.ORD_NO%TYPE,            /* 주문번호            */
  v_Reg_Id         IN RTSD0040.REG_ID%TYPE,            /* 등록자 ID           */  
  v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
BEGIN

  UPDATE RTSD0040
     SET --USE_YN   = 'N',                             /* 사용여부 */
         CHG_ID   = v_Reg_Id,
         CHG_DT   = SYSDATE       
   WHERE ORD_NO   = v_Ord_No;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;  
END f_UpdateRtsd0040StdEndDay;

/*****************************************************************************
-- 단체해지일 Update
*****************************************************************************/
FUNCTION f_UpdateRtsd0032GrpCnclDt(
  v_Grp_No         IN RTSD0032.GRP_NO%TYPE,            /* 단체번호            */
  v_Ord_No         IN RTSD0032.ORD_NO%TYPE,            /* 주문번호            */
  v_Reg_Id         IN RTSD0032.REG_ID%TYPE,            /* 등록자 ID           */  
  v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
BEGIN  
  UPDATE RTSD0032
     SET GRP_CNCL_DT = TO_CHAR(SYSDATE, 'YYYYMMDD'),    /* 단체해지일 */
         CHG_ID   = v_Reg_Id,
         GRP_CNCL_YN ='Y',
         CHG_DT   = SYSDATE       
   WHERE GRP_NO   = v_Grp_No
     AND ORD_NO   = v_Ord_No;
    RETURN SQLCODE;
  
    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
END f_UpdateRtsd0032GrpCnclDt;  




  /*****************************************************************************
  -- 단체정보 Seq채번
  *****************************************************************************/
  FUNCTION f_sRTSD0031NextSeq2(
    v_GRP_NO             IN OUT RTSD0031.GRP_NO%TYPE
    ) RETURN VARCHAR2 IS
    
    v_next_val  varchar2(10) default 0;
    BEGIN
    SELECT 'F' || LPAD(SEQ_RTSD0031GRP_NO.NEXTVAL, 9, 0) 
      INTO v_next_val
      FROM DUAL
    ;

    RETURN v_next_val;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
    END f_sRTSD0031NextSeq2;
    
    
  /*****************************************************************************
  -- 패키지 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0031Package (
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_GRP_NO     RTSD0031.GRP_NO%TYPE
  ) AS
  BEGIN
    Open Ref_Cursor for  
     SELECT 
        B.GRP_NO,
        B.GRP_CNT,
        A.DC_AMT,
        A.DC_RATE,
        A.GRP_STD_NM,
        A.DC_GB,
        A.DC_CD
    FROM (SELECT GRP_NO,
           COUNT(GRP_NO) AS GRP_CNT
      FROM RTSD0104
     WHERE GRP_NO = v_GRP_NO
     GROUP BY GRP_NO) B,
    (SELECT A.DC_GB, /* 할인구분코드  */
      PKG_RTCM0051.F_SRTCM0051CODENAME('S207', A.DC_GB) GRP_STD_NM, /* 할인구분명    */
      TO_CHAR(TO_DATE(A.STD_STR_DAY), 'YYYY-MM-DD') AS STD_STR_DAY, /* 할인시작일    */
      A.DC_CD,                                                  /* 할인코드      */
      RTRIM(TO_CHAR(A.DC_RATE, 'FM9990D99'), '.') AS DC_RATE, /* 할인율        */
      A.DC_AMT,                                                  /* 할인금액      */
      A.MIN_CNT,                                                    /* 최소건        */
      A.MAX_CNT                                                     /* 최대건        */
      FROM RTSD0025 A
     WHERE DC_GB='C')A
    WHERE A.MIN_CNT<=B.GRP_CNT
    AND A.MAX_CNT>=B.GRP_CNT
    --AND GRP_NM   = DECODE(v_GRP_NM, NULL, A.GRP_NM, v_GRP_NM)
  ORDER BY GRP_NO 
  ;
  END p_sRTSD0031Package;


/*****************************************************************************
-- Package 월렌탈료, 단체번호 Update
*****************************************************************************/
FUNCTION f_UpdateRtsd0104PkgMonAmt2(
  v_Grp_No         IN RTSD0104.GRP_NO%TYPE,            /* 단체번호            */
  v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* 주문번호            */
  v_REST_CNT       IN RTSD0031.REST_CNT%TYPE,          /* 잔여계약            */  
  v_grpSt          IN CHAR,                            /* 단체상태 수정여부    */
  v_pkgDcYn        IN CHAR,                            /* 패키지중복할인여부   */
  v_chk            IN CHAR,                            /* 체크박스            */    
  v_Reg_Id         IN RTSD0104.REG_ID%TYPE,            /* 등록자 ID           */  
  v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

BEGIN 

      IF v_grpSt = 'Y' THEN -- 전체해지여부
        UPDATE RTSD0104
        SET    
               GRP_NO   = '',
               GRP_YN   = 'N',
               CHG_ID   = v_Reg_Id,
               CHG_DT   = SYSDATE
        WHERE  GRP_NO   = v_Grp_No;
      ELSE
        IF v_chk = '1' THEN -- 선택계약만 해지(단체번호 삭제)       
          UPDATE RTSD0104
          SET    
                 GRP_NO   = '',
                 GRP_YN   = 'N',
                 CHG_ID   = v_Reg_Id,
                 CHG_DT   = SYSDATE
          WHERE  ORD_NO   = v_Ord_No;
        END IF;
      END IF;
       
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
    END f_UpdateRtsd0104PkgMonAmt2;


  /*****************************************************************************
  -- 패키지(묶음)해지 (Cancel)
  *****************************************************************************/
  PROCEDURE p_sRTSD0031cancel2 (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_Grp_No          IN OUT RTSD0031.GRP_NO%TYPE,          /*패키지 번호 */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /* 주문번호 */
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,       /* 패키지 유형 */
    v_CNT_CD         IN RTSD0104.CNT_CD%TYPE,         /* 타이어본수 */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* 등록자 ID */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_grpSt          IN CHAR,                         /* 패키지 상태 수정여부 */
    v_chk            IN CHAR,                         /* 체크박스 */
    v_restCnt        IN CHAR,                         /* 잔여계약(변경후) */
    v_pkgDcYn        IN CHAR,                         /* 패키지중복할인여부 */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    i_res_cnt NUMBER default 0;     /* 잔여계약 */ 
    i_min_agr_cnt NUMBER default 0; /* 최소약정계약건 */
    i_109_cnt NUMBER default 0; /* 청구스케줄 카운트 */
    e_Error EXCEPTION;
    
  BEGIN
  
        /* 청구스케줄 이려 여부 */
        SELECT  COUNT(1) CNT
          INTO  i_109_cnt
          FROM  RTSD0109
         WHERE  ORD_NO = v_Ord_No;
     
        /* ==================== */
        /* F: 패키지             */
        /* ==================== */        
        IF v_GRP_TYPE = 'F' THEN    -- 패키지
          /* ----------------- */
          /* F-1. 변경 이력 생성 */
          /* ----------------- */
          IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_Errortext) THEN
              v_Return_Message := '패키지 이력 등록 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;
                    
           /* ----------------------------- */
          /* F-2. 계약별할인 삭제               */
          /* ----------------------------- */       

            IF 0 != PKG_RTSD0105.f_sRtsd0047DeletePackage(v_Ord_No, v_Errortext) THEN
                v_Return_Message := '패키지 단체삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

          
          /* ----------------------------- */
          /* F-3 계약별 할인등록           */
          /* ----------------------------- */       
          

          IF 0 != PKG_RTSD0105.f_InsertRTSD0047Contractdc(v_Ord_No, v_Grp_No,v_REG_ID,v_dc_Cd, v_ErrorText) THEN
            v_Return_Message := '계약별 할인 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
          END IF;

          
          /* ----------------------------- */
          /* F-4 계약별 할인이력           */
          /* ----------------------------- */       
         
            IF 0 != PKG_RTSD0105.f_InsertRTSD0040Contractdc(v_Ord_No, v_Grp_No,v_REG_ID,v_dc_Cd, v_ErrorText) THEN
                v_Return_Message := '계약별 할인이력 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
          /* ----------------------------- */
          /* F-5 청구스케쥴 여부           */
          /* ----------------------------- */ 
          IF 0 < i_109_cnt THEN    
            PKG_RTSD0109.p_InsertRtsd0109SchGrpYnSet(v_Ord_No, v_Reg_Id, 'Y', '0',  v_Success_Code, v_Return_Message, v_Errortext);
            IF 0 != v_Success_Code THEN
              v_Return_Message := '청구 스케쥴 위약금 여부 실패!!!'||'-'||v_Return_Message;
              v_Errortext := v_Errortext;
              RAISE e_Error;
            END IF;
          END IF;  


          /* ----------------------------- */
          /* F-6. 패키지 상태 수정            */
          /* ----------------------------- */       
          IF v_grpSt = 'Y' THEN
            IF 0 != f_UpdateRtsd0031GrpSt(v_Grp_No, v_Reg_Id, v_Errortext) THEN
                v_Return_Message := '패키지 상태 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
          END IF;                 
        
        ELSE
            v_Return_Message := '단체유형 오류!!!['||v_GRP_TYPE||']';
            RAISE e_Error;        
        END IF; 
  
    v_Success_code := 0;
    v_Return_Message := '정상적으로 해지되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_sRTSD0031cancel2(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_sRTSD0031cancel2(2)', v_ErrorText, v_Return_Message);
  END p_sRTSD0031cancel2;
  
  
  
  /*****************************************************************************
  -- 단체(묶음)해지 (Cancel) 잔여계약본수 이하
  *****************************************************************************/
  PROCEDURE p_sRTSD0031cancelGroup (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_Grp_No             IN OUT RTSD0031.GRP_NO%TYPE,          /* 단체번호 */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /* 주문번호 */
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,       /* 단체유형 */
    v_CNT_CD         IN RTSD0104.CNT_CD%TYPE,         /* 타이어본수 */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* 등록자 ID */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_grpSt          IN CHAR,                         /* 단체상태 수정여부 */
    v_chk            IN CHAR,                         /* 체크박스 */
    v_restCnt        IN CHAR,                         /* 잔여계약(변경후) */
    v_pkgDcYn        IN CHAR,                         /* 패키지중복할인여부 */
    v_dc_Gb          IN CHAR,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    i_res_cnt NUMBER default 0;     /* 잔여계약 */ 
    i_min_agr_cnt NUMBER default 0; /* 최소약정계약건 */
    i_109_cnt NUMBER default 0; /* 청구스케줄 카운트 */
    e_Error EXCEPTION;
    
    BEGIN
        
        /* 청구스케줄 이려 여부 */
        SELECT  COUNT(1) CNT
          INTO  i_109_cnt
          FROM  RTSD0109
         WHERE  ORD_NO = v_Ord_No;

        /* ==================== */
        /* D: 단체              */
        /* ==================== */
        IF v_GRP_TYPE = 'D' THEN    -- 단체
        
          /* ---------------------*/
          /* D-1. 변경 이력 생성  */
          /* ---------------------*/
          IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_Errortext) THEN
              v_Return_Message := '단체 이력 등록 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;

          /* ---------------------------- */
          /* D-1.단체 계약별 할인 삭제    */
          /* ---------------------------- */       
          IF 0 != PKG_RTSD0105.f_sRtsd0047DeletePackage(v_Ord_No, v_Errortext) THEN
              v_Return_Message := '단체 계약별 할인 삭제 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;          
          
          /* ---------------------------- */
          /* D-3.단체 계약별 할인 저장    */
          /* ---------------------------- */    
          IF 0 != PKG_RTSD0105.f_sRtsd0047CancelGroup(v_Ord_No, v_Grp_No, v_Reg_Id, v_dc_Gb, v_Errortext) THEN
              v_Return_Message := '단체 계약별 할인 저장 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;             
          
          /* ---------------------------- */
          /* D-4.단체 계약별 할인이력     */
          /* ---------------------------- */       
          IF 0 != PKG_RTSD0105.f_sRtsd0040CancelGroup(v_Ord_No, v_Grp_No, v_Reg_Id, v_dc_Gb,  v_Errortext) THEN
              v_Return_Message := '단체 계약별 할인이력 삭제 실패!!!'||'-'||v_Errortext;
              v_Errortext := v_Errortext;
              RAISE e_Error;
          END IF;
          
          /* ----------------------------- */
          /* D-5 청구스케쥴 여부           */
          /* ----------------------------- */             
          IF 0 < i_109_cnt THEN
              PKG_RTSD0109.p_InsertRtsd0109SchGrpYnSet(v_Ord_No, v_Reg_Id, 'Y', '0',  v_Success_Code, v_Return_Message, v_Errortext);
              IF 0 != v_Success_Code THEN
                 v_Return_Message := '청구 스케쥴 위약금 여부 실패!!!'||'-'||v_Return_Message;
                 v_Errortext := v_Errortext;
                 RAISE e_Error;
              END IF;
          END IF;        
        ELSE
            v_Return_Message := '단체유형 오류!!!['||v_GRP_TYPE||']';
            RAISE e_Error;        
        END IF; 
  
    v_Success_code := 0;
    v_Return_Message := '정상적으로 해지되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_sRTSD0031cancelGroup(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_sRTSD0031cancelGroup(2)', v_ErrorText, v_Return_Message);
  END p_sRTSD0031cancelGroup;  


  /*****************************************************************************
  -- 단체(묶음)해지 추가시 잔여계약본수 이상으로 재 진입시
  *****************************************************************************/
  PROCEDURE p_sRTSD0031AddGroup (
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,     /* 단체번호 */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* 등록자 ID */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    i_res_cnt       NUMBER default 0;       /* 잔여계약 */ 
    i_min_agr_cnt   NUMBER default 0;       /* 최소약정계약건 */
    i_109_cnt       NUMBER default 0;       /* 청구스케줄 카운트 */
    v_ord_no        RTSD0104.ORD_NO%TYPE;   /* 주문번호 */
    
    e_Error EXCEPTION;
    
    /* 단체 주문번호 받아오기 */
    CURSOR CUR_ORD_NO  IS 
    SELECT ORD_NO 
      FROM RTSD0104
     WHERE GRP_YN = 'Y'
       AND GRP_NO = v_Grp_No;
    
    BEGIN
        
        FOR CUR IN CUR_ORD_NO LOOP
            EXIT WHEN CUR_ORD_NO%NOTFOUND;  
            
            v_ord_no := CUR.ORD_NO;
            
                      
            /* 청구스케줄 이려 여부 */
            SELECT  COUNT(1) CNT
              INTO  i_109_cnt
              FROM  RTSD0109
             WHERE  ORD_NO = v_Ord_No;

              /* ---------------------------- */
              /* D-1.단체 계약별 할인 삭제    */
              /* ---------------------------- */       
              IF 0 != PKG_RTSD0105.f_sRtsd0047DeletePackage(v_ord_no, v_Errortext) THEN
                  v_Return_Message := '단체 계약별 할인 삭제 실패!!!'||'-'||v_Errortext;
                  v_Errortext := v_Errortext;
                  RAISE e_Error;
              END IF;          
              
              /* ---------------------------- */
              /* D-3.단체 계약별 할인 저장    */
              /* ---------------------------- */    
              IF 0 != PKG_RTSD0104.f_sRtsd0104SaleIns(v_ord_no, v_Reg_Id, 'B', v_Errortext) THEN
                  v_Return_Message := '단체 계약별 할인 저장 실패!!!'||'-'||v_Errortext;
                  v_Errortext := v_Errortext;
                  RAISE e_Error;
              END IF;             
              
              /* ---------------------------- */
              /* D-4.단체 계약별 할인이력     */
              /* ---------------------------- */       
              IF 0 != PKG_RTSD0104.f_sRtsd0104SaleTempIns(v_Ord_No, v_Reg_Id, 'B',  v_Errortext) THEN
                  v_Return_Message := '단체 계약별 할인이력 삭제 실패!!!'||'-'||v_Errortext;
                  v_Errortext := v_Errortext;
                  RAISE e_Error;
              END IF;
              
              /* ----------------------------- */
              /* D-5 청구스케쥴 여부           */
              /* ----------------------------- */             
              IF 0 < i_109_cnt THEN
                  PKG_RTSD0109.p_InsertRtsd0109SchGrpYnSet(v_Ord_No, v_Reg_Id, 'Y', '0',  v_Success_Code, v_Return_Message, v_Errortext);
                  IF 0 != v_Success_Code THEN
                     v_Return_Message := '청구 스케쥴 위약금 여부 실패!!!'||'-'||v_Return_Message;
                     v_Errortext := v_Errortext;
                     RAISE e_Error;
                  END IF;
              END IF;  
        END LOOP;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 변경되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_sRTSD0031AddGroup(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0031.p_sRTSD0031AddGroup(2)', v_ErrorText, v_Return_Message);
  END p_sRTSD0031AddGroup;  
  
END PKG_RTSD0031;