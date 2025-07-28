CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0081 AS
/*******************************************************************************
   NAME      Pkg_Rtre0081
   PURPOSE   카드이체 대상 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-30  jemcarry         1. Created this package body.
   1.1        2017-12-05  wjim             [20171205_01] 중도완납 선수금 미정리 케이스 감안 보완
   1.2        2017-12-22  wjim             [20171222_01] 출금이체 대상집계 기준 변경
                                           - 이중출금 방지를 위해 가상계좌 발급건 출금대상 제외
   1.3        2018-01-11  wjim             [20180111_01] 가상계좌 유효기간 만료건 출금제외 보완  
   1.4        2019-05-08  kstka            [20190508_01] 출금제외건 임시테이블 추가 (RTTM0003)
   1.5        2024-11-18  10244015		   [20241118] 집계 성능 개선을 위한 채권매각테이블 조건 제외                                         
*******************************************************************************/

  /*****************************************************************************
  -- 카드이체 대상 Count
  *****************************************************************************/
  FUNCTION f_sRtre0081Count(
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,         /*카드이체일자        */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,           /*계약번호            */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE          /*스케줄순번          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0081
    WHERE   RCRD_DAY = v_Rcrd_Day
    AND     ORD_NO   = v_Ord_No
    AND     SCHD_SEQ = v_Schd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0081Count;

  /*****************************************************************************
  -- 카드이체 대상 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0081 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RCRD_DAY,                  /*카드이체일자        */
            A.ORD_NO,                    /*계약번호            */
            A.SCHD_SEQ,                  /*스케줄순번          */
            A.CUST_NO,                   /*고객번호            */
            A.DEMD_DT,                   /*청구일자            */
            A.RECP_TP,                   /*청구구분            */
            A.SALE_AMT,                  /*매출금액            */
            A.ARRE_AMT,                  /*연체금액            */
            A.ZFBDT,                     /*만기계산기준일      */
            A.TORD_NO,                   /*통합청구계약번호    */
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.CRD_SEQ,                   /*카드순번            */
            A.RCRD_SEQ,                  /*카드이체일련번호    */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0081 A
    WHERE   A.RCRD_DAY  = DECODE(v_Rcrd_Day , NULL, A.RCRD_DAY  , v_Rcrd_Day)
    AND     A.ORD_NO    = DECODE(v_Ord_No   , NULL, A.ORD_NO    , v_Ord_No)
    AND     A.SCHD_SEQ  = DECODE(v_Schd_Seq , NULL, A.SCHD_SEQ  , v_Schd_Seq)
    AND     A.CUST_NO   = DECODE(v_Cust_No  , NULL, A.CUST_NO   , v_Cust_No)
    AND     A.DEMD_DT   = DECODE(v_Demd_Dt  , NULL, A.DEMD_DT   , v_Demd_Dt)
    AND     A.RECP_TP   = DECODE(v_Recp_Tp  , NULL, A.RECP_TP   , v_Recp_Tp)
    AND     A.SALE_AMT  = DECODE(v_Sale_Amt , NULL, A.SALE_AMT  , v_Sale_Amt)
    AND     A.ARRE_AMT  = DECODE(v_Arre_Amt , NULL, A.ARRE_AMT  , v_Arre_Amt)
    AND     A.ZFBDT     = DECODE(v_Zfbdt    , NULL, A.ZFBDT     , v_Zfbdt)
    AND     A.TORD_NO   = DECODE(v_Tord_No  , NULL, A.TORD_NO   , v_Tord_No)
    AND     A.BATCH_KEY = DECODE(v_Batch_Key, NULL, A.BATCH_KEY , v_Batch_Key)
    AND     A.CRD_SEQ   = DECODE(v_Crd_Seq  , NULL, A.CRD_SEQ   , v_Crd_Seq)
    AND     A.RCRD_SEQ  = DECODE(v_Rcrd_Seq , NULL, A.RCRD_SEQ  , v_Rcrd_Seq)
    AND     A.REG_ID    = DECODE(v_Reg_Id   , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtre0081;

  /*****************************************************************************
  -- 카드이체 청구세부 내역 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0081Detail (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE        /*카드이체일련번호      */ 
    ) IS
  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.RCRD_DAY,                                                             /*카드이체일자    */
            A.ORD_NO,                                                           /*계약번호       */
            A.CUST_NO,                                                          /*고객번호       */
            Pkg_Rtsd0100.f_sRtsd0100CustName( A.CUST_NO ) AS CUST_NM,           /*고객명         */
            B.RECP_TP,                                                          /*청구구분       */
            Pkg_rtcm0051.f_sRtcm0051CodeName( 'R007', B.RECP_TP ) AS RECP_TP_NM,/*청구구분명     */
            B.RECP_NU,                                                          /*청구순번       */
            B.ZFB_DAY,                                                          /*만기일자       */
            A.SALE_AMT,                                                         /*매출금액       */
            A.ARRE_AMT                                                          /*현재미납금액    */
    FROM    RTRE0081 A, 
            RTSD0109 B    
    WHERE   A.RCRD_DAY = v_Rcrd_Day
    AND     A.RCRD_SEQ = v_Rcrd_Seq
    AND     B.ORD_NO = A.ORD_NO    
    AND     B.SCHD_SEQ = A.SCHD_SEQ;    

  END p_sRtre0081Detail;
  
  /*****************************************************************************
  -- 카드이체 대상 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0081 (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0081 (
            RCRD_DAY,
            ORD_NO,
            SCHD_SEQ,
            CUST_NO,
            DEMD_DT,
            RECP_TP,
            SALE_AMT,
            ARRE_AMT,
            ZFBDT,
            TORD_NO,
            BATCH_KEY,
            CRD_SEQ,
            RCRD_SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Rcrd_Day,
            v_Ord_No,
            v_Schd_Seq,
            v_Cust_No,
            v_Demd_Dt,
            v_Recp_Tp,
            v_Sale_Amt,
            v_Arre_Amt,
            v_Zfbdt,
            v_Tord_No,
            v_Batch_Key,
            v_Crd_Seq,
            v_Rcrd_Seq,
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

  END f_InsertRtre0081;

  /*****************************************************************************
  -- 카드이체 대상 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0081 (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0081
    SET    CUST_NO   = v_Cust_No,
           DEMD_DT   = v_Demd_Dt,
           RECP_TP   = v_Recp_Tp,
           SALE_AMT  = v_Sale_Amt,
           ARRE_AMT  = v_Arre_Amt,
           ZFBDT     = v_Zfbdt,
           TORD_NO   = v_Tord_No,
           BATCH_KEY = v_Batch_Key,
           CRD_SEQ   = v_Crd_Seq,
           RCRD_SEQ  = v_Rcrd_Seq,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  RCRD_DAY  = v_Rcrd_Day
    AND    ORD_NO    = v_Ord_No
    AND    SCHD_SEQ  = v_Schd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0081;

  /*****************************************************************************
  -- 카드이체 대상 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0081 (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTRE0081.SCHD_SEQ%TYPE,       /*스케줄순번            */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0081
    WHERE  RCRD_DAY = v_Rcrd_Day
    AND    ORD_NO   = v_Ord_No
    AND    SCHD_SEQ = v_Schd_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_IUDRtre0081(1)', '카드이체일자', v_Rcrd_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_IUDRtre0081(1)', '계약번호', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_IUDRtre0081(1)', '스케줄순번', v_Schd_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_IUDRtre0081(1)', '등록자 ID', v_Reg_Id);
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0081;

  /*****************************************************************************
  -- 카드이체 대상 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0081 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN OUT RTRE0081.SCHD_SEQ%TYPE,   /*스케줄순번            */
    v_Cust_No        IN RTRE0081.CUST_NO%TYPE,        /*고객번호              */
    v_Demd_Dt        IN RTRE0081.DEMD_DT%TYPE,        /*청구일자              */
    v_Recp_Tp        IN RTRE0081.RECP_TP%TYPE,        /*청구구분              */
    v_Sale_Amt       IN RTRE0081.SALE_AMT%TYPE,       /*매출금액              */
    v_Arre_Amt       IN RTRE0081.ARRE_AMT%TYPE,       /*연체금액              */
    v_Zfbdt          IN RTRE0081.ZFBDT%TYPE,          /*만기계산기준일        */
    v_Tord_No        IN RTRE0081.TORD_NO%TYPE,        /*통합청구계약번호      */
    v_Crd_Seq        IN RTRE0081.CRD_SEQ%TYPE,        /*카드순번              */
    v_Cardcom_Cd     IN RTRE0081.CARDCOM_CD%TYPE,     /*카드사코드            */
    v_Batch_Key      IN RTRE0081.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Rcrd_Seq       IN RTRE0081.RCRD_SEQ%TYPE,       /*카드이체일련번호      */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 카드이체일자 ,계약번호 ,고객번호 ,청구일자 ,청구구분 ,매출금액 ,연체금액 ,만기계산기준일 ,카드순번 ,카드이체일련번호 ,등록자 ID 
    IF 0 != ISDATE(v_Rcrd_Day) THEN
        v_Return_Message := '카드이체일자('||v_Rcrd_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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
    
    IF 0 != ISDATE(v_Zfbdt) THEN
        v_Return_Message := '만기계산기준일('||v_Zfbdt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Tord_No) IS NULL THEN
        v_Return_Message := '통합청구계약번호('||v_Tord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Crd_Seq) IS NULL THEN
        v_Return_Message := '카드순번('||v_Crd_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cardcom_Cd) IS NULL THEN
        v_Return_Message := '카드사코드('||v_Cardcom_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Batch_Key) IS NULL THEN
        v_Return_Message := 'BATCH KEY('||v_Batch_Key||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
