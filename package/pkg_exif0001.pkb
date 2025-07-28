CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Exif0001 AS
/*******************************************************************************
   NAME:      Pkg_EXIF0001
   PURPOSE   외부시스템 인터페이스 - 전자서명(트리포스)

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-07  jemcarry         1. Created this package body.
   1.0.1      2016-10-31  임욱재           [20161031_03] 윈터타이어 장착 시 보관검증 로직 제외
   1.0.2      2016-11-25  임욱재           [20161125_03] 장착당일 위치교환 서비스 불가
   1.0.3      2016-12-20  wjim             [20161220_01] 서비스확인서 연체기준 변경  
   1.1        2017-09-12  wjim             [20170906_01] 서비스확인서 SMS 발송기능 추가/변경
   1.7        2017-10-26  wjim             [20171026_01] 걱정제로, 엔진오일 서비스확인서 처리가능 기준 변경
   1.8        2018-03-28  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가 및 레귤러체인 서비스수수료 지급 제외
   1.9        2019-05-31  kstka            [20190531_01] 말일 주문/장착 동시 진행 불
   1.10       2020-09-10  kstka            [20200910_01] Nexen Check서비스확인서 작성 추가
   1.11       2021-11-22  kstka            [20211122_01] kstka 걱정제로 수령건은 수수료 미부과
   1.12       2024-01-17  kstka            [20240117_01] kstka 개인정보동의 항목 추가
*******************************************************************************/

  /*****************************************************************************
  -- 0)  PAD 로그인시 사용자 정보 조회 - Old Version
  *****************************************************************************/
  PROCEDURE p_sExif0001PadLoginInfo (
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
    v_Pass_Yn        OUT VARCHAR2,                     /*패스워드 인증결과     */
    v_User_Nm        OUT RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_File_Path1     OUT VARCHAR2,                     /*경로1-제공동의서      */
    v_File_Path2     OUT VARCHAR2,                     /*경로2-계약서          */
    v_File_Path3     OUT VARCHAR2,                     /*경로3-장착폐기동의서  */
    v_File_Path4     OUT VARCHAR2,                     /*경로4-서비스 확인서   */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

  BEGIN

    /*
    p_sExif0001PadLoginInfoOld(v_User_Id, v_Password, v_Pass_Yn, v_User_Nm,
                            v_File_Path1, v_File_Path2, v_File_Path3, v_File_Path4,
                            v_Success_Code, v_Return_Message, v_ErrorText);
    */

    v_Success_code := -1;
    v_Return_Message := '해당 프로그램은 이전버전으로 업그레이드 후 사용하시길 바랍니다. 자세한 내용은 렌탈시스템 공지사항에서 확인하시기 바랍니다.';
    v_ErrorText := '';

    EXCEPTION
      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sRtcm0001PadLoginInfo(0)', v_ErrorText, v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sRtcm0001PadLoginInfo(0)', v_User_Id, v_Password);


  END p_sExif0001PadLoginInfo;


  /*****************************************************************************
  -- 0)  PAD 로그인시 사용자 정보 조회 - Old Version
  *****************************************************************************/
  PROCEDURE p_sExif0001PadLoginInfoOld (
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
    v_Pass_Yn        OUT VARCHAR2,                     /*패스워드 인증결과     */
    v_User_Nm        OUT RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_File_Path1     OUT VARCHAR2,                     /*경로1-제공동의서      */
    v_File_Path2     OUT VARCHAR2,                     /*경로2-계약서          */
    v_File_Path3     OUT VARCHAR2,                     /*경로3-장착폐기동의서  */
    v_File_Path4     OUT VARCHAR2,                     /*경로4-서비스 확인서   */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Pass_Wd  RTCM0001.PASSWORD%TYPE DEFAULT NULL;    /*비밀번호              */
    v_Lock_Yn  RTCM0001.LOCK_YN%TYPE DEFAULT NULL;     /*사용불가 계정여부     */

    e_Error   EXCEPTION;
  BEGIN

    SELECT  A.USER_NM, A.PASSWORD, A.LOCK_YN,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0000') File_Path1,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0002') File_Path2,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0003') File_Path3,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0004') File_Path4
    INTO    v_User_Nm, v_Pass_Wd, v_Lock_Yn, v_File_Path1, v_File_Path2, v_File_Path3, v_File_Path4
    FROM    RTCM0001 A
    WHERE   A.USER_ID = v_User_Id;

    IF SQL%NOTFOUND THEN
        v_Pass_Yn := 'N';
        v_Return_Message := '해당 사용자ID(' || v_User_Id || ')는 존재하지 않은 ID입니다.!';
        RAISE e_Error;
    ELSE
        v_Pass_Yn := 'Y';
    END IF;

    IF NVL(v_Pass_Wd, ' ') != NVL(v_Password,' ') THEN
        v_Pass_Yn := 'N';
        v_Return_Message := '해당 사용자ID(' || v_User_Id || ')의 패스워드가 불일치 합니다.!';
        RAISE e_Error;
    END IF;

    IF v_Lock_Yn = 'Y' THEN
        v_Pass_Yn := 'N';
        v_Return_Message := '해당 사용자ID(' || v_User_Id || ')는 사용불가 상태입니다.!';
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sExif0001PadLoginInfoOld(1)', v_ErrorText, v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sExif0001PadLoginInfoOld(1)', v_User_Id, v_Password);
      WHEN NO_DATA_FOUND THEN
        v_Success_code := -1;
        v_Pass_Yn := 'N';
        v_Return_Message := '해당 사용자ID(' || v_User_Id || ')는 존재하지 않은 ID입니다.!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sExif0001PadLoginInfoOld(1)', v_ErrorText, v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sExif0001PadLoginInfoOld(1)', v_User_Id, v_Password);
      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sExif0001PadLoginInfoOld(2)', v_ErrorText, v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sExif0001PadLoginInfoOld(2)', v_User_Id, v_Password);


  END p_sExif0001PadLoginInfoOld;

  /*****************************************************************************
  -- 0)  PAD 로그인시 사용자 정보 조회 - New Version
  *****************************************************************************/
  PROCEDURE p_sExif0001PadLoginInfo (
    v_User_Id        IN  RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Password       IN  RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
    v_Version        IN  RTCM0051.CD%TYPE,             /*버전관리              */
    v_Pass_Yn        OUT VARCHAR2,                     /*패스워드 인증결과     */
    v_User_Nm        OUT RTCM0001.USER_NM%TYPE,        /*사용자명              */
    v_File_Path1     OUT VARCHAR2,                     /*경로1-기본경로        */
    v_File_Path2     OUT VARCHAR2,                     /*경로2-계약서          */
    v_File_Path3     OUT VARCHAR2,                     /*경로3-장착폐기동의서  */
    v_File_Path4     OUT VARCHAR2,                     /*경로4-서비스 확인서   */
    v_User_Grp       OUT VARCHAR2,                     /*사용자 권한그룹       */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Pass_Wd  RTCM0001.PASSWORD%TYPE DEFAULT NULL;    /*비밀번호              */
    v_Lock_Yn  RTCM0001.LOCK_YN%TYPE DEFAULT NULL;     /*사용불가 계정여부     */
    v_Cd       RTCM0051.CD%TYPE DEFAULT NULL;          /* 코드                 */
    v_Cd_Nm    RTCM0051.CD_NM%TYPE DEFAULT NULL;       /* 코드명               */


    e_Error   EXCEPTION;
  BEGIN

--  File_Path1 : 정보동의 제공경로 -> 기본경로로 변경 2015.11.13
--               File_Path1만 사용함 ,Path2,3,4 사용 안하는 것으로 변경
    SELECT  A.USER_NM, A.PASSWORD, A.LOCK_YN,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0000') File_Path1,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0002') File_Path2,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0003') File_Path3,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0004') File_Path4,
            A.USER_GRP
    INTO    v_User_Nm, v_Pass_Wd, v_Lock_Yn, v_File_Path1, v_File_Path2, v_File_Path3, v_File_Path4,
            v_User_Grp
    FROM    RTCM0001 A
    WHERE   A.USER_ID = v_User_Id;

    IF SQL%NOTFOUND THEN
        v_Pass_Yn := 'N';
        v_Return_Message := '해당 사용자ID(' || v_User_Id || ')는 존재하지 않은 ID입니다.!';
        RAISE e_Error;
    ELSE
        v_Pass_Yn := 'Y';
    END IF;

    IF NVL(v_Pass_Wd, ' ') != NVL(v_Password,' ') THEN
      --관리자 패스워드 추가 
        IF v_Password != '598993BF743ED5D481417F38EB6A261D' THEN      
            v_Pass_Yn := 'N';
            v_Return_Message := '해당 사용자ID(' || v_User_Id|| ')의 패스워드가 불일치 합니다.!';
            RAISE e_Error;
        END IF;
    END IF;

    IF v_Lock_Yn = 'Y' THEN
        v_Pass_Yn := 'N';
        v_Return_Message := '해당 사용자ID(' || v_User_Id || ')는 사용불가 상태입니다.!';
        RAISE e_Error;
    END IF;

    IF v_Version IS NOT NULL THEN

        SELECT  CD, CD_NM
        INTO    v_Cd, v_Cd_Nm
        FROM    RTCM0051
        WHERE   CD_GRP_CD = 'C018'
        AND     USE_YN    = 'Y';

        IF SQL%NOTFOUND THEN
            v_Pass_Yn := 'N';
            v_Return_Message := '모바일버젼 정보 오류입니다. 시스템담당자에게 문의하시기 바랍니다.!';
            RAISE e_Error;

        ELSIF TRIM(v_Cd) <> TRIM( v_Version ) THEN
            v_Pass_Yn := 'N';
            v_Return_Message := '모바일버젼이 맞지 않습니다. 업데이트 받으시기 바랍니다.!';
            RAISE e_Error;

        END IF;

    ELSE
        v_Pass_Yn := 'N';
        v_Return_Message := '모바일버젼 정보가 누락으로 사용할 수 없습니다.!';
        RAISE e_Error;

    END IF;

--    v_Success_code := 0;
--    v_Return_Message := '정상적으로 처리되었습니다';
--    v_ErrorText := '';
    
    v_Success_code := -1;
    v_Return_Message := '해당 앱은 더 이상 사용이 불가합니다. 신규 앱을 설치하여 사용하시기 바랍니다.';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sRtcm0001PadLoginInfo(1)', v_ErrorText, v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sRtcm0001PadLoginInfo(1)', v_User_Id, v_Password);
      WHEN NO_DATA_FOUND THEN
        v_Success_code := -1;
        v_Pass_Yn := 'N';
        v_Return_Message := '해당 사용자ID(' || v_User_Id || ')는 존재하지 않은 ID입니다.!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sRtcm0001PadLoginInfo(1)', v_ErrorText, v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sRtcm0001PadLoginInfo(1)', v_User_Id, v_Password);
      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sRtcm0001PadLoginInfo(2)', v_ErrorText, v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_sRtcm0001PadLoginInfo(2)', v_User_Id, v_Password);


  END p_sExif0001PadLoginInfo;


  /*****************************************************************************
  -- 1) 정보동의-대상조회
  *****************************************************************************/
  PROCEDURE p_sExif0001CustInfo (
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

  BEGIN

    -- 고객명만으로도 조회가능, 단 2자리 이상 입력
    -- 전화번호만으로도 조회가능
    -- 생년월인은 추가 조건 역활만
    -- 고객명+전화번호+생년월일 모두 입력하여 조회 가능
    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.CUST_NM,                   /*고객명/법인명       */
            A.BIRTH_DAY,                 /*법정생년월일        */
            A.MOB_NO,                    /*휴대폰번호          */
            A.GENDER_CD,                 /*성별                */
            A.LF_CD,                     /*내외국인            */
            '('||A.POS_CD||') '||A.ADDR1||' '||A.ADDR2 ADDR, /*고객주소   */
            TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY, /*시스템일자*/
            DECODE(A.CUST_TP,'01',SUBSTR(A.BIRTH_DAY,3,6),SUBSTR(A.BUSL_NO,1,6)) ENC_CD /* 암호화 코드 */
    FROM    RTSD0100 A
    WHERE   A.USE_YN  = 'Y'
    AND     A.CUST_TP = '01'
    AND     A.CUST_NM LIKE v_Cust_Nm||'%'
    AND     (v_Cust_Nm   IS NULL OR ((v_Mob_No IS NOT NULL) OR (v_Mob_No IS NULL AND LENGTH(v_Cust_Nm) >= 2)))
    AND     (v_Birth_Day IS NULL OR A.BIRTH_DAY =  v_Birth_Day)
    AND     (v_Mob_No    IS NULL OR A.MOB_NO =  v_Mob_No)
    AND     ((v_Cust_Nm  IS NULL AND v_Mob_No IS NOT NULL) OR
             (v_Cust_Nm  IS NOT NULL AND v_Mob_No IS NULL) OR
             (v_Cust_Nm  IS NOT NULL AND v_Mob_No IS NOT NULL));

  END p_sExif0001CustInfo;


  /*****************************************************************************
  -- 1) 개인정보제공 동의 서명 완료 등록
  *****************************************************************************/
  PROCEDURE p_InsertExif0001CustSign (
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
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
    v_Id             IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_Input_Dt       IN RTSD0111.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_Input_Lgl_Path IN RTSD0111.INPUT_LGL_PATH%TYPE, /*인입채널대분류         */
    v_Input_Mdl_Path IN RTSD0111.INPUT_MDL_PATH%TYPE, /*인입채널중분류         */
    v_File_Path      IN RTSD0111.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0111.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Safekey RTSD0111.SAFEKEY%TYPE DEFAULT NULL;     /*인증번호              */
    v_Seq     RTSD0111.SEQ%TYPE DEFAULT NULL;         /*순번                  */

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '고객번호              (v_Cust_No  )', v_Cust_No   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '동의일자              (v_Ag_Day   )', v_Ag_Day    );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '필수동의항목          (v_Nag_Yn   )', v_Nag_Yn    );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '선택동의항목          (v_Cag_Yn   )', v_Cag_Yn    );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '선택동의1-SMS(문자    (v_Cag_Yn1  )', v_Cag_Yn1   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '선택동의1-전화        (v_Cag_Yn2  )', v_Cag_Yn2   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '선택동의1-이메일      (v_Cag_Yn3  )', v_Cag_Yn3   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '선택동의1-주소(우편)  (v_Cag_Yn4  )', v_Cag_Yn4   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '선택_3자제공1         (v_Cth_Yn1  )', v_Cth_Yn1   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '선택_3자제공2         (v_Cth_Yn2  )', v_Cth_Yn2   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '선택_3자제공3         (v_Cth_Yn3  )', v_Cth_Yn3   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '등록자 ID             (v_Id       )', v_Id        );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', 'PAD입력일시           (v_Input_Dt )', v_Input_Dt  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '개인정보 제공동의서 파(v_File_Path)', v_File_Path );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(1)', '개인정보 제공동의서 파(v_File_Name)', v_File_Name );

