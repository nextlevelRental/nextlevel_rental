CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0071 AS
/*******************************************************************************
   NAME      Pkg_Rtre0071
   PURPOSE   출금이체 대상 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
   1.1        2017-12-05  wjim             [20171205_01] 중도완납 선수금 미정리 케이스 감안 보완
   1.2        2017-12-22  wjim             [20171222_01] 출금이체 대상집계 기준 변경
                                           - 이중출금 방지를 위해 가상계좌 발급건 출금대상 제외
   1.3        2018-01-11  wjim             [20180111_01] 가상계좌 유효기간 만료건 출금제외 보완
   1.4        2019-05-08  kstka            [20190508_01] 출금제외건 임시테이블 추가 (RTTM0003)
*******************************************************************************/

  /*****************************************************************************
  -- 출금이체 대상 Count
  *****************************************************************************/
  FUNCTION f_sRtre0071Count(
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,           /*계약번호            */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE          /*스케줄순번          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0071
    WHERE   RCMS_DAY = v_Rcms_Day
    AND     ORD_NO   = v_Ord_No
    AND     SCHD_SEQ = v_Schd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0071Count;

  /*****************************************************************************
  -- 출금이체 대상 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0071 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*은행코드              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RCMS_DAY,                  /*출금이체일자        */
            A.ORD_NO,                    /*계약번호            */
            A.SCHD_SEQ,                  /*스케줄순번          */
            A.CUST_NO,                   /*고객번호            */
            A.DEMD_DT,                   /*청구일자            */
            A.RECP_TP,                   /*청구구분            */
            A.SALE_AMT,                  /*매출금액            */
            A.ARRE_AMT,                  /*연체금액            */
            A.ZFBDT,                     /*만기계산기준일      */
            A.TORD_NO,                   /*통합청구계약번호    */
            A.ACC_SEQ,                   /*계좌순번            */
            A.BANK_CD,                   /*은행코드            */
            A.RCMS_SEQ,                  /*출금이체일련번호    */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0071 A
    WHERE   A.RCMS_DAY = DECODE(v_Rcms_Day , NULL, A.RCMS_DAY , v_Rcms_Day)
    AND     A.ORD_NO   = DECODE(v_Ord_No   , NULL, A.ORD_NO   , v_Ord_No)
    AND     A.SCHD_SEQ = DECODE(v_Schd_Seq , NULL, A.SCHD_SEQ , v_Schd_Seq)
    AND     A.CUST_NO  = DECODE(v_Cust_No  , NULL, A.CUST_NO  , v_Cust_No)
    AND     A.DEMD_DT  = DECODE(v_Demd_Dt  , NULL, A.DEMD_DT  , v_Demd_Dt)
    AND     A.RECP_TP  = DECODE(v_Recp_Tp  , NULL, A.RECP_TP  , v_Recp_Tp)
    AND     A.SALE_AMT = DECODE(v_Sale_Amt , NULL, A.SALE_AMT , v_Sale_Amt)
    AND     A.ARRE_AMT = DECODE(v_Arre_Amt , NULL, A.ARRE_AMT , v_Arre_Amt)
    AND     A.ZFBDT    = DECODE(v_Zfbdt    , NULL, A.ZFBDT    , v_Zfbdt)
    AND     A.TORD_NO  = DECODE(v_Tord_No  , NULL, A.TORD_NO  , v_Tord_No)
    AND     A.ACC_SEQ  = DECODE(v_Acc_Seq  , NULL, A.ACC_SEQ  , v_Acc_Seq)
    AND     A.BANK_CD  = DECODE(v_Bank_Cd  , NULL, A.BANK_CD  , v_Bank_cd)
    AND     A.RCMS_SEQ = DECODE(v_Rcms_Seq , NULL, A.RCMS_SEQ , v_Rcms_Seq)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtre0071;

  /*****************************************************************************
  -- CMS 청구세부 내역 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0071Detail (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE        /*출금이체일련번호      */    
    ) IS
  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.RCMS_DAY,                                                         /*출금이체일자    */
            A.ORD_NO,                                                           /*계약번호      */
            A.CUST_NO,                                                          /*고객번호      */
            Pkg_Rtsd0100.f_sRtsd0100CustName( A.CUST_NO ) AS CUST_NM,           /*고객명        */ 
            B.RECP_TP,                                                          /*청구구분      */
            Pkg_rtcm0051.f_sRtcm0051CodeName( 'R007', B.RECP_TP ) AS RECP_TP_NM,/*청구구분명    */
            B.RECP_NU,                                                          /*청구순번      */
            B.ZFB_DAY,                                                          /*만기일자      */
            A.SALE_AMT,                                                         /*매출금액      */
            A.ARRE_AMT                                                          /*현재미납금액    */
    FROM    RTRE0071 A, 
            RTSD0109 B                
    WHERE   A.RCMS_DAY = v_Rcms_Day             
    AND     A.RCMS_SEQ = v_Rcms_Seq             
    AND     B.ORD_NO   = A.ORD_NO                
    AND     B.SCHD_SEQ = A.SCHD_SEQ;            

  END p_sRtre0071Detail;
      
  /*****************************************************************************
  -- 출금이체 대상 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0071 (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*은행코드              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0071 (
            RCMS_DAY,
            ORD_NO,
            SCHD_SEQ,
            CUST_NO,
            DEMD_DT,
            RECP_TP,
            SALE_AMT,
            ARRE_AMT,
            ZFBDT,
            TORD_NO,
            ACC_SEQ,
            BANK_CD,
            RCMS_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Rcms_Day,
            v_Ord_No,
            v_Schd_Seq,
            v_Cust_No,
            v_Demd_Dt,
            v_Recp_Tp,
            v_Sale_Amt,
            v_Arre_Amt,
            v_Zfbdt,
            v_Tord_No,
            v_Acc_Seq,
            v_Bank_Cd,
            v_Rcms_Seq,
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

  END f_InsertRtre0071;

  /*****************************************************************************
  -- 출금이체 대상 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0071 (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*은행코드              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0071
    SET    CUST_NO  = v_Cust_No,
           DEMD_DT  = v_Demd_Dt,
           RECP_TP  = v_Recp_Tp,
           SALE_AMT = v_Sale_Amt,
           ARRE_AMT = v_Arre_Amt,
           ZFBDT    = v_Zfbdt,
           TORD_NO  = v_Tord_No,
           ACC_SEQ  = v_Acc_Seq,
           BANK_CD  = v_Bank_Cd,
           RCMS_SEQ = v_Rcms_Seq,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RCMS_DAY = v_Rcms_Day
    AND    ORD_NO   = v_Ord_No
    AND    SCHD_SEQ = v_Schd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0071;

  /*****************************************************************************
  -- 출금이체 대상 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0071 (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0071.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0071
    WHERE  RCMS_DAY = v_Rcms_Day
    AND    ORD_NO   = v_Ord_No
    AND    SCHD_SEQ = v_Schd_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_IUDRtre0071(1)', '출금이체일자', v_Rcms_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_IUDRtre0071(1)', '계약번호', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_IUDRtre0071(1)', '스케줄순번', v_Schd_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_IUDRtre0071(1)', '등록자 ID', v_Reg_Id);
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0071;

  /*****************************************************************************
  -- 출금이체 대상 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0071 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN OUT RTRE0071.SCHD_SEQ%TYPE,   /*스케줄순번            */
    v_Cust_No        IN RTRE0071.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0071.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0071.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0071.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0071.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0071.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0071.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Acc_Seq        IN RTRE0071.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Bank_Cd        IN RTRE0071.BANK_CD%TYPE,        /*은행코드              */
    v_Rcms_Seq       IN RTRE0071.RCMS_SEQ%TYPE,       /*출금이체일련번호      */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
  
    -- 필수값: 출금이체일자 ,계약번호 ,고객번호 ,청구일자 ,청구구분 ,매출금액 ,연체금액 ,만기계산기준일 ,계좌순번 ,출금이체일련번호 ,등록자 ID
    IF 0 != ISDATE(v_Rcms_Day) THEN
        v_Return_Message := '출금이체일자('||v_Rcms_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 != ISDATE(v_Demd_Dt) THEN
        v_Return_Message := '청구일자('||v_Demd_Dt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Recp_Tp) IS NULL THEN
        v_Return_Message := '청구구분('||v_Recp_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Sale_Amt) IS NULL THEN
        v_Return_Message := '매출금액('||v_Sale_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Arre_Amt) IS NULL THEN
        v_Return_Message := '연체금액('||v_Arre_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Zfbdt) IS NULL THEN
        v_Return_Message := '만기계산기준일('||v_Zfbdt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Tord_No) IS NULL THEN
        v_Return_Message := '통합청구계약번호('||v_Tord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Acc_Seq) IS NULL THEN
        v_Return_Message := '계좌순번('||v_Acc_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Bank_Cd) IS NULL THEN
        v_Return_Message := '은행코드('||v_Bank_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
