CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0121 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0121
    PURPOSE     가계약정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2016-07-27  wjim            1. Created this package body.
    1.1     2016-09-19  wjim            고객요청사항 항목 추가
    1.2     2016-11-02  kstka           홈쇼핑 관련 컬럼 추가
    1.3     2016-11-09  wjim            홈쇼핑 관련 조회조건 및 조회항목 추가
    1.3.1   2016-11-30  wjim            [20161130_01] 가계약 저장 검증로직 추가
    1.3.2   2016-12-08  wjim            [20161208_01] 타이어 첨부파일 추가
    1.3.3   2017-01-17  wjim            [20170117_02] 가계약 등록 전화번호 중복확인 보완
    1.3.4   2017-02-07  wjim            [20170207_03] GS홈쇼핑 추가항목 엑셀 다운로드
    1.3.5   2017-02-16  wjim            [20170216_01] CJ홈쇼핑 양식 추가
    1.3.6   2017-04-12  wjim            [20170412_01] '첨부파일 유무' 조회조건 추가
    1.4     2017-06-07  wjim            [20170607_02] 방판 가계약업로드 시 SMS발송
    1.5     2017-09-22  wjim            [20170922_02] 목록조회에 '추가연락처' 추가
    1.6     2019-07-08  wjim            [20190707_01] 고객명, 핸드폰 저장 시 데이터 정제 (조회속도 고려)
    1.7     2019-07-16  wjim            [20190716_01] 조회 exception 처리 추가
    1.8     2019-07-25  wjim            [20190716_01] 조건2, 조건3 조회 추가
    1.9     2019-08-08  wjim            [20190808_01] 조건3에 '상담사사번' 조회조건 추가
