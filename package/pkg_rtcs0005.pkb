CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0005 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0005
   PURPOSE   방문점검 작업목록 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
   1.1        2017-03-24  wjim             [20170324_02] 방문점검 컨택 관련기능 추가
   1.2        2017-04-06  wjim             [20170406_01] 로디안별 방문점검 컨택 확정건수 조회기능 추가
   1.3        2017-04-10  wjim             [20170410_01] 일자별 로디안별 방문점검 컨택 완료건 조회 오류 수정
   1.4        2017-04-25  wjim             [20170425_01] 방문점검 컨택목록조회 조회항목 추가
   1.5        2017-05-22  wjim             [20170522_01] 검검 작업목록 조회 항목 추가
   1.6        2017-05-22  wjim             [20170522_03] 방문점검 컨택목록조회 로디안명 조회기준 변경 
   1.7        2017-06-02  wjim             [20170602_01] 방문점검 컨택목록 엑셀다운로드 항목 추가
   1.8        2017-06-05  wjim             [20170605_01] 방문점검 컨택목록 조회항목 추가
   1.9        2017-06-08  wjim             [20170608_01] 방문점검 컨택목록 조회조건(처리상태) 추가
   1.10       2017-06-16  wjim             [20170616_01] 방문점검 컨택목록 조회항목(구주소) 추가
   1.11       2017-08-22  wjim             [20170822_01] 방문점검 바이럴 프로모션 신청대상 등록 추가
   1.12       2017-09-07  wjim             [20170907_01] 방문점검 컨택목록 조회누락 보완
                                           - 엑셀 다운로드 시 누락 발견
   1.13       2017-12-12  wjim             [20171212_01] 방문점검 컨택목록 조회조건 및 조회항목 추가                             
   1.14       2018-03-22  wjim             [20180322_01] 방문점검 컨택목록 엑셀다운로드 항목 추가
   1.15       2019-04-09  wjim             [20190409_01] 방문점검 컨택목록 예정일 정렬 추가
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검 작업목록 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0005Count(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,           /*설비번호            */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE           /*작업순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0005
    WHERE   STD_YM  = v_Std_Ym
    AND     ORD_NO  = v_Ord_No
    AND     EQU_NO  = v_Equ_No
    AND     JOB_SEQ = v_Job_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0005Count;

  /*****************************************************************************
  -- 방문점검 작업목록 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0005 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*처리여부              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*점검예정일자(최초)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*점검예정시간(최초)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.STD_YM,                    /*기준년월            */
            A.ORD_NO,                    /*계약번호            */
            A.EQU_NO,                    /*설비번호            */
            A.JOB_SEQ,                   /*작업순번            */
            A.TARGET_CD,                 /*대상구분            */
            A.MR_CD,                     /*Mr. Roadian코드     */
            A.R_MRCD,                    /*실제처리자(Mr. Roadi*/
            A.PROC_YN,                   /*처리여부            */
            A.NP_DESC,                   /*미처리사유          */
            A.PLAN_DAY0,                 /*점검예정일자(최초)  */
            A.PLAN_TM0,                  /*점검예정시간(최초)  */
            A.PLAN_DAY,                  /*점검예정일자        */
            A.PLAN_TM,                   /*점검예정시간        */
            A.PROC_DAY,                  /*점검처리일자        */
            A.PROC_TM,                   /*점검처리시간        */
            A.CHK_STAT,                  /*작업상태            */
            A.SERV_SEQ,                  /*서비스 순번         */
            A.REQ_DESC,                  /*고객 특이사항       */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0005 A
    WHERE   A.STD_YM    = DECODE(v_Std_Ym    , NULL, A.STD_YM    , v_Std_Ym)
    AND     A.ORD_NO    = DECODE(v_Ord_No    , NULL, A.ORD_NO    , v_Ord_No)
    AND     A.EQU_NO    = DECODE(v_Equ_No    , NULL, A.EQU_NO    , v_Equ_No)
    AND     A.JOB_SEQ   = DECODE(v_Job_Seq   , NULL, A.JOB_SEQ   , v_Job_Seq)
    AND     A.TARGET_CD = DECODE(v_Target_Cd , NULL, A.TARGET_CD , v_Target_Cd)
    AND     A.MR_CD     = DECODE(v_Mr_Cd     , NULL, A.MR_CD     , v_Mr_Cd)
    AND     A.R_MRCD    = DECODE(v_R_Mrcd    , NULL, A.R_MRCD    , v_R_Mrcd)
    AND     A.PROC_YN   = DECODE(v_Proc_Yn   , NULL, A.PROC_YN   , v_Proc_Yn)
    AND     A.NP_DESC   = DECODE(v_Np_Desc   , NULL, A.NP_DESC   , v_Np_Desc)
    AND     A.PLAN_DAY0 = DECODE(v_Plan_Day0 , NULL, A.PLAN_DAY0 , v_Plan_Day0)
    AND     A.PLAN_TM0  = DECODE(v_Plan_Tm0  , NULL, A.PLAN_TM0  , v_Plan_Tm0)
    AND     A.PLAN_DAY  = DECODE(v_Plan_Day  , NULL, A.PLAN_DAY  , v_Plan_Day)
    AND     A.PLAN_TM   = DECODE(v_Plan_Tm   , NULL, A.PLAN_TM   , v_Plan_Tm)
    AND     A.PROC_DAY  = DECODE(v_Proc_Day  , NULL, A.PROC_DAY  , v_Proc_Day)
    AND     A.PROC_TM   = DECODE(v_Proc_Tm   , NULL, A.PROC_TM   , v_Proc_Tm)
    AND     A.CHK_STAT  = DECODE(v_Chk_Stat  , NULL, A.CHK_STAT  , v_Chk_Stat)
    AND     A.SERV_SEQ  = DECODE(v_Serv_Seq  , NULL, A.SERV_SEQ  , v_Serv_Seq)
    AND     A.REQ_DESC  = DECODE(v_Req_Desc  , NULL, A.REQ_DESC  , v_Req_Desc)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtcs0005;

  /*****************************************************************************
  -- 방문점검 작업목록 Insert
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-30  wjim             [20170324_02] 컬럼 추가           
                                           - 컨텍(세부)상태, 로디안전달사항 
  *****************************************************************************/
  FUNCTION f_InsertRtcs0005 (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*처리여부              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*점검예정일자(최초)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*점검예정시간(최초)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0005 (
            STD_YM,
            ORD_NO,
            EQU_NO,
            JOB_SEQ,
            TARGET_CD,
            MR_CD,
            R_MRCD,
            PROC_YN,
            NP_DESC,
            PLAN_DAY0,
            PLAN_TM0,
            PLAN_DAY,
            PLAN_TM,
            PROC_DAY,
            PROC_TM,
            CHK_STAT,
            SERV_SEQ,
            REQ_DESC,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            NP_CD,
            OB_ST,
            OB_ST_DTL,
            MR_MEMO
            )
    VALUES  (
            v_Std_Ym,
            v_Ord_No,
            v_Equ_No,
            v_Job_Seq,
            v_Target_Cd,
            v_Mr_Cd,
            v_R_Mrcd,
            v_Proc_Yn,
            v_Np_Desc,
            v_Plan_Day0,
            v_Plan_Tm0,
            v_Plan_Day,
            v_Plan_Tm,
            v_Proc_Day,
            v_Proc_Tm,
            v_Chk_Stat,
            v_Serv_Seq,
            v_Req_Desc,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            NULL,
            '01',
            '0101',
            NULL
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0005;

  /*****************************************************************************
  -- 방문점검 작업목록 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0005 (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*처리여부              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*점검예정일자(최초)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*점검예정시간(최초)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0005
    SET    TARGET_CD = v_Target_Cd,
           MR_CD     = v_Mr_Cd,
           R_MRCD    = v_R_Mrcd,
           PROC_YN   = v_Proc_Yn,
           NP_DESC   = v_Np_Desc,
           PLAN_DAY0 = v_Plan_Day0,
           PLAN_TM0  = v_Plan_Tm0,
           PLAN_DAY  = v_Plan_Day,
           PLAN_TM   = v_Plan_Tm,
           PROC_DAY  = v_Proc_Day,
           PROC_TM   = v_Proc_Tm,
           CHK_STAT  = v_Chk_Stat,
           SERV_SEQ  = v_Serv_Seq,
           REQ_DESC  = v_Req_Desc,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  STD_YM    = v_Std_Ym
    AND    ORD_NO    = v_Ord_No
    AND    EQU_NO    = v_Equ_No
    AND    JOB_SEQ   = v_Job_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0005;

  /*****************************************************************************
  -- 방문점검 작업목록 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0005 (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTCS0005
    WHERE  STD_YM  = v_Std_Ym
    AND    ORD_NO  = v_Ord_No
    AND    EQU_NO  = v_Equ_No
    AND    JOB_SEQ = v_Job_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.f_DeleteRtcs0005(2)', '기준년월  ', v_Std_Ym );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.f_DeleteRtcs0005(2)', '계약번호  ', v_Ord_No );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.f_DeleteRtcs0005(2)', '설비번호  ', v_Equ_No );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.f_DeleteRtcs0005(2)', '작업순번  ', v_Job_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.f_DeleteRtcs0005(2)', '등록자 ID', v_Reg_Id );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0005;

  /*****************************************************************************
  -- 방문점검 작업목록 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0005 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN OUT RTCS0005.JOB_SEQ%TYPE,    /*작업순번              */
    v_Target_Cd      IN RTCS0005.TARGET_CD%TYPE,      /*대상구분              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Yn        IN RTCS0005.PROC_YN%TYPE,        /*처리여부              */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Plan_Day0      IN RTCS0005.PLAN_DAY0%TYPE,      /*점검예정일자(최초)    */
    v_Plan_Tm0       IN RTCS0005.PLAN_TM0%TYPE,       /*점검예정시간(최초)    */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF 0 != ISDATE(TRIM(v_Std_Ym)) THEN
        v_Return_Message := '기준년월('||v_Std_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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

    IF (TRIM(v_Chk_Stat) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H008', v_Chk_Stat)) THEN
        v_Return_Message := '작업상태('||v_Chk_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        v_Job_Seq := f_sRtcs0005JobSeq(v_Std_Ym, v_Ord_No, v_Equ_No);

        IF 0 != f_InsertRtcs0005(v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq,
                                 v_Target_Cd, v_Mr_Cd, v_R_Mrcd, v_Proc_Yn,
                                 v_Np_Desc, v_Plan_Day0, v_Plan_Tm0, v_Plan_Day,
                                 v_Plan_Tm, v_Proc_Day, v_Proc_Tm, v_Chk_Stat,
                                 v_Serv_Seq, v_Req_Desc, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '방문점검 작업목록 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 = f_sRtcs0005Count(v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq) THEN
            v_Return_Message := '해당 정보는 등록된 데이터가 아니므로 변경/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcs0005(v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq,
                                     v_Target_Cd, v_Mr_Cd, v_R_Mrcd, v_Proc_Yn,
                                     v_Np_Desc, v_Plan_Day0, v_Plan_Tm0, v_Plan_Day,
                                     v_Plan_Tm, v_Proc_Day, v_Proc_Tm, v_Chk_Stat,
                                     v_Serv_Seq, v_Req_Desc, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '방문점검 작업목록 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0005(v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '방문점검 작업목록 삭제 실패!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.p_IUDRtcs0005(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.p_IUDRtcs0005(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0005;

  /*****************************************************************************
  -- 방문점검 작업목록 - 작업순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtcs0005JobSeq(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE            /*설비번호            */
    ) RETURN NUMBER IS
    v_Job_Seq RTCS0005.JOB_SEQ%TYPE DEFAULT NULL;       /*작업순번            */
  BEGIN

    SELECT  NVL((SELECT  MAX(JOB_SEQ)
                 FROM    RTCS0005
                 WHERE   STD_YM  = v_Std_Ym
                 AND     ORD_NO  = v_Ord_No
                 AND     EQU_NO  = v_Equ_No)+ 1, 1) AS JOB_SEQ
    INTO    v_Job_Seq
    FROM    DUAL;

    RETURN v_Job_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0005JobSeq;

  /*****************************************************************************
  -- 방문점검 작업목록 Select  - 검검 작업목록 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.1        2016-07-13  이영근           전월연체여부 추가
   1.2        2016-07-25  이영근           처리자 추가
   1.5        2017-05-22  wjim             [20170522_01] 담당자, 처리자 분리
                                           - 기존 '처리자'는 '담당자'로 명칭 변경
                                           - '처리자'는 추가 : 실제 서비스확인서 작성자를 의미
   1.10       2017-06-16  wjim             [20170616_01] 구주소 추가                                           
  *****************************************************************************/
  PROCEDURE p_sRtcs0005JobList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE           /*Mr. Roadian코드       */
    ) IS

    v_Org_Main_Yn  RTCS0002.ORG_MAIN_YN%TYPE := 'N';
    v_Org_Com_Cd   RTCS0002.ORG_COM_CD%TYPE;
    
  BEGIN

    IF v_Mr_Cd IS NOT NULL THEN
        
        SELECT ORG_COM_CD, ORG_MAIN_YN
        INTO v_Org_Com_Cd, v_Org_Main_Yn
        FROM RTCS0002
        WHERE CARMASTER_NU = v_Mr_Cd;
        
    END IF;
    
    OPEN Ref_Cursor FOR
    SELECT  A.PLAN_DAY,                  /*점검예정일자        */
            A.PLAN_TM,                   /*점검예정시간        */
            A.CHK_STAT,                  /*작업상태            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H008', A.CHK_STAT) CHK_STAT_NM, /*작업상태            */
            A.PROC_DAY,                  /*점검처리일자        */
            A.PROC_TM,                   /*점검처리시간        */
            A.ORD_NO,                    /*계약번호            */
            B.CUST_NO,                   /*고객코드            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(B.CUST_NO) CUST_NAME,     /*고객명       */
            B.CAR_NO,                    /*차량번호            */
            C.MAT_CD,                    /*상품코드            */
            Pkg_Rtsd0005.f_sRtsd0005MatName(C.MAT_CD) MAT_NM,          /*상품명       */
            B.CNT_CD,                    /*타이어본수          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', B.CNT_CD) CNT_NM, /*타이어본수   */
            DECODE(A.CHK_STAT, '04', D.A_MILEAGE, NULL) A_MILEAGE,     /*주행거리     */
            E.C_MILEAGE,                 /*주행거리(계약)      */
            B.PROC_DAY PROC_DAYB,        /*장착일자            */
            F.MOB_NO,                    /*핸드폰              */
            F.TEL_NO,                    /*전화번호            */
            F.POSCD,                     /*우편번호            */
            F.ADDR1,                     /*주소                */
            TRIM(NVL(G.H_DNG_NM, G.B_DNG_NM)||NVL2(G.B_RI_NM, ' '||G.B_RI_NM, '')||' '||NVL2(G.LOT_MB, G.LOT_MB||'-'||G.LOT_SB, '')) AS ADDR1_OLD, /* 구주소 [20170616_01] */
            F.ADDR2,                     /*상세주소            */
            A.STD_YM,                    /*기준년월            */
            A.EQU_NO,                    /*설비번호            */
            A.JOB_SEQ,                   /*작업순번            */
            F.SEQ,                       /*순번                */
            DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(B.CUST_NO, NULL, TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE(v_Std_Ym,'YYYYMM'),-1)),'YYYYMMDD')),0,'N','Y') AS DELY_YN, /* 연체여부 */
            (SELECT G.USER_NM FROM RTCM0001 G WHERE G.USER_ID = A.MR_CD AND G.USER_GRP = '08') AS MR_NM,  /* 담당자명 */
            (SELECT G.USER_NM FROM RTCM0001 G WHERE G.USER_ID = A.R_MRCD AND G.USER_GRP = '08') AS R_MRNM /* 처리자명 [20170522_01] */
    FROM    RTCS0005 A,                  /*방문점검 작업목록   */
            RTSD0108 B,                  /*장착 정보           */
            RTCS0001 C,                  /*설비 정보           */
            RTCS0007 D,                  /*서비스 처리내역     */
            RTSD0104 E,                  /*계약 정보           */
            RTCS0006 F,                  /*방문점검 작업정보 변경*/
            RTSD0010 G
    WHERE   A.STD_YM    = v_Std_Ym
    AND     A.ORD_NO    LIKE v_Ord_No||'%'
--    AND     A.MR_CD     LIKE v_Mr_Cd||'%'
    AND     (
                (v_Org_Main_Yn = 'Y' AND A.MR_CD IN (SELECT CARMASTER_NU FROM RTCS0002 WHERE ORG_COM_CD = v_Org_Com_Cd))
                OR
                (v_Org_Main_Yn = 'N' AND A.MR_CD     LIKE v_Mr_Cd||'%')
            )  --[20210309_01] kstka 로디안 그룹별 실적 조회
    --AND     A.TARGET_CD <> '3' -- 2016-01-06 고객번호 전월말일 기준 연체 금액이 존재하면 조회대상 제외
    AND     A.ORD_NO    = B.ORD_NO
    AND     A.EQU_NO    = C.EQU_NO
    AND     A.ORD_NO    = C.ORD_NO
    AND     A.EQU_NO    = D.EQU_NO(+)
    AND     A.ORD_NO    = D.ORD_NO(+)
    AND     A.SERV_SEQ  = D.SERV_SEQ(+)
    AND     A.ORD_NO    = E.ORD_NO
    AND     F.ROWID     = ( SELECT  /*+ INDEX_DESC(Z RTCS0006_PK) */
                                    Z.ROWID
                            FROM    RTCS0006 Z
                            WHERE   Z.STD_YM    = A.STD_YM
                            AND     Z.ORD_NO    = A.ORD_NO
                            AND     Z.EQU_NO    = A.EQU_NO
                            AND     Z.JOB_SEQ   = A.JOB_SEQ
                            AND     ROWNUM <= 1
                            )
    AND     F.BLD_MNG_NO= G.BLD_MNG_NO(+)                            
    ;

  END p_sRtcs0005JobList;

  /*****************************************************************************
  -- 방문점검 작업목록 Update - 검검 작업목록 조회-정보변경-저장시 정보변경
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0005Info (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Mr_Cd          IN RTCS0005.MR_CD%TYPE,          /*Mr. Roadian코드       */
    v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0005.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0005
    SET    MR_CD     = v_Mr_Cd,
           PLAN_DAY  = v_Plan_Day,
           PLAN_TM   = v_Plan_Tm,
           REQ_DESC  = v_Req_Desc,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  STD_YM    = v_Std_Ym
    AND    ORD_NO    = v_Ord_No
    AND    EQU_NO    = v_Equ_No
    AND    JOB_SEQ   = v_Job_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0005Info;


  /*****************************************************************************
  -- 방문점검 작업목록 Select - 점검 작업목록조회 - 처리결과 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.5        2017-05-22  wjim             [20170522_01] 처리자 추가
  *****************************************************************************/
  PROCEDURE p_sRtcs0005Result (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.STD_YM,                    /*기준년월            */
            A.ORD_NO,                    /*계약번호            */
            A.EQU_NO,                    /*설비번호            */
            A.JOB_SEQ,                   /*작업순번            */
            A.CHK_STAT,                  /*작업상태            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H008', A.CHK_STAT) CHK_STAT_NM, /*작업상태     */
            A.NP_DESC,                   /*미처리사유          */
            DECODE(A.CHK_STAT, '04', B.A_MILEAGE, NULL) A_MILEAGE,            /*주행거리     */
            DECODE(A.CHK_STAT, '04', B.PROC_DAY, NULL)  PROC_DAY,             /*처리일자     */
            DECODE(A.CHK_STAT, '04', B.PROC_TM, NULL)   PROC_TM,              /*처리일자     */
            A.R_MRCD,                                                                                     /*처리자ID [20170522_01] */
            (SELECT G.USER_NM FROM RTCM0001 G WHERE G.USER_ID = A.R_MRCD AND G.USER_GRP = '08') AS R_MRNM /*처리자명 [20170522_01] */ 
    FROM    RTCS0005 A,                  /*방문점검 작업목록   */
            RTCS0007 B                   /*서비스 처리내역     */
    WHERE   A.STD_YM    = v_Std_Ym
    AND     A.ORD_NO    = v_Ord_No
    AND     A.EQU_NO    = v_Equ_No
    AND     A.JOB_SEQ   = v_Job_Seq
    AND     A.EQU_NO    = B.EQU_NO(+)
    AND     A.ORD_NO    = B.ORD_NO(+)
    AND     A.SERV_SEQ  = B.SERV_SEQ(+);

  END p_sRtcs0005Result;

  /*****************************************************************************
  -- 방문점검 작업목록 - 미처리사유 업데이트
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-01-10  wjim             미처리코드 추가
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0005NpDesc (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Np_Cd          IN RTCS0005.NP_CD%TYPE,          /*미처리코드            */
    v_Np_Desc        IN RTCS0005.NP_DESC%TYPE,        /*미처리사유            */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
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

    /* 2016-08-05 이영근, 방문점검은 수수료가 없으므로 마감과 연관없음
    IF (TRIM(v_Std_Ym) <> TO_CHAR(SYSDATE, 'YYYYMM')) AND (0 = Pkg_Rtcm0051.f_sRtcm0051UseCount('H010', SUBSTR(v_Std_Ym,3,4))) THEN
        v_Return_Message := '해당 대상년월 데이터는 이미 마감되었으므로 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    */
    
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Equ_No) IS NULL) OR (0 = Pkg_Rtcs0001.f_sRtcs0001Count(v_Equ_No)) THEN
        v_Return_Message := '설비번호('||v_Equ_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Job_Seq) IS NULL THEN
        v_Return_Message := '작업순번('||v_Job_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Np_Cd) IS NULL THEN
        v_Return_Message := '미처리코드('||v_Np_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcs0005Count(v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq) THEN
        v_Return_Message := '해당 정보는 등록된 데이터가 아니므로 변경처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    UPDATE RTCS0005
    SET    NP_DESC   = v_Np_Desc,
           NP_CD     = v_Np_Cd,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  STD_YM    = v_Std_Ym
    AND    ORD_NO    = v_Ord_No
    AND    EQU_NO    = v_Equ_No
    AND    JOB_SEQ   = v_Job_Seq;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.f_UpdateRtcs0005(1)', v_ErrorText, v_Return_Message);
      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.f_UpdateRtcs0005(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtcs0005NpDesc;


  /*****************************************************************************
  -- 방문점검 작업목록 Update -  서비스 확인서 서명완료 등록
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0005ServiceSign (
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_R_Mrcd         IN RTCS0005.R_MRCD%TYPE,         /*실제처리자(Mr. Roadian*/
    v_Proc_Day       IN RTCS0005.PROC_DAY%TYPE,       /*점검처리일자          */
    v_Proc_Tm        IN RTCS0005.PROC_TM%TYPE,        /*점검처리시간          */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Serv_Seq       IN RTCS0005.SERV_SEQ%TYPE,       /*서비스 순번           */
    v_Reg_Id         IN RTCS0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0005
    SET    R_MRCD    = v_R_Mrcd,
           PROC_DAY  = v_Proc_Day,
           PROC_TM   = v_Proc_Tm,
           CHK_STAT  = v_Chk_Stat,
           SERV_SEQ  = v_Serv_Seq,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  STD_YM    = v_Std_Ym
    AND    ORD_NO    = v_Ord_No
    AND    EQU_NO    = v_Equ_No
    AND    JOB_SEQ   = v_Job_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0005ServiceSign;



  /*****************************************************************************
  -- 방문점검 작업목록 - 작업상태 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0005ChkStat(
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0005.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0005.EQU_NO%TYPE,           /*설비번호            */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE           /*작업순번            */
    ) RETURN VARCHAR IS
    v_Chk_Stat    RTCS0005.CHK_STAT%TYPE DEFAULT NULL;  /*작업상태            */
  BEGIN

    SELECT  CHK_STAT
    INTO    v_Chk_Stat
    FROM    RTCS0005
    WHERE   STD_YM  = v_Std_Ym
    AND     ORD_NO  = v_Ord_No
    AND     EQU_NO  = v_Equ_No
    AND     JOB_SEQ = v_Job_Seq;

    RETURN v_Chk_Stat;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0005ChkStat;
  
  /*****************************************************************************
  -- 방문점검 컨택목록 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-24  wjim             [20170324_02] 신규개발
   1.4        2017-04-25  wjim             [20170425_01] 조회항목 추가
                                           - 배정구분, 처리상태
   1.6        2017-05-22  wjim             [20170522_03] 방문점검 컨택목록조회 로디안명 조회기준 변경
                                           - 변경전 : 사용자 마스터 정보 참조
                                           - 변경후 : 로디안 마스터 정보 참조
   1.8        2017-06-05  wjim             [20170605_01] 처리일자 추가
   1.9        2017-06-08  wjim             [20170608_01] 방문점검 컨택목록 조회조건(처리상태) 추가
   1.10       2017-06-16  wjim             [20170616_01] 구주소 추가
   1.12       2017-09-07  wjim             [20170907_01] 방문점검 컨택목록 조회누락 보완
   1.13       2017-12-12  wjim             [20171212_01] 조회조건 및 조회항목 추가
                                           - 조회조건 : 계약번호
                                           - 조회항목 : 장착일, 서비스횟수, 잔여횟수, 차종
   1.15       2019-04-09  wjim             [20190409_01] 방문점검 컨택목록 예정일 정렬 추가
  *****************************************************************************/
  PROCEDURE p_sRtcs0005CallList (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*기준년월              */
    , v_Do_Nm          IN RTSD0010.DO_NM%TYPE         /*광역시도              */
    , v_Ct_Nm          IN RTSD0010.CT_NM%TYPE         /*시군구                */
    , v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*고객명                */
    , v_Mob_No         IN RTCS0006.MOB_NO%TYPE        /*연락처                */
    , v_Ob_St          IN RTCS0005.OB_ST%TYPE         /*컨택상태              */
    , v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE     /*컨택세부상태          */
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*예정일자              */
    , v_Reg_Id         IN RTCS0005.REG_ID%TYPE        /*등록자 ID             */
    , v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE      /*처리상태              */
    , v_Ord_No         IN RTCS0005.ORD_NO%TYPE        /*계약번호              */ --[20171212_01]
  ) IS
  
    v_Dely_Day      RTRE0100.DELY_DAY%TYPE DEFAULT NULL;    /*마지막 연체집계 일자  */

    v_Org_Main_Yn  RTCS0002.ORG_MAIN_YN%TYPE := 'N';
    v_Org_Com_Cd   RTCS0002.ORG_COM_CD%TYPE;
    
  BEGIN
  
    -- 마지막 연체집계일 조회
    SELECT  MAX(DELY_DAY)
      INTO  v_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';

    --[20210309_01] kstka 그룹별 실적 조회
    IF v_Mr_Cd IS NOT NULL THEN
    
        SELECT ORG_COM_CD, ORG_MAIN_YN
        INTO v_Org_Com_Cd, v_Org_Main_Yn
        FROM RTCS0002
        WHERE CARMASTER_NU = v_Mr_Cd;
        
    END IF;
    
    OPEN Ref_Cursor FOR
    SELECT  A1.STD_YM
         ,  A1.ORD_NO
         ,  A1.EQU_NO
         ,  A1.JOB_SEQ
         ,  B1.SEQ  
         ,  A1.MR_CD                                  /*담당자ID              */
