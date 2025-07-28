CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Exif0003 AS
/*******************************************************************************
   NAME:      Pkg_Exif0003
   PURPOSE   외부시스템 인터페이스 - 모바일앱

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2017-01-02                   1. Created this package body.
   1.1        2017-03-13  wjim             [20170313_01] B2B일시불 가격정책 추가에 따른 수정
   1.2        2017-03-14  wjim             [20170314_01] 방문점검 연체처리 기준 변경
   1.3        2017-03-24  wjim             [20170324_01] 대리점 계약조회 오류수정
   1.4        2017-04-04  wjim             [20170404_03] 방문점검 확정기준 및 조회기준 변경
   1.5        2017-05-29  wjim             [20170529_02] 로디안 방문점검 예정건 일자별 카운트 조회기준 변경
   1.6        2017-05-31  wjim             [20170531_01] 로디안 방문점검 TO-DO 목록 조회기준 변경   
   1.7        2017-10-26  wjim             [20171026_01] 걱정제로, 엔진오일 서비스확인서 처리가능 기준 변경
   1.8        2018-08-16  wjim             [20180816_01] 고객정보 등록 시 전화번호 없는 경우 휴대폰번호로 대체 
   1.10       2021-11-22  kstka            [20211122_01] kstka 걱정제로 수령여부 컬럼 추가
   1.11       2022-01-27  kstka            [20220127_01] kstka 주문block처리 (20220129 13시~말일)
   1.12       2023-06-22  kstka            [20230622_01] kstka 계약서내용 조회시 최초발송용과 재발송용으로 구분
   1.13       2023-12-26  kstka            [20231226_01] kstka 마감일 장착주문유형 제한
   1.14       2024-01-17  kstka            [20240117_01] kstka 업무용앱에서 쇼핑몰s회원가입 BLOCK처리
   1.14       2024-10-25  10243054         [20241025_01] 개인정보제공 동의 당일에만 유효하게 처리
*******************************************************************************/
  /*****************************************************************************
  -- 0)  PAD 로그인시 사용자 정보 조회 - New Version
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
    ) IS

    v_Pass_Wd  RTCM0001.PASSWORD%TYPE DEFAULT NULL;    /*비밀번호              */
    v_Lock_Yn  RTCM0001.LOCK_YN%TYPE DEFAULT NULL;     /*사용불가 계정여부     */
    v_Fail_Cnt  RTCM0001.FAIL_CNT%TYPE DEFAULT NULL;    /*비밀번호              */
    v_Cd       RTCM0051.CD%TYPE DEFAULT NULL;          /* 코드                 */
    v_Cd_Nm    RTCM0051.CD_NM%TYPE DEFAULT NULL;       /* 코드명               */

    e_Error   EXCEPTION;
  BEGIN
  
    Pkg_Utility.p_LoginFileWrite('Pkg_Exif0003.p_sExif0003PadLoginInfo(1)', 'v_User_Id', v_User_Id);

--  File_Path1 : 정보동의 제공경로 -> 기본경로로 변경 2015.11.13
--               File_Path1만 사용함 ,Path2,3,4 사용 안하는 것으로 변경
    SELECT  A.USER_NM, A.PASSWORD, A.LOCK_YN,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0000') File_Path1,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0002') File_Path2,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0003') File_Path3,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S064', '0004') File_Path4,
            A.USER_GRP,
            A.FAIL_CNT,
            NVL((SELECT CHAIN_YN FROM RTSD0007 WHERE AGENCY_CD = v_User_Id), 'N') AS CHAIN_YN,
            (SELECT CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END FROM RTSD0020 WHERE TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN SALE_STR_DAY AND SALE_END_DAY AND USE_YN = 'Y' AND PRDT_GRP_DTL = '04') AS FREE_RENTAL_YN,
            Pkg_Exif0004.f_sExif0004O2OAgency(A.USER_ID) AS O2O_AGENCY_YN 
    INTO    v_User_Nm, v_Pass_Wd, v_Lock_Yn, v_File_Path1, v_File_Path2, v_File_Path3, v_File_Path4,
            v_User_Grp,  v_Fail_Cnt, v_Chain_Yn, v_Free_Rental_Yn, v_O2O_Agency_Yn 
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
    
    IF v_Fail_Cnt >= 5 THEN
        v_Pass_Yn := 'N';
        v_Return_Message := '비밀번호 오류가 5회를 초과했습니다'||CHR(13)||CHR(10)||'시스템관리자에게 문의하시기 바랍니다.';
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

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
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


  END p_sExif0003PadLoginInfo;
  
  /*****************************************************************************
  -- 고객정보 조회  
  -- - Pkg_Exif0001.p_sExif0001CustInfo 를 참조하여 개발
  -- - 정보제공동의 대상여부 포함
  -- - 고객명만으로도 조회가능, 단 2자리 이상 입력
  -- - 전화번호만으로도 조회가능
  -- - 생년월인은 추가 조건 역활만
  -- - 고객명+전화번호+생년월일 모두 입력하여 조회 가능
  -- [20210117_01] kstka 개인정보동의는 최초 1번만 작성
  *****************************************************************************/
  PROCEDURE p_sExif0003CustInfo (
      v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE       /*고객명/법인명         */
    , v_Birth_Day      IN RTSD0100.BIRTH_DAY%TYPE     /*법정생년월일          */
    , v_Mob_No         IN RTSD0100.MOB_NO%TYPE        /*휴대폰번호            */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS

  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO                                        /* 고객번호      */
         ,  A.CUST_NM                                        /* 고객명/법인명 */
         ,  A.BIRTH_DAY                                      /* 법정생년월일  */
         ,  A.MOB_NO                                         /* 휴대폰번호    */
         ,  A.GENDER_CD                                      /* 성별          */
         ,  A.LF_CD                                          /* 내외국인      */
         ,  '('||A.POS_CD||') '||A.ADDR1||' '||A.ADDR2 ADDR  /* 고객주소      */
         ,  TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY              /* 시스템일자    */
         ,  DECODE(A.CUST_TP,'01',SUBSTR(A.BIRTH_DAY,3,6),SUBSTR(A.BUSL_NO,1,6)) ENC_CD /* 암호화 코드 */
         ,  NVL2(B.CUST_NO,'Y','N') AS AG_YN              /* 정보제공 동의여부*/
      FROM  RTSD0100 A
         ,  RTSD0111 B
     WHERE  A.USE_YN     = 'Y'
       AND  A.CUST_TP    = '01'
       AND  A.CUST_NM LIKE v_Cust_Nm||'%'
       AND  (v_Cust_Nm   IS NULL OR ((v_Mob_No IS NOT NULL) OR (v_Mob_No IS NULL AND LENGTH(v_Cust_Nm) >= 2)))
       AND  (v_Birth_Day IS NULL OR A.BIRTH_DAY =  v_Birth_Day)
       AND  (v_Mob_No    IS NULL OR A.MOB_NO =  v_Mob_No)
       AND  (
                   (v_Cust_Nm  IS NULL AND v_Mob_No IS NOT NULL)
                OR (v_Cust_Nm  IS NOT NULL AND v_Mob_No IS NULL) 
                OR (v_Cust_Nm  IS NOT NULL AND v_Mob_No IS NOT NULL)
            )
       AND  A.CUST_NO   = B.CUST_NO(+)
       AND  B.AG_DAY(+) = TO_CHAR(SYSDATE,'YYYYMMDD') 
    ;

  END p_sExif0003CustInfo;
  
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR

    SELECT  A.ORD_NO,                                                                                                                   /* 주문번호            */
            C.CUST_TP,                                                                                                                  /* 고객유형            */
            C.CUST_TP2,                                                                                                                 /* 고객분류            */
            C.CUST_NM,                                                                                                                  /* 고객명/법인명       */
            --C.BIRTH_DAY,                                                                                                              /* 법정생년월일        */
            --C.GENDER_CD,                                                                                                              /* 성별                */
            --C.LF_CD,                                                                                                                  /* 내외국인            */
            --C.MOB_NO,                                                                                                                 /* 휴대폰번호          */
            DECODE(C.CUST_TP, '01', C.BIRTH_DAY, O_BIRTHDAY) BIRTH_DAY,                                                                 /* 법정생년월일        */
            DECODE(C.CUST_TP, '01', C.GENDER_CD, O_GENDERCD) GENDER_CD,                                                                 /* 성별                */
            DECODE(C.CUST_TP, '01', C.LF_CD    , O_LFCD    ) LF_CD    ,                                                                 /* 내외국인            */
            DECODE(C.CUST_TP, '01', C.MOB_NO   , DECODE(A.CHAN_CD,'06',C.MOB_NO,O_MOBNO)) MOB_NO   ,                                    /* 휴대폰번호          */
            C.MOB_FIRM,                                                                                                                 /* 통신사              */
            C.REP_NM,                                                                                                                   /* 대표자명            */
            C.BUSL_NO,                                                                                                                  /* 사업자번호          */
            C.BUSI_TYPE,                                                                                                                /* 업종                */
            C.BUSI_COND,                                                                                                                /* 업태                */
            C.TEL_NO,                                                                                                                   /* 전화번호            */
            '('||C.POS_CD||') '||C.ADDR1||' '||C.ADDR2 CUST_ADDR,                                                                       /* 주소 */
            C.POS_CD,                                                                                                                   /* 우편번호 */
            C.ADDR1,                                                                                                                    /* 주소 */
            C.ADDR2,                                                                                                                    /* 상세주소 */
            C.EMAIL_ADDR,                                                                                                               /* E-Mail주소          */
             Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) ||' '||Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) MC_NM, /* 차종 */
            A.CAR_NO,                                                                                                                   /* 차량번호            */
            A.CAR_OWNER,                                                                                                                /* 차량소유주          */
            A.C_MILEAGE,                                                                                                                /* 현재주행거리        */
            C.TEL_NO2,                                                                                                                  /* 보조주소-전화번호            */
            DECODE(C.POS_CD2,NULL,NULL,'(')||C.POS_CD2||DECODE(C.POS_CD2,NULL,NULL,') ')||C.ADDR1_2||' '||C.ADDR2_2 CUST_ADDR2,         /* 보조주소-주소 */
            (SELECT 
                LISTAGG(Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',T1.PETTERN_CD)||'||'||T1.SECTION_WIDTH || '/' || T1.ASPECT_RATIO || 'R' ||T1.WHEEL_INCHES||'||'||TO_NUMBER(NVL(T.CNT_CD,0)),',') 
                WITHIN GROUP(ORDER BY T1.PETTERN_CD)
             FROM RTSD0106 T, RTSD0005 T1
             WHERE A.ORD_NO = T.ORD_NO
             AND T.MAT_CD = T1.MAT_CD
            ) AS PATTERN_SIZE_INFO,                                                                                                     /* 타이어  2019.01.09 */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',D.PETTERN_CD)  PETTERN_CD,  /*패턴  */
--            D.SECTION_WIDTH || '/' || D.ASPECT_RATIO || 'R' ||D.WHEEL_INCHES  SIZE_CD, /*규격 */
            TO_NUMBER(NVL(A.CNT_CD,0)) CNT_CD,  /*타이어본수   */
            A.REGI_AMT,                                                                                                                                             /* 렌탈등록비          */
            A.MON_AMT AS BASIC_MON_AMT,                                                                                                                             /* 기준렌탈료 2019.01.10 */
            A.SUM_MON_AMT AS MON_AMT,                                                                                                                               /* 월렌탈료            */
            (SELECT REPLACE(LISTAGG(T.MAT_DESC,',') WITHIN GROUP(ORDER BY T.MAT_DESC),',',CHR(13)||CHR(10)) FROM RTSD0106 T WHERE T.ORD_NO = A.ORD_NO) AS MAT_DESC, /* 비고 2019.01.09 추가                */
--            ,B.MAT_DESC
            A.PERIOD_CD,                                                                                                                                            /* 기간코드            */
            DECODE(A.PAY_MTHD, 'A', F.CUST_NM, 'C', G.CUST_NM) OWNER_NM,                                                                                            /* 예금주*/
            DECODE(A.PAY_MTHD, 'A', DECODE(F.CUST_TP, '01', F.EBIR_DAY, '02', F.BUSL_NO), 'C', DECODE(G.CUST_TP, '01', G.EBIR_DAY, '02', G.BUSL_NO))  EBIR_DAY,     /* 법정생일*/
            A.PAY_MTHD,                                                                                                                                             /* 결제구분            */
            A.PAY_DD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001',F.BANK_CD) BANK_NM,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002',G.CARDCOM_CD) CARDCOM_NM,                                                                                                                                  /* 이체일              */
            --DECODE(A.PAY_MTHD, 'A', Pkg_Rtcm0051.f_sRtcm0051CodeName('R001',F.BANK_CD), 'C', Pkg_Rtcm0051.f_sRtcm0051CodeName('R002',G.CARDCOM_CD)) BANK_NM,      /* 은행명/카드사명*/
            F.ACCT_NO,
            G.CARD_NO,
            --DECODE(A.PAY_MTHD, 'A', F.ACCT_NO, 'C', G.CARD_NO) ACCT_NO,                                                                                           /* 은행계좌/카드번호*/
            DECODE(A.PAY_MTHD, 'C', G.EXPIRE_YM) EXPIRE_YM,                                                                                                         /* 유효기간(월/년) */
            A.AGENCY_CD,                                                                                                                                            /* 장착 대리점         */
            H.AGENCY_NM,                                                                                                                                            /* 장착점명            */
            H.TEL_NO AG_TELNO,                                                                                                                                      /* 연락처(장착점)      */
            (SELECT T.PLAN_DAY FROM RTSD0106 T WHERE T.ORD_NO = A.ORD_NO AND ROWNUM =1 ) AS PLAN_DAY,                                                               /* 장착예정일 2019.01.09 수정         */
            '('||H.POS_CD||') '||H.CITY||' '||H.STREET AG_ADDR,                                                                                                     /* 장착점주소 */
            A.ORG_CD,                                                                                                                                               /* 판매조직            */
            NULL ORG_NM,                                                                                                                                            /* 판매점명            */
            NULL ORG_TELNO,                                                                                                                                         /* 연락처              */
            A.ORD_AGENT,                                                                                                                                            /* 판매인번호          */
            I.ORG_AGNM,                                                                                                                                             /* 판매인명            */
            I.ORG_AGTEL,                                                                                                                                            /* 판매인핸드폰        */
            Pkg_Rtsd0109.f_sRtsd0109Demddt(1, TO_CHAR(SYSDATE, 'YYYYMMDD'), A.PAY_DD) FC_DAY,                                                                       /* 최초청구일자        */
            A.PCERT_YN,                                                                                                                                             /* 신분증 첨부 필수여부*/
            A.ORD_DAY,                                                                                                                                              /* 접수일자            */
            TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY ,                                                                                                                   /* 시스템일자*/
            DECODE(C.CUST_TP,'01',SUBSTR(C.BIRTH_DAY,3,6),SUBSTR(C.BUSL_NO,1,6)) ENC_CD,                                                                            /* 암호화 코드 */
            A.SEASON_CD,                                                                                                                                            /* 계절구분('01':4계절,'02':겨울용)     */
            (SELECT LISTAGG(Pkg_Rtcm0051.f_sRtcm0051CodeName('S044',T.PRS_DCD)||'||'||T.SERV_CNT0,',') WITHIN GROUP(ORDER BY T.PRS_DCD) FROM RTSD0013 T WHERE T.ORD_NO = A.ORD_NO) AS PRIMIUM_SVC,  /* 부가서비스 (서비스명, 수량) 2019.01.09 */
            (SELECT 
              TRIM(LISTAGG(T1.ADD_GDS_NM||'||'||'1',',') WITHIN GROUP(ORDER BY T1.ADD_GDS_CD))
            FROM RTSD0041 T, RTSD0023 T1
            WHERE T.ORD_NO = A.ORD_NO
            AND T.ADD_GDS_CD = T1.ADD_GDS_CD) AS ETC_TIRE,                                                                                                                         /* 타이어 외 2019.01.09 */
            (
            SELECT 
             (NVL(SUM(T.F_DCAMT),0)+NVL(CASE WHEN MAX(T1.DC_RATE) = 0 THEN 0
                                       ELSE TRUNC(MAX((SELECT SUM(TRUNC(A.SERV_AMT)) FROM RTSD0013 A WHERE A.ORD_NO = T.ORD_NO)) * MAX(T1.DC_RATE)/100)
                                       END,0)) AS MON_DC_AMT
            FROM RTSD0106 T, RTSD0020 T1
            WHERE T.ORD_NO = A.ORD_NO
            AND T.SALE_CD = T1.SALE_CD
            ) AS MON_DC_AMT,                                                                                                                                        /* 월 할인금액 2019.01.10 */
            (
            SELECT 
             (NVL(SUM(T.F_DCAMT),0)+NVL(CASE WHEN MAX(T1.DC_RATE) = 0 THEN 0
                                       ELSE TRUNC(MAX((SELECT SUM(TRUNC(A.SERV_AMT)) FROM RTSD0013 A WHERE A.ORD_NO = T.ORD_NO)) * MAX(T1.DC_RATE)/100)
                                       END,0)) * NVL(MAX(T.PERIOD_CD),0) AS MON_DC_AMT
            FROM RTSD0106 T, RTSD0020 T1
            WHERE T.ORD_NO = A.ORD_NO
            AND T.SALE_CD = T1.SALE_CD
            ) AS SUM_DC_AMT,
            A.CHAN_CD,
            f_sExif0003O2OAgency(A.AGENCY_CD) AS O2O_YN,          /*거점여부            */      
            A.TMS_ORDERID,
            Pkg_Exif0004.f_sExif0004O2OStockYn(A.OMS_ORDERNO) AS O2O_STOCK_YN, --20200409  거점재고 사용여부
            Pkg_Rtsd0104.f_sRtsdGetUsage(A.ORD_DAY, TO_CHAR(SYSDATE, 'YYYYMMDD'), A.CHAN_CD) AS USAGE, --20200410 Order Reason 추가
            A.OMS_ORDERNO, --20220407 kstka OMS주문번호
            A.PROC_DAY         
    FROM    RTSD0104 A,
--            RTSD0106 B,
            RTSD0100 C,
--            RTSD0005 D,
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
    AND     A.STAT_CD = CASE WHEN v_Use_Type = '01' THEN '01' ELSE A.STAT_CD END
--    AND     A.ORD_NO  = B.ORD_NO
    AND     A.CUST_NO = C.CUST_NO
--    AND     B.MAT_CD  = D.MAT_CD
    AND     A.ACC_SEQ = F.ACC_SEQ(+)
    AND     A.CRD_SEQ = G.CRD_SEQ(+)
    AND     A.AGENCY_CD = H.AGENCY_CD
    AND     A.ORD_AGENT = I.ORD_AGENT(+);    
    
    /*
    SELECT  A.ORD_NO,                    --주문번호            
            C.CUST_TP,                   --고객유형            
            C.CUST_TP2,                  --고객분류            
            C.CUST_NM,                   --고객명/법인명       
            --C.BIRTH_DAY,                 --법정생년월일        
            --C.GENDER_CD,                 --성별                
            --C.LF_CD,                     --내외국인            
            --C.MOB_NO,                    --휴대폰번호          
            DECODE(C.CUST_TP, '01', C.BIRTH_DAY, O_BIRTHDAY) BIRTH_DAY, --법정생년월일        
            DECODE(C.CUST_TP, '01', C.GENDER_CD, O_GENDERCD) GENDER_CD, --성별                
            DECODE(C.CUST_TP, '01', C.LF_CD    , O_LFCD    ) LF_CD    , --내외국인            
            DECODE(C.CUST_TP, '01', C.MOB_NO   , DECODE(A.CHAN_CD,'06',C.MOB_NO,O_MOBNO)) MOB_NO   , --휴대폰번호          
            C.MOB_FIRM,                  --통신사              
            C.REP_NM,                    --대표자명            
            C.BUSL_NO,                   --사업자번호          
            C.BUSI_TYPE,                 --업종                
            C.BUSI_COND,                 --업태                
            C.TEL_NO,                    --전화번호            
            '('||C.POS_CD||') '||C.ADDR1||' '||C.ADDR2 CUST_ADDR, --주소 
            C.EMAIL_ADDR,                --E-Mail주소          
             Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) ||' '||Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) MC_NM, --차종 
            A.CAR_NO,                    --차량번호            
            A.CAR_OWNER,                 --차량소유주          
            A.C_MILEAGE,                 --현재주행거리        
            C.TEL_NO2,                    --보조주소-전화번호            
            DECODE(C.POS_CD2,NULL,NULL,'(')||C.POS_CD2||DECODE(C.POS_CD2,NULL,NULL,') ')||C.ADDR1_2||' '||C.ADDR2_2 CUST_ADDR2, --보조주소-주소 
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',D.PETTERN_CD)  PETTERN_CD,  --패턴  
            D.SECTION_WIDTH || '/' || D.ASPECT_RATIO || 'R' ||D.WHEEL_INCHES  SIZE_CD, --규격 
            TO_NUMBER(NVL(B.CNT_CD,0)) CNT_CD,  --타이어본수   
            B.REGI_AMT,                  --렌탈등록비          
            B.MON_AMT,                   --월렌탈료            
            B.MAT_DESC,                  --비고                
            A.PERIOD_CD,                 --기간코드            
            DECODE(A.PAY_MTHD, 'A', F.CUST_NM, 'C', G.CUST_NM) OWNER_NM, --예금주
            DECODE(A.PAY_MTHD, 'A', DECODE(F.CUST_TP, '01', F.EBIR_DAY, '02', F.BUSL_NO), 'C', DECODE(G.CUST_TP, '01', G.EBIR_DAY, '02', G.BUSL_NO))  EBIR_DAY,  --법정생일
            A.PAY_MTHD,                  --결제구분            
            A.PAY_DD,                    --이체일              
            DECODE(A.PAY_MTHD, 'A', Pkg_Rtcm0051.f_sRtcm0051CodeName('R001',F.BANK_CD), 'C', Pkg_Rtcm0051.f_sRtcm0051CodeName('R002',G.CARDCOM_CD)) BANK_NM, --은행명/카드사명
            DECODE(A.PAY_MTHD, 'A', F.ACCT_NO, 'C', G.CARD_NO) ACCT_NO, --은행계좌/카드번호
            DECODE(A.PAY_MTHD, 'C', G.EXPIRE_YM) EXPIRE_YM, --유효기간(월/년) 
            A.AGENCY_CD,                 --장착 대리점         
            H.AGENCY_NM,                 --장착점명            
            H.TEL_NO AG_TELNO,           --연락처(장착점)      
            B.PLAN_DAY,                  --장착예정일          
            '('||H.POS_CD||') '||H.CITY||' '||H.STREET AG_ADDR, --장착점주소 
            A.ORG_CD,                    --판매조직            
            NULL ORG_NM,                 --판매점명            
            NULL ORG_TELNO,              --연락처              
            A.ORD_AGENT,                 --판매인번호          
            I.ORG_AGNM,                  --판매인명            
            I.ORG_AGTEL,                 --판매인핸드폰        
            Pkg_Rtsd0109.f_sRtsd0109Demddt(1, TO_CHAR(SYSDATE, 'YYYYMMDD'), A.PAY_DD) FC_DAY,                    --최초청구일자        
            A.PCERT_YN,                  --신분증 첨부 필수여부
            A.ORD_DAY,                   --접수일자            
            TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY ,--시스템일자
            DECODE(C.CUST_TP,'01',SUBSTR(C.BIRTH_DAY,3,6),SUBSTR(C.BUSL_NO,1,6)) ENC_CD, -- 암호화 코드 
            A.SEASON_CD                  --계절구분('01':4계절,'02':겨울용)     
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
   */

  END p_sExif0003OrdInfoList;
  
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
    ) IS
    v_Stat_Cd RTSD0104.STAT_CD%TYPE DEFAULT '04';     /*상태                  */
    e_Error EXCEPTION;

    v_Start_Day VARCHAR2(30);
    v_End_Day VARCHAR2(30);
    
    TYPE Rtcm0051_Cd_Row IS RECORD (
        cd RTCM0051.CD%TYPE
    );
    TYPE T_Rtcm0051_Rows IS TABLE OF Rtcm0051_Cd_Row;
    
    R_Rtcm0051_Rows T_Rtcm0051_Rows;
  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', '계약번호              (v_Ord_No   )', v_Ord_No   );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', 'CMS출금이체동의       (v_Cmsag_Yn )', v_Cmsag_Yn );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', '계약서 교부방법       (v_Con_Mthd )', v_Con_Mthd );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', '등록자 ID             (v_Id       )', v_Id       );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', 'PAD입력일시           (v_Input_Dt )', v_Input_Dt );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', '개인정보 제공동의서 파(v_File_Path)', v_File_Path);
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', '개인정보 제공동의서 파(v_File_Name)', v_File_Name);
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', '장착일자              (v_Proc_Day )', v_Proc_Day );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', '기존타이어폐기위탁동의(v_Td_Yn    )', v_Td_Yn    );
    
