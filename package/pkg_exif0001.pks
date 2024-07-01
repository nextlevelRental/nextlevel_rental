CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Exif0001 AS
/*******************************************************************************
   NAME:      Pkg_EXIF0001
   PURPOSE   외부시스템 인터페이스 - 전자서명(트리포스)

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-07  jemcarry         1. Created this package body.
*******************************************************************************/

    
  /*****************************************************************************
  -- 0) PAD 로그인시 사용자 정보 조회
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
    );
    
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
    );
    
  /*****************************************************************************
  -- 0) PAD 로그인시 사용자 정보 조회
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
    );
        
        
  /*****************************************************************************
  -- 1) 정보동의-대상조회
  *****************************************************************************/
  PROCEDURE p_sExif0001CustInfo (
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    );
    
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
    v_Cag_Yn5        IN RTSD0111.CAG_YN5%TYPE,        /*선택동의1-주소(우편)  */
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
    );
    
  /*****************************************************************************
  -- 2) 정보동의-대상조회
  *****************************************************************************/
  PROCEDURE p_sExif0001OrdInfoList (
    v_Ord_FDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 시작) */
    v_Ord_EDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 종료) */
    v_Id             IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    Ref_Cursor       IN OUT SYS_REFCURSOR 
    );

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
    );
    
  /*****************************************************************************
  -- 3) 장착,폐기위탁 - 대상조회, 기본정보
  *****************************************************************************/
  PROCEDURE p_sExif0001ProcInfoList (
    v_Ord_FDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 시작) */
    v_Ord_EDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 종료) */
    v_Id             IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    );
   
  /*****************************************************************************
  -- 3) 장착,폐기위탁 서명완료 등록
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
    );
    
  /*****************************************************************************
  -- 4) 서비스 확인서 - 대상조회, 기본정보
  *****************************************************************************/
  PROCEDURE p_sExif0001ServiceList (
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Proc_FDay      IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(작업일자시작)*/
    v_Prpc_EDay      IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(작업일자종료)*/
    v_Id             IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    );
    
  /*****************************************************************************
  -- 4) 서비스 확인서 서명완료 등록
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
    v_Prs_Dcd8       IN RTSD0114.PRS_DCD8%TYPE,       /*서비스명8_얼라인먼트 */    
    v_Prs_Dcd9       IN RTSD0114.PRS_DCD9%TYPE,       /*서비스명9_무상얼라인먼트 */    
    v_Prs_Dcd10      IN RTSD0114.PRS_DCD10%TYPE,      /*서비스명10_Nexen Check */
    v_Prs_Dcd11      IN RTSD0114.PRS_DCD11%TYPE,      /*서비스명11_조기마모파손보증 */
    v_Prs_Dcd12      IN RTSD0114.PRS_DCD12%TYPE,      /*서비스명12_파손보증 */
    v_A_Mileage      IN RTSD0114.A_MILEAGE%TYPE,      /*주행거리(마일리지)    */
    v_Std_Ym         IN RTCS0005.STD_YM%TYPE,         /*기준년월              */
    v_Job_Seq        IN RTCS0005.JOB_SEQ%TYPE,        /*작업순번              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

    
  /*****************************************************************************
  -- 윈터타이어 보관대상 조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterKeepTarget (
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,    /*고객명                */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,  /*생년월일              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,     /*핸드폰번호            */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,     /*차량번호              */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) ;
    
  /*****************************************************************************
  -- 윈터타이어 보관대상 창고조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterKeepWareh (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) ;
  
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
    );

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
    ) ;

  /*****************************************************************************
  -- 윈터타이어 출고대상 상세조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterDlvryDetail (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,     /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,   /*보관순번              */
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) ;

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
    v_ErrorText      OUT VARCHAR2    ) ;


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
    );

  /*****************************************************************************
  -- 윈터타이어 창고주소 조회
  *****************************************************************************/
  PROCEDURE p_sExif0001WinterWarehNm(
    v_Wareh_Cd      IN  RTCS0200.WAREH_CD%TYPE,         /*창고코드            */
    v_Wareh_Addr    OUT VARCHAR                         /*창고주소            */
    );
       
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
    );

    
END Pkg_Exif0001;
/
