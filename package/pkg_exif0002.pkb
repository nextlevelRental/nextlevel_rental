CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Exif0002 AS 
/*******************************************************************************
   NAME:      Pkg_EXIF0002
   PURPOSE  EAI시스템 인터페이스

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-07  jemcarry         1. Created this package body.
   1.1        2016-04-28  이영근           대리점 인터페이스 INPUT 수정 
   1.1.1      2016-12-12  wjim             [20161212_01] 
                                           - 중도완납, 중도해지 당월 계산서 발행을 위한 법인 I/F 대상 수정
   1.1.2      2017-02-27  wjim             [20170227_01] B2B 일시불 주문 추가   
   1.2        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.3        2017-09-13  wjim             [20170913_01] 대리점 I/F 기준 변경
   1.4        2017-09-19  wjim             [20170919_01] 레귤러체인 렌탈 런칭에 따른 수정
                                           - 레귤러체인 수수료(실제로는 인센티브)는 전표미생성 대상으로 벤더 ERP I/F 대상에서 제외
   1.5        2017-09-29  wjim             [20170828_02] 걱정제로 자동오더 대상 변경
                                           - 긴급배송 요청으로 ERP 수기 선오더건 자동오더 대상에서 제외                                            
   1.6        2017-09-30  wjim             [20170930_01] 벤더정보 연동기준 변경                                           
   1.7        2017-10-19  wjim             [20171019_01] ERP > 렌탈 주문번호 갱신 검증로직 추가
   1.7        2017-12-19  wjim             [20171219_02] 상품마스터 수정기준 변경
   1.8        2017-12-26  wjim             [20171226_01] 대리점 정보 비고 추가
   1.9        2018-03-12  wjim             [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.10       2018-03-27  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.11       2018-09-20  wjim             [20180920_01] Sales Order 정보 수신 항목 추가
   1.12       2018-12-04  wjim             [20181204_01] 매출정보에 (렌탈)계약기간 추가
                                           - 기존 등록비 이연 정보의 이연기간(계약기간)으로 SAP에서 중량계산
                                           - 등록비 면제에 따른 차이 발생으로 매출정보에 계약기간 추가하여 SAP중량계산 기준으로 삼기로 함(w/정창인)
   1.13       2019-02-19  wjim             [20190219_01] 대리점마스터 항목추가에 따른 후속조치
   1.14       2019-07-31  wjim             [20190731_01] 대리점마스터 항목추가에 따른 후속조치
   1.15       2019-12-17  wjim             [2019-00359563] O2O 실적분리를 위한 연동 항목추가
   1.16       2019-12-20  wjim             [2019-00358138] 송장 비고를 위한 연동 항목추가
*******************************************************************************/


  /*****************************************************************************
  -- 0) RTSD0007(대리점마스터) INSERT INTERFACE(EAI)
  
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-09-13  wjim             [20170913_01] 대리점 I/F 기준 변경
                                           - 정보수정 항목에서 전화번호, 핸드폰번호 제외
   1.8        2017-12-26  wjim             [20171226_01] 비고 추가
                                           - 영업관리시스템 관리항목으로 NULL로 I/F
   1.9        2018-03-12  wjim             [20180312_01] 탈착기, 얼라인먼트, 밸런스 추가
   1.13       2019-02-19  wjim             [20190219_01] 퍼플점여부 추가     
   1.14       2019-07-31  wjim             [20190731_01] 충당금반환여부 추가
  *****************************************************************************/
  PROCEDURE p_Erprecvcustomer (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*대리점명              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTSD0007.CITY%TYPE,           /*주소                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*상세주소              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*우편일련번호          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX번호               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*사업자번호            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*대표명                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*업종                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*업태                  */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*계절구분              */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*사용여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Legacy_Sigun_Cd RTSD0007.SIGUN_CD%TYPE DEFAULT NULL;

    v_Tel_No2 RTSD0007.TEL_NO%TYPE DEFAULT NULL;      /*전화번호              */
    v_Mob_No2 RTSD0007.MOB_NO%TYPE DEFAULT NULL;      /*핸드폰번호            */
    v_Fax_No2 RTSD0007.FAX_NO%TYPE DEFAULT NULL;      /*FAX번호               */
    v_Reg_Id  RTCS0103.REG_ID%TYPE DEFAULT 'IFEAI';   /*등록자ID              */
    e_Error   EXCEPTION;
  BEGIN


--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '대리점코드    ', v_Agency_Cd   );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '대리점명      ', v_Agency_Nm   );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '지사코드      ', v_Sales_Group );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '지점코드      ', v_Sales_Office);
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '우편번호      ', v_Pos_Cd      );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '주소          ', v_City        );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '상세주소      ', v_Street      );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '시,도 코드    ', v_Sido_Cd     );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '시,군,구 코드 ', v_Legacy_Sigun_Cd    );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '우편일련번호  ', v_Ser_No      );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '전화번호      ', v_Tel_No      );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '핸드폰번호    ', v_Mob_No      );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', 'FAX번호       ', v_Fax_No      );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '사업자번호    ', v_Tax_No      );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '대표명        ', v_Rep_Nm      );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '업종          ', v_Busi_Type   );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '업태          ', v_Busi_Cond   );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '계절구분      ', v_Season_Gbn  );
--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', '사용여부      ', v_Use_Yn      );


    -- 필수값: 대리점코드, 대리점명, 사용여부
    IF TRIM(v_Agency_Cd) IS NULL THEN
        v_Return_Message := '대리점코드('||v_Agency_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Agency_Nm) IS NULL THEN
        v_Return_Message := '대리점명('||v_Agency_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 전화번호
    v_Tel_No2 :=  REPLACE(REPLACE(REPLACE(REPLACE(v_Tel_No, '-',''),'(',''),')',''),'~','');

    -- 핸드폰번호
    v_Mob_No2 :=  REPLACE(REPLACE(REPLACE(REPLACE(v_Mob_No, '-',''),'(',''),')',''),'~','');

    -- FAX번호
    v_Fax_No2 :=  REPLACE(REPLACE(REPLACE(REPLACE(v_Fax_No, '-',''),'(',''),')',''),'~','');

   -- 차세대 SAP 구코드 그대로 변환 [20250401_01]
   SELECT CD
   	 INTO v_Legacy_Sigun_Cd
     FROM RTCM0051 
    WHERE CD_GRP_CD = 'S017'
	  AND REMARK = v_Sigun_Cd;  

    IF 0 = Pkg_Rtsd0007.f_sRtsd0007Count(TO_NUMBER(v_Agency_Cd)) THEN

        -- [20190219_01] 퍼플점여부는 'N'으로 고정
        -- [20190731_01] 충당금반환여부는 'N'으로 고정
        IF 0 != Pkg_Rtsd0007.f_InsertRtsd0007(TO_NUMBER(v_Agency_Cd) , v_Agency_Nm , v_Sales_Group , v_Sales_Office ,
                                 v_Pos_Cd , v_City , v_Street , v_Sido_Cd ,
                                 v_Legacy_Sigun_Cd , v_Ser_No , v_Tel_No2 , v_Mob_No2 ,
                                 v_Fax_No2 , v_Tax_No , v_Rep_Nm , v_Busi_Type ,
                                 v_Busi_Cond , 'Y' , TO_CHAR(SYSDATE,'YYYYMMDD') , '99991231' ,
                                 NULL, NULL, v_Season_Gbn, 'N',
                                 'N', 'N', 'N', 15,
                                 NULL, NULL, v_Use_Yn , v_Reg_Id, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N', 'N', NULL, NULL, 'N', 'N', 'N', v_ErrorText) THEN
            v_Return_Message := '대리점마스터 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        ELSE

            IF 0 = Pkg_Rtcm0001.f_sRtcm0001Count(TO_NUMBER(v_Agency_Cd)) THEN

                IF 0 != Pkg_Rtcm0001.f_InsertRtcm0001(TO_NUMBER(v_Agency_Cd),
                                                      v_Agency_Nm,
                                                      '831D67D413BFD63322C0A1325EF32E8159F27B1C094F2A6CE1DC0307E600E808',
                                                      TO_NUMBER(v_Agency_Cd),
                                                      v_Sales_Office,
                                                      v_Sales_Group,
                                                      '05',
                                                      'N',
                                                      v_Reg_Id,
                                                      v_ErrorText) THEN
                    v_Return_Message := '대리점마스터 등록 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                    
                ELSE
                
                    -- 사용자 등록 이력 생성
                    IF 0 != Pkg_Rtcm0002.f_InsertRtcm0002(TO_NUMBER(v_Agency_Cd), v_ErrorText) THEN
                        v_Return_Message := '대리점 계정등록 이력생성 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText:= v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    IF 0 = Pkg_Rtcm0023.f_sRtcm0023Count('A0050',TO_NUMBER(v_Agency_Cd)) THEN

--                        IF 0 != Pkg_Rtcm0023.f_InsertRtcm0023('A0050',
--                                                              TO_NUMBER(v_Agency_Cd),
--                                                              'N',
--                                                              v_Reg_Id,
--                                                              v_ErrorText) THEN
--                            v_Return_Message := '대리점마스터 등록 실패!!!'||'-'||v_ErrorText;
--                            v_ErrorText := v_ErrorText;
--                            RAISE e_Error;
--
--                        END IF;
                        
                        Pkg_Rtcm0023.p_IUDRtcm0023(
                              'I'                       /*처리구분(I,U,D)       */
                            , 'A0050'                   /*권한그룹코드          */
                            , TO_NUMBER(v_Agency_Cd)    /*사용자 아이디         */
                            , 'N'                       /*삭제표시              */
                            , v_Reg_Id                  /*등록자 ID             */
                            , v_Success_Code
                            , v_Return_Message
                            , v_ErrorText 
                        );
                        
                        IF 0 != v_Success_Code THEN
                           v_Return_Message := '대리점 권한그룹 연동 실패!!!'||'-'||v_Return_Message;
                           v_Errortext := v_Errortext;
                           RAISE e_Error;
                        END IF;

                    END IF;

                END IF;

            END IF;

        END IF;

    ELSE
        -- 전화번호, 휴대폰번호는 렌탈시스템의 기존정보 유지 [20170913_01]
        SELECT  TEL_NO, MOB_NO
          INTO  v_Tel_No2, v_Mob_No2
          FROM  RTSD0007
         WHERE  AGENCY_CD = TO_NUMBER(v_Agency_Cd);

        IF 0 != Pkg_Rtsd0007.f_UpdateRtsd0007Interface( TO_NUMBER(v_Agency_Cd) , v_Agency_Nm , v_Sales_Group , v_Sales_Office ,
                                                         v_Pos_Cd , v_City , v_Street , v_Sido_Cd ,
                                                         v_Legacy_Sigun_Cd , v_Ser_No , v_Tel_No2 , v_Mob_No2 ,
                                                         v_Fax_No2 , v_Tax_No , v_Rep_Nm , v_Busi_Type ,
                                                         v_Busi_Cond , v_Season_Gbn, v_Use_Yn, v_Reg_Id,
                                                         v_ErrorText) THEN
            v_Return_Message := '대리점마스터 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvcustomer(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvcustomer(2)', v_ErrorText, v_Return_Message);

  END p_Erprecvcustomer;

  /*****************************************************************************
  -- 1) RTSD0005(상품마스터) INSERT INTERFACE(EAI)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.7        2017-12-19  wjim             [20171219_02] 수정기준 변경
                                           - Pricing Group만 수정
  *****************************************************************************/
