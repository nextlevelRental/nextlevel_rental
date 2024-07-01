CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5011 AS
/*******************************************************************************
   NAME      Pkg_Rtre5011
   PURPOSE   오픈몰 판매수수료 조견표 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Count
  *****************************************************************************/
  FUNCTION f_sRtre5011Count(
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,        /*판매원코드          */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE           /*조견표순번          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE5011
    WHERE   ORD_AGENT = v_Ord_Agent
    AND     CHR_SEQ   = v_Chr_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre5011Count;

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5011 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Standard_Day   IN RTRE5011.STR_DAY%TYPE,        /*시작일자              */
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE       /*판매원코드            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_AGENT,                 /*판매원코드          */
            Pkg_Rtsd0113.f_sRtsd0113FieldValue(A.ORD_AGENT, 'ORG_AGNM', NULL) AS AGENT_NM, /*판매원명  */
            A.CHR_SEQ,                   /*조견표순번          */
            A.STR_DAY,                   /*시작일자            */
            A.END_DAY,                   /*종료일자            */
            A.SLCM_AMT,                  /*판매수수료          */
            A.APFD_AMT,                  /*충당설정금액        */
            A.USE_YN,                    /*사용유무            */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.REG_ID )          AS REG_NM, /*등록자명 */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.CHG_ID )          AS CHG_NM, /*변경자명 */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE5011 A
    WHERE   A.STR_DAY  <= v_Standard_Day
    AND     A.END_DAY  >= v_Standard_Day
    AND     A.ORD_AGENT = DECODE(v_Ord_Agent, NULL, A.ORD_AGENT, v_Ord_Agent)
    AND     A.USE_YN    = 'Y';

  END p_sRtre5011;

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*종료일자              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*충당설정금액          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE5011 (
            ORD_AGENT,
            CHR_SEQ,
            STR_DAY,
            END_DAY,
            SLCM_AMT,
            APFD_AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_Agent,
            v_Chr_Seq,
            v_Str_Day,
            v_End_Day,
            v_Slcm_Amt,
            v_Apfd_Amt,
            v_Use_Yn,
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

  END f_InsertRtre5011;

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*종료일자              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*충당설정금액          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5011
    SET    STR_DAY   = v_Str_Day,
           END_DAY   = v_End_Day,
           SLCM_AMT  = v_Slcm_Amt,
           APFD_AMT  = v_Apfd_Amt,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  ORD_AGENT = v_Ord_Agent
    AND    CHR_SEQ   = v_Chr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5011;

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*조견표순번            */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5011
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  ORD_AGENT = v_Ord_Agent
    AND    CHR_SEQ   = v_Chr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre5011;

  
  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5011 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN OUT RTRE5011.CHR_SEQ%TYPE,    /*조견표순번            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*시작일자              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*종료일자              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*판매수수료            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*충당설정금액          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*사용유무              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Count      NUMBER DEFAULT 0;
    v_Chan_Cd    RTSD0113.CHAN_CD%TYPE;        /*채널                  */
    v_Chr_SeqB   RTRE5011.CHR_SEQ%TYPE;        /*조견표순번            */
    v_Str_DayB   RTRE5011.STR_DAY%TYPE;        /*시작일자              */
    v_Str_DayC   RTRE5011.STR_DAY%TYPE;        /*시작일자              */
    v_End_DayB   RTRE5011.END_DAY%TYPE;        /*종료일자              */
    v_Slcm_AmtB  RTRE5011.SLCM_AMT%TYPE;       /*판매수수료            */
    v_Apfd_AmtB  RTRE5011.APFD_AMT%TYPE;       /*충당설정금액          */
  BEGIN

    -- 필수값: 판매원코드, 조견표순번, 등록자 ID
    IF (TRIM(v_Ord_Agent) IS NULL) OR ('04' <> Pkg_Rtsd0113.f_sRtsd0113FieldValue(TRIM(v_Ord_Agent), 'CHAN_CD', 'Y'))THEN
        v_Return_Message := '판매원코드('||v_Ord_Agent||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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

    IF v_Comm_Dvsn IN ('I', 'U' ) THEN

        IF (TRIM(v_Str_Day) IS NULL)  THEN
            v_Return_Message := '시작일자('||v_Str_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_End_Day) IS NULL)  THEN
            v_Return_Message := '종료일자('||v_End_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 판매수수료, 충당금금액: 0과 같거나 0보다 큰 숫자 ex) x >= 0
        IF (TRIM(v_Slcm_Amt) IS NULL) OR (TRIM(v_Slcm_Amt) < 0) THEN
            v_Return_Message := '판매수수료('||v_Slcm_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Apfd_Amt) IS NULL) OR (TRIM(v_Apfd_Amt) < 0)  THEN
            v_Return_Message := '충당설정금액('||v_Apfd_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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
                FROM    RTRE5011
                WHERE   ORD_AGENT  = v_Ord_Agent
                AND     USE_YN  = 'Y'
                AND     END_DAY = '99991231';

            EXCEPTION                
              WHEN NO_DATA_FOUND THEN
                v_Count := 0;
              WHEN OTHERS THEN
                v_Return_Message := '오픈몰 판매수수료 조견표 최종이력 체크시 오류 발생.시스템관리자 문의요망.! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;
            
            -- 기존 이력이 존재하면    
            IF 0 < v_Count THEN
                
                -- 이전내역의 STR_DAY 값이 입력되는 시작날짜보다 작거나 같아야 한다. 
                IF TRIM(v_Str_DayB) > TRIM(v_Str_Day) THEN
                    v_Return_Message := '입력하신 날짜('||v_Str_Day||')가 기존 시작일자('||v_Str_DayB||')보다 작으므로 처리가 불가 합니다.!';
                    RAISE e_Error;
                END IF;
                
                -- 이전내역의 종료일자 = 신규등록 시작일자 -1일
                v_End_DayB := TO_CHAR(TO_DATE(TRIM(v_Str_Day),'YYYYMMDD')-1,'YYYYMMDD');
                    
                -- 판매수수료 조견표 - 이전이력 종료일자 업데이트
                IF 0 != f_UpdateRtre5011EndDay(v_Ord_Agent, v_Chr_SeqB,
                                               v_End_DayB,  v_Reg_Id,  v_ErrorText
                                               ) THEN
                    v_Return_Message := '오픈몰 판매수수료 조견표 - 이전이력 종료일자 업데이트 실패!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
                            
            END IF;
            
            -- 판매수수료 조견표 조견표순번 췌번
            v_Chr_Seq := f_sRtre5011ChrSeq(v_Ord_Agent);
            
            -- 오픈몰 판매수수료 조견표 Insert
            IF 0 != f_InsertRtre5011( v_Ord_Agent, v_Chr_Seq,
                                      v_Str_Day, v_End_Day, v_Slcm_Amt, v_Apfd_Amt,
                                      v_Use_Yn,  v_Reg_Id,  v_ErrorText
                                     ) THEN
                v_Return_Message := '오픈몰 판매수수료 조견표 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
        ELSE
        
            -- 조견표순번 필수
            IF (TRIM(v_Chr_Seq) IS NULL) OR (0 = f_sRtre5011Count(v_Ord_Agent, v_Chr_Seq)) THEN
                v_Return_Message := '조견표순번('||v_Chr_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            BEGIN
                -- 수정하고자 하는 이력 데이터 획득
                SELECT  STR_DAY, END_DAY, SLCM_AMT, APFD_AMT
                INTO    v_Str_DayB, v_End_DayB, v_Slcm_AmtB, v_Apfd_AmtB
                FROM    RTRE5011
                WHERE   ORD_AGENT = v_Ord_Agent
                AND     CHR_SEQ   = v_Chr_Seq;

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '오픈몰 판매수수료 조견표 이력 체크시 오류 발생.시스템관리자 문의요망.! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;
            
            -- 최종 이력만 수정가능함.
            IF TRIM(v_End_DayB) <> '99991231' THEN
                v_Return_Message := '최종이력 종료일자('||v_End_DayB||') : 최종 이력만 수정가능함으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
            
            -- 판매수수료, 충당금 설정금액 : 시작일자가 당월이후(당월포함)인 경우에만 변경 가능
            IF (SUBSTR(TRIM(v_Str_Day), 1, 6) < TO_CHAR(SYSDATE,'YYYYMM')) AND 
                ((TRIM(v_Slcm_AmtB) <> TRIM(v_Slcm_Amt)) OR (TRIM(v_Apfd_AmtB) <> TRIM(v_Apfd_Amt))) THEN
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
                        FROM    RTRE5011
                        WHERE   ORD_AGENT = v_Ord_Agent
                        AND     CHR_SEQ <> v_Chr_Seq
                        AND     STR_DAY <= v_Str_DayB
                        AND     USE_YN  = 'Y'
                        --AND     END_DAY = '99991231'
                        AND     END_DAY = (TO_CHAR(TO_DATE(v_Str_DayB, 'YYYYMMDD') - 1, 'YYYYMMDD'))
                        ORDER BY CHR_SEQ DESC, STR_DAY DESC 
                        )
                WHERE   ROWNUM <= 1;

            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_Count := 0;
              WHEN OTHERS THEN
                v_Return_Message := '오픈몰 판매수수료 조견표 이력 체크시 오류 발생.시스템관리자 문의요망.! - '||SUBSTR(SQLERRM, 1, 200);
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
                                
                -- 판매수수료 조견표 - 이전이력 종료일자 업데이트
                IF 0 != f_UpdateRtre5011EndDay(v_Ord_Agent, v_Chr_SeqB,
                                               v_End_DayB,  v_Reg_Id,  v_ErrorText
                                               ) THEN
                    v_Return_Message := '오픈몰 판매수수료 조견표 - 이전이력 종료일자 업데이트 실패!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;   
                
            END IF;

            -- 오픈몰 판매수수료 조견표 Update
            IF 0 != f_UpdateRtre5011( v_Ord_Agent, v_Chr_Seq,
                                      v_Str_Day, v_End_Day, v_Slcm_Amt, v_Apfd_Amt,
                                      v_Use_Yn,  v_Reg_Id,  v_ErrorText
                                     ) THEN
                v_Return_Message := '오픈몰 판매수수료 조견표 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF (TRIM(v_Chr_Seq) IS NULL)  THEN
            v_Return_Message := '조견표순번('||v_Chr_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        -- 사용여부: 삭제 인 경우 : 'N'
        IF (TRIM(v_Use_Yn) <> 'N')  THEN
            v_Return_Message := '삭제 인 경우 사용유무('||v_Use_Yn||')는 N로만 처리가능합니다!';
            RAISE e_Error;
        END IF;             

        IF 0 != f_DeleteRtre5011( v_Ord_Agent, v_Chr_Seq,
                                  v_Reg_Id,    v_ErrorText
                                     ) THEN
            v_Return_Message := '오픈몰 판매수수료 조견표 삭제 실패!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5011.p_IUDRtre5011(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5011.p_IUDRtre5011(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5011;

  
  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 - 이전이력 종료일자 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre5011EndDay (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*판매원코드            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*조견표순번            */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*종료일자              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5011
    SET    END_DAY   = v_End_Day,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  ORD_AGENT = v_Ord_Agent
    AND    CHR_SEQ   = v_Chr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5011EndDay;

  /*****************************************************************************
  -- 오픈몰 판매수수료 조견표 - 조견표순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtre5011ChrSeq(
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE         /*판매원코드          */
    ) RETURN NUMBER IS
    v_Chr_Seq RTRE5011.CHR_SEQ%TYPE;                    /*조견표순번          */
  BEGIN

    SELECT  NVL((SELECT  MAX(CHR_SEQ)
                 FROM    RTRE5011
                 WHERE   ORD_AGENT = v_Ord_Agent)+ 1, 1) AS CHR_SEQ
    INTO    v_Chr_Seq
    FROM    DUAL;
    
    RETURN v_Chr_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre5011ChrSeq;
  
END Pkg_Rtre5011;
/
