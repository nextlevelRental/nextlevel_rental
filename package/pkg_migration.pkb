CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Migration AS
/*******************************************************************************
   NAME      Pkg_Migration
   PURPOSE    ; 마이그레이션
   
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-01-05  jemcarry         1. Created this package body.
*******************************************************************************/


  /*****************************************************************************
  -- 점검대상 재집계를 위한 기존 집계내역 Migration
  *****************************************************************************/
  PROCEDURE p_TargetAggMigration(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 오픈 전월까지 집계되었던 계약번호 추출
    CURSOR  CUR_RTCS0004 IS
    SELECT  v_Std_Ym STD_YM,
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.C_MILEAGE A_MILEAGE,       /*주행거리(점검)      */
            A.MFP_YN,                    /*중도완납여부        */
            A.OS_YN,                     /*소유권이전여부      */
            A.OS_DAY,                    /*소유권이전일자      */
            A.CNT_CD,                    /*타이어본수          */
            A.REG_DT,                    /*등록일              */
            A.CAR_NO,                    /*차량번호            */
            A.PROC_DAY,                  /*장착일자            */
            B.C_MILEAGE,                 /*주행거리(장착)      */
            C.MOB_NO,                    /*휴대폰번호          */
            C.TEL_NO,                    /*전화번호            */
            C.BLD_MNG_NO,                /*고객주소-우편번호PK(*/
            C.POS_CD,                    /*고객주소-우편번호   */
            C.ADDR1,                     /*고객주소-주소       */
            C.ADDR2,                     /*고객주소-상세주소   */                      
            D.CARMASTER_NU,              /*카마스터 코드       */         
            E.EQU_NO                     /*설비번호            */                                              
    FROM    RTSD0108 A,
            RTSD0104 B,
            RTSD0100 C,
            RTSD0010 D,
            RTCS0001 E                  
    WHERE   A.ORD_NO     IN (
                            SELECT  DISTINCT ORD_NO
                            FROM    RTCS0005
                            WHERE   STD_YM BETWEEN '201511' AND TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') - 1,'YYYYMM')
                            MINUS   
                            SELECT  DISTINCT ORD_NO
                            FROM    RTCS0005
                            WHERE   STD_YM = v_Std_Ym
                            )
    AND     A.ORD_NO     = B.ORD_NO
    AND     A.CUST_NO    = C.CUST_NO                                                 
    AND     C.BLD_MNG_NO = D.BLD_MNG_NO
    AND     A.ORD_NO     = E.ORD_NO;
    
    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;-- 데이타 존재여부
    
    v_Ord_No    RTSD0108.ORD_NO%TYPE DEFAULT NULL;   /*계약번호              */
    
    v_Target_Cd RTCS0004.TARGET_CD%TYPE DEFAULT NULL;/*대상구분              */
    v_Mr_Cd     RTCS0004.MR_CD%TYPE DEFAULT NULL;    /*Mr. Roadian코드       */
    v_Plan_Day  RTCS0004.PLAN_DAY%TYPE DEFAULT NULL; /*점검예정일자          */
    v_Ad_Ordno  RTCS0004.AD_ORDNO%TYPE DEFAULT NULL; /*조정관련 계약번호     */
    
    v_Job_Seq RTCS0005.JOB_SEQ%TYPE DEFAULT NULL;    /*작업순번              */
    v_Seq RTCS0006.SEQ%TYPE DEFAULT NULL;            /*순번                  */
    v_Cnt NUMBER DEFAULT 0;
  BEGIN

    IF 0 != ISDATE(TRIM(v_Std_Ym)) THEN
        v_Return_Message := '기준년월('||v_Std_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    
    FOR CUR IN CUR_RTCS0004 LOOP
        EXIT WHEN CUR_RTCS0004%NOTFOUND;
        v_exist := TRUE;
        
        v_Cnt := NULL;
        
        IF TO_CHAR(LAST_DAY(TO_DATE(v_Std_Ym||'01','YYYYMMDD')),'YYYYMMDD') < v_Std_Ym||SUBSTR(CUR.PROC_DAY,7,2) THEN
            v_Plan_Day := LAST_DAY(TO_DATE(v_Std_Ym||'01','YYYYMMDD'));
        ELSE
            v_Plan_Day := v_Std_Ym||SUBSTR(CUR.PROC_DAY,7,2);
        END IF; 

        -- 첫번째 기준: RTSD0108.MFP_YN='Y' 또는 OS_YN='Y' -> '2' 비대상
        IF (CUR.MFP_YN = 'Y') OR (CUR.OS_YN = 'Y' OR CUR.OS_DAY < TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMMDD') ) THEN
            v_Target_Cd := '2';
            
        -- 두번째 기준: RTSD0108.CNT_CD IN ('01','03') -> '2' 비대상
        ELSIF CUR.CNT_CD IN ('01','03') THEN
            v_Target_Cd := '2';
            
        -- 네번째 기준: 위 1. -2).점검일 체크 FUNCTION에서 가까운 점검일이 당월로 나오면 -> '1' 대상
        ELSIF (v_Plan_Day IS NOT NULL) AND (SUBSTR(v_Plan_Day,1,6) = v_Std_Ym) THEN
            v_Target_Cd := '1';
        ELSE
            v_Target_Cd := '1';
        END IF;
        
        -- 세번째 기준: RTRE0100.DELY_DAY='전월말일',ORD_NO: 계약번호가 있는 경우 -> '3' 채권
        -- 고객번호 전월말일 기준 연체 금액이 존재하면 조회대상 제외하기 위해 Target_Cd = 3으로 지정
        IF v_Target_Cd IN ('1','4') AND 0 < Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(CUR.CUST_NO, NULL, NULL) THEN
            v_Target_Cd := '3';    
        END IF;
        
        v_Ad_Ordno := NULL;
        v_Ord_No   := NULL;
        
        IF v_Target_Cd = '1' AND CUR.CNT_CD = '02' THEN        
        
            BEGIN
            
                SELECT  ORD_NO
                INTO    v_Ord_No
                FROM    RTSD0108 
                WHERE   ORD_NO <> CUR.ORD_NO
                AND     CAR_NO = CUR.CAR_NO
                AND     CNT_CD = '02'
                AND     MFP_YN = 'N'
                AND     ((OS_YN = 'N') AND (OS_DAY >= TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMMDD')))   /* 수정 */
                AND     PROC_DAY||TO_CHAR(REG_DT,'HH24MISS') < CUR.PROC_DAY||TO_CHAR(CUR.REG_DT,'HH24MISS');            
            
                EXCEPTION
                  WHEN OTHERS THEN
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', '조정관련 계약번호 획득 실패');
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', 'CUR.ORD_NO',   CUR.ORD_NO);
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', 'CUR.CAR_NO',   CUR.CAR_NO);
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', 'CUR.PROC_DAY', CUR.PROC_DAY);
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', 'CUR.REG_DT',   CUR.REG_DT);
            END;
            
            IF TRIM(v_Ord_No) IS NOT NULL THEN
                v_Ad_Ordno := v_Ord_No;
                v_Target_Cd := '2';            
            ELSE        
                v_Ad_Ordno := NULL;
            END IF;
            
        END IF;
        
        IF 0 = Pkg_Rtcs0004.f_sRtcs0004Count(CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO) THEN
             
            -- 관리계정 정보(RTCS0004) 생성
            Pkg_Rtcs0004.p_IUDRtcs0004 ('I', CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO, 
                                        v_Target_Cd, CUR.CARMASTER_NU, CUR.C_MILEAGE, CUR.A_MILEAGE, 
                                        v_Plan_Day, v_Ad_Ordno, v_Reg_Id, v_Success_Code, 
                                        v_Return_Message, v_ErrorText);
        
            IF 0 != v_Success_Code THEN
                v_Return_Message := '관리계정 정보(RTCS0004) 생성 실패!!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;     
        
        ELSE
            -- 관리계정 정보(RTCS0004) 생성
            Pkg_Rtcs0004.p_IUDRtcs0004 ('U', CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO, 
                                        v_Target_Cd, CUR.CARMASTER_NU, CUR.C_MILEAGE, CUR.A_MILEAGE, 
                                        v_Plan_Day, v_Ad_Ordno, v_Reg_Id, v_Success_Code, 
                                        v_Return_Message, v_ErrorText);
        
            IF 0 != v_Success_Code THEN
                v_Return_Message := '관리계정 정보(RTCS0004) 수정 실패!!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;     
        
        END IF;
        
        
        IF v_Target_Cd IN ('1','3','4') THEN
            
            -- 방문점검 작업목록(RTCS0005) 생성
            Pkg_Rtcs0005.p_IUDRtcs0005 ('I',CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO,
                                        v_Job_Seq, v_Target_Cd, CUR.CARMASTER_NU, v_Mr_Cd, 
                                        'N', NULL, v_Plan_Day, '000000', 
                                        v_Plan_Day, '000000', NULL, NULL,
                                        '01', NULL, NULL, v_Reg_Id, 
                                        v_Success_Code, v_Return_Message, v_ErrorText);
                      
            IF 0 != v_Success_Code THEN
                v_Return_Message := '방문점검 작업목록(RTCS0005) 생성 실패!!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;     
            
            
            v_Seq := Pkg_Rtcs0006.f_sRtcs0006Seq(CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO, v_Job_Seq);
        
            -- 방문점검 작업정보 변경(RTCS0006) 생성
            IF 0 != Pkg_Rtcs0006.f_InsertRtcs0006 (CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO,
                                                   v_Job_Seq, v_Seq, CUR.MOB_NO, CUR.TEL_NO,
                                                   CUR.BLD_MNG_NO, CUR.POS_CD, CUR.ADDR1, CUR.ADDR2,
                                                   v_Plan_Day, '000000', CUR.CARMASTER_NU, NULL, 
                                                   NULL, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '방문점검 작업정보 변경(RTCS0006) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;     
        
        END IF;
        
    END LOOP;    
       
    IF CUR_RTCS0004%ISOPEN THEN
        CLOSE CUR_RTCS0004;
    END IF;      
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다.';
    v_ErrorText := '';
    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Migration.p_TargetAggMigration(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Migration.p_TargetAggMigration(2)', v_ErrorText, v_Return_Message);

  END p_TargetAggMigration;

  /*****************************************************************************
  -- 계약정보(RTSD0104)의 계약번호 기준, 연관 테이블에  존재하지 않는 계약번호 데이터 일괄 삭제처리
  *****************************************************************************/
  PROCEDURE p_OrdNoAllDelete IS

    v_Success_Code NUMBER;
    v_Return_Message VARCHAR2(32767);
    v_ErrorText VARCHAR2(32767);
  BEGIN
  
    -- 일괄삭제 기능은 위험할 수 있으므로 우선 잠가놓음
    --p_OrdNoDelete (NULL, v_Success_Code, v_Return_Message, v_ErrorText);
  
    Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoAllDelete(2)', 'v_Success_Code', TO_CHAR(v_Success_Code));
    Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoAllDelete(2)', 'v_ErrorText', v_ErrorText);
    Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoAllDelete(2)', 'v_Return_Message', v_Return_Message);
    
  END p_OrdNoAllDelete;
  
  /*****************************************************************************
  -- 계약번호 기준 관련 데이터 삭제처리
  *****************************************************************************/
  PROCEDURE p_OrdNoDelete (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Rcnt NUMBER DEFAULT 0;
    
    CUR  SYS_REFCURSOR;
  BEGIN
  
    -- 중요 :  하기 삭제 처리 로직의 사용은 아래 체크사항이 모두 문제 없을 경우 사용되어져야 함
    
    /* 계약정보(RTSD0104)의 특정 계약번호를 삭제 시 체크 해야할 사항
      ----------------------------------------------------------------------------
      1. 전월에 수납건이(RTRE0030.RECV_DAY) 존재할 경우 삭제 불가
      2. 전월매출(RTSD0109.DEMD_DT) 내역이 존재하는 경우 삭제 불가
      3. 전월발생 선수내역(RTRE0035.PND_DAY) 내역이 존재하는 경우 삭제 불가
      4. 이연내역( RTRE0120.ORD_NO) 존재하는 계약번호 삭제 불가 
    */
        
    -- 계약번호는 12자리이여야 함
    IF (TRIM(v_Ord_No) IS NOT NULL) AND (TRIM(v_Ord_No) <> 12) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') :  필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    ELSE
    
    
        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', 'START', '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        
        
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        -- 아래 소스부분은 스크립트를 통해 자동 생성되는 부분으로, 임의 수정은 하지말고 맨아래 일괄생성  스크립트 수정 후 추출하여 작성하도록 함
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCM0040 VALUES('''||FILE_SEQ||''','''||FILE_GRP_SEQ||''','''||FILE_LNM||''','''||FILE_PNM||''','''||FILE_PATH||''','''||FILE_SIZE||''','''||UPLPG_CD||''','''||CUST_NO||''','''||ORD_NO||''','''||USE_YN||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCM0040 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCM0040]이미지 관리', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCM0040 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCM0040]이미지 관리', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0001 VALUES('''||EQU_NO||''','''||ORD_NO||''','''||PROC_DAY||''','''||MAT_CD||''','''||MOB_NO||''','''||TEL_NO||''','''||BLD_MNG_NO||''','''||POS_CD||''','''||ADDR1||''','''||ADDR2||''','''||TEL_NO2||''','''||BLD_MNG_NO2||''','''||POS_CD2||''','''||ADDR1_2||''','''||ADDR2_2||''','''||CAR_NO||''','''||CAR_OWNER||''','''||CLOSE_YN||''','''||CLOSE_DAY||''','''||FL_YN||''','''||FR_YN||''','''||RL_YN||''','''||RR_YN||''','''||POS_X||''','''||POS_Y||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0001 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0001]설비 정보', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0001 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0001]설비 정보', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0004 VALUES('''||STD_YM||''','''||ORD_NO||''','''||EQU_NO||''','''||TARGET_CD||''','''||MR_CD||''','''||C_MILEAGE||''','''||A_MILEAGE||''','''||PLAN_DAY||''','''||AD_ORDNO||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0004 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0004]관리계정 정보', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0004 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0004]관리계정 정보', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0005 VALUES('''||STD_YM||''','''||ORD_NO||''','''||EQU_NO||''','''||JOB_SEQ||''','''||TARGET_CD||''','''||MR_CD||''','''||R_MRCD||''','''||PROC_YN||''','''||NP_DESC||''','''||PLAN_DAY0||''','''||PLAN_TM0||''','''||PLAN_DAY||''','''||PLAN_TM||''','''||PROC_DAY||''','''||PROC_TM||''','''||CHK_STAT||''','''||SERV_SEQ||''','''||REQ_DESC||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0005 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0005]방문점검 작업목록', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0005 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0005]방문점검 작업목록', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0006 VALUES('''||STD_YM||''','''||ORD_NO||''','''||EQU_NO||''','''||JOB_SEQ||''','''||SEQ||''','''||MOB_NO||''','''||TEL_NO||''','''||BLD_MNG_NO||''','''||POSCD||''','''||ADDR1||''','''||ADDR2||''','''||PLAN_DAY||''','''||PLAN_TM||''','''||MR_CD||''','''||POS_X||''','''||POS_Y||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0006 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0006]방문점검 작업정보 변경', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0006 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0006]방문점검 작업정보 변경', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0007 VALUES('''||ORD_NO||''','''||EQU_NO||''','''||SERV_SEQ||''','''||PER_TP||''','''||PROC_IN_CD||''','''||A_MILEAGE||''','''||PROC_DAY||''','''||PROC_TM||''','''||SERV_SIGN_SEQ||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0007 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0007]서비스 처리내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0007 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0007]서비스 처리내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0008 VALUES('''||ORD_NO||''','''||EQU_NO||''','''||SERV_SEQ||''','''||SEQ||''','''||SERVICE_CD||''','''||DLVC_YN||''','''||DLVR_DAY||''','''||DLVR_SEQ||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0008 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0008]서비스 처리내역 상세', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0008 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0008]서비스 처리내역 상세', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0009 VALUES('''||DLVR_DAY||''','''||DLVR_SEQ||''','''||ORD_NO||''','''||CUST_NO||''','''||SERV_SEQ||''','''||DLV_STAT||''','''||FUEL_CD||''','''||YRML_CD||''','''||DSPLMT_CD||''','''||DLV_GB||''','''||AGENCY_CD||''','''||CONSIGNEE||''','''||POS_CD||''','''||ADDR1||''','''||ADDR2||''','''||DLV_TEL||''','''||DLV_DESC||''','''||SERVRQ_DAY||''','''||DOWN_DAY||''','''||DLVS_DAY||''','''||DLV_ENT||''','''||TRSP_DOC||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0009 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0009]엔진오일 배송신청 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0009 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0009]엔진오일 배송신청 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0100 VALUES('''||CALL_NO||''','''||JOB_TP||''','''||JOB_DAY||''','''||CALL_DAY||''','''||CALL_STATUS||''','''||USER_ID||''','''||BAEJUNG_DAY||''','''||BAEJUNG_YN||''','''||RETRY_CNT||''','''||ORD_NO||''','''||PROC_DAY||''','''||AGENCY_CD||''','''||MAT_CD||''','''||MAT_NM||''','''||CUST_NO||''','''||CUST_NM||''','''||MOB_NO||''','''||TEL_NO||''','''||CAR_NO||''','''||VKBUR||''','''||VKGRP||''','''||CALL_DTL||''','''||SERV_SEQ||''','''||PROC_IN_CD||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0100 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0100]해피콜대상', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0100 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0100]해피콜대상', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0102 VALUES('''||CALL_NO||''','''||RECV_DAY||''','''||RECV_TM||''','''||USER_ID||''','''||RECV_TP||''','''||RESU_ST||''','''||ORD_NO||''','''||CUST_NO||''','''||CUST_NM||''','''||TEL_NO||''','''||CALL_DTL||''','''||CLAIM_NO||''','''||END_DAY||''','''||END_TM||''','''||SMS_TX||''','''||REGION_NO||''','''||CITY_NO||''','''||CAR_NO||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0102 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0102]인바운드 상담등록', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0102 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0102]인바운드 상담등록', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0120 VALUES('''||ORD_NO||''','''||MF_CD||''','''||MODEL_NM||''','''||WIDTH_CD||''','''||RATIO_CD||''','''||INCH_CD||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0120 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0120]사용자구매전제조사정보', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0120 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0120]사용자구매전제조사정보', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTCS0203 VALUES('''||ORD_NO||''','''||STRG_SEQ||''','''||CUST_NO||''','''||SRRG_DAY||''','''||STRG_YN||''','''||STRG_STAT||''','''||SRSV_YN||''','''||AGENCY_CD||''','''||WAREH_CD||''','''||STRG_DAY||''','''||STRG_DT||''','''||STRG_MTHD||''','''||STRG_FILE_PATH||''','''||STRG_FILE_NAME||''','''||STRG_USER_ID||''','''||DLVR_DAY||''','''||DLVR_DT||''','''||DLVR_FILE_PATH||''','''||DLVR_FILE_NAME||''','''||DLVR_USER_ID||''','''||MF_CD||''','''||PATTERN_CD||''','''||SELECTION_WIDTH||''','''||ASPECT_RATIO||''','''||WHEEL_INCHES||''','''||PLY_RATING||''','''||TIRE_CNT||''','''||MF_CD_F||''','''||PATTERN_CD_F||''','''||SELECTION_WIDTH_F||''','''||ASPECT_RATIO_F||''','''||WHEEL_INCHES_F||''','''||PLY_RATING_F||''','''||TIRE_CNT_F||''','''||MF_CD_R||''','''||PATTERN_CD_R||''','''||SELECTION_WIDTH_R||''','''||ASPECT_RATIO_R||''','''||WHEEL_INCHES_R||''','''||PLY_RATING_R||''','''||TIRE_CNT_R||''','''||TOT_TIRE_CNT||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTCS0203 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0203][CS] 타이어 보관 관리', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTCS0203 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTCS0203][CS] 타이어 보관 관리', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0030 VALUES('''||RECV_SEQ||''','''||RITM_SEQ||''','''||RECV_DAY||''','''||ORD_NO||''','''||CUST_NO||''','''||RECP_ID||''','''||RECP_AMT||''','''||RECP_TP||''','''||RECP_PAY||''','''||RECP_FG||''','''||SCHD_SEQ||''','''||CASH_YN||''','''||CNC_STAT||''','''||CNC_RSEQ||''','''||CNC_ISEQ||''','''||CNC_IOSEQ||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0030 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0030]수납 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0030 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0030]수납 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0031 VALUES('''||RECV_SEQ||''','''||RITM_SEQ||''','''||RECV_DAY||''','''||ORD_NO||''','''||SCHD_SEQ||''','''||CUST_NO||''','''||RECP_TP||''','''||SALE_AMT||''','''||ARRE_AMT||''','''||ZFBDT||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0031 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0031]수납 대상 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0031 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0031]수납 대상 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0035 VALUES('''||RECV_SEQ||''','''||RITM_SEQ||''','''||PND_DAY||''','''||ORD_NO||''','''||CUST_NO||''','''||PND_AMT||''','''||SBS_AMT||''','''||RECP_TP||''','''||RECP_PAY||''','''||RECP_FG||''','''||PND_STAT||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0035 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0035]선수금 발생내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0035 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0035]선수금 발생내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0036 VALUES('''||SBS_SEQ||''','''||SBS_ISEQ||''','''||SBS_DAY||''','''||ORD_NO||''','''||CUST_NO||''','''||SBS_AMT||''','''||RECP_TP||''','''||RECP_PAY||''','''||RECP_FG||''','''||SBS_TP||''','''||RECV_SEQ||''','''||RITM_SEQ||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0036 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0036]선수금 정리내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0036 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0036]선수금 정리내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0037 VALUES('''||CLOSE_DAY||''','''||RECV_SEQ||''','''||RITM_SEQ||''','''||PND_DAY||''','''||ORD_NO||''','''||CUST_NO||''','''||PND_AMT||''','''||SBS_AMT||''','''||RECP_TP||''','''||RECP_PAY||''','''||RECP_FG||''','''||PND_STAT||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0037 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0037]선수금 잔액내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0037 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0037]선수금 잔액내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0040 VALUES('''||RECV_SEQ||''','''||RECV_DAY||''','''||ORD_NO||''','''||CUST_NO||''','''||RECP_AMT||''','''||RECP_PAY||''','''||RECP_FG||''','''||BANK_RECP_DAY||''','''||CNC_RSEQ||''','''||CNC_STAT||''','''||RECP_ID||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0040 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0040]무통장 수납내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0040 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0040]무통장 수납내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0041 VALUES('''||RECV_SEQ||''','''||RECV_DAY||''','''||ORD_NO||''','''||CUST_NO||''','''||RECP_AMT||''','''||RECP_TP||''','''||RECP_PAY||''','''||RECP_FG||''','''||TNO||''','''||CNC_RSEQ||''','''||CNC_STAT||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0041 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0041]온라인 결제 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0041 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0041]온라인 결제 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0043 VALUES('''||CHECK_DAY||''','''||CHECK_SET||''','''||CSEQ||''','''||ORD_NO||''','''||CUST_NM||''','''||RECP_PAY||''','''||BANK_NM||''','''||CARDCOM_NM||''','''||APP_AMT||''','''||ST_DESC||''','''||APP_DAY||''','''||CNC_DAY||''','''||PCNC_DAY||''','''||TNO||''','''||APP_DESC||''','''||CNC_AMT||''','''||CNCP_AMT||''','''||RECP_AMT||''','''||DIFF_YN||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0043 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0043]KCP 결제 대사 기초내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0043 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0043]KCP 결제 대사 기초내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0050 VALUES('''||RPC_SEQ||''','''||ORD_NO||''','''||RPC_DAY||''','''||RPC_UID||''','''||RPC_CD||''','''||RPC_RSN||''','''||FILE_GRP_SEQ||''','''||BFCUST_NO||''','''||BFTCGRP_NO||''','''||BFPAY_MTHD||''','''||BFPAY_DD||''','''||BFACC_SEQ||''','''||BFCRD_SEQ||''','''||BFBATCH_KEY||''','''||BFACC_STAT||''','''||BFACRQ_ST||''','''||BFACRQ_FG||''','''||BFACRQ_DAY||''','''||BFACRQ_SEQ||''','''||BFRPC_SEQ||''','''||AFCUST_NO||''','''||AFTCGRP_NO||''','''||AFPAY_MTHD||''','''||AFPAY_DD||''','''||AFACC_SEQ||''','''||AFCRD_SEQ||''','''||AFBATCH_KEY||''','''||AFACC_STAT||''','''||AFACRQ_ST||''','''||AFACRQ_FG||''','''||AFACRQ_DAY||''','''||AFACRQ_SEQ||''','''||ABRPC_SEQ||''','''||DEL_YN||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0050 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0050]결제정보 변경이력', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0050 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0050]결제정보 변경이력', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0060 VALUES('''||ACRQ_FG||''','''||ACRQ_DAY||''','''||ACRQ_SEQ||''','''||ORD_NO||''','''||CUST_NO||''','''||BANK_CD||''','''||ACC_SEQ||''','''||ACRQ_TP||''','''||RPC_SEQ||''','''||ACRQ_ST||''','''||ACERCD||''','''||ACBRCD||''','''||RQBRCD||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0060 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0060]계좌신청 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0060 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0060]계좌신청 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0070 VALUES('''||RCMS_DAY||''','''||RCMS_SEQ||''','''||ORD_NO||''','''||CUST_NO||''','''||ACC_SEQ||''','''||RCMS_AMT||''','''||RQST_STAT||''','''||BANK_CD||''','''||RCERCD||''','''||RECP_AMT||''','''||RECV_SEQ||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0070 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0070]출금이체 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0070 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0070]출금이체 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0071 VALUES('''||RCMS_DAY||''','''||ORD_NO||''','''||SCHD_SEQ||''','''||CUST_NO||''','''||DEMD_DT||''','''||RECP_TP||''','''||SALE_AMT||''','''||ARRE_AMT||''','''||ZFBDT||''','''||TORD_NO||''','''||ACC_SEQ||''','''||BANK_CD||''','''||RCMS_SEQ||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0071 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0071]출금이체 대상', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0071 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0071]출금이체 대상', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0080 VALUES('''||RCRD_DAY||''','''||RCRD_SEQ||''','''||ORD_NO||''','''||CUST_NO||''','''||CRD_SEQ||''','''||RCRD_AMT||''','''||RQST_STAT||''','''||CARDCOM_CD||''','''||BATCH_KEY||''','''||TNO||''','''||CRERCD||''','''||RECP_AMT||''','''||RECV_SEQ||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0080 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0080]카드이체 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0080 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0080]카드이체 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0081 VALUES('''||RCRD_DAY||''','''||ORD_NO||''','''||SCHD_SEQ||''','''||CUST_NO||''','''||DEMD_DT||''','''||RECP_TP||''','''||SALE_AMT||''','''||ARRE_AMT||''','''||ZFBDT||''','''||TORD_NO||''','''||CRD_SEQ||''','''||CARDCOM_CD||''','''||BATCH_KEY||''','''||RCRD_SEQ||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0081 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0081]카드이체 대상', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0081 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0081]카드이체 대상', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0100 VALUES('''||DELY_DAY||''','''||ORD_NO||''','''||CUST_NO||''','''||RECP_TP||''','''||APPR_AMT||''','''||APPR_SCNT||''','''||PAY_MTHD||''','''||PAY_DD||''','''||ACC_SEQ||''','''||CRD_SEQ||''','''||ACC_STAT||''','''||BATCH_KEY||''','''||MFP_YN||''','''||TCAN_YN||''','''||OS_YN||''','''||DEL_YN||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0100 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0100]연체대상 집계 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0100 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0100]연체대상 집계 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0101 VALUES('''||DELY_DAY||''','''||ORD_NO||''','''||CUST_NO||''','''||SCHD_SEQ||''','''||RECP_TP||''','''||RECP_NU||''','''||SALE_AMT||''','''||RECP_AMT||''','''||ARRE_AMT||''','''||PAY_MTHD||''','''||PAY_DD||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0101 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0101]연체대상 세부 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0101 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0101]연체대상 세부 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0111 VALUES('''||RAMG_YM||''','''||ORD_NO||''','''||CUST_NO||''','''||RECP_TP||''','''||PAY_MTHD||''','''||PAY_DD||''','''||APPR_SCNT||''','''||RAMG_AMT||''','''||ARRE_AMT||''','''||RMON_AMT||''','''||RAMGRE_AMT||''','''||ARRERE_AMT||''','''||RMONRE_AMT||''','''||OVIN_AMT||''','''||OVINRE_AMT||''','''||MFP_YN||''','''||TCAN_YN||''','''||OS_YN||''','''||FST_DEL_YM||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0111 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0111]채권 관리 세부내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0111 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0111]채권 관리 세부내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0112 VALUES('''||RAMG_YM||''','''||ORD_NO||''','''||CUST_NO||''','''||SCHD_SEQ||''','''||RECP_TP||''','''||RECP_NU||''','''||SALE_AMT||''','''||RECP_AMT||''','''||ARRE_AMT||''','''||PAY_MTHD||''','''||PAY_DD||''','''||ZFB_DAY||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0112 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0112]당월청구 세부 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0112 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0112]당월청구 세부 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0113 VALUES('''||CUST_NO||''','''||RAMG_SEQ||''','''||RAMG_YM||''','''||ORD_NO||''','''||CNTCT_DAY||''','''||CNTCT_GB||''','''||CNTCT_DESC||''','''||ATTCH_FL_SEQ||''','''||DEL_YN||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0113 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0113]채권 관리 처리결과 등록', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0113 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0113]채권 관리 처리결과 등록', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0120 VALUES('''||ORD_NO||''','''||POSTP_TP||''','''||PSTR_YM||''','''||PEND_YM||''','''||PPTRM||''','''||ACQ_AMT||''','''||RES_AMT||''','''||MPP_AMT||''','''||LPP_AMT||''','''||PROST_TP||''','''||CHAN_CD||''','''||AGENCY_CD||''','''||CUST_TP||''','''||MAT_CD||''','''||ORD_QTY||''','''||PP_STAT||''','''||PPCH_YM||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0120 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0120][RE] 이연대상 내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0120 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0120][RE] 이연대상 내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE0125 VALUES('''||ORD_NO||''','''||POSTP_TP||''','''||POSTP_SEQ||''','''||POSTP_STAT||''','''||POSTP_YM||''','''||LY_TPP_AMT||''','''||CY_PP_AMT||''','''||CY_TPP_AMT||''','''||CM_PP_AMT||''','''||CM_R_AMT||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE0125 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0125][RE] 이연처리 월별내역', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE0125 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE0125][RE] 이연처리 월별내역', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE5040 VALUES('''||SLCM_YM||''','''||ORD_NO||''','''||CUST_NO||''','''||ORD_AGENT||''','''||CHAN_CD||''','''||COMM_TP||''','''||MAT_CD||''','''||CNT_CD||''','''||SSLCM_AMT||''','''||SAPFDS_AMT||''','''||SLCM_AMT||''','''||APFDS_AMT||''','''||PPOB_YN||''','''||PROC_DAY||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE5040 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE5040]판매수수료 기초 집계', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE5040 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE5040]판매수수료 기초 집계', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE5050 VALUES('''||SLCM_YM||''','''||ORD_NO||''','''||CUST_NO||''','''||AGENCY_CD||''','''||CHAN_CD||''','''||COMM_TP||''','''||MAT_CD||''','''||CNT_CD||''','''||PROCC_AMT||''','''||PPOB_YN||''','''||PROC_DAY||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE5050 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE5050]장착수수료 기초 집계', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE5050 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE5050]장착수수료 기초 집계', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTRE5060 VALUES('''||SLCM_YM||''','''||COMM_TP||''','''||ORD_NO||''','''||COMM_SEQ||''','''||CUST_NO||''','''||AGENCY_CD||''','''||CHAN_CD||''','''||MAT_CD||''','''||CNT_CD||''','''||CLASS_CD||''','''||SVCC_AMT||''','''||PPOB_YN||''','''||SVCP_DAY||''','''||EQU_NO||''','''||SERV_SEQ||''','''||SERV_ISEQ||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTRE5060 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE5060]서비스수수료 기초 집계', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTRE5060 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTRE5060]서비스수수료 기초 집계', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0013 VALUES('''||ORD_NO||''','''||PS_CD||''','''||PRS_DCD||''','''||CNT_CD||''','''||SERV_CNT0||''','''||SERV_CNTR||''','''||SERV_AMT||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0013 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0013]계약별 프리미엄서비스', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0013 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0013]계약별 프리미엄서비스', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0014 VALUES('''||ORD_NO||''','''||DC_TP||''','''||MAT_CD||''','''||SEQ||''','''||DC_RATE||''','''||DC_AMT||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0014 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0014]계약별 캠페인 적용', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0014 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0014]계약별 캠페인 적용', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0104 VALUES('''||ORD_NO||''','''||ORD_DAY||''','''||ORD_ID||''','''||CHAN_CD||''','''||SALE_ID||''','''||PERIOD_CD||''','''||CNT_CD||''','''||REGI_CD||''','''||CAMP_YN||''','''||C_DCRATE||''','''||C_DCAMT||''','''||CUST_NO||''','''||CUST_TP||''','''||SAFEKEY||''','''||GRP_YN||''','''||GRP_NO||''','''||G_DCRATE||''','''||G_DCAMT||''','''||L_DCRATE||''','''||L_DCAMT||''','''||F_DCRATE||''','''||F_DCAMT||''','''||BORD_NO||''','''||STAT_CD||''','''||PROC_DAY||''','''||CANC_DAY||''','''||AGENCY_CD||''','''||SALES_GROUP||''','''||SALES_OFFICE||''','''||ENG_NM||''','''||AG_DESC||''','''||MAKER_CD||''','''||MODEL_CD||''','''||CONTENTS_CD||''','''||FR_CD||''','''||CAR_NO||''','''||CAR_OWNER||''','''||C_MILEAGE||''','''||REQ_TEXT||''','''||PAY_MTHD||''','''||PAY_DD||''','''||ACC_SEQ||''','''||CRD_SEQ||''','''||ACC_CHK||''','''||ACC_STAT||''','''||BKEY_CHK||''','''||BATCH_KEY||''','''||BILL_YN||''','''||CRDT_STAT||''','''||CERT_CD||''','''||CERT_STAT||''','''||ORD_AGENT||''','''||ORG_CD||''','''||ORG_HQ||''','''||ORG_L1||''','''||ORG_L2||''','''||ORG_L3||''','''||ORG_L4||''','''||INS_ORG||''','''||PS_CD||''','''||CMSAG_YN||''','''||CON_MTHD||''','''||PCERT_YN||''','''||FC_DAY||''','''||AG_DAY||''','''||AG_SEQ||''','''||INPUT_DT||''','''||FILE_PATH||''','''||FILE_NAME||''','''||TCGRP_NO||''','''||VBELN||''','''||SEASON_CD||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0104 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0104]계약 정보', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0104 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0104]계약 정보', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0105 VALUES('''||ORD_NO||''','''||SEQ||''','''||ORD_DAY||''','''||ORD_ID||''','''||CHAN_CD||''','''||SALE_ID||''','''||PERIOD_CD||''','''||CNT_CD||''','''||REGI_CD||''','''||CAMP_YN||''','''||C_DCRATE||''','''||C_DCAMT||''','''||CUST_NO||''','''||CUST_TP||''','''||SAFEKEY||''','''||GRP_YN||''','''||GRP_NO||''','''||G_DCRATE||''','''||G_DCAMT||''','''||L_DCRATE||''','''||L_DCAMT||''','''||F_DCRATE||''','''||F_DCAMT||''','''||BORD_NO||''','''||STAT_CD||''','''||PROC_DAY||''','''||CANC_DAY||''','''||AGENCY_CD||''','''||SALES_GROUP||''','''||SALES_OFFICE||''','''||ENG_NM||''','''||AG_DESC||''','''||MAKER_CD||''','''||MODEL_CD||''','''||CONTENTS_CD||''','''||FR_CD||''','''||CAR_NO||''','''||CAR_OWNER||''','''||C_MILEAGE||''','''||REQ_TEXT||''','''||PAY_MTHD||''','''||PAY_DD||''','''||ACC_SEQ||''','''||CRD_SEQ||''','''||ACC_CHK||''','''||ACC_STAT||''','''||BKEY_CHK||''','''||BATCH_KEY||''','''||BILL_YN||''','''||CRDT_STAT||''','''||CERT_CD||''','''||CERT_STAT||''','''||ORD_AGENT||''','''||ORG_CD||''','''||ORG_HQ||''','''||ORG_L1||''','''||ORG_L2||''','''||ORG_L3||''','''||ORG_L4||''','''||INS_ORG||''','''||PS_CD||''','''||CMSAG_YN||''','''||CON_MTHD||''','''||PCERT_YN||''','''||FC_DAY||''','''||AG_DAY||''','''||AG_SEQ||''','''||INPUT_DT||''','''||FILE_PATH||''','''||FILE_NAME||''','''||TCGRP_NO||''','''||VBELN||''','''||SEASON_CD||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0105 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0105]계약 정보 이력', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0105 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0105]계약 정보 이력', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0106 VALUES('''||ORD_NO||''','''||SEQ||''','''||ORD_ID||''','''||PERIOD_CD||''','''||CNT_CD||''','''||REGI_CD||''','''||FR_CD||''','''||LR_CD||''','''||MAT_CD||''','''||ORD_QTY||''','''||REGI_AMT||''','''||RENT_AMT||''','''||RENTP_AMT||''','''||F_DCRATE||''','''||F_DCAMT||''','''||MON_DCAMT||''','''||MON_AMT||''','''||PLAN_DAY||''','''||PLAN_TM||''','''||INST_DAY||''','''||INST_TM||''','''||INST_YN||''','''||VAL_YN||''','''||EQU_NO||''','''||OS_ID||''','''||OS_DAY||''','''||STAT_CD||''','''||FL_YN||''','''||FR_YN||''','''||RL_YN||''','''||RR_YN||''','''||MAT_DESC||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0106 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0106]계약 상품 정보', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0106 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0106]계약 상품 정보', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0107 VALUES('''||ORD_NO||''','''||SEQ||''','''||SEQ2||''','''||ORD_ID||''','''||PERIOD_CD||''','''||CNT_CD||''','''||REGI_CD||''','''||FR_CD||''','''||LR_CD||''','''||MAT_CD||''','''||ORD_QTY||''','''||REGI_AMT||''','''||RENT_AMT||''','''||RENTP_AMT||''','''||F_DCRATE||''','''||F_DCAMT||''','''||MON_DCAMT||''','''||MON_AMT||''','''||PLAN_DAY||''','''||PLAN_TM||''','''||INST_DAY||''','''||INST_TM||''','''||INST_YN||''','''||VAL_YN||''','''||EQU_NO||''','''||OS_ID||''','''||OS_DAY||''','''||STAT_CD||''','''||FL_YN||''','''||FR_YN||''','''||RL_YN||''','''||RR_YN||''','''||MAT_DESC||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0107 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0107]계약 상품 정보 이력', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0107 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0107]계약 상품 정보 이력', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0108 VALUES('''||ORD_NO||''','''||ORD_DAY||''','''||ORD_ID||''','''||CHAN_CD||''','''||SALE_ID||''','''||PERIOD_CD||''','''||CNT_CD||''','''||REGI_CD||''','''||CAMP_YN||''','''||C_DCRATE||''','''||C_DCAMT||''','''||CUST_NO||''','''||CUST_TP||''','''||SAFEKEY||''','''||GRP_YN||''','''||GRP_NO||''','''||G_DCRATE||''','''||G_DCAMT||''','''||L_DCRATE||''','''||L_DCAMT||''','''||F_DCRATE||''','''||F_DCAMT||''','''||BORD_NO||''','''||STAT_CD||''','''||PROC_DAY||''','''||CANC_DAY||''','''||AGENCY_CD||''','''||SALES_GROUP||''','''||SALES_OFFICE||''','''||ENG_NM||''','''||AG_DESC||''','''||MAKER_CD||''','''||MODEL_CD||''','''||CONTENTS_CD||''','''||FR_CD||''','''||CAR_NO||''','''||CAR_OWNER||''','''||C_MILEAGE||''','''||REQ_TEXT||''','''||PAY_MTHD||''','''||PAY_DD||''','''||ACC_SEQ||''','''||CRD_SEQ||''','''||ACC_CHK||''','''||ACC_STAT||''','''||BKEY_CHK||''','''||BATCH_KEY||''','''||BILL_YN||''','''||CRDT_STAT||''','''||CERT_CD||''','''||CERT_STAT||''','''||ORD_AGENT||''','''||ORG_CD||''','''||ORG_HQ||''','''||ORG_L1||''','''||ORG_L2||''','''||ORG_L3||''','''||ORG_L4||''','''||INS_ORG||''','''||PS_CD||''','''||DEPT_YN||''','''||MFP_YN||''','''||TCAN_YN||''','''||OS_YN||''','''||OS_DAY||''','''||ORD_TP||''','''||EQU_NO||''','''||REGI_AMT||''','''||MON_AMT||''','''||FL_YN||''','''||FR_YN||''','''||RL_YN||''','''||RR_YN||''','''||SV_SERT||''','''||AG_SERT||''','''||TD_YN||''','''||INPUT_DT||''','''||FILE_PATH||''','''||FILE_NAME||''','''||TCGRP_NO||''','''||VBELN||''','''||END_TP||''','''||END_AMT||''','''||ETC1_TP||''','''||ETC2_TP||''','''||ETC3_TP||''','''||ETC1_AMT||''','''||ETC2_AMT||''','''||ETC3_AMT||''','''||SEASON_CD||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0108 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0108]장착 정보', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0108 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0108]장착 정보', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0109 VALUES('''||ORD_NO||''','''||SCHD_SEQ||''','''||RECP_TP||''','''||RECP_NU||''','''||SCD_STAT||''','''||SALE_AMT||''','''||SALE_NAMT||''','''||SALE_VAMT||''','''||RECP_AMT||''','''||ARRE_AMT||''','''||DEMD_DT||''','''||ZLSPR||''','''||RC_DAY||''','''||RC_YN||''','''||TAX_DT||''','''||TAX_NO||''','''||ZFB_DAY||''','''||CANCL_DAY||''','''||CUST_NO||''','''||SALES_GROUP||''','''||SALES_OFFICE||''','''||AGENCY_CD||''','''||BEG_DAY||''','''||END_DAY||''','''||DELAY_YN||''','''||DELAY_RATE||''','''||PAY_MTHD||''','''||PAY_DD||''','''||USE_YN||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0109 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0109]청구스케줄', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0109 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0109]청구스케줄', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0112 VALUES('''||ORD_NO||''','''||SEQ||''','''||JOB_DAY||''','''||GRP_YN||''','''||GRP_NO||''','''||RENT_AMT||''','''||C_DCAMT||''','''||G_DCRATE||''','''||G_DCAMT||''','''||L_DCRATE||''','''||L_DCAMT||''','''||F_DCAMT||''','''||MON_AMT||''','''||GRP_YN2||''','''||GRP_NO2||''','''||RENT_AMT2||''','''||C_DCAMT2||''','''||G_DCRATE2||''','''||G_DCAMT2||''','''||L_DCRATE2||''','''||L_DCAMT2||''','''||F_DCAMT2||''','''||MON_AMT2||''','''||SALE_NAMT||''','''||SALE_VAMT||''','''||RECP_NU||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0112 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0112]장착 후 고객결합 금액이력', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0112 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0112]장착 후 고객결합 금액이력', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0114 VALUES('''||ORD_NO||''','''||SEQ||''','''||PROC_DAY||''','''||PRS_DCD1||''','''||PRS_DCD2||''','''||PRS_DCD3||''','''||PRS_DCD4||''','''||PRS_DCD5||''','''||A_MILEAGE||''','''||SV_SERT||''','''||INPUT_DT||''','''||FILE_PATH||''','''||FILE_NAME||''','''||SMS_YN||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0114 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0114]서비스 확인서', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0114 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0114]서비스 확인서', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0115 VALUES('''||ORD_NO||''','''||TRANS_TP||''','''||SEND_DAY||''','''||TRANS_DAY||''','''||EAI_YN||''','''||SAP_YN||''','''||VBELN||''','''||REQ_TEXT||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0115 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0115]SAL SO LOG', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0115 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0115]SAL SO LOG', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0116 VALUES('''||ORD_NO||''','''||VBELN||''','''||VBELN_D||''','''||GI_DAY||''','''||SMS_DAY||''','''||SMS_YN||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0116 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0116]배송완료 대상', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0116 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0116]배송완료 대상', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0117 VALUES('''||ORD_NO||''','''||VBELN||''','''||VBELN_D||''','''||GI_DAY||''','''||SMS_DAY||''','''||SMS_YN||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0117 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0117]배송중 대상', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0117 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0117]배송중 대상', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0118 VALUES('''||ORD_NO||''','''||SEQ||''','''||CUST_NO||''','''||SHEET_ID||''','''||FILE_PATH||''','''||FILE_NAME||''','''||JOB_CD||''','''||AUTO_YN||''','''||EMAIL_ADDR||''','''||DISP_ID||''','''||DISP_NM||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0118 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0118]전자서명 조회정보', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0118 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0118]전자서명 조회정보', '총 삭제 건수', TO_CHAR(v_Rcnt));


        v_Rcnt := 0;

        FOR CUR IN ( SELECT ORD_NO, 'INSERT INTO RTSD0206 VALUES('''||ORD_NO||''','''||ETC_CHAR_1||''','''||ETC_CHAR_2||''','''||ETC_CHAR_3||''','''||ETC_CHAR_4||''','''||ETC_CHAR_5||''','''||REG_ID||''','''||REG_DT||''','''||CHG_ID||''','''||CHG_DT||''');' AS ROW_DATA FROM RTSD0206 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' 
                   ) LOOP 

          v_Rcnt := v_Rcnt + 1;

          Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0206]이메일 발송 이력', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);

          DELETE FROM RTSD0206 A WHERE A.ORD_NO = CUR.ORD_NO;

        END LOOP;

        Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', '[RTSD0206]이메일 발송 이력', '총 삭제 건수', TO_CHAR(v_Rcnt));


        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        -- 위 소스부분은 스크립트를 통해 자동 생성되는 부분으로, 임의 수정은 하지말고 맨아래 일괄생성  스크립트 수정 후 추출하여 작성하도록 함
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 

    END IF;
    Pkg_Utility.p_InfoFileWrite('Pkg_Migration.p_OrdNoDelete(0)', 'END', '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    
    IF CUR%ISOPEN THEN CLOSE CUR; END IF;



    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다.';
    v_ErrorText := '';
    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Migration.p_OrdNoDelete(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Migration.p_OrdNoDelete(2)', v_ErrorText, v_Return_Message);

    /*
    -- 계약번호 기준 관련 테이블 데이터 삭제 패키지 소스 일괄 생성 스크립트 
    -- Pkg_Migration 패키지 생성용
    SELECT  CHR(9)||CHR(9)||'v_Rcnt := 0;'||CHR(10)||CHR(10)||
            CHR(9)||CHR(9)||'FOR CUR IN ( '||
                                          'SELECT ORD_NO, '||
                                                  (SELECT '''INSERT INTO '||Z.TABLE_NAME||' VALUES('''''||'''||'||LISTAGG(Z.COLUMN_NAME, '||'''''',''''''||') WITHIN GROUP (ORDER BY Z.COLUMN_ID)||
                                                          '||'''''');''' 
                                                   FROM   USER_TAB_COLUMNS Z 
                                                   WHERE  Z.TABLE_NAME = A.TABLE_NAME 
                                                   GROUP  BY Z.TABLE_NAME)||' AS ROW_DATA '||
                                          'FROM ' ||A.TABLE_NAME||' A '||
                                          'WHERE NOT EXISTS ('||
                                                             'SELECT ''X'' '||
                                                             'FROM   RTSD0104 C '||
                                                             'WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO) '||
                                                             'AND    C.ORD_NO LIKE v_Ord_No||''%'') '||
                                                             'AND    A.ORD_NO LIKE v_Ord_No||''%''' ||' '||CHR(10)||
            CHR(9)||CHR(9)||'           ) LOOP '||CHR(10)||CHR(10)||
            CHR(9)||CHR(9)||'  v_Rcnt := v_Rcnt + 1;'||CHR(10)||CHR(10)||        
            CHR(9)||CHR(9)||'  Pkg_Utility.p_InfoFileWrite(''Pkg_Migration.p_OrdNoDelete(0)'', ''['||A.TABLE_NAME||']'||
                                    (SELECT  X.COMMENTS 
                                     FROM    USER_TAB_COMMENTS X 
                                     WHERE   X.TABLE_NAME  = A.TABLE_NAME)||''', TO_CHAR(v_Rcnt), CUR.ORD_NO, CUR.ROW_DATA);'||CHR(10)||CHR(10)||
            CHR(9)||CHR(9)||'  DELETE FROM '||A.TABLE_NAME||' A WHERE A.ORD_NO = CUR.ORD_NO;'||CHR(10)||CHR(10)||
            CHR(9)||CHR(9)||'END LOOP;'||CHR(10)||CHR(10)||
            CHR(9)||CHR(9)||'Pkg_Utility.p_InfoFileWrite(''Pkg_Migration.p_OrdNoDelete(0)'', ''['||A.TABLE_NAME||']'||
                                    (SELECT  X.COMMENTS 
                                     FROM    USER_TAB_COMMENTS X 
                                     WHERE   X.TABLE_NAME  = A.TABLE_NAME)||''', ''총 삭제 건수'', TO_CHAR(v_Rcnt));'||CHR(10)||CHR(10)
    FROM    USER_TAB_COLUMNS A
    WHERE   COLUMN_NAME = 'ORD_NO'
    AND     TABLE_NAME LIKE 'RT%'
    AND     LENGTH(TABLE_NAME) = 8
    AND     NOT(TABLE_NAME LIKE '%TEMP%')
    GROUP   BY TABLE_NAME
    */

  END p_OrdNoDelete;


  /*****************************************************************************
  -- 삭제 된 계약정보(RTSD0104) 기준  관련 테이블 및 삭제 대상 계약번호 조회
  *****************************************************************************/
  PROCEDURE p_DeleteOrdNoSelect (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*계약번호              */
    ) IS

  BEGIN

    /*
    -- 삭제 된 계약정보(RTSD0104) 기준  관련 테이블 및 삭제 대상 계약번호 조회 SQL  스크립트 생성용
    SELECT  CHR(9)||
            'SELECT  '''||A.TABLE_NAME||''' AS TN, '''||B.COMMENTS||''' AS TC, ORD_NO '||
            'FROM   ' ||A.TABLE_NAME||' A '||
            'WHERE NOT EXISTS (SELECT ''X'' '||
                              'FROM   RTSD0104 C '||
                              'WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)'||
                              'AND    C.ORD_NO LIKE v_Ord_No||''%'') '||
                              'AND    A.ORD_NO LIKE v_Ord_No||''%'''||DECODE((RANK() OVER (ORDER BY A.TABLE_NAME DESC)), 1, ';', ' UNION ALL')
    FROM    USER_COL_COMMENTS A, 
            USER_TAB_COMMENTS B
    WHERE   A.COLUMN_NAME = 'ORD_NO'
    AND     A.TABLE_NAME LIKE 'RT%'
    AND     LENGTH(A.TABLE_NAME) = 8
    AND     NOT(A.TABLE_NAME LIKE '%TEMP%')
    AND     A.TABLE_NAME = B.TABLE_NAME
    ORDER   BY A.TABLE_NAME
    */
    
    
    OPEN Ref_Cursor FOR
    SELECT  'RTCM0040' AS TN, '이미지 관리' AS TC, ORD_NO FROM   RTCM0040 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0001' AS TN, '설비 정보' AS TC, ORD_NO FROM   RTCS0001 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0004' AS TN, '관리계정 정보' AS TC, ORD_NO FROM   RTCS0004 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0005' AS TN, '방문점검 작업목록' AS TC, ORD_NO FROM   RTCS0005 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0006' AS TN, '방문점검 작업정보 변경' AS TC, ORD_NO FROM   RTCS0006 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0007' AS TN, '서비스 처리내역' AS TC, ORD_NO FROM   RTCS0007 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0008' AS TN, '서비스 처리내역 상세' AS TC, ORD_NO FROM   RTCS0008 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0009' AS TN, '엔진오일 배송신청 내역' AS TC, ORD_NO FROM   RTCS0009 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0100' AS TN, '해피콜대상' AS TC, ORD_NO FROM   RTCS0100 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0102' AS TN, '인바운드 상담등록' AS TC, ORD_NO FROM   RTCS0102 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0120' AS TN, '사용자구매전제조사정보' AS TC, ORD_NO FROM   RTCS0120 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTCS0203' AS TN, '[CS] 타이어 보관 관리' AS TC, ORD_NO FROM   RTCS0203 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0030' AS TN, '수납 내역' AS TC, ORD_NO FROM   RTRE0030 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0031' AS TN, '수납 대상 내역' AS TC, ORD_NO FROM   RTRE0031 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0035' AS TN, '선수금 발생내역' AS TC, ORD_NO FROM   RTRE0035 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0036' AS TN, '선수금 정리내역' AS TC, ORD_NO FROM   RTRE0036 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0037' AS TN, '선수금 잔액내역' AS TC, ORD_NO FROM   RTRE0037 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0040' AS TN, '무통장 수납내역' AS TC, ORD_NO FROM   RTRE0040 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0041' AS TN, '온라인 결제 내역' AS TC, ORD_NO FROM   RTRE0041 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0043' AS TN, 'KCP 결제 대사 기초내역' AS TC, ORD_NO FROM   RTRE0043 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0050' AS TN, '결제정보 변경이력' AS TC, ORD_NO FROM   RTRE0050 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0060' AS TN, '계좌신청 내역' AS TC, ORD_NO FROM   RTRE0060 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0070' AS TN, '출금이체 내역' AS TC, ORD_NO FROM   RTRE0070 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0071' AS TN, '출금이체 대상' AS TC, ORD_NO FROM   RTRE0071 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0080' AS TN, '카드이체 내역' AS TC, ORD_NO FROM   RTRE0080 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0081' AS TN, '카드이체 대상' AS TC, ORD_NO FROM   RTRE0081 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0100' AS TN, '연체대상 집계 내역' AS TC, ORD_NO FROM   RTRE0100 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0101' AS TN, '연체대상 세부 내역' AS TC, ORD_NO FROM   RTRE0101 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0111' AS TN, '채권 관리 세부내역' AS TC, ORD_NO FROM   RTRE0111 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0112' AS TN, '당월청구 세부 내역' AS TC, ORD_NO FROM   RTRE0112 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0113' AS TN, '채권 관리 처리결과 등록' AS TC, ORD_NO FROM   RTRE0113 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0120' AS TN, '[RE] 이연대상 내역' AS TC, ORD_NO FROM   RTRE0120 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE0125' AS TN, '[RE] 이연처리 월별내역' AS TC, ORD_NO FROM   RTRE0125 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE5040' AS TN, '판매수수료 기초 집계' AS TC, ORD_NO FROM   RTRE5040 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE5050' AS TN, '장착수수료 기초 집계' AS TC, ORD_NO FROM   RTRE5050 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTRE5060' AS TN, '서비스수수료 기초 집계' AS TC, ORD_NO FROM   RTRE5060 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0013' AS TN, '계약별 프리미엄서비스' AS TC, ORD_NO FROM   RTSD0013 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0014' AS TN, '계약별 캠페인 적용' AS TC, ORD_NO FROM   RTSD0014 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0104' AS TN, '계약 정보' AS TC, ORD_NO FROM   RTSD0104 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0105' AS TN, '계약 정보 이력' AS TC, ORD_NO FROM   RTSD0105 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0106' AS TN, '계약 상품 정보' AS TC, ORD_NO FROM   RTSD0106 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0107' AS TN, '계약 상품 정보 이력' AS TC, ORD_NO FROM   RTSD0107 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0108' AS TN, '장착 정보' AS TC, ORD_NO FROM   RTSD0108 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0109' AS TN, '청구스케줄' AS TC, ORD_NO FROM   RTSD0109 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0112' AS TN, '장착 후 고객결합 금액이력' AS TC, ORD_NO FROM   RTSD0112 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0114' AS TN, '서비스 확인서' AS TC, ORD_NO FROM   RTSD0114 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0115' AS TN, 'SAL SO LOG' AS TC, ORD_NO FROM   RTSD0115 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0116' AS TN, '배송완료 대상' AS TC, ORD_NO FROM   RTSD0116 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0117' AS TN, '배송중 대상' AS TC, ORD_NO FROM   RTSD0117 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0118' AS TN, '전자서명 조회정보' AS TC, ORD_NO FROM   RTSD0118 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%' UNION ALL
    SELECT  'RTSD0206' AS TN, '이메일 발송 이력' AS TC, ORD_NO FROM   RTSD0206 A WHERE NOT EXISTS (SELECT 'X' FROM   RTSD0104 C WHERE  C.ORD_NO = NVL(A.ORD_NO,C.ORD_NO)AND    C.ORD_NO LIKE v_Ord_No||'%') AND    A.ORD_NO LIKE v_Ord_No||'%';
    
  END p_DeleteOrdNoSelect; 
   
END Pkg_Migration;