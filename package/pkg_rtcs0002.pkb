CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0002 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0002
   PURPOSE   카마스타 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-12  jemcarry         1. Created this package body.
   1.1        2017-03-28  wjim             [20170328_01] 로디안 찾기 팝업 조회기준 변경
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
   1.3        2017-06-22  wjim             [20170622_01] 사번으로 로디안 조회기능 추가
   1.4        2017-06-22  wjim             [20170622_02] 로디안 팝업 조회조건 추가
                                           - 근무여부
*******************************************************************************/

  /*****************************************************************************
  -- 카마스타 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0002Count(
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE      /*카마스타 사번       */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0002
    WHERE   CARMASTER_NU = v_Carmaster_Nu;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0002Count;

  /*****************************************************************************
  -- 카마스타 마스터 Select
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
  *****************************************************************************/
  PROCEDURE p_sRtcs0002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE    /*카마스타 사번         */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CARMASTER_NU,              /*카마스타 사번       */
            A.CARMASTER_NM,              /*카마스타 명         */
            A.SALES_GROUP,               /*지사코드            */
            A.SALES_OFFICE,              /*지점코드            */
            A.AGENCY_CD,                 /*대리점코드          */
            A.MOB_NO,                    /*핸드폰번호          */
            A.TEL_NO,                    /*전화번호            */
            A.POS_CD,                    /*우편번호            */
            A.CITY,                      /*주소                */
            A.STREET,                    /*상세주소            */
            A.STR_DAY,                   /*입사일              */
            A.END_DAY,                   /*퇴사일              */
            A.USE_YN,                    /*근무여부            */
            A.ETC1,                      /*기타1               */
            A.ETC2,                      /*기타2               */
            A.REG_ID,                    /*등록자ID            */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자ID            */
            A.CHG_DT,                    /*변경일              */
            A.ORD_AGENT                  /*판매인번호          */           
    FROM    RTCS0002 A
    WHERE   A.CARMASTER_NU = v_Carmaster_Nu;

  END p_sRtcs0002;

  /*****************************************************************************
  -- 카마스타 마스터 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
  *****************************************************************************/
  FUNCTION f_InsertRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*카마스타 사번         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*전화번호              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTCS0002.CITY%TYPE,           /*주소                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*상세주소              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*입사일                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*퇴사일                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*근무여부              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*기타1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*기타2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*등록자ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0002 (
            CARMASTER_NU,
            CARMASTER_NM,
            SALES_GROUP,
            SALES_OFFICE,
            AGENCY_CD,
            MOB_NO,
            TEL_NO,
            POS_CD,
            CITY,
            STREET,
            STR_DAY,
            END_DAY,
            USE_YN,
            ETC1,
            ETC2,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            ORD_AGENT,
            RENTAL_GROUP,
            RENTAL_OFFICE
            )
    VALUES  (
--            v_Carmaster_Nu,
            -- 저장시 자동으로 MAX 값 + 1 순번값이 들어간다.
            (SELECT DECODE(MAX(CARMASTER_NU),NULL,1,MAX(TO_NUMBER(CARMASTER_NU)) +1) AS MAXNU FROM RTCS0002),
            v_Carmaster_Nm,
            v_Sales_Group,
            v_Sales_Office,
            v_Agency_Cd,
            v_Mob_No,
            v_Tel_No,
            v_Pos_Cd,
            v_City,
            v_Street,
            v_Str_Day,
            v_End_Day,
            v_Use_Yn,
            v_Etc1,
            v_Etc2,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Ord_Agent,
            v_Rental_Group,
            v_Rental_Office
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0002;

  /*****************************************************************************
  -- 카마스타 마스터 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*카마스타 사번         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*전화번호              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTCS0002.CITY%TYPE,           /*주소                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*상세주소              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*입사일                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*퇴사일                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*근무여부              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*기타1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*기타2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*등록자ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0002
    SET    CARMASTER_NM = v_Carmaster_Nm,
           SALES_GROUP  = v_Sales_Group,
           SALES_OFFICE = v_Sales_Office,
           AGENCY_CD    = v_Agency_Cd,
           MOB_NO       = v_Mob_No,
           TEL_NO       = v_Tel_No,
           POS_CD       = v_Pos_Cd,
           CITY         = v_City,
           STREET       = v_Street,
           STR_DAY      = v_Str_Day,
           END_DAY      = v_End_Day,
           USE_YN       = v_Use_Yn,
           ETC1         = v_Etc1,
           ETC2         = v_Etc2,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE,
           ORD_AGENT    = v_Ord_Agent,
           RENTAL_GROUP = v_Rental_Group,
           RENTAL_OFFICE = v_Rental_Office
    WHERE  CARMASTER_NU = v_Carmaster_Nu;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0002;

  /*****************************************************************************
  -- 카마스타 마스터 Delete
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*카마스타 사번         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*전화번호              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTCS0002.CITY%TYPE,           /*주소                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*상세주소              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*입사일                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*퇴사일                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*근무여부              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*기타1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*기타2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*등록자ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0002
    SET    CARMASTER_NU = v_Carmaster_Nu,
           CARMASTER_NM = v_Carmaster_Nm,
           SALES_GROUP  = v_Sales_Group,
           SALES_OFFICE = v_Sales_Office,
           AGENCY_CD    = v_Agency_Cd,
           MOB_NO       = v_Mob_No,
           TEL_NO       = v_Tel_No,
           POS_CD       = v_Pos_Cd,
           CITY         = v_City,
           STREET       = v_Street,
           STR_DAY      = v_Str_Day,
           END_DAY      = v_End_Day,
           USE_YN       = v_Use_Yn,
           ETC1         = v_Etc1,
           ETC2         = v_Etc2,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE,
           ORD_AGENT    = v_Ord_Agent, 
           RENTAL_GROUP = v_Rental_Group,
           RENTAL_OFFICE = v_Rental_Office
    WHERE  CARMASTER_NU = v_Carmaster_Nu;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0002;

  /*****************************************************************************
  -- 카마스타 마스터 관리(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0002 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*카마스타 사번         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*전화번호              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTCS0002.CITY%TYPE,           /*주소                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*상세주소              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*입사일                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*퇴사일                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*근무여부              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*기타1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*기타2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*등록자ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 판매인번호 검증
    IF (0 = Pkg_Rtsd0113.f_sRtsd0113Count(v_Ord_Agent)) THEN
        v_Return_Message := '유효하지 않은 판매인번호('||v_Ord_Agent||') 입니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcs0002Count(v_Carmaster_Nu) THEN

        IF 0 != f_InsertRtcs0002(v_Carmaster_Nu, v_Carmaster_Nm, v_Sales_Group, v_Sales_Office, v_Agency_Cd,
                                 v_Mob_No,v_Tel_No, v_Pos_Cd,v_City, v_Street, v_Str_Day, v_End_Day, v_Use_Yn,
                                 v_Etc1, v_Etc2, v_Reg_Id, v_Ord_Agent, v_Rental_Group, v_Rental_Office, v_ErrorText 
                                ) THEN
            v_Return_Message := '카마스타 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcs0002(v_Carmaster_Nu, v_Carmaster_Nm, v_Sales_Group, v_Sales_Office, v_Agency_Cd,
                                     v_Mob_No,v_Tel_No, v_Pos_Cd, v_City, v_Street, v_Str_Day, v_End_Day, v_Use_Yn,
                                     v_Etc1, v_Etc2, v_Reg_Id, v_Ord_Agent, v_Rental_Group, v_Rental_Office,v_ErrorText 
                                    ) THEN
                v_Return_Message := '카마스타 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcs0002(v_Carmaster_Nu, v_Carmaster_Nm, v_Sales_Group, v_Sales_Office, v_Agency_Cd,
                                     v_Mob_No, v_Tel_No, v_Pos_Cd, v_City, v_Street, v_Str_Day, v_End_Day, v_Use_Yn,
                                     v_Etc1, v_Etc2, v_Reg_Id, v_Ord_Agent,  v_Rental_Group, v_Rental_Office, v_ErrorText
                                     ) THEN
                v_Return_Message := '카마스타 삭제 실패!!!'||'-'||v_ErrorText;
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

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0002.p_IUDRtcs0002(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0002.p_IUDRtcs0002(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0002;

  
  /*****************************************************************************
  -- 카마스타 팝업
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-28  wjim             [20170328_01] 로디안 찾기 팝업 조회기준 변경
                                           - 재직중인 로디안만 조회
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가     
   1.4        2017-06-22  wjim             [20170622_02] '근무여부' 조회조건 추가                                  
  *****************************************************************************/
  PROCEDURE p_sRtcs0002carmasterPopup(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE          /*근무여부              */
    ) IS
  
  BEGIN
  
      OPEN Ref_Cursor FOR
      SELECT  A.CARMASTER_NU,      /*카마스타 사번         */
              A.CARMASTER_NM,      /*카마스타 명           */
              A.SALES_GROUP,       /*지사코드              */
              Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', SALES_GROUP) SALES_GROUP_NM,     /*지사명         */
              A.SALES_OFFICE,      /*지점코드              */
              Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) SALES_OFFICE_NM, /*지점명         */
              A.AGENCY_CD,         /*대리점코드            */
              Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD) AGENCY_NM,                  /*대리점명       */
              A.MOB_NO,            /*핸드폰번호            */
              A.TEL_NO,            /*전화번호              */
              A.STR_DAY,           /*입사일                */
              A.END_DAY,           /*퇴사일                */
              A.USE_YN,            /*근무여부              */
              A.POS_CD,            /*우편번호              */
              A.CITY,              /*주소                  */
              A.STREET,            /*상세주소              */
              A.ETC1,              /*기타1                 */
              A.ETC2,              /*기타2                 */
              A.ORD_AGENT,         /*판매인번호          */
              A.RENTAL_GROUP,
              B.CD_NM RENTAL_GROUP_NM,
              A.RENTAL_OFFICE,
              C.CD_NM RENTAL_OFFICE_NM
      FROM    RTCS0002 A
                LEFT OUTER JOIN (
                    SELECT CD,
                           CD_NM
                      FROM RTCM0051
                     WHERE 1=1
                       AND CD_GRP_CD = 'S301'
                ) B ON
                        A.RENTAL_GROUP = B.CD
                LEFT OUTER JOIN (
                    SELECT CD,
                           CD_NM,
                           RFR_1,
                           RFR_2
                      FROM RTCM0051
                     WHERE 1=1
                       AND CD_GRP_CD = 'S302'
                       AND RFR_1 = 'S301'
                ) C ON
                        A.RENTAL_GROUP = C.RFR_2
                    AND A.RENTAL_OFFICE = C.CD 
      WHERE   A.CARMASTER_NM LIKE '%'||v_Carmaster_Nm||'%'
