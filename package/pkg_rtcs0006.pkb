CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0006 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0006
   PURPOSE   방문점검 작업정보 변경 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-18  jemcarry         1. Created this package body.
   1.1        2017-03-27  wjim             [20170324_02] 방문점검 컨택 개발
   1.2        2017-04-04  wjim             [20170404_01] 방문점검 컨택상태 검증로직 추가
   1.3        2017-04-04  wjim             [20170404_02] 시군구별 담당 로디안 조회기능 추가
   1.4        2017-04-05  wjim             [20170405_01] 방문점검 컨택 SMS추가
   1.5        2017-05-02  wjim             [20170502_01] 점검예정일 변경 제한  
   1.6        2017-05-22  wjim             [20170522_01] 처리완료건 수정 불가처리
   1.7        2017-06-07  wjim             [20170607_01] 점검예정일 변경 제한
                                           - 자동배정 수행예상시간인 매월 1일 00:00~03:00 까지 수정 불가  
                                           - 자동배정 이전 예정일 변경으로 발생하는 중복 방지
   1.8        2017-06-13  wjim             [20170613_01] 방문점검 컨택확정 SMS 메시지 변경                                                                                     
   1.9        2017-09-01  wjim             [20170901_06] 시군구별 담당 로디안 조회기능 보완
   1.10       2017-12-20  wjim             [20171220_01] 정기점검 컨택관리 연락처 수정기능 추가
   1.11       2019-12-02  wjim             [20191202_01] 시군구별 담당 로디안 조회기준 변경
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검 작업정보 변경 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0006Count(
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,           /*설비번호            */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,          /*작업순번            */
    v_Seq            IN RTCS0006.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0006
    WHERE   STD_YM  = v_Std_Ym
    AND     ORD_NO  = v_Ord_No
    AND     EQU_NO  = v_Equ_No
    AND     JOB_SEQ = v_Job_Seq
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0006Count;

  /*****************************************************************************
  -- 방문점검 작업정보 변경 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0006 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE             /*순번                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.STD_YM,                    /*기준년월            */
            A.ORD_NO,                    /*계약번호            */
            A.EQU_NO,                    /*설비번호            */
            A.JOB_SEQ,                   /*작업순번            */
            A.SEQ,                       /*순번                */
            A.MOB_NO,                    /*핸드폰              */
            A.TEL_NO,                    /*전화번호            */
            A.BLD_MNG_NO,                /*빌딩번호            */
            A.POSCD,                     /*우편번호            */
            A.ADDR1,                     /*주소                */
            A.ADDR2,                     /*상세주소            */
            A.PLAN_DAY PLAN_DAYA,        /*점검예정일자        */
            A.PLAN_TM  PLAN_TMA,         /*점검예정시간        */
            A.PLAN_DAY,                  /*점검변경일자        */
            A.PLAN_TM,                   /*점검변경시간        */
            A.MR_CD,                     /*Mr. Roadian 코드    */
            A.POS_X,                     /*지도 X좌표          */
            A.POS_Y,                     /*지도 Y좌표          */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            B.CHK_STAT,                  /*작업상태            */
            B.REQ_DESC                   /*특이사항            */
    FROM    RTCS0006 A,
            RTCS0005 B
    WHERE   A.STD_YM  = v_Std_Ym
    AND     A.ORD_NO  = v_Ord_No
    AND     A.EQU_NO  = v_Equ_No
    AND     A.JOB_SEQ = v_Job_Seq
    AND     A.SEQ     = v_Seq
    AND     A.STD_YM  = B.STD_YM
    AND     A.ORD_NO  = B.ORD_NO
    AND     A.EQU_NO  = B.EQU_NO
    AND     A.JOB_SEQ = B.JOB_SEQ;

  END p_sRtcs0006;

  /*****************************************************************************
  -- 방문점검 작업정보 변경 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*지도 X좌표            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*지도 Y좌표            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0006 (
            STD_YM,
            ORD_NO,
            EQU_NO,
            JOB_SEQ,
            SEQ,
            MOB_NO,
            TEL_NO,
            BLD_MNG_NO,
            POSCD,
            ADDR1,
            ADDR2,
            PLAN_DAY,
            PLAN_TM,
            MR_CD,
            POS_X,
            POS_Y,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Std_Ym,
            v_Ord_No,
            v_Equ_No,
            v_Job_Seq,
            v_Seq,
            v_Mob_No,
            v_Tel_No,
            v_Bld_Mng_No,
            v_Poscd,
            v_Addr1,
            v_Addr2,
            v_Plan_Day,
            v_Plan_Tm,
            v_Mr_Cd,
            v_Pos_X,
            v_Pos_Y,
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

  END f_InsertRtcs0006;

/*****************************************************************************
  -- 방문점검 작업정보 변경 Insert 20181217고도화 v_Real_Mob_No 추가 
  *****************************************************************************/
  FUNCTION f_InsertRtcs0006_New (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Real_Mob_No    IN RTCS0006.REAL_MOB_NO%TYPE,    /*실 핸드폰             */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*지도 X좌표            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*지도 Y좌표            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0006 (
            STD_YM,
            ORD_NO,
            EQU_NO,
            JOB_SEQ,
            SEQ,
            MOB_NO,
            REAL_MOB_NO,
            TEL_NO,
            BLD_MNG_NO,
            POSCD,
            ADDR1,
            ADDR2,
            PLAN_DAY,
            PLAN_TM,
            MR_CD,
            POS_X,
            POS_Y,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Std_Ym,
            v_Ord_No,
            v_Equ_No,
            v_Job_Seq,
            v_Seq,
            v_Mob_No,
            v_Real_Mob_No,
            v_Tel_No,
            v_Bld_Mng_No,
            v_Poscd,
            v_Addr1,
            v_Addr2,
            v_Plan_Day,
            v_Plan_Tm,
            v_Mr_Cd,
            v_Pos_X,
            v_Pos_Y,
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

  END f_InsertRtcs0006_New;


  /*****************************************************************************
  -- 방문점검 작업정보 변경 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*지도 X좌표            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*지도 Y좌표            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0006
    SET    STD_YM     = v_Std_Ym,
           ORD_NO     = v_Ord_No,
           EQU_NO     = v_Equ_No,
           JOB_SEQ    = v_Job_Seq,
           SEQ        = v_Seq,
           MOB_NO     = v_Mob_No,
           TEL_NO     = v_Tel_No,
           BLD_MNG_NO = v_Bld_Mng_No,
           POSCD      = v_Poscd,
           ADDR1      = v_Addr1,
           ADDR2      = v_Addr2,
           PLAN_DAY   = v_Plan_Day,
           PLAN_TM    = v_Plan_Tm,
           MR_CD      = v_Mr_Cd,
           POS_X      = v_Pos_X,
           POS_Y      = v_Pos_Y,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  STD_YM     = v_Std_Ym
    AND    ORD_NO     = v_Ord_No
    AND    EQU_NO     = v_Equ_No
    AND    JOB_SEQ    = v_Job_Seq
    AND    SEQ        = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0006;
  
/*****************************************************************************
  -- 방문점검 작업정보 변경 Update 20181217고도화 v_Real_Mob_No 추가 
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0006_New (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Real_Mob_No    IN RTCS0006.REAL_MOB_NO%TYPE,    /*실 핸드폰             */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Pos_X          IN RTCS0006.POS_X%TYPE,          /*지도 X좌표            */
    v_Pos_Y          IN RTCS0006.POS_Y%TYPE,          /*지도 Y좌표            */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0006
    SET    STD_YM     = v_Std_Ym,
           ORD_NO     = v_Ord_No,
           EQU_NO     = v_Equ_No,
           JOB_SEQ    = v_Job_Seq,
           SEQ        = v_Seq,
           MOB_NO     = v_Mob_No,
           REAL_MOB_NO= v_Real_Mob_No,
           TEL_NO     = v_Tel_No,
           BLD_MNG_NO = v_Bld_Mng_No,
           POSCD      = v_Poscd,
           ADDR1      = v_Addr1,
           ADDR2      = v_Addr2,
           PLAN_DAY   = v_Plan_Day,
           PLAN_TM    = v_Plan_Tm,
           MR_CD      = v_Mr_Cd,
           POS_X      = v_Pos_X,
           POS_Y      = v_Pos_Y,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  STD_YM     = v_Std_Ym
    AND    ORD_NO     = v_Ord_No
    AND    EQU_NO     = v_Equ_No
    AND    JOB_SEQ    = v_Job_Seq
    AND    SEQ        = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0006_New;

  /*****************************************************************************
  -- 방문점검 작업정보 변경 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTCS0006
    WHERE  STD_YM  = v_Std_Ym
    AND    ORD_NO  = v_Ord_No
    AND    EQU_NO  = v_Equ_No
    AND    JOB_SEQ = v_Job_Seq
    AND    SEQ     = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.f_DeleteRtcs0006(2)', '기준년월  ', v_Std_Ym );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.f_DeleteRtcs0006(2)', '계약번호  ', v_Ord_No );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.f_DeleteRtcs0006(2)', '설비번호  ', v_Equ_No );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.f_DeleteRtcs0006(2)', '작업순번  ', v_Job_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.f_DeleteRtcs0006(2)', '순번      ', v_Seq    );
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.f_DeleteRtcs0006(2)', '등록자 ID ', v_Reg_Id );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0006;

  /*****************************************************************************
  -- 방문점검 작업정보 변경 관리
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.5        2017-05-02  wjim             [20170502_01] 점검예정일 변경 제한  
                                           - 기준년월 내로만 변경 가능
   1.7        2017-06-07  wjim             [20170607_01] 자동배정 수행예상시간인 매월 1일 00:00~03:00 까지 수정 불가
  *****************************************************************************/
  PROCEDURE p_InsertRtcs0006 (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN OUT RTCS0006.SEQ%TYPE,        /*순번                  */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*작업상태              */
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*고객 특이사항         */
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
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

    IF (TRIM(v_Std_Ym) <> TO_CHAR(SYSDATE, 'YYYYMM')) AND (0 = Pkg_Rtcm0051.f_sRtcm0051UseCount('H010', SUBSTR(v_Std_Ym,3,4))) THEN
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

    IF (TRIM(v_Job_Seq) IS NULL) OR (0 = Pkg_Rtcs0005.f_sRtcs0005Count(v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq)) THEN
        v_Return_Message := '작업순번('||v_Job_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Chk_Stat) IS NULL) OR (TRIM(v_Chk_Stat) = '04') THEN
        v_Return_Message := '작업상태('||v_Chk_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    --[20170607_01] 매월 1일 00:00~03:00 까지 수정 불가
    IF TO_CHAR(SYSDATE, 'DDHH24MISS') BETWEEN '01000000' AND '01025959' THEN
        v_Return_Message := '매월1일 00:00~03:00 사이에는 수정이 불가합니다!';
        RAISE e_Error;
    END IF;
    
    --[20170502_01] 점검예정일은 기준년월 내로만 변경 가능 
    IF SUBSTR(v_Plan_Day,1,6) <> v_Std_Ym THEN
        v_Return_Message := '점검에정일('||v_Plan_Day||')은 대상년월('||v_Std_Ym||') 이내에서만 지정이 가능합니다!';
        RAISE e_Error;
    END IF;

    v_Seq := f_sRtcs0006Seq(v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq);

    IF 0 != f_InsertRtcs0006(v_Std_Ym ,v_Ord_No ,v_Equ_No ,v_Job_Seq ,
                             v_Seq ,v_Mob_No ,v_Tel_No ,v_Bld_Mng_No ,
                             v_Poscd ,v_Addr1 ,v_Addr2 ,v_Plan_Day ,
                             v_Plan_Tm ,v_Mr_Cd ,NULL ,NULL ,
                             v_Reg_Id ,v_ErrorText) THEN
        v_Return_Message := '방문점검 작업정보 변경 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    IF 0 != Pkg_Rtcs0005.f_UpdateRtcs0005Info(v_Std_Ym ,v_Ord_No ,v_Equ_No ,v_Job_Seq ,
                                              v_Mr_Cd, v_Plan_Day , v_Plan_Tm , v_Req_Desc,
                                              v_Reg_Id ,v_ErrorText) THEN
        v_Return_Message := '방문점검 작업목록(RTCS0005) 정보 변경 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;


    /*수정/삭제 업무는 현재 없음

        IF 0 = f_sRtcs0006Count(v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq, v_Seq) THEN
            v_Return_Message := '해당 정보는 등록된 데이터가 아니므로 변경/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcs0006(v_Std_Ym ,v_Ord_No ,v_Equ_No ,v_Job_Seq ,
                                     v_Seq ,v_Mob_No ,v_Tel_No ,v_Bld_Mng_No ,
                                     v_Poscd ,v_Addr1 ,v_Addr2 ,v_Plan_Day ,
                                     v_Plan_Tm ,v_Mr_Cd ,v_Pos_X ,v_Pos_Y ,
                                     v_Reg_Id ,v_ErrorText) THEN
                v_Return_Message := '방문점검 작업정보 변경 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0006(v_Std_Ym ,v_Ord_No ,v_Equ_No ,v_Job_Seq ,
                                     v_Seq ,v_Reg_Id ,v_ErrorText) THEN
                v_Return_Message := '방문점검 작업정보 변경 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;

    */

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.p_InsertRtcs0006(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.p_InsertRtcs0006(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtcs0006;

  /*****************************************************************************
  -- 방문점검 작업정보 변경 - 순번 췌번
  *****************************************************************************/
  FUNCTION f_sRtcs0006Seq(
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,           /*기준년월            */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,           /*계약번호            */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,           /*설비번호            */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE           /*작업순번            */
    ) RETURN NUMBER IS
    v_Seq RTCS0006.SEQ%TYPE DEFAULT NULL;               /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTCS0006
                 WHERE   STD_YM  = v_Std_Ym
                 AND     ORD_NO  = v_Ord_No
                 AND     EQU_NO  = v_Equ_No
                 AND     JOB_SEQ = v_Job_Seq)+ 1, 1) AS SEQ
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0006Seq;


  /*****************************************************************************
  -- 방문점검 작업정보 - 우편번호(빌딩번호) 기준 Mr. Roadian 코드 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0006MrCd(
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE      /*빌딩번호              */
    ) RETURN NUMBER IS
    v_Mr_Cd RTCS0006.MR_CD%TYPE DEFAULT NULL;         /*Mr. Roadian 코드      */
  BEGIN

    SELECT  CARMASTER_NU /*카마스터사번*/
    INTO    v_Mr_Cd
    FROM    RTSD0010
    WHERE   BLD_MNG_NO = v_Bld_Mng_No;

    RETURN v_Mr_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0006MrCd;
  
  /*****************************************************************************
  -- 우편번호(빌딩번호) 기준 Mr. Roadian 정보 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-28  wjim             [20170324_02] 신규개발
  *****************************************************************************/
  PROCEDURE p_sRtcs0006Mr(
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE      /*빌딩번호              */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.CARMASTER_NU /* 로디안 사번*/
         ,  B1.CARMASTER_NM /* 로디안명   */
      FROM  RTSD0010 A1
         ,  RTCS0002 B1
     WHERE  A1.BLD_MNG_NO = v_Bld_Mng_No
       AND  A1.CARMASTER_NU = B1.CARMASTER_NU;

  END p_sRtcs0006Mr;
  
  /*****************************************************************************
  -- 시군구별 담당 로디안 정보 조회
  -- - 주소1 형태로 입력하면 파싱하여 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-04-04  wjim             [20170404_02] 시군구별 담당 로디안 조회기능 추가
   1.9        2017-09-01  wjim             [20170901_06] 시군구별 담당 로디안 조회기능 보완
                                           - 시군구에 '시'만 들어 있는 경우와 '시군'이 함께 있는 경우를 감안
   1.11       2019-12-02  wjim             [20191202_01] 시군구별 담당 로디안 조회기준 변경
                                           - 해당 지역에 2명 이상의 로디안이 존재하는 경우 사번 내림차순으로 1명 선정  
                                           - 운영테스트(1)가 아닌 로디안을 선정하기 위함                                         
  *****************************************************************************/
  PROCEDURE p_sRtcs0006MrAddr1(
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Addr1          IN RTCS0006.ADDR1%TYPE          /*주소1                */
  ) IS

  BEGIN

    /*
     * 1) '세종특별자치시'의 경우 시군구가 ' '으로 표기됨
     * 2) 하나의 시군구에 2명 이상의 로디안이 배정된 경우 임의로 1명만 선정 > 사번 내림차순으로 1명 선정 [20191202_01] 
     * 3) '시군구'컬럼에 '시'만 들어 있는 경우와 '시구'가 함께 있는 경우 감안 
     */
     -- [20191202_01] 이전
--    OPEN Ref_Cursor FOR    
--    SELECT  A1.CARMASTER_NU /* 로디안 사번*/
--         ,  B1.CARMASTER_NM /* 로디안명   */
--      FROM  RTSD0010 A1
--         ,  RTCS0002 B1
--     WHERE  1=1
--       AND  A1.DO_NM        = SUBSTR(v_Addr1,1,INSTR(v_Addr1,' ',1,1)-1)
--       AND  (
--                A1.CT_NM    = NVL(SUBSTR(v_Addr1,INSTR(v_Addr1,' ',1,1)+1,INSTR(v_Addr1,' ',1,2)-INSTR(v_Addr1,' ',1,1)-1),' ') --1,3)
--                OR
--                A1.CT_NM    = NVL(SUBSTR(v_Addr1,INSTR(v_Addr1,' ',1,1)+1,INSTR(v_Addr1,' ',1,3)-INSTR(v_Addr1,' ',1,1)-1),' ') --3) [20170901_06]
--            )
--       AND  A1.CARMASTER_NU IS NOT NULL
--       AND  A1.USE_YN       = 'Y'
--       AND  A1.CARMASTER_NU = B1.CARMASTER_NU
--       AND  ROWNUM = 1  --2)
--    ;
    
    -- [20191202_01] 이후
    OPEN Ref_Cursor FOR    
    SELECT  A2.CARMASTER_NU     /* 로디안 사번*/
         ,  B2.CARMASTER_NM     /* 로디안명   */
      FROM  (         
                SELECT  MAX(A1.CARMASTER_NU) AS CARMASTER_NU
                  FROM  RTSD0010 A1
                 WHERE  A1.DO_NM        = SUBSTR(v_Addr1,1,INSTR(v_Addr1,' ',1,1)-1)
                   AND  (
                            A1.CT_NM    = NVL(SUBSTR(v_Addr1,INSTR(v_Addr1,' ',1,1)+1,INSTR(v_Addr1,' ',1,2)-INSTR(v_Addr1,' ',1,1)-1),' ') --1,3)
                            OR
                            A1.CT_NM    = NVL(SUBSTR(v_Addr1,INSTR(v_Addr1,' ',1,1)+1,INSTR(v_Addr1,' ',1,3)-INSTR(v_Addr1,' ',1,1)-1),' ') --3) [20170901_06]
                            OR
                            A1.EM_NM    = NVL(SUBSTR(v_Addr1,INSTR(v_Addr1,' ',1,1)+1,INSTR(v_Addr1,' ',1,2)-INSTR(v_Addr1,' ',1,1)-1),' ') --3) [20200525_01]
                        )
                   AND  A1.CARMASTER_NU IS NOT NULL
                   AND  A1.USE_YN       = 'Y'
            ) A2
         ,  RTCS0002 B2            
     WHERE  A2.CARMASTER_NU = B2.CARMASTER_NU            
    ;

  END p_sRtcs0006MrAddr1;
  
  /*****************************************************************************
  -- 방문점검 작업정보 컨택변경 관리
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-27  wjim             [20170324_02] 신규개발
   1.2        2017-04-04  wjim             [20170404_01] 방문점검 컨택상태 검증로직 추가
   1.4        2017-04-05  wjim             [20170405_01] 방문점검 컨택 SMS추가
   1.6        2017-05-22  wjim             [20170522_01] 처리완료건 수정 불가처리
   1.7        2017-06-07  wjim             [20170607_01] 자동배정 수행예상시간인 매월 1일 00:00~03:00 까지 수정 불가
   1.8        2017-06-13  wjim             [20170613_01] 방문점검 컨택확정 SMS 메시지 변경
   1.10       2017-12-20  wjim             [20171220_01] 핸드폰, 전화번호 수정기능 추가
   1.2        2018-04-23  kskta            [20180423] 점검상태, 특이사항 추가

  *****************************************************************************/
  PROCEDURE p_InsertRtcs0006Contact (
    v_Std_Ym         IN RTCS0006.STD_YM%TYPE,         /*기준년월              */
    v_Ord_No         IN RTCS0006.ORD_NO%TYPE,         /*계약번호              */
    v_Equ_No         IN RTCS0006.EQU_NO%TYPE,         /*설비번호              */
    v_Job_Seq        IN RTCS0006.JOB_SEQ%TYPE,        /*작업순번              */
    v_Seq            IN RTCS0006.SEQ%TYPE,            /*순번                  */    
    v_Bld_Mng_No     IN RTCS0006.BLD_MNG_NO%TYPE,     /*빌딩번호              */
    v_Poscd          IN RTCS0006.POSCD%TYPE,          /*우편번호              */
    v_Addr1          IN RTCS0006.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0006.ADDR2%TYPE,          /*상세주소              */
    v_Plan_Day       IN RTCS0006.PLAN_DAY%TYPE,       /*점검예정일자          */
    v_Plan_Tm        IN RTCS0006.PLAN_TM%TYPE,        /*점검예정시간          */
    v_Mr_Cd          IN RTCS0006.MR_CD%TYPE,          /*Mr. Roadian 코드      */
    v_Ob_St          IN RTCS0005.OB_ST%TYPE,          /*상담상태              */    
    v_Ob_St_Dtl      IN RTCS0005.OB_ST_DTL%TYPE,      /*상담세부상태          */
    v_Mob_No         IN RTCS0006.MOB_NO%TYPE,         /*핸드폰                */--[20171220_01]
    v_Real_Mob_No    IN RTCS0006.REAL_MOB_NO%TYPE,    /*핸드폰                */--[20181217_01]
    v_Tel_No         IN RTCS0006.TEL_NO%TYPE,         /*전화번호              */--[20171220_01]
    v_Chk_Stat       IN RTCS0005.CHK_STAT%TYPE,       /*정기점검상태          */--[20180419]
    v_Req_Desc       IN RTCS0005.REQ_DESC%TYPE,       /*특이사항              */--[20180419]
    v_Reg_Id         IN RTCS0006.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  ) IS

    v_Seq_New       RTCS0006.SEQ%TYPE;
    v_Sms_Msg       RTSD0205.SND_MSG%TYPE := '';
    v_Cust_Nm       RTSD0100.CUST_NM%TYPE;
    v_Recall_Day    RTCS0012.RECALL_DAY%TYPE;
    v_Recall_Day2   VARCHAR2(20);
    v_Chk_Cnt       NUMBER := 0;
    v_Job_Seq2      RTCS0005.JOB_SEQ%TYPE DEFAULT NULL;     /*작업순번              */
    v_Mode_CS0005   VARCHAR2(1);
    v_Next_Day      VARCHAR2(8) DEFAULT NULL;               /* 다음 방문점검 예정일 */
    
    ls_Std_Ym       RTCS0005.STD_YM%TYPE;
    ls_Mr_Nm        RTCS0002.CARMASTER_NM%TYPE;             /* 담당 로디안명        */
    ls_Mr_Mob       VARCHAR2(15) DEFAULT NULL;              /* 담당 로디안 휴대폰   */

    lr_Cs0005       RTCS0005%ROWTYPE;
    lr_Cs0006       RTCS0006%ROWTYPE;
    
    v_templateCd    VARCHAR2(30);                           /* 알림톡 템플릿 번호 */
    
    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF 0 != ISDATE(TRIM(v_Std_Ym)) THEN
        v_Return_Message := '대상년월('||v_Std_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

