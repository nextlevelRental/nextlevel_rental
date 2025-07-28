CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0100 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0100
   PURPOSE   해피콜대상 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-24  jemcarry         1. Created this package body.
   1.1        2017-06-21  wjim             [20170621_01] 등록자 추가 
   1.2        2019-08-20  wjim             [20180820_01] 메시지이력 조회결과 정렬
*******************************************************************************/

  /*****************************************************************************
  -- 해피콜대상 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0100Count(
    v_Call_No        IN RTCS0100.CALL_NO%TYPE           /*상담번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0100
    WHERE   CALL_NO = v_Call_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0100Count;

  /*****************************************************************************
  -- 해피콜상담사 배정 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0100 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day1       IN RTCS0100.JOB_DAY%TYPE,        /*처리일자FROM          */
    v_Job_Day2       IN RTCS0100.JOB_DAY%TYPE,        /*처리일자TO            */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE      /*배정여부              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.JOB_TP,                                                             /*상담유형     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H001', A.JOB_TP) JOB_TP_NM,         /*상담유형명   */
            A.CALL_NO,                                                            /*상담번호     */
            A.ORD_NO,                                                             /*계약번호     */
            A.JOB_DAY,                                                            /*처리일자     */
            A.BAEJUNG_YN,                                                         /*배정여부     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H003', A.BAEJUNG_YN) BAEJUNG_YN_NM, /*배정여부명   */
            A.USER_ID,                                                            /*상담사ID     */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_ID_NM,                 /*상담사명     */
            A.BAEJUNG_DAY                                                         /*배정일자     */
    FROM    RTCS0100 A
    WHERE   A.JOB_TP   = v_Job_Tp
    AND     A.JOB_DAY  BETWEEN v_Job_Day1 AND v_Job_Day2
    AND     A.BAEJUNG_YN = DECODE(v_Baejung_Yn, NULL, A.BAEJUNG_YN, v_Baejung_Yn)
    AND     A.CALL_STATUS = 'I'
    AND     A.RETRY_CNT = 0 ;

  END p_sRtcs0100;


  /*****************************************************************************
  -- 해피콜대상 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0100 (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*상담번호              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*처리일자              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*배정일자              */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*배정여부              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*시도 건수             */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTCS0100.PROC_DAY%TYPE,       /*장착일자              */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*장착대리점            */
    v_Mat_Cd         IN RTCS0100.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTCS0100.MAT_NM%TYPE,         /*상품명                */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*전화번호              */
    v_Car_No         IN RTCS0100.CAR_NO%TYPE,         /*차량번호              */
    v_Vkbur          IN RTCS0100.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCS0100.VKGRP%TYPE,          /*지사                  */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */
    v_Serv_Seq       IN RTCS0100.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Proc_In_Cd     IN RTCS0100.PROC_IN_CD%TYPE,     /*서비스 처리자         */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0100 (
            CALL_NO,
            JOB_TP,
            JOB_DAY,
            CALL_DAY,
            CALL_STATUS,
            USER_ID,
            BAEJUNG_DAY,
            BAEJUNG_YN,
            RETRY_CNT,
            ORD_NO,
            PROC_DAY,
            AGENCY_CD,
            MAT_CD,
            MAT_NM,
            CUST_NO,
            CUST_NM,
            MOB_NO,
            TEL_NO,
            CAR_NO,
            VKBUR,
            VKGRP,
            CALL_DTL,
            SERV_SEQ,       /*서비스 순번           */
            PROC_IN_CD,     /*서비스 처리자         */
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Call_No,
            v_Job_Tp,
            v_Job_Day,
            v_Call_Day,
            v_Call_Status,
            v_User_Id,
            v_Baejung_Day,
            v_Baejung_Yn,
            v_Retry_Cnt,
            v_Ord_No,
            v_Proc_Day,
            v_Agency_Cd,
            v_Mat_Cd,
            v_Mat_Nm,
            v_Cust_No,
            v_Cust_Nm,
            v_Mob_No,
            v_Tel_No,
            v_Car_No,
            v_Vkbur,
            v_Vkgrp,
            v_Call_Dtl,
            v_Serv_Seq,       /*서비스 순번           */
            v_Proc_In_Cd,     /*서비스 처리자         */
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

  END f_InsertRtcs0100;

  /*****************************************************************************
  -- 해피콜대상 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0100 (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*상담번호              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*처리일자              */
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 ID             */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*배정여부              */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*배정일자              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCS0100
    SET    JOB_TP      = v_Job_Tp,
           JOB_DAY     = v_Job_Day,
           USER_ID     = v_User_Id,
           BAEJUNG_YN  = v_Baejung_Yn,
           BAEJUNG_DAY = v_Baejung_Day,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  CALL_NO     = v_Call_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0100;


  /*****************************************************************************
  -- 해피콜대상 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0100 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Call_No        IN OUT RTCS0100.CALL_NO%TYPE,    /*상담번호              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*처리일자              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*배정일자              */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*배정여부              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*시도 건수             */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTCS0100.PROC_DAY%TYPE,       /*장착일자              */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*장착대리점            */
    v_Mat_Cd         IN RTCS0100.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTCS0100.MAT_NM%TYPE,         /*상품명                */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*전화번호              */
    v_Car_No         IN RTCS0100.CAR_NO%TYPE,         /*차량번호              */
    v_Vkbur          IN RTCS0100.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCS0100.VKGRP%TYPE,          /*지사                  */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */
    v_Serv_Seq       IN RTCS0100.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Proc_In_Cd     IN RTCS0100.PROC_IN_CD%TYPE,     /*서비스 처리자         */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:상담유형, 처리일자, 통화상태,배정여부,계약번호, 장착일자,상품코드, 상품명,고객번호,고객번호, 등록자 ID
    IF (TRIM(v_Job_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H001', v_Job_Tp)) THEN
        v_Return_Message := '상담유형('||v_Job_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Baejung_Yn) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H003', v_Baejung_Yn)) THEN
        v_Return_Message := '배정여부('||v_Baejung_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF TRIM(v_Comm_Dvsn) = 'I' THEN

        IF 0!= ISDATE(v_Job_Day) THEN
            v_Return_Message := '처리일자('||v_Job_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;

        END IF;

        IF (TRIM(v_Call_Status) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H002', v_Call_Status)) THEN
            v_Return_Message := '통화상태('||v_Call_Status||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF 0 != ISDATE(v_Proc_Day) THEN
            v_Return_Message := '장착일자('||v_Proc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Agency_Cd) IS NULL) OR (0 = Pkg_Rtsd0007.f_sRtsd0007Count(v_Agency_Cd)) THEN
            v_Return_Message := '장착대리점('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Mat_Cd) IS NULL) OR (0 = Pkg_Rtsd0005.f_sRtsd0005Count(v_Mat_Cd)) THEN
            v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Mat_Nm) IS NULL THEN
            v_Return_Message := '상품명('||v_Mat_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
            v_Return_Message := '고객번호('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
            v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

     END IF;


     IF v_Comm_Dvsn = 'I' THEN

        v_Call_No := f_sRtcs0100CallNo();

        IF 0 != f_InsertRtcs0100(v_Call_No, v_Job_Tp, v_Job_Day, v_Call_Day,
                                 v_Call_Status, v_User_Id, v_Baejung_Day, v_Baejung_Yn,
                                 v_Retry_Cnt, v_Ord_No, v_Proc_Day, v_Agency_Cd, v_Mat_Cd,
                                 v_Mat_Nm, v_Cust_No, v_Cust_Nm, v_Mob_No,
                                 v_Tel_No, v_Car_No, v_Vkbur, v_Vkgrp,
                                 v_Call_Dtl, v_Serv_Seq, v_Proc_In_Cd,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '해피콜대상 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 = f_sRtcs0100Count(v_Call_No) THEN
            v_Return_Message := '해당 상담번호('||v_Call_No||')로 등록된 정보가 없어 변경 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF 0 != f_UpdateRtcs0100(v_Call_No, v_Job_Tp, v_Job_Day, v_User_Id,
                                 v_Baejung_Yn,v_Baejung_Day, v_Reg_Id , v_ErrorText) THEN
            v_Return_Message := '해피콜대상 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        v_Return_Message := '처리구분(I,U,D) 값('||v_Comm_Dvsn||') 오류로 처리 불가!';
        RAISE e_Error;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_IUDRtcs0100(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_IUDRtcs0100(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0100;

  /*****************************************************************************
  -- 해피콜상담 등록 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-06-21  wjim             [20170621_01] 등록자 추가 
  *****************************************************************************/
  PROCEDURE p_sRtcs0100Regf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Job_Day1       IN RTCS0100.JOB_DAY%TYPE,        /*처리일자FROM          */
    v_Job_Day2       IN RTCS0100.JOB_DAY%TYPE,        /*처리일자TO            */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*상담사ID              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*장착대리점            */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*휴대번호              */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*전화번호              */
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.*,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT X.JOB_TP_NM,                                                                /*상담유형명   */
           X.CALL_NO,                                                                  /*상담번호     */
           X.USER_ID_NM,                                                               /*상담사명     */
           X.CALL_STATUS,
           X.CALL_STATUS_NM,                                                           /*통화상태     */
           X.ORD_NO,                                                                   /*계약번호     */
           X.AGENCY_NM,                                                                /*대리점       */
           X.CUST_NM,                                                                  /*고객명       */
           X.MOB_NO,                                                                   /*휴대폰번호   */
           X.TEL_NO,                                                                   /*전화번호     */
           X.RETRY_CNT,                                                                /*시도건수     */
           X.JOB_DAY,                                                                  /*처리일자     */
           X.CALL_DAY,                                                                 /*통화일자     */
           X.CALL_DTL,                                                                 /*상담내용     */
           X.SERV_SEQ,                                                                 /*서비스 순번  */
           X.PROC_IN_NM,
           Y.ANSWER,                                                                   /*고객만족여부 */
           X.CHG_ID,                                                                   /*등록자 [20170621_01] */
           X.SERVICE_CD,
           X.SERVICE_NM,
           X.AGENCY_CD
    FROM (
       SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName('H001', A.JOB_TP) JOB_TP_NM,           /*상담유형명   */
               A.CALL_NO,                                                              /*상담번호     */
               Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_ID_NM,                   /*상담사명     */
               A.CALL_STATUS,
               Pkg_Rtcm0051.f_sRtcm0051CodeName('H002', A.CALL_STATUS) CALL_STATUS_NM, /*통화상태     */
               A.ORD_NO,                                                               /*계약번호     */
               Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD) AGENCY_NM,                /*대리점       */
               A.CUST_NM,                                                              /*고객명       */
               A.MOB_NO,                                                               /*휴대폰번호   */
               A.TEL_NO,                                                               /*전화번호     */
               A.RETRY_CNT,                                                            /*시도건수     */
               A.JOB_DAY,                                                              /*처리일자     */
               A.CALL_DAY,                                                             /*통화일자     */
               A.CALL_DTL,                                                             /*상담내용     */
               A.SERV_SEQ,                                                             /*서비스 순번  */
               CASE WHEN A.JOB_TP = 'H1' THEN Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD)
               ELSE CASE WHEN (SELECT AGENCY_NM    FROM RTSD0007 WHERE A.PROC_IN_CD = AGENCY_CD)    IS NOT NULL THEN
                                      Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD)
                         WHEN (SELECT CARMASTER_NM FROM RTCS0002 WHERE A.PROC_IN_CD = CARMASTER_NU) IS NOT NULL THEN
                                      (SELECT CARMASTER_NM FROM RTCS0002 WHERE A.PROC_IN_CD = CARMASTER_NU)
                    ELSE ''
                    END
               END AS PROC_IN_NM,
               CASE WHEN B.OBJECT_QUS_01 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_01
                    WHEN B.OBJECT_QUS_02 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_02
                    WHEN B.OBJECT_QUS_03 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_03
                    WHEN B.OBJECT_QUS_04 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_04
                    WHEN B.OBJECT_QUS_05 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_05
                    WHEN B.OBJECT_QUS_06 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_06
                    WHEN B.OBJECT_QUS_07 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_07
                    WHEN B.OBJECT_QUS_08 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_08
                    WHEN B.OBJECT_QUS_09 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_09
                    WHEN B.OBJECT_QUS_10 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_10
               END AS SERV_ANS_CD,
               A.CHG_ID,
               C.SERVICE_CD,
               D.CD_NM SERVICE_NM,
               A.AGENCY_CD
       FROM    RTCS0100 A,
               RTCS0101 B,
               RTCS0008 C,
               RTCM0051 D
       WHERE   A.JOB_TP   = v_Job_Tp
       AND     A.JOB_DAY  BETWEEN v_Job_Day1 AND v_Job_Day2
       AND     (v_Call_Status  IS NULL OR A.CALL_STATUS =  v_Call_Status)
       AND     (v_User_Id      IS NULL OR A.USER_ID     =  v_User_Id)
       AND     (v_Cust_Nm      IS NULL OR A.CUST_NM     =  v_Cust_Nm)
       AND     A.MOB_NO LIKE   DECODE(v_Mob_No, NULL, A.MOB_NO, '%'||v_Mob_No)
       AND     A.TEL_NO LIKE   DECODE(v_Tel_No, NULL, A.TEL_NO, '%'||v_Tel_No)
       AND     A.CALL_NO       = B.CALL_NO (+)
       AND     A.ORD_NO = C.ORD_NO(+)
       AND     A.SERV_SEQ = C.SERV_SEQ(+)
       AND     C.SERVICE_CD = D.CD(+)
       AND     D.CD_GRP_CD(+) = 'S044'
    ) X,
    (SELECT ANSWER_NO||ANSWER_SEQ AS OBJECT_ANS, ANSWER
     FROM   RTCS0113 ) Y
    WHERE  X.SERV_ANS_CD = Y.OBJECT_ANS (+)
        ) A
        LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
    ;

  END p_sRtcs0100Regf;

  /*****************************************************************************
  -- 해피콜대상 - 상담번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0100CallNo RETURN NUMBER IS
    v_Call_No   RTCS0100.CALL_NO%TYPE DEFAULT NULL;     /*상담번호            */
  BEGIN

    SELECT  SEQ_RTCS0100CALL_NO.NEXTVAL
    INTO    v_Call_No
    FROM    DUAL;

    RETURN v_Call_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0100CallNo;

  /*****************************************************************************
  -- 해피콜상담 계약 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0100Ctf (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE           /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  B.ORD_NO,                                                       /*계약번호     */
            A.CUST_NM,                                                      /*고객명       */
            A.MOB_NO,                                                       /*휴대폰번호   */
            A.TEL_NO,                                                       /*전화번호     */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(B.AGENCY_CD) AGENCY_NM ,       /*장착대리점   */
            B.PROC_DAY,                                                     /*장착일자     */
            C.MAT_CD,                                                       /*상품코드     */
            Pkg_Rtsd0005.f_sRtsd0005MatName(C.MAT_CD) MAT_NM,               /*상품명       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S023', B.REGI_CD) REGI_NM,    /*등록비       */
            B.MON_AMT,                                                      /*월렌탈료     */
            B.CNT_CD,                                                       /*타이어본수   */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', B.PERIOD_CD) PERIOD_NM,/*렌탈기간(월) */
            D.MF_CD MANUFACTURE_DROP,                                       /*제조사*/
            D.MODEL_NM MODEL_NM,                                            /*모델명*/
            D.WIDTH_CD    WIDTH_DROP,                                       /*단면폭*/
            D.RATIO_CD   RATIO_DROP,                                        /*편평비*/
            D.INCH_CD     INCH_DROP                                         /*인치*/
    FROM    RTSD0100 A,
            RTSD0108 B,
            RTSD0106 C,
            RTCS0120 D
    WHERE   A.CUST_NO = B.CUST_NO
    AND     B.ORD_NO = C.ORD_NO
    AND     B.ORD_NO = v_Ord_No
    AND     C.ORD_NO = D.ORD_NO(+);

  END p_sRtcs0100Ctf;

  /*****************************************************************************
  -- 해피콜상담 등록
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0100Reg (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*상담번호              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*계약번호              */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*시도건수              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0100
    SET    CALL_DTL    = v_Call_Dtl,
           CALL_STATUS = v_Call_Status,
           RETRY_CNT   = v_Retry_Cnt,
           CALL_DAY    = v_Call_Day,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  CALL_NO     = v_Call_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0100Reg;

 /*****************************************************************************
  -- 해피콜대상 상담 등록
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0100reg (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*상담번호              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*계약번호              */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*시도건수              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    IF 0 = f_sRtcs0100Count(v_Call_No) THEN
        v_Return_Message := '해당 상담번호('||v_Call_No||')로 등록된 정보가 없어 변경 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Call_Dtl) IS NULL THEN
        v_Return_Message := '해당 상담내용('||v_Call_Dtl||')값이 없어 변경 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != f_UpdateRtcs0100Reg(v_Call_No, v_Ord_No, v_Call_Dtl, v_Call_Status,
                                v_Retry_Cnt, v_Call_Day, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '해피콜대상 상담 수정 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_UpdateRtcs0100reg(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_UpdateRtcs0100reg(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtcs0100reg;

  /*****************************************************************************
  -- 해피콜상담 계약 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0100ServiceHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE,          /*계약번호              */
    v_Serv_Seq      IN RTCS0100.SERV_SEQ%TYPE         /*서비스 순번           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT
         B.SERVICE_CD
        ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', B.SERVICE_CD) AS SERVICE_NM
        ,A.PROC_IN_CD
        ,CASE WHEN (SELECT AGENCY_NM    FROM RTSD0007 WHERE A.PROC_IN_CD = AGENCY_CD)    IS NOT NULL THEN Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.PROC_IN_CD)
              WHEN (SELECT CARMASTER_NM FROM RTCS0002 WHERE A.PROC_IN_CD = CARMASTER_NU) IS NOT NULL THEN (SELECT CARMASTER_NM FROM RTCS0002 WHERE A.PROC_IN_CD = CARMASTER_NU)
         ELSE ''
         END AS PROC_IN_NM
        ,A.PROC_DAY
        ,A.PROC_TM
    FROM RTCS0007 A INNER JOIN RTCS0008 B ON A.ORD_NO = B.ORD_NO AND A.SERV_SEQ = B.SERV_SEQ
    WHERE A.ORD_NO   = v_Ord_No
    AND   A.SERV_SEQ = v_Serv_Seq;
  END p_sRtcs0100ServiceHistory;
  
  
  /*****************************************************************************
  -- 상담메인 상담이력 조회 
  *****************************************************************************/
  PROCEDURE p_sRtcs0100AdviceHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE          /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT RECV_TP        /*상담유형코드      */
     , RECV_TP_NM     /*상담유형명        */
     , RECV_DAY       /*통화일자          */
     , RESU_ST        /*처리상태코드명    */
     , RESU_ST_NM     /*처리상태명        */
     , ORD_NO         /*계약번호          */
     , CUST_NO        /*고객번호          */
     , CUST_NM        /*고객명칭          */
     , END_DAY        /*처리일자 */
     , CALL_NO        /*상담번호 */
     , USER_ID        /*상담사ID          */
     , USER_ID_NM     /*상담사명          */
     , MOB_NO         /*상담전화번호*/
     , CAR_NO         /*차량번분호          */
     , TEL_NO         /*고객연락처          */
     , CALL_DTL       /*상담내용          */
     , BOUND_GB       /*상담구분*/
  FROM (
        SELECT RECV_TP
             , Pkg_Rtcm0051.f_sRtcm0051CodeName('H005', RECV_TP) RECV_TP_NM
             , RECV_DAY
             , RESU_ST
             , Pkg_Rtcm0051.f_sRtcm0051CodeName('H006', RESU_ST) RESU_ST_NM
             , ORD_NO
             , CUST_NO
             , CUST_NM
             , END_DAY
             , TO_NUMBER(CALL_NO) AS CALL_NO
             , USER_ID
             , Pkg_Rtcm0001.f_sRtcm0001UserNm(USER_ID) USER_ID_NM
             , TEL_NO AS MOB_NO
             , CAR_NO
             , CALL_DTL
             , TEL_NO
             , 'OUT' AS BOUND_GB
          FROM RTCS0102
         WHERE 1=1
           AND ORD_NO = v_Ord_No      

        UNION ALL
           
        SELECT JOB_TP AS RECV_TP
             , Pkg_Rtcm0051.f_sRtcm0051CodeName('H001', JOB_TP) RECV_TP_NM
             , CALL_DAY AS RECV_DAY
             , CALL_STATUS AS RESU_ST
             , Pkg_Rtcm0051.f_sRtcm0051CodeName('H002', CALL_STATUS) AS RESU_ST_NM
             , ORD_NO
             , CUST_NO
             , CUST_NM
             , JOB_DAY AS END_DAY
             , CALL_NO  
             , USER_ID
             , Pkg_Rtcm0001.f_sRtcm0001UserNm(USER_ID) USER_ID_NM
             , MOB_NO AS 
             , CAR_NO
             , CALL_DTL
             , TEL_NO
             , 'IN' AS BOUND_GB 
            FROM    RTCS0100 A
           WHERE  1=1
             AND ORD_NO = v_Ord_No     
       )
  WHERE 1=1
    ORDER BY RECV_DAY DESC;
    
  END p_sRtcs0100AdviceHistory;
  
  
   /*****************************************************************************
  -- 상담메인 메시지이력 조회 
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2019-08-20  wjim             [20180820_01] 메시지이력 조회결과 정렬
  *****************************************************************************/
  PROCEDURE p_sRtcs0100MessageHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Mob_No        IN RTCS0100.MOB_NO%TYPE          /*계약번호              */
    ) IS 
    
    BEGIN
    OPEN Ref_Cursor FOR

    SELECT CASE WHEN B.MSG_SNDER_NM = 'KAKAO' THEN B.MSG_SNDER_NM
           ELSE 'SMS' END AS MSG_GB                            /*메세지구분*/
         , A.REG_ID
         , Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM     /*등록자명 */
         , A.RCV_PHN_ID                                        /*휴대폰번호*/
         , TO_CHAR(TO_DATE(NVL(B.SND_DATE, A.RESERVED_DTTM),'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS') AS REG_DT  /*발송일시*/
         , A.SND_MSG                                           /* 메시지내용 */
      FROM RTSD0205 A
         , RTSD0207 B
     WHERE 1=1
       AND A.CMP_MSG_ID = B.MSG_ID(+) 
       AND A.RCV_PHN_ID = v_Mob_No
       AND B.RESULT_CD(+) = 'OK'
     ORDER BY NVL(B.SND_DATE, A.RESERVED_DTTM) DESC;         
    
--    SELECT 'SMS' AS MSG_GB                                   /*메세지구분*/
--     , REG_ID
--     , Pkg_Rtcm0001.f_sRtcm0001UserNm(REG_ID) REG_NM     /*등록자명 */
--     , RCV_PHN_ID                                        /*휴대폰번호*/
--     , TO_CHAR(REG_DT, 'YYYY-MM-DD HH:MM:SS') AS REG_DT  /*발송일시*/
--     , SND_MSG                                           /* 메시지내용 */
--  FROM RTSD0205
-- WHERE 1=1
--   AND RCV_PHN_ID = v_Mob_No;
   END p_sRtcs0100MessageHistory;
    

  /*****************************************************************************
  -- 상담관리 In 저장관리 
  *****************************************************************************/
  PROCEDURE p_sRtcs010SaveAdvice (
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*상담유형              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*통화일자              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*통화상태              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*고객명/법인명         */    
    v_Call_No        IN OUT RTCS0100.CALL_NO%TYPE,    /*상담번호              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*상담내용              */    
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Bonus_Gb       IN VARCHAR2,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    )
    IS
     e_Error EXCEPTION; 
    BEGIN
    
    
    IF v_Bonus_Gb = 'IN' THEN    
     
    UPDATE RTCS0100
    SET    CALL_DTL    = v_Call_Dtl,
           CALL_STATUS = v_Call_Status,
           CALL_DAY    = v_Call_Day,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  CALL_NO     = v_Call_No;
    
    ELSE
    UPDATE RTCS0102
    SET    CALL_DTL    = v_Call_Dtl,
           RECV_DAY    = v_Call_Day,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  CALL_NO     = v_Call_No;
    
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_sRtcs010SaveAdvice(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_sRtcs010SaveAdvice(2)', v_ErrorText, v_Return_Message);
    END p_sRtcs010SaveAdvice;  

END Pkg_Rtcs0100;