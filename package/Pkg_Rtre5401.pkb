CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE5401 AS 
/*******************************************************************************
    NAME        PKG_RTRE5401
    PURPOSE     마감전표정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
*******************************************************************************/

  /*****************************************************************************
    -- 마감전표 생성을 위한 기초 데이터 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5401 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 01.마감월별 매출내역 집계
     */
    p_AggregateRtre5201 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '01.마감월별 매출내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 02.마감월별 수납내역 집계
     */
    p_AggregateRtre5202 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '02.마감월별 수납내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 03.마감월별 선수내역 집계
     */
    p_AggregateRtre5203 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '03.마감월별 선수내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 04.마감월별 미납내역 집계
     */
    p_AggregateRtre5204 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '04.마감월별 미납내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 05.마감월별 등록비 이연내역 집계
     */
    p_AggregateRtre5205 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '05.마감월별 등록비 이연내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 06.마감월별 감가상각 이연내역 집계
     */
    p_AggregateRtre5206 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '06.마감월별 감가상각 이연내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 07.마감월별 현금영수증 발행내역 집계
     */
    p_AggregateRtre5207 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '07.마감월별 현금영수증 발행내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 08.마감월별 카드(PG) 결제내역 집계
     */
    p_AggregateRtre5208 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '08.마감월별 카드(PG) 결제내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 09.마감월별 카드이체내역 집계
     */
    p_AggregateRtre5209 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '09.마감월별 카드이체내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 10.마감월별 수수료 이연내역 집계
     */
    p_AggregateRtre5210 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '10.마감월별 수수료 이연내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 11.마감월별 판매수수료 기초내역 집계
     */
    p_AggregateRtre5211 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '11.마감월별 판매수수료 기초내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 12.마감월별 장착수수료 기초내역 집계
     */
    p_AggregateRtre5212 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '12.마감월별 장착수수료 기초내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 13.마감월별 서비스수수료 기초내역 집계
     */
    p_AggregateRtre5213 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '13.마감월별 서비스수수료 기초내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 14.마감월별 수수료 합산내역 집계
     */
    p_AggregateRtre5214 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '14.마감월별 수수료 합산내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 15.마감월별 충당금내역 집계
     */
    p_AggregateRtre5215 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '15.마감월별 충당금내역 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 16.마감월별 벤더정보 집계
     */
    p_AggregateRtre5216 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '16.마감월별 벤더정보 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 17.마감월별 법인고객정보 집계
     */
    p_AggregateRtre5217 (
          v_Zmonth            /*마감년월          */
        , v_Reg_Id            /*작업자 ID         */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '17.마감월별 법인고객정보 집계 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
        
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5401(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5401(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5401;
  
  
  /*****************************************************************************
    -- 마감월별 매출내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendReceipt_Data 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5201 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 매출내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5201
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 매출내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5201
    SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
            ROWNUM NUM,            
            A.ORD_NO,                           /*계약번호              */
            A.RECP_TP,                          /*매출구분              */
            B.CUST_TP,                          /*고객구분(개인,사업자) */    
            NVL(TRIM(E.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            A.PAY_MTHD,                         /*결제구분              */
            A.RECP_NU,                          /*청구회차              */
            A.SALE_AMT,                         /*매출액(전체)          */
            A.SALE_NAMT,                        /*매출액(공급가액)      */
            A.SALE_VAMT,                        /*세액                  */
            A.DEMD_DT,                          /*매출일자              */
            A.ZFB_DAY,                          /*결제일자              */
            A.SCHD_SEQ,                         /*청구순번              */
            D.CHAN_CD,                          /*채널구분              */
            DECODE( D.CHAN_CD, '01', D.AGENCY_CD,
                DECODE(D.CHAN_CD, '05', D.AGENCY_CD, D.ORD_AGENT)) ORD_AGENT,  /*판매인번호            */
            TO_NUMBER(D.PERIOD_CD)         AS PPTRM, /*계약기간               */ --[20181204_01]
            F.USAGE                        AS ABRVW,  /*Usage                  */ --[2019-00359563]
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTSD0109 A, RTSD0100 B, RTSD0106 C, RTSD0104 D, RTSD0115 E, RTSD0108 F
    WHERE   A.DEMD_DT BETWEEN  v_Zmonth||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
    AND     A.SCD_STAT = 'S'
    AND     A.CUST_NO  = B.CUST_NO
    AND     A.ORD_NO   = C.ORD_NO
    AND     A.ORD_NO   = D.ORD_NO
    AND     D.CHAN_CD  NOT IN ('09')                                          -- [20170316_01]
    AND     A.ORD_NO   = E.ORD_NO(+)
    AND     E.TRANS_TP(+) = 'N'
    AND     A.ORD_NO   = F.ORD_NO(+)
    ORDER BY A.ORD_NO
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5201(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5201(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5201;
  
  
  /*****************************************************************************
    -- 마감월별 수납내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendReceipt_Data 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5202 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 수납내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5202
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 수납내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT INTO RTRE5202
    SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
            ROWNUM NUM,            
            A.ORD_NO,                           /*계약번호              */
            A.RECP_TP,                          /*매출구분              */
            B.CUST_TP,                          /*고객구분(개인,사업자) */
            NVL(TRIM(F.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            A.RECP_PAY,                         /*결제구분              */
            A.RECP_AMT,                         /*수납금액              */
            0                       FEE_AMT,    /*수수료                */
            A.RECV_DAY,                         /*수납일자              */
            A.RECV_SEQ,                         /*수납거래번호          */
            A.RITM_SEQ,                         /*거래일련번호          */
            D.RECP_NU,                          /*청구회차              */
            A.SCHD_SEQ,                         /*청구순번              */
            A.RECP_FG,                          /*수납유형              */
            A.CNC_STAT,
            A.CNC_RSEQ,
            A.CNC_ISEQ,
            A.CNC_IOSEQ,
            E.CHAN_CD,                          /*채널구분              */
            DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT,   /*판매인번호            */                                                
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0030 A, RTSD0100 B, RTSD0106 C, RTSD0109 D, RTSD0104 E, RTSD0115 F
    WHERE   A.RECV_DAY BETWEEN  v_Zmonth||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
    AND     A.CUST_NO  = B.CUST_NO
    AND     A.ORD_NO   = C.ORD_NO
    AND     A.ORD_NO   = D.ORD_NO(+)
    AND     A.SCHD_SEQ = D.SCHD_SEQ(+)
    AND     A.ORD_NO   = E.ORD_NO
    AND     E.CHAN_CD  NOT IN ('09')  -- [20170316_01]
    AND     A.ORD_NO      = F.ORD_NO(+)
    AND     F.TRANS_TP(+) = 'N'
    ORDER BY ORD_NO
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5202(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5202(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5202;
  
  
  /*****************************************************************************
    -- 마감월별 선수내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendPreReceipt 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5203 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 선수내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5203
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 선수내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5203
    SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
            ROWNUM                  NUM,
            A.ORD_NO,                           /*계약번호              */
            B.CUST_TP,                          /*고객구분(개인,사업자) */
            NVL(TRIM(E.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            A.RECV_SEQ,                         /*수납거래번호          */
            A.RITM_SEQ,                         /*거래일련번호          */
            A.RECP_PAY,                         /*결제구분              */
            A.PND_AMT - A.SBS_AMT   PREPAID_AMT, /*선수금잔액            */
            A.PND_DAY,                          /*선수금 발생일자       */
            D.CHAN_CD,                          /*채널구분              */
            DECODE( D.CHAN_CD, '01', D.AGENCY_CD,
                DECODE(D.CHAN_CD, '05', D.AGENCY_CD, D.ORD_AGENT)) ORD_AGENT,    /*판매인번호            */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE                                    
    FROM    RTRE0037 A, RTSD0100 B, RTSD0106 C, RTSD0104 D, RTSD0115 E
    WHERE   A.CLOSE_DAY = TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
    AND     A.CUST_NO  = B.CUST_NO
    AND     A.ORD_NO   = C.ORD_NO
    AND     A.ORD_NO   = D.ORD_NO
    AND     A.ORD_NO   = E.ORD_NO(+)
    AND     E.TRANS_TP(+) = 'N'
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5203(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5203(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5203;
  
  
  /*****************************************************************************
    -- 마감월별 미납내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendDefault_Data 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5204 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 미납내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5204
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 미납내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT INTO RTRE5204
    SELECT  ZMONTH,     /*마감년월              */
            ROWNUM NUM,
            ORD_NO,                           /*계약번호              */
            RECP_TP,                          /*매출구분              */
            CUST_TP,                          /*고객구분(개인,사업자) */
            MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            PAY_MTHD,                         /*결제구분              */
            RECP_NU,                          /*청구회차              */
            UNPAIDAMT,  /*미납금액              */
            DEMD_DT,                          /*매출일자              */
            ZFB_DAY,                          /*결제일자              */
            SCHD_SEQ,                         /*청구순번              */
            CHAN_CD,                          /*채널구분              */
            ORD_AGENT,                        /*판매인번호            */ 
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE   
    FROM (
        SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
                A.ORD_NO,                           /*계약번호              */
                A.RECP_TP,                          /*매출구분              */
                B.CUST_TP,                          /*고객구분(개인,사업자) */
                NVL(TRIM(E.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
                A.PAY_MTHD,                         /*결제구분              */
                A.RECP_NU,                          /*청구회차              */
                A.SALE_AMT              UNPAIDAMT,  /*미납금액              */
                A.DEMD_DT,                          /*매출일자              */
                A.ZFB_DAY,                          /*결제일자              */
                A.SCHD_SEQ,                         /*청구순번              */
                D.CHAN_CD,                          /*채널구분              */
                DECODE( D.CHAN_CD, '01', D.AGENCY_CD,
                    DECODE(D.CHAN_CD, '05', D.AGENCY_CD, D.ORD_AGENT)) ORD_AGENT    /*판매인번호            */                                                    
        FROM    RTSD0109 A, RTSD0100 B, RTSD0106 C, RTSD0104 D, RTSD0115 E
        WHERE   A.DEMD_DT BETWEEN  v_Zmonth||'01'
                               AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
        AND     A.ZFB_DAY  > TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
        AND     A.SCD_STAT = 'S'
        AND     A.CUST_NO  = B.CUST_NO
        AND     A.ORD_NO   = C.ORD_NO
        AND     A.ORD_NO   = D.ORD_NO 
        AND     A.ORD_NO      = E.ORD_NO(+)
        AND     E.TRANS_TP(+) = 'N' 
        UNION
        SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
                A.ORD_NO,                           /*계약번호              */
                A.RECP_TP,                          /*매출구분              */
                B.CUST_TP,                          /*고객구분(개인,사업자) */
                NVL(TRIM(F.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
                A.PAY_MTHD,                         /*결제구분              */
                D.RECP_NU,                          /*청구회차              */
                A.ARRE_AMT              UNPAIDAMT,  /*미납금액              */
                D.DEMD_DT,                          /*매출일자              */
                D.ZFB_DAY,                          /*결제일자              */
                D.SCHD_SEQ,                         /*청구순번              */
                E.CHAN_CD,                          /*채널구분              */
                DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
                    DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT    /*판매인번호            */                                                    
        FROM    RTRE0101 A, RTSD0100 B, RTSD0106 C, RTSD0109 D, RTSD0104 E, RTSD0115 F
        WHERE   A.DELY_DAY = TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
        AND     A.CUST_NO  = B.CUST_NO
        AND     A.ORD_NO   = C.ORD_NO
        AND     A.ORD_NO   = D.ORD_NO
        AND     A.SCHD_SEQ = D.SCHD_SEQ
        AND     A.ORD_NO   = E.ORD_NO 
        AND     A.ORD_NO      = F.ORD_NO(+)
        AND     F.TRANS_TP(+) = 'N' 
    )
    ORDER BY ORD_NO
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5204(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5204(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5204;
  
  
  /*****************************************************************************
    -- 마감월별 등록비 이연내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendRegiPostpone_Data 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5205 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 등록비 이연내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5205
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 등록비 이연내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5205
    SELECT  v_Zmonth                ZMONTH,         /*마감년월              */
            ROWNUM NUM,                        
            A.ORD_NO,                           /*계약번호              */
            B.CUST_TP,                          /*고객구분(개인,사업자) */
            NVL(TRIM(D.MATNR_S), B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            B.PPTRM,                            /*이연기간              */
            C.PROC_DAY,                         /*장착일자              */
            B.ACQ_AMT               COGS,       /*제품원가              */
            A.CM_PP_AMT             CM_AMT,     /*당월 감가상각액       */
            A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
            B.CHAN_CD,                          /*채널구분              */
            B.AGENCY_CD             ORD_AGENT,  /*판매인번호            */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0125 A, RTRE0120 B, RTSD0108 C, RTSD0115 D
    WHERE   A.POSTP_YM    = v_Zmonth
    AND     A.POSTP_TP    = '01'
    AND     A.POSTP_STAT <> 'Z'
    AND     A.ORD_NO      = B.ORD_NO
    AND     A.POSTP_TP    = B.POSTP_TP
    AND     A.ORD_NO      = C.ORD_NO
    AND     A.ORD_NO      = D.ORD_NO(+)
    AND     D.TRANS_TP(+) = 'N'
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5205(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5205(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5205;
    
  
  /*****************************************************************************
    -- 마감월별 감가상각 이연내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendRegiPostpone_Data 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5206 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 감가상각 이연내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5206
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 감가상각 이연내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5206
    SELECT  A2.ZMONTH,     /*마감년월              */
            ROWNUM NUM,
            A2.POSTP_TP,
            A2.ORD_NO,                           /*계약번호              */
            A2.POSTP_STAT,                       /*이연구분              */
            A2.CUST_TP,                          /*고객구분(개인,사업자) */
            A2.MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            A2.RQTY,            
            A2.COGS,       /*제품원가              */
            A2.LY_TOT_AMT, /*전기말 감가상각 누계액*/
            A2.CY_AMT,     /*당기 상각비           */
            A2.CY_TOT_AMT, /*당기 감가상각 누계액  */
            A2.CM_AMT,     /*당월 감가상각액       */
            A2.CM_R_AMT,   /*당월 잔존가액         */
            A2.CHAN_CD,                          /*채널구분              */
            A2.ORD_AGENT,   /*판매인번호            */            
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            SUBSTR(B2.PROC_DAY,1,6) AS PROC_YM,
            B2.PERIOD_CD,
            CASE WHEN SUBSTR(B2.PROC_DAY,1,6)=v_Zmonth AND SUBSTR(NVL(B2.CANC_DAY,'000000'),1,6)=v_Zmonth THEN 
                'Y'
            ELSE 
                'N'
            END AS TM_CANC_YM
    FROM (
        SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
                A.ORD_NO,                           /*계약번호              */
                A.POSTP_STAT,                       /*이연구분              */
                B.CUST_TP,                          /*고객구분(개인,사업자) */
                NVL(TRIM(C.MATNR_S), B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
                CASE WHEN A.POSTP_TP = '03' AND B.ORD_QTY_NOW IS NOT NULL AND A.POSTP_YM = B.PSTR_YM
                     THEN (SELECT C.ORD_QTY FROM RTRE0120 C WHERE C.ORD_NO = B.ORD_NO AND C.POSTP_TP = B.POSTP_TP AND C.PP_STAT = 'Z')
                     ELSE B.ORD_QTY
                END AS RQTY,            
                B.ACQ_AMT               COGS,       /*제품원가              */
                A.LY_TPP_AMT            LY_TOT_AMT, /*전기말 감가상각 누계액*/
                A.CY_PP_AMT             CY_AMT,     /*당기 상각비           */
                A.CY_TPP_AMT            CY_TOT_AMT, /*당기 감가상각 누계액  */
                A.CM_PP_AMT             CM_AMT,     /*당월 감가상각액       */
                A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
                B.CHAN_CD,                          /*채널구분              */
                B.AGENCY_CD             ORD_AGENT,   /*판매인번호            */
                A.POSTP_TP 
        FROM    RTRE0125 A,
                RTRE0120 B,
                RTSD0115 C
        WHERE   A.POSTP_YM    = v_Zmonth
        AND     A.POSTP_TP    IN ('02','03','09','10','21','22','23','24','31','32','33','34')
        AND     A.POSTP_STAT NOT IN ( 'Z','S','G')
        AND     B.PP_STAT NOT IN ('Q','SS','Z','S','ZZ','ZA','ZB','GG','GA','GB','G', 'GGG', 'ZZZ')    --A만추출
        AND     A.POSTP_TP    = B.POSTP_TP
        AND     A.ORD_NO      = B.ORD_NO
        AND     A.ORD_NO      = C.ORD_NO(+)
        AND     C.TRANS_TP(+) = 'N'
        UNION ALL
        SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
                A.ORD_NO,                           /*계약번호              */
                A.POSTP_STAT,                       /*이연구분              */
                B.CUST_TP,                          /*고객구분(개인,사업자) */
                NVL(TRIM(C.MATNR_S), B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
                CASE WHEN A.POSTP_TP = '03' AND B.ORD_QTY_NOW IS NOT NULL AND A.POSTP_YM = B.PSTR_YM AND A.POSTP_STAT IN ('N')
                     THEN (SELECT C.ORD_QTY FROM RTRE0120 C WHERE C.ORD_NO = B.ORD_NO AND C.POSTP_TP = B.POSTP_TP AND C.PP_STAT = 'Z')
                     ELSE B.ORD_QTY
                END AS RQTY,
                B.ACQ_AMT               COGS,       /*제품원가              */
                A.LY_TPP_AMT            LY_TOT_AMT, /*전기말 감가상각 누계액*/
                A.CY_PP_AMT             CY_AMT,     /*당기 상각비           */
                A.CY_TPP_AMT            CY_TOT_AMT, /*당기 감가상각 누계액  */
                A.CM_PP_AMT             CM_AMT,     /*당월 감가상각액       */
                A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
                B.CHAN_CD,                          /*채널구분              */
                B.AGENCY_CD             ORD_AGENT,   /*판매인번호            */
                A.POSTP_TP
        FROM    RTRE0125 A,
                RTRE0120 B,
                RTSD0115 C
        WHERE   A.POSTP_YM    = v_Zmonth
        AND     A.POSTP_TP   IN ('02','03','09','10','21','22','23','24','31','32','33','34')
        AND     A.POSTP_STAT <> 'Z'
        AND     B.PP_STAT  NOT IN ('A','Z','SS','SA','SB','C','E','GG','GA','GB', 'GGG', 'ZZZ')    --S Q추출, 2016-04-02 이영근 ADD
--        AND     A.POSTP_STAT = B.PP_STAT
        AND     DECODE(A.POSTP_STAT,'NG','G','EG','G','CG','G',A.POSTP_STAT) = B.PP_STAT
--        AND     DECODE(DECODE(A.POSTP_STAT,'NG','G','EG','G','CG','G',A.POSTP_STAT),'G',DECODE(A.POSTP_TP,'03',NULL,'G'),A.POSTP_STAT) = B.PP_STAT
        AND     A.POSTP_TP    = B.POSTP_TP
        AND     A.ORD_NO      = B.ORD_NO
        AND     A.ORD_NO      = C.ORD_NO(+)
        AND     C.TRANS_TP(+) = 'N'
        ) A2
     ,  RTSD0108 B2
    WHERE   A2.ORD_NO = B2.ORD_NO
    ORDER BY A2.ORD_NO
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5206(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5206(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5206;
  
  
  /*****************************************************************************
    -- 마감월별 현금영수증 발행내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendCashReceipt 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5207 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 현금영수증 발행내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5207
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 현금영수증 발행내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT INTO RTRE5207
    WITH TMRE0091 AS (
        SELECT  A.RECV_SEQ, A.CASH_SEQ, A.CASH_DAY, A.FILE_SEQ,
                A.RECV_DAY, A.RECV_TIME, A.CUST_NO, A.CUST_NM,
                A.CASHD_TP, A.CASHD_FG, A.CHI_NO, A.CASH_AMT,
                A.CASH_NAMT, A.CASH_VAMT, A.CASH_STAT, A.CASHAPP_NO,
                A.OCAPP_NO, A.OCASH_DAY, A.CNC_YN
        FROM    RTRE0091 A
        WHERE   A.CASH_DAY BETWEEN v_Zmonth||'01'
                               AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
        AND     ( A.CASH_STAT = '5' OR A.CASH_STAT = '8' )
        )
    SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
            ROWNUM AS NUM,
            B.ORD_NO,                           /*계약번호              */
            A.RECV_SEQ,                         /*수납거래번호          */
            A.CASH_SEQ,                         /*현금영수증 발행 일련번호  */
            C.CUST_TP,                          /*고객구분              */
            NVL(TRIM(G.MATNR_S), D.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            E.CHAN_CD,                          /*채널구분              */
            DECODE(E.CHAN_CD, '01', E.AGENCY_CD,
                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT, /*판매인번호            */                                                            
            A.CASH_DAY,                         /*현금영수증발행일자    */
            A.FILE_SEQ,                         /*파일순번              */
            A.RECV_DAY,                         /*수납일자              */
            A.RECV_TIME,                        /*수납시간              */
            A.CUST_NO,                          /*고객번호              */
            A.CUST_NM,                          /*고객명                */
            A.CASHD_TP,                         /*거래구분              */
            A.CASHD_FG,                         /*발행대상구분          */
            A.CHI_NO,                           /*현금영수증 식별번호   */
            A.CASH_AMT,                         /*현금영수증 발행금액   */
            A.CASH_NAMT,                        /*현금영수증 발행 공급가액  */
            A.CASH_VAMT,                        /*현금영수증 발행 부가세    */
            A.CASH_STAT,                        /*현금영수증 발행상태   */
            A.CASHAPP_NO,                       /*현금영수증 승인번호   */
            A.OCAPP_NO,                         /*원승인번호            */
            A.OCASH_DAY,                        /*원승인일자            */
            A.CNC_YN,                           /*취소여부              */
            F.REGI_AMT,                         /*등록비                */
            F.RENT_AMT,                         /*렌탈료                */
            F.RTAR_AMT,                         /*렌탈연체료            */
            F.CANC_AMT,                         /*취소수수료            */
            F.PNTY_AMT,                         /*위약금                */
            F.PPAY_AMT,                         /*선수금                */
            F.ETC_AMT,                          /*기타                  */
            v_Reg_Id  AS REG_ID,
            SYSDATE AS REG_DT,
            v_Reg_Id  AS CHG_ID,
            SYSDATE AS CHG_DT
    FROM    TMRE0091 A,
            RTRE0030 B,
            RTSD0100 C,
            RTSD0106 D,
            RTSD0104 E,
            (
            SELECT  F.RECV_SEQ,
                    SUM(DECODE(F.RECP_TP, '01', F.RECP_AMT,0)) REGI_AMT,       /*등록비     */
                    SUM(DECODE(F.RECP_TP, '11', F.RECP_AMT,0)) RENT_AMT,       /*렌탈료     */
                    SUM(DECODE(F.RECP_TP, '12', F.RECP_AMT,0)) RTAR_AMT,       /*렌탈연체료 */
                    SUM(DECODE(F.RECP_TP, '41', F.RECP_AMT,0)) CANC_AMT,       /*취소수수료 */
                    SUM(DECODE(F.RECP_TP, '42', F.RECP_AMT,0)) PNTY_AMT,       /*위약금     */
                    SUM(DECODE(F.RECP_TP, '90', F.RECP_AMT,0)) PPAY_AMT,       /*선수금     */
                    SUM(DECODE(F.RECP_TP, '01',0,'11',0,'12',0,'41',0,'42',0,'90',0,F.RECP_AMT,0)) ETC_AMT /*기타       */
            FROM    RTRE0030 F,
                    TMRE0091 A
            WHERE   F.RECV_SEQ = A.RECV_SEQ
            GROUP   BY F.RECV_SEQ
            ) F
        ,   RTSD0115 G
    WHERE   A.RECV_SEQ  = B.RECV_SEQ
    AND     B.ROWID     = ( SELECT Z.ROWID FROM RTRE0030 Z WHERE Z.RECV_SEQ = B.RECV_SEQ AND ROWNUM <= 1 )
    AND     A.CUST_NO   = C.CUST_NO
    AND     B.ORD_NO    = D.ORD_NO
    AND     B.ORD_NO    = E.ORD_NO
    AND     A.RECV_SEQ  = F.RECV_SEQ(+)
    AND     B.ORD_NO    = G.ORD_NO(+)
    AND     G.TRANS_TP(+) = 'N'
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5207(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5207(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5207;
  
  
  /*****************************************************************************
    -- 마감월별 카드(PG) 결제내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendCardPayment 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5208 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 카드(PG) 결제내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5208
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 카드(PG) 결제내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT INTO RTRE5208
    SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
            ROWNUM                  NUM,
            A.RECV_SEQ,                         /*수납거래번호          */
            A.RECV_DAY,                         /*수납일자              */
            A.ORD_NO,                           /*계약번호              */
            A.CUST_NO,                          /*고객번호              */
            C.CUST_TP,                          /*고객구분              */
            NVL(TRIM(F.MATNR_S), D.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            E.CHAN_CD,                          /*채널구분              */
            DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT,   /*판매인번호            */                                                
            A.RECP_AMT,                         /*수납금액              */
            A.RECP_TP,                          /*청구구분              */
            A.RECP_PAY,                         /*수납방법              */
            A.RECP_FG,                          /*수납유형              */
            A.TNO,                              /*PG거래번호            */
            B.CRD_NO                CARD_NO,    /*카드번호              */
            A.CNC_RSEQ,                         /*수납취소거래번호      */
            A.CNC_STAT,                          /*수납취소여부          */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0041 A, RTRE0042 B, RTSD0100 C, RTSD0106 D, RTSD0104 E, RTSD0115 F
    WHERE   A.RECV_DAY BETWEEN  v_Zmonth||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
    AND     A.RECP_PAY = 'P1'
    AND     A.TNO      = B.TNO
    AND     A.CUST_NO  = C.CUST_NO
    AND     A.ORD_NO   = D.ORD_NO
    AND     A.ORD_NO   = E.ORD_NO
    AND     A.ORD_NO   = F.ORD_NO(+)
    AND     F.TRANS_TP(+) = 'N'
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5208(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5208(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5208;
  
  
  /*****************************************************************************
    -- 마감월별 카드이체내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendCardTransfer_Data 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5209 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 카드이체내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5209
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 카드이체내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT INTO RTRE5209
    SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
            ROWNUM NUM,
            A.RCRD_DAY,                         /*카드이체일자          */
            A.RCRD_SEQ,                         /*카드이체일련번호      */
            A.ORD_NO,                           /*계약번호              */
            A.CUST_NO,                          /*고객번호              */
            C.CUST_TP ,                         /*고객구분              */
            D.MAT_CD,                           /*상품번호              */
            E.CHAN_CD,                          /*채널구분              */
            DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT,   /*판매인번호            */                                                
            A.CRD_SEQ,                          /*카드순번              */
            A.RCRD_AMT,                         /*카드이체요청금액      */
            A.RQST_STAT,                        /*이체상태              */
            A.CARDCOM_CD,                       /*카드사코드            */
            B.CARD_NO,                          /*카드번호              */
            A.BATCH_KEY,                        /*BATCH KEY             */
            A.CRERCD,                           /*카드이체 오류코드     */
            A.RECP_AMT,                         /*수납금액              */
            A.RECV_SEQ,                         /*수납거래번호          */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0080 A, RTRE0020 B, RTSD0100 C, RTCS0001 D, RTSD0108 E
    WHERE   A.RCRD_DAY BETWEEN  v_Zmonth||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
    AND     A.CRD_SEQ = B.CRD_SEQ
    AND     A.CUST_NO = C.CUST_NO
    AND     A.ORD_NO  = D.ORD_NO
    AND     A.ORD_NO  = E.ORD_NO
    AND     A.ORD_NO NOT IN (SELECT COL_01 FROM RTTEMPIWJ_190429_01)
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5209(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5209(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5209;
  
  
  /*****************************************************************************
    -- 마감월별 수수료 이연내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendCommPostpone_Data 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5210 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 수수료 이연내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5210
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 수수료 이연내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT INTO RTRE5210
    SELECT  v_Zmonth                ZMONTH,     /*마감년월              */
            ROWNUM NUM,
            A.POSTP_TP,                         /*이연항목              */
            B.CHAN_CD,                          /*채널구분              */
            A.ORD_NO,                           /*고객번호              */
            B.CUST_TP,                          /*고객구분              */
            NVL(TRIM(D.MATNR_S), B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            B.PPTRM,                            /*이연기간              */
            C.PROC_DAY,                         /*장착일자              */
            B.ACQ_AMT               COGS,       /*제품원가              */
            A.CM_PP_AMT             CM_AMT,     /*당월 이연금액         */
            A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */            
            B.AGENCY_CD,                        /*판매인번호            */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0125 A, RTRE0120 B, RTSD0108 C, RTSD0115 D
    WHERE   A.POSTP_YM    = v_Zmonth
    AND     A.POSTP_TP   IN ( '04', '05', '06', '07', '08' )
    AND     A.POSTP_STAT <> 'Z'
    AND     A.ORD_NO      = B.ORD_NO
    AND     A.POSTP_TP    = B.POSTP_TP
    AND     A.ORD_NO      = C.ORD_NO
    AND     A.ORD_NO      = D.ORD_NO(+)
    AND     D.TRANS_TP(+) = 'N'
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5210(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5210(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5210;
  
  
  /*****************************************************************************
    -- 마감월별 판매수수료 기초내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendSalesComm 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5211 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 판매수수료 기초내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5211
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 판매수수료 기초내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5211
    SELECT  SLCM_YM,                            /*마감년월              */
            ROW_NUMBER() OVER(ORDER BY A.ORD_NO, A.COMM_TP) NUM,
            A.ORD_NO,                           /*계약번호              */
            A.COMM_TP ,                         /*수수료항목            */
            A.CUST_NO,                          /*고객번호              */
            B.CUST_TP,                          /*고객구분              */
            A.ORD_AGENT,                        /*판매원번호            */
            A.CHAN_CD,                          /*채널구분              */
            NVL(TRIM(C.MATNR_S), A.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            A.CNT_CD,                           /*타이어본수            */
            A.SLCM_AMT,                         /*판매수수료            */
            A.APFDS_AMT,                        /*충당설정가능금액      */
            A.PPOB_YN,                          /*이연대상              */
            A.PROC_DAY,                         /*장착일자              */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE5040 A, RTSD0100 B, RTSD0115 C
    WHERE   A.SLCM_YM = v_Zmonth
    AND     A.CUST_NO = B.CUST_NO
    AND     A.ORD_NO  = C.ORD_NO(+)
    AND     C.TRANS_TP(+) = 'N'
    ORDER   BY A.ORD_NO;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5211(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5211(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5211;
  
  
  /*****************************************************************************
    -- 마감월별 장착수수료 기초내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendInstallComm 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5212 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 장착수수료 기초내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5212
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 장착수수료 기초내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5212
    SELECT  SLCM_YM,                            /*마감년월              */
            ROW_NUMBER() OVER(ORDER BY A.ORD_NO, A.COMM_TP) NUM,
            A.ORD_NO,                           /*계약번호              */
            A.CUST_NO,                          /*고객번호              */
            B.CUST_TP,                          /*고객구분              */
            A.AGENCY_CD,                        /*렌탈전문점            */
            A.CHAN_CD,                          /*채널구분              */
            A.COMM_TP ,                         /*수수료항목            */
            NVL(TRIM(C.MATNR_S), A.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            A.CNT_CD,                           /*타이어본수            */
            A.PROCC_AMT,                        /*장착수수료            */
            A.PPOB_YN,                          /*이연대상              */
            A.PROC_DAY,                          /*장착일자              */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE5050 A, RTSD0100 B, RTSD0115 C
    WHERE   A.SLCM_YM = v_Zmonth
    AND     A.CUST_NO = B.CUST_NO
    AND     A.ORD_NO      = C.ORD_NO(+)
    AND     C.TRANS_TP(+) = 'N'
    ORDER  BY A.ORD_NO
    ; 
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5212(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5212(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5212;
  
  
  /*****************************************************************************
    -- 마감월별 서비스수수료 기초내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendServiceComm 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5213 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 서비스수수료 기초내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5213
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 서비스수수료 기초내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5213
    SELECT  SLCM_YM,                            /*마감년월              */
            ROW_NUMBER() OVER(ORDER BY A.ORD_NO, A.COMM_TP, A.COMM_SEQ) NUM,
            A.ORD_NO,                           /*계약번호              */
            A.COMM_TP ,                         /*수수료항목            */
            A.COMM_SEQ,                         /*수수료순번            */
            A.CUST_NO,                          /*고객번호              */
            B.CUST_TP ,                         /*고객구분              */
            A.AGENCY_CD,                        /*렌탈전문점            */
            A.CHAN_CD,                          /*채널구분              */
            NVL(TRIM(C.MATNR_S), A.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            A.CLASS_CD,                         /*차량분류              */
            A.SVCC_AMT,                         /*서비스수수료          */
            A.PPOB_YN,                          /*이연대상              */
            A.SVCP_DAY,                         /*서비스처리일자        */
            A.EQU_NO,                           /*설비번호              */
            A.SERV_SEQ,                         /*서비스순번            */
            A.SERV_ISEQ,                        /*서비스항목순번        */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE5060 A, RTSD0100 B, RTSD0115 C
    WHERE   A.SLCM_YM = v_Zmonth
    AND     A.CUST_NO = B.CUST_NO
    AND     A.ORD_NO      = C.ORD_NO(+)
    AND     C.TRANS_TP(+) = 'N'
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5213(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5213(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5213;
  
  
  /*****************************************************************************
    -- 마감월별 수수료 합산내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendCommSummary 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5214 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 수수료 합산내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5214
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 수수료 합산내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5214
    SELECT  A.SLCM_YM,                            /*마감년월              */
            ROWNUM             AS NUM,
            A.AGENCY_CD,                          /*렌탈전문점            */
            A.RTSLC_AMT,                          /*대리점판매수수료      */
            A.NTSLC_AMT,                          /*방문판매수수료        */
            A.OPSLC_AMT,                          /*오픈몰판매수수료      */
            A.TBSLC_AMT,                          /*타이어뱅크판매수수료  */
            A.PROCC_AMT,                          /*장착수수료            */
            A.LCCHC_AMT,                          /*위치교환수수료        */
            A.EGOLC_AMT,                          /*엔진오일교환수수료    */
            A.APFDS_AMT,                          /*충당설정가능금액      */
            A.BTAPFD_AMT,                         /*이전충당금액          */
            A.MFAPFD_AMT,                         /*당월충당금설정금액    */
            A.TCOMM_AMT,                          /*총 수수료액           */
            NVL(A.RGCHK_AMT,0) AS RGCHK_AMT,      /*방문점검수수료        */    --[20170519_01]
            NVL(A.ALIGN_AMT,0) AS ALIGN_AMT,      /*얼라인먼트수수료      */    --[20180326_01]
            NVL(A.ZERO_AMT ,0) AS ZERO_AMT,       /*걱정제로장착수수료    */    --[20180326_01]
            NVL(A.PICK_AMT ,0) AS PICK_AMT,       /*PickUp And Delivery 수수료    */    --[20200526_01]
            NVL(A.VPROCC_AMT ,0) AS VPROCC_AMT,   /*방문장착수수료    */    --[20200526_01]
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE5070 A
    WHERE   SLCM_YM = v_Zmonth
    ;

    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5214(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5214(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5214;
  
  
  /*****************************************************************************
    -- 마감월별 충당금내역 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendAllowance 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5215 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 충당금내역 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5215
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 충당금내역 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5215
    SELECT  v_Zmonth,
            ROWNUM,
            AGENCY_CD,                          /*렌탈전문점            */
            APFD_DAY,                           /*충당금처리일자        */
            APFD_SEQ,                           /*충당금순번            */
            APFD_TP,                            /*충당금처리구분        */
            APFD_PAMT,                          /*충당금발생금액        */
            APFD_MAMT,                          /*충당금차감금액        */
            APFD_MSG,                           /*충당금처리 사유       */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE5080
    WHERE   APFD_DAY BETWEEN  v_Zmonth||'01'
                         AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5215(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5215(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5215;
  
  
  /*****************************************************************************
    -- 마감월별 벤더정보 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_ErpSendAllAgencyVender 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5216 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 벤더정보 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5216
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 벤더정보 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5216
    SELECT  DISTINCT v_Zmonth AS PERIOD    , /*마감년월              */
            ROWNUM,
            AGENCY_CD,
            AGENCY_NM,
            SALES_GROUP,
            SALES_OFFICE,
            LIFNR,
            DECODE(TAX_RQCD,'S','Y','N') AS SIMPL_TAX,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
      FROM (SELECT AGENCY_CD,
                   AGENCY_NM,
                   SALES_GROUP,
                   SALES_OFFICE,
                   LIFNR,
                   TAX_RQCD
              FROM RTSD0007
             WHERE liFNR IS NOT NULL
             AND SALES_OFFICE IS NOT NULL
             AND CHAN_MCLS_CD NOT IN ('0105') --[20170919_01]
            UNION ALL
            SELECT ORD_AGENT AS "AGENCY_CD",
                   ORG_AGNM AS "AGENCY_NM",
                   SALES_GROUP,
                   SALES_OFFICE,
                   LIFNR,
                   TAX_RQCD
              FROM NXRADMIN.RTSD0113
             WHERE liFNR IS NOT NULL
             AND SALES_OFFICE IS NOT NULL
--             AND USE_YN = 'Y' --[20170930_01] 에 의해 주석처리
             AND CHG_ID <> 'BATCH_DEL'
             )
    ;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5216(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5216(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5216;
  
  
  /*****************************************************************************
    -- 마감월별 법인고객정보 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성 - NXRADMIN.Pkg_Exif0002.p_Erpbusicustinfo 이용
  *****************************************************************************/
  PROCEDURE p_AggregateRtre5217 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
  
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 당월 법인고객정보 집계 진행여부 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5217
     WHERE  ZMONTH = v_Zmonth
       AND  ROWNUM = 1;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 법인고객정보 집계가 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 집계 수행
     */
    INSERT  INTO RTRE5217
    SELECT  v_Zmonth                ZMONTH,     /*마감년월      */
            ROWNUM,
            A.ORD_NO                CNUM,       /*계액번호      */
            B.CUST_TP               CKIMO,      /*고객구분(개인,사업자      */
            B.CUST_NM               ZBYCN,      /*공급받는자 상호      */
            B.BUSL_NO               BUYNO,      /*공급받는자  사업자번호      */
            B.REP_NM                ZBYNM,      /*공급받는자 대표자명      */
            B.BUSI_TYPE             ZBYBT,      /*공급받는자 업종      */
            B.BUSI_COND             ZBYIT,      /*공급받는자 업태      */
            '('||B.POS_CD||')'||
            ' '||B.ADDR1||
            ' '||B.ADDR2            ZBYAR,      /*공급받는자 주소      */
            B.EMAIL_ADDR            ZBYRE,      /*공급받는자 EMAIL      */
            B.C_CUSTNM              ZBYRN,      /*공급받는자 담당자명      */
            B.C_TELNO               ZBYRT,      /*공급받는자 담당자 전화      */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTSD0108 A,
            RTSD0100 B
    WHERE   A.CUST_NO = B.CUST_NO
    AND     A.BILL_YN = 'Y'
    AND     A.PROC_DAY BETWEEN '20150904'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
    AND     (A.MFP_YN = 'N' OR (A.MFP_YN = 'Y' AND A.CANC_DAY BETWEEN v_Zmonth||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')))  /* [20161212_01] */                          
    AND     (A.OS_YN = 'N' AND (A.OS_DAY >= TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth,'YYYYMM')),'YYYYMMDD') ))
    AND     B.CUST_TP = '02'
    AND     A.CHAN_CD NOT IN ('09')     -- [20170316_01]
    ;

    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5217(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_AggregateRtre5217(2)', v_ErrorText, v_Return_Message);

  END p_AggregateRtre5217;
  

  /*****************************************************************************
  -- 마감전표정보 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_sRtre5401 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Zmonth          IN RTRE5401.ZMONTH%TYPE         /*마감년월            */    
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  CASE WHEN A1.E_SUBRC = 'S' THEN '1' ELSE '0' END AS CHK
         ,  A1.ZMONTH
         ,  A1.STMT_CD
         ,  ZA.CD_NM       AS STMT_NM
         ,  A1.STMT_SEQ
         ,  A1.BUKRS
         ,  A1.BUDAT
         ,  A1.BLDAT
         ,  A1.BKTXT
         ,  A1.WAERS
         ,  A1.E_SUBRC
         ,  A1.E_BELNR
         ,  A1.E_REMSG
         ,  A1.MANUAL_YN
         ,  A1.STMT_TGT_YN 
         ,  A1.CNC_YN
         ,  A1.REG_ID
         ,  A1.REG_DT
         ,  A1.CHG_ID
         ,  A1.CHG_DT
         ,  B1.ITM_SEQ
         ,  B1.BSCHL
         ,  B1.HKONT
         ,  ZB.CD_NM       AS HKONT_NM
         ,  B1.MWSKZ
         ,  B1.KOSTL
         ,  B1.DMBTR
         ,  DECODE(B1.SIDE_CD, 'D', B1.DMBTR, NULL) AS DMBTR_D
         ,  DECODE(B1.SIDE_CD, 'C', B1.DMBTR, NULL) AS DMBTR_C
         ,  B1.SGTXT
         ,  B1.SIDE_CD
         ,  ZC.CD_NM       AS SIDE_NM
         ,  B1.REG_ID      AS ITM_REG_ID
         ,  B1.REG_DT      AS ITM_REG_DT
         ,  B1.CHG_ID      AS ITM_CHG_ID
         ,  B1.CHG_DT      AS ITM_CHG_DT
      FROM  RTRE5401 A1
         ,  RTRE5402 B1
         ,  RTCM0051 ZA
         ,  RTCM0051 ZB
         ,  RTCM0051 ZC
     WHERE  A1.ZMONTH       = v_Zmonth
       AND  A1.ZMONTH       = B1.ZMONTH
       AND  A1.STMT_CD      = B1.STMT_CD
       AND  A1.STMT_SEQ     = B1.STMT_SEQ
       AND  A1.STMT_CD      = ZA.CD(+)
       AND  ZA.CD_GRP_CD(+) = 'R070'
       AND  B1.HKONT        = ZB.CD(+)
       AND  ZB.CD_GRP_CD(+) = 'R071'
       AND  B1.SIDE_CD      = ZC.CD(+)
       AND  ZC.CD_GRP_CD(+) = 'R072'
     ORDER  BY ZA.ORDER_PT
         ,  B1.ITM_SEQ
    ;

  END p_sRtre5401; 
  
  
  /*****************************************************************************
    -- 전표정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
    2.0		2025-04-01  10244015		SAP Company Code 변경
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Statement (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Stmt_Cd        IN RTRE5401.STMT_CD%TYPE           /*전표코드(R070)    */
    , Ref_Cursor       IN SYS_REFCURSOR                   /*Item금액정보      */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    TYPE p_CUR_Type IS RECORD (
          ITM_SEQ   RTRE5402.ITM_SEQ%TYPE
        , BSCHL     RTRE5402.BSCHL%TYPE
        , HKONT     RTRE5402.HKONT%TYPE
        , MWSKZ     RTRE5402.MWSKZ%TYPE
        , KOSTL     RTRE5402.KOSTL%TYPE
        , DMBTR     RTRE5402.DMBTR%TYPE
        , SGTXT     RTRE5402.SGTXT%TYPE
        , SIDE_CD   RTRE5402.SIDE_CD%TYPE
    );

    cur_item        p_CUR_Type;
    
    -- 상수 선언
    CS_BUKRS        RTRE5401.BUKRS%TYPE := 'KR10';  --SAP Company Code
    CS_WAERS        RTRE5401.WAERS%TYPE := 'KRW';   --SAP Currency Key
    
    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
    ls_last_Day     RTRE5401.BUDAT%TYPE;
    ln_Stmt_Seq     RTRE5401.STMT_SEQ%TYPE;
    ls_Sgtxt        RTRE5402.SGTXT%TYPE;
    
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    ls_last_Day := TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD');
    
    -- 전표순번 계산
    SELECT  NVL(MAX(STMT_SEQ), 0) + 1
      INTO  ln_Stmt_Seq
      FROM  RTRE5401
     WHERE  ZMONTH  = v_Zmonth
       AND  STMT_CD = v_Stmt_Cd
    ;
        
    -- 전표 Header insert 
    INSERT INTO RTRE5401 VALUES (
          v_Zmonth  , v_Stmt_Cd     , ln_Stmt_Seq   , CS_BUKRS      , ls_last_Day   , ls_last_Day   , NULL  , CS_WAERS
        , NULL      , NULL          , NULL          , 'N'           , 'Y'           , 'N'
        , v_Reg_Id  , SYSDATE       , v_Reg_Id      , SYSDATE 
    );
    
    LOOP
        FETCH  Ref_Cursor INTO cur_item;
        EXIT WHEN Ref_Cursor%NOTFOUND;
        
        ls_Sgtxt := SUBSTR(v_Zmonth, 3, 2)||'.'||SUBSTR(v_Zmonth, 5, 2)||' '||cur_item.SGTXT;
        
        -- 전표 Item insert 
        INSERT INTO RTRE5402 VALUES (
              v_Zmonth          , v_Stmt_Cd         , ln_Stmt_Seq       , cur_item.ITM_SEQ   
            , cur_item.BSCHL    , cur_item.HKONT    , cur_item.MWSKZ    , cur_item.KOSTL
            , cur_item.DMBTR    , ls_Sgtxt          , cur_item.SIDE_CD
            , v_Reg_Id          , SYSDATE           , v_Reg_Id          , SYSDATE 
        );
    END LOOP;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Statement(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Statement(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Statement;
  
  
  /*****************************************************************************
    -- 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401CalcTotal (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Amt_Fs10n      IN RTRE5206.CM_AMT%TYPE            /*SAP FS10N 금액    */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    -- 변수 선언  
    ln_chk          NUMBER DEFAULT 0;
    ls_last_Day     RTRE5401.BUDAT%TYPE;
    ls_Stmt_Cd      RTRE5401.STMT_CD%TYPE;
    ln_Stmt_Seq     RTRE5401.STMT_SEQ%TYPE;
    ln_Itm_Seq      RTRE5402.ITM_SEQ%TYPE;
    
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- SAP FS10N 금액  
    IF TRIM(v_Amt_Fs10n) IS NULL OR TRIM(v_Amt_Fs10n) = '' THEN
        v_Return_Message := 'FS10N 금액('||v_Amt_Fs10n||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    ls_last_Day := TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD');
    
    /*
     * 마감전표 생성을 위한 기초 데이터 집계
     */
--    p_AggregateRtre5401 (
--          v_Zmonth            /*마감년월          */
--        , v_Reg_Id            /*작업자 ID         */
--        , v_Success_Code
--        , v_Return_Message
--        , v_ErrorText
--    );
--    
--    IF 0 != v_Success_Code THEN
--        v_Return_Message := '마감전표 생성을 위한 기초 데이터 집계 실패!-'||v_Return_Message;
--        v_ErrorText := v_ErrorText;
--        RAISE e_Error;
--    END IF;
    
    /*
     * 당월 서비스수수료 집계 진행여부 확인
     */
--    SELECT  COUNT(*)
--      INTO  ln_chk
--      FROM  RTRE5401
--     WHERE  ZMONTH = v_Zmonth;
--    
--    IF ln_chk > 0 THEN
--        v_Return_Message := '해당월('||v_Zmonth||') 마감전표금액계산이 완료되어 처리가 불가합니다!';
--        RAISE e_Error;
--    END IF;

    /*
     * 전표가 생성된 경우 재계산 금지
     */
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5401
     WHERE  ZMONTH = v_Zmonth
       AND  E_BELNR IS NOT NULL;
       
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Zmonth||') 전표생성이 진행되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 기존 집계데이터 삭제
     */
    DELETE  RTRE5401
     WHERE  ZMONTH = v_Zmonth;
     
    DELETE  RTRE5402
     WHERE  ZMONTH = v_Zmonth;  
     
    DELETE  RTRE5301
     WHERE  ZMONTH = v_Zmonth; 
     
    DELETE  RTRE5302
     WHERE  ZMONTH = v_Zmonth;    
    
    /*
     * 01.등록비-선수금 인식
     */
    p_CreateRtre5401Calc01 (
          v_Zmonth          , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '01.등록비-선수금 인식 전표생성 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
    
    /*
     * 02.등록비-월 렌탈수익 인식
     */
    p_CreateRtre5401Calc02 (
          v_Zmonth          , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '02.등록비-월 렌탈수익 인식 전표생성 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 03.렌탈료 수익 인식
     */
    p_CreateRtre5401Calc03 (
          v_Zmonth          , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '03.렌탈료 수익 인식 전표생성 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
    
    /*
     * 04.리스자산/감가상각비
     */
    p_CreateRtre5401Calc04 (
          v_Zmonth          , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '04.리스자산/감가상각비 전표생성 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;    
    
    /*
     * 05.선급비용 및 충당금
     */
    p_CreateRtre5401Calc05 (
          v_Zmonth          , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '05.선급비용 및 충당금 전표생성 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;    
    
    /*
     * 09.무상교체서비스
     */
    p_CreateRtre5401Calc09 (
          v_Zmonth          , v_Amt_Fs10n       , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '09.무상교체서비스 전표생성 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
    
    /*
     * 10.서비스수수료
     */
    p_CreateRtre5401Calc10 (
          v_Zmonth          , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '10.서비스수수료 전표생성 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 11.서비스수수료
     */
    p_CreateRtre5401Calc11 (
          v_Zmonth          , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '11.마모파손 전표생성 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;        
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401CalcTotal(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401CalcTotal(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401CalcTotal;
  
  
  /*****************************************************************************
    -- 01.등록비-선수금인식 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
    2.0		2025-04-01  10244015		SAP Tax Code(RECP_TYPE) 변경
    2.0		2025-04-01  10244015		SAP GL Account(HKONT) Code 변경
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc01 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ls_Stmt_Cd      RTRE5401.STMT_CD%TYPE;     
    -- 커서 선언
    Ref_Cursor      SYS_REFCURSOR;    
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    FOR cur01 IN (
        SELECT  A3.RECP_TYPE
             ,  SUM(A3.SALE_AMT)  AS SALE_AMT
             ,  SUM(A3.SALE_NAMT) AS SALE_NAMT
             ,  SUM(A3.SALE_VAMT) AS SALE_VAMT
         FROM   (
                    SELECT  A2.*
                         ,  B2.RECP_AMT
                         ,  B2.RECP_PAY     
                         ,  CASE WHEN  A2.CUST_TP = '01' THEN
                                CASE WHEN C2.CASH_AMT IS NOT NULL THEN
                                    'B2' --현금영수증
                                WHEN B2.RECP_AMT IS NULL OR B2.RECP_AMT = 0 THEN
                                    'B3' --기타미발행
                                ELSE
                                    CASE WHEN B2.RECP_PAY IN ('P1','C2','P7') THEN
                                        'B1' --신용카드
                                    WHEN B2.RECP_PAY IN ('P6','P4','P5','C1','P2') THEN
                                        'B2' --현금영수증
                                    ELSE
                                        'B3' --기타미발행
                                    END
                                END
                            ELSE
                                CASE WHEN B2.RECP_AMT IS NULL OR B2.RECP_AMT = 0 THEN
                                    CASE WHEN A2.PAY_MTHD = 'C' THEN
                                        'B3' --기타미발행
                                    WHEN A2.PAY_MTHD = 'A' THEN
                                        'A6' --세금계산서
                                    ELSE
                                        'ETC' --미정의
                                    END
                                ELSE
                                    CASE WHEN B2.RECP_PAY IN ('P1','C2','P7') THEN
                                        'B1' --신용카드
                                    WHEN B2.RECP_PAY IN ('P6','P4','P5','C1','P2') THEN
                                        'A6' --세금계산서
                                    ELSE
                                        'ETC' --미정의
                                    END
                                END
                            END AS RECP_TYPE
                      FROM  RTRE5201 A2
                         ,  RTRE5202 B2
                         ,  (
                                SELECT  Y.ORD_NO
                                     ,  Y.CASH_AMT
                                     ,  ROW_NUMBER() OVER (PARTITION BY Y.ORD_NO ORDER BY Y.CASH_DAY) AS ROW_NUM
                                  FROM  RTRE5207 Y
                                 WHERE  Y.ZMONTH = v_Zmonth
                            ) C2       
                     WHERE  A2.ZMONTH     = v_Zmonth
                       AND  A2.RECP_TP    = '01' --*등록미 매출만
                       AND  A2.ORD_NO     = B2.ORD_NO(+)
                       AND  B2.ZMONTH(+)  = v_Zmonth
                       AND  B2.RECP_TP(+) = '90' --*선수금(매출제외)만
                       AND  A2.ORD_NO     = C2.ORD_NO(+)
                       AND  C2.ROW_NUM(+) = 1
                 ) A3
         GROUP  BY A3.RECP_TYPE
         ORDER  BY A3.RECP_TYPE
    ) LOOP 
        /*
         * 1.본전표 생성
         */
         
        -- Tax Code 에 의거 전표코드 결정
        SELECT  DECODE(cur01.RECP_TYPE, 'A6', '0101', 'B1', '0103', 'B2', '0105', 'B3', '0107', 'ETC')
          INTO  ls_Stmt_Cd
          FROM  dual;
          
        IF ls_Stmt_Cd = 'ETC' THEN
            v_Return_Message := '정의되지 않은 수납유형('||cur01.RECP_TYPE||')입니다';
            RAISE e_Error;
        END IF;
        
        -- 전표상세정보  
        OPEN  Ref_Cursor FOR
        SELECT  ITM_SEQ
             ,  BSCHL
             ,  HKONT
             ,  MWSKZ
             ,  KOSTL
             ,  CASE WHEN HKONT = '21506010' THEN 
                    cur01.SALE_VAMT --부가세액
                WHEN HKONT      = '93010070' THEN
                    cur01.SALE_NAMT --공급가액
                ELSE    
                    cur01.SALE_AMT --총매출액
                END 
             ,  SGTXT
             ,  SIDE_CD
          FROM  RTRE5400
         WHERE  STMT_CD = ls_Stmt_Cd
           AND  USE_YN  = 'Y'
        ;

        -- 전표정보 생성
        p_CreateRtre5401Statement(
              v_Zmonth         /*마감년월          */
            , ls_Stmt_Cd       /*전표코드(R070)    */
            , Ref_Cursor       /*전표상세정보      */
            , v_Reg_Id         /*작업자 ID         */
            , v_Success_Code   
            , v_Return_Message 
            , v_ErrorText      
        );
        
        IF 0 != v_Success_Code THEN
            v_Return_Message := '전표정보생성(1) 실패!-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF; 
        
        /*
         * 2.Clearing전표 생성
         */   
         
        -- Tax Code 에 의거 전표코드 결정
        SELECT  DECODE(cur01.RECP_TYPE, 'A6', '0102', 'B1', '0104', 'B2', '0106', 'B3', '0108', 'ETC')
          INTO  ls_Stmt_Cd
          FROM  dual;
        
        -- 전표상세정보  
        OPEN  Ref_Cursor FOR
        SELECT  ITM_SEQ
             ,  BSCHL
             ,  HKONT
             ,  MWSKZ
             ,  KOSTL
             ,  cur01.SALE_NAMT --공급가액
             ,  SGTXT
             ,  SIDE_CD
          FROM  RTRE5400
         WHERE  STMT_CD = ls_Stmt_Cd
           AND  USE_YN  = 'Y'
        ;

        -- 전표정보 생성
        p_CreateRtre5401Statement(
              v_Zmonth         /*마감년월          */
            , ls_Stmt_Cd       /*전표코드(R070)    */
            , Ref_Cursor       /*전표상세정보      */
            , v_Reg_Id         /*작업자 ID         */
            , v_Success_Code   
            , v_Return_Message 
            , v_ErrorText      
        ); 
        
        IF 0 != v_Success_Code THEN
            v_Return_Message := '전표정보생성(2) 실패!-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    END LOOP;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc01(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc01(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Calc01;
  
  
  /*****************************************************************************
    -- 02.등록비-월 렌탈수익 인식 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-29  ITSM            [] 신규작성
    1.1		2024-12-03  10244015		등록비 NULL값인 경우 0원으로 마감전표 생성처리
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc02 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    -- 상수 선언
    PS_STMT_CD      RTRE5401.STMT_CD%TYPE := '0201';    --전표코드     
    -- 변수 선언  
    ln_Cm_Amt       RTRE5205.CM_AMT%TYPE;               --전표금액    
    -- 커서 선언
    Ref_Cursor      SYS_REFCURSOR;                      --전표세부(Item)정보
    
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 전표금액 계산
    SELECT  NVL(SUM(CM_AMT), 0) --SUM(CM_AMT)
      INTO  ln_Cm_Amt
      FROM  RTRE5205
     WHERE  ZMONTH = v_Zmonth
    ;
   
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  ITM_SEQ
         ,  BSCHL
         ,  HKONT
         ,  MWSKZ
         ,  KOSTL
         ,  ln_Cm_Amt
         ,  SGTXT
         ,  SIDE_CD
      FROM  RTRE5400
     WHERE  STMT_CD = PS_STMT_CD
       AND  USE_YN  = 'Y'
    ;
    
    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD       /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc02(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc02(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Calc02;
  
  
  /*****************************************************************************
    -- 03.렌탈료 수익 인식 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-29  ITSM            [] 신규작성
    2.0		2025-04-01  10244015		SAP Tax Code(RECP_TYPE) 변경
    2.0		2025-04-01  10244015		SAP GL Account(HKONT) Code 변경
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc03 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    -- 변수 선언  
    ls_Stmt_Cd      RTRE5401.STMT_CD%TYPE;  --전표코드
    -- 커서 선언
    Ref_Cursor      SYS_REFCURSOR;
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    FOR cur01 IN (
        SELECT  A3.RECP_TYPE
             ,  SUM(A3.SALE_AMT)  AS SALE_AMT
             ,  SUM(A3.SALE_NAMT) AS SALE_NAMT
             ,  SUM(A3.SALE_VAMT) AS SALE_VAMT
          FROM  (
                    SELECT  A2.ORD_NO
                         ,  A2.RECP_TP
                         ,  CASE WHEN  A2.CUST_TP = '01' THEN
                                 CASE WHEN A2.CASH_AMT IS NOT NULL THEN
                                    'B2' --현금영수증
                                WHEN A2.RECP_AMT IS NULL OR A2.RECP_AMT = 0 THEN
                                    'B3' --기타미발행
                                ELSE
                                    CASE WHEN A2.RECP_PAY IN ('P1','C2','P7') THEN
                                        'B1' --신용카드
                                    WHEN A2.RECP_PAY IN ('P6','P4','P5','C1','P2') THEN
                                        'B2' --현금영수증
                                    ELSE
                                        'B3' --기타미발행
                                    END
                                END
                            ELSE
                                CASE WHEN A2.SHUTDN_YN = 'Y' THEN
                                    'B3' --기타미발행
                                ELSE
                                    CASE WHEN A2.RECP_AMT IS NULL OR A2.RECP_AMT = 0 THEN
                                        CASE WHEN A2.PAY_MTHD = 'C' THEN
                                            'B3' --기타미발행
                                        WHEN A2.PAY_MTHD = 'A' THEN
                                            'A6' --세금계산서
                                        ELSE
                                            'ETC' --미정의
                                        END
                                    ELSE
                                        CASE WHEN A2.RECP_PAY IN ('P1','C2','P7') THEN
                                            'B1' --신용카드
                                        WHEN A2.RECP_PAY IN ('P6','P4','P5','C1','P2') THEN
                                            'A6' --세금계산서
                                        ELSE
                                            'ETC' --미정의
                                        END
                                    END
                                END            
                            END AS RECP_TYPE
                         ,  A2.SALE_AMT
                         ,  A2.SALE_NAMT
                         ,  A2.SALE_VAMT
                      FROM  (
                                SELECT  A1.ORD_NO
                                     ,  A1.RECP_TP
                                     ,  A1.CUST_TP
                                     ,  A1.PAY_MTHD
                                     ,  A1.SALE_AMT
                                     ,  A1.SALE_NAMT                                    --위약금 매출의 경우 공급가액이 정상계산되지 않은 케이스들이 있어 직접 계산으로 변경
--                                     ,  ROUND(A1.SALE_AMT/1.1)             AS SALE_NAMT 
                                     ,  A1.SALE_VAMT
--                                     ,  A1.SALE_AMT-ROUND(A1.SALE_AMT/1.1) AS SALE_VAMT
                                     ,  B1.RECP_PAY
                                     ,  B1.RECV_DAY
                                     ,  B1.RECP_AMT
                                     ,  NVL(C1.USE_YN, 'N')                AS SHUTDN_YN
                                     ,  D1.CASH_AMT
                                  FROM  RTRE5201 A1
                                     ,  (
                                            SELECT  X.ORD_NO
                                                 ,  X.RECP_PAY
                                                 ,  X.RECV_DAY
                                                 ,  X.RECP_AMT
--                                                 ,  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY DECODE(X.RECP_PAY,'C2',2,'P1',2,'P7',2,1), X.RECV_DAY) AS ROW_NUM
                                                 ,  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY X.RECP_AMT DESC, X.RECV_DAY) AS ROW_NUM --복합수납의 경우 금액이 큰 것을 우선시. 다만 회계팀 가이드전에 임시기준임 w/손경호 -2020.09.21 
                                              FROM  RTRE5202 X
                                             WHERE  1=1
                                               AND  X.ZMONTH = v_Zmonth
                                               AND  X.RECP_TP IN ('11','42')
                                               AND  X.CNC_STAT = 'N'
                                        ) B1 
                                     ,  RTRE0093 C1
                                     ,  (
                                            SELECT  Y.ORD_NO
                                                 ,  Y.CASH_AMT
                                                 ,  ROW_NUMBER() OVER (PARTITION BY Y.ORD_NO ORDER BY Y.CASH_DAY) AS ROW_NUM
                                              FROM  RTRE5207 Y
                                             WHERE  1=1
                                               AND  Y.ZMONTH = v_Zmonth
                                        ) D1
                                 WHERE  1=1
                                   AND  A1.ZMONTH     = v_Zmonth
                                   AND  A1.RECP_TP    IN ('11','42') 
                                   AND  A1.ORD_NO     = B1.ORD_NO(+)
                                   AND  B1.ROW_NUM(+) = 1
                                   AND  A1.ORD_NO     = C1.ORD_NO(+)
                                   AND  A1.ORD_NO     = D1.ORD_NO(+)
                                   AND  D1.ROW_NUM(+) = 1
                            ) A2
                     WHERE  1=1
                ) A3
         WHERE  1=1
         GROUP  BY A3.RECP_TYPE
    ) LOOP 
         
        -- Tax Code 에 의거 전표코드 결정
        SELECT  DECODE(cur01.RECP_TYPE, 'A6', '0301', 'B1', '0302', 'B2', '0303', 'B3', '0304', 'ETC')
          INTO  ls_Stmt_Cd
          FROM  dual;
          
        IF ls_Stmt_Cd = 'ETC' THEN
            v_Return_Message := '정의되지 않은 수납유형('||cur01.RECP_TYPE||')입니다';
            RAISE e_Error;
        END IF;
        
        -- 전표상세정보  
        OPEN  Ref_Cursor FOR
        SELECT  ITM_SEQ
             ,  BSCHL
             ,  HKONT
             ,  MWSKZ
             ,  KOSTL
--             ,  cur01.SALE_AMT --총매출액
             ,  CASE WHEN HKONT = '21506010' THEN 
                    cur01.SALE_VAMT --부가세액
                WHEN HKONT      = '41601020' THEN
                    cur01.SALE_NAMT --공급가액
                ELSE    
                    cur01.SALE_AMT --총매출액
                END 
             ,  SGTXT
             ,  SIDE_CD
          FROM  RTRE5400
         WHERE  STMT_CD = ls_Stmt_Cd
           AND  USE_YN  = 'Y'
        ;

        -- 전표정보 생성
        p_CreateRtre5401Statement(
              v_Zmonth         /*마감년월          */
            , ls_Stmt_Cd       /*전표코드(R070)    */
            , Ref_Cursor       /*전표상세정보      */
            , v_Reg_Id         /*작업자 ID         */
            , v_Success_Code   
            , v_Return_Message 
            , v_ErrorText      
        );
        
        IF 0 != v_Success_Code THEN
            v_Return_Message := '전표정보생성(1) 실패!-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF; 
        
    END LOOP;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc03(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc03(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Calc03;


  /*****************************************************************************
    -- 04.리스자산/감가상각비 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-29  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc04 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    -- 상수 선언
    PS_STMT_CD_01   RTRE5401.STMT_CD%TYPE := '0401';    --전표코드(렌탈운용자산) 
    PS_STMT_CD_02   RTRE5401.STMT_CD%TYPE := '0402';    --전표코드(기타미발행)
    -- 변수 선언  
    ln_Stmt_Amt       RTRE5205.CM_AMT%TYPE;               --전표금액
    -- 커서 선언
    Ref_Cursor      SYS_REFCURSOR;                      --전표세부(Item)정보
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 1. 렌탈운용자산 감가상각비
     * - 감가상각에서 이연항목 2번 중 걱정제로서비스1,기존,신규 항목의 당월 감가상각액 합계
     */ 
    -- 전표금액 계산
    SELECT  SUM(CM_AMT)
      INTO  ln_Stmt_Amt
      FROM  RTRE5206
     WHERE  ZMONTH   = v_Zmonth
       AND  POSTP_TP = '02'
       AND  POSTP_STAT IN ('A','N','S')
    ; 
    
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  ITM_SEQ
         ,  BSCHL
         ,  HKONT
         ,  MWSKZ
         ,  KOSTL
         ,  ln_Stmt_Amt
         ,  SGTXT
         ,  SIDE_CD
      FROM  RTRE5400
     WHERE  STMT_CD = PS_STMT_CD_01
       AND  USE_YN  = 'Y'
    ;
    
    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_01    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(1) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 2. 렌탈운용자산 해지분 처리
     */ 
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  B2.ITM_SEQ
         ,  B2.BSCHL
         ,  B2.HKONT
         ,  B2.MWSKZ
         ,  B2.KOSTL
         ,  A2.AMT
         ,  B2.SGTXT
         ,  B2.SIDE_CD
      FROM  (
                SELECT  ROWNUM AS ROW_NUM
                     ,  A1.*
                  FROM  (
                            SELECT  SUM(COGS)                   AS AMT_01    --14090010 대
                                 ,  SUM(CY_AMT)                 AS AMT_02   --55072100 대
                                 ,  SUM(CY_TOT_AMT)             AS AMT_03    --14080910 차
                                 ,  SUM(COGS+CY_AMT-CY_TOT_AMT) AS AMT_04 --63100010 차
                              FROM  RTRE5206
                             WHERE  ZMONTH   = v_Zmonth
                               AND  POSTP_TP = '02'
                               AND  POSTP_STAT IN ('C','E')
                        ) UNPIVOT (
                            AMT FOR COL IN (AMT_01, AMT_02, AMT_03, AMT_04)
                        ) A1
            ) A2
         ,  RTRE5400 B2
     WHERE  A2.ROW_NUM = B2.ITM_SEQ
       AND  B2.STMT_CD = PS_STMT_CD_02
       AND  B2.USE_YN  = 'Y'
    ;
    
    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_02    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(2) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc04(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc04(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Calc04;
  
  
  /*****************************************************************************
    -- 05.선급비용 및 충당금 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-29  ITSM            [] 신규작성
    2.0		2025-04-01  10244015		SAP Cost Center(KOSTL) 변경
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc05 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    -- 상수 선언
    PS_STMT_CD_01   RTRE5401.STMT_CD%TYPE := '0501';    --전표코드(판매수당)
    PS_STMT_CD_02   RTRE5401.STMT_CD%TYPE := '0502';    --전표코드(판매수당-기간비용)
    PS_STMT_CD_03   RTRE5401.STMT_CD%TYPE := '0503';    --전표코드(예수금)
    PS_STMT_CD_04   RTRE5401.STMT_CD%TYPE := '0504';    --전표코드(장착수당)
    PS_STMT_CD_05   RTRE5401.STMT_CD%TYPE := '0505';    --전표코드(장착수당-기간비용)
    -- 변수 선언  
    ln_Stmt_Amt     RTRE5205.CM_AMT%TYPE;               --전표금액
    -- 커서 선언
    Ref_Cursor      SYS_REFCURSOR;                      --전표세부(Item)정보
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    /*
     * 01.판매수당
     */
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  A1.ITM_SEQ
         ,  A1.BSCHL
         ,  A1.HKONT
         ,  A1.MWSKZ
         ,  A1.KOSTL
         ,  B1.AMT
         ,  A1.SGTXT
         ,  A1.SIDE_CD
      FROM  RTRE5400 A1
         ,  (
                SELECT  'K000000' AS CC
                     ,  SUM(ROUND(SLCM_AMT/1.1)) AS AMT
                  FROM  RTRE5211
                 WHERE  ZMONTH = v_Zmonth
                 UNION
                SELECT  DECODE(CHAN_CD, '01', 'K550101', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC') AS CC
                     ,  SUM(ROUND(SLCM_AMT/1.1)) AS AMT
                  FROM  RTRE5211
                 WHERE  ZMONTH = v_Zmonth
                 GROUP  BY CHAN_CD
                HAVING  SUM(ROUND(SLCM_AMT/1.1)) <> 0
            ) B1
     WHERE  A1.STMT_CD = PS_STMT_CD_01
       AND  A1.USE_YN  = 'Y'
       AND  NVL(A1.KOSTL, 'K000000') = B1.CC
    ;
    
    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_01    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(1) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 02.판매수당-기간비용
     */
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  A1.ITM_SEQ
         ,  A1.BSCHL
         ,  A1.HKONT
         ,  A1.MWSKZ
         ,  A1.KOSTL
         ,  B1.AMT
         ,  A1.SGTXT
         ,  A1.SIDE_CD
      FROM  RTRE5400 A1
         ,  (
                SELECT  '00'        AS CHAN_CD
                     ,  'K000000'   AS CC
                     ,  SUM(CM_AMT) AS AMT
                  FROM  RTRE5210
                 WHERE  ZMONTH = v_Zmonth
                   AND  POSTP_TP IN ('04','05','06','07')
                 UNION
                SELECT  CHAN_CD
                     ,  DECODE(CHAN_CD, '01', 'K550101', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC') AS CC
                     ,  SUM(CM_AMT) AS AMT
                  FROM  RTRE5210
                 WHERE  1=1
                   AND  ZMONTH = v_Zmonth
                   AND  POSTP_TP IN ('04','05','06','07')
                 GROUP  BY CHAN_CD
                HAVING  SUM(CM_AMT) <> 0
            ) B1
     WHERE  A1.STMT_CD = PS_STMT_CD_02
       AND  A1.USE_YN  = 'Y'
       AND  NVL(A1.KOSTL, 'K000000') = B1.CC
    ;
    
    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_02    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(2) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 03.예수금
     */
    --채널별 당월충당금 집계 
    INSERT  INTO RTRE5301
    SELECT  A1.ZMONTH
         ,  DECODE(A1.CHAN_CD, '01', 'K550101', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC') AS CC
         ,  A1.CHAN_CD
         ,  SUM(ROUND(A1.APFDS_AMT / B1.PERIOD_CD)) AS SUM_AMT
         ,  'wjim'
         ,  SYSDATE
         ,  'wjim'
         ,  SYSDATE
      FROM  RTRE5211 A1
         ,  RTSD0104 B1
     WHERE  A1.ZMONTH = v_Zmonth
       AND  A1.ORD_NO = B1.ORD_NO
     GROUP  BY A1.ZMONTH, A1.CHAN_CD
    HAVING  SUM(ROUND(A1.APFDS_AMT / B1.PERIOD_CD)) <> 0
     ORDER  BY DECODE(A1.CHAN_CD, '01', 'K550101', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC')
    ;
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  A1.ITM_SEQ
         ,  A1.BSCHL
         ,  A1.HKONT
         ,  A1.MWSKZ
         ,  A1.KOSTL
         ,  B1.AMT
         ,  A1.SGTXT
         ,  A1.SIDE_CD
      FROM  RTRE5400 A1
         ,  (
                SELECT  'K000000'     AS CC
                     ,  SUM(APFDS_AMT)   AS AMT
                  FROM  RTRE5301
                 WHERE  ZMONTH <= v_Zmonth
                   AND  KOSTL IN (
                            SELECT  KOSTL
                              FROM  RTRE5301
                             WHERE  ZMONTH <= v_Zmonth
                               AND  APFDS_AMT <> 0  
                        )
                 UNION
                SELECT  A2.KOSTL       AS CC
                     ,  SUM(APFDS_AMT) AS AMT
                  FROM  RTRE5301 A2
                 WHERE  A2.ZMONTH <= v_Zmonth
                   AND  A2.KOSTL IN (
                            SELECT  A1.KOSTL
                              FROM  RTRE5301 A1
                             WHERE  A1.ZMONTH <= v_Zmonth
                               AND  A1.APFDS_AMT <> 0  
                        )
                 GROUP  BY A2.KOSTL
                HAVING  SUM(APFDS_AMT) <> 0
            ) B1
     WHERE  A1.STMT_CD = PS_STMT_CD_03
       AND  A1.USE_YN  = 'Y'
       AND  NVL(A1.KOSTL, 'K000000') = B1.CC
    ;
    
    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_03    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(3) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 04.장착수당
     */
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  A1.ITM_SEQ
         ,  A1.BSCHL
         ,  A1.HKONT
         ,  A1.MWSKZ
         ,  A1.KOSTL
         ,  B1.AMT
         ,  A1.SGTXT
         ,  A1.SIDE_CD
      FROM  RTRE5400 A1
         ,  (
                SELECT  'K000000'                    AS CC
                     ,  SUM(ROUND(A1.PROCC_AMT/1.1)) AS AMT
                  FROM  RTRE5212 A1
                 WHERE  A1.ZMONTH = v_Zmonth
                 UNION
                SELECT  DECODE(A1.CHAN_CD, '01', 'K550101', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC') AS CC
                     ,  SUM(ROUND(A1.PROCC_AMT/1.1)) AS AMT
                  FROM  RTRE5212 A1
                 WHERE  A1.ZMONTH = v_Zmonth
                 GROUP  BY A1.CHAN_CD
                HAVING  SUM(ROUND(A1.PROCC_AMT/1.1)) <> 0
            ) B1
     WHERE  A1.STMT_CD = PS_STMT_CD_04
       AND  A1.USE_YN  = 'Y'
       AND  NVL(A1.KOSTL, 'K000000') = B1.CC
    ;
    
    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_04    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(4) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 05.장착수당-기간비용
     */
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  A1.ITM_SEQ
         ,  A1.BSCHL
         ,  A1.HKONT
         ,  A1.MWSKZ
         ,  A1.KOSTL
         ,  B1.AMT
         ,  A1.SGTXT
         ,  A1.SIDE_CD
      FROM  RTRE5400 A1
         ,  (
                SELECT  '00'        AS CHAN_CD
                     ,  'K000000'   AS CC
                     ,  SUM(CM_AMT) AS AMT
                  FROM  RTRE5210
                 WHERE  ZMONTH = v_Zmonth
                   AND  POSTP_TP IN ('08')
                 UNION
                SELECT  CHAN_CD
                     ,  DECODE(CHAN_CD, '01', 'K550101', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC') AS CC
                     ,  SUM(CM_AMT) AS AMT
                  FROM  RTRE5210
                 WHERE  1=1
                   AND  ZMONTH = v_Zmonth
                   AND  POSTP_TP IN ('08')
                 GROUP  BY CHAN_CD
                HAVING  SUM(CM_AMT) <> 0
            ) B1
     WHERE  A1.STMT_CD = PS_STMT_CD_05
       AND  A1.USE_YN  = 'Y'
       AND  NVL(A1.KOSTL, 'K000000') = B1.CC
    ;
    
    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_05    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
    
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(2) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc05(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc05(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Calc05;
  
  
  /*****************************************************************************
    -- 09.무상교체서비스 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-30  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc09 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Fs10n_Amt      IN RTRE5206.CM_AMT%TYPE            /*SAP FS10N 금액    */  
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    -- 상수 선언
    PS_STMT_CD_01   RTRE5401.STMT_CD%TYPE := '0901';    --전표코드(서비스)
    PS_STMT_CD_02   RTRE5401.STMT_CD%TYPE := '0902';    --전표코드(출고처리)
    PS_STMT_CD_03   RTRE5401.STMT_CD%TYPE := '0903';    --전표코드(유형자산처분)
    -- 변수 선언  
    ln_Stmt_Amt     RTRE5206.CM_AMT%TYPE;               --전표금액
    -- 커서 선언
    Ref_Cursor      SYS_REFCURSOR;
    -- 예외 선언
    e_Error EXCEPTION;
    
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    /*
     * 01.서비스
     */
    SELECT  SUM(A1.CM_AMT)
      INTO  ln_Stmt_Amt
      FROM  RTRE5206 A1
     WHERE  A1.ZMONTH = v_Zmonth
       AND  A1.POSTP_TP IN ('09','10')
    ;     
        
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  ITM_SEQ
         ,  BSCHL
         ,  HKONT
         ,  MWSKZ
         ,  KOSTL
         ,  ln_Stmt_Amt
         ,  SGTXT
         ,  SIDE_CD
      FROM  RTRE5400
     WHERE  STMT_CD = PS_STMT_CD_01
       AND  USE_YN  = 'Y'
    ;

    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_01    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
        
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(1) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
    
    /*
     * 02.출고처리
     */
    -- 전표 금액 계산
    SELECT  SUM(A1.CY_TOT_AMT)
      INTO  ln_Stmt_Amt
      FROM  RTRE5206 A1
     WHERE  A1.ZMONTH = v_Zmonth
       AND  A1.POSTP_TP IN ('09','10')
       AND  A1.POSTP_STAT = 'Q'
    ;  
        
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  B2.ITM_SEQ
         ,  B2.BSCHL
         ,  B2.HKONT
         ,  B2.MWSKZ
         ,  B2.KOSTL
         ,  A2.AMT
         ,  B2.SGTXT
         ,  B2.SIDE_CD
      FROM  (
                SELECT  ROWNUM AS ROW_NUM
                     ,  A1.*
                  FROM  (
                            SELECT  v_Fs10n_Amt - ln_Stmt_Amt AS AMT_01
                                 ,  ln_Stmt_Amt               AS AMT_02
                                 ,  v_Fs10n_Amt               AS AMT_03
                              FROM  dual
                        ) UNPIVOT (
                            AMT FOR COL IN (AMT_01, AMT_02, AMT_03)
                        ) A1
            ) A2
         ,  RTRE5400 B2
     WHERE  A2.ROW_NUM = B2.ITM_SEQ
       AND  B2.STMT_CD = PS_STMT_CD_02
       AND  B2.USE_YN  = 'Y'
    ;

    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_02    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
        
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(2) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
    
    /*
     * 03.유형자산 처분
     */
    --당월 중도해지완납 계약 집계
    INSERT  INTO RTRE5302
    SELECT  v_Zmonth
         ,  ORD_NO
         ,  END_TP
         ,  CANC_DAY 
         ,  v_Reg_Id
         ,  SYSDATE
         ,  v_Reg_Id
         ,  SYSDATE
      FROM  RTSD0108
     WHERE  CANC_DAY BETWEEN v_Zmonth||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD')
    ;

    SELECT  SUM(COGS)
      INTO  ln_Stmt_Amt     --해당월 중도해지고객 2번항목 N항목 제조원가 합산
      FROM  RTRE5206 A1
         ,  RTRE5302 B1
     WHERE  A1.ZMONTH      = v_Zmonth
       AND  A1.POSTP_TP   IN ('02')
       AND  A1.POSTP_STAT IN ('N')
       AND  A1.ZMONTH      = B1.ZMONTH
       AND  A1.ORD_NO      = B1.ORD_NO   
    ; 
        
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  B2.ITM_SEQ
         ,  B2.BSCHL
         ,  B2.HKONT
         ,  B2.MWSKZ
         ,  B2.KOSTL
         ,  A2.AMT
         ,  B2.SGTXT
         ,  B2.SIDE_CD
      FROM  (
                SELECT  ROWNUM AS ROW_NUM
                     ,  A1.*
                  FROM  (
                            SELECT  SUM(COGS) + ln_Stmt_Amt                                 AS AMT_01
                                 ,  SUM(CY_AMT)                                             AS AMT_02
                                 ,  SUM(CY_TOT_AMT)                                         AS AMT_03
                                 ,  SUM(COGS) + ln_Stmt_Amt + SUM(CY_AMT) - SUM(CY_TOT_AMT) AS AMT_04
                              FROM  RTRE5206
                             WHERE  ZMONTH = v_Zmonth
                               AND  POSTP_TP IN ('02')
                               AND  POSTP_STAT = 'S'
                        ) UNPIVOT (
                            AMT FOR COL IN (AMT_01, AMT_02, AMT_03, AMT_04)
                        ) A1
            ) A2
         ,  RTRE5400 B2
     WHERE  A2.ROW_NUM = B2.ITM_SEQ
       AND  B2.STMT_CD = PS_STMT_CD_03
       AND  B2.USE_YN  = 'Y'
    ;

    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_03    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
        
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(3) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
           
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc09(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc09(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Calc09;
  
  
  /*****************************************************************************
    -- 10.서비스수수료 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-30  ITSM            [] 신규작성
    2.0		2025-04-01  10244015		SAP GL Account(HKONT) Code 변경
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc10 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    -- 상수 선언
    PS_STMT_CD_01   RTRE5401.STMT_CD%TYPE := '1001';    --전표코드(서비스수수료)
    -- 변수 선언  
    ln_Tamt         RTRE5206.CM_AMT%TYPE;               --총금액
    ln_Namt         RTRE5206.CM_AMT%TYPE;               --공급가액
    ln_Vamt         RTRE5206.CM_AMT%TYPE;               --부가세액
    -- 커서 선언
    Ref_Cursor      SYS_REFCURSOR;
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    /*
     * 01.서비스수수료
     */
    SELECT  SUM(A1.SVCC_AMT)                              AS SVCC_AMT
         ,  SUM(ROUND(A1.SVCC_AMT / 1.1,0))               AS SVCC_NAMT
         ,  SUM(A1.SVCC_AMT - ROUND(A1.SVCC_AMT / 1.1,0)) AS SVCC_VAMT
      INTO  ln_Tamt, ln_Namt, ln_Vamt
      FROM  RTRE5213 A1
     WHERE  A1.ZMONTH = v_Zmonth
    ;      
        
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  ITM_SEQ
         ,  BSCHL
         ,  HKONT
         ,  MWSKZ
         ,  KOSTL
--             ,  cur01.SALE_AMT --총매출액
         ,  CASE WHEN HKONT = '11602010' THEN 
                ln_Vamt --부가세액
            WHEN HKONT      = '43601040' THEN
                ln_Namt --공급가액
            ELSE    
                ln_Tamt --총매출액
            END 
         ,  SGTXT
         ,  SIDE_CD
      FROM  RTRE5400
     WHERE  STMT_CD = PS_STMT_CD_01
       AND  USE_YN  = 'Y'
    ;

    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_01    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
        
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(1) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
           
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc10(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc10(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Calc10;
  
  
  /*****************************************************************************
    -- 11.마모파손 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-03  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc11 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    -- 상수 선언
    PS_STMT_CD_01   RTRE5401.STMT_CD%TYPE := '1101';    --전표코드(회계처리)
    PS_STMT_CD_02   RTRE5401.STMT_CD%TYPE := '1102';    --전표코드(감가상각비)
    PS_STMT_CD_03   RTRE5401.STMT_CD%TYPE := '1103';    --전표코드(파손마모타이어 유형자산 처분처리)
    PS_STMT_CD_04   RTRE5401.STMT_CD%TYPE := '1104';    --전표코드(보상타이어 유형자산 처분처리)
    -- 변수 선언  
    ln_Stmt_Amt     RTRE5206.CM_AMT%TYPE;               --전표금액
    -- 커서 선언
    Ref_Cursor      SYS_REFCURSOR;
    -- 예외 선언
    e_Error EXCEPTION;
    
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 마감년월
    IF TRIM(v_Zmonth) IS NULL OR TRIM(v_Zmonth) = '' THEN
        v_Return_Message := '마감년월 : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    /*
     * 01.회계처리
     */       
    SELECT  SUM(CY_TOT_AMT+CM_R_AMT)
      INTO  ln_Stmt_Amt
      FROM  RTRE5206
     WHERE  ZMONTH = v_Zmonth
       AND  POSTP_TP IN ('21','22','23','24')
       AND  POSTP_STAT = 'N'   
    ;     
        
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  ITM_SEQ
         ,  BSCHL
         ,  HKONT
         ,  MWSKZ
         ,  KOSTL
         ,  ln_Stmt_Amt
         ,  SGTXT
         ,  SIDE_CD
      FROM  RTRE5400
     WHERE  STMT_CD = PS_STMT_CD_01
       AND  USE_YN  = 'Y'
    ;

    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_01    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
        
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(1) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
    
    /*
     * 02.감가상각비
     */
    SELECT  SUM(CM_AMT)
      INTO  ln_Stmt_Amt
      FROM  RTRE5206
     WHERE  ZMONTH = v_Zmonth
       AND  POSTP_TP IN ('21','22','23','24')   
    ;
        
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  ITM_SEQ
         ,  BSCHL
         ,  HKONT
         ,  MWSKZ
         ,  KOSTL
         ,  ln_Stmt_Amt
         ,  SGTXT
         ,  SIDE_CD
      FROM  RTRE5400
     WHERE  STMT_CD = PS_STMT_CD_02
       AND  USE_YN  = 'Y'
    ;

    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_02    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
        
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(1) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;    

    
    /*
     * 03.파손마모타이어 유형자산 처분처리
     */ 
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  B2.ITM_SEQ
         ,  B2.BSCHL
         ,  B2.HKONT
         ,  B2.MWSKZ
         ,  B2.KOSTL
         ,  A2.AMT
         ,  B2.SGTXT
         ,  B2.SIDE_CD
      FROM  (
                SELECT  ROWNUM AS ROW_NUM
                     ,  A1.*
                  FROM  (                           
                            SELECT  SUM(COGS)                   AS AMT_01 --운용리스자산
                                 ,  SUM(CY_AMT)                 AS AMT_02 --감가상각비-운용리스자산
                                 ,  SUM(CY_TOT_AMT)             AS AMT_03 --감가상각누계액-운용리스자산
                                 ,  SUM(COGS+CY_AMT-CY_TOT_AMT) AS AMT_04 --유형자산처분손실
                              FROM  RTRE5206
                             WHERE  ZMONTH = v_Zmonth
                               AND  POSTP_TP IN ('02')
                               AND  POSTP_STAT IN ('G','NG','EG')
                        ) UNPIVOT (
                            AMT FOR COL IN (AMT_01, AMT_02, AMT_03, AMT_04)
                        ) A1
            ) A2
         ,  RTRE5400 B2
     WHERE  A2.ROW_NUM = B2.ITM_SEQ
       AND  B2.STMT_CD = PS_STMT_CD_03
       AND  B2.USE_YN  = 'Y'
    ;    

    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_03    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
        
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(3) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
    
    
    /*
     * 04.보상타이어 유형자산 처분처리
     */ 
    -- 전표상세정보  
    OPEN  Ref_Cursor FOR
    SELECT  B2.ITM_SEQ
         ,  B2.BSCHL
         ,  B2.HKONT
         ,  B2.MWSKZ
         ,  B2.KOSTL
         ,  A2.AMT
         ,  B2.SGTXT
         ,  B2.SIDE_CD
      FROM  (
                SELECT  ROWNUM AS ROW_NUM
                     ,  A1.*
                  FROM  (      
                            SELECT  NVL(SUM(CY_TOT_AMT+CM_R_AMT),0) AS AMT_01 --운용리스자산(=유형자산처분손실)
--                                 ,  NVL(SUM(CY_TOT_AMT),0)          AS AMT_02 --감가상각비-운용리스자산(=감가상각누계액-운용리스자산) > 2022.02.04 김영작 선임과 협의하여 변경     
                                 ,  NVL(SUM(CY_AMT),0)              AS AMT_02                            
                                 ,  NVL(SUM(CY_TOT_AMT),0)          AS AMT_03 --감가상각누계액-운용리스자산(=감가상각비-운용리스자산)
--                                 ,  NVL(SUM(CY_TOT_AMT+CM_R_AMT),0) AS AMT_04 --유형자산처분손실(=운용리스자산) > 2022.02.04 김영작 선임과 협의하여 변경
                                 ,  NVL(SUM(CM_R_AMT+CY_AMT),0) AS AMT_04 --유형자산처분손실(=운용리스자산)
                              FROM  RTRE5206
                             WHERE  ZMONTH = v_Zmonth
                               AND  POSTP_TP IN ('21','22','23','24')
                               AND  POSTP_STAT IN ('E','C')
                        ) UNPIVOT (
                            AMT FOR COL IN (AMT_01, AMT_02, AMT_03, AMT_04)
                        ) A1
            ) A2
         ,  RTRE5400 B2
     WHERE  A2.ROW_NUM = B2.ITM_SEQ
       AND  B2.STMT_CD = PS_STMT_CD_04
       AND  B2.USE_YN  = 'Y'
    ;    

    -- 전표정보 생성
    p_CreateRtre5401Statement(
          v_Zmonth         /*마감년월          */
        , PS_STMT_CD_04    /*전표코드(R070)    */
        , Ref_Cursor       /*전표상세정보      */
        , v_Reg_Id         /*작업자 ID         */
        , v_Success_Code   
        , v_Return_Message 
        , v_ErrorText      
    );
        
    IF 0 != v_Success_Code THEN
        v_Return_Message := '전표정보생성(4) 실패!-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
           
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := NULL;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc11(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc11(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Calc11;  
  
  
  /*****************************************************************************
  -- 결과 인터페이스 결과 업데이트
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-09-29  KST            [] 신규작성
  *****************************************************************************/
  FUNCTION f_UpdateRtre5401 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE        /*마감월          */
    , v_Stmt_Cd        IN RTRE5401.STMT_CD%TYPE       /*전표코드          */
    , v_E_Subrc        IN RTRE5401.E_SUBRC%TYPE       /*결과코드        */
    , v_E_Belnr        IN RTRE5401.E_BELNR%TYPE       /*전표번호              */
    , v_E_Remsg        IN RTRE5401.E_REMSG%TYPE       /*결과메세지              */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE        /*등록자         */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5401
    SET    E_SUBRC  = v_E_Subrc,
           E_BELNR  = v_E_Belnr,
           E_REMSG  = v_E_Remsg,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ZMONTH   = v_Zmonth
    AND    STMT_CD  = v_Stmt_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5401;
  
END PKG_RTRE5401;