--    IF (TRIM(v_Std_Ym) <> TO_CHAR(SYSDATE, 'YYYYMM')) AND (0 = Pkg_Rtcm0051.f_sRtcm0051UseCount('H010', SUBSTR(v_Std_Ym,3,4))) THEN
--        v_Return_Message := '해당 대상년월 데이터는 이미 마감되었으므로 처리가 불가합니다!';
--        RAISE e_Error;
--    END IF;

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Equ_No) IS NULL) OR (0 = Pkg_Rtcs0001.f_sRtcs0001Count(v_Equ_No)) THEN
        v_Return_Message := '설비번호('||v_Equ_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Job_Seq) IS NULL) OR (0 = Pkg_Rtcs0005.f_sRtcs0005Count(v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq)) THEN
        v_Return_Message := '작업순번('||v_Job_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    --[20170607_01] 매월 1일 00:00~03:00 까지 수정 불가
    IF TO_CHAR(SYSDATE, 'DDHH24MISS') BETWEEN '01000000' AND '01025959' THEN
        v_Return_Message := '매월1일 00:00~03:00 사이에는 수정이 불가합니다!';
        RAISE e_Error;
    END IF;
    
    IF v_Plan_Day < TO_CHAR(SYSDATE,'YYYYMMDD') THEN
        v_Return_Message := '변경일자('||v_Plan_Day||') : 해당일 이전으로 지정이 불가합니다!';
        RAISE e_Error;
    END IF;
    
    IF (SUBSTR(v_Plan_Day,1,6) > TO_CHAR(SYSDATE,'YYYYMM')) AND (SUBSTR(v_Plan_Day,1,6) > v_Std_Ym) THEN
        v_Return_Message := '변경일자('||v_Plan_Day||') : 현재월 이후로 지정이 불가합니다!';
        RAISE e_Error;
    END IF;
    
    IF SUBSTR(v_Plan_Day,1,6) < v_Std_Ym THEN
        v_Return_Message := '변경일자('||v_Plan_Day||') :  배정월('||v_Std_Ym||') 이전으로 지정이 불가합니다!';
        RAISE e_Error;
    END IF;
    
    -- 컨택상태 유효성 확인 [20170404_01]
    IF (TRIM(v_Ob_St) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051UseCount('C027',v_Ob_St)) THEN
        v_Return_Message := '컨택상태('||v_Ob_St||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 컨택세부상태 유효성 확인 [20170404_01]
    IF (TRIM(v_Ob_St_Dtl) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051UseCount('C028',v_Ob_St_Dtl)) THEN
        v_Return_Message := '컨택세부상태('||v_Ob_St_Dtl||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 상태-세부상태 매핑 유효성 확인 [20170404_01]
    IF TRIM(v_Ob_St_Dtl) IS NOT NULL AND v_Ob_St <> SUBSTR(v_Ob_St_Dtl, 1, 2) THEN
        v_Return_Message := '상태('||v_Ob_St||')-세부상태('||v_Ob_St_Dtl||') 매핑 오류!';
        RAISE e_Error;
    END IF;
    
    -- 담당 로디안 유효성 확인
    IF (TRIM(v_Mr_Cd) IS NULL) OR (0 = Pkg_Rtcs0002.f_sRtcs0002Count(v_Mr_Cd)) THEN
        v_Return_Message := '담당로디안('||v_Mr_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 핸드폰
    IF (TRIM(v_Mob_No) IS NULL) OR (TRIM(v_Mob_No) = '') THEN
        v_Return_Message := '핸드폰('||v_Mob_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 전화번호
    IF (TRIM(v_Tel_No) IS NULL) OR (TRIM(v_Tel_No) = '') THEN
        v_Return_Message := '전화번호('||v_Tel_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 담당 로디안정보 조회 [20170613_01]
    SELECT  REGEXP_SUBSTR(CARMASTER_NM, '[^(]+')                        --로디안명에서 '(사업자)' 제거
         ,  REGEXP_REPLACE(MOB_NO,'(\d{3})(\d*)(\d{4})', '\1-\2-\3')    --로디안 핸드폰번호 '010-1234-5678' 형태로 조정
      INTO  ls_Mr_Nm
         ,  ls_Mr_Mob
      FROM  RTCS0002
     WHERE  CARMASTER_NU = v_Mr_Cd;
    
    -- 변경전 방문점검 작업목록 조회
    SELECT  *
      INTO  lr_Cs0005
      FROM  RTCS0005
     WHERE  STD_YM  = v_Std_Ym
       AND  ORD_NO  = v_Ord_No
       AND  EQU_NO  = v_Equ_No
       AND  JOB_SEQ = v_Job_Seq;
       
    -- 점검완료 여부 확인 [20170522_01]
    IF lr_Cs0005.CHK_STAT = '04' THEN
        v_Return_Message := '이미 점검완료되어 수정이 불가합니다!';
        RAISE e_Error;
    END IF;       
       
    -- 변경일자가 어떤 월이냐에 따라 분기
    IF SUBSTR(v_Plan_Day,1,6) = v_Std_Ym THEN
        v_Mode_CS0005 := 'U';        
        ls_Std_Ym := v_Std_Ym;
        
    ELSE
        -- 변경된 예정일자의 해당월에 방문점검 작업목록이 존재하는지 확인
        SELECT  COUNT(*)
          INTO  v_Chk_Cnt
          FROM  RTCS0005
         WHERE  STD_YM  = SUBSTR(v_Plan_Day,1,6)
           AND  ORD_NO  = v_Ord_No
           AND  EQU_NO  = v_Equ_No
           AND  JOB_SEQ = v_Job_Seq;
           
        IF v_Chk_Cnt > 0 THEN
            v_Return_Message := '변경월('||SUBSTR(v_Plan_Day,1,6)||')에 이미 배정건이 존재합니다!';
            RAISE e_Error;
        ELSE
            v_Mode_CS0005 := 'I';
            ls_Std_Ym := SUBSTR(v_Plan_Day,1,6);
        
        END IF;
        
    END IF;
    
    v_Job_Seq2 := v_Job_Seq;
    
    IF v_Mode_CS0005 = 'I' THEN
        -- 방문점검 작업목록 생성
        Pkg_Rtcs0005.p_IUDRtcs0005 (
            'I',ls_Std_Ym, v_Ord_No, v_Equ_No,
            v_Job_Seq2, lr_Cs0005.TARGET_CD, v_Mr_Cd, NULL,
            'N', NULL, lr_Cs0005.PLAN_DAY0, lr_Cs0005.PLAN_TM0,
            v_Plan_Day, v_Plan_Tm, NULL, NULL,
            '01', NULL, v_Req_Desc, v_Reg_Id, --[20180423]
            v_Success_Code, v_Return_Message, v_ErrorText
        );
        
        IF 0 != v_Success_Code THEN
            v_Return_Message := '방문점검 작업목록(RTCS0005) 생성 실패!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    
    ELSE    
        -- 방문점검 작업목록정보 업데이트
        UPDATE  RTCS0005
           SET  MR_CD     = v_Mr_Cd
             ,  PLAN_DAY  = v_Plan_Day
             ,  PLAN_TM   = v_Plan_Tm
             ,  OB_ST     = v_Ob_St
             ,  OB_ST_DTL = v_Ob_St_Dtl
             ,  REQ_DESC  = v_Req_Desc --[20180423]
             ,  CHG_ID    = v_Reg_Id
             ,  CHG_DT    = SYSDATE
         WHERE  STD_YM    = ls_Std_Ym
           AND  ORD_NO    = v_Ord_No
           AND  EQU_NO    = v_Equ_No
           AND  JOB_SEQ   = v_Job_Seq;
           
    END IF;   
    
    -- 변경전 방문점검 작업정보 조회
    SELECT  *
      INTO  lr_Cs0006
      FROM  RTCS0006
     WHERE  STD_YM  = v_Std_Ym
       AND  ORD_NO  = v_Ord_No
       AND  EQU_NO  = v_Equ_No
       AND  JOB_SEQ = v_Job_Seq
       AND  SEQ     = v_Seq;

    v_Seq_New := f_sRtcs0006Seq(ls_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq2);

    IF 0 != f_InsertRtcs0006(
              ls_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq2
            , v_Seq_New, v_Mob_No, v_Tel_No, v_Bld_Mng_No
            , v_Poscd  , v_Addr1 , v_Addr2 , v_Plan_Day
            , v_Plan_Tm, v_Mr_Cd , NULL    , NULL
            , v_Reg_Id , v_ErrorText
    ) THEN
        v_Return_Message := '방문점검 작업정보 변경 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
    
    IF 0 != Pkg_Exif0003.f_sExif0003Rtsd0104RMNUpdate(v_Ord_No, v_Reg_Id, v_Real_Mob_No, v_ErrorText) THEN
        v_Return_Message := '계약정보(RTSD0104) 고객 실 휴대폰번호 변경 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    -- SMS발송
    -- -컨택상태가 변경되면 발송
    IF lr_Cs0005.OB_ST_DTL <> v_Ob_St_Dtl THEN
    
        -- 고객명 조회
        BEGIN
            SELECT  B1.CUST_NM
              INTO  v_Cust_Nm
              FROM  RTSD0104 A1
                 ,  RTSD0100 B1
             WHERE  A1.ORD_NO  = v_Ord_No
               AND  A1.CUST_NO = B1.CUST_NO;
        EXCEPTION
            WHEN others THEN
                v_Return_Message := '고객명 조회 실패';
                RAISE e_Error;
        END;
        
        -- 다음번 점검일 조회 [20170405_01] 
        BEGIN
            SELECT  Pkg_Rtcs0004.f_sRtcs0004PlanDay(TO_CHAR(ADD_MONTHS(TO_DATE(v_Std_Ym,'YYYYMM'),1),'YYYYMM'), v_Ord_No)
              INTO  v_Next_Day
              FROM  dual; 
        EXCEPTION
            WHEN OTHERS THEN
                v_Return_Message := '다음 점검일 조회 실패';
                RAISE e_Error;
        END;
    
        -- SMS메시지 생성
        IF v_Ob_St_Dtl = '0201' THEN                       /* 진행-재컨택요청 */
            -- 재컨택 예정일 조회