--  [20240117_01] kstka 개인정보동의 항목 추가
    Pkg_Rtsd0111.p_IUDRtsd0111 ('I',v_Cust_No, v_Ag_Day, v_Seq, v_Safekey,
                                 v_Nag_Yn, v_Cag_Yn, v_Cag_Yn1, v_Cag_Yn2,
                                 v_Cag_Yn3, v_Cag_Yn4, v_Cag_Yn5, v_Cth_Yn1, v_Cth_Yn2,
                                 v_Cth_Yn3, v_Mag_Yn1, v_Mag_Yn2, v_File_Path, v_File_Name, 
                                 v_Input_Dt, v_Input_Lgl_Path, v_Input_Mdl_Path,
                                 v_Id, v_Success_Code, v_Return_Message, v_ErrorText);
    IF 0 = v_Success_Code THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;

    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := v_ErrorText;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001CustSign(2)', v_ErrorText, v_Return_Message);

  END p_InsertExif0001CustSign;

  /*****************************************************************************
  -- 2) 대상조회, 계약서정보
  *****************************************************************************/
  PROCEDURE p_sExif0001OrdInfoList (
    v_Ord_FDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 시작) */
    v_Ord_EDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 종료) */
    v_Id             IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*주문번호            */
            C.CUST_TP,                   /*고객유형            */
            C.CUST_TP2,                  /*고객분류            */
            C.CUST_NM,                   /*고객명/법인명       */
            --C.BIRTH_DAY,                 /*법정생년월일        */
            --C.GENDER_CD,                 /*성별                */
            --C.LF_CD,                     /*내외국인            */
            --C.MOB_NO,                    /*휴대폰번호          */
            DECODE(C.CUST_TP, '01', C.BIRTH_DAY, O_BIRTHDAY) BIRTH_DAY, /*법정생년월일        */
            DECODE(C.CUST_TP, '01', C.GENDER_CD, O_GENDERCD) GENDER_CD, /*성별                */
            DECODE(C.CUST_TP, '01', C.LF_CD    , O_LFCD    ) LF_CD    , /*내외국인            */
            DECODE(C.CUST_TP, '01', C.MOB_NO   , DECODE(A.CHAN_CD,'06',C.MOB_NO,O_MOBNO)) MOB_NO   , /*휴대폰번호          */
            C.MOB_FIRM,                  /*통신사              */
            C.REP_NM,                    /*대표자명            */
            C.BUSL_NO,                   /*사업자번호          */
            C.BUSI_TYPE,                 /*업종                */
            C.BUSI_COND,                 /*업태                */
            C.TEL_NO,                    /*전화번호            */
            '('||C.POS_CD||') '||C.ADDR1||' '||C.ADDR2 CUST_ADDR, /*주소 */
            C.EMAIL_ADDR,                /*E-Mail주소          */
             Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) ||' '||Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) MC_NM, /*차종 */
            A.CAR_NO,                    /*차량번호            */
            A.CAR_OWNER,                 /*차량소유주          */
            A.C_MILEAGE,                 /*현재주행거리        */
            C.TEL_NO2,                    /*보조주소-전화번호            */
            DECODE(C.POS_CD2,NULL,NULL,'(')||C.POS_CD2||DECODE(C.POS_CD2,NULL,NULL,') ')||C.ADDR1_2||' '||C.ADDR2_2 CUST_ADDR2, /*보조주소-주소 */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',D.PETTERN_CD)  PETTERN_CD,  /*패턴  */
            D.SECTION_WIDTH || '/' || D.ASPECT_RATIO || 'R' ||D.WHEEL_INCHES  SIZE_CD, /*규격 */
            TO_NUMBER(NVL(A.CNT_CD,0)) CNT_CD,  /*타이어본수   */
            B.REGI_AMT,                  /*렌탈등록비          */
            B.MON_AMT,                   /*월렌탈료            */
            B.MAT_DESC,                  /*비고                */
            A.PERIOD_CD,                 /*기간코드            */
            DECODE(A.PAY_MTHD, 'A', F.CUST_NM, 'C', G.CUST_NM) OWNER_NM, /*예금주*/
            DECODE(A.PAY_MTHD, 'A', DECODE(F.CUST_TP, '01', F.EBIR_DAY, '02', F.BUSL_NO), 'C', DECODE(G.CUST_TP, '01', G.EBIR_DAY, '02', G.BUSL_NO))  EBIR_DAY,  /*법정생일*/
            A.PAY_MTHD,                  /*결제구분            */
            A.PAY_DD,                    /*이체일              */
            DECODE(A.PAY_MTHD, 'A', Pkg_Rtcm0051.f_sRtcm0051CodeName('R001',F.BANK_CD), 'C', Pkg_Rtcm0051.f_sRtcm0051CodeName('R002',G.CARDCOM_CD)) BANK_NM, /*은행명/카드사명*/
            DECODE(A.PAY_MTHD, 'A', F.ACCT_NO, 'C', G.CARD_NO) ACCT_NO, /*은행계좌/카드번호*/
            DECODE(A.PAY_MTHD, 'C', G.EXPIRE_YM) EXPIRE_YM, /*유효기간(월/년) */
            A.AGENCY_CD,                 /*장착 대리점         */
            H.AGENCY_NM,                 /*장착점명            */
            H.TEL_NO AG_TELNO,           /*연락처(장착점)      */
            B.PLAN_DAY,                  /*장착예정일          */
            '('||H.POS_CD||') '||H.CITY||' '||H.STREET AG_ADDR, /*장착점주소 */
            A.ORG_CD,                    /*판매조직            */
            NULL ORG_NM,                 /*판매점명            */
            NULL ORG_TELNO,              /*연락처              */
            A.ORD_AGENT,                 /*판매인번호          */
            I.ORG_AGNM,                  /*판매인명            */
            I.ORG_AGTEL,                 /*판매인핸드폰        */
            A.FC_DAY,                    /*최초청구일자        */
            A.PCERT_YN,                  /*신분증 첨부 필수여부*/
            A.ORD_DAY,                   /*접수일자            */
            TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY ,/*시스템일자*/
            DECODE(C.CUST_TP,'01',SUBSTR(C.BIRTH_DAY,3,6),SUBSTR(C.BUSL_NO,1,6)) ENC_CD, /* 암호화 코드 */
            A.SEASON_CD                  /*계절구분('01':4계절,'02':겨울용)     */
    FROM    RTSD0104 A,
            RTSD0106 B,
            RTSD0100 C,
            RTSD0005 D,
            RTRE0010 F,
            RTRE0020 G,
            RTSD0007 H,
            RTSD0113 I
    WHERE   A.ORD_DAY BETWEEN v_Ord_Fday AND v_Ord_Eday
    AND     A.AGENCY_CD = (SELECT  AGENT_ID FROM RTCM0001 WHERE USER_ID = v_Id)
    AND     A.CUST_NO IN (  SELECT  CUST_NO
                            FROM    RTSD0100
                            WHERE   USE_YN  = 'Y'
                            AND     CUST_NM LIKE v_Cust_Nm||'%'
                            AND     (v_Cust_Nm IS NULL OR LENGTH(v_Cust_Nm) >= 2) -- 고객명 2자리 이상 일 경우만 조회 가능
                            AND     (v_Birth_Day IS NULL OR BIRTH_DAY = v_Birth_Day)
                            AND     (v_Mob_No    IS NULL OR MOB_NO = v_Mob_No)
                         )
    AND     A.STAT_CD = '01'
    AND     A.ORD_NO  = B.ORD_NO
    AND     A.CUST_NO = C.CUST_NO
    AND     B.MAT_CD  = D.MAT_CD
    AND     A.ACC_SEQ = F.ACC_SEQ(+)
    AND     A.CRD_SEQ = G.CRD_SEQ(+)
    AND     A.AGENCY_CD = H.AGENCY_CD
    AND     A.ORD_AGENT = I.ORD_AGENT(+);


  END p_sExif0001OrdInfoList;

  /*****************************************************************************
  -- 2) 계약서 서명완료 등록
  *****************************************************************************/
  PROCEDURE p_InsertExif0001OrdSign (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Cmsag_Yn       IN RTSD0104.CMSAG_YN%TYPE,       /*CMS출금이체동의       */
    v_Con_Mthd       IN RTSD0104.CON_MTHD%TYPE,       /*계약서 교부방법       */
    v_Id             IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_Input_Dt       IN RTSD0111.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0111.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0111.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    v_Stat_Cd RTSD0104.STAT_CD%TYPE DEFAULT '03';     /*상태                  */
    e_Error EXCEPTION;

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001OrdSign(1)', '계약번호              (v_Ord_No   )', v_Ord_No   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001OrdSign(1)', 'CMS출금이체동의       (v_Cmsag_Yn )', v_Cmsag_Yn );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001OrdSign(1)', '계약서 교부방법       (v_Con_Mthd )', v_Con_Mthd );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001OrdSign(1)', '등록자 ID             (v_Id       )', v_Id       );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001OrdSign(1)', 'PAD입력일시           (v_Input_Dt )', v_Input_Dt );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001OrdSign(1)', '개인정보 제공동의서 파(v_File_Path)', v_File_Path);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001OrdSign(1)', '개인정보 제공동의서 파(v_File_Name)', v_File_Name);

    -- 필수값:CMS출금이체동의 ,계약서 교부방법 ,등록자 ID ,PAD입력일시 ,개인정보 제공동의서 파 ,개인정보 제공동의서 파
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cmsag_Yn) IS NULL THEN
        v_Return_Message := 'CMS출금이체동의('||v_Cmsag_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    IF TRIM(v_Con_Mthd) IS NULL THEN
        v_Return_Message := '계약서 교부방법('||v_Con_Mthd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Id) IS NULL THEN
        v_Return_Message := '등록자ID('||v_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Input_Dt) THEN
        v_Return_Message := 'PAD입력일시('||v_Input_Dt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Path) IS NULL THEN
        v_Return_Message := '개인정보 제공동의서 파일경로('||v_File_Path||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Name) IS NULL THEN
        v_Return_Message := '개인정보 제공동의서 파일명('||v_File_Name||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 저장전에 RTSD0104.ORD_NO로 STAT_CD = '01'인 건이 있는지 체크 (없으면 예외처리)
    IF '01' != Pkg_Rtsd0104.f_sRtsd0104StatCd(v_Ord_No) THEN
        v_Return_Message := '해당 계약번호('||v_Ord_No||')는 계약접수 상태가 아니므로 처리가 불가 합니다.!';
        RAISE e_Error;
    END IF;

    -- 계약 정보 Update - 전사서명 정보 업데이트
    IF 0 != Pkg_Rtsd0104.f_UpdateRtsd0104Sing (v_Ord_No, v_Stat_Cd, v_Cmsag_Yn, v_Con_Mthd, v_Input_Dt,
                                               v_File_Path, v_File_Name, v_Id, v_ErrorText) THEN
        v_Return_Message := '계약 정보 Update - 전사서명 정보 업데이트 실패!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    --  계약 정보 변경 이력 생성
    IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_ErrorText) THEN
        v_Return_Message := '계약 이력 정보 Update - 전사서명 정보 업데이트 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    --  계약 상품 정보 Update - 전사서명 정보 업데이트
    IF 0 != Pkg_Rtsd0106.f_UpdateRtsd0106Sign (v_Ord_No, v_Stat_Cd, v_Id, v_ErrorText) THEN
        v_Return_Message := '계약 상품 정보 Update - 전사서명 정보 업데이트 실패!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001OrdSign(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001OrdSign(2)', v_ErrorText, v_Return_Message);


  END p_InsertExif0001OrdSign;

  /*****************************************************************************
  -- 3) 장착,폐기위탁 - 대상조회, 기본정보
  -- -1.0.1      2016-10-31  임욱재           [20161031_03] 윈터타이어 장착 시 보관검증 로직 제외
  *****************************************************************************/
  PROCEDURE p_sExif0001ProcInfoList (
    v_Ord_FDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 시작) */
    v_Ord_EDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 종료) */
    v_Id             IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  C.CUST_NM,                                                     /*고객명/법인명       */
            C.TEL_NO,                                                      /*전화번호            */
            C.MOB_NO,                                                      /*휴대폰번호          */
            A.ORD_NO,                                                      /*주문번호            */
            '('||C.POS_CD||') '||C.ADDR1||' '||C.ADDR2 CUST_ADDR,          /*주소                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) ||' '||Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) MC_NM, /*차종 */
            A.CAR_NO,                                                      /*차량번호            */
            A.C_MILEAGE,                                                   /*현재주행거리        */
            TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY,                           /*시스템일자          */
            DECODE(C.CUST_TP,'01',SUBSTR(C.BIRTH_DAY,3,6),SUBSTR(C.BUSL_NO,1,6)) ENC_CD,           /*암호화 코드         */
            A.SEASON_CD,                                                   /*계절구분('01':4계절,'02':겨울용)*/
            CASE
               WHEN A.SEASON_CD = '01' THEN 'Y'
               /* [20161031_03]
               WHEN A.SEASON_CD = '02' AND TO_CHAR(Pkg_Rtcs0203.f_sRtcs0203Count(A.ORD_NO, 1)) = '0' THEN 'N'
               */
               ELSE 'Y'
            END AS STRG_GBN,                                               /*WINTER 보관Data 존재여부*/
            CASE
               WHEN A.SEASON_CD = '01' THEN ''
               /* [20161031_03]
               WHEN A.SEASON_CD = '02' AND TO_CHAR(Pkg_Rtcs0203.f_sRtcs0203Count(A.ORD_NO, 1)) = '0' THEN
                           '겨울용 계약건에 대한 보관정보가 등록되지 않았습니다. 보관정보 입력 후 장착처리 가능합니다.'
               */
               ELSE ''
            END AS STRG_ERR                                                /*WINTER 보관관련 에러메시지*/
    FROM    RTSD0104 A,
            RTSD0100 C
    WHERE   A.ORD_DAY BETWEEN v_Ord_Fday AND v_Ord_Eday
    AND     A.AGENCY_CD = (SELECT  AGENT_ID FROM RTCM0001 WHERE USER_ID = v_Id)
    AND     A.CUST_NO IN (  SELECT  CUST_NO
                            FROM    RTSD0100
                            WHERE   USE_YN  = 'Y'
                            AND     CUST_NM LIKE v_Cust_Nm||'%'
                            AND     (v_Cust_Nm IS NULL OR LENGTH(v_Cust_Nm) >= 2) -- 고객명 2자리 이상 일 경우만 조회 가능
                            AND     (v_Birth_Day IS NULL OR BIRTH_DAY = v_Birth_Day)
                            AND     (v_Mob_No    IS NULL OR MOB_NO = v_Mob_No)
                         )
    AND     A.STAT_CD IN ('01','03')
    AND     A.CUST_NO = C.CUST_NO;


  END p_sExif0001ProcInfoList;

  /*****************************************************************************
  -- 3) 장착,폐기위탁 서명완료 등록 - 장착등록처리
  *****************************************************************************/
  PROCEDURE p_InsertExif0001ProcSign (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_Sv_Sert        IN RTSD0108.SV_SERT%TYPE,        /*서비스만족도          */
    v_Ag_Sert        IN RTSD0108.AG_SERT%TYPE,        /*대리점만족도          */
    v_Td_Yn          IN RTSD0108.TD_YN%TYPE,          /*기존타이어폐기위탁동의*/
    v_Id             IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_Input_Dt       IN RTSD0108.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0108.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0108.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Ord_Day RTSD0104.ORD_DAY%TYPE;
    v_Chan_Cd RTSD0104.CHAN_CD%TYPE;
    
    e_Error EXCEPTION;

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', '계약번호              (v_Ord_No   )', v_Ord_No   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', '장착일자              (v_Proc_Day )', v_Proc_Day );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', '서비스만족도          (v_Sv_Sert  )', v_Sv_Sert  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', '대리점만족도          (v_Ag_Sert  )', v_Ag_Sert  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', '기존타이어폐기위탁동의(v_Td_Yn    )', v_Td_Yn    );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', '등록자 ID             (v_Id       )', v_Id       );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', 'PAD입력일시           (v_Input_Dt )', v_Input_Dt );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', '개인정보 제공동의서 파(v_File_Path)', v_File_Path);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', '개인정보 제공동의서 파(v_File_Name)', v_File_Name);


    -- 필수값:계약번호 , 장착일자 , 서비스만족도 , 대리점만족도 , 기존타이어폐기위탁동의 , 등록자 ID , PAD입력일시 , 개인정보 제공동의서 파일경로 , 개인정보 제공동의서 파일명
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Proc_Day) THEN
        v_Return_Message := '장착일자('||v_Proc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF SUBSTR(v_Proc_Day,1,6) != TO_CHAR(SYSDATE, 'YYYYMM') THEN
        v_Return_Message := '장착일자('||v_Proc_Day||')는 현재월 범위에서만 처리가 가능합니다.!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Sv_Sert) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S062', v_Sv_Sert)) THEN
        v_Return_Message := '서비스만족도('||v_Sv_Sert ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ag_Sert) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S063', v_Ag_Sert)) THEN
        v_Return_Message := '대리점만족도('||v_Ag_Sert ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Td_Yn) IS NULL) OR (TRIM(v_Td_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '기존타이어폐기위탁동의('||v_Td_Yn ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Id) IS NULL THEN
        v_Return_Message := '등록자ID('||v_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Input_Dt) THEN
        v_Return_Message := 'PAD입력일시('||v_Input_Dt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Path) IS NULL THEN
        v_Return_Message := '개인정보 제공동의서 파일경로('||v_File_Path||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Name) IS NULL THEN
        v_Return_Message := '개인정보 제공동의서 파일명('||v_File_Name||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- [20190531_01]말일 주문/장착은 불가
    SELECT ORD_DAY, CHAN_CD 
    INTO v_Ord_Day, v_Chan_Cd
    FROM RTSD0104 
    WHERE ORD_NO = v_Ord_No;
    
    IF TO_CHAR(LAST_DAY(v_Ord_Day), 'YYYYMMDD') = v_Proc_Day AND v_Chan_Cd IN ('02', '03', '04') THEN
        v_Return_Message := '온라인 주문은 말일 주문/장착 동시 진행은 불가합니다!';
        RAISE e_Error;    
    END IF;

    -- 저장전에 RTSD0104.ORD_NO로 STAT_CD = '03'인 건이 있는지 체크 (없으면 예외처리)
    IF '03' != Pkg_Rtsd0104.f_sRtsd0104StatCd(v_Ord_No) THEN
        v_Return_Message := '해당 계약번호('||v_Ord_No||')는 장착대기 상태가 아니므로 처리가 불가 합니다.!';
        RAISE e_Error;
    END IF;

    -- 장착 등록 처리
    Pkg_Rtsd0108.p_InsertRtsd0108Pad(v_Ord_No, v_Proc_Day, v_Sv_Sert , v_Ag_Sert , v_Td_Yn ,
                                     v_Input_Dt , v_File_Path , v_File_Name , v_Id ,
                                     v_Success_Code, v_Return_Message, v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '장착 등록 처리 실패!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001ProcSign(2)', v_ErrorText, v_Return_Message);


  END p_InsertExif0001ProcSign;