--         ,  I1.USER_NM                                /*담당자명              */
         ,  I1.CARMASTER_NM AS USER_NM                /*담당자명              */
         ,  A1.PLAN_DAY                               /*점검예정일자          */
         ,  A1.PLAN_TM                                /*배정예정시간          */
         ,  D1.CUST_NM                                /*고객명                */
         ,  C1.CAR_NO                                 /*차량번호              */
         ,(SELECT T1.MAT_NM || ' (외 ' || (SELECT COUNT(1)-1 FROM RTSD0106 S WHERE S.ORD_NO = A1.ORD_NO) ||'건)'  
             FROM RTSD0106 T, RTSD0005 T1 
            WHERE T.ORD_NO = A1.ORD_NO 
              AND T.MAT_CD = T1.MAT_CD(+) 
            GROUP BY T1.MAT_NM) AS MAT_NM             /*상품명                */
         ,  H1.CD_NM                 AS CNT_NM        /*본수                  */
         ,  B1.MOB_NO                                 /*핸드폰                */
         ,  B1.TEL_NO                                 /*전화번호              */
         ,  B1.BLD_MNG_NO                             /*빌딩번호              */
         ,  B1.POSCD                                  /*우편번호              */         
         ,  B1.ADDR1                                  /*주소1                 */
         ,  TRIM(NVL(N1.H_DNG_NM, N1.B_DNG_NM)||NVL2(N1.B_RI_NM, ' '||N1.B_RI_NM, '')||' '||NVL2(N1.LOT_MB, N1.LOT_MB||'-'||N1.LOT_SB, '')) AS ADDR1_OLD /* 구주소1 [20170616_01] */
         ,  B1.ADDR2                                  /*주소2                 */
         ,  NVL(J1.CALL_CNT,0)       AS CALL_CNT      /*컨택횟수              */
         ,  NVL(A1.OB_ST,'01')       AS OB_ST         /*컨택상태              */
         ,  NVL(A1.OB_ST_DTL,'0101') AS OB_ST_DTL     /*컨택세부상태          */
         ,  A1.MR_MEMO                                /*로디안전달사항        */
         ,  NVL(K1.APPR_SCNT,0)      AS APPR_SCNT     /*렌탈료연체횟수        */
         ,  CASE 
                WHEN L1.ORD_NO IS NULL THEN
                    '이관'
                ELSE
                    DECODE(L1.TARGET_CD,'1','당월대상','2','이관','4','전월미처리','3',DECODE(SUBSTR(L1.PLAN_DAY,1,6),A1.STD_YM,'당월대상','전월미처리'),'기타')
            END                      AS TARGET_NM     /*배정구분              */
         ,  M1.CD_NM                 AS CHK_STAT      /*처리상태              */
         ,  A1.PROC_DAY                               /*처리일자              */ --[20170605_01]
         ,  C1.PROC_DAY              AS PROC_DAY2     /*장착일자              */ --[20171212_01]
         ,  O1.CD_NM||' '||P1.CD_NM  AS MODEL_NM      /*차종                  */ --[20171212_01]
         ,  Q1.SERV_CNT0                              /*방문점검 최초횟수     */ --[20171212_01] 
         ,  Q1.SERV_CNT0 - Q1.SERV_CNTR AS SERV_CNT   /*방문점검 사용횟수     */ --[20171212_01] 
         ,  Q1.SERV_CNTR                              /*방문점검 잔여횟수     */ --[20171212_01]
         ,  D1.MOB_NO AS MOB_NO2
         ,  TO_CHAR(ADD_MONTHS(C1.PROC_DAY, C1.PERIOD_CD), 'YYYYMMDD') AS OS_DAY
      FROM  RTCS0005 A1
         ,  (
                SELECT  ROW_NUMBER() OVER (PARTITION BY X.STD_YM, X.ORD_NO, X.EQU_NO, X.JOB_SEQ ORDER BY X.SEQ DESC) AS ROW_NUM
                     ,  X.*
                  FROM  RTCS0006 X
            ) B1
         ,  RTSD0108 C1
         ,  RTSD0100 D1