--            BEGIN
--                SELECT  RECALL_DAY
--                  INTO  v_Recall_Day
--                  FROM  (    
--                            SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY CALL_SEQ DESC) AS ROW_NUM
--                                 ,  X.*                 
--                              FROM  RTCS0012 X
--                             WHERE  X.ORD_NO = v_Ord_No
--                        ) A1
--                 WHERE  A1.ROW_NUM = 1;
--            EXCEPTION
--                WHEN no_data_found THEN
--                    v_Recall_Day := '';
--                WHEN others THEN
--                    v_Return_Message := '재컨택 예정일 조회 실패 : '||SUBSTR(SQLERRM,1,200);
--                    RAISE e_Error;
--            END;
--            
--            -- 조회된 재컨택 예정일로 SMS메시지 구성
--            IF v_Recall_Day IS NULL OR v_Recall_Day ='' THEN 
--                v_Recall_Day2 := '';
--            ELSE
--                v_Recall_Day2 := SUBSTR(v_Recall_Day,5,2)||'월 '||SUBSTR(v_Recall_Day,7,2)||'일';
--            END IF;
             
--            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 넥스트레벨 방문점검 서비스 일정 논의차 연락드렸습니다. '||v_Recall_Day2||' 다시 연락드리도록 하겠습니다.';            
            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 타이어렌탈 서비스 일정 논의차 연락드렸습니다. 통화가 여의치 않아 다시 연락드리도록 하겠습니다.'; --변경:20180625 kstka

            
            v_templateCd := 'RENTAL00000000000041';
        ELSIF v_Ob_St_Dtl = '0202' THEN                      /* 진행-연락안됨 */