/*****************************************************************************
  -- 4) 서비스 확인서 - 대상조회, 기본정보
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0.2      2016-11-25  임욱재           [20161125_03]
                                           - 장착일 7일 이후 부터 위치교환 처리 가능
   1.0.3      2016-12-20  wjim             [20161220_01]
                                           - 서비스확인서 연체기준 변경
                                           - 기존 : 지난달 말일 기준 > 변경 : 마지막 연체 기준                                             
  *****************************************************************************/
  PROCEDURE p_sExif0001ServiceList (
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Proc_FDay      IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(작업일자시작)*/
    v_Prpc_EDay      IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(작업일자종료)*/
    v_Id             IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

    v_User_Grp  RTCM0001.USER_GRP%TYPE DEFAULT NULL;    /*사용자 그룹           */
    v_Dely_Day  RTRE0100.DELY_DAY%TYPE DEFAULT NULL;    /*마지막 연체집계 일자  */    --[20161220_01]
    
  BEGIN

    v_User_Grp := Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Id);
    
    -- 마지막 연체집계일 조회 [20161220_01]
    SELECT  MAX(DELY_DAY)
      INTO  v_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';

    -- 대리점(05)
    IF '05' = v_User_Grp OR '01' = v_User_Grp  THEN

        OPEN Ref_Cursor FOR
        SELECT  C.CUST_NM,                                                                      /*고객명/법인명       */
                DECODE(D.STD_YM, NULL, C.TEL_NO, D.TEL_NO) TEL_NO,                              /*전화번호            */
                DECODE(D.STD_YM, NULL, C.MOB_NO, D.MOB_NO) MOB_NO,                              /*휴대폰번호          */
                A.ORD_NO,                                                                       /*주문번호            */
                DECODE(D.STD_YM, NULL, '('||C.POS_CD||') '||C.ADDR1||' '||C.ADDR2, '('||D.POSCD||') '||D.ADDR1||' '||D.ADDR2) CUST_ADDR,   /*주소 */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) ||' '||Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) MC_NM, /*차종 */
                A.CAR_NO,                                                                       /*차량번호            */
                B.AGENCY_NM PROC_NM,                                                            /*대리점명            */
                B.TEL_NO PROC_TEL,                                                              /*전화번호            */
                -- 고객번호 전월말일 기준 연체 금액이 0으로 리턴될 경우만 CASE 값 가져옴, 금액 0 이상이면 0건
             --   decode(substr(a.ord_day,1,4),'2016',1, DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, NULL),
             --               0,  CASE -- 장착일자 ~ (+ 3개월 - 1일)까지는 0,
             --                   WHEN TO_CHAR(ADD_MONTHS(A.PROC_DAY, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN 0
             --                   ELSE  Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') END,
             --               0)) AS PRS_DCD1_CNT,                                                 /*엔진오일 잔여횟수   */
                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
                            0,  CASE -- 장착일자 ~ (+ 3개월 - 1일)까지는 0,
                                WHEN TO_CHAR(ADD_MONTHS(A.PROC_DAY, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN 0
                                ELSE  Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') END,
                            0) AS PRS_DCD1_CNT,             
--                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, NULL),
--                            0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00002'),
--                            0) AS PRS_DCD2_CNT,                                                 /*위치교환 잔여횟수  20160325 주석처리 해제 한승훈 [20161125_03] 이전 */
                DECODE(
                      Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day)
                    , 0
                    , CASE
                        WHEN TO_CHAR(TO_DATE(A.PROC_DAY)+7,'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN
                            0
                        ELSE
                            Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00002')  
                      END
                    , 0 
                ) AS PRS_DCD2_CNT,                                                              /*위치교환 잔여횟수  [20161125_03] */                              
                --DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, NULL),
                --            0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00003'),
                --            0) AS PRS_DCD3_CNT,                                                 /*방문점검 잔여횟수   */
                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
                          0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00007'),
                           0) AS PRS_DCD6_CNT,                                                  /*걱정제로 잔여횟수   */    
                --2 AS PRS_DCD6_CNT,   
                E.KWMENG||'본'  AS TIRE_CNT,                       /*걱정제로 신청본수+'본' */                                                                   
                --0 PRS_DCD1_CNT,                                                                /*엔진오일 잔여횟수   */
                --0 PRS_DCD2_CNT,                                                                 /*위치교환 잔여횟수 주석 처리 20160325 한승훈   */  
                0 PRS_DCD3_CNT,                                                                 /*방문점검 잔여횟수   */
               -- 0 PRS_DCD4_CNT,                                                                 /*걱정제로 잔여횟수   */
                TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY,                                            /*시스템일자          */
                DECODE(C.CUST_TP,'01',SUBSTR(C.BIRTH_DAY,3,6),SUBSTR(C.BUSL_NO,1,6)) ENC_CD,    /*암호화 코드         */
                DECODE(A.SEASON_CD,'02', DECODE(F.PS_CD, 'A00002', '02', '01'), A.SEASON_CD) SEASON_CD,                                                                    /*계절구분('01':4계절,'02':겨울용)*/
                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
                            0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00006'),
                            0) AS PRS_DCD5_CNT,                                                 /*WINTER교체 잔여횟수 */
                D.STD_YM,                                                                       /*(방문점검)대상년월  */
                D.JOB_SEQ,                                                                      /*(방문점검)작업순번  */
                D.CHK_STAT,                                                                     /*(방문점검)작업상태  */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('H008', D.CHK_STAT) CHK_STAT_NM,               /*(방문점검)작업상태명*/
                A.C_MILEAGE C_MILEAGE                                                           /*마일리지(주행거리)  */
        FROM    RTSD0108 A,
                RTSD0007 B, -- PAD로 로그인한 대리점의 정보획득용으로 계약-장착대리점과는 다름. 조인없이함
                RTSD0100 C,
                (
                -- 방문점검 데이터는 월별로 하나의 오더에 한건만 존재함
                SELECT  D.STD_YM, D.ORD_NO, D.EQU_NO, D.JOB_SEQ, D.CHK_STAT,
                        E.MOB_NO, E.TEL_NO, E.POSCD, E.ADDR1, E.ADDR2
                FROM    RTCS0005 D,
                        RTCS0006 E
                WHERE   D.STD_YM  = SUBSTR(v_Prpc_EDay, 1, 6)
                AND     D.STD_YM  = E.STD_YM
                AND     D.ORD_NO  = E.ORD_NO
                AND     D.EQU_NO  = E.EQU_NO
                AND     D.JOB_SEQ = E.JOB_SEQ
                AND     E.ROWID   = (   SELECT  /*+ INDEX_DESC(Z RTCS0006_PK) */
                                                Z.ROWID
                                        FROM    RTCS0006 Z
                                        WHERE   Z.STD_YM   = D.STD_YM
                                        AND     Z.ORD_NO   = D.ORD_NO
                                        AND     Z.EQU_NO   = D.EQU_NO
                                        AND     Z.JOB_SEQ  = D.JOB_SEQ
                                        AND     ROWNUM <= 1
                                        )
                ) D,
                ( SELECT AGENCY_CD ,ORD_NO, KWMENG
                   FROM RTCS0010
                  WHERE DLV_STAT  IN ('01','02', '03') ) E,
                  RTSD0013 F
        WHERE   A.CAR_NO  LIKE '%'||v_Car_No
        AND     LENGTH(v_Car_No) >= 4 -- 차량번호는 4자리 이상 일 경우만 조회 가능
        AND     A.MFP_YN  = 'N'
        AND     A.OS_YN   = 'N'
        AND     A.STAT_CD = '04'
        AND     B.AGENCY_CD  = (SELECT AGENT_ID FROM RTCM0001 WHERE USER_ID = v_Id AND USER_GRP = '05')
        AND     A.CUST_NO = C.CUST_NO
        AND     A.ORD_NO  = D.ORD_NO(+)
        AND     A.ORD_NO  = E.ORD_NO(+)
        AND     A.ORD_NO  = F.ORD_NO
        AND     ROWNUM = 1;

    -- Mr. Roadian(08)
    ELSIF '08' = v_User_Grp THEN

        OPEN Ref_Cursor FOR
        SELECT  C.CUST_NM,                                                                      /*고객명/법인명       */
                D.TEL_NO,                                                                       /*전화번호            */
                D.MOB_NO,                                                                       /*휴대폰번호          */
                D.ORD_NO,                                                                       /*주문번호            */
                '('||D.POSCD||') '||D.ADDR1||' '||D.ADDR2 CUST_ADDR,                            /*주소                */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) ||' '||Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) MC_NM, /*차종 */
                A.CAR_NO,                                                                       /*차량번호            */
                B.CARMASTER_NM PROC_NM,                                                         /*대리점명            */
                B.MOB_NO       PROC_TEL,                                                        /*전화번호            */
                -- 고객번호 전월말일 기준 연체 금액이 0으로 리턴될 경우만 CASE 값 가져옴, 금액 0 이상이면 0건
                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
                            0,  CASE -- 장착일자 ~ (+ 3개월 - 1일)까지는 0,
                                WHEN TO_CHAR(ADD_MONTHS(A.PROC_DAY, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN 0
                                ELSE  Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') END,
                            0) AS PRS_DCD1_CNT,                                                 /*엔진오일 잔여횟수   */
                --DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, NULL),
                --            0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00002'),
                --            0) AS PRS_DCD2_CNT,                                                 /*위치교환 잔여횟수   */
                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
                            0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00003'),
                            0) AS PRS_DCD3_CNT,                                                 /*방문점검 잔여횟수   */
                --0 PRS_DCD1_CNT,                                                                 /*엔진오일 잔여횟수   */
                0 PRS_DCD2_CNT,                                                                 /*위치교환 잔여횟수   */
                --0 PRS_DCD3_CNT,                                                                 /*방문점검 잔여횟수   */                
                0 PRS_DCD6_CNT,                                                                  /*걱정제로 잔여횟수   */
                0 TIRE_CNT,                                                                       /*걱정제로 신청본수   */
                TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY,                                            /*시스템일자          */
                DECODE(C.CUST_TP,'01',SUBSTR(C.BIRTH_DAY,3,6),SUBSTR(C.BUSL_NO,1,6)) ENC_CD,    /*암호화 코드         */
                A.SEASON_CD,                                                                    /*계절구분('01':4계절,'02':겨울용)*/
                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
                            0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00006'),
                            0) AS PRS_DCD5_CNT,                                                 /*WINTER교체 잔여횟수 */
                D.STD_YM,                                                                       /*(방문점검)대상년월  */
                D.JOB_SEQ,                                                                      /*(방문점검)작업순번  */
                D.CHK_STAT,                                                                     /*(방문점검)작업상태  */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('H008', D.CHK_STAT) CHK_STAT_NM,               /*(방문점검)작업상태명*/
                A.C_MILEAGE C_MILEAGE                                                           /*마일리지(주행거리)  */
        FROM    RTSD0108 A,
                RTCS0002 B, -- PAD로 로그인한 Mr. Roadian의 정보획득용으로 계약-장착대리점과는 다름. 조인없이함
                RTSD0100 C,
                (
                -- 방문점검 데이터는 월별로 하나의 오더에 한건만 존재함
                SELECT  D.STD_YM, D.ORD_NO, D.EQU_NO, D.JOB_SEQ, D.CHK_STAT,
                        E.MOB_NO, E.TEL_NO, E.POSCD, E.ADDR1, E.ADDR2
                FROM    RTCS0005 D,
                        RTCS0006 E
                WHERE   D.STD_YM   = SUBSTR(v_Prpc_EDay, 1, 6)
                AND     D.PLAN_DAY BETWEEN v_Proc_Fday AND v_Prpc_EDay
                AND     D.MR_CD    = v_Id
                AND     D.CHK_STAT  IN ('01','04')
                AND     D.STD_YM   = E.STD_YM
                AND     D.ORD_NO   = E.ORD_NO
                AND     D.EQU_NO   = E.EQU_NO
                AND     D.JOB_SEQ  = E.JOB_SEQ
                AND     E.ROWID    = (  SELECT  /*+ INDEX_DESC(Z RTCS0006_PK) */
                                                Z.ROWID
                                        FROM    RTCS0006 Z
                                        WHERE   Z.STD_YM   = D.STD_YM
                                        AND     Z.ORD_NO   = D.ORD_NO
                                        AND     Z.EQU_NO   = D.EQU_NO
                                        AND     Z.JOB_SEQ  = D.JOB_SEQ
                                        AND     ROWNUM <= 1
                                        )
                ) D
        WHERE   D.ORD_NO = A.ORD_NO
        AND     A.CAR_NO  LIKE '%'||v_Car_No
        AND     A.MFP_YN  = 'N'
        AND     A.OS_YN   = 'N'
        AND     A.STAT_CD = '04'
        AND     B.CARMASTER_NU  = v_Id
        AND     A.CUST_NO = C.CUST_NO;

    ELSE

        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_sExif0001ServiceList(1)', '사용자 아이디 기준 사용자 그룹 오류. 대리점(05) 또는 Mr. Roadian(08)만 가능.', v_User_Grp);
        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_sExif0001ServiceList(1)', '차량번호              ', v_Car_No   );
        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_sExif0001ServiceList(1)', '조회일자(작업일자시작)', v_Proc_FDay);
        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_sExif0001ServiceList(1)', '조회일자(작업일자종료)', v_Prpc_EDay);
        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_sExif0001ServiceList(1)', '사용자 아이디         ', v_Id       );


        --OPEN Ref_Cursor FOR
        --SELECT  C.CUST_NM,                   /*고객명/법인명       */
        --        C.TEL_NO,                    /*전화번호            */
        --        C.MOB_NO,                    /*휴대폰번호          */
        --        A.ORD_NO,                    /*주문번호            */
        --        '('||C.POS_CD||') '||C.ADDR1||' '||C.ADDR2 CUST_ADDR, /*주소 */
        --        Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) ||' '||Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) MC_NM, /*차종 */
        --        A.CAR_NO,                    /*차량번호            */
        --        B.AGENCY_NM PROC_NM,         /*대리점명            */
        --        B.TEL_NO PROC_TEL,           /*전화번호            */
        --        --Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00001') PRS_DCD1_CNT, /*엔진오일 잔여횟수 */
        --        --Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00002') PRS_DCD2_CNT, /*위치교환 잔여횟수 */
        --        --Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00003') PRS_DCD3_CNT  /*방문점검 잔여횟수 */
        --        0 PRS_DCD1_CNT, /*엔진오일 잔여횟수 */
        --        0 PRS_DCD2_CNT, /*위치교환 잔여횟수 */
        --        0 PRS_DCD3_CNT, /*방문점검 잔여횟수 */
        --        TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY, /*시스템일자*/
        --        DECODE(C.CUST_TP,'01',SUBSTR(C.BIRTH_DAY,3,6),SUBSTR(C.BUSL_NO,1,6)) ENC_CD /* 암호화 코드 */
        --FROM    RTSD0108 A,
        --        RTSD0007 B, -- PAD로 로그인한 대리점의 정보획득용으로 계약-장착대리점과는 다름. 조인없이함
        --        RTSD0100 C
        --WHERE   A.CAR_NO  LIKE '%'||v_Car_No
        --AND     A.MFP_YN  = 'N'
        --AND     A.OS_YN   = 'N'
        --AND     A.STAT_CD = '04'
        --AND     B.AGENCY_CD  = (SELECT AGENT_ID FROM RTCM0001 WHERE USER_ID = v_Id AND USER_GRP = '05')
        --AND     A.CUST_NO = C.CUST_NO;

    END IF;


  END p_sExif0001ServiceList;


  /*****************************************************************************
  -- 4) 서비스 확인서 서명완료 등록
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0.1      2016-12-20  wjim             [20161220_01]
                                           - 서비스확인서 연체기준 변경
                                           - 기존 : 지난달 말일 기준 > 변경 : 마지막 연체 기준
   1.1        2017-09-12  wjim             [20170906_01] 서비스확인서 SMS 발송기능 추가/변경   
   1.7        2017-10-26  wjim             [20171026_01] 걱정제로, 엔진오일 서비스확인서 처리가능 기준 변경 
                                           - 연체금액 관계없이 처리 가능
   1.8        2018-03-28  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가 및 레귤러체인 서비스수수료 지급 제외
                                           - 레귤러체인 여부는 Sales Group이 아닌 채널중분류 기준 (Sales Group의 변경가능성 f/박정석)
   1.11       2021-11-22  kstka            [20211122_01] kstka 걱정제로 수령건은 수수료 미부과
  *****************************************************************************/
  PROCEDURE p_InsertExif0001ServiceSign (
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Prs_Dcd1       IN RTSD0114.PRS_DCD1%TYPE,       /*서비스명1_엔진오일    */
    v_Prs_Dcd2       IN RTSD0114.PRS_DCD2%TYPE,       /*서비스명2_위치교환    */
    v_Prs_Dcd3       IN RTSD0114.PRS_DCD3%TYPE,       /*서비스명3_방문점검    */       
    v_Sv_Sert        IN RTSD0114.SV_SERT%TYPE,        /*서비스 만족도         */
    v_Id             IN RTSD0114.REG_ID%TYPE,         /*등록자 ID             */
    v_Input_Dt       IN RTSD0114.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0114.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0114.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Prs_Dcd4       IN RTSD0114.PRS_DCD4%TYPE,       /*서비스명4_Door-to-Door*/
    v_Prs_Dcd5       IN RTSD0114.PRS_DCD5%TYPE,       /*서비스명5_WINTER 교체 */
    v_Prs_Dcd6       IN RTSD0114.PRS_DCD6%TYPE,       /*서비스명6_걱정제로    */
    v_Prs_Dcd8       IN RTSD0114.PRS_DCD8%TYPE,       /*서비스명8_얼라인먼트    */
    v_Prs_Dcd9       IN RTSD0114.PRS_DCD9%TYPE,       /*서비스명9_무상얼라인먼트    */
    v_Prs_Dcd10      IN RTSD0114.PRS_DCD10%TYPE,      /*서비스명10_Nexen Check    */
    v_Prs_Dcd11      IN RTSD0114.PRS_DCD11%TYPE,      /*서비스명11_조기마모파손보증    */
    v_Prs_Dcd12      IN RTSD0114.PRS_DCD12%TYPE,      /*서비스명12_파손보증    */
    v_A_Mileage      IN RTSD0114.A_MILEAGE%TYPE,      /*주행거리(마일리지)    */
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  ) IS


    CURSOR Cur_ServiceView (v_Std_Ym VARCHAR) IS
    SELECT A.ORD_NO                                    ORD_NO,
           A.PROC_DAY                                  PROC_DAY,
           A.AGENCY_CD                                 AGENCY_CD,
           B.MAT_CD                                    MAT_CD,
           PKG_RTSD0005.f_sRtsd0005MatName(B.MAT_CD)   MAT_NM,
           A.CUST_NO                                   CUST_NO,
           C.CUST_NM                                   CUST_NM,
           DECODE(D.STD_YM, NULL, C.TEL_NO, D.TEL_NO)  TEL_NO,    /*전화번호            */
           DECODE(D.STD_YM, NULL, C.MOB_NO, D.MOB_NO)  MOB_NO,    /*휴대폰번호          */
           A.CAR_NO                                    CAR_NO,
           A.SALES_OFFICE                              SALES_OFFICE,
           A.SALES_GROUP                               SALES_GROUP
      FROM RTSD0108 A,
           RTCS0001 B,
           RTSD0100 C,
           (
            -- 방문점검 데이터는 월별로 하나의 오더에 한건만 존재함
            SELECT  D.STD_YM, D.ORD_NO, D.EQU_NO, D.JOB_SEQ, D.CHK_STAT,
                    E.MOB_NO, E.TEL_NO, E.POSCD, E.ADDR1, E.ADDR2
            FROM    RTCS0005 D,
                    RTCS0006 E
            WHERE   D.STD_YM  = v_Std_Ym
            AND     D.STD_YM  = E.STD_YM
            AND     D.ORD_NO  = E.ORD_NO
            AND     D.EQU_NO  = E.EQU_NO
            AND     D.JOB_SEQ = E.JOB_SEQ
            AND     E.ROWID   = (   SELECT  /*+ INDEX_DESC(Z RTCS0006_PK) */
                                            Z.ROWID
                                    FROM    RTCS0006 Z
                                    WHERE   Z.STD_YM   = D.STD_YM
                                    AND     Z.ORD_NO   = D.ORD_NO
                                    AND     Z.EQU_NO   = D.EQU_NO
                                    AND     Z.JOB_SEQ  = D.JOB_SEQ
                                    AND     ROWNUM <= 1
                                    )
            ) D
     WHERE A.ORD_NO  = B.ORD_NO
       AND A.CUST_NO = C.CUST_NO
       AND A.ORD_NO  = D.ORD_NO(+)
       AND A.ORD_NO  = v_Ord_No;


