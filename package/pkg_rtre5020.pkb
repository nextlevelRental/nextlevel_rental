CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5020 AS
/*******************************************************************************
   NAME      Pkg_Rtre5020
   PURPOSE   장착수수료 조견표 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가   
*******************************************************************************/

  /*****************************************************************************
  -- 장착수수료 조견표 Count
  *****************************************************************************/
  FUNCTION f_sRtre5020Count(
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,           /*상품코드            */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,          /*조견표순번          */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE    /* 채널 중분류          */      
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE5020
    WHERE   MAT_CD  = v_Mat_Cd
    AND     CHR_SEQ = v_Chr_Seq
    AND     CHAN_LCLS_CD = v_chan_Lcls_Cd
    AND     CHAN_MCLS_CD = v_chan_Mcls_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre5020Count;

  /*****************************************************************************
  -- 장착수수료 조견표 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5020 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Standard_Day   IN RTRE5020.STR_DAY%TYPE,        /*시작일자              */
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*상품코드              */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE    /* 채널 중분류          */     
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAT_CD,                    /*상품코드            */
            Pkg_Rtsd0005.f_sRtsd0005MatName( A.MAT_CD )        AS MAT_NM,  /*상품명   */
            A.CHR_SEQ,                   /*조견표순번          */
            A.STR_DAY,                   /*시작일자            */
            A.END_DAY,                   /*종료일자            */
            A.PRCM_AMT,                  /*장착수수료          */
            A.USE_YN,                    /*사용유무            */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.REG_ID )         AS REG_NM, /*등록자명 */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.CHG_ID )         AS CHG_NM, /*변경자명 */
            A.CHG_DT,                    /*변경일              */
            A.CHAN_LCLS_CD,              /*채널 대분류         */
            A.CHAN_MCLS_CD,               /*채널 중분류         */
            B.USE_YN                                           AS MAT_USE_YN    /*제품 사용여부 */
    FROM    RTRE5020 A, RTSD0005 B
    WHERE   A.MAT_CD = B.MAT_CD
    AND     A.STR_DAY <= v_Standard_Day
    AND     A.END_DAY >= v_Standard_Day
    AND     A.MAT_CD   = DECODE(v_Mat_Cd, NULL, A.MAT_CD, v_Mat_Cd)
    AND     A.CHAN_LCLS_CD = DECODE(v_chan_Lcls_Cd, NULL, A.CHAN_LCLS_CD, v_chan_Lcls_Cd)
    AND     A.CHAN_MCLS_CD = DECODE(v_chan_Mcls_Cd, NULL, A.CHAN_MCLS_CD, v_chan_Mcls_Cd)
    AND     A.USE_YN   = 'Y';

  END p_sRtre5020;

  /*****************************************************************************
  -- 장착수수료 조견표 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5020 (
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*상품코드              */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5020.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5020.END_DAY%TYPE,        /*종료일자              */
    v_Prcm_Amt       IN RTRE5020.PRCM_AMT%TYPE,       /*장착수수료            */
    v_Use_Yn         IN RTRE5020.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE5020 (
            MAT_CD,
            CHR_SEQ,
            STR_DAY,
            END_DAY,
            PRCM_AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            CHAN_LCLS_CD,
            CHAN_MCLS_CD
            )
    VALUES  (
            v_Mat_Cd,
            v_Chr_Seq,
            v_Str_Day,
            v_End_Day,
            v_Prcm_Amt,
            v_Use_Yn,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_chan_Lcls_Cd,
            v_chan_Mcls_Cd
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre5020;

  /*****************************************************************************
  -- 장착수수료 조견표 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5020 (
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*상품코드              */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5020.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5020.END_DAY%TYPE,        /*종료일자              */
    v_Prcm_Amt       IN RTRE5020.PRCM_AMT%TYPE,       /*장착수수료            */
    v_Use_Yn         IN RTRE5020.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5020
    SET    STR_DAY  = v_Str_Day,
           END_DAY  = v_End_Day,
           PRCM_AMT = v_Prcm_Amt,
           USE_YN   = v_Use_Yn,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  MAT_CD   = v_Mat_Cd
    AND    CHR_SEQ  = v_Chr_Seq
    AND    CHAN_LCLS_CD = v_chan_Lcls_Cd
    AND    CHAN_MCLS_CD = v_chan_Mcls_Cd;    

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5020;

  /*****************************************************************************
  -- 장착수수료 조견표 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5020 (
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*상품코드              */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5020
    SET    USE_YN   = 'N',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  MAT_CD   = v_Mat_Cd
    AND    CHR_SEQ  = v_Chr_Seq
    AND    CHAN_LCLS_CD = v_chan_Lcls_Cd
    AND    CHAN_MCLS_CD = v_chan_Mcls_Cd;        

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre5020;

  /*****************************************************************************
  -- 장착수수료 조견표 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5020 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*상품코드              */
    v_Chr_Seq        IN OUT RTRE5020.CHR_SEQ%TYPE,    /*조견표순번            */
    v_Str_Day        IN RTRE5020.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5020.END_DAY%TYPE,        /*종료일자              */
    v_Prcm_Amt       IN RTRE5020.PRCM_AMT%TYPE,       /*장착수수료            */
    v_Use_Yn         IN RTRE5020.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */     
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Count      NUMBER DEFAULT 0;
    v_Chr_SeqB   RTRE5020.CHR_SEQ%TYPE;        /*조견표순번            */
    v_Str_DayB   RTRE5020.STR_DAY%TYPE;        /*시작일자              */
    v_Str_DayC   RTRE5020.STR_DAY%TYPE;        /*시작일자              */
    v_End_DayB   RTRE5020.END_DAY%TYPE;        /*종료일자              */
    v_Prcm_AmtB  RTRE5020.PRCM_AMT%TYPE;       /*장착수수료            */
  BEGIN

    -- 필수값: 상품코드,  조견표순번, 등록자 ID
    IF (TRIM(v_Mat_Cd) IS NULL)  THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Use_Yn) IS NULL)  THEN
        v_Return_Message := '사용유무('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_chan_Lcls_Cd) IS NULL)  THEN
        v_Return_Message := '채널 대분류('||v_chan_Lcls_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_chan_Mcls_Cd) IS NULL)  THEN
        v_Return_Message := '채널 중분류('||v_chan_Mcls_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        


    IF v_Comm_Dvsn IN ('I','U') THEN
        
        IF (TRIM(v_Str_Day) IS NULL)  THEN
            v_Return_Message := '시작일자('||v_Str_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_End_Day) IS NULL)  THEN
            v_Return_Message := '종료일자('||v_End_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        -- 장착수수료 : 0과 같거나 0보다 큰 숫자 ex) x >= 0
        IF (TRIM(v_Prcm_Amt) IS NULL) OR (TRIM(v_Prcm_Amt) < 0) THEN
            v_Return_Message := '장착수수료('||v_Prcm_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
                     
        IF v_Comm_Dvsn = 'I' THEN           
            
            -- 시작일자: 당월1일부터 익월말일까지 입력 가능 ex) 현재일자 : 2015년 12월 7일  -> 2015년 12월 1일 ~ 2016년 1월31일 
            IF NOT (((TO_CHAR(SYSDATE,'YYYYMM')||'01' <= TRIM(v_Str_Day)) AND (TRIM(v_Str_Day) <= TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,+1)),'YYYYMMDD')))) THEN
                v_Return_Message := '시작일자('||v_Str_Day||')는 당월1일부터 익월말일까지만 입력이 가능하므로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
            
            -- 종료일자 : '99991231' 만 가능 ( 향후 변경할 가능성 때문에 import값을 이용함, 현재 기준으로는 '99991231'만 가능)
            IF TRIM(v_End_Day) <> '99991231' THEN
                v_Return_Message := '종료일자('||v_End_Day||') : 99991231 만 가능하므로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
            
            -- 사용여부: 신규 인 경우 : 'Y'
            IF (TRIM(v_Use_Yn) <> 'Y')  THEN
                v_Return_Message := '신규 인 경우 사용유무('||v_Use_Yn||')는 Y로만 처리가능하므로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;             
            
            v_Count := 1;
                         
            BEGIN
                -- 동일 상품, 채널건에 대하여 최종이력 체크
                SELECT  CHR_SEQ, STR_DAY, END_DAY
                INTO    v_Chr_SeqB, v_Str_DayB, v_End_DayB
                FROM    RTRE5020
                WHERE   MAT_CD  = v_Mat_Cd
                AND     USE_YN  = 'Y'
                AND     END_DAY = '99991231'
                AND     CHAN_LCLS_CD = v_chan_Lcls_Cd
                AND     CHAN_MCLS_CD = v_chan_Mcls_Cd;                 

            EXCEPTION                
              WHEN NO_DATA_FOUND THEN
                v_Count := 0;
              WHEN OTHERS THEN
                v_Return_Message := '장착수수료 조견표 최종이력 체크시 오류 발생.시스템관리자 문의요망.! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;
            
            -- 기존 이력이 존재하면    
            IF v_Count >= 1 THEN
                
                -- 이전내역의 시작일자 값이 입력된 시작날짜보다 작거나 같아야 한다. 
                IF TRIM(v_Str_DayB) > TRIM(v_Str_Day) THEN
                    v_Return_Message := '입력하신 날짜('||v_Str_Day||')가 기존 시작일자('||v_Str_DayB||')보다 작으므로 처리가 불가 합니다.!';
                    RAISE e_Error;
                END IF;
                
                -- 이전내역의 종료일자 = 신규등록 시작일자 -1일
                v_End_DayB := TO_CHAR(TO_DATE(TRIM(v_Str_Day),'YYYYMMDD')-1,'YYYYMMDD');
                    
                -- 장착수수료 조견표 - 이전이력 종료일자 업데이트
                IF 0 != f_UpdateRtre5020EndDay(v_Mat_Cd,  v_Chr_SeqB,
                                               v_End_DayB,  v_Reg_Id, v_chan_Lcls_Cd, v_chan_Mcls_Cd, v_ErrorText
                                               ) THEN
                    v_Return_Message := '장착수수료 조견표 - 이전이력 종료일자 업데이트 실패!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
                            
            END IF;
            
            -- 장착수수료 조견표 조견표순번 췌번
            v_Chr_Seq := f_sRtre5020ChrSeq(v_Mat_Cd, v_chan_Lcls_Cd, v_chan_Mcls_Cd);

            -- 장착수수료 조견표 Insert
            IF 0 != f_InsertRtre5020( v_Mat_Cd,  v_Chr_Seq,
                                      v_Str_Day, v_End_Day, v_Prcm_Amt,
                                      v_Use_Yn,  v_Reg_Id,  v_chan_Lcls_Cd, v_chan_Mcls_Cd, v_ErrorText
                                     ) THEN
                v_Return_Message := '장착수수료 조견표 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            -- 조견표순번 필수
            IF (TRIM(v_Chr_Seq) IS NULL) OR (0 = f_sRtre5020Count(v_Mat_Cd, v_Chr_Seq, v_chan_Lcls_Cd, v_chan_Mcls_Cd)) THEN
                v_Return_Message := '조견표순번('||v_Chr_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            BEGIN
                -- 수정하고자 하는 이력 데이터 획득
                SELECT  STR_DAY, END_DAY, PRCM_AMT
                INTO    v_Str_DayB, v_End_DayB, v_Prcm_AmtB
                FROM    RTRE5020
                WHERE   MAT_CD  = v_Mat_Cd
                AND     CHR_SEQ = v_Chr_Seq
                AND     CHAN_LCLS_CD = v_chan_Lcls_Cd
                AND     CHAN_MCLS_CD = v_chan_Mcls_Cd;                

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '장착수수료 조견표 이력 체크시 오류 발생.시스템관리자 문의요망.! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;
            
            -- 최종 이력만 수정가능함.
            IF TRIM(v_End_DayB) <> '99991231' THEN
                v_Return_Message := '최종이력 종료일자('||v_End_DayB||') : 최종 이력만 수정가능함으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
            
            -- 장착수수료, 충당금 설정금액 : 시작일자가 당월이후(당월포함)인 경우에만 변경 가능
            IF (SUBSTR(TRIM(v_Str_Day), 1, 6) < TO_CHAR(SYSDATE,'YYYYMM')) AND 
                ((TRIM(v_Prcm_AmtB) <> TRIM(v_Prcm_AmtB))) THEN
                v_Return_Message := '시작일자가 지난 내역은 수수료 금액을 수정할 수 없습니다.!';
                RAISE e_Error;
            END IF;

            -- 시작일자: 당월1일부터 익월말일까지 입력 가능 ex) 현재일자 : 2015년 12월 7일  -> 2015년 12월 1일 ~ 2016년 1월31일 
            IF NOT ((TO_CHAR(SYSDATE,'YYYYMM')||'01' <= TRIM(v_Str_DayB)) AND (TRIM(v_Str_DayB) <= TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,+1)),'YYYYMMDD'))) AND
               NOT ((TO_CHAR(SYSDATE,'YYYYMM')||'01' <= TRIM(v_Str_Day )) AND (TRIM(v_Str_Day ) <= TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,+1)),'YYYYMMDD'))) THEN
                v_Return_Message := '시작일자('||v_Str_Day||')는 당월1일부터 익월말일까지만 입력이 가능하므로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            v_Count := 1;
            
            BEGIN
                -- 동일 상품, 채널건에 대하여 직전이력 체크
                SELECT  CHR_SEQ, STR_DAY
                INTO    v_Chr_SeqB, v_Str_DayC
                FROM    (
                        SELECT  CHR_SEQ, STR_DAY
                        FROM    RTRE5020
                        WHERE   MAT_CD  = v_Mat_Cd
                        AND     CHR_SEQ <> v_Chr_Seq
                        AND     STR_DAY <= v_Str_DayB
                        AND     USE_YN  = 'Y'
                        --AND     END_DAY = '99991231'
                        AND     END_DAY = (TO_CHAR(TO_DATE(v_Str_DayB, 'YYYYMMDD') - 1, 'YYYYMMDD'))
                        AND     CHAN_LCLS_CD = v_chan_Lcls_Cd
                        AND     CHAN_MCLS_CD = v_chan_Mcls_Cd                        
                        ORDER BY CHR_SEQ DESC, STR_DAY DESC
                        )
                WHERE   ROWNUM <= 1;

            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_Count := 0;
              WHEN OTHERS THEN
                v_Return_Message := '장착수수료 조견표 이력 체크시 오류 발생.시스템관리자 문의요망.! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;
            
            -- 직전이력이 존재할 경우            
            IF v_Count >= 1 THEN
            
                -- 직전이력의 시작일자보다 작은 시작일자로 수정 불가
                IF TRIM(v_Str_Day) < TRIM(v_Str_DayC) THEN
                    v_Return_Message := '입력하신 날짜('||v_Str_Day||')가 기존 시작일자('||v_Str_DayC||')보다 작으므로 처리가 불가 합니다.!';
                    RAISE e_Error;
                END IF;
                                    
                -- 이전내역의 종료일자 = 신규등록 시작일자 -1일
                IF v_Use_yn = 'Y' THEN
                    v_End_DayB := TO_CHAR(TO_DATE(TRIM(v_Str_Day),'YYYYMMDD')-1,'YYYYMMDD');
                ELSE
                    v_End_DayB := '99991231';
                END IF;
                        
                -- 장착수수료 조견표 - 이전이력 종료일자 업데이트
                IF 0 != f_UpdateRtre5020EndDay(v_Mat_Cd, v_Chr_SeqB,
                                               v_End_DayB,  v_Reg_Id, v_chan_Lcls_Cd, v_chan_Mcls_Cd, v_ErrorText
                                               ) THEN
                    v_Return_Message := '장착수수료 조견표 - 이전이력 종료일자 업데이트 실패!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;     
            
            END IF;
            
            -- 장착수수료 조견표 Update
            IF 0 != f_UpdateRtre5020( v_Mat_Cd,  v_Chr_Seq,
                                      v_Str_Day, v_End_Day, v_Prcm_Amt,
                                      v_Use_Yn,  v_Reg_Id,  v_chan_Lcls_Cd, v_chan_Mcls_Cd, v_ErrorText
                                     ) THEN
                v_Return_Message := '장착수수료 조견표 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;


    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtre5020( v_Mat_Cd,  v_Chr_Seq,
                                  v_Reg_Id,  v_chan_Lcls_Cd, v_chan_Mcls_Cd, v_ErrorText
                                 ) THEN
            v_Return_Message := '장착수수료 조견표 삭제 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5020.p_IUDRtre5020(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5020.p_IUDRtre5020(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5020;

  /*****************************************************************************
  -- 장착수수료 조견표 - 이전이력 종료일자 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre5020EndDay (
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,         /*상품코드              */
    v_Chr_Seq        IN RTRE5020.CHR_SEQ%TYPE,        /*조견표순번            */
    v_End_Day        IN RTRE5020.END_DAY%TYPE,        /*종료일자              */
    v_Reg_Id         IN RTRE5020.REG_ID%TYPE,         /*등록자 ID             */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE,   /* 채널 중분류          */      
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5020
    SET    END_DAY  = v_End_Day,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  MAT_CD   = v_Mat_Cd
    AND    CHR_SEQ  = v_Chr_Seq
    AND    CHAN_LCLS_CD = v_chan_Lcls_Cd
    AND    CHAN_MCLS_CD = v_chan_Mcls_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5020EndDay;
  
  /*****************************************************************************
  -- 장착수수료 조견표  - 조견표순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtre5020ChrSeq(
    v_Mat_Cd         IN RTRE5020.MAT_CD%TYPE,           /*상품코드            */
    v_chan_Lcls_Cd   IN RTRE5020.CHAN_LCLS_CD%TYPE,   /* 채널 대분류          */
    v_chan_Mcls_Cd   IN RTRE5020.CHAN_MCLS_CD%TYPE    /* 채널 중분류          */     
    ) RETURN NUMBER IS
    v_Chr_Seq   RTRE5020.CHR_SEQ%TYPE;                 /*조견표순번          */
  BEGIN
  
    SELECT  NVL((SELECT  MAX(CHR_SEQ)
                 FROM    RTRE5020
                 WHERE   MAT_CD = v_Mat_Cd
                 AND     CHAN_LCLS_CD = v_chan_Lcls_Cd
                 AND     CHAN_MCLS_CD = v_chan_Mcls_Cd)+ 1, 1) AS CHR_SEQ
    INTO    v_Chr_Seq
    FROM    DUAL;
    
    RETURN v_Chr_Seq;
    
    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre5020ChrSeq;
  
END Pkg_Rtre5020;