--    IF TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') || '1700' < TO_CHAR(SYSDATE, 'YYYYMMDDHH24MI') THEN
--        IF SUBSTR(v_Ord_No, 1,  1) = 'D' THEN
--            v_Return_Message := '월말 저녁 5시 이후에는 장착이 불가 합니다.';
--            RAISE e_Error;
--        END IF;
--    END IF;
    
    --[20220224_01] kstka 주문BLOCK 시작일/종료일 구분
    v_Start_Day := Pkg_Rtcm0051.f_sRtcm0051CodeName('S311','STARTDAY');
    v_End_Day := Pkg_Rtcm0051.f_sRtcm0051CodeName('S311','ENDDAY');
    
    IF TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') BETWEEN v_Start_Day AND v_End_Day THEN
        --[20231226_01] kstka 주문BLOCK 유형 구분 (D,O,B,M)
        IF Pkg_Rtcm0051.f_sRtcm0051UseCount('S319', SUBSTR(v_Ord_No, 1,  1)) > 0 THEN
            v_Return_Message := '월마감으로 말일까지 장착이 불가합니다!';
            RAISE e_Error;
        END IF;
    END IF;
     
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

    IF 0 != ISDATE(v_Proc_Day) THEN
        v_Return_Message := '장착일자('||v_Proc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF SUBSTR(v_Proc_Day,1,6) != TO_CHAR(SYSDATE, 'YYYYMM') THEN
        v_Return_Message := '장착일자('||v_Proc_Day||')는 현재월 범위에서만 처리가 가능합니다.!';
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

    -- 장착 등록 처리
    Pkg_Rtsd0108.p_InsertRtsd0108Pad(v_Ord_No, v_Proc_Day, '0' , '0' , v_Td_Yn ,
                                     v_Input_Dt , v_File_Path , v_File_Name , v_Id ,
                                     v_Success_Code, v_Return_Message, v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '장착 등록 처리 실패!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    v_Success_code := 0;
    v_Return_Message := '1_정상적으로 등록되었습니다';
    v_ErrorText := '';

    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0001.p_InsertExif0001Sign(2)', v_ErrorText, v_Return_Message);


  END p_InsertExif0003Sign;

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
    ) IS

    v_SkidDepth RTSD0005.SKID_DEPTH%TYPE;
    
    v_Seq NUMBER DEFAULT 0;
    e_Error EXCEPTION;
  BEGIN
  
    -- 필수값:주문번호, 등록자 ID, 상세서비스    
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '고객번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Reg_Day) IS NULL THEN
        v_Return_Message := '등록일('||v_Reg_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_RTcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Prs_Dcd) IS NULL) OR (0 = Pkg_RTcm0051.f_sRtcm0051Count('S044', v_Prs_Dcd)) THEN
        v_Return_Message := '상세서비스('||v_Prs_Dcd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN
    
        SELECT SKID_DEPTH INTO v_SkidDepth FROM RTSD0005 A, RTSD0106 B WHERE ORD_NO = v_Ord_No AND A.MAT_CD = B.MAT_CD; 
        
        IF  TO_NUMBER(NVL(v_Skid_Depth_Fl, 0)) > TO_NUMBER(v_SkidDepth) OR TO_NUMBER(NVL(v_Skid_Depth_Fl2, 0)) > TO_NUMBER(v_SkidDepth) OR TO_NUMBER(NVL(v_Skid_Depth_Fl3, 0)) > TO_NUMBER(v_SkidDepth)  
            OR TO_NUMBER(NVL(v_Skid_Depth_Fl4, 0)) > TO_NUMBER(v_SkidDepth) THEN
            v_Return_Message := '입력하신 SKID DEPTH(FL)를 확인해 주세요.';
            RAISE e_Error;
        END IF;
        
        IF  TO_NUMBER(NVL(v_Skid_Depth_Fr, 0)) > TO_NUMBER(v_SkidDepth) OR TO_NUMBER(NVL(v_Skid_Depth_Fr2, 0)) > TO_NUMBER(v_SkidDepth) OR TO_NUMBER(NVL(v_Skid_Depth_Fr3, 0)) > TO_NUMBER(v_SkidDepth)  
            OR TO_NUMBER(NVL(v_Skid_Depth_Fr4, 0)) > TO_NUMBER(v_SkidDepth) THEN
            v_Return_Message := '입력하신 SKID DEPTH(FR)를 확인해 주세요.';
            RAISE e_Error;
        END IF;
        
        IF  TO_NUMBER(NVL(v_Skid_Depth_Rl, 0)) > TO_NUMBER(v_SkidDepth) OR TO_NUMBER(NVL(v_Skid_Depth_Rl2, 0)) > TO_NUMBER(v_SkidDepth) OR TO_NUMBER(NVL(v_Skid_Depth_Rl3, 0)) > TO_NUMBER(v_SkidDepth)  
            OR TO_NUMBER(NVL(v_Skid_Depth_Rl4, 0)) > TO_NUMBER(v_SkidDepth) THEN
            v_Return_Message := '입력하신 SKID DEPTH(RL)를 확인해 주세요.';
            RAISE e_Error;
        END IF;
        
        IF  TO_NUMBER(NVL(v_Skid_Depth_Rr, 0)) > TO_NUMBER(v_SkidDepth) OR TO_NUMBER(NVL(v_Skid_Depth_Rr2, 0)) > TO_NUMBER(v_SkidDepth) OR TO_NUMBER(NVL(v_Skid_Depth_Rr3, 0)) > TO_NUMBER(v_SkidDepth)  
            OR TO_NUMBER(NVL(v_Skid_Depth_Rr4, 0)) > TO_NUMBER(v_SkidDepth) THEN
            v_Return_Message := '입력하신 SKID DEPTH(RR)를 확인해 주세요.';
            RAISE e_Error;
        END IF;      
        

        v_Seq := f_sRtcs0011Seq(v_Ord_No);
        
        IF 0 != f_InsertRtcs0011(v_Ord_No, v_Seq, v_Reg_Day, v_Prs_Dcd, v_Eng_Oil_Qty, v_Eng_Oil_Pol, v_Water_Chk, v_Washer_Qty, v_Battery_Vol,
            v_Lamp_Chk, v_Skid_Depth_Fl,v_Skid_Depth_Fl2,v_Skid_Depth_Fl3,v_Skid_Depth_Fl4, v_Skid_Depth_Fr,v_Skid_Depth_Fr2,v_Skid_Depth_Fr3,v_Skid_Depth_Fr4,
            v_Skid_Depth_Rl,v_Skid_Depth_Rl2,v_Skid_Depth_Rl3,v_Skid_Depth_Rl4, v_Skid_Depth_Rr,v_Skid_Depth_Rr2,v_Skid_Depth_Rr3,v_Skid_Depth_Rr4,
            v_Mileage, v_Remark, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '추가점검사항 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
                
    ELSE
    
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0011.p_IUDRtcs0011(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0011.p_IUDRtcs0011(2)', v_ErrorText, v_Return_Message);
        
  END p_IUDRtcs0011;
  
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
        ) RETURN NUMBER IS
  BEGIN
  
  INSERT INTO RTCS0011 (
        ORD_NO,
        SEQ,
        REG_DAY,
        PRS_DCD,
        ENG_OIL_QTY,
        ENG_OIL_POL,
        WATER_CHK,
        WASHER_QTY,
        BATTERY_VOL,
        LAMP_CHK,
        SKID_DEPTH_FL,
        SKID_DEPTH_FL2,
        SKID_DEPTH_FL3,
        SKID_DEPTH_FL4,
        SKID_DEPTH_FR,
        SKID_DEPTH_FR2,
        SKID_DEPTH_FR3,
        SKID_DEPTH_FR4,
        SKID_DEPTH_RL,
        SKID_DEPTH_RL2,
        SKID_DEPTH_RL3,
        SKID_DEPTH_RL4,
        SKID_DEPTH_RR,
        SKID_DEPTH_RR2,
        SKID_DEPTH_RR3,
        SKID_DEPTH_RR4,
        MILEAGE,
        REMARK,
        REG_ID,
        REG_DT,
        CHG_ID,
        CHG_DT
        )
  VALUES(
        v_Ord_No,
        v_Seq,
        v_Reg_Day,
        v_Prs_Dcd,
        v_Eng_Oil_Qty,
        v_Eng_Oil_Pol,
        v_Water_Chk,
        v_Washer_Qty,
        v_Battery_Vol,
        v_Lamp_Chk,
        v_Skid_Depth_Fl,
        v_Skid_Depth_Fl2,
        v_Skid_Depth_Fl3,
        v_Skid_Depth_Fl4,
        v_Skid_Depth_Fr,
        v_Skid_Depth_Fr2,
        v_Skid_Depth_Fr3,
        v_Skid_Depth_Fr4,
        v_Skid_Depth_Rl,
        v_Skid_Depth_Rl2,
        v_Skid_Depth_Rl3,
        v_Skid_Depth_Rl4,
        v_Skid_Depth_Rr,
        v_Skid_Depth_Rr2,
        v_Skid_Depth_Rr3,
        v_Skid_Depth_Rr4,
        v_Mileage,
        v_Remark,
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
         
  END f_InsertRtcs0011;
  
  /*****************************************************************************
  -- 추가점검사항 순번 채번
  *****************************************************************************/
  FUNCTION f_sRtcs0011Seq(
    v_Ord_No IN RTCS0011.ORD_NO%TYPE                    /*주문번호            */
  ) RETURN NUMBER IS
  v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN 
   
    SELECT NVL(MAX(SEQ) + 1, 1) INTO v_curr_cunt FROM RTCS0011 WHERE ORD_NO = v_Ord_No;
    
  RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 1;
  END;
  
  /*****************************************************************************
  -- 대리점 홈 작업예정 건수 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003AgencyTodoCnt (
      v_User_Id        IN RTCM0001.USER_ID%TYPE     /* 접속ID                 */
    , v_Req_Ym         IN VARCHAR2                  /* 조회년월               */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  A3.REQ_DAY
         ,  SUM(DECODE(A3.DIV_CD,'A',A3.CNT,0)) AS CNT_A
         ,  SUM(DECODE(A3.DIV_CD,'B',A3.CNT,0)) AS CNT_B
         ,  SUM(DECODE(A3.DIV_CD,'C',A3.CNT,0)) AS CNT_C
      FROM  (
                SELECT  A2.REQ_DAY
                     ,  A2.DIV_CD
                     ,  COUNT(*) AS CNT
                  FROM  (
                            SELECT  'A'            AS DIV_CD
                                 ,  B1.ORD_NO
                                 ,  NVL(B1.INST_DAY, B1.PROC_DAY)    AS REQ_DAY         --20200409 kstka 장착예정일의 변경으로 인해 장착예정일 컬럼 변경    
                              FROM  RTCM0001 A1
                                 ,  RTSD0104 B1
                             WHERE  A1.USER_ID      = v_User_Id
                               AND  A1.AGENT_ID     = B1.AGENCY_CD
                               AND  NVL(B1.INST_DAY, B1.PROC_DAY) LIKE v_Req_Ym||'%'        --20200409 kstka 장착예정일의 변경으로 인해 장착예정일 컬럼 변경 
                               AND  B1.STAT_CD     IN ('01','03')
                             UNION
                            SELECT  'B'            AS DIV_CD
                                 ,  B1.ORD_NO
--                                 ,  B1.SERVRQ_DAY  AS REQ_DAY
                                 ,  NVL(B1.INST_DAY, B1.SERVRQ_DAY)  AS REQ_DAY    --20200409 kstka 장착예정일의 변경으로 인해 장착예정일 컬럼 변경 
                              FROM  RTCM0001 A1
                                 ,  RTCS0010 B1     
                             WHERE  A1.USER_ID      = v_User_Id
                               AND  A1.AGENT_ID     = B1.AGENCY_CD
--                               AND  B1.SERVRQ_DAY LIKE v_Req_Ym||'%'
                               AND  NVL(B1.INST_DAY, B1.SERVRQ_DAY) LIKE v_Req_Ym||'%'  --20200409 kstka 장착예정일의 변경으로 인해 장착예정일 컬럼 변경
                               AND  B1.DLV_STAT IN ('01','02','03')
                             UNION
                            SELECT  'C'            AS DIV_CD
                                 ,  B1.ORD_NO
                                 ,  B1.SERVRQ_DAY  AS REQ_DAY     
                              FROM  RTCM0001 A1
                                 ,  RTCS0009 B1     
                             WHERE  A1.USER_ID      = v_User_Id
                               AND  A1.AGENT_ID     = B1.AGENCY_CD
                               AND  B1.SERVRQ_DAY LIKE v_Req_Ym||'%'
                               AND  B1.DLV_STAT    IN ('03')
                        ) A2
                 GROUP  BY A2.REQ_DAY
                     ,  A2.DIV_CD   
            ) A3
     GROUP  BY A3.REQ_DAY 
     ORDER  BY A3.REQ_DAY                 
    ;

  END p_sExif0003AgencyTodoCnt;
  
  /*****************************************************************************
  -- 대리점 계약목록 조회
     - 장착완료건의 경우 장착대리점이 아니라도 고객명과 차량번호로 조회 가능
      
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-03-24  wjim             [20170324_01] 대리점 계약조회 오류수정
                                           - 계약접수, 장착대기건 해당 대리점에서 고객명이나 차량번호로 조회 시 미조회 
   1.4        2018-03-02  kstka            [20180302_01] 엔진오일/걱정제로 연체여부 미확인으로 변경
   1.5        2019-01-08  KJU              2+2계약병합을 위해서 본수는 합치고 MATCD와 앞뒤는 대표로 변경
   1.9        2021-11-22  kstka            [20211122_01] kstka 걱정제로 수령여부 컬럼 추가
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
  ) IS
  
    lv_Req_Day_F    VARCHAR2(8);
    lv_Req_Day_T    VARCHAR2(8);
    
    lv_Dely_Day     RTRE0100.DELY_DAY%TYPE DEFAULT NULL; /* 마지막 연체집계 일자  */
    lv_agent_id     RTCM0001.AGENT_ID%TYPE DEFAULT NULL; /* 사용자의 담당 대리점  */
  
    e_Error EXCEPTION;
    
  BEGIN
  
    IF TRIM(v_User_Id) IS NULL THEN
        v_Return_Message := '접속ID : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Div_Cd) IS NULL THEN
        v_Return_Message := '조회구분 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Req_Day_F) IS NULL OR TRIM(v_Req_Day_T) IS NULL) AND TRIM(v_Cust_Nm) IS NULL AND TRIM(v_Car_No) IS NULL THEN
        v_Return_Message := '조회기간, 고객명, 차량번호 : 최소한 하나 이상의 조회조건이 필요합니다!';
        RAISE e_Error;
    END IF;
    
    -- 전체기간조회의 경우 조회기간 세팅
    IF TRIM(v_Req_Day_F) IS NULL THEN
        lv_Req_Day_F := '20150904';  --시스템오픈일
    ELSE
        lv_Req_Day_F := TRIM(v_Req_Day_F);  --시스템오픈일
    END IF;
    
    IF TRIM(v_Req_Day_T) IS NULL THEN
        --lv_Req_Day_T := TO_CHAR(SYSDATE, 'YYYYMMDD');
        lv_Req_Day_T := TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD'); --[20210412_01]당월 마지막날로 변경
    ELSE
        lv_Req_Day_T := TRIM(v_Req_Day_T);        
    END IF;
    
    -- 최종 연체집계일자 조회
    SELECT  MAX(DELY_DAY)
      INTO  lv_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';
     
     -- 사용자의 담당 대리점 조회
     SELECT  AGENT_ID
      INTO  lv_agent_id
      FROM  RTCM0001
     WHERE  USER_ID = v_User_Id;  
    
    OPEN Ref_Cursor FOR
    SELECT  A3.DIV_CD
         ,  A3.REQ_DAY
         ,  A3.ORD_NO
         ,  A3.ORD_DAY     
         ,  A3.CUST_NO
         ,  A3.CUST_NM2     AS CUST_NM
         ,  A3.BIRTH_DAY
         ,  A3.MOB_NO
         ,  A3.STAT_CD
         ,  A3.STAT_NM
         ,  A3.REQ_CNT_NM
         ,  A3.MODEL_CD
         ,  A3.CONTENTS_CD
         ,  A3.FR_CD
         ,  A3.MC_NM
         ,  A3.CAR_NO
         ,  A3.MAT_CD
         ,  A3.MAT_NM
         ,  A3.ORG_CNT_NM
         ,  A3.SUM_AMT_DELY
         ,  A3.PROC_DAY
         ,  CASE WHEN TO_CHAR(TO_DATE(NVL(A3.PROC_DAY,TO_CHAR(SYSDATE,'YYYYMMDD')))+7,'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN
                0
            ELSE
                DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00002,0)
            END AS CNTR_B00002
         --,  DECODE(A3.DIV_CD,'B',DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00007,0),0) AS CNTR_B00007
         ,  DECODE(A3.DIV_CD,'B',A3.CNTR_B00007,0) AS CNTR_B00007
         --,  DECODE(A3.DIV_CD,'C',DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00001,0),0) AS CNTR_B00001
         ,  DECODE(A3.DIV_CD,'C',A3.CNTR_B00001,0) AS CNTR_B00001
         ,  DECODE(A3.DIV_CD,'D',DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00006,0),0) AS CNTR_B00006
         ,  DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00008,0) AS CNTR_B00008