PROCEDURE p_Erprecvmatrial (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Nvl_Pg_Cd RTSD0005.PG_CD%TYPE DEFAULT ' ';

    v_Reg_Id    RTCS0103.REG_ID%TYPE DEFAULT 'IFEAI';    /*등록자ID              */
    
    lr_Sd0005   RTSD0005%ROWTYPE;
    
    e_Error EXCEPTION;
  BEGIN

    v_Nvl_Pg_Cd := NVL(v_Pg_Cd, ' ');

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvmatrial(1)', '상품코드           ', v_Mat_Cd       );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvmatrial(1)', '패턴코드           ', v_Pettern_Cd   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvmatrial(1)', '단면폭             ', v_Section_Width);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvmatrial(1)', '편평비             ', v_Aspect_Ratio );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvmatrial(1)', '인치               ', v_Wheel_Inches );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvmatrial(1)', 'PR(강도)           ', v_Ply_Rating   );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvmatrial(1)', 'Pricing Group Code ', v_Nvl_Pg_Cd        );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvmatrial(1)', '사용여부           ', v_Use_Yn       );


    -- 필수값: 상품코드, 사용여부
    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF 0 = Pkg_Rtsd0005.f_sRtsd0005Count(v_Mat_Cd) THEN

        IF 0 != Pkg_Rtsd0005.f_InsertRtsd0005(v_Mat_Cd, NULL, v_Pettern_Cd, TO_CHAR(TO_NUMBER(v_Section_Width)),
                                              NVL(TRIM(v_Aspect_Ratio), 'Z'), v_Wheel_Inches, TO_NUMBER(v_Ply_Rating), NULL,
                                              v_Nvl_Pg_Cd, NULL, v_Use_Yn,
                                              v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;

    ELSE
    
        -- Pricing Group을 제외한 나머지 항목은 update하지 않음 [20171219_02]
        SELECT  *
          INTO  lr_Sd0005
          FROM  RTSD0005
         WHERE  MAT_CD = v_Mat_Cd;

        IF 0 != Pkg_Rtsd0005.f_UpdateRtsd0005Interface(
              v_Mat_Cd, lr_Sd0005.PETTERN_CD, lr_Sd0005.SECTION_WIDTH
            , lr_Sd0005.ASPECT_RATIO, lr_Sd0005.WHEEL_INCHES, lr_Sd0005.PLY_RATING, v_Nvl_Pg_Cd
            , lr_Sd0005.USE_YN, v_Reg_Id, v_ErrorText)
        THEN
            v_Return_Message := '수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        --[20171219_02] 이전
--        IF 0 != Pkg_Rtsd0005.f_UpdateRtsd0005Interface(v_Mat_Cd, v_Pettern_Cd, TO_CHAR(TO_NUMBER(v_Section_Width)),
--                                                       NVL(TRIM(v_Aspect_Ratio), 'Z'), v_Wheel_Inches, TO_NUMBER(v_Ply_Rating), v_Nvl_Pg_Cd,
--                                                       v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
--            v_Return_Message := '수정 실패!!!'||'-'||v_ErrorText;
--            v_ErrorText := v_ErrorText;
--            RAISE e_Error;
--        END IF;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvmatrial(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvmatrial(2)', v_ErrorText, v_Return_Message);

  END p_Erprecvmatrial;


  /*****************************************************************************
  -- 2) 주문정보 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1.2      2017-02-27  wjim             [20170227_01] B2B 일시불 주문 추가
                                           - 회수오더 미발생 
                                           - B2B일시불 채널코드(09) 추가
   1.5        2017-09-29  wjim             [20170828_02] 걱정제로 자동오더 대상 변경
                                           - 긴급배송 요청으로 ERP 수기 선오더건 자동오더 대상에서 제외
   1.15       2019-12-17  wjim             [2019-00359563] O2O 실적분리를 위한 연동 항목추가
                                           - Order Reason : 2019-12-23 장착기준 신규 OR로 분기처리 R오더에만 적용 
                                           - Usage : 장착유형에 따라 결정, 전문점 방문의 경우 기존과 동일하게 null처리, R오더에만 적용
   1.16       2019-12-20  wjim             [2019-00358138] 송장 비고를 위한 연동 항목추가
                                           - 특기사항 : RDC 송장 비고란에 내용 출력, N오더에만 해당                                                                                 
  *****************************************************************************/
  PROCEDURE p_Erpsendorder (
    v_Gubun          IN CHAR,          /*구분 N:주문, R:반품주문              */
    Ref_Cursor       OUT SYS_REFCURSOR
    ) IS
  

    v_Reg_Id RTCS0103.REG_ID%TYPE DEFAULT 'IFEAI';    /*등록자ID              */
  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erpsendorder');

    DELETE RTTEMP04;

    -- 반품주문건이 아닌 경우 
    IF TRIM(v_Gubun) != 'R' THEN

        INSERT INTO RTTEMP04
        SELECT  A.ORD_NO,
                'N'          AS GUBUN,
                A.AGENCY_CD AS KUNNER,
                D.CUST_NM   AS BNAME,
                CASE WHEN A.ORD_DAY >= '20180801' THEN 
                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
                                   WHEN '02' THEN 'R43'
                                   WHEN '03' THEN 'R43'
                                   WHEN '04' THEN 'R43'
                                   WHEN '05' THEN 'R42'
                                   WHEN '06' THEN 'R43'
                                   WHEN '09' THEN 'R43'      --B2B일시불 [20170227_01]
                    END
                ELSE
                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
                                   WHEN '02' THEN 'R41'
                                   WHEN '03' THEN 'R41'
                                   WHEN '04' THEN 'R41'
                                   WHEN '05' THEN 'R42'
                                   WHEN '06' THEN 'R41'
                                   WHEN '09' THEN 'R41'      --20180718 KST
                    END                                      --온라인계약(O,B)주문의 경우 ORDER REASON을 R43으로 변경
                END AS AUGRU,                                --2018.08.01 신규주문부터 시행, [2019-00359563] 명칭변경(USAGE->AUGRU, 2019.12.23부)
                CASE A.CHAN_CD WHEN '01' THEN A.ORD_DAY
                               WHEN '02' THEN C.PLAN_DAY
                               WHEN '03' THEN C.PLAN_DAY
                               WHEN '04' THEN C.PLAN_DAY
                               WHEN '05' THEN A.ORD_DAY
                               WHEN '06' THEN C.PLAN_DAY
                               WHEN '09' THEN C.PLAN_DAY --B2B일시불 [20170227_01]
                END AS AUDAT,
                DECODE(C.MAT_CD_S, NULL, C.MAT_CD, C.MAT_CD_S)    AS MATNR, --[20210713_01] 거점의 경우 대체규격 입력시 대체규격 연동
                C.CNT_CD    AS KWMENG,
                NULL        AS VBELN,
                NULL        AS ABRVW, --Usage [2019-00359563]                
                CASE WHEN A.CHAN_CD IN ('01', '05') THEN
                    '오프라인_렌탈'
                    ||'('||A.ORD_NO||')'
                ELSE
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('S304', NVL(A.INST_CD,'1030'))||'_'||'렌탈'
                    ||'('||D.CUST_NM
                    ||','||D.MOB_NO
                    ||','||A.ORD_NO||')' 
                END AS TEXT, --특기사항=RDC송장 비고용 [2019-00358138]
                A.ORD_DAY   AS ERDAT,     -- 주문일 [20200327]
                C.PLAN_DAY  AS WADAT,     -- 장착예정일 [20200327]
                CASE WHEN A.ORD_DAY >= '20200414' THEN
                    CASE WHEN Pkg_Exif0004.f_sExif0004O2OStockYn(A.OMS_ORDERNO) = 'Y' OR
                        (SELECT COUNT(*) FROM RTSD0104 X WHERE X.CHAN_CD IN ('01', '05') AND X.SALES_GROUP LIKE '113%' AND X.ORD_NO = A.ORD_NO) > 0 
                        THEN 'X' ELSE '' END -- [20220322_01] kstka 오프라인 주문 이면서 레귤러체인인경우 접수주문 제외 
                ELSE '' END AS O2O_STOCK_YN, --거점재고사용유무[20200406]
                '' AS ZAD_ORDER,  --보증서비스유무 [20201118]
                A.OMS_ORDERNO
        FROM    RTSD0104 A,
                RTSD0007 B,
                RTSD0106 C,
                RTSD0100 D
        WHERE   A.ORD_DAY BETWEEN TO_CHAR(SYSDATE - 5,'YYYYMMDD') AND TO_CHAR(SYSDATE,'YYYYMMDD')
        AND     A.STAT_CD IN ('01','03','04') -- 접수(01),장착대기(03),장착완료(04)
        AND     A.AGENCY_CD = B.AGENCY_CD(+)
        AND     A.ORD_NO    = C.ORD_NO(+)
        AND     A.CUST_NO   = D.CUST_NO
        AND     A.OUT_STOCK_YN  NOT IN ('Y')  --[20210804_01] 20210804 kstka 직영도매재고사용여부, 직영도매재고 사용시 인터페이스 미생성
        AND     NOT EXISTS (SELECT 1 FROM RTSD0104 X WHERE X.CHAN_CD IN ('01', '05') AND X.ORD_DAY < '20210801' AND X.ORD_NO = A.ORD_NO)  -- [20210731_01] kstka 오프라인 주문은 8월 1일 주문부터 인터페이스
--        AND     A.CHAN_CD   NOT IN ('01','05') -- 2015.11.19 김인과장님 요청 [20210713_01] kstka 오프라인렌탈 consignment 전환
        AND     NOT EXISTS (SELECT 'X'
                            FROM   RTSD0115 Z
                            WHERE  Z.ORD_NO = A.ORD_NO
                            AND    Z.TRANS_TP = 'N'
                            AND    Z.NUM IS NULL
                            );        
        

        --2016 02 16 걱정제로 : 일반 온라인 주문이든 선처리든 반품은 없고 정상주문만 보낸다.--한창운/ 김인 , 김한나 개발                     
        INSERT INTO RTTEMP07                            
        SELECT DISTINCT A.ORD_NO,
               A.GUBUN,
               A.AGENCY_CD,
               A.CUST_NM,
               A.USAGE,
               A.AUDAT,
               A.MATNR,
               A.KWMENG,
               NULL        AS VBELN,
               A.NUM,
               ABRVW,                --Usage [2019-00359563]
               TEXT,                  --특기사항 [2019-00358138]
               ERDAT,                 -- 신청일 [20200327]
               WADAT,                -- 장착예정일 [20200327]
               O2O_STOCK_YN,     --거점재고사용유무[20200406]
               ZAD_ORDER,      --보증서비스유무 [20201118]
               NULL AS OMS_ORDERNO
         FROM(
               SELECT A.ORD_NO,
                      'N' AS GUBUN,
                      A.AGENCY_CD,
                      A.CUST_NM,
                      'R41' AS USAGE,
                      A.SERVRQ_DAY AS AUDAT,
                      A.MATNR,
                      A.KWMENG,
--                      DECODE((SELECT MAX(Z.NUM) FROM RTSD0115 Z WHERE Z.ORD_NO = A.ORD_NO  AND Z.NUM IN ('1','2')), '','1','2') AS NUM
                      A.ROW_NUM AS NUM, --[20170828_02]
                      DECODE(A.INST_CD, '1010', '06', '1020', '05', NULL) AS ABRVW, --Usage [2019-00359563]
                      Pkg_Rtcm0051.f_sRtcm0051CodeName('S304', NVL(A.INST_CD,'1030'))||'_'||'렌탈'
                      ||'('||B.CUST_NM
                      ||','||B.MOB_NO
                      ||','||A.ORD_NO||')' AS TEXT, --특기사항=RDC송장 비고용 [2019-00358138]
                      A.DLVR_DAY     AS ERDAT,   -- 20200327 kstka 걱정제로 신청일
                      A.SERVRQ_DAY  AS WADAT,    -- 20200327 kstka 걱정제로 장착예정일
                      CASE WHEN A.SERVRQ_DAY >= '20200414' THEN
                        CASE WHEN Pkg_Exif0004.f_sExif0004O2OStockYn(A.OMS_ORDERNO) = 'Y' THEN 'X' ELSE '' END 
                      ELSE '' END AS O2O_STOCK_YN, --거점재고사용유무[20200406]
                      '' AS ZAD_ORDER    --보증서비스유무[20201118]
                 FROM (
                        SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY X.DLVR_DAY, X.DLVR_SEQ) AS ROW_NUM
                             ,  X.* 
                          FROM  RTCS0010 X
                         WHERE  X.DLV_STAt NOT IN ('06')
                      ) A --[20170828_02]
--                      RTCS0010 A
                      , RTSD0100 B
                WHERE A.DLV_STAT IN ('01','07')  --요청접수시 정상 주문 , 접수: 01/ 선처리 한경우 07 상태
                  AND A.CUST_NO = B.CUST_NO  
              ) A 
       WHERE NOT EXISTS (SELECT 'X'
                           FROM   RTSD0115 Z
                          WHERE  Z.ORD_NO = A.ORD_NO
                            AND  Z.TRANS_TP = 'S'||A.NUM
                            AND  Z.NUM = TO_CHAR(A.NUM)
                            --AND  Z.SEND_DAY IS NOT NULL
                         );
        
        --20201118 조기마모파손 : 일반 온라인 주문이든 선처리든 반품은 없고 정상주문만 보낸다.                  
        INSERT INTO RTTEMP17                            
        SELECT DISTINCT A.ORD_NO,
               A.GUBUN,
               A.AGENCY_CD,
               A.CUST_NM,
               A.USAGE,
               A.AUDAT,
               A.MATNR,
               A.KWMENG,
               NULL        AS VBELN,
               A.NUM,
               ABRVW,                --Usage [2019-00359563]
               TEXT,                  --특기사항 [2019-00358138]
               ERDAT,                 -- 신청일 [20200327]
               WADAT,                -- 장착예정일 [20200327]
               O2O_STOCK_YN,     --거점재고사용유무[20200406]
               ZAD_ORDER,       --보증서비스유무[20201118]
               NULL AS OMS_ORDERNO
         FROM(
               SELECT A.ORD_NO,
                      'N' AS GUBUN,
                      A.AGENCY_CD,
                      A.CUST_NM,
                      'R41' AS USAGE,
                      A.SERVRQ_DAY AS AUDAT,
                      A.MATNR,
                      A.KWMENG,
--                      DECODE((SELECT MAX(Z.NUM) FROM RTSD0115 Z WHERE Z.ORD_NO = A.ORD_NO  AND Z.NUM IN ('1','2')), '','1','2') AS NUM
                      A.ROW_NUM AS NUM, --[20170828_02]
                      NULL AS ABRVW, --Usage [2019-00359563]
                      '조기마모파손_렌탈'
                      ||'('||B.CUST_NM
                      ||','||B.MOB_NO
                      ||','||A.ORD_NO||')' AS TEXT, --특기사항=RDC송장 비고용 [2019-00358138]
                      A.DLVR_DAY     AS ERDAT,   -- 20200327 kstka 걱정제로 신청일
                      A.SERVRQ_DAY  AS WADAT,    -- 20200327 kstka 걱정제로 장착예정일
                      '' AS O2O_STOCK_YN, --거점재고사용유무[20200406]
                      'X' AS ZAD_ORDER    --보증서비스여부
                 FROM (
                        SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY X.DLVR_DAY, X.DLVR_SEQ) AS ROW_NUM
                             ,  X.* 
                          FROM  RTCS0208 X
                         WHERE  X.DLV_STAT NOT IN ('06')
                      ) A --[20170828_02]
--                      RTCS0010 A
                      , RTSD0100 B
                WHERE A.DLV_STAT IN ('01','07')  --요청접수시 정상 주문 , 접수: 01/ 선처리 한경우 07 상태
                  AND A.CUST_NO = B.CUST_NO  
              ) A 
       WHERE NOT EXISTS (SELECT 'X'
                           FROM   RTSD0115 Z
                          WHERE  Z.ORD_NO = A.ORD_NO
                            AND  Z.TRANS_TP = 'W'||A.NUM
                            AND  Z.NUM = TO_CHAR(A.NUM)
                            --AND  Z.SEND_DAY IS NOT NULL
                         );
                         
        UPDATE RTCS0010 A
        SET DLV_STAT = '02'
        WHERE A.DLV_STAT = '01';
      --  AND NOT EXISTS (SELECT 'X'
      --                    FROM   RTSD0115 Z
      --                    WHERE  Z.ORD_NO = A.ORD_NO
      --                    AND Z.TRANS_TP = 'S%'
      --                    AND Z.NUM IS NOT NULL
      --  );
              
        UPDATE RTCS0010 A
        SET DLV_STAT = '08'
        WHERE A.DLV_STAT = '07';
       -- AND NOT EXISTS (SELECT 'X'
       --                   FROM   RTSD0115 Z
       --                   WHERE  Z.ORD_NO = A.ORD_NO
      --                    AND  Z.TRANS_TP = 'S%'
      --                    AND Z.NUM IS NOT NULL
      --  );                                                                                                        

      UPDATE RTCS0208 A
        SET DLV_STAT = '02'
        WHERE A.DLV_STAT = '01';
      --  AND NOT EXISTS (SELECT 'X'
      --                    FROM   RTSD0115 Z
      --                    WHERE  Z.ORD_NO = A.ORD_NO
      --                    AND Z.TRANS_TP = 'S%'
      --                    AND Z.NUM IS NOT NULL
      --  );
              
        UPDATE RTCS0208 A
        SET DLV_STAT = '08'
        WHERE A.DLV_STAT = '07';
       -- AND NOT EXISTS (SELECT 'X'
       --                   FROM   RTSD0115 Z
       --                   WHERE  Z.ORD_NO = A.ORD_NO
      --                    AND  Z.TRANS_TP = 'S%'
      --                    AND Z.NUM IS NOT NULL
      --  ); 
    END IF;

    -- 반품주문건읜 경우
    IF TRIM(v_Gubun) = 'R' THEN

        --[20210621_01] 월말인경우 - 장착일기준
        IF TO_CHAR(SYSDATE, 'YYYYMMDDHH24MI') >= TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') || '2030' THEN
        
            INSERT INTO RTTEMP04
            SELECT  A.ORD_NO,
                    'R'         AS GUBUN,
                    A.AGENCY_CD AS KUNNER,
                    E.CUST_NM   AS BNAME,
    --                CASE WHEN G.PROC_DAY >= '20191223' THEN -- [2019-00359563] 신사업팀 구광태 대리 요청으로 실적분리를 위해 Order Reason 신규코드로 분리 
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R65'
    --                                   WHEN '02' THEN 'R60'
    --                                   WHEN '03' THEN 'R63'
    --                                   WHEN '04' THEN 'R61'
    --                                   WHEN '05' THEN 'R66'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43'
    --                    END
    --                WHEN A.ORD_DAY >= '20180801' THEN                
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R43'
    --                                   WHEN '03' THEN 'R43'
    --                                   WHEN '04' THEN 'R43'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END 
    --                ELSE
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R41'
    --                                   WHEN '03' THEN 'R41'
    --                                   WHEN '04' THEN 'R41'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R41'
    --                                   WHEN '09' THEN 'R41' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END
    --                END AS USAGE,                           --[2019-00359563] 명칭변경(USAGE->AUGRU, 2019.12.23부)
                    Pkg_Rtsd0104.f_sRtsdGetUsage(A.ORD_DAY, G.PROC_DAY, A.CHAN_CD) AS USAGE, -- 20200410 kstka Pkg_Exif0003 패키지에서도 장착시 사용하므로 function으로 공통화 함.
                    A.PROC_DAY  AS AUDAT,
                    DECODE(D.MAT_CD_S, NULL, D.MAT_CD, D.MAT_CD_S)    AS MATNR, --[20210713_01] 거점의 경우 대체규격 입력시 대체규격 연동
                    D.CNT_CD    AS KWMENG,
                    F.VBELN     AS VBELN, /*주문번호(ORD_NO, TRANS_TP = 'N'으로 SELECT(RTSD0115) */
                    G.USAGE     AS ABRVW, --Usage [2019-00359563]
                    NULL        AS TEXT,   --특기사항 [2019-00358138]
                    A.ORD_DAY        AS ERDAT,
                    G.PROC_DAY        AS WADAT,
                    CASE WHEN A.ORD_DAY >= '20200414' THEN
                    CASE WHEN Pkg_Exif0004.f_sExif0004O2OStockYn(A.OMS_ORDERNO) = 'Y' OR
                        (SELECT COUNT(*) FROM RTSD0104 X WHERE X.CHAN_CD IN ('01', '05') AND X.SALES_GROUP LIKE '113%' AND X.ORD_NO = A.ORD_NO) > 0 
                        THEN 'X' ELSE '' END -- [20220322_01] kstka 오프라인 주문 이면서 레귤러체인인경우 접수주문 제외 
                    ELSE '' END AS O2O_STOCK_YN, --거점재고사용유무 [20200406]
                    '' AS ZAD_ORDER,  --보증서비스여부 [20201118]
                    A.OMS_ORDERNO
            FROM    RTSD0104 A,
                    RTSD0007 C,
                    RTSD0106 D,
                    RTSD0100 E,
                    RTSD0115 F,
                    RTSD0108 G
            WHERE   G.PROC_DAY BETWEEN TO_CHAR(ADD_MONTHS(LAST_DAY(SYSDATE)+1, -1), 'YYYYMMDD') AND TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') --[20210607_01] kstka 오프라인렌탈 consignment 전환, 전날 회수오더분 I/F, 월말에는 월중 장착처리건 모두
            AND     A.ORD_ID NOT IN ('02') -- [20170227_01] B2B일시불의 경우 회수오더 미발생
            AND     A.STAT_CD   = '04'
            AND     A.AGENCY_CD = C.AGENCY_CD(+)
            AND     A.ORD_NO    = D.ORD_NO(+)
            AND     A.CUST_NO   = E.CUST_NO 
            AND     A.ORD_NO    = F.ORD_NO(+)
            AND     F.TRANS_TP(+)  = 'N'
            AND     A.ORD_NO    = G.ORD_NO(+)
            AND     A.OUT_STOCK_YN  NOT IN ('Y')  --[20210804_01] 20210804 kstka 직영도매재고사용여부, 직영도매재고 사용시 인터페이스 미생성
            AND     NOT EXISTS (SELECT 'X'
                                FROM   RTSD0115 Z
                                WHERE  Z.ORD_NO = A.ORD_NO
                                AND    Z.TRANS_TP = 'R'
                                AND Z.NUM IS NULL
                                );
                                
        ELSE -- 월말이 아닌경우 실제출고일 기준
        
            INSERT INTO RTTEMP04
            SELECT  A.ORD_NO,                   --[20210805_01] kstka 출고일이 당일
                    'R'         AS GUBUN,
                    A.AGENCY_CD AS KUNNER,
                    E.CUST_NM   AS BNAME,
    --                CASE WHEN G.PROC_DAY >= '20191223' THEN -- [2019-00359563] 신사업팀 구광태 대리 요청으로 실적분리를 위해 Order Reason 신규코드로 분리 
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R65'
    --                                   WHEN '02' THEN 'R60'
    --                                   WHEN '03' THEN 'R63'
    --                                   WHEN '04' THEN 'R61'
    --                                   WHEN '05' THEN 'R66'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43'
    --                    END
    --                WHEN A.ORD_DAY >= '20180801' THEN                
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R43'
    --                                   WHEN '03' THEN 'R43'
    --                                   WHEN '04' THEN 'R43'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END 
    --                ELSE
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R41'
    --                                   WHEN '03' THEN 'R41'
    --                                   WHEN '04' THEN 'R41'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R41'
    --                                   WHEN '09' THEN 'R41' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END
    --                END AS USAGE,                           --[2019-00359563] 명칭변경(USAGE->AUGRU, 2019.12.23부)
                    Pkg_Rtsd0104.f_sRtsdGetUsage(A.ORD_DAY, G.PROC_DAY, A.CHAN_CD) AS USAGE, -- 20200410 kstka Pkg_Exif0003 패키지에서도 장착시 사용하므로 function으로 공통화 함.
                    A.PROC_DAY  AS AUDAT,
                    DECODE(D.MAT_CD_S, NULL, D.MAT_CD, D.MAT_CD_S)    AS MATNR, --[20210621_01] 거점의 경우 대체규격 입력시 대체규격 연동
                    D.CNT_CD    AS KWMENG,
                    F.VBELN     AS VBELN, /*주문번호(ORD_NO, TRANS_TP = 'N'으로 SELECT(RTSD0115) */
                    G.USAGE     AS ABRVW, --Usage [2019-00359563]
                    NULL        AS TEXT,   --특기사항 [2019-00358138]
                    A.ORD_DAY        AS ERDAT,
                    G.PROC_DAY        AS WADAT,
                    CASE WHEN A.ORD_DAY >= '20200414' THEN --* 20200414 이어야 함
                        CASE WHEN Pkg_Exif0004.f_sExif0004O2OStockYn(A.OMS_ORDERNO) = 'Y' OR A.SALES_OFFICE LIKE '1104%' THEN 'X' ELSE '' END
                      ELSE '' END AS O2O_STOCK_YN, --거점재고사용유무 [20200406]
                    '' AS ZAD_ORDER,  --보증서비스여부 [20201118]
                    A.OMS_ORDERNO
            FROM    RTSD0104 A,
                    RTSD0007 C,
                    RTSD0106 D,
                    RTSD0100 E,
                    RTSD0115 F,
                    RTSD0108 G,
                    (SELECT ROW_NUMBER() OVER(PARTITION BY X.ORD_NO ORDER BY X.VBELN_D DESC) SEQ, X.* FROM RTSD0116 X) H
            WHERE   H.GI_DAY = TO_CHAR(SYSDATE,'YYYYMMDD') --[20210607_01] kstka 오프라인렌탈 consignment 전환, 전날 회수오더분 I/F, 월말에는 월중 장착처리건 모두
            AND     A.CHAN_CD IN ('01', '05')   --[20210709_01] 오프라인주문인경우
            AND     A.ORD_ID NOT IN ('02') -- [20170227_01] B2B일시불의 경우 회수오더 미발생
            AND     A.STAT_CD   = '04'
            AND     A.AGENCY_CD = C.AGENCY_CD(+)
            AND     A.ORD_NO    = D.ORD_NO(+)
            AND     A.CUST_NO   = E.CUST_NO 
            AND     A.ORD_NO    = F.ORD_NO(+)
            AND     F.TRANS_TP(+)  = 'N'
            AND     A.ORD_NO    = G.ORD_NO(+)
            AND     A.ORD_NO    = H.ORD_NO  -- [20210611_01] 출고정보
            AND     H.SEQ       = 1
            AND     A.OUT_STOCK_YN  NOT IN ('Y')  --[20210804_01] 20210804 kstka 직영도매재고사용여부, 직영도매재고 사용시 인터페이스 미생성
            AND     NOT EXISTS (SELECT 1 FROM RTSD0104 X WHERE X.ORD_DAY < '20210801' AND X.ORD_NO = A.ORD_NO)
            AND     NOT EXISTS (SELECT 'X'
                                FROM   RTSD0115 Z
                                WHERE  Z.ORD_NO = A.ORD_NO
                                AND    Z.TRANS_TP = 'R'
                                AND Z.NUM IS NULL
                                )
            UNION               -- [20210805_01] kstka 장착일이 당일인데 출고일이 이전인 경우
            SELECT  A.ORD_NO,
                    'R'         AS GUBUN,
                    A.AGENCY_CD AS KUNNER,
                    E.CUST_NM   AS BNAME,
    --                CASE WHEN G.PROC_DAY >= '20191223' THEN -- [2019-00359563] 신사업팀 구광태 대리 요청으로 실적분리를 위해 Order Reason 신규코드로 분리 
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R65'
    --                                   WHEN '02' THEN 'R60'
    --                                   WHEN '03' THEN 'R63'
    --                                   WHEN '04' THEN 'R61'
    --                                   WHEN '05' THEN 'R66'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43'
    --                    END
    --                WHEN A.ORD_DAY >= '20180801' THEN                
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R43'
    --                                   WHEN '03' THEN 'R43'
    --                                   WHEN '04' THEN 'R43'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END 
    --                ELSE
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R41'
    --                                   WHEN '03' THEN 'R41'
    --                                   WHEN '04' THEN 'R41'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R41'
    --                                   WHEN '09' THEN 'R41' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END
    --                END AS USAGE,                           --[2019-00359563] 명칭변경(USAGE->AUGRU, 2019.12.23부)
                    Pkg_Rtsd0104.f_sRtsdGetUsage(A.ORD_DAY, G.PROC_DAY, A.CHAN_CD) AS USAGE, -- 20200410 kstka Pkg_Exif0003 패키지에서도 장착시 사용하므로 function으로 공통화 함.
                    A.PROC_DAY  AS AUDAT,
                    DECODE(D.MAT_CD_S, NULL, D.MAT_CD, D.MAT_CD_S)    AS MATNR, --[20210621_01] 거점의 경우 대체규격 입력시 대체규격 연동
                    D.CNT_CD    AS KWMENG,
                    F.VBELN     AS VBELN, /*주문번호(ORD_NO, TRANS_TP = 'N'으로 SELECT(RTSD0115) */
                    G.USAGE     AS ABRVW, --Usage [2019-00359563]
                    NULL        AS TEXT,   --특기사항 [2019-00358138]
                    A.ORD_DAY        AS ERDAT,
                    G.PROC_DAY        AS WADAT,
                    CASE WHEN A.ORD_DAY >= '20200414' THEN --* 20200414 이어야 함
                        CASE WHEN Pkg_Exif0004.f_sExif0004O2OStockYn(A.OMS_ORDERNO) = 'Y' OR A.SALES_OFFICE LIKE '1104%' THEN 'X' ELSE '' END
                      ELSE '' END AS O2O_STOCK_YN, --거점재고사용유무 [20200406]
                    '' AS ZAD_ORDER,  --보증서비스여부 [20201118]
                    A.OMS_ORDERNO
            FROM    RTSD0104 A,
                    RTSD0007 C,
                    RTSD0106 D,
                    RTSD0100 E,
                    RTSD0115 F,
                    RTSD0108 G,
                    (SELECT ROW_NUMBER() OVER(PARTITION BY X.ORD_NO ORDER BY X.VBELN_D DESC) SEQ, X.* FROM RTSD0116 X) H
            WHERE   G.PROC_DAY BETWEEN TO_CHAR(SYSDATE - 5,'YYYYMMDD') AND TO_CHAR(SYSDATE,'YYYYMMDD') --[20210607_01] kstka 오프라인렌탈 consignment 전환, 전날 회수오더분 I/F, 월말에는 월중 장착처리건 모두
            AND     A.CHAN_CD IN ('01', '05')   --[20210709_01] 오프라인주문인경우
            AND     A.ORD_ID NOT IN ('02') -- [20170227_01] B2B일시불의 경우 회수오더 미발생
            AND     A.STAT_CD   = '04'
            AND     A.AGENCY_CD = C.AGENCY_CD(+)
            AND     A.ORD_NO    = D.ORD_NO(+)
            AND     A.CUST_NO   = E.CUST_NO 
            AND     A.ORD_NO    = F.ORD_NO(+)
            AND     F.TRANS_TP(+)  = 'N'
            AND     A.ORD_NO    = G.ORD_NO(+)
            AND     A.ORD_NO    = H.ORD_NO  -- [20210611_01] 출고정보
            AND     H.SEQ       = 1
            AND     A.OUT_STOCK_YN  NOT IN ('Y')  --[20210804_01] 20210804 kstka 직영도매재고사용여부, 직영도매재고 사용시 인터페이스 미생성
            AND     NOT EXISTS (SELECT 1 FROM RTSD0104 X WHERE X.ORD_DAY < '20210801' AND X.ORD_NO = A.ORD_NO)
            AND     NOT EXISTS (SELECT 'X'
                                FROM   RTSD0115 Z
                                WHERE  Z.ORD_NO = A.ORD_NO
                                AND    Z.TRANS_TP = 'R'
                                AND Z.NUM IS NULL
                                )
            UNION
            SELECT  A.ORD_NO,
                    'R'         AS GUBUN,
                    A.AGENCY_CD AS KUNNER,
                    E.CUST_NM   AS BNAME,
    --                CASE WHEN G.PROC_DAY >= '20191223' THEN -- [2019-00359563] 신사업팀 구광태 대리 요청으로 실적분리를 위해 Order Reason 신규코드로 분리 
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R65'
    --                                   WHEN '02' THEN 'R60'
    --                                   WHEN '03' THEN 'R63'
    --                                   WHEN '04' THEN 'R61'
    --                                   WHEN '05' THEN 'R66'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43'
    --                    END
    --                WHEN A.ORD_DAY >= '20180801' THEN                
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R43'
    --                                   WHEN '03' THEN 'R43'
    --                                   WHEN '04' THEN 'R43'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END 
    --                ELSE
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R41'
    --                                   WHEN '03' THEN 'R41'
    --                                   WHEN '04' THEN 'R41'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R41'
    --                                   WHEN '09' THEN 'R41' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END
    --                END AS USAGE,                           --[2019-00359563] 명칭변경(USAGE->AUGRU, 2019.12.23부)
                    Pkg_Rtsd0104.f_sRtsdGetUsage(A.ORD_DAY, G.PROC_DAY, A.CHAN_CD) AS USAGE, -- 20200410 kstka Pkg_Exif0003 패키지에서도 장착시 사용하므로 function으로 공통화 함.
                    A.PROC_DAY  AS AUDAT,
                    DECODE(D.MAT_CD_S, NULL, D.MAT_CD, D.MAT_CD_S)    AS MATNR, --[20210621_01] 거점의 경우 대체규격 입력시 대체규격 연동
                    D.CNT_CD    AS KWMENG,
                    F.VBELN     AS VBELN, /*주문번호(ORD_NO, TRANS_TP = 'N'으로 SELECT(RTSD0115) */
                    G.USAGE     AS ABRVW, --Usage [2019-00359563]
                    NULL        AS TEXT,   --특기사항 [2019-00358138]
                    A.ORD_DAY        AS ERDAT,
                    G.PROC_DAY        AS WADAT,
                    CASE WHEN A.ORD_DAY >= '20200414' THEN --* 20200414 이어야 함
                        CASE WHEN Pkg_Exif0004.f_sExif0004O2OStockYn(A.OMS_ORDERNO) = 'Y' THEN 'X' ELSE '' END
                      ELSE '' END AS O2O_STOCK_YN, --거점재고사용유무 [20200406]
                    '' AS ZAD_ORDER,  --보증서비스여부 [20201118]
                    A.OMS_ORDERNO
            FROM    RTSD0104 A,
                    RTSD0007 C,
                    RTSD0106 D,
                    RTSD0100 E,
                    RTSD0115 F,
                    RTSD0108 G
            WHERE   G.PROC_DAY BETWEEN TO_CHAR(SYSDATE - 5,'YYYYMMDD') AND TO_CHAR(SYSDATE,'YYYYMMDD')
            AND     A.CHAN_CD NOT IN ('01', '05')   --[20210709_01] 온라인주문인경우
            AND     A.ORD_ID NOT IN ('02') -- [20170227_01] B2B일시불의 경우 회수오더 미발생
            AND     A.STAT_CD   = '04'
            AND     A.AGENCY_CD = C.AGENCY_CD(+)
            AND     A.ORD_NO    = D.ORD_NO(+)
            AND     A.CUST_NO   = E.CUST_NO 
            AND     A.ORD_NO    = F.ORD_NO(+)
            AND     F.TRANS_TP(+)  = 'N'
            AND     A.ORD_NO    = G.ORD_NO(+)
            AND     A.OUT_STOCK_YN  NOT IN ('Y')  --[20210804_01] 20210804 kstka 직영도매재고사용여부, 직영도매재고 사용시 인터페이스 미생성
            AND     NOT EXISTS (SELECT 'X'
                                FROM   RTSD0115 Z
                                WHERE  Z.ORD_NO = A.ORD_NO
                                AND    Z.TRANS_TP = 'R'
                                AND Z.NUM IS NULL
                                )
            UNION
            SELECT  A.ORD_NO,
                    'R'         AS GUBUN,
                    A.AGENCY_CD AS KUNNER,
                    E.CUST_NM   AS BNAME,
    --                CASE WHEN G.PROC_DAY >= '20191223' THEN -- [2019-00359563] 신사업팀 구광태 대리 요청으로 실적분리를 위해 Order Reason 신규코드로 분리 
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R65'
    --                                   WHEN '02' THEN 'R60'
    --                                   WHEN '03' THEN 'R63'
    --                                   WHEN '04' THEN 'R61'
    --                                   WHEN '05' THEN 'R66'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43'
    --                    END
    --                WHEN A.ORD_DAY >= '20180801' THEN                
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R43'
    --                                   WHEN '03' THEN 'R43'
    --                                   WHEN '04' THEN 'R43'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R43'
    --                                   WHEN '09' THEN 'R43' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END 
    --                ELSE
    --                    CASE A.CHAN_CD WHEN '01' THEN 'R42'
    --                                   WHEN '02' THEN 'R41'
    --                                   WHEN '03' THEN 'R41'
    --                                   WHEN '04' THEN 'R41'
    --                                   WHEN '05' THEN 'R42'
    --                                   WHEN '06' THEN 'R41'
    --                                   WHEN '09' THEN 'R41' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
    --                    END
    --                END AS USAGE,                           --[2019-00359563] 명칭변경(USAGE->AUGRU, 2019.12.23부)
                    Pkg_Rtsd0104.f_sRtsdGetUsage(A.ORD_DAY, G.PROC_DAY, A.CHAN_CD) AS USAGE, -- 20200410 kstka Pkg_Exif0003 패키지에서도 장착시 사용하므로 function으로 공통화 함.
                    A.PROC_DAY  AS AUDAT,
                    DECODE(D.MAT_CD_S, NULL, D.MAT_CD, D.MAT_CD_S)    AS MATNR, --[20210621_01] 거점의 경우 대체규격 입력시 대체규격 연동
                    D.CNT_CD    AS KWMENG,
                    F.VBELN     AS VBELN, /*주문번호(ORD_NO, TRANS_TP = 'N'으로 SELECT(RTSD0115) */
                    G.USAGE     AS ABRVW, --Usage [2019-00359563]
                    NULL        AS TEXT,   --특기사항 [2019-00358138]
                    A.ORD_DAY        AS ERDAT,
                    G.PROC_DAY        AS WADAT,
                    'X' AS O2O_STOCK_YN, --거점재고사용유무 [20200406]
                    '' AS ZAD_ORDER,  --보증서비스여부 [20201118]
                    A.OMS_ORDERNO
            FROM    RTSD0104 A,
                    RTSD0007 C,
                    RTSD0106 D,
                    RTSD0100 E,
                    RTSD0115 F,
                    RTSD0108 G
            WHERE   G.PROC_DAY BETWEEN TO_CHAR(SYSDATE - 5,'YYYYMMDD') AND TO_CHAR(SYSDATE,'YYYYMMDD')
            AND     A.CHAN_CD IN ('01', '05')   --[20210709_01] 온라인주문인경우
            AND     A.ORD_ID NOT IN ('02') -- [20170227_01] B2B일시불의 경우 회수오더 미발생
            AND     A.SALES_OFFICE LIKE '%1104%' --[20220330_01] kstka 거점 레귤러체인인 경우 출고정보가 없으므로 별도 조회
            AND     A.STAT_CD   = '04'
            AND     A.AGENCY_CD = C.AGENCY_CD(+)
            AND     A.ORD_NO    = D.ORD_NO(+)
            AND     A.CUST_NO   = E.CUST_NO 
            AND     A.ORD_NO    = F.ORD_NO(+)
            AND     F.TRANS_TP(+)  = 'N'
            AND     A.ORD_NO    = G.ORD_NO(+)
            AND     A.OUT_STOCK_YN  NOT IN ('Y')  --[20210804_01] 20210804 kstka 직영도매재고사용여부, 직영도매재고 사용시 인터페이스 미생성
            AND     NOT EXISTS (SELECT 'X'
                                FROM   RTSD0115 Z
                                WHERE  Z.ORD_NO = A.ORD_NO
                                AND    Z.TRANS_TP = 'R'
                                AND Z.NUM IS NULL
                                );
        
        END IF;
        
      /*  INSERT INTO RTTEMP07                            
        SELECT A.ORD_NO,
               A.GUBUN,
               A.AGENCY_CD,
               A.CUST_NM,
               A.USAGE,
               A.AUDAT,
               A.MATNR,
               A.KWMENG,
               NULL        AS VBELN 
        FROM(
               SELECT A.ORD_NO,
                      DECODE( (SELECT Z.TRANS_TP FROM RTSD0115 Z WHERE Z.ORD_NO = A.ORD_NO AND Z.TRANS_TP IN ('R45','R46')), '','R45','R46') AS GUBUN,
                      A.AGENCY_CD,
                      A.CUST_NM,
                      DECODE( (SELECT Z.TRANS_TP FROM RTSD0115 Z WHERE Z.ORD_NO = A.ORD_NO AND Z.TRANS_TP IN ('R45','R46')), '','R45','R46') AS USAGE,
                      A.SERVRQ_DAY AS AUDAT,
                      A.MATNR,
                      A.KWMENG
                 FROM RTCS0010 A
                WHERE A.DLV_STAT = '01'
              ) A 
       WHERE NOT EXISTS (SELECT 'X'
                           FROM   RTSD0115 Z
                          WHERE  Z.ORD_NO = A.ORD_NO
                            AND  Z.TRANS_TP = A.USAGE
                         ) ;             */  

    END IF;

    -- SAL SO LOG Insert
    INSERT  INTO RTSD0115 (
            ORD_NO,    /*계약번호              */
            TRANS_TP,  /*전송구분              */
            SEND_DAY,  /*송신일자              */
            TRANS_DAY, /*수신일자              */
            EAI_YN,    /*EAI 수신여부          */
            SAP_YN,    /*SAP 결과수신여부      */
            VBELN,     /*SAP 주문번호          */
            REQ_TEXT,  /*비고                  */
            REG_ID,    /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  ORD_NO,
            GUBUN,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
            NULL,
            'Y',
            NULL,
            NULL,
            'ErpSendOrder',
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTTEMP04;
    
    -- SAL SO LOG Insert 걱정제로로그테이블 
    INSERT  INTO RTSD0115 (
            ORD_NO,    /*계약번호              */
            TRANS_TP,  /*전송구분              */
            SEND_DAY,  /*송신일자              */
            TRANS_DAY, /*수신일자              */
            EAI_YN,    /*EAI 수신여부          */
            SAP_YN,    /*SAP 결과수신여부      */
            VBELN,     /*SAP 주문번호          */
            REQ_TEXT,  /*비고                  */
            NUM,       /*걱정제로 횟수         */
            REG_ID,    /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  ORD_NO,
            'S'||NUM,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
            NULL,
            'Y',
            NULL,
            NULL,
            'ErpSendOrder',
            NUM,       /*걱정제로 횟수         */            
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTTEMP07; 
    
    -- SAL SO LOG Insert 보증서비스로그테이블 
    INSERT  INTO RTSD0115 (
            ORD_NO,    /*계약번호              */
            TRANS_TP,  /*전송구분              */
            SEND_DAY,  /*송신일자              */
            TRANS_DAY, /*수신일자              */
            EAI_YN,    /*EAI 수신여부          */
            SAP_YN,    /*SAP 결과수신여부      */
            VBELN,     /*SAP 주문번호          */
            REQ_TEXT,  /*비고                  */
            NUM,       /*걱정제로 횟수         */
            REG_ID,    /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  ORD_NO,
            'W'||NUM,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
            NULL,
            'Y',
            NULL,
            NULL,
            'ErpSendOrder',
            NUM,       /*보증서비스 횟수         */            
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTTEMP17;    

    --20200327 kstka 접수건인 경우 SAP전송전에 D+3일이내 주문건 제외
    IF TRIM(v_Gubun) != 'R' THEN
        INSERT INTO RTTEMP041 --LOG
        SELECT * FROM RTTEMP04 
        WHERE O2O_STOCK_YN = 'X'; -- 20200327 kstka 거점인경우 모든장착유형 에 대해 장착일이 D+3일이 경우만 SAP I/F
        
        DELETE FROM RTTEMP04 
        WHERE O2O_STOCK_YN = 'X'; --[20210607_01] kstka 오프라인렌탈 consignment 전환, 거점재고사용분도 I/F
        
--        INSERT INTO RTTEMP041 --LOG
--        SELECT * FROM RTTEMP04 
--        WHERE WADAT < PKG_RTCM0060.F_SRTCM0060FIRSTDAY(ERDAT)
--        AND PKG_EXIF0004.F_SEXIF0004O2OAGENCY(KUNNER) = 'Y'
--        AND O2O_STOCK_YN = 'X'; -- 20200327 kstka 거점인경우 모든장착유형 에 대해 장착일이 D+3일이 경우만 SAP I/F
--        
--        DELETE FROM RTTEMP04 
--        WHERE WADAT < PKG_RTCM0060.F_SRTCM0060FIRSTDAY(ERDAT)
--        AND PKG_EXIF0004.F_SEXIF0004O2OAGENCY(KUNNER) = 'Y'
--        AND O2O_STOCK_YN = 'X'; -- 20200327 kstka 거점인경우 모든장착유형 에 대해 장착일이 D+3일이 경우만 SAP I/F
        
--        INSERT INTO RTTEMP071 --LOG
--        SELECT * FROM RTTEMP07 
--        WHERE WADAT < PKG_RTCM0060.F_SRTCM0060FIRSTDAY(ERDAT)
--        AND PKG_EXIF0004.F_SEXIF0004O2OAGENCY(KUNNER) = 'Y'
--        AND O2O_STOCK_YN = 'Y'; -- 20200327 kstka 거점인 경우 모든장착유형에 대해 장착일이 D+3일이 경우만 SAP I/F
--        
--        DELETE FROM RTTEMP07 
--        WHERE WADAT < PKG_RTCM0060.F_SRTCM0060FIRSTDAY(ERDAT)
--        AND PKG_EXIF0004.F_SEXIF0004O2OAGENCY(KUNNER) = 'Y'
--        AND O2O_STOCK_YN = 'Y'; -- 20200327 kstka 거점인 경우 모든장착유형에 대해 장착일이 D+3일이 경우만 SAP I/F
    END IF;
    
    -- LOG 생성 실패시 데이터 전송도 실패

    OPEN Ref_Cursor FOR
    SELECT  ORD_NO,   /*계약번호      */
            GUBUN ,   /*전송구분      */
            KUNNER,   /*장착대리점    */
            BNAME ,   /*고객명        */
            USAGE AS AUGRU,   /*Order Reason    */ --[2019-00359563] 명칭변경(USAGE->AUGRU, 2019.12.23부)
            AUDAT ,   /*접수일자      */
            MATNR ,   /*제품코드      */
            KWMENG,   /*타이어본수    */
            VBELN,    /*SAP주문번호   */
            ABRVW,    /*Usage         */ --[2019-00359563]
            TEXT,      /*특기사항      */ --[2019-00358138]
            O2O_STOCK_YN,    /*      */ --[2019-00358138]
            ZAD_ORDER,
            OMS_ORDERNO AS OMS_ORD_NO
    FROM    RTTEMP04    
    UNION ALL
    SELECT  ORD_NO||'_'||NUM AS ORD_NO,
            GUBUN ,   /*전송구분      */
            KUNNER,   /*장착대리점    */
            BNAME ,   /*고객명        */
            USAGE AS AUGRU ,   /*온라인반품    */
            AUDAT ,   /*접수일자      */
            MATNR ,   /*제품코드      */
            KWMENG,   /*타이어본수    */
            VBELN,    /*SAP주문번호   */
            ABRVW,    /*Usage         */ --[2019-00359563]
            TEXT,      /*특기사항      */ --[2019-00358138]
            O2O_STOCK_YN,
            ZAD_ORDER,
            OMS_ORDERNO AS OMS_ORD_NO
    FROM    RTTEMP07
    UNION ALL
    SELECT  ORD_NO||'_'||NUM AS ORD_NO,
            GUBUN ,   /*전송구분      */
            KUNNER,   /*장착대리점    */
            BNAME ,   /*고객명        */
            USAGE AS AUGRU ,   /*온라인반품    */
            AUDAT ,   /*접수일자      */
            MATNR ,   /*제품코드      */
            KWMENG,   /*타이어본수    */
            VBELN,    /*SAP주문번호   */
            ABRVW,    /*Usage         */ --[2019-00359563]
            TEXT,      /*특기사항      */ --[2019-00358138]
            O2O_STOCK_YN,
            ZAD_ORDER,
            OMS_ORDERNO AS OMS_ORD_NO
    FROM    RTTEMP17;

    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erpsendorder(2)', SUBSTR(SQLERRM, 1, 200));

  END p_Erpsendorder;

  /*****************************************************************************
  -- SAL SO LOG INSERT INTERFACE(EAI)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------                                              
   1.7        2017-10-19  wjim             [20171019_01] ERP > 렌탈 주문번호 갱신 검증로직 추가
                                           - 계약번호 검증로직 강화
   1.11       2018-09-20  wjim             [20180920_01] 배송번호, 출고예정(요청)상품, 실제출고상품, 택배여부 추가
   1.12       2020-12-02  kstka            [20201202_01] 마모파손서비스여부 추가                                     
  *****************************************************************************/
  PROCEDURE p_Erprecvordernumber (
    v_Ord_No         IN RTSD0115.ORD_NO%TYPE,         /*계약번호              */
    v_Trans_Tp       IN RTSD0115.TRANS_TP%TYPE,       /*전송구분              */
    v_Vbeln          IN RTSD0115.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0115.VBELN_D%TYPE,        /*SAP 배송번호          */ --[20180920_01]
    v_Matnr_O        IN RTSD0115.MATNR_O%TYPE,        /*출고예정 상품코드     */ --[20180920_01]
    v_Matnr_S        IN RTSD0115.MATNR_S%TYPE,        /*실제출고 상품코드     */ --[20180920_01]
    v_Bezei          IN RTSD0115.BEZEI%TYPE,          /*택배여부              */ --[20180920_01]
    v_Zad_Order      IN VARCHAR2,                     /*마모파손서비스여부      */ --[20201202_01]
    v_Zcompany       IN RTSD0115.ZCOMPANY%TYPE,       /*택배사               */ --[20210917_01]
    v_ZParcelInvoice IN RTSD0115.ZPARCELINVOICE%TYPE, /*송장번호                */ --[20210917_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Reg_Id RTCS0103.REG_ID%TYPE DEFAULT 'IFEAI';    /*등록자ID              */
    e_Error EXCEPTION;
  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvordernumber(1)', '계약번호', v_Ord_No);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvordernumber(1)', '전송구분', v_Trans_Tp);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvordernumber(1)', 'SAP 주문번호', v_Vbeln);

    -- 필수값: 계약번호, 계약구분, 등록자 ID
    -- - 계약번호는 순수 12자리 계약번호 또는 '계약번호_숫자'(걱정제로용) 형태만 유효함
    -- - 계약번호(ERP상 PO번호)에 약속되지 않은 형태를 입력하는 경우가 있어 검증 강화 [20171019_01]

--    IF  (SUBSTR(v_Ord_No,14,1) <> '') OR (SUBSTR(v_Ord_No,14,1) IS NULL)  THEN    
--        IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
--            v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
--            RAISE e_Error;
--        END IF;
--    END IF;

    IF LENGTH(v_Ord_No) = 12 THEN    
        IF 0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') : 존재하지 않아 처리가 불가합니다!';
            RAISE e_Error;
        END IF;
    ELSIF (LENGTH(v_Ord_No) = 14) AND (SUBSTR(v_Ord_No, 13, 1) = '_') THEN
        IF 0 = Pkg_Rtsd0104.f_sRtsd0104Count(SUBSTR(v_Ord_No, 1, 12)) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') : 유효하지 않은 걱정제로 계약번호로 처리가 불가합니다!';
            RAISE e_Error;
        END IF;
    ELSE
        v_Return_Message := '계약번호('||v_Ord_No||') : 유효하지 않은 계약번호 형태로 처리가 불가합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Trans_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S065', v_Trans_Tp)) THEN
        v_Return_Message := '전송구분('||v_Trans_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = Pkg_Rtsd0115.f_sRtsd0115Count(v_Ord_No, v_Trans_Tp, v_Zad_Order) THEN

        IF 0 != Pkg_Rtsd0115.f_InsertRtsd0115( v_Ord_No,
                                               v_Trans_Tp,
                                               NULL,
                                               TO_CHAR(SYSDATE,'YYYYMMDD'),
                                               NULL,
                                               'Y',
                                               v_Vbeln,
                                               'ErpRecvOrder',
                                               v_Reg_Id,
                                               v_Vbeln_D,
                                               v_Matnr_O,
                                               v_Matnr_S,
                                               v_Bezei,
                                               v_Zad_Order,
                                               v_Zcompany,
                                               v_ZParcelInvoice,
                                               v_ErrorText
                                             ) THEN
            v_Return_Message := 'SAL SO LOG 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        IF 0 != Pkg_Rtsd0115.f_UpdateRtsd0115(
                                              v_Ord_No,
                                              v_Trans_Tp,
                                              NULL,
                                              TO_CHAR(SYSDATE,'YYYYMMDD'),
                                              NULL,
                                              'Y',
                                              v_Vbeln,
                                              'ErpRecvOrder',
                                              v_Reg_Id,
                                              v_Vbeln_D,
                                              v_Matnr_O,
                                              v_Matnr_S,
                                              v_Bezei,
                                              v_Zad_Order,
                                              v_Zcompany,
                                              v_ZParcelInvoice,
                                              v_ErrorText
                                             ) THEN
            v_Return_Message := 'SAL SO LOG 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    END IF;
    
    --배송상태 배송 배송중(배송완료
    /*
    IF (SUBSTR(v_Ord_No,14,1) <> '') OR (SUBSTR(v_Ord_No,14,1) IS NOT NULL)  THEN    
        UPDATE RTCS0010 A
        SET DLV_STAT = '03'
        WHERE DLV_STAT = '02'
          AND A.ORD_NO = SUBSTR(v_Ord_No,1,12)
          AND EXISTS (SELECT 'X'
         FROM   RTSD0115 Z
        WHERE  Z.ORD_NO = A.ORD_NO
          AND  Z.TRANS_TP = 'S'||SUBSTR(v_Ord_No,14,1)
          AND  Z.NUM = SUBSTR(v_Ord_No,14,1)
            );    
            
        UPDATE RTCS0010 A
        SET DLV_STAT = '09'
        WHERE DLV_STAT = '08'
          AND A.ORD_NO = SUBSTR(v_Ord_No,1,12)         
          AND EXISTS (SELECT 'X'
         FROM   RTSD0115 Z
        WHERE  Z.ORD_NO = A.ORD_NO
          AND  Z.TRANS_TP = 'S'||SUBSTR(v_Ord_No,14,1)
          AND  Z.NUM = SUBSTR(v_Ord_No,14,1)          
            );     
    END IF;
    */
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvordernumber(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvordernumber(2)', v_ErrorText, v_Return_Message);

  END p_Erprecvordernumber;

  /*****************************************************************************
  -- 인바운드 지역코드 관리 INSERT INTERFACE (EAI)
  *****************************************************************************/
  PROCEDURE p_Qmsrecvsaleoffice (
    v_Sales_Office_Id IN RTCS0103.SALES_OFFICE_ID%TYPE,  /*담당지구 코드      */
    v_Emp_Id          IN RTCS0103.EMP_ID%TYPE,           /*담당자 사번        */
    v_Region_No       IN RTCS0103.REGION_NO%TYPE,        /*지역코드           */
    v_City_No         IN RTCS0103.CITY_NO%TYPE,          /*도시코드           */
    v_Sales_Office_Nm IN RTCS0103.SALES_OFFICE_NAME%TYPE,/*담당지구 명        */
    v_Emp_Name        IN RTCS0103.EMP_NAME%TYPE,         /*담당자명           */
    v_Region_Name     IN RTCS0103.REGION_NAME%TYPE,      /*지역명             */
    v_City_Name       IN RTCS0103.CITY_NAME%TYPE,        /*도시명             */
    v_Emp_Mobileno    IN RTCS0103.EMP_MOBILENO%TYPE,     /*담당자Mobile No    */
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText       OUT VARCHAR2
    ) IS

    v_Reg_Id RTCS0103.REG_ID%TYPE DEFAULT 'IFEAI';       /*등록자ID           */
    e_Error EXCEPTION;
  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', '담당지구 코드  ', v_Sales_Office_Id);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', '담당자 사번    ', v_Emp_Id         );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', '지역코드       ', v_Region_No      );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', '도시코드       ', v_City_No        );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', '담당지구 명    ', v_Sales_Office_Nm);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', '담당자명       ', v_Emp_Name       );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', '지역명         ', v_Region_Name    );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', '도시명         ', v_City_Name      );
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', '담당자Mobile No', v_Emp_Mobileno   );


    -- 필수값:담당지구 코드,담당자 사번,지역코드,도시코드, 등록자 ID
    IF TRIM(v_Sales_Office_Id) IS NULL THEN
        v_Return_Message := '담당지구 코드('||v_Sales_Office_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Emp_Id) IS NULL THEN
        v_Return_Message := '담당자 사번('||v_Emp_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Region_No) IS NULL THEN
        v_Return_Message := '지역코드('||v_Region_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_City_No) IS NULL THEN
        v_Return_Message := '도시코드('||v_City_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = Pkg_Rtcs0103.f_sRtcs0103Count(v_Sales_Office_Id,v_Emp_Id,v_Region_No,v_City_No) THEN

        IF 0 != Pkg_Rtcs0103.f_InsertRtcs0103(v_Sales_Office_Id, v_Emp_Id, v_Region_No, v_City_No,
                                              v_Sales_Office_Nm, v_Emp_Name, v_Region_Name, v_City_Name,
                                              v_Emp_Mobileno, v_Reg_Id, v_ErrorText ) THEN
            v_Return_Message := '인바운드 지역코드 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 != Pkg_Rtcs0103.f_UpdateRtcs0103(v_Sales_Office_Id, v_Emp_Id, v_Region_No, v_City_No,
                                              v_Sales_Office_Nm, v_Emp_Name, v_Region_Name, v_City_Name,
                                              v_Emp_Mobileno, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '인바운드 지역코드 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Qmsrecvsaleoffice(2)', v_ErrorText, v_Return_Message);

  END p_Qmsrecvsaleoffice;



  /*****************************************************************************
  -- SMS 발송대상 INTERFACE
  *****************************************************************************/
  PROCEDURE p_Smssendcontent (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
   ) IS

    v_Reg_Id RTCS0103.REG_ID%TYPE DEFAULT 'IFEAI';       /*등록자ID           */
    e_Error EXCEPTION;
  BEGIN


    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Smssendcontent');

    DELETE  FROM RTTEMP02;

    INSERT  INTO RTTEMP02
    SELECT  A.CMP_MSG_ID
    FROM    RTSD0205 A
    WHERE   A.EAI_TR_YN = 'N' -- 미전송건
    AND     RESERVED_DTTM  BETWEEN TO_CHAR(SYSDATE-1, 'YYYYMMDD')||'000000'  -- 예약 전송시간 : 전일과 당일 SMS 만
                           AND     TO_CHAR(SYSDATE, 'YYYYMMDD')||'235959';

    OPEN Ref_Cursor FOR
    SELECT  A.CMP_MSG_ID,                /*메시지 ID           */
            A.CMP_MSG_GROUP_ID,          /*메시지 그룹ID       */
            A.USR_ID,                    /*서비스ID            */
            A.SMS_GB,                    /*전송 위치구분       */
            A.USED_CD,                   /*메시지 구분         */
            A.RESERVED_FG,               /*예약 전송여부       */
            A.RESERVED_DTTM,             /*예약 전송시간       */
            A.SAVED_FG,                  /*메시지 저장여부     */
            A.RCV_PHN_ID,                /*받는 전화번호       */
            A.SND_PHN_ID,                /*보내는 전화번호     */
            A.NAT_CD,                    /*국가코드            */
            A.ASSIGN_CD,                 /*특정가입자지정      */
            A.SND_MSG,                   /*메시지내용          */
            A.CALLBACK_URL,              /*Callback URL        */
            A.CONTENT_CNT,               /*첨부된 컨텐츠개수   */
            A.CONTENT_MIME_TYPE,         /*컨텐츠 MIME TYPE    */
            A.CONTENT_PATH,              /*첨부된 컨텐츠PATH   */
            A.CMP_SND_DTTM,              /*업체 SK 전송한시간  */
            A.CMP_RCV_DTTM,              /*업체 결과받은시간   */
            A.REG_SND_DTTM,              /*SK 통신사보낸시간   */
            A.REG_RCV_DTTM,              /*메시지 받은시간     */
            A.MACHINE_ID,                /*메시지입력경로      */
            A.SMS_STATUS,                /*메시지 처리 상태    */
            A.RSLT_VAL,                  /*전송 결과값         */
            A.MSG_TITLE,                 /*메시지 타이틀       */
            A.TELCO_ID,                  /*수신 이통사코드     */
            A.ETC_CHAR_1,                /*사용자지정 필드     */
            A.ETC_CHAR_2,                /*사용자지정 필드     */
            A.ETC_CHAR_3,                /*사용자지정 필드     */
            A.ETC_CHAR_4,                /*사용자지정 필드     */
            A.ETC_INT_5,                 /*사용자지정 필드     */
            A.ETC_INT_6                  /*사용자지정 필드     */
    FROM    RTSD0205 A,
            RTTEMP02 B
    WHERE   A.CMP_MSG_ID = B.CMP_MSG_ID;

    UPDATE  RTSD0205
    SET     JOB_DAY     = TO_CHAR(SYSDATE,'YYYYMMDD'),
            EAI_TR_DTTM = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),
            EAI_TR_YN   = 'Y',
            CHG_ID      = v_Reg_Id,
            CHG_DT      = SYSDATE
    WHERE   CMP_MSG_ID  IN (SELECT CMP_MSG_ID FROM RTTEMP02);

    DELETE  FROM RTTEMP02;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Smssendcontent(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Smssendcontent(2)', v_ErrorText, v_Return_Message);

  END p_Smssendcontent;


  /*****************************************************************************
  -- 배송완료 정보  INTERFACE
  *****************************************************************************/
  PROCEDURE p_Erprecvdelivery (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송완료일            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Reg_Id RTCS0103.REG_ID%TYPE DEFAULT 'IFEAI';    /*등록자ID              */
    v_Tans_Tp RTSD0115.TRANS_TP%TYPE;
    
    e_Error EXCEPTION;
  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvdelivery(1)', '계약번호', v_Ord_No);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvdelivery(1)', 'SAP 주문번호', v_Vbeln);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvdelivery(1)', 'SAP 배송번호', v_Vbeln_D);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvdelivery(1)', '배송완료일', v_Gi_Day);


    -- 필수값: 계약번호, SAP 주문번호
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count( SUBSTR(v_Ord_No,1,12) )) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Vbeln) IS NULL THEN
        v_Return_Message := 'SAP 주문번호('||v_Vbeln||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = Pkg_Rtsd0116.f_sRtsd0116Count( SUBSTR(v_Ord_No,1,12) , v_Vbeln) THEN

        IF 0 != Pkg_Rtsd0116.f_InsertRtsd0116( v_Ord_No,           /*계약번호              */
                                               v_Vbeln,                         /*SAP 주문번호          */
                                               v_Vbeln_D,                       /*SAP 배송번호          */
                                               v_Gi_Day,                        /*배송일자              */
                                               NULL,                            /*SMS 발송일자          */
                                               'N',                             /*SMS 발송여부          */
                                               v_Reg_Id,                        /*등록자 ID             */
                                               v_ErrorText
                                             ) THEN
            v_Return_Message := '배송완료 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        /* 
          걱정제로 서비스 배송상태 업데이트 20160420 한승훈
          계약번호가 12자리 이상이면서 출고된 데이터만 추출하여 업데이트  
        */
        IF LENGTH(v_Ord_No) > 12 AND v_Gi_Day IS NOT NULL THEN
        
            -- 서비스구분 획득
            SELECT SUBSTR(TRANS_TP, 1, 1) 
            INTO v_Tans_Tp
            FROM RTSD0115 
            WHERE ORD_NO = SUBSTR(v_Ord_No,1,12)
            AND VBELN = v_Vbeln;
            
            --걱정제로
            IF v_Tans_Tp = 'S' THEN
                IF 0 != PKG_RTCS0010.f_UpdateRtcs0010DlvStat( SUBSTR(v_Ord_No,1,12), 
                                                                v_Reg_Id,
                                                                v_ErrorText 
                                                        ) THEN
                    v_Return_Message := '걱정제로 배송완료 정보 등록 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;                                                                         
                END IF;
            ELSE --마모파손
                IF 0 != PKG_RTCS0208.f_UpdateRtcs0208DlvStat( SUBSTR(v_Ord_No,1,12), 
                                                                v_Reg_Id,
                                                                v_ErrorText 
                                                        ) THEN
                    v_Return_Message := '마모파손 배송완료 정보 등록 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;                                                                         
                END IF;

            END IF;
            
        END IF;

    ELSE

        IF 0 != Pkg_Rtsd0116.f_UpdateRtsd0116Recv( v_Ord_No,                    /*계약번호              */
                                                   v_Vbeln,                     /*SAP 주문번호          */
                                                   v_Vbeln_D,                   /*SAP 배송번호          */
                                                   v_Gi_Day,                    /*배송일자              */
                                                   v_Reg_Id,                    /*등록자 ID             */
                                                   v_ErrorText
                                                 ) THEN
            v_Return_Message := '배송완료 정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvdelivery(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvdelivery(2)', v_ErrorText, v_Return_Message);

  END p_Erprecvdelivery;


  /*****************************************************************************
  --1) 매출원가(렌탈타이어)RTCS0003 INSERT  INTERFACE
  *****************************************************************************/
  PROCEDURE p_Erprecvsalescost (
    v_Zmonth         IN RTCS0003.ZMONTH%TYPE,         /*마감년월              */
    v_Matnr          IN RTCS0003.MATNR%TYPE,          /*Material  Number      */
    v_Menge          IN RTCS0003.MENGE%TYPE,          /*Quantuty              */
    v_Cosgamt        IN RTCS0003.COSGAMT%TYPE,        /*매출원가              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    )IS

    v_Reg_Id RTCS0103.REG_ID%TYPE DEFAULT 'IFEAI';    /*등록자ID              */
    e_Error EXCEPTION;
  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvsalescost(1)', '마감년월', v_Zmonth);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvsalescost(1)', '자재번호', v_Matnr);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvsalescost(1)', '수량', v_Menge);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erprecvsalescost(1)', '매출원가', v_Cosgamt);


    -- 필수값: 마감년월, 자재번호, 수량, 매출원가
    IF (TRIM(v_Zmonth) IS NULL)  THEN
        v_Return_Message := '마감년월('||v_Zmonth||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Matnr) IS NULL THEN
        v_Return_Message := '자재번호('||v_Matnr||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF NVL(v_Menge, 0) = 0 THEN
        v_Return_Message := '수량('||v_Menge||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF NVL(v_Cosgamt, 0) = 0 THEN
        v_Return_Message := '매출원가('||v_Cosgamt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 <> Pkg_Rtcs0003.f_sRtcs0003CloseCount(v_Zmonth, 'Y') THEN
        v_Return_Message := v_Zmonth||'월은 이미 마감(감가상각 처리완료)되어  처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = Pkg_Rtcs0003.f_sRtcs0003Count(v_Zmonth, v_Matnr) THEN

        IF 0 != Pkg_Rtcs0003.f_InsertRtcs0003( v_Zmonth,                        /*마감년월              */
                                               LTRIM(v_Matnr, '0'),             /*Material  Nu-앞 0 제거*/
                                               v_Menge,                         /*Quantuty              */
                                               v_Cosgamt,                       /*매출원가              */
                                               'N',                             /*마감여부              */
                                               v_Reg_Id,                        /*등록자 ID             */
                                               v_ErrorText
                                              ) THEN
            v_Return_Message := '매출원가 I/F 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 != Pkg_Rtcs0003.f_UpdateRtcs0003( v_Zmonth,                        /*마감년월              */
                                               LTRIM(v_Matnr, '0'),             /*Material  Nu-앞 0 제거*/
                                               v_Menge,                         /*Quantuty              */
                                               v_Cosgamt,                       /*매출원가              */
                                               'N',                             /*마감여부              */
                                               v_Reg_Id,                        /*등록자 ID             */
                                               v_ErrorText
                                              ) THEN
            v_Return_Message := '매출원가 I/F 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvsalescost(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erprecvsalescost(2)', v_ErrorText, v_Return_Message);

  END p_Erprecvsalescost;

  /*****************************************************************************
  -- FI-8) 법인 고객 정보 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1.1      2016-12-12  wjim             [20161212_01] 
                                           - 중도완납, 중도해지 당월 계산서 발행을 위한 법인 I/F 대상 수정 
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
                                           - 계약자에게 세금계산서 발행 필요 없음                                           
  *****************************************************************************/
  PROCEDURE p_Erpbusicustinfo (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_Erpbusicustinfo(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월      */
--            A.ORD_NO                CNUM,       /*계액번호      */
--            B.CUST_TP               CKIMO,      /*고객구분(개인,사업자      */
--            B.CUST_NM               ZBYCN,      /*공급받는자 상호      */
--            B.BUSL_NO               BUYNO,      /*공급받는자  사업자번호      */
--            B.REP_NM                ZBYNM,      /*공급받는자 대표자명      */
--            B.BUSI_TYPE             ZBYBT,      /*공급받는자 업종      */
--            B.BUSI_COND             ZBYIT,      /*공급받는자 업태      */
--            '('||B.POS_CD||')'||
--            ' '||B.ADDR1||
--            ' '||B.ADDR2            ZBYAR,      /*공급받는자 주소      */
--            B.EMAIL_ADDR            ZBYRE,      /*공급받는자 EMAIL      */
--            B.C_CUSTNM              ZBYRN,      /*공급받는자 담당자명      */
--            B.C_TELNO               ZBYRT       /*공급받는자 담당자 전화      */
--    FROM    RTSD0108 A,
--            RTSD0100 B
--    WHERE   A.CUST_NO = B.CUST_NO
--    AND     A.BILL_YN = 'Y'
--    AND     A.PROC_DAY BETWEEN '20150904'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     (A.MFP_YN = 'N' OR (A.MFP_YN = 'Y' AND A.CANC_DAY BETWEEN v_Period||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')))  /* [20161212_01] */                          
----    AND     (A.MFP_YN = 'N' OR (A.MFP_YN = 'Y' AND A.CANC_DAY > TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')))
--    AND     (A.OS_YN = 'N' AND (A.OS_DAY >= TO_CHAR(LAST_DAY(TO_DATE(v_Period,'YYYYMM')),'YYYYMMDD') ))
--    AND     B.CUST_TP = '02'
--    AND     A.CHAN_CD NOT IN ('09')     -- [20170316_01]
--    ;
    
    OPEN Ref_Cursor FOR
    SELECT  A1.ZMONTH   /*마감년월      */
         ,  A1.CNUM     /*계액번호      */
         ,  A1.CKIMO    /*고객구분(개인,사업자      */
         ,  A1.ZBYCN    /*공급받는자 상호      */
         ,  A1.BUYNO    /*공급받는자  사업자번호      */
         ,  A1.ZBYNM    /*공급받는자 대표자명      */
         ,  A1.ZBYBT    /*공급받는자 업종      */
         ,  A1.ZBYIT    /*공급받는자 업태      */
         ,  A1.ZBYAR    /*공급받는자 주소      */
         ,  A1.ZBYRE    /*공급받는자 EMAIL      */
         ,  A1.ZBYRN    /*공급받는자 담당자명      */
         ,  A1.ZBYRT    /*공급받는자 담당자 전화      */
      FROM  RTRE5217 A1
     WHERE  A1.ZMONTH = v_Period
    ;


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_Erpbusicustinfo(2)', SUBSTR(SQLERRM, 1, 200));

  END p_Erpbusicustinfo;


  /*****************************************************************************
  -- 월 매출 정보집계
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
                                           - ERP주문을 통해 매출발생하므로 월마감시 매출 미연동
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
   1.12       2018-12-04  wjim             [20181204_01] (렌탈)계약기간 추가
   1.15       2019-12-17  wjim             [2019-00359563] O2O 실적분리를 위한 연동 항목(Usage)추가
  *****************************************************************************/
  PROCEDURE p_ErpSendSale_Data (
    v_Period         IN CHAR,                         /*년월                  */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendSale_Data(1)', '년월', v_Period);

    DELETE FROM RTTEMP12;
    
--    INSERT INTO RTTEMP12
--    SELECT  ROWNUM NUM,
--            v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.RECP_TP,                          /*매출구분              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */    
--            NVL(TRIM(E.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.PAY_MTHD,                         /*결제구분              */
--            A.RECP_NU,                          /*청구회차              */
--            A.SALE_AMT,                         /*매출액(전체)          */
--            A.SALE_NAMT,                        /*매출액(공급가액)      */
--            A.SALE_VAMT,                        /*세액                  */
--            A.DEMD_DT,                          /*매출일자              */
--            A.ZFB_DAY,                          /*결제일자              */
--            A.SCHD_SEQ,                         /*청구순번              */
--            D.CHAN_CD,                          /*채널구분              */
--            DECODE( D.CHAN_CD, '01', D.AGENCY_CD,
--                DECODE(D.CHAN_CD, '05', D.AGENCY_CD, D.ORD_AGENT)) ORD_AGENT,  /*판매인번호            */
--            TO_NUMBER(D.PERIOD_CD)         AS PPTRM, /*계약기간               */ --[20181204_01]
--            F.USAGE                        AS ABRVW  /*Usage                  */ --[2019-00359563]
--    FROM    RTSD0109 A, RTSD0100 B, RTSD0106 C, RTSD0104 D, RTSD0115 E, RTSD0108 F
--    WHERE   A.DEMD_DT BETWEEN  v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.SCD_STAT = 'S'
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     A.ORD_NO   = C.ORD_NO
--    AND     A.ORD_NO   = D.ORD_NO
--    AND     D.CHAN_CD  NOT IN ('09')                                          -- [20170316_01]
--    AND     A.ORD_NO   = E.ORD_NO(+)
--    AND     E.TRANS_TP(+) = 'N'
----    AND     A.ORD_NO not in (SELECT COL_01 FROM RTTEMPIWJ_190429_01)
--    AND     A.ORD_NO   = F.ORD_NO(+)
--    ORDER BY A.ORD_NO
--    ;
    
    INSERT INTO RTTEMP12
    SELECT  ROWNUM    AS NUM2
         ,  v_Period  AS ZMONTH /*마감년월              */
         ,  A1.ORD_NO           /*계약번호              */
         ,  A1.RECP_TP          /*매출구분              */
         ,  A1.CUST_TP          /*고객구분(개인,사업자) */    
         ,  A1.MAT_CD           /*상품번호              */
         ,  A1.PAY_MTHD         /*결제구분              */
         ,  A1.RECP_NU          /*청구회차              */
         ,  A1.SALE_AMT         /*매출액(전체)          */
         ,  A1.SALE_NAMT        /*매출액(공급가액)      */
         ,  A1.SALE_VAMT        /*세액                  */
         ,  A1.DEMD_DT          /*매출일자              */
         ,  A1.ZFB_DAY          /*결제일자              */
         ,  A1.SCHD_SEQ         /*청구순번              */
         ,  A1.CHAN_CD          /*채널구분              */
         ,  A1.ORD_AGENT        /*판매인번호            */
         ,  A1.PPTRM            /*계약기간              */ --[20181204_01]
         ,  A1.ABRVW            /*Usage                 */ --[2019-00359563]
      FROM  RTRE5201 A1
     WHERE  A1.ZMONTH = v_Period
    ;

    SELECT COUNT(*) INTO v_TotCnt FROM RTTEMP12;
    
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendSale_Data(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendSale_Data;
  
  /*****************************************************************************
  -- 월 매출 정보 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
                                           - ERP주문을 통해 매출발생하므로 월마감시 매출 미연동
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
   1.12       2018-12-04  wjim             [20181204_01] (렌탈)계약기간 추가
   1.15       2019-12-17  wjim             [2019-00359563] O2O 실적분리를 위한 연동 항목(Usage)추가
  *****************************************************************************/
  PROCEDURE p_ErpSendSale (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendSale(1)', '년월', v_Period);

    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.RECP_TP,                          /*매출구분              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */    
----            C.MAT_CD,                           /*상품번호              */
--            NVL(E.MATNR_S, C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.PAY_MTHD,                         /*결제구분              */
--            A.RECP_NU,                          /*청구회차              */
--            A.SALE_AMT,                         /*매출액(전체)          */
--            A.SALE_NAMT,                        /*매출액(공급가액)      */
--            A.SALE_VAMT,                        /*세액                  */
--            A.DEMD_DT,                          /*매출일자              */
--            A.ZFB_DAY,                          /*결제일자              */
--            A.SCHD_SEQ,                         /*청구순번              */
--            D.CHAN_CD,                          /*채널구분              */
--            DECODE( D.CHAN_CD, '01', D.AGENCY_CD,
--                DECODE(D.CHAN_CD, '05', D.AGENCY_CD, D.ORD_AGENT)) ORD_AGENT
--                                                /*판매인번호            */
--    FROM    RTSD0109 A, RTSD0100 B, RTSD0106 C, RTSD0104 D, RTSD0115 E
--    WHERE   A.DEMD_DT BETWEEN  v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.SCD_STAT = 'S'
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     A.ORD_NO   = C.ORD_NO
--    AND     A.ORD_NO   = D.ORD_NO
--    AND     D.CHAN_CD  NOT IN ('09')                                          -- [20170316_01]
--    AND     A.ORD_NO   = E.ORD_NO(+)
--    AND     E.TRANS_TP(+) = 'N'
--    ;

      SELECT ZMONTH,     /*마감년월              */
            ORD_NO,                           /*계약번호              */
            RECP_TP,                          /*매출구분              */
            CUST_TP,                          /*고객구분(개인,사업자) */    
            MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            PAY_MTHD,                         /*결제구분              */
            RECP_NU,                          /*청구회차              */
            SALE_AMT,                         /*매출액(전체)          */
            SALE_NAMT,                        /*매출액(공급가액)      */
            SALE_VAMT,                        /*세액                  */
            DEMD_DT,                          /*매출일자              */
            ZFB_DAY,                          /*결제일자              */
            SCHD_SEQ,                         /*청구순번              */
            CHAN_CD,                          /*채널구분              */
            ORD_AGENT,
            PPTRM,                            /*계약기간              */ --[20181204_01]
            ABRVW                             /*Usage                 */ --[2019-00359563]
            FROM RTTEMP12
            WHERE NUM BETWEEN TO_NUMBER(v_Period) - 1999 AND TO_NUMBER(v_Period);


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendSale(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendSale;


  /*****************************************************************************
  -- 월 수납내역 정보 집계
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
                                           - 일시불 대금을 ERP에서 수납처리하므로 미연동
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendReceipt_Data (
    v_Period         IN CHAR,                         /*년월                  */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendReceipt_Data(1)', '년월', v_Period);

    DELETE FROM RTTEMP13;
    
--    INSERT INTO RTTEMP13
--    SELECT  ROWNUM NUM,
--            v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.RECP_TP,                          /*매출구분              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */
----            C.MAT_CD,                           /*상품번호              */
--            NVL(TRIM(F.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.RECP_PAY,                         /*결제구분              */
--            A.RECP_AMT,                         /*수납금액              */
--            0                       FEE_AMT,    /*수수료                */
--            A.RECV_DAY,                         /*수납일자              */
--            A.RECV_SEQ,                         /*수납거래번호          */
--            A.RITM_SEQ,                         /*거래일련번호          */
--            D.RECP_NU,                          /*청구회차              */
--            A.SCHD_SEQ,                         /*청구순번              */
--            A.RECP_FG,                          /*수납유형              */
--            E.CHAN_CD,                          /*채널구분              */
--            DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
--                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT
--                                                /*판매인번호            */
--    FROM    RTRE0030 A, RTSD0100 B, RTSD0106 C, RTSD0109 D, RTSD0104 E, RTSD0115 F
--    WHERE   A.RECV_DAY BETWEEN  v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     A.ORD_NO   = C.ORD_NO
--    AND     A.ORD_NO   = D.ORD_NO(+)
--    AND     A.SCHD_SEQ = D.SCHD_SEQ(+)
--    AND     A.ORD_NO   = E.ORD_NO
--    AND     E.CHAN_CD  NOT IN ('09')  -- [20170316_01]
--    AND     A.ORD_NO      = F.ORD_NO(+)
--    AND     F.TRANS_TP(+) = 'N'
----    AND     A.ORD_NO NOT IN (SELECT COL_01 FROM RTTEMPIWJ_190429_01)
--    ORDER BY ORD_NO
--    ;
    
    INSERT INTO RTTEMP13
    SELECT  ROWNUM      AS NUM
         ,  v_Period    AS ZMONTH  /*마감년월              */
         ,  A1.ORD_NO              /*계약번호              */
         ,  A1.RECP_TP             /*매출구분              */
         ,  A1.CUST_TP             /*고객구분(개인,사업자) */
         ,  A1.MAT_CD              /*상품번호              */
         ,  A1.RECP_PAY            /*결제구분              */
         ,  A1.RECP_AMT            /*수납금액              */
         ,  0           AS FEE_AMT /*수수료                */
         ,  A1.RECV_DAY            /*수납일자              */
         ,  A1.RECV_SEQ            /*수납거래번호          */
         ,  A1.RITM_SEQ            /*거래일련번호          */
         ,  A1.RECP_NU             /*청구회차              */
         ,  A1.SCHD_SEQ            /*청구순번              */
         ,  A1.RECP_FG             /*수납유형              */
         ,  A1.CHAN_CD             /*채널구분              */
         ,  A1.ORD_AGENT           /*판매인번호            */
      FROM  RTRE5202 A1
     WHERE  A1.ZMONTH = v_Period
    ;
      
    SELECT COUNT(*) INTO v_TotCnt FROM RTTEMP13;
              
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendReceipt_Data(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendReceipt_Data;
  
  /*****************************************************************************
  -- 월 수납내역 정보 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
                                           - 일시불 대금을 ERP에서 수납처리하므로 미연동
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendReceipt (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendReceipt(1)', '년월', v_Period);

    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.RECP_TP,                          /*매출구분              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */
----            C.MAT_CD,                           /*상품번호              */
--            NVL(F.MATNR_S, C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.RECP_PAY,                         /*결제구분              */
--            A.RECP_AMT,                         /*수납금액              */
--            0                       FEE_AMT,    /*수수료                */
--            A.RECV_DAY,                         /*수납일자              */
--            A.RECV_SEQ,                         /*수납거래번호          */
--            A.RITM_SEQ,                         /*거래일련번호          */
--            D.RECP_NU,                          /*청구회차              */
--            A.SCHD_SEQ,                         /*청구순번              */
--            A.RECP_FG,                          /*수납유형              */
--            E.CHAN_CD,                          /*채널구분              */
--            DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
--                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT
--                                                /*판매인번호            */
--    FROM    RTRE0030 A, RTSD0100 B, RTSD0106 C, RTSD0109 D, RTSD0104 E, RTSD0115 F
--    WHERE   A.RECV_DAY BETWEEN  v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     A.ORD_NO   = C.ORD_NO
--    AND     A.ORD_NO   = D.ORD_NO(+)
--    AND     A.SCHD_SEQ = D.SCHD_SEQ(+)
--    AND     A.ORD_NO   = E.ORD_NO
--    AND     E.CHAN_CD  NOT IN ('09')  -- [20170316_01]
--    AND     A.ORD_NO      = F.ORD_NO(+)
--    AND     F.TRANS_TP(+) = 'N'
--    ;

        
        SELECT ZMONTH,     /*마감년월              */
            ORD_NO,                           /*계약번호              */
            RECP_TP,                          /*매출구분              */
            CUST_TP,                          /*고객구분(개인,사업자) */
            MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            RECP_PAY,                         /*결제구분              */
            RECP_AMT,                         /*수납금액              */
            FEE_AMT,    /*수수료                */
            RECV_DAY,                         /*수납일자              */
            RECV_SEQ,                         /*수납거래번호          */
            RITM_SEQ,                         /*거래일련번호          */
            RECP_NU,                          /*청구회차              */
            SCHD_SEQ,                         /*청구순번              */
            RECP_FG,                          /*수납유형              */
            CHAN_CD,                          /*채널구분              */
            ORD_AGENT
            FROM RTTEMP13
            WHERE NUM BETWEEN TO_NUMBER(v_Period) - 19999 AND TO_NUMBER(v_Period);
                
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendReceipt(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendReceipt;


  /*****************************************************************************
  -- 선수내역 정보 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendPreReceipt (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendPreReceipt(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */
----            C.MAT_CD,                           /*상품번호              */
--            NVL(TRIM(E.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.RECV_SEQ,                         /*수납거래번호          */
--            A.RITM_SEQ,                         /*거래일련번호          */
--            A.RECP_PAY,                         /*결제구분              */
--            A.PND_AMT - A.SBS_AMT   PREPAIDAMT, /*선수금잔액            */
--            A.PND_DAY,                          /*선수금 발생일자       */
--            D.CHAN_CD,                          /*채널구분              */
--            DECODE( D.CHAN_CD, '01', D.AGENCY_CD,
--                DECODE(D.CHAN_CD, '05', D.AGENCY_CD, D.ORD_AGENT)) ORD_AGENT
--                                                /*판매인번호            */
--    FROM    RTRE0037 A, RTSD0100 B, RTSD0106 C, RTSD0104 D, RTSD0115 E
--    WHERE   A.CLOSE_DAY = TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     A.ORD_NO   = C.ORD_NO
--    AND     A.ORD_NO   = D.ORD_NO
--    AND     A.ORD_NO   = E.ORD_NO(+)
--    AND     E.TRANS_TP(+) = 'N'
--    ;
    
    OPEN Ref_Cursor FOR
    SELECT  v_Period       AS ZMONTH        /*마감년월              */
         ,  A1.ORD_NO                       /*계약번호              */
         ,  A1.CUST_TP                      /*고객구분(개인,사업자) */
         ,  A1.MAT_CD                       /*상품번호              */
         ,  A1.RECV_SEQ                     /*수납거래번호          */
         ,  A1.RITM_SEQ                     /*거래일련번호          */
         ,  A1.RECP_PAY                     /*결제구분              */
         ,  A1.PREPAID_AMT AS PREPAIDAMT    /*선수금잔액            */
         ,  A1.PND_DAY                      /*선수금 발생일자       */
         ,  A1.CHAN_CD                      /*채널구분              */
         ,  A1.ORD_AGENT                    /*판매인번호            */
      FROM  RTRE5203 A1  
     WHERE  A1.ZMONTH = v_Period
    ;

    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendPreReceipt(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendPreReceipt;

  /*****************************************************************************
  -- 미납내역 정보 집계
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendDefault_Data (
    v_Period         IN CHAR,                         /*년월                  */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendDefault_Data(1)', '년월', v_Period);

    DELETE FROM RTTEMP14;
    
--    INSERT INTO RTTEMP14
--    SELECT  ROWNUM NUM,
--            ZMONTH,     /*마감년월              */
--            ORD_NO,                           /*계약번호              */
--            RECP_TP,                          /*매출구분              */
--            CUST_TP,                          /*고객구분(개인,사업자) */
--            MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            PAY_MTHD,                         /*결제구분              */
--            RECP_NU,                          /*청구회차              */
--            UNPAIDAMT,  /*미납금액              */
--            DEMD_DT,                          /*매출일자              */
--            ZFB_DAY,                          /*결제일자              */
--            SCHD_SEQ,                         /*청구순번              */
--            CHAN_CD,                          /*채널구분              */
--            ORD_AGENT                         /*판매인번호            */ 
--    FROM (
--        SELECT  v_Period                ZMONTH,     /*마감년월              */
--                A.ORD_NO,                           /*계약번호              */
--                A.RECP_TP,                          /*매출구분              */
--                B.CUST_TP,                          /*고객구분(개인,사업자) */
--    --            C.MAT_CD,                           /*상품번호              */
--                NVL(TRIM(E.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--                A.PAY_MTHD,                         /*결제구분              */
--                A.RECP_NU,                          /*청구회차              */
--                A.SALE_AMT              UNPAIDAMT,  /*미납금액              */
--                A.DEMD_DT,                          /*매출일자              */
--                A.ZFB_DAY,                          /*결제일자              */
--                A.SCHD_SEQ,                         /*청구순번              */
--                D.CHAN_CD,                          /*채널구분              */
--                DECODE( D.CHAN_CD, '01', D.AGENCY_CD,
--                    DECODE(D.CHAN_CD, '05', D.AGENCY_CD, D.ORD_AGENT)) ORD_AGENT
--                                                    /*판매인번호            */
--        FROM    RTSD0109 A, RTSD0100 B, RTSD0106 C, RTSD0104 D, RTSD0115 E
--        WHERE   A.DEMD_DT BETWEEN  v_Period||'01'
--                               AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--        AND     A.ZFB_DAY  > TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--        AND     A.SCD_STAT = 'S'
--        AND     A.CUST_NO  = B.CUST_NO
--        AND     A.ORD_NO   = C.ORD_NO
--        AND     A.ORD_NO   = D.ORD_NO 
--        AND     A.ORD_NO      = E.ORD_NO(+)
--        AND     E.TRANS_TP(+) = 'N' 
--        UNION
--        SELECT  v_Period                ZMONTH,     /*마감년월              */
--                A.ORD_NO,                           /*계약번호              */
--                A.RECP_TP,                          /*매출구분              */
--                B.CUST_TP,                          /*고객구분(개인,사업자) */
--    --            C.MAT_CD,                           /*상품번호              */
--                NVL(TRIM(F.MATNR_S), C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--                A.PAY_MTHD,                         /*결제구분              */
--                D.RECP_NU,                          /*청구회차              */
--                A.ARRE_AMT              UNPAIDAMT,  /*미납금액              */
--                D.DEMD_DT,                          /*매출일자              */
--                D.ZFB_DAY,                          /*결제일자              */
--                D.SCHD_SEQ,                         /*청구순번              */
--                E.CHAN_CD,                          /*채널구분              */
--                DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
--                    DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT
--                                                    /*판매인번호            */
--        FROM    RTRE0101 A, RTSD0100 B, RTSD0106 C, RTSD0109 D, RTSD0104 E, RTSD0115 F
--        WHERE   A.DELY_DAY = TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--        AND     A.CUST_NO  = B.CUST_NO
--        AND     A.ORD_NO   = C.ORD_NO
--        AND     A.ORD_NO   = D.ORD_NO
--        AND     A.SCHD_SEQ = D.SCHD_SEQ
--        AND     A.ORD_NO   = E.ORD_NO 
--        AND     A.ORD_NO      = F.ORD_NO(+)
--        AND     F.TRANS_TP(+) = 'N' 
--    )
--    ORDER BY ORD_NO
--    ;
    
    INSERT INTO RTTEMP14
    SELECT  ROWNUM AS NUM
         ,  A1.ZMONTH                           /*마감년월              */
         ,  A1.ORD_NO                           /*계약번호              */
         ,  A1.RECP_TP                          /*매출구분              */
         ,  A1.CUST_TP                          /*고객구분(개인,사업자) */
         ,  A1.MAT_CD                           /*상품번호              */
         ,  A1.PAY_MTHD                         /*결제구분              */
         ,  A1.RECP_NU                          /*청구회차              */
         ,  A1.UNPAID_AMT                       /*미납금액              */
         ,  A1.DEMD_DT                          /*매출일자              */
         ,  A1.ZFB_DAY                          /*결제일자              */
         ,  A1.SCHD_SEQ                         /*청구순번              */
         ,  A1.CHAN_CD                          /*채널구분              */
         ,  A1.ORD_AGENT                        /*판매인번호            */ 
      FROM  RTRE5204 A1  
     WHERE  A1.ZMONTH = v_Period
     ORDER  BY A1.ORD_NO
    ;
      
    SELECT COUNT(*) INTO v_TotCnt FROM RTTEMP14;
          
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendDefault_Data(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendDefault_Data;
  
  /*****************************************************************************
  -- 미납내역 정보 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendDefault (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendDefault(1)', '년월', v_Period);

    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.RECP_TP,                          /*매출구분              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */
----            C.MAT_CD,                           /*상품번호              */
--            NVL(E.MATNR_S, C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.PAY_MTHD,                         /*결제구분              */
--            A.RECP_NU,                          /*청구회차              */
--            A.SALE_AMT              UNPAIDAMT,  /*미납금액              */
--            A.DEMD_DT,                          /*매출일자              */
--            A.ZFB_DAY,                          /*결제일자              */
--            A.SCHD_SEQ,                         /*청구순번              */
--            D.CHAN_CD,                          /*채널구분              */
--            DECODE( D.CHAN_CD, '01', D.AGENCY_CD,
--                DECODE(D.CHAN_CD, '05', D.AGENCY_CD, D.ORD_AGENT)) ORD_AGENT
--                                                /*판매인번호            */
--    FROM    RTSD0109 A, RTSD0100 B, RTSD0106 C, RTSD0104 D, RTSD0115 E
--    WHERE   A.DEMD_DT BETWEEN  v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.ZFB_DAY  > TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.SCD_STAT = 'S'
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     A.ORD_NO   = C.ORD_NO
--    AND     A.ORD_NO   = D.ORD_NO 
--    AND     A.ORD_NO      = E.ORD_NO(+)
--    AND     E.TRANS_TP(+) = 'N' 
--    UNION
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.RECP_TP,                          /*매출구분              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */
----            C.MAT_CD,                           /*상품번호              */
--            NVL(F.MATNR_S, C.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.PAY_MTHD,                         /*결제구분              */
--            D.RECP_NU,                          /*청구회차              */
--            A.ARRE_AMT              UNPAIDAMT,  /*미납금액              */
--            D.DEMD_DT,                          /*매출일자              */
--            D.ZFB_DAY,                          /*결제일자              */
--            D.SCHD_SEQ,                         /*청구순번              */
--            E.CHAN_CD,                          /*채널구분              */
--            DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
--                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT
--                                                /*판매인번호            */
--    FROM    RTRE0101 A, RTSD0100 B, RTSD0106 C, RTSD0109 D, RTSD0104 E, RTSD0115 F
--    WHERE   A.DELY_DAY = TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.CUST_NO  = B.CUST_NO
--    AND     A.ORD_NO   = C.ORD_NO
--    AND     A.ORD_NO   = D.ORD_NO
--    AND     A.SCHD_SEQ = D.SCHD_SEQ
--    AND     A.ORD_NO   = E.ORD_NO 
--    AND     A.ORD_NO      = F.ORD_NO(+)
--    AND     F.TRANS_TP(+) = 'N' 
--    ;
    
    SELECT ZMONTH,     /*마감년월              */
            ORD_NO,                           /*계약번호              */
            RECP_TP,                          /*매출구분              */
            CUST_TP,                          /*고객구분(개인,사업자) */
            MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            PAY_MTHD,                         /*결제구분              */
            RECP_NU,                          /*청구회차              */
            UNPAIDAMT,  /*미납금액              */
            DEMD_DT,                          /*매출일자              */
            ZFB_DAY,                          /*결제일자              */
            SCHD_SEQ,                         /*청구순번              */
            CHAN_CD,                          /*채널구분              */
            ORD_AGENT
            FROM RTTEMP14
            WHERE NUM BETWEEN TO_NUMBER(v_Period) - 19999 AND TO_NUMBER(v_Period); --20000건씩 전송
            
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendDefault(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendDefault;


  /*****************************************************************************
  -- 등록비 이연처리내역 집계
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendRegiPostpone_Data (
    v_Period         IN CHAR,                         /*년월                  */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
     ) IS

    v_Postp_Tp          RTRE0120.POSTP_TP%TYPE  DEFAULT  NULL;

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendRegiPostpone_Data(1)', '년월', v_Period);

    v_Postp_Tp := '01';

    DELETE FROM RTTEMP11;
    
--    INSERT INTO RTTEMP11
--    SELECT  ROWNUM NUM,
--            v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */
----            B.MAT_CD,                           /*상품번호              */
--            NVL(TRIM(D.MATNR_S), B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            B.PPTRM,                            /*이연기간              */
--            C.PROC_DAY,                         /*장착일자              */
--            B.ACQ_AMT               COGS,       /*제품원가              */
--            A.CM_PP_AMT             CM_AMT,     /*당월 감가상각액       */
--            A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
--            B.CHAN_CD,                          /*채널구분              */
--            B.AGENCY_CD             ORD_AGENT   /*판매인번호            */
--    FROM    RTRE0125 A, RTRE0120 B, RTSD0108 C, RTSD0115 D
--    WHERE   A.POSTP_YM    = v_Period
--    AND     A.POSTP_TP    = v_Postp_Tp
--    AND     A.POSTP_STAT <> 'Z'
--    AND     A.ORD_NO      = B.ORD_NO
--    AND     A.POSTP_TP    = B.POSTP_TP
--    AND     A.ORD_NO      = C.ORD_NO
--    AND     A.ORD_NO      = D.ORD_NO(+)
--    AND     D.TRANS_TP(+) = 'N'
--    ;
    
    INSERT INTO RTTEMP11
    SELECT  ROWNUM      AS NUM
         ,  v_Period    AS ZMONTH               /*마감년월              */
         ,  A1.ORD_NO                           /*계약번호              */
         ,  A1.CUST_TP                          /*고객구분(개인,사업자) */
         ,  A1.MAT_CD                           /*상품번호              */
         ,  A1.PPTRM                            /*이연기간              */
         ,  A1.PROC_DAY                         /*장착일자              */
         ,  A1.COGS                             /*제품원가              */
         ,  A1.CM_AMT                           /*당월 감가상각액       */
         ,  A1.CM_R_AMT                         /*당월 잔존가액         */
         ,  A1.CHAN_CD                          /*채널구분              */
         ,  A1.ORD_AGENT                        /*판매인번호            */
      FROM  RTRE5205 A1  
     WHERE  A1.ZMONTH = v_Period
    ;

    SELECT COUNT(*) INTO v_TotCnt FROM RTTEMP11;
    
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendRegiPostpone_Data(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendRegiPostpone_Data;
  
  /*****************************************************************************
  -- 등록비 이연처리내역  SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendRegiPostpone (
    v_Period         IN CHAR,                         /*년월                  */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

    v_Postp_Tp          RTRE0120.POSTP_TP%TYPE  DEFAULT  NULL;

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendRegiPostpone(1)', '년월', v_Period);

    v_Postp_Tp := '01';

    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */
----            B.MAT_CD,                           /*상품번호              */
--            NVL(D.MATNR_S, B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            B.PPTRM,                            /*이연기간              */
--            C.PROC_DAY,                         /*장착일자              */
--            B.ACQ_AMT               COGS,       /*제품원가              */
--            A.CM_PP_AMT             CM_AMT,     /*당월 감가상각액       */
--            A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
--            B.CHAN_CD,                          /*채널구분              */
--            B.AGENCY_CD             ORD_AGENT   /*판매인번호            */
--    FROM    RTRE0125 A, RTRE0120 B, RTSD0108 C, RTSD0115 D
--    WHERE   A.POSTP_YM    = v_Period
--    AND     A.POSTP_TP    = v_Postp_Tp
--    AND     A.POSTP_STAT <> 'Z'
--    AND     A.ORD_NO      = B.ORD_NO
--    AND     A.POSTP_TP    = B.POSTP_TP
--    AND     A.ORD_NO      = C.ORD_NO
--    AND     A.ORD_NO      = D.ORD_NO(+)
--    AND     D.TRANS_TP(+) = 'N'
--    ;

    SELECT  ZMONTH,     /*마감년월              */
            ORD_NO,                           /*계약번호              */
            CUST_TP,                          /*고객구분(개인,사업자) */
            MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            PPTRM,                            /*이연기간              */
            PROC_DAY,                         /*장착일자              */
            COGS,       /*제품원가              */
            CM_AMT,     /*당월 감가상각액       */
            CM_R_AMT,   /*당월 잔존가액         */
            CHAN_CD,                          /*채널구분              */
            ORD_AGENT
            FROM RTTEMP11
            WHERE NUM BETWEEN TO_NUMBER(v_Period) - 19999 AND TO_NUMBER(v_Period); --20000건씩 전송


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendRegiPostpone(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendRegiPostpone;

  
  /*****************************************************************************
  -- 감가상각 이연처리내역 SELECT INTERFACE(EAI)]
  -- 변경이력:
  VER 1.1 2016-04-02 이영근 PP_STAT 'C','E' NOT IN 조건 추가
  ver 1.2 2016-08-02 이영근, 장착당월 서비스 처리분에 한해 장착수량->원수량으로 변경
  *****************************************************************************/
  PROCEDURE p_ErpSendDeprePostpone_Data (
    v_Period         IN CHAR,                           /*년월                */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,         /*이연항목            */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendDeprePostpone_Data(1)', '년월', v_Period);
/*20160318 아래로 변경
    OPEN Ref_Cursor FOR
    SELECT  v_Period                ZMONTH,    
            A.ORD_NO,                           
            A.POSTP_STAT,                      
            B.CUST_TP,                        
            B.MAT_CD,                           
            B.ORD_QTY               RQTY,     
            B.ACQ_AMT               COGS,       
            A.LY_TPP_AMT            LY_TOT_AMT,
            A.CY_PP_AMT             CY_AMT,     
            A.CY_TPP_AMT            CY_TOT_AMT, 
            A.CM_PP_AMT             CM_AMT,     
            A.CM_R_AMT              CM_R_AMT,   
            B.CHAN_CD,                         
            B.AGENCY_CD             ORD_AGENT   
    FROM    RTRE0125 A,
            RTRE0120 B
    WHERE   A.POSTP_YM    = v_Period
    AND     A.POSTP_TP    = v_Postp_Tp
    AND     A.POSTP_STAT <> 'Z'
    AND     A.POSTP_TP    = B.POSTP_TP
    AND     A.ORD_NO      = B.ORD_NO
    ;
    */

    DELETE FROM RTTEMP10;
    
--    INSERT INTO RTTEMP10
--    SELECT  ROWNUM NUM,
--            ZMONTH,     /*마감년월              */
--            ORD_NO,                           /*계약번호              */
--            POSTP_STAT,                       /*이연구분              */
--            CUST_TP,                          /*고객구분(개인,사업자) */
--            MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            RQTY,            
--            COGS,       /*제품원가              */
--            LY_TOT_AMT, /*전기말 감가상각 누계액*/
--            CY_AMT,     /*당기 상각비           */
--            CY_TOT_AMT, /*당기 감가상각 누계액  */
--            CM_AMT,     /*당월 감가상각액       */
--            CM_R_AMT,   /*당월 잔존가액         */
--            CHAN_CD,                          /*채널구분              */
--            ORD_AGENT,   /*판매인번호            */
--            v_Postp_Tp POSTP_TP
--    FROM (
--        SELECT  v_Period                ZMONTH,     /*마감년월              */
--                A.ORD_NO,                           /*계약번호              */
--                A.POSTP_STAT,                       /*이연구분              */
--                B.CUST_TP,                          /*고객구분(개인,사업자) */
--    --            B.MAT_CD,                           /*상품번호              */
--                NVL(TRIM(C.MATNR_S), B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--                --B.ORD_QTY               RQTY,       /*장착건수              */
--                CASE WHEN A.POSTP_TP = '03' AND B.ORD_QTY_NOW IS NOT NULL AND A.POSTP_YM = B.PSTR_YM
--                     THEN (SELECT C.ORD_QTY FROM RTRE0120 C WHERE C.ORD_NO = B.ORD_NO AND C.POSTP_TP = B.POSTP_TP AND C.PP_STAT = 'Z')
--                     ELSE B.ORD_QTY
--                END AS RQTY,            
--                B.ACQ_AMT               COGS,       /*제품원가              */
--                A.LY_TPP_AMT            LY_TOT_AMT, /*전기말 감가상각 누계액*/
--                A.CY_PP_AMT             CY_AMT,     /*당기 상각비           */
--                A.CY_TPP_AMT            CY_TOT_AMT, /*당기 감가상각 누계액  */
--                A.CM_PP_AMT             CM_AMT,     /*당월 감가상각액       */
--                A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
--                B.CHAN_CD,                          /*채널구분              */
--                B.AGENCY_CD             ORD_AGENT   /*판매인번호            */
--        FROM    RTRE0125 A,
--                RTRE0120 B,
--                RTSD0115 C
--        WHERE   A.POSTP_YM    = v_Period
--        AND     A.POSTP_TP    = v_Postp_Tp
--        AND     A.POSTP_STAT NOT IN ( 'Z','S')
--        AND     B.PP_STAT NOT IN ('Q','SS','Z','S','ZZ')    --A만추출
--        AND     A.POSTP_TP    = B.POSTP_TP
--        AND     A.ORD_NO      = B.ORD_NO
--        AND     A.ORD_NO      = C.ORD_NO(+)
--        AND     C.TRANS_TP(+) = 'N'
--        UNION ALL
--        SELECT  v_Period                ZMONTH,     /*마감년월              */
--                A.ORD_NO,                           /*계약번호              */
--                A.POSTP_STAT,                       /*이연구분              */
--                B.CUST_TP,                          /*고객구분(개인,사업자) */
--    --            B.MAT_CD,                           /*상품번호              */
--                NVL(TRIM(C.MATNR_S), B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--                --B.ORD_QTY               RQTY,       /*장착건수              */
--                CASE WHEN A.POSTP_TP = '03' AND B.ORD_QTY_NOW IS NOT NULL AND A.POSTP_YM = B.PSTR_YM
--                     THEN (SELECT C.ORD_QTY FROM RTRE0120 C WHERE C.ORD_NO = B.ORD_NO AND C.POSTP_TP = B.POSTP_TP AND C.PP_STAT = 'Z')
--                     ELSE B.ORD_QTY
--                END AS RQTY,
--                B.ACQ_AMT               COGS,       /*제품원가              */
--                A.LY_TPP_AMT            LY_TOT_AMT, /*전기말 감가상각 누계액*/
--                A.CY_PP_AMT             CY_AMT,     /*당기 상각비           */
--                A.CY_TPP_AMT            CY_TOT_AMT, /*당기 감가상각 누계액  */
--                A.CM_PP_AMT             CM_AMT,     /*당월 감가상각액       */
--                A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
--                B.CHAN_CD,                          /*채널구분              */
--                B.AGENCY_CD             ORD_AGENT   /*판매인번호            */
--        FROM    RTRE0125 A,
--                RTRE0120 B,
--                RTSD0115 C
--        WHERE   A.POSTP_YM    = v_Period
--        AND     A.POSTP_TP    = v_Postp_Tp
--        AND     A.POSTP_STAT <> 'Z'
--        AND     B.PP_STAT  NOT IN ('A','Z','SS','C','E')    --S Q추출, 2016-04-02 이영근 ADD
--        AND     A.POSTP_STAT = B.PP_STAT
--        AND     A.POSTP_TP    = B.POSTP_TP
--        AND     A.ORD_NO      = B.ORD_NO
--        AND     A.ORD_NO      = C.ORD_NO(+)
--        AND     C.TRANS_TP(+) = 'N')
--    ORDER BY ORD_NO; 

    INSERT INTO RTTEMP10
    SELECT  ROWNUM NUM,
            ZMONTH,     /*마감년월              */
            ORD_NO,                           /*계약번호              */
            POSTP_STAT,                       /*이연구분              */
            CUST_TP,                          /*고객구분(개인,사업자) */
            MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            RQTY,            
            COGS,       /*제품원가              */
            LY_TOT_AMT, /*전기말 감가상각 누계액*/
            CY_AMT,     /*당기 상각비           */
            CY_TOT_AMT, /*당기 감가상각 누계액  */
            CM_AMT,     /*당월 감가상각액       */
            CM_R_AMT,   /*당월 잔존가액         */
            CHAN_CD,                          /*채널구분              */
            ORD_AGENT,   /*판매인번호            */
            v_Postp_Tp POSTP_TP,
            PROC_YM,
            PPTRM,
            TM_CANC_YN
     FROM RTRE5206
    WHERE ZMONTH   = v_Period
      AND POSTP_TP = v_Postp_Tp
    ORDER BY ORD_NO; 

    SELECT COUNT(*) INTO v_TotCnt FROM RTTEMP10;
    
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendDeprePostpone_Data(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendDeprePostpone_Data;
  
  /*****************************************************************************
  -- 감가상각 이연처리내역 SELECT INTERFACE(EAI)]
  -- 변경이력:
  VER 1.1 2016-04-02 이영근 PP_STAT 'C','E' NOT IN 조건 추가
  ver 1.2 2016-08-02 이영근, 장착당월 서비스 처리분에 한해 장착수량->원수량으로 변경
  *****************************************************************************/
  PROCEDURE p_ErpSendDeprePostpone (
    v_Period         IN CHAR,                           /*년월                */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,         /*이연항목            */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendDeprePostpone(1)', '년월', v_Period);
/*20160318 아래로 변경
    OPEN Ref_Cursor FOR
    SELECT  v_Period                ZMONTH,    
            A.ORD_NO,                           
            A.POSTP_STAT,                      
            B.CUST_TP,                        
            B.MAT_CD,                           
            B.ORD_QTY               RQTY,     
            B.ACQ_AMT               COGS,       
            A.LY_TPP_AMT            LY_TOT_AMT,
            A.CY_PP_AMT             CY_AMT,     
            A.CY_TPP_AMT            CY_TOT_AMT, 
            A.CM_PP_AMT             CM_AMT,     
            A.CM_R_AMT              CM_R_AMT,   
            B.CHAN_CD,                         
            B.AGENCY_CD             ORD_AGENT   
    FROM    RTRE0125 A,
            RTRE0120 B
    WHERE   A.POSTP_YM    = v_Period
    AND     A.POSTP_TP    = v_Postp_Tp
    AND     A.POSTP_STAT <> 'Z'
    AND     A.POSTP_TP    = B.POSTP_TP
    AND     A.ORD_NO      = B.ORD_NO
    ;
    */

    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.POSTP_STAT,                       /*이연구분              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */
----            B.MAT_CD,                           /*상품번호              */
--            NVL(C.MATNR_S, B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            --B.ORD_QTY               RQTY,       /*장착건수              */
--            CASE WHEN A.POSTP_TP = '03' AND B.ORD_QTY_NOW IS NOT NULL AND A.POSTP_YM = B.PSTR_YM
--                 THEN (SELECT C.ORD_QTY FROM RTRE0120 C WHERE C.ORD_NO = B.ORD_NO AND C.POSTP_TP = B.POSTP_TP AND C.PP_STAT = 'Z')
--                 ELSE B.ORD_QTY
--            END AS RQTY,            
--            B.ACQ_AMT               COGS,       /*제품원가              */
--            A.LY_TPP_AMT            LY_TOT_AMT, /*전기말 감가상각 누계액*/
--            A.CY_PP_AMT             CY_AMT,     /*당기 상각비           */
--            A.CY_TPP_AMT            CY_TOT_AMT, /*당기 감가상각 누계액  */
--            A.CM_PP_AMT             CM_AMT,     /*당월 감가상각액       */
--            A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
--            B.CHAN_CD,                          /*채널구분              */
--            B.AGENCY_CD             ORD_AGENT   /*판매인번호            */
--    FROM    RTRE0125 A,
--            RTRE0120 B,
--            RTSD0115 C
--    WHERE   A.POSTP_YM    = v_Period
--    AND     A.POSTP_TP    = v_Postp_Tp
--    AND     A.POSTP_STAT NOT IN ( 'Z','S')
--    AND     B.PP_STAT NOT IN ('Q','SS','Z','S','ZZ')    --A만추출
--    AND     A.POSTP_TP    = B.POSTP_TP
--    AND     A.ORD_NO      = B.ORD_NO
--    AND     A.ORD_NO      = C.ORD_NO(+)
--    AND     C.TRANS_TP(+) = 'N'
--    UNION ALL
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.POSTP_STAT,                       /*이연구분              */
--            B.CUST_TP,                          /*고객구분(개인,사업자) */
----            B.MAT_CD,                           /*상품번호              */
--            NVL(C.MATNR_S, B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            --B.ORD_QTY               RQTY,       /*장착건수              */
--            CASE WHEN A.POSTP_TP = '03' AND B.ORD_QTY_NOW IS NOT NULL AND A.POSTP_YM = B.PSTR_YM
--                 THEN (SELECT C.ORD_QTY FROM RTRE0120 C WHERE C.ORD_NO = B.ORD_NO AND C.POSTP_TP = B.POSTP_TP AND C.PP_STAT = 'Z')
--                 ELSE B.ORD_QTY
--            END AS RQTY,
--            B.ACQ_AMT               COGS,       /*제품원가              */
--            A.LY_TPP_AMT            LY_TOT_AMT, /*전기말 감가상각 누계액*/
--            A.CY_PP_AMT             CY_AMT,     /*당기 상각비           */
--            A.CY_TPP_AMT            CY_TOT_AMT, /*당기 감가상각 누계액  */
--            A.CM_PP_AMT             CM_AMT,     /*당월 감가상각액       */
--            A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
--            B.CHAN_CD,                          /*채널구분              */
--            B.AGENCY_CD             ORD_AGENT   /*판매인번호            */
--    FROM    RTRE0125 A,
--            RTRE0120 B,
--            RTSD0115 C
--    WHERE   A.POSTP_YM    = v_Period
--    AND     A.POSTP_TP    = v_Postp_Tp
--    AND     A.POSTP_STAT <> 'Z'
--    AND     B.PP_STAT  NOT IN ('A','Z','SS','C','E')    --S Q추출, 2016-04-02 이영근 ADD
--    AND     A.POSTP_STAT = B.PP_STAT
--    AND     A.POSTP_TP    = B.POSTP_TP
--    AND     A.ORD_NO      = B.ORD_NO
--    AND     A.ORD_NO      = C.ORD_NO(+)
--    AND     C.TRANS_TP(+) = 'N';

       SELECT PERIOD ZMONTH, 
              ORD_NO, 
              POSTP_STAT, 
              CUST_TP, 
              MAT_CD, 
              RQTY, 
              COGS, 
              LY_TOT_AMT, 
              CY_AMT, 
              CY_TOT_AMT, 
              CM_AMT, 
              CM_R_AMT, 
              CHAN_CD, 
              ORD_AGENT,
              PROC_YM,
              PPTRM,
              TM_CANC_YN
              FROM RTTEMP10
              WHERE NUM BETWEEN TO_NUMBER(v_Period) - 19999 AND TO_NUMBER(v_Period) --20000건씩 전송
                    AND POSTP_TP    = v_Postp_Tp;    


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendDeprePostpone(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendDeprePostpone;


  /*****************************************************************************
  -- 현금영수증 발행내역 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendCashReceipt (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendCashReceipt(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    WITH TMRE0091 AS (
--        SELECT  A.RECV_SEQ, A.CASH_SEQ, A.CASH_DAY, A.FILE_SEQ,
--                A.RECV_DAY, A.RECV_TIME, A.CUST_NO, A.CUST_NM,
--                A.CASHD_TP, A.CASHD_FG, A.CHI_NO, A.CASH_AMT,
--                A.CASH_NAMT, A.CASH_VAMT, A.CASH_STAT, A.CASHAPP_NO,
--                A.OCAPP_NO, A.OCASH_DAY, A.CNC_YN
--        FROM    RTRE0091 A
--        WHERE   A.CASH_DAY BETWEEN v_Period||'01'
--                               AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--     --   AND     A.CASH_STAT = '5'
--        AND     ( A.CASH_STAT = '5' OR A.CASH_STAT = '8' )
--        )
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            B.ORD_NO,                           /*계약번호              */
--            C.CUST_TP,                          /*고객구분              */
----            D.MAT_CD,                           /*상품번호              */
--            NVL(TRIM(G.MATNR_S), D.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            E.CHAN_CD,                          /*채널구분              */
--            DECODE(E.CHAN_CD, '01', E.AGENCY_CD,
--                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT,
--                                                /*판매인번호            */
--            A.RECV_SEQ,                         /*수납거래번호          */
--            A.CASH_SEQ,                         /*현금영수증 발행 일련번호  */
--            A.CASH_DAY,                         /*현금영수증발행일자    */
--            A.FILE_SEQ,                         /*파일순번              */
--            A.RECV_DAY,                         /*수납일자              */
--            A.RECV_TIME,                        /*수납시간              */
--            A.CUST_NO,                          /*고객번호              */
--            A.CUST_NM,                          /*고객명                */
--            A.CASHD_TP,                         /*거래구분              */
--            A.CASHD_FG,                         /*발행대상구분          */
--            A.CHI_NO,                           /*현금영수증 식별번호   */
--            A.CASH_AMT,                         /*현금영수증 발행금액   */
--            A.CASH_NAMT,                        /*현금영수증 발행 공급가액  */
--            A.CASH_VAMT,                        /*현금영수증 발행 부가세    */
--            A.CASH_STAT,                        /*현금영수증 발행상태   */
--            A.CASHAPP_NO,                       /*현금영수증 승인번호   */
--            A.OCAPP_NO,                         /*원승인번호            */
--            A.OCASH_DAY,                        /*원승인일자            */
--            A.CNC_YN,                           /*취소여부              */
--            F.REGI_AMT,                         /*등록비                */
--            F.RENT_AMT,                         /*렌탈료                */
--            F.RTAR_AMT,                         /*렌탈연체료            */
--            F.CANC_AMT,                         /*취소수수료            */
--            F.PNTY_AMT,                         /*위약금                */
--            F.PPAY_AMT,                         /*선수금                */
--            F.ETC_AMT                           /*기타                  */
--    FROM    TMRE0091 A,
--            RTRE0030 B,
--            RTSD0100 C,
--            RTSD0106 D,
--            RTSD0104 E,
--            (
--            SELECT  F.RECV_SEQ,
--                    SUM(DECODE(F.RECP_TP, '01', F.RECP_AMT,0)) REGI_AMT,       /*등록비     */
--                    SUM(DECODE(F.RECP_TP, '11', F.RECP_AMT,0)) RENT_AMT,       /*렌탈료     */
--                    SUM(DECODE(F.RECP_TP, '12', F.RECP_AMT,0)) RTAR_AMT,       /*렌탈연체료 */
--                    SUM(DECODE(F.RECP_TP, '41', F.RECP_AMT,0)) CANC_AMT,       /*취소수수료 */
--                    SUM(DECODE(F.RECP_TP, '42', F.RECP_AMT,0)) PNTY_AMT,       /*위약금     */
--                    SUM(DECODE(F.RECP_TP, '90', F.RECP_AMT,0)) PPAY_AMT,       /*선수금     */
--                    SUM(DECODE(F.RECP_TP, '01',0,'11',0,'12',0,'41',0,'42',0,'90',0,F.RECP_AMT,0)) ETC_AMT /*기타       */
--            FROM    RTRE0030 F,
--                    TMRE0091 A
--            WHERE   F.RECV_SEQ = A.RECV_SEQ
--            GROUP   BY F.RECV_SEQ
--            ) F
--        ,   RTSD0115 G
--    WHERE   A.RECV_SEQ  = B.RECV_SEQ
--    AND     B.ROWID     = ( SELECT Z.ROWID FROM RTRE0030 Z WHERE Z.RECV_SEQ = B.RECV_SEQ AND ROWNUM <= 1 )
--    AND     A.CUST_NO   = C.CUST_NO
--    AND     B.ORD_NO    = D.ORD_NO
--    AND     B.ORD_NO    = E.ORD_NO
--    AND     A.RECV_SEQ  = F.RECV_SEQ(+)
--    AND     B.ORD_NO    = G.ORD_NO(+)
--    AND     G.TRANS_TP(+) = 'N';

    OPEN Ref_Cursor FOR
    SELECT  v_Period AS ZMONTH                  /*마감년월              */
         ,  A1.ORD_NO                           /*계약번호              */
         ,  A1.CUST_TP                          /*고객구분              */
         ,  A1.MAT_CD                           /*상품번호              */ 
         ,  A1.CHAN_CD                          /*채널구분              */
         ,  A1.ORD_AGENT                        /*판매인번호            */
         ,  A1.RECV_SEQ                         /*수납거래번호          */
         ,  A1.CASH_SEQ                         /*현금영수증 발행 일련번호  */
         ,  A1.CASH_DAY                         /*현금영수증발행일자    */
         ,  A1.FILE_SEQ                         /*파일순번              */
         ,  A1.RECV_DAY                         /*수납일자              */
         ,  A1.RECV_TIME                        /*수납시간              */
         ,  A1.CUST_NO                          /*고객번호              */
         ,  A1.CUST_NM                          /*고객명                */
         ,  A1.CASHD_TP                         /*거래구분              */
         ,  A1.CASHD_FG                         /*발행대상구분          */
         ,  A1.CHI_NO                           /*현금영수증 식별번호   */
         ,  A1.CASH_AMT                         /*현금영수증 발행금액   */
         ,  A1.CASH_NAMT                        /*현금영수증 발행 공급가액  */
         ,  A1.CASH_VAMT                        /*현금영수증 발행 부가세    */
         ,  A1.CASH_STAT                        /*현금영수증 발행상태   */
         ,  A1.CASHAPP_NO                       /*현금영수증 승인번호   */
         ,  A1.OCAPP_NO                         /*원승인번호            */
         ,  A1.OCASH_DAY                        /*원승인일자            */
         ,  A1.CNC_YN                           /*취소여부              */
         ,  A1.REGI_AMT                         /*등록비                */
         ,  A1.RENT_AMT                         /*렌탈료                */
         ,  A1.RTAR_AMT                         /*렌탈연체료            */
         ,  A1.CANC_AMT                         /*취소수수료            */
         ,  A1.PNTY_AMT                         /*위약금                */
         ,  A1.PPAY_AMT                         /*선수금                */
         ,  A1.ETC_AMT                          /*기타                  */
      FROM  RTRE5207 A1
     WHERE  A1.ZMONTH = v_Period
    ;

    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendCashReceipt(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendCashReceipt;


  /*****************************************************************************
  -- 카드(PG) 결제 내역 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendCardPayment (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendCardPayment(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.RECV_SEQ,                         /*수납거래번호          */
--            A.RECV_DAY,                         /*수납일자              */
--            A.ORD_NO,                           /*계약번호              */
--            A.CUST_NO,                          /*고객번호              */
--            C.CUST_TP,                          /*고객구분              */
----            D.MAT_CD,                           /*상품번호              */
--            NVL(TRIM(F.MATNR_S), D.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            E.CHAN_CD,                          /*채널구분              */
--            DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
--                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT,
--                                                /*판매인번호            */
--            A.RECP_AMT,                         /*수납금액              */
--            A.RECP_TP,                          /*청구구분              */
--            A.RECP_PAY,                         /*수납방법              */
--            A.RECP_FG,                          /*수납유형              */
--            A.TNO,                              /*PG거래번호            */
--            B.CRD_NO                CARD_NO,    /*카드번호              */
--            A.CNC_RSEQ,                         /*수납취소거래번호      */
--            A.CNC_STAT                          /*수납취소여부          */
--    FROM    RTRE0041 A, RTRE0042 B, RTSD0100 C, RTSD0106 D, RTSD0104 E, RTSD0115 F
--    WHERE   A.RECV_DAY BETWEEN  v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.RECP_PAY = 'P1'
--    AND     A.TNO      = B.TNO
--    AND     A.CUST_NO  = C.CUST_NO
--    AND     A.ORD_NO   = D.ORD_NO
--    AND     A.ORD_NO   = E.ORD_NO
--    AND     A.ORD_NO   = F.ORD_NO(+)
--    AND     F.TRANS_TP(+) = 'N'
--    ;
    
    OPEN Ref_Cursor FOR
    SELECT  v_Period    AS ZMONTH               /*마감년월              */
         ,  A1.RECV_SEQ                         /*수납거래번호          */
         ,  A1.RECV_DAY                         /*수납일자              */
         ,  A1.ORD_NO                           /*계약번호              */
         ,  A1.CUST_NO                          /*고객번호              */
         ,  A1.CUST_TP                          /*고객구분              */
         ,  A1.MAT_CD                           /*상품번호              */ 
         ,  A1.CHAN_CD                          /*채널구분              */
         ,  A1.ORD_AGENT                        /*판매인번호            */
         ,  A1.RECP_AMT                         /*수납금액              */
         ,  A1.RECP_TP                          /*청구구분              */
         ,  A1.RECP_PAY                         /*수납방법              */
         ,  A1.RECP_FG                          /*수납유형              */
         ,  A1.TNO                              /*PG거래번호            */
         ,  A1.CARD_NO                          /*카드번호              */
         ,  A1.CNC_RSEQ                         /*수납취소거래번호      */
         ,  A1.CNC_STAT                         /*수납취소여부          */
      FROM  RTRE5208 A1
     WHERE  A1.ZMONTH = v_Period
    ; 


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendCardPayment(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendCardPayment;

  /*****************************************************************************
  -- 카드이체 내역 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendCardTransfer_Data (
    v_Period         IN CHAR,                           /*년월                */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendCardTransfer_Data(1)', '년월', v_Period);


    DELETE FROM RTTEMP09;
    
--    INSERT INTO RTTEMP09
--    SELECT  ROWNUM NUM,
--            v_Period                ZMONTH,     /*마감년월              */
--            A.RCRD_DAY,                         /*카드이체일자          */
--            A.RCRD_SEQ,                         /*카드이체일련번호      */
--            A.ORD_NO,                           /*계약번호              */
--            A.CUST_NO,                          /*고객번호              */
--            C.CUST_TP ,                         /*고객구분              */
--            D.MAT_CD,                           /*상품번호              */
--            E.CHAN_CD,                          /*채널구분              */
--            DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
--                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT,
--                                                /*판매인번호            */
--            A.CRD_SEQ,                          /*카드순번              */
--            A.RCRD_AMT,                         /*카드이체요청금액      */
--            A.RQST_STAT,                        /*이체상태              */
--            A.CARDCOM_CD,                       /*카드사코드            */
--            B.CARD_NO,                          /*카드번호              */
--            A.BATCH_KEY,                        /*BATCH KEY             */
--            A.CRERCD,                           /*카드이체 오류코드     */
--            A.RECP_AMT,                         /*수납금액              */
--            A.RECV_SEQ                          /*수납거래번호          */
--    FROM    RTRE0080 A, RTRE0020 B, RTSD0100 C, RTCS0001 D, RTSD0108 E
--    WHERE   A.RCRD_DAY BETWEEN  v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.CRD_SEQ = B.CRD_SEQ
--    AND     A.CUST_NO = C.CUST_NO
--    AND     A.ORD_NO  = D.ORD_NO
--    AND     A.ORD_NO  = E.ORD_NO
--    AND     A.ORD_NO NOT IN (SELECT COL_01 FROM RTTEMPIWJ_190429_01)
--    ;
    
    INSERT INTO RTTEMP09
    SELECT  ROWNUM    AS NUM
         ,  v_Period  AS ZMONTH                 /*마감년월              */
         ,  A1.RCRD_DAY                         /*카드이체일자          */
         ,  A1.RCRD_SEQ                         /*카드이체일련번호      */
         ,  A1.ORD_NO                           /*계약번호              */
         ,  A1.CUST_NO                          /*고객번호              */
         ,  A1.CUST_TP                          /*고객구분              */
         ,  A1.MAT_CD                           /*상품번호              */
         ,  A1.CHAN_CD                          /*채널구분              */
         ,  A1.ORD_AGENT                        /*판매인번호            */
         ,  A1.CRD_SEQ                          /*카드순번              */
         ,  A1.RCRD_AMT                         /*카드이체요청금액      */
         ,  A1.RQST_STAT                        /*이체상태              */
         ,  A1.CARDCOM_CD                       /*카드사코드            */
         ,  A1.CARD_NO                          /*카드번호              */
         ,  A1.BATCH_KEY                        /*BATCH KEY             */
         ,  A1.CRERCD                           /*카드이체 오류코드     */
         ,  A1.RECP_AMT                         /*수납금액              */
         ,  A1.RECV_SEQ                         /*수납거래번호          */
      FROM  RTRE5209 A1
     WHERE  A1.ZMONTH = v_Period
    ;

    SELECT COUNT(*) INTO v_TotCnt FROM RTTEMP09;
    
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendCardTransfer_Data(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendCardTransfer_Data;
  
  /*****************************************************************************
  -- 카드이체 내역 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendCardTransfer (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendCardTransfer(1)', '년월', v_Period);


--    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.RCRD_DAY,                         /*카드이체일자          */
--            A.RCRD_SEQ,                         /*카드이체일련번호      */
--            A.ORD_NO,                           /*계약번호              */
--            A.CUST_NO,                          /*고객번호              */
--            C.CUST_TP ,                         /*고객구분              */
--            D.MAT_CD,                           /*상품번호              */
--            E.CHAN_CD,                          /*채널구분              */
--            DECODE( E.CHAN_CD, '01', E.AGENCY_CD,
--                DECODE(E.CHAN_CD, '05', E.AGENCY_CD, E.ORD_AGENT)) ORD_AGENT,
--                                                /*판매인번호            */
--            A.CRD_SEQ,                          /*카드순번              */
--            A.RCRD_AMT,                         /*카드이체요청금액      */
--            A.RQST_STAT,                        /*이체상태              */
--            A.CARDCOM_CD,                       /*카드사코드            */
--            B.CARD_NO,                          /*카드번호              */
--            A.BATCH_KEY,                        /*BATCH KEY             */
--            A.CRERCD,                           /*카드이체 오류코드     */
--            A.RECP_AMT,                         /*수납금액              */
--            A.RECV_SEQ                          /*수납거래번호          */
--    FROM    RTRE0080 A, RTRE0020 B, RTSD0100 C, RTCS0001 D, RTSD0108 E
--    WHERE   A.RCRD_DAY BETWEEN  v_Period||'01'
--                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    AND     A.CRD_SEQ = B.CRD_SEQ
--    AND     A.CUST_NO = C.CUST_NO
--    AND     A.ORD_NO  = D.ORD_NO
--    AND     A.ORD_NO  = E.ORD_NO
--    ;

    OPEN Ref_Cursor FOR
    SELECT  A.ZMONTH,                           /*마감년월              */
            A.RCRD_DAY,                         /*카드이체일자          */
            A.RCRD_SEQ,                         /*카드이체일련번호      */
            A.ORD_NO,                           /*계약번호              */
            A.CUST_NO,                          /*고객번호              */
            A.CUST_TP ,                         /*고객구분              */
--            MAT_CD,                           /*상품번호              */
            NVL(TRIM(B.MATNR_S), A.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            A.CHAN_CD,                          /*채널구분              */
            A.ORD_AGENT,                        /*판매인번호            */
            A.CRD_SEQ,                          /*카드순번              */
            A.RCRD_AMT,                         /*카드이체요청금액      */
            A.RQST_STAT,                        /*이체상태              */
            A.CARDCOM_CD,                       /*카드사코드            */
            A.CARD_NO,                          /*카드번호              */
            A.BATCH_KEY,                        /*BATCH KEY             */
            A.CRERCD,                           /*카드이체 오류코드     */
            A.RECP_AMT,                         /*수납금액              */
            A.RECV_SEQ                          /*수납거래번호          */
    FROM    RTTEMP09 A
       ,    RTSD0115 B
    WHERE   A.NUM BETWEEN TO_NUMBER(v_Period) - 19999 AND TO_NUMBER(v_Period) --20000건씩 전송
      AND   A.ORD_NO      = B.ORD_NO(+)
      AND   B.TRANS_TP(+) = 'N'
    ;


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendCardTransfer(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendCardTransfer;

  /*****************************************************************************
  -- 수수료 이연처리 내역 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendCommPostpone_Data (
    v_Period         IN CHAR,                           /*년월                */
    v_TotCnt         OUT NUMERIC                       /*데이터건수            */
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendCommPostpone_Data(1)', '년월', v_Period);

    DELETE FROM RTTEMP15;
    
--    INSERT INTO RTTEMP15
--    SELECT  ROWNUM NUM,
--            v_Period                ZMONTH,     /*마감년월              */
--            A.POSTP_TP,                         /*이연항목              */
--            A.ORD_NO,                           /*고객번호              */
--            B.CUST_TP,                          /*고객구분              */
----            B.MAT_CD,                           /*상품번호              */
--            NVL(TRIM(D.MATNR_S), B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            B.PPTRM,                            /*이연기간              */
--            C.PROC_DAY,                         /*장착일자              */
--            B.ACQ_AMT               COGS,       /*제품원가              */
--            A.CM_PP_AMT             CM_AMT,     /*당월 이연금액         */
--            A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
--            B.CHAN_CD,                          /*채널구분              */
--            B.AGENCY_CD                         /*판매인번호            */
--    FROM    RTRE0125 A, RTRE0120 B, RTSD0108 C, RTSD0115 D
--    WHERE   A.POSTP_YM    = v_Period
--    AND     A.POSTP_TP   IN ( '04', '05', '06', '07', '08' )
--    AND     A.POSTP_STAT <> 'Z'
--    AND     A.ORD_NO      = B.ORD_NO
--    AND     A.POSTP_TP    = B.POSTP_TP
--    AND     A.ORD_NO      = C.ORD_NO
--    AND     A.ORD_NO      = D.ORD_NO(+)
--    AND     D.TRANS_TP(+) = 'N'
--    ;
    
    INSERT INTO RTTEMP15
    SELECT  ROWNUM      AS NUM
         ,  v_Period    AS ZMONTH     /*마감년월              */
         ,  A1.POSTP_TP               /*이연항목              */
         ,  A1.ORD_NO                 /*고객번호              */
         ,  A1.CUST_TP                /*고객구분              */
         ,  A1.MAT_CD                 /*상품번호              */
         ,  A1.PPTRM                  /*이연기간              */
         ,  A1.PROC_DAY               /*장착일자              */
         ,  A1.COGS                   /*제품원가              */
         ,  A1.CM_AMT                 /*당월 이연금액         */
         ,  A1.CM_R_AMT               /*당월 잔존가액         */
         ,  A1.CHAN_CD                /*채널구분              */
         ,  A1.AGENCY_CD              /*판매인번호            */
      FROM  RTRE5210 A1
     WHERE  A1.ZMONTH = v_Period
    ;

    SELECT COUNT(*) INTO v_TotCnt FROM RTTEMP15;
    
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendCommPostpone_Data(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendCommPostpone_Data;
  
  /*****************************************************************************
  -- 수수료 이연처리 내역 SELECT INTERFACE(EAI)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendCommPostpone (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendCommPostpone(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    SELECT  v_Period                ZMONTH,     /*마감년월              */
--            A.POSTP_TP,                         /*이연항목              */
--            A.ORD_NO,                           /*고객번호              */
--            B.CUST_TP,                          /*고객구분              */
----            B.MAT_CD,                           /*상품번호              */
--            NVL(D.MATNR_S, B.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            B.PPTRM,                            /*이연기간              */
--            C.PROC_DAY,                         /*장착일자              */
--            B.ACQ_AMT               COGS,       /*제품원가              */
--            A.CM_PP_AMT             CM_AMT,     /*당월 이연금액         */
--            A.CM_R_AMT              CM_R_AMT,   /*당월 잔존가액         */
--            B.CHAN_CD,                          /*채널구분              */
--            B.AGENCY_CD                         /*판매인번호            */
--    FROM    RTRE0125 A, RTRE0120 B, RTSD0108 C, RTSD0115 D
--    WHERE   A.POSTP_YM    = v_Period
--    AND     A.POSTP_TP   IN ( '04', '05', '06', '07', '08' )
--    AND     A.POSTP_STAT <> 'Z'
--    AND     A.ORD_NO      = B.ORD_NO
--    AND     A.POSTP_TP    = B.POSTP_TP
--    AND     A.ORD_NO      = C.ORD_NO
--    AND     A.ORD_NO      = D.ORD_NO(+)
--    AND     D.TRANS_TP(+) = 'N'
--    ;

      OPEN Ref_Cursor FOR
      SELECT ZMONTH,     /*마감년월              */
            POSTP_TP,                         /*이연항목              */
            ORD_NO,                           /*고객번호              */
            CUST_TP,                          /*고객구분              */
            MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
            PPTRM,                            /*이연기간              */
            PROC_DAY,                         /*장착일자              */
            COGS,       /*제품원가              */
            CM_AMT,     /*당월 이연금액         */
            CM_R_AMT,   /*당월 잔존가액         */
            CHAN_CD,                          /*채널구분              */
            AGENCY_CD
            FROM RTTEMP15
            WHERE NUM BETWEEN TO_NUMBER(v_Period) - 19999 AND TO_NUMBER(v_Period); --20000건씩 전송

    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendCommPostpone(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendCommPostpone;


  /*****************************************************************************
  -- 판매수수료 기초내역 SELECT INTERFACE(EAI)
    REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용  
  *****************************************************************************/
  PROCEDURE p_ErpSendSalesComm (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendSalesComm(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    SELECT  SLCM_YM,                            /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.CUST_NO,                          /*고객번호              */
--            B.CUST_TP,                          /*고객구분              */
--            A.ORD_AGENT,                        /*판매원번호            */
--            A.CHAN_CD,                          /*채널구분              */
--            A.COMM_TP ,                         /*수수료항목            */
----            A.MAT_CD,                           /*상품코드              */
--            NVL(TRIM(C.MATNR_S), A.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.CNT_CD,                           /*타이어본수            */
--            A.SLCM_AMT,                         /*판매수수료            */
--            A.APFDS_AMT,                        /*충당설정가능금액      */
--            A.PPOB_YN,                          /*이연대상              */
--            A.PROC_DAY                          /*장착일자              */
--    FROM    RTRE5040 A, RTSD0100 B, RTSD0115 C
--    WHERE   A.SLCM_YM = v_Period
--    AND     A.CUST_NO = B.CUST_NO
--    AND     A.ORD_NO  = C.ORD_NO(+)
--    AND     C.TRANS_TP(+) = 'N';
    
    OPEN Ref_Cursor FOR
    SELECT  A1.ZMONTH    AS SLCM_YM     /*마감년월              */
         ,  A1.ORD_NO                   /*계약번호              */     
         ,  A1.CUST_NO                  /*고객번호              */
         ,  A1.CUST_TP                  /*고객구분              */
         ,  A1.ORD_AGENT                /*판매원번호            */
         ,  A1.CHAN_CD                  /*채널구분              */
         ,  A1.COMM_TP                  /*수수료항목            */
         ,  A1.MAT_CD                   /*상품코드              */
         ,  A1.CNT_CD                   /*타이어본수            */
         ,  A1.SLCM_AMT                 /*판매수수료            */
         ,  A1.APFDS_AMT                /*충당설정가능금액      */
         ,  A1.PPOB_YN                  /*이연대상              */
         ,  A1.PROC_DAY                 /*장착일자              */
      FROM  RTRE5211 A1
     WHERE  A1.ZMONTH = v_Period
    ;

    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendSalesComm(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendSalesComm;


  /*****************************************************************************
  -- 장착수수료 기초내역 SELECT INTERFACE(EAI)
    REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendInstallComm (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendInstallComm(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    SELECT  SLCM_YM,                            /*마감년월              */
--            A.ORD_NO,                           /*계약번호              */
--            A.CUST_NO,                          /*고객번호              */
--            B.CUST_TP,                          /*고객구분              */
--            A.AGENCY_CD,                        /*렌탈전문점            */
--            A.CHAN_CD,                          /*채널구분              */
--            A.COMM_TP ,                         /*수수료항목            */
----            A.MAT_CD,                           /*상품코드              */
--            NVL(TRIM(C.MATNR_S), A.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.CNT_CD,                           /*타이어본수            */
--            A.PROCC_AMT,                        /*장착수수료            */
--            A.PPOB_YN,                          /*이연대상              */
--            A.PROC_DAY                          /*장착일자              */
--    FROM    RTRE5050 A, RTSD0100 B, RTSD0115 C
--    WHERE   A.SLCM_YM = v_Period
--    AND     A.CUST_NO = B.CUST_NO
--    AND     A.ORD_NO      = C.ORD_NO(+)
--    AND     C.TRANS_TP(+) = 'N';
    
    OPEN Ref_Cursor FOR
    SELECT  A1.ZMONTH    AS SLCM_YM     /*마감년월              */
         ,  A1.ORD_NO                   /*계약번호              */
         ,  A1.CUST_NO                  /*고객번호              */
         ,  A1.CUST_TP                  /*고객구분              */
         ,  A1.AGENCY_CD                /*렌탈전문점            */
         ,  A1.CHAN_CD                  /*채널구분              */
         ,  A1.COMM_TP                  /*수수료항목            */
         ,  A1.MAT_CD                   /*상품코드              */
         ,  A1.CNT_CD                   /*타이어본수            */
         ,  A1.PROCC_AMT                /*장착수수료            */
         ,  A1.PPOB_YN                  /*이연대상              */
         ,  A1.PROC_DAY                 /*장착일자              */
      FROM  RTRE5212 A1  
     WHERE  A1.ZMONTH = v_Period
    ;


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendInstallComm(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendInstallComm;


  /*****************************************************************************
  -- 서비스수수료 기초내역 SELECT INTERFACE(EAI)
    REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.11       2018-09-30  wjim             [20180920_01] 실제 출고제품으로 제품코드 사용
  *****************************************************************************/
  PROCEDURE p_ErpSendServiceComm (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendServiceComm(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    SELECT  SLCM_YM,                            /*마감년월              */
--            A.COMM_TP ,                         /*수수료항목            */
--            A.ORD_NO,                           /*계약번호              */
--            A.COMM_SEQ,                         /*수수료순번            */
--            A.CUST_NO,                          /*고객번호              */
--            B.CUST_TP ,                         /*고객구분              */
--            A.AGENCY_CD,                        /*렌탈전문점            */
--            A.CHAN_CD,                          /*채널구분              */
----            A.MAT_CD,                           /*상품코드              */
--            NVL(TRIM(C.MATNR_S), A.MAT_CD) AS MAT_CD, /*상품번호              */    --[20180920_01] 실제 출고제품코드 사용
--            A.CLASS_CD,                         /*차량분류              */
--            A.SVCC_AMT,                         /*서비스수수료          */
--            A.PPOB_YN,                          /*이연대상              */
--            A.SVCP_DAY,                         /*서비스처리일자        */
--            A.EQU_NO,                           /*설비번호              */
--            A.SERV_SEQ,                         /*서비스순번            */
--            A.SERV_ISEQ                         /*서비스항목순번        */
--    FROM    RTRE5060 A, RTSD0100 B, RTSD0115 C
--    WHERE   A.SLCM_YM = v_Period
--    AND     A.CUST_NO = B.CUST_NO
--    AND     A.ORD_NO      = C.ORD_NO(+)
--    AND     C.TRANS_TP(+) = 'N';
    
    OPEN Ref_Cursor FOR
    SELECT  A1.ZMONTH    AS SLCM_YM     /*마감년월              */
         ,  A1.COMM_TP                  /*수수료항목            */
         ,  A1.ORD_NO                   /*계약번호              */
         ,  A1.COMM_SEQ                 /*수수료순번            */
         ,  A1.CUST_NO                  /*고객번호              */
         ,  A1.CUST_TP                  /*고객구분              */
         ,  A1.AGENCY_CD                /*렌탈전문점            */
         ,  A1.CHAN_CD                  /*채널구분              */
         ,  A1.MAT_CD                   /*상품코드              */
         ,  A1.CLASS_CD                 /*차량분류              */
         ,  A1.SVCC_AMT                 /*서비스수수료          */
         ,  A1.PPOB_YN                  /*이연대상              */
         ,  A1.SVCP_DAY                 /*서비스처리일자        */
         ,  A1.EQU_NO                   /*설비번호              */
         ,  A1.SERV_SEQ                 /*서비스순번            */
         ,  A1.SERV_ISEQ                /*서비스항목순번        */
      FROM  RTRE5213 A1
     WHERE  A1.ZMONTH = v_Period
    ;

    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendServiceComm(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendServiceComm;


  /*****************************************************************************
  -- 수수료 합산내역 SELECT INTERFACE(EAI)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.10       2018-03-27  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
  *****************************************************************************/
  PROCEDURE p_ErpSendCommSummary (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendCommSummary(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    SELECT  A.SLCM_YM,                            /*마감년월              */
--            A.AGENCY_CD,                          /*렌탈전문점            */
--            A.RTSLC_AMT,                          /*대리점판매수수료      */
--            A.NTSLC_AMT,                          /*방문판매수수료        */
--            A.OPSLC_AMT,                          /*오픈몰판매수수료      */
--            A.TBSLC_AMT,                          /*타이어뱅크판매수수료  */
--            A.PROCC_AMT,                          /*장착수수료            */
--            A.LCCHC_AMT,                          /*위치교환수수료        */
--            A.EGOLC_AMT,                          /*엔진오일교환수수료    */
--            A.APFDS_AMT,                          /*충당설정가능금액      */
--            A.BTAPFD_AMT,                         /*이전충당금액          */
--            A.MFAPFD_AMT,                         /*당월충당금설정금액    */
--            A.TCOMM_AMT,                          /*총 수수료액           */
--            NVL(A.RGCHK_AMT,0) AS RGCHK_AMT,      /*방문점검수수료        */    --[20170519_01]
--            NVL(A.ALIGN_AMT,0) AS ALIGN_AMT,      /*얼라인먼트수수료      */    --[20180326_01]
--            NVL(A.ZERO_AMT ,0) AS ZERO_AMT,        /*걱정제로장착수수료    */    --[20180326_01]
--            NVL(A.PICK_AMT ,0) AS PICK_AMT,          /*PickUp And Delivery 수수료    */    --[20200526_01]
--            NVL(A.VPROCC_AMT ,0) AS VPROCC_AMT        /*방문장착수수료    */    --[20200526_01]
--    FROM    RTRE5070 A
--    WHERE   SLCM_YM = v_Period;

    OPEN Ref_Cursor FOR
    SELECT  A1.ZMONTH     AS SLCM_YM    /*마감년월              */
         ,  A1.AGENCY_CD                /*렌탈전문점            */
         ,  A1.RTSLC_AMT                /*대리점판매수수료      */
         ,  A1.NTSLC_AMT                /*방문판매수수료        */
         ,  A1.OPSLC_AMT                /*오픈몰판매수수료      */
         ,  A1.TBSLC_AMT                /*타이어뱅크판매수수료  */
         ,  A1.PROCC_AMT                /*장착수수료            */
         ,  A1.LCCHC_AMT                /*위치교환수수료        */
         ,  A1.EGOLC_AMT                /*엔진오일교환수수료    */
         ,  A1.APFDS_AMT                /*충당설정가능금액      */
         ,  A1.BTAPFD_AMT               /*이전충당금액          */
         ,  A1.MFAPFD_AMT               /*당월충당금설정금액    */
         ,  A1.TCOMM_AMT                /*총 수수료액           */
         ,  A1.RGCHK_AMT                /*방문점검수수료        */    --[20170519_01]
         ,  A1.ALIGN_AMT                /*얼라인먼트수수료      */    --[20180326_01]
         ,  A1.ZERO_AMT                 /*걱정제로장착수수료    */    --[20180326_01]
         ,  A1.PICK_AMT                 /*PickUp And Delivery 수수료    */    --[20200526_01]
         ,  A1.VPROCC_AMT               /*방문장착수수료    */    --[20200526_01]
      FROM  RTRE5214 A1
     WHERE  A1.ZMONTH = v_Period
    ; 

    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendCommSummary(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendCommSummary;


  /*****************************************************************************
  -- 충당금 내역 SELECT INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendAllowance (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN

--    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendAllowance(1)', '년월', v_Period);

--    OPEN Ref_Cursor FOR
--    SELECT  AGENCY_CD,                          /*렌탈전문점            */
--            APFD_DAY,                           /*충당금처리일자        */
--            APFD_SEQ,                           /*충당금순번            */
--            APFD_TP,                            /*충당금처리구분        */
--            APFD_PAMT,                          /*충당금발생금액        */
--            APFD_MAMT,                          /*충당금차감금액        */
--            APFD_MSG                            /*충당금처리 사유       */
--    FROM    RTRE5080
--    WHERE   APFD_DAY BETWEEN  v_Period||'01'
--                         AND TO_CHAR(LAST_DAY(TO_DATE(v_Period, 'YYYYMM')), 'YYYYMMDD')
--    ;
    
    OPEN Ref_Cursor FOR
    SELECT  A1.AGENCY_CD    /*렌탈전문점            */
         ,  A1.APFD_DAY     /*충당금처리일자        */
         ,  A1.APFD_SEQ     /*충당금순번            */
         ,  A1.APFD_TP      /*충당금처리구분        */
         ,  A1.APFD_PAMT    /*충당금발생금액        */
         ,  A1.APFD_MAMT    /*충당금차감금액        */
         ,  A1.APFD_MSG     /*충당금처리 사유       */
      FROM  RTRE5215 A1  
     WHERE  A1.ZMONTH = v_Period
    ; 


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendAllowance(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendAllowance;

  /*****************************************************************************
  --배송중 정보  INTERFACE
  *****************************************************************************/
  PROCEDURE p_ErprecvdeliveryIng (
    v_Ord_No         IN RTSD0117.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0117.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0117.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0117.GI_DAY%TYPE,         /*배송완료일            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Reg_Id RTCS0103.REG_ID%TYPE DEFAULT 'IFEAI';    /*등록자ID              */
    e_Error EXCEPTION;
  BEGIN

    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErprecvdeliveryIng(1)', '계약번호', v_Ord_No);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErprecvdeliveryIng(1)', 'SAP 주문번호', v_Vbeln);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErprecvdeliveryIng(1)', 'SAP 배송번호', v_Vbeln_D);
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErprecvdeliveryIng(1)', '배송완료일', v_Gi_Day);


    -- 필수값: 계약번호, SAP 주문번호
    IF (SUBSTR(v_Ord_No,14,1) IS NULL) OR (SUBSTR(v_Ord_No,14,1) <>'') THEN 
        IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count( SUBSTR(v_Ord_No,1,12) )) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    END IF;
    
    IF TRIM(v_Vbeln) IS NULL THEN
        v_Return_Message := 'SAP 주문번호('||v_Vbeln||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = Pkg_Rtsd0117.f_sRtsd0117Count( SUBSTR(v_Ord_No,1,12) , v_Vbeln) THEN

        IF 0 != Pkg_Rtsd0117.f_InsertRtsd0117( v_Ord_No,                        /*계약번호              */
                                               v_Vbeln,                         /*SAP 주문번호          */
                                               v_Vbeln_D,                       /*SAP 배송번호          */
                                               v_Gi_Day,                        /*배송일자              */
                                               NULL,                            /*SMS 발송일자          */
                                               'N',                             /*SMS 발송여부          */
                                               v_Reg_Id,                        /*등록자 ID             */
                                               v_ErrorText
                                             ) THEN
            v_Return_Message := '배송완료 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 != Pkg_Rtsd0117.f_UpdateRtsd0117Recv( v_Ord_No,                    /*계약번호              */
                                                   v_Vbeln,                     /*SAP 주문번호          */
                                                   v_Vbeln_D,                   /*SAP 배송번호          */
                                                   v_Gi_Day,                    /*배송일자              */
                                                   v_Reg_Id,                    /*등록자 ID             */
                                                   v_ErrorText
                                                 ) THEN
            v_Return_Message := '배송완료 정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErprecvdeliveryIng(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErprecvdeliveryIng(2)', v_ErrorText, v_Return_Message);

  END p_ErprecvdeliveryIng;

  /*****************************************************************************
  -- 대리점 벤더 내역 INTERFACE(EAI)
  *****************************************************************************/
  PROCEDURE p_ErpSendAgencyVender (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
     ) IS

  BEGIN
    Pkg_Utility.p_InfoFileWrite('Pkg_Exif0002.p_ErpSendAgencyVender(1)', '년월', v_Period);

    OPEN Ref_Cursor FOR
    SELECT  v_Period     , /*마감년월              */
            AGENCY_CD    , /*렌탈전문점            */
            LIFNR        , /*벤더코드              */
            TAX_RQCD       /*세금계산서 발행방법   */
    FROM    RTVIEW02
    WHERE  CHAN_CD <> '04';


    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Exif0002.p_ErpSendAgencyVender(2)', SUBSTR(SQLERRM, 1, 200));

  END p_ErpSendAgencyVender;
  
  /*****************************************************************************
   * 28) 대리점 방판 벤더 정보 I/F SELECT INTERFACE(EAI)
   * REVISIONS
   * Ver        Date        Author      Description
   * ---------  ----------  --------    -------------------------------------
   * 1.0        2016-09-02  wjim        판매인정보 미사용분은 I/F 제외
   * 1.4        2017-09-19  wjim        [20170919_01] 레귤러체인 수수료(실제로는 인센티브)는 전표미생성 대상으로 ERP I/F 대상에서 제외
   * 1.6        2017-09-30  wjim        [20170930_01] 벤더정보 연동기준 변경
   *                                    - 판매인의 경우 사용여부와 관계없이 연동
   * 1.7        2021-07-02  kstka       [20210702_01] 벤더정보 연동기준 변경
   *                                    - 판매인의 경우 사용여부와 관계없이 연동 (기존 주석이 풀려있어 다시 주석처리함)
  *****************************************************************************/
  PROCEDURE p_ErpSendAllAgencyVender (
    v_Period         IN CHAR,                           /*년월                */
    Ref_Cursor       OUT SYS_REFCURSOR
    ) IS
  BEGIN
  
--  OPEN Ref_Cursor FOR
--     SELECT DISTINCT v_Period AS PERIOD    , /*마감년월              */
--           AGENCY_CD,
--           AGENCY_NM,
--           SALES_GROUP,
--           SALES_OFFICE,
--           LIFNR,
--           DECODE(TAX_RQCD,'S','Y','N') AS SIMPL_TAX
--      FROM (SELECT AGENCY_CD,
--                   AGENCY_NM,
--                   SALES_GROUP,
--                   SALES_OFFICE,
--                   LIFNR,
--                   TAX_RQCD
--              FROM RTSD0007
--             WHERE liFNR IS NOT NULL
--             AND SALES_OFFICE IS NOT NULL
--             AND CHAN_MCLS_CD NOT IN ('0105') --[20170919_01]
--            UNION ALL
--            SELECT ORD_AGENT AS "AGENCY_CD",
--                   ORG_AGNM AS "AGENCY_NM",
--                   SALES_GROUP,
--                   SALES_OFFICE,
--                   LIFNR,
--                   TAX_RQCD
--              FROM NXRADMIN.RTSD0113
--             WHERE liFNR IS NOT NULL
--             AND SALES_OFFICE IS NOT NULL
----             AND USE_YN = 'Y' --[20170930_01] 에 의해 주석처리 [20210702_01] 사유로 주석처리
--             AND CHG_ID <> 'BATCH_DEL'
--             );
             
    OPEN Ref_Cursor FOR         
    SELECT  A1.ZMONTH       AS PERIOD       /*마감년월              */
         ,  A1.AGENCY_CD
         ,  A1.AGENCY_NM
         ,  A1.SALES_GROUP
         ,  A1.SALES_OFFICE
         ,  A1.LIFNR
         ,  A1.SIMPL_TAX
      FROM  RTRE5216 A1 
     WHERE  A1.ZMONTH = v_Period
    ;
             
  END p_ErpSendAllAgencyVender;

  /*****************************************************************************
  -- 30) 카카오 조회 I/F SELECT INTERFACE(EAI)
   * REVISIONS
   * Ver        Date        Author      Description
   * ---------  ----------  --------    -------------------------------------
   * 1.0        2019-01-04  Kju         최초작성
  *****************************************************************************/
  PROCEDURE p_EaiKakaoSelect (
    Ref_Cursor       OUT SYS_REFCURSOR
    ) IS
  BEGIN
  
  OPEN Ref_Cursor FOR
    SELECT   CMP_MSG_ID AS MESSAGE_SEQNO
            ,'1810024692' AS SERVICE_SEQNO
            ,SND_MSG AS SEND_MESSAGE
            ,'003' AS BACKUP_PROCESS_CODE
            ,'002' AS MESSAGE_TYPE
            ,'004' AS CONTENTS_TYPE
            ,RCV_PHN_ID AS RECEIVE_MOBILE_NO
            ,SND_PHN_ID AS CALLBACK_NO
            ,'R00' AS JOB_TYPE
            ,SYSDATE AS SEND_RESERVE_DATE
            ,ETC_CHAR_4 AS TEMPLATE_CODE
            ,REG_ID AS REGISTER_BY
            ,REG_DT AS REGISTER_DATE
            ,'N' AS SEND_FLAG
            ,ETC_CHAR_3 AS SMS_DSC  -- 2, 6, 7 번 전송. 알림톡-2,6 | KT SMS-7
    FROM    NXRADMIN.RTSD0205
    WHERE   ETC_CHAR_3 IN ('2', '6')
    AND     EAI_TR_YN = 'N'
    AND     RESERVED_DTTM BETWEEN TO_CHAR((SYSDATE - 1/24), 'YYYYMMDDhh24miss') AND TO_CHAR(SYSDATE, 'YYYYMMDDhh24miss');   -- 한 시간 전까지
  END p_EaiKakaoSelect;
    
  /*****************************************************************************
  -- 31) KT SMS 조회 I/F SELECT INTERFACE(EAI)
   * REVISIONS
   * Ver        Date        Author      Description
   * ---------  ----------  --------    -------------------------------------
   * 1.0        2019-01-04  Kju         최초작성  
  *****************************************************************************/
  PROCEDURE p_EaiKtSmsSelect (
    Ref_Cursor       OUT SYS_REFCURSOR
    ) IS
  BEGIN
  
  OPEN Ref_Cursor FOR
    SELECT   CMP_MSG_ID AS MSG_ID
            ,'uracle02' AS USER_ID
            ,'0' AS SCHEDULE_TYPE
            ,SUBSTR(MSG_TITLE, 1, 64) AS SUBJECT
            ,TO_CHAR(SYSDATE, 'YYYYMMDDhh24miss') AS NOW_DATE
            ,TO_CHAR(SYSDATE, 'YYYYMMDDhh24miss') AS SEND_DATE
            ,SND_PHN_ID AS CALLBACK
            ,1 AS DEST_COUNT
            ,'고객^'||RCV_PHN_ID AS DEST_INFO
            ,SND_MSG AS MMS_MSG
            ,0 AS CONTENT_COUNT
            ,'uracle02' AS CDR_ID
            ,ETC_CHAR_1 AS RESERVED1
            ,ETC_CHAR_2 AS RESERVED2
            ,ETC_CHAR_3 AS RESERVED3 -- 2, 6, 7 번 전송. 알림톡-2,6 | KT SMS-7
            ,0 AS SEND_STATUS
            ,0 AS SEND_COUNT
            ,0 AS SEND_RESULT
            ,0 AS MSG_TYPE
    FROM    NXRADMIN.RTSD0205
    WHERE   ETC_CHAR_3 = '7'
    AND     EAI_TR_YN = 'N'
    AND     RESERVED_DTTM BETWEEN TO_CHAR((SYSDATE - 1/24), 'YYYYMMDDhh24miss') AND TO_CHAR(SYSDATE, 'YYYYMMDDhh24miss');   -- 한 시간 전까지
  END p_EaiKtSmsSelect;  

    /*****************************************************************************
   * 32) 마감전료인터페이스 I/F SELECT INTERFACE(EAI)
   * REVISIONS
   * Ver        Date        Author      Description
   * ---------  ----------  --------    -------------------------------------
   * 1.0        2020-08-11  kstka  Create Pkg
  *****************************************************************************/
  PROCEDURE p_ErpSendClosePosting (
    v_Period         IN CHAR,                           /*년월                */
    v_StmtCd        IN CHAR,                           /*전표항목코드      */
    Ref_Cursor       OUT SYS_REFCURSOR
    ) IS
  BEGIN
  
     OPEN Ref_Cursor FOR
     SELECT   A1.BUKRS
         ,  A1.BUDAT
         ,  A1.BLDAT
         ,  A1.BKTXT
         ,  A1.WAERS
         ,  B1.BSCHL
         ,  B1.HKONT
         ,  B1.MWSKZ
         ,  B1.KOSTL
         ,  B1.DMBTR
         ,  B1.SGTXT
      FROM  RTRE5401 A1
            ,  RTRE5402 B1
     WHERE  A1.ZMONTH      = v_Period
       AND  A1.STMT_CD       = v_StmtCd
       AND  A1.ZMONTH       = B1.ZMONTH
       AND  A1.STMT_CD      = B1.STMT_CD
       AND  A1.STMT_SEQ     = B1.STMT_SEQ
     ORDER  BY B1.ITM_SEQ
    ;
    
  END p_ErpSendClosePosting;
  
  
  /*****************************************************************************
   * 인사시스템 인사발령 EAI INTERFACE
   * - 인사시스템에서 계정 및 권한회수 대상 인사발령만 필터링해서 연동됨
   *
   * REVISIONS
   * Ver        Date        Author      Description
   * ---------  ----------  --------    -------------------------------------
   * 1.0        2021-12-03              최초작성
  *****************************************************************************/
  PROCEDURE p_EhrRecvPrsnlAppmnt (
      v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    ls_today            RTCM0015.IF_YMD%TYPE := TO_CHAR(SYSDATE, 'YYYYMMDD');
    ln_seq              RTCM0015.IF_SEQ%TYPE;
    ln_cnt              NUMBER;
    ls_user_wthdrw_cd   RTCM0015.USER_WTHDRW_CD%TYPE;
    ls_auth_wthdrw_cd   RTCM0015.AUTH_WTHDRW_CD%TYPE;
    ln_chk              NUMBER;
    ln_chk2             NUMBER;
    ln_chk3             NUMBER;
    ls_reg_id           RTCM0015.REG_ID%TYPE := 'IFEAI';
    
    lr_user             RTCM0001%ROWTYPE;
  
    e_Error EXCEPTION;
    
  BEGIN
  
    SELECT  NVL(MAX(IF_SEQ),0)
      INTO  ln_seq
      FROM  RTCM0015  
     WHERE  IF_YMD = ls_today
    ;    
  
    FOR rec_01 IN (
        SELECT  *
          FROM  RTCM0014  
    ) LOOP
    
        -- 인사발령 대상자가 시스템 사용자인지 확인
        SELECT  COUNT(*)
          INTO  ln_cnt
          FROM  RTCM0001
         WHERE  USER_ID = TO_CHAR(rec_01.EMP_ID);
        
        -- 시스템 사용자인 경우, 인사발령 유형에 따라 계정 및 권한회수 진행 
        IF ln_cnt > 0 THEN        
                        
            ln_chk  := 0;
            ln_chk2 := 0;
            ln_chk3 := 0;
            
            -- 이전에 동일한 인사발령이 이미 처리된 이력이 있는지 확인
            SELECT  COUNT(*)
              INTO  ln_chk3
              FROM  RTCM0015 
             WHERE  IF_YMD  < ls_today
               AND  EMP_ID  = rec_01.EMP_ID
               AND  STA_YMD = rec_01.STA_YMD
               AND  TYPE_CD = rec_01.TYPE_CD
               AND  CAU_CD  = rec_01.CAU_CD
               AND  AUTH_WTHDRW_CD IN ('11','12','13')   
            ;
            
            -- 동일한 인사발령 처리이력이 없는 경우에만 권한회수 진행
            IF ln_chk3 = 0 THEN
            
                -- 권한회수
                FOR rec_02 IN (
                    SELECT  *
                      FROM  RTCM0023
                     WHERE  USER_ID = TO_CHAR(rec_01.EMP_ID)                  
                ) LOOP
                    
                    ln_chk := ln_chk + 1;
                    
                    IF rec_02.DEL_FG = 'N' THEN
                        ln_chk2 := ln_chk2 + 1;
                        
                        --권한회수
                        Pkg_Rtcm0023.p_IUDRtcm0023(
                              'U'                   --v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
                            , rec_02.AUTH_GRP_CD    --v_Auth_Grp_Cd    IN RTCM0023.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
                            , rec_02.USER_ID        --v_User_Id        IN RTCM0023.USER_ID%TYPE,        /*사용자 아이디         */
                            , 'Y'                   --v_Del_Fg         IN RTCM0023.DEL_FG%TYPE,         /*삭제표시              */
                            , ls_reg_id             --v_Reg_Id         IN RTCM0023.REG_ID%TYPE,         /*등록자 ID             */
                            , v_Success_Code        --OUT NUMBER,
                            , v_Return_Message      --OUT VARCHAR2,
                            , v_ErrorText           --OUT VARCHAR2 
                        );
                        
                        IF 0 != v_Success_Code THEN
                           v_Return_Message := '권한회수 실패!!!'||'-'||v_Return_Message;
                           v_Errortext := v_Errortext;
                           RAISE e_Error;
                        END IF;
                    
                    END IF;
                
                END LOOP;
            
            END IF;
        
            
            IF ln_chk3 > 0 THEN
                ls_auth_wthdrw_cd := '13';     --권한회수=기처리
            ELSE
                IF ln_chk = 0 THEN
                    ls_auth_wthdrw_cd := '01';     --권한회수=권한미부여                
                ELSE
                    IF ln_chk2 = 0 THEN
                        ls_auth_wthdrw_cd := '12'; --권한회수=기회수
                    ELSE                    
                        ls_auth_wthdrw_cd := '11'; --권한회수=회수
                    END IF;                    
                END IF; 
            END IF;
        
            -- 퇴사인 경우 계정회수(잠금처리)
            IF rec_01.TYPE_CD IN ('100E1') THEN
            
                SELECT  *
                  INTO  lr_user
                  FROM  RTCM0001
                 WHERE  USER_ID = TO_CHAR(rec_01.EMP_ID);
                 
                IF lr_user.LOCK_YN = 'Y' THEN
                    ls_user_wthdrw_cd := '12';  --계정회수=기회수
                    
                ELSE
                    --계정회수 처리
                    Pkg_Rtcm0001.p_IUDRtcm0001 (
                          'U'                   --v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
                        , lr_user.USER_ID       --v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*사용자 아이디         */
                        , lr_user.USER_NM       --v_User_Nm        IN RTCM0001.USER_NM%TYPE,        /*사용자명              */
                        , lr_user.PASSWORD      --v_Password       IN RTCM0001.PASSWORD%TYPE,       /*비밀번호              */
                        , lr_user.AGENT_ID      --v_Agent_Id       IN RTCM0001.AGENT_ID%TYPE,       /*대리점아이디          */
                        , lr_user.VKBUR         --v_Vkbur          IN RTCM0001.VKBUR%TYPE,          /*지점                  */
                        , lr_user.VKGRP         --v_Vkgrp          IN RTCM0001.VKGRP%TYPE,          /*지사                  */
                        , lr_user.USER_GRP      --v_User_Grp       IN RTCM0001.USER_GRP%TYPE,       /*사용자 그룹           */
                        , 'Y'                   --v_Lock_Yn        IN RTCM0001.LOCK_YN%TYPE,        /*사용불가 계정여부     */
                        , ls_reg_id             --v_Reg_Id         IN RTCM0001.REG_ID%TYPE,         /*등록자 ID             */
                        , v_Success_Code        --OUT NUMBER,
                        , v_Return_Message      --OUT VARCHAR2,
                        , v_ErrorText           --OUT VARCHAR2
                    );
                    
                    IF 0 != v_Success_Code THEN
                       v_Return_Message := '계정회수 실패!!!'||'-'||v_Return_Message;
                       v_Errortext := v_Errortext;
                       RAISE e_Error;
                    END IF;
                
                    ls_user_wthdrw_cd := '11';  --계정회수=회수
                
                END IF;
                
            ELSE
                ls_user_wthdrw_cd := '00';  --계정회수=대상아님
    
            END IF;
        
        ELSE
            ls_user_wthdrw_cd := '00';  --계정회수=대상아님
            ls_auth_wthdrw_cd := '00';  --권한회수=대상아님

        END IF; 
        
        ln_seq := ln_seq + 1;

        INSERT INTO RTCM0015 VALUES (
              ls_today
            , ln_seq
            , rec_01.CAM_HISTORY_ID
            , rec_01.EMP_ID
            , rec_01.STA_YMD
            , rec_01.END_YMD
            , rec_01.TYPE_CD
            , rec_01.TYPE_NM
            , rec_01.CAU_CD
            , rec_01.CAU_NM
            , rec_01.ORG_CD
            , rec_01.ORG_NM
            , rec_01.DUTY_CD
            , rec_01.DUTY_NM
            , ls_user_wthdrw_cd
            , ls_auth_wthdrw_cd
            , ls_reg_id
            , SYSDATE
            , ls_reg_id
            , SYSDATE    
        );           
    
    END LOOP;    
  
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';

--    COMMIT; --commit은 EAI에서 수행

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
    
  END p_EhrRecvPrsnlAppmnt;
  
  END Pkg_Exif0002;