--            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 넥스트레벨 방문점검 서비스 일정 논의차 연락드렸습니다. 다시 연락드리도록 하겠습니다.';

            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 타이어렌탈 방문점검 서비스 일정 논의차 연락드렸습니다. 다시 연락드리도록 하겠습니다.'; --변경:20180625 kstka

            v_templateCd := 'RENTAL00000000000042';  
        ELSIF v_Ob_St_Dtl = '0203' THEN                     /* 진행-익월로 이월 */            
            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 타이어렌탈 방문점검 서비스 일정 논의차 연락드렸습니다. 이번달에 배정된 방문점검 서비스는 익월에 재연락드리겠습니다.'; --추가:20180625 kstka
           
            v_templateCd := 'RENTAL00000000000043';  
        ELSIF v_Ob_St_Dtl = '0301' THEN                      /* 완료-확정     */
--            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 정기 방문점검 서비스를 위하여 고객님께 '||SUBSTR(v_Plan_Day,5,2)||'월 '||SUBSTR(v_Plan_Day,7,2)||'일'||' 담당 미스터 로디안이 연락 후 방문드리도록 하겠습니다.'; -- [20170613_01] 이전
--            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 정기 방문점검 서비스를 위하여 담당로디안('||ls_Mr_Nm||', '||ls_Mr_Mob||')이 예정일('||SUBSTR(v_Plan_Day,5,2)||'월 '||SUBSTR(v_Plan_Day,7,2)||'일) 이전 연락 후 방문 예정입니다.';
            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 타이어렌탈 정기 방문점검 서비스를 위하여 고객님께 '||SUBSTR(v_Plan_Day,5,2)||'월 '||SUBSTR(v_Plan_Day,7,2)||'일 담당 미스터 로디안이 연락 후 방문 드리도록 하겠습니다.'; --변경:20180625 kstka