--    IF TRIM(v_Rcrd_Seq) IS NULL THEN
--        v_Return_Message := '카드이체일련번호('||v_Rcrd_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;    
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_sRtre0081Count(v_Rcrd_Day, v_Ord_No, v_Schd_Seq) THEN
            v_Return_Message := '해당건('||v_Rcrd_Day||'-'||v_Ord_No||'-'||v_Schd_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;   

        v_Schd_Seq := f_sRtre0081SchdSeq(v_Rcrd_Day, v_Ord_No);
        
        IF 0 != f_InsertRtre0081(v_Rcrd_Day, v_Ord_No, v_Schd_Seq, v_Cust_No, v_Demd_Dt, 
                                 v_Recp_Tp, v_Sale_Amt, v_Arre_Amt, v_Zfbdt, v_Tord_No, 
                                 v_Crd_Seq, v_Cardcom_Cd, v_Batch_key, v_Rcrd_Seq, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := '카드이체 대상 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0081Count(v_Rcrd_Day, v_Ord_No, v_Schd_Seq) THEN
            v_Return_Message := '해당건('||v_Rcrd_Day||'-'||v_Ord_No||'-'||v_Schd_Seq||')으로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;   
                
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0081(v_Rcrd_Day, v_Ord_No, v_Schd_Seq, v_Cust_No, v_Demd_Dt, 
                                     v_Recp_Tp, v_Sale_Amt, v_Arre_Amt, v_Zfbdt, v_Tord_No, 
                                     v_Crd_Seq, v_Cardcom_Cd, v_Batch_key, v_Rcrd_Seq, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '카드이체 대상 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0081(v_Rcrd_Day, v_Ord_No, v_Schd_Seq, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '카드이체 대상 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_IUDRtre0081(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_IUDRtre0081(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0081;

  /*****************************************************************************
  -- 카드이체 대상 - 스케줄순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0081SchdSeq(
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,         /*카드이체일자        */
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_Schd_Seq  RTRE0081.SCHD_SEQ%TYPE DEFAULT NULL;    /*스케줄순번          */
  BEGIN

    SELECT  NVL((SELECT  MAX(SCHD_SEQ)
                 FROM    RTRE0081
                 WHERE   RCRD_DAY = v_Rcrd_Day
                 AND     ORD_NO   = v_Ord_No)+ 1, 1) AS SCHD_SEQ
    INTO    v_Schd_Seq
    FROM    DUAL;
    

    RETURN v_Schd_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0081SchdSeq;



  /*****************************************************************************
  -- 카드이체 대상집계
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-12-05  wjim             [20171205_01] 중도완납 선수금 미정리 케이스 감안 보완
                                           - 마지막 회차를 남긴 상태에서 청구일 이전에 중도완납 처리 시 
                                             수납금액 0, 연체금액 0이면서 수납여부가 'N'인 건이 발생하면서
                                             미래 청구일 기준 선수금이 생겨 선수금 정리가 안되 출금집계 불가상황 발생 가능
                                           - 샘플계약 : D15000026047 (CMS계약)
                                           - 연체금액이 0 이상인 경우에만 집계되도록 수정
   1.2        2017-12-21  wjim             [20171222_01] 이중출금 방지를 위해 가상계좌 발급건 출금대상 제외
   1.3        2018-01-11  wjim             [20180111_01] 가상계좌 유효기간 만료건 출금제외 보완
   1.4        2019-05-08  kstka            [20190508_01] 출금제외건 임시테이블 추가 (RTTM0003)
   1.5        2024-11-18  10244015		   [20241118] 집계 성능 개선을 위한 채권매각테이블 조건 제외
  *****************************************************************************/
  PROCEDURE p_CreateRtre0081CardTrans (
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_Trans_Type     IN CHAR,                         /*출금대상구분          */
    v_Reg_Id         IN RTRE0081.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Arre_Amt  RTRE0081.ARRE_AMT%TYPE DEFAULT NULL;    /*카드이체대상금액    */
    v_Cnt       NUMBER;

  BEGIN
  
    -- 필수값: 카드이체일자 ,출금대상구분 ,등록자 ID
    IF 0 != ISDATE(v_Rcrd_Day) THEN
        v_Return_Message := '카드이체일자('||v_Rcrd_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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

    INSERT INTO RTRE0081 (
          RCRD_DAY
        , ORD_NO
        , SCHD_SEQ
        , CUST_NO
        , DEMD_DT
        , RECP_TP
        , SALE_AMT
        , ARRE_AMT
        , ZFBDT
        , TORD_NO
        , CRD_SEQ
        , CARDCOM_CD
        , BATCH_KEY
        , RCRD_SEQ
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    )      
    SELECT  v_Rcrd_Day   RCRD_DAY
         ,  A.ORD_NO
         ,  B.SCHD_SEQ
         ,  A.CUST_NO
         ,  B.DEMD_DT
         ,  B.RECP_TP
         ,  B.SALE_AMT
         ,  B.ARRE_AMT
         ,  B.ZFB_DAY    ZFBDT
         ,  A.ORD_NO     TORD_NO
         ,  A.CRD_SEQ
         ,  C.CARDCOM_CD            
         ,  A.BATCH_KEY
         ,  NULL         RCRD_SEQ
         ,  v_Reg_Id     REG_ID
         ,  SYSDATE      REG_DT
         ,  v_Reg_Id     CHG_ID
         ,  SYSDATE      CHG_DT 
      FROM  RTSD0108 A
         ,  RTSD0109 B
         ,  RTRE0020 C
     WHERE  A.ORD_NO   = B.ORD_NO
       AND  A.CUST_NO  = B.CUST_NO
       AND  A.PAY_MTHD = 'C'
       AND  A.PAY_DD   = SUBSTR(v_Trans_Type, 1, 2)
       AND  B.SCD_STAT = 'S'
       AND  B.ZLSPR    = 'N'
       AND  B.RC_YN   <> 'Y'
       AND  B.USE_YN   = 'Y'
       AND  B.ZFB_DAY <= v_Rcrd_Day
       AND  DECODE(B.ZFB_DAY, v_Rcrd_Day, SUBSTR(v_Trans_Type, 3, 1), 'Y') = 'Y'
       AND  B.ARRE_AMT > 0                                                      --[20171205_01]
       AND  A.CRD_SEQ  = C.CRD_SEQ
--       AND  A.ORD_NO NOT IN ('D15000007155')                                    --2017.07.19~2017.07.24 예외처리, D15000007155 (~7/25)
       AND  A.ORD_NO NOT IN ('O15000006048')                                    --개인회생 (2018.04.02~), D18000149904 : batchkey 없음으로 임시 block (2018.07.25~2018.07.26)
--       AND  A.ORD_NO NOT IN ('B18000132135')                                    --가상계좌 오발급 미수납. 전금전까지 예외처리 (2018.04.04~2018.04.11)
       AND  A.ORD_NO NOT IN ('B17000111623')                                    --중도완납 예정고객 예외처리 (2018.08.27~)
       AND  A.ORD_NO NOT IN ('B17000081386')                                    --개인회생신청대
--       AND  A.ORD_NO NOT IN ('B18000155369')               
--       AND  A.ORD_NO NOT IN ('D17000087641')      --카드즉시승인 수납미반영 및 수납취소 실수건 제외 (위은지, 2019.02.07~2019.02.12)                       
       AND  A.ORD_NO NOT IN ('D17000114491')      --카드즉시승인 수납미반영 및 수납취소 실수건 제외 (위은지, 2019.02.07~)
       AND  A.ORD_NO NOT IN ('B19000216434')      --중도해지건 수납 제외 (이은경, 2019.12.05~)
--       AND  A.ORD_NO NOT IN ('D17000124929','D17000091154')     --중도완납 실패 제외 (위은지, 2019.02.11~2019.02.12)
--       AND  A.ORD_NO NOT IN ('B17000092071')                     --중도완납 실패 제외 (위은지, 2019.02.11~2019.02.19)
       AND  A.ORD_NO NOT IN ('B18000187064', 'B18000158995')     --중도완납 실패 제외 (위은지, 2019.02.11~)
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
                WHERE PAY_MTHD = 'C'
                AND USE_YN = 'Y')
--       AND  NOT EXISTS (SELECT 1 FROM RTTEMPIWJ_190429_01 WHERE COL_01 = A.ORD_NO)  --[20241118] 집계 성능 개선을 위한 채권매각테이블 조건 제외
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
--    INSERT  INTO RTRE0081 (
--            RCRD_DAY,
--            ORD_NO,
--            SCHD_SEQ,
--            CUST_NO,
--            DEMD_DT,
--            RECP_TP,
--            SALE_AMT,
--            ARRE_AMT,
--            ZFBDT,
--            TORD_NO,
--            CRD_SEQ,
--            CARDCOM_CD,
--            BATCH_KEY,
--            RCRD_SEQ,
--            REG_ID,
--            REG_DT,
--            CHG_ID,
--            CHG_DT
--            )      
--    SELECT  v_Rcrd_Day RCRD_DAY, A.ORD_NO, B.SCHD_SEQ, A.CUST_NO, 
--            B.DEMD_DT, B.RECP_TP, B.SALE_AMT, B.ARRE_AMT,
--            B.ZFB_DAY  ZFBDT, A.ORD_NO TORD_NO, A.CRD_SEQ,
--            ( 
--            SELECT  C.CARDCOM_CD
--            FROM    RTRE0020 C
--            WHERE   C.CRD_SEQ = A.CRD_SEQ 
--            ) CARDCOM_CD,
--            A.BATCH_KEY,
--            NULL  RCRD_SEQ, v_Reg_Id REG_ID, SYSDATE REG_DT,  
--            v_Reg_Id CHG_ID, SYSDATE CHG_DT 
--    FROM    RTSD0108 A,
--            RTSD0109 B
--    WHERE   A.ORD_NO   = B.ORD_NO
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     A.PAY_MTHD = 'C'
--    AND     A.PAY_DD   = SUBSTR(v_Trans_Type, 1, 2)
--    AND     B.SCD_STAT = 'S'
--    AND     B.ZLSPR    = 'N'
--    AND     B.RC_YN   <> 'Y'
--    AND     B.USE_YN   = 'Y'
--    AND     B.ZFB_DAY <= v_Rcrd_Day
--    AND     DECODE(B.ZFB_DAY, v_Rcrd_Day, SUBSTR(v_Trans_Type, 3, 1), 'Y') = 'Y'
--    AND     B.ARRE_AMT > 0                                                      -- [20171205_01]
--    AND     A.ORD_NO NOT IN ('D15000007155') --2017.07.19~2017.07.24 예외처리, D15000007155 (~7/25)
--    ;


--    선수금 미처리건이 있으면 ERROR
    v_Cnt := 0; 
    SELECT  NVL(COUNT(*), 0) INTO v_Cnt
    FROM    RTRE0035
    WHERE   ORD_NO IN ( SELECT ORD_NO FROM RTRE0081
                         WHERE RCRD_DAY = v_Rcrd_Day )
    AND     PND_STAT <> 'S'
    AND     ROWNUM = 1;
    
    IF v_Cnt >= 1 THEN
        v_Return_Message := '선수금이 존재하는 계약이 있습니다. 선수금정리 후 처리하시기 바랍니다!' || v_Rcrd_Day;
        RAISE e_Error;
    END  IF;
            
/*
    SELECT  NVL(SUM(ARRE_AMT),0)
    INTO    v_Arre_Amt 
    FROM    RTRE0081 
    WHERE   RCRD_DAY = v_Rcrd_Day;
        
    IF v_Arre_Amt = 0 THEN
        v_Return_Message := '카드이체대상(RTRE0081) 금액이 없습니다!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_CreateRtre0081CardTrans(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_CreateRtre0081CardTrans(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0081CardTrans;


  /*****************************************************************************
  --  카드이체 대상 집계(RCRD_SEQ Udate)
  *****************************************************************************/
  FUNCTION f_URtre0081CardTrans(
    v_Rcrd_Day       IN RTRE0081.RCRD_DAY%TYPE,         /*카드이체일자        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
  BEGIN

    UPDATE  RTRE0081 A
    SET     RCRD_SEQ = (SELECT  B.RCRD_SEQ
                        FROM    RTRE0080 B
                        WHERE   B.RCRD_DAY = A.RCRD_DAY
                        AND     B.ORD_NO   = A.TORD_NO
                        AND     B.CUST_NO  = A.CUST_NO
                        AND     B.CRD_SEQ  = A.CRD_SEQ
                         )
    WHERE   A.RCRD_DAY = v_Rcrd_Day;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_URtre0081CardTrans;


  /*****************************************************************************
  -- CLOB 자료Parsing 
  *****************************************************************************/
  PROCEDURE p_Rtre0081ClobParsing(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Clob_Data      IN RTRE0099.FILE_DATA%TYPE,          /*CLOB자료          */
    v_Clob_Type      IN VARCHAR,                          /*CLOB TYPE         */
    v_Type           IN VARCHAR,                          /*Parsing 구분자    */
    v_Spe_Yn         IN VARCHAR,                          /*별도처리여부      */
    v_Spe_Pos        IN NUMBER,                           /*별도처리위치      */
    v_Row_Count      IN OUT NUMBER,                       /*데이터총건수      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;    
    v_Table_Count NUMBER DEFAULT 0;
    v_Start_Pos   NUMBER DEFAULT 0;
    v_Next_Pos    NUMBER DEFAULT 0;
    v_Length      NUMBER DEFAULT 0;
    v_Temp_Data   VARCHAR2(1000);    
    v_Stmt        VARCHAR2(1000);    
  BEGIN

    
    -- 필수값: CLOB자료, 구분자
    v_Length := DBMS_LOB.GETLENGTH(v_Clob_Data);
    
    v_Start_Pos := 1;
    
    IF 0 >= v_Length THEN
        v_Return_Message := 'CLOB자료 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
      
    IF  NVL(v_Type, '') = '' THEN
        v_Return_Message := '구분자 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
                 
                
    IF NVL(v_Spe_Yn, '') = 'N' THEN
    
        WHILE v_Start_Pos < v_Length  LOOP
        
            v_Next_Pos  := DBMS_LOB.INSTR(v_Clob_Data, v_Type, v_Start_Pos, 1);
            
            IF v_Next_Pos > 0 THEN
            
                v_Row_Count := v_Row_Count  + 1;
                v_Temp_Data := DBMS_LOB.SUBSTR(v_Clob_Data, v_Next_Pos - v_Start_Pos, v_Start_Pos);
                
                -- Temp Table에 Insert
                INSERT INTO RTTEMP00 VALUES ( v_Clob_Type,  v_Start_Pos,  v_Temp_Data );  
                
                v_Start_Pos := v_Next_Pos + LENGTH(v_Type);
            ELSE            
                v_Start_Pos := v_Length + 1;
            END IF;
        
        END LOOP;
        
    ELSE
    
       -- SPecial건처리
       -- 첫번째 위치는 처리건이 아니기때문에 먼저 한번 찾는다.
        v_Next_Pos  := DBMS_LOB.INSTR(v_Clob_Data, v_Type, v_Start_Pos, 1);
        
        v_Start_Pos := v_Next_Pos + LENGTH(v_Type);
        
        WHILE v_Start_Pos < v_Length  LOOP
        
            v_Next_Pos  := DBMS_LOB.INSTR(v_Clob_Data, v_Type, v_Start_Pos, 1);
            
            IF v_Next_Pos > 0 THEN
            
                v_Row_Count := v_Row_Count  + 1;
                
                v_Temp_Data := DBMS_LOB.SUBSTR( v_Clob_Data, v_Next_Pos - v_Start_Pos + LENGTH(v_Type), 
                                                   v_Start_Pos - LENGTH(v_Type) - v_Spe_Pos);
                -- Temp Table에 Insert
                INSERT INTO RTTEMP00 VALUES ( v_Clob_Type,  v_Row_Count,  v_Temp_Data );  
                
                v_Start_Pos := v_Next_Pos + LENGTH(v_Type);
            ELSE         
               
                -- 마지막건 처리
                v_Row_Count := v_Row_Count  + 1;
                v_Temp_Data := DBMS_LOB.SUBSTR( v_Clob_Data, v_Length - v_Start_Pos + LENGTH(v_Type) - v_Spe_Pos + 1, 
                                                   v_Start_Pos - LENGTH(v_Type) - v_Spe_Pos);
                                                                   
                -- Temp Table에 Insert
                INSERT INTO RTTEMP00 VALUES ( v_Clob_Type,  v_Row_Count,  v_Temp_Data ); 
                 
                v_Start_Pos := v_Length + 1;
            END IF;
        
        END LOOP;
        
    
    END IF;
  
    -- CLOB데이타 Parsing결과
    OPEN  Ref_Cursor FOR  
    SELECT  A.ROW_DATA
    FROM    RTTEMP00 A
    ORDER   BY A.SEQ;
    
    IF SQLCODE = 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상 처리되었습니다';
    END IF;



    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0050.p_Rtcm0050ClobParsing(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0050.p_Rtcm0050ClobParsing(2)', v_ErrorText, v_Return_Message);


  END p_Rtre0081ClobParsing;

  /*****************************************************************************
  -- CLOB 자료Parsing 테스트
  *****************************************************************************/
  PROCEDURE p_Rtre0081ClobTest(
    Ref_Cursor       OUT SYS_REFCURSOR,
    v_Test           IN  VARCHAR,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
    v_Clob_Data  CLOB;              /*CLOB자료         */
    v_Clob_Type  VARCHAR2(10);      /*CLOB TYPE        */
    v_Type       VARCHAR2(20);      /*Parsing 구분자   */
    v_Spe_Yn     VARCHAR2(20);      /*별도처리여부     */
    v_Spe_Pos    NUMBER(10);        /*별도처리위치     */
    v_Row_Count  NUMBER(10);
    v_Length     NUMBER DEFAULT 0;
    
   
  BEGIN
  
    IF v_Test = 'CARD' THEN

        SELECT  CONTENTS
        INTO    v_Clob_Data
        FROM    RTCM0030
        WHERE   NTC_SEQ = '28';
        
        v_Clob_Type := v_Test;
        v_Type      := CHR(13)||CHR(10);
        v_Spe_Yn    := 'N';
    
    ELSIF v_Test = 'CASH' THEN
    
        SELECT  CONTENTS
        INTO    v_Clob_Data
        FROM    RTCM0030
        WHERE   NTC_SEQ = '16';
        
        v_Clob_Type := v_Test;
        v_Type      := ';';
        v_Spe_Yn    := 'N';
   
    ELSIF v_Test = 'TRANS' THEN
    
        SELECT  CONTENTS
        INTO    v_Clob_Data
        FROM    RTCM0030
        WHERE   NTC_SEQ = '20';
        
        v_Clob_Type := v_Test;
        v_Type      := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
        v_Spe_Yn    := 'Y';
        v_Spe_Pos   := 9;
   
    END IF;
        
    p_Rtre0081ClobParsing(Ref_Cursor, v_Clob_Data, v_Clob_Type, v_Type,  v_Spe_Yn, v_Spe_Pos,
                          v_Row_Count, v_Success_Code, v_Return_Message, v_ErrorText);
                          
--
--    DELETE  
--    FROM    RTTEMP00
--    WHERE   CLOB_TYPE = v_Clob_Type;
--    
--    -- 데이터 검증 + 데이터 등록
--    LOOP
--        FETCH  Ref_Cursor INTO CUR;
--        EXIT WHEN Ref_Cursor%NOTFOUND;
--        DBMS_OUTPUT.Put_Line('SEQ +++> '||CUR.SEQ);
--        DBMS_OUTPUT.Put_Line('ROW_DATA +++> '||CUR.ROW_DATA);
--        
--        INSERT  INTO    RTTEMP00
--                    ( CLOB_TYPE,   SEQ,     ROW_DATA ) 
--            VALUES  ( v_Clob_Type, CUR.SEQ, CUR.ROW_DATA );
--    END LOOP; 


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0050.p_Rtre0081ClobTest(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0050.p_Rtre0081ClobTest(2)', v_ErrorText, v_Return_Message);


  END p_Rtre0081ClobTest;


  /*****************************************************************************
  -- 카드이체 진행 CHECK
  *****************************************************************************/
  PROCEDURE p_sRtre0081Processing (
    v_Ord_No         IN RTRE0081.ORD_NO%TYPE,         /*계약번호              */
    v_Rcrd_Day       OUT RTRE0081.RCRD_DAY%TYPE,      /*카드이체일자          */
    v_Rcrd_Amt       OUT RTRE0080.RCRD_AMT%TYPE,      /*카드이체금액          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2    ) IS

    e_Error EXCEPTION;

  BEGIN
  
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    BEGIN
    
    SELECT  NVL(SUM(B.RCRD_AMT), 0), MAX(A.RCRD_DAY)
    INTO    v_Rcrd_Amt, v_Rcrd_Day
    FROM    RTRE0081 A,
            RTRE0080 B
    WHERE   A.ORD_NO    = v_Ord_No
    AND     A.RCRD_DAY  = B.RCRD_DAY
    AND     A.RCRD_SEQ  = B.RCRD_SEQ
    AND     B.RQST_STAT = '2';
    
    EXCEPTION 
        WHEN OTHERS THEN
        v_Rcrd_Amt := 0;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_sRtre0081Processing(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0081.p_sRtre0081Processing(2)', v_ErrorText, v_Return_Message);

  END p_sRtre0081Processing;

  
END Pkg_Rtre0081;