--    v_Prs_Dcd4  RTSD0114.PRS_DCD4%TYPE DEFAULT 'N';       /*서비스명4_Door-to-Door*/
--    v_Prs_Dcd5  RTSD0114.PRS_DCD5%TYPE DEFAULT 'N';       /*서비스명5_Winter 교체 */
--    v_A_Mileage RTSD0114.A_MILEAGE%TYPE DEFAULT NULL;     /*주행거리(평균)        */
--    v_Std_Ym    RTCS0005.STD_YM%TYPE DEFAULT NULL;        /*기준년월              */
--    v_Job_Seq   RTCS0005.JOB_SEQ%TYPE DEFAULT NULL;       /*작업순번              */
    v_Call_No       RTCS0100.CALL_NO%TYPE DEFAULT NULL;       /*상담번호              */

    v_User_Grp      RTCM0001.USER_GRP%TYPE DEFAULT NULL;   /*사용자 그룹           */
    v_Proc_Day      RTSD0114.PROC_DAY%TYPE DEFAULT NULL;   /*처리일자              */
    v_Seq           RTSD0114.SEQ%TYPE DEFAULT NULL;        /*순번                  */
    v_Equ_No        RTCS0001.EQU_NO%TYPE DEFAULT NULL;     /*설비번호              */
    v_Serv_Seq      RTCS0007.SERV_SEQ%TYPE DEFAULT NULL;   /*서비스 순번           */
    v_Per_Tp        RTCS0007.PER_TP%TYPE DEFAULT NULL;     /*정기,비정기구분       */
    v_Serv_Sign_Seq RTCS0007.SERV_SIGN_SEQ%TYPE DEFAULT NULL; /*서비스확인서 서명순번 */
    v_Dely_Day      RTRE0100.DELY_DAY%TYPE DEFAULT NULL;    /*마지막 연체집계 일자  */    --[20161220_01]    
    v_Sales_Group   RTSD0007.SALES_GROUP%TYPE DEFAULT NULL;
    v_Chan_Mcls     RTSD0007.CHAN_MCLS_CD%TYPE DEFAULT NULL;
    v_Dlvc_Yn       RTCS0008.DLVC_YN%TYPE;                /*수수료 적용여부       */
    v_Dlvc_Yn2      RTCS0008.DLVC_YN%TYPE;                /*수수료 적용여부 (레귤러체인의 경우 미지급) */ --[20180326_01]
    v_Dlvr_Day      RTCS0008.DLVR_DAY%TYPE;               /*배송신청일자          */
    v_Dlvr_Seq      RTCS0008.DLVR_SEQ%TYPE;               /*순번                  */
    
    v_Dlv_Stat      RTCS0010.DLV_STAT%TYPE;   
    v_PRS_DCD6_CNT  NUMBER;
    
    v_Sms_Msg       RTSD0205.SND_MSG%TYPE;
    v_Serv_Cntr1    NUMBER;
    v_Serv_Cntr2    NUMBER;
    v_Serv_Cntr7    NUMBER;
    v_Serv_Cntr8    NUMBER;
    
    v_templateCd    RTSD0205.ETC_CHAR_4%TYPE;
           
    v_DupCnt        NUMBER;
         
    v_Close_Day     VARCHAR2(8);
                  
    e_Error         EXCEPTION;

  BEGIN


    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '계약번호              (v_Ord_No   )', v_Ord_No    );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '서비스명1_엔진오일    (v_Prs_Dcd1 )', v_Prs_Dcd1  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '서비스명2_위치교환    (v_Prs_Dcd2 )', v_Prs_Dcd2  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '서비스명3_방문점검    (v_Prs_Dcd3 )', v_Prs_Dcd3  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '서비스 만족도         (v_Sv_Sert  )', v_Sv_Sert   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '등록자 ID             (v_Id       )', v_Id        );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', 'PAD입력일시           (v_Input_Dt )', v_Input_Dt  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '개인정보 제공동의서 파(v_File_Path)', v_File_Path );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '개인정보 제공동의서 파(v_File_Name)', v_File_Name );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '서비스명4_Door-to-Door(v_Prs_Dcd4 )', v_Prs_Dcd4  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '서비스명5_WINTER 교체 (v_Prs_Dcd5 )', v_Prs_Dcd5  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '주행거리(평균)        (v_A_Mileage)', v_A_Mileage );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '기준년월              (v_Std_Ym   )', v_Std_Ym    );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '작업순번              (v_Job_Seq  )', v_Job_Seq   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', '서비스명6_걱정제로    (v_Prs_Dcd6 )', v_Prs_Dcd6  );

    -- 처리일자:PAD입력일자
    v_Proc_Day := SUBSTR(v_Input_Dt,1,8);