--            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
--            v_Sms_Msg := v_Sms_Msg||'정확한 일정은 담당 로디안과 통화 후 상의해주세요. 감사합니다.';
            
            v_templateCd := 'RENTAL00000000000044';  
--        ELSIF v_Ob_St_Dtl = '0401' THEN -- 보류-배정월변경. 배정월 이월기능 차후 개발하기로 협의하여 일단 미구현
--            v_Sms_Msg := '[넥센타이어] 000고객님 고객님의 요청으로 방문점검 서비스의 배정이 0000년 00월로 변경되었습니다. 감사합니다.';
        ELSIF v_Ob_St_Dtl = '0302' THEN                      /* 완료-점검완료     */
            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 타이어렌탈 정기 방문점검 서비스 관련 안내드립니다. 금번 회차에 배정된 서비스를 다시 받기를 원하시면 콜센터(1855-0100)로 연락주시기 바랍니다.';

            v_templateCd := 'RENTAL00000000000045';  
        ELSIF v_Ob_St_Dtl = '0501' THEN                      /* 취소-고객요청 */
            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||' 고객님 고객님의 요청으로 인하여 금번회차 방문점검 서비스는 취소되었습니다. 감사합니다.';
            
            v_templateCd := 'RENTAL00000000000046';
        ELSIF v_Ob_St_Dtl = '0503' THEN                      /* 취소-연체고객 */
            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 현재 고객님께서는 타이어 렌탈료 연체 상태로 금번 방문점검 서비스 대상에서 제외되며, 서비스 회차가 차감됩니다. 문의사항이 있으실 경우 콜센터(1855-0100)로 문의주세요. 감사합니다.'; --추가:20180625 kstka
            
            v_templateCd := 'RENTAL00000000000047';
        ELSIF v_Ob_St_Dtl = '0504' THEN                      /* 취소-3회 이상 연결안됨 [20170405_01] */
