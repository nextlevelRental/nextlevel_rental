CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0102 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0102
   PURPOSE   인바운드 상담등록 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-12  jemcarry         1. Created this package body.
   1.1        2017-12-08  wjim             [20171208_02] 상담리스트 조회 정렬기준 변경
   1.2        2018-01-18  wjim             [20180118_01] 상담내용 갱신시 상담사ID 갱신 오류 수정
   1.3        2018-02-06  wjim             [20180206_01] 상담내용 갱신시 오류 보완
*******************************************************************************/

  /*****************************************************************************
  -- 인바운드 상담등록 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0102Count(
    v_Call_No        IN RTCS0102.CALL_NO%TYPE           /*인바운드 상담번호   */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0102
    WHERE   CALL_NO = v_Call_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0102Count;

  /*****************************************************************************
  -- 인바운드 상담등록 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0102 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_No        IN RTCS0102.CALL_NO%TYPE,        /*인바운드 상담번호     */
    v_Recv_FDay      IN RTCS0102.RECV_DAY%TYPE,       /*통화일자FROM          */
    v_Recv_TDay      IN RTCS0102.RECV_DAY%TYPE,       /*통화일자TO            */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE          /*등록자ID              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  B.CHAN_CD,                                                     /*채널경로 */
            A.CALL_NO,                                                     /*인바운드 상담번호   */
            A.RECV_DAY,                                                    /*통화일자            */
            A.RECV_TM,                                                     /*통화시간            */
            A.USER_ID,                                                     /*사용자ID(상담사)    */
            A.RECV_TP,                                                     /*인바운드 상담유형   */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H005', A.RECV_TP) RECV_TP_NM,/*상담유형명          */
            A.RESU_ST,                                                     /*처리상태            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H006', A.RESU_ST) RESU_ST_NM,/*처리상태명          */
            A.ORD_NO,                                                      /*주문번호            */
            A.CUST_NO,                                                     /*고객번호            */
            A.CUST_NM,                                                     /*고객명/법인명       */
            A.TEL_NO,                                                      /*상담전화번호        */
            A.CALL_DTL,                                                    /*상담내용            */
            A.CLAIM_NO,                                                    /*클레임번호          */
            A.END_DAY,                                                     /*완료일자            */
            A.END_TM,                                                      /*완료시간            */
            A.SMS_TX,                                                      /*SMS내용             */
            A.REGION_NO,                                                   /*지역코드            */
            A.CITY_NO,                                                     /*도시코드            */
            A.CAR_NO,                                                      /*차량번호            */
            A.REG_ID,                                                      /*등록자ID            */
            A.REG_DT,                                                      /*등록일              */
            A.CHG_ID,                                                      /*변경자ID            */
            A.CHG_DT                                                       /*변경일              */
    FROM    RTCS0102 A, RTSD0104 B
    WHERE   (v_Call_No   IS NULL OR A.CALL_NO  = v_Call_No)
    AND     A.RECV_DAY BETWEEN v_Recv_FDay AND v_Recv_TDay
    AND     (v_User_Id   IS NULL OR A.USER_ID  = v_User_Id)
    AND     (v_Recv_Tp   IS NULL OR A.RECV_TP  = v_Recv_Tp)
    AND     (v_Resu_St   IS NULL OR A.RESU_ST  = v_Resu_St)
    AND     (v_Ord_No    IS NULL OR A.ORD_NO   = v_Ord_No)
    AND     (v_Cust_No   IS NULL OR A.CUST_NO  = v_Cust_No)
    AND     (v_Recv_Tm   IS NULL OR A.RECV_TM  = v_Recv_Tm)
    AND     (v_Cust_Nm   IS NULL OR A.CUST_NM  LIKE v_Cust_Nm||'%')
    AND     (v_Tel_No    IS NULL OR A.TEL_NO   = v_Tel_No)
    AND     (v_Call_Dtl  IS NULL OR A.CALL_DTL LIKE '%'||v_Call_Dtl||'%')
    AND     (v_Claim_No  IS NULL OR A.CLAIM_NO = v_Claim_No)
    AND     (v_End_Day   IS NULL OR A.END_DAY  = v_End_Day)
    AND     (v_End_Tm    IS NULL OR A.END_TM   = v_End_Tm)
    AND     (v_Reg_Id    IS NULL OR A.REG_ID   = v_Reg_Id)
    AND     A.ORD_NO = B.ORD_NO(+);


  END p_sRtcs0102;

  /*****************************************************************************
  -- 인바운드 상담등록 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0102 (
    v_Call_No        IN OUT RTCS0102.CALL_NO%TYPE,    /*인바운드 상담번호     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Sms_Tx         IN RTCS0102.SMS_TX%TYPE,         /*SMS내용               */
    v_Region_No      IN RTCS0102.REGION_NO%TYPE,      /*지역코드              */
    v_City_No        IN RTCS0102.CITY_NO%TYPE,        /*도시코드              */
    v_Car_No         IN RTCS0102.CAR_NO%TYPE,         /*차량번호              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*등록자ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0102 (
            CALL_NO,
            RECV_DAY,
            RECV_TM,
            USER_ID,
            RECV_TP,
            RESU_ST,
            ORD_NO,
            CUST_NO,
            CUST_NM,
            TEL_NO,
            CALL_DTL,
            CLAIM_NO,
            END_DAY,
            END_TM,
            SMS_TX,
            REGION_NO,
            CITY_NO,
            CAR_NO,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Call_No,
            v_Recv_Day,
            v_Recv_Tm,
            v_Reg_Id,
            v_Recv_Tp,
            v_Resu_St,
            v_Ord_No,
            v_Cust_No,
            v_Cust_Nm,
            v_Tel_No,
            v_Call_Dtl,
            v_Claim_No,
            v_End_Day,
            v_End_Tm,
            v_Sms_Tx,
            v_Region_No,
            v_City_No,
            v_Car_No,
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

  END f_InsertRtcs0102;

  /*****************************************************************************
  -- 인바운드 상담등록 Update
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2018-01-18  wjim             [20180118_01] 상담내용 갱신시 상담사ID 갱신 오류 수정
                                           - 기존:등록자ID > 변경:상담사ID
   1.3        2018-02-06  wjim             [20180206_01] 상담사ID 가 없는 경우 등록자ID로 대체
                                           - 최초 AS접수 시 QMS의 클래임번호 업데이트 시 상담사ID가 null이라 오류 발생                                           
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0102 (
    v_Call_No        IN OUT RTCS0102.CALL_NO%TYPE,    /*인바운드 상담번호     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Sms_Tx         IN RTCS0102.SMS_TX%TYPE,         /*SMS내용               */
    v_Region_No      IN RTCS0102.REGION_NO%TYPE,      /*지역코드              */
    v_City_No        IN RTCS0102.CITY_NO%TYPE,        /*도시코드              */
    v_Car_No         IN RTCS0102.CAR_NO%TYPE,         /*차량번호              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*등록자ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0102
    SET    RECV_DAY     = v_Recv_Day,
           RECV_TM      = v_Recv_Tm,
--           USER_ID      = v_Reg_Id,  --[20180118_01] 변경전
--           USER_ID      = v_User_Id  --[20180206_01] 변경전
           USER_ID      = NVL(v_User_Id, v_Reg_Id),
           RECV_TP      = v_Recv_Tp,
           RESU_ST      = v_Resu_St,
           ORD_NO       = v_Ord_No,
           CUST_NO      = v_Cust_No,
           CUST_NM      = v_Cust_Nm,
           TEL_NO       = v_Tel_No,
           CALL_DTL     = v_Call_Dtl,
           CLAIM_NO     = v_Claim_No,
           END_DAY      = v_End_Day,
           END_TM       = v_End_Tm,
           SMS_TX       = v_Sms_Tx,
           REGION_NO    = v_Region_No,
           CITY_NO      = v_City_No,
           CAR_NO       = v_Car_No,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  CALL_NO  = v_Call_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0102;

  /*****************************************************************************
  -- 인바운드 상담등록 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0102 (
    v_Call_No        IN RTCS0102.CALL_NO%TYPE,        /*인바운드 상담번호     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*등록자ID              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0102
    SET    CALL_NO   = v_Call_No,
           RECV_DAY  = v_Recv_Day,
           RECV_TM   = v_Recv_Tm,
           USER_ID   = v_User_Id,
           RECV_TP   = v_Recv_Tp,
           RESU_ST   = v_Resu_St,
           ORD_NO    = v_Ord_No,
           CUST_NO   = v_Cust_No,
           CUST_NM   = v_Cust_Nm,
           TEL_NO    = v_Tel_No,
           CALL_DTL  = v_Call_Dtl,
           CLAIM_NO  = v_Claim_No,
           END_DAY   = v_End_Day,
           END_TM    = v_End_Tm,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  CALL_NO   = v_Call_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0102;

  /*****************************************************************************
  -- 인바운드 상담등록 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0102 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Call_No        IN OUT RTCS0102.CALL_NO%TYPE,    /*인바운드 상담번호     */
    v_Recv_Day       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_Recv_Tm        IN RTCS0102.RECV_TM%TYPE,        /*통화시간              */
    v_User_Id        IN RTCS0102.USER_ID%TYPE,        /*사용자ID(상담사)      */
    v_Recv_Tp        IN RTCS0102.RECV_TP%TYPE,        /*인바운드 상담유형     */
    v_Resu_St        IN RTCS0102.RESU_ST%TYPE,        /*처리상태              */
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_Call_Dtl       IN RTCS0102.CALL_DTL%TYPE,       /*상담내용              */
    v_Claim_No       IN RTCS0102.CLAIM_NO%TYPE,       /*클레임번호            */
    v_End_Day        IN RTCS0102.END_DAY%TYPE,        /*완료일자              */
    v_End_Tm         IN RTCS0102.END_TM%TYPE,         /*완료시간              */
    v_Sms_Tx         IN RTCS0102.SMS_TX%TYPE,         /*SMS내용               */
    v_Region_No      IN RTCS0102.REGION_NO%TYPE,      /*지역코드              */
    v_City_No        IN RTCS0102.CITY_NO%TYPE,        /*도시코드              */
    v_Car_No         IN RTCS0102.CAR_NO%TYPE,         /*차량번호              */
    v_Reg_Id         IN RTCS0102.REG_ID%TYPE,         /*등록자ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Day) IS NULL THEN
        v_Return_Message := '통화일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Tm) IS NULL THEN
        v_Return_Message := '통화시간('||v_Recv_Tm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Recv_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H005', v_Recv_Tp)) THEN
        v_Return_Message := '인바운드 상담유형('||v_Recv_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Resu_St) IS NULL THEN
        v_Return_Message := '처리상태('||v_Resu_St||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        SELECT  DECODE(MAX(CALL_NO),NULL,1,MAX(TO_NUMBER(CALL_NO)) +1) AS CALL_NO
        INTO    v_Call_No
        FROM    RTCS0102;

        IF 0 = f_sRtcs0102Count(v_Call_No) THEN
            IF 0 != f_InsertRtcs0102(v_Call_No,v_Recv_Day,v_Recv_Tm,v_User_Id,v_Recv_Tp,v_Resu_St,v_Ord_No
                                    ,v_Cust_No,v_Cust_Nm,v_Tel_No,v_Call_Dtl,v_Claim_No,v_End_Day,v_End_Tm
                                    ,v_Sms_Tx, v_Region_No, v_City_No, v_Car_No
                                    ,v_Reg_Id,v_ErrorText ) THEN
                v_Return_Message := '인바운드 상담등록 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtcs0102(v_Call_No,v_Recv_Day,v_Recv_Tm,v_User_Id,v_Recv_Tp,v_Resu_St,v_Ord_No
                                ,v_Cust_No,v_Cust_Nm,v_Tel_No,v_Call_Dtl,v_Claim_No,v_End_Day,v_End_Tm
                                ,v_Sms_Tx, v_Region_No, v_City_No, v_Car_No
                                ,v_Reg_Id,v_ErrorText  ) THEN
                v_Return_Message := '인바운드 상담등록 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0102(v_Call_No,v_Recv_Day,v_Recv_Tm,v_User_Id,v_Recv_Tp,v_Resu_St,v_Ord_No
                                ,v_Cust_No,v_Cust_Nm,v_Tel_No,v_Call_Dtl,v_Claim_No,v_End_Day,v_End_Tm
                                ,v_Reg_Id,v_ErrorText  ) THEN
                v_Return_Message := '인바운드 상담등록 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다.';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0102.p_IUDRtcs0102(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0102.p_IUDRtcs0102(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0102;

  /*****************************************************************************
  -- 계약 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0102Ctf (
   Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cust_No       IN RTCS0102.CUST_NO%TYPE,                  /*거래처번호   */
    v_Cust_Nm       IN RTCS0102.CUST_NM%TYPE,                  /*고객명/법인명*/
    v_Mob_No        IN RTSD0100.MOB_NO%TYPE,                   /*휴대폰번호   */
    v_StartDay      IN RTSD0106.PLAN_DAY%TYPE,                 /*장착예정일   */
    v_EndDay        IN RTSD0106.PLAN_DAY%TYPE                  /*장착예정일   */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                                                      /*고객코드     */
            A.CUST_NM,                                                      /*고객명       */
            B.ORD_NO,                                                       /*계약번호     */
            B.STAT_CD,                                                      /*계약상태     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S032', B.STAT_CD) STAT_CD_NM, /*계약상태명   */
            C.PLAN_DAY,                                                     /*장착예정일   */
            C.MAT_CD,                                                       /*상품명       */
            B.CNT_CD,                                                       /*타이어본수   */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', B.CNT_CD) CNT_NM,      /*계약상태명   */
            B.PERIOD_CD,                                                    /*렌탈기간(월) */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', B.PERIOD_CD) PERIOD_NM,/*렌탈기간(월) */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S023', B.REGI_CD) REGI_NM,    /*등록비       */
            C.MON_AMT,                                                      /*월렌탈료     */
            B.MODEL_CD,                                                     /*차종         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', B.MODEL_CD) MODEL_NM,  /*등록비       */
            B.CAR_NO,                                                       /*차량번호     */
            A.MOB_NO,                                                       /*휴대폰번호   */
            A.TEL_NO ,   /*전화번호     */
            B.CHAN_CD
    FROM    RTSD0100 A,
            RTSD0104 B,
            RTSD0106 C
    WHERE   B.ORD_NO  = C.ORD_NO
    AND     A.CUST_NO = B.CUST_NO
    AND     C.PLAN_DAY BETWEEN v_StartDay AND v_EndDay
    AND     (v_Mob_No  IS NULL OR A.MOB_NO     =  v_Mob_No)
    AND     A.CUST_NO IN(
                          SELECT CUST_NO
                          FROM RTSD0100
                          WHERE CUST_NM LIKE '%'||v_Cust_Nm||'%'
                          OR CUST_NO = v_Cust_No
                        )
    ;

  END p_sRtcs0102Ctf;


 /*****************************************************************************
 -- 아웃바운드상담리스트  조회
 
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-12-08  wjim             [20171208_02] 통화일자 내림차순으로 정렬 
 *****************************************************************************/
  PROCEDURE p_sRtcs0102Obf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객코드              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_StartDay      IN RTCS0100.JOB_DAY%TYPE,         /*처리일자              */
    v_EndDay        IN RTCS0100.JOB_DAY%TYPE          /*처리일자              */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.JOB_TP,                                                               /*상담코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H001', A.JOB_TP) JOB_TP_NM,           /*상담유형명   */
            A.CALL_DAY,                                                             /*통화일자     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H002', A.CALL_STATUS) CALL_STATUS_NM, /*통화상태     */
            A.ORD_NO,                                                               /*계약번호     */
            A.CUST_NO,                                                              /*고객코드     */
            A.CUST_NM,                                                              /*고객명       */
            A.JOB_DAY,                                                              /*처리일자     */
            A.CALL_NO,                                                              /*상담번호     */
            A.USER_ID                                           ,                   /*상담사ID     */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_ID_NM,                   /*상담사명     */
            A.MOB_NO,                                                               /*휴대폰번호   */
            A.TEL_NO,                                                               /*전화번호     */
            A.CALL_DTL                                                              /*상담내용     */
    FROM    RTCS0100 A
    WHERE   (v_StartDay IS NULL OR (v_StartDay IS NOT NULL AND A.JOB_DAY BETWEEN v_StartDay AND v_EndDay))
    AND     (v_Cust_No IS NULL OR A.CUST_NO = v_Cust_No)
    AND     (v_Cust_Nm IS NULL OR A.CUST_NM = v_Cust_Nm)
    AND     (v_Tel_No  IS NULL OR A.TEL_NO  = v_Tel_No OR A.MOB_NO = v_Tel_No)
    ORDER BY A.CALL_DAY DESC                                                    -- [20171208_02]
    ;

  END p_sRtcs0102Obf;

 /*****************************************************************************
 -- 인바운드상담리스트  조회
 
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-12-08  wjim             [20171208_02] 통화일자, 통화시간 내림차순으로 정렬 
 *****************************************************************************/
  PROCEDURE p_sRtcs0102Ibf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0102.CUST_NO%TYPE,        /*고객코드              */
    v_Cust_Nm        IN RTCS0102.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Tel_No         IN RTCS0102.TEL_NO%TYPE,         /*상담전화번호          */
    v_StartDay       IN RTCS0102.RECV_DAY%TYPE,       /*통화일자              */
    v_EndDay         IN RTCS0102.RECV_DAY%TYPE        /*통화일자              */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_TP,                                                      /*상담유형코드      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H005', A.RECV_TP) RECV_TP_NM, /*상담유형명        */
            A.RECV_DAY,                                                     /*통화일자          */
            A.RECV_TM,                                                      /*통화시간          */
            A.RESU_ST,                                                      /*처리상태코드명    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H006', A.RESU_ST) RESU_ST_NM, /*처리상태명        */
            A.ORD_NO,                                                       /*계약번호          */
            A.CUST_NO,                                                      /*고객번호          */
            A.CUST_NM,                                                      /*고객명칭          */
            A.CALL_NO,                                                      /*인바운드 상담번호 */
            A.USER_ID,                                                      /*상담사ID          */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_ID_NM,           /*상담사명          */
            A.TEL_NO,                                                       /*상담전화번호      */
            A.CALL_DTL,                                                     /*상담내용          */
            A.CAR_NO,                                                       /*차량번호          */
            A.SMS_TX,                                                       /*SMS내용           */
            A.REGION_NO,                                                    /*지역코드          */
            A.CITY_NO                                                       /*도시코드          */
    FROM    RTCS0102 A
    WHERE   (v_StartDay IS NULL OR (v_StartDay IS NOT NULL AND A.RECV_DAY BETWEEN v_StartDay AND v_EndDay))   /*장착일자FROM~TO       */
    AND     (v_Cust_No IS NULL OR A.CUST_NO = v_Cust_No)
    AND     (v_Cust_Nm IS NULL OR A.CUST_NM = v_Cust_Nm)
    AND     (v_Tel_No  IS NULL OR A.TEL_NO  = v_Tel_No)
    ORDER BY A.RECV_DAY DESC, A.RECV_TM DESC                                    -- [20171208_02]
    ;

  END p_sRtcs0102Ibf;

  /*****************************************************************************
  -- 인바운드 상담등록시간 조회
  *****************************************************************************/
  FUNCTION f_sRtcs0102SelectSysdate
  RETURN VARCHAR IS

    v_sysdate VARCHAR2(14) DEFAULT '0';

  BEGIN

    SELECT TO_CHAR(SYSDATE,'yyyymmddhh24miss')
    INTO v_sysdate
    FROM DUAL;

    RETURN v_sysdate;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN '0';

  END f_sRtcs0102SelectSysdate;


 /*****************************************************************************
 -- 인바운드상담리스트  조회 - 고객현황 - 인바운드콜
 *****************************************************************************/
  PROCEDURE p_sRtcs0102CustAnalysis08 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE          /*상담전화번호          */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName('H005', A.RECV_TP) RECV_TP_NM, /*상담유형명        */
            A.RECV_DAY,                                                     /*통화일자          */
            A.RECV_TM,                                                      /*통화시간          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H006', A.RESU_ST) RESU_ST_NM, /*처리상태명        */
            A.ORD_NO,                                                       /*계약번호          */
            A.CUST_NM,                                                      /*고객명            */
            A.CALL_NO,                                                      /*인바운드 상담번호 */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_ID_NM,           /*상담사명          */
            A.TEL_NO,                                                       /*상담전화번호      */
            A.CALL_DTL,                                                     /*상담내용          */
            A.CAR_NO,                                                       /*차량번호          */
            '',                                                             /*지역              */
            '',                                                             /*도시              */
            ''                                                              /*AS담당자          */
    FROM    RTCS0102 A
    WHERE   ((v_Mob_No  IS NULL OR A.TEL_NO  = v_Mob_No)
       OR    (v_Tel_No  IS NULL OR A.TEL_NO  = v_Tel_No))
      AND   A.RECV_TP   <> 'I1';

  END p_sRtcs0102CustAnalysis08;


 /*****************************************************************************
 -- 인바운드상담리스트  조회 - 고객현황 - 아웃바운드상담
 *****************************************************************************/
  PROCEDURE p_sRtcs0102CustAnalysis09 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE          /*주문번호              */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName('H001', A.JOB_TP) JOB_TP_NM,           /*상담유형명   */
            A.CALL_DAY,                                                             /*통화일자     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H002', A.CALL_STATUS) CALL_STATUS_NM, /*통화상태     */
            A.ORD_NO,                                                               /*계약번호     */
            A.CUST_NM,                                                              /*고객명       */
            A.JOB_DAY,                                                              /*처리일자     */
            A.CALL_NO,                                                              /*상담번호     */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_ID_NM,                   /*상담사명     */
            A.MOB_NO,                                                               /*휴대폰번호   */
            A.TEL_NO,                                                               /*전화번호     */
            A.CALL_DTL                                                              /*상담내용     */
    FROM    RTCS0100 A
    WHERE   A.Ord_No  = v_Ord_No;

  END p_sRtcs0102CustAnalysis09;


 /*****************************************************************************
 -- 인바운드상담리스트  조회 - 고객현황 - 클레임접수
 *****************************************************************************/
  PROCEDURE p_sRtcs0102CustAnalysis10 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0102.ORD_NO%TYPE          /*주문번호              */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName('H005', A.RECV_TP) RECV_TP_NM, /*상담유형명        */
            A.RECV_DAY,                                                     /*통화일자          */
            A.RECV_TM,                                                      /*통화시간          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H006', A.RESU_ST) RESU_ST_NM, /*처리상태명        */
            A.ORD_NO,                                                       /*계약번호          */
            A.CUST_NM,                                                      /*고객명            */
            A.CALL_NO,                                                      /*인바운드 상담번호 */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_ID_NM,           /*상담사명          */
            A.TEL_NO,                                                       /*상담전화번호      */
            A.CALL_DTL,                                                     /*상담내용          */
            A.CAR_NO,                                                       /*차량번호          */
            B.REGION_NAME,                                                  /*지역              */
            B.CITY_NAME,                                                    /*도시              */
            B.EMP_NAME                                                      /*AS담당자          */
    FROM    RTCS0102 A,
            RTCS0103 B
    WHERE   A.Ord_No    = v_Ord_No
      AND   A.RECV_TP   = 'I1'
      AND   A.REGION_NO = B.REGION_NO (+)
      AND   A.CITY_NO   = B.CITY_NO   (+);

  END p_sRtcs0102CustAnalysis10;


END Pkg_Rtcs0102;
/