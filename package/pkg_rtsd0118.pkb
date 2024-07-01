CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0118 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0118
   PURPOSE   전자서명 조회정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-11-20  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 전자서명 조회정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0118Count(
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0118.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0118
    WHERE   ORD_NO = v_Ord_No
    AND     SEQ    = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0118Count;

  /*****************************************************************************
  -- 전자서명 조회정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0118 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE         /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR

    SELECT  A.ORD_NO,                    /*계약번호            */
            A.SEQ,                       /*순번                */
            A.CUST_NO,                   /*고객번호            */
            A.SHEET_ID,                  /*서식종류            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S080',A.SHEET_ID) SHEET_NM, /*서식명  */
            A.FILE_PATH,                 /*파일경로            */
            A.FILE_NAME,                 /*파일명              */
            A.JOB_CD,                    /*조회구분            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S081',A.JOB_CD)   JOB_NM,   /*조회구분*/
            A.AUTO_YN,                   /*자동발송여부        */
            A.EMAIL_ADDR,                /*이메일 주소         */
            A.DISP_ID,                   /*조회자ID            */
            A.DISP_NM,                   /*조회자명            */
            TO_CHAR(A.REG_DT,'YYYY-MM-DD') REG_DAY,  /*일자      */
            TO_CHAR(A.REG_DT,'HH24:MI:SS') REG_TM,   /*시간      */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID)            REG_NM,   /*등록자명*/
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID)            CHG_NM,   /*사용자명*/
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0118 A
    WHERE   A.ORD_NO     = DECODE(v_Ord_No     , NULL, A.ORD_NO     , v_Ord_No)

    UNION ALL
    
    SELECT  A.ORD_NO,                    /*계약번호            */
            0 SEQ,                       /*순번                */
            B.CUST_NO,                   /*고객번호            */
            DECODE(A.ETC_CHAR_1,'CM0002','02','CM0005','05',NULL) SHEET_ID, /*서식종류            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S080',DECODE(A.ETC_CHAR_1,'CM0002','02','CM0005','05',NULL)) SHEET_NM, /*서식명  */
            A.ETC_CHAR_2 FILE_PATH,      /*파일경로            */
            A.ETC_CHAR_3 FILE_NAME,      /*파일명              */
            '02'         JOB_CD,         /*조회구분            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S081','02')   JOB_NM,   /*조회구분*/
            'Y'          AUTO_YN,        /*자동발송여부        */
            A.ETC_CHAR_4 EMAIL_ADDR,     /*이메일 주소         */
            A.REG_ID     DISP_ID,        /*조회자ID            */
            '메일발송용' DISP_NM,        /*조회자명            */
            TO_CHAR(A.REG_DT,'YYYY-MM-DD') REG_DAY,  /*일자      */
            TO_CHAR(A.REG_DT,'HH24:MI:SS') REG_TM,   /*시간      */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID)            REG_NM,   /*등록자명*/
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID)            CHG_NM,   /*사용자명*/
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0206 A,
            RTSD0104 B
    WHERE   A.ORD_NO     = B.ORD_NO
    AND     A.ORD_NO     = DECODE(v_Ord_No     , NULL, A.ORD_NO     , v_Ord_No)

    ORDER   BY 17;   -- A.REG_DT

  END p_sRtsd0118;

  /*****************************************************************************
  -- 전자서명 조회정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0118 (
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0118.SEQ%TYPE,            /*순번                  */
    v_Cust_No        IN RTSD0118.CUST_NO%TYPE,        /*고객번호              */
    v_Sheet_Id       IN RTSD0118.SHEET_ID%TYPE,       /*서식종류              */
    v_File_Path      IN RTSD0118.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Name      IN RTSD0118.FILE_NAME%TYPE,      /*파일명                */
    v_Job_Cd         IN RTSD0118.JOB_CD%TYPE,         /*조회구분              */
    v_Auto_Yn        IN RTSD0118.AUTO_YN%TYPE,        /*자동발송여부          */
    v_Email_Addr     IN RTSD0118.EMAIL_ADDR%TYPE,     /*이메일 주소           */
    v_Disp_Id        IN RTSD0118.DISP_ID%TYPE,        /*조회자ID              */
    v_Disp_Nm        IN RTSD0118.DISP_NM%TYPE,        /*조회자명              */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0118 (
            ORD_NO,
            SEQ,
            CUST_NO,
            SHEET_ID,
            FILE_PATH,
            FILE_NAME,
            JOB_CD,
            AUTO_YN,
            EMAIL_ADDR,
            DISP_ID,
            DISP_NM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Seq,
            v_Cust_No,
            v_Sheet_Id,
            v_File_Path,
            v_File_Name,
            v_Job_Cd,
            v_Auto_Yn,
            v_Email_Addr,
            v_Disp_Id,
            v_Disp_Nm,
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

  END f_InsertRtsd0118;

  /*****************************************************************************
  -- 전자서명 조회정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0118 (
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0118.SEQ%TYPE,            /*순번                  */
    v_Cust_No        IN RTSD0118.CUST_NO%TYPE,        /*고객번호              */
    v_Sheet_Id       IN RTSD0118.SHEET_ID%TYPE,       /*서식종류              */
    v_File_Path      IN RTSD0118.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Name      IN RTSD0118.FILE_NAME%TYPE,      /*파일명                */
    v_Job_Cd         IN RTSD0118.JOB_CD%TYPE,         /*조회구분              */
    v_Auto_Yn        IN RTSD0118.AUTO_YN%TYPE,        /*자동발송여부          */
    v_Email_Addr     IN RTSD0118.EMAIL_ADDR%TYPE,     /*이메일 주소           */
    v_Disp_Id        IN RTSD0118.DISP_ID%TYPE,        /*조회자ID              */
    v_Disp_Nm        IN RTSD0118.DISP_NM%TYPE,        /*조회자명              */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0118
    SET    ORD_NO     = v_Ord_No,
           SEQ        = v_Seq,
           CUST_NO    = v_Cust_No,
           SHEET_ID   = v_Sheet_Id,
           FILE_PATH  = v_File_Path,
           FILE_NAME  = v_File_Name,
           JOB_CD     = v_Job_Cd,
           AUTO_YN    = v_Auto_Yn,
           EMAIL_ADDR = v_Email_Addr,
           DISP_ID    = v_Disp_Id,
           DISP_NM    = v_Disp_Nm,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  ORD_NO     = v_Ord_No
    AND    SEQ        = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0118;

  /*****************************************************************************
  -- 전자서명 조회정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0118 (
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0118.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0118
    WHERE  ORD_NO = v_Ord_No
    AND    SEQ    = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0118.f_DeleteRtsd0118', 'v_Ord_No', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0118.f_DeleteRtsd0118', 'v_Seq'   , v_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0118.f_DeleteRtsd0118', 'v_Reg_Id', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0118;

  /*****************************************************************************
  -- 전자서명 조회정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0118 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN OUT RTSD0118.SEQ%TYPE,        /*순번                  */
    v_Cust_No        IN RTSD0118.CUST_NO%TYPE,        /*고객번호              */
    v_Sheet_Id       IN RTSD0118.SHEET_ID%TYPE,       /*서식종류              */
    v_File_Path      IN RTSD0118.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Name      IN RTSD0118.FILE_NAME%TYPE,      /*파일명                */
    v_Job_Cd         IN RTSD0118.JOB_CD%TYPE,         /*조회구분              */
    v_Auto_Yn        IN RTSD0118.AUTO_YN%TYPE,        /*자동발송여부          */
    v_Email_Addr     IN RTSD0118.EMAIL_ADDR%TYPE,     /*이메일 주소           */
    v_Disp_Id        IN RTSD0118.DISP_ID%TYPE,        /*조회자ID              */
    v_Disp_Nm        IN RTSD0118.DISP_NM%TYPE,        /*조회자명              */
    v_Reg_Id         IN RTSD0118.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 계약번호, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Sheet_Id) IS NOT NULL) AND (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S080', v_Sheet_Id)) THEN
        v_Return_Message := '서식종류('||v_Sheet_Id||') : 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Job_Cd) IS NOT NULL) AND (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S081', v_Job_Cd)) THEN
        v_Return_Message := '조회구분('||v_Job_Cd||') : 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Disp_Id) IS NULL THEN
        v_Return_Message := '조회자ID('||v_Disp_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Disp_Nm) IS NULL THEN
        v_Return_Message := '조회자명('||v_Disp_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtsd0118Count(v_Ord_No, v_Seq) THEN
            v_Return_Message := '해당건('||v_Ord_No||'-'||v_Seq||')으로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        v_Seq := f_sRtsd0118Seq(v_Ord_No);

        IF 0 != f_InsertRtsd0118(v_Ord_No ,v_Seq ,v_Cust_No ,v_Sheet_Id ,
                                 v_File_Path ,v_File_Name ,v_Job_Cd ,v_Auto_Yn ,
                                 v_Email_Addr ,v_Disp_Id, v_Disp_Nm, v_Reg_Id ,v_ErrorText) THEN
            v_Return_Message := '전자서명 조회정보 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN


            IF 0 = f_sRtsd0118Count(v_Ord_No, v_Seq) THEN
                v_Return_Message := '해당건('||v_Ord_No||'-'||v_Seq||')으로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;


            IF 0 != f_UpdateRtsd0118(v_Ord_No ,v_Seq ,v_Cust_No ,v_Sheet_Id ,
                                     v_File_Path ,v_File_Name ,v_Job_Cd ,v_Auto_Yn ,
                                     v_Email_Addr ,v_Disp_Id, v_Disp_Nm, v_Reg_Id ,v_ErrorText) THEN
                v_Return_Message := '전자서명 조회정보 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0118(v_Ord_No ,v_Seq ,v_Reg_Id ,v_ErrorText) THEN
                v_Return_Message := '전자서명 조회정보 삭제 실패!!!'||'-'||v_Errortext;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0118.p_IUDRtsd0118(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0118.p_IUDRtsd0118(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0118;

  /*****************************************************************************
  -- 전자서명 조회정보 - 순번(Seq) 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0118Seq(
    v_Ord_No         IN RTSD0118.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS

    v_Seq   RTSD0118.SEQ%TYPE DEFAULT NULL;             /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTSD0118
                 WHERE   ORD_NO = v_Ord_No)+ 1, 1) AS SEQ
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0118Seq;


END Pkg_Rtsd0118;
/