--            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 방문점검 서비스를 위해 연락을 드렸으나 연결이 되지 않아 연락드립니다. ';
            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 타이어렌탈 방문점검 서비스 관련 지속적으로 연락을 드렸으나, 연결이 되지 않아 금번 회차 서비스는 취소처리 됩니다.'; --변경:20180625 kstka

            IF v_Next_Day IS NULL OR v_Next_Day = '' THEN      /* 마지막 점검인 경우 */
                v_Sms_Msg := v_Sms_Msg||'계약기간 만료월로 당월이 마지막 방문점검 서비스입니다. 만료전';
                
                v_templateCd := 'RENTAL00000000000048';
            ELSE                                             /* 다음 점검이 존재하는 경우 */
                v_Sms_Msg := v_Sms_Msg||'다음 방문점검 서비스는 '||SUBSTR(v_Next_Day,1,4)||'년 '||SUBSTR(v_Next_Day,5,2)||'월에 예정되어 있습니다. 예정월 전';
                
                v_templateCd := 'RENTAL00000000000049';
            END IF;
            
--            v_Sms_Msg := v_Sms_Msg||' 방문점검 서비스를 원하실 경우 콜센터(1855-0100)으로 연락주시기 바랍니다. 감사합니다.';
            v_Sms_Msg := v_Sms_Msg||' 서비스를 받으시려면 콜센터(1855-0100)로 연락주세요. 감사합니다.'; --변경:20180625 kstka

        ELSIF v_Ob_St_Dtl = '0505' THEN                      /* 취소-전문점 내방 [20170405_01] */
