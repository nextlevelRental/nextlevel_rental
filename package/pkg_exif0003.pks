CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Exif0003 AS
/*******************************************************************************
   NAME:      Pkg_Exif0003
   PURPOSE   외부시스템 인터페이스 - 모바일앱

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2017-01-02                   1. Created this package body.
   1.9        2021-11-22  kstka            [20211122_01] kstka 걱정제로 수령여부 컬럼 추가
*******************************************************************************/
  /*****************************************************************************
  -- 0) PAD 로그인시 사용자 정보 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003PadLoginInfo (
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
    v_Chain_Yn       OUT VARCHAR2,                     /*직영도매 거래선       */
    v_Free_Rental_Yn OUT VARCHAR2,                     /*자유렌탈 상품 노출 여부 */
    v_O2O_Agency_Yn  OUT VARCHAR2,                     /*O2O거점여부 */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
    
  /*****************************************************************************
  -- 고객정보 조회
  -- - 정보제공동의 대상여부 포함
  *****************************************************************************/
  PROCEDURE p_sExif0003CustInfo (
      v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*고객명/법인명         */
    , v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE     /*법정생년월일          */
    , v_Mob_No         IN RTSD0100.MOB_NO%TYPE        /*휴대폰번호            */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 통합 계약서 정보조회
  *****************************************************************************/
  PROCEDURE p_sExif0003OrdInfoList (
    v_Ord_FDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 시작) */
    v_Ord_EDay       IN RTSD0104.ORD_DAY%TYPE,        /*조회일자(계약일 종료) */
    v_Id             IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Type       IN VARCHAR2,                  /*사용구분 (01:최초발송, 02:재발송)*/
    Ref_Cursor       IN OUT SYS_REFCURSOR 
  );
  
  /*****************************************************************************
  -- 통합 계약서/장착완료 서명완료 등록
  *****************************************************************************/
  PROCEDURE p_InsertExif0003Sign (
    v_Ord_No         IN VARCHAR2,       /*계약번호              */
    v_Cmsag_Yn       IN VARCHAR2,       /*CMS출금이체동의       */
    v_Con_Mthd       IN VARCHAR2,       /*계약서 교부방법       */
    v_Proc_Day       IN VARCHAR2,       /*장착일자              */
    v_Td_Yn          IN VARCHAR2,       /*기존타이어 폐기위탁 동의*/
    v_Id             IN VARCHAR2,       /*등록자 ID             */
    v_Input_Dt       IN VARCHAR2,       /*PAD입력일시           */
    v_File_Path      IN VARCHAR2,       /*개인정보 제공동의서 파*/
    v_File_Name      IN VARCHAR2,       /*개인정보 제공동의서 파*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );

    /*****************************************************************************
    -- 추가점검사항 IUD
    *****************************************************************************/
    PROCEDURE p_IUDRtcs0011 (
        v_Comm_Dvsn     IN CHAR,
        v_Ord_No        IN RTCS0011.ORD_NO%TYPE,        /*주문번호            */
        v_Reg_Day       IN RTCS0011.REG_DAY%TYPE,       /*등록일              */
        v_Prs_Dcd       IN RTCS0011.PRS_DCD%TYPE,       /*상세서비스          */
        v_Eng_Oil_Qty   IN RTCS0011.ENG_OIL_QTY%TYPE,   /*엔진오일량          */
        v_Eng_Oil_Pol   IN RTCS0011.ENG_OIL_POL%TYPE,   /*엔진오일오염도      */
        v_Water_Chk     IN RTCS0011.WATER_CHK%TYPE,     /*냉각수부동액체크    */
        v_Washer_Qty    IN RTCS0011.WASHER_QTY%TYPE,    /*워셔액              */
        v_Battery_Vol   IN RTCS0011.BATTERY_VOL%TYPE,   /*배터리전압          */
        v_Lamp_Chk      IN RTCS0011.LAMP_CHK%TYPE,      /*등화장치체크        */
        v_Skid_Depth_Fl IN RTCS0011.SKID_DEPTH_FL%TYPE, /*잔여수명_앞좌       */
        v_Skid_Depth_Fl2 IN RTCS0011.SKID_DEPTH_FL2%TYPE, /*잔여수명_앞좌2    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fl3 IN RTCS0011.SKID_DEPTH_FL3%TYPE, /*잔여수명_앞좌3    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fl4 IN RTCS0011.SKID_DEPTH_FL4%TYPE, /*잔여수명_앞좌4    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fr IN RTCS0011.SKID_DEPTH_FR%TYPE, /*잔여수명_앞우       */
        v_Skid_Depth_Fr2 IN RTCS0011.SKID_DEPTH_FR2%TYPE, /*잔여수명_앞우2    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fr3 IN RTCS0011.SKID_DEPTH_FR3%TYPE, /*잔여수명_앞우3    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fr4 IN RTCS0011.SKID_DEPTH_FR4%TYPE, /*잔여수명_앞우4    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rl IN RTCS0011.SKID_DEPTH_RL%TYPE, /*잔여수명_뒤좌       */
        v_Skid_Depth_Rl2 IN RTCS0011.SKID_DEPTH_RL2%TYPE, /*잔여수명_뒤좌2    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rl3 IN RTCS0011.SKID_DEPTH_RL3%TYPE, /*잔여수명_뒤좌3    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rl4 IN RTCS0011.SKID_DEPTH_RL4%TYPE, /*잔여수명_뒤좌4    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rr IN RTCS0011.SKID_DEPTH_RR%TYPE, /*잔여수명_뒤우       */
        v_Skid_Depth_Rr2 IN RTCS0011.SKID_DEPTH_RR2%TYPE, /*잔여수명_뒤우2    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rr3 IN RTCS0011.SKID_DEPTH_RR3%TYPE, /*잔여수명_뒤우3    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rr4 IN RTCS0011.SKID_DEPTH_RR4%TYPE, /*잔여수명_뒤우4    고도화 요건 추가 20181218*/
        v_Mileage       IN RTCS0011.MILEAGE%TYPE,       /*주행거리            */
        v_Remark        IN RTCS0011.REMARK%TYPE,        /*특이사항            */
        v_Reg_Id        IN RTCS0011.REG_ID%TYPE,        /*등록자ID            */
        v_Success_Code   OUT NUMBER,
        v_Return_Message OUT VARCHAR2,
        v_ErrorText      OUT VARCHAR2
    );    
    
    /*****************************************************************************
    -- 추가점검사항 Insert
    *****************************************************************************/
    FUNCTION f_InsertRtcs0011 (
        v_Ord_No        IN RTCS0011.ORD_NO%TYPE,        /*주문번호            */
        v_Seq           IN RTCS0011.SEQ%TYPE,           /*순서                */
        v_Reg_Day       IN RTCS0011.REG_DAY%TYPE,       /*등록일              */
        v_Prs_Dcd       IN RTCS0011.PRS_DCD%TYPE,       /*상세서비스          */
        v_Eng_Oil_Qty   IN RTCS0011.ENG_OIL_QTY%TYPE,   /*엔진오일량          */
        v_Eng_Oil_Pol   IN RTCS0011.ENG_OIL_POL%TYPE,   /*엔진오일오염도      */
        v_Water_Chk     IN RTCS0011.WATER_CHK%TYPE,     /*냉각수부동액체크    */
        v_Washer_Qty    IN RTCS0011.WASHER_QTY%TYPE,    /*워셔액              */
        v_Battery_Vol   IN RTCS0011.BATTERY_VOL%TYPE,   /*배터리전압          */
        v_Lamp_Chk      IN RTCS0011.LAMP_CHK%TYPE,      /*등화장치체크        */
        v_Skid_Depth_Fl IN RTCS0011.SKID_DEPTH_FL%TYPE, /*잔여수명_앞좌       */
        v_Skid_Depth_Fl2 IN RTCS0011.SKID_DEPTH_FL2%TYPE, /*잔여수명_앞좌2    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fl3 IN RTCS0011.SKID_DEPTH_FL3%TYPE, /*잔여수명_앞좌3    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fl4 IN RTCS0011.SKID_DEPTH_FL4%TYPE, /*잔여수명_앞좌4    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fr IN RTCS0011.SKID_DEPTH_FR%TYPE, /*잔여수명_앞우       */
        v_Skid_Depth_Fr2 IN RTCS0011.SKID_DEPTH_FR2%TYPE, /*잔여수명_앞우2    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fr3 IN RTCS0011.SKID_DEPTH_FR3%TYPE, /*잔여수명_앞우3    고도화 요건 추가 20181218*/
        v_Skid_Depth_Fr4 IN RTCS0011.SKID_DEPTH_FR4%TYPE, /*잔여수명_앞우4    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rl IN RTCS0011.SKID_DEPTH_RL%TYPE, /*잔여수명_뒤좌       */
        v_Skid_Depth_Rl2 IN RTCS0011.SKID_DEPTH_RL2%TYPE, /*잔여수명_뒤좌2    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rl3 IN RTCS0011.SKID_DEPTH_RL3%TYPE, /*잔여수명_뒤좌3    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rl4 IN RTCS0011.SKID_DEPTH_RL4%TYPE, /*잔여수명_뒤좌4    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rr IN RTCS0011.SKID_DEPTH_RR%TYPE, /*잔여수명_뒤우       */
        v_Skid_Depth_Rr2 IN RTCS0011.SKID_DEPTH_RR2%TYPE, /*잔여수명_뒤우2    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rr3 IN RTCS0011.SKID_DEPTH_RR3%TYPE, /*잔여수명_뒤우3    고도화 요건 추가 20181218*/
        v_Skid_Depth_Rr4 IN RTCS0011.SKID_DEPTH_RR4%TYPE, /*잔여수명_뒤우4    고도화 요건 추가 20181218*/
        v_Mileage       IN RTCS0011.MILEAGE%TYPE,       /*주행거리            */
        v_Remark        IN RTCS0011.REMARK%TYPE,        /*특이사항            */
        v_Reg_Id        IN RTCS0011.REG_ID%TYPE,        /*등록자ID            */
        v_ErrorText     OUT VARCHAR2
        ) RETURN NUMBER;
    
    /*****************************************************************************
    -- 추가점검사항 순번 채번
    *****************************************************************************/
    FUNCTION f_sRtcs0011Seq(
        v_Ord_No IN RTCS0011.ORD_NO%TYPE
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 대리점 홈 작업예정 건수 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003AgencyTodoCnt (
      v_User_Id        IN RTCM0001.USER_ID%TYPE     /* 접속ID                 */
    , v_Req_Ym         IN VARCHAR2                  /* 조회년월               */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 대리점 계약목록 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003AgencyOrdList (
      v_User_Id        IN RTCM0001.USER_ID%TYPE     /* 접속ID                 */
    , v_Div_Cd         IN VARCHAR2                  /* 조회조건 구분 (0:완료건 포함 전건 조회, 1:TO-DO 건만 조회) */
    , v_Req_Day_F      IN VARCHAR2                  /* 조회기간(from)         */
    , v_Req_Day_T      IN VARCHAR2                  /* 조회기간(to)           */
    , v_Cust_Nm        IN VARCHAR2                  /* 고객명                 */
    , v_Car_No         IN VARCHAR2                  /* 차량번호               */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );      
  
  /*****************************************************************************
  -- 방문점검이력
  *****************************************************************************/
  PROCEDURE p_sExif0003HomeSrvHistList (
      Ref_Cursor       IN OUT SYS_REFCURSOR          
    , v_Ord_No         IN VARCHAR2                  /* 주문번호 */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 계약서, 장착확인서 구분 조회
  -- - DOC_TYPE = A:기존 계약서, 장착확인서, B:신규 통합 계약서, C:B2B일시불 장착확인서only
  -- - CUST_TP = 01:개인고객, 02:사업자고객
  *****************************************************************************/
  PROCEDURE p_sExif0003FormDiv (
      v_Ord_No         IN VARCHAR2                                /* 계약번호 */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 보관내역 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003StorageList (
      v_Cust_Nm        IN VARCHAR2                              /* 고객명     */
    , v_Car_No         IN VARCHAR2                              /* 차량번호   */
    , v_Agency_Cd      IN VARCHAR2                              /* 대리점코드 */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 로디안 방문점검 예정건 일자별 카운트
  *****************************************************************************/
  PROCEDURE p_sExif0003MrTodoCnt (
      v_User_Id        IN VARCHAR2                              /* 접속ID     */
    , v_Req_Ym         IN VARCHAR2                              /* 조회년월   */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 로디안 방문점검 TO-DO 목록 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003MrTodoList (
      v_User_Id        IN RTCM0001.USER_ID%TYPE     /* 접속ID                 */
    , v_Div_Cd         IN VARCHAR2                  /* 조회조건 구분 (0:완료건 포함 전건 조회, 1:TO-DO 건만 조회) */
    , v_Req_Day_F      IN VARCHAR2                  /* 조회기간(from)         */
    , v_Req_Day_T      IN VARCHAR2                  /* 조회기간(to)           */
    , v_Cust_Nm        IN VARCHAR2                  /* 고객명                 */
    , v_Car_No         IN VARCHAR2                  /* 차량번호               */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 로디안 방문점검 상세정보 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003MrDetail (
      v_Std_Ym        IN RTCS0005.STD_YM%TYPE       /* 기준년월               */
    , v_Ord_No        IN RTCS0005.ORD_NO%TYPE       /* 계약번호               */
    , v_Equ_No        IN RTCS0005.EQU_NO%TYPE       /* 설비번호               */
    , v_Job_Seq       IN RTCS0005.JOB_SEQ%TYPE      /* 작업순번               */
    , v_Seq           IN RTCS0006.SEQ%TYPE          /* 순번                   */
    , Ref_Cursor      IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 모바일앱 SMS발송
  *****************************************************************************/
  PROCEDURE p_iExif0003SendSms (
      v_Sms_Div        IN VARCHAR2                         /* SMS발송구분     */
    , v_Cust_No        IN VARCHAR2                         /* 고객번호        */
    , v_Ord_No         IN VARCHAR2                         /* 주문번호        */
    , v_In_Val         IN VARCHAR2                         /* 입력값          */
    , v_Rcv_No         IN VARCHAR2                         /* 받는 전화번호   */
    , v_Snd_No         IN VARCHAR2                         /* 보내는 전화번호 */
    , v_User_Id        IN VARCHAR2                         /* 접속ID(발신자)  */
    , v_tmplateNo      IN VARCHAR2                         /* 템플릿 넘버 추가*/
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 공지사항 목록조회
  *****************************************************************************/
  PROCEDURE p_sExif0003NoticeList (
      v_Page_No        IN NUMBER                         /* 페이지            */
    , v_Get_Cnt        IN NUMBER                         /* 페이지당 공지건수 */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 공지사항 상세내용 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003NoticeDetail (
      v_Ntc_Seq        IN NUMBER                         /* 공지순번          */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 공지사항 첨부파일 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003NoticeFile (
      v_Ntc_Seq        IN NUMBER                         /* 공지순번          */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 고객정보 동의 여부 확인 2018-12-13 고도화 계약목록조회 시 고객 동의여부 체크
  *****************************************************************************/
  FUNCTION f_Exif0003UseAccChkYN(
    v_Cust_No IN  RTSD0111.CUST_NO%TYPE                     /*고객번호        */
  ) RETURN VARCHAR;
  
  /*****************************************************************************
  -- 고객정보 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003CustInfoDtl (
      v_Cust_No        IN VARCHAR2                              /* 고객번호   */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 고객/회원정보 저장
  *****************************************************************************/
  PROCEDURE p_saveExif0003CustInfo (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN OUT VARCHAR2,    /*고객번호              */
    v_Cust_Tp        IN RTSD0100.CUST_TP%TYPE,        /*고객유형              */
    v_Cust_Tp2       IN RTSD0100.CUST_TP2%TYPE,       /*고객분류              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE,      /*법정생년월일          */
    v_Gender_Cd      IN RTSD0100.GENDER_CD%TYPE,      /*성별                  */
    v_Lf_Cd          IN RTSD0100.LF_CD%TYPE,          /*내외국인              */
    v_Mob_No         IN VARCHAR2,         /*휴대폰번호            */
    v_Mob_Firm       IN RTSD0100.MOB_FIRM%TYPE,       /*통신사                */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Fax_No         IN RTSD0100.FAX_NO%TYPE,         /*팩스번호              */
    v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTSD0100.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTSD0100.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTSD0100.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTSD0100.TEL_NO2%TYPE,        /*보조주소-전화번호     */
    v_Bld_Mng_No2    IN RTSD0100.BLD_MNG_NO2%TYPE,    /*보조주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTSD0100.POS_CD2%TYPE,        /*보조주소-우편번호     */
    v_Addr1_2        IN RTSD0100.ADDR1_2%TYPE,        /*보조주소-주소         */
    v_Addr2_2        IN RTSD0100.ADDR2_2%TYPE,        /*보조주소-상세주소     */
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*인증번호              */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE,        /*사업자번호            */
    v_Corp_No        IN RTSD0100.CORP_NO%TYPE,        /*법인번호              */
    v_Rep_Nm         IN RTSD0100.REP_NM%TYPE,         /*대표자명              */
    v_O_Custnm       IN RTSD0100.O_CUSTNM%TYPE,       /*사업주명              */
    v_O_Birthday     IN RTSD0100.O_BIRTHDAY%TYPE,     /*사업주 법정생년월일   */
    v_O_Gendercd     IN RTSD0100.O_GENDERCD%TYPE,     /*사업주 성별           */
    v_O_Lfcd         IN RTSD0100.O_LFCD%TYPE,         /*사업주 내외국인       */
    v_O_Mobno        IN RTSD0100.O_MOBNO%TYPE,        /*사업주 휴대폰번호     */
    v_O_Safekey      IN RTSD0100.O_SAFEKEY%TYPE,      /*사업주 인증번호       */
    v_C_Custnm       IN RTSD0100.C_CUSTNM%TYPE,       /*담당자 명             */
    v_C_Telno        IN RTSD0100.C_TELNO%TYPE,        /*담당자 전화번호       */
    v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE,     /*E-Mail주소            */
    v_Busi_Type      IN RTSD0100.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0100.BUSI_COND%TYPE,      /*업태                  */
    v_Tax_Yn         IN RTSD0100.TAX_YN%TYPE,         /*개인사업자 면세여부   */
    v_Kunnr          IN RTSD0100.KUNNR%TYPE,          /*SAP고객번호           */
    v_Ci_Cd          IN RTSD0100.CI_CD%TYPE,          /*CI                    */
    v_Di_Cd          IN RTSD0100.DI_CD%TYPE,          /*DI                    */
    v_Vn_Val         IN VARCHAR2,                     /*가상주민번호(ipin)    */
    v_Use_Yn         IN RTSD0100.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Custno_Onl     OUT NUMBER,                      /*온라인 회원번호       */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 사용자정보 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003UserInfo (
      v_User_Id        IN VARCHAR2                              /* 접속자ID   */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 주문 시 패턴콤보 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003PtnList (
      v_Class_Cd       IN VARCHAR2                              /* 차량분류   */
    , v_Model_Cd       IN VARCHAR2                              /* 차종코드   */ 
    , v_Contents_Cd    IN VARCHAR2                              /* 사양코드   */
    , v_Fr_Cd          IN VARCHAR2                              /* 전후 구분 코드 F:전륜, R:후륜, Z:범용  20181221 고도화추가*/
    , v_Sale_Cd        IN VARCHAR2                              /* 상품코드 20200428 kstka  */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 서비스확인서 정보 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003ServiceList (
      v_Car_No         IN RTSD0108.CAR_NO%TYPE         /*차량번호              */
    , v_Proc_FDay      IN RTSD0104.ORD_DAY%TYPE        /*조회일자(작업일자시작)*/
    , v_Prpc_EDay      IN RTSD0104.ORD_DAY%TYPE        /*조회일자(작업일자종료)*/
    , v_Id             IN RTCM0001.USER_ID%TYPE        /*사용자 아이디         */
    , v_Ord_no         IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    , v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE        /*서비스코드              */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  /*****************************************************************************
  -- 쇼핑몰 회원 중복 가입체크
  *****************************************************************************/
  FUNCTION f_Exif0003CustDupe(
    v_DI            IN RTSD0100.DI_CD%TYPE          /*DI                */
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 고객 주소 및 이메일 변경
  *****************************************************************************/
  PROCEDURE p_updateExif0003CustAddr (
      v_Cust_No        IN OUT VARCHAR2    /*고객번호              */    
    , v_Bld_Mng_No     IN RTSD0100.BLD_MNG_NO%TYPE     /*고객주소-우편번호PK(건*/
    , v_Pos_Cd         IN RTSD0100.POS_CD%TYPE         /*고객주소-우편번호     */
    , v_Addr1          IN RTSD0100.ADDR1%TYPE          /*고객주소-주소         */
    , v_Addr2          IN RTSD0100.ADDR2%TYPE          /*고객주소-상세주소     */ 
    , v_Email_Addr     IN RTSD0100.EMAIL_ADDR%TYPE     /*E-Mail주소            */   
    , v_Reg_Id         IN RTSD0100.REG_ID%TYPE         /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
    
  FUNCTION f_sExif0003GetExistContract(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE         /*채널구분              */
   ) RETURN VARCHAR2;
  
  /*****************************************************************************
  -- 프리미엄서비스 정보 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2017-04-24  kstka            신규생성
  *****************************************************************************/
  PROCEDURE p_sExif0003PremiumList (
      v_Ord_No         IN RTSD0013.ORD_NO%TYPE         /*주문번호              */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
  PROCEDURE p_sExif0003ReRentalInfo (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_Cust_No           IN VARCHAR2,
    v_Safe_Key          IN VARCHAR2,
    v_Success_code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  );
  
  /*****************************************************************************
 -- 프리미엄 서비스 조회
 *****************************************************************************/
  PROCEDURE p_sExif0003Srvc (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Sale_Cd            IN RTSD0020.SALE_CD%TYPE,      /* 판매코드         */
      v_Period_Cd          IN RTSD0012.PERIOD_CD%TYPE,    /* 기간코드         */
      v_Cnt_Cd             IN RTSD0012.CNT_CD%TYPE        /* 타이어본수       */
    ) ;

  /*****************************************************************************
  -- 계약 정보 고객 실휴대폰 번호 Update 20181220 고도화 추가
  *****************************************************************************/
  FUNCTION f_sExif0003Rtsd0104RMNUpdate (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Real_Mob_No    IN RTSD0104.C_REAL_MOB_NO%TYPE,  /*고객 실 휴대폰 번호   */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 방문장착 홈 작업예정 건수 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003InstallTodoCnt (
      v_User_Id        IN RTCM0001.USER_ID%TYPE     /* 접속ID                 */
    , v_Req_Ym         IN VARCHAR2                  /* 조회년월               */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  );
  
 /*****************************************************************************
  -- 방문장착 계약 정보 Select 빠져있어서 추가
  *****************************************************************************/
  PROCEDURE p_sExif0003InstallTodoList (
      v_User_Id        IN RTCM0001.USER_ID%TYPE     /* 접속ID                 */
    , v_Div_Cd         IN VARCHAR2                  /* 조회조건 구분 (0:완료건 포함 전건 조회, 1:TO-DO 건만 조회) */
    , v_Req_Day_F      IN VARCHAR2                  /* 조회기간(from)         */
    , v_Req_Day_T      IN VARCHAR2                  /* 조회기간(to)           */
    , v_Cust_Nm        IN VARCHAR2                  /* 고객명                 */
    , v_Car_No         IN VARCHAR2                  /* 차량번호               */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 방문장착 계약 정보 Select
 
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0       2018-11-26  김선태           방문장착 주문 상세내역 조회   
  *****************************************************************************/
  PROCEDURE p_sExif0003InstallOrdInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Fday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자FROM          */
    v_Ord_Tday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자TO            */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Proc_Fday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자FROM          */
    v_Proc_Tday      IN RTSD0104.PROC_DAY%TYPE,        /*장착일자TO            */
    v_Mob_No      IN RTSD0100.MOB_NO%TYPE,        /*핸드폰번호  20160407추가 한승훈     */
    v_Reg_Id      IN RTSD0100.REG_ID%TYPE        /*조회자ID  20181031추가 김선태     */
   );
     
   /*****************************************************************************
  -- 거점코드 구분(O2O)
  *****************************************************************************/
   FUNCTION f_sExif0003O2OAgency (
      v_Agency_Cd         IN VARCHAR2                                /* 대리점코드 */
  ) RETURN VARCHAR;
  
  /*****************************************************************************
  -- 거점코드 - 거래처 코드 조회
  *****************************************************************************/
   PROCEDURE p_sExif0003O2OAgencyInfo (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Agency_Cd         IN VARCHAR2                                /* 대리점코드 */
  );
  
END Pkg_Exif0003;
/
