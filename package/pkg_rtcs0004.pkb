CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0004 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0004
   PURPOSE   관리계정 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
   1.1        2017-04-17  wjim             [20170417_01] 일괄배정 프로세스 개선
   1.2        2017-04-24  wjim             [20170424_01] 일괄배정 수행구분 추가
   1.3        2017-04-26  wjim             [20170426_01] 전월미처리 주소 기준 변경
   1.4        2017-07-26  wjim             [20170726_01] 배정 시 점검거부 고려 
   1.5        2018-06-04  wjim             [20180604_01] 점검거부 배정기준 변경
   1.6        2019-03-19  kstka            [20190319_01] 마지막회차 점검배정
   1.7        2019-10-31  kstka            [20191031_01] 잔여서비스 확인후 배정
   1.11       2019-12-02  wjim             [20191202_01] 시군구별 담당 로디안 조회기준 변경
   1.12       2019-12-31  kstka            [2019-00370394] 2+2 방문점검 중복배정 방지 추가
*******************************************************************************/

  /*****************************************************************************
  -- 관리계정 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0004Count(
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE            /*설비번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0004
    WHERE   STD_YM = v_Std_Ym
    AND     ORD_NO = v_Ord_No
    AND     EQU_NO = v_Equ_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0004Count;

  /*****************************************************************************
  -- 관리계정 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0004 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*주행거리(장착)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*조정관련 계약번호     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.STD_YM,                    /*기준년월            */
            A.ORD_NO,                    /*계약번호            */
            A.EQU_NO,                    /*설비번호            */
            A.TARGET_CD,                 /*대상구분            */
            A.MR_CD,                     /*Mr. Roadian코드     */
            A.C_MILEAGE,                 /*주행거리(장착)      */
            A.A_MILEAGE,                 /*주행거리(월 평균)   */
            A.PLAN_DAY,                  /*점검예정일자        */
            A.AD_ORDNO,                  /*조정관련 계약번호   */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0004 A
    WHERE   A.STD_YM    = DECODE(v_Std_Ym    , NULL, A.STD_YM    , v_Std_Ym)
    AND     A.ORD_NO    = DECODE(v_Ord_No    , NULL, A.ORD_NO    , v_Ord_No)
    AND     A.EQU_NO    = DECODE(v_Equ_No    , NULL, A.EQU_NO    , v_Equ_No)
    AND     A.TARGET_CD = DECODE(v_Target_Cd , NULL, A.TARGET_CD , v_Target_Cd)
    AND     A.MR_CD     = DECODE(v_Mr_Cd     , NULL, A.MR_CD     , v_Mr_Cd)
    AND     A.C_MILEAGE = DECODE(v_C_Mileage , NULL, A.C_MILEAGE , v_C_Mileage)
    AND     A.A_MILEAGE = DECODE(v_A_Mileage , NULL, A.A_MILEAGE , v_A_Mileage)
    AND     A.PLAN_DAY  = DECODE(v_Plan_Day  , NULL, A.PLAN_DAY  , v_Plan_Day)
    AND     A.AD_ORDNO  = DECODE(v_Ad_Ordno  , NULL, A.AD_ORDNO  , v_Ad_Ordno)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtcs0004;

  /*****************************************************************************
  -- 관리계정 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0004 (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*주행거리(장착)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*조정관련 계약번호     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0004 (
            STD_YM,
            ORD_NO,
            EQU_NO,
            TARGET_CD,
            MR_CD,
            C_MILEAGE,
            A_MILEAGE,
            PLAN_DAY,
            AD_ORDNO,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Std_Ym,
            v_Ord_No,
            v_Equ_No,
            v_Target_Cd,
            v_Mr_Cd,
            v_C_Mileage,
            v_A_Mileage,
            v_Plan_Day,
            v_Ad_Ordno,
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

  END f_InsertRtcs0004;

  /*****************************************************************************
  -- 관리계정 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0004 (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*주행거리(장착)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*조정관련 계약번호     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0004
    SET    TARGET_CD = v_Target_Cd,
           MR_CD     = v_Mr_Cd,
           C_MILEAGE = v_C_Mileage,
           A_MILEAGE = v_A_Mileage,
           PLAN_DAY  = v_Plan_Day,
           AD_ORDNO  = v_Ad_Ordno,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  STD_YM    = v_Std_Ym
    AND    ORD_NO    = v_Ord_No
    AND    EQU_NO    = v_Equ_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0004;

  /*****************************************************************************
  -- 관리계정 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0004 (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTCS0004
    WHERE  STD_YM = v_Std_Ym
    AND    ORD_NO = v_Ord_No
    AND    EQU_NO = v_Equ_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.f_DeleteRtcs0004(2)', '기준년월   ', v_Std_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.f_DeleteRtcs0004(2)', '계약번호   ', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.f_DeleteRtcs0004(2)', '설비번호   ', v_Equ_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.f_DeleteRtcs0004(2)', '등록자 ID ', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0004;

  /*****************************************************************************
  -- 관리계정 정보 관리(IUD)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 마감기준 변경
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0004 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_Target_Cd      IN RTCS0004.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0004.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_C_Mileage      IN RTCS0004.C_MILEAGE%TYPE,      /*주행거리(장착)        */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Plan_Day       IN RTCS0004.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Ad_Ordno       IN RTCS0004.AD_ORDNO%TYPE,       /*조정관련 계약번호     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF 0 != ISDATE(TRIM(v_Std_Ym)) THEN
        v_Return_Message := '대상년월('||v_Std_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 마감여부 확인
    -- - 마감기준 변경 : 미래월은 생성 가능 [20170417_01]
--    IF (TRIM(v_Std_Ym) <> TO_CHAR(SYSDATE, 'YYYYMM')) AND (0 = Pkg_Rtcm0051.f_sRtcm0051UseCount('H010', SUBSTR(v_Std_Ym,3,4))) THEN
--        v_Return_Message := '해당 대상년월 데이터는 이미 마감되었으므로 처리가 불가합니다!';
--        RAISE e_Error;
--    END IF;
    
    IF (TRIM(v_Std_Ym) < TO_CHAR(SYSDATE, 'YYYYMM')) AND (0 = Pkg_Rtcm0051.f_sRtcm0051UseCount('H010', SUBSTR(v_Std_Ym,3,4))) THEN
        v_Return_Message := '해당 대상년월 데이터는 이미 마감되었으므로 처리가 불가합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Equ_No) IS NULL) OR (0 = Pkg_Rtcs0001.f_sRtcs0001Count(v_Equ_No)) THEN
        v_Return_Message := '설비번호('||v_Equ_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Target_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H007', v_Target_Cd)) THEN
        v_Return_Message := '대상구분('||v_Target_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcs0004Count(v_Std_Ym, v_Ord_No, v_Equ_No) THEN

        IF 0 != f_InsertRtcs0004(v_Std_Ym, v_Ord_No, v_Equ_No, v_Target_Cd,
                                 v_Mr_Cd, v_C_Mileage, v_A_Mileage, v_Plan_Day,
                                 v_Ad_Ordno, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '관리계정 정보 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn IN ('I','U') THEN

            IF 0 != f_UpdateRtcs0004(v_Std_Ym, v_Ord_No, v_Equ_No, v_Target_Cd,
                                     v_Mr_Cd, v_C_Mileage, v_A_Mileage, v_Plan_Day,
                                     v_Ad_Ordno, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '관리계정 정보 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0004(v_Std_Ym, v_Ord_No, v_Equ_No, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '관리계정 정보 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;

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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_IUDRtcs0004(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_IUDRtcs0004(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0004;

  /*****************************************************************************
  -- 관리계정 정보 Update -  서비스 확인서 서명완료 등록
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0004AMileage (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0004.EQU_NO%TYPE,         /*설비번호              */
    v_A_Mileage      IN RTCS0004.A_MILEAGE%TYPE,      /*주행거리(월 평균)     */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0004
    SET    A_MILEAGE = v_A_Mileage,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  STD_YM    = v_Std_Ym
    AND    ORD_NO    = v_Ord_No
    AND    EQU_NO    = v_Equ_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0004AMileage;

  /*****************************************************************************
  -- 점검대상 집계
  -- - 개선 프로그램 개발(p_Rtcs0004TargetAggregateJob1, p_Rtcs0004TargetAggregateJob2)로 더이상 미사용 [20170417_01]        
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob IS

    v_Success_Code   NUMBER;
    v_Return_Message VARCHAR2(2000);
    v_ErrorText      VARCHAR2(2000);
    
    v_Std_Ym RTCS0004.STD_YM%TYPE DEFAULT TO_CHAR(SYSDATE,'YYYYMM');    /*기준년월  */
    v_Reg_Id RTCS0004.REG_ID%TYPE DEFAULT 'admin';                      /*등록자 ID */
    
  BEGIN

    p_Rtcs0004TargetAggregate(v_Std_Ym, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(1)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(1)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(1)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(1)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(1)', 'v_ErrorText',      v_ErrorText);
    ELSE
        COMMIT;
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(2)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(2)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(2)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(2)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob(2)', 'v_ErrorText',      v_ErrorText);
    END IF;

  END p_Rtcs0004TargetAggregateJob;
  
  /*****************************************************************************
  -- 점검대상 집계
  -- - 개선 프로그램 개발(p_Rtcs0004TargetAggregateNew)로 더이상 미사용 [20170417_01]        
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregate (
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,         /*기준년월              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 점검대상
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
            E.EQU_NO,                    /*설비번호            */
            --( --2016-01-06
            --SELECT COUNT(*)
            --FROM   RTRE0100 Z
            --WHERE  Z.DELY_DAY = TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMMDD')
            --AND    Z.ORD_NO = A.ORD_NO
            --) DELY_DAY_CNT,
            Pkg_Rtcs0004.f_sRtcs0004PlanDay(v_Std_Ym, A.ORD_NO) PLAN_DAY
    FROM    RTSD0108 A,
            RTSD0104 B,
            RTSD0100 C,
            RTSD0010 D,
            RTCS0001 E
    WHERE   A.PROC_DAY  <= TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMMDD')
    AND     (A.MFP_YN    = 'N' OR (A.MFP_YN = 'Y' AND
                                   A.CANC_DAY > TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMMDD')  ))
    AND     (A.OS_YN     = 'N' AND (A.OS_DAY >= TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMMDD') ))
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

    v_Chk_Stat RTCS0005.CHK_STAT%TYPE DEFAULT NULL;  /*작업상태              */
    v_Job_Seq RTCS0005.JOB_SEQ%TYPE DEFAULT NULL;    /*작업순번              */
    v_Seq RTCS0006.SEQ%TYPE DEFAULT NULL;            /*순번                  */
    v_Cnt NUMBER DEFAULT 0;

  BEGIN

    -- 점검대상 재집계를 위한 기존 집계내역 일괄 삭제처리
    p_Rtcs0004TargetAllDelete (v_Std_Ym, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN
        v_Return_Message := '기존 집계내역 일괄 삭제처리 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    FOR CUR IN CUR_RTCS0004 LOOP
        EXIT WHEN CUR_RTCS0004%NOTFOUND;
        v_exist := TRUE;

        v_Cnt := NULL;
        v_Chk_Stat := NULL;
    
        -- 첫번째 기준: RTSD0108.MFP_YN='Y' 또는 OS_YN='Y' -> '2' 비대상
        IF (CUR.MFP_YN = 'Y') OR (CUR.OS_YN = 'Y' OR CUR.OS_DAY < TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMMDD') ) THEN
            v_Target_Cd := '2';
            
        -- 두번째 기준: RTSD0108.CNT_CD IN ('01','03') -> '2' 비대상
        ELSIF CUR.CNT_CD IN ('01','03') THEN
            v_Target_Cd := '2';
            
        -- 네번째 기준: 위 1. -2).점검일 체크 FUNCTION에서 가까운 점검일이 당월로 나오면 -> '1' 대상
        ELSIF (CUR.PLAN_DAY IS NOT NULL) AND (SUBSTR(CUR.PLAN_DAY,1,6) = v_Std_Ym) THEN
            v_Target_Cd := '1';
        ELSE

            BEGIN

                SELECT  COUNT(*)
                INTO    v_Cnt
                FROM    RTCS0004
                WHERE   STD_YM = TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMM')
                AND     ORD_NO = CUR.ORD_NO
                AND     EQU_NO = CUR.EQU_NO
                AND     TARGET_CD  = '1';
                --AND     SUBSTR(PLAN_DAY,1,6) = TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMM');

                SELECT  CHK_STAT
                INTO    v_Chk_Stat
                FROM    RTCS0005
                WHERE   STD_YM = TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD') -1,'YYYYMM')
                AND     ORD_NO = CUR.ORD_NO
                AND     EQU_NO = CUR.EQU_NO
                AND     ROWNUM <= 1;

                EXCEPTION
                  WHEN OTHERS THEN
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', '전원 점검대상 정보 획득 실패');
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', 'v_Std_Ym', v_Std_Ym);
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', 'CUR.ORD_NO', CUR.ORD_NO);
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', 'CUR.EQU_NO', CUR.EQU_NO);
            END;

            -- 다섯번째 기준: RTCS0005.STD_YM = 기준년월-1, ORD_NO:계약번호, EQU_NO: 설비번호로 데이터는
            --         존재하나 CHK_STAT <> '04'인 경우 -> '4' 대상(전월미처리)
            -- * 추가체크: RTCS0004.STD_YM = 기준년월-1,ORD_NO:계약번호,EQU_NO:설비번호,TARGET_CD = '1'
            --              SUBSTR(PLAN_DAY,1,6) = 기준년월 - 1개월 있어야 함
            -- 전월 점검대상월이었으나, 처리 안된 건은 다음달 한번 더 점검에 추가함
            -- (추가한 달에도 미처리시 다음달에는 추가안함)        
            IF (v_Cnt > 0) AND (v_Chk_Stat IS NOT NULL) AND (v_Chk_Stat <> '04') THEN
                v_Target_Cd := '4';
            
            -- 여섯번째 기준: 이외 전부 -> '2' 비대상
            ELSE
                v_Target_Cd := '2';
            END IF;

        END IF;
        
        -- 세번째 기준: RTRE0100.DELY_DAY='전월말일',ORD_NO: 계약번호가 있는 경우 -> '3' 채권
        -- 고객번호 전월말일 기준 연체 금액이 존재하면 조회대상 제외하기 위해 Target_Cd = 3으로 지정
        IF v_Target_Cd IN ('1','4') AND 0 < Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(CUR.CUST_NO, NULL, NULL) THEN
            v_Target_Cd := '3';    
        END IF;
        
        /* AD_ORDNO    조정관련 계약번호
        2본 계약이 한대의 차량에 2대 있다면 후속 계약의 점검주기에 맞춤
        첫번째 기준: 위 TARGET_CD = '1' 대상인 건 중
        계약번호 -> RTSD0108.CNT_CD = '02', CAR_NO 가져옴
        다른 계약 존재여부 확인
            : RTSD0108.ORD_NO <> 계약번호, CAR_NO = 계약건의 CAR_NO, CNT_CD = '02'
                           MFP_YN='N', OS_YN='N'인 건이 있고,
             장착일(RTSD0108.RROC_DAY), 장착시간(RTSD0108.REG_DT->시간)이 이 건보다 나중건 있으면
        -> AD_ORDNO에 해당 계약번호 넣고
           TARGET_CD : '1' 대상 -> '2' 비대상으로 변경
        */
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

        -- 관리계정 정보(RTCS0004) 생성
        Pkg_Rtcs0004.p_IUDRtcs0004 ('I', CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO,
                                    v_Target_Cd, CUR.CARMASTER_NU, CUR.C_MILEAGE, CUR.A_MILEAGE,
                                    CUR.PLAN_DAY, v_Ad_Ordno, v_Reg_Id, v_Success_Code,
                                    v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '관리계정 정보(RTCS0004) 생성 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        -- RTCS0004.TARGET_CD = '1', '3', '4'인 건만 RTCS0005 생성
        --IF v_Target_Cd IN ('1','4') THEN --2016-01-06
        IF v_Target_Cd IN ('1','3','4') THEN

            IF v_Target_Cd = '1' THEN
                v_Plan_Day := CUR.PLAN_DAY;
            ELSE
                IF TO_CHAR(LAST_DAY(TO_DATE(v_Std_Ym||'01','YYYYMMDD')),'YYYYMMDD') < v_Std_Ym||SUBSTR(CUR.PROC_DAY,7,2) THEN
                    v_Plan_Day := TO_CHAR(LAST_DAY(TO_DATE(v_Std_Ym||'01','YYYYMMDD')),'YYYYMMDD');
                ELSE
                    v_Plan_Day := v_Std_Ym||SUBSTR(CUR.PROC_DAY,7,2);
                END IF;
            END IF;

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

    IF v_exist = FALSE THEN
        v_Return_Message := '기준년월('||v_Std_Ym||')에 해당하는 점검대상 계약정보(RTSD0108) 데이터가 존재하지 않아 처리가 불가 합니다.!';
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate(2)', v_ErrorText, v_Return_Message);

  END p_Rtcs0004TargetAggregate;


  /*****************************************************************************
  -- 관리계정 정보 - 계약번호로 기준년월 기준 검검예정일 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0004PlanDay(
    v_Std_Ym         IN RTCS0004.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0004.ORD_NO%TYPE            /*계약번호            */
    ) RETURN VARCHAR IS
    v_Plan_Day RTCS0004.PLAN_DAY%TYPE DEFAULT NULL;     /*점검예정일자        */
  BEGIN

    SELECT  TO_CHAR(A.PLAN_DAY,'YYYYMMDD')
    INTO    v_Plan_Day
    FROM    (
            SELECT  A.*,
                    PLAN_DAY - STD_YMD DIFF
            FROM    (
                    SELECT  A.*,
                            CASE -- 종료일자를 넘기면 NULL 처리함
--                            WHEN A.OS_DAY < A.NEXT_DAY THEN NULL
                            WHEN A.OS_DAY < A.NEXT_DAY THEN --[20190319_01] 마지막회차 점검 배정
                                (CASE WHEN CNT = A.SERV_CNT0 THEN TO_DATE(SUBSTR(A.OS_DAY, 1, 6) || TO_CHAR(A.NEXT_DAY, 'DD'),  'YYYYMMDD')   ELSE NULL END)
                            ELSE TO_DATE(TO_CHAR(A.NEXT_DAY,'YYYYMMDD'),'YYYYMMDD') END PLAN_DAY,
--                            ELSE TO_DATE(TO_CHAR(NVL(A.NEXT_DAY,'99991231'),'YYYYMMDD'),'YYYYMMDD') END PLAN_DAY,
                            TO_DATE(TO_CHAR(SYSDATE,'YYYYMMDD'),'YYYYMMDD') NOW,
                            TO_DATE(v_Std_Ym||'01','YYYYMMDD') STD_YMD
                    FROM    (
                            SELECT  A.*,
                                    (MON*(LEVEL)) AMON,
                                    ADD_MONTHS(A.PROC_DAY,(MON*(LEVEL))) NEXT_DAY,
                                    LEVEL CNT
                            FROM    (
                                    SELECT  A.ORD_NO,     /*계약번호         */
                                            A.PROC_DAY,   /*장착일자         */
                                            A.OS_DAY,     /*종료일자         */
                                            A.PERIOD_CD,  /*기간코드         */
                                            B.SERV_CNT0,  /*서비스횟수(최초) */
                                            --TO_NUMBER(A.PERIOD_CD)/B.SERV_CNT0 MON
                                            DECODE(B.SERV_CNT0,0, NULL, TO_NUMBER(A.PERIOD_CD)/B.SERV_CNT0) MON
                                    FROM    RTSD0108 A,
                                            RTSD0013 B
                                    WHERE   A.ORD_NO  = B.ORD_NO
                                    AND     B.PRS_DCD = 'B00003'
                                    AND     A.ORD_NO  = v_Ord_No
                                    ) A
                            CONNECT BY LEVEL <= A.SERV_CNT0
                            ) A
                    ) A
            WHERE   PLAN_DAY - STD_YMD >= 0
            ORDER  BY PLAN_DAY - STD_YMD ASC
            ) A
    WHERE   ROWNUM <= 1;

    RETURN v_Plan_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0004PlanDay;


  /*****************************************************************************
  -- 점검대상 재집계를 위한 기존 집계내역 일괄 삭제처리
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAllDelete (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Reg_Id         IN RTCS0004.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Rcnt NUMBER DEFAULT 0;

    CUR  SYS_REFCURSOR;
  BEGIN

    IF 0 != ISDATE(TRIM(v_Std_Ym)) THEN
        v_Return_Message := '기준년월('||v_Std_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAllDelete(1)', '점검대상 재집계를 위한 기존 집계내역 일괄 삭제처리 ', '처리자 사번', v_Reg_Id);

    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAllDelete(1)', 'START', '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');

    -- 기준년월 자료 중 처리완료나 미처리항목 저장 등 수정내역이 있는 경우 처리불가
    SELECT  COUNT(*)
    INTO    v_Rcnt
    FROM    RTCS0005
    WHERE   STD_YM = v_Std_Ym
    AND     (CHK_STAT <> '01' OR NP_DESC IS NOT NULL);

    IF 0 < v_Rcnt THEN
        v_Return_Message := '방문점검 대상 집계 후 변경내역이 있으므로 삭제 불가능합니다. (RTCS0005)';
        RAISE e_Error;
    END IF;


    -- 기준년월 자료 중 고객정보 변경이 1건이라도 있는 경우
    SELECT  COUNT(*)
    INTO    v_Rcnt
    FROM    RTCS0006
    WHERE   STD_YM = v_Std_Ym
    AND     SEQ <> 1;

    IF 0 < v_Rcnt THEN
        v_Return_Message := '방문점검 대상 집계 후 변경내역이 있으므로 삭제 불가능합니다. (RTCS0006)';
        RAISE e_Error;
    END IF;

    -- 관리계정 정보 DELETE 처리
    DELETE
    FROM    RTCS0004
    WHERE   STD_YM = v_Std_Ym;

    -- 방문점검 작업목록 DELETE 처리
    DELETE
    FROM    RTCS0005
    WHERE   STD_YM = v_Std_Ym;

    -- 방문점검 작업정보 변경 DELETE 처리
    DELETE
    FROM    RTCS0006
    WHERE   STD_YM = v_Std_Ym;

    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAllDelete(1)', 'END', '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다.';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAllDelete(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAllDelete(2)', v_ErrorText, v_Return_Message);

  END p_Rtcs0004TargetAllDelete;
  
  /*****************************************************************************
  -- 점검대상 집계 (M-1월 20일 수행)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 신규개발      
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob1(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    v_Std_Ym RTCS0004.STD_YM%TYPE DEFAULT TO_CHAR(ADD_MONTHS(SYSDATE,1),'YYYYMM'); /*기준년월 (현재월+1개월) */
    v_Reg_Id RTCS0004.REG_ID%TYPE DEFAULT 'admin';                                 /*등록자 ID               */
    
  BEGIN

    p_Rtcs0004TargetAggregateNew(v_Std_Ym, 'A', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN        
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(1)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(1)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(1)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(1)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(1)', 'v_ErrorText',      v_ErrorText);
    ELSE
        COMMIT;        
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(2)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(2)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(2)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(2)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob1(2)', 'v_ErrorText',      v_ErrorText);
    END IF;

  END p_Rtcs0004TargetAggregateJob1;
  
  /*****************************************************************************
  -- 점검대상 집계 (M월 1일 수행)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 신규개발      
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob2 (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    v_Std_Ym RTCS0004.STD_YM%TYPE DEFAULT TO_CHAR(SYSDATE,'YYYYMM');    /*기준년월  */
    v_Reg_Id RTCS0004.REG_ID%TYPE DEFAULT 'admin';                      /*등록자 ID */
    
  BEGIN

    p_Rtcs0004TargetAggregateNew(v_Std_Ym, 'B', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(1)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(1)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(1)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(1)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(1)', 'v_ErrorText',      v_ErrorText);
    ELSE
        COMMIT;
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(2)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(2)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(2)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(2)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob2(2)', 'v_ErrorText',      v_ErrorText);
    END IF;

  END p_Rtcs0004TargetAggregateJob2;
  
  /*****************************************************************************
  -- 점검대상 집계2+2 (M-1월 20일 수행)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 신규개발      
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob3 (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    v_Std_Ym RTCS0004.STD_YM%TYPE DEFAULT TO_CHAR(SYSDATE,'YYYYMM');    /*기준년월  */
    v_Reg_Id RTCS0004.REG_ID%TYPE DEFAULT 'admin';                      /*등록자 ID */
    
  BEGIN

    p_Rtcs0004TargetAggregate2By2(v_Std_Ym, 'A', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(1)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(1)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(1)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(1)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(1)', 'v_ErrorText',      v_ErrorText);
    ELSE
        COMMIT;
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(2)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(2)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(2)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(2)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob3(2)', 'v_ErrorText',      v_ErrorText);
    END IF;

  END p_Rtcs0004TargetAggregateJob3;
  
  /*****************************************************************************
  -- 점검대상 집계2+2 (M월 1일 수행)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-17  wjim             [20170417_01] 신규개발      
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateJob4(
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    v_Std_Ym RTCS0004.STD_YM%TYPE DEFAULT TO_CHAR(SYSDATE,'YYYYMM'); /*기준년월 (현재월+1개월) */
    v_Reg_Id RTCS0004.REG_ID%TYPE DEFAULT 'admin';                                 /*등록자 ID               */
    
  BEGIN

    p_Rtcs0004TargetAggregate2By2(v_Std_Ym, 'B', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN        
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(1)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(1)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(1)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(1)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(1)', 'v_ErrorText',      v_ErrorText);
    ELSE
        COMMIT;        
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(2)', 'v_Std_Ym',         v_Std_Ym);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(2)', 'v_Reg_Id',         v_Reg_Id);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(2)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(2)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateJob4(2)', 'v_ErrorText',      v_ErrorText);
    END IF;

  END p_Rtcs0004TargetAggregateJob4;
  
  /*****************************************************************************
  -- 점검대상 집계 Ver.2
  
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.1        2017-04-17  wjim             [20170417_01] 추가
                                          - 1개월에 2회 수행 (M-1월 20일, M월 1일)
  1.2        2017-04-24  wjim             [20170424_01] 수행구분 추가           
                                          - A : M-1월 20일 수행 (전월미처리 제외)
                                          - B : M월 1일 수행 (전월미처리 포함)
  1.3        2017-04-26  wjim             [20170426_01] 전월미처리 배정정보 변경
                                          - 다음 항목은 고객정보가 아닌 전월 마지막 배정정보 승계
                                          - 주소, 연락처 
  1.4        2017-07-26  wjim             [20170726_01] 배정 시 점검거부 고려
  1.5        2018-06-04  wjim             [20180604_01] 점검거부 배정기준 변경
                                          - 점검주기에만 거부 지속여부 컨택하기 위함
                                          - 기존 : 매월 '대상구분'을 '점검거부'로 배정
                                          - 변경 : 점검대상월에만 '점검거부'로 배정하고 나머지월은 '미대상'으로 배정  
  1.6        2019-10-31  kstka            [20191031_01] 잔여서비스 여부 확인  
  1.11       2019-12-02  wjim             [20191202_01] 시군구별 담당 로디안 조회기준 변경
                                          - 해당 지역에 2명 이상의 로디안이 존재하는 경우 사번 내림차순으로 1명 선정  
                                          - 운영테스트(1)가 아닌 로디안을 선정하기 위함                            
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregateNew (
      v_Std_Ym         IN RTCS0004.STD_YM%TYPE         /*기준년월              */
    , v_Mode           IN CHAR                         /*수행구분              */
    , v_Reg_Id         IN RTCS0004.REG_ID%TYPE         /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
   
    v_Last_Day    RTCS0004.PLAN_DAY%TYPE := TO_CHAR(LAST_DAY(TO_DATE(v_Std_Ym||'01','YYYYMMDD')),'YYYYMMDD'); /*기준년월의 마지막일 */
    v_Pre_Ym      RTCS0004.STD_YM%TYPE   := TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD')-1, 'YYYYMM');          /*기준년월 이전월     */
    v_Pre_Lstday  RTCS0004.PLAN_DAY%TYPE := TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD')-1, 'YYYYMMDD');        /*전월 마지막일자     */

    v_Ord_No      RTSD0108.ORD_NO%TYPE       DEFAULT NULL;  /*계약번호            */
    v_Target_Cd   RTCS0004.TARGET_CD%TYPE    DEFAULT NULL;  /*대상구분            */
    v_Plan_Day    RTCS0004.PLAN_DAY%TYPE     DEFAULT NULL;  /*점검예정일자        */    
    v_Ad_Ordno    RTCS0004.AD_ORDNO%TYPE     DEFAULT NULL;  /*조정관련 계약번호   */
    v_Chk_Stat    RTCS0005.CHK_STAT%TYPE     DEFAULT NULL;  /*작업상태            */
    v_Ob_St       RTCS0005.OB_ST%TYPE        DEFAULT NULL;  /*컨택상태            */
    v_Job_Seq     RTCS0005.JOB_SEQ%TYPE      DEFAULT NULL;  /*작업순번            */
    v_Seq         RTCS0006.SEQ%TYPE          DEFAULT NULL;  /*순번                */
    v_Mob_No      RTCS0006.MOB_NO%TYPE       DEFAULT NULL; 
    v_Tel_No      RTCS0006.TEL_NO%TYPE       DEFAULT NULL;
    v_Bld_Mng_No  RTCS0006.BLD_MNG_NO%TYPE   DEFAULT NULL;
    v_Poscd       RTCS0006.POSCD%TYPE        DEFAULT NULL;
    v_Addr1       RTCS0006.ADDR1%TYPE        DEFAULT NULL;
    v_Addr2       RTCS0006.ADDR2%TYPE        DEFAULT NULL;
    v_Carmster_Nu RTCS0002.CARMASTER_NU%TYPE DEFAULT NULL;  /*담당 로디안 사번    */
    v_dely_day    RTRE0100.DELY_DAY%TYPE     DEFAULT NULL;  /*연체집계일자        */
    
    r_Pre_CS0006  RTCS0006%ROWTYPE;  
    
    v_Cnt         NUMBER  DEFAULT 0;
    v_Exe_Cnt     NUMBER  DEFAULT 0;
    
    e_Error       EXCEPTION;
    
    -- 점검대상 모집단
    CURSOR  CUR_RTCS0004 IS
    SELECT  v_Std_Ym    AS STD_YM
         ,  A.ORD_NO                    /*계약번호            */
         ,  A.CUST_NO                   /*고객번호            */
         ,  A.C_MILEAGE AS A_MILEAGE    /*주행거리(점검)      */
         ,  A.MFP_YN                    /*중도완납여부        */
         ,  A.OS_YN                     /*소유권이전여부      */
         ,  A.OS_DAY                    /*소유권이전일자      */
         ,  A.CNT_CD                    /*타이어본수          */
         ,  A.REG_DT                    /*등록일              */
         ,  A.CAR_NO                    /*차량번호            */
         ,  A.PROC_DAY                  /*장착일자            */
         ,  B.C_MILEAGE                 /*주행거리(장착)      */
         ,  C.MOB_NO                    /*휴대폰번호          */
         ,  C.TEL_NO                    /*전화번호            */
         ,  C.BLD_MNG_NO                /*고객주소-우편번호PK(*/
         ,  C.POS_CD                    /*고객주소-우편번호   */
         ,  C.ADDR1                     /*고객주소-주소       */
         ,  C.ADDR2                     /*고객주소-상세주소   */
         ,  E.EQU_NO                    /*설비번호            */
      FROM  RTSD0108 A
         ,  RTSD0104 B
         ,  RTSD0100 C
         ,  RTCS0001 E
     WHERE  A.PROC_DAY <= v_Pre_Lstday
       AND  (
                A.MFP_YN  = 'N' 
                OR 
                (A.MFP_YN = 'Y' AND A.CANC_DAY > v_Pre_Lstday)
            )
       AND  A.OS_YN   = 'N' AND (A.OS_DAY >= v_Pre_Lstday)
       AND  A.ORD_NO  = B.ORD_NO
       AND  A.CUST_NO = C.CUST_NO
       AND  A.ORD_NO  = E.ORD_NO
       AND  NOT EXISTS (
                SELECT  1
                  FROM  RTCS0004 X
                 WHERE  X.STD_YM = v_Std_Ym
                   AND  X.ORD_NO = A.ORD_NO
                   AND  X.EQU_NO = E.EQU_NO
            )   /* 이미 저장된 건은 제외 */
       AND NOT EXISTS (
               SELECT 1 
                 FROM RTSD0013 
               WHERE ORD_NO = A.ORD_NO 
                  AND PRS_DCD = 'B00003' 
                  AND SERV_CNTR = 0)    --[20191031_01] 잔여서비스 여부 확인
--       AND  A.ORD_NO IN ('D19000195047','D19000191444')
       MINUS
       SELECT   STD_YM
             ,  A.ORD_NO                    /*계약번호            */
             ,  CUST_NO                   /*고객번호            */
             ,  A_MILEAGE                 /*주행거리(점검)      */
             ,  MFP_YN                    /*중도완납여부        */
             ,  OS_YN                     /*소유권이전여부      */
             ,  OS_DAY                    /*소유권이전일자      */
             ,  A.CNT_CD                    /*타이어본수          */
             ,  A.REG_DT                    /*등록일              */
             ,  CAR_NO                    /*차량번호            */
             ,  A.PROC_DAY                  /*장착일자            */
             ,  C_MILEAGE                 /*주행거리(장착)      */
             ,  MOB_NO                    /*휴대폰번호          */
             ,  TEL_NO                    /*전화번호            */
             ,  BLD_MNG_NO                /*고객주소-우편번호PK(*/
             ,  POS_CD                    /*고객주소-우편번호   */
             ,  ADDR1                     /*고객주소-주소       */
             ,  ADDR2                     /*고객주소-상세주소   */
             ,  EQU_NO  FROM (
            SELECT  v_Std_Ym    AS STD_YM
             ,  A.ORD_NO                    /*계약번호            */
             ,  A.CUST_NO                   /*고객번호            */
             ,  A.C_MILEAGE AS A_MILEAGE    /*주행거리(점검)      */
             ,  A.MFP_YN                    /*중도완납여부        */
             ,  A.OS_YN                     /*소유권이전여부      */
             ,  A.OS_DAY                    /*소유권이전일자      */
             ,  A.CNT_CD                    /*타이어본수          */
             ,  A.REG_DT                    /*등록일              */
             ,  A.CAR_NO                    /*차량번호            */
             ,  A.PROC_DAY                  /*장착일자            */
             ,  B.C_MILEAGE                 /*주행거리(장착)      */
             ,  C.MOB_NO                    /*휴대폰번호          */
             ,  C.TEL_NO                    /*전화번호            */
             ,  C.BLD_MNG_NO                /*고객주소-우편번호PK(*/
             ,  C.POS_CD                    /*고객주소-우편번호   */
             ,  C.ADDR1                     /*고객주소-주소       */
             ,  C.ADDR2                     /*고객주소-상세주소   */
             ,  E.EQU_NO                    /*설비번호            */
             ,  (SELECT  ORD_NO
                      FROM  RTSD0108
                     WHERE  CAR_NO = A.CAR_NO
                       AND  ORD_NO <> A.ORD_NO
                       AND  CNT_CD = A.CNT_CD
                       AND  PERIOD_CD = A.PERIOD_CD
                       AND  REG_ID = A.REG_ID
                       AND  SUBSTR(PROC_DAY, 1, 6) = SUBSTR(A.PROC_DAY, 1, 6)
                       AND  CNT_CD = '02'
                       AND  (
                                MFP_YN  = 'N' 
                                OR 
                                (MFP_YN = 'Y' AND CANC_DAY > v_Pre_Lstday)
                            )
                       AND  OS_YN   = 'N' AND (OS_DAY >= v_Pre_Lstday)
                       --AND  PROC_DAY||TO_CHAR(REG_DT,'HH24MISS') < A.PROC_DAY||TO_CHAR(A.REG_DT,'HH24MISS')
                       --AND  ROWNUM = 1
                       ) "2BY2"          
          FROM  RTSD0108 A
             ,  RTSD0104 B
             ,  RTSD0100 C
             ,  RTCS0001 E
             ,  RTSD0013 F
         WHERE  A.PROC_DAY <= v_Pre_Lstday
           AND  (
                    A.MFP_YN  = 'N' 
                    OR 
                    (A.MFP_YN = 'Y' AND A.CANC_DAY > v_Pre_Lstday)
                )
           AND  A.OS_YN   = 'N' AND (A.OS_DAY >= v_Pre_Lstday)
           AND  A.ORD_NO  = B.ORD_NO
           AND  A.CUST_NO = C.CUST_NO
           AND  A.ORD_NO  = E.ORD_NO
           AND  A.ORD_NO  = F.ORD_NO
           AND  F.PRS_DCD = 'B00003'
--           AND  A.ORD_NO = 'M18000140810'
        ) A, RTSD0013 B
        WHERE "2BY2" IS NOT NULL
        AND A."2BY2" = B.ORD_NO
        AND B.PRS_DCD = 'B00003'
        AND B.SERV_CNTR > 0 --[20191031_01] 잔여서비스 여부 확인
    ;

  BEGIN
  
    -- 최근 연체집계일자 조회
    SELECT  MAX(DELY_DAY)
      INTO  v_dely_day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';
    
    FOR CUR IN CUR_RTCS0004 LOOP
        EXIT WHEN CUR_RTCS0004%NOTFOUND;
        
        v_Cnt      := 0;
        v_Chk_Stat := NULL;
        v_Ad_Ordno := NULL;
        v_Ord_No   := NULL;
        
        v_Exe_Cnt  := v_Exe_Cnt + 1;
        
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateNew(1)', '['||v_Exe_Cnt||'] '||v_Std_Ym||'>'||CUR.ORD_NO);
        
        -- 도래한 점검예정일자 조회
        SELECT  Pkg_Rtcs0004.f_sRtcs0004PlanDay(v_Std_Ym, CUR.ORD_NO)
          INTO  v_Plan_Day
          FROM  DUAL;         

        -- 도래한 점검예정일이 기준년월에 포함되면 '대상'으로 선정
        IF (v_Plan_Day IS NOT NULL) AND (SUBSTR(v_Plan_Day,1,6) = v_Std_Ym) THEN
            v_Target_Cd := '1';
        
        ELSE
            -- 전월 대상건이었는지 확인
            SELECT  COUNT(*)
              INTO  v_Cnt
              FROM  RTCS0004
             WHERE  STD_YM = v_Pre_Ym
               AND  ORD_NO = CUR.ORD_NO
               AND  EQU_NO = CUR.EQU_NO
               AND  TARGET_CD  = '1';
               
            IF v_Cnt > 0 THEN
                -- 전월 마지막 작업상태 및 컨택상태 확인               
                SELECT  CHK_STAT  , OB_ST  , JOB_SEQ
                  INTO  v_Chk_Stat, v_Ob_St, v_Job_Seq
                  FROM  RTCS0005
                 WHERE  STD_YM  = v_Pre_Ym
                   AND  ORD_NO  = CUR.ORD_NO
                   AND  EQU_NO  = CUR.EQU_NO
                   AND  JOB_SEQ = (
                                    SELECT  NVL(MAX(JOB_SEQ), 0) 
                                      FROM  RTCS0005 
                                     WHERE  STD_YM = v_Pre_Ym 
                                       AND  ORD_NO = CUR.ORD_NO 
                                       AND  EQU_NO = CUR.EQU_NO
                                  );       
            ELSE
                v_Chk_Stat := NULL;
                v_Ob_St    := NULL;
                
            END IF;               

            /*------------------------
             * '대상(전월미처리)' 기준
             *------------------------
             * - 전월 대상건 중 처리상태가 '점검완료'되지 않고 동시에 컨택상태가 '취소'가 아닌 건
             */             
            IF (v_Cnt > 0) AND (v_Chk_Stat IS NOT NULL) AND (v_Chk_Stat <> '04') AND (v_Chk_Stat IS NOT NULL) AND (v_Ob_St <> '05') THEN
                v_Target_Cd := '4';
            ELSE
                v_Target_Cd := '2';
            END IF;
           
        END IF;
                
        -- 고객번호 마지막 연체집계 기준 연체금액이 존재하면 조회대상 제외하기 위해 Target_Cd = 3으로 지정
        IF v_Target_Cd IN ('1','4') AND Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(CUR.CUST_NO, NULL, v_dely_day) > 0 THEN            
            v_Target_Cd := '3';    
        END IF;
        
        --점검거부 상태인지 확인 [20170726_01]
        SELECT  COUNT(*)
          INTO  v_Cnt
          FROM  RTCS0013
         WHERE  ORD_NO = CUR.ORD_NO 
           AND  EQU_NO = CUR.EQU_NO
           AND  DENY_YN = 'Y'
           AND  DENY_STD_YM <= v_Std_Ym;
        
        --거부상태인 경우 Target=5 로 지정 [20170726_01]
        IF v_Cnt > 0 THEN
            v_Target_Cd := '5';
        END IF;

        /*---------------------------------- 
         * 조정관련 계약번호(AD_ORDNO) 조회
         *----------------------------------
         * - 2본 계약이 동일차량에 2개 있다면 후속계약의 점검주기에 맞춤
         * - 차량번호가 같은 경우 동일차량으로 인식
         * - 후속계약 : 장착일시가 늦은 계약        
         * - 조정관련 계약이 존재하는 경우 : AD_ORDNO에 해당 계약번호 입력, ARGET_CD : '1' 대상 -> '2' 비대상으로 변경
         */
--        IF v_Target_Cd = '1' AND CUR.CNT_CD = '02' THEN
--            BEGIN
--            
--                SELECT  ORD_NO
--                  INTO  v_Ord_No
--                  FROM  RTSD0108
--                 WHERE  CAR_NO = CUR.CAR_NO
--                   AND  ORD_NO <> CUR.ORD_NO
--                   AND  CNT_CD = '02'
--                   AND  (
--                            MFP_YN  = 'N' 
--                            OR 
--                            (MFP_YN = 'Y' AND CANC_DAY > v_Pre_Lstday)
--                        )
--                   AND  OS_YN   = 'N' AND (OS_DAY >= v_Pre_Lstday)
--                   AND  PROC_DAY||TO_CHAR(REG_DT,'HH24MISS') < CUR.PROC_DAY||TO_CHAR(CUR.REG_DT,'HH24MISS');
--               
--            EXCEPTION
--                WHEN NO_DATA_FOUND THEN
--                    v_Ord_No := NULL;
--                WHEN OTHERS THEN
--                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateNew(2)', '조정관련 계약번호 획득 실패');
--            END;               
--               
--            IF TRIM(v_Ord_No) IS NOT NULL THEN
--                v_Ad_Ordno := v_Ord_No;
--                v_Target_Cd := '2';
--            ELSE
--                v_Ad_Ordno := NULL;
--            END IF;
--                           
--        END IF;
        
        /*------------------------------------------
         * 배정구분 [20170424_01]
         *------------------------------------------
         * - M-1월 수행 시 : 전월미처리건 배정 제외
         * - M월 수행 시 : 전월미처리건 배정 포함
         */
        IF (v_Mode = 'A' AND v_Target_Cd NOT IN ('4')) OR v_Mode = 'B' THEN
        
            -- 전월미처리의 경우
            IF v_Target_Cd IN ('4') THEN
                -- 고객정보가 아닌 전월 배정 마지막 정보를 일부 승계 
                SELECT  *
                  INTO  r_Pre_CS0006
                  FROM  RTCS0006
                 WHERE  STD_YM  = v_Pre_Ym
                   AND  ORD_NO  = CUR.ORD_NO
                   AND  EQU_NO  = CUR.EQU_NO
                   AND  JOB_SEQ = v_Job_Seq
                   AND  SEQ = (
                            SELECT  NVL(MAX(SEQ), 0)
                              FROM  RTCS0006
                             WHERE  STD_YM  = v_Pre_Ym
                               AND  ORD_NO  = CUR.ORD_NO
                               AND  EQU_NO  = CUR.EQU_NO
                               AND  JOB_SEQ = v_Job_Seq
                        )  
                ;
                                
                v_Mob_No      := r_Pre_CS0006.MOB_NO; 
                v_Tel_No      := r_Pre_CS0006.TEL_NO;
                v_Bld_Mng_No  := r_Pre_CS0006.BLD_MNG_NO;
                v_Poscd       := r_Pre_CS0006.POSCD;
                v_Addr1       := r_Pre_CS0006.ADDR1;
                v_Addr2       := r_Pre_CS0006.ADDR2;
            
            -- 전월미처리가 아닌 경우
            ELSE
                -- 고객정보를 배정정보로 사용
                v_Mob_No      := CUR.MOB_NO; 
                v_Tel_No      := CUR.TEL_NO;
                v_Bld_Mng_No  := CUR.BLD_MNG_NO;
                v_Poscd       := CUR.POS_CD;
                v_Addr1       := CUR.ADDR1;
                v_Addr2       := CUR.ADDR2;
                
            END IF;                
                            
            /*--------------------------------------------------
             * 담당 로디안 조회
             *--------------------------------------------------
             * 1) 건물관리번호로 조회
             *   - 신규/변경 주소의 경우 조회 불가
             * 2) 주소1의 '광역시/도' 또는 '시/군/구'로 조회
             * 3) 특정 로디안 강제배정
             */         
            -- 1) 건물관리번호로 담당 로디안 조회
            --  - Pkg_Rtcs0006.p_sRtcs0006Mr 와 동일한 로직 사용
            BEGIN         
                SELECT  A1.CARMASTER_NU
                  INTO  v_Carmster_Nu
                  FROM  RTSD0010 A1
                 WHERE  A1.BLD_MNG_NO = v_Bld_Mng_No;

            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    v_Carmster_Nu := NULL;
                WHEN OTHERS THEN
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateNew(3)', '건물관리번호로 담당 로디안 조회 실패');
            END;         

            -- 2) 주소1로 담당 로디안 조회   
            --  - Pkg_Rtcs0006.p_sRtcs0006MrAddr1 와 동일한 로직 사용
            --  - (1) '세종특별자치시'의 경우 시군구가 ' '으로 표기됨
            --  - (2) 하나의 시군구에 2명 이상의 로디안이 배정된 경우 임의로 1명만 선정 > 사번 내림차순으로 1명 선정 [20191202_01] 
            IF v_Carmster_Nu IS NULL THEN
                
                BEGIN         
                    SELECT  MAX(A1.CARMASTER_NU)
                      INTO  v_Carmster_Nu
                      FROM  RTSD0010 A1
                     WHERE  A1.DO_NM        = SUBSTR(v_Addr1,1,INSTR(v_Addr1,' ',1,1)-1)
                       AND  A1.CT_NM        = NVL(SUBSTR(v_Addr1,INSTR(v_Addr1,' ',1,1)+1,INSTR(v_Addr1,' ',1,2)-INSTR(v_Addr1,' ',1,1)-1),' ') --(1)
                       AND  A1.CARMASTER_NU IS NOT NULL
                       AND  A1.USE_YN       = 'Y';
--                       AND  ROWNUM = 1;  --(2)

                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        v_Carmster_Nu := NULL;
                    WHEN OTHERS THEN
                        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateNew(3)', '건물관리번호로 담당 로디안 조회 실패');
                END;  
                
            END IF;
                
            -- 3) 건물관리번호, 주소1 로 담당 로디안 조회 불가 시 강제 지정
            --  - 1=운영테스트
            IF v_Carmster_Nu IS NULL THEN
                v_Carmster_Nu := '1';
            END IF;
            
            -- 이관 등으로 해당월에 이미 방문점검 작업정보가 존재하는 경우 Target_Cd = 5
            -- - 건당 이관기능 개발 이후 주석 풀 것
--            IF Pkg_Rtcs0005.f_sRtcs0005Count(v_Std_Ym, CUR.ORD_NO, CUR.EQU_NO, 1) > 0 THEN
--                v_Target_Cd := '5';
--            END IF;
                     
            -- 관리계정 정보(RTCS0004) 생성
            Pkg_Rtcs0004.p_IUDRtcs0004 ('I', CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO,
                                        v_Target_Cd, v_Carmster_Nu, CUR.C_MILEAGE, CUR.A_MILEAGE,
                                        v_Plan_Day, v_Ad_Ordno, v_Reg_Id, v_Success_Code,
                                        v_Return_Message, v_ErrorText);

            IF 0 != v_Success_Code THEN
                v_Return_Message := '관리계정 정보(RTCS0004) 생성 실패!!!'||'-'||v_Return_Message;
                v_ErrorText      := v_ErrorText;
                RAISE e_Error;
            END IF;

            /*-----------------------------
             * 방문점검 관련 작업정보 생성
             *-----------------------------
             * 점검 미대상인 경우를 제외하고 생성
             */
            IF v_Target_Cd NOT IN ('2') THEN

                /*-------------------
                 * 점검예정일자 변경 
                 *-------------------
                 * '대상'인 경우는 점검예정일자가 당월이므로 관계가 없지만
                 * 나머지 경우에는 이전월의 기존 점검예정일자가 당월에 없을 수 있음
                 * 예를 들어 기존 점검예정일자가 3/31 인 경우 4월에는 31일이 없으므로 4/30일이 되어야 함
                 * 장착일자의 DD를 사용하는 것은 어짜피 점검예정일자가 장착일자의 DD를 사용하기 때문
                 */
                IF v_Target_Cd NOT IN ('1') THEN                    
                    IF  v_Std_Ym||SUBSTR(CUR.PROC_DAY,7,2) > v_Last_Day THEN
                        v_Plan_Day := v_Last_Day;
                    ELSE
                        v_Plan_Day := v_Std_Ym||SUBSTR(CUR.PROC_DAY,7,2);
                    END IF;                    
                END IF;
                
                /*-----------------------------
                 * 처리상태 결정 [20170726_01]
                 *-----------------------------
                 * '점검거부'인 경우 처리상태 역시 '점검거부'
                 * 나머지 경우에는 모두 '초기배정'
                 */
                IF v_Target_Cd IN ('5') THEN
                    v_Chk_Stat := '05';
                ELSE
                    v_Chk_Stat := '01';
                END IF;
                
                -- 방문점검 작업목록(RTCS0005) 생성
                Pkg_Rtcs0005.p_IUDRtcs0005 ('I',CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO,
                                            v_Job_Seq, v_Target_Cd, v_Carmster_Nu, NULL
                                            ,'N', NULL, v_Plan_Day, '000000',
                                            v_Plan_Day, '000000', NULL, NULL,
                                            v_Chk_Stat, NULL, NULL, v_Reg_Id,
                                            v_Success_Code, v_Return_Message, v_ErrorText);
                                            
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '방문점검 작업목록(RTCS0005) 생성 실패!!!'||'-'||v_Return_Message;
                    v_ErrorText      := v_ErrorText;
                    RAISE e_Error;
                END IF;                                        
                                            
                -- 방문점검 작업정보 변경key값(SEQ) 조회
                v_Seq := Pkg_Rtcs0006.f_sRtcs0006Seq(CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO, v_Job_Seq);

                -- 방문점검 작업정보 변경(RTCS0006) 생성
                IF 0 != Pkg_Rtcs0006.f_InsertRtcs0006 (CUR.STD_YM, CUR.ORD_NO, CUR.EQU_NO,
                                                       v_Job_Seq, v_Seq, v_Mob_No, v_Tel_No,
                                                       v_Bld_Mng_No, v_Poscd, v_Addr1, v_Addr2,
                                                       v_Plan_Day, '000000', v_Carmster_Nu, NULL,
                                                       NULL, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '방문점검 작업정보 변경(RTCS0006) 생성 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText      := v_ErrorText;
                    RAISE e_Error;
                END IF;

            END IF;
            
        END IF;

    END LOOP;

    IF CUR_RTCS0004%ISOPEN THEN
        CLOSE CUR_RTCS0004;
    END IF;

    IF v_Exe_Cnt = 0 THEN
        v_Return_Message := '기준년월('||v_Std_Ym||')에 해당하는 점검대상 데이터가 존재하지 않아 처리가 불가 합니다.!';
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateNew(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        v_Success_code   := -1;
        v_Return_Message := NVL(TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateNew(2)', v_ErrorText, v_Return_Message);

  END p_Rtcs0004TargetAggregateNew;

  /*****************************************************************************
  -- 점검대상 집계 Ver.2 2By2
  
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.1        2019-03-22  kstka             [20190322_01] 추가
  1.2        2019-07-11  kstka             [20190711_01] 쿼리 튜닝
  1.3        2019-10-31  kstka             [20191031_01] 잔여서비스 여부 확인   
  1.11       2019-12-02  wjim              [20191202_01] 시군구별 담당 로디안 조회기준 변경
                                           - 해당 지역에 2명 이상의 로디안이 존재하는 경우 사번 내림차순으로 1명 선정  
                                           - 운영테스트(1)가 아닌 로디안을 선정하기 위함 
  1.12       2019-12-31  kstka            [2019-00370394] 2+2 방문점검 중복배정 방지 추가                             
  *****************************************************************************/
  PROCEDURE p_Rtcs0004TargetAggregate2By2 (
      v_Std_Ym         IN RTCS0004.STD_YM%TYPE         /*기준년월              */
    , v_Mode           IN CHAR                         /*수행구분              */
    , v_Reg_Id         IN RTCS0004.REG_ID%TYPE         /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
   
    v_Last_Day    RTCS0004.PLAN_DAY%TYPE := TO_CHAR(LAST_DAY(TO_DATE(v_Std_Ym||'01','YYYYMMDD')),'YYYYMMDD'); /*기준년월의 마지막일 */
    v_Pre_Ym      RTCS0004.STD_YM%TYPE   := TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD')-1, 'YYYYMM');          /*기준년월 이전월     */
    v_Pre_Lstday  RTCS0004.PLAN_DAY%TYPE := TO_CHAR(TO_DATE(v_Std_Ym||'01','YYYYMMDD')-1, 'YYYYMMDD');        /*전월 마지막일자     */

    v_Ord_No      RTSD0108.ORD_NO%TYPE       DEFAULT NULL;  /*계약번호            */
    v_Equ_No      RTCS0001.EQU_NO%TYPE       DEFAULT NULL;  /*설비번호            */
    v_Target_Cd   RTCS0004.TARGET_CD%TYPE    DEFAULT NULL;  /*대상구분            */
    v_Plan_Day    RTCS0004.PLAN_DAY%TYPE     DEFAULT NULL;  /*점검예정일자        */    
    v_Ad_Ordno    RTCS0004.AD_ORDNO%TYPE     DEFAULT NULL;  /*조정관련 계약번호   */
    v_Chk_Stat    RTCS0005.CHK_STAT%TYPE     DEFAULT NULL;  /*작업상태            */
    v_Ob_St       RTCS0005.OB_ST%TYPE        DEFAULT NULL;  /*컨택상태            */
    v_Job_Seq     RTCS0005.JOB_SEQ%TYPE      DEFAULT NULL;  /*작업순번            */
    v_Seq         RTCS0006.SEQ%TYPE          DEFAULT NULL;  /*순번                */
    v_Mob_No      RTCS0006.MOB_NO%TYPE       DEFAULT NULL; 
    v_Tel_No      RTCS0006.TEL_NO%TYPE       DEFAULT NULL;
    v_Bld_Mng_No  RTCS0006.BLD_MNG_NO%TYPE   DEFAULT NULL;
    v_Poscd       RTCS0006.POSCD%TYPE        DEFAULT NULL;
    v_Addr1       RTCS0006.ADDR1%TYPE        DEFAULT NULL;
    v_Addr2       RTCS0006.ADDR2%TYPE        DEFAULT NULL;
    v_Carmster_Nu RTCS0002.CARMASTER_NU%TYPE DEFAULT NULL;  /*담당 로디안 사번    */
    v_dely_day    RTRE0100.DELY_DAY%TYPE     DEFAULT NULL;  /*연체집계일자        */
    
    r_Pre_CS0006  RTCS0006%ROWTYPE;  
    
    v_Serv_Cntr   RTSD0013.SERV_CNTR%TYPE;
    
    v_Cnt         NUMBER  DEFAULT 0;
    v_Exe_Cnt     NUMBER  DEFAULT 0;
    
    e_Error       EXCEPTION;
    
    -- 점검대상 모집단
    CURSOR  CUR_RTCS0004 IS
    SELECT A.*
    --, (SELECT EQU_NO FROM RTCS0001 WHERE ORD_NO = A."2BY2") EQU_NO_2BY2  [20190711_01]
    FROM (
        SELECT A.*, ROW_NUMBER()OVER(PARTITION BY A.CUST_NO, SUBSTR(A.PROC_DAY, 1, 6), A.CAR_NO ORDER BY A.ORD_NO) ROW_NUM, C.EQU_NO EQU_NO_2BY2  FROM (
            SELECT  v_Std_Ym    AS STD_YM
             ,  A.ORD_NO                    /*계약번호            */
             ,  A.CUST_NO                   /*고객번호            */
             ,  A.C_MILEAGE AS A_MILEAGE    /*주행거리(점검)      */
             ,  A.MFP_YN                    /*중도완납여부        */
             ,  A.OS_YN                     /*소유권이전여부      */
             ,  A.OS_DAY                    /*소유권이전일자      */
             ,  A.CNT_CD                    /*타이어본수          */
             ,  A.REG_DT                    /*등록일              */
             ,  A.CAR_NO                    /*차량번호            */
             ,  A.PROC_DAY                  /*장착일자            */
             ,  B.C_MILEAGE                 /*주행거리(장착)      */
             ,  C.MOB_NO                    /*휴대폰번호          */
             ,  C.TEL_NO                    /*전화번호            */
             ,  C.BLD_MNG_NO                /*고객주소-우편번호PK(*/
             ,  C.POS_CD                    /*고객주소-우편번호   */
             ,  C.ADDR1                     /*고객주소-주소       */
             ,  C.ADDR2                     /*고객주소-상세주소   */
             ,  E.EQU_NO                    /*설비번호            */
             ,  (SELECT  ORD_NO
                      FROM  RTSD0108
                     WHERE  CAR_NO = A.CAR_NO
                       AND  ORD_NO <> A.ORD_NO
                       AND  CNT_CD = A.CNT_CD
                       AND  PERIOD_CD = A.PERIOD_CD
                       AND  REG_ID = A.REG_ID
                       AND  SUBSTR(PROC_DAY, 1, 6) = SUBSTR(A.PROC_DAY, 1, 6)
                       AND  CNT_CD = '02'
                       AND  (
                                MFP_YN  = 'N' 
                                OR 
                                (MFP_YN = 'Y' AND CANC_DAY > v_Pre_Lstday)
                            )
                       AND  OS_YN   = 'N' AND (OS_DAY >= v_Pre_Lstday)
                       --AND  PROC_DAY||TO_CHAR(REG_DT,'HH24MISS') < A.PROC_DAY||TO_CHAR(A.REG_DT,'HH24MISS')
                       --AND  ROWNUM = 1
                       ) "2BY2"          
          FROM  RTSD0108 A
             ,  RTSD0104 B
             ,  RTSD0100 C
             ,  RTCS0001 E
             ,  RTSD0013 F
         WHERE  A.PROC_DAY <= v_Pre_Lstday
           AND  (
                    A.MFP_YN  = 'N' 
                    OR 
                    (A.MFP_YN = 'Y' AND A.CANC_DAY > v_Pre_Lstday)
                )
           AND  A.OS_YN   = 'N' AND (A.OS_DAY >= v_Pre_Lstday)
           AND  A.ORD_NO  = B.ORD_NO
           AND  A.CUST_NO = C.CUST_NO
           AND  A.ORD_NO  = E.ORD_NO
           AND  A.ORD_NO  = F.ORD_NO
           AND  F.PRS_DCD = 'B00003'
--           AND  A.ORD_NO = 'D18000176157'
        ) A, RTSD0013 B, RTCS0001 C
        WHERE "2BY2" IS NOT NULL
        AND A."2BY2" = B.ORD_NO
        AND B.PRS_DCD = 'B00003'
        AND C.ORD_NO = A."2BY2"
        AND B.SERV_CNTR > 0 --[20191031_01] 잔여서비스 확인
        AND NOT EXISTS(SELECT 1 FROM RTCS0005 WHERE STD_YM = v_Std_Ym AND (ORD_NO = A."2BY2" OR ORD_NO = A.ORD_NO))  --[2019-00370394]
--        AND NOT EXISTS(SELECT 1 FROM RTCS0004 WHERE STD_YM = v_Std_Ym AND (ORD_NO = A."2BY2" OR ORD_NO = A.ORD_NO))  [20190711_01]
    ) A
    WHERE ROW_NUM = 1
    ;

  BEGIN
  
    -- 최근 연체집계일자 조회
    SELECT  MAX(DELY_DAY)
      INTO  v_dely_day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';
    
    FOR CUR IN CUR_RTCS0004 LOOP
        EXIT WHEN CUR_RTCS0004%NOTFOUND;
                
        v_Cnt      := 0;
        v_Chk_Stat := NULL;
        v_Ad_Ordno := NULL;
        v_Ord_No   := NULL;
        
        v_Exe_Cnt  := v_Exe_Cnt + 1;
        
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate2By2(1)', '['||v_Exe_Cnt||'] '||v_Std_Ym||'>'||CUR.ORD_NO);
        
        v_Ord_No := CUR.ORD_NO;
        v_Equ_No := CUR.EQU_NO;
           
        dbms_output.put_line('====START====');
        
        BEGIN
           
            --PLAN_DAY      
            SELECT TO_CHAR(NEXT_DAY, 'YYYYMMDD'), CNT INTO v_Plan_Day, v_Cnt FROM (    
                SELECT  A.*,
                        (MON*(LEVEL)) AMON,
                        ADD_MONTHS(A.PROC_DAY,(MON*(LEVEL))) NEXT_DAY,
                        LEVEL CNT
                FROM    (
                        SELECT  A.ORD_NO,     /*계약번호         */
                                A.PROC_DAY,   /*장착일자         */
                                A.OS_DAY,     /*종료일자         */
                                A.PERIOD_CD,  /*기간코드         */
                                B.SERV_CNT0,  /*서비스횟수(최초) */
                                DECODE(B.SERV_CNT0,0, NULL, TO_NUMBER(A.PERIOD_CD)/(B.SERV_CNT0 * 2)) MON
                        FROM    RTSD0108 A,
                                RTSD0013 B
                        WHERE   A.ORD_NO  = B.ORD_NO
                        AND     B.PRS_DCD = 'B00003'
                        AND     A.ORD_NO  = v_Ord_No
                        ) A
                CONNECT BY LEVEL <= A.SERV_CNT0 * 2)
            WHERE TO_CHAR(NEXT_DAY, 'YYYYMM') >= v_Std_Ym 
            AND ROWNUM = 1;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_Cnt := 0;
                v_Return_Message := '방문점검 스케쥴 조회 실패!!!'||'-'||v_Return_Message;
                v_ErrorText      := v_ErrorText;
        END;
        
        dbms_output.put_line('===END===');
        dbms_output.put_line('회차:' || v_Cnt);
            
        --4회차부터 다음계약으로 넘어감
        IF v_Cnt > 3 THEN
        
            v_Ord_No := CUR."2BY2";
            v_Equ_No := CUR.EQU_NO_2BY2;
            
            BEGIN
            
                SELECT SERV_CNTR 
                INTO v_Serv_Cntr 
                FROM RTSD0013 
                WHERE ORD_NO = v_Ord_No
                AND PRS_DCD = 'B00003';
            
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    v_Serv_Cntr := 0;
                    v_Target_Cd := '2';
                    v_Return_Message := '서비스횟수 조회 실패!!!'||'-'||v_Return_Message;
                    v_ErrorText      := v_ErrorText;                
            END;
             
            --해당계약의 서비스횟수를 소진하면 전월미처리 프로세스 진행
            IF v_Serv_Cntr = 0 THEN
                v_Plan_Day := NULL;
            END IF;
        END IF;             
             
dbms_output.put_line('주문번호:' || v_Ord_No);
dbms_output.put_line(v_Plan_Day);
        -- 도래한 점검예정일이 기준년월에 포함되면 '대상'으로 선정
        IF (v_Plan_Day IS NOT NULL) AND (SUBSTR(v_Plan_Day,1,6) = v_Std_Ym) THEN
            v_Target_Cd := '1';
        
        ELSE
            -- 전월 대상건이었는지 확인
            SELECT  COUNT(*)
              INTO  v_Cnt
              FROM  RTCS0004
             WHERE  STD_YM = v_Pre_Ym
               AND  ORD_NO = v_Ord_No
               AND  EQU_NO = v_Equ_No
               AND  TARGET_CD  = '1';
               
               dbms_output.put_line('전월대상건:' || v_Cnt);
               dbms_output.put_line('전월대상건:' || v_Pre_Ym);
               dbms_output.put_line('전월대상건:' || v_Ord_No);
               dbms_output.put_line('전월대상건:' || v_Equ_No);
            IF v_Cnt > 0 THEN
            dbms_output.put_line('===전월마지막상태 시===');
                -- 전월 마지막 작업상태 및 컨택상태 확인               
                SELECT  CHK_STAT  , OB_ST  , JOB_SEQ
                  INTO  v_Chk_Stat, v_Ob_St, v_Job_Seq
                  FROM  RTCS0005
                 WHERE  STD_YM  = v_Pre_Ym
                   AND  ORD_NO  = v_Ord_No
                   AND  EQU_NO  = v_Equ_No
                   AND  JOB_SEQ = (
                                    SELECT  NVL(MAX(JOB_SEQ), 0) 
                                      FROM  RTCS0005 
                                     WHERE  STD_YM = v_Pre_Ym 
                                       AND  ORD_NO = v_Ord_No 
                                       AND  EQU_NO = v_Equ_No
                                  );       
            ELSE
                v_Chk_Stat := NULL;
                v_Ob_St    := NULL;
                
            END IF;               
dbms_output.put_line('===전월미처리 시작===');
            /*------------------------
             * '대상(전월미처리)' 기준
             *------------------------
             * - 전월 대상건 중 처리상태가 '점검완료'되지 않고 동시에 컨택상태가 '취소'가 아닌 건
             */             
            IF (v_Cnt > 0) AND (v_Chk_Stat IS NOT NULL) AND (v_Chk_Stat <> '04') AND (v_Chk_Stat IS NOT NULL) AND (v_Ob_St <> '05') THEN
                v_Target_Cd := '4';
            ELSE
                v_Target_Cd := '2';
            END IF;
           
        END IF;
        dbms_output.put_line('===TARGET_CD===' || v_Target_Cd);        
        -- 고객번호 마지막 연체집계 기준 연체금액이 존재하면 조회대상 제외하기 위해 Target_Cd = 3으로 지정
        IF v_Target_Cd IN ('1','4') AND Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(CUR.CUST_NO, NULL, v_dely_day) > 0 THEN            
            v_Target_Cd := '3';    
        END IF;
        dbms_output.put_line('===점검거부 시작===');
        --점검거부 상태인지 확인 [20170726_01]
        SELECT  COUNT(*)
          INTO  v_Cnt
          FROM  RTCS0013
         WHERE  ORD_NO = v_Ord_No 
           AND  EQU_NO = v_Equ_No
           AND  DENY_YN = 'Y'
           AND  DENY_STD_YM <= v_Std_Ym;
        
        --거부상태인 경우 Target=5 로 지정 [20170726_01]
        IF v_Cnt > 0 THEN
            v_Target_Cd := '5';
        END IF;

        /*---------------------------------- 
         * 조정관련 계약번호(AD_ORDNO) 조회
         *----------------------------------
         * - 2본 계약이 동일차량에 2개 있다면 후속계약의 점검주기에 맞춤
         * - 차량번호가 같은 경우 동일차량으로 인식
         * - 후속계약 : 장착일시가 늦은 계약        
         * - 조정관련 계약이 존재하는 경우 : AD_ORDNO에 해당 계약번호 입력, ARGET_CD : '1' 대상 -> '2' 비대상으로 변경
         */
--        IF v_Target_Cd = '1' AND CUR.CNT_CD = '02' THEN
--            BEGIN
--            
--                SELECT  ORD_NO
--                  INTO  v_Ord_No
--                  FROM  RTSD0108
--                 WHERE  CAR_NO = CUR.CAR_NO
--                   AND  ORD_NO <> CUR.ORD_NO
--                   AND  CNT_CD = '02'
--                   AND  (
--                            MFP_YN  = 'N' 
--                            OR 
--                            (MFP_YN = 'Y' AND CANC_DAY > v_Pre_Lstday)
--                        )
--                   AND  OS_YN   = 'N' AND (OS_DAY >= v_Pre_Lstday)
--                   AND  PROC_DAY||TO_CHAR(REG_DT,'HH24MISS') < CUR.PROC_DAY||TO_CHAR(CUR.REG_DT,'HH24MISS');
--               
--            EXCEPTION
--                WHEN NO_DATA_FOUND THEN
--                    v_Ord_No := NULL;
--                WHEN OTHERS THEN
--                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregateNew(2)', '조정관련 계약번호 획득 실패');
--            END;               
--               
--            IF TRIM(v_Ord_No) IS NOT NULL THEN
--                v_Ad_Ordno := v_Ord_No;
--                v_Target_Cd := '2';
--            ELSE
--                v_Ad_Ordno := NULL;
--            END IF;
--                           
--        END IF;
       dbms_output.put_line('===배정구분 시작==='); 
        /*------------------------------------------
         * 배정구분 [20170424_01]
         *------------------------------------------
         * - M-1월 수행 시 : 전월미처리건 배정 제외
         * - M월 수행 시 : 전월미처리건 배정 포함
         */
        IF (v_Mode = 'A' AND v_Target_Cd NOT IN ('4')) OR v_Mode = 'B' THEN

            -- 전월미처리의 경우
            IF v_Target_Cd IN ('4') THEN
                -- 고객정보가 아닌 전월 배정 마지막 정보를 일부 승계 
                SELECT  *
                  INTO  r_Pre_CS0006
                  FROM  RTCS0006
                 WHERE  STD_YM  = v_Pre_Ym
                   AND  ORD_NO  = v_Ord_No
                   AND  EQU_NO  = v_Equ_No
                   AND  JOB_SEQ = v_Job_Seq
                   AND  SEQ = (
                            SELECT  NVL(MAX(SEQ), 0)
                              FROM  RTCS0006
                             WHERE  STD_YM  = v_Pre_Ym
                               AND  ORD_NO  = v_Ord_No
                               AND  EQU_NO  = v_Equ_No
                               AND  JOB_SEQ = v_Job_Seq
                        )  
                ;
                                
                v_Mob_No      := r_Pre_CS0006.MOB_NO; 
                v_Tel_No      := r_Pre_CS0006.TEL_NO;
                v_Bld_Mng_No  := r_Pre_CS0006.BLD_MNG_NO;
                v_Poscd       := r_Pre_CS0006.POSCD;
                v_Addr1       := r_Pre_CS0006.ADDR1;
                v_Addr2       := r_Pre_CS0006.ADDR2;
            
            -- 전월미처리가 아닌 경우
            ELSE

                -- 고객정보를 배정정보로 사용
                v_Mob_No      := CUR.MOB_NO; 
                v_Tel_No      := CUR.TEL_NO;
                v_Bld_Mng_No  := CUR.BLD_MNG_NO;
                v_Poscd       := CUR.POS_CD;
                v_Addr1       := CUR.ADDR1;
                v_Addr2       := CUR.ADDR2;
                
            END IF;                
                            
            /*--------------------------------------------------
             * 담당 로디안 조회
             *--------------------------------------------------
             * 1) 건물관리번호로 조회
             *   - 신규/변경 주소의 경우 조회 불가
             * 2) 주소1의 '광역시/도' 또는 '시/군/구'로 조회
             * 3) 특정 로디안 강제배정
             */         
            -- 1) 건물관리번호로 담당 로디안 조회
            --  - Pkg_Rtcs0006.p_sRtcs0006Mr 와 동일한 로직 사용
            dbms_output.put_line('===건물관리번호로 담당 로디안 조회 시작==='); 
            BEGIN         
                SELECT  A1.CARMASTER_NU
                  INTO  v_Carmster_Nu
                  FROM  RTSD0010 A1
                 WHERE  A1.BLD_MNG_NO = v_Bld_Mng_No;

            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    v_Carmster_Nu := NULL;
                    v_Return_Message := '담당 로디안 조회 실패(1)!!!'||'-'||v_Return_Message;
                    v_ErrorText      := v_ErrorText;
                WHEN OTHERS THEN
                    v_Return_Message := '건물관리번호로 담당 로디안 조회 실패!!!'||'-'||v_Return_Message;
                    v_ErrorText      := v_ErrorText;
                    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate2By2(3)', '건물관리번호로 담당 로디안 조회 실패');
            END;         

            -- 2) 주소1로 담당 로디안 조회   
            --  - Pkg_Rtcs0006.p_sRtcs0006MrAddr1 와 동일한 로직 사용
            --  - (1) '세종특별자치시'의 경우 시군구가 ' '으로 표기됨
            --  - (2) 하나의 시군구에 2명 이상의 로디안이 배정된 경우 임의로 1명만 선정 > 사번 내림차순으로 1명 선정 [20191202_01] 
            dbms_output.put_line('===주소명으로 담당 로디안 조회 시작==='); 
            IF v_Carmster_Nu IS NULL THEN
                
                BEGIN         
                    SELECT  MAX(A1.CARMASTER_NU)
                      INTO  v_Carmster_Nu
                      FROM  RTSD0010 A1
                     WHERE  A1.DO_NM        = SUBSTR(v_Addr1,1,INSTR(v_Addr1,' ',1,1)-1)
                       AND  A1.CT_NM        = NVL(SUBSTR(v_Addr1,INSTR(v_Addr1,' ',1,1)+1,INSTR(v_Addr1,' ',1,2)-INSTR(v_Addr1,' ',1,1)-1),' ') --(1)
                       AND  A1.CARMASTER_NU IS NOT NULL
                       AND  A1.USE_YN       = 'Y';
--                       AND  ROWNUM = 1;  --(2)

                EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                        v_Carmster_Nu := NULL;
                        v_Return_Message := '담당 로디안 조회 실패(2)!!!'||'-'||v_Return_Message;
                        v_ErrorText      := v_ErrorText;
                    WHEN OTHERS THEN
                        v_Return_Message := '주소명으로 담당 로디안 조회 실패!!!'||'-'||v_Return_Message;
                        v_ErrorText      := v_ErrorText;
                        Pkg_Utility.p_InfoFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate2By2(3)', '건물관리번호로 담당 로디안 조회 실패');
                        
                END;  
                
            END IF;
                
            -- 3) 건물관리번호, 주소1 로 담당 로디안 조회 불가 시 강제 지정
            --  - 1=운영테스트
            IF v_Carmster_Nu IS NULL THEN
                v_Carmster_Nu := '1';
            END IF;
            dbms_output.put_line('===p_IUDRtcs0004 시작===');
            -- 이관 등으로 해당월에 이미 방문점검 작업정보가 존재하는 경우 Target_Cd = 5
            -- - 건당 이관기능 개발 이후 주석 풀 것
--            IF Pkg_Rtcs0005.f_sRtcs0005Count(v_Std_Ym, CUR.ORD_NO, CUR.EQU_NO, 1) > 0 THEN
--                v_Target_Cd := '5';
--            END IF;
                     
            -- 관리계정 정보(RTCS0004) 생성
            Pkg_Rtcs0004.p_IUDRtcs0004 ('I', CUR.STD_YM, v_Ord_No, v_Equ_No,
                                        v_Target_Cd, v_Carmster_Nu, CUR.C_MILEAGE, CUR.A_MILEAGE,
                                        v_Plan_Day, v_Ad_Ordno, v_Reg_Id, v_Success_Code,
                                        v_Return_Message, v_ErrorText);

            IF 0 != v_Success_Code THEN
                v_Return_Message := '관리계정 정보(RTCS0004) 생성 실패!!!'||'-'||v_Return_Message;
                v_ErrorText      := v_ErrorText;
                RAISE e_Error;
            END IF;

            /*-----------------------------
             * 방문점검 관련 작업정보 생성
             *-----------------------------
             * 점검 미대상인 경우를 제외하고 생성
             */
            IF v_Target_Cd NOT IN ('2') THEN

                /*-------------------
                 * 점검예정일자 변경 
                 *-------------------
                 * '대상'인 경우는 점검예정일자가 당월이므로 관계가 없지만
                 * 나머지 경우에는 이전월의 기존 점검예정일자가 당월에 없을 수 있음
                 * 예를 들어 기존 점검예정일자가 3/31 인 경우 4월에는 31일이 없으므로 4/30일이 되어야 함
                 * 장착일자의 DD를 사용하는 것은 어짜피 점검예정일자가 장착일자의 DD를 사용하기 때문
                 */
                IF v_Target_Cd NOT IN ('1') THEN                    
                    IF  v_Std_Ym||SUBSTR(CUR.PROC_DAY,7,2) > v_Last_Day THEN
                        v_Plan_Day := v_Last_Day;
                    ELSE
                        v_Plan_Day := v_Std_Ym||SUBSTR(CUR.PROC_DAY,7,2);
                    END IF;                    
                END IF;
                
                /*-----------------------------
                 * 처리상태 결정 [20170726_01]
                 *-----------------------------
                 * '점검거부'인 경우 처리상태 역시 '점검거부'
                 * 나머지 경우에는 모두 '초기배정'
                 */
                IF v_Target_Cd IN ('5') THEN
                    v_Chk_Stat := '05';
                ELSE
                    v_Chk_Stat := '01';
                END IF;
                
                -- 방문점검 작업목록(RTCS0005) 생성
                Pkg_Rtcs0005.p_IUDRtcs0005 ('I',CUR.STD_YM, v_Ord_No, v_Equ_No,
                                            v_Job_Seq, v_Target_Cd, v_Carmster_Nu, NULL
                                            ,'N', NULL, v_Plan_Day, '000000',
                                            v_Plan_Day, '000000', NULL, NULL,
                                            v_Chk_Stat, NULL, NULL, v_Reg_Id,
                                            v_Success_Code, v_Return_Message, v_ErrorText);
                                            
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '방문점검 작업목록(RTCS0005) 생성 실패!!!'||'-'||v_Return_Message;
                    v_ErrorText      := v_ErrorText;
                    RAISE e_Error;
                END IF;                                        
                                            
                -- 방문점검 작업정보 변경key값(SEQ) 조회
                v_Seq := Pkg_Rtcs0006.f_sRtcs0006Seq(CUR.STD_YM, v_Ord_No, v_Equ_No, v_Job_Seq);

                -- 방문점검 작업정보 변경(RTCS0006) 생성
                IF 0 != Pkg_Rtcs0006.f_InsertRtcs0006 (CUR.STD_YM, v_Ord_No, v_Equ_No,
                                                       v_Job_Seq, v_Seq, v_Mob_No, v_Tel_No,
                                                       v_Bld_Mng_No, v_Poscd, v_Addr1, v_Addr2,
                                                       v_Plan_Day, '000000', v_Carmster_Nu, NULL,
                                                       NULL, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '방문점검 작업정보 변경(RTCS0006) 생성 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText      := v_ErrorText;
                    RAISE e_Error;
                END IF;

            END IF;
            
        END IF;

    END LOOP;

    IF CUR_RTCS0004%ISOPEN THEN
        CLOSE CUR_RTCS0004;
    END IF;

    IF v_Exe_Cnt = 0 THEN
        v_Return_Message := '기준년월('||v_Std_Ym||')에 해당하는 점검대상 데이터가 존재하지 않아 처리가 불가 합니다.!';
        RAISE e_Error;
    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate2By2(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        v_Success_code   := -1;
        v_Return_Message := NVL(TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0004.p_Rtcs0004TargetAggregate2By2(2)', v_ErrorText, v_Return_Message);

  END p_Rtcs0004TargetAggregate2By2;
  
END Pkg_Rtcs0004;
/