--         ,  RTSD0106 E1
--         ,  RTSD0005 F1
--         ,  RTSD0010 G1
         ,  RTCM0051 H1
--         ,  RTCM0001 I1
         ,  RTCS0002 I1 --[20170522_03]
         ,  (
                SELECT  ORD_NO
                     ,  COUNT(*) AS CALL_CNT
                  FROM  RTCS0012
                 WHERE  1=1 
                 GROUP  BY ORD_NO     
            ) J1
         ,  RTRE0100 K1
         ,  RTCS0004 L1
         ,  RTCM0051 M1
         ,  RTSD0010 N1
         ,  RTCM0051 O1
         ,  RTCM0051 P1
         ,  RTSD0013 Q1
     WHERE  1=1
--       AND  A1.MR_CD        = DECODE(v_Mr_Cd    , NULL, A1.MR_CD   , v_Mr_Cd     )  
       AND  (
                (v_Org_Main_Yn = 'Y' AND A1.MR_CD IN (SELECT CARMASTER_NU FROM RTCS0002 WHERE ORG_COM_CD = v_Org_Com_Cd))
                OR
                (v_Org_Main_Yn = 'N' AND A1.MR_CD        = DECODE(v_Mr_Cd    , NULL, A1.MR_CD   , v_Mr_Cd     )  )
            )   --[20210309_01] kstka 그룹별 실적조회
       AND  A1.STD_YM       = DECODE(v_Std_Ym   , NULL, A1.STD_YM  , v_Std_Ym    ) 
       AND  (
                B1.MOB_NO   = DECODE(v_Mob_No   , NULL, B1.MOB_NO   , v_Mob_No   )
                OR
                B1.TEL_NO   = DECODE(v_Mob_No   , NULL, B1.TEL_NO   , v_Mob_No   )
            )
       AND  A1.PLAN_DAY     = DECODE(v_Plan_Day , NULL, A1.PLAN_DAY , v_Plan_Day )
       AND  A1.OB_ST        = DECODE(v_Ob_St    , NULL, A1.OB_ST    , v_Ob_St    )   
       AND  A1.OB_ST_DTL    = DECODE(v_Ob_St_Dtl, NULL, A1.OB_ST_DTL, v_Ob_St_Dtl)
       AND  A1.CHK_STAT     = DECODE(v_Chk_Stat , NULL, A1.CHK_STAT , v_Chk_Stat ) --[20170608_01]
       AND  A1.ORD_NO       = DECODE(v_Ord_No   , NULL, A1.ORD_NO   , v_Ord_No   ) --[20171212_01]
       AND  A1.STD_YM       = B1.STD_YM
       AND  A1.ORD_NO       = B1.ORD_NO
       AND  A1.EQU_NO       = B1.EQU_NO
       AND  A1.JOB_SEQ      = B1.JOB_SEQ
       AND  B1.ROW_NUM      = 1
       AND  A1.ORD_NO       = C1.ORD_NO
       AND  C1.CUST_NO      = D1.CUST_NO
       AND  D1.CUST_NM   LIKE DECODE(v_Cust_Nm  , NULL, '' , v_Cust_Nm)||'%'   
--       AND  C1.ORD_NO       = E1.ORD_NO   
--       AND  E1.MAT_CD       = F1.MAT_CD(+)
--       AND  B1.BLD_MNG_NO   = G1.BLD_MNG_NO(+)
--       AND  G1.DO_NM     LIKE DECODE(v_Do_Nm    , NULL, ''   , v_Do_Nm  )||'%'
--       AND  G1.CT_NM     LIKE DECODE(v_Ct_Nm    , NULL, ''   , v_Ct_Nm  )||'%'
       AND  (B1.ADDR1 IS NULL OR B1.ADDR1     LIKE '%'||DECODE(v_Do_Nm    , NULL, ''   , v_Do_Nm  )||'%') --[20170907_01] OUTER JOIN 추가
       AND  (B1.ADDR1 IS NULL OR B1.ADDR1     LIKE '%'||DECODE(v_Ct_Nm    , NULL, ''   , v_Ct_Nm  )||'%') --[20170907_01] OUTER JOIN 추가
       AND  C1.CNT_CD       = H1.CD(+)
       AND  H1.CD_GRP_CD(+) = 'S022'
