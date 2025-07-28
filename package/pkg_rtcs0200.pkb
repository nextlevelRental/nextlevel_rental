CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0200 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0200
   PURPOSE   [CS] 창고 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-26  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] 창고 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0200Count(
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE          /*창고코드            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0200
    WHERE   WAREH_CD       = v_Wareh_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0200Count;

  /*****************************************************************************
  -- [CS] 창고 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*업무종료일            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*우편번호 PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*상세주소              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전호번호              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*팩스번호              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.WAREH_CD,                  /*창고코드            */
            A.WAREH_NM,                  /*창고명              */
            A.BEGDAY,                    /*업무개시일          */
            A.ENDDAY,                    /*업무종료일          */
            A.BLD_MNG_NO,                /*우편번호 PK         */
            A.POS_CD,                    /*우편번호            */
            A.ADDR1,                     /*주소                */
            A.ADDR2,                     /*상세주소            */
            A.TEL_NO,                    /*전호번호            */
            A.FAX_NO,                    /*팩스번호            */
            A.MOB_NO,                    /*휴대폰번호          */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0200 A
    WHERE   A.WAREH_CD         = DECODE(v_Wareh_Cd       , NULL, A.WAREH_CD        , v_Wareh_Cd)
    AND     A.WAREH_NM         = DECODE(v_Wareh_Nm       , NULL, A.WAREH_NM        , v_Wareh_Nm)
    AND     A.BEGDAY           = DECODE(v_Begday         , NULL, A.BEGDAY          , v_Begday)
    AND     A.ENDDAY           = DECODE(v_Endday         , NULL, A.ENDDAY          , v_Endday)
    AND     A.BLD_MNG_NO       = DECODE(v_Bld_Mng_No     , NULL, A.BLD_MNG_NO      , v_Bld_Mng_No)
    AND     A.POS_CD           = DECODE(v_Pos_Cd         , NULL, A.POS_CD          , v_Pos_Cd)
    AND     A.ADDR1            = DECODE(v_Addr1          , NULL, A.ADDR1           , v_Addr1)
    AND     A.ADDR2            = DECODE(v_Addr2          , NULL, A.ADDR2           , v_Addr2)
    AND     A.TEL_NO           = DECODE(v_Tel_No         , NULL, A.TEL_NO          , v_Tel_No)
    AND     A.FAX_NO           = DECODE(v_Fax_No         , NULL, A.FAX_NO          , v_Fax_No)
    AND     A.MOB_NO           = DECODE(v_Mob_No         , NULL, A.MOB_NO          , v_Mob_No)
    AND     A.USE_YN           = DECODE(v_Use_Yn         , NULL, A.USE_YN          , v_Use_Yn)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);


  END p_sRtcs0200;

  /*****************************************************************************
  -- [CS] 창고 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*업무종료일            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*우편번호 PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*상세주소              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전호번호              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*팩스번호              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0200 (
            WAREH_CD,
            WAREH_NM,
            BEGDAY,
            ENDDAY,
            BLD_MNG_NO,
            POS_CD,
            ADDR1,
            ADDR2,
            TEL_NO,
            FAX_NO,
            MOB_NO,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Wareh_Cd,
            v_Wareh_Nm,
            v_Begday,
            v_Endday,
            v_Bld_Mng_No,
            v_Pos_Cd,
            v_Addr1,
            v_Addr2,
            v_Tel_No,
            v_Fax_No,
            v_Mob_No,
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

  END f_InsertRtcs0200;

  /*****************************************************************************
  -- [CS] 창고 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*업무종료일            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*우편번호 PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*상세주소              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전호번호              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*팩스번호              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0200
    SET    WAREH_NM         = v_Wareh_Nm,
           BEGDAY           = v_Begday,
           ENDDAY           = v_Endday,
           BLD_MNG_NO       = v_Bld_Mng_No,
           POS_CD           = v_Pos_Cd,
           ADDR1            = v_Addr1,
           ADDR2            = v_Addr2,
           TEL_NO           = v_Tel_No,
           FAX_NO           = v_Fax_No,
           MOB_NO           = v_Mob_No,
           USE_YN           = v_Use_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  WAREH_CD         = v_Wareh_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0200;

  /*****************************************************************************
  -- [CS] 창고 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTCS0200
    WHERE  WAREH_CD         = v_Wareh_Cd;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.f_DeleteRtcs0200(2)', '창고코드', v_Wareh_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.f_DeleteRtcs0200(2)', '등록자 ID', v_Reg_Id);


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0200;

  /*****************************************************************************
  -- [CS] 창고 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0200 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*업무종료일            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*우편번호 PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*상세주소              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전호번호              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*팩스번호              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Endday1        RTCS0200.ENDDAY%TYPE;            /*업무종료일            */
    v_Wrh_Seq        RTCS0201.WRH_SEQ%TYPE;

  BEGIN

    -- 필수값: 창고코드, 등록자 ID
    IF (TRIM(v_Wareh_Cd) IS NULL) THEN
        v_Return_Message := '창고코드('||v_Wareh_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn IN ('I','U') THEN

        -- 필수값: 창고명
        IF (TRIM(v_Wareh_Nm) IS NULL) THEN
            v_Return_Message := '창고명('||v_Wareh_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 필수값: 업무개시일
        IF (TRIM(v_Begday) IS NULL) THEN
            v_Return_Message := '업무개시일('||v_Begday||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        ELSIF v_Comm_Dvsn = 'I' AND SUBSTR(v_Begday,1,6) <> SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6) THEN
            v_Return_Message := '업무개시일('||v_Begday||') : 당월만 입력 가능합니다!';
            RAISE e_Error;
        END IF;

        -- 필수값: 업무종료일
        IF (TRIM(v_Endday) IS NULL) THEN
            v_Return_Message := '업무종료일('||v_Endday||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

