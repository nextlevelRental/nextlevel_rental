CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0001 AS
/*******************************************************************************
   NAME      Pkg_Rtcm0001
   PURPOSE   사용자 MASTER 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 사용자 MASTER Count
  *****************************************************************************/
  FUNCTION f_sRtcm0001Count(
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*사용자 아이디       */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0001
    WHERE   USER_ID = v_User_Id;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0001Count;

  /*****************************************************************************
  -- 사용자 MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0001 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE        /*사용자 그룹           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  A.USER_ID,                   /*사용자 아이디       */
            A.USER_NM,                   /*사용자명            */
            A.PASSWORD,                  /*비밀번호            */
            A.OLD_PASSWORD,              /*이전비밀번호        */
            A.AGENT_ID,                  /*대리점아이디        */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENT_ID) AGENT_NM,            /*대리점명       */
            A.VKBUR,                     /*지점                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.VKBUR) VKBUR_NM,       /*지점명         */
            A.VKGRP,                     /*지사                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.VKGRP) VKGRP_NM,       /*지사명         */
            trim(A.USER_GRP) USER_GRP,                  /*사용자 그룹         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C001', A.USER_GRP) USER_GRP_NM, /*사용자 그룹명  */
            TO_CHAR(A.LAST_PW_DT,'YYYY/MM/DD HH24:MI') AS LAST_PW_DT,                /*최종 비밀번호 수정일*/
            TO_CHAR(A.LAST_LOGON_DT,'YYYY/MM/DD HH24:MI') AS LAST_LOGON_DT,             /*최종 접속 일자      */
            A.FAIL_CNT,                  /*접속 실패 건수      */
            A.TMP_PW_YN,                 /*임시비밀번호 사용여 */
            A.LOCK_YN,                   /*사용불가 계정여부   */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                  /*등록자명       */
            TO_CHAR(A.REG_DT,'YYYY/MM/DD HH24:MI') AS REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                  /*변경자명       */
            TO_CHAR(A.CHG_DT,'YYYY/MM/DD HH24:MI') AS CHG_DT                     /*변경일              */
    FROM    RTCM0001 A
    WHERE   A.USER_ID = DECODE(v_User_Id, NULL, A.USER_ID, v_User_Id)
    AND     A.USER_NM LIKE '%'||v_User_Nm||'%'
    AND     A.USER_GRP = DECODE(v_User_Grp, NULL, A.USER_GRP, v_User_Grp)
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
            A.AGENT_ID = B.USER_ID
   ) A
    WHERE 1=1
    ;
    
    --AND     A.LOCK_YN = 'N';

  END p_sRtcm0001;

  /*****************************************************************************
  -- 사용자 MASTER Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0001 (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_Password       IN RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
    v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*대리점아이디          */
    v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*지사                  */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*사용자 그룹           */
    v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*사용불가 계정여부     */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    -- 최초 등록시 패스워드는 초기값으로 설정되며, 임시비밀번호 사용여부가 Y값으로 설정
    INSERT  INTO RTCM0001 (
            USER_ID,
            USER_NM,
            PASSWORD,
            OLD_PASSWORD,
            AGENT_ID,
            VKBUR,
            VKGRP,
            USER_GRP,
            LAST_PW_DT,
            LAST_LOGON_DT,
            FAIL_CNT,
            TMP_PW_YN,
            LOCK_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_User_Id,
            v_User_Nm,
            v_Password,
            NULL,
            v_Agent_Id,
            v_Vkbur,
            v_Vkgrp,
            v_User_Grp,
            SYSDATE,
            SYSDATE,
            0,
            'Y',
            'N',
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

  END f_InsertRtcm0001;

  /*****************************************************************************
  -- 사용자 MASTER Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0001 (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_Password       IN RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
    v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*대리점아이디          */
    v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*지사                  */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*사용자 그룹           */
    v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*사용불가 계정여부     */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0001
    SET    USER_NM  = v_User_Nm,
           AGENT_ID = v_Agent_Id,
           VKBUR    = v_Vkbur,
           VKGRP    = v_Vkgrp,
           USER_GRP = v_User_Grp,
           LOCK_YN  = v_Lock_Yn,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  USER_ID  = v_User_Id
    AND    PASSWORD = v_Password;


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
           v_ErrorText := SUBSTR(SQLERRM, 1, 200);
           RETURN SQLCODE;

  END f_UpdateRtcm0001;

  /*****************************************************************************
  -- 사용자 MASTER Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0001 (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0001
    SET    LOCK_YN = 'Y',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  USER_ID = v_User_Id;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
           v_ErrorText := SUBSTR(SQLERRM, 1, 200);
           RETURN SQLCODE;

  END f_DeleteRtcm0001;

  /*****************************************************************************
  -- 사용자 MASTER 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0001 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_Password       IN RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
    v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*대리점아이디          */
    v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*지점                  */
    v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*지사                  */
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*사용자 그룹           */
    v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*사용불가 계정여부     */
    v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error     EXCEPTION;
    v_Count     NUMBER;
    v_InitPw    RTCM0001.PASSWORD%TYPE DEFAULT NULL; /*비밀번호            */
    v_Buser_Grp RTCM0001.USER_GRP%TYPE;              /*사용자 그룹           */
    
  BEGIN


    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '처리구분(I,U,D)   (v_Comm_Dvsn)', v_Comm_Dvsn);
    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '사용자 아이디     (v_User_Id  )', v_User_Id  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '사용자명          (v_User_Nm  )', v_User_Nm  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '비밀번호          (v_Password )', v_Password );
    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '대리점아이디      (v_Agent_Id )', v_Agent_Id );
    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '지점              (v_Vkbur    )', v_Vkbur    );
    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '지사              (v_Vkgrp    )', v_Vkgrp    );
    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '사용자 그룹       (v_User_Grp )', v_User_Grp );
    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '사용불가 계정여부 (v_Lock_Yn  )', v_Lock_Yn  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', '등록자 ID         (v_Reg_Id   )', v_Reg_Id   );
    
    -- 필수값  : 사용자 id, 사용자명 사용자 그룹, 사용불가여부, 등록자 ID
    IF TRIM(v_User_Id) IS NULL THEN
        v_Return_Message := '사용자ID('||v_User_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_User_Nm) IS NULL THEN
        v_Return_Message := '사용자명('||v_User_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_User_Grp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C001', v_User_Grp)) THEN
        v_Return_Message := '사용자 그룹('||v_User_Grp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Lock_Yn) IS NULL THEN
        v_Return_Message := '사용불가여부('||v_Lock_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    v_Count := f_sRtcm0001Count(v_User_Id);


    -- 지사 및 지점 : 공통코드 S018, S019에 해당 내역이 존재해야 함
    IF (TRIM(v_Vkbur) IS NOT NULL) AND (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S019', v_Vkbur)) THEN
        v_Return_Message := '입력한 지점코드('||v_Vkbur||')코드는 미정의된 코드이므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Vkgrp) IS NOT NULL) AND (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S018', v_Vkgrp)) THEN
        v_Return_Message := '입력한 지사코드('||v_Vkgrp||')코드는 미정의된 코드이므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        -- 사용자 그룹 : 대리점은 저장하지 않는다. ( 대리점 관리에서 처리함 )
        -- 신규 저장시 사용자 그룹이 대리점인 경우 저장 불가
        --01    영업관리자
        --02    콜센터
        --03    지사
        --04    지점
        --05    대리점
        IF TRIM(v_User_Grp) = '05' THEN
            v_Return_Message := '사용자 그룹이 대리점인 경우 저장 불가합니다!';
            RAISE e_Error;
        END IF;

        IF v_Count > 0 THEN
            v_Return_Message := '입력한 사용자ID('||v_User_Id||')는 이미 등록된 ID이므로 신규등록이 불가 합니다!';
            RAISE e_Error;
        END IF;

        v_InitPw := '831D67D413BFD63322C0A1325EF32E8159F27B1C094F2A6CE1DC0307E600E808';

        -- 최초 등록시 패스워드는 초기값으로 설정되며, 임시비밀번호 사용여부가 Y값으로 설정
        IF 0 != f_InsertRtcm0001(v_User_Id, v_User_Nm, v_InitPw, v_Agent_Id,
                                 v_Vkbur, v_Vkgrp, v_User_Grp, v_Lock_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        -- 비밀번호변경이력 등록
        IF 0 != Pkg_Rtcm0003.f_InsertRtcm0003(v_User_Id, v_InitPw, '사용자 신규 등록', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '비밀번호변경이력 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Count = 0 THEN
            v_Return_Message := '입력한 사용자ID('||v_User_Id||')는 미등록 ID이므로 수정 또는 삭제가 불가 합니다!';
            RAISE e_Error;
        END IF;

        SELECT  USER_GRP
        INTO    v_Buser_Grp
        FROM    RTCM0001
        WHERE   USER_ID = v_User_Id;

        IF v_Comm_Dvsn = 'U' THEN

            IF TRIM(v_User_Grp)   = '05' AND
               TRIM(v_Buser_Grp) <> '05' THEN
                v_Return_Message := '사용자 그룹을 대리점으로 변경 불가합니다!';
                RAISE e_Error;
            END IF;

            IF TRIM(v_User_Grp)  <> '05' AND
               TRIM(v_Buser_Grp)  = '05' THEN
                v_Return_Message := '사용자 그룹이 대리점인 경우 수정 불가합니다!';
                RAISE e_Error;
            END IF;

            IF 0 != f_UpdateRtcm0001(v_User_Id, v_User_Nm, v_Password, v_Agent_Id,
                                     v_Vkbur,  v_Vkgrp,    v_User_Grp, v_Lock_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRTCM0001(v_User_Id, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := ' 처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- 사용자 변경 이력 생성
    IF 0 != Pkg_Rtcm0002.f_InsertRtcm0002(v_User_Id, v_ErrorText) THEN
        v_Return_Message := '이력 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText:= v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0001.p_IUDRtcm0001(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0001;

  /*****************************************************************************
  -- 사용자Master Update -  PassWord Update
  *****************************************************************************/
  PROCEDURE p_UpdateRtcm0001PassWord(
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,      /*사용자 아이디          */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,     /*비밀번호               */
    v_Old_Password   IN  RTCM0001.OLD_PASSWORD%TYPE, /*이전비밀번호           */
    v_Reason         IN  RTCM0003.REASON%TYPE,       /*변경사유               */
    v_Reg_Id         IN  RTCM0001.REG_ID%TYPE,       /*등록자 ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error     EXCEPTION;
    v_Pass      RTCM0001.PASSWORD%TYPE;     /*비밀번호               */
    v_OldPw     RTCM0001.OLD_PASSWORD%TYPE; /*이전비밀번호           */
    v_Temp      RTCM0001.PASSWORD%TYPE;     /*비밀번호               */
  BEGIN


    -- 필수값  : 사용자 id, 비밀번호, 이전비밀번호,  이전비밀번호, 등록자 ID
    IF TRIM(v_User_Id) IS NULL THEN
        v_Return_Message := '사용자ID('||v_User_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Password) IS NULL THEN
        v_Return_Message := '비밀번호('||v_Password||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Old_Password) IS NULL THEN
        v_Return_Message := '이전비밀번호('||v_Old_Password||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 패스워드 유효성 검증- 웹상에서 p_sPassWordVerification프로시져를 이용하여 검증하는 것으로 변경
    --p_sPassWordVerification(v_User_Id, v_Password, v_Success_Code, v_Return_Message);
    --IF v_Success_Code != 0 THEN
    --    RAISE e_Error;
    --END IF;

    IF 0 != f_sRtcm0001Count(v_User_Id) THEN

        BEGIN
            SELECT  PASSWORD
            INTO    v_OldPw
            FROM    RTCM0001
            WHERE   USER_ID = v_User_Id;
        END;

        IF NVL(TRIM(v_OldPw),' ') != TRIM(v_Old_Password) THEN
            v_Return_Message := '해당 사용자ID(' || v_User_Id || ')의 이전 패스워드가 불일치하여, 변경이 불가 합니다.!';
            RAISE e_Error;
        END IF;

        IF NVL(TRIM(v_OldPw),' ') = TRIM(v_Password) THEN
            v_Return_Message := '해당 사용자ID(' || v_User_Id || ')의 이전 패스워드와 동일하여, 변경이 불가 합니다.!';
            RAISE e_Error;
        END IF;

        -- 동일 문자 6자 이상 존재하므로 변경불가! -> 향후 검토 진행요망
        /*
        v_Temp := REGEXP_REPLACE(v_Password,'['||v_OldPw||']', '');

        IF LENGTH(TRIM(v_Password)) < (LENGTH(TRIM(v_Temp))+6) THEN
            v_Return_Message := '해당 사용자ID(' || v_User_Id || ')의 이전 패스워드와 동일하여, 변경이 불가 합니다.!';
            RAISE e_Error;
        END IF;
       */
        BEGIN
            -- 최초 등록시 임시비밀번호 사용여부를 Y값으로 설정하여
            -- 사용자가 패스워드를 변경하도록 유도하고, 사용자가 패스워드를 변경하면 N값으로 변경함
            UPDATE RTCM0001
            SET    TMP_PW_YN  = 'N',
                   PASSWORD   = v_Password,
                   OLD_PASSWORD = v_Old_Password,
                   LAST_PW_DT = SYSDATE,
                   CHG_DT     = SYSDATE,
                   CHG_ID     = v_Reg_Id
            WHERE  USER_ID    = v_User_Id
            AND    PASSWORD   = v_Old_Password;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '비밀번호 변경 실패!!!('||SUBSTR(SQLERRM, 1, 200)||')';
            RAISE e_Error;
        END;

        IF 0 != Pkg_Rtcm0003.f_InsertRtcm0003(v_User_Id, v_Password, v_Reason, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '비밀번호변경이력 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSE
        v_Return_Message := '해당 사용자ID(' || v_User_Id || ')는 등록된 ID가 아니므로 처리불가!';
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 변경 되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0001.p_UpdateRtcm0001PassWord(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0001.p_UpdateRtcm0001PassWord(2)', v_ErrorText, v_Return_Message);


  END p_UpdateRtcm0001PassWord;

  /*****************************************************************************
  -- 사용자Master Update - 비밀번호 초기화
  *****************************************************************************/
  PROCEDURE p_UpdateRtcm0001Init(
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,      /*사용자 아이디          */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,     /*비밀번호               */
    v_Reg_Id         IN  RTCM0001.REG_ID%TYPE,       /*등록자 ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error     EXCEPTION;
    v_Reason    RTCM0003.REASON%TYPE DEFAULT 'Password Init'; /*변경사유      */
  BEGIN


    -- 필수값  : 사용자 id,비밀번호, 등록자 ID
    IF TRIM(v_User_Id) IS NULL THEN
        v_Return_Message := '사용자ID('||v_User_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Password) IS NULL THEN
        v_Return_Message := '비밀번호('||v_Password||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF 0 != f_sRtcm0001Count(v_User_Id) THEN

        BEGIN
            -- 초기화시 임시비밀번호 사용여부를 Y값으로 설정하여
            -- 사용자가 패스워드를 변경하도록 유도하고, 사용자가 패스워드를 변경하면 N값으로 변경함
            UPDATE RTCM0001
            SET    TMP_PW_YN  = 'Y',
                   PASSWORD   = v_Password,
                   FAIL_CNT   = '0',
                   LAST_PW_DT = SYSDATE,
                   CHG_DT     = SYSDATE,
                   CHG_ID     = v_Reg_Id
            WHERE  USER_ID    = v_User_Id;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '비밀번호 변경 실패!!!('||SUBSTR(SQLERRM, 1, 200)||')';
            RAISE e_Error;
        END;

        IF 0 != Pkg_Rtcm0003.f_InsertRtcm0003(v_User_Id, v_Password, v_Reason, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '비밀번호변경이력 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSE
        v_Return_Message := '해당 사용자ID(' || v_User_Id || ')는 등록된 ID가 아니므로 처리불가!';
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 변경 되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0001.p_UpdateRtcm0001PassWord(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0001.p_UpdateRtcm0001PassWord(2)', v_ErrorText, v_Return_Message);


  END p_UpdateRtcm0001Init;

  /*****************************************************************************
  -- 사용자 패스워드 검증
  *****************************************************************************/
  PROCEDURE p_sPassWordVerification(
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,      /*사용자 아이디          */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,     /*비밀번호               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2
    ) IS

    e_Error     EXCEPTION;
    v_TempPass      RTCM0001.PASSWORD%TYPE;     /*비밀번호               */
    
    v_val_chk1  NUMBER;
    v_val_chk2  NUMBER;
    v_val_chk3  NUMBER;
    
  BEGIN

    IF TRIM(v_Password) IS NULL THEN
        v_Return_Message := '패스워드 입력이 누락되어 변경이 불가 합니다.!';
        RAISE e_Error;
    END IF;


    IF LENGTH(TRIM(v_Password)) < 8 THEN
        v_Return_Message := '패스워드는 최소 8자리 이상 입력하시길 바랍니다.!';
        RAISE e_Error;
    END IF;

--    v_TempPass := REGEXP_REPLACE(REGEXP_REPLACE(TRIM(v_Password), '[^a-z, A-Z, 0-9, ㄱ-ㅎ, 가-힐]', ''), '[[:space:][:punct:]]{1,}', '');
--
--    IF LENGTH(TRIM(v_Password)) = LENGTH(TRIM(v_TempPass)) THEN
--        v_Return_Message := '패스워드는 특수문자가 하나 이상은 포함되어야 합니다.!';
--        RAISE e_Error;
--    END IF;
--
--
--    v_TempPass := REGEXP_REPLACE(REGEXP_REPLACE(TRIM(v_Password), '[^a-z, A-Z, ㄱ-ㅎ, 가-힐]', ''), '[[:space:][:punct:]]{1,}', '');
--
--    IF LENGTH(TRIM(v_Password)) = LENGTH(TRIM(v_TempPass)) THEN
--        v_Return_Message := '패스워드는 숫자 하나 이상은 포함되어야 합니다.!';
--        RAISE e_Error;
--    END IF;

    v_TempPass := REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(TRIM(v_Password), '[a-z, A-Z, ㄱ-ㅎ, 가-힐]', 'a'),'[0-9]','0'),'[[:punct:]]','!');
    
    v_val_chk1 := INSTR(v_TempPass, 'a');
    v_val_chk2 := INSTR(v_TempPass, '0');
    v_val_chk3 := INSTR(v_TempPass, '!');

    IF v_val_chk1 = 0 OR v_val_chk2 = 0 OR v_val_chk3 = 0 THEN
        v_Return_Message := '패스워드는 영문자, 숫자, 특수문자의 조합으로 이루어져야 합니다!';
        RAISE e_Error;
    END IF;

    v_Success_code := 0;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '사용자 패스워드 검증중 에러 발생! 시스템 담당자 문의바람.!';

  END p_sPassWordVerification;


  /*****************************************************************************
  -- 사용자 Master 조회- 로그인시 사용자 정보 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0001LoginInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Id        IN     RTCM0001.USER_ID%TYPE,       /*사용자 아이디      */
    v_Password       IN     RTCM0001.PASSWORD%TYPE,      /*비밀번호           */
    v_Local_Ip       IN     VARCHAR2                     /*로컬PC IP          */
    ) IS

    v_ErrorText      VARCHAR2(2000);
  BEGIN

    -- 사용자 아이디와 로컬 IP 정보는 추후 아이디 도용등의 문제 점검시 사용하기 위해 로그 생성
    Pkg_Utility.p_LoginFileWrite('Pkg_Rtcm0001.p_sRtcm0001LoginInfo(1)', 'v_User_Id', v_User_Id, 'v_Local_Ip', v_Local_Ip);


    -- 접속 실패 건수 +1, 로그인 성공시 사용자메뉴권한조호 프로시져(p_sRtcm0012UserTreeAuth)에서 0으로 초기화함
    IF 0 != Pkg_Rtcm0001.f_UpdateRtcm0001FailCnt(v_User_Id, v_ErrorText) THEN
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0001.p_sRtcm0001LoginInfo(2)', '접속 실패 건수 업데이트 실패!!!', v_User_Id, v_ErrorText);
    END IF;


    OPEN Ref_Cursor FOR
    SELECT  A.USER_ID,                   /*사용자 아이디       */
            A.USER_NM,                   /*사용자명            */
            A.PASSWORD,                  /*비밀번호            */
            A.OLD_PASSWORD,              /*이전비밀번호        */
            A.AGENT_ID,                  /*대리점아이디        */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENT_ID) AGENT_NM,            /*대리점명       */
            A.VKBUR,                     /*지점                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.VKBUR) VKBUR_NM,       /*지점명         */
            A.VKGRP,                     /*지사                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.VKGRP) VKGRP_NM,       /*지사명         */
            A.USER_GRP,                  /*사용자 그룹         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C001', A.USER_GRP) USER_GRP_NM, /**사용자 그룹명 */
            A.LAST_PW_DT,                /*최종 비밀번호 수정일*/
            DECODE(SIGN(TO_CHAR(A.LAST_PW_DT, 'YYYYMMDD') - TO_CHAR(ADD_MONTHS(SYSDATE, -3), 'YYYYMMDD')),-1,'E','S') LASTPWDT_CHK, /*최종 비밀번호 수정일 체크 */
            A.LAST_LOGON_DT,             /*최종 접속 일자      */
            A.FAIL_CNT,                  /*접속 실패 건수      */
            A.TMP_PW_YN,                 /*임시비밀번호 사용여 */
            A.LOCK_YN,                   /*사용불가 계정여부   */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                  /*등록자명       */
            TO_CHAR(A.REG_DT,'YYYY-MM-DD') REG_DT, /*등록일    */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                  /*변경자명       */
            TO_CHAR(A.CHG_DT,'YYYY-MM-DD') CHG_DT  /*변경일    */
    FROM    RTCM0001 A
    WHERE   A.USER_ID  = v_User_Id
    AND     A.PASSWORD = v_Password
    AND     A.LOCK_YN  = 'N';


  END p_sRtcm0001LoginInfo;

  /*****************************************************************************
  -- 사용자 MASTER Update - 로그인 시도횟수 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0001FailCnt (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0001
    SET    FAIL_CNT = NVL(FAIL_CNT,0) + 1,
           CHG_ID   = v_User_Id,
           CHG_DT   = SYSDATE
    WHERE  USER_ID  = v_User_Id;

    COMMIT;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
           v_ErrorText := SUBSTR(SQLERRM, 1, 200);
           RETURN SQLCODE;

  END f_UpdateRtcm0001FailCnt;

  /*****************************************************************************
  -- 사용자 MASTER Update - 로그인 시도횟수 초기화 및 최종 접속 일자 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0001FailCntInit (
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCM0001
    SET    FAIL_CNT      = 0,
           LAST_LOGON_DT = SYSDATE,
           CHG_ID        = v_User_Id,
           CHG_DT        = SYSDATE
    WHERE  USER_ID       = v_User_Id;

    COMMIT;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
           v_ErrorText := SUBSTR(SQLERRM, 1, 200);
           RETURN SQLCODE;

  END f_UpdateRtcm0001FailCntInit;

  /*****************************************************************************
  -- 사용자 MASTER - 사용자아이디 기준 사용자명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0001UserNm(
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*사용자 아이디       */
    ) RETURN VARCHAR IS

    v_User_Nm        RTCM0001.USER_NM%TYPE;             /*사용자명            */

  BEGIN

    SELECT  USER_NM
    INTO    v_User_Nm
    FROM    RTCM0001
    WHERE   USER_ID = v_User_Id;

    RETURN v_User_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0001UserNm;


  /*****************************************************************************
  -- 사용자 MASTER - 사용자명 기준 사용자 아이디 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0001UserCd(
    v_User_Nm        IN RTCM0001.USER_NM%TYPE             /*사용자 명         */
    ) RETURN VARCHAR IS

    v_User_Id        RTCM0001.USER_ID%TYPE;               /*사용자아이디      */

  BEGIN

    SELECT  USER_ID
    INTO    v_User_Id
    FROM    RTCM0001
    WHERE   USER_NM = v_User_Nm;

    RETURN v_User_Id;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0001UserCd;

  /*****************************************************************************
  -- 사용자 MASTER - 사용자아이디 기준 사용자 그룹 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0001UserGrp(
    v_User_Id        IN RTCM0001.USER_ID%TYPE         /*사용자 아이디         */
    ) RETURN VARCHAR IS

    v_User_Grp RTCM0001.USER_GRP%TYPE DEFAULT NULL;   /*사용자 그룹           */

  BEGIN

    SELECT  USER_GRP
    INTO    v_User_Grp
    FROM    RTCM0001
    WHERE   USER_ID = v_User_Id;

    RETURN v_User_Grp;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN NULL;

  END f_sRtcm0001UserGrp;

END Pkg_Rtcm0001;
/