--/*  양식변경 전까지 테스트위해 HARD-CORDING_START */
--    v_Std_Ym   := '201511';
--    v_Prs_Dcd4 := 'N';
--    v_Job_Seq  := 1;
--    v_A_Mileage := NULL;
--    SELECT C_MILEAGE              /* 테스트 중에는 기존 마일리지 값으로 처리*/
--      INTO v_A_Mileage
--      FROM RTSD0108
--     WHERE ORD_NO = v_Ord_No;
/*  양식변경 전까지 테스트위해 HARD-CORDING_END */

    --  1주일내 동일 차량번호로 서비스확인서 작성여부 확인(위치교환/얼라인먼트) 2018.11.20 kst 
    SELECT COUNT(*) INTO v_DupCnt FROM (
        SELECT B.PROC_DAY
        FROM RTSD0108 A, RTCS0007 B, RTCS0008 C
        WHERE 1=1
        AND A.CAR_NO = (SELECT CAR_NO FROM RTSD0108 WHERE ORD_NO = v_Ord_No)
        AND A.ORD_NO = B.ORD_NO
        AND B.ORD_NO = C.ORD_NO
        AND B.SERV_SEQ = C.SERV_SEQ
        AND C.SERVICE_CD IN (
            CASE WHEN v_Prs_Dcd2 = 'Y' THEN 'B00002'
                 WHEN v_Prs_Dcd8 = 'Y' THEN 'B00008'
                 ELSE NULL END
                 )
    ) WHERE ROWNUM = 1 
    AND TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD'), 'YYYYMMDD') BETWEEN TO_DATE(PROC_DAY, 'YYYYMMDD') - 7 AND TO_DATE(PROC_DAY, 'YYYYMMDD');
    
    
    IF v_DupCnt > 0 THEN
        v_Return_Message := '해당 차량으로 1주일 이내 동일한 서비스 내역이 있어 처리불가능합니다.';
        RAISE e_Error;
    END IF;
    
    
    SELECT 
        TO_CHAR(ADD_MONTHS(PROC_DAY, PERIOD_CD), 'YYYYMMDD')
        INTO v_Close_Day
    FROM RTSD0108
    WHERE ORD_NO = v_Ord_No;
    
    --위치교환, 얼라인먼트 서비스인경우 종료일 확인
    IF v_Prs_Dcd2 = 'Y' OR v_Prs_Dcd8 = 'Y' THEN
        IF v_Close_Day < TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
            v_Return_Message := '이미 종료된 계약입니다. 서비스처리가 불가합니다.';
            RAISE e_Error;
        END IF;
    END IF;
        
    v_User_Grp := Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Id);
    
    -- 마지막 연체집계일 조회 [20161220_01]
    SELECT  MAX(DELY_DAY)
      INTO  v_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';

    -- 대리점(05)
    IF '05' = v_User_Grp THEN

        -- v_Prs_Dcd1, v_Prs_Dcd2, v_Prs_Dcd5만 선택 가능, 이외 선택 저장 불가처리
        IF NOT (v_Prs_Dcd1 = 'Y' OR v_Prs_Dcd2 = 'Y' OR v_Prs_Dcd5 = 'Y' OR v_Prs_Dcd6 = 'Y' OR v_Prs_Dcd8 = 'Y' OR v_Prs_Dcd9 = 'Y' OR v_Prs_Dcd10 = 'Y' OR v_Prs_Dcd11 = 'Y' OR v_Prs_Dcd12 = 'Y') THEN
            v_Return_Message := '렌탈전문점에서는 방문점검,Door-to-Door서비스의 확인서 완료가 불가능합니다. Mr. Roadian 번호로 로그인 후 처리바랍니다.';
            RAISE e_Error;
        END IF;

    -- Mr. Roadian(08)
    ELSIF '08' = v_User_Grp THEN

        -- v_Prs_Dcd3, v_Prs_Dcd4만 선택 가능, 이외 선택 저장 불가처리
        IF NOT (v_Prs_Dcd3 = 'Y' OR v_Prs_Dcd4 = 'Y') THEN
            v_Return_Message := 'Mr. Rodian은 방문점검,Door-to-Door서비스의 확인서 완료만 가능합니다. 렌탈전문점에서 완료바랍니다.';
            RAISE e_Error;
        END IF;

    -- 서비스매니저 (17)
    ELSIF '17' = v_User_Grp THEN

        -- v_Prs_Dcd6만 선택 가능, 이외 선택 저장 불가처리
        IF NOT (v_Prs_Dcd6 = 'Y') THEN
            v_Return_Message := '서비스매니저는  걱정제로 서비스의 확인서 완료만 가능합니다. 렌탈전문점에서 완료바랍니다.';
            RAISE e_Error;
        END IF;
        
    ELSE
        v_Return_Message := '서비스 확인서 처리가 불가능한 사용자입니다. 렌탈전문점, Mr. Roadian만 가능합니다.';
        RAISE e_Error;
    END IF;


    -- v_Prs_Dcd3가 다른 서비스 1,2,4와 같이 처리 불가
    IF (v_Prs_Dcd3 = 'Y') AND (v_Prs_Dcd1 = 'Y' OR v_Prs_Dcd2 = 'Y' OR v_Prs_Dcd4 = 'Y' OR v_Prs_Dcd5 = 'Y'OR v_Prs_Dcd6 = 'Y' OR v_Prs_Dcd8 = 'Y' OR v_Prs_Dcd9 = 'Y' OR v_Prs_Dcd10 = 'Y' OR v_Prs_Dcd11 = 'Y' OR v_Prs_Dcd12 = 'Y') THEN
        v_Return_Message := '방문점검과 다른 서비스를 동시에 완료할 수 없습니다. 방문점검 완료 후 별도로 완료바랍니다.';
        RAISE e_Error;
    END IF;

    -- Mr. Roadian(08)
    IF ('08' = v_User_Grp) AND (v_Prs_Dcd3 = 'Y') THEN

        IF (TRIM(v_Std_Ym) <> TO_CHAR(SYSDATE, 'YYYYMM')) AND (0 = Pkg_Rtcm0051.f_sRtcm0051UseCount('H010', SUBSTR(v_Std_Ym,3,4))) THEN
            v_Return_Message := '해당 대상년월 데이터는 이미 마감되었으므로 처리가 불가합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    -- 서비스명6_걱정제로
    IF v_Prs_Dcd6 = 'Y' THEN 
        -- [20171026_01] 이전   
--        SELECT DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt( (SELECT CUST_NO FROM RTSD0108 WHERE ORD_NO = v_Ord_No), NULL, v_Dely_Day),
--                                        0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(v_Ord_No, 'B00007'),
--                                        0) AS PRS_DCD6_CNT 
--        INTO v_PRS_DCD6_CNT
--        FROM DUAL;
        
        SELECT Pkg_Rtsd0013.f_sRtsd0013ServCntr(v_Ord_No, 'B00007') AS PRS_DCD6_CNT 
        INTO v_PRS_DCD6_CNT
        FROM DUAL;        

        IF v_PRS_DCD6_CNT = 0 THEN
            v_Return_Message := '걱정제로 차감회수가 0 이므로 저장이 불가능합니다.!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;   
    END IF;    

    -- 서비스 확인서 등록(RTSD0114)
    Pkg_Rtsd0114.p_IUDRtsd0114('I' , v_Ord_No , v_Seq , v_Proc_Day ,
                               v_Prs_Dcd1 , v_Prs_Dcd2 , v_Prs_Dcd3 , v_Prs_Dcd4, v_Prs_Dcd5,v_Prs_Dcd6, v_Prs_Dcd8, v_Prs_Dcd9, v_Prs_Dcd10, v_Prs_Dcd11, v_Prs_Dcd12, v_A_Mileage, v_Sv_Sert ,
                               v_Input_Dt , v_File_Path , v_File_Name , v_Id ,
                               v_Success_Code , v_Return_Message , v_ErrorText);

    IF 0 != v_Success_Code THEN
        v_Return_Message := '서비스 확인서 등록(RTSD0114) 실패!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 서비스명1_엔진오일 -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd1 = 'Y' THEN
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00001', v_Id, v_ErrorText) THEN
            v_Return_Message := '엔진오일 - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;

    -- 서비스명2_위치교환 -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd2 = 'Y' THEN
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00002', v_Id, v_ErrorText) THEN
            v_Return_Message := '위치교환 - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;

    -- 서비스명3_방문점검 -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd3 = 'Y' THEN
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00003', v_Id, v_ErrorText) THEN
            v_Return_Message := '방문점검 - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;

    -- 서비스명5_WINTER교체 -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd5 = 'Y' THEN
    
        UPDATE RTCS0204 SET WRITE_YN = 'Y' WHERE ORD_NO = v_Ord_No; -- 윈터교체 신청 해제
        
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00006', v_Id, v_ErrorText) THEN
            v_Return_Message := ' - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;
    
    -- 서비스명6_걱정제로교체 -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd6 = 'Y' THEN    
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00007', v_Id, v_ErrorText) THEN
            v_Return_Message := ' - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        UPDATE rtcs0010 
        SET proc_day = TO_CHAR(SYSDATE,'yyyymmdd')
        WHERE ord_no = v_Ord_No 
        AND dlv_stat <> '06'
        AND proc_day IS NULL;
        
    END IF;    

    -- 서비스명8_얼라인먼트 -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd8 = 'Y' THEN
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00008', v_Id, v_ErrorText) THEN
            v_Return_Message := '얼라인먼트 - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;
    
    -- 서비스명9_무상얼라인먼트 -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd9 = 'Y' THEN
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00009', v_Id, v_ErrorText) THEN
            v_Return_Message := '얼라인먼트 - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;
    
    -- 서비스명10_Nexen Check -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd10 = 'Y' THEN
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00010', v_Id, v_ErrorText) THEN
            v_Return_Message := 'Nexen Check - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;
    
    -- 서비스명11_조기마모파손보증 -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd11 = 'Y' THEN
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00011', v_Id, v_ErrorText) THEN
            v_Return_Message := '조기마모파손보증 - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;
    
    -- 서비스명12_파손보증 -  해당 서비스건 횟수 차감처리
    IF v_Prs_Dcd12 = 'Y' THEN
        IF 0 != Pkg_Rtsd0013.f_UpdateRtsd0013ServCntr(v_Ord_No, 'B00012', v_Id, v_ErrorText) THEN
            v_Return_Message := '파손보증 - 해당 서비스건 횟수 차감처리 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;
    
    -- 계약번호로 설비번호 획득
    v_Equ_No := Pkg_Rtcs0001.f_sRtcs0001OrdNoForEquNo(v_Ord_no);

    IF TRIM(v_Equ_No) IS NULL THEN
        v_Return_Message := '서비스 확인서 서명완료 처리 실패! - 오더번호 기준 설비번호 획득 실패!';
        RAISE e_Error;
    END IF;

    -- v_Prs_Dcd3 = 'Y'이면 '1' 아니면 '2'
    IF v_Prs_Dcd3 = 'Y' THEN
        v_Per_Tp := '1';
    ELSE
        v_Per_Tp := '2';
    END IF;


    -- 서비스 확인서 순번 획득
    v_Serv_Sign_Seq := v_Seq;

    --  서비스 처리내역(RTCS0007) 등록
    Pkg_Rtcs0007.p_IUDRtcs0007('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                               v_Per_Tp, v_Id, v_A_Mileage, TO_CHAR(SYSDATE,'YYYYMMDD'),
                               TO_CHAR(SYSDATE,'HH24MISS'), v_Serv_Sign_Seq, v_Id,
                                v_Success_Code, v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN
        v_Return_Message := '서비스 처리내역(RTCS0007) 등록 실패!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    --[20180326_01] 서비스수수료 지급 제외
    IF '05' = v_User_Grp THEN
    
        -- [20200507_01] 레귤러체인 수수료 지급처리 
        --[20200515_01] 레귤러체인 수수료 지급되도록 원복처리
        BEGIN
            SELECT  CHAN_MCLS_CD
              INTO  v_Chan_Mcls
              FROM  RTSD0007
             WHERE  AGENCY_CD = v_Id; 

            IF v_Chan_Mcls = '0105' THEN
                v_Dlvc_Yn2 := 'N';
            ELSE
                v_Dlvc_Yn2 := 'Y';
            END IF;
        
        EXCEPTION
            WHEN OTHERS THEN
                v_Dlvc_Yn2 := 'N';
                
        END;

        --[20200910_01] Nexen Check서비스는 수수료 제외
        IF v_Prs_Dcd10 = 'Y' THEN
            v_Dlvc_Yn2 := 'N';
        END IF;
        
--        v_Dlvc_Yn2 := 'Y';
    
    ELSIF '08' = v_User_Grp THEN
        v_Dlvc_Yn2 := 'Y';
        
--[20200515_01] 레귤러체인 수수료 지급되도록 원복처리    
--    ELSIF '17' = v_User_Grp THEN --[20200507_01] 서비스매니저 수수료지급처리
--        v_Dlvc_Yn2 := 'Y';
           
    ELSE
        v_Dlvc_Yn2 := 'N';
        
    END IF;

    -- 서비스명1_엔진오일
    IF v_Prs_Dcd1 = 'Y' THEN

        BEGIN

            SELECT --'Y', 
                    (
--                    SELECT  DECODE(SUBSTR(MAKER_CD,1,1), 'B', 'N','Y') --[20180326_01] 이전
                    SELECT  DECODE(v_Dlvc_Yn2,'Y',DECODE(SUBSTR(MAKER_CD,1,1), 'B', 'N','Y'),'N')
                    FROM    RTSD0108 Z
                    WHERE   Z.ORD_NO = A.ORD_NO
                    ) DLVC_YN,  
                    A.DLVR_DAY, A.DLVR_SEQ
            INTO   v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq
            FROM   RTCS0009 A
            WHERE  A.ORD_NO   = v_Ord_No
            AND    A.CUST_NO  = (SELECT CUST_NO FROM RTSD0108 WHERE ORD_NO = v_Ord_No)
            AND    A.DLV_STAT = '03'
            AND    A.DLV_GB   = '01';
            
            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_Dlvc_Yn  := 'N';
                v_Dlvr_Day := NULL;
                v_Dlvr_Seq := NULL;
                v_Return_Message := '엔진오일서비스 교체신청 후 배송완료된 정보가 없습니다. 배송완료 후 서비스 처리가능합니다.';
                RAISE e_Error;
              WHEN OTHERS THEN
                v_Return_Message := '엔진오일 배송신청 내역 획득시 에러 발생!'||'-'||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
        END;
    
        -- 서비스 처리내역 상세(RTCS0008) 등록
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00001', v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00001) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


        -- 엔진오일 배송신청 내역 Update - 배송신청, 상태 업데이트
        IF 0 != Pkg_Rtcs0009.f_UpdateRtcs0009ServSeqDlvStat (v_Dlvr_Day, v_Dlvr_Seq, v_Serv_Seq, '04',
                                                             v_Id, v_ErrorText) THEN
            v_Return_Message := '엔진오일 배송신청 내역(RTCS0009)  배송신청, 상태 업데이트 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;


    END IF;

    -- 서비스명2_위치교환
    IF v_Prs_Dcd2 = 'Y' THEN

        -- 서비스 처리내역 상세(RTCS0008) 등록
--        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
--                                   v_Seq, 'B00002', 'Y', NULL, NULL, v_Id,
--                                   v_Success_Code, v_Return_Message, v_ErrorText); --[20180326_01] 이전
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00002', v_Dlvc_Yn2, NULL, NULL, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);                                   

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00002) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END IF;

    -- 서비스명3_방문점검
    IF v_Prs_Dcd3 = 'Y' THEN

        -- 서비스 처리내역 상세(RTCS0008) 등록
--        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
--                                   v_Seq, 'B00003', 'Y', NULL, NULL, v_Id,
--                                   v_Success_Code, v_Return_Message, v_ErrorText); --[20180326_01] 이전 
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00003', v_Dlvc_Yn2, NULL, NULL, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00003) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END IF;

    -- Door-to-Door
    IF v_Prs_Dcd4 = 'Y' THEN

        -- 서비스 처리내역 상세(RTCS0008) 등록
--        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
--                                   v_Seq, 'B00004', 'Y', NULL, NULL, v_Id,
--                                   v_Success_Code, v_Return_Message, v_ErrorText); --[20180326_01] 이전
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00004', v_Dlvc_Yn2, NULL, NULL, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00004) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END IF;

    -- WINTER 교체
    IF v_Prs_Dcd5 = 'Y' THEN

        IF( PKG_RTSD0007.f_sRtsd0007GetSeasonGbn(TRIM(v_Id)) != '02' ) THEN
            v_Return_Message := '겨울용타이어 렌탈전문점이 아닙니다. WINTER 교체 불가능합니다.';
            RAISE e_Error;
        END IF;

        -- 서비스 처리내역 상세(RTCS0008) 등록