--         ,  DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00009,0) AS CNTR_B00009
         ,  A3.CNTR_B00009
         ,  A3.CNTR_B00010
         ,  A3.CNTR_B00011
         ,  A3.CNTR_B00012
         ,  A3.STAT_DIV
         ,  '' AS PRS_DCD_CD 
         ,  NVL(A3.SALE_CD, '') AS SALE_CD
         ,  NVL(A3.SALE_NM, A3.MAT_NM) AS SALE_NM
         ,  (SELECT Pkg_Exif0003.f_Exif0003UseAccChkYN(A3.CUST_NO) FROM DUAL) AS AG_YN /*고객 정보제공 동의 여부*/
         ,  ENC_CD  /* 암호화 코드 */
         ,  TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY              /* 시스템일자    */
         ,  A3.ORD_ID   AS  ORD_ID
         ,  A3.CHAN_CD
         ,  f_sExif0003O2OAgency(A3.AGENCY_CD) AS O2O_YN          /*거점여부            */
         ,  A3.INST_CD
         ,  CASE WHEN A3.DIV_CD = 'A' THEN Pkg_Rtcm0051.f_sRtcm0051CodeName('S304', TRIM(A3.INST_CD))
                 WHEN A3.DIV_CD = 'B' THEN Pkg_Rtcm0051.f_sRtcm0051CodeName('C023', TRIM(A3.INST_CD))
                 ELSE '11' END AS INST_NM      /*장착수단            */
         ,  (SELECT CASE WHEN COUNT(*) > 1 THEN 'Y'
                         WHEN A3.REQ_DAY < '20201101' THEN 'Y' 
                         ELSE 'N' END FROM RTCS0207 WHERE ORD_NO = A3.ORD_NO AND DLV_STAT NOT IN ('06')) AS APLY_YN
         , A3.DLV_GB
         , Pkg_Rtcm0051.f_sRtcm0051CodeName('C039', TRIM(A3.DLV_GB)) AS DLV_GB_NM
         , A3.MFP_YN
      FROM  (
                SELECT  A2.*
                     ,  NVL(A2.CUST_NM, B2.CUST_NM) AS CUST_NM2
                     ,  B2.BIRTH_DAY
                     ,  B2.MOB_NO
                     ,  E2.CD_NM   AS REQ_CNT_NM
                     ,  C2.MC_NM
                     ,  D2.MAT_NM
                     ,  F2.CD_NM   AS ORG_CNT_NM
                     ,  NVL(H2.SERV_CNTR,0)         AS CNTR_B00002
                     ,  NVL(I2.SERV_CNTR,0)         AS CNTR_B00007
                     ,  NVL(G2.SERV_CNTR,0)         AS CNTR_B00001
                     ,  NVL(L2.SERV_CNTR,0)         AS CNTR_B00006
                     ,  NVL(M2.SERV_CNTR,0)         AS CNTR_B00008
                     ,  NVL(N2.SERV_CNTR,0)         AS CNTR_B00009
                     ,  NVL(O2.SERV_CNTR,0)         AS CNTR_B00010
                     ,  NVL(P2.SERV_CNTR,0)         AS CNTR_B00011
                     ,  NVL(Q2.SERV_CNTR,0)         AS CNTR_B00012
                     ,  NVL(J2.SUM_AMT_DELY,0)      AS SUM_AMT_DELY
                     ,  K2.PROC_DAY
                     ,  DECODE(B2.CUST_TP,'01',SUBSTR(B2.BIRTH_DAY,3,6),SUBSTR(B2.BUSL_NO,1,6)) ENC_CD 
                     ,  K2.MFP_YN                   
                  FROM  (
                            SELECT  'A'            AS DIV_CD
                                 ,  B1.ORD_NO
--                                 ,  NVL(B1.INST_DAY, B1.PROC_DAY)    AS REQ_DAY     --20200409 kstka 장착예정일의 변경으로 인해 장착예정일 컬럼 변경 
                                 ,  CASE WHEN B1.STAT_CD IN ('04') THEN B1.PROC_DAY ELSE NVL(B1.INST_DAY, C1.PLAN_DAY) END AS REQ_DAY --[20200702_01] 장착완료시에는 장착일자 기준으로 조회
                                 ,  B1.ORD_DAY
                                 ,  B1.CUST_NO
                                 ,  NULL           AS CUST_NM
                                 ,  B1.STAT_CD
                                 ,  D1.CD_NM       AS STAT_NM
                                 ,  LPAD(SUM(TO_NUMBER(NVL(C1.CNT_CD,'0'))),2,'0')      AS REQ_CNT
                                 ,  B1.MODEL_CD
                                 ,  B1.CONTENTS_CD
                                 ,  MAX(C1.FR_CD)  AS FR_CD
                                 ,  B1.CAR_NO
                                 ,  MAX(C1.MAT_CD) AS MAT_CD
                                 ,  LPAD(SUM(TO_NUMBER(NVL(C1.CNT_CD,'0'))),2,'0')      AS ORG_CNT
                                 ,  CASE WHEN B1.AGENCY_CD = lv_agent_id THEN
                                        CASE WHEN B1.STAT_CD IN ('01','03')THEN
                                            1
                                        ELSE
                                            0
                                        END
                                    ELSE
                                        CASE WHEN LENGTHB(TRIM(v_Cust_Nm)) >= 4 OR LENGTHB(TRIM(v_Car_No)) >= 4 THEN
                                            CASE WHEN B1.STAT_CD IN ('04')THEN
                                                0
                                            ELSE
                                                -1
                                            END
                                        ELSE
                                            -1
                                        END   
                                    END AS STAT_DIV --[20170324_01]
                                 ,  B1.SALE_CD
                                 ,  (SELECT SAL.SALE_NM  FROM RTSD0020 SAL WHERE SAL.SALE_CD = B1.SALE_CD) AS SALE_NM
                                 ,  B1.ORD_ID   AS ORD_ID
                                 ,  MAX(B1.CHAN_CD) AS CHAN_CD
                                 ,  B1.AGENCY_CD
                                 ,  MAX(B1.INST_CD) AS INST_CD
                                 ,  '' AS DLV_GB       --[20211122_01] kstka 걱정제로 수령여부 
                              FROM  RTCM0001 A1
                                 ,  RTSD0104 B1
                                 ,  RTSD0106 C1
                                 ,  RTCM0051 D1
                             WHERE  A1.USER_ID      = CASE WHEN LENGTHB(TRIM(v_Cust_Nm)) >= 4 OR LENGTHB(TRIM(v_Car_No)) >= 4 THEN A1.USER_ID ELSE v_User_Id END
                               AND  A1.AGENT_ID     = B1.AGENCY_CD
                               AND  CASE WHEN B1.STAT_CD IN ('04') THEN B1.PROC_DAY ELSE NVL(B1.INST_DAY, C1.PLAN_DAY) END --[20200702_01] 장착완료시에는 장착완료일자를 기준으로 조회
                                       BETWEEN lv_Req_Day_F AND lv_Req_Day_T     --20200409 kstka 장착예정일의 변경으로 인해 장착예정일 컬럼 변경 
                               AND  B1.ORD_NO       = C1.ORD_NO
                               AND  B1.STAT_CD      = D1.CD(+)
                               AND  D1.CD_GRP_CD(+) = 'S032'   
                            GROUP BY B1.ORD_NO,B1.PROC_DAY, B1.INST_DAY, B1.ORD_DAY,B1.CUST_NO,B1.STAT_CD,D1.CD_NM,B1.MODEL_CD,B1.CONTENTS_CD,B1.CAR_NO,B1.AGENCY_CD,B1.STAT_CD,B1.SALE_CD,B1.ORD_ID, C1.PLAN_DAY
                             UNION
                            SELECT  'B'            AS DIV_CD
                                 ,  B1.ORD_NO
--                                 ,  MAX(B1.SERVRQ_DAY)  AS REQ_DAY
--                                 ,  MAX(NVL(B1.INST_DAY, B1.SERVRQ_DAY))  AS REQ_DAY --20200409 kstka 장착예정일의 변경으로 인해 장착예정일 컬럼 변경
                                 ,  MAX(CASE WHEN B1.DLV_STAT IN ('04', '07', '08', '09') THEN B1.PROC_DAY  ELSE  NVL(B1.INST_DAY, B1.SERVRQ_DAY) END) AS REQ_DAY --[20200702_01] 장착완료시 장착완료일자 기준으로 조회
                                 ,  C1.ORD_DAY     AS ORD_DAY
                                 ,  MAX(B1.CUST_NO)
                                 ,  MAX(B1.CUST_NM)
                                 ,  MAX(B1.DLV_STAT)    AS STAT_CD
                                 ,  D1.CD_NM       AS STAT_NM
                                 ,  LPAD(SUM(NVL(B1.KWMENG,0)),2,'0') AS REQ_CNT
                                 ,  C1.MODEL_CD
                                 ,  C1.CONTENTS_CD
                                 ,  MAX(C1.FR_CD)
                                 ,  C1.CAR_NO
                                 ,  MAX(B1.MATNR)
                                 ,  LPAD(SUM(TO_NUMBER(NVL(C1.CNT_CD,'0'))),2,'0') AS ORG_CNT
                                 ,  CASE
                                        WHEN MAX(B1.DLV_STAT) IN ('01','02','03') THEN
                                            1
                                        ELSE
                                            0
                                    END           AS STAT_DIV
                                 ,  '' AS SALE_CD
                                 ,  '' AS SALE_NM
                                 ,  C1.ORD_ID   AS ORD_ID
                                 ,  MAX(C1.CHAN_CD) AS CHAN_CD
                                 ,  MAX(C1.AGENCY_CD) AS AGENCY_CD
                                 ,  MAX(B1.INST_CD) AS INST_CD
                                 ,  NVL(B1.DLV_GB, '01') AS DLV_GB       --[20211122_01] kstka 걱정제로 수령여부 
                              FROM  RTCM0001 A1
                                 ,  RTCS0010 B1
                                 ,  RTSD0108 C1
                                 ,  RTCM0051 D1
                             WHERE  A1.USER_ID      = v_User_Id
                               AND  A1.AGENT_ID     = B1.AGENCY_CD
--                               AND  B1.SERVRQ_DAY BETWEEN lv_Req_Day_F AND lv_Req_Day_T
                               AND  CASE WHEN B1.DLV_STAT IN ('04', '07', '08', '09') THEN B1.PROC_DAY  ELSE  NVL(B1.INST_DAY, B1.SERVRQ_DAY) END --[20200702_01] 장착완료시에는 실장착일자 기준으로 조회
                                       BETWEEN lv_Req_Day_F AND lv_Req_Day_T --20200409 kstka 장착예정일의 변경으로 인해 컬럼 변경
                               AND  B1.ORD_NO       = C1.ORD_NO
                               AND  B1.DLV_STAT     = D1.CD
                               AND  D1.CD_GRP_CD(+) = 'C024' 
                            GROUP BY B1.ORD_NO,C1.ORD_DAY,D1.CD_NM,B1.KWMENG,C1.MODEL_CD,C1.CONTENTS_CD,C1.CAR_NO,C1.ORD_ID, B1.DLV_GB
                             UNION
                            SELECT  'C'            AS DIV_CD
                                 ,  B1.ORD_NO
                                 ,  MAX(B1.SERVRQ_DAY)  AS REQ_DAY
                                 ,  C1.ORD_DAY     AS ORD_DAY
                                 ,  B1.CUST_NO
                                 ,  NULL           AS CUST_NM
                                 ,  B1.DLV_STAT    AS STAT_CD
                                 ,  E1.CD_NM       AS STAT_NM
                                 ,  '00'               AS REQ_CNT
                                 ,  C1.MODEL_CD
                                 ,  C1.CONTENTS_CD
                                 ,  MAX(D1.FR_CD)
                                 ,  C1.CAR_NO
                                 ,  MAX(D1.MAT_CD)
                                 ,  LPAD(SUM(TO_NUMBER(NVL(D1.CNT_CD,'0'))),2,'0')       AS ORG_CNT
                                 ,  DECODE(B1.DLV_STAT,'03',1,0) AS STAT_DIV
                                 ,  D1.SALE_CD
                                 ,  (SELECT SAL.SALE_NM  FROM RTSD0020 SAL WHERE SAL.SALE_CD = D1.SALE_CD) AS SALE_NM
                                 ,  D1.ORD_ID    AS ORD_ID
                                 ,  MAX(C1.CHAN_CD) AS CHAN_CD
                                 ,  MAX(C1.AGENCY_CD) AS AGENCY_CD
                                 ,  '' AS INST_CD
                                 ,  B1.DLV_GB       --[20211122_01] kstka 걱정제로 수령여부 
                              FROM  RTCM0001 A1
                                 ,  RTCS0009 B1
                                 ,  RTSD0108 C1
                                 ,  RTSD0106 D1
                                 ,  RTCM0051 E1
                             WHERE  A1.USER_ID      = v_User_Id
                               AND  A1.AGENT_ID     = B1.AGENCY_CD
                               AND  B1.SERVRQ_DAY BETWEEN lv_Req_Day_F AND lv_Req_Day_T
                               AND  B1.ORD_NO       = C1.ORD_NO 
                               AND  C1.ORD_NO       = D1.ORD_NO
                               AND  B1.DLV_STAT     = E1.CD(+)
                               AND  E1.CD_GRP_CD(+) = 'C019'
                            GROUP BY B1.ORD_NO,C1.ORD_DAY,B1.CUST_NO,B1.DLV_STAT,E1.CD_NM,C1.MODEL_CD,C1.CONTENTS_CD,C1.CAR_NO,D1.SALE_CD,D1.ORD_ID, B1.DLV_GB
                            UNION
                             SELECT  'D'            AS DIV_CD
                                 ,  B1.ORD_NO
                                 ,  B1.INPUT_DT  AS REQ_DAY
                                 ,  C1.ORD_DAY     AS ORD_DAY
                                 ,  B1.CUST_NO
                                 ,  NULL           AS CUST_NM
                                 ,  B1.DLV_STAT  AS STAT_CD
                                 ,  NULL            AS STAT_NM
                                 ,  LPAD(SUM(TO_NUMBER(NVL(D1.CNT_CD,'0'))),2,'0')      AS REQ_CNT
                                 ,  C1.MODEL_CD
                                 ,  C1.CONTENTS_CD
                                 ,  MAX(D1.FR_CD)
                                 ,  C1.CAR_NO
                                 ,  MAX(D1.MAT_CD)
                                 ,  LPAD(SUM(TO_NUMBER(NVL(D1.CNT_CD,'0'))),2,'0')      AS ORG_CNT
                                 ,  DECODE(B1.DLV_STAT,'01',1,0) AS STAT_DIV
                                 ,  MAX(D1.SALE_CD)
                                 ,  (SELECT SAL.SALE_NM  FROM RTSD0020 SAL WHERE SAL.SALE_CD = D1.SALE_CD) AS SALE_NM
                                 ,  D1.ORD_ID    AS ORD_ID
                                 ,  MAX(C1.CHAN_CD) AS CHAN_CD
                                 ,  MAX(C1.AGENCY_CD) AS AGENCY_CD
                                 ,  '' AS INST_CD
                                 ,  '' AS DLV_GB       --[20211122_01] kstka 걱정제로 수령여부 
                              FROM  RTCM0001 A1
                                 ,  (SELECT AGENCY_CD, ORD_NO, CUST_NO, INPUT_DT, CASE WHEN WRITE_YN = 'N' THEN '01' ELSE '04' END DLV_STAT, ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY SEQ DESC) NUM 
                                        FROM RTCS0204
                                        WHERE WRITE_YN = 'N') B1
                                 ,  RTSD0108 C1
                                 ,  RTSD0106 D1
                                 ,  RTCM0051 E1
                             WHERE  A1.USER_ID      = v_User_Id
                               AND  B1.INPUT_DT BETWEEN lv_Req_Day_F AND lv_Req_Day_T
                               AND  A1.AGENT_ID     = B1.AGENCY_CD                            
                               AND  B1.ORD_NO       = C1.ORD_NO 
                               AND  C1.ORD_NO       = D1.ORD_NO
                               AND  B1.DLV_STAT     = E1.CD(+)
                               AND  E1.CD_GRP_CD(+) = 'C019'
                            GROUP BY B1.ORD_NO,B1.INPUT_DT,C1.ORD_DAY,B1.CUST_NO,B1.DLV_STAT,C1.MODEL_CD,C1.CONTENTS_CD,C1.CAR_NO,D1.SALE_CD,D1.ORD_ID
                            UNION
                            SELECT  'E'            AS DIV_CD
                                 ,  B1.ORD_NO
                                 ,  MAX(B1.SERVRQ_DAY) AS REQ_DAY --[20200702_01] 장착완료시 장착완료일자 기준으로 조회
                                 ,  C1.ORD_DAY     AS ORD_DAY
                                 ,  MAX(B1.CUST_NO)
                                 ,  MAX(B1.CUST_NM)
                                 ,  MAX(B1.DLV_STAT)    AS STAT_CD
                                 ,  D1.CD_NM       AS STAT_NM
                                 ,  LPAD(SUM(NVL(B1.KWMENG,0)),2,'0') AS REQ_CNT
                                 ,  C1.MODEL_CD
                                 ,  C1.CONTENTS_CD
                                 ,  MAX(C1.FR_CD)
                                 ,  C1.CAR_NO
                                 ,  MAX(B1.MATNR)
                                 ,  LPAD(SUM(TO_NUMBER(NVL(C1.CNT_CD,'0'))),2,'0') AS ORG_CNT
                                 ,  CASE
                                        WHEN MAX(B1.DLV_STAT) IN ('01','02','03') THEN
                                            1
                                        ELSE
                                            0
                                    END           AS STAT_DIV
                                 ,  '' AS SALE_CD
                                 ,  '' AS SALE_NM
                                 ,  C1.ORD_ID   AS ORD_ID
                                 ,  MAX(C1.CHAN_CD) AS CHAN_CD
                                 ,  MAX(C1.AGENCY_CD) AS AGENCY_CD
                                 ,  '' AS INST_CD
                                 ,  '' AS DLV_GB       --[20211122_01] kstka 걱정제로 수령여부 
                              FROM  RTCM0001 A1
                                 ,  RTCS0208 B1
                                 ,  RTSD0108 C1
                                 ,  RTCM0051 D1
                             WHERE  A1.USER_ID      = v_User_Id
                               AND  A1.AGENT_ID     = B1.AGENCY_CD
                               AND  B1.SERVRQ_DAY BETWEEN lv_Req_Day_F AND lv_Req_Day_T --20200409 kstka 장착예정일의 변경으로 인해 컬럼 변경
                               AND  B1.ORD_NO       = C1.ORD_NO
                               AND  B1.DLV_STAT     = D1.CD
                               AND  D1.CD_GRP_CD(+) = 'C035' 
                            GROUP BY B1.ORD_NO,C1.ORD_DAY,D1.CD_NM,B1.KWMENG,C1.MODEL_CD,C1.CONTENTS_CD,C1.CAR_NO,C1.ORD_ID                               
                        ) A2
                     ,  RTSD0100 B2
                     ,  RTSD0002 C2
                     ,  RTSD0005 D2
                     ,  RTCM0051 E2        
                     ,  RTCM0051 F2
                     ,  RTSD0013 G2
                     ,  RTSD0013 H2
                     ,  RTSD0013 I2
                     ,  (
                            SELECT  X.CUST_NO
                                 ,  NVL(SUM(APPR_AMT),0) AS SUM_AMT_DELY 
                              FROM  RTRE0100 X
                             WHERE  X.DELY_DAY = lv_Dely_Day
                             GROUP  BY X.CUST_NO
                        ) J2
                     ,  RTSD0108 K2
                     ,  RTSD0013 L2
                     ,  RTSD0013 M2
                     ,  RTSD0013 N2
                     ,  RTSD0013 O2
                     ,  RTSD0013 P2
                     ,  RTSD0013 Q2
                 WHERE  A2.CUST_NO      = B2.CUST_NO(+)
                   AND  A2.MODEL_CD     = C2.MODEL_CD(+) 
                   AND  A2.CONTENTS_CD  = C2.CONTENTS_CD(+)
                   AND  A2.FR_CD        = C2.FR_CD(+) 
                   AND  A2.MAT_CD       = D2.MAT_CD(+) 
                   AND  A2.REQ_CNT      = E2.CD(+)
                   AND  E2.CD_GRP_CD(+) = 'S022'
                   AND  A2.ORG_CNT      = F2.CD(+)
                   AND  F2.CD_GRP_CD(+) = 'S022'
                   AND  A2.ORD_NO       = G2.ORD_NO(+)
                   AND  G2.PRS_DCD(+)   = 'B00001'
                   AND  A2.ORD_NO       = H2.ORD_NO(+)   
                   AND  H2.PRS_DCD(+)   = 'B00002'
                   AND  A2.ORD_NO       = I2.ORD_NO(+)   
                   AND  I2.PRS_DCD(+)   = 'B00007'
                   AND  A2.ORD_NO       = L2.ORD_NO(+)   
                   AND  L2.PRS_DCD(+)   = 'B00006'
                   AND  A2.ORD_NO       = M2.ORD_NO(+)   
                   AND  M2.PRS_DCD(+)   = 'B00008'
                   AND  A2.ORD_NO       = N2.ORD_NO(+)   
                   AND  N2.PRS_DCD(+)   = 'B00009'
                   AND  A2.ORD_NO       = O2.ORD_NO(+)   
                   AND  O2.PRS_DCD(+)   = 'B00010'
                   AND  A2.ORD_NO       = P2.ORD_NO(+)   
                   AND  P2.PRS_DCD(+)   = 'B00011'
                   AND  A2.ORD_NO       = Q2.ORD_NO(+)   
                   AND  Q2.PRS_DCD(+)   = 'B00012'
                   AND  A2.CUST_NO      = J2.CUST_NO(+)
                   AND  A2.ORD_NO       = K2.ORD_NO(+)
            ) A3
     WHERE  A3.CUST_NM2 LIKE '%'||v_Cust_Nm||'%'
       AND  A3.CAR_NO   LIKE '%'||v_Car_No||'%'  
       AND  A3.STAT_DIV   >= v_Div_Cd
     ORDER  BY A3.REQ_DAY DESC;
     
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
  
  EXCEPTION  
    WHEN e_Error THEN
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_sExif0003AgencyOrdList(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_sExif0003AgencyOrdList(2)', v_ErrorText, v_Return_Message);    
  
  END p_sExif0003AgencyOrdList;
  
  /*****************************************************************************
  -- 대리점 계약목록 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003HomeSrvHistList (
      Ref_Cursor       IN OUT SYS_REFCURSOR          
    , v_Ord_No         IN VARCHAR2                  /* 주문번호 */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;
    
  BEGIN
  
        OPEN Ref_Cursor FOR
        SELECT  A1.ORD_NO
         ,  A1.R_MRCD
         ,  C1.CARMASTER_NM AS R_MR_NM
         ,  A1.PROC_DAY
         ,  A1.PROC_TM
         ,  A1.CHK_STAT
         ,  D1.CD_NM        AS CHK_STAT_NM
         ,  B1.FILE_PATH
         ,  B1.FILE_NAME
      FROM  RTCS0005 A1
         ,  RTSD0114 B1
         ,  RTCS0002 C1
         ,  RTCM0051 D1
     WHERE  1=1
       AND  A1.ORD_NO       = v_Ord_No
       AND  A1.CHK_STAT     = '04'
       AND  A1.ORD_NO       = B1.ORD_NO(+)
       AND  A1.SERV_SEQ     = B1.SEQ(+)
       AND  A1.R_MRCD       = C1.CARMASTER_NU(+)
       AND  A1.CHK_STAT     = D1.CD(+)
       AND  D1.CD_GRP_CD(+) = 'H008'
     ORDER  BY A1.STD_YM
         ,  A1.JOB_SEQ; 
     
     v_Success_code := 0;
     v_Return_Message := '정상적으로 처리되었습니다';
     v_ErrorText := '';
  
      EXCEPTION  
        WHEN e_Error THEN
            v_Success_code := -1;
            v_Return_Message := v_Return_Message;
            v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_sExif0003HomeSrvHistList(1)', v_ErrorText, v_Return_Message);

        WHEN OTHERS THEN
            v_Success_code := -1;
            v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_sExif0003HomeSrvHistList(2)', v_ErrorText, v_Return_Message); 
        
  END p_sExif0003HomeSrvHistList;
  
  /*****************************************************************************
  -- 계약서, 장착확인서 구분 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003FormDiv (
      v_Ord_No         IN VARCHAR2                                /* 계약번호 */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS
  
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  CASE WHEN ORD_ID IN ('01') THEN
                CASE WHEN TO_CHAR(SYSDATE,'YYYYMMDD') < '20170209' THEN
                    'A'
                ELSE
                    CASE WHEN STAT_CD IN ('03') THEN
                        'A'
                    ELSE
                        'B'
                    END
                END
--                WHEN ORD_ID IN ('03') THEN 'B' --일시불
                WHEN ORD_ID IN ('04') THEN 'B'   --멤버십 
            ELSE
                'C'
            END AS DOC_TYPE
         ,  CUST_TP
      FROM  RTSD0104
     WHERE  1=1
       AND  ORD_NO = v_Ord_No
    ;
    
  END p_sExif0003FormDiv;
  
  /*****************************************************************************
  -- 보관내역 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003StorageList (
      v_Cust_Nm        IN VARCHAR2                              /* 고객명     */
    , v_Car_No         IN VARCHAR2                              /* 차량번호   */
    , v_Agency_Cd      IN VARCHAR2                              /* 대리점코드 */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS
  
  BEGIN
    
    OPEN Ref_Cursor FOR
    WITH TMP_1 AS (
        SELECT  A1.CUST_NO
             ,  A1.CUST_NM
             ,  DECODE(A1.CUST_TP,'01',SUBSTR(A1.BIRTH_DAY,3,6),SUBSTR(A1.BUSL_NO,1,6)) ENC_CD
             ,  NVL(A1.MOB_NO,A1.TEL_NO) AS TEL_NO         
             ,  A1.ADDR1
             ,  A1.ADDR2
             ,  B1.ORD_NO
             ,  B1.CAR_NO
             ,  G1.CD_NM                 AS CNT_NM
             ,  F1.MAT_NM
             ,  C1.SERV_CNT0         
             ,  COUNT(1) OVER(PARTITION BY D1.ORD_NO) AS CNT_OVER
             ,  D1.STRG_SEQ
             ,  D1.AGENCY_CD         
             ,  D1.STRG_DAY
             ,  D1.DLVR_DAY 
             ,  D1.STRG_STAT                      
          FROM  RTSD0100 A1
             ,  RTSD0108 B1
             ,  RTSD0013 C1
             ,  RTCS0203 D1
             ,  RTSD0106 E1
             ,  RTSD0005 F1
             ,  RTCM0051 G1
         WHERE  1=1
           AND  A1.CUST_NM      = DECODE(TRIM(v_Cust_Nm), NULL, A1.CUST_NM, TRIM(v_Cust_Nm))
           AND  A1.CUST_NO      = B1.CUST_NO
           AND  B1.CAR_NO       = DECODE(TRIM(v_Car_No), NULL, B1.CAR_NO, TRIM(v_Car_No))
           AND  B1.ORD_NO       = C1.ORD_NO(+)
           AND  C1.PRS_DCD(+)   = 'B00004'
           AND  B1.ORD_NO       = D1.ORD_NO(+)
           AND  D1.STRG_YN(+)   = 'Y'
           AND  D1.SRSV_YN(+)   = 'Y'
           AND  B1.ORD_NO       = E1.ORD_NO
           AND  E1.MAT_CD       = F1.MAT_CD(+)
           AND  E1.CNT_CD       = G1.CD(+)
           AND  G1.CD_GRP_CD(+) = 'S022'
    )
    SELECT  DISTINCT A2.CUST_NO
         ,  A2.CUST_NM
         ,  A2.ENC_CD
         ,  A2.TEL_NO
         ,  A2.ADDR1
         ,  A2.ADDR2
         ,  A2.ORD_NO
         ,  A2.CAR_NO
         ,  A2.CNT_NM
         ,  A2.MAT_NM
         ,  A2.SERV_CNT0     
         ,  A2.CNT_OVER
         ,  0            AS STRG_SEQ
         ,  NULL         AS AGENCY_CD
         ,  NULL         AS STRG_DAY
         ,  NULL         AS DLVR_DAY
         ,  'A'          AS STRG_STAT
         ,  '보관가능'   AS STRG_STATNM     
      FROM  TMP_1 A2
     WHERE  1=1
       AND  A2.SERV_CNT0 > A2.CNT_OVER
       AND  A2.STRG_STAT NOT IN ('S')
     UNION  ALL 
    SELECT  B2.*
         ,  C2.CD_NM     AS STRG_S
      FROM  TMP_1    B2
         ,  RTCM0051 C2
     WHERE  1=1 
       AND  B2.AGENCY_CD    = v_Agency_Cd
       AND  B2.STRG_STAT    = C2.CD(+)
       AND  C2.CD_GRP_CD(+) = 'C014'  
     ORDER  BY CUST_NO
         ,  ORD_NO
         ,  STRG_SEQ   
    ;
    
  END p_sExif0003StorageList;
  
  /*****************************************************************************
  -- 로디안 방문점검 예정건 일자별 카운트
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.4        2017-04-04  wjim             [20170404_03] 방문점검 확정기준 및 조회기준 변경
                                           - 1) 확정기준 : 예정시간이 00:00가 아닌 건 -> 컨택상태가 '완료'인 건
                                           - 2) 조회기준 : 컨택상태가 '취소'인 건은 대상에서 제외
   1.5        2017-05-29  wjim             [20170529_02] 당월 배정건만 조회
                                           - 배정월과 처리예정일이 다른 건의 경우 목록조회(p_sExif0003MrTodoList)에서 조회 안됨                                           
  *****************************************************************************/
  PROCEDURE p_sExif0003MrTodoCnt (
      v_User_Id        IN VARCHAR2                              /* 접속ID     */
    , v_Req_Ym         IN VARCHAR2                              /* 조회년월   */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS
  
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  A1.PLAN_DAY     
--         ,  SUM(DECODE(A1.PLAN_TM,'000000',1,'0000',1,0)) AS CNT_A 
--         ,  SUM(DECODE(A1.PLAN_TM,'000000',0,'0000',0,1)) AS CNT_B
         ,  SUM(DECODE(A1.OB_ST,'03',0,1)) AS CNT_A --[20170404_03] 1)
         ,  SUM(DECODE(A1.OB_ST,'03',1,0)) AS CNT_B
      FROM  RTCS0005 A1
     WHERE  A1.MR_CD       = v_User_Id
       AND  A1.STD_YM      = v_Req_Ym               --[20170529_02]
       AND  A1.PLAN_DAY LIKE v_Req_Ym||'%'
       AND  A1.CHK_STAT   IN ('01')
       AND  A1.OB_ST  NOT IN ('05')                 --[20170404_03] 2)
     GROUP  BY A1.PLAN_DAY
     ORDER  BY A1.PLAN_DAY      
    ;
    
  END p_sExif0003MrTodoCnt;
  
  /*****************************************************************************
  -- 로디안 방문점검 TO-DO 목록 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.4        2017-04-04  wjim             [20170404_03] 방문점검 확정기준 및 조회기준 변경
                                           - 1) 확정기준 : 예정시간이 00:00가 아닌 건 -> 컨택상태가 '완료'인 건
                                           - 2) 조회기준 : 컨택상태가 '취소'인 건은 대상에서 제외
   1.6        2017-05-31  wjim             [20170531_01] 로디안 방문점검 TO-DO 목록 조회기준 변경
                                           - 당월 배정건만 조회되던 부분 수정
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
   ) IS
  
    lv_Req_Day_F    VARCHAR2(8);
    lv_Req_Day_T    VARCHAR2(8);
    lv_Div_Cd       RTCS0005.CHK_STAT%TYPE;
  
    v_Appr_Amt      NUMBER;
    v_Dely_Day      VARCHAR2(8);
    
    e_Error EXCEPTION;
    
  BEGIN
  
-- 검증로직에 걸리는 경우 모바일앱에서 오류가 발생하여 의미가 없음
--    IF TRIM(v_User_Id) IS NULL THEN
--        v_Return_Message := '접속ID : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
--
--    IF (TRIM(v_Req_Day_F) IS NULL OR TRIM(v_Req_Day_T) IS NULL) AND TRIM(v_Cust_Nm) IS NULL AND TRIM(v_Car_No) IS NULL THEN
--        v_Return_Message := '조회기간, 고객명, 차량번호 : 최소한 하나 이상의 조회조건이 필요합니다!';
--        RAISE e_Error;
--    END IF;
--    
--    IF TRIM(v_Div_Cd) NOT IN ('0','1') THEN
--        v_Return_Message := '조회구분('||v_Div_Cd||') : 입력값이 유효하지 않습니다!';
--        RAISE e_Error;
--    END IF;
    
    -- 전체기간조회의 경우 조회기간 세팅
    IF TRIM(v_Req_Day_F) IS NULL OR TRIM(v_Req_Day_F) = '' THEN
        lv_Req_Day_F := SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6)||'01';  --시스템오픈일
    ELSE
        lv_Req_Day_F := TRIM(v_Req_Day_F);
    END IF;
     
    IF TRIM(v_Req_Day_T) IS NULL OR TRIM(v_Req_Day_T) = '' THEN
        lv_Req_Day_T := TO_CHAR(LAST_DAY(SYSDATE),'YYYYMMDD');
    ELSE
        lv_Req_Day_T := TRIM(v_Req_Day_T);        
    END IF;
    
    IF TRIM(v_Div_Cd) = '0' THEN
        lv_Div_Cd := '04';
    ELSE
        lv_Div_Cd := '01';
    END IF;
    
    -- 연체금액 체크
    -- 마지막 연체집계일 조회 [20161123-0001]
    SELECT  MAX(DELY_DAY)
    INTO  v_Dely_Day
    FROM  RTRE0100
    WHERE  DEL_YN = 'N';
        
    OPEN Ref_Cursor FOR
    SELECT  A1.PLAN_DAY
         ,  A1.PLAN_TM
         ,  A1.ORD_NO
         ,  A1.STD_YM
         ,  A1.EQU_NO
         ,  A1.JOB_SEQ
         ,  B1.SEQ
         ,  A1.CHK_STAT
         ,  H1.CD_NM                            AS CHK_STATNM
--         ,  DECODE(A1.PLAN_TM,'000000','A','0000','A','B') AS ASGN_STAT
         ,  DECODE(A1.OB_ST,'03','B','A')       AS ASGN_STAT --[20170404_03] 1)
         ,  D1.CUST_NM
         ,  NVL(B1.MOB_NO,B1.TEL_NO)            AS MOB_NO
         ,  B1.ADDR1
         ,  B1.ADDR2
         ,  MAX(E1.MAT_CD) AS MAT_CD
         ,  Pkg_Rtsd0005.f_sRtsd0005Matname(MAX(E1.MAT_CD)) AS MAT_NM
         --,  C1.CNT_CD
         ,  LPAD(SUM(TO_NUMBER(E1.CNT_CD)),2,'0')  AS CNT_CD
         ,  Pkg_Rtcm0051.f_sRtcm0051Codename('S022',LPAD(SUM(TO_NUMBER(E1.CNT_CD)),2,'0')) AS CNT_NM
         ,  C1.CAR_NO
         ,  C1.ORD_DAY
         ,  C1.PROC_DAY
         ,  C1.C_MILEAGE A_MILEAGE
         ,  (SELECT MAX(MILEAGE) FROM RTCS0011 WHERE ORD_NO = A1.ORD_NO) L_MILEAGE
         ,  C1.C_MILEAGE - (SELECT MAX(MILEAGE) FROM RTCS0011 WHERE ORD_NO = A1.ORD_NO) C_MILEAGE
         ,  B1.POSCD
         ,  B1.BLD_MNG_NO
         --,  Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(D1.CUST_NO, NULL, v_Dely_Day) DELY_AMT
         ,  CASE WHEN J1.APPR_SCNT > 1 THEN Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(D1.CUST_NO, NULL, v_Dely_Day) ELSE 0 END DELY_AMT
         ,  v_Dely_Day DELY_DAY
         ,  C1.MFP_YN
         ,  'B00003' PRS_DCD
         ,  CASE WHEN K1.LOT_MB = '0' THEN K1.DO_NM || ' ' || K1.CT_NM || ' ' || K1.B_DNG_NM || ' ' || K1.B_RI_NM 
                 WHEN K1.LOT_SB = '0' THEN K1.DO_NM || ' ' || K1.CT_NM || ' ' || K1.B_DNG_NM || ' ' || K1.B_RI_NM || ' ' || K1.LOT_MB
                 ELSE K1.DO_NM || ' ' || K1.CT_NM || ' ' || K1.B_DNG_NM || ' ' || K1.B_RI_NM || ' ' || K1.LOT_MB || '-' || K1.LOT_SB END  ADDR3
         ,  C1.OS_DAY
         ,  A1.OB_ST_DTL   
         ,  (SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S002' AND CD = C1.MODEL_CD) MODEL_NM  
         ,  NVL(E1.SALE_CD, 'S000000247') AS SALE_CD
         ,  NVL((SELECT SAL.SALE_NM  FROM RTSD0020 SAL WHERE SAL.SALE_CD = E1.SALE_CD), '슈퍼렌탈') AS SALE_NM  
         ,  E1.ORD_ID
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
         ,  RTCM0051 H1
         ,  RTCM0051 I1
         ,  (
                SELECT * FROM (SELECT X.*,  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY X.DELY_DAY DESC) AS ROW_NUM
                  FROM  RTRE0100 X)
                  WHERE ROW_NUM = 1                  
            ) J1
         ,  RTSD0010 K1
     WHERE  A1.MR_CD        = v_User_Id
       AND  A1.PLAN_DAY BETWEEN v_Req_Day_F AND v_Req_Day_T
--       AND  A1.STD_YM       = SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6) --[20170531_01] 주석처리
       AND  A1.OB_ST   NOT IN ('05')                 --[20170404_03] 2)
       AND  A1.STD_YM       = B1.STD_YM
       AND  A1.ORD_NO       = B1.ORD_NO
       AND  A1.EQU_NO       = B1.EQU_NO
       AND  A1.JOB_SEQ      = B1.JOB_SEQ
       AND  B1.ROW_NUM      = 1
       AND  A1.ORD_NO       = C1.ORD_NO
       AND  C1.CUST_NO      = D1.CUST_NO
       AND  C1.CAR_NO    LIKE '%'||v_Car_No||'%'
       AND  D1.CUST_NM   LIKE '%'||v_Cust_Nm||'%'   
       AND  C1.ORD_NO       = E1.ORD_NO   
       AND  E1.MAT_CD       = F1.MAT_CD(+) 
       AND  A1.CHK_STAT     = H1.CD(+)
       AND  H1.CD_GRP_CD(+) = 'H008'
       AND  C1.CNT_CD       = I1.CD(+)
       AND  I1.CD_GRP_CD(+) = 'S022'
       --AND  A1.CHK_STAT    <= lv_Div_Cd
       AND  A1.CHK_STAT    IN ('01', '04')  
       AND  A1.ORD_NO      = J1.ORD_NO(+)
       AND  B1.BLD_MNG_NO  = K1.BLD_MNG_NO(+)
    GROUP BY  A1.PLAN_DAY,A1.PLAN_TM,A1.ORD_NO,A1.STD_YM,A1.EQU_NO,A1.JOB_SEQ,B1.SEQ,A1.CHK_STAT,H1.CD_NM,A1.OB_ST,D1.CUST_NM,NVL(B1.MOB_NO,B1.TEL_NO)
             ,B1.ADDR1,B1.ADDR2,C1.CAR_NO,C1.ORD_DAY,C1.PROC_DAY,C1.C_MILEAGE,C1.C_MILEAGE,B1.POSCD,B1.BLD_MNG_NO
             ,J1.APPR_SCNT,C1.MFP_YN,K1.LOT_MB,K1.DO_NM,K1.CT_NM,K1.B_DNG_NM,K1.B_RI_NM,K1.LOT_MB,K1.LOT_SB,D1.CUST_NO
             ,C1.OS_DAY,A1.OB_ST_DTL,C1.MODEL_CD,E1.SALE_CD,E1.ORD_ID,A1.REG_DT
     ORDER  BY A1.PLAN_DAY
         ,  A1.PLAN_TM
         ,  A1.REG_DT
    ;
     
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
  
  EXCEPTION  
    WHEN e_Error THEN
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_sExif0003MrTodoList(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_sExif0003MrTodoList(2)', v_ErrorText, v_Return_Message);    
  
  END p_sExif0003MrTodoList;
  
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
  ) IS
  
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  A1.PLAN_DAY
         ,  A1.PLAN_TM
         ,  A1.ORD_NO
         ,  A1.STD_YM
         ,  A1.EQU_NO
         ,  A1.JOB_SEQ
         ,  B1.SEQ
         ,  A1.CHK_STAT
         ,  H1.CD_NM                            AS CHK_STATNM
         ,  DECODE(A1.PLAN_TM,'000000','A','B') AS ASGN_STAT
         ,  D1.CUST_NM
         ,  NVL(B1.MOB_NO,B1.TEL_NO)            AS MOB_NO
         ,  NVL((SELECT C_REAL_MOB_NO FROM RTSD0104 WHERE ORD_NO = A1.ORD_NO),'')  AS REAL_MOB_NO
         ,  NVL(B1.TEL_NO,'')                   AS TEL_NO
         ,  B1.ADDR1
         ,  B1.ADDR2
         ,  LISTAGG(E1.MAT_CD, ',') WITHIN GROUP (ORDER BY E1.MAT_CD) AS MAT_CD           /*상품코드       */
         ,  LISTAGG(DECODE(E1.FR_CD,'Z','(범용)','F','(앞)','R','(뒤)')||Pkg_Rtsd0005.f_sRtsd0005Matname(E1.MAT_CD), ',') WITHIN GROUP (ORDER BY E1.FR_CD, E1.MAT_CD)          AS MAT_NM
         ,  LPAD(SUM(TO_NUMBER(E1.CNT_CD)),2,'0')  AS CNT_CD
         ,  Pkg_Rtcm0051.f_sRtcm0051Codename('S022',LPAD(SUM(TO_NUMBER(E1.CNT_CD)),2,'0')) AS CNT_NM
         ,  C1.CAR_NO
         ,  C1.ORD_DAY
         ,  C1.PROC_DAY
         ,  C1.C_MILEAGE A_MILEAGE
         ,  (SELECT MAX(MILEAGE) FROM RTCS0011 WHERE ORD_NO = A1.ORD_NO) L_MILEAGE
         ,  C1.C_MILEAGE - (SELECT MAX(MILEAGE) FROM RTCS0011 WHERE ORD_NO = A1.ORD_NO) C_MILEAGE
         ,  B1.POSCD POS_CD
         ,  B1.BLD_MNG_NO
         ,  A1.REQ_DESC
         ,  A1.NP_CD
         ,  A1.NP_DESC
         ,  CASE WHEN LOT_MB = '0' THEN J1.DO_NM || ' ' || J1.CT_NM || ' ' || J1.B_DNG_NM || ' ' || J1.B_RI_NM 
                 WHEN LOT_SB = '0' THEN J1.DO_NM || ' ' || J1.CT_NM || ' ' || J1.B_DNG_NM || ' ' || J1.B_RI_NM || ' ' || J1.LOT_MB
                 ELSE J1.DO_NM || ' ' || J1.CT_NM || ' ' || J1.B_DNG_NM || ' ' || J1.B_RI_NM || ' ' || J1.LOT_MB || '-' || J1.LOT_SB END  ADDR3
         ,  C1.OS_DAY
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
         ,  RTCM0051 H1
         ,  RTCM0051 I1
         ,  RTSD0010 J1
     WHERE  1=1
       AND  A1.STD_YM       = v_Std_Ym
       AND  A1.ORD_NO       = v_Ord_No
       AND  A1.EQU_NO       = v_Equ_No
       AND  A1.JOB_SEQ      = v_Job_Seq
       AND  A1.STD_YM       = B1.STD_YM
       AND  A1.ORD_NO       = B1.ORD_NO
       AND  A1.EQU_NO       = B1.EQU_NO
       AND  A1.JOB_SEQ      = B1.JOB_SEQ
       AND  B1.ROW_NUM      = 1
       AND  B1.SEQ          = v_Seq
       AND  A1.ORD_NO       = C1.ORD_NO
       AND  C1.CUST_NO      = D1.CUST_NO  
       AND  C1.ORD_NO       = E1.ORD_NO   
       AND  E1.MAT_CD       = F1.MAT_CD(+) 
       AND  A1.CHK_STAT     = H1.CD(+)
       AND  H1.CD_GRP_CD(+) = 'H008'
       AND  C1.CNT_CD       = I1.CD(+)
       AND  I1.CD_GRP_CD(+) = 'S022' 
       AND  B1.BLD_MNG_NO   = J1.BLD_MNG_NO(+)
    GROUP BY  A1.PLAN_DAY,A1.PLAN_TM,A1.ORD_NO,A1.STD_YM,A1.EQU_NO,A1.JOB_SEQ,B1.SEQ,A1.CHK_STAT,H1.CD_NM,A1.PLAN_TM,D1.CUST_NM,NVL(B1.MOB_NO,B1.TEL_NO)
             ,B1.TEL_NO,B1.ADDR1,B1.ADDR2,C1.CAR_NO,C1.ORD_DAY,C1.PROC_DAY,C1.C_MILEAGE,B1.POSCD,B1.BLD_MNG_NO,A1.REQ_DESC,A1.NP_CD,A1.NP_DESC,A1.REG_DT
             ,LOT_MB,J1.DO_NM,J1.CT_NM,J1.B_DNG_NM,J1.B_RI_NM,LOT_SB,C1.OS_DAY
     ORDER  BY A1.PLAN_DAY
         ,  A1.PLAN_TM
         ,  A1.REG_DT
    ;
     
  END p_sExif0003MrDetail;
  
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
  ) IS
  
    v_Reserved_Fg   RTSD0205.RESERVED_FG%TYPE;
    v_Rdttm         RTSD0205.RESERVED_DTTM%TYPE;  
    v_Rcv_Phn_Id    RTSD0205.RCV_PHN_ID%TYPE;
    v_Snd_Phn_Id    RTSD0205.SND_PHN_ID%TYPE;
    v_Snd_Msg       RTSD0205.SND_MSG%TYPE;
    v_Etc_Char_1    RTSD0205.ETC_CHAR_1%TYPE;
    v_Etc_Char_2    RTSD0205.ETC_CHAR_2%TYPE;
  
    e_Error EXCEPTION;
    
  BEGIN
  
    v_Reserved_Fg := 'I';
    v_Rdttm       := TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS');
    v_Rcv_Phn_Id  := v_Rcv_No;
    v_Snd_Phn_Id  := '18550100';
  
    -- 방문점검 고객통화 불가 시
    IF v_Sms_Div = '01' THEN
        IF TRIM(v_Rcv_Phn_Id) IS NULL THEN
            v_Return_Message := '받는 전화번호 : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        v_Etc_Char_1 := 'BMA01';
        v_Etc_Char_2 := v_Ord_No;        
        --v_Snd_Msg    := '고객님께서 가입하신 타이어렌탈서비스 방문점검 관련 연락드렸으나 통화 불가로 문자드립니다. 연락부탁드립니다.';
        v_Snd_Msg    := v_In_Val;
        