--    IF TRIM(v_Rcms_Seq) IS NULL THEN
--        v_Return_Message := '출금이체일련번호('||v_Rcms_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
                
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    
    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_sRtre0071Count(v_Rcms_Day, v_Ord_No, v_Schd_Seq) THEN
            v_Return_Message := '해당건('||v_Rcms_Day||'-'||v_Ord_No||'-'||v_Schd_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;   
        
        v_Schd_Seq := f_sRtre0071SchdSeq(v_Rcms_Day, v_Ord_No);
        
        
        IF 0 != f_InsertRtre0071(v_Rcms_Day, v_Ord_No, v_Schd_Seq, v_Cust_No, v_Demd_Dt, 
                                 v_Recp_Tp, v_Sale_Amt, v_Arre_Amt, v_Zfbdt, v_Tord_No,  
                                 v_Acc_Seq, v_Bank_Cd, v_Rcms_Seq, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := '출금이체 대상 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0071Count(v_Rcms_Day, v_Ord_No, v_Schd_Seq) THEN
            v_Return_Message := '해당건('||v_Rcms_Day||'-'||v_Ord_No||'-'||v_Schd_Seq||')으로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;   
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0071(v_Rcms_Day, v_Ord_No, v_Schd_Seq, v_Cust_No, v_Demd_Dt, 
                                     v_Recp_Tp, v_Sale_Amt, v_Arre_Amt, v_Zfbdt, v_Tord_No, 
                                     v_Acc_Seq, v_Bank_Cd, v_Rcms_Seq, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '출금이체 대상 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0071(v_Rcms_Day, v_Ord_No, v_Schd_Seq, v_Reg_Id, 
                                     v_ErrorText) THEN
               v_Return_Message := '출금이체 대상 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_IUDRtre0071(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_IUDRtre0071(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0071;


  /*****************************************************************************
  -- 출금이체 대상 - 스케줄순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0071SchdSeq(
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_Schd_Seq  RTRE0071.SCHD_SEQ%TYPE DEFAULT NULL;    /*스케줄순번          */
  BEGIN

    SELECT  NVL((SELECT  MAX(SCHD_SEQ)
                 FROM    RTRE0071
                 WHERE   RCMS_DAY = v_Rcms_Day
                 AND     ORD_NO   = v_Ord_No)+ 1, 1) AS SCHD_SEQ
    INTO    v_Schd_Seq
    FROM    DUAL;

    RETURN v_Schd_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0071SchdSeq;


  /*****************************************************************************
  -- 출금이체 대상집계
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-12-05  wjim             [20171205_01] 중도완납 선수금 미정리 케이스 감안 보완
                                           - 마지막 회차를 남긴 상태에서 청구일 이전에 중도완납 처리 시 
                                             수납금액 0, 연체금액 0이면서 수납여부가 'N'인 건이 발생하면서
                                             미래 청구일 기준 선수금이 생겨 선수금 정리가 안되 출금집계 불가상황 발생
                                           - 샘플계약 : D15000026047
                                           - 연체금액이 0 이상인 경우에만 집계되도록 수정
   1.2        2017-12-21  wjim             [20171222_01] 이중출금 방지를 위해 가상계좌 발급건 출금대상 제외           
   1.3        2018-01-11  wjim             [20180111_01] 가상계좌 유효기간 만료건 출금제외 보완
   1.4        2019-05-08  kstka            [20190508_01] 출금제외건 임시테이블 추가 (RTTM0003)                                 
  *****************************************************************************/
  PROCEDURE p_CreateRtre0071TransAccum (
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,       /*출금이체일자          */
    v_Trans_Type     IN CHAR,                         /*출금대상구분          */
    v_Reg_Id         IN RTRE0071.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Arre_Amt  RTRE0071.ARRE_AMT%TYPE DEFAULT NULL;    /*출금이체대상금액    */
    v_Cnt   NUMBER;

  BEGIN
  
    -- 필수값: 출금이체일자 ,출금대상구분 ,등록자 ID
    IF 0 != ISDATE(v_Rcms_Day) THEN
        v_Return_Message := '출금이체일자('||v_Rcms_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Trans_Type) IS NULL THEN
        v_Return_Message := '출금대상구분('||v_Trans_Type||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    INSERT INTO RTRE0071 (
          RCMS_DAY
        , ORD_NO
        , SCHD_SEQ
        , CUST_NO
        , DEMD_DT
        , RECP_TP
        , SALE_AMT
        , ARRE_AMT
        , ZFBDT
        , TORD_NO
        , ACC_SEQ
        , BANK_CD
        , RCMS_SEQ
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    ) 
    SELECT  v_Rcms_Day  RCMS_DAY 
         ,  A.ORD_NO
         ,  B.SCHD_SEQ 
         ,  A.CUST_NO 
         ,  B.DEMD_DT 
         ,  B.RECP_TP 
         ,  B.SALE_AMT 
         ,  B.ARRE_AMT
         ,  B.ZFB_DAY   ZFBDT 
         ,  A.ORD_NO    TORD_NO 
         ,  A.ACC_SEQ
         ,  C.BANK_CD
         ,  NULL        RCMS_SEQ 
         ,  v_Reg_Id    REG_ID 
         ,  SYSDATE     REG_DT  
         ,  v_Reg_Id    CHG_ID 
         ,  SYSDATE     CHG_DT 
      FROM  RTSD0108 A
         ,  RTSD0109 B
         ,  RTRE0010 C
     WHERE  A.ORD_NO   = B.ORD_NO
       AND  A.CUST_NO  = B.CUST_NO
       AND  A.PAY_MTHD = 'A'
       AND  A.PAY_DD   = SUBSTR(v_Trans_Type, 1, 2)
       AND  A.ACC_STAT = '4'
       AND  B.SCD_STAT = 'S'
       AND  B.ZLSPR    = 'N'
       AND  B.RC_YN   <> 'Y'
       AND  B.USE_YN   = 'Y'
       AND  B.ZFB_DAY <= v_Rcms_Day
       AND  DECODE(B.ZFB_DAY, v_Rcms_Day, SUBSTR(v_Trans_Type, 3, 1), 'Y') = 'Y'
       AND  B.ARRE_AMT > 0                                                      --[20171205_01]
       AND  A.ACC_SEQ  = C.ACC_SEQ 
--       AND  A.ORD_NO NOT IN ('O15000024060')                                    --가상계좌 이중발급 출금으로 전금예정건  출금예외처리 (2018.02.12~2018.04.02)
       AND  A.ORD_NO NOT IN ('B16000070210', 'O16000029128')                                    --파산으로 인한 면책 (2018.02.12~)
       AND  A.ORD_NO NOT IN ('B18000143971', 'D16000070944')
       AND  A.ORD_NO NOT IN ('O16000065842') --중도완납처리위해 임시제외 20190322
       AND  A.ORD_NO NOT IN ('D16000049980') --중도완납처리위해 임시제외 20190327 위은지
       AND  A.ORD_NO NOT IN ('D18000183846') --계좌즉시출금 미반영으로 임시제
       AND  NOT EXISTS (                                                        --가상계좌 발급계약 집계제외 [20171222_01]
                SELECT  1
                  FROM  RTRE0220 A1
                     ,  RTRE0221 B1
                 WHERE  A1.RQST_STAT IN ('3','5')                               --가상계좌상태 = 입금대기, 통보실패 (R052)
                   AND  A1.VA_DATE >= TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')      --가상계좌 유효기간 지나지 않은 건, 부등호 방향 변경 [20180111_01]
                   AND  A1.RVA_DAY  = B1.RVA_DAY 
                   AND  A1.RVA_SEQ  = B1.RVA_SEQ
                   AND  B1.ORD_NO   = A.ORD_NO
            )
       AND  A.ORD_NO NOT IN (                                                   --[20190508_01] 출금제외를위한 임시테이블 추가 
                SELECT ORD_NO 
                FROM RTRE0310
                WHERE PAY_MTHD = 'A'
                AND USE_YN = 'Y')
                
--       AND  NOT EXISTS (                                                        --가상계좌 발급계약 집계제외 [20171222_01]
--                SELECT  1
--                  FROM  RTRE0140 A1
--                     ,  RTRE0141 B1
--                 WHERE  A1.RQST_STAT IN ('3','5')                               --가상계좌상태 = 입금대기, 통보실패 (R052)
--                   AND  A1.VA_DATE >= TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')      --가상계좌 유효기간 지나지 않은 건, 부등호 방향 변경 [20180111_01]
--                   AND  A1.RVA_DAY  = B1.RVA_DAY 
--                   AND  A1.RVA_SEQ  = B1.RVA_SEQ
--                   AND  B1.ORD_NO   = A.ORD_NO
--            )            
    ;

    -- [20171222_01] 이전
--    INSERT  INTO RTRE0071 (
--            RCMS_DAY,
--            ORD_NO,
--            SCHD_SEQ,
--            CUST_NO,
--            DEMD_DT,
--            RECP_TP,
--            SALE_AMT,
--            ARRE_AMT,
--            ZFBDT,
--            TORD_NO,
--            ACC_SEQ,
--            BANK_CD,
--            RCMS_SEQ,
--            REG_ID,
--            REG_DT,
--            CHG_ID,
--            CHG_DT
--            )      
--    SELECT  v_Rcms_Day  RCMS_DAY, 
--            A.ORD_NO, 
--            B.SCHD_SEQ, 
--            A.CUST_NO, 
--            B.DEMD_DT, 
--            B.RECP_TP, 
--            B.SALE_AMT, 
--            B.ARRE_AMT,
--            B.ZFB_DAY ZFBDT, 
--            A.ORD_NO TORD_NO, 
--            A.ACC_SEQ,
--            ( 
--            SELECT  C.BANK_CD
--            FROM    RTRE0010 C
--            WHERE   C.ACC_SEQ = A.ACC_SEQ 
--            ) BANK_CD,
--            NULL  RCMS_SEQ, 
--            v_Reg_Id REG_ID, 
--            SYSDATE REG_DT,  
--            v_Reg_Id CHG_ID, 
--            SYSDATE CHG_DT 
--    FROM    RTSD0108 A,
--            RTSD0109 B
--    WHERE   A.ORD_NO   = B.ORD_NO
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     A.PAY_MTHD = 'A'
--    AND     A.PAY_DD   = SUBSTR(v_Trans_Type, 1, 2)
--    AND     A.ACC_STAT = '4'
--    AND     B.SCD_STAT = 'S'
--    AND     B.ZLSPR    = 'N'
--    AND     B.RC_YN   <> 'Y'
--    AND     B.USE_YN   = 'Y'
--    AND     B.ZFB_DAY <= v_Rcms_Day
--    AND     DECODE(B.ZFB_DAY, v_Rcms_Day, SUBSTR(v_Trans_Type, 3, 1), 'Y') = 'Y'
--    AND     B.ARRE_AMT > 0                                                      -- [20171205_01]
--    AND     A.ORD_NO NOT IN ('D15000026074', 'B16000075263')                                    -- 6월 중도완납 미처리건으로 출금예외처리 (2017.07.24~)
--    ;

--    선수금 미처리건이 있으면 ERROR
    v_Cnt := 0; 
    SELECT  NVL(COUNT(*), 0) INTO v_Cnt
    FROM    RTRE0035
    WHERE   ORD_NO IN ( SELECT ORD_NO FROM RTRE0071
                         WHERE RCMS_DAY = v_Rcms_Day )
    AND     PND_STAT <> 'S'
    AND     ROWNUM = 1;
    
    IF v_Cnt >= 1 THEN
        v_Return_Message := '선수금이 존재하는 계약이 있습니다. 선수금정리 후 처리하시기 바랍니다!';
        RAISE e_Error;
    END  IF;
            
/*
    SELECT  NVL(SUM(ARRE_AMT),0)
    INTO    v_Arre_Amt 
    FROM    RTRE0071 
    WHERE   RCMS_DAY = v_Rcms_Day;
        
    IF v_Arre_Amt = 0 THEN
        v_Return_Message := '출금이체대상 금액이 없습니다!';
        RAISE e_Error;
    END IF;
*/        

    v_Success_code := 0;
    v_Return_Message := '정상적으로 집계되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_CreateRtre0071TransAccum(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_CreateRtre0071TransAccum(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0071TransAccum;


  /*****************************************************************************
  --  출금이체 대상 집계(RCMS_SEQ Udate)
  *****************************************************************************/
  FUNCTION f_URtre0071TransAccum(
    v_Rcms_Day       IN RTRE0071.RCMS_DAY%TYPE,         /*출금이체일자        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
  BEGIN

    UPDATE  RTRE0071 A
    SET     RCMS_SEQ = ( SELECT  B.RCMS_SEQ
                         FROM    RTRE0070 B
                         WHERE   B.RCMS_DAY = A.RCMS_DAY
                         AND     B.ORD_NO   = A.TORD_NO
                         AND     B.CUST_NO  = A.CUST_NO
                         AND     B.ACC_SEQ  = A.ACC_SEQ
                         )
    WHERE   A.RCMS_DAY = v_Rcms_Day;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_URtre0071TransAccum;


  /*****************************************************************************
  -- 출금이체 진행 CHECK
  *****************************************************************************/
  PROCEDURE p_sRtre0071Processing (
    v_Ord_No         IN RTRE0071.ORD_NO%TYPE,         /*계약번호              */
    v_Rcms_Day       OUT RTRE0071.RCMS_DAY%TYPE,      /*출금이체일자          */
    v_Rcms_Amt       OUT RTRE0070.RCMS_AMT%TYPE,      /*출금이체금액          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2

    ) IS

    e_Error EXCEPTION;

  BEGIN

    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
       
    BEGIN
    
    SELECT  NVL(SUM(B.RCMS_AMT), 0), MAX(A.RCMS_DAY)
    INTO    v_Rcms_Amt, v_Rcms_Day
    FROM    RTRE0071 A,
            RTRE0070 B
    WHERE   A.ORD_NO    = v_Ord_No
    AND     A.RCMS_DAY  = B.RCMS_DAY
    AND     A.RCMS_SEQ  = B.RCMS_SEQ
    AND     B.RQST_STAT = '2';
    
    EXCEPTION
        WHEN OTHERS THEN
        v_Rcms_Amt := 0;
    END;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 집계되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_sRtre0071Processing(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0071.p_sRtre0071Processing(2)', v_ErrorText, v_Return_Message);

  END p_sRtre0071Processing;


END Pkg_Rtre0071;
/
