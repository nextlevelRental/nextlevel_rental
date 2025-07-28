CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0110 AS
/*******************************************************************************
   NAME      Pkg_Rtre0110
   PURPOSE   채권 관리 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 채권 관리 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0110Count(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,          /*채권관리년월        */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0110
    WHERE   RAMG_YM = v_Ramg_Ym
    AND     CUST_NO = v_Cust_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0110Count;

  /*****************************************************************************
  -- 채권 관리 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0110 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE       /*채권계정등급          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RAMG_YM,                   /*채권관리년월        */
            A.CUST_NO,                   /*고객번호            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM,                /*고객명              */ 
            A.RAMG_STAT,                 /*채권계정등급        */             
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R035', A.RAMG_STAT) RAMG_STAT_NM, /*채권계정등급        */ 
            A.RAMG_AMT,                  /*채권관리금액        */
            A.ARRE_AMT,                  /*연체금액            */
            A.RMON_AMT,                  /*당월청구금액        */
            A.RAMGRE_AMT,                /*채권관리수납금액    */
            A.ARRERE_AMT,                /*연체수납금액        */
            A.RMONRE_AMT,                /*당월청구수납금액    */
            A.OVIN_AMT,                  /*연체이자금액        */
            A.OVINRE_AMT,                /*연체이자수납금액    */
            A.RAMG_ID,                   /*채권관리자          */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.RAMG_ID) RAMG_NM,                 /*채권관리자          */
            A.ORD_CNT,                   /*계약건수            */
            A.FST_DEL_YM,                /*연체시작년월        */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                   /*등록자              */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                   /*변경자              */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0110 A    
    WHERE   A.RAMG_YM = v_Ramg_Ym
    AND     A.CUST_NO LIKE v_Cust_No||'%'
    AND     (v_Ramg_Stat IS NULL OR A.RAMG_STAT = v_Ramg_Stat);
    
  END p_sRtre0110;

  /*****************************************************************************
  -- 채권 관리 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*채권계정등급          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*연체이자수납금액      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*채권관리자            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*계약건수              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0110 (
            RAMG_YM,
            CUST_NO,
            RAMG_STAT,
            RAMG_AMT,
            ARRE_AMT,
            RMON_AMT,
            RAMGRE_AMT,
            ARRERE_AMT,
            RMONRE_AMT,
            OVIN_AMT,
            OVINRE_AMT,
            RAMG_ID,
            ORD_CNT,
            FST_DEL_YM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ramg_Ym,
            v_Cust_No,
            v_Ramg_Stat,
            v_Ramg_Amt,
            v_Arre_Amt,
            v_Rmon_Amt,
            v_Ramgre_Amt,
            v_Arrere_Amt,
            v_Rmonre_Amt,
            v_Ovin_Amt,
            v_Ovinre_Amt,
            v_Ramg_Id,
            v_Ord_Cnt,
            v_Fst_Del_Ym,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0110;

  /*****************************************************************************
  -- 채권 관리 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*채권계정등급          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*연체이자수납금액      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*채권관리자            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*계약건수              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0110
    SET    RAMG_STAT  = v_Ramg_Stat,
           RAMG_AMT   = v_Ramg_Amt,
           ARRE_AMT   = v_Arre_Amt,
           RMON_AMT   = v_Rmon_Amt,
           RAMGRE_AMT = v_Ramgre_Amt,
           ARRERE_AMT = v_Arrere_Amt,
           RMONRE_AMT = v_Rmonre_Amt,
           OVIN_AMT   = v_Ovin_Amt,
           OVINRE_AMT = v_Ovinre_Amt,
           RAMG_ID    = v_Ramg_Id,
           ORD_CNT    = v_Ord_Cnt,
           FST_DEL_YM = v_Fst_Del_Ym,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  RAMG_YM    = v_Ramg_Ym
    AND    CUST_NO    = v_Cust_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0110;

  /*****************************************************************************
  -- 채권 관리 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0110
    WHERE  RAMG_YM = v_Ramg_Ym
    AND    CUST_NO = v_Cust_No;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110(2)', '채권관리년월', v_Ramg_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110(2)', '고객번호', v_Cust_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0110;

  /*****************************************************************************
  -- 채권 관리 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0110 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*채권계정등급          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*채권관리금액          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*연체금액              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*당월청구금액          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*채권관리수납금액      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*연체수납금액          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*당월청구수납금액      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*연체이자금액          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*연체이자수납금액      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*채권관리자            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*계약건수              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*연체시작년월          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 채권계정등급,  등록자 ID   
    IF (TRIM(v_Ramg_Ym) IS NULL) OR (0 != ISDATE(v_Ramg_Ym)) THEN
        v_Return_Message := '채권관리년월('||v_Ramg_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  
    
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Ramg_Stat) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R035', v_Ramg_Stat)) THEN
        v_Return_Message := '채권계정등급('||v_Ramg_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtre0110Count(v_Ramg_Ym, v_Cust_No) THEN

        IF 0 != f_InsertRtre0110(v_Ramg_Ym, v_Cust_No, v_Ramg_Stat, v_Ramg_Amt, 
                                 v_Arre_Amt, v_Rmon_Amt, v_Ramgre_Amt, v_Arrere_Amt, 
                                 v_Rmonre_Amt, v_Ovin_Amt, v_Ovinre_Amt, v_Ramg_Id, 
                                 v_Ord_Cnt, v_Fst_Del_Ym, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '채권 관리 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0110(v_Ramg_Ym, v_Cust_No, v_Ramg_Stat, v_Ramg_Amt, 
                                     v_Arre_Amt, v_Rmon_Amt, v_Ramgre_Amt, v_Arrere_Amt, 
                                     v_Rmonre_Amt, v_Ovin_Amt, v_Ovinre_Amt, v_Ramg_Id, 
                                     v_Ord_Cnt, v_Fst_Del_Ym, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '채권 관리 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0110(v_Ramg_Ym, v_Cust_No, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '채권 관리 내역 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.p_IUDRtre0110(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.p_IUDRtre0110(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0110;

  /*****************************************************************************
  -- RE-040111 채권관리대상 집계 : 해당 년월을 기준으로 채권 관리 계정내역을 생성 
  *****************************************************************************/
  PROCEDURE p_InsertRtre0110Aggregate (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Proc_Yn        IN VARCHAR,                      /*처리가능 여부         */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 채권대상 집계: 채권대상 집계는 고객별 데이터로 당월청구금액 + 전월연체내역을 기준으로 생성함.
    CURSOR  Cur_Rtre0110 IS 
    SELECT  v_Ramg_Ym   AS RAMG_YM,
            'D'         AS ARRE_FG,     -- 연체구분
            B.ORD_NO    AS ORD_NO,
            B.CUST_NO   AS CUST_NO,
            A.RECP_TP   AS RECP_TP,
            B.PAY_MTHD  AS PAY_MTHD,
            B.PAY_DD    AS PAY_DD,
            1           AS APPR_SCNT,
            A.ARRE_AMT  AS RAMG_AMT,
            A.ARRE_AMT  AS ARRE_AMT,
            0           AS RMON_AMT,
            0           AS RAMGRE_AMT,
            0           AS ARRERE_AMT,
            0           AS RMONRE_AMT,
            0           AS OVIN_AMT,    -- 연체이자금액 구하기 ; FUNCTION 신규생성 필요
            0           AS OVINRE_AMT,
            B.MFP_YN    AS MFP_YN,
            B.TCAN_YN   AS TCAN_YN,
            B.OS_YN     AS OS_YN,
            ( 
            SELECT  SUBSTR( MIN(F.ZFB_DAY), 1, 6)
            FROM    RTRE0101 E, RTSD0109 F
            WHERE   E.DELY_DAY = TO_CHAR(LAST_DAY(TO_DATE(v_Ramg_Ym, 'YYYYMM')),'YYYYMMDD')
            AND     E.ORD_NO = B.ORD_NO
            AND     E.CUST_NO = B.CUST_NO
            AND     F.ORD_NO = E.ORD_NO
            AND     F.SCHD_SEQ = E.SCHD_SEQ 
            )           AS FST_DEL_YM,
            A.SCHD_SEQ  AS SCHD_SEQ,
            A.RECP_NU   AS RECP_NU,
            A.SALE_AMT  AS MSALE_AMT,
            A.RECP_AMT  AS MRECP_AMT,
            A.ARRE_AMT  AS MARRE_AMT,
            A.PAY_MTHD  AS MPAY_MTHD,
            A.PAY_DD    AS MPAY_DD,
            E.ZFB_DAY        AS MZFB_DAY
    FROM    RTRE0101 A, -- 전월연체내역 -> RTRE0100   
            RTSD0108 B,
            RTSD0109 E
    WHERE   A.DELY_DAY = TO_CHAR(TO_DATE(v_Ramg_Ym, 'YYYYMM')-1,'YYYYMMDD') -- 채권관리년월 기준 전월말일
    AND     B.ORD_NO   = A.ORD_NO
    AND     E.ORD_NO   = A.ORD_NO
    AND     E.SCHD_SEQ = A.SCHD_SEQ
    UNION
    SELECT  v_Ramg_Ym   AS RAMG_YM,
            'M'         AS ARRE_FG,
            D.ORD_NO    AS ORD_NO,
            D.CUST_NO   AS CUST_NO,
            C.RECP_TP   AS RECP_TP,
            D.PAY_MTHD  AS PAY_MTHD,
            D.PAY_DD    AS PAY_DD,
            0           AS APPR_SCNT,
--            C.ARRE_AMT  AS RAMG_AMT,
--            0           AS ARRE_AMT,
--            C.ARRE_AMT  AS RMON_AMT,
            C.SALE_AMT  AS RAMG_AMT,
            0           AS ARRE_AMT,
            C.SALE_AMT  AS RMON_AMT,
            0           AS RAMGRE_AMT,
            0           AS ARRERE_AMT,
            0           AS RMONRE_AMT,
            0           AS OVIN_AMT, 
            0           AS OVINRE_AMT,
            D.MFP_YN    AS MFP_YN,
            D.TCAN_YN   AS TCAN_YN,
            D.OS_YN     AS OS_YN,
            NULL        AS FST_DEL_YM,
            C.SCHD_SEQ  AS SCHD_SEQ,
            C.RECP_NU   AS RECP_NU,
            C.SALE_AMT  AS MSALE_AMT,
            C.RECP_AMT  AS MRECP_AMT,
            C.ARRE_AMT  AS MARRE_AMT,
            C.PAY_MTHD  AS MPAY_MTHD,
            C.PAY_DD    AS MPAY_DD,
            C.ZFB_DAY   AS MZFB_DAY
    FROM    RTSD0109 C, -- 당월청구금액 -> RTSD0109  
            RTSD0108 D
    WHERE   C.ZFB_DAY BETWEEN v_Ramg_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Ramg_Ym, 'YYYYMM')),'YYYYMMDD')
    AND     C.SCD_STAT = 'S'
    AND     C.ZLSPR    = 'N'
    AND     C.USE_YN   = 'Y'
    AND     D.ORD_NO   = C.ORD_NO;

    CURSOR  Cur_Rtre0111 IS 
    SELECT  RAMG_YM,
            CUST_NO, 
            --연체회차 0 ~ 2개월 수금계정('A'),  3 ~ 6개월 집금계정('B'), 7개월이상 채권계정('C') 로 구분
            CASE 
            WHEN MAX(APPR_SCNT) >= 0 AND MAX(APPR_SCNT) <= 2 THEN 'A'
            WHEN MAX(APPR_SCNT) >= 3 AND MAX(APPR_SCNT) <= 6 THEN 'B'
            WHEN MAX(APPR_SCNT) >= 7 THEN 'C'        
            ELSE NULL    
            END AS RAMG_STAT,
            SUM( RAMG_AMT )          AS RAMG_AMT,
            SUM( ARRE_AMT )          AS ARRE_AMT,
            SUM( RMON_AMT )          AS RMON_AMT,
            SUM( OVIN_AMT )          AS OVIN_AMT,
            COUNT( DISTINCT ORD_NO ) AS ORD_CNT,
            MIN ( FST_DEL_YM )       AS FST_DEL_YM
    FROM    RTRE0111
    WHERE   RAMG_YM = v_Ramg_Ym
    GROUP   BY RAMG_YM, CUST_NO;
        
    e_Error EXCEPTION;
    
    v_Tdata_Cnt RTRE0099.TDATA_CNT%TYPE DEFAULT NULL;/*데이터 총건수         */
    v_Ramg_Id   RTRE0110.RAMG_ID%TYPE DEFAULT NULL;  /*채권관리자            */

  BEGIN

    -- 필수값: 채권관리년월, 처리가능 여부, 등록자 ID    
    IF (TRIM(v_Ramg_Ym) IS NULL) OR (0 != ISDATE(v_Ramg_Ym)) THEN
        v_Return_Message := '채권관리년월('||v_Ramg_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Proc_Yn) IS NULL) OR (TRIM(v_Proc_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '처리가능 여부('||v_Proc_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 해당월 이후 내역이 존재 여부 확인
    IF 0 < f_sRtre0110AfterCount(v_Ramg_Ym) THEN
        v_Return_Message := '해당월('||v_Ramg_Ym||') 이후 내역이 존재하기 때문에 재처리 불가합니다!';
        RAISE e_Error;
    END IF;    
    
    -- 해당월 내역이 존재 여부 확인
    IF 0 < f_sRtre0110EqualCount(v_Ramg_Ym) THEN

        IF v_Proc_Yn = 'Y' THEN           
                
            -- 해당월 채권 관리 내역 Delete
            IF 0 != f_DeleteRtre0110Equal (v_Ramg_Ym, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '채권 관리 내역 Delete 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 해당월 채권 관리 세부내역 Delete
            IF 0 != Pkg_Rtre0111.f_DeleteRtre0111Equal (v_Ramg_Ym, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '채권 관리 세부내역 Delete 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 해당월 당월청구 세부 내역 Delete
            IF 0 != Pkg_Rtre0112.f_DeleteRtre0112Equal (v_Ramg_Ym, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '당월청구 세부 내역 Delete 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
        ELSE
            v_Return_Message := '채권대상이 존재하기 때문에 삭제가 불가합니다!';
            RAISE e_Error;
        END IF; 

    END IF;
    
    v_Tdata_Cnt:= 0;
    
    -- 채권대상 집계
    FOR CUR IN Cur_Rtre0110 LOOP
        EXIT WHEN Cur_Rtre0110%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        
        -- 채권 관리 세부내역(RTRE0111) Insert / Update
        Pkg_Rtre0111.p_IUDRtre0111Aggregate (
                    CUR.RAMG_YM,        /*(v_Ramg_Ym   ) 채권관리년월          */
                    CUR.ORD_NO,         /*(v_Ord_No    ) 계약번호              */
                    CUR.CUST_NO,        /*(v_Cust_No   ) 고객번호              */
                    CUR.RECP_TP,        /*(v_Recp_Tp   ) 청구구분              */
                    CUR.PAY_MTHD,       /*(v_Pay_Mthd  ) 결제방법              */
                    CUR.PAY_DD,         /*(v_Pay_Dd    ) 결제일                */
                    CUR.APPR_SCNT,      /*(v_Appr_Scnt ) 연체회차              */
                    CUR.RAMG_AMT,       /*(v_Ramg_Amt  ) 채권관리금액          */
                    CUR.ARRE_AMT,       /*(v_Arre_Amt  ) 연체금액              */
                    CUR.RMON_AMT,       /*(v_Rmon_Amt  ) 당월청구금액          */
                    CUR.RAMGRE_AMT,     /*(v_Ramgre_Amt) 채권관리수납금액      */
                    CUR.ARRERE_AMT,     /*(v_Arrere_Amt) 연체수납금액          */
                    CUR.RMONRE_AMT,     /*(v_Rmonre_Amt) 당월청구수납금액      */
                    CUR.OVIN_AMT,       /*(v_Ovin_Amt  ) 연체이자금액          */
                    CUR.OVINRE_AMT,     /*(v_Ovinre_Amt) 연체이자 수납금액     */
                    CUR.MFP_YN,         /*(v_Mfp_Yn    ) 중도완납여부          */
                    CUR.TCAN_YN,        /*(v_Tcan_Yn   ) 임시해약여부          */
                    CUR.OS_YN,          /*(v_Os_Yn     ) 소유권이전여부        */
                    CUR.FST_DEL_YM,     /*(v_Fst_Del_Ym) 연체시작년월          */
                    v_Reg_Id,           /*(v_Reg_Id    ) 등록자 ID             */
                    v_Success_Code,
                    v_Return_Message,
                    v_ErrorText
                    );
            
        IF 0 != v_Success_Code THEN
            v_Return_Message := '채권 관리 세부내역(RTRE0111) 생성 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;        
        END IF;
        
        -- 당월청구 세부 내역(RTRE0112) Insert    
        IF 0 !=Pkg_Rtre0112.f_InsertRtre0112 (                                                   
                    CUR.RAMG_YM,        /*(v_Ramg_Ym ) 채권관리년월          */
                    CUR.ORD_NO,         /*(v_Ord_No  ) 계약번호              */
                    CUR.CUST_NO,        /*(v_Cust_No ) 고객번호              */
                    CUR.SCHD_SEQ,       /*(v_Schd_Seq) 청구순번              */
                    CUR.RECP_TP,        /*(v_Recp_Tp ) 청구구분              */
                    CUR.RECP_NU,        /*(v_Recp_Nu ) 청구회차              */
                    CUR.MSALE_AMT,      /*(v_Sale_Amt) 매출금액              */
                    CUR.MRECP_AMT,      /*(v_Recp_Amt) 수납금액              */
                    CUR.MARRE_AMT,      /*(v_Arre_Amt) 연체금액              */
                    CUR.MPAY_MTHD,      /*(v_Pay_Mthd) 결제구분              */
                    CUR.MPAY_DD,        /*(v_Pay_Dd  ) 이체일                */
                    CUR.MZFB_DAY,       /*(v_Zfb_Day ) 만기계산기준일        */
                    v_Reg_Id,           /*(v_Reg_Id  ) 등록자 ID             */
                    v_ErrorText                                               
                    ) THEN
            v_Return_Message := '채권 관리 세부내역(RTRE0112) 생성 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;                
        END IF;
    
            
    END LOOP;      
    
    IF Cur_Rtre0110%ISOPEN THEN
        CLOSE Cur_Rtre0110;
    END IF;
    
    -- 채권관리자 : 현재 채권관리자에 대한 관리 방안 부재에 따라 공통코드로 셋팅, 추후 변경대상
    v_Ramg_Id := Pkg_Rtcm0051.f_sRtcm0051Cd('R034');

    v_Tdata_Cnt:= 0;
    
    -- 채권관리 내역
    FOR CUR IN Cur_Rtre0111 LOOP
        EXIT WHEN Cur_Rtre0111%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        
                        
        -- 채권 관리 내역(RTRE0110) Insert
        p_IUDRtre0110 (
                    'I',                /*(v_Comm_Dvsn ) 처리구분(I,U,D)       */
                    CUR.RAMG_YM,        /*(v_Ramg_Ym   ) 채권관리년월          */
                    CUR.CUST_NO,        /*(v_Cust_No   ) 고객번호              */
                    CUR.RAMG_STAT,      /*(v_Ramg_Stat ) 채권계정등급          */
                    CUR.RAMG_AMT,       /*(v_Ramg_Amt  ) 채권관리금액          */
                    CUR.ARRE_AMT,       /*(v_Arre_Amt  ) 연체금액              */
                    CUR.RMON_AMT,       /*(v_Rmon_Amt  ) 당월청구금액          */
                    0,                  /*(v_Ramgre_Amt) 채권관리수납금액      */
                    0,                  /*(v_Arrere_Amt) 연체수납금액          */
                    0,                  /*(v_Rmonre_Amt) 당월청구수납금액      */
                    CUR.OVIN_AMT,       /*(v_Ovin_Amt  ) 연체이자금액          */
                    0,                  /*(v_Ovinre_Amt) 연체이자수납금액      */
                    v_Ramg_Id,          /*(v_Ramg_Id   ) 채권관리자            */
                    CUR.ORD_CNT,        /*(v_Ord_Cnt   ) 계약건수              */
                    CUR.FST_DEL_YM,     /*(v_Fst_Del_Ym) 연체시작년월          */
                    v_Reg_Id,           /*(v_Reg_Id    ) 등록자 ID             */
                    v_Success_Code,
                    v_Return_Message,
                    v_ErrorText
                    );
                    
        IF 0 != v_Success_Code THEN
            v_Return_Message := '채권 관리 내역(RTRE0110) 생성 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;        
        END IF;
                    
    END LOOP;    

    IF Cur_Rtre0111%ISOPEN THEN
        CLOSE Cur_Rtre0111;
    END IF;
    
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.p_InsertRtre0110Aggregate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.p_InsertRtre0110Aggregate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0110Aggregate;
  
  /*****************************************************************************
  -- 채권 관리 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0110AfterCount(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE           /*채권관리년월        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0110
    WHERE   RAMG_YM > v_Ramg_Ym;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0110AfterCount;
  

  /*****************************************************************************
  -- 채권 관리 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0110EqualCount(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE           /*채권관리년월        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0110
    WHERE   RAMG_YM = v_Ramg_Ym;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0110EqualCount;  
  

  /*****************************************************************************
  -- 채권 관리 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0110Equal (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0110
    WHERE  RAMG_YM = v_Ramg_Ym;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110Equal', '채권관리년월', v_Ramg_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110Equal', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0110Equal;
  
  
END Pkg_Rtre0110;