--        IF v_Use_Yn = 'Y' AND v_Endday <> '99991231' THEN
--            v_Return_Message := '업무종료일('||v_Endday||') : 사용여부가 Y이면 99991231일만 가능합니다!';
--            RAISE e_Error;
--        ELSIF v_Use_Yn = 'N' AND v_Endday <> TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
--            v_Return_Message := '업무종료일('||v_Endday||') : 사용여부가 N이면 당일만 가능합니다!';
--            RAISE e_Error;
--        END IF;

        IF v_Use_Yn = 'Y' THEN
            v_Endday1 := '99991231';
        ELSE
            v_Endday1 := TO_CHAR(SYSDATE, 'YYYYMMDD');
        END IF;

        -- 필수값: 우편번호
        IF (TRIM(v_Tel_No) IS NULL) THEN
            v_Return_Message := '우편번호('||v_Pos_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 필수값: 주소
        IF (TRIM(v_Addr1) IS NULL) THEN
            v_Return_Message := '주소('||v_Addr1||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 필수값: 상세주소
        IF (TRIM(v_Addr2) IS NULL) THEN
            v_Return_Message := '상세주소('||v_Addr1||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 필수값: 전화번호
        IF (TRIM(v_Tel_No) IS NULL) THEN
            v_Return_Message := '전화번호('||v_Tel_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- 필수값: 사용여부
        IF (TRIM(v_Use_Yn) IS NULL) THEN
            v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        IF v_Comm_Dvsn = 'I' THEN

            IF v_Use_Yn <> 'Y' THEN
                v_Return_Message := '사용여부('||v_Use_Yn||') : 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF 0 != f_sRtcs0200Count( v_Wareh_Cd ) THEN
                v_Return_Message := '창고코드('||v_Wareh_Cd||') : 이미 등록되어 있는 코드입니다. 다른 번호를 입력하세요.!';
                RAISE e_Error;
            END IF;

            IF 0 != f_InsertRtcs0200( v_Wareh_Cd,   v_Wareh_Nm, v_Begday,   v_Endday1,
                                      v_Bld_Mng_No, v_Pos_Cd,   v_Addr1,    v_Addr2,
                                      v_Tel_No,     v_Fax_No,   v_Mob_No,   v_Use_Yn,
                                      v_Reg_Id,     v_ErrorText
                                    ) THEN
                v_Return_Message := '[CS] 창고 마스터 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE

            IF 0 = f_sRtcs0200Count( v_Wareh_Cd ) THEN
                v_Return_Message := '창고코드('||v_Wareh_Cd||') : 존재하지 않는 창고코드입니다.!';
                RAISE e_Error;
            END IF;

            -- 변경사항 check(WEB에서 진행)
            IF 0 != f_UpdateRtcs0200( v_Wareh_Cd,   v_Wareh_Nm, v_Begday,   v_Endday1,
                                      v_Bld_Mng_No, v_Pos_Cd,   v_Addr1,    v_Addr2,
                                      v_Tel_No,     v_Fax_No,   v_Mob_No,   v_Use_Yn,
                                      v_Reg_Id,     v_ErrorText
                                    ) THEN
                v_Return_Message := '[CS] 창고 마스터 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;

        -- 창고 마스타 등록 및 수정  시 변경이력도  같이 생성
        v_Wrh_Seq := Pkg_Rtcs0201.f_sRtcs0201TotCount( v_Wareh_Cd ) + 1;

        IF 0 != Pkg_Rtcs0201.f_InsertRtcs0201( v_Wareh_Cd,   v_Wrh_Seq,  v_Wareh_Nm, v_Begday,   v_Endday1,
                                  v_Bld_Mng_No, v_Pos_Cd,   v_Addr1,    v_Addr2,
                                  v_Tel_No,     v_Fax_No,   v_Mob_No,   v_Use_Yn,
                                  v_Reg_Id,     v_ErrorText
                                 ) THEN
            v_Return_Message := '[CS] 창고 마스터 변경이력 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;


    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtcs0200( v_Wareh_Cd, v_Reg_Id, v_ErrorText ) THEN
            v_Return_Message := '[CS] 창고 마스터 삭제 실패!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.p_IUDRtcs0200(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.p_IUDRtcs0200(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0200;

  /*****************************************************************************
  -- 창고 내역 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0200WareHouse (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전화번호              */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Cnt   NUMBER;

  BEGIN