--        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
--                                   v_Seq, 'B00006', 'Y', NULL, NULL, v_Id,
--                                   v_Success_Code, v_Return_Message, v_ErrorText); --[20180326_01] 이전
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00006', v_Dlvc_Yn2, NULL, NULL, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00006) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        -- 보관내역(RTCS0203) 출고내역 처리
        Pkg_Rtcs0203.p_Rtcs0203WinterOutChange(v_Ord_No , v_Id,
                                               v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '타이어 보관건 출고(RTCS0203) 처리 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END IF;

    -- 서비스명6_걱정제로
    IF v_Prs_Dcd6 = 'Y' THEN

        BEGIN                                     
            SELECT --'Y', -- 그이전
--                    (
--                    SELECT  DECODE(SUBSTR(MAKER_CD,1,1), 'B', 'N','Y')                    
--                    FROM    RTSD0108 Z
--                    WHERE   Z.ORD_NO = A.ORD_NO
--                    ) DLVC_YN,   --[20180326_01] 이전 
                    CASE WHEN DLV_GB = '02' THEN 'N' ELSE v_Dlvc_Yn2 END AS DLVC_YN,    --[20211122_01] kstka 수령건은 수수료 미부과
                    A.DLVR_DAY, A.DLVR_SEQ, DECODE(A.DLV_STAT,'01','07','04')
            INTO   v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq, v_Dlv_Stat
            FROM   RTCS0010 A
            WHERE  A.ORD_NO   = v_Ord_No
            AND    A.CUST_NO  = (SELECT CUST_NO FROM RTSD0108 WHERE ORD_NO = v_Ord_No)
            AND    A.DLV_STAT IN ('01', '02', '03');    --03(배송중)추가 20160325 한승훈 
            

            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_Dlvc_Yn  := 'N';
                v_Dlvr_Day := NULL;
                v_Dlvr_Seq := NULL;
                v_Return_Message := '걱정제로서비스 교체신청 후 배송완료된 정보 혹은 신청 정보가 없습니다. 선처리는 신청 후  후 서비스 처리가능합니다.';
                RAISE e_Error;
              WHEN OTHERS THEN
                v_Return_Message := '걱정제로 배송신청 내역 획득시 에러 발생!'||'-'||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
        END;
    
        -- 서비스 처리내역 상세(RTCS0008) 등록
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00007', v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00007) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


        -- 걱정제로일 배송신청 내역 Update - 배송신청, 상태 업데이트
        IF 0 != Pkg_Rtcs0010.f_UpdateRtcs0010ServSeqDlvStat (v_Dlvr_Day, v_Dlvr_Seq, v_Serv_Seq, v_Dlv_Stat,
                                                             v_Id, v_ErrorText) THEN
            v_Return_Message := '걱정제로 배송신청 내역(RTCS0010)  배송신청, 상태 업데이트 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;


    END IF;
    
    -- 서비스명8_얼라인먼트
    IF v_Prs_Dcd8 = 'Y' THEN

        -- 서비스 처리내역 상세(RTCS0008) 등록
--        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
--                                   v_Seq, 'B00008', 'Y', NULL, NULL, v_Id,
--                                   v_Success_Code, v_Return_Message, v_ErrorText); --[20180326_01] 이전
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00008', v_Dlvc_Yn2, NULL, NULL, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00008) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END IF;
    
    -- 서비스명9_무상얼라인먼트
    IF v_Prs_Dcd9 = 'Y' THEN

        -- 서비스 처리내역 상세(RTCS0008) 등록
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00009', v_Dlvc_Yn2, NULL, NULL, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00009) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END IF;
    
    -- 서비스명10_Nexen Check 서비스
    IF v_Prs_Dcd10 = 'Y' THEN

        -- 서비스 처리내역 상세(RTCS0008) 등록
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00010', v_Dlvc_Yn2, NULL, NULL, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00010) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END IF;
    
    -- 서비스명11_조기마모파손보증 서비스
    IF v_Prs_Dcd11 = 'Y' THEN

        BEGIN                                     
            SELECT --'Y', -- 그이전
--                    (
--                    SELECT  DECODE(SUBSTR(MAKER_CD,1,1), 'B', 'N','Y')                    
--                    FROM    RTSD0108 Z
--                    WHERE   Z.ORD_NO = A.ORD_NO
--                    ) DLVC_YN,   --[20180326_01] 이전 
                    v_Dlvc_Yn2,
                    A.DLVR_DAY, A.DLVR_SEQ, DECODE(A.DLV_STAT,'01','07','04')
            INTO   v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq, v_Dlv_Stat
            FROM   RTCS0208 A
            WHERE  A.ORD_NO   = v_Ord_No
            AND    A.CUST_NO  = (SELECT CUST_NO FROM RTSD0108 WHERE ORD_NO = v_Ord_No)
            AND    A.DLV_STAT IN ('01', '02', '03');
            

            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_Dlvc_Yn  := 'N';
                v_Dlvr_Day := NULL;
                v_Dlvr_Seq := NULL;
                v_Return_Message := '조기마모보증서비스 교체신청 후 배송완료된 정보 혹은 신청 정보가 없습니다. 선처리는 신청 후  후 서비스 처리가능합니다.';
                RAISE e_Error;
              WHEN OTHERS THEN
                v_Return_Message := '조기마모보증 배송신청 내역 획득시 에러 발생!'||'-'||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
        END;
            
        -- 서비스 처리내역 상세(RTCS0008) 등록
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00011', v_Dlvc_Yn2, v_Dlvr_Day, v_Dlvr_Seq, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00011) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        -- 조기마모파손/파손보증서비스 배송신청 내역 Update - 배송신청, 상태 업데이트
        IF 0 != Pkg_Rtcs0208.f_UpdateRtcs0208ServSeqDlvStat (v_Dlvr_Day, v_Dlvr_Seq, v_Dlv_Stat,
                                                      v_Id, v_ErrorText) THEN
            v_Return_Message := '조기마모파손보증 배송신청 내역(RTCS0208)  배송신청, 상태 업데이트 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
    END IF;
    
    -- 서비스명12_파손보증 서비스
    IF v_Prs_Dcd12 = 'Y' THEN

        BEGIN                                     
            SELECT --'Y', -- 그이전
--                    (
--                    SELECT  DECODE(SUBSTR(MAKER_CD,1,1), 'B', 'N','Y')                    
--                    FROM    RTSD0108 Z
--                    WHERE   Z.ORD_NO = A.ORD_NO
--                    ) DLVC_YN,   --[20180326_01] 이전 
                    v_Dlvc_Yn2,
                    A.DLVR_DAY, A.DLVR_SEQ, DECODE(A.DLV_STAT,'01','07','04')
            INTO   v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq, v_Dlv_Stat
            FROM   RTCS0208 A
            WHERE  A.ORD_NO   = v_Ord_No
            AND    A.CUST_NO  = (SELECT CUST_NO FROM RTSD0108 WHERE ORD_NO = v_Ord_No)
            AND    A.DLV_STAT IN ('01', '02', '03');
            

            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_Dlvc_Yn  := 'N';
                v_Dlvr_Day := NULL;
                v_Dlvr_Seq := NULL;
                v_Return_Message := '파손보증서비스 교체신청 후 배송완료된 정보 혹은 신청 정보가 없습니다. 선처리는 신청 후  후 서비스 처리가능합니다.';
                RAISE e_Error;
              WHEN OTHERS THEN
                v_Return_Message := '파손보증 배송신청 내역 획득시 에러 발생!'||'-'||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
        END;
        
        -- 서비스 처리내역 상세(RTCS0008) 등록
        Pkg_Rtcs0008.p_IUDRtcs0008('I', v_Ord_No, v_Equ_No, v_Serv_Seq,
                                   v_Seq, 'B00012', v_Dlvc_Yn2, v_Dlvr_Day, v_Dlvr_Seq, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '서비스 처리내역 상세(RTCS0008) 등록(B00012) 실패!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        -- 조기마모파손/파손보증서비스 배송신청 내역 Update - 배송신청, 상태 업데이트
        IF 0 != Pkg_Rtcs0208.f_UpdateRtcs0208ServSeqDlvStat (v_Dlvr_Day, v_Dlvr_Seq, v_Dlv_Stat,
                                                      v_Id, v_ErrorText) THEN
            v_Return_Message := '조기마모파손보증 배송신청 내역(RTCS0208)  배송신청, 상태 업데이트 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
    END IF;
    
    -- Mr. Roadian(08)
    IF ('08' = v_User_Grp) AND (v_Prs_Dcd3 = 'Y') THEN

        -- 방문점검 작업목록(RTCS0005) 상태 체크
        IF '04' = Pkg_Rtcs0005.f_sRtcs0005ChkStat (v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq) THEN
            v_Return_Message := '이미 당월 방문점검 처리완료된 건입니다. 저장불가!!!'||'-'||v_Errortext;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        -- 방문점검 작업목록(RTCS0005) Update
        IF 0 != Pkg_Rtcs0005.f_UpdateRtcs0005ServiceSign (v_Std_Ym, v_Ord_No, v_Equ_No, v_Job_Seq,
                                                          v_Id, TO_CHAR(SYSDATE,'YYYYMMDD'), TO_CHAR(SYSDATE,'HH24MISS'), '04',
                                                          v_Serv_Seq, v_Id, v_ErrorText) THEN
            v_Return_Message := '방문점검 작업목록(RTCS0005) Update 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;



        -- 관리계정 정보(RTCS0004) A_Mileage Update
        IF 0 != Pkg_Rtcs0004.f_UpdateRtcs0004AMileage (v_Std_Ym, v_Ord_No, v_Equ_No, v_A_Mileage,
                                                       v_Id, v_ErrorText) THEN
            v_Return_Message := '관리계정 정보(RTCS0004) A_Mileage Update 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END IF;

    -- 장착 정보(RTSD0108) C_Mileage Update
    IF 0 != Pkg_Rtsd0108.f_UpdateRtsd0108CMileage (v_Ord_No, v_A_Mileage, v_Id, v_ErrorText) THEN
        v_Return_Message := '장착 정보(RTSD0108) C_Mileage Update 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    -- 2015.10.07 해피콜 대상(RTCS0100) 생성(서비스)
    FOR CUR IN Cur_ServiceView (v_Std_Ym) LOOP
        EXIT WHEN Cur_ServiceView%NOTFOUND;

        -- 6-1) 해피콜 대상 생성
        Pkg_Rtcs0100.p_IUDRtcs0100('I', v_Call_No, 'H2', TO_CHAR(SYSDATE,'YYYYMMDD'),
                                   NULL, 'I', NULL, NULL,
                                   'N', '0', v_Ord_No, CUR.Proc_Day, CUR.AGENCY_CD,
                                   CUR.Mat_Cd, CUR.Mat_Nm, CUR.Cust_No, CUR.Cust_Nm,
                                   CUR.Mob_No, CUR.Tel_No, CUR.Car_No, CUR.Sales_Office,
                                   CUR.Sales_Group, NULL, v_Serv_Seq,
                                   v_Id, v_Id,
                                   v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '해피콜 대상(RTCS0100) 생성(서비스) - 계약번호 기준 해피콜 대상(서비스) 생성 실패!!!'||'-'||v_Return_Message;
            RAISE e_Error;
        END IF;


        -- 6-2) 해피콜 질의 답변 생성
        Pkg_Rtcs0101.p_IUDRtcs0101 ('I', v_Call_No,
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 1),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 2),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 3),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 4),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 5),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 6),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 7),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 8),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 9),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'O', 10),
                                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
                                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'S', 1),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'S', 2),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'S', 3),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'S', 4),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H2', 'S', 5),
                                    NULL, NULL, NULL, NULL, NULL, v_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '해피콜 질의 답변(RTCS0101) 생성(서비스) - 계약번호 기준 해피콜 대상 생성(서비스) 실패!!!'||'-'||v_Return_Message;
            RAISE e_Error;
        END IF;

        -------------
        -- SMS발송 --
        -------------
        -- 2016-07-26 이영근, 엔진오일, 걱정제로 문자메시지 발송 추가
        -- [20170906_01] 방문점검, 위치교환 문자 추가 및 내용 변경
        -- [20180621_01] 서비스 문자메세지 문구 추가 및 휠얼라인먼트 문자 추가
        IF v_Prs_Dcd1 = 'Y' OR v_Prs_Dcd6 = 'Y' OR v_Prs_Dcd3 = 'Y' OR v_Prs_Dcd2 = 'Y' OR v_Prs_Dcd8 = 'Y' OR v_Prs_Dcd9 = 'Y'
           OR v_Prs_Dcd11 = 'Y' OR v_Prs_Dcd12 = 'Y' THEN
            v_Sms_Msg := '[넥센타이어] ';
              
            --엔진오일                      
            IF v_Prs_Dcd1 = 'Y' THEN
                v_Serv_Cntr1 := Pkg_Rtsd0013.f_sRtsd0013ServCntr2(v_Ord_No, 'B00001');
--                v_Sms_Msg := CUR.Cust_Nm || ' 고객님께서 신청하신 엔진오일 서비스가 처리 완료되었습니다. 고객님의 서비스 잔여횟수는 ' || v_Serv_Cntr1 || '회입니다. 안전운전하세요.';
                v_Sms_Msg := v_Sms_Msg||CUR.Cust_Nm||' 고객님께서 신청하신 엔진오일 서비스가 처리 완료되었습니다.';
                v_Sms_Msg := v_Sms_Msg||' 고객님의 서비스 잔여횟수는 엔진오일 '||v_Serv_Cntr1||'회입니다.';
                v_Sms_Msg := v_Sms_Msg||' ※서비스 과정중 불편한사항이 계셨다면 콜센터(1855-0100)으로 연락주세요. 감사합니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                
                v_templateCd := 'RENTAL00000000000032';
            END IF;
            
            --걱정제로
            IF v_Prs_Dcd6 = 'Y' THEN
                v_Serv_Cntr7 := Pkg_Rtsd0013.f_sRtsd0013ServCntr(v_Ord_No, 'B00007');
