CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0111 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0111
   PURPOSE   개인정보제공 동의 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
   1.1        2023-01-30  kstka            [20230130_1] 최초 1회만 작성 여부 체크
   1.2        2024-01-17  kstka            [20240117_01] kstka 개인정보동의 항목 추가
*******************************************************************************/

  /*****************************************************************************
  -- 개인정보제공 동의 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0111Count(
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,          /*고객번호            */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,           /*동의일자            */
    v_Seq            IN RTSD0111.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0111
    WHERE   CUST_NO = v_Cust_No
    AND     AG_DAY  = v_Ag_Day
    AND     SEQ     = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0111Count;

  /*****************************************************************************
  -- 개인정보제공 동의 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0111 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_FDay        IN RTSD0111.AG_DAY%TYPE,         /*동의일자FROM          */
    v_Ag_TDay        IN RTSD0111.AG_DAY%TYPE          /*동의일자TO            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.AG_DAY,                    /*동의일자            */
            A.SEQ,                       /*순번                */
            A.SAFEKEY,                   /*인증번호            */
            A.NAG_YN,                    /*필수동의항목        */
            A.CAG_YN,                    /*선택동의항목        */
            A.CAG_YN1,                   /*선택동의1-SMS(문자) */
            A.CAG_YN2,                   /*선택동의1-전화      */
            A.CAG_YN3,                   /*선택동의1-이메일    */
            A.CAG_YN4,                   /*선택동의1-주소(우편)*/
            A.CAG_YN5,                   /*선택동의1-카카오알림톡*/
            A.CTH_YN1,                   /*선택_3자제공1       */
            A.CTH_YN2,                   /*선택_3자제공2       */
            A.CTH_YN3,                   /*선택_3자제공3       */
            A.MAG_YN1,                   /*선택_마케팅동의1     */
            A.MAG_YN2,                   /*선택_마케팅동의2     */
            A.FILE_PATH,                 /*개인정보 제공동의서 */
            A.FILE_NAME,                 /*개인정보 제공동의서 */
            A.INPUT_DT,                  /*PAD입력일시         */
            A.INPUT_LGL_PATH,            /*인입채널대분류       */
            A.INPUT_MDL_PATH,            /*인입채널중분류       */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0111 A
    WHERE   A.CUST_NO = v_Cust_No
    AND     A.AG_DAY BETWEEN v_Ag_FDay AND v_Ag_TDay;

  END p_sRtsd0111;

  /*****************************************************************************
  -- 개인정보제공 동의 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0111 (
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN RTSD0111.SEQ%TYPE,            /*순번                  */
    v_Safekey        IN RTSD0111.SAFEKEY%TYPE,        /*인증번호              */
    v_Nag_Yn         IN RTSD0111.NAG_YN%TYPE,         /*필수동의항목          */
    v_Cag_Yn         IN RTSD0111.CAG_YN%TYPE,         /*선택동의항목          */
    v_Cag_Yn1        IN RTSD0111.CAG_YN1%TYPE,        /*선택동의1-SMS(문자)   */
    v_Cag_Yn2        IN RTSD0111.CAG_YN2%TYPE,        /*선택동의1-전화        */
    v_Cag_Yn3        IN RTSD0111.CAG_YN3%TYPE,        /*선택동의1-이메일      */
    v_Cag_Yn4        IN RTSD0111.CAG_YN4%TYPE,        /*선택동의1-주소(우편)  */
    v_Cag_Yn5        IN RTSD0111.CAG_YN5%TYPE,        /*선택동의1-카카오알림톡 */
    v_Cth_Yn1        IN RTSD0111.CTH_YN1%TYPE,        /*선택_3자제공1         */
    v_Cth_Yn2        IN RTSD0111.CTH_YN2%TYPE,        /*선택_3자제공2         */
    v_Cth_Yn3        IN RTSD0111.CTH_YN3%TYPE,        /*선택_3자제공3         */
    v_Mag_Yn1        IN RTSD0111.MAG_YN1%TYPE,        /*선택_마케팅동의1       */
    v_Mag_Yn2        IN RTSD0111.MAG_YN2%TYPE,        /*선택_마케팅동의2       */
    v_File_Path      IN RTSD0111.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0111.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Input_Dt       IN RTSD0111.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_Input_Lgl_Path IN RTSD0111.INPUT_LGL_PATH%TYPE, /*인입채널대분류         */
    v_Input_Mdl_Path IN RTSD0111.INPUT_MDL_PATH%TYPE, /*인입채널중분류         */
    v_Reg_Id         IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0111 (
            CUST_NO,
            AG_DAY,
            SEQ,
            SAFEKEY,
            NAG_YN,
            CAG_YN,
            CAG_YN1,
            CAG_YN2,
            CAG_YN3,
            CAG_YN4,
            CAG_YN5,
            CTH_YN1,
            CTH_YN2,
            CTH_YN3,
            MAG_YN1,
            MAG_YN2,
            FILE_PATH,
            FILE_NAME,
            INPUT_DT,
            INPUT_LGL_PATH,
            INPUT_MDL_PATH,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Cust_No,
            v_Ag_Day,
            v_Seq,
            v_Safekey,
            v_Nag_Yn,
            v_Cag_Yn,
            v_Cag_Yn1,
            v_Cag_Yn2,
            v_Cag_Yn3,
            v_Cag_Yn4,
            v_Cag_Yn5,
            v_Cth_Yn1,
            v_Cth_Yn2,
            v_Cth_Yn3,
            v_Mag_Yn1,
            v_Mag_Yn2,
            v_File_Path,
            v_File_Name,
            v_Input_Dt,
            v_Input_Lgl_Path,
            v_Input_Mdl_Path,
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

  END f_InsertRtsd0111;

  /*****************************************************************************
  -- 개인정보제공 동의 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0111 (
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN RTSD0111.SEQ%TYPE,            /*순번                  */
    v_Safekey        IN RTSD0111.SAFEKEY%TYPE,        /*인증번호              */
    v_Nag_Yn         IN RTSD0111.NAG_YN%TYPE,         /*필수동의항목          */
    v_Cag_Yn         IN RTSD0111.CAG_YN%TYPE,         /*선택동의항목          */
    v_Cag_Yn1        IN RTSD0111.CAG_YN1%TYPE,        /*선택동의1-SMS(문자)   */
    v_Cag_Yn2        IN RTSD0111.CAG_YN2%TYPE,        /*선택동의1-전화        */
    v_Cag_Yn3        IN RTSD0111.CAG_YN3%TYPE,        /*선택동의1-이메일      */
    v_Cag_Yn4        IN RTSD0111.CAG_YN4%TYPE,        /*선택동의1-주소(우편)  */
    v_Cag_Yn5        IN RTSD0111.CAG_YN5%TYPE,        /*선택동의1-카카오알림톡 */
    v_Cth_Yn1        IN RTSD0111.CTH_YN1%TYPE,        /*선택_3자제공1         */
    v_Cth_Yn2        IN RTSD0111.CTH_YN2%TYPE,        /*선택_3자제공2         */
    v_Cth_Yn3        IN RTSD0111.CTH_YN3%TYPE,        /*선택_3자제공3         */
    v_Mag_Yn1        IN RTSD0111.MAG_YN1%TYPE,        /*선택_마케팅동의1       */
    v_Mag_Yn2        IN RTSD0111.MAG_YN2%TYPE,        /*선택_마케팅동의2       */
    v_File_Path      IN RTSD0111.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0111.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Input_Dt       IN RTSD0111.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_Input_Lgl_Path IN RTSD0111.INPUT_LGL_PATH%TYPE, /*인입채널대분류         */
    v_Input_Mdl_Path IN RTSD0111.INPUT_MDL_PATH%TYPE, /*인입채널중분류         */
    v_Reg_Id         IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0111
    SET    SAFEKEY   = v_Safekey,
           NAG_YN    = v_Nag_Yn,
           CAG_YN    = v_Cag_Yn,
           CAG_YN1   = v_Cag_Yn1,
           CAG_YN2   = v_Cag_Yn2,
           CAG_YN3   = v_Cag_Yn3,
           CAG_YN4   = v_Cag_Yn4,
           CAG_YN5   = v_Cag_Yn5,
           CTH_YN1   = v_Cth_Yn1,
           CTH_YN2   = v_Cth_Yn2,
           CTH_YN3   = v_Cth_Yn3,
           MAG_YN1   = v_Mag_Yn1,
           MAG_YN2   = v_Mag_Yn2,
           FILE_PATH = v_File_Path,
           FILE_NAME = v_File_Name,
           INPUT_DT  = v_Input_Dt,
           INPUT_LGL_PATH  = v_Input_Lgl_Path,
           INPUT_MDL_PATH  = v_Input_Mdl_Path,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  CUST_NO   = v_Cust_No
    AND    AG_DAY    = v_Ag_Day
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0111;

  /*****************************************************************************
  -- 개인정보제공 동의 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0111 (
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN RTSD0111.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0111
    WHERE  CUST_NO = v_Cust_No
    AND    AG_DAY  = v_Ag_Day
    AND    SEQ     = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0111.f_DeleteRtsd0111(1)', '고객번호', v_Cust_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0111.f_DeleteRtsd0111(1)', '동의일자', v_Ag_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0111.f_DeleteRtsd0111(1)', '순번', v_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0111.f_DeleteRtsd0111(1)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0111;

  /*****************************************************************************
  -- 개인정보제공 동의 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0111 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN OUT RTSD0111.SEQ%TYPE,        /*순번                  */
    v_Safekey        IN OUT RTSD0111.SAFEKEY%TYPE,    /*인증번호              */
    v_Nag_Yn         IN RTSD0111.NAG_YN%TYPE,         /*필수동의항목          */
    v_Cag_Yn         IN RTSD0111.CAG_YN%TYPE,         /*선택동의항목          */
    v_Cag_Yn1        IN RTSD0111.CAG_YN1%TYPE,        /*선택동의1-SMS(문자)   */
    v_Cag_Yn2        IN RTSD0111.CAG_YN2%TYPE,        /*선택동의1-전화        */
    v_Cag_Yn3        IN RTSD0111.CAG_YN3%TYPE,        /*선택동의1-이메일      */
    v_Cag_Yn4        IN RTSD0111.CAG_YN4%TYPE,        /*선택동의1-주소(우편)  */
    v_Cag_Yn5        IN RTSD0111.CAG_YN5%TYPE,        /*선택동의1-카카오알림톡 */
    v_Cth_Yn1        IN RTSD0111.CTH_YN1%TYPE,        /*선택_3자제공1         */
    v_Cth_Yn2        IN RTSD0111.CTH_YN2%TYPE,        /*선택_3자제공2         */
    v_Cth_Yn3        IN RTSD0111.CTH_YN3%TYPE,        /*선택_3자제공3         */
    v_Mag_Yn1        IN RTSD0111.MAG_YN1%TYPE,        /*선택_마케팅동의1       */
    v_Mag_Yn2        IN RTSD0111.MAG_YN2%TYPE,        /*선택_마케팅동의2       */
    v_File_Path      IN RTSD0111.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0111.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Input_Dt       IN RTSD0111.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_Input_Lgl_Path IN RTSD0111.INPUT_LGL_PATH%TYPE, /*인입채널대분류         */
    v_Input_Mdl_Path IN RTSD0111.INPUT_MDL_PATH%TYPE, /*인입채널중분류         */
    v_Reg_Id         IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 고객번호 ,동의일자 ,필수동의항목 ,선택동의항목 ,선택동의1-SMS(문자) ,선택동의1-전화 ,선택동의1-이메일 ,
    --        선택동의1-주소(우편) ,선택_3자제공1 ,선택_3자제공2 ,선택_3자제공3 ,개인정보 제공동의서 파 ,개인정보 제공동의서 파 ,PAD입력일시 ,등록자 ID
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Ag_Day) THEN
        v_Return_Message := '동의일자('||v_Ag_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Nag_Yn) IS NULL) OR (TRIM(v_Nag_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '필수동의항목('||v_Nag_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cag_Yn) IS NULL) OR (TRIM(v_Cag_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '선택동의항목('||v_Cag_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cag_Yn1) IS NULL) OR (TRIM(v_Cag_Yn1) NOT IN ('Y','N')) THEN
        v_Return_Message := '선택동의1-SMS(문자)('||v_Cag_Yn1||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cag_Yn2) IS NULL) OR (TRIM(v_Cag_Yn2) NOT IN ('Y','N')) THEN
        v_Return_Message := '선택동의1-전화('||v_Cag_Yn2||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cag_Yn3) IS NULL) OR (TRIM(v_Cag_Yn3) NOT IN ('Y','N')) THEN
        v_Return_Message := '선택동의1-이메일('||v_Cag_Yn3||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cag_Yn4) IS NULL) OR (TRIM(v_Cag_Yn4) NOT IN ('Y','N')) THEN
        v_Return_Message := '선택동의1-주소(우편)('||v_Cag_Yn4||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cth_Yn1) IS NULL) OR (TRIM(v_Cth_Yn1) NOT IN ('Y','N')) THEN
        v_Return_Message := '선택_3자제공1 ('||v_Cth_Yn1||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cth_Yn2) IS NULL) OR (TRIM(v_Cth_Yn2) NOT IN ('Y','N')) THEN
        v_Return_Message := '선택_3자제공2('||v_Cth_Yn2||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cth_Yn3) IS NULL) OR (TRIM(v_Cth_Yn3) NOT IN ('Y','N')) THEN
        v_Return_Message := '선택_3자제공3('||v_Cth_Yn3||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Input_Dt) THEN
        v_Return_Message := 'PAD입력일시('||v_Input_Dt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtsd0111Count(v_Cust_No, v_Ag_Day, v_Seq) THEN
            v_Return_Message := '해당건으로 이미 등록된 데이터('||v_Cust_No||'-'||v_Ag_Day||'-'||v_Seq||')가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- CUST_NO로 RTSD0100 참조하여 RTSD0111.SAFEKEY도 같이 넣음, 없을경우 에러처리 안하고 NULL로 넣음
        v_Safekey := Pkg_Rtsd0100.f_sRtsd0100Safekey(v_Cust_No);

        v_Seq := Pkg_Rtsd0111.f_sRtsd0111Seq(v_Cust_No, v_Ag_Day);

        IF 0 != f_InsertRtsd0111(v_Cust_No, v_Ag_Day, v_Seq, v_Safekey,
                                 v_Nag_Yn, v_Cag_Yn, v_Cag_Yn1, v_Cag_Yn2,
                                 v_Cag_Yn3, v_Cag_Yn4, v_Cag_Yn5, v_Cth_Yn1, 
                                 v_Cth_Yn2, v_Cth_Yn3, v_Mag_Yn1, v_Mag_Yn2,
                                 v_File_Path, v_File_Name, v_Input_Dt, 
                                 v_Input_Lgl_Path, v_Input_Mdl_Path,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '개인정보제공 동의 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtsd0111Count(v_Cust_No, v_Ag_Day, v_Seq) THEN
            v_Return_Message := '해당건으로 등록된 데이터('||v_Cust_No||'-'||v_Ag_Day||'-'||v_Seq||')가 존재하지 않으므로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0111(v_Cust_No, v_Ag_Day, v_Seq, v_Safekey,
                                     v_Nag_Yn, v_Cag_Yn, v_Cag_Yn1, v_Cag_Yn2,
                                     v_Cag_Yn3, v_Cag_Yn4, v_Cag_Yn5, v_Cth_Yn1, 
                                     v_Cth_Yn2, v_Cth_Yn3, v_Mag_Yn1, v_Mag_Yn2,
                                     v_File_Path, v_File_Name, v_Input_Dt, 
                                     v_Input_Lgl_Path, v_Input_Mdl_Path,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '개인정보제공 동의 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0111(v_Cust_No, v_Ag_Day, v_Seq,
                                     v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '개인정보제공 동의 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
               RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0111.p_IUDRtsd0111(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0111.p_IUDRtsd0111(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0111;


  /*****************************************************************************
  -- 개인정보제공 동의 - 순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0111Seq(
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,          /*고객번호            */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE            /*동의일자            */
    ) RETURN NUMBER IS
    v_Seq RTSD0111.SEQ%TYPE DEFAULT NULL;               /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTSD0111
                 WHERE   CUST_NO = v_Cust_No
                 AND     AG_DAY  = v_Ag_Day)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0111Seq;


  /*****************************************************************************
  -- 개인정보제공 동의 NAG_YN 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0111SelectNagYn(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE         /*고객번호              */
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.AG_DAY,                    /*동의일자            */
            A.SEQ,                       /*순번                */
            A.SAFEKEY,                   /*인증번호            */
            A.NAG_YN,                    /*필수동의항목        */
            A.CAG_YN,                    /*선택동의항목        */
            A.CAG_YN1,                   /*선택동의1-SMS(문자) */
            A.CAG_YN2,                   /*선택동의1-전화      */
            A.CAG_YN3,                   /*선택동의1-이메일    */
            A.CAG_YN4,                   /*선택동의1-주소(우편)*/
            A.CAG_YN5,                   /*선택동의1-카카오알림톡*/
            A.CTH_YN1,                   /*선택_3자제공1       */
            A.CTH_YN2,                   /*선택_3자제공2       */
            A.CTH_YN3,                   /*선택_3자제공3       */
            A.MAG_YN1,                   /*선택_마케팅동의1     */
            A.MAG_YN2,                   /*선택_마케팅동의2     */
            A.FILE_PATH,                 /*개인정보 제공동의서 */
            A.FILE_NAME,                 /*개인정보 제공동의서 */
            A.INPUT_DT,                  /*PAD입력일시         */
            A.INPUT_LGL_PATH,            /*인입채널대분류       */
            A.INPUT_MDL_PATH,            /*인입채널중분류       */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0111 A
    WHERE   CUST_NO = v_Cust_No
--    AND     AG_DAY  = TO_CHAR(SYSDATE,'yyyymmdd')
--    AND     SEQ = (
--                    SELECT MAX(SEQ)
--                    FROM RTSD0111
--                    WHERE CUST_NO = v_Cust_No
--                    AND   AG_DAY = TO_CHAR(SYSDATE,'yyyymmdd')
--                  )
    AND     SEQ = 1;    --[20230130_1] 최초 1회만 작성 여부 체크

  END p_sRtsd0111SelectNagYn;


 /*****************************************************************************
  -- 개인정보제공 동의 NAG_YN 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0111SelectNagYn2(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN RTSD0111.SEQ%TYPE             /*순번                  */
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.AG_DAY,                    /*동의일자            */
            A.SEQ,                       /*순번                */
            A.SAFEKEY,                   /*인증번호            */
            A.NAG_YN,                    /*필수동의항목        */
            A.CAG_YN,                    /*선택동의항목        */
            A.CAG_YN1,                   /*선택동의1-SMS(문자) */
            A.CAG_YN2,                   /*선택동의1-전화      */
            A.CAG_YN3,                   /*선택동의1-이메일    */
            A.CAG_YN4,                   /*선택동의1-주소(우편)*/
            A.CAG_YN5,                   /*선택동의1-카카오알림톡*/
            A.CTH_YN1,                   /*선택_3자제공1       */
            A.CTH_YN2,                   /*선택_3자제공2       */
            A.CTH_YN3,                   /*선택_3자제공3       */
            A.MAG_YN1,                   /*선택_마케팅동의1     */
            A.MAG_YN2,                   /*선택_마케팅동의2     */
            A.FILE_PATH,                 /*개인정보 제공동의서 */
            A.FILE_NAME,                 /*개인정보 제공동의서 */
            A.INPUT_DT,                  /*PAD입력일시         */
            A.INPUT_LGL_PATH,            /*인입채널대분류       */
            A.INPUT_MDL_PATH,            /*인입채널중분류       */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0111 A
    WHERE   CUST_NO = v_Cust_No
    AND     AG_DAY  = v_Ag_Day
    AND     SEQ     = v_Seq
    ;
  END p_sRtsd0111SelectNagYn2;

END Pkg_Rtsd0111;
/