--    -- 필수값: 창고코드, 창고명, 전화번호 셋중의 하나는 필수
--    IF  (TRIM(v_Wareh_Cd) IS NULL)
--    AND (TRIM(v_Wareh_Nm) IS NULL)
--    AND (TRIM(v_Tel_No) IS NULL) THEN
--        v_Return_Message := '창고코드, 창고명, 전화번호 셋중의 하나는 필수로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;


    OPEN Ref_Cursor FOR
    SELECT  A.WAREH_CD,                  /*창고코드            */
            A.WAREH_NM,                  /*창고명              */
            A.BEGDAY,                    /*업무개시일          */
            A.ENDDAY,                    /*업무종료일          */
            A.BLD_MNG_NO,                /*우편번호 PK         */
            A.POS_CD,                    /*우편번호            */
            A.ADDR1,                     /*주소                */
            A.ADDR2,                     /*상세주소            */
            A.TEL_NO,                    /*전호번호            */
            A.FAX_NO,                    /*팩스번호            */
            A.MOB_NO,                    /*휴대폰번호          */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0200 A
    WHERE   A.WAREH_CD  = DECODE(v_Wareh_Cd, NULL, A.WAREH_CD, v_Wareh_Cd)
    AND     A.WAREH_NM  LIKE '%'||v_Wareh_Nm||'%'
    AND     A.TEL_NO    LIKE '%'||v_Tel_No||'%'
    AND     A.USE_YN    = DECODE(v_Use_Yn, NULL, A.USE_YN, v_Use_Yn);


--    v_Success_code := 0;
--    v_Return_Message := '정상적으로 조회가 되었습니다';
--    v_ErrorText := '';
--    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.p_sRtcs0200WareHouse(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.p_sRtcs0200WareHouse(2)', v_ErrorText, v_Return_Message);

  END p_sRtcs0200WareHouse;

  /*****************************************************************************
  -- [CS] 창고 마스터 명칭 조회
  *****************************************************************************/
  FUNCTION f_sRtcs0200WarehNm(
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE          /*창고코드            */
    ) RETURN VARCHAR IS
    
    v_Wareh_Nm   VARCHAR2(50)    DEFAULT NULL;
    
  BEGIN

    SELECT  WAREH_NM
    INTO    v_Wareh_Nm
    FROM    RTCS0200
    WHERE   WAREH_CD       = v_Wareh_Cd;

    RETURN v_Wareh_Nm;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN v_Wareh_Nm;

  END f_sRtcs0200WarehNm;

END Pkg_Rtcs0200;