--       AND  A1.MR_CD        = I1.USER_ID(+)
--       AND  I1.USER_GRP(+)  = '08' 
       AND  A1.MR_CD        = I1.CARMASTER_NU(+)
       AND  A1.ORD_NO       = J1.ORD_NO(+)
       AND  A1.ORD_NO       = K1.ORD_NO(+)
       AND  K1.DELY_DAY(+)  = v_Dely_Day
       AND  K1.RECP_TP(+)   = '11'
       AND  A1.STD_YM       = L1.STD_YM(+)
       AND  A1.ORD_NO       = L1.ORD_NO(+)
       AND  A1.EQU_NO       = L1.EQU_NO(+)
       AND  A1.CHK_STAT     = M1.CD(+)
       AND  M1.CD_GRP_CD(+) = 'H008'
       AND  B1.BLD_MNG_NO   = N1.BLD_MNG_NO(+)
       AND  C1.MODEL_CD     = O1.CD(+)
       AND  O1.CD_GRP_CD(+) = 'S002'
       AND  C1.CONTENTS_CD  = P1.CD(+)
       AND  P1.CD_GRP_CD(+) = 'S003'
       AND  C1.ORD_NO       = Q1.ORD_NO(+)
       AND  C1.PS_CD        = Q1.PS_CD(+)       
       AND  C1.CNT_CD       = Q1.CNT_CD(+)
       AND  Q1.PRS_DCD(+)   = 'B00003'
     ORDER  BY A1.PLAN_DAY                      --[20190409_01]
    ;

  END p_sRtcs0005CallList;
  
  /*****************************************************************************
  -- 방문점검 컨택목록 조회(엑셀다운로드용)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-29  wjim             [20170324_02] 신규개발
   1.6        2017-05-22  wjim             [20170522_03] 방문점검 컨택목록조회 로디안명 조회기준 변경
                                           - 변경전 : 사용자 마스터 정보 참조
                                           - 변경후 : 로디안 마스터 정보 참조
   1.7        2017-06-02  wjim             [20170602_01] 처리상태 추가
   1.8        2017-06-05  wjim             [20170605_01] 처리일자 추가
   1.9        2017-06-08  wjim             [20170608_01] 방문점검 컨택목록 조회조건(처리상태) 추가
   1.10       2017-06-16  wjim             [20170616_01] 구주소 추가
   1.12       2017-09-07  wjim             [20170907_01] 방문점검 컨택목록 조회누락 보완
   1.13       2017-12-12  wjim             [20171212_01] 조회조건 및 조회항목 추가
                                           - 조회조건 : 계약번호
                                           - 조회항목 : 장착일, 서비스횟수, 잔여횟수, 차종
   1.14       2018-03-22  wjim             [20180322_01] 배정구분 추가                                           
  *****************************************************************************/
  PROCEDURE p_sRtcs0005CallExcelList (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*기준년월              */
    , v_Do_Nm          IN RTSD0010.DO_NM%TYPE         /*광역시도              */
    , v_Ct_Nm          IN RTSD0010.CT_NM%TYPE         /*시군구                */
    , v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*고객명                */
    , v_Mob_No         IN RTCS0006.MOB_NO%TYPE        /*연락처                */
    , v_Ob_St          IN RTCS0005.OB_ST%TYPE         /*컨택상태              */
    , v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE     /*컨택세부상태          */
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*예정일자              */
    , v_Reg_Id         IN RTCS0005.REG_ID%TYPE        /*등록자 ID             */
    , v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE      /*처리상태              */
    , v_Ord_No         IN RTCS0005.ORD_NO%TYPE        /*계약번호              */ --[20171212_01]
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.STD_YM
         ,  A1.ORD_NO
         ,  A1.EQU_NO
         ,  A1.JOB_SEQ
         ,  B1.SEQ  
--         ,  I1.USER_NM                                /*담당자명              */
         ,  I1.CARMASTER_NM AS USER_NM                /*담당자명              */
         ,  A1.PLAN_DAY                               /*점검예정일자          */
         ,  D1.CUST_NM                                /*고객명                */
         ,  C1.CAR_NO                                 /*차량번호              */
         ,(SELECT T1.MAT_NM || ' (외 ' || (SELECT COUNT(1)-1 FROM RTSD0106 S WHERE S.ORD_NO = A1.ORD_NO) ||'건)'  
             FROM RTSD0106 T, RTSD0005 T1 
            WHERE T.ORD_NO = A1.ORD_NO 
              AND T.MAT_CD = T1.MAT_CD(+) 
            GROUP BY T1.MAT_NM) AS MAT_NM             /*상품명                */
         ,  H1.CD_NM                 AS CNT_NM        /*본수                  */
         ,  B1.MOB_NO                                 /*핸드폰                */
         ,  B1.TEL_NO                                 /*전화번호              */
         ,  B1.ADDR1                                  /*주소1                 */
         ,  TRIM(NVL(N1.H_DNG_NM, N1.B_DNG_NM)||NVL2(N1.B_RI_NM, ' '||N1.B_RI_NM, '')||' '||NVL2(N1.LOT_MB, N1.LOT_MB||'-'||N1.LOT_SB, '')) AS ADDR1_OLD /* 구주소1 [20170616_01] */
         ,  B1.ADDR2                                  /*주소2                 */
         ,  K1.CD_NM                 AS OB_ST         /*컨택상태              */
         ,  L1.CD_NM                 AS OB_ST_DTL     /*컨택세부상태          */
         ,  NVL(J1.CALL_CNT,0)       AS CALL_CNT      /*컨택횟수              */
         ,  J1.CALL_DAY                               /*상담일자              */
         ,  J1.CALL_DTL                               /*상담내용              */
         ,  J1.REG_ID                                 /*등록자                */
         ,  M1.CD_NM                 AS CHK_STAT      /*처리상태              */ --[20170602_01]
         ,  A1.PROC_DAY                               /*처리일자              */ --[20170602_01]
         ,  C1.PROC_DAY              AS PROC_DAY2     /*장착일자              */ --[20171212_01]
         ,  O1.CD_NM||' '||P1.CD_NM  AS MODEL_NM      /*차종                  */ --[20171212_01]
         ,  Q1.SERV_CNT0                              /*방문점검 최초횟수     */ --[20171212_01] 
         ,  Q1.SERV_CNT0 - Q1.SERV_CNTR AS SERV_CNT   /*방문점검 사용횟수     */ --[20171212_01] 
         ,  Q1.SERV_CNTR                              /*방문점검 잔여횟수     */ --[20171212_01]
         ,  CASE 
                WHEN R1.ORD_NO IS NULL THEN
                    '이관'
                ELSE
                    DECODE(R1.TARGET_CD,'1','당월대상','2','이관','4','전월미처리','3',DECODE(SUBSTR(R1.PLAN_DAY,1,6),A1.STD_YM,'당월대상','전월미처리'),'기타')
            END                      AS TARGET_NM     /*배정구분              */ --[20180322_01]
      FROM  RTCS0005 A1
         ,  (
                SELECT  ROW_NUMBER() OVER (PARTITION BY X.STD_YM, X.ORD_NO, X.EQU_NO, X.JOB_SEQ ORDER BY X.SEQ DESC) AS ROW_NUM
                     ,  X.*
                  FROM  RTCS0006 X
            ) B1
         ,  RTSD0108 C1
         ,  RTSD0100 D1
--         ,  RTSD0106 E1
--         ,  RTSD0005 F1
         ,  RTSD0010 G1
         ,  RTCM0051 H1
--         ,  RTCM0001 I1
         ,  RTCS0002 I1 --[20170522_03]
         ,  (
                SELECT  COUNT(*) OVER (PARTITION BY X.ORD_NO) AS CALL_CNT
                     ,  X.*
                  FROM  RTCS0012 X
            ) J1
         ,  RTCM0051 K1
         ,  RTCM0051 L1
         ,  RTCM0051 M1
         ,  RTSD0010 N1
         ,  RTCM0051 O1
         ,  RTCM0051 P1
         ,  RTSD0013 Q1
         ,  RTCS0004 R1
     WHERE  1=1
       AND  A1.MR_CD        = DECODE(v_Mr_Cd    , NULL, A1.MR_CD   , v_Mr_Cd     )  
       AND  A1.STD_YM       = DECODE(v_Std_Ym   , NULL, A1.STD_YM  , v_Std_Ym    ) 
       AND  (
                B1.MOB_NO   = DECODE(v_Mob_No   , NULL, B1.MOB_NO   , v_Mob_No   )
                OR
                B1.TEL_NO   = DECODE(v_Mob_No   , NULL, B1.TEL_NO   , v_Mob_No   )
            )
       AND  A1.PLAN_DAY     = DECODE(v_Plan_Day , NULL, A1.PLAN_DAY , v_Plan_Day )
       AND  A1.OB_ST        = DECODE(v_Ob_St    , NULL, A1.OB_ST    , v_Ob_St    )   
       AND  A1.OB_ST_DTL    = DECODE(v_Ob_St_Dtl, NULL, A1.OB_ST_DTL, v_Ob_St_Dtl)
       AND  A1.CHK_STAT     = DECODE(v_Chk_Stat , NULL, A1.CHK_STAT , v_Chk_Stat ) --[20170608_01]
       AND  A1.ORD_NO       = DECODE(v_Ord_No   , NULL, A1.ORD_NO   , v_Ord_No   ) --[20171212_01]
       AND  A1.STD_YM       = B1.STD_YM
       AND  A1.ORD_NO       = B1.ORD_NO
       AND  A1.EQU_NO       = B1.EQU_NO
       AND  A1.JOB_SEQ      = B1.JOB_SEQ
       AND  B1.ROW_NUM      = 1
       AND  A1.ORD_NO       = C1.ORD_NO
       AND  C1.CUST_NO      = D1.CUST_NO
       AND  D1.CUST_NM   LIKE DECODE(v_Cust_Nm  , NULL, '' , v_Cust_Nm)||'%'   
--       AND  C1.ORD_NO       = E1.ORD_NO   
--       AND  E1.MAT_CD       = F1.MAT_CD(+)
       AND  B1.BLD_MNG_NO   = G1.BLD_MNG_NO(+)
       AND  G1.DO_NM(+)     LIKE DECODE(v_Do_Nm    , NULL, ''   , v_Do_Nm  )||'%' --[20170907_01] OUTER JOIN 추가
       AND  G1.CT_NM(+)     LIKE DECODE(v_Ct_Nm    , NULL, ''   , v_Ct_Nm  )||'%' --[20170907_01] OUTER JOIN 추가
       AND  C1.CNT_CD       = H1.CD(+)
       AND  H1.CD_GRP_CD(+) = 'S022'
--       AND  A1.MR_CD        = I1.USER_ID(+)
--       AND  I1.USER_GRP(+)  = '08' 
       AND  A1.MR_CD        = I1.CARMASTER_NU(+)
       AND  A1.ORD_NO       = J1.ORD_NO(+)
       AND  A1.OB_ST        = K1.CD(+)
       AND  K1.CD_GRP_CD(+) = 'C027'
       AND  A1.OB_ST_DTL    = L1.CD(+)
       AND  L1.CD_GRP_CD(+) = 'C028'
       AND  A1.CHK_STAT     = M1.CD(+)
       AND  M1.CD_GRP_CD(+) = 'H008'
       AND  B1.BLD_MNG_NO   = N1.BLD_MNG_NO(+)
       AND  C1.MODEL_CD     = O1.CD(+)
       AND  O1.CD_GRP_CD(+) = 'S002'
       AND  C1.CONTENTS_CD  = P1.CD(+)
       AND  P1.CD_GRP_CD(+) = 'S003'
       AND  C1.ORD_NO       = Q1.ORD_NO(+)
       AND  C1.PS_CD        = Q1.PS_CD(+)       
       AND  C1.CNT_CD       = Q1.CNT_CD(+)
       AND  Q1.PRS_DCD(+)   = 'B00003'
       AND  A1.STD_YM       = R1.STD_YM(+)
       AND  A1.ORD_NO       = R1.ORD_NO(+)
       AND  A1.EQU_NO       = R1.EQU_NO(+);

  END p_sRtcs0005CallExcelList;
  
  /*****************************************************************************
  -- 월별 로디안별 방문점검 컨택 완료건수 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-04-06  wjim             [20170406_01] 신규개발
  *****************************************************************************/
  PROCEDURE p_sRtcs0005MrMonDecideCnt (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*조회년월              */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.CAL_MON
         ,  A1.CAL_DAY
         ,  A1.CAL_DAT
         ,  NVL(B1.CNT_JOB, 0) AS CNT_JOB
      FROM  (
                SELECT  TO_CHAR(DATES, 'YYYYMM')   AS CAL_MON
                     ,  TO_CHAR(DATES, 'YYYYMMDD') AS CAL_DAY
                     ,  TO_CHAR(DATES, 'DY')       AS CAL_DAT
--                     ,  TO_CHAR(DATES, 'D') - TO_CHAR(DATES, 'DD') AS CAL_WEEK
                  FROM  (     
                            SELECT  TO_DATE(v_Std_Ym||LPAD(LEVEL,2,'0')) AS DATES 
                              FROM  DUAL
                           CONNECT  BY TO_DATE(v_Std_Ym||'01','YYYYMMDD') + LEVEL - 1 <= LAST_DAY(TO_DATE(v_Std_Ym,'YYYYMM'))
                        )  
            ) A1
         ,  (
                SELECT  PLAN_DAY
                     ,  COUNT(*) CNT_JOB
                  FROM  RTCS0005
                 WHERE  PLAN_DAY  LIKE v_Std_Ym||'%'
                   AND  MR_CD        = v_Mr_Cd
                   AND  OB_ST        IN ('03')  -- 컨택상태=완료
                   AND  CHK_STAT NOT IN ('04')  -- 처리완료건 제외
                 GROUP  BY MR_CD
                     ,  PLAN_DAY
            ) B1
     WHERE  A1.CAL_DAY = B1.PLAN_DAY(+)
     ORDER  BY CAL_DAY;

  END p_sRtcs0005MrMonDecideCnt;
  
  /*****************************************************************************
  -- 일자별 로디안별 방문점검 컨택 완료건 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-04-06  wjim             [20170406_01] 신규개발
   1.3        2017-04-10  wjim             [20170410_01] 일자별 로디안별 방문점검 컨택 완료건 조회 오류 수정
                                           --  방문점검 작업정보 변경 grouping 오류 수정
  *****************************************************************************/
  PROCEDURE p_sRtcs0005MrDayDecide (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*조회일                */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR    
    SELECT  A1.MR_CD
         ,  A1.PLAN_DAY
         ,  A1.PLAN_TM
         ,  A1.STD_YM
         ,  A1.ORD_NO
         ,  A1.EQU_NO
         ,  A1.JOB_SEQ
         ,  C1.DO_NM
         ,  C1.CT_NM
      FROM  RTCS0005 A1
         ,  (
--                SELECT  ROW_NUMBER() OVER (PARTITION BY X.STD_YM, X.ORD_NO, X.EQU_NO, X.JOB_SEQ ORDER BY X.JOB_SEQ DESC) AS ROW_NUM
                SELECT  ROW_NUMBER() OVER (PARTITION BY X.STD_YM, X.ORD_NO, X.EQU_NO ORDER BY X.JOB_SEQ DESC, X.JOB_SEQ DESC) AS ROW_NUM --[20170410_01]
                     ,  X.*
                  FROM  RTCS0006 X              
            ) B1
         ,  RTSD0010 C1      
     WHERE  1=1
       AND  A1.PLAN_DAY     = v_Plan_Day
       AND  A1.MR_CD        = v_Mr_Cd
       AND  A1.OB_ST        IN ('03')  -- 컨택상태=완료
       AND  A1.CHK_STAT NOT IN ('04')  -- 처리완료건 제외
       AND  A1.STD_YM       = B1.STD_YM(+)
       AND  A1.ORD_NO       = B1.ORD_NO(+)
       AND  A1.EQU_NO       = B1.EQU_NO(+)
       AND  A1.JOB_SEQ      = B1.JOB_SEQ(+)
       AND  B1.ROW_NUM(+)   = 1
       AND  B1.BLD_MNG_NO   = C1.BLD_MNG_NO(+)
     ORDER  BY A1.PLAN_DAY
         ,  A1.PLAN_TM
    ;

  END p_sRtcs0005MrDayDecide;

  /*****************************************************************************
  -- 방문점검 바이럴 프로모션 신청대상 등록
     - 쇼핑몰에서 고객이 직접 등록한 경우 해당 방문점검의 컨택상태를 '접수-이벤트대상'으로 변경
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.11    2017-08-22  wjim            [20170822_01]
  *****************************************************************************/
  PROCEDURE p_UpdatePromoApply (
      v_Cust_Nm         IN RTSD0100.CUST_NM%TYPE     /* 고객명        */
    , v_Birth_Day       IN RTSD0100.BIRTH_DAY%TYPE   /* 법정생년월일  */
    , v_std_ym_f        IN RTCS0005.STD_YM%TYPE      /* 프로모션 대상 방문점검 기준년월(from) */
    , v_std_ym_t        IN RTCS0005.STD_YM%TYPE      /* 프로모션 대상 방문점검 기준년월(to)   */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    ls_std_ym_f     RTCS0005.STD_YM%TYPE;
    ls_std_ym_t     RTCS0005.STD_YM%TYPE;

    ln_chk          NUMBER DEFAULT 0;
    
    e_Error         EXCEPTION;
    
  BEGIN
    -- 필수값 확인
    IF TRIM(v_Cust_Nm) IS NULL THEN
        v_Return_Message := '고객명 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Birth_Day) IS NULL THEN
        v_Return_Message := '생년월일 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    -- 프로모션 기간내 방문점검 배정건이 있는지 확인
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTSD0100 A1
         ,  RTSD0104 B1
         ,  RTCS0005 C1
     WHERE  A1.CUST_NM   = TRIM(v_Cust_Nm)
       AND  SUBSTR(A1.BIRTH_DAY,3) = TRIM(v_Birth_Day)
       AND  A1.CUST_NO   = B1.CUST_NO
       AND  B1.ORD_NO    = C1.ORD_NO
       AND  C1.STD_YM    BETWEEN v_std_ym_f AND v_std_ym_t 
       AND  C1.CHK_STAT  IN ('01')
    ;
    
    -- 프로모션 기간내 방문점검 배정건이 없는 경우 에러처리
    IF ln_chk = 0 THEN        
        v_Return_Message := '고객님께서는 이벤트 기간내 방문점검 서비스가 배정되지 않았습니다. 넥스트레벨 콜센터(1855-0100)으로 문의주세요';
        RAISE e_Error;
    END IF;
    
    -- 대상 방문점검의 컨택상태를 '접수-이벤트대상' 로 변경
    UPDATE  RTCS0005
       SET  OB_ST     = '01'
         ,  OB_ST_DTL = '0102'
         ,  CHG_ID    = 'ONL_SYS'
         ,  CHG_DT    = SYSDATE
     WHERE  (STD_YM, ORD_NO, EQU_NO, JOB_SEQ) IN (
                SELECT  C1.STD_YM, C1.ORD_NO, C1.EQU_NO, C1.JOB_SEQ
                  FROM  RTSD0100 A1
                     ,  RTSD0104 B1
                     ,  RTCS0005 C1
                 WHERE  A1.CUST_NM   = TRIM(v_Cust_Nm)
                   AND  SUBSTR(A1.BIRTH_DAY,3) = TRIM(v_Birth_Day)
                   AND  A1.CUST_NO   = B1.CUST_NO
                   AND  B1.ORD_NO    = C1.ORD_NO
                   AND  C1.STD_YM    BETWEEN v_std_ym_f AND v_std_ym_t 
                   AND  C1.CHK_STAT  IN ('01')
            )
    ;    
  
  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.p_UpdatePromoApply(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.p_UpdatePromoApply(2)', v_ErrorText, v_Return_Message);

  END p_UpdatePromoApply;

  /*****************************************************************************
  -- 방문점검 컨택목록 조회(미래회차정보 포함)
  *****************************************************************************/
  PROCEDURE p_sRtcs0005CallRglrList (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Mr_Cd          IN RTCS0005.MR_CD%TYPE         /*Mr. Roadian코드       */ 
    , v_Std_Ym         IN RTCS0005.STD_YM%TYPE        /*기준년월              */
    , v_Do_Nm          IN RTSD0010.DO_NM%TYPE         /*광역시도              */
    , v_Ct_Nm          IN RTSD0010.CT_NM%TYPE         /*시군구                */
    , v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*고객명                */
    , v_Mob_No         IN RTCS0006.MOB_NO%TYPE        /*연락처                */
    , v_Ob_St          IN RTCS0005.OB_ST%TYPE         /*컨택상태              */
    , v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE     /*컨택세부상태          */
    , v_Plan_Day       IN RTCS0005.PLAN_DAY%TYPE      /*예정일자              */
    , v_Reg_Id         IN RTCS0005.REG_ID%TYPE        /*등록자 ID             */
    , v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE      /*처리상태              */
    , v_Ord_No         IN RTCS0005.ORD_NO%TYPE        /*계약번호              */ --[20171212_01]
  ) IS
  
    v_Dely_Day      RTRE0100.DELY_DAY%TYPE DEFAULT NULL;    /*마지막 연체집계 일자  */

    e_Error         EXCEPTION;
    
  BEGIN
  
    -- 필수값 확인
    IF TRIM(v_Ord_No) IS NULL THEN
        --v_Return_Message := '고객명 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
      
    -- 마지막 연체집계일 조회
    SELECT  MAX(DELY_DAY)
      INTO  v_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';

    OPEN Ref_Cursor FOR
    SELECT  A1.STD_YM
         ,  A1.ORD_NO
         ,  A1.EQU_NO
         ,  A1.JOB_SEQ
         ,  B1.SEQ  
         ,  A1.MR_CD                                  /*담당자ID              */
--         ,  I1.USER_NM                                /*담당자명              */
         ,  I1.CARMASTER_NM AS USER_NM                /*담당자명              */
         ,  A1.PLAN_DAY                               /*점검예정일자          */
         ,  A1.PLAN_TM                                /*배정예정시간          */
         ,  D1.CUST_NM                                /*고객명                */
         ,  C1.CAR_NO                                 /*차량번호              */
         ,  F1.MAT_NM                                 /*상품명                */
         ,  H1.CD_NM                 AS CNT_NM        /*본수                  */
         ,  B1.MOB_NO                                 /*핸드폰                */
         ,  B1.TEL_NO                                 /*전화번호              */
         ,  B1.BLD_MNG_NO                             /*빌딩번호              */
         ,  B1.POSCD                                  /*우편번호              */         
         ,  B1.ADDR1                                  /*주소1                 */
         ,  TRIM(NVL(N1.H_DNG_NM, N1.B_DNG_NM)||NVL2(N1.B_RI_NM, ' '||N1.B_RI_NM, '')||' '||NVL2(N1.LOT_MB, N1.LOT_MB||'-'||N1.LOT_SB, '')) AS ADDR1_OLD /* 구주소1 [20170616_01] */
         ,  B1.ADDR2                                  /*주소2                 */
         ,  NVL(J1.CALL_CNT,0)       AS CALL_CNT      /*컨택횟수              */
         ,  NVL(A1.OB_ST,'01')       AS OB_ST         /*컨택상태              */
         ,  NVL(A1.OB_ST_DTL,'0101') AS OB_ST_DTL     /*컨택세부상태          */
         ,  A1.MR_MEMO                                /*로디안전달사항        */
         ,  NVL(K1.APPR_SCNT,0)      AS APPR_SCNT     /*렌탈료연체횟수        */
         ,  CASE 
                WHEN L1.ORD_NO IS NULL THEN
                    '이관'
                ELSE
                    DECODE(L1.TARGET_CD,'1','당월대상','2','이관','4','전월미처리','3',DECODE(SUBSTR(L1.PLAN_DAY,1,6),A1.STD_YM,'당월대상','전월미처리'),'기타')
            END                      AS TARGET_NM     /*배정구분              */
         ,  M1.CD_NM                 AS CHK_STAT      /*처리상태              */
         ,  A1.PROC_DAY                               /*처리일자              */ --[20170605_01]
         ,  C1.PROC_DAY              AS PROC_DAY2     /*장착일자              */ --[20171212_01]
         ,  O1.CD_NM||' '||P1.CD_NM  AS MODEL_NM      /*차종                  */ --[20171212_01]
         ,  Q1.SERV_CNT0                              /*방문점검 최초횟수     */ --[20171212_01] 
         ,  Q1.SERV_CNT0 - Q1.SERV_CNTR AS SERV_CNT   /*방문점검 사용횟수     */ --[20171212_01] 
         ,  Q1.SERV_CNTR                              /*방문점검 잔여횟수     */ --[20171212_01]
      FROM  RTCS0005 A1
         ,  (
                SELECT  ROW_NUMBER() OVER (PARTITION BY X.STD_YM, X.ORD_NO, X.EQU_NO, X.JOB_SEQ ORDER BY X.SEQ DESC) AS ROW_NUM
                     ,  X.*
                  FROM  RTCS0006 X
            ) B1
         ,  RTSD0108 C1
         ,  RTSD0100 D1
         ,  RTSD0106 E1
         ,  RTSD0005 F1
--         ,  RTSD0010 G1
         ,  RTCM0051 H1
--         ,  RTCM0001 I1
         ,  RTCS0002 I1 --[20170522_03]
         ,  (
                SELECT  ORD_NO
                     ,  COUNT(*) AS CALL_CNT
                  FROM  RTCS0012
                 WHERE  1=1 
                 GROUP  BY ORD_NO     
            ) J1
         ,  RTRE0100 K1
         ,  RTCS0004 L1
         ,  RTCM0051 M1
         ,  RTSD0010 N1
         ,  RTCM0051 O1
         ,  RTCM0051 P1
         ,  RTSD0013 Q1
     WHERE  1=1
       AND  A1.MR_CD        = DECODE(v_Mr_Cd    , NULL, A1.MR_CD   , v_Mr_Cd     )  
       AND  A1.STD_YM       = DECODE(v_Std_Ym   , NULL, A1.STD_YM  , v_Std_Ym    ) 
       AND  (
                B1.MOB_NO   = DECODE(v_Mob_No   , NULL, B1.MOB_NO   , v_Mob_No   )
                OR
                B1.TEL_NO   = DECODE(v_Mob_No   , NULL, B1.TEL_NO   , v_Mob_No   )
            )
       AND  A1.PLAN_DAY     = DECODE(v_Plan_Day , NULL, A1.PLAN_DAY , v_Plan_Day )
       AND  A1.OB_ST        = DECODE(v_Ob_St    , NULL, A1.OB_ST    , v_Ob_St    )   
       AND  A1.OB_ST_DTL    = DECODE(v_Ob_St_Dtl, NULL, A1.OB_ST_DTL, v_Ob_St_Dtl)
       AND  A1.CHK_STAT     = DECODE(v_Chk_Stat , NULL, A1.CHK_STAT , v_Chk_Stat ) --[20170608_01]
       AND  A1.ORD_NO       = DECODE(v_Ord_No   , NULL, A1.ORD_NO   , v_Ord_No   ) --[20171212_01]
       AND  A1.STD_YM       = B1.STD_YM
       AND  A1.ORD_NO       = B1.ORD_NO
       AND  A1.EQU_NO       = B1.EQU_NO
       AND  A1.JOB_SEQ      = B1.JOB_SEQ
       AND  B1.ROW_NUM      = 1
       AND  A1.ORD_NO       = C1.ORD_NO
       AND  C1.CUST_NO      = D1.CUST_NO
       AND  D1.CUST_NM   LIKE DECODE(v_Cust_Nm  , NULL, '' , v_Cust_Nm)||'%'   
       AND  C1.ORD_NO       = E1.ORD_NO   
       AND  E1.MAT_CD       = F1.MAT_CD(+)
--       AND  B1.BLD_MNG_NO   = G1.BLD_MNG_NO(+)
--       AND  G1.DO_NM     LIKE DECODE(v_Do_Nm    , NULL, ''   , v_Do_Nm  )||'%'
--       AND  G1.CT_NM     LIKE DECODE(v_Ct_Nm    , NULL, ''   , v_Ct_Nm  )||'%'
       AND  B1.ADDR1(+)     LIKE '%'||DECODE(v_Do_Nm    , NULL, ''   , v_Do_Nm  )||'%' --[20170907_01] OUTER JOIN 추가
       AND  B1.ADDR1(+)     LIKE '%'||DECODE(v_Ct_Nm    , NULL, ''   , v_Ct_Nm  )||'%' --[20170907_01] OUTER JOIN 추가
       AND  E1.CNT_CD       = H1.CD(+)
       AND  H1.CD_GRP_CD(+) = 'S022'
--       AND  A1.MR_CD        = I1.USER_ID(+)
--       AND  I1.USER_GRP(+)  = '08' 
       AND  A1.MR_CD        = I1.CARMASTER_NU(+)
       AND  A1.ORD_NO       = J1.ORD_NO(+)
       AND  A1.ORD_NO       = K1.ORD_NO(+)
       AND  K1.DELY_DAY(+)  = v_Dely_Day
       AND  K1.RECP_TP(+)   = '11'
       AND  A1.STD_YM       = L1.STD_YM(+)
       AND  A1.ORD_NO       = L1.ORD_NO(+)
       AND  A1.EQU_NO       = L1.EQU_NO(+)
       AND  A1.CHK_STAT     = M1.CD(+)
       AND  M1.CD_GRP_CD(+) = 'H008'
       AND  B1.BLD_MNG_NO   = N1.BLD_MNG_NO(+)
       AND  C1.MODEL_CD     = O1.CD(+)
       AND  O1.CD_GRP_CD(+) = 'S002'
       AND  C1.CONTENTS_CD  = P1.CD(+)
       AND  P1.CD_GRP_CD(+) = 'S003'
       AND  C1.ORD_NO       = Q1.ORD_NO(+)
       AND  C1.PS_CD        = Q1.PS_CD(+)       
       AND  C1.CNT_CD       = Q1.CNT_CD(+)
       AND  Q1.PRS_DCD(+)   = 'B00003'
    UNION ALL
    SELECT  TO_CHAR(A.PLAN_DAY, 'YYYYMM') AS STD_YM,
            A.ORD_NO,
            '' AS EQU_NO,
            0 AS JOB_SEQ,
            0 AS SEQ,
            '' AS MR_CD,  /*담당자ID              */
            '' AS USER_NM,                /*담당자명              */
            TO_CHAR(A.PLAN_DAY, 'YYYYMMDD') AS PLAN_DAY,    /*점검예정일자          */
            '' AS PLAN_TM,                                /*배정예정시간          */
            A.CUST_NM,      /*고객명*/
            A.CAR_NO,       /*차량번호*/
            A.MAT_NM,       /*상품명*/
            A.CNT_NM,       /*본수*/
            '' AS MOB_NO,   /*핸드폰                */
            '' AS TEL_NO,   /*전화번호              */
            '' AS BLD_MNG_NO, /*빌딩번호              */
            '' AS POSCD,     /*우편번호              */
            '' AS ADDR1,     /*주소1                 */
            '' AS ADDR1_OLD, /* 구주소1 [20170616_01] */ 
            '' AS ADDR2,  /*주소2                 */
            0  AS CALL_CNT,  /*컨택횟수              */
            '01' AS OB_ST,   /*컨택상태              */
            '0101' AS OB_ST_DTL, /*컨택세부상태          */
            '' AS MR_MEMO,        /*로디안전달사항        */
            NVL(A.APPR_SCNT,0) AS APPR_SCNT,   /*렌탈료연체횟수        */
            '미래대상' AS TARGET_NM,   /*배정구분              */ 
            '초기배정' AS CHK_STAT,    /*처리상태  M1.CD_NM            */
            '' AS PROC_DAY,   /*처리일자              */                      
            A.PROC_DAY AS PROC_DAY2,   /*장착일자              */
            A.MODEL_NM, /*차종 */
            A.SERV_CNT0,  /*방문점검 최초횟수*/
            A.CNT AS  SERV_CNT,  /*방문점검 사용횟수     */
            A.REMAIN_CNT AS SERV_CNTR                              /*방문점검 잔여횟수     */ 
            --A.PLAN_DAY - A.STD_YMD DIFF
    FROM    (
            SELECT  A.*,
                    CASE -- 종료일자를 넘기면 NULL 처리함
                    WHEN A.OS_DAY < A.NEXT_DAY THEN NULL
                    --ELSE TO_DATE(TO_CHAR(A.NEXT_DAY,'YYYYMMDD'),'YYYYMMDD') END PLAN_DAY,
                    ELSE TO_DATE(TO_CHAR(NVL(A.NEXT_DAY,'99991231'),'YYYYMMDD'),'YYYYMMDD') END PLAN_DAY,
                    TO_DATE(TO_CHAR(SYSDATE,'YYYYMMDD'),'YYYYMMDD') NOW,
                    TO_DATE('201901'||'01','YYYYMMDD') STD_YMD,
                    A.SERV_CNT0 - A.CNT AS REMAIN_CNT
            FROM    (
                    SELECT  A.*,
                            ROWNUM AS CNT,
                            (MON*(LEVEL)) AMON,
                            ADD_MONTHS(A.PROC_DAY,(MON*(LEVEL))) NEXT_DAY
                    FROM    (
                            SELECT  A.ORD_NO,     /*계약번호         */
                                    A.PROC_DAY,   /*장착일자         */
                                    A.OS_DAY,     /*종료일자         */
                                    A.PERIOD_CD,  /*기간코드         */
                                    B.SERV_CNT0,  /*서비스횟수(최초) */
                                    A.CAR_NO,      /*차량번호*/
                                    --TO_NUMBER(A.PERIOD_CD)/B.SERV_CNT0 MON
                                    DECODE(B.SERV_CNT0,0, NULL, TO_NUMBER(A.PERIOD_CD)/B.SERV_CNT0) AS MON ,
                                    B.SERV_CNT0 - B.SERV_CNTR AS SERV_CNT  , /*방문점검 사용횟수     */ --[20171212_01] 
                                    B.SERV_CNTR,                             /*방문점검 잔여횟수     */ --[20171212_01]   
                                    O.CD_NM||' '||P.CD_NM  AS MODEL_NM,      /*차종                  */
                                    (SELECT REPLACE(LISTAGG(Pkg_Rtsd0005.f_sRtsd0005MatName( C.MAT_CD ), ',') 
                                            WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
                                       FROM RTSD0106 C WHERE C.ORD_NO = A.ORD_NO) AS MAT_NM,              -- 제품명
                                    (SELECT CUST_NM FROM RTSD0100 F WHERE F.CUST_NO = A.CUST_NO) AS CUST_NM, --고객명
                                    (SELECT CNT_CD FROM RTSD0104 G WHERE G.ORD_NO = A.ORD_NO) AS CNT_NM,   -- 본수
                                    H.APPR_SCNT     -- 렌탈료연체횟수
                            FROM    RTSD0108 A,
                                    RTSD0013 B,
                                    RTCM0051 O,
                                    RTCM0051 P,
                                    RTRE0100 H                                            
                            WHERE   A.ORD_NO  = B.ORD_NO
                            AND     B.PRS_DCD(+) = 'B00003'
                            AND     A.ORD_NO  = v_Ord_No
                            AND     A.CONTENTS_CD  = P.CD(+)
                            AND     P.CD_GRP_CD(+) = 'S003'
                            AND     A.MODEL_CD     = O.CD(+)
                            AND     O.CD_GRP_CD(+) = 'S002'                 
                            AND     A.ORD_NO       = H.ORD_NO(+)
                            AND     H.DELY_DAY(+)  = v_Dely_Day
                            AND     H.RECP_TP(+)   = '11'                                                   
                            ) A
                    CONNECT BY LEVEL <= A.SERV_CNT0
                    ) A
            ) A
    WHERE   A.PLAN_DAY - A.STD_YMD >= 0
 --   ORDER  BY A.PLAN_DAY - A.STD_YMD ASC    
    
--    SELECT TO_CHAR(ADD_MONTHS(TO_DATE(STD_YM,'YYYYMM'), ROWNUM * 6),'YYYYMM')  AS STD_YM
--         , ORD_NO
--         , EQU_NO
--         , JOB_SEQ
--         , SEQ
--         , MR_CD
--         , USER_NM
--         , TO_CHAR(ADD_MONTHS(TO_DATE(PLAN_DAY,'YYYYMMDD'), ROWNUM * 6),'YYYYMMDD')  AS PLAN_DAY
--         , PLAN_TM
--         , CUST_NM
--         , CAR_NO
--         , MAT_NM
--         , CNT_NM
--         , MOB_NO
--         , TEL_NO
--         , BLD_MNG_NO
--         , POSCD
--         , ADDR1
--         , ADDR1_OLD
--         , ADDR2
--         , CALL_CNT
--         , OB_ST
--         , OB_ST_DTL
--         , MR_MEMO
--         , APPR_SCNT
--         , TARGET_NM
--         , CHK_STAT
--         , '' AS PROC_DAY
--         , PROC_DAY2
--         , MODEL_NM
--         , SERV_CNT0
--         , SERV_CNT + ROWNUM AS SERV_CNT
--         , SERV_CNTR - ROWNUM AS SERV_CNTR
--      FROM(    
--        SELECT  A1.STD_YM
--             ,  A1.ORD_NO
--             ,  A1.EQU_NO
--             ,  A1.JOB_SEQ
--             ,  B1.SEQ  
--             ,  A1.MR_CD                                  /*담당자ID              */
--    --         ,  I1.USER_NM                                /*담당자명              */
--             ,  I1.CARMASTER_NM AS USER_NM                /*담당자명              */
--             ,  A1.PLAN_DAY                               /*점검예정일자          */
--             ,  A1.PLAN_TM                                /*배정예정시간          */
--             ,  D1.CUST_NM                                /*고객명                */
--             ,  C1.CAR_NO                                 /*차량번호              */
--             ,  F1.MAT_NM                                 /*상품명                */
--             ,  H1.CD_NM                 AS CNT_NM        /*본수                  */
--             ,  B1.MOB_NO                                 /*핸드폰                */
--             ,  B1.TEL_NO                                 /*전화번호              */
--             ,  B1.BLD_MNG_NO                             /*빌딩번호              */
--             ,  B1.POSCD                                  /*우편번호              */         
--             ,  B1.ADDR1                                  /*주소1                 */
--             ,  TRIM(NVL(N1.H_DNG_NM, N1.B_DNG_NM)||NVL2(N1.B_RI_NM, ' '||N1.B_RI_NM, '')||' '||NVL2(N1.LOT_MB, N1.LOT_MB||'-'||N1.LOT_SB, '')) AS ADDR1_OLD /* 구주소1 [20170616_01] */
--             ,  B1.ADDR2                                  /*주소2                 */
--             ,  NVL(J1.CALL_CNT,0)       AS CALL_CNT      /*컨택횟수              */
--             ,  NVL(A1.OB_ST,'01')       AS OB_ST         /*컨택상태              */
--             ,  NVL(A1.OB_ST_DTL,'0101') AS OB_ST_DTL     /*컨택세부상태          */
--             ,  A1.MR_MEMO                                /*로디안전달사항        */
--             ,  NVL(K1.APPR_SCNT,0)      AS APPR_SCNT     /*렌탈료연체횟수        */
----             ,  CASE 
----                    WHEN L1.ORD_NO IS NULL THEN
----                        '이관'
----                    ELSE
----                        DECODE(L1.TARGET_CD,'1','당월대상','2','이관','4','전월미처리','3',DECODE(SUBSTR(L1.PLAN_DAY,1,6),A1.STD_YM,'당월대상','전월미처리'),'기타')
----                END                      AS TARGET_NM     /*배정구분              */
--             ,  '미래대상'                  AS TARGET_NM     /*배정구분              */ 
--             ,  '초기배정'                 AS CHK_STAT      /*처리상태  M1.CD_NM            */
--             ,  A1.PROC_DAY                               /*처리일자              */ --[20170605_01]
--             ,  C1.PROC_DAY              AS PROC_DAY2     /*장착일자              */ --[20171212_01]
--             ,  O1.CD_NM||' '||P1.CD_NM  AS MODEL_NM      /*차종                  */ --[20171212_01]
--             ,  Q1.SERV_CNT0                              /*방문점검 최초횟수     */ --[20171212_01] 
--             ,  Q1.SERV_CNT0 - Q1.SERV_CNTR AS SERV_CNT   /*방문점검 사용횟수     */ --[20171212_01] 
--             ,  Q1.SERV_CNTR                              /*방문점검 잔여횟수     */ --[20171212_01]
--          FROM  RTCS0005 A1
--             ,  (
--                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.STD_YM, X.ORD_NO, X.EQU_NO, X.JOB_SEQ ORDER BY X.SEQ DESC) AS ROW_NUM
--                         ,  X.*
--                      FROM  RTCS0006 X
--                ) B1
--             ,  RTSD0108 C1
--             ,  RTSD0100 D1
--             ,  RTSD0106 E1
--             ,  RTSD0005 F1
--    --         ,  RTSD0010 G1
--             ,  RTCM0051 H1
--    --         ,  RTCM0001 I1
--             ,  RTCS0002 I1 --[20170522_03]
--             ,  (
--                    SELECT  ORD_NO
--                         ,  COUNT(*) AS CALL_CNT
--                      FROM  RTCS0012
--                     WHERE  1=1 
--                     GROUP  BY ORD_NO     
--                ) J1
--             ,  RTRE0100 K1
--             ,  RTCS0004 L1
--             ,  RTCM0051 M1
--             ,  RTSD0010 N1
--             ,  RTCM0051 O1
--             ,  RTCM0051 P1
--             ,  RTSD0013 Q1
--         WHERE  1=1
--           AND  A1.MR_CD        = DECODE(v_Mr_Cd    , NULL, A1.MR_CD   , v_Mr_Cd     )  
--           AND  A1.STD_YM       = DECODE(v_Std_Ym   , NULL, A1.STD_YM  , v_Std_Ym    ) 
--           AND  (
--                    B1.MOB_NO   = DECODE(v_Mob_No   , NULL, B1.MOB_NO   , v_Mob_No   )
--                    OR
--                    B1.TEL_NO   = DECODE(v_Mob_No   , NULL, B1.TEL_NO   , v_Mob_No   )
--                )
--           AND  A1.PLAN_DAY     = DECODE(v_Plan_Day , NULL, A1.PLAN_DAY , v_Plan_Day )
--           AND  A1.OB_ST        = DECODE(v_Ob_St    , NULL, A1.OB_ST    , v_Ob_St    )   
--           AND  A1.OB_ST_DTL    = DECODE(v_Ob_St_Dtl, NULL, A1.OB_ST_DTL, v_Ob_St_Dtl)
--           AND  A1.CHK_STAT     = DECODE(v_Chk_Stat , NULL, A1.CHK_STAT , v_Chk_Stat ) --[20170608_01]
--           AND  A1.ORD_NO       = DECODE(v_Ord_No   , NULL, A1.ORD_NO   , v_Ord_No   ) --[20171212_01]
--           AND  A1.STD_YM       = B1.STD_YM
--           AND  A1.ORD_NO       = B1.ORD_NO
--           AND  A1.EQU_NO       = B1.EQU_NO
--           AND  A1.JOB_SEQ      = B1.JOB_SEQ
--           AND  B1.ROW_NUM      = 1
--           AND  A1.ORD_NO       = C1.ORD_NO
--           AND  C1.CUST_NO      = D1.CUST_NO
--           AND  D1.CUST_NM   LIKE DECODE(v_Cust_Nm  , NULL, '' , v_Cust_Nm)||'%'   
--           AND  C1.ORD_NO       = E1.ORD_NO   
--           AND  E1.MAT_CD       = F1.MAT_CD(+)
--    --       AND  B1.BLD_MNG_NO   = G1.BLD_MNG_NO(+)
--    --       AND  G1.DO_NM     LIKE DECODE(v_Do_Nm    , NULL, ''   , v_Do_Nm  )||'%'
--    --       AND  G1.CT_NM     LIKE DECODE(v_Ct_Nm    , NULL, ''   , v_Ct_Nm  )||'%'
--           AND  B1.ADDR1(+)     LIKE '%'||DECODE(v_Do_Nm    , NULL, ''   , v_Do_Nm  )||'%' --[20170907_01] OUTER JOIN 추가
--           AND  B1.ADDR1(+)     LIKE '%'||DECODE(v_Ct_Nm    , NULL, ''   , v_Ct_Nm  )||'%' --[20170907_01] OUTER JOIN 추가
--           AND  E1.CNT_CD       = H1.CD(+)
--           AND  H1.CD_GRP_CD(+) = 'S022'
--    --       AND  A1.MR_CD        = I1.USER_ID(+)
--    --       AND  I1.USER_GRP(+)  = '08' 
--           AND  A1.MR_CD        = I1.CARMASTER_NU(+)
--           AND  A1.ORD_NO       = J1.ORD_NO(+)
--           AND  A1.ORD_NO       = K1.ORD_NO(+)
--           AND  K1.DELY_DAY(+)  = '20180501'
--           AND  K1.RECP_TP(+)   = '11'
--           AND  A1.STD_YM       = L1.STD_YM(+)
--           AND  A1.ORD_NO       = L1.ORD_NO(+)
--           AND  A1.EQU_NO       = L1.EQU_NO(+)
--           AND  A1.CHK_STAT     = M1.CD(+)
--           AND  M1.CD_GRP_CD(+) = 'H008'
--           AND  B1.BLD_MNG_NO   = N1.BLD_MNG_NO(+)
--           AND  C1.MODEL_CD     = O1.CD(+)
--           AND  O1.CD_GRP_CD(+) = 'S002'
--           AND  C1.CONTENTS_CD  = P1.CD(+)
--           AND  P1.CD_GRP_CD(+) = 'S003'
--           AND  C1.ORD_NO       = Q1.ORD_NO(+)
--           AND  C1.PS_CD        = Q1.PS_CD(+)       
--           AND  C1.CNT_CD       = Q1.CNT_CD(+)
--           AND  Q1.PRS_DCD(+)   = 'B00003'
--           AND  A1.STD_YM = (SELECT MAX(STD_YM) FROM RTCS0005 WHERE ORD_NO = v_Ord_No) 
--        )
--     CONNECT BY LEVEL <= SERV_CNTR    
    ;
    
  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
--        v_Success_code   := -1;
--        v_Return_Message := v_Return_Message;
--        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0005.p_sRtcs0005CallRglrList(1)', 'v_Ord_No', v_Ord_No);    

  END p_sRtcs0005CallRglrList;

  /*******************************************************************************
 -- 정기점검 처리현황 Select
 *******************************************************************************/
     PROCEDURE p_sRtcs0005RegisterProcStat (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_std_Ym         IN RTCS0005.STD_YM%TYPE              /*년도월           */
    ) IS

    BEGIN
        OPEN Ref_Cursor FOR

        SELECT 
            ORG_LIST.USER_NM                    /* 로디안 */
            ,ORG_LIST.CARMASTER_NU              /* 로디안 코드 */
            ,ORG_LIST.BAEJUNG_CNT               /* 배정건수 */
            ,ORG_LIST.PROCESS_CNT               /* 처리건수 */
            ,ORG_LIST.PROCESS_YUL               /* 처리율 */
            ,ORG_LIST.CONTACT_CNT               /* 컨캑건수 */
            ,ORG_LIST.CONTACT_YUL               /* 컨택율 */
            ,ORG_LIST.PROCESS_DATE_CNT          /* 처리일수 */
            ,SALE_LIST.SALE_CNT                 /* 판매수량 */
            ,ORG_LIST.ONE_POINT                 /* 매우불만족 */
            ,ORG_LIST.TWO_POINT                 /* 불만족 */
            ,ORG_LIST.THREE_POINT               /* 보통 */
            ,ORG_LIST.FOUR_POINT                /* 만족 */
            ,ORG_LIST.FIVE_POINT                /* 매우만족 */
        FROM(
        SELECT  
          SS.USER_NM
          ,SS.CARMASTER_NU
          ,NVL(SUM(SS.BAEJUNG_CNT),0) AS BAEJUNG_CNT
          ,NVL(SUM(SS.PROCESS_CNT),0) AS PROCESS_CNT
          ,NVL(ROUND((SUM(PROCESS_CNT)/SUM(SS.BAEJUNG_CNT))*100),0)||'%' AS PROCESS_YUL
          ,NVL(SUM(SS.CONTACT_CNT),0) AS CONTACT_CNT
          ,NVL(ROUND((SUM(CONTACT_CNT)/SUM(SS.BAEJUNG_CNT))*100),0)||'%' AS CONTACT_YUL
          ,(SELECT SUM(PROC_DATE_CNT) AS PROCESS_DATE_CNT
                FROM (
                    SELECT /*+ INDEX_ASC ( T RTCS0002_IDX01 ) */ T.CARMASTER_NU, T.USER_NM, T.PROC_DAY, CASE WHEN T.CHK_STAT_CD = '04' AND COUNT(PROC_DAY) > 2 THEN 1 ELSE 0 END AS PROC_DATE_CNT
                    FROM (
                        SELECT  A1.PROC_DAY                       /*처리일자             */ --[20170602_01]
                              ,  I1.CARMASTER_NU
                              ,  I1.CARMASTER_NM AS USER_NM                /*담당자명              */
                              ,  M1.CD           AS CHK_STAT_CD     /*처리상태코드         */ --[20190213_01]
                          FROM  RTCS0005 A1
                             ,  RTSD0108 C1
                             ,  RTSD0100 D1
                             ,  RTCM0051 H1
                             ,  RTCS0002 I1 --[20170522_03]
                             ,  RTCM0051 K1
                             ,  RTCM0051 L1
                             ,  RTCM0051 M1
                             ,  RTCM0051 O1
                             ,  RTCM0051 P1
                             ,  RTCS0004 R1
                         WHERE  1=1
                           AND  A1.STD_YM       = DECODE(v_std_Ym   , NULL, A1.STD_YM  , v_std_Ym) 
                           AND  A1.ORD_NO       = C1.ORD_NO
                           AND  C1.CUST_NO      = D1.CUST_NO
                           AND  C1.CNT_CD       = H1.CD(+)
                           AND  H1.CD_GRP_CD(+) = 'S022'
                           AND  A1.MR_CD        = I1.CARMASTER_NU(+)
                           AND  A1.OB_ST        = K1.CD(+)
                           AND  K1.CD_GRP_CD(+) = 'C027'
                           AND  A1.OB_ST_DTL    = L1.CD(+)
                           AND  L1.CD_GRP_CD(+) = 'C028'
                           AND  A1.CHK_STAT     = M1.CD(+)
                           AND  M1.CD_GRP_CD(+) = 'H008'
                           AND  C1.MODEL_CD     = O1.CD(+)
                           AND  O1.CD_GRP_CD(+) = 'S002'
                           AND  C1.CONTENTS_CD  = P1.CD(+)
                           AND  P1.CD_GRP_CD(+) = 'S003'
                           AND  A1.STD_YM       = R1.STD_YM(+)
                           AND  A1.ORD_NO       = R1.ORD_NO(+)
                           AND  A1.EQU_NO       = R1.EQU_NO(+)
                      ) T
                      GROUP BY T.CARMASTER_NU, T.USER_NM, T.PROC_DAY, T.CHK_STAT_CD
                  ) S
                  WHERE S.CARMASTER_NU = SS.CARMASTER_NU
                  GROUP BY S.USER_NM ) AS PROCESS_DATE_CNT
              ,ROUND(NVL( MAX(SSS.ONE_POINT)/DECODE(MAX(SSS.TOTAL_POINT),0, NULL,MAX(SSS.TOTAL_POINT)),0),2)*100||'%' AS ONE_POINT
              ,ROUND(NVL( MAX(SSS.TWO_POINT)/DECODE(MAX(SSS.TOTAL_POINT),0, NULL,MAX(SSS.TOTAL_POINT)),0),2)*100||'%' AS TWO_POINT
              ,ROUND(NVL( MAX(SSS.THREE_POINT)/DECODE(MAX(SSS.TOTAL_POINT),0, NULL,MAX(SSS.TOTAL_POINT)),0),2)*100||'%' AS THREE_POINT
              ,ROUND(NVL( MAX(SSS.FOUR_POINT)/DECODE(MAX(SSS.TOTAL_POINT),0, NULL,MAX(SSS.TOTAL_POINT)),0),2)*100||'%' AS FOUR_POINT
              ,ROUND(NVL( MAX(SSS.FIVE_POINT)/DECODE(MAX(SSS.TOTAL_POINT),0, NULL,MAX(SSS.TOTAL_POINT)),0),2)*100||'%' AS FIVE_POINT
        FROM (
            SELECT
              TT.USER_NM
              ,TT.CARMASTER_NU
              ,CASE WHEN TT.TARGET_CD IN ('1','4','3') THEN COUNT(TT.USER_NM) END AS BAEJUNG_CNT
              ,CASE WHEN TT.CHK_STAT_CD = '04' THEN COUNT(TT.USER_NM) END AS PROCESS_CNT
              ,CASE WHEN TT.OB_ST_CD <> '01' THEN COUNT(TT.USER_NM) END AS CONTACT_CNT
            FROM (
                SELECT  A1.STD_YM
                     ,  A1.ORD_NO
                     ,  A1.EQU_NO
                     ,  A1.JOB_SEQ
                     ,  I1.CARMASTER_NU
                     ,  I1.CARMASTER_NM AS USER_NM                  /*담당자명       */
                     ,  A1.PLAN_DAY                                 /*점검예정일자          */
                     , (SELECT T1.MAT_NM || ' (외 ' || (SELECT COUNT(1)-1 FROM RTSD0106 S WHERE S.ORD_NO = A1.ORD_NO) ||'건)'  
                         FROM RTSD0106 T, RTSD0005 T1 
                        WHERE T.ORD_NO = A1.ORD_NO 
                          AND T.MAT_CD = T1.MAT_CD(+) 
                        GROUP BY T1.MAT_NM) AS MAT_NM               /*상품명      */
                     ,  H1.CD_NM                 AS CNT_NM          /*본수                  */
                     ,  K1.CD                    AS OB_ST_CD        /*컨택상태코드          */
                     ,  K1.CD_NM                 AS OB_ST           /*컨택상태              */
                     ,  L1.CD_NM                 AS OB_ST_DTL       /*컨택세부상태         */
                     ,  M1.CD                    AS CHK_STAT_CD     /*처리상태코드         */ --[20190213_01]
                     ,  M1.CD_NM                 AS CHK_STAT        /*처리상태              */ --[20170602_01]
                     ,  A1.PROC_DAY                                 /*처리일자              */ --[20170602_01]
                     ,  C1.PROC_DAY              AS PROC_DAY2       /*장착일자            */ --[20171212_01]
                     ,  O1.CD_NM||' '||P1.CD_NM  AS MODEL_NM        /*차종            */ --[20171212_01]
                     ,  R1.TARGET_CD
                     ,  CASE 
                            WHEN R1.ORD_NO IS NULL THEN
                                '이관'
                            ELSE
                                DECODE(R1.TARGET_CD,'1','당월대상','2','이관','4','전월미처리','3',DECODE(SUBSTR(R1.PLAN_DAY,1,6),A1.STD_YM,'당월대상','전월미처리'),'기타')
                        END                      AS TARGET_NM       /*배정구분              */ --[20180322_01]
                  FROM  RTCS0005 A1
                     ,  RTSD0108 C1
                     ,  RTSD0100 D1
                     ,  RTCM0051 H1
                     ,  RTCS0002 I1 --[20170522_03]
                     ,  RTCM0051 K1
                     ,  RTCM0051 L1
                     ,  RTCM0051 M1
                     ,  RTCM0051 O1
                     ,  RTCM0051 P1
                     ,  RTCS0004 R1
                 WHERE  1=1
                   AND  A1.STD_YM       = DECODE(v_std_Ym   , NULL, A1.STD_YM  , v_std_Ym ) 
                   AND  A1.ORD_NO       = C1.ORD_NO
                   AND  C1.CUST_NO      = D1.CUST_NO
                   AND  C1.CNT_CD       = H1.CD(+)
                   AND  H1.CD_GRP_CD(+) = 'S022'
                   AND  A1.MR_CD        = I1.CARMASTER_NU(+)
                   AND  A1.OB_ST        = K1.CD(+)
                   AND  K1.CD_GRP_CD(+) = 'C027'
                   AND  A1.OB_ST_DTL    = L1.CD(+)
                   AND  L1.CD_GRP_CD(+) = 'C028'
                   AND  A1.CHK_STAT     = M1.CD(+)
                   AND  M1.CD_GRP_CD(+) = 'H008'
                   AND  C1.MODEL_CD     = O1.CD(+)
                   AND  O1.CD_GRP_CD(+) = 'S002'
                   AND  C1.CONTENTS_CD  = P1.CD(+)
                   AND  P1.CD_GRP_CD(+) = 'S003'
                   AND  A1.STD_YM       = R1.STD_YM(+)
                   AND  A1.ORD_NO       = R1.ORD_NO(+)
                   AND  A1.EQU_NO       = R1.EQU_NO(+)
            ) TT
            WHERE 1=1
            GROUP BY TT.USER_NM, TT.TARGET_CD, TT.CHK_STAT_CD, TT.OB_ST_CD, TT.CARMASTER_NU
        )SS,
        (
            SELECT
              AA.PROC_IN_CD
              ,SUM(AA.ONE_POINT) AS ONE_POINT
              ,SUM(AA.TWO_POINT) AS TWO_POINT
              ,SUM(AA.THREE_POINT) AS THREE_POINT
              ,SUM(AA.FOUR_POINT) AS FOUR_POINT
              ,SUM(AA.FIVE_POINT) AS FIVE_POINT
              ,NVL(SUM(ONE_POINT),0)+NVL(SUM(TWO_POINT),0)+NVL(SUM(THREE_POINT),0)+NVL(SUM(FOUR_POINT),0)+NVL(SUM(FIVE_POINT),0) AS TOTAL_POINT
            FROM (
                SELECT
                  TT.PROC_IN_CD
                  ,TT.OBJECT_ANS
                  ,CASE WHEN TT.OBJECT_ANS = '002001' THEN COUNT(TT.ANSWER) END ONE_POINT
                  ,CASE WHEN TT.OBJECT_ANS = '002002' THEN COUNT(TT.ANSWER) END TWO_POINT
                  ,CASE WHEN TT.OBJECT_ANS = '002003' THEN COUNT(TT.ANSWER) END THREE_POINT
                  ,CASE WHEN TT.OBJECT_ANS = '002008' THEN COUNT(TT.ANSWER) END FOUR_POINT
                  ,CASE WHEN TT.OBJECT_ANS = '002005' THEN COUNT(TT.ANSWER) END FIVE_POINT
                FROM (
                    SELECT Y.ANSWER,                                /*고객만족여부 */
                           Y.OBJECT_ANS,
                           X.SERVICE_CD,
                           X.PROC_IN_CD
                    FROM (
                       SELECT  A.PROC_IN_CD,
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
                               C.SERVICE_CD
                       FROM    RTCS0100 A,
                               RTCS0101 B,
                               RTCS0008 C,
                               RTCM0051 D,
                               RTCS0002 E
                       WHERE   A.JOB_TP   = 'H2'
                       AND     TO_CHAR(TO_DATE(A.JOB_DAY,'YYYYMMDD'),'YYYYMM') = v_std_Ym --  BETWEEN '20181201' AND '20181231'
                       AND     ('C'  IS NULL OR A.CALL_STATUS =  'C')
                       AND     A.CALL_NO       = B.CALL_NO (+)
                       AND     A.ORD_NO = C.ORD_NO(+)
                       AND     A.SERV_SEQ = C.SERV_SEQ(+)
                       AND     C.SERVICE_CD = D.CD(+)
                       AND     D.CD_GRP_CD(+) = 'S044'
                       AND     C.SERVICE_CD = 'B00003'
                       AND     A.PROC_IN_CD = E.CARMASTER_NU
                    ) X,
                    (SELECT ANSWER_NO||ANSWER_SEQ AS OBJECT_ANS, ANSWER, USE_YN
                     FROM   RTCS0113 ) Y
                    WHERE  X.SERV_ANS_CD = Y.OBJECT_ANS (+)
                    AND    Y.USE_YN = 'Y'
                ) TT
                GROUP BY TT.PROC_IN_CD, TT.OBJECT_ANS
            ) AA
            GROUP BY AA.PROC_IN_CD
        ) SSS
        WHERE SS.CARMASTER_NU = SSS.PROC_IN_CD(+)
        GROUP BY SS.USER_NM,SS.CARMASTER_NU
        ) ORG_LIST,
        (
            SELECT  A.ORD_AGENT, F.CARMASTER_NU 
                    ,SUM(TO_NUMBER(A.CNT_CD)) AS SALE_CNT
            FROM    RTSD0108 A,
                    RTCS0001 B,
                    RTSD0005 C,
                    RTSD0100 D,
                    RTSD0113 E,
                    RTCS0002 F
            WHERE   1=1
            AND     TO_CHAR(TO_DATE(A.PROC_DAY,'YYYYMMDD'),'YYYYMM') = v_std_Ym
            AND     A.ORD_NO      = B.ORD_NO
            AND     B.MAT_CD      = C.MAT_CD
            AND     A.CUST_NO     = D.CUST_NO
            AND     A.ORD_AGENT   = E.ORD_AGENT(+)
            AND     A.ORD_AGENT   = F.ORD_AGENT(+)
            AND     F.USE_YN(+)   = 'Y'
            GROUP BY A.ORD_AGENT, F.CARMASTER_NU
        ) SALE_LIST
        WHERE   SALE_LIST.CARMASTER_NU(+) = ORG_LIST.CARMASTER_NU;
        
    END p_sRtcs0005RegisterProcStat;
END Pkg_Rtcs0005;
/