--        AND   A.USE_YN = 'Y'  --[20170328_01]
        AND   A.USE_YN LIKE v_Use_Yn||'%'  --[20170622_02]
      ORDER   BY A.CARMASTER_NU;
                     
  END p_sRtcs0002carmasterPopup;
  
  /*****************************************************************************
  -- 사번으로 로디안 정보 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-06-22  wjim             [20170622_01] 기능추가
  *****************************************************************************/
  PROCEDURE p_sRtcs0002carmasterNu (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE    /*로디안 사번         */
  ) IS
  
  BEGIN
  
      OPEN Ref_Cursor FOR
      SELECT  A.CARMASTER_NU,      /*카마스타 사번         */
              A.CARMASTER_NM,      /*카마스타 명           */
              A.SALES_GROUP,       /*지사코드              */
              Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', SALES_GROUP) SALES_GROUP_NM,     /*지사명         */
              A.SALES_OFFICE,      /*지점코드              */
              Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) SALES_OFFICE_NM, /*지점명         */
              A.AGENCY_CD,         /*대리점코드            */
              Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD) AGENCY_NM,                  /*대리점명       */
              A.MOB_NO,            /*핸드폰번호            */
              A.TEL_NO,            /*전화번호              */
              A.STR_DAY,           /*입사일                */
              A.END_DAY,           /*퇴사일                */
              A.USE_YN,            /*근무여부              */
              A.POS_CD,            /*우편번호              */
              A.CITY,              /*주소                  */
              A.STREET,            /*상세주소              */
              A.ETC1,              /*기타1                 */
              A.ETC2,              /*기타2                 */
              A.ORD_AGENT,         /*판매인번호            */
              A.RENTAL_GROUP,
              -- (select RENTAL_GROUP_NM from rtsd0052 B where a.RENTAL_GROUP=b.RENTAL_GROUP) as RENTAL_GROUP_NM,
              B.CD_NM RENTAL_GROUP_NM,
              A.RENTAL_OFFICE,
              -- (select RENTAL_OFFICE_NM from rtsd0053 C ,rtsd0052 B where a.RENTAL_OFFICE=c.RENTAL_OFFICE and B.RENTAL_GROUP=c.RENTAL_GROUP) as RENTAL_OFFICE_NM
              C.CD_NM RENTAL_OFFICE_NM
      FROM    RTCS0002 A
                LEFT OUTER JOIN (
                    SELECT CD,
                           CD_NM
                      FROM RTCM0051
                     WHERE 1=1
                       AND CD_GRP_CD = 'S301'
                ) B ON
                        A.RENTAL_GROUP = B.CD
                LEFT OUTER JOIN (
                    SELECT CD,
                           CD_NM,
                           RFR_1,
                           RFR_2
                      FROM RTCM0051
                     WHERE 1=1
                       AND CD_GRP_CD = 'S302'
                       AND RFR_1 = 'S301'
                ) C ON
                        A.RENTAL_GROUP = C.RFR_2
                    AND A.RENTAL_OFFICE = C.CD 
      WHERE   A.CARMASTER_NU = v_Carmaster_Nu;
                     
  END p_sRtcs0002carmasterNu;  
  
  
  /*****************************************************************************
 -- AS기사순번 구하기
 *****************************************************************************/  
  PROCEDURE p_sRtcs0002getmaxnu(
    v_Carmaster_Nu   OUT  RTCS0002.CARMASTER_NU%TYPE   /*카마스타 사번         */
    ) IS
  
  BEGIN

    SELECT  DECODE(MAX(CARMASTER_NU),NULL,1,MAX(TO_NUMBER(CARMASTER_NU)) +1) AS MAXNU 
    INTO    v_Carmaster_Nu
    FROM    RTCS0002;
                     
  END p_sRtcs0002getmaxnu;
  
END Pkg_Rtcs0002;