--        SELECT  MOB_NO
--          INTO  v_Rcv_Phn_Id
--          FROM  RTCS0002
--         WHERE  CARMASTER_NU = v_User_Id;
    ELSE
        v_Return_Message := 'SMS발송구분('||v_Sms_Div||') : 유효한 입력값이 아닙니다!';
        RAISE e_Error;
    END IF;
    
    Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
          v_Reserved_Fg  /*예약 전송여부    */
        , v_Rdttm        /*예약 전송시간    */
        , v_Rcv_Phn_Id   /*받는 전화번호    */
        , v_Snd_Phn_Id   /*보내는 전화번호  */
        , v_Snd_Msg      /*메시지내용       */
        , v_Etc_Char_1   /*사용자지정 필드1 */
        , v_Etc_Char_2   /*사용자지정 필드2 */
        , '2'
        , v_tmplateNo
        , v_User_Id      /*등록자 ID        */
        , v_Success_Code
        , v_Return_Message
        , v_ErrorText
    );
    
    IF v_Success_Code != 0 THEN
        v_Return_Message := 'SMS발송 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_iExif0003SendSms(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_iExif0003SendSms(2)', v_ErrorText, v_Return_Message); 
        
  END p_iExif0003SendSms;
  
  /*****************************************************************************
  -- 공지사항 목록조회
  *****************************************************************************/
  PROCEDURE p_sExif0003NoticeList (
      v_Page_No        IN NUMBER                         /* 페이지            */
    , v_Get_Cnt        IN NUMBER                         /* 페이지당 공지건수 */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A3.*
      FROM  (
                SELECT  A2.NTC_SEQ
                     ,  A2.NTC_TYPE
                     ,  A2.TITLE
                     ,  A2.START_DT
                     ,  SUM(NVL2(A2.FILE_SEQ,1,0)) AS CNT_FILE
                     ,  ROW_NUMBER() OVER (ORDER BY A2.NTC_SEQ DESC) AS ROW_NUM
                  FROM  (
                            SELECT  A1.NTC_SEQ
                                 ,  A1.NTC_TYPE
                                 ,  A1.TITLE
                                 ,  A1.START_DT
                                 ,  B1.FILE_SEQ
                              FROM  RTCM0030 A1
                                 ,  RTCM0040 B1
                             WHERE  1=1
                               AND  A1.DEL_YN       = 'N'
                               AND  A1.START_DT    <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                               AND  A1.END_DT      >= TO_CHAR(SYSDATE, 'YYYYMMDD')
                               AND  A1.ATTCH_FL_SEQ = B1.FILE_GRP_SEQ(+)
                               AND  B1.USE_YN(+)    = 'Y'
                        ) A2
                 GROUP  BY A2.NTC_SEQ
                     ,  A2.NTC_TYPE
                     ,  A2.TITLE
                     ,  A2.START_DT
            ) A3     
     WHERE  A3.ROW_NUM BETWEEN (((v_Page_No - 1) * v_Get_Cnt)+1)  AND (v_Page_No * v_Get_Cnt)      
     ORDER  BY A3.ROW_NUM        
    ;

  END p_sExif0003NoticeList;
  
  /*****************************************************************************
  -- 공지사항 상세내용 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003NoticeDetail (
      v_Ntc_Seq        IN NUMBER                         /* 공지순번          */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.NTC_SEQ
         ,  A1.NTC_TYPE
         ,  A1.TITLE
         ,  A1.START_DT
         ,  A1.CONTENTS
      FROM  RTCM0030 A1
     WHERE  1=1
       AND  A1.NTC_SEQ = v_Ntc_Seq
    ;   

  END p_sExif0003NoticeDetail;
  
  /*****************************************************************************
  -- 공지사항 첨부파일 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003NoticeFile (
      v_Ntc_Seq        IN NUMBER                         /* 공지순번          */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.NTC_SEQ
         ,  B1.FILE_GRP_SEQ     
         ,  B1.FILE_SEQ     
         ,  B1.FILE_LNM
         ,  B1.FILE_PNM
         ,  B1.FILE_PATH
         ,  B1.FILE_SIZE
      FROM  RTCM0030 A1
         ,  RTCM0040 B1
     WHERE  1=1
       AND  A1.NTC_SEQ      = v_Ntc_Seq
       AND  A1.ATTCH_FL_SEQ = B1.FILE_GRP_SEQ(+)
       AND  B1.USE_YN(+)    = 'Y'
    ;

  END p_sExif0003NoticeFile;
  
  /*************************************************************************************
  -- 고객정보 동의 여부 확인 2018-12-13 고도화 계약목록조회 시 고객 동의여부 체크
  **************************************************************************************/
  FUNCTION f_Exif0003UseAccChkYN(
    v_Cust_No            IN RTSD0111.CUST_NO%TYPE          /*DI                */
  ) RETURN VARCHAR IS
    CNT NUMBER;
    v_AG_YN RTSD0111.CUST_NO%TYPE;
  BEGIN

    SELECT  COUNT(*)
    INTO    CNT
    FROM    RTSD0111
    WHERE   CUST_NO = v_Cust_No;
    
    IF CNT > 0 THEN
        v_AG_YN := 'Y';
    ELSE
        v_AG_YN := 'N';
    END IF;
        
    RETURN v_AG_YN;
    
  EXCEPTION
      WHEN OTHERS THEN
        RETURN 'N';

  END f_Exif0003UseAccChkYN;
  
  /*****************************************************************************
  -- 고객정보조회
  *****************************************************************************/
  PROCEDURE p_sExif0003CustInfoDtl (
      v_Cust_No        IN VARCHAR2                              /* 고객번호   */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO
         ,  CUST_TP
         ,  CUST_TP2
         ,  CUST_NM
         ,  BIRTH_DAY
         ,  GENDER_CD
         ,  LF_CD
         ,  MOB_NO
         ,  MOB_FIRM
         ,  TEL_NO
         ,  FAX_NO
         ,  BLD_MNG_NO
         ,  POS_CD
         ,  ADDR1
         ,  ADDR2
         ,  TEL_NO2
         ,  BLD_MNG_NO2
         ,  POS_CD2
         ,  ADDR1_2
         ,  ADDR2_2
         ,  SAFEKEY
         ,  BUSL_NO
         ,  CORP_NO
         ,  REP_NM
         ,  O_CUSTNM
         ,  O_BIRTHDAY
         ,  O_GENDERCD
         ,  O_LFCD
         ,  O_MOBNO
         ,  O_SAFEKEY
         ,  C_CUSTNM
         ,  C_TELNO
         ,  EMAIL_ADDR
         ,  BUSI_TYPE
         ,  BUSI_COND
         ,  TAX_YN
         ,  KUNNR
         ,  CI_CD
         ,  DI_CD
         ,  USE_YN
         ,  REG_ID
         ,  REG_DT
         ,  CHG_ID
         ,  CHG_DT
         , B.CERT_CD
      FROM  RTSD0100 A, 
      (SELECT CUST_NO, CERT_CD FROM 
              (SELECT C.*, ROW_NUMBER () OVER (PARTITION BY CUST_NO ORDER BY SEQ DESC) NUM FROM RTSD0110 C) 
               WHERE NUM = 1) B
      WHERE A.CUST_NO = B.CUST_NO(+)
      AND A.CUST_NO = v_Cust_No
    ;

  END p_sExif0003CustInfoDtl;
  
  /*****************************************************************************
  -- 고객/회원정보 저장
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.8        2018-08-16  wjim             [20180816_01] 고객정보 등록 시 전화번호 없는 경우 휴대폰번호로 대체
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
  ) IS
  
    lv_Gender_Cd    RTSD0100.GENDER_CD%TYPE;      /*성별                  */
    lv_Lf_Cd        RTSD0100.LF_CD%TYPE;          /*내외국인              */
    lv_Tel_No       RTSD0100.TEL_NO%TYPE;         /*전화번호              */
    v_DI_DupeChk    VARCHAR2(20); --DI중복여부
    v_Seq           RTSD0110.SEQ%TYPE;            /*시퀀스                */
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Tp) IS NULL THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Tp2 ) IS NULL THEN
        v_Return_Message := '고객분류('||v_Cust_Tp2 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm ) IS NULL THEN
        v_Return_Message := '고객명/법인명('||v_Cust_Nm ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mob_No ) IS NULL THEN
        v_Return_Message := '휴대폰번호('||v_Mob_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_Tp) = '01' THEN
      IF 0 != Pkg_Rtsd0100.f_sRtsd0100SafekeyCount(v_Safekey) THEN
          v_Return_Message := '인증번호로 이미 등록된 고객이 있습니다!';
          RAISE e_Error;
      END IF;
    END IF;

    IF TRIM(v_Cust_Tp) = '02' THEN
      IF 0 != Pkg_Rtsd0100.f_sRtsd0100BuslCount(v_Busl_No) THEN
          v_Return_Message := '사업자번호로 이미 등록된 고객이 있습니다!';
          RAISE e_Error;
      END IF;
    END IF;
    
    -- NICE 성별코드를 시스템에 맞게 매핑
    IF v_Gender_Cd = '0' THEN
        lv_Gender_Cd := 2;  --여성
    ELSE
        lv_Gender_Cd := 1;  --남성
    END IF;
    
    -- NICE 외국인코드를 시스템에 맞게 매핑
    IF v_Lf_Cd = '0' THEN
        lv_Lf_Cd := 1;  --내국인
    ELSE
        lv_Lf_Cd := 2;  --외국인
    END IF;
    
    lv_Tel_No := REPLACE(TRIM(v_Tel_No),'-','');
    
    IF 0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No) THEN

        IF TRIM(v_Cust_Tp) = '01' THEN
          IF 0 != Pkg_Rtsd0100.f_sRtsd0100SafekeyCount(v_Safekey) THEN
              v_Return_Message := '인증번호로 이미 등록된 고객이 있습니다!';
              RAISE e_Error;
          END IF;
        END IF;

        IF TRIM(v_Cust_Tp) = '02' THEN
          IF 0 != Pkg_Rtsd0100.f_sRtsd0100BuslCount(v_Busl_No) THEN
              v_Return_Message := '사업자번호로 이미 등록된 고객이 있습니다!';
              RAISE e_Error;
          END IF;
        END IF;

                  
        v_Cust_No := Pkg_Rtsd0100.f_sRtsd0100CustNo();

        -- 전화번호 미입력의 경우 휴대폰번호로 대체 [20180816_01]
        IF TRIM(lv_Tel_No) IS NULL THEN
            lv_Tel_No := REPLACE(TRIM(v_Mob_No),'-','');
        END IF;
           
        IF 0 != Pkg_Rtsd0100.f_InsertRtsd0100(v_Cust_No,v_Cust_Tp,v_Cust_Tp2,v_Cust_Nm,
                                 v_Birth_Day,lv_Gender_Cd,lv_Lf_Cd,REPLACE(TRIM(v_Mob_No),'-',''),
                                 v_Mob_Firm,REPLACE(TRIM(NVL(lv_Tel_No, '')),'-',''),REPLACE(TRIM(NVL(v_Fax_No, '')),'-',''),v_Bld_Mng_No,
                                 v_Pos_Cd,v_Addr1,v_Addr2,v_Tel_No2,
                                 v_Bld_Mng_No2,v_Pos_Cd2,v_Addr1_2,v_Addr2_2,
                                 v_Safekey,v_Busl_No,v_Corp_No,v_Rep_Nm,
                                 v_O_Custnm,v_O_Birthday,v_O_Gendercd,v_O_Lfcd,
                                 v_O_Mobno,v_O_Safekey,v_C_Custnm,REPLACE(TRIM(NVL(v_C_Telno, '')),'-',''),
                                 v_Email_Addr,v_Busi_Type,v_Busi_Cond,v_Tax_Yn,
                                 v_Kunnr,v_Ci_Cd,v_Di_Cd,v_Use_Yn,
                                 v_Reg_Id,v_Errortext) THEN
            v_Return_Message := '고객 마스터 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN
            
            -- 전화번호 미입력의 경우 기존 전화번호로 대체 [20180816_01]
            IF TRIM(lv_Tel_No) IS NULL THEN
                BEGIN                
                    SELECT  NVL(TRIM(TEL_NO), REPLACE(TRIM(v_Mob_No),'-',''))
                      INTO  lv_Tel_No
                      FROM  RTSD0100
                     WHERE  CUST_NO = v_Cust_No;
                EXCEPTION
                    WHEN others THEN
                        v_Return_Message := '기존 전화번호 조회오류! : '||SQLERRM;
                        RAISE e_Error;
                END;
            END IF;

            IF 0 != Pkg_Rtsd0100.f_UpdateRtsd0100(v_Cust_No,v_Cust_Tp,v_Cust_Tp2,v_Cust_Nm,
                                     v_Birth_Day,lv_Gender_Cd,lv_Lf_Cd,REPLACE(TRIM(v_Mob_No),'-',''),
                                     v_Mob_Firm,REPLACE(TRIM(NVL(lv_Tel_No, '')),'-',''),REPLACE(TRIM(NVL(v_Fax_No, '')),'-',''),v_Bld_Mng_No,
                                     v_Pos_Cd,v_Addr1,v_Addr2,v_Tel_No2,
                                     v_Bld_Mng_No2,v_Pos_Cd2,v_Addr1_2,v_Addr2_2,
                                     v_Safekey,v_Busl_No,v_Corp_No,v_Rep_Nm,
                                     v_O_Custnm,v_O_Birthday,v_O_Gendercd,v_O_Lfcd,
                                     v_O_Mobno,v_O_Safekey,v_C_Custnm,REPLACE(TRIM(NVL(v_C_Telno, '')),'-',''),
                                     v_Email_Addr,v_Busi_Type,v_Busi_Cond,v_Tax_Yn,
                                     v_Kunnr,v_Ci_Cd,v_Di_Cd,v_Use_Yn,
                                     v_Reg_Id,v_Errortext) THEN
                v_Return_Message := '고객 마스터 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;

    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0101.f_InsertRtsd0101(v_Cust_No, v_ErrorText) THEN
        v_Return_Message := '이력 등록 실패!!!';
        RAISE e_Error;
    END IF;
    
    -- 본인인증 이력 생성
    Pkg_Rtsd0110.p_IUDRtsd0110('I', v_Cust_No, v_Seq, TO_CHAR(SYSDATE, 'YYYYMMDD'), v_Safekey, '01', 'Y', REPLACE(TRIM(v_Mob_No),'-',''), 'SK', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '본인인증 이력 등록 실패!!!';
        RAISE e_Error;
    END IF;
    
--    [20240117_01] kstka 업무용앱에서 쇼핑몰 회원가입 BLOCK처리
--    v_DI_DupeChk := NEXENSHOP.Pkg_Mall001.f_Mall001_enterdupe(v_Di_Cd);
--    
--    IF v_DI_DupeChk IS NOT NULL AND v_DI_DupeChk<>' ' THEN
--        -- 이미 온라인회원인 경우
--        NEXENSHOP.Pkg_Mall001.p_Mall001_MemModEntry (
--              v_Di_Cd          /* DI                */
--            , v_Pos_Cd      /*우편번호 */
--            , v_Addr1        /*주소 */
--            , v_Addr2   /*상세주소 */
--            , v_Bld_Mng_No   /*빌딩번호 */
--            , v_Mob_No   /*휴대폰번호 */
--            , v_Tel_No   /*전화번호 */   /*전화번호 */
--            , v_Email_Addr   /*이메일 */
--            , v_Reg_Id   /*변경자 */
--            , v_Success_Code
--            , v_Return_Message
--            , v_ErrorText
--        );
--         
--    ELSE
--        -- 신규 회원가입의 경우
--        NEXENSHOP.Pkg_Mall001.p_Mall001_MemEntry (
--              REPLACE(TRIM(v_Mob_No),'-','')  /*회원ID=휴대폰번호            */
--            , v_Cust_Nm         /*회원이름          */
--            , v_Birth_Day   /*법정생년월일      */
--            , v_Gender_Cd         /*성별              */
--            , v_Lf_Cd         /*외국인여부        */
--            , v_Ci_Cd          /*CI                */
--            , v_Di_Cd          /*DI                */
--            , v_Vn_Val          /*가상주민번호(ipin경우)*/
--            , v_Safekey         /*safekey           */
--            , NULL /*주소구분코드(자택/회사)*/
--            , v_Pos_Cd      /*우편번호 */
--            , v_Addr1        /*주소 */
--            , v_Addr2   /*상세주소 */
--            , v_Mob_No   /*휴대폰번호 */
--            , v_Tel_No   /*전화번호 */
--            , v_Email_Addr   /*이메일 */
--            , NULL   /*이메일수신여부 */
--            , NULL   /*차량소유여부 */
--            , v_Success_Code
--            , v_Return_Message
--            , v_ErrorText
--        );
--        
--    END IF;
--    
--    IF 0 != v_Success_Code THEN
--        v_Return_Message := '온라인 회원정보(TBL_CUST_INFO) 생성 실패!!!'||v_Return_Message;
--        v_ErrorText := v_ErrorText;
--        RAISE e_Error;
--    END IF;
--    
--    IF v_DI_DupeChk IS NULL AND v_DI_DupeChk = ' ' THEN
--    
--        BEGIN
--        
--            
--            
--                SELECT  CUST_NO
--                  INTO  v_Custno_Onl
--                  FROM  NEXENSHOP.TBL_CUST_INFO
--                 WHERE  CUST_ID = REPLACE(TRIM(v_Mob_No),'-','')
--                   AND  DI_VAL  = v_Di_Cd;
--           
--               
--        EXCEPTION
--            WHEN OTHERS THEN
--                v_Return_Message := '온라인 회원번호(TBL_CUST_INFO) 조회 실패!!!';
--                RAISE e_Error;       
--        END;               
--
--    END IF;

    
    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Exif0003.p_saveExif0003CustInfo(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Exif0003.p_saveExif0003CustInfo(2)', v_ErrorText, v_Return_Message);

  END p_saveExif0003CustInfo;
  
  /*****************************************************************************
  -- 사용자정보 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003UserInfo (
      v_User_Id        IN VARCHAR2                              /* 접속자ID   */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.USER_ID      
         ,  B1.AGENCY_CD                   AS INS_STORE_CD     
         ,  NVL(B1.SALES_GROUP, A1.VKGRP)  AS SALES_GROUP
         ,  NVL(B1.SALES_OFFICE, A1.VKBUR) AS SALES_OFFICE
         ,  NULL                           AS RECOM_SAL_CD
         --,  NVL2(B1.AGENCY_CD,'01',NULL)   AS CHAN_CD
         ,  CASE WHEN AGENCY_CD IS NULL THEN NULL 
            ELSE DECODE(A1.USER_GRP, '15', '05', '01') END  AS CHAN_CD
      FROM  RTCM0001 A1
         ,  RTSD0007 B1
     WHERE  A1.USER_ID = v_User_Id
       AND  A1.AGENT_ID = B1.AGENCY_CD(+)   
    ;

  END p_sExif0003UserInfo;
  
  /*****************************************************************************
  -- 주문 시 패턴콤보 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003PtnList (
      v_Class_Cd       IN VARCHAR2                             /* 차량분류   */
    , v_Model_Cd       IN VARCHAR2                            /* 차종코드   */ 
    , v_Contents_Cd    IN VARCHAR2                            /* 사양코드   */
    , v_Fr_Cd          IN VARCHAR2                              /* 전후 구분 코드 F:전륜, R:후륜, Z:범용  20181221 고도화추가*/
    , v_Sale_Cd        IN VARCHAR2                              /* 상품코드 , 자유렌탈, 추천렌탈 상품에 포함된 패턴만 노출 20200428 kstka  A(추천):B(자유)*/
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A2.CLASS_CD
         ,  D2.CD_NM      AS CLASS_NM
         ,  A2.SEASON_CD
         ,  E2.CD_NM      AS SEASON_NM
         ,  A2.PETTERN_CD
         ,  F2.CD_NM      AS PETTERN_NM
         ,  B2.STPNT_CONT
         ,  B2.LIST_ICON
         ,  B2.MODEL_NM
         ,  B2.RECOM_YN  
         ,  C2.ATFL_PATH_NM 
         ,  A2.FR_CD
      FROM  (
                SELECT  A1.CLASS_CD
                     ,  A1.FR_CD
                     ,  B1.SEASON_CD
                     ,  B1.PETTERN_CD
                     ,  MAX(AMT) AS AMT_RENT
                  FROM  RTSD0004 A1
                     ,  RTSD0005 B1
                     ,  RTSD0008 C1
                     ,  RTSD0020 D1
                     ,  RTSD0021 E1
                     ,  RTSD0045 F1
                 WHERE  A1.CLASS_CD      = v_Class_Cd
                   AND  A1.MODEL_CD      = v_Model_Cd
                   AND  A1.FR_CD         = v_Fr_Cd
                   AND  A1.CONTENTS_CD   = DECODE(v_Contents_Cd, NULL, CONTENTS_CD, v_Contents_Cd)
                   AND  A1.USE_YN        = 'Y'
                   AND  A1.SECTION_WIDTH = B1.SECTION_WIDTH
                   AND  A1.ASPECT_RATIO  = B1.ASPECT_RATIO
                   AND  A1.WHEEL_INCHES  = B1.WHEEL_INCHES
                   AND  B1.USE_YN        = 'Y'
                   AND  B1.MAT_CD        = C1.MAT_CD
                   AND  A1.WHEEL_QTY     = TO_NUMBER(C1.CNT_CD)
                   AND  C1.STR_DAY      <= TO_CHAR(SYSDATE,'YYYYMMDD')
                   AND  C1.END_DAY      >= TO_CHAR(SYSDATE,'YYYYMMDD')
                   AND  C1.USE_YN        = 'Y'
                   AND  C1.PRICE_CD     IN ('0002') /* [20170313_01] */
--                   AND  (( v_Sale_Cd = 'A' AND D1.SALE_CD NOT IN ('S000000092')) 
--                            OR (v_Sale_Cd = 'B' AND D1.SALE_CD IN ('S000000092')))    /* [20200428_01] 상품별 노출 패턴 필터링*/
                   AND  (( v_Sale_Cd = 'A' AND D1.PRDT_GRP_DTL NOT IN ('04')) 
                            OR (v_Sale_Cd = 'B' AND D1.PRDT_GRP_DTL IN ('04')))    /* [20200428_01] 상품별 노출 패턴 필터링*/
                   AND  D1.SALE_CD = E1.SALE_CD
                   AND  E1.SALE_CD = F1.SALE_CD
                   AND  D1.USE_YN = 'Y'
                   AND  TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN D1.SALE_STR_DAY AND D1.SALE_END_DAY
                   AND  F1.CHAN_CD = '01'
                   AND  B1.PETTERN_CD = E1.SALE_GDS_CD
                 GROUP  BY A1.CLASS_CD
                     ,  A1.FR_CD
                     ,  B1.SEASON_CD
                     ,  B1.PETTERN_CD
            ) A2
         ,  NEXENSHOP.TBL_ORD_PATN_INFO B2
         ,  (
                SELECT  ROW_NUMBER() OVER (PARTITION BY Z.PATTERN_CD, Z.ATFL_CLASS_CD ORDER BY Z.ATFL_SEQ DESC) AS ROW_NUM
                     ,  Z.*
                  FROM  NEXENSHOP.TBL_ORD_PATN_ATFL Z
                 WHERE  ATFL_CLASS_CD = '1'
            ) C2
         ,  RTCM0051 D2
         ,  RTCM0051 E2
         ,  RTCM0051 F2
     WHERE  A2.PETTERN_CD   = B2.PATTERN_CD
       AND  A2.PETTERN_CD   = C2.PATTERN_CD(+)  
       AND  C2.ROW_NUM(+)   = '1'
       AND  A2.CLASS_CD     = D2.CD(+)
       AND  D2.CD_GRP_CD(+) = 'S015' 
       AND  A2.SEASON_CD    = E2.CD(+)
       AND  E2.CD_GRP_CD(+) = 'S014' 
       AND  A2.PETTERN_CD   = F2.CD(+)
       AND  F2.CD_GRP_CD(+) = 'S012' 
     ORDER  BY A2.SEASON_CD  
         ,  A2.AMT_RENT DESC    
    ;

  END p_sExif0003PtnList;
  
  /*****************************************************************************
  -- 서비스확인서 정보 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-03-14  wjim             [20170314_01] 방문점검 연체처리 기준 변경
                                           - 변경전 : 마지막 연체집계 기준 연체금액 0원 이상 처리 불가
                                           - 변경후 : 마지막 연체집계 기준 렌탈료 연체횟수 2회 미만은 처리 가능
   1.7        2017-10-26  wjim             [20171026_01] 걱정제로, 엔진오일 서비스확인서 처리가능 기준 변경 
                                           - 연체금액 관계없이 처리 가능
   1.9        2019-12-04  kstka            [20191204_01] 서비스종류, 채널코드 추가 
   1.10       2021-11-22  kstka            [20211122_01] kstka 걱정제로 수령여부 컬럼 추가                                           
  *****************************************************************************/
  PROCEDURE p_sExif0003ServiceList (
      v_Car_No         IN RTSD0108.CAR_NO%TYPE         /*차량번호              */
    , v_Proc_FDay      IN RTSD0104.ORD_DAY%TYPE        /*조회일자(작업일자시작)*/
    , v_Prpc_EDay      IN RTSD0104.ORD_DAY%TYPE        /*조회일자(작업일자종료)*/
    , v_Id             IN RTCM0001.USER_ID%TYPE        /*사용자 아이디         */
    , v_Ord_no         IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    , v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE        /*서비스코드              */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS
  
    CV_CNT_B00003   NUMBER := 2;                            /* 방문점검 처리가능 연체횟수 */  

    v_User_Grp      RTCM0001.USER_GRP%TYPE DEFAULT NULL;    /*사용자 그룹           */
    v_Dely_Day      RTRE0100.DELY_DAY%TYPE DEFAULT NULL;    /*마지막 연체집계 일자  */    --[20161220_01]
    v_Dely_Rent_Cnt RTRE0100.APPR_SCNT%TYPE DEFAULT NULL;   /*렌탈료 연체횟수       */    --[20170314_01]
    
  BEGIN

    v_User_Grp := Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Id);
    
    -- 마지막 연체집계일 조회 [20161220_01]
    SELECT  MAX(DELY_DAY)
      INTO  v_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';

    -- 렌탈료 연체횟수 조회 [20170314_01] 
    SELECT  NVL(MAX(APPR_SCNT),0) AS APPR_SCNT
      INTO  v_Dely_Rent_Cnt
      FROM  RTRE0100
     WHERE  DELY_DAY = v_Dely_Day
       AND  ORD_NO   = v_Ord_no
       AND  RECP_TP  = '11'  
    ;      

    -- 대리점(05), 서비스 매니저 (17)
    IF '05' = v_User_Grp OR '01' = v_User_Grp OR '17' = v_User_Grp  THEN

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
                '('||B.POS_CD||') '||B.CITY||' '||B.STREET AS AG_ADDR,                          /* 장착점주소         */
                -- 고객번호 전월말일 기준 연체 금액이 0으로 리턴될 경우만 CASE 값 가져옴, 금액 0 이상이면 0건
--                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
--                            0,  CASE -- 장착일자 ~ (+ 3개월 - 1일)까지는 0,
--                                WHEN TO_CHAR(ADD_MONTHS(A.PROC_DAY, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN 0
--                                ELSE  Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') END,
--                            0) AS PRS_DCD1_CNT,  --[20171026_01] 이전
--                CASE
--                    WHEN TO_CHAR(ADD_MONTHS(A.PROC_DAY, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN 0
--                    ELSE  Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') 
--                END AS PRS_DCD1_CNT,
                Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') AS PRS_DCD1_CNT, 
                DECODE(MFP_YN, 'N',                                                           /* 엔진오일 잔여횟수 */
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
                    ), 0
                ) AS PRS_DCD2_CNT,                                                              /*위치교환 잔여횟수  [20161125_03] */                              
--                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
--                          0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00007'),
--                           0) AS PRS_DCD6_CNT,                                                  --[20171026_01] 이전    
                CASE WHEN E.ORD_NO IS NULL THEN 0 ELSE Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00007') END AS PRS_DCD6_CNT,           /*걱정제로 잔여횟수   */
                DECODE(MFP_YN, 'N', Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00008'), 0) AS PRS_DCD8_CNT,           /*얼라인먼트 잔여횟수   */
                E.KWMENG||'본'  AS TIRE_CNT,                       /*걱정제로 신청본수+'본' */                                                                   
                0 PRS_DCD3_CNT,                                                                 /*방문점검 잔여횟수   */
                TO_CHAR(SYSDATE,'YYYYMMDD') INT_DAY,                                            /*시스템일자          */
                DECODE(C.CUST_TP,'01',SUBSTR(C.BIRTH_DAY,3,6),SUBSTR(C.BUSL_NO,1,6)) ENC_CD,    /*암호화 코드         */
                DECODE(A.SEASON_CD,'02', DECODE(F.PS_CD, 'A00002', '02', '01'), A.SEASON_CD) SEASON_CD,                                                                    /*계절구분('01':4계절,'02':겨울용)*/
                DECODE(MFP_YN, 'N', 
                    DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
                                0,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00006'),
                                0), 0
                ) AS PRS_DCD5_CNT,                                                              /*WINTER교체 잔여횟수 */
                Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00009') PRS_DCD9_CNT,              /*무상얼라인먼트 잔여횟수 */
                Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00010') PRS_DCD10_CNT,             /*체크서비스 잔여횟수 */
                Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00011') PRS_DCD11_CNT,             /*조기마모파손보증서비스 잔여횟수 */
                Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00012') PRS_DCD12_CNT,             /*파손보증서비스 잔여횟수 */
                D.STD_YM,                                                                       /*(방문점검)대상년월  */
                D.JOB_SEQ,                                                                      /*(방문점검)작업순번  */
                D.CHK_STAT,                                                                     /*(방문점검)작업상태  */
                Pkg_Rtcm0051.f_sRtcm0051CodeName('H008', D.CHK_STAT) CHK_STAT_NM,               /*(방문점검)작업상태명*/
                A.C_MILEAGE C_MILEAGE,                                                          /*마일리지(주행거리)  */
                F.PRS_DCD AS PRS_DCD_CD,                                                        /*서비스종류          */
                A.CHAN_CD,                                                                      /*채널코드            */
                f_sExif0003O2OAgency(E.AGENCY_CD) AS B00007_O2O_YN,                                /*거점여부            */
                CASE WHEN F.PRS_DCD = 'B00007' THEN E.DLV_GB 
                     WHEN F.PRS_DCD = 'B00001' THEN G.DLV_GB 
                     ELSE '' END AS DLV_GB,                                                       /*배송구분            */
                E.DLVR_SEQ AS B00007_DLVR_SEQ,
                DLV_STAT,
                A.ORD_DAY,
                A.CNT_CD,
                A.PROC_DAY,
                E.DLVR_DAY AS B00007_DLVR_DAY,
                E.TMS_ORDERID,
                CASE WHEN F.PRS_DCD = 'B00007' THEN 
                    Pkg_Exif0004.f_sExif0004O2OStockYn(E.OMS_ORDERNO) 
                    ELSE 'N' END AS O2O_STOCK_YN, --20200409  거점재고 사용여부 
                Pkg_Rtsd0104.f_sRtsdGetUsage(A.ORD_DAY, A.PROC_DAY, A.CHAN_CD) AS USAGE,
                '' AS OMS_ORDERNO   --[20220407_01] kstka OMS주문번호
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
                ( SELECT AGENCY_CD ,ORD_NO, KWMENG, DLV_GB, DLVR_SEQ, DLV_STAT, DLVR_DAY, TMS_ORDERID, OMS_ORDERNO
                   FROM RTCS0010
                  WHERE DLV_STAT  IN ('01','02', '03') ) E,
                  RTSD0013 F,
                ( SELECT ORD_NO, DLV_GB, DLVR_SEQ
                   FROM RTCS0009
                  WHERE DLV_STAT NOT IN ('06')) G
        WHERE   A.CAR_NO  LIKE '%'||v_Car_No
        AND     LENGTH(v_Car_No) >= 4 -- 차량번호는 4자리 이상 일 경우만 조회 가능
        --AND     A.MFP_YN  = 'N'
        AND     A.OS_YN   = 'N'
        AND     A.STAT_CD = '04'
        AND     B.AGENCY_CD  = (SELECT AGENT_ID FROM RTCM0001 WHERE USER_ID = v_Id AND USER_GRP IN ('05', '17'))
        AND     A.CUST_NO = C.CUST_NO
        AND     A.ORD_NO  = D.ORD_NO(+)
        AND     A.ORD_NO  = E.ORD_NO(+)
        AND     A.ORD_NO  = F.ORD_NO
        AND     A.ORD_NO  = G.ORD_NO(+)
        AND     A.ORD_NO  = v_Ord_no
        AND     F.PRS_DCD = v_Prs_Dcd;
        
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
                '('||B.POS_CD||') '||B.CITY||' '||B.STREET AS AG_ADDR,                          /* 장착점주소         */
                -- 고객번호 전월말일 기준 연체 금액이 0으로 리턴될 경우만 CASE 값 가져옴, 금액 0 이상이면 0건
--                DECODE(Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day),
--                            0,  CASE -- 장착일자 ~ (+ 3개월 - 1일)까지는 0,
--                                WHEN TO_CHAR(ADD_MONTHS(A.PROC_DAY, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN 0
--                                ELSE  Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') END,
--                            0) AS PRS_DCD1_CNT,                                                 --[20171026_01] 이전 
                CASE
                    WHEN TO_CHAR(ADD_MONTHS(A.PROC_DAY, 3),'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN 0
                    ELSE  Pkg_Rtsd0013.f_sRtsd0013ServCntr2(A.ORD_NO, 'B00001') 
                END AS PRS_DCD1_CNT,                                                             /* 엔진오일 잔여횟수 */
                -- 렌탈 연체가 2회 이하인 경우 방문점검 처리가능 [20170314_01]
                CASE WHEN v_Dely_Rent_Cnt <= 2 THEN
                    Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00003')
                ELSE
                    0
                END AS PRS_DCD3_CNT,                                                            /*방문점검 잔여횟수    */
--                DECODE(
--                    Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(A.CUST_NO, NULL, v_Dely_Day)
--                    ,0
--                    ,  Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00003')
--                    , 0
--                ) AS PRS_DCD3_CNT,                                                 
                0 PRS_DCD2_CNT,                                                                 /*위치교환 잔여횟수   */              
                0 PRS_DCD6_CNT,                                                                  /*걱정제로 잔여횟수   */
                0 PRS_DCD8_CNT,           /*얼라인먼트 잔여횟수   */
                0 PRS_DCD9_CNT,           /*무상얼라인먼트 잔여횟수   */
                0 PRS_DCD10_CNT,           /*Nexen Check서비스 잔여횟수   */
                0 PRS_DCD11_CNT,           /*조기마모파손보증 잔여횟수   */
                0 PRS_DCD12_CNT,           /*파손보증 잔여횟수   */
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
                A.C_MILEAGE C_MILEAGE,                                                          /*마일리지(주행거리)  */
                'B00003' AS PRS_DCD_CD,                                                         /*서비스종류          */
                A.CHAN_CD,                                                                      /*채널코드            */
                '' AS B00007_O2O_YN,                                    /*거점여부            */
                '' AS DLV_GB,                                                                   /*배송구분            */
                '' AS B00007_DLVR_SEQ,
                '' AS DLV_STAT,
                A.ORD_DAY,
                A.CNT_CD,
                A.PROC_DAY,
                ''  AS B00007_DLVR_DAY,
                ''  AS TMS_ORDERID,
                'N'  AS O2O_STOCK_YN,
                '' AS USAGE,
                '' AS OMS_ORDERNO   --[20220407_01] kstka OMS주문번호
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
        AND     A.CUST_NO = C.CUST_NO
        AND     A.ORD_NO  = v_Ord_no;

    ELSE

        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0003.p_sExif0003ServiceList(1)', '사용자 아이디 기준 사용자 그룹 오류. 대리점(05) 또는 Mr. Roadian(08)만 가능.', v_User_Grp);
        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0003.p_sExif0003ServiceList(1)', '차량번호              ', v_Car_No   );
        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0003.p_sExif0003ServiceList(1)', '조회일자(작업일자시작)', v_Proc_FDay);
        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0003.p_sExif0003ServiceList(1)', '조회일자(작업일자종료)', v_Prpc_EDay);
        Pkg_Utility.p_InfoFileWrite('Pkg_Exif0003.p_sExif0003ServiceList(1)', '사용자 아이디         ', v_Id       );

    END IF;

  END p_sExif0003ServiceList;
  
  /*****************************************************************************
  -- 쇼핑몰 회원 중복 가입체크
  *****************************************************************************/
  FUNCTION f_Exif0003CustDupe(
    v_DI            IN RTSD0100.DI_CD%TYPE          /*DI                */
  ) RETURN NUMBER IS
  
    v_curr_cnt   NUMBER DEFAULT 0;
    
  BEGIN

    SELECT  COUNT(1)
    INTO    v_curr_cnt
    FROM    RTSD0100
    WHERE   DI_CD = TRIM(v_DI);
        
    RETURN v_curr_cnt;
    
  EXCEPTION
      WHEN OTHERS THEN
        RETURN -1;

  END f_Exif0003CustDupe;
  
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
  ) IS
  
    e_Error EXCEPTION;
    
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Bld_Mng_No) IS NULL THEN
        v_Return_Message := '건물코드('||v_Bld_Mng_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Pos_Cd ) IS NULL THEN
        v_Return_Message := '우편번호('||v_Pos_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    UPDATE  RTSD0100
       SET  BLD_MNG_NO = v_Bld_Mng_No
         ,  POS_CD     = v_Pos_Cd
         ,  ADDR1      = v_Addr1
         ,  ADDR2      = v_Addr2
         ,  EMAIL_ADDR = TRIM(v_Email_Addr)
     WHERE  CUST_NO    = v_Cust_No
    ;

    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Exif0003.p_updateExif0003CustAddr(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_ERRORFILEWRITE('Pkg_Exif0003.p_updateExif0003CustAddr(2)', v_ErrorText, v_Return_Message);

  END p_updateExif0003CustAddr;

  /*****************************************************************************
  -- 계약 정보 저장전 - 온라인몰 동일계약 존재여부 체크
  *****************************************************************************/
  FUNCTION f_sExif0003GetExistContract(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE         /*채널구분              */
    ) RETURN VARCHAR2 IS

    v_Ord_No RTSD0104.ORD_NO%TYPE DEFAULT NULL;       /*계약번호              */
  BEGIN

    v_Ord_No := NULL;
    IF (v_Chan_Cd = '01') OR
--       (v_Chan_Cd = '03') OR
--       (v_Chan_Cd = '04') OR
       (v_Chan_Cd = '05') OR
       (v_Chan_Cd = '06') THEN

       SELECT A.ORD_NO
         INTO v_Ord_No
         FROM RTSD0104 A
             ,RTSD0106 B
        WHERE A.ORD_NO = B.ORD_NO
          AND A.STAT_CD IN ('01','03')   -- '04'추가 --한창운 요청(김한나) 2016.03   장착완료는 제거 20160328 한승훈 
          AND A.CHAN_CD NOT IN ('01','05','06')          /* 01:대리점,05:타이어뱅크,06:B2B */
          AND A.CUST_NO = v_Cust_No
--          AND A.CAR_NO  = REPLACE(v_Car_No,' ','')
        --  AND B.MAT_CD  = v_Mat_Cd-- 막음 -박정석 요청(김한나) 2016.03
          AND ROWNUM = 1;
    ELSE
       v_Ord_No := NULL;
    END IF;

    RETURN v_Ord_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sExif0003GetExistContract;
  
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
  ) IS
    
  BEGIN    

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                                                       /*계약번호            */
            A.PS_CD,                                                        /*프리미엄서비스      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S043', A.PS_CD) AS PS_NM,     /*프리미엄서비스      */
            A.PRS_DCD,                                                      /*상세서비스          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', A.PRS_DCD) AS PRS_NM,  /*상세서비스          */
            A.CNT_CD,                                                       /*타이어본수          */
            A.SERV_CNT0,                                                    /*서비스횟수(최초)    */
            CASE
              WHEN A.PRS_DCD = 'B00001' THEN NVL(A.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(A.ORD_NO)
             -- WHEN A.PRS_DCD = 'B00004' THEN NVL(A.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(A.ORD_NO)    --3/16 박정석 대리 요청 에러수정을 위해 막음 (김한나 변경)
              ELSE A.SERV_CNTR          
            END AS SERV_CNTR,                   /*서비스횟수(잔여)    */
            A.SERV_AMT,                                                     /*추가렌탈료          */
            A.REG_ID,                                                       /*등록자 ID           */
            A.REG_DT,                                                       /*등록일              */
            A.CHG_ID,                                                       /*변경자 ID           */
            A.CHG_DT                                                        /*변경일              */
    FROM    RTSD0013 A
    WHERE   A.ORD_NO  = v_Ord_No
    ORDER BY PS_CD, PRS_DCD;

  END p_sExif0003PremiumList;
  
  PROCEDURE p_sExif0003ReRentalInfo (    
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_Cust_No           IN VARCHAR2,
    v_Safe_Key          IN VARCHAR2,
    v_Success_code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  ) IS

  v_Ord_No VARCHAR2(20);
  v_Cnt NUMBER;
  
  e_Error EXCEPTION; 
  
  BEGIN
  
    
    
--     SELECT COUNT(A.ORD_NO) INTO v_Cnt FROM RTSD0104 A, RTSD0108 B WHERE A.ORD_NO = B.ORD_NO AND A.CUST_NO = v_Cust_No;
--     
--     IF v_Cnt = 0 THEN
--        v_ErrorText := '해당고객의 장착/계약이 존재하지 않습니다.';
--        RAISE e_Error;
--     END IF;
     
--     BEGIN
--         SELECT MAX(ORD_NO) INTO v_Ord_No FROM RTSD0108 
--         WHERE STAT_CD IN ('04') 
--               AND (
--                   TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(OS_DAY, 0, 4) || '/' || SUBSTR(OS_DAY, 5, 2) || '/' || SUBSTR(OS_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), -3), 'yyyymmdd')
--                   AND TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(PROC_DAY, 0, 4) || '/' || SUBSTR(PROC_DAY, 5, 2) || '/' || SUBSTR(PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 60), 'yyyymmdd')
--               )           
--               AND CUST_NO = v_Cust_No;
--     EXCEPTION
--        WHEN NO_DATA_FOUND THEN
--            v_ErrorText := '재렌탈대상 주문이 존재하지 않습니다.';
--            RAISE e_Error;
--     END;
     
     OPEN Ref_Cursor FOR
--     SELECT COL1, COL2 FROM
--     (
--         SELECT TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(OS_DAY, 0, 4) || '/' || SUBSTR(OS_DAY, 5, 2) || '/' || SUBSTR(OS_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), -3), 'yyyymmdd') COL1, OS_DAY COL2 FROM RTSD0108 WHERE ORD_NO = v_Ord_No
--         UNION ALL
--         SELECT PROC_DAY COL1, TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(PROC_DAY, 0, 4) || '/' || SUBSTR(PROC_DAY, 5, 2) || '/' || SUBSTR(PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 60), 'yyyymmdd') COL2 FROM RTSD0108 WHERE ORD_NO = v_Ord_No
--         UNION ALL
--         SELECT TO_CHAR(COUNT(*)) COL1, '' COL2 FROM RTCS0010 WHERE ORD_NO = v_Ord_No AND DLV_STAT = '04'
--         UNION ALL
--         SELECT CASE WHEN TO_CHAR(COUNT(*)) = '0' OR (MAX(MFP_YN) = 'Y' AND MAX(CANC_DAY) IS NULL) THEN 'Y' ELSE 'N' END COL1, '' COL2 FROM RTSD0108 A, RTSD0109 B WHERE A.ORD_NO = B.ORD_NO AND A.ORD_NO = v_Ord_No AND RECP_TP = '11' AND B.RC_YN = 'N' AND DEMD_DT <= TO_CHAR(SYSDATE, 'YYYYMMDD')
--     );

     SELECT ORD_NO, CUST_NO, CUST_NM, MOB_NO, ORD_DAY, OS_DAY_F, OS_DAY_T, PROC_DAY_F, PROC_DAY_T, CNT, END_TP, CNT_CD, SAFE_KEY FROM (
        SELECT             
             B.ORD_NO,
             A.CUST_NO,
             A.CUST_NM,
             A.MOB_NO, 
             C.ORD_DAY, 
             TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.OS_DAY, 0, 4) || '/' || SUBSTR(B.OS_DAY, 5, 2) || '/' || SUBSTR(B.OS_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), -3), 'yyyymmdd') OS_DAY_F,
             B.OS_DAY OS_DAY_T, 
             B.PROC_DAY PROC_DAY_F, 
             TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 60), 'yyyymmdd') PROC_DAY_T,
             CASE WHEN B.MFP_YN = 'Y' AND END_TP IN ('E', 'C') THEN '0' -- 중도완납/해지의 경우 기간에 상관없이 완납으로 봄
             ELSE NVL((
                            SELECT TO_CHAR(COUNT(*)) 
                            FROM RTSD0109 X, RTSD0104 Y, RTSD0044 Z 
                            WHERE RC_YN = 'N' 
                            AND ZFB_DAY < TO_CHAR(SYSDATE, 'YYYYMMDD') 
                            AND X.ORD_NO = B.ORD_NO
                            AND X.ORD_NO = Y.ORD_NO
                            AND Y.SALE_CD = Z.SALE_CD
                            AND X.SCD_STAT = 'S'
                            AND X.RECP_NU NOT IN (Z.EXM_MNT)
                            ), '0') END CNT, --청구일기준, 면제회차 제외 20200331 kstka
             NVL(B.END_TP, 'X') END_TP,
             B.CNT_CD,
             A.SAFEKEY SAFE_KEY  
             FROM RTSD0100 A, RTSD0108 B, RTSD0104 C, RTSD0106 D, RTSD0005 E 
             WHERE A.CUST_NO = B.CUST_NO
                   AND B.STAT_CD IN ('04') 
                   AND (
                       TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)), -3), 'yyyymmdd')
                       AND TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 60), 'yyyymmdd')
                       OR MFP_YN = 'Y'
                   )           
                   AND B.ORD_NO = C.ORD_NO
                   AND C.ORD_NO = D.ORD_NO
                   AND D.MAT_CD = E.MAT_CD
                   AND C.FORD_NO IS NULL
                   ORDER BY ORD_NO) 
    WHERE CNT = 0
    AND END_TP  NOT IN ('C') --중도해지제외
    AND CNT_CD NOT IN ('01')
    AND CUST_NO = DECODE(v_Cust_No       , NULL, CUST_NO          , v_Cust_No)
    --AND SAFE_KEY = DECODE(v_Safe_Key     , NULL, SAFE_KEY         , v_Safe_Key)
    AND NVL(SAFE_KEY, 'NULL') = DECODE(v_Safe_Key     , NULL, NVL(SAFE_KEY, 'NULL')         , v_Safe_Key)
    AND ROWNUM = 1;
     
  EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        
  END p_sExif0003ReRentalInfo;
  
  
  /*****************************************************************************
 -- 프리미엄 서비스 조회
 *****************************************************************************/
  PROCEDURE p_sExif0003Srvc (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Sale_Cd            IN RTSD0020.SALE_CD%TYPE,      /* 판매코드         */
      v_Period_Cd          IN RTSD0012.PERIOD_CD%TYPE,    /* 기간코드         */
      v_Cnt_Cd             IN RTSD0012.CNT_CD%TYPE        /* 타이어본수       */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR    
    SELECT AA.SALE_CD, 
           AA.PRS_DCD,
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM,
           AA.SERV_AMT, 
           AA.SERV_INF_AMT,
           AA.SERV_INF_YN,      
           BB.PERIOD_CD,   
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', BB.PERIOD_CD) AS PERIOD_NM, 
           BB.CNT_CD,
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', BB.CNT_CD) AS CNT_NM, 
           BB.SERV_CNT,
           DECODE(BB.SERV_CNT, 1,  AA.SERV_AMT_1,
                               2,  AA.SERV_AMT_2,
                               3,  AA.SERV_AMT_3,
                               4,  AA.SERV_AMT_4,
                               5,  AA.SERV_AMT_5,
                               6,  AA.SERV_AMT_6,
                               7,  AA.SERV_AMT_7,
                               8,  AA.SERV_AMT_8,
                               9,  AA.SERV_AMT_9,
                               10, AA.SERV_AMT_10)  AS SERV_AMT_SUM
     FROM 
          (SELECT A.SALE_CD, 
                  A.PRS_DCD, 
                  A.SERV_INF_YN,
                  B.SERV_AMT_1 AS SERV_AMT,
                  B.SERV_AMT_1,
                  B.SERV_AMT_2,
                  B.SERV_AMT_3,
                  B.SERV_AMT_4,
                  B.SERV_AMT_5,
                  B.SERV_AMT_6,
                  B.SERV_AMT_7,
                  B.SERV_AMT_8,
                  B.SERV_AMT_9,
                  B.SERV_AMT_10, 
                  B.SERV_INF_AMT                        
             FROM RTSD0028 A, 
                  (
                      SELECT
                          T.PRS_DCD 
                          ,T.PERIOD_CD
                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                      FROM RTSD0043 T
                      WHERE 1=1
                      AND T.PERIOD_CD = DECODE(v_Period_Cd, NULL, T.PERIOD_CD, v_Period_Cd)
                      GROUP BY T.PRS_DCD,T.PERIOD_CD
                  ) B
            WHERE A.PRS_DCD = B.PRS_DCD) AA,   
          (SELECT PS_CD,
                  PRS_DCD,
                  PERIOD_CD,         
                  CNT_CD,
                  MAX(SERV_CNT) SERV_CNT
             FROM RTSD0012
            WHERE 1=1
              AND SERV_CNT != 0 
              AND USE_YN = 'Y' 
            GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) BB
     WHERE AA.PRS_DCD           = BB.PRS_DCD
       AND AA.SALE_CD           = DECODE(v_Sale_Cd, NULL, AA.SALE_CD, v_Sale_Cd)
       AND AA.SALE_CD           = BB.PS_CD
       AND BB.PERIOD_CD         = DECODE(v_Period_Cd, NULL, BB.PERIOD_CD, v_Period_Cd)
       AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_Cd, NULL, BB.CNT_CD, v_Cnt_Cd))
     ORDER BY AA.PRS_DCD ASC;
    /*
    SELECT AA.SALE_CD, 
           AA.PRS_DCD,
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM,
           AA.SERV_AMT, 
           AA.SERV_INF_AMT,
           AA.SERV_INF_YN,      
           BB.PERIOD_CD,   
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', BB.PERIOD_CD) AS PERIOD_NM, 
           BB.CNT_CD,
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', BB.CNT_CD) AS CNT_NM, 
           BB.SERV_CNT,
          (BB.SERV_CNT * AA.SERV_AMT) AS SERV_AMT_SUM
     FROM 
          (SELECT A.SALE_CD, 
                  A.PRS_DCD, 
                  A.SERV_INF_YN,
                  B.SERV_AMT, 
                  B.SERV_INF_AMT                        
             FROM RTSD0028 A, RTSD0043 B
            WHERE A.PRS_DCD = B.PRS_DCD) AA,   
          (SELECT PRS_DCD,
                  PERIOD_CD,         
                  CNT_CD,
                  MAX(SERV_CNT) SERV_CNT
             FROM RTSD0012
            WHERE PERIOD_CD != 'ZZ'
              AND SERV_CNT != 0 
              AND USE_YN = 'Y' 
            GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) BB
     WHERE AA.PRS_DCD = BB.PRS_DCD
       AND AA.SALE_CD = DECODE(v_Sale_Cd, NULL, AA.SALE_CD, v_Sale_Cd)
       AND BB.PERIOD_CD = DECODE(v_Period_Cd, NULL, BB.PERIOD_CD, v_Period_Cd)
       AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_Cd, NULL, BB.CNT_CD, v_Cnt_Cd))
     ORDER BY AA.PRS_DCD ASC;
  */
  END p_sExif0003Srvc;
  
  
  /*****************************************************************************
  -- 계약 정보 고객 실휴대폰 번호 Update 20181220 고도화 추가
  *****************************************************************************/
  FUNCTION f_sExif0003Rtsd0104RMNUpdate (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Real_Mob_No    IN RTSD0104.C_REAL_MOB_NO%TYPE,  /*고객 실 휴대폰 번호   */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0104
    SET    C_REAL_MOB_NO  = v_Real_Mob_No,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ORD_NO   = v_Ord_No;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_sExif0003Rtsd0104RMNUpdate;
  
  /*****************************************************************************
  -- 방문장착 홈 작업예정 건수 조회
  *****************************************************************************/
  PROCEDURE p_sExif0003InstallTodoCnt (
      v_User_Id        IN RTCM0001.USER_ID%TYPE     /* 접속ID                 */
    , v_Req_Ym         IN VARCHAR2                  /* 조회년월               */
    , Ref_Cursor       IN OUT SYS_REFCURSOR
  ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  A3.REQ_DAY
         ,  SUM(DECODE(A3.DIV_CD,'A',A3.CNT,0)) AS CNT_A
         ,  SUM(DECODE(A3.DIV_CD,'B',A3.CNT,0)) AS CNT_B
         ,  SUM(DECODE(A3.DIV_CD,'C',A3.CNT,0)) AS CNT_C
      FROM  (
                SELECT  A2.REQ_DAY
                     ,  A2.DIV_CD
                     ,  COUNT(*) AS CNT
                  FROM  (
                            SELECT  'A'            AS DIV_CD
                                 ,  B1.ORD_NO
                                 ,  NVL(C1.PROC_DAY, B1.PROC_DAY)    AS REQ_DAY     
                              FROM  RTCM0001 A1
                                 ,  RTSD0104 B1
                                 ,  RTSD0401 C1
                             WHERE  A1.USER_ID      = v_User_Id
                               AND  A1.AGENT_ID     = B1.AGENCY_CD
                               AND  NVL(C1.PROC_DAY, B1.PROC_DAY) LIKE v_Req_Ym||'%'
                               AND  B1.STAT_CD     IN ('01')
                               AND  B1.ORD_NO = C1.ORD_NO
--                             UNION
--                            SELECT  'B'            AS DIV_CD
--                                 ,  B1.ORD_NO
--                                 ,  B1.SERVRQ_DAY  AS REQ_DAY     
--                              FROM  RTCM0001 A1
--                                 ,  RTCS0010 B1     
--                             WHERE  A1.USER_ID      = v_User_Id
--                               AND  A1.AGENT_ID     = B1.AGENCY_CD
--                               AND  B1.SERVRQ_DAY LIKE v_Req_Ym||'%'
--                               AND  B1.DLV_STAT IN ('01','02','03')
--                             UNION
--                            SELECT  'C'            AS DIV_CD
--                                 ,  B1.ORD_NO
--                                 ,  B1.SERVRQ_DAY  AS REQ_DAY     
--                              FROM  RTCM0001 A1
--                                 ,  RTCS0009 B1     
--                             WHERE  A1.USER_ID      = v_User_Id
--                               AND  A1.AGENT_ID     = B1.AGENCY_CD
--                               AND  B1.SERVRQ_DAY LIKE v_Req_Ym||'%'
--                               AND  B1.DLV_STAT    IN ('03')
                        ) A2
                 GROUP  BY A2.REQ_DAY
                     ,  A2.DIV_CD   
            ) A3
     GROUP  BY A3.REQ_DAY 
     ORDER  BY A3.REQ_DAY                 
    ;

  END p_sExif0003InstallTodoCnt;
  
  /*****************************************************************************
  -- 방문장착 TO-DO 목록 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.4        2017-04-04  wjim             [20170404_03] 방문점검 확정기준 및 조회기준 변경
                                           - 1) 확정기준 : 예정시간이 00:00가 아닌 건 -> 컨택상태가 '완료'인 건
                                           - 2) 조회기준 : 컨택상태가 '취소'인 건은 대상에서 제외
   1.6        2017-05-31  wjim             [20170531_01] 로디안 방문점검 TO-DO 목록 조회기준 변경
                                           - 당월 배정건만 조회되던 부분 수정
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
  ) IS
  
    lv_Req_Day_F    VARCHAR2(8);
    lv_Req_Day_T    VARCHAR2(8);
    
    lv_Dely_Day     RTRE0100.DELY_DAY%TYPE DEFAULT NULL; /* 마지막 연체집계 일자  */
    lv_agent_id     RTCM0001.AGENT_ID%TYPE DEFAULT NULL; /* 사용자의 담당 대리점  */
  
    e_Error EXCEPTION;
    
  BEGIN
  
IF TRIM(v_User_Id) IS NULL THEN
        v_Return_Message := '접속ID : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Div_Cd) IS NULL THEN
        v_Return_Message := '조회구분 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Req_Day_F) IS NULL OR TRIM(v_Req_Day_T) IS NULL) AND TRIM(v_Cust_Nm) IS NULL AND TRIM(v_Car_No) IS NULL THEN
        v_Return_Message := '조회기간, 고객명, 차량번호 : 최소한 하나 이상의 조회조건이 필요합니다!';
        RAISE e_Error;
    END IF;
    
    -- 전체기간조회의 경우 조회기간 세팅
    IF TRIM(v_Req_Day_F) IS NULL THEN
        lv_Req_Day_F := '20150904';  --시스템오픈일
    ELSE
        lv_Req_Day_F := TRIM(v_Req_Day_F);  --시스템오픈일
    END IF;
    
    IF TRIM(v_Req_Day_T) IS NULL THEN
        lv_Req_Day_T := TO_CHAR(SYSDATE, 'YYYYMMDD');
    ELSE
        lv_Req_Day_T := TRIM(v_Req_Day_T);        
    END IF;
    
    -- 최종 연체집계일자 조회
    SELECT  MAX(DELY_DAY)
      INTO  lv_Dely_Day
      FROM  RTRE0100
     WHERE  DEL_YN = 'N';
     
     -- 사용자의 담당 대리점 조회
     SELECT  AGENT_ID
      INTO  lv_agent_id
      FROM  RTCM0001
     WHERE  USER_ID = v_User_Id;  
    
    OPEN Ref_Cursor FOR
    SELECT  A3.DIV_CD
         ,  A3.REQ_DAY
         ,  A3.ORD_NO
         ,  A3.ORD_DAY     
         ,  A3.CUST_NO
         ,  A3.CUST_NM2     AS CUST_NM
         ,  A3.BIRTH_DAY
         ,  A3.MOB_NO
         ,  A3.STAT_CD
         ,  A3.STAT_NM
         ,  A3.REQ_CNT_NM
         ,  A3.MODEL_CD
         ,  A3.CONTENTS_CD
         ,  A3.FR_CD
         ,  A3.MC_NM
         ,  A3.CAR_NO
         ,  A3.MAT_CD
         ,  A3.MAT_NM
         ,  A3.ORG_CNT_NM
         ,  A3.SUM_AMT_DELY
         ,  A3.PROC_DAY
         ,  CASE WHEN TO_CHAR(TO_DATE(NVL(A3.PROC_DAY,TO_CHAR(SYSDATE,'YYYYMMDD')))+7,'YYYYMMDD') > TO_CHAR(SYSDATE,'YYYYMMDD') THEN
                0
            ELSE
                DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00002,0)
            END AS CNTR_B00002
         --,  DECODE(A3.DIV_CD,'B',DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00007,0),0) AS CNTR_B00007
         ,  DECODE(A3.DIV_CD,'B',A3.CNTR_B00007,0) AS CNTR_B00007
         --,  DECODE(A3.DIV_CD,'C',DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00001,0),0) AS CNTR_B00001
         ,  DECODE(A3.DIV_CD,'C',A3.CNTR_B00001,0) AS CNTR_B00001
         ,  DECODE(A3.DIV_CD,'D',DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00006,0),0) AS CNTR_B00006
         ,  DECODE(A3.SUM_AMT_DELY,0,A3.CNTR_B00008,0) AS CNTR_B00008
         ,  A3.STAT_DIV
         ,  '' AS PRS_DCD_CD
         ,  A3.AGENCY_CD
         ,  A3.CONFIRM_TM   
         ,  A3.CHK_STAT 
         ,  A3.ADDR        
      FROM  (
                SELECT  A2.*
                     ,  NVL(A2.CUST_NM, B2.CUST_NM) AS CUST_NM2
                     ,  B2.BIRTH_DAY
                     ,  B2.MOB_NO
                     ,  E2.CD_NM   AS REQ_CNT_NM
                     ,  C2.MC_NM
                     ,  D2.MAT_NM
                     ,  F2.CD_NM   AS ORG_CNT_NM
                     ,  NVL(H2.SERV_CNTR,0)         AS CNTR_B00002
                     ,  NVL(I2.SERV_CNTR,0)         AS CNTR_B00007
                     ,  NVL(G2.SERV_CNTR,0)         AS CNTR_B00001
                     ,  NVL(L2.SERV_CNTR,0)         AS CNTR_B00006
                     ,  NVL(M2.SERV_CNTR,0)         AS CNTR_B00008
                     ,  NVL(J2.SUM_AMT_DELY,0)      AS SUM_AMT_DELY
                     ,  K2.PROC_DAY
                  FROM  (
                        SELECT  'A'            AS DIV_CD
                             ,  B1.ORD_NO
                             ,  B1.PROC_DAY    AS REQ_DAY
                             ,  B1.ORD_DAY
                             ,  B1.CUST_NO
                             ,  NULL           AS CUST_NM
                             ,  B1.STAT_CD
                             ,  D1.CD_NM       AS STAT_NM
                             ,  B1.CNT_CD AS REQ_CNT
                             ,  B1.MODEL_CD
                             ,  B1.CONTENTS_CD
                             ,  MAX(C1.FR_CD) FR_CD
                             ,  B1.CAR_NO
                             ,  MAX(C1.MAT_CD) MAT_CD
                             ,  B1.CNT_CD AS ORG_CNT
                             ,  CASE WHEN B1.AGENCY_CD = lv_agent_id THEN
                                    CASE WHEN B1.STAT_CD IN ('01','02', '03')THEN
                                        1
                                    ELSE
                                        0
                                    END
                                ELSE
                                    CASE WHEN LENGTHB(TRIM(v_Cust_Nm)) >= 4 OR LENGTHB(TRIM(v_Car_No)) >= 4 THEN
                                        CASE WHEN B1.STAT_CD IN ('04')THEN
                                            0
                                        ELSE
                                            -1
                                        END
                                    ELSE
                                        -1
                                    END   
                                END AS STAT_DIV
                             ,  B1.AGENCY_CD
                             ,  E1.PROC_TM AS CONFIRM_TM
                             ,  E1.STAT_CD AS CHK_STAT
                             ,  CASE WHEN F1.LOT_MB = '0' THEN F1.DO_NM || ' ' || F1.CT_NM || ' ' || F1.B_DNG_NM || ' ' || F1.B_RI_NM 
                                 WHEN F1.LOT_SB = '0' THEN F1.DO_NM || ' ' || F1.CT_NM || ' ' || F1.B_DNG_NM || ' ' || F1.B_RI_NM || ' ' || F1.LOT_MB
                                 ELSE F1.DO_NM || ' ' || F1.CT_NM || ' ' || F1.B_DNG_NM || ' ' || F1.B_RI_NM || ' ' || F1.LOT_MB || '-' || F1.LOT_SB END  ADDR
                             ,  B1.SALE_CD  -- 고도화 시 추가된 필요정보
                             ,  (SELECT SAL.SALE_NM  FROM RTSD0020 SAL WHERE SAL.SALE_CD = B1.SALE_CD) AS SALE_NM   -- 고도화 시 추가된 필요정보
                             ,  B1.ORD_ID   AS ORD_ID   -- 고도화 시 추가된 필요정보
                          FROM  RTCM0001 A1
                             ,  RTSD0104 B1
                             ,  RTSD0106 C1
                             ,  RTCM0051 D1
                             ,  RTSD0401 E1
                             ,  RTSD0010 F1
                         WHERE  A1.USER_ID      = CASE WHEN LENGTHB(TRIM(v_Cust_Nm)) >= 4 OR LENGTHB(TRIM(v_Car_No)) >= 4 THEN A1.USER_ID ELSE v_User_Id END
                           AND  A1.AGENT_ID     = B1.AGENCY_CD
                           AND  NVL(E1.PROC_DAY, B1.PROC_DAY) BETWEEN lv_Req_Day_F AND lv_Req_Day_T
                           AND  B1.ORD_NO       = C1.ORD_NO
                           AND  C1.SEQ = 1
                           AND  B1.STAT_CD      = D1.CD(+)
                           AND  D1.CD_GRP_CD(+) = 'S032'  
                           AND  B1.ORD_NO = E1.ORD_NO 
                           AND  E1.BLD_MNG_NO = F1.BLD_MNG_NO(+)
                       GROUP BY B1.ORD_NO,B1.PROC_DAY,B1.ORD_DAY,B1.CUST_NO,B1.STAT_CD,D1.CD_NM,B1.MODEL_CD,B1.CONTENTS_CD,B1.CAR_NO,
                                B1.AGENCY_CD,E1.PROC_TM,E1.STAT_CD,B1.STAT_CD,F1.LOT_MB,F1.DO_NM,F1.CT_NM,F1.B_DNG_NM,F1.B_RI_NM,F1.LOT_SB,
                                B1.SALE_CD,B1.ORD_ID,B1.CNT_CD
--                         UNION
--                        SELECT  'B'            AS DIV_CD
--                             ,  B1.ORD_NO
--                             ,  B1.SERVRQ_DAY  AS REQ_DAY
--                             ,  C1.ORD_DAY     AS ORD_DAY
--                             ,  B1.CUST_NO
--                             ,  B1.CUST_NM
--                             ,  B1.DLV_STAT    AS STAT_CD
--                             ,  D1.CD_NM       AS STAT_NM
--                             ,  '0'||SUM(NVL(B1.KWMENG,0)) AS REQ_CNT
--                             ,  C1.MODEL_CD
--                             ,  C1.CONTENTS_CD
--                             ,  MAX(C1.FR_CD) FR_CD
--                             ,  C1.CAR_NO
--                             ,  MAX(B1.MATNR) MAT_CD
--                             ,  LPAD(SUM(TO_NUMBER(NVL(C1.CNT_CD,0))),2,'0') AS ORG_CNT
--                             ,  CASE
--                                    WHEN B1.DLV_STAT IN ('01','02','03') THEN
--                                        1
--                                    ELSE
--                                        0
--                                END            AS STAT_DIV
--                             ,  '' AS AGENCY_CD
--                             ,  '' AS CONFIRM_TM
--                             ,  '' AS CHK_STAT
--                             ,  '' AS ADDR
--                             ,  '' AS SALE_CD  -- 고도화 시 추가된 필요정보
--                             ,  '' AS SALE_NM   -- 고도화 시 추가된 필요정보
--                             ,  C1.ORD_ID   AS ORD_ID   -- 고도화 시 추가된 필요정보
--                          FROM  RTCM0001 A1
--                             ,  RTCS0010 B1
--                             ,  RTSD0108 C1
--                             ,  RTCM0051 D1
--                         WHERE  A1.USER_ID      = v_User_Id
--                           AND  A1.AGENT_ID     = B1.AGENCY_CD
--                           AND  B1.SERVRQ_DAY BETWEEN lv_Req_Day_F AND lv_Req_Day_T
--                           AND  B1.ORD_NO       = C1.ORD_NO
--                           AND  B1.DLV_STAT     = D1.CD
--                           AND  D1.CD_GRP_CD(+) = 'C024'
--                       GROUP BY B1.ORD_NO,B1.SERVRQ_DAY,C1.ORD_DAY,B1.CUST_NO,B1.CUST_NM,B1.DLV_STAT,D1.CD_NM,C1.MODEL_CD,
--                                C1.CONTENTS_CD,C1.CAR_NO,B1.DLV_STAT,C1.ORD_ID                           
--                         UNION
--                        SELECT  'C'            AS DIV_CD
--                             ,  B1.ORD_NO
--                             ,  B1.SERVRQ_DAY  AS REQ_DAY
--                             ,  C1.ORD_DAY     AS ORD_DAY
--                             ,  B1.CUST_NO
--                             ,  NULL           AS CUST_NM
--                             ,  B1.DLV_STAT    AS STAT_CD
--                             ,  E1.CD_NM       AS STAT_NM
--                             ,  NULL           AS REQ_CNT
--                             ,  C1.MODEL_CD
--                             ,  C1.CONTENTS_CD
--                             ,  MAX(C1.FR_CD) FR_CD
--                             ,  C1.CAR_NO
--                             ,  MAX(D1.MAT_CD) MAT_CD
--                             ,  LPAD(SUM(TO_NUMBER(NVL(C1.CNT_CD,0))),2,'0') AS ORG_CNT
--                             ,  DECODE(B1.DLV_STAT,'03',1,0) AS STAT_DIV
--                             ,  '' AS AGENCY_CD
--                             ,  '' AS CONFIRM_TM
--                             ,  '' AS CHK_STAT
--                             ,  '' AS ADDR
--                             ,  D1.SALE_CD
--                             ,  (SELECT SAL.SALE_NM  FROM RTSD0020 SAL WHERE SAL.SALE_CD = D1.SALE_CD) AS SALE_NM
--                             ,  D1.ORD_ID    AS ORD_ID                        
--                          FROM  RTCM0001 A1
--                             ,  RTCS0009 B1
--                             ,  RTSD0108 C1
--                             ,  RTSD0106 D1
--                             ,  RTCM0051 E1
--                         WHERE  A1.USER_ID      = v_User_Id
--                           AND  A1.AGENT_ID     = B1.AGENCY_CD
--                           AND  B1.SERVRQ_DAY BETWEEN lv_Req_Day_F AND lv_Req_Day_T
--                           AND  B1.ORD_NO       = C1.ORD_NO 
--                           AND  C1.ORD_NO       = D1.ORD_NO
--                           AND  B1.DLV_STAT     = E1.CD(+)
--                           AND  E1.CD_GRP_CD(+) = 'C019'
--                       GROUP BY B1.ORD_NO,B1.SERVRQ_DAY,C1.ORD_DAY,B1.CUST_NO,B1.DLV_STAT,E1.CD_NM,C1.MODEL_CD,
--                                C1.CONTENTS_CD,C1.CAR_NO,B1.DLV_STAT,D1.SALE_CD,D1.ORD_ID   
--                        UNION
--                         SELECT  'D'            AS DIV_CD
--                             ,  B1.ORD_NO
--                             ,  B1.INPUT_DT  AS REQ_DAY
--                             ,  C1.ORD_DAY     AS ORD_DAY
--                             ,  B1.CUST_NO
--                             ,  NULL           AS CUST_NM
--                             ,  B1.DLV_STAT  AS STAT_CD
--                             ,  NULL            AS STAT_NM
--                             ,  LPAD(SUM(TO_NUMBER(NVL(C1.CNT_CD,0))),2,'0') AS REQ_CNT
--                             ,  C1.MODEL_CD
--                             ,  C1.CONTENTS_CD
--                             ,  MAX(C1.FR_CD) FR_CD
--                             ,  C1.CAR_NO
--                             ,  MAX(D1.MAT_CD) MAT_CD
--                             ,  LPAD(SUM(TO_NUMBER(NVL(C1.CNT_CD,0))),2,'0') AS ORG_CNT
--                             ,  DECODE(B1.DLV_STAT,'01',1,0) AS STAT_DIV
--                             ,  '' AS AGENCY_CD
--                             ,  '' AS CONFIRM_TM
--                             ,  '' AS CHK_STAT
--                             ,  '' AS ADDR
--                             ,  D1.SALE_CD
--                             ,  (SELECT SAL.SALE_NM  FROM RTSD0020 SAL WHERE SAL.SALE_CD = D1.SALE_CD) AS SALE_NM
--                             ,  D1.ORD_ID    AS ORD_ID                             
--                          FROM  RTCM0001 A1
--                             ,  (SELECT AGENCY_CD, ORD_NO, CUST_NO, INPUT_DT, CASE WHEN WRITE_YN = 'N' THEN '01' ELSE '04' END DLV_STAT, ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY SEQ DESC) NUM 
--                                    FROM RTCS0204
--                                    WHERE WRITE_YN = 'N') B1
--                             ,  RTSD0108 C1
--                             ,  RTSD0106 D1
--                             ,  RTCM0051 E1
--                         WHERE  A1.USER_ID      = v_User_Id
--                           AND  B1.INPUT_DT BETWEEN lv_Req_Day_F AND lv_Req_Day_T
--                           AND  A1.AGENT_ID     = B1.AGENCY_CD                            
--                           AND  B1.ORD_NO       = C1.ORD_NO 
--                           AND  C1.ORD_NO       = D1.ORD_NO
--                           AND  B1.DLV_STAT     = E1.CD(+)
--                           AND  E1.CD_GRP_CD(+) = 'C019'
--                       GROUP BY B1.ORD_NO,B1.INPUT_DT,C1.ORD_DAY,B1.CUST_NO,B1.DLV_STAT,C1.MODEL_CD,
--                                C1.CONTENTS_CD,C1.CAR_NO,B1.DLV_STAT,D1.SALE_CD,D1.ORD_ID 
                        ) A2
                     ,  RTSD0100 B2
                     ,  RTSD0002 C2
                     ,  RTSD0005 D2
                     ,  RTCM0051 E2        
                     ,  RTCM0051 F2
                     ,  RTSD0013 G2
                     ,  RTSD0013 H2
                     ,  RTSD0013 I2
                     ,  (
                            SELECT  X.CUST_NO
                                 ,  NVL(SUM(APPR_AMT),0) AS SUM_AMT_DELY 
                              FROM  RTRE0100 X
                             WHERE  X.DELY_DAY = lv_Dely_Day
                             GROUP  BY X.CUST_NO
                        ) J2
                     ,  RTSD0108 K2
                     ,  RTSD0013 L2
                     ,  RTSD0013 M2
                 WHERE  A2.CUST_NO      = B2.CUST_NO(+)
                   AND  A2.MODEL_CD     = C2.MODEL_CD(+) 
                   AND  A2.CONTENTS_CD  = C2.CONTENTS_CD(+)
                   AND  A2.FR_CD        = C2.FR_CD(+) 
                   AND  A2.MAT_CD       = D2.MAT_CD(+) 
                   AND  A2.REQ_CNT      = E2.CD(+)
                   AND  E2.CD_GRP_CD(+) = 'S022'
                   AND  A2.ORG_CNT      = F2.CD(+)
                   AND  F2.CD_GRP_CD(+) = 'S022'
                   AND  A2.ORD_NO       = G2.ORD_NO(+)
                   AND  G2.PRS_DCD(+)   = 'B00001'
                   AND  A2.ORD_NO       = H2.ORD_NO(+)   
                   AND  H2.PRS_DCD(+)   = 'B00002'
                   AND  A2.ORD_NO       = I2.ORD_NO(+)   
                   AND  I2.PRS_DCD(+)   = 'B00007'
                   AND  A2.ORD_NO       = L2.ORD_NO(+)   
                   AND  L2.PRS_DCD(+)   = 'B00006'
                   AND  A2.ORD_NO       = M2.ORD_NO(+)   
                   AND  M2.PRS_DCD(+)   = 'B00008'
                   AND  A2.CUST_NO      = J2.CUST_NO(+)
                   AND  A2.ORD_NO       = K2.ORD_NO(+)
            ) A3
     WHERE  A3.CUST_NM2 LIKE '%'||v_Cust_Nm||'%'
       AND  A3.CAR_NO   LIKE '%'||v_Car_No||'%'  
       AND  A3.STAT_DIV   >= v_Div_Cd
     ORDER  BY A3.REQ_DAY DESC;
     
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
  
  EXCEPTION  
    WHEN e_Error THEN
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_sExif0003InstallTodoList(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0003.p_sExif0003InstallTodoList(2)', v_ErrorText, v_Return_Message);    
  
  END p_sExif0003InstallTodoList;
  
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO                                                AS ORD_NO,          /*주문번호       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM,         /*계약상태       */
            A.ORD_DAY                                               AS ORD_DAY,         /*접수일자       */
            A.PROC_DAY                                              AS OPROC_DAY,       /*계약-장착일자  */
            TO_CHAR(A.REG_DT, 'HH24:MI:SS')                         AS REG_DT,          /*계약접수시간   */
            DECODE(A.CHAN_CD,
                    '01', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                    '05', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                    DECODE(A.STAT_CD,
                           '06', NULL,
                           A.PROC_DAY))                             AS PROC_DAY,        /*장착완료일자   */
            TO_CHAR(C.REG_DT, 'HH24:MI:SS')                         AS PROC_TM,         /*장착완료시간   */
            ''                                                      AS PETTERN_CD,      /* 상품패턴      */
            LISTAGG(B.MAT_CD, ',') WITHIN GROUP (ORDER BY B.MAT_CD) AS MAT_CD,          /*상품코드       */
            LISTAGG(DECODE(B.FR_CD,'Z','(범용)','F','(앞)','R','(뒤)')||Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD), ',') WITHIN GROUP (ORDER BY B.FR_CD, B.MAT_CD)          AS MAT_NM,          /*상품명         */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022',A.CNT_CD)       AS CNT_NM,          /*타이어본수     */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021',A.PERIOD_CD)    AS PERIOD_NM,       /*계약기간       */
            A.REGI_AMT                                              AS REGI_AMT,        /*렌탈등록비     */
            A.MON_AMT                                               AS MON_AMT,         /*월렌탈료       */
            Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)             AS CUST_NM,         /*고객명         */
            A.AGENCY_CD,                                                                /*장착대리점코드 */
            Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)           AS AGENCY_NM    ,   /*장착대리점     */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S018',A.SALES_GROUP)  AS SALES_GROUP_NM  ,/*지사           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S019',A.SALES_OFFICE) AS SALES_OFFICE_NM ,/*지점           */
            DECODE(A.CONTENTS_CD,
                     '0001', Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD),
                             Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)||
                             ' '||
                             Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)) AS MODEL_NM, /*차종+사양명 */
            A.CAR_NO                                                AS CAR_NO,          /*차량번호       */
            A.ORD_AGENT                                             AS ORD_AGENT,       /*판매인번호     */
            E.ORG_AGNM                                              AS ORG_AGNM,        /*판매인명       */
            DECODE(D.GENDER_CD,'1','남','2','여')                   AS GENDER_CD,       /*성별           */
            A.C_MILEAGE                                             AS C_MILEAGE,       /*현재주행거리   */
            (TO_CHAR(SYSDATE,'YYYY')-SUBSTR(D.BIRTH_DAY,1,4)+1)     AS AGE,             /*나이           */
            REPLACE(SUBSTR( D.ADDR1 ,1,REGEXP_INSTR(D.ADDR1,'\ ')),' ','') AS ADDR_AREA,/*지역           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,       /*계절구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S078', F.MF_CD)       AS MF_NM,           /*구매전 제조사  */
            A.CHAN_CD                                               AS CHAN_CD,         /*채널구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM,         /*채널구분       */
