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
    SELECT  A1.ZMONTH
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
    CS_BUKRS        RTRE5401.BUKRS%TYPE := 'NT10';  --SAP Company Code
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
    v_ErrorText      := '';

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
    
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    ls_last_Day := TO_CHAR(LAST_DAY(TO_DATE(v_Zmonth, 'YYYYMM')), 'YYYYMMDD');
    
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
     * 기존 집계데이터 삭제
     */
    DELETE  RTRE5401
     WHERE  ZMONTH = v_Zmonth;
     
    DELETE  RTRE5402
     WHERE  ZMONTH = v_Zmonth;          
    
    /*
     * 01.등록비-선수금 인식
     */
    p_CreateRtre5401Calc01 (
          v_Zmonth          , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '01.등록비-선수금 인식 전표생성 실패!!!'||'-'||v_Return_Message;
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
        v_Return_Message := '02.등록비-월 렌탈수익 인식 전표생성 실패!!!'||'-'||v_Return_Message;
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
        v_Return_Message := '03.렌탈료 수익 인식 전표생성 실패!!!'||'-'||v_Return_Message;
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
        v_Return_Message := '04.리스자산/감가상각비 전표생성 실패!!!'||'-'||v_Return_Message;
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
        v_Return_Message := '05.선급비용 및 충당금 전표생성 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;    
    
    /*
     * 09.무상교체서비스
     */
    p_CreateRtre5401Calc09 (
          v_Zmonth          , v_Reg_Id
        , v_Success_Code    , v_Return_Message  , v_ErrorText      
    );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '09.무상교체서비스 전표생성 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
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
                                CASE WHEN B2.RECP_AMT IS NULL OR B2.RECP_AMT = 0 THEN
                                    'A8' --기타미발행
                                ELSE
                                    CASE WHEN B2.RECP_PAY IN ('P1','C2','P7') THEN
                                        'A6' --신용카드
                                    WHEN B2.RECP_PAY IN ('P6','P4','P5','C1','P2') THEN
                                        'A7' --현금영수증
                                    ELSE
                                        'A8' --기타미발행
                                    END
                                END
                            ELSE
                                CASE WHEN B2.RECP_AMT IS NULL OR B2.RECP_AMT = 0 THEN
                                    CASE WHEN A2.PAY_MTHD = 'C' THEN
                                        'A8' --기타미발행
                                    WHEN A2.PAY_MTHD = 'A' THEN
                                        'A4' --세금계산서
                                    ELSE
                                        'ETC' --미정의
                                    END
                                ELSE
                                    CASE WHEN B2.RECP_PAY IN ('P1','C2','P7') THEN
                                        'A6' --신용카드
                                    WHEN B2.RECP_PAY IN ('P6','P4','P5','C1','P2') THEN
                                        'A4' --세금계산서
                                    ELSE
                                        'ETC' --미정의
                                    END
                                END
                            END AS RECP_TYPE
                      FROM  RTRE5201 A2
                         ,  RTRE5202 B2       
                     WHERE  A2.ZMONTH     = v_Zmonth
                       AND  A2.RECP_TP    = '01' --*등록미 매출만
                       AND  A2.ORD_NO     = B2.ORD_NO(+)
                       AND  B2.ZMONTH(+)  = v_Zmonth
                       AND  B2.RECP_TP(+) = '90' --*선수금(매출제외)만
                 ) A3
         GROUP  BY A3.RECP_TYPE
         ORDER  BY A3.RECP_TYPE
    ) LOOP 
        /*
         * 1.본전표 생성
         */
         
        -- Tax Code 에 의거 전표코드 결정
        SELECT  DECODE(cur01.RECP_TYPE, 'A4', '0101', 'A6', '0103', 'A7', '0105', 'A8', '0107', 'ETC')
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
             ,  cur01.SALE_AMT --총매출액
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
            v_Return_Message := '전표정보생성(1) 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF; 
        
        /*
         * 2.Clearing전표 생성
         */   
         
        -- Tax Code 에 의거 전표코드 결정
        SELECT  DECODE(cur01.RECP_TYPE, 'A4', '0102', 'A6', '0104', 'A7', '0106', 'A8', '0108', 'ETC')
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
            v_Return_Message := '전표정보생성(2) 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    END LOOP;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

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
    SELECT  SUM(CM_AMT) 
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
        v_Return_Message := '전표정보생성 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
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
                                    'A7' --현금영수증
                                WHEN A2.RECP_AMT IS NULL OR A2.RECP_AMT = 0 THEN
                                    'A8' --기타미발행
                                ELSE
                                    CASE WHEN A2.RECP_PAY IN ('P1','C2','P7') THEN
                                        'A6' --신용카드
                                    WHEN A2.RECP_PAY IN ('P6','P4','P5','C1','P2') THEN
                                        'A7' --현금영수증
                                    ELSE
                                        'A8' --기타미발행
                                    END
                                END
                            ELSE
                                CASE WHEN A2.SHUTDN_YN = 'Y' THEN
                                    'A8' --기타미발행
                                ELSE
                                    CASE WHEN A2.RECP_AMT IS NULL OR A2.RECP_AMT = 0 THEN
                                        CASE WHEN A2.PAY_MTHD = 'C' THEN
                                            'A8' --기타미발행
                                        WHEN A2.PAY_MTHD = 'A' THEN
                                            'A4' --세금계산서
                                        ELSE
                                            'ETC' --미정의
                                        END
                                    ELSE
                                        CASE WHEN A2.RECP_PAY IN ('P1','C2','P7') THEN
                                            'A6' --신용카드
                                        WHEN A2.RECP_PAY IN ('P6','P4','P5','C1','P2') THEN
                                            'A4' --세금계산서
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
        --                             ,  A1.SALE_NAMT                                    --위약금 매출의 경우 공급가액이 정상계산되지 않은 케이스들이 있어 직접 계산으로 변경
                                     ,  ROUND(A1.SALE_AMT/1.1)             AS SALE_NAMT 
                                     ,  A1.SALE_AMT-ROUND(A1.SALE_AMT/1.1) AS SALE_VAMT
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
                                                 ,  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY DECODE(X.RECP_PAY,'C2',2,'P1',2,'P7',2,1), X.RECV_DAY) AS ROW_NUM
                                              FROM  RTRE5202 X
                                             WHERE  1=1
                                               AND  X.ZMONTH = v_Zmonth
                                               AND  X.RECP_TP IN ('11','42')
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
        SELECT  DECODE(cur01.RECP_TYPE, 'A4', '0301', 'A6', '0302', 'A7', '0303', 'A8', '0304', 'ETC')
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
             ,  cur01.SALE_AMT --총매출액
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
            v_Return_Message := '전표정보생성(1) 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF; 
        
    END LOOP;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

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
     */ 
    -- 전표금액 계산
    SELECT  SUM(CM_AMT)
      INTO  ln_Stmt_Amt
      FROM  RTRE5206
     WHERE  ZMONTH   = v_Zmonth
       AND  POSTP_TP = '02'
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
        v_Return_Message := '전표정보생성(1) 실패!!!'||'-'||v_Return_Message;
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
                        ) unpivot (
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
        v_Return_Message := '전표정보생성(2) 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
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
                SELECT  DECODE(CHAN_CD, '01', 'K550102', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC') AS CC
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
        v_Return_Message := '전표정보생성(1) 실패!!!'||'-'||v_Return_Message;
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
                     ,  DECODE(CHAN_CD, '01', 'K550102', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC') AS CC
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
        v_Return_Message := '전표정보생성(2) 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    /*
     * 03.예수금
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
        v_Return_Message := '전표정보생성(3) 실패!!!'||'-'||v_Return_Message;
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
                SELECT  DECODE(A1.CHAN_CD, '01', 'K550102', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC') AS CC
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
        v_Return_Message := '전표정보생성(4) 실패!!!'||'-'||v_Return_Message;
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
                     ,  DECODE(CHAN_CD, '01', 'K550102', '02', 'K550104', '03', 'K550107', '04', 'K550105', '05', 'K550103', 'ETC') AS CC
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
        v_Return_Message := '전표정보생성(2) 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
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
        v_Return_Message := '전표정보생성(1) 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; 
    
    /*
     * 03.유형자산 처분
     */
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
                        ) unpivot (
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
        v_Return_Message := '전표정보생성(3) 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc09(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5401.p_CreateRtre5401Calc09(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5401Calc09;
  
END PKG_RTRE5401;
/