--                v_Sms_Msg := CUR.Cust_Nm || ' 고객님께서 신청하신 걱정제로 서비스가 처리 완료되었습니다. 고객님의 서비스 잔여횟수는 ' || v_Serv_Cntr7 || '회입니다. 안전운전하세요.';
                v_Sms_Msg := v_Sms_Msg||CUR.Cust_Nm||' 고객님께서 신청하신 타이어 무상교체 서비스가 처리 완료되었습니다.';   --[20210107_01]
                v_Sms_Msg := v_Sms_Msg||' 고객님의 서비스 잔여횟수는 사계절 보증제도 '||v_Serv_Cntr7||'회입니다.';
                v_Sms_Msg := v_Sms_Msg||' ※서비스 과정중 불편한사항이 계셨다면 콜센터(1855-0100)으로 연락주세요. 감사합니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                
                v_templateCd := 'RENTAL00000000000033';
            END IF;
            
            --방문점검
            IF v_Prs_Dcd3 = 'Y' THEN
                v_Sms_Msg := v_Sms_Msg||CUR.Cust_Nm||' 고객님 방문점검 서비스가 처리 완료되었습니다. ';
                v_Sms_Msg := v_Sms_Msg||' ※서비스 과정중 불편한사항이 계셨다면 콜센터(1855-0100)으로 연락주세요. 감사합니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                
                v_templateCd := 'RENTAL00000000000034';
            END IF;
            
            --위치교환
            IF v_Prs_Dcd2 = 'Y' THEN
                v_Serv_Cntr2 := Pkg_Rtsd0013.f_sRtsd0013ServCntr2(v_Ord_No, 'B00002');
                v_Sms_Msg := v_Sms_Msg||' '||CUR.Cust_Nm||' 고객님 위치교환 서비스가 처리 완료되었습니다. ';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                v_Sms_Msg := v_Sms_Msg||'고객님의 위치교환 서비스 잔여 회수는 '||v_Serv_Cntr2||'회입니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                v_Sms_Msg := v_Sms_Msg||'※ 서비스 과정중 불편한 사항이 계셨다면 콜센터(1855-0100)으로 연락주세요.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                v_Sms_Msg := v_Sms_Msg||'감사합니다.';
                
                v_templateCd := 'RENTAL00000000000035';
            END IF;
            
            --휠얼라인먼트
            IF v_Prs_Dcd8 = 'Y' THEN
                v_Serv_Cntr8 := Pkg_Rtsd0013.f_sRtsd0013ServCntr2(v_Ord_No, 'B00008');
                v_Sms_Msg := v_Sms_Msg||' '||CUR.Cust_Nm||' 고객님 휠얼라인먼트 교정 서비스가 처리 완료되었습니다. ';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                v_Sms_Msg := v_Sms_Msg||'고객님의 휠얼라인먼트 교정 서비스 잔여 회수는 '||v_Serv_Cntr8||'회입니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                v_Sms_Msg := v_Sms_Msg||'※ 서비스 과정중 불편한 사항이 계셨다면 콜센터(1855-0100)으로 연락주세요.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                v_Sms_Msg := v_Sms_Msg||'감사합니다.';
                
                v_templateCd := 'RENTAL00000000000036';
            END IF;
            
            --무상보증서비스
            IF v_Prs_Dcd11 = 'Y' OR v_Prs_Dcd12 = 'Y' THEN

                v_Sms_Msg := v_Sms_Msg||CUR.Cust_Nm||' 고객님께서 신청하신 무상보증 서비스가 처리 완료되었습니다.';   --[20210107_01]
                v_Sms_Msg := v_Sms_Msg||' ※서비스 과정중 불편한사항이 계셨다면 콜센터(1855-0100)으로 연락주세요. 감사합니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);

            END IF;
                        
            Pkg_Rtsd0205.p_Rtsd0205InterfaceNew('I', '00000000000000', CUR.Mob_No, '18550100', v_Sms_Msg, 'S009', '서비스완료안내', '2', v_templateCd, v_Id, v_Success_Code, v_Return_Message, v_ErrorText);  
            
            IF 0 != v_Success_Code THEN
                v_Return_Message := '문자메시지 발송 실패!!!'||'-'||v_Return_Message;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;  
        END IF;

    END LOOP;

    IF Cur_ServiceView%ISOPEN THEN
        CLOSE Cur_ServiceView;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001ServiceSign(2)', v_ErrorText, v_Return_Message);

  END p_InsertExif0001ServiceSign;


  /*****************************************************************************
  -- 윈터타이어 보관대상 조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterKeepTarget (
    v_Cust_Nm        IN  RTSD0100.CUST_NM%TYPE,    /*고객명                */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,  /*생년월일              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,     /*핸드폰번호            */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,     /*차량번호              */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

    e_Error     EXCEPTION;

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  B.ORD_NO,
            A.CUST_NM,
            A.BIRTH_DAY,
            A.MOB_NO,
            B.CAR_NO,
            D.SERV_CNT0,

            (   SELECT COUNT(*)
                FROM   RTCS0203 Z
                WHERE  Z.ORD_NO = B.ORD_NO
                AND    Z.SRSV_YN = 'Y' ) AS STRG_CNT,

            D.SERV_CNT0 * TO_NUMBER( NVL( C.CNT_CD, B.CNT_CD )) AS TR_SERV_CNT0,

            (   SELECT NVL(SUM( Y.TOT_TIRE_CNT ), 0)
                FROM   RTCS0203 Y
                WHERE  Y.ORD_NO = B.ORD_NO
                AND    Y.SRSV_YN = 'Y' ) AS TR_STRG_CNT,

            (   SELECT COUNT(*)
                FROM   RTCS0203 X
                WHERE  X.ORD_NO = B.ORD_NO
                AND    X.STRG_STAT = 'S' ) AS STRG_ING_CNT,

            DECODE(A.CUST_TP,'01',SUBSTR(A.BIRTH_DAY,3,6),SUBSTR(A.BUSL_NO,1,6)) ENC_CD /*암호화 코드         */

    FROM    RTSD0100 A, RTSD0104 B, RTSD0108 C, RTSD0013 D
    WHERE   A.CUST_NM LIKE '%'||v_Cust_Nm||'%'
    AND     A.BIRTH_DAY = DECODE( v_Birth_Day, NULL, A.BIRTH_DAY, v_Birth_Day )
    AND     A.MOB_NO    = DECODE( v_Mob_No, NULL, A.MOB_NO, v_Mob_No )
    AND     B.CAR_NO    = v_Car_No
    AND     A.CUST_NO   = B.CUST_NO
    AND     B.SEASON_CD = '02'
    AND     B.STAT_CD IN ('03', '04')
    AND     B.ORD_NO = C.ORD_NO(+)
    AND     ( C.OS_DAY >= TO_CHAR( SYSDATE, 'YYYYMMDD') OR C.OS_DAY IS NULL )
    AND     ( C.MFP_YN  = 'N' OR C.MFP_YN IS NULL )
    AND     B.ORD_NO    = D.ORD_NO
    AND     D.PRS_DCD   = 'B00004';


  END p_sExif0001WinterKeepTarget;


  /*****************************************************************************
  -- 윈터타이어 보관대상 창고조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterKeepWareh (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

    e_Error     EXCEPTION;
    v_Success_Code   NUMBER;
    v_Return_Message VARCHAR2(300);
    v_ErrorText      VARCHAR2(300);

  BEGIN


    Pkg_Rtcs0202.p_sRtcs0202UseAgencyWareh( Ref_Cursor, v_Agency_Cd,
                                            v_Success_Code, v_Return_Message, v_ErrorText);


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        Pkg_Utility.P_Errorfilewrite('Pkg_Exif0001.p_sExif0001WinterKeepDetail(1)', v_Errortext, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.P_Errorfilewrite('Pkg_Exif0001.p_sExif0001WinterKeepDetail(2)', v_Errortext, v_Return_Message);

  END p_sExif0001WinterKeepWareh;

  /*****************************************************************************
  -- 윈터타이어 보관처리 저장
  *****************************************************************************/
  PROCEDURE p_InsertExif0001WinterIn (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호            */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*고객코드            */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*보관여부            */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*대리점코드          */
    v_Wareh_Cd       IN VARCHAR2,                     /*창고코드            */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*보관일자            */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*보관증 수령방법     */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*보관증 PATH         */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*보관증 FILE 명      */
    v_Strg_User_Id   IN RTCS0203.STRG_USER_ID%TYPE,   /*보관처리 사용자ID   */
    v_Mf_Cd          IN VARCHAR2,                     /*타이어제조사        */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*패턴                */
    v_Selection_Width   IN RTCS0203.SELECTION_WIDTH%TYPE,      /*폭         */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*시리즈              */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*인치                */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*강도                */
    v_Tire_Cnt       IN VARCHAR2,                     /*수량                */
    v_Mf_Cd_F        IN VARCHAR2,                     /*타이어제조사(앞)    */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*패턴(앞)            */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,      /*폭(앞)   */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*시리즈(앞)          */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*인치(앞)            */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*강도(앞)            */
    v_Tire_Cnt_F     IN VARCHAR2,                     /*수량(앞)            */
    v_Mf_Cd_R        IN VARCHAR2,                     /*타이어제조사(뒤)    */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*패턴(뒤)            */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,      /*폭(뒤)   */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*시리즈(뒤)          */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*인치(뒤)            */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*강도(뒤)            */
    v_Tire_Cnt_R     IN VARCHAR2,                     /*수량(뒤)            */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error     EXCEPTION;
    v_Strg_Stat      RTCS0203.STRG_STAT%TYPE;         /*보관상태            */
    v_Srsv_Yn        RTCS0203.SRSV_YN%TYPE;           /*보관서비스적용여부  */

  BEGIN

    -- 필수입력 : 보관증 PATH, 보관증 FILE명은 필수 입력사항임
    IF (TRIM(v_Strg_File_Path) IS NULL)
    OR (TRIM(v_Strg_File_Name) IS NULL) THEN
        v_Return_Message := '보관증 FILE명('||v_Strg_File_Name||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '계약번호          ', v_Ord_No           );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '고객코드          ', v_Cust_No          );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '보관여부          ', v_Strg_Yn          );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '대리점코드        ', v_Agency_Cd        );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '창고코드          ', v_Wareh_Cd         );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '보관일자          ', v_Strg_Day         );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '보관증 수령방법   ', v_Strg_Mthd        );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '보관증 PATH       ', v_Strg_File_Path   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '보관증 FILE 명    ', v_Strg_File_Name   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '보관처리 사용자ID ', v_Strg_User_Id     );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '타이어제조사      ', v_Mf_Cd            );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '패턴              ', v_Pattern_Cd       );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '폭                ', v_Selection_Width  );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '시리즈            ', v_Aspect_Ratio     );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '인치              ', v_Wheel_Inches     );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '강도              ', v_Ply_Rating       );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '수량              ', v_Tire_Cnt         );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '타이어제조사(앞)  ', v_Mf_Cd_F          );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '패턴(앞)          ', v_Pattern_Cd_F     );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '폭(앞)            ', v_Selection_Width_F);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '시리즈(앞)        ', v_Aspect_Ratio_F   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '인치(앞)          ', v_Wheel_Inches_F   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '강도(앞)          ', v_Ply_Rating_F     );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '수량(앞)          ', v_Tire_Cnt_F       );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '타이어제조사(뒤)  ', v_Mf_Cd_R          );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '패턴(뒤)          ', v_Pattern_Cd_R     );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '폭(뒤)            ', v_Selection_Width_R);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '시리즈(뒤)        ', v_Aspect_Ratio_R   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '인치(뒤)          ', v_Wheel_Inches_R   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '강도(뒤)          ', v_Ply_Rating_R     );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '수량(뒤)          ', v_Tire_Cnt_R       );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(0)', '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');

    /*창고코드            */
    IF (v_Strg_Yn = 'Y') AND (TRIM(v_Wareh_Cd) IS NULL) THEN
        v_Return_Message := '창고코드('||v_Wareh_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    /*타이어제조사, 타이어제조사(앞), 타이어제조사(뒤)  */
    IF (v_Strg_Yn = 'Y') AND (TRIM(v_Mf_Cd) IS NULL) THEN
        IF (TRIM(v_Mf_Cd_F) IS NULL) AND (TRIM(v_Mf_Cd_R) IS NULL) THEN
            v_Return_Message := '타이어제조사, 타이어제조사(앞), 타이어제조사(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;


    /*패턴, 패턴(앞), 패턴(뒤)  */
    IF (v_Strg_Yn = 'Y') AND (TRIM(v_Pattern_Cd) IS NULL) THEN
        IF (TRIM(v_Pattern_Cd_F) IS NULL) AND (TRIM(v_Pattern_Cd_R) IS NULL) THEN
            v_Return_Message := '패턴, 패턴(앞), 패턴(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    /*시리즈, 시리즈(앞), 시리즈(뒤)  */
    IF (v_Strg_Yn = 'Y') AND (TRIM(v_Aspect_Ratio) IS NULL) THEN
        IF (TRIM(v_Aspect_Ratio_F) IS NULL) AND (TRIM(v_Aspect_Ratio_R) IS NULL) THEN
            v_Return_Message := '시리즈, 시리즈(앞), 시리즈(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    /*인치, 인치(앞), 인치(뒤)  */
    IF (v_Strg_Yn = 'Y') AND (TRIM(v_Wheel_Inches) IS NULL) THEN
        IF (TRIM(v_Wheel_Inches_F) IS NULL) AND (TRIM(v_Wheel_Inches_R) IS NULL) THEN
            v_Return_Message := '인치, 인치(앞), 인치(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    /*강도, 강도(앞), 강도(뒤)  */
    IF (v_Strg_Yn = 'Y') AND (TRIM(v_Ply_Rating) IS NULL) THEN
        IF (TRIM(v_Ply_Rating_F) IS NULL) AND (TRIM(v_Ply_Rating_R) IS NULL) THEN
            v_Return_Message := '강도, 강도(앞), 강도(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;

    /*수량, 수량(앞), 수량(뒤)  */
    IF (v_Strg_Yn = 'Y') AND (TRIM(v_Tire_Cnt) IS NULL) THEN
        IF (TRIM(v_Tire_Cnt_F) IS NULL) AND (TRIM(v_Tire_Cnt_R) IS NULL) THEN
            v_Return_Message := '수량, 수량(앞), 수량(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;


    IF v_Strg_Yn = 'Y' THEN
        v_Strg_Stat := 'S';
        v_Srsv_Yn   := 'Y';
    ELSE
        v_Strg_Stat := 'N';
        v_Srsv_Yn   := 'N';
    END IF;

    -- 저장 처리
    Pkg_Rtcs0203.p_Rtcs0203WinterIn (
                v_Ord_No, v_Cust_No, v_Strg_Yn, v_Strg_Stat,
                v_Srsv_Yn, v_Agency_Cd, v_Wareh_Cd, v_Strg_Day,
                v_Strg_Mthd, v_Strg_File_Path, v_Strg_File_Name,
                v_Mf_Cd, v_Pattern_Cd, v_Selection_Width, v_Aspect_Ratio,
                v_Wheel_Inches, v_Ply_Rating, v_Tire_Cnt,
                v_Mf_Cd_F, v_Pattern_Cd_F, v_Selection_Width_F, v_Aspect_Ratio_F,
                v_Wheel_Inches_F, v_Ply_Rating_F, v_Tire_Cnt_F,
                v_Mf_Cd_R, v_Pattern_Cd_R, v_Selection_Width_R, v_Aspect_Ratio_R,
                v_Wheel_Inches_R, v_Ply_Rating_R, v_Tire_Cnt_R,
                v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText
                 );

    IF  v_Success_Code <> 0 THEN
        v_Return_Message := '윈터타이어 보관 등록 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리 되었습니다';
    v_ErrorText := '';



    EXCEPTION
      WHEN e_Error THEN
       v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001WinterIn(2)', v_ErrorText, v_Return_Message);

  END p_InsertExif0001WinterIn;

  /*****************************************************************************
  -- 윈터타이어 출고대상 조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterDlvryTarget (
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,    /*고객명                */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,  /*생년월일              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,     /*핸드폰번호            */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,     /*차량번호              */
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,  /*대리점코드            */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

    e_Error     EXCEPTION;

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  C.ORD_NO,
            C.STRG_SEQ,
            A.CUST_NM,
            A.BIRTH_DAY,
            A.MOB_NO,
            B.CAR_NO,
            DECODE(A.CUST_TP,'01',SUBSTR(A.BIRTH_DAY,3,6),SUBSTR(A.BUSL_NO,1,6)) ENC_CD /*암호화 코드         */
    FROM    RTSD0100 A, RTSD0104 B, RTCS0203 C
    WHERE   A.CUST_NM   LIKE '%'||v_Cust_Nm||'%'
    AND     A.BIRTH_DAY = DECODE( v_Birth_Day, NULL, A.BIRTH_DAY, v_Birth_Day )
    AND     A.MOB_NO    = DECODE( v_Mob_No, NULL, A.MOB_NO, v_Mob_No )
    AND     A.CUST_NO   = B.CUST_NO
    AND     B.CAR_NO    = v_Car_No
    AND     B.ORD_NO    = C.ORD_NO
    AND     C.STRG_STAT = 'S'
    AND     C.AGENCY_CD = v_Agency_Cd;


  END p_sExif0001WinterDlvryTarget;

  /*****************************************************************************
  -- 윈터타이어 출고대상 상세조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterDlvryDetail (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

    e_Error     EXCEPTION;

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,
            A.STRG_SEQ,
            A.CUST_NO,
            C.CUST_NM,
            C.TEL_NO AS CUST_TEL_NO,
            C.MOB_NO AS CUST_MOB_NO,
            TRIM(
                Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S001', B.MAKER_CD) ||' '||
                Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S002', B.MODEL_CD) ||' '||
                Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S003', B.CONTENTS_CD) ||' '||
                Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S004', B.FR_CD) ) AS CAR_KIND,
            B.CAR_NO,
            A.AGENCY_CD,
            D.AGENCY_NM,
            D.MOB_NO AS AGENCY_MOB_NO,
            A.WAREH_CD,
            E.WAREH_NM,
            E.ADDR1 ||' '||E.ADDR2 AS ADDR,
            A.MF_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'C009', A.MF_CD ) AS MF_NM,
            A.PATTERN_CD,
            A.SELECTION_WIDTH,
            A.ASPECT_RATIO,
            A.WHEEL_INCHES,
            A.PLY_RATING,
            TO_NUMBER(A.TIRE_CNT) AS TIRE_CNT,
            A.MF_CD_F,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'C009', A.MF_CD_F ) AS MF_NM_F,
            A.PATTERN_CD_F,
            A.SELECTION_WIDTH_F,
            A.ASPECT_RATIO_F,
            A.WHEEL_INCHES_F,
            A.PLY_RATING_F,
            TO_NUMBER( A.TIRE_CNT_F ) AS TIRE_CNT_F,
            A.MF_CD_R,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'C009', A.MF_CD_R ) AS MF_NM_R,
            A.PATTERN_CD_R,
            A.SELECTION_WIDTH_R,
            A.ASPECT_RATIO_R,
            A.WHEEL_INCHES_R,
            A.PLY_RATING_R,
            TO_NUMBER( A.TIRE_CNT_R ) AS TIRE_CNT_R,
            TOT_TIRE_CNT,
            DECODE(C.CUST_TP,'01',SUBSTR(C.BIRTH_DAY,3,6), SUBSTR(C.BUSL_NO,1,6)) ENC_CD, /*암호화 코드         */
            TO_CHAR(SYSDATE, 'YYYYMMDD') INT_DAY
    FROM    RTCS0203 A, RTSD0104 B, RTSD0100 C, RTSD0007 D, RTCS0200 E
    WHERE   A.ORD_NO    = v_Ord_No
    AND     A.STRG_SEQ  = v_Strg_Seq
    AND     A.ORD_NO    = B.ORD_NO
    AND     A.CUST_NO   = C.CUST_NO
    AND     A.AGENCY_CD = D.AGENCY_CD
    AND     A.WAREH_CD  = E.WAREH_CD;


  END p_sExif0001WinterDlvryDetail;

  /*****************************************************************************
  -- 윈터타이어 출고처리 저장
  *****************************************************************************/
  PROCEDURE p_UpdateExif0001WinterOut (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*출고증 PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*출고증 FILE 명        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error     EXCEPTION;

    v_Srsv_Yn        RTCS0203.SRSV_YN%TYPE;           /*보관서비스적용여부    */


  BEGIN

    -- 필수입력 : 출고증 PATH, 출고증 FILE명은 필수 입력사항임
    IF (TRIM(v_Dlvr_File_Path) IS NULL)
    OR (TRIM(v_Dlvr_File_Name) IS NULL) THEN
        v_Return_Message := '출고증 FILE명('||v_Dlvr_File_Name||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 서비스 적용 여부는 기존 보관서비스내역의 있는 값으로 처리 한다.
    SELECT  SRSV_YN
    INTO    v_Srsv_Yn
    FROM    RTCS0203
    WHERE   ORD_NO   = v_Ord_No
    AND     STRG_SEQ = v_Strg_Seq;

    -- 저장 처리
    Pkg_Rtcs0203.p_Rtcs0203WinterOut (
                v_Ord_No, v_Strg_Seq, v_Srsv_Yn, v_Dlvr_Day,
                v_Dlvr_File_Path, v_Dlvr_File_Name,
                v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText
                 );

    IF  v_Success_Code <> 0 THEN
        v_Return_Message := '윈터타이어 출고 등록 실패!!!'||'-'||v_Errortext;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리 되었습니다';
    v_ErrorText := '';



    EXCEPTION
      WHEN e_Error THEN
       v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_UpdateExif0001WinterOut(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_UpdateExif0001WinterOut(2)', v_ErrorText, v_Return_Message);

  END p_UpdateExif0001WinterOut;


  /*****************************************************************************
  -- 윈터타이어 공통코드 콤보출력 조회용
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterComCombo (
    v_Temp            IN  VARCHAR2,
    v_C009_Cd_Nm      OUT VARCHAR2,           /*코드명 (보관증 용 타이어제조사            ) */
    v_C010_Cd_Nm      OUT VARCHAR2,           /*코드명 (보관증 용 단면폭                  ) */
    v_C011_Cd_Nm      OUT VARCHAR2,           /*코드명 (보관증 용 편평비                  ) */
    v_C012_Cd_Nm      OUT VARCHAR2,           /*코드명 (보관증 용 휠인치                  ) */
    v_C013_Cd_Nm      OUT VARCHAR2,           /*코드명 (보관증 용 PLY RATING (타이어 강도)) */
    v_C014_Cd_Nm      OUT VARCHAR2,           /*코드명 (윈터타이어 보관시 상태 값         ) */
    v_C016_Cd_Nm      OUT VARCHAR2,           /*코드명 (보관타이어수(전체)                ) */
    v_C017_Cd_Nm      OUT VARCHAR2            /*코드명 (보관타이어수(앞,뒤)               ) */
    ) IS
  BEGIN

    -- 선택:|코드:명|코드2:명2... 형태로 보내주면, '|'으로 Rows를 구분하여 콤보에 표시하고 ':'로 구분하여 코드값만 저장시 사용함

    /*  보관증 용 타이어제조사              */
    SELECT  '선택:|'||ListAgg(A.CD_NM||':'||A.CD, '|')  WITHIN GROUP(ORDER BY A.CD_GRP_CD, A.ORDER_PT, A.CD) CD_NM
    INTO    v_C009_Cd_Nm
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = 'C009'
    AND     A.USE_YN    = 'Y'
    ORDER   BY A.CD, A.ORDER_PT;


    /*  보관증 용 단면폭                    */
    SELECT  '선택:|'||ListAgg(A.CD_NM||':'||A.CD, '|')  WITHIN GROUP(ORDER BY A.CD_GRP_CD, A.ORDER_PT, A.CD) CD_NM
    INTO    v_C010_Cd_Nm
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = 'C010'
    AND     A.USE_YN    = 'Y'
    ORDER   BY A.CD, A.ORDER_PT;


    /*  보관증 용 편평비                    */
    SELECT  '선택:|'||ListAgg(A.CD_NM||':'||A.CD, '|')  WITHIN GROUP(ORDER BY A.CD_GRP_CD, A.ORDER_PT, A.CD) CD_NM
    INTO    v_C011_Cd_Nm
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = 'C011'
    AND     A.USE_YN    = 'Y'
    ORDER   BY A.CD, A.ORDER_PT;


    /*  보관증 용 휠인치                    */
    SELECT  '선택:|'||ListAgg(A.CD_NM||':'||A.CD, '|')  WITHIN GROUP(ORDER BY A.CD_GRP_CD, A.ORDER_PT, A.CD) CD_NM
    INTO    v_C012_Cd_Nm
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = 'C012'
    AND     A.USE_YN    = 'Y'
    ORDER   BY A.CD, A.ORDER_PT;


    /*  보관증 용 PLY RATING (타이어 강도)  */
    SELECT  '선택:|'||ListAgg(A.CD_NM||':'||A.CD, '|')  WITHIN GROUP(ORDER BY A.CD_GRP_CD, A.ORDER_PT, A.CD) CD_NM
    INTO    v_C013_Cd_Nm
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = 'C013'
    AND     A.USE_YN    = 'Y'
    ORDER   BY A.CD, A.ORDER_PT;


    /*  윈터타이어 보관시 상태 값           */
    SELECT  '선택: ,'||ListAgg(A.CD_NM||':'||A.CD, ',')  WITHIN GROUP(ORDER BY A.CD_GRP_CD, A.ORDER_PT, A.CD) CD_NM
    INTO    v_C014_Cd_Nm
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = 'C014'
    AND     A.USE_YN    = 'Y'
    ORDER   BY A.CD, A.ORDER_PT;


    /*  보관타이어수(전체)                  */
    SELECT  '선택:|'||ListAgg(A.CD_NM||':'||A.CD, '|')  WITHIN GROUP(ORDER BY A.CD_GRP_CD, A.ORDER_PT, A.CD) CD_NM
    INTO    v_C016_Cd_Nm
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = 'C016'
    AND     A.USE_YN    = 'Y'
    ORDER   BY A.CD, A.ORDER_PT;


    /*  보관타이어수(앞,뒤)                 */
    SELECT  '선택:|'||ListAgg(A.CD_NM||':'||A.CD, '|')  WITHIN GROUP(ORDER BY A.CD_GRP_CD, A.ORDER_PT, A.CD) CD_NM
    INTO    v_C017_Cd_Nm
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = 'C017'
    AND     A.USE_YN    = 'Y'
    ORDER   BY A.CD, A.ORDER_PT;


  END p_sExif0001WinterComCombo;


  /*****************************************************************************
  -- 윈터타이어 창고주소 조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterWarehNm(
    v_Wareh_Cd      IN  RTCS0200.WAREH_CD%TYPE,         /*창고코드            */
    v_Wareh_Addr    OUT VARCHAR                         /*창고주소            */
    ) IS

  BEGIN

    SELECT  ADDR1||' '||ADDR2 ADDR   /*창고주소            */
    INTO    v_Wareh_Addr
    FROM    RTCS0200
    WHERE   WAREH_CD  = v_Wareh_Cd
    AND     USE_YN    = 'Y';

  END p_sExif0001WinterWarehNm;


  /*****************************************************************************
  -- 윈터타이어 보관대상 상세조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterKeepDetail (
    v_Ord_No         IN  RTSD0104.ORD_NO%TYPE,        /*계약번호              */
    v_Agency_Cd      IN  RTSD0007.AGENCY_CD%TYPE,     /*대리점코드            */
    v_Cust_No        OUT RTSD0100.CUST_NO%TYPE,       /*고객코드              */
    v_Cust_Nm        OUT RTSD0100.CUST_NM%TYPE,       /*고객명                */
    v_Car_Kind       OUT VARCHAR2,                    /*차종                  */
    v_Cust_Tel_No    OUT RTSD0100.TEL_NO%TYPE,        /*고객 자택번호         */
    v_Car_No         OUT RTSD0104.CAR_NO%TYPE,        /*차량번호              */
    v_Cust_Mob_No    OUT RTSD0100.MOB_NO%TYPE,        /*고객 핸드폰번호       */
    v_Agency_Nm      OUT RTSD0007.AGENCY_NM%TYPE,     /*대리점명              */
    v_Agency_Mob_No  OUT RTSD0007.MOB_NO%TYPE,        /*대리점 핸드폰번호     */
    v_Wareh_Nm       OUT VARCHAR2,                    /*보관창고명:코드;주소  */
    v_Wareh_Addr     OUT VARCHAR2,                    /*창고주소              */
    v_Int_Day        OUT VARCHAR2,                    /*시스템일자            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Wareh_Cd  RTCS0200.WAREH_CD%TYPE DEFAULT NULL;  /*창고코드              */
    v_Wareh_Cnt NUMBER DEFAULT 0;
    e_Error     EXCEPTION;

  BEGIN

    SELECT  B.CUST_NO,
            B.CUST_NM,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S001', A.MAKER_CD) ||' '||
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S002', A.MODEL_CD) ||' '||
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S003', A.CONTENTS_CD) ||' '||
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S004', A.FR_CD) AS CAR_KIND,
            B.TEL_NO AS CUST_TEL_NO,
            A.CAR_NO,
            B.MOB_NO  AS CUST_NOB_NO,
            TO_CHAR(SYSDATE, 'YYYYMMDD') INT_DAY
    INTO    v_Cust_No, v_Cust_Nm, v_Car_Kind, v_Cust_Tel_No,
            v_Car_No,  v_Cust_Mob_No, v_Int_Day
    FROM    RTSD0104 A, RTSD0100 B
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.CUST_NO = B.CUST_NO;

    SELECT  AGENCY_NM,
            MOB_NO
    INTO    v_Agency_Nm, v_Agency_Mob_No
    FROM    RTSD0007
    WHERE   AGENCY_CD = v_Agency_Cd;

    -- 보관지명:코드;주소|보관지명2:코드2;주소2
    SELECT  ListAgg(B.WAREH_NM||':'||A.WAREH_CD||';'||B.ADDR1||' '||B.ADDR2, '|')  WITHIN GROUP(ORDER BY B.WAREH_CD) WAREH_NM,
            COUNT(*) Wareh_Cnt,
            TO_CHAR(MIN(B.WAREH_CD)) Wareh_Cd
    INTO    v_Wareh_Nm, v_Wareh_Cnt, v_Wareh_Cd
    FROM    RTCS0202 A, RTCS0200 B
    WHERE   A.AGENCY_CD = v_Agency_Cd
    AND     A.WAREH_CD  = B.WAREH_CD
    AND     A.USE_YN    = 'Y'
    AND     B.USE_YN    = 'Y';

    -- 불필요부분 - 삭제가능
    IF (v_Wareh_Cnt = 1) THEN
        SELECT  ADDR1||' '||ADDR2 ADDR   /*창고주소            */
        INTO    v_Wareh_Addr
        FROM    RTCS0200
        WHERE   WAREH_CD  = v_Wareh_Cd
        AND     USE_YN    = 'Y';
    END IF;


    v_Success_Code := 0;
    v_Return_Message := '정상적으로 조회 되었습니다.!';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_Errortext := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_Errortext);
        Pkg_Utility.P_Errorfilewrite('Pkg_Exif0001.p_sExif0001WinterKeepDetail(1)', v_Errortext, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_Errorfilewrite('Pkg_Exif0001.p_sExif0001WinterKeepDetail(2)', v_Errortext, v_Return_Message);

  END p_sExif0001WinterKeepDetail;



END Pkg_Exif0001;