--            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 금번 회차 방문점검 서비스는 전문점 내방을 통한 점검서비스로 운영하도록 하겠습니다. ';
            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 타이어렌탈 전문점 내방 후 점검 서비스를 받겠다고 하시어 금번 회차 서비스는 취소처리됩니다.'; --변경:20180625 kstka

            IF v_Next_Day IS NULL OR v_Next_Day = '' THEN      /* 마지막 점검인 경우 */
                v_Sms_Msg := v_Sms_Msg||'금번 방문점검 서비스가 마지막 회차입니다. 감사합니다.';
                
                v_templateCd := 'RENTAL00000000000050';
            ELSE                                             /* 다음 점검이 존재하는 경우 */
--                v_Sms_Msg := v_Sms_Msg||'다음번 방문 점검 서비스는 '||SUBSTR(v_Next_Day,1,4)||'년 '||SUBSTR(v_Next_Day,5,2)||'월예 예정되어 있습니다. 감사합니다.';
                v_Sms_Msg := v_Sms_Msg||'다음번 방문 점검 서비스는 '||SUBSTR(v_Next_Day,1,4)||'년 '||SUBSTR(v_Next_Day,5,2)||'월에 예정되어 있습니다.'; --변경:20180625 kstka

                v_templateCd := 'RENTAL00000000000051';
            END IF;            

            v_Sms_Msg := v_Sms_Msg||' 서비스를 받으시려면 콜센터(1855-0100)로 연락주세요. 감사합니다.'; --추가:20180625 kstka
            
        ELSIF v_Ob_St_Dtl = '0506' THEN                      /* 취소-직접연락 */
            v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||'고객님 타이어렌탈 방문점검 서비스 필요시 콜센터(1855-0100)로 연락주세요. 감사합니다.'; --추가:20180625 kstka
            
            v_templateCd := 'RENTAL00000000000052';
        END IF;


        -- SMS발송
        IF v_Sms_Msg IS NOT NULL OR v_Sms_Msg <> '' THEN
            Pkg_Rtsd0205.p_Rtsd0205InterfaceNew(
                  'I'                   /*예약 전송여부         */
                , NULL                  /*예약 전송시간         */
                , lr_Cs0006.MOB_NO      /*받는 전화번호         */
                , '18550100'            /*보내는 전화번호       */
                , v_Sms_Msg             /*메시지내용            */
                , 'S011'                /*사용자지정 필드       */
                , lr_Cs0006.ORD_NO      /*사용자지정 필드       */
                , '2'
                , v_templateCd
                , v_Reg_Id              /*등록자 ID             */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
            
            dbms_output.put_line('v_Success_Code');
            
            IF v_Success_Code <> 0 THEN
                v_Return_Message := 'SMS발송실패:'||v_ErrorText;
                RAISE e_Error;
            END IF;
        END IF;        
    END IF;
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.p_InsertRtcs0006Contact(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0006.p_InsertRtcs0006Contact(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtcs0006Contact;

END Pkg_Rtcs0006;
/