--            CASE WHEN (SELECT USER_GRP FROM RTCM0001 WHERE USER_ID = v_Reg_Id) IN ('01', '02') THEN D.MOB_NO 영업관리자, 콜센터만 휴대폰번호 공개
--                ELSE REGEXP_SUBSTR(D.MOB_NO, '0[0-9]{1,2}') || '****' || SUBSTR(D.MOB_NO, LENGTH(D.MOB_NO) - 3, 4) END MOB_NO, /*휴대폰번호 20160408 추가 한승훈    */
            CASE WHEN (SELECT USER_GRP FROM RTCM0001 WHERE USER_ID = v_Reg_Id) NOT IN ('01', '02', '16') THEN SUBSTR(NVL(H.MOB_NO, D.MOB_NO), 1, 3) || '0000' || SUBSTR(NVL(H.MOB_NO, D.MOB_NO), LENGTH(NVL(H.MOB_NO, D.MOB_NO)) - 3, 4)
                ELSE NVL(H.MOB_NO, D.MOB_NO) END MOB_NO,
            --D.MOB_NO,   
            DECODE(A.CHAN_CD,'03',E.CHAN_LCLS_CD,G.CHAN_LCLS_CD) AS CHAN_LCLS_CD,
            DECODE(A.CHAN_CD,'03',E.CHAN_MCLS_CD,G.CHAN_MCLS_CD) AS CHAN_MCLS_CD,            
            Pkg_Rtcm0051.f_sRtcm0051Codename('S090',DECODE(A.CHAN_CD,'03',E.CHAN_LCLS_CD,G.CHAN_LCLS_CD)) AS CHAN_LCLS_NM,
            Pkg_Rtcm0051.f_sRtcm0051Codename('S091',DECODE(A.CHAN_CD,'03',E.CHAN_MCLS_CD,G.CHAN_MCLS_CD)) AS CHAN_MCLS_NM,
            '(' || D.POS_CD || ') ' || D.ADDR1 || ' ' || D.ADDR2 AS ADDR,
            A.PS_CD,                                                                   /*서비스코드     */ --[20180301_03]
            Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM,           /*서비스명       */ --[20180301_03]
            /***********************************부가정보*************************************/
            H.BLD_MNG_NO,
            NVL(H.POSCD, D.POS_CD) POSCD,
            NVL(H.ADDR1, D.ADDR1) ADDR1,
            NVL(H.ADDR2, D.ADDR2) ADDR2,
            H.STAT_CD,
            H.STAT_DTL_CD,
            H.MEMO,
            CASE WHEN LOT_MB = '0' THEN I.DO_NM || ' ' || I.CT_NM || ' ' || I.B_DNG_NM || ' ' || I.B_RI_NM 
                 WHEN LOT_SB = '0' THEN I.DO_NM || ' ' || I.CT_NM || ' ' || I.B_DNG_NM || ' ' || I.B_RI_NM || ' ' || I.LOT_MB
                 ELSE I.DO_NM || ' ' || I.CT_NM || ' ' || I.B_DNG_NM || ' ' || I.B_RI_NM || ' ' || I.LOT_MB || '-' || I.LOT_SB END  ADDR3,
            NVL(H.PROC_DAY, H.REQ_DAY) CONFIRM_DAY,
            H.PROC_TM AS CONFIRM_TM            
    FROM    RTSD0104 A,
            RTSD0106 B,
            RTSD0108 C,
            RTSD0100 D,
            RTSD0113 E,
            RTCS0120 F,
            RTSD0007 G,
            RTSD0401 H,
            RTSD0010 I
    WHERE   A.ORD_DAY       BETWEEN v_Ord_Fday AND v_Ord_Tday                               /*접수일자FROM~TO       */
    AND     A.SALES_OFFICE  = DECODE(v_Sales_Office, NULL, A.SALES_OFFICE, v_Sales_Office)  /*지점                  */
    AND     A.SALES_GROUP   = DECODE(v_Sales_Group , NULL, A.SALES_GROUP , v_Sales_Group)   /*지사                  */
    AND     A.AGENCY_CD     = DECODE(v_Agency_Cd   , NULL, A.AGENCY_CD   , v_Agency_Cd)     /*장착 대리점           */
    AND     A.ORD_NO        = DECODE(v_Ord_No      , NULL, A.ORD_NO      , v_Ord_No)        /*주문번호              */
    AND     A.CUST_NO       = DECODE(v_Cust_No     , NULL, A.CUST_NO     , v_Cust_No)       /*고객번호              */
    AND     (v_Proc_Fday IS NULL OR (v_Proc_Fday IS NOT NULL AND A.PROC_DAY BETWEEN v_Proc_Fday AND v_Proc_Tday))   /*장착일자FROM~TO       */
    AND     (v_Mob_No IS NULL OR (v_Mob_No IS NOT NULL AND D.MOB_NO LIKE '%'|| v_Mob_No ||'%'))   /*핸드폰번호 추가 20160408 한승훈        */
    AND     A.ORD_NO = B.ORD_NO
    AND     A.ORD_NO = C.ORD_NO (+)
    AND     A.CUST_NO = D.CUST_NO
    AND     A.ORD_AGENT = E.ORD_AGENT(+)
    AND     A.ORD_NO    = F.ORD_NO (+)
    AND     A.AGENCY_CD = G.AGENCY_CD(+)
    AND     A.ORD_NO = H.ORD_NO(+)
    AND     H.BLD_MNG_NO = I.BLD_MNG_NO(+)
    GROUP BY A.ORD_NO,A.STAT_CD,A.ORD_DAY,A.PROC_DAY,A.REG_DT,A.CHAN_CD,C.REG_DT,A.CNT_CD,A.PERIOD_CD,
             A.REGI_AMT,A.MON_AMT,A.CUST_NO,A.AGENCY_CD,A.SALES_GROUP,A.SALES_OFFICE,A.CONTENTS_CD,A.MODEL_CD,
             A.CAR_NO,A.ORD_AGENT,E.ORG_AGNM,D.GENDER_CD,A.C_MILEAGE,D.BIRTH_DAY,D.ADDR1,A.SEASON_CD,F.MF_CD,H.MOB_NO,D.MOB_NO,
             E.CHAN_LCLS_CD,G.CHAN_LCLS_CD,E.CHAN_MCLS_CD,G.CHAN_MCLS_CD,H.POSCD,D.POS_CD,H.ADDR1,D.ADDR1,H.ADDR2,D.ADDR2,A.PS_CD,H.BLD_MNG_NO,
             H.STAT_CD,H.STAT_DTL_CD,H.MEMO,I.DO_NM,I.CT_NM,I.B_DNG_NM,I.B_RI_NM,I.LOT_MB,I.LOT_SB,H.PROC_DAY,H.REQ_DAY,H.PROC_TM;

  END p_sExif0003InstallOrdInfo;
  
  /*****************************************************************************
  -- 거점코드 구분 (O2O)
  *****************************************************************************/
  FUNCTION f_sExif0003O2OAgency (
      v_Agency_Cd         IN VARCHAR2                                /* 대리점코드 */
  ) RETURN VARCHAR IS

    v_Rc_Yn VARCHAR2(10);  
  BEGIN

    SELECT CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END
        INTO v_Rc_Yn
        FROM O2OUSER.TB_OG_ORGZ_MST A,
             O2OUSER.TB_SV_BHF_MNG B
    WHERE B.BHF_CD = A.ORGZ_CD
        AND B.BHF_SE = '10'
        AND A.BP_CD = TRIM(TO_CHAR(v_Agency_Cd, '0000000000')); /* 10 : O2O 거점*/
    
    RETURN v_Rc_Yn;
    
  END f_sExif0003O2OAgency;
  
  /*****************************************************************************
  -- 거점코드 - 거래처 코드 조회
  *****************************************************************************/
   PROCEDURE p_sExif0003O2OAgencyInfo (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Agency_Cd         IN VARCHAR2                                /* 대리점코드 */
  ) IS
  
  BEGIN
  
        OPEN Ref_Cursor FOR
        SELECT /*+ ORDERED   */
                 A.ORGZ_CD                  AS    bhfCd         /* 지점 코드 */
                 ,    A.WRH_CD               AS   wrhCd         /* 창고 코드 */
                 ,    A.BP_CD                  AS   bpCd         /*  거래처코드*/
                 ,    A.ORGZ_NM               AS    bhfNm         /* 지점 명 */
                 ,    B.ZIP                  AS   postNo         /* 우편 번호 */                 
                 ,    B.BASS_ADDR    AS   addr1         /* 주소 */
                 ,    B.DTL_ADDR    AS   addr2         /* 상세주소 */
                 ,    B.SALE_GRP_CD            AS    saleGrpCd      /* 판매 그룹 코드 */
                 ,    B.SALE_OFFICE            AS    saleOffice      /* 판매 사무실 */
                FROM   O2OUSER.TB_OG_ORGZ_MST   A   ,
                           O2OUSER.TB_WM_BP_MST   B   ,
                           O2OUSER.TB_SV_BHF_MNG    C
                WHERE    1=1
                AND      A.ORGZ_CD = C.BHF_CD
                AND      C.BHF_SE = '10'
                AND      A.BP_CD = B.BP_CD
                AND      A.ORGZ_CD = v_Agency_Cd
                ;
                
  END p_sExif0003O2OAgencyInfo;
  
END Pkg_Exif0003;