*******************************************************************************/

  /*****************************************************************************
  -- 가계약정보 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------    
    1.3.2   2016-12-08  wjim            [20161208_01] 
                                        - 고객이 쇼핑몰에서 업로드한 타이어 이미지 첨부파일 추가
    1.3.6   2017-04-12  wjim            [20170412_01] '첨부파일 유무' 조회조건 추가 
    1.5     2017-09-22  wjim            [20170922_02] '추가연락처' 추가
    1.7     2019-07-16  wjim            [20190716_01] 조회 exception 처리 추가                                       
  *****************************************************************************/
  PROCEDURE p_sRTSD0121 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Provsn_Day_F    IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일(from)*/
    , v_Provsn_Day_T    IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일(to)  */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자 ID          */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사사번         */
    , v_Call_Day_F      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자(from)     */
    , v_Call_Day_T      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자(to)       */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Provsn_No_F     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(from)   */
    , v_Provsn_No_T     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(to)     */
    , v_Atfl_Yn         IN CHAR                         /* 첨부파일 여부      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;
    v_flag  number := 1;

  BEGIN
  
    -- 필수값 확인
    IF TRIM(v_Cust_Nm) IS NULL AND TRIM(v_Mob_No) IS NULL AND TRIM(v_Provsn_No_F) IS NULL THEN
        IF TRIM(v_Provsn_Day_F) IS NULL OR TRIM(v_Provsn_Day_T) IS NULL THEN
            v_Return_Message := '주문접수일 : 주문접수일은 필수입력값입니다';
            v_flag := 0;
        END IF;
        
        IF NVL(TO_DATE(v_Provsn_Day_T, 'YYYYMMDD') - TO_DATE(v_Provsn_Day_F, 'YYYYMMDD'), 0) > 31 THEN
            v_Return_Message := '주문접수일 : 주문접수일 기간은 31일을 초과할 수 없습니다';
            v_flag := 0;
        END IF;
        
        IF (TRIM(v_Provsn_Day_F) IS NOT NULL OR TRIM(v_Provsn_Day_T) IS NOT NULL) AND (NVL(TO_DATE(v_Provsn_Day_T, 'YYYYMMDD') - TO_DATE(v_Provsn_Day_F, 'YYYYMMDD'), 0) > 31) THEN
            v_Return_Message := '상담일자 : 상담일자 기간은 31일을 초과할 수 없습니다';
            v_flag := 0;
        END IF;
        
    END IF;
    
    IF TRIM(v_Cust_Nm) IS NOT NULL AND LENGTH(TRIM(v_Cust_Nm)) < 2 THEN
        v_Return_Message := '고객명 : 최소 2자리 이상이여야 합니다';
        v_flag := 0;
    END IF;
        
    IF (TRIM(v_Provsn_No_F) IS NOT NULL OR TRIM(v_Provsn_No_T) IS NOT NULL) AND (LENGTH(TRIM(v_Provsn_No_F)) < 15 OR LENGTH(TRIM(v_Provsn_No_T)) < 15) THEN
        v_Return_Message := '가계약번호 : 15자리여야 합니다';
        v_flag := 0;
    END IF;
    
    IF (TRIM(v_Provsn_No_F) IS NOT NULL OR TRIM(v_Provsn_No_T) IS NOT NULL) AND (SUBSTR(TRIM(v_Provsn_No_F),1,11) <> SUBSTR(TRIM(v_Provsn_No_T),1,11)) THEN
        v_Return_Message := '가계약번호('||SUBSTR(TRIM(v_Provsn_No_F),1,11)||') : 최초 11자리는 동일해야 합니다';
        v_flag := 0;
    END IF;

    OPEN Ref_Cursor FOR
    SELECT PROVSN_NO     /* 가계약번호     */
         ,  PROVSN_TP     /* 가계약구분     */
         ,  PROVSN_DAY    /* 가계약 접수일  */
         ,  CUST_NM       /* 고객명         */
         ,  MOB_NO        /* 휴대폰번호     */
         ,  ADDR          /* 주소           */
         ,  MC_NM         /* 차종사양명     */
         ,  SPEC_NM       /* 타이어규격     */
         ,  CAR_NO        /* 차량번호       */
         ,  PATTERN_NM    /* 패턴명         */
         ,  CNT           /* 타이어개수     */
         ,  PERIOD        /* 계약기간       */
         ,  REGI_AMT      /* 렌탈등록비     */
         ,  RENT_AMT      /* 월렌탈료       */
         ,  PLAN_DAY      /* 장착희망일     */
         ,  EMAIL_ADDR    /* 이메일주소     */
         ,  PROVSN_ST     /* 가계약상태     */
         ,  PROVSN_ST_DTL /* 가계약세부상태 */
         ,  ORD_NO        /* 계약번호       */
         ,  REG_ID        /* 등록자ID       */
         ,  REG_DT        /* 등록일         */
         ,  CHG_ID        /* 변경자ID       */
         ,  CHG_DT        /* 변경일         */
         ,  HSHOP_TP      /* 홈쇼핑구분     */
         ,  HSHOP_ORDNO   /* 홈쇼핑주문번호 */
         ,  AIR_DAY       /* 방송일자       */
         ,  AIR_TM        /* 방송시간       */
         ,  CONTACT_GET   /* 연락처수집     */ 
         ,  CONTACT_CNT   /* 컨택횟수       */
         ,  CUST_REQ      /* 고객요청사항   */
         ,  RECALL_DAY    /* 재컨택일자     */  
         ,  RECALL_TM     /* 재컨택시간     */
         ,  RSRV_DAY      /* 예약일자       */
         ,  RSRV_TM       /* 예약시간       */
         ,  ATFL_PATH_NM  /* 첨부파일경로   */ --[20161208_01]
         ,  ATFL_NM       /* 첨부파일명     */ --[20161208_01]
         ,  ADD_MOB_NO    /* 추가연락처     */ --[20170922_02]
    FROM (    
        SELECT  DISTINCT A1.PROVSN_NO     /* 가계약번호     */
             ,  A1.PROVSN_TP     /* 가계약구분     */
             ,  A1.PROVSN_DAY    /* 가계약 접수일  */
             ,  A1.CUST_NM       /* 고객명         */
             ,  A1.MOB_NO        /* 휴대폰번호     */
             ,  A1.ADDR          /* 주소           */
             ,  A1.MC_NM         /* 차종사양명     */
             ,  A1.SPEC_NM       /* 타이어규격     */
             ,  A1.CAR_NO        /* 차량번호       */
             ,  A1.PATTERN_NM    /* 패턴명         */
             ,  A1.CNT           /* 타이어개수     */
             ,  A1.PERIOD        /* 계약기간       */
             ,  A1.REGI_AMT      /* 렌탈등록비     */
             ,  A1.RENT_AMT      /* 월렌탈료       */
             ,  A1.PLAN_DAY      /* 장착희망일     */
             ,  A1.EMAIL_ADDR    /* 이메일주소     */
             ,  A1.PROVSN_ST     /* 가계약상태     */
             ,  A1.PROVSN_ST_DTL /* 가계약세부상태 */
             ,  A1.ORD_NO        /* 계약번호       */
             ,  A1.REG_ID        /* 등록자ID       */
             ,  A1.REG_DT        /* 등록일         */
             ,  A1.CHG_ID        /* 변경자ID       */
             ,  A1.CHG_DT        /* 변경일         */
             ,  A1.HSHOP_TP      /* 홈쇼핑구분     */
             ,  A1.HSHOP_ORDNO   /* 홈쇼핑주문번호 */
             ,  A1.AIR_DAY       /* 방송일자       */
             ,  A1.AIR_TM        /* 방송시간       */
             ,  A1.CONTACT_GET   /* 연락처수집     */         
             ,  (
                    SELECT  COUNT(*)
                      FROM  RTSD0122
                     WHERE  PROVSN_NO = A1.PROVSN_NO
                ) CONTACT_CNT    /* 컨택횟수       */
             ,  A1.CUST_REQ      /* 고객요청사항   */         
             ,  (
                    SELECT  RECALL_DAY
                      FROM  RTSD0122
                     WHERE  PROVSN_NO = A1.PROVSN_NO
                       AND  CALL_SEQ  = (SELECT MAX(CALL_SEQ) FROM RTSD0122 WHERE PROVSN_NO = A1.PROVSN_NO)
                ) RECALL_DAY    /* 재컨택일자      */       
             ,  (
                    SELECT  RECALL_TM
                      FROM  RTSD0122
                     WHERE  PROVSN_NO = A1.PROVSN_NO
                       AND  CALL_SEQ  = (SELECT MAX(CALL_SEQ) FROM RTSD0122 WHERE PROVSN_NO = A1.PROVSN_NO)
                ) RECALL_TM     /* 재컨택시간       */ 
             ,  A1.RSRV_DAY     /* 예약일자         */ 
             ,  A1.RSRV_TM      /* 예약시간         */   
             ,  C1.ATFL_PATH_NM /* 첨부파일경로     */
             ,  C1.ATFL_NM      /* 첨부파일경로     */
             ,  A1.ADD_MOB_NO   /* 추가연락처       */
          FROM  RTSD0121 A1
             ,  RTSD0122 B1
             ,  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.CUST_MOB_NO ORDER BY ATFL_SEQ DESC) AS ROW_NUM
                         ,  X.*
                      FROM  NEXENSHOP.TBL_CUST_TIRE_ATFL X
                ) C1
         WHERE  1 = v_flag 
           AND  A1.PROVSN_NO     = B1.PROVSN_NO(+)
           AND  A1.PROVSN_NO BETWEEN v_Provsn_Tp || '00000000000000' AND v_Provsn_Tp || '99999999999999'
           AND  REPLACE(A1.MOB_NO, '-', '') = C1.CUST_MOB_NO(+)
           AND  C1.ROW_NUM(+) = 1
           AND  A1.PROVSN_TP     = DECODE(v_Provsn_Tp    , NULL, A1.PROVSN_TP    , v_Provsn_Tp      )       
           AND  A1.PROVSN_ST     = DECODE(v_Provsn_St    , NULL, A1.PROVSN_ST    , v_Provsn_St      )
           AND  A1.PROVSN_ST_DTL = DECODE(v_Provsn_St_Dtl, NULL, A1.PROVSN_ST_DTL, v_Provsn_St_Dtl  )
           AND  A1.HSHOP_TP      = DECODE(v_Hshop_Tp     , NULL, A1.HSHOP_TP     , v_Hshop_Tp       )
           --AND  A1.ORD_NO        = DECODE(v_Ord_No       , NULL, A1.ORD_NO       , v_Ord_No      )  
           AND  (v_Provsn_Day_F IS NULL OR A1.PROVSN_DAY  BETWEEN v_Provsn_Day_F AND v_Provsn_Day_T )
           AND  (v_Cust_Nm      IS NULL OR A1.CUST_NM     LIKE '%'||REPLACE(v_Cust_Nm, ' ' ,'')||'%')
           AND  (v_Call_Id      IS NULL OR B1.CHG_ID      = v_Call_Id                               )
           AND  (v_Call_Day_F   IS NULL OR B1.CALL_DAY    BETWEEN v_Call_Day_F AND v_Call_Day_T     )
           AND  REPLACE(A1.MOB_NO, '-', '') = DECODE(v_Mob_No, NULL, REPLACE(A1.MOB_NO, '-', '') , REPLACE(v_Mob_No, '-', ''))
           AND  (v_Provsn_No_F IS NULL OR A1.PROVSN_NO  BETWEEN v_Provsn_No_F AND v_Provsn_No_T )
           AND  NVL(C1.ATFL_NM, '*') = DECODE(v_Atfl_Yn, 'Y', C1.ATFL_NM, 'N', '*', NVL(C1.ATFL_NM, '*')) /* [20170412_01] */
     ) WHERE (v_Recall_Day      IS NULL OR RECALL_DAY      = v_Recall_Day                               )
     ORDER  BY PROVSN_NO        
    ;
    
    IF v_flag = 0 THEN
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상조회되었습니다.';
    
  EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121(2)', v_ErrorText, v_Return_Message);        

  END p_sRTSD0121; 
  
  
  /*****************************************************************************
  -- 가계약정보 조건2 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.8     2019-07-25  wjim            [20190716_01] Created this package body.
  *****************************************************************************/
  PROCEDURE p_sRTSD0121_02 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Provsn_No_F     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(from)   */
    , v_Provsn_No_T     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(to)     */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;
    v_flag  number := 1;

  BEGIN
  
    -- 필수값 확인
    IF TRIM(v_Cust_Nm) IS NULL AND TRIM(v_Mob_No) IS NULL AND TRIM(v_Provsn_No_F) IS NULL THEN
        v_Return_Message := '고객명, 연락처, 가계약번호 중 최소 1개 이상의 조회조건이 필요합니다';
        v_flag := 0;
    END IF;
    
    IF TRIM(v_Cust_Nm) IS NOT NULL AND LENGTH(TRIM(v_Cust_Nm)) < 2 THEN
        v_Return_Message := '고객명 : 최소 2자리 이상이여야 합니다';
        v_flag := 0;
    END IF;
        
    IF (TRIM(v_Provsn_No_F) IS NOT NULL OR TRIM(v_Provsn_No_T) IS NOT NULL) AND (LENGTH(TRIM(v_Provsn_No_F)) < 15 OR LENGTH(TRIM(v_Provsn_No_T)) < 15) THEN
        v_Return_Message := '가계약번호 : 15자리여야 합니다';
        v_flag := 0;
    END IF;
    
    IF (TRIM(v_Provsn_No_F) IS NOT NULL OR TRIM(v_Provsn_No_T) IS NOT NULL) AND (SUBSTR(TRIM(v_Provsn_No_F),1,11) <> SUBSTR(TRIM(v_Provsn_No_T),1,11)) THEN
        v_Return_Message := '가계약번호('||SUBSTR(TRIM(v_Provsn_No_F),1,11)||') : 최초 11자리는 동일해야 합니다';
        v_flag := 0;
    END IF;

    OPEN Ref_Cursor FOR
    SELECT  A1.PROVSN_NO     /* 가계약번호     */
         ,  A1.PROVSN_TP     /* 가계약구분     */
         ,  A1.PROVSN_DAY    /* 가계약 접수일  */
         ,  A1.CUST_NM       /* 고객명         */
         ,  A1.MOB_NO        /* 휴대폰번호     */
         ,  A1.ADDR          /* 주소           */
         ,  A1.MC_NM         /* 차종사양명     */
         ,  A1.SPEC_NM       /* 타이어규격     */
         ,  A1.CAR_NO        /* 차량번호       */
         ,  A1.PATTERN_NM    /* 패턴명         */
         ,  A1.CNT           /* 타이어개수     */
         ,  A1.PERIOD        /* 계약기간       */
         ,  A1.REGI_AMT      /* 렌탈등록비     */
         ,  A1.RENT_AMT      /* 월렌탈료       */
         ,  A1.PLAN_DAY      /* 장착희망일     */
         ,  A1.EMAIL_ADDR    /* 이메일주소     */
         ,  A1.PROVSN_ST     /* 가계약상태     */
         ,  A1.PROVSN_ST_DTL /* 가계약세부상태 */
         ,  A1.ORD_NO        /* 계약번호       */
         ,  A1.REG_ID        /* 등록자ID       */
         ,  A1.REG_DT        /* 등록일         */
         ,  A1.CHG_ID        /* 변경자ID       */
         ,  A1.CHG_DT        /* 변경일         */
         ,  A1.HSHOP_TP      /* 홈쇼핑구분     */
         ,  A1.HSHOP_ORDNO   /* 홈쇼핑주문번호 */
         ,  A1.AIR_DAY       /* 방송일자       */
         ,  A1.AIR_TM        /* 방송시간       */
         ,  A1.CONTACT_GET   /* 연락처수집     */         
         ,  B1.CONTACT_CNT   /* 컨택횟수       */
         ,  A1.CUST_REQ      /* 고객요청사항   */         
         ,  B1.RECALL_DAY    /* 재컨택일자      */       
         ,  B1.RECALL_TM     /* 재컨택시간       */ 
         ,  A1.RSRV_DAY      /* 예약일자         */ 
         ,  A1.RSRV_TM       /* 예약시간         */   
         ,  C1.ATFL_PATH_NM  /* 첨부파일경로     */
         ,  C1.ATFL_NM       /* 첨부파일경로     */
         ,  A1.ADD_MOB_NO    /* 추가연락처       */
      FROM  RTSD0121 A1
         ,  (
                SELECT  X.PROVSN_NO
                     ,  MAX(X.CALL_SEQ)          OVER (PARTITION BY X.PROVSN_NO ORDER BY X.CALL_SEQ ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS CONTACT_CNT
                     ,  LAST_VALUE(X.RECALL_DAY) OVER (PARTITION BY X.PROVSN_NO ORDER BY X.CALL_SEQ ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS RECALL_DAY
                     ,  LAST_VALUE(X.RECALL_TM)  OVER (PARTITION BY X.PROVSN_NO ORDER BY X.CALL_SEQ ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS RECALL_TM
                     ,  ROW_NUMBER()             OVER (PARTITION BY X.PROVSN_NO ORDER BY X.CALL_SEQ DESC) AS ROW_NUM
                  FROM  RTSD0122 X
            ) B1
         ,  (
                SELECT  Y.CUST_MOB_NO
                     ,  Y.ATFL_PATH_NM
                     ,  Y.ATFL_NM
                     ,  ROW_NUMBER() OVER (PARTITION BY Y.CUST_MOB_NO ORDER BY Y.ATFL_SEQ DESC) AS ROW_NUM                 
                  FROM  NEXENSHOP.TBL_CUST_TIRE_ATFL Y
            ) C1
     WHERE  1 = v_flag  
       AND  A1.PROVSN_TP  = DECODE(v_Provsn_Tp, NULL, A1.PROVSN_TP, v_Provsn_Tp)
       AND  (v_Cust_Nm IS NULL OR A1.CUST_NM    LIKE REPLACE(v_Cust_Nm, ' ' ,'')||'%') --ARS상담신청고객
       AND  A1.MOB_NO     = DECODE(v_Mob_No, NULL, REPLACE(A1.MOB_NO, '-', '') , REPLACE(v_Mob_No, '-', ''))       
       AND  (v_Provsn_No_F IS NULL OR A1.PROVSN_NO  BETWEEN v_Provsn_No_F AND v_Provsn_No_T)   
       AND  A1.PROVSN_NO  = B1.PROVSN_NO(+)  
       AND  B1.ROW_NUM(+) = 1
       AND  A1.MOB_NO     = C1.CUST_MOB_NO(+)
       AND  C1.ROW_NUM(+) = 1
     ORDER  BY A1.PROVSN_NO   
    ;
    
    IF v_flag = 0 THEN
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상조회되었습니다.';
    
  EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121_02(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121_02(2)', v_ErrorText, v_Return_Message);        

  END p_sRTSD0121_02; 
  
  
  /*****************************************************************************
  -- 가계약정보 조건3 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.8     2019-07-25  wjim            [20190716_01] Created this package body.
    1.9     2019-08-08  wjim            [20190808_01] 조건3에 '상담사사번' 조회조건 추가
  *****************************************************************************/
  PROCEDURE p_sRTSD0121_03 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사사번         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;
    v_flag  number := 1;

  BEGIN
  
    -- 필수값 확인
    IF TRIM(v_Recall_Day) IS NULL THEN
        v_Return_Message := '재컨택일자 : 필수입력사항입니다';
        v_flag := 0;
    END IF;    

    OPEN Ref_Cursor FOR
    SELECT  C1.PROVSN_NO     /* 가계약번호     */
         ,  C1.PROVSN_TP     /* 가계약구분     */
         ,  C1.PROVSN_DAY    /* 가계약 접수일  */
         ,  C1.CUST_NM       /* 고객명         */
         ,  C1.MOB_NO        /* 휴대폰번호     */
         ,  C1.ADDR          /* 주소           */
         ,  C1.MC_NM         /* 차종사양명     */
         ,  C1.SPEC_NM       /* 타이어규격     */
         ,  C1.CAR_NO        /* 차량번호       */
         ,  C1.PATTERN_NM    /* 패턴명         */
         ,  C1.CNT           /* 타이어개수     */
         ,  C1.PERIOD        /* 계약기간       */
         ,  C1.REGI_AMT      /* 렌탈등록비     */
         ,  C1.RENT_AMT      /* 월렌탈료       */
         ,  C1.PLAN_DAY      /* 장착희망일     */
         ,  C1.EMAIL_ADDR    /* 이메일주소     */
         ,  C1.PROVSN_ST     /* 가계약상태     */
         ,  C1.PROVSN_ST_DTL /* 가계약세부상태 */
         ,  C1.ORD_NO        /* 계약번호       */
         ,  C1.REG_ID        /* 등록자ID       */
         ,  C1.REG_DT        /* 등록일         */
         ,  C1.CHG_ID        /* 변경자ID       */
         ,  C1.CHG_DT        /* 변경일         */
         ,  C1.HSHOP_TP      /* 홈쇼핑구분     */
         ,  C1.HSHOP_ORDNO   /* 홈쇼핑주문번호 */
         ,  C1.AIR_DAY       /* 방송일자       */
         ,  C1.AIR_TM        /* 방송시간       */
         ,  C1.CONTACT_GET   /* 연락처수집     */         
         ,  B1.CONTACT_CNT   /* 컨택횟수       */
         ,  C1.CUST_REQ      /* 고객요청사항   */         
         ,  B1.RECALL_DAY    /* 재컨택일자      */       
         ,  B1.RECALL_TM     /* 재컨택시간       */ 
         ,  C1.RSRV_DAY      /* 예약일자         */ 
         ,  C1.RSRV_TM       /* 예약시간         */   
         ,  D1.ATFL_PATH_NM  /* 첨부파일경로     */
         ,  D1.ATFL_NM       /* 첨부파일경로     */
         ,  C1.ADD_MOB_NO    /* 추가연락처       */
      FROM  (
                SELECT  A.PROVSN_NO
                     ,  MAX(A.CALL_SEQ) AS MAX_CALL_SEQ
                  FROM  RTSD0122 A
                 WHERE  A.RECALL_DAY = v_Recall_Day
                   AND  (v_Call_Id IS NULL OR A.CHG_ID = v_Call_Id)
                 GROUP  BY A.PROVSN_NO
            ) A1
         ,  (
                SELECT  X.PROVSN_NO
                     ,  MAX(X.CALL_SEQ)          OVER (PARTITION BY X.PROVSN_NO ORDER BY X.CALL_SEQ ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS CONTACT_CNT
                     ,  LAST_VALUE(X.RECALL_DAY) OVER (PARTITION BY X.PROVSN_NO ORDER BY X.CALL_SEQ ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS RECALL_DAY
                     ,  LAST_VALUE(X.RECALL_TM)  OVER (PARTITION BY X.PROVSN_NO ORDER BY X.CALL_SEQ ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS RECALL_TM
                     ,  ROW_NUMBER()             OVER (PARTITION BY X.PROVSN_NO ORDER BY X.CALL_SEQ DESC) AS ROW_NUM
                  FROM  RTSD0122 X
            ) B1
         ,  RTSD0121 C1
         ,  (
                SELECT  Y.CUST_MOB_NO
                     ,  Y.ATFL_PATH_NM
                     ,  Y.ATFL_NM
                     ,  ROW_NUMBER() OVER (PARTITION BY Y.CUST_MOB_NO ORDER BY Y.ATFL_SEQ DESC) AS ROW_NUM                 
                  FROM  NEXENSHOP.TBL_CUST_TIRE_ATFL Y
            ) D1
     WHERE  1 = v_flag
       AND  A1.PROVSN_NO    = B1.PROVSN_NO
       AND  A1.MAX_CALL_SEQ = B1.CONTACT_CNT
       AND  B1.ROW_NUM      = 1   
       AND  A1.PROVSN_NO    = C1.PROVSN_NO
       AND  C1.PROVSN_TP    = DECODE(v_Provsn_Tp, NULL, C1.PROVSN_TP, v_Provsn_Tp)   
       AND  C1.MOB_NO       = D1.CUST_MOB_NO(+)
       AND  D1.ROW_NUM(+)   = 1
     ORDER  BY A1.PROVSN_NO
    ;
    
    IF v_flag = 0 THEN
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상조회되었습니다.';
    
  EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121_03(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121_03(2)', v_ErrorText, v_Return_Message);        

  END p_sRTSD0121_03; 
  
  
  /*****************************************************************************
  -- 가계약정보+가계약상담정보 Select (엑셀 다운로드용)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------    
    1.3.4   2017-02-07  wjim            [20170207_03] GS홈쇼핑 전용 항목 추가
                                        - 미디어, 신청고객명, 고객번호
    1.3.5   2017-02-16  wjim            [20170216_01] CJ홈쇼핑 양식 추가
                                        - 소채널, 판매상세, 추가연락처
    1.3.6   2017-04-12  wjim            [20170412_01] '첨부파일 유무' 조회조건 추가
    1.7     2019-07-16  wjim            [20190716_01] 조회 exception 처리 추가 
  *****************************************************************************/
  PROCEDURE p_sContactRTSD0121 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Provsn_Day_F    IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일(from)*/
    , v_Provsn_Day_T    IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일(to)  */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자 ID          */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사사번         */
    , v_Call_Day_F      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자(from)     */
    , v_Call_Day_T      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자(to)       */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Provsn_No_F     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(from)   */
    , v_Provsn_No_T     IN RTSD0122.PROVSN_NO%TYPE      /* 가계약번호(to)     */
    , v_Atfl_Yn         IN CHAR                         /* 첨부파일 여부      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;
    v_flag  number := 1;

  BEGIN
  
    -- 필수값 확인
    IF TRIM(v_Cust_Nm) IS NULL AND TRIM(v_Mob_No) IS NULL AND TRIM(v_Provsn_No_F) IS NULL AND TRIM(v_Recall_Day) IS NULL THEN
        IF TRIM(v_Provsn_Day_F) IS NULL OR TRIM(v_Provsn_Day_T) IS NULL THEN
            v_Return_Message := '주문접수일 : 주문접수일은 필수입력값입니다';
            v_flag := 0;
        END IF;
        
        IF NVL(TO_DATE(v_Provsn_Day_T, 'YYYYMMDD') - TO_DATE(v_Provsn_Day_F, 'YYYYMMDD'), 0) > 31 THEN
            v_Return_Message := '주문접수일 : 주문접수일 기간은 31일을 초과할 수 없습니다';
            v_flag := 0;
        END IF;
        
        IF (TRIM(v_Provsn_Day_F) IS NOT NULL OR TRIM(v_Provsn_Day_T) IS NOT NULL) AND (NVL(TO_DATE(v_Provsn_Day_T, 'YYYYMMDD') - TO_DATE(v_Provsn_Day_F, 'YYYYMMDD'), 0) > 31) THEN
            v_Return_Message := '상담일자 : 상담일자 기간은 31일을 초과할 수 없습니다';
            v_flag := 0;
        END IF;
    END IF;  
    
    IF TRIM(v_Cust_Nm) IS NOT NULL AND LENGTH(TRIM(v_Cust_Nm)) < 2 THEN
        v_Return_Message := '고객명 : 최소 2자리 이상이여야 합니다';
        v_flag := 0;
    END IF;
        
    IF (TRIM(v_Provsn_No_F) IS NOT NULL OR TRIM(v_Provsn_No_T) IS NOT NULL) AND (LENGTH(TRIM(v_Provsn_No_F)) < 15 OR LENGTH(TRIM(v_Provsn_No_T)) < 15) THEN
        v_Return_Message := '가계약번호 : 15자리여야 합니다';
        v_flag := 0;
    END IF;
    
    IF (TRIM(v_Provsn_No_F) IS NOT NULL OR TRIM(v_Provsn_No_T) IS NOT NULL) AND (SUBSTR(TRIM(v_Provsn_No_F),1,11) <> SUBSTR(TRIM(v_Provsn_No_T),1,11)) THEN
        v_Return_Message := '가계약번호('||SUBSTR(TRIM(v_Provsn_No_F),1,11)||') : 최초 11자리는 동일해야 합니다';
        v_flag := 0;
    END IF;

    OPEN Ref_Cursor FOR
    SELECT  PROVSN_NO     /* 가계약번호     */
         ,  PROVSN_TP     /* 가계약구분     */
         ,  PROVSN_DAY    /* 가계약 접수일  */
         ,  CUST_NM       /* 고객명         */
         ,  MOB_NO        /* 휴대폰번호     */
         ,  ADDR          /* 주소           */
         ,  MC_NM         /* 차종사양명     */
         ,  SPEC_NM       /* 타이어규격     */
         ,  CAR_NO        /* 차량번호       */
         ,  PATTERN_NM    /* 패턴명         */
         ,  CNT           /* 타이어개수     */
         ,  PERIOD        /* 계약기간       */
         ,  REGI_AMT      /* 렌탈등록비     */
         ,  RENT_AMT      /* 월렌탈료       */
         ,  PLAN_DAY      /* 장착희망일     */
         ,  EMAIL_ADDR    /* 이메일주소     */
         ,  PROVSN_ST     /* 가계약상태     */
         ,  PROVSN_ST_DTL /* 가계약세부상태 */
         ,  ORD_NO        /* 계약번호       */
         ,  REG_ID        /* 등록자ID       */
         ,  REG_DT        /* 등록일         */
         ,  CHG_ID        /* 변경자ID       */
         ,  CHG_DT        /* 변경일         */
         ,  HSHOP_TP      /* 홈쇼핑구분     */
         ,  HSHOP_ORDNO   /* 홈쇼핑주문번호 */
         ,  AIR_DAY       /* 방송일자       */
         ,  AIR_TM        /* 방송시간       */
         ,  CONTACT_GET   /* 연락처수집     */
         ,  RSRV_DAY      /* 예약일자       */ 
         ,  RSRV_TM       /* 예약시간       */   
         ,  MEDIA         /* 미디어         */
         ,  REQ_CUST_NM   /* 신청고객명     */
         ,  RES_CUST_NO   /* 고객번호       */
         ,  CONTACT_CNT   /* 컨택횟수       */         
         ,  CALL_DAY
         ,  CALL_TM
         ,  CALL_DTL
         ,  CALL_CHG_ID
         ,  CUST_REQ      /* 고객요청사항   */
         ,  RECALL_DAY    /* 재컨택일자     */       
         ,  RECALL_TM     /* 재컨택시간     */ 
         ,  CH_SML        /* 소채널         */
         ,  SALE_DESC     /* 판매상세       */
         ,  ADD_MOB_NO    /* 추가연락처     */
    FROM (
        SELECT  A1.PROVSN_NO     /* 가계약번호     */
             ,  A1.PROVSN_TP     /* 가계약구분     */
             ,  A1.PROVSN_DAY    /* 가계약 접수일  */
             ,  A1.CUST_NM       /* 고객명         */
             ,  A1.MOB_NO        /* 휴대폰번호     */
             ,  A1.ADDR          /* 주소           */
             ,  A1.MC_NM         /* 차종사양명     */
             ,  A1.SPEC_NM       /* 타이어규격     */
             ,  A1.CAR_NO        /* 차량번호       */
             ,  A1.PATTERN_NM    /* 패턴명         */
             ,  A1.CNT           /* 타이어개수     */
             ,  A1.PERIOD        /* 계약기간       */
             ,  A1.REGI_AMT      /* 렌탈등록비     */
             ,  A1.RENT_AMT      /* 월렌탈료       */
             ,  A1.PLAN_DAY      /* 장착희망일     */
             ,  A1.EMAIL_ADDR    /* 이메일주소     */
             ,  A1.PROVSN_ST     /* 가계약상태     */
             ,  A1.PROVSN_ST_DTL /* 가계약세부상태 */
             ,  A1.ORD_NO        /* 계약번호       */
             ,  A1.REG_ID        /* 등록자ID       */
             ,  A1.REG_DT        /* 등록일         */
             ,  A1.CHG_ID        /* 변경자ID       */
             ,  A1.CHG_DT        /* 변경일         */
             ,  A1.HSHOP_TP      /* 홈쇼핑구분     */
             ,  A1.HSHOP_ORDNO   /* 홈쇼핑주문번호 */
             ,  A1.AIR_DAY       /* 방송일자       */
             ,  A1.AIR_TM        /* 방송시간       */
             ,  A1.CONTACT_GET   /* 연락처수집     */
             ,  A1.RSRV_DAY      /* 예약일자       */ 
             ,  A1.RSRV_TM       /* 예약시간       */   
             ,  C1.CD_NM AS MEDIA /* 미디어        */
             ,  A1.REQ_CUST_NM   /* 신청고객명     */
             ,  A1.RES_CUST_NO   /* 고객번호       */
             ,  (
                    SELECT  COUNT(*)
                      FROM  RTSD0122
                     WHERE  PROVSN_NO = A1.PROVSN_NO
                ) CONTACT_CNT    /* 컨택횟수       */
             ,  B1.CALL_DAY
             ,  B1.CALL_TM
             ,  B1.CALL_DTL
             ,  B1.CHG_ID        AS CALL_CHG_ID
             ,  A1.CUST_REQ      /* 고객요청사항   */
             ,  B1.RECALL_DAY    /* 재컨택일자     */       
             ,  B1.RECALL_TM     /* 재컨택시간     */
             ,  B1.CALL_SEQ
             ,  A1.CH_SML        /* 소채널         */
             ,  A1.SALE_DESC     /* 판매상세       */
             ,  A1.ADD_MOB_NO    /* 추가연락처     */
          FROM  RTSD0121 A1
             ,  RTSD0122 B1
             ,  RTCM0051 C1
             ,  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.CUST_MOB_NO ORDER BY ATFL_SEQ DESC) AS ROW_NUM
                         ,  X.*
                      FROM  NEXENSHOP.TBL_CUST_TIRE_ATFL X
                ) D1 /* [20170412_01] */
         WHERE  1 = v_flag 
           AND  A1.PROVSN_NO     = B1.PROVSN_NO(+)    
           AND  A1.PROVSN_NO BETWEEN v_Provsn_Tp || '00000000000000' AND v_Provsn_Tp || '99999999999999'                
           AND  A1.MEDIA         = C1.CD(+)           
           AND  C1.CD_GRP_CD(+)  = 'S097'
           AND  REPLACE(A1.MOB_NO, '-', '') = D1.CUST_MOB_NO(+)
           AND  D1.ROW_NUM(+) = 1
           AND  A1.PROVSN_TP     = DECODE(v_Provsn_Tp    , NULL, A1.PROVSN_TP    , v_Provsn_Tp      )       
           AND  A1.PROVSN_ST     = DECODE(v_Provsn_St    , NULL, A1.PROVSN_ST    , v_Provsn_St      )
           AND  A1.PROVSN_ST_DTL = DECODE(v_Provsn_St_Dtl, NULL, A1.PROVSN_ST_DTL, v_Provsn_St_Dtl  )
           AND  A1.HSHOP_TP      = DECODE(v_Hshop_Tp     , NULL, A1.HSHOP_TP     , v_Hshop_Tp       )
           AND  (v_Provsn_Day_F IS NULL OR A1.PROVSN_DAY  BETWEEN v_Provsn_Day_F AND v_Provsn_Day_T )
           AND  (v_Cust_Nm      IS NULL OR A1.CUST_NM     LIKE '%'||REPLACE(v_Cust_Nm, ' ' ,'')||'%')
           AND  (v_Call_Id      IS NULL OR B1.CHG_ID      = v_Call_Id                               )
           AND  (v_Call_Day_F   IS NULL OR B1.CALL_DAY    BETWEEN v_Call_Day_F AND v_Call_Day_T     )
           AND  REPLACE(A1.MOB_NO, '-', '') = DECODE(v_Mob_No, NULL, REPLACE(A1.MOB_NO, '-', '') , REPLACE(v_Mob_No, '-', '')) /* [20170412_01] */
           AND  (v_Provsn_No_F IS NULL OR A1.PROVSN_NO  BETWEEN v_Provsn_No_F AND v_Provsn_No_T )           
           AND  NVL(D1.ATFL_NM, '*') = DECODE(v_Atfl_Yn, 'Y', D1.ATFL_NM, 'N', '*', NVL(D1.ATFL_NM, '*'))
     ) WHERE (v_Recall_Day      IS NULL OR RECALL_DAY      = v_Recall_Day                               )
     ORDER  BY PROVSN_NO
         ,  CALL_SEQ
    ;
    
  IF v_flag = 0 THEN
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상조회되었습니다.';
    
  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sContactRTSD0121(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sContactRTSD0121(2)', v_ErrorText, v_Return_Message);    

  END p_sContactRTSD0121;
  
  /*****************************************************************************
  -- 가계약정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0121 (
      v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Provsn_Day      IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일      */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Addr            IN RTSD0121.ADDR%TYPE           /* 주소               */
    , v_Mc_Nm           IN RTSD0121.MC_NM%TYPE          /* 차종사양명         */
    , v_Spec_Nm         IN RTSD0121.SPEC_NM%TYPE        /* 타이어규격         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0121.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt             IN RTSD0121.CNT%TYPE            /* 타이어개수         */
    , v_Period          IN RTSD0121.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0121.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0121.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Email_Addr      IN RTSD0121.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자ID           */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Contact_Get     IN RTSD0121.CONTACT_GET%TYPE    /* 연락처수집         */
    , v_Cust_Req        IN RTSD0121.CUST_REQ%TYPE       /* 고객요청사항       */ 
    , v_Prod_Cd         IN RTSD0121.PROD_CD%TYPE        /* 상품코드           */
    , v_Prod_Nm         IN RTSD0121.PROD_NM%TYPE        /* 상품명             */
    , v_Rsrv_Day        IN RTSD0121.RSRV_DAY%TYPE       /* 예약접수일         */
    , v_Rsrv_Tm         IN RTSD0121.RSRV_TM%TYPE        /* 예약접수시간       */
    , v_Media           IN RTSD0121.MEDIA%TYPE          /* 매체               */
    , v_Req_Cust_Nm     IN RTSD0121.REQ_CUST_NM%TYPE    /* 신청고객명         */
    , v_Res_Cust_No     IN RTSD0121.RES_CUST_NO%TYPE    /* 고객번호(홈쇼핑용) */
    , v_Add_Mob_No      IN RTSD0121.ADD_MOB_NO%TYPE     /* 추가연락처         */
    , v_Res_Cust        IN RTSD0121.RES_CUST%TYPE       /* 고객반응           */
    , v_Cncl_Day        IN RTSD0121.CNCL_DAY%TYPE       /* 반품/취소일        */
    , v_Inst_Day        IN RTSD0121.INST_DAY%TYPE       /* 설치일             */
    , v_Join_Req        IN RTSD0121.JOIN_REQ%TYPE       /* 비고-협력사        */
    , v_Zip_Cd          IN RTSD0121.ZIP_CD%TYPE         /* 우편번호           */  
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN
    
    INSERT  INTO RTSD0121 (
          PROVSN_NO
        , PROVSN_TP
        , PROVSN_DAY
        , CUST_NM
        , MOB_NO
        , ADDR
        , MC_NM
        , SPEC_NM
        , CAR_NO
        , PATTERN_NM
        , CNT
        , PERIOD
        , REGI_AMT
        , RENT_AMT
        , PLAN_DAY
        , EMAIL_ADDR
        , PROVSN_ST
        , PROVSN_ST_DTL
        , ORD_NO
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
        , HSHOP_TP
        , HSHOP_ORDNO
        , AIR_DAY
        , AIR_TM
        , CONTACT_GET
        , CUST_REQ
        , PROD_CD       
        , PROD_NM       
        , RSRV_DAY      
        , RSRV_TM       
        , MEDIA         
        , REQ_CUST_NM   
        , RES_CUST_NO   
        , ADD_MOB_NO    
        , RES_CUST      
        , CNCL_DAY      
        , INST_DAY      
        , JOIN_REQ      
        , ZIP_CD       
    ) VALUES (
          (
            SELECT  v_Provsn_Tp || v_Provsn_Day || TO_CHAR(NVL2(MAX(PROVSN_NO), TO_NUMBER(MAX(SUBSTR(PROVSN_NO, 10)))+1, 1), 'FM000000') 
              FROM  RTSD0121
             WHERE  PROVSN_NO LIKE v_Provsn_Tp || v_Provsn_Day || '%'          
          )
        , v_Provsn_Tp
        , v_Provsn_Day
        , v_Cust_Nm
        , v_Mob_No
        , v_Addr
        , v_Mc_Nm
        , v_Spec_Nm
        , v_Car_No
        , v_Pattern_Nm
        , v_Cnt
        , v_Period
        , v_Regi_Amt
        , v_Rent_Amt
        , v_Plan_Day
        , v_Email_Addr
        , CASE WHEN v_Provsn_Tp IN ('B', 'H') THEN '20' ELSE '10' END
        , CASE WHEN v_Provsn_Tp IN ('B', 'H') THEN '2010' ELSE '1010' END
        , v_Ord_No
        , v_Reg_Id
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
        , v_Hshop_Tp
        , v_Hshop_Ordno
        , v_Air_Day
        , v_Air_Tm
        , v_Contact_Get
        , v_Cust_Req
        , v_Prod_Cd
        , v_Prod_Nm
        , v_Rsrv_Day
        , v_Rsrv_Tm
        , v_Media
        , v_Req_Cust_Nm
        , v_Res_Cust_No
        , v_Add_Mob_No
        , v_Res_Cust
        , v_Cncl_Day
        , v_Inst_Day
        , v_Join_Req
        , v_Zip_Cd
    );

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRTSD0121;
  
  /*****************************************************************************
  -- 가계약정보 Update
  REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.3.4   2017-02-07  wjim            [20170207_03]
                                        - GS홈쇼핑 전용 항목의 경우 조회를 하지 않아 업데이트시 null로 수정되어 수정대상에서 제외
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0121 (
      v_Provsn_No       IN RTSD0121.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Provsn_Day      IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약접수일       */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Addr            IN RTSD0121.ADDR%TYPE           /* 주소               */
    , v_Mc_Nm           IN RTSD0121.MC_NM%TYPE          /* 차종사양명         */
    , v_Spec_Nm         IN RTSD0121.SPEC_NM%TYPE        /* 타이어규격         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0121.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt             IN RTSD0121.CNT%TYPE            /* 타이어개수         */
    , v_Period          IN RTSD0121.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0121.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0121.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Email_Addr      IN RTSD0121.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자ID           */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Contact_Get     IN RTSD0121.CONTACT_GET%TYPE    /* 연락처수집         */
    , v_Cust_Req        IN RTSD0121.CUST_REQ%TYPE       /* 고객요청사항       */
    , v_Prod_Cd         IN RTSD0121.PROD_CD%TYPE        /* 상품코드           */
    , v_Prod_Nm         IN RTSD0121.PROD_NM%TYPE        /* 상품명             */
    , v_Rsrv_Day        IN RTSD0121.RSRV_DAY%TYPE       /* 예약접수일         */
    , v_Rsrv_Tm         IN RTSD0121.RSRV_TM%TYPE        /* 예약접수시간       */
    , v_Media           IN RTSD0121.MEDIA%TYPE          /* 매체               */
    , v_Req_Cust_Nm     IN RTSD0121.REQ_CUST_NM%TYPE    /* 신청고객명         */
    , v_Res_Cust_No     IN RTSD0121.RES_CUST_NO%TYPE    /* 고객번호(홈쇼핑용) */
    , v_Add_Mob_No      IN RTSD0121.ADD_MOB_NO%TYPE     /* 추가연락처         */
    , v_Res_Cust        IN RTSD0121.RES_CUST%TYPE       /* 고객반응           */
    , v_Cncl_Day        IN RTSD0121.CNCL_DAY%TYPE       /* 반품/취소일        */
    , v_Inst_Day        IN RTSD0121.INST_DAY%TYPE       /* 설치일             */
    , v_Join_Req        IN RTSD0121.JOIN_REQ%TYPE       /* 비고-협력사        */
    , v_Zip_Cd          IN RTSD0121.ZIP_CD%TYPE         /* 우편번호           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTSD0121
       SET  PROVSN_DAY    = v_Provsn_Day
         ,  CUST_NM       = v_Cust_Nm
         ,  MOB_NO        = v_Mob_No
         ,  ADDR          = v_Addr
         ,  MC_NM         = v_Mc_Nm
         ,  SPEC_NM       = v_Spec_Nm
         ,  CAR_NO        = v_Car_No
         ,  PATTERN_NM    = v_Pattern_Nm
         ,  CNT           = v_Cnt
         ,  PERIOD        = v_Period
         ,  REGI_AMT      = v_Regi_Amt
         ,  RENT_AMT      = v_Rent_Amt
         ,  PLAN_DAY      = v_Plan_Day
         ,  EMAIL_ADDR    = v_Email_Addr
         ,  PROVSN_ST     = v_Provsn_St
         ,  PROVSN_ST_DTL = v_Provsn_St_Dtl
         ,  ORD_NO        = v_Ord_No
         ,  CHG_ID        = v_Reg_Id
         ,  CHG_DT        = SYSDATE
         ,  HSHOP_TP      = v_Hshop_Tp
         ,  HSHOP_ORDNO   = v_Hshop_Ordno
         ,  AIR_DAY       = v_Air_Day
         ,  AIR_TM        = v_Air_Tm
         ,  CONTACT_GET   = v_Contact_Get
         ,  CUST_REQ      = v_Cust_Req
--         ,  PROD_CD       = v_Prod_Cd
--         ,  PROD_NM       = v_Prod_Nm       
--         ,  RSRV_DAY      = v_Rsrv_Day
--         ,  RSRV_TM       = v_Rsrv_Tm
--         ,  MEDIA         = v_Media
--         ,  REQ_CUST_NM   = v_Req_Cust_Nm
--         ,  RES_CUST_NO   = v_Res_Cust_No
--         ,  ADD_MOB_NO    = v_Add_Mob_No
--         ,  RES_CUST      = v_Res_Cust
--         ,  CNCL_DAY      = v_Cncl_Day
--         ,  INST_DAY      = v_Inst_Day
--         ,  JOIN_REQ      = v_Join_Req
--         ,  ZIP_CD        = v_Zip_Cd
     WHERE  PROVSN_NO     = v_Provsn_No;

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRTSD0121;
  
  /*****************************************************************************
  -- 가계약정보 관리(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------    
    1.3.1   2016-11-30  wjim            [20161130_01] 가계약 저장 검증로직 추가
                                        - 상태-세부상태 매핑 유효성 검증
                                        - 완료 시 진계약입력여부 확인
    1.3.3   2017-01-17  wjim            [20170117_02] 가계약 등록 전화번호 중복확인 보완
                                        - 공백제거           
    1.4     2017-06-07  wjim            [20170607_02] 방판 가계약업로드 시 SMS발송
    1.6     2019-07-08  wjim            [20190707_01] 고객명, 핸드폰 저장 시 데이터 정제 (조회속도 고려)                                                                     
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0121 (
      v_Comm_Dvsn       IN CHAR                         /*처리구분(I,U,D)     */
    , v_Provsn_No       IN RTSD0121.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분        */
    , v_Provsn_Day      IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 접수일      */
    , v_Cust_Nm         IN RTSD0121.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0121.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Addr            IN RTSD0121.ADDR%TYPE           /* 주소               */
    , v_Mc_Nm           IN RTSD0121.MC_NM%TYPE          /* 차종사양명         */
    , v_Spec_Nm         IN RTSD0121.SPEC_NM%TYPE        /* 타이어규격         */
    , v_Car_No          IN RTSD0121.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0121.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt             IN RTSD0121.CNT%TYPE            /* 타이어개수         */
    , v_Period          IN RTSD0121.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0121.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0121.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Plan_Day        IN RTSD0121.PLAN_DAY%TYPE       /* 장착희망일         */
    , v_Email_Addr      IN RTSD0121.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Provsn_St       IN RTSD0121.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0121.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE         /* 계약번호           */
    , v_Reg_Id          IN RTSD0121.REG_ID%TYPE         /* 등록자ID           */
    , v_Hshop_Tp        IN RTSD0121.HSHOP_TP%TYPE       /* 홈쇼핑구분         */
    , v_Hshop_Ordno     IN RTSD0121.HSHOP_ORDNO%TYPE    /* 홈쇼핑주문번호     */
    , v_Air_Day         IN RTSD0121.AIR_DAY%TYPE        /* 방송일자           */
    , v_Air_Tm          IN RTSD0121.AIR_TM%TYPE         /* 방송시간           */
    , v_Contact_Get     IN RTSD0121.CONTACT_GET%TYPE    /* 연락처수집         */
    , v_Cust_Req        IN RTSD0121.CUST_REQ%TYPE       /* 고객요청사항       */
    , v_Prod_Cd         IN RTSD0121.PROD_CD%TYPE        /* 상품코드           */
    , v_Prod_Nm         IN RTSD0121.PROD_NM%TYPE        /* 상품명             */
    , v_Rsrv_Day        IN RTSD0121.RSRV_DAY%TYPE       /* 예약접수일         */
    , v_Rsrv_Tm         IN RTSD0121.RSRV_TM%TYPE        /* 예약접수시간       */
    , v_Media           IN RTSD0121.MEDIA%TYPE          /* 매체               */
    , v_Req_Cust_Nm     IN RTSD0121.REQ_CUST_NM%TYPE    /* 신청고객명         */
    , v_Res_Cust_No     IN RTSD0121.RES_CUST_NO%TYPE    /* 고객번호(홈쇼핑용) */
    , v_Add_Mob_No      IN RTSD0121.ADD_MOB_NO%TYPE     /* 추가연락처         */
    , v_Res_Cust        IN RTSD0121.RES_CUST%TYPE       /* 고객반응           */
    , v_Cncl_Day        IN RTSD0121.CNCL_DAY%TYPE       /* 반품/취소일        */
    , v_Inst_Day        IN RTSD0121.INST_DAY%TYPE       /* 설치일             */
    , v_Join_Req        IN RTSD0121.JOIN_REQ%TYPE       /* 비고-협력사        */
    , v_Zip_Cd          IN RTSD0121.ZIP_CD%TYPE         /* 우편번호           */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS

    v_Chk       number;
    v_Sms_Msg   RTSD0205.SND_MSG%TYPE := '';
    
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값 확인
    IF TRIM(v_Provsn_Tp) IS NULL THEN
        v_Return_Message := '가계약구분('||v_Provsn_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '등록자ID('||v_Reg_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 상태-세부상태 매핑 유효성 확인 [20161130_01]
    IF TRIM(v_Provsn_St_Dtl) IS NOT NULL AND SUBSTR(v_Provsn_St, 1, 1) <> SUBSTR(v_Provsn_St_Dtl, 1, 1) THEN
        v_Return_Message := '가계약번호('||v_Provsn_No||') : 상태('||v_Provsn_St||')-세부상태('||v_Provsn_St_Dtl||') 매핑 오류!';
        RAISE e_Error;
    END IF;
    
        --재렌탈 가계약은 상태값 다름
    IF v_Provsn_Tp IN ('B', 'H') THEN
        -- 완료 시 진계약입력여부 확인 [20161130_01]
        IF v_Provsn_St = '50' AND TRIM(v_Ord_No) IS NULL THEN
            v_Return_Message := '가계약번호('||v_Provsn_No||') : 완료시에는 진계약번호를 입력해야 합니다!';
            RAISE e_Error;
        END IF;
    ELSIF v_Provsn_Tp IN ('R') THEN
        -- 완료 시 진계약입력여부 확인 [20161130_01]
        IF v_Provsn_St = '40' AND TRIM(v_Ord_No) IS NULL THEN
            v_Return_Message := '가계약번호('||v_Provsn_No||') : 완료시에는 진계약번호를 입력해야 합니다!';
            RAISE e_Error;
        END IF;
    END IF;
    
    
    IF v_Comm_Dvsn = 'I' THEN
        -- 최근 2주(14일) 사이 동일한 연락처로 이미 등록된 가계약이 있는 경우 에러처리
        -- - 공백제거 추가 [20170117_02]
        SELECT  COUNT(*)
          INTO  v_Chk
          FROM  RTSD0121
         WHERE  REPLACE(TRIM(MOB_NO), '-', '') = REPLACE(TRIM(v_Mob_No), '-', '')
           AND  PROVSN_TP = v_Provsn_Tp
           AND  PROVSN_DAY >= TO_CHAR(SYSDATE-14, 'YYYYMMDD')
        ;
        
        -- 방판 가계약 업로드 시 SMS 발송 [20170607_02]
        IF v_Provsn_Tp = 'B' THEN
            -- SMS 메시지 생성
            v_Sms_Msg := '[넥센타이어] 안녕하세요. 넥센타이어 렌탈서비스 신청 접수가 정상적으로 등록되었습니다.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
            v_Sms_Msg := v_Sms_Msg||'발신번호 1855-0100으로 상담전화가 진행될 예정입니다.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'원활한 상담을 위하여 하기 URL에 고객님의 타이어 사이즈를 확인할 수 있도록 타이어 사진을 업로드해주세요.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'1. 타이어 사이즈 확인방법';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'http://blog.naver.com/nexen_tire/220857181409';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'2. 타이어 사이즈 사진 업로드 방법';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'[모바일]'; 
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'https://www.tirerental.co.kr/view/snl_m/counsel/counselRental.do';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'[PC]'; 
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'https://www.tirerental.co.kr/view/snl/counsel/counselRental.do'; 
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'타이어 사이즈를 확인할 수 있도록 촬영 후 핸드폰 번호와 사진을 업로드해주세요.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'★ 수도권에 계시다면, GO 서비스로 더 편리하게! (찾아가는 방문 교체) ★'; 
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'[서비스 소개]'; 
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'https://m.nexen-nextlevel.com/contents/o2oServiceIntro';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'[공식 인스타그램]'; 
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'https://www.instagram.com/nextlevel__official';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'바쁘신 고객님을 위해 이제는 찾아갑니다.!';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'넥센타이어 렌탈 서비스 넥스트레벨을 선택해 주셔서 깊은 감사드립니다.';
    
            Pkg_Rtsd0205.p_Rtsd0205InterfaceNew(
                  'I'                     /*예약 전송여부         */
                , NULL                    /*예약 전송시간         */
                , v_Mob_No                /*받는 전화번호         */
                , '18550100'              /*보내는 전화번호       */
                , v_Sms_Msg               /*메시지내용            */
                , 'S013'                  /*사용자지정 필드       */
                , SUBSTRB(v_Cust_Nm,1,50) /*사용자지정 필드       */
                ,'2'
                ,'RENTAL00000000000002'
                , v_Reg_Id                /*등록자 ID             */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
                
            IF v_Success_Code <> 0 THEN
                v_Return_Message := 'SMS발송실패:'||v_ErrorText;
                RAISE e_Error;
            END IF;
        END IF;
        
        
        IF v_Chk > 0 THEN
            v_Return_Message := '동일한 연락처('||v_Mob_No||')로 2주내 등록된 가계약이 이미 존재합니다!';
            RAISE e_Error;
        END IF;         
        
        IF 0 != f_InsertRTSD0121 (
              v_Provsn_Tp
            , TO_CHAR(SYSDATE, 'YYYYMMDD')
            , TRIM(v_Cust_Nm)                                                   --[20190707_01] trim 추가
--            , REGEXP_REPLACE(REPLACE(REPLACE(v_Mob_No, '.', ''), CHR(9), ''), '( ){1,}', '')                         --[20190707_01] 이전
            , TRIM(REGEXP_REPLACE(REPLACE(REPLACE(REPLACE(v_Mob_No, '-', ''), '.', ''), CHR(9), ''), '( ){1,}', '')) --[20190707_01] 이후
            , v_Addr
            , v_Mc_Nm
            , v_Spec_Nm
            , v_Car_No
            , v_Pattern_Nm
            , v_Cnt
            , v_Period
            , v_Regi_Amt
            , v_Rent_Amt
            , v_Plan_Day
            , v_Email_Addr
            , v_Provsn_St
            , v_Provsn_St_Dtl
            , v_Ord_No
            , v_Reg_Id
            , v_Hshop_Tp
            , v_Hshop_Ordno
            , v_Air_Day
            , v_Air_Tm
            , v_Contact_Get
            , v_Cust_Req
            , v_Prod_Cd
            , v_Prod_Nm
            , v_Rsrv_Day
            , v_Rsrv_Tm
            , v_Media
            , v_Req_Cust_Nm
            , v_Res_Cust_No
            , v_Add_Mob_No
            , v_Res_Cust
            , v_Cncl_Day
            , v_Inst_Day
            , v_Join_Req
            , v_Zip_Cd
            , v_ErrorText            
        ) THEN
            v_Return_Message := '가계약정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN
        
        IF 0 != f_UpdateRTSD0121 (
              v_Provsn_No
            , v_Provsn_Day
            , TRIM(v_Cust_Nm)                                                   --[20190707_01] trim 추가
--            , REGEXP_REPLACE(REPLACE(REPLACE(v_Mob_No, '.', ''), CHR(9), ''), '( ){1,}', '')                         --[20190707_01] 이전            
            , TRIM(REGEXP_REPLACE(REPLACE(REPLACE(REPLACE(v_Mob_No, '-', ''), '.', ''), CHR(9), ''), '( ){1,}', '')) --[20190707_01] 이후
            , v_Addr
            , v_Mc_Nm
            , v_Spec_Nm
            , v_Car_No
            , v_Pattern_Nm
            , v_Cnt
            , v_Period
            , v_Regi_Amt
            , v_Rent_Amt
            , v_Plan_Day
            , v_Email_Addr
            , v_Provsn_St
            , v_Provsn_St_Dtl
            , v_Ord_No
            , v_Reg_Id
            , v_Hshop_Tp
            , v_Hshop_Ordno
            , v_Air_Day
            , v_Air_Tm
            , v_Contact_Get
            , v_Cust_Req
            , v_Prod_Cd
            , v_Prod_Nm
            , v_Rsrv_Day
            , v_Rsrv_Tm
            , v_Media
            , v_Req_Cust_Nm
            , v_Res_Cust_No
            , v_Add_Mob_No
            , v_Res_Cust
            , v_Cncl_Day
            , v_Inst_Day
            , v_Join_Req
            , v_Zip_Cd
            , v_ErrorText
        ) THEN
            v_Return_Message := '가계약정보 수정 실패!!!'||'-'||v_ErrorText;
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
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_IUDRtsd0121(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_IUDRtsd0121(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0121;

/*****************************************************************************
  -- 상담관리 가계약정보 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------    
    1.3.2   2016-12-08  wjim            [20161208_01] 
                                        - 고객이 쇼핑몰에서 업로드한 타이어 이미지 첨부파일 추가
    1.3.6   2017-04-12  wjim            [20170412_01] '첨부파일 유무' 조회조건 추가 
    1.5     2017-09-22  wjim            [20170922_02] '추가연락처' 추가                                       
  *****************************************************************************/
  PROCEDURE p_sRTSD0121Provsn (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE      /* 가계약 구분     */
    , v_Ord_No          IN RTSD0121.ORD_NO%TYPE   /* 계약번호           */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT PROVSN_NO     /* 가계약번호     */
         ,  PROVSN_TP     /* 가계약구분     */
         ,  PROVSN_DAY    /* 가계약 접수일  */
         ,  CUST_NM       /* 고객명         */
         ,  MOB_NO        /* 휴대폰번호     */
         ,  ADDR          /* 주소           */
         ,  MC_NM         /* 차종사양명     */
         ,  SPEC_NM       /* 타이어규격     */
         ,  CAR_NO        /* 차량번호       */
         ,  PATTERN_NM    /* 패턴명         */
         ,  CNT           /* 타이어개수     */
         ,  PERIOD        /* 계약기간       */
         ,  REGI_AMT      /* 렌탈등록비     */
         ,  RENT_AMT      /* 월렌탈료       */
         ,  PLAN_DAY      /* 장착희망일     */
         ,  EMAIL_ADDR    /* 이메일주소     */
         ,  PROVSN_ST     /* 가계약상태     */
         ,  PROVSN_ST_DTL /* 가계약세부상태 */
         ,  ORD_NO        /* 계약번호       */
         ,  REG_ID        /* 등록자ID       */
         ,  REG_DT        /* 등록일         */
         ,  CHG_ID        /* 변경자ID       */
         ,  CHG_DT        /* 변경일         */
         ,  HSHOP_TP      /* 홈쇼핑구분     */
         ,  HSHOP_ORDNO   /* 홈쇼핑주문번호 */
         ,  AIR_DAY       /* 방송일자       */
         ,  AIR_TM        /* 방송시간       */
         ,  CONTACT_GET   /* 연락처수집     */ 
         ,  CONTACT_CNT   /* 컨택횟수       */
         ,  CUST_REQ      /* 고객요청사항   */
         ,  RECALL_DAY    /* 재컨택일자     */  
         ,  RECALL_TM     /* 재컨택시간     */
         ,  RSRV_DAY      /* 예약일자       */
         ,  RSRV_TM       /* 예약시간       */
         ,  ATFL_PATH_NM  /* 첨부파일경로   */ --[20161208_01]
         ,  ATFL_NM       /* 첨부파일명     */ --[20161208_01]
         ,  ADD_MOB_NO    /* 추가연락처     */ --[20170922_02]
    FROM (    
        SELECT  DISTINCT A1.PROVSN_NO     /* 가계약번호     */
             ,  A1.PROVSN_TP     /* 가계약구분     */
             ,  A1.PROVSN_DAY    /* 가계약 접수일  */
             ,  A1.CUST_NM       /* 고객명         */
             ,  A1.MOB_NO        /* 휴대폰번호     */
             ,  A1.ADDR          /* 주소           */
             ,  A1.MC_NM         /* 차종사양명     */
             ,  A1.SPEC_NM       /* 타이어규격     */
             ,  A1.CAR_NO        /* 차량번호       */
             ,  A1.PATTERN_NM    /* 패턴명         */
             ,  A1.CNT           /* 타이어개수     */
             ,  A1.PERIOD        /* 계약기간       */
             ,  A1.REGI_AMT      /* 렌탈등록비     */
             ,  A1.RENT_AMT      /* 월렌탈료       */
             ,  A1.PLAN_DAY      /* 장착희망일     */
             ,  A1.EMAIL_ADDR    /* 이메일주소     */
             ,  A1.PROVSN_ST     /* 가계약상태     */
             ,  A1.PROVSN_ST_DTL /* 가계약세부상태 */
             ,  A1.ORD_NO        /* 계약번호       */
             ,  A1.REG_ID        /* 등록자ID       */
             ,  A1.REG_DT        /* 등록일         */
             ,  A1.CHG_ID        /* 변경자ID       */
             ,  A1.CHG_DT        /* 변경일         */
             ,  A1.HSHOP_TP      /* 홈쇼핑구분     */
             ,  A1.HSHOP_ORDNO   /* 홈쇼핑주문번호 */
             ,  A1.AIR_DAY       /* 방송일자       */
             ,  A1.AIR_TM        /* 방송시간       */
             ,  A1.CONTACT_GET   /* 연락처수집     */
             ,  (
                    SELECT  COUNT(*)
                      FROM  RTSD0122
                     WHERE  PROVSN_NO = A1.PROVSN_NO
                ) CONTACT_CNT    /* 컨택횟수       */
             ,  A1.CUST_REQ      /* 고객요청사항   */   
             ,  (
                    SELECT  RECALL_DAY
                      FROM  RTSD0122
                     WHERE  PROVSN_NO = A1.PROVSN_NO
                       AND  CALL_SEQ  = (SELECT MAX(CALL_SEQ) FROM RTSD0122 WHERE PROVSN_NO = A1.PROVSN_NO)
                ) RECALL_DAY    /* 재컨택일자      */    
             ,  (
                    SELECT  RECALL_TM
                      FROM  RTSD0122
                     WHERE  PROVSN_NO = A1.PROVSN_NO
                       AND  CALL_SEQ  = (SELECT MAX(CALL_SEQ) FROM RTSD0122 WHERE PROVSN_NO = A1.PROVSN_NO)
                ) RECALL_TM     /* 재컨택시간       */ 
             ,  A1.RSRV_DAY     /* 예약일자         */ 
             ,  A1.RSRV_TM      /* 예약시간         */   
             ,  C1.ATFL_PATH_NM /* 첨부파일경로     */
             ,  C1.ATFL_NM      /* 첨부파일경로     */
             ,  A1.ADD_MOB_NO   /* 추가연락처       */
          FROM  RTSD0121 A1
             ,  RTSD0122 B1
             ,  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.CUST_MOB_NO ORDER BY ATFL_SEQ DESC) AS ROW_NUM
                         ,  X.*
                      FROM  NEXENSHOP.TBL_CUST_TIRE_ATFL X
                ) C1
         WHERE  A1.PROVSN_NO     = B1.PROVSN_NO(+)
           AND  A1.PROVSN_NO BETWEEN v_Provsn_Tp || '00000000000000' AND v_Provsn_Tp || '99999999999999'
           AND  REPLACE(A1.MOB_NO, '-', '') = C1.CUST_MOB_NO(+)
           AND  C1.ROW_NUM(+) = 1
           AND  A1.PROVSN_TP     = DECODE(v_Provsn_Tp    , NULL, A1.PROVSN_TP    , v_Provsn_Tp      )       
           AND  A1.ORD_NO     = DECODE(v_Ord_No    , NULL, A1.ORD_NO    , v_Ord_No      )
         
     )
     ORDER  BY PROVSN_NO        
    ;

  END p_sRTSD0121Provsn;

  /*****************************************************************************
  -- 상담 배정 정보 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------    
    1.0     2023-07-18  kstka            [20230718_01] 상담 배정 정보 조회                                       
  *****************************************************************************/
  PROCEDURE p_sOutboundAssignList (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_Day_F    IN RTSD0121.PROVSN_DAY%TYPE      /* 가계약일자 FROM */
    , v_Provsn_Day_T    IN RTSD0121.PROVSN_DAY%TYPE      /* 가계약일자 TO   */
    , v_Proc_Day_F      IN RTSD0123.PROC_DAY%TYPE        /* 장착일자 FROM  */
    , v_Proc_Day_T      IN RTSD0123.PROC_DAY%TYPE        /* 장착일자 TO    */
    , v_Os_Day_F        IN RTSD0123.OS_DAY%TYPE          /* 계약만료일자 FROM*/
    , v_Os_Day_T        IN RTSD0123.OS_DAY%TYPE          /* 계약만료일자 TO */
    , v_Provsn_Tp       IN RTSD0121.PROVSN_TP%TYPE       /* 가계약 구분     */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    WITH COUNSELORS AS (
        SELECT CALL_ID
                   , PROVSN_TP
                   , CALL_NM
                   , HOLI_YN 
                FROM RTCS0300 
                WHERE USE_YN = 'Y'
                AND PROVSN_TP IN (
                        SELECT 
                            REGEXP_SUBSTR(v, '[^,]+', 1, LEVEL) v
                        FROM 
                            (SELECT CASE WHEN 'P' = DECODE(v_Provsn_Tp, NULL, 'R', v_Provsn_Tp) THEN 'B' || ',' ||'H' || ',' || 'T' ELSE 'R' || ',' || 'T' END v 
                                FROM dual)
                        CONNECT BY LEVEL <= REGEXP_COUNT(v, '[^,]+')
                    )                    
    )
    SELECT 0 AS CHK
        ,  B.CALL_ID
        ,  B.PROVSN_TP
        ,  B.CALL_NM
        ,  B.HOLI_YN
        ,  NVL(A.ASSIGN_CNT, 0) AS ASSIGN_CNT
        ,  NVL(A.NO_ASSIGN_CNT, 0) AS NO_ASSIGN_CNT
        ,  NVL(A.REVOKE_CNT, 0) AS REVOKE_CNT
     FROM (
        SELECT 
               NVL(A.CALL_ID, '99') AS CALL_ID
            ,  B.PROVSN_TP
            ,  B.CALL_NM
            ,  B.HOLI_YN
            ,  CASE WHEN A.CALL_ID IS NOT NULL AND B.HOLI_YN = 'N' THEN SUM(CNT) ELSE 0 END ASSIGN_CNT
            ,  SUM(CASE WHEN A.CALL_ID IS NULL THEN SUM(CNT) ELSE 0 END) OVER(ORDER BY A.CALL_ID) NO_ASSIGN_CNT
            ,  SUM(CASE WHEN B.HOLI_YN = 'Y' THEN SUM(CNT) ELSE 0 END) OVER(ORDER BY A.CALL_ID)  REVOKE_CNT
        FROM (
            SELECT 
                  CALL_ID
                , COUNT(*) AS CNT 
            FROM RTSD0121 
            WHERE 1=1
            AND PROVSN_ST NOT IN ('50') 
            AND (v_Provsn_Day_F IS NULL OR PROVSN_DAY BETWEEN v_Provsn_Day_F AND v_Provsn_Day_T)
            AND PROVSN_TP IN (
                        SELECT 
                            REGEXP_SUBSTR(v, '[^,]+', 1, LEVEL) v
                        FROM 
                            (SELECT CASE WHEN 'P' = DECODE(v_Provsn_Tp, NULL, 'R', v_Provsn_Tp) THEN 'B' || ',' ||'H' ELSE '' END v 
                                FROM dual)
                        CONNECT BY LEVEL <= REGEXP_COUNT(v, '[^,]+')
                    )
    --        AND CALL_ID IS NOT NULL
            GROUP BY CALL_ID
            UNION ALL
            SELECT 
                  CALL_ID
                , COUNT(*) AS CNT 
            FROM RTSD0123 
            WHERE 1=1
            AND PROVSN_ST NOT IN ('50') 
            AND (v_Proc_Day_F IS NULL OR PROC_DAY BETWEEN v_Proc_Day_F AND v_Proc_Day_T)
            AND (v_Os_Day_F IS NULL OR OS_DAY BETWEEN v_Os_Day_F AND v_Os_Day_T)
            AND 'R' = DECODE(v_Provsn_Tp, NULL, 'R', v_Provsn_Tp)
    --        AND CALL_ID IS NOT NULL
            GROUP BY CALL_ID
        ) A
        , COUNSELORS B
        WHERE A.CALL_ID = B.CALL_ID(+)
        GROUP BY A.CALL_ID
              ,  B.PROVSN_TP
              ,  B.CALL_NM
              ,  B.HOLI_YN      
        )  A
    , COUNSELORS B
    WHERE A.CALL_ID(+) = B.CALL_ID
    ;

  END p_sOutboundAssignList;
  
  /*****************************************************************************
  -- 가계약 분배 배치 프로세스 (전체)
  *****************************************************************************/
  PROCEDURE p_CreateOutboundListDivideT (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Cnt       IN NUMBER                       /* 분배 건수         */
    , v_Contract_Type  IN VARCHAR                      /* 계약유형          */    
    , v_Provsn_Day_F   IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 등록 일자 FROM*/
    , v_Provsn_Day_T   IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 등록 일자 TO*/
    , v_Os_Day_F       IN RTSD0123.OS_DAY%TYPE         /* 계약만료일자 FROM     */
    , v_Os_Day_T       IN RTSD0123.OS_DAY%TYPE         /* 계약만료일자 TO       */
    , v_Proc_Day_F     IN RTSD0123.PROC_DAY%TYPE       /* 장착일자 FROM     */
    , v_Proc_Day_T     IN RTSD0123.PROC_DAY%TYPE       /* 장착일자 TO       */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
  BEGIN
    
    IF v_Contract_Type = 'P' THEN
    
        p_CreateOutboundListDivideP(v_Dist_Id_Arr
                                  , v_Dist_Cnt
                                  , v_Provsn_Day_F
                                  , v_Provsn_Day_T
                                  , v_Reg_Id
                                  , v_Success_Code
                                  , v_Return_Message
                                  , v_ErrorText);
        
        IF v_Success_Code < 0 THEN
            v_Return_Message := '아웃바운드 상담리스트 분배 실패(가계약)!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
      
    ELSE    
                       
        p_CreateOutboundListDivideR(v_Dist_Id_Arr
                                  , v_Dist_Cnt
                                  , v_Os_Day_F
                                  , v_Os_Day_T
                                  , v_Proc_Day_F
                                  , v_Proc_Day_T
                                  , v_Reg_Id
                                  , v_Success_Code
                                  , v_Return_Message
                                  , v_ErrorText);
      
        IF v_Success_Code < 0 THEN
            v_Return_Message := '아웃바운드 상담리스트 분배 실패(재렌탈)!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
          
  END p_CreateOutboundListDivideT;
    
  /*****************************************************************************
  -- 가계약 분배 배치 프로세스 (가계약)
  *****************************************************************************/
  PROCEDURE p_CreateOutboundListDivideP (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Cnt       IN NUMBER                       /* 분배 건수         */
    , v_Provsn_Day_F   IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 등록 일자 FROM*/
    , v_Provsn_Day_T   IN RTSD0121.PROVSN_DAY%TYPE     /* 가계약 등록 일자 TO*/
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS
    
    CURSOR Cursor_Rtsd0121 IS
    SELECT  A.PROVSN_TP                         --신규
           ,A.PROVSN_NO 
    FROM RTSD0121 A
    WHERE 1=1
    AND (v_Provsn_Day_F IS NULL OR A.PROVSN_DAY BETWEEN v_Provsn_Day_F AND v_Provsn_Day_T)
    AND A.PROVSN_TP IN ('B', 'H')
    AND A.PROVSN_ST NOT IN ('50')
    AND A.CALL_ID IS NULL
    ORDER BY A.PROVSN_NO;
          
    e_Error EXCEPTION;
    
    v_Cnt NUMBER := 0;
    v_Idx NUMBER := 1;
    
    v_Dvsn VARCHAR2(1);
  BEGIN

    
--    FOR i IN v_Dist_Id_Arr.first..v_Dist_Id_Arr.last LOOP    
--        dbms_output.put_line(v_Dist_Id_Arr(i));
--    END LOOP;

    FOR CUR IN Cursor_Rtsd0121 LOOP
        
        IF v_Cnt > 0 AND MOD(v_Cnt,v_Dist_Cnt) = 0 THEN
           v_Cnt := 0;           
           v_Idx := v_Idx + 1;
           
           IF v_Idx > v_Dist_Id_Arr.COUNT THEN
              v_Idx := 1;
           END IF; 
--           dbms_output.put_line('v_Idx::' || v_Idx); 
        END IF;
        
        UPDATE RTSD0121
        SET
            CALL_ID     = v_Dist_Id_Arr(v_Idx)
           ,DIST_DAY    = TO_CHAR(SYSDATE, 'YYYYMMDD')
           ,CHG_ID      = v_Reg_Id
           ,CHG_DT      = SYSDATE
        WHERE 1=1
        AND PROVSN_NO = CUR.PROVSN_NO;
            
        v_Cnt := v_Cnt + 1;
    END LOOP;
  
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
          
  END p_CreateOutboundListDivideP;
    
  /*****************************************************************************
  -- 가계약 분배 배치 프로세스 (재렌탈)
  *****************************************************************************/
  PROCEDURE p_CreateOutboundListDivideR (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Cnt       IN NUMBER                       /* 분배 건수         */
    , v_Os_Day_F       IN RTSD0123.OS_DAY%TYPE         /* 계약만료일자 FROM     */
    , v_Os_Day_T       IN RTSD0123.OS_DAY%TYPE         /* 계약만료일자 TO       */
    , v_Proc_Day_F     IN RTSD0123.PROC_DAY%TYPE       /* 장착일자 FROM     */
    , v_Proc_Day_T     IN RTSD0123.PROC_DAY%TYPE       /* 장착일자 TO       */
    , v_Reg_Id         IN RTSD0123.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS
    
    CURSOR Cursor_Rtsd0123 IS
    SELECT  'R' AS PROVSN_TP                         --신규
           , A.PROVSN_NO 
    FROM RTSD0123 A
    WHERE 1=1
    AND (v_Proc_Day_F IS NULL OR A.PROC_DAY BETWEEN v_Proc_Day_F AND v_Proc_Day_T)
    AND (v_Os_Day_F IS NULL OR A.OS_DAY BETWEEN v_Os_Day_F AND v_Os_Day_T)
    AND A.PROVSN_ST NOT IN ('50')
    AND A.CALL_ID IS NULL
    ORDER BY A.PROVSN_NO;  
        
    e_Error EXCEPTION;
    
    v_Cnt NUMBER := 0;
    v_Idx NUMBER := 1;
    
    v_Dvsn VARCHAR2(1);
  BEGIN

    
--    FOR i IN v_Dist_Id_Arr.first..v_Dist_Id_Arr.last LOOP    
--        dbms_output.put_line(v_Dist_Id_Arr(i));
--    END LOOP;

    FOR CUR IN Cursor_Rtsd0123 LOOP
        
        IF v_Cnt > 0 AND MOD(v_Cnt,v_Dist_Cnt) = 0 THEN
           v_Cnt := 0;           
           v_Idx := v_Idx + 1;
           
           IF v_Idx > v_Dist_Id_Arr.COUNT THEN
              v_Idx := 1;
           END IF; 
--           dbms_output.put_line('v_Idx::' || v_Idx); 
        END IF;
                
        UPDATE RTSD0123
        SET
            CALL_ID = v_Dist_Id_Arr(v_Idx)
           ,DIST_DAY    = TO_CHAR(SYSDATE, 'YYYYMMDD')
           ,CHG_ID = v_Reg_Id
           ,CHG_DT = SYSDATE
        WHERE 1=1
        AND PROVSN_NO = CUR.PROVSN_NO;
        
--        dbms_output.put_line(v_Dist_Id_Arr(v_Idx));

        v_Cnt := v_Cnt + 1;
    END LOOP;
  
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
          
  END p_CreateOutboundListDivideR;
  
  /*****************************************************************************
  -- 배정된 상담리스트 회수
  *****************************************************************************/
  PROCEDURE p_RevokeOutboundListT (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Day       IN VARCHAR                      /* 배정일자          */
    , v_Contract_Type  IN VARCHAR                      /* 상담구분          */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS
          
    e_Error EXCEPTION;
    
  BEGIN

    IF v_Contract_Type = 'P' THEN
    
        p_RevokeOutboundListP(v_Dist_Id_Arr
                            , v_Dist_Day
                            , v_Reg_Id
                            , v_Success_Code
                            , v_Return_Message
                            , v_ErrorText
                            );
                            
        IF v_Success_Code < 0 THEN
            v_Return_Message := '아웃바운드 상담리스트 회수 실패(가계약)!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSE
    
        p_RevokeOutboundListR(v_Dist_Id_Arr
                            , v_Dist_Day
                            , v_Reg_Id
                            , v_Success_Code
                            , v_Return_Message
                            , v_ErrorText
                            );
        
        IF v_Success_Code < 0 THEN
            v_Return_Message := '아웃바운드 상담리스트 회수 실패(재렌탈)!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
          
  END p_RevokeOutboundListT;
     
  /*****************************************************************************
  -- 배정된 상담리스트 회수(가계약)
  *****************************************************************************/
  PROCEDURE p_RevokeOutboundListP (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Day       IN VARCHAR                      /* 배정일자          */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS
          
    e_Error EXCEPTION;
    
  BEGIN

    FOR i IN 1..v_Dist_Id_Arr.COUNT
    LOOP
        
--        dbms_output.put_line(v_Dist_Id_Arr(i));
        
        UPDATE RTSD0121
        SET
            CALL_ID     = ''
           ,DIST_DAY    = ''
           ,CHG_ID      = v_Reg_Id
           ,CHG_DT      = SYSDATE
        WHERE 1=1
        AND DIST_DAY    = v_Dist_Day
        AND CALL_ID     = v_Dist_Id_Arr(i);

    END LOOP;
  
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
          
  END p_RevokeOutboundListP;
  
  /*****************************************************************************
  -- 배정된 상담리스트 회수(재렌탈)
  *****************************************************************************/
  PROCEDURE p_RevokeOutboundListR (
      v_Dist_Id_Arr    IN VARCHAR_ARR                  /* 분배할 상담원 리스트*/
    , v_Dist_Day       IN VARCHAR                      /* 배정일자          */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE         /* 등록자            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS
          
    e_Error EXCEPTION;
    
  BEGIN

    FOR i IN 1..v_Dist_Id_Arr.COUNT
    LOOP
        
--        dbms_output.put_line(v_Dist_Id_Arr(i));
        
        UPDATE RTSD0123
        SET
            CALL_ID     = ''
           ,DIST_DAY    = ''
           ,CHG_ID      = v_Reg_Id
           ,CHG_DT      = SYSDATE
        WHERE 1=1
        AND DIST_DAY    = v_Dist_Day
        AND CALL_ID     = v_Dist_Id_Arr(i);

    END LOOP;
  
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
          
  END p_RevokeOutboundListR;

  
END Pkg_Rtsd0121;
/
