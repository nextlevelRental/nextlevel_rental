CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0109 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0109
   PURPOSE   청구스케줄 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-13  jemcarry         1. Created this package body.
   1.1        2017-09-19  wjim             [20170224_01] 수금관리(팝업)용 청구내역조회 추가
   1.2        2018-04-19  wjim             [20180419_01] 중도완납(해약) 시 방문점검 당월 배정분 점검거부 자동 등록
   1.3        2018-04-25  wjim             [20180425_01] 중도완납(해약) 시 방문점검 점검거부 이력등록
   1.4        2018-11-09  ncho             1. 연체금수납 - 미납내역 상세 조회 추가
   1.5        2018-12-11  ncho             1. 선납할인수납 청구스케줄 Update 추가
   1.6        2019-03-07  wjim             [20190307_01] 중도해지 시 장착수수료 산정기준 변경
   1.7        2023-07-10  kstka            [20230710_1] 중도해지시 위약금에 장탈착비 제외 (위법사항, 법무팀)
*******************************************************************************/

  /*****************************************************************************
  -- 청구스케줄 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0109Count(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,           /*계약번호            */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE          /*청구순번            */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0109
    WHERE   ORD_NO   = v_Ord_No
    AND     SCHD_SEQ = v_Schd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0109Count;

  /*****************************************************************************
  -- 청구스케줄 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0109 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Demd_Fdt       IN RTSD0109.DEMD_DT%TYPE,        /*청구일자FROM          */
    v_Demd_Tdt       IN RTSD0109.DEMD_DT%TYPE,        /*청구일자TO            */
    v_Sales_Group    IN RTSD0109.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0109.SALES_OFFICE%TYPE,   /*지점                  */
    v_Agency_Cd      IN RTSD0109.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*고객번호              */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*스케줄상태코드        */
    v_Recp_Tp        IN RTSD0109.RECP_TP%TYPE,        /*청구구분              */
    v_RENTAL_GROUP  IN VARCHAR2,
    v_RENTAL_OFFICE IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                    /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP     IN VARCHAR2                     /* 로그인 사용자 그룹 */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
       B.USER_ID,
       B.RENTAL_GROUP,
       B.RENTAL_OFFICE,
       Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
       Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.SCHD_SEQ,                  /*청구순번            */
            A.RECP_TP,                   /*청구구분            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R007', A.RECP_TP) RECP_TP_NM, /*청구구분 */
            A.RECP_NU,                   /*청구회차            */
            A.SCD_STAT,                  /*스케줄상태코드      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S040', A.SCD_STAT) SCD_STAT_NM, /*스케줄상태 */
            A.SALE_AMT,                  /*매출금액(VAT 포함)  */
            A.SALE_NAMT,                 /*원금                */
            A.SALE_VAMT,                 /*부가세              */
            A.RECP_AMT,                  /*수납금액(VAT포함)   */
            A.ARRE_AMT,                  /*연체금액(VAT포함)   */
            A.DEMD_DT,                   /*청구일자            */
            A.ZLSPR,                     /*청구보류            */
            A.RC_DAY,                    /*수납일자            */
            A.RC_YN,                     /*수납여부            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S041', A.RC_YN) RC_NM, /*수납여부 */
            A.TAX_DT,                    /*세금계산서발행일자( */
            A.TAX_NO,                    /*세금계산서번호      */
            A.CANCL_DAY,                 /*중도완납일          */
            A.BEG_DAY,                   /*시작일              */
            A.END_DAY,                   /*종료일              */
            A.ZFB_DAY,                   /*만기계산기준일      */
            A.CUST_NO,                   /*고객번호            */
            A.SALES_GROUP,               /*지사                */
            A.SALES_OFFICE,              /*지점                */
            A.AGENCY_CD,                 /*장착 대리점         */
            A.DELAY_YN,                  /*연체이자적용여부    */
            A.DELAY_RATE,                /*연체 이자율         */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0109 A
    WHERE   A.DEMD_DT  BETWEEN v_Demd_Fdt AND v_Demd_Tdt                                 /*청구일자FROM~TO       */
    AND     A.SALES_GROUP  = DECODE(v_Sales_Group , NULL, A.SALES_GROUP , v_Sales_Group) /*지사                  */
    AND     A.SALES_OFFICE = DECODE(v_Sales_Office, NULL, A.SALES_OFFICE, v_Sales_Office)/*지점                  */
    AND     A.AGENCY_CD    = DECODE(v_Agency_Cd   , NULL, A.AGENCY_CD   , v_Agency_Cd)   /*장착 대리점           */
    AND     A.ORD_NO       = DECODE(v_Ord_No      , NULL, A.ORD_NO      , v_Ord_No)      /*계약번호              */
    AND     A.CUST_NO      = DECODE(v_Cust_No     , NULL, A.CUST_NO     , v_Cust_No)     /*고객번호              */
    AND     A.SCD_STAT     = DECODE(v_Scd_Stat    , NULL, A.SCD_STAT    , v_Scd_Stat)    /*스케줄상태코드        */
    AND     A.RECP_TP      = DECODE(v_Recp_Tp     , NULL, A.RECP_TP     , v_Recp_Tp)     /*청구구분              */
    AND     A.USE_YN = 'Y'
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
            A.AGENCY_CD = B.USER_ID
   ) A
    WHERE 1=1
      AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
      AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
    ;   
    
  END p_sRtsd0109;

  /*****************************************************************************
  -- 청구스케줄 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0109 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTSD0109.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTSD0109.RECP_NU%TYPE,        /*청구회차              */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*스케줄상태코드        */
    v_Sale_Amt       IN RTSD0109.SALE_AMT%TYPE,       /*매출금액(VAT 포함)    */
    v_Sale_Namt      IN RTSD0109.SALE_NAMT%TYPE,      /*원금                  */
    v_Sale_Vamt      IN RTSD0109.SALE_VAMT%TYPE,      /*부가세                */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*수납금액(VAT포함)     */
    v_Arre_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*연체금액(VAT포함)     */
    v_Demd_Dt        IN RTSD0109.DEMD_DT%TYPE,        /*청구일자              */
    v_Zlspr          IN RTSD0109.ZLSPR%TYPE,          /*청구보류              */
    v_Rc_Day         IN RTSD0109.RC_DAY%TYPE,         /*수납일자              */
    v_Rc_Yn          IN RTSD0109.RC_YN%TYPE,          /*수납여부              */
    v_Tax_Dt         IN RTSD0109.TAX_DT%TYPE,         /*세금계산서발행일자(예 */
    v_Tax_No         IN RTSD0109.TAX_NO%TYPE,         /*세금계산서번호        */
    v_Zfb_Day        IN RTSD0109.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*고객번호              */
    v_Sales_Group    IN RTSD0109.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0109.SALES_OFFICE%TYPE,   /*지점                  */
    v_Agency_Cd      IN RTSD0109.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Beg_Day        IN RTSD0109.BEG_DAY%TYPE,        /*시작일                */
    v_End_Day        IN RTSD0109.END_DAY%TYPE,        /*종료일                */
    v_Delay_Yn       IN RTSD0109.DELAY_YN%TYPE,       /*연체이자적용여부      */
    v_Delay_Rate     IN RTSD0109.DELAY_RATE%TYPE,     /*연체 이자율           */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*이체일                */
    v_Use_Yn         IN RTSD0109.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0109 (
            ORD_NO,
            SCHD_SEQ,
            RECP_TP,
            RECP_NU,
            SCD_STAT,
            SALE_AMT,
            SALE_NAMT,
            SALE_VAMT,
            RECP_AMT,
            ARRE_AMT,
            DEMD_DT,
            ZLSPR,
            RC_DAY,
            RC_YN,
            TAX_DT,
            TAX_NO,
            ZFB_DAY,
            CANCL_DAY,
            CUST_NO,
            SALES_GROUP,
            SALES_OFFICE,
            AGENCY_CD,
            BEG_DAY,
            END_DAY,
            DELAY_YN,
            DELAY_RATE,
            PAY_MTHD,
            PAY_DD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Schd_Seq,
            v_Recp_Tp,
            v_Recp_Nu,
            v_Scd_Stat,
            v_Sale_Amt,
            v_Sale_Namt,
            v_Sale_Vamt,
            v_Recp_Amt,
            v_Arre_Amt,
            v_Demd_Dt,
            v_Zlspr,
            v_Rc_Day,
            v_Rc_Yn,
            v_Tax_Dt,
            v_Tax_No,
            v_Zfb_Day,
            v_Cancl_Day,
            v_Cust_No,
            v_Sales_Group,
            v_Sales_Office,
            v_Agency_Cd,
            v_Beg_Day,
            v_End_Day,
            v_Delay_Yn,
            v_Delay_Rate,
            v_Pay_Mthd,
            v_Pay_Dd,
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

  END f_InsertRtsd0109;

  /*****************************************************************************
  -- 청구스케줄 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Recp_Tp        IN RTSD0109.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTSD0109.RECP_NU%TYPE,        /*청구회차              */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*스케줄상태코드        */
    v_Sale_Amt       IN RTSD0109.SALE_AMT%TYPE,       /*매출금액(VAT 포함)    */
    v_Sale_Namt      IN RTSD0109.SALE_NAMT%TYPE,      /*원금                  */
    v_Sale_Vamt      IN RTSD0109.SALE_VAMT%TYPE,      /*부가세                */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*수납금액(VAT포함)     */
    v_Arre_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*연체금액(VAT포함)     */
    v_Demd_Dt        IN RTSD0109.DEMD_DT%TYPE,        /*청구일자              */
    v_Zlspr          IN RTSD0109.ZLSPR%TYPE,          /*청구보류              */
    v_Rc_Day         IN RTSD0109.RC_DAY%TYPE,         /*수납일자              */
    v_Rc_Yn          IN RTSD0109.RC_YN%TYPE,          /*수납여부              */
    v_Tax_Dt         IN RTSD0109.TAX_DT%TYPE,         /*세금계산서발행일자(예 */
    v_Tax_No         IN RTSD0109.TAX_NO%TYPE,         /*세금계산서번호        */
    v_Zfb_Day        IN RTSD0109.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*고객번호              */
    v_Sales_Group    IN RTSD0109.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0109.SALES_OFFICE%TYPE,   /*지점                  */
    v_Agency_Cd      IN RTSD0109.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Beg_Day        IN RTSD0109.BEG_DAY%TYPE,        /*시작일                */
    v_End_Day        IN RTSD0109.END_DAY%TYPE,        /*종료일                */
    v_Delay_Yn       IN RTSD0109.DELAY_YN%TYPE,       /*연체이자적용여부      */
    v_Delay_Rate     IN RTSD0109.DELAY_RATE%TYPE,     /*연체 이자율           */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*이체일                */
    v_Use_Yn         IN RTSD0109.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0109
    SET    RECP_TP      = v_Recp_Tp,
           RECP_NU      = v_Recp_Nu,
           SCD_STAT     = v_Scd_Stat,
           SALE_AMT     = v_Sale_Amt,
           SALE_NAMT    = v_Sale_Namt,
           SALE_VAMT    = v_Sale_Vamt,
           RECP_AMT     = v_Recp_Amt,
           ARRE_AMT     = v_Arre_Amt,
           DEMD_DT      = v_Demd_Dt,
           ZLSPR        = v_Zlspr,
           RC_DAY       = v_Rc_Day,
           RC_YN        = v_Rc_Yn,
           TAX_DT       = v_Tax_Dt,
           TAX_NO       = v_Tax_No,
           ZFB_DAY      = v_Zfb_Day,
           CANCL_DAY    = v_Cancl_Day,
           CUST_NO      = v_Cust_No,
           SALES_GROUP  = v_Sales_Group,
           SALES_OFFICE = v_Sales_Office,
           AGENCY_CD    = v_Agency_Cd,
           BEG_DAY      = v_Beg_Day,
           END_DAY      = v_End_Day,
           DELAY_YN     = v_Delay_Yn,
           DELAY_RATE   = v_Delay_Rate,
           PAY_MTHD     = v_Pay_Mthd,
           PAY_DD       = v_Pay_Dd,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  ORD_NO       = v_Ord_No
    AND    SCHD_SEQ     = v_Schd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0109;

  /*****************************************************************************
  -- 청구스케줄 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0109 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0109
    SET    USE_YN   = 'N',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ORD_NO   = v_Ord_No
    AND    SCHD_SEQ = v_Schd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0109;

  /*****************************************************************************
  -- 청구스케줄 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0109 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN OUT RTSD0109.SCHD_SEQ%TYPE,   /*청구순번              */
    v_Recp_Tp        IN RTSD0109.RECP_TP%TYPE,        /*청구구분              */
    v_Recp_Nu        IN RTSD0109.RECP_NU%TYPE,        /*청구회차              */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*스케줄상태코드        */
    v_Sale_Amt       IN RTSD0109.SALE_AMT%TYPE,       /*매출금액(VAT 포함)    */
    v_Sale_Namt      IN RTSD0109.SALE_NAMT%TYPE,      /*원금                  */
    v_Sale_Vamt      IN RTSD0109.SALE_VAMT%TYPE,      /*부가세                */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*수납금액(VAT포함)     */
    v_Arre_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*연체금액(VAT포함)     */
    v_Demd_Dt        IN RTSD0109.DEMD_DT%TYPE,        /*청구일자              */
    v_Zlspr          IN RTSD0109.ZLSPR%TYPE,          /*청구보류              */
    v_Rc_Day         IN RTSD0109.RC_DAY%TYPE,         /*수납일자              */
    v_Rc_Yn          IN RTSD0109.RC_YN%TYPE,          /*수납여부              */
    v_Tax_Dt         IN RTSD0109.TAX_DT%TYPE,         /*세금계산서발행일자(예 */
    v_Tax_No         IN RTSD0109.TAX_NO%TYPE,         /*세금계산서번호        */
    v_Zfb_Day        IN RTSD0109.ZFB_DAY%TYPE,        /*만기계산기준일        */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*고객번호              */
    v_Sales_Group    IN RTSD0109.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0109.SALES_OFFICE%TYPE,   /*지점                  */
    v_Agency_Cd      IN RTSD0109.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Beg_Day        IN RTSD0109.BEG_DAY%TYPE,        /*시작일                */
    v_End_Day        IN RTSD0109.END_DAY%TYPE,        /*종료일                */
    v_Delay_Yn       IN RTSD0109.DELAY_YN%TYPE,       /*연체이자적용여부      */
    v_Delay_Rate     IN RTSD0109.DELAY_RATE%TYPE,     /*연체 이자율           */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*이체일                */
    v_Use_Yn         IN RTSD0109.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Recp_Tp) IS NULL) OR (0 = Pkg_rtcm0051.f_sRtcm0051Count('R007',v_Recp_Tp)) THEN
        v_Return_Message := '청구구분('||v_Recp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recp_Nu) IS NULL THEN
        v_Return_Message := '청구회차('||v_Recp_Nu||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Scd_Stat) IS NULL) OR (0 = Pkg_rtcm0051.f_sRtcm0051Count('S040',v_Scd_Stat)) THEN
        v_Return_Message := '스케줄상태코드('||v_Scd_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Sale_Amt) IS NULL THEN
        v_Return_Message := '매출금액(VAT 포함)('||v_Sale_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Sale_Namt) IS NULL THEN
        v_Return_Message := '원금('||v_Sale_Namt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Sale_Vamt) IS NULL THEN
        v_Return_Message := '부가세('||v_Sale_Vamt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recp_Amt) IS NULL THEN
        v_Return_Message := '수납금액(VAT포함)('||v_Recp_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Arre_Amt) IS NULL THEN
        v_Return_Message := '연체금액(VAT포함)('||v_Arre_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Demd_Dt) THEN
        v_Return_Message := '청구일자('||v_Demd_Dt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Zlspr) IS NULL THEN
        v_Return_Message := '청구보류('||v_Zlspr||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rc_Yn) IS NULL THEN
        v_Return_Message := '수납여부('||v_Rc_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Tax_Dt) THEN
        v_Return_Message := '세금계산서발행일자('||v_Tax_Dt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Zfb_Day) THEN
        v_Return_Message := '만기계산기준일('||v_Zfb_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Sales_Group) IS NULL THEN
        v_Return_Message := '지사('||v_Sales_Group||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Sales_Office) IS NULL THEN
        v_Return_Message := '지점('||v_Sales_Office||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Agency_Cd) IS NULL) OR (0 = Pkg_Rtsd0007.f_sRtsd0007Count(v_Agency_Cd)) THEN
        v_Return_Message := '장착 대리점('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pay_Mthd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R004', v_Pay_Mthd)) THEN
        v_Return_Message := '결제구분('||v_Pay_Mthd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Pay_Dd) IS NULL THEN
        v_Return_Message := '이체일('||v_Pay_Dd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Use_Yn) IS NULL) OR (TRIM(v_Use_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtsd0109Count(v_Ord_No, v_Schd_Seq) THEN
            v_Return_Message := '해당 오더번호-SEQ('||v_Ord_No||'-'||v_Schd_Seq||')로 이미 등록된 데이터가 존재하므로 신규등록 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        v_Schd_Seq := f_sRtsd0109SchdSeq(v_Ord_No);

        IF 0 != f_InsertRtsd0109(v_Ord_No, v_Schd_Seq, v_Recp_Tp, v_Recp_Nu,
                                 v_Scd_Stat, v_Sale_Amt, v_Sale_Namt, v_Sale_Vamt,
                                 v_Recp_Amt, v_Arre_Amt, v_Demd_Dt, v_Zlspr,
                                 v_Rc_Day, v_Rc_Yn, v_Tax_Dt, v_Tax_No,
                                 v_Zfb_Day, v_Cancl_Day, v_Cust_No, v_Sales_Group,
                                 v_Sales_Office, v_Agency_Cd, v_Beg_Day, v_End_Day,
                                 v_Delay_Yn, v_Delay_Rate, v_Pay_Mthd,
                                 v_Pay_Dd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '청구스케줄 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;

    ELSE

        IF 0 = f_sRtsd0109Count(v_Ord_No, v_Schd_Seq) THEN
            v_Return_Message := '해당 오더번호-SEQ('||v_Ord_No||'-'||v_Schd_Seq||')로 등록된 데이터가 존재하지 않음으로 수정/삭제 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0109(v_Ord_No, v_Schd_Seq, v_Recp_Tp, v_Recp_Nu,
                                     v_Scd_Stat, v_Sale_Amt, v_Sale_Namt, v_Sale_Vamt,
                                     v_Recp_Amt, v_Arre_Amt, v_Demd_Dt, v_Zlspr,
                                     v_Rc_Day, v_Rc_Yn, v_Tax_Dt, v_Tax_No,
                                     v_Zfb_Day, v_Cancl_Day, v_Cust_No, v_Sales_Group,
                                     v_Sales_Office, v_Agency_Cd, v_Beg_Day, v_End_Day,
                                     v_Delay_Yn, v_Delay_Rate, v_Pay_Mthd, v_Pay_Dd,
                                     v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '청구스케줄 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0109(v_Ord_No, v_Schd_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '청구스케줄 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_IUDRtsd0109(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_IUDRtsd0109(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0109;

  /*****************************************************************************
  -- 청구스케줄 Count - 청구순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0109SchdSeq(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_Schd_Seq RTSD0109.SCHD_SEQ%TYPE DEFAULT NULL;     /*청구순번            */
  BEGIN

    SELECT  NVL((SELECT  MAX(SCHD_SEQ)
                 FROM    RTSD0109
                 WHERE   ORD_NO = v_Ord_No)+ 1, 1)
    INTO    v_Schd_Seq
    FROM    DUAL;

    RETURN v_Schd_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0109SchdSeq;


  /*****************************************************************************
  -- 청구스케줄 관리 - 계약번호 기준 청구스케쥴 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109ScheduleReal (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계약번호,  등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 예약번호, 등록비(0) 기준 등록된 정보가 존재하면 오류 처리
    IF 0 != f_sRtsd0109Count(v_Ord_No, 0) THEN

        v_Return_Message := '해당 계약번호('||v_Ord_No||')로 이미 스케쥴이 등록된 상태이므로 처리불가.!';
        RAISE e_Error;

    END IF;

    INSERT  INTO RTSD0109 (
            ORD_NO,                                   /*계약번호            */
            SCHD_SEQ,                                 /*청구순번            */
            RECP_TP,                                  /*청구구분            */
            RECP_NU,                                  /*청구회차            */
            SCD_STAT,                                 /*스케줄상태코드      */
            SALE_AMT,                                 /*매출금액(VAT 포함)  */
            SALE_NAMT,                                /*원금                */
            SALE_VAMT,                                /*부가세              */
            RECP_AMT,                                 /*수납금액(VAT포함)   */
            ARRE_AMT,                                 /*연체금액(VAT포함)   */
            DEMD_DT,                                  /*청구일자            */
            ZLSPR,                                    /*청구보류            */
            RC_DAY,                                   /*수납일자            */
            RC_YN,                                    /*수납여부            */
            TAX_DT,                                   /*세금계산서발행일자  */
            TAX_NO,                                   /*세금계산서번호      */
            ZFB_DAY,                                  /*만기계산기준일      */
            CANCL_DAY,                                /*중도완납일          */
            CUST_NO,                                  /*고객번호            */
            SALES_GROUP,                              /*지사                */
            SALES_OFFICE,                             /*지점                */
            AGENCY_CD,                                /*장착 대리점         */
            BEG_DAY,                                  /*시작일              */
            END_DAY,                                  /*종료일              */
            DELAY_YN,                                 /*연체이자적용여부    */
            DELAY_RATE,                               /*연체 이자율         */
            PAY_MTHD,                                 /*결제구분            */
            PAY_DD,                                   /*이체일              */
            USE_YN,                                   /*사용여부            */
            REG_ID,                                   /*등록자 ID           */
            REG_DT,                                   /*등록일              */
            CHG_ID,                                   /*변경자 ID           */
            CHG_DT                                    /*변경일              */
            )
    SELECT  A.ORD_NO,                                 /*계약번호            */
            A.SCHD_SEQ,                               /*청구순번            */
            A.RECP_TP,                                /*청구구분            */
            A.RECP_NU,                                /*청구회차            */
            A.SCD_STAT,                               /*스케줄상태코드      */
            A.SALE_AMT,                               /*매출금액(VAT 포함)  */
            A.SALE_NAMT,                              /*원금                */
            A.SALE_VAMT,                              /*부가세              */
            A.RECP_AMT,                               /*수납금액(VAT포함)   */
            A.ARRE_AMT,                               /*연체금액(VAT포함)   */
            TO_CHAR(A.DEMD_DT,'YYYYMMDD') DEMD_DT,    /*청구일자            */
            A.ZLSPR,                                  /*청구보류            */
            A.RC_DAY,                                 /*수납일자            */
            A.RC_YN,                                  /*수납여부            */
            TO_CHAR(A.TAX_DT,'YYYYMMDD') TAX_DT,      /*세금계산서발행일자  */
            A.TAX_NO,                                 /*세금계산서번호      */
            TO_CHAR(A.ZFB_DAY,'YYYYMMDD') ZFB_DAY,    /*만기계산기준일      */
            A.CANCL_DAY,                              /*중도완납일          */
            A.CUST_NO,                                /*고객번호            */
            A.SALES_GROUP,                            /*지사                */
            A.SALES_OFFICE,                           /*지점                */
            A.AGENCY_CD,                              /*장착 대리점         */
            TO_CHAR(A.BEG_DAY,'YYYYMMDD') BEG_DAY,    /*시작일              */
            TO_CHAR(A.END_DAY,'YYYYMMDD') END_DAY,    /*종료일              */
            A.DELAY_YN,                               /*연체이자적용여부    */
            A.DELAY_RATE,                             /*연체 이자율         */
            A.PAY_MTHD,                               /*결제구분            */
            A.PAY_DD,                                 /*이체일              */
            'Y' USE_YN,                               /*사용여부            */
            v_Reg_Id,                                 /*등록자 ID           */
            SYSDATE,                                  /*등록일              */
            v_Reg_Id,                                 /*변경자 ID           */
            SYSDATE                                   /*변경일              */
    FROM    (
            SELECT  A.ORD_NO,                                                 -- 계약번호           : INPUT 값
                    A.SCHD_SEQ,                                               -- 청구순번           : 순차적으로 증가
                    A.RECP_TP,                                                -- 청구구분           : 등록비 -> '01', 렌탈료 ->  '11'
                    A.RECP_NU,                                                -- 청구회차           : 등록비는 1회차, 렌탈료는 1회차부터 순차적으로 증가
                    'S' SCD_STAT,                                             -- 스케줄상태코드     : 'S'
                    CASE WHEN A.EXEMP_AMT = 0 THEN A.SALE_AMT
                    ELSE CASE WHEN A.RECP_NU = (SELECT TT.EXM_MNT FROM RTSD0044 TT WHERE TT.EXM_MNT = A.RECP_NU AND TT.SALE_CD = A.SALE_CD) THEN 0
                         ELSE A.SALE_AMT
                         END
                    END SALE_AMT,
--                    A.SALE_AMT,                                               -- 매출금액(VAT 포함) : 등록비 -> RTSD0108-REGI_AMT, 렌탈료 ->  MON_AMT
                    CASE WHEN A.EXEMP_AMT = 0 THEN ROUND(A.SALE_AMT / 1.1, 0) 
                    ELSE CASE WHEN A.RECP_NU = (SELECT TT.EXM_MNT FROM RTSD0044 TT WHERE TT.EXM_MNT = A.RECP_NU AND TT.SALE_CD = A.SALE_CD) THEN 0
                         ELSE ROUND(A.SALE_AMT / 1.1, 0)
                         END
                    END SALE_NAMT,                     -- 원금               : SALE_AMT / 1.1 소수점 1자리에서 반올림
                    CASE WHEN A.EXEMP_AMT = 0 THEN A.SALE_AMT - ROUND(A.SALE_AMT / 1.1, 0) 
                    ELSE CASE WHEN A.RECP_NU = (SELECT TT.EXM_MNT FROM RTSD0044 TT WHERE TT.EXM_MNT = A.RECP_NU AND TT.SALE_CD = A.SALE_CD) THEN 0
                         ELSE A.SALE_AMT - ROUND(A.SALE_AMT / 1.1, 0) 
                         END
                    END SALE_VAMT,        -- 부가세             : SALE_AMT - SALE_NAMT
                    '0' RECP_AMT,                                             -- 수납금액(VAT포함)  : '0'
                    CASE WHEN A.EXEMP_AMT = 0 THEN A.SALE_AMT 
                    ELSE CASE WHEN A.RECP_NU = (SELECT TT.EXM_MNT FROM RTSD0044 TT WHERE TT.EXM_MNT = A.RECP_NU AND TT.SALE_CD = A.SALE_CD) THEN 0
                         ELSE A.SALE_AMT 
                         END
                    END ARRE_AMT,                                      -- 연체금액(VAT포함)  : 매출금액(VAT 포함)'
                    ADD_MONTHS(TO_DATE(A.PROC_DAY), A.DEMD_NO) DEMD_DT,       -- 청구일자           : 장착일자와 동일
                    'N' ZLSPR,                                                -- 청구보류           : 'N'
                    NULL RC_DAY,                                              -- 수납일자           : NULL
                    'N' RC_YN,                                                -- 수납여부           : 'N'
                    ADD_MONTHS(TO_DATE(A.PROC_DAY), A.DEMD_NO) TAX_DT,        -- 세금계산서발행일자 : 청구일자와 동일
                    NULL TAX_NO,                                              -- 세금계산서번호     : NULL
                    ADD_MONTHS(TO_DATE(A.DEMD_DT), A.DEMD_NO) ZFB_DAY,        -- 만기계산기준일     : 로직 : 장착일자기준으로 이체일이 영업일 D+10이내이면 당월 아니면 익월
                    NULL CANCL_DAY,                                           -- 중도완납일         : NULL
                    A.CUST_NO,                                                -- 고객번호           : RTSD0108-CUST_NO
                    A.SALES_GROUP,                                            -- 지사               : RTSD0108-SALES_GROUP
                    A.SALES_OFFICE,                                           -- 지점               : RTSD0108-SALES_OFFICE
                    A.AGENCY_CD,                                              -- 장착 대리점        : RTSD0108-AGENCY_CD
                    A.BEG_DAY,                                                -- 시작일             : 로직 :설치일부터 매월 한달씩 증가
                    A.END_DAY,                                                -- 종료일             : 로직 : 시작일로부터 M+1
                    'N' DELAY_YN,                                             -- 연체이자적용여부   : N'
                    '0' DELAY_RATE,                                           -- 연체 이자율        : '*.*'
                    A.NOTAMT,                                                 -- 미도래원금(VAT포함): 계산 : 월렌탈료 * 개월수에서 매달 렌탈료 만큼 차감
                    A.PAY_MTHD,                                               -- 결제구분
                    A.PAY_DD                                                  -- 이체일
            FROM    (
                    -- 등록비 SET
                    SELECT  ROWNUM -1 SCHD_SEQ,
                            ROWNUM RECP_NU,
                            ROWNUM -1 DEMD_NO,
                            '01' RECP_TP,
                            A.REGI_AMT SALE_AMT,
                            0 NOTAMT,
                            ADD_MONTHS(TO_DATE(A.PROC_DAY), ROWNUM-1) BEG_DAY,
                            ADD_MONTHS(TO_DATE(A.PROC_DAY), A.PERIOD_CD)-1 END_DAY,
                            A.*
                    FROM    (
                            SELECT  A.ORD_NO,                    /*주문번호            */
                                    A.ORD_ID,                    /*주문구분            */
                                    A.REGI_AMT,                  /*렌탈등록비          */
                                    A.MON_AMT,                   /*월렌탈료            */
                                    A.CUST_NO,                   /*고객번호            */
                                    A.SALES_GROUP,               /*지점                */
                                    A.SALES_OFFICE,              /*지사                */
                                    A.AGENCY_CD,                 /*장착 대리점         */
                                    A.PROC_DAY,                  /*장착일자            */
                                    A.PAY_DD,                    /*이체일              */
                                    A.PERIOD_CD,                 /*기간코드            */
                                    A.PAY_MTHD,                  /*결제구분            */
                                    Pkg_Rtsd0109.f_sRtsd0109DemdDt(1,A.PROC_DAY,A.PAY_DD) DEMD_DT, /*청구일 */
                                    Pkg_Rtcm0060.f_sRtcm0060OffDayCount(A.PROC_DAY, SUBSTR(A.PROC_DAY,1,6)||A.PAY_DD) OFF_DAY, /*영업일수*/
                                    0 AS EXEMP_AMT,
                                    '' AS SALE_CD
                            FROM    RTSD0108 A
                            WHERE   A.ORD_NO = v_Ord_No
                              AND   REGI_AMT <> 0
                            ) A
                    UNION  ALL
                    -- 렌탈료 SET
                    SELECT  ROWNUM SCHD_SEQ,
                            ROWNUM RECP_NU,
                            ROWNUM -1 DEMD_NO,                   /*청구번호 0~ 개월수  */
                            '11' RECP_TP,
                            A.MON_AMT SALE_AMT,
                            A.MON_AMT * (A.PERIOD_CD-(ROWNUM -1)) NOTAMT,
                            ADD_MONTHS(TO_DATE(A.PROC_DAY), ROWNUM-1) BEG_DAY,
                            ADD_MONTHS(TO_DATE(A.PROC_DAY), ROWNUM)-1 END_DAY,
                            A.*
                    FROM    (
                            SELECT  A.ORD_NO,                    /*주문번호            */
                                    A.ORD_ID,                    /*주문구분            */
                                    A.REGI_AMT,                  /*렌탈등록비          */
                                    A.MON_AMT,                   /*월렌탈료            */
                                    A.CUST_NO,                   /*고객번호            */
                                    A.SALES_GROUP,               /*지점                */
                                    A.SALES_OFFICE,              /*지사                */
                                    A.AGENCY_CD,                 /*장착 대리점         */
                                    A.PROC_DAY,                  /*장착일자            */
                                    A.PAY_DD,                    /*이체일              */
                                    A.PERIOD_CD,                 /*기간코드            */
                                    A.PAY_MTHD,                  /*결제구분            */
                                    Pkg_Rtsd0109.f_sRtsd0109DemdDt(1,A.PROC_DAY,A.PAY_DD) DEMD_DT, /*청구일 */
                                    Pkg_Rtcm0060.f_sRtcm0060OffDayCount(A.PROC_DAY, SUBSTR(A.PROC_DAY,1,6)||A.PAY_DD) OFF_DAY, /*영업일수*/
                                    (SELECT 
                                      (SELECT COUNT(*) FROM RTSD0044 DN WHERE DN.SALE_CD = M.SALE_CD) 
                                     FROM RTSD0104 M
                                     WHERE M.ORD_NO = A.ORD_NO) AS EXEMP_AMT,
                                    (SELECT SS.SALE_CD FROM RTSD0104 SS WHERE SS.ORD_NO = A.ORD_NO) AS SALE_CD 
                            FROM    RTSD0108 A
                            WHERE   A.ORD_NO = v_Ord_No
                              AND   A.ORD_ID != '03'
                            ) A
                    CONNECT BY LEVEL <= A.PERIOD_CD
                    ) A
            ) A;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.InsertRtsd0109ScheduleReal(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.InsertRtsd0109ScheduleReal(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0109ScheduleReal;


  /*****************************************************************************
  -- 멤버쉽 청구스케줄 관리 - 계약번호 기준 청구스케쥴 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109MemberSchReal (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계약번호,  등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 예약번호, 등록비(0) 기준 등록된 정보가 존재하면 오류 처리
    IF 0 != f_sRtsd0109Count(v_Ord_No, 0) THEN

        v_Return_Message := '해당 계약번호('||v_Ord_No||')로 이미 스케쥴이 등록된 상태이므로 처리불가.!';
        RAISE e_Error;

    END IF;

    INSERT  INTO RTSD0109 (
            ORD_NO,                                   /*계약번호            */
            SCHD_SEQ,                                 /*청구순번            */
            RECP_TP,                                  /*청구구분            */
            RECP_NU,                                  /*청구회차            */
            SCD_STAT,                                 /*스케줄상태코드      */
            SALE_AMT,                                 /*매출금액(VAT 포함)  */
            SALE_NAMT,                                /*원금                */
            SALE_VAMT,                                /*부가세              */
            RECP_AMT,                                 /*수납금액(VAT포함)   */
            ARRE_AMT,                                 /*연체금액(VAT포함)   */
            DEMD_DT,                                  /*청구일자            */
            ZLSPR,                                    /*청구보류            */
            RC_DAY,                                   /*수납일자            */
            RC_YN,                                    /*수납여부            */
            TAX_DT,                                   /*세금계산서발행일자  */
            TAX_NO,                                   /*세금계산서번호      */
            ZFB_DAY,                                  /*만기계산기준일      */
            CANCL_DAY,                                /*중도완납일          */
            CUST_NO,                                  /*고객번호            */
            SALES_GROUP,                              /*지사                */
            SALES_OFFICE,                             /*지점                */
            AGENCY_CD,                                /*장착 대리점         */
            BEG_DAY,                                  /*시작일              */
            END_DAY,                                  /*종료일              */
            DELAY_YN,                                 /*연체이자적용여부    */
            DELAY_RATE,                               /*연체 이자율         */
            PAY_MTHD,                                 /*결제구분            */
            PAY_DD,                                   /*이체일              */
            USE_YN,                                   /*사용여부            */
            REG_ID,                                   /*등록자 ID           */
            REG_DT,                                   /*등록일              */
            CHG_ID,                                   /*변경자 ID           */
            CHG_DT                                    /*변경일              */
            )
    SELECT  A.ORD_NO,                                 /*계약번호            */
            A.SCHD_SEQ,                               /*청구순번            */
            A.RECP_TP,                                /*청구구분            */
            A.RECP_NU,                                /*청구회차            */
            A.SCD_STAT,                               /*스케줄상태코드      */
            A.SALE_AMT,                               /*매출금액(VAT 포함)  */
            A.SALE_NAMT,                              /*원금                */
            A.SALE_VAMT,                              /*부가세              */
            A.RECP_AMT,                               /*수납금액(VAT포함)   */
            A.ARRE_AMT,                               /*연체금액(VAT포함)   */
            TO_CHAR(A.DEMD_DT,'YYYYMMDD') DEMD_DT,    /*청구일자            */
            A.ZLSPR,                                  /*청구보류            */
            A.RC_DAY,                                 /*수납일자            */
            A.RC_YN,                                  /*수납여부            */
            TO_CHAR(A.TAX_DT,'YYYYMMDD') TAX_DT,      /*세금계산서발행일자  */
            A.TAX_NO,                                 /*세금계산서번호      */
            TO_CHAR(A.ZFB_DAY,'YYYYMMDD') ZFB_DAY,    /*만기계산기준일      */
            A.CANCL_DAY,                              /*중도완납일          */
            A.CUST_NO,                                /*고객번호            */
            A.SALES_GROUP,                            /*지사                */
            A.SALES_OFFICE,                           /*지점                */
            A.AGENCY_CD,                              /*장착 대리점         */
            TO_CHAR(A.BEG_DAY,'YYYYMMDD') BEG_DAY,    /*시작일              */
            TO_CHAR(A.END_DAY,'YYYYMMDD') END_DAY,    /*종료일              */
            A.DELAY_YN,                               /*연체이자적용여부    */
            A.DELAY_RATE,                             /*연체 이자율         */
            A.PAY_MTHD,                               /*결제구분            */
            A.PAY_DD,                                 /*이체일              */
            'Y' USE_YN,                               /*사용여부            */
            v_Reg_Id,                                 /*등록자 ID           */
            SYSDATE,                                  /*등록일              */
            v_Reg_Id,                                 /*변경자 ID           */
            SYSDATE                                   /*변경일              */
    FROM    (
            SELECT  A.ORD_NO,                                                 -- 계약번호           : INPUT 값
                    A.SCHD_SEQ,                                               -- 청구순번           : 순차적으로 증가
                    A.RECP_TP,                                                -- 청구구분           : 등록비 -> '01', 렌탈료 ->  '11'
                    A.RECP_NU,                                                -- 청구회차           : 등록비는 1회차, 렌탈료는 1회차부터 순차적으로 증가
                    'S' SCD_STAT,                                             -- 스케줄상태코드     : 'S'
                    A.SALE_AMT,                                               -- 매출금액(VAT 포함) : 등록비 -> RTSD0108-REGI_AMT, 렌탈료 ->  MON_AMT
                    ROUND(A.SALE_AMT / 1.1, 0) SALE_NAMT,                     -- 원금               : SALE_AMT / 1.1 소수점 1자리에서 반올림
                    A.SALE_AMT - ROUND(A.SALE_AMT / 1.1, 0) SALE_VAMT,        -- 부가세             : SALE_AMT - SALE_NAMT
                    '0' RECP_AMT,                                             -- 수납금액(VAT포함)  : '0'
                    A.SALE_AMT ARRE_AMT,                                      -- 연체금액(VAT포함)  : 매출금액(VAT 포함)'
                    ADD_MONTHS(TO_DATE(A.PROC_DAY), A.DEMD_NO) DEMD_DT,       -- 청구일자           : 장착일자와 동일
                    'N' ZLSPR,                                                -- 청구보류           : 'N'
                    NULL RC_DAY,                                              -- 수납일자           : NULL
                    'N' RC_YN,                                                -- 수납여부           : 'N'
                    ADD_MONTHS(TO_DATE(A.PROC_DAY), A.DEMD_NO) TAX_DT,        -- 세금계산서발행일자 : 청구일자와 동일
                    NULL TAX_NO,                                              -- 세금계산서번호     : NULL
                    ADD_MONTHS(TO_DATE(A.DEMD_DT), A.DEMD_NO) ZFB_DAY,        -- 만기계산기준일     : 로직 : 장착일자기준으로 이체일이 영업일 D+10이내이면 당월 아니면 익월
                    NULL CANCL_DAY,                                           -- 중도완납일         : NULL
                    A.CUST_NO,                                                -- 고객번호           : RTSD0108-CUST_NO
                    A.SALES_GROUP,                                            -- 지사               : RTSD0108-SALES_GROUP
                    A.SALES_OFFICE,                                           -- 지점               : RTSD0108-SALES_OFFICE
                    A.AGENCY_CD,                                              -- 장착 대리점        : RTSD0108-AGENCY_CD
                    A.BEG_DAY,                                                -- 시작일             : 로직 :설치일부터 매월 한달씩 증가
                    A.END_DAY,                                                -- 종료일             : 로직 : 시작일로부터 M+1
                    'N' DELAY_YN,                                             -- 연체이자적용여부   : N'
                    '0' DELAY_RATE,                                           -- 연체 이자율        : '*.*'
                    A.NOTAMT,                                                 -- 미도래원금(VAT포함): 계산 : 월렌탈료 * 개월수에서 매달 렌탈료 만큼 차감
                    A.PAY_MTHD,                                               -- 결제구분
                    A.PAY_DD                                                  -- 이체일
            FROM    (
                    -- 렌탈료 SET
                    SELECT  ROWNUM SCHD_SEQ,
                            ROWNUM RECP_NU,
                            ROWNUM -1 DEMD_NO,                   /*청구번호 0~ 개월수  */
                            '11' RECP_TP,
                            A.MON_AMT SALE_AMT,
                            A.MON_AMT * (A.PERIOD_CD-(ROWNUM -1)) NOTAMT,
                            ADD_MONTHS(TO_DATE(A.PROC_DAY), ROWNUM-1) BEG_DAY,
                            ADD_MONTHS(TO_DATE(A.PROC_DAY), ROWNUM)-1 END_DAY,
                            A.*
                    FROM    (
                            SELECT  A.ORD_NO,                    /*주문번호            */
                                    A.REGI_AMT,                  /*렌탈등록비          */
                                    A.MON_AMT,                   /*월렌탈료            */
                                    A.CUST_NO,                   /*고객번호            */
                                    A.SALES_GROUP,               /*지점                */
                                    A.SALES_OFFICE,              /*지사                */
                                    A.AGENCY_CD,                 /*장착 대리점         */
                                    NVL(TO_CHAR(SYSDATE, 'YYYYMMDD'),A.PROC_DAY) AS PROC_DAY,                  /*장착일자            */
                                    A.PAY_DD,                    /*이체일              */
                                    A.PERIOD_CD,                 /*기간코드            */
                                    A.PAY_MTHD,                  /*결제구분            */
                                    Pkg_Rtsd0109.f_sRtsd0109DemdDt(1,NVL(TO_CHAR(SYSDATE, 'YYYYMMDD'),A.PROC_DAY),A.PAY_DD) DEMD_DT, /*청구일 */
                                    Pkg_Rtcm0060.f_sRtcm0060OffDayCount(A.PROC_DAY, SUBSTR(A.PROC_DAY,1,6)||A.PAY_DD) OFF_DAY /*영업일수*/
                            FROM    RTSD0104 A
                            WHERE   A.ORD_NO = v_Ord_No
                            ) A
                    CONNECT BY LEVEL <= A.PERIOD_CD
                    ) A
            ) A;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.InsertRtsd0109ScheduleReal(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.InsertRtsd0109ScheduleReal(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0109MemberSchReal;

  /*****************************************************************************
  -- 청구스케줄 Count - 해당 계약번호에 대하여 스케줄 정보가 존재하는지 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0109UpdateCount(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*고객번호              */
    v_Chg_Day        IN VARCHAR                       /*변경일자              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(ORD_NO)
    INTO    v_curr_cunt
    FROM    RTSD0109
    WHERE   ORD_NO  = v_Ord_No
    AND     CUST_NO = v_Cust_No
    AND     ZFB_DAY >= SUBSTR(v_Chg_Day,1,6)||'01' -- 현재월(변경일자기준) 1일 이후 내역
    AND     USE_YN  = 'Y';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0109UpdateCount;

  /*****************************************************************************
  -- 청구스케줄 Update - 결제방법, 결제일, 만기계산기준일 변경
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109ZfbDay (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*고객번호              */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*이체일                */
    v_Chg_Day        IN VARCHAR,                      /*변경일자              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0109
    SET    ZFB_DAY   = SUBSTR(ZFB_DAY,1,6)||v_Pay_Dd, -- 만기계산기준일 : 만기계산기준일(년월)||이체일
           PAY_MTHD  = v_Pay_Mthd,
           PAY_DD    = v_Pay_Dd,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ORD_NO    = v_Ord_No
    AND    CUST_NO   = v_Cust_No
    AND    ZFB_DAY   >= SUBSTR(v_Chg_Day,1,6)||'01' -- 현재월(변경일자기준) 1일 이후 내역
    AND    USE_YN    = 'Y';

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0109ZfbDay;

  /*****************************************************************************
  -- 청구스케줄 관리 - 결제정보 변경 또는 삭제시 해당 스케줄 내역(결제방법, 결제일, 만기계산기준일) 업데이트 한다.
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0109 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*고객번호              */
    v_Pay_Mthd       IN RTSD0109.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0109.PAY_DD%TYPE,         /*이체일                */
    v_Chg_Day        IN VARCHAR,                      /*변경일자              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pay_Mthd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R004', v_Pay_Mthd)) THEN
        v_Return_Message := '결제구분('||v_Pay_Mthd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Chg_Day) IS NULL THEN
        v_Return_Message := '이체일('||v_Chg_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Chg_Day) THEN
        v_Return_Message := '변경일자('||v_Chg_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 해당 계약번호에 대하여 스케줄 정보가 존재하는지 체크
    IF 0 = f_sRtsd0109UpdateCount(v_Ord_No, v_Cust_No, v_Chg_Day) THEN
        v_Return_Message := ' 해당 계약번호('||v_Ord_No||'-'||v_Cust_No||'-'||v_Chg_Day||')에 대하여 스케줄 정보가 존재하지 않음으로 처리가 불가 합니다!';
        RAISE e_Error;

    ELSE

        IF 0 != f_UpdateRtsd0109ZfbDay(v_Ord_No, v_Cust_No, v_Pay_Mthd, v_Pay_Dd,
                                       v_Chg_Day, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '만기계산기준일 업데이트 실패!!!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_UpdateRtsd0109(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_UpdateRtsd0109(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtsd0109;


  /*****************************************************************************
  -- 청구스케줄 Select - 스케줄 조회(계약별)    청구 스케줄 조회(계약별) - 상세    SD-020303    SD00061
  *****************************************************************************/
  PROCEDURE p_sRtsd0109DetailList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE          /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.SCHD_SEQ,                  /*청구순번            */
            A.RECP_TP,                   /*청구구분            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R007', A.RECP_TP) RECP_TP_NM, /*청구구분 */
            A.RECP_NU,                   /*청구회차            */
            A.SCD_STAT,                  /*스케줄상태코드      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S040', A.SCD_STAT) SCD_STAT_NM, /*스케줄상태 */
            A.SALE_AMT,                  /*매출금액(VAT 포함)  */
            A.SALE_NAMT,                 /*원금                */
            A.SALE_VAMT,                 /*부가세              */
            A.RECP_AMT,                  /*수납금액(VAT포함)   */
            A.ARRE_AMT,                  /*연체금액(VAT포함)   */
            A.DEMD_DT,                   /*청구일자            */
            A.ZLSPR,                     /*청구보류            */
            A.RC_DAY,                    /*수납일자            */
            A.RC_YN,                     /*수납여부            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S041', A.RC_YN) RC_NM, /*수납여부 */
            A.TAX_DT,                    /*세금계산서발행일자( */
            A.TAX_NO,                    /*세금계산서번호      */
            A.CANCL_DAY,                 /*중도완납일          */
            A.BEG_DAY,                   /*시작일              */
            A.END_DAY,                   /*종료일              */
            A.ZFB_DAY,                   /*만기계산기준일      */
            /***********************************부가정보*************************************/
            A.CUST_NO,                   /*고객번호            */
            A.SALES_GROUP,               /*지사                */
            A.SALES_OFFICE,              /*지점                */
            A.AGENCY_CD,                 /*장착 대리점         */
            A.DELAY_YN,                  /*연체이자적용여부    */
            A.DELAY_RATE,                /*연체 이자율         */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0109 A
    WHERE   A.ORD_NO = v_Ord_No /*계약번호              */
    AND     A.USE_YN = 'Y';

  END p_sRtsd0109DetailList;


  /*****************************************************************************
  -- 청구스케줄 - 청구일자 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0109DemdDt(
    v_Recp_Nu        IN RTSD0109.RECP_NU%TYPE,        /*청구회차              */
    v_Proc_Day       IN RTSD0104.PROC_DAY%TYPE,       /*장착일자              */
    v_Pay_Dd         IN RTSD0104.PAY_DD%TYPE          /*이체일                */
    ) RETURN VARCHAR IS

    v_Demd_Dt   RTSD0109.DEMD_DT%TYPE DEFAULT NULL; /*청구일자              */
    v_Pay_Day   VARCHAR(8) DEFAULT NULL;
  BEGIN


    --이체일이 1자리로 들어 온 경우 2자리로 설정
    v_Pay_Day := LPAD(v_Pay_Dd,2,'0');

    -- 장착일 기준 무조건 익월
    v_Demd_Dt := TO_CHAR(ADD_MONTHS(TO_DATE(v_Proc_Day),v_Recp_Nu), 'YYYYMM')||v_Pay_Day;

    IF v_Proc_Day >= SUBSTR(v_Proc_Day,1,6)||v_Pay_Day THEN
        v_Demd_Dt := TO_CHAR(ADD_MONTHS(TO_DATE(v_Proc_Day),1), 'YYYYMM')||v_Pay_Day;
    END IF;

    /*
    -- 장착일이 이체일보다 크면 무조건 익월
    IF v_Proc_Day > SUBSTR(v_Proc_Day,1,6)||v_Pay_Day THEN
        v_Demd_Dt := TO_CHAR(ADD_MONTHS(TO_DATE(v_Proc_Day),v_Recp_Nu), 'YYYYMM')||v_Pay_Day;
    ELSE
        -- 장착일자기준으로 이체일이 영업일 D+4이내이면 익월
        IF 4 >= Pkg_Rtcm0060.f_sRtcm0060OffDayCount(v_Proc_Day, SUBSTR(v_Proc_Day,1,6)||v_Pay_Day) THEN
            v_Demd_Dt := TO_CHAR(ADD_MONTHS(TO_DATE(v_Proc_Day),v_Recp_Nu), 'YYYYMM')||v_Pay_Day;
        ELSE
            v_Demd_Dt := TO_CHAR(ADD_MONTHS(TO_DATE(v_Proc_Day),v_Recp_Nu-1), 'YYYYMM')||v_Pay_Day;
        END IF;
    END IF;
   */

    -- 장착일 기준 이체일이 월말보다 클 경우 이체일을 월말로 보정
    IF TO_CHAR(LAST_DAY(SUBSTR(v_Demd_Dt,1,6)||'01'),'YYYYMMDD') < v_Demd_Dt THEN
        v_Demd_Dt := TO_CHAR(LAST_DAY(SUBSTR(v_Demd_Dt,1,6)||'01'),'YYYYMMDD');
    ELSE
        v_Demd_Dt := v_Demd_Dt;
    END IF;

    RETURN v_Demd_Dt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0109DemdDt;

  /*****************************************************************************
  -- 청구스케줄 Update - 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자)
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109ReceiptState (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Rc_Yn          IN RTSD0109.RC_YN%TYPE,          /*수납여부              */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*수납금액(VAT포함)     */
    v_Arre_Amt       IN RTSD0109.ARRE_AMT%TYPE,       /*연체금액(VAT포함)     */
    v_Rc_Day         IN RTSD0109.RC_DAY%TYPE,         /*수납일자              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0109
    SET    RC_YN    = v_Rc_Yn,
           RECP_AMT = v_Recp_Amt,
           ARRE_AMT = v_Arre_Amt,
           RC_DAY   = v_Rc_Day,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ORD_NO   = v_Ord_No
    AND    SCHD_SEQ = v_Schd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0109ReceiptState;


  /*****************************************************************************
  -- 청구스케줄 청구회차 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109RecpNu (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE        /*청구순번              */
    ) RETURN NUMBER IS

    v_Recp_Nu RTSD0109.RECP_NU%TYPE DEFAULT NULL;    /*청구회차              */
  BEGIN

    SELECT RECP_NU
    INTO   v_Recp_Nu
    FROM   RTSD0109
    WHERE  ORD_NO   = v_Ord_No
    AND    SCHD_SEQ = v_Schd_Seq;

    RETURN v_Recp_Nu;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0109RecpNu;

  /*****************************************************************************
  -- 청구스케줄 만기일자 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109ZfbDay (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE        /*청구순번              */
    ) RETURN VARCHAR IS

    v_Zfb_Day RTSD0109.ZFB_DAY%TYPE DEFAULT NULL;    /*만기계산기준일        */

  BEGIN

    SELECT ZFB_DAY
    INTO   v_Zfb_Day
    FROM   RTSD0109
    WHERE  ORD_NO   = v_Ord_No
    AND    SCHD_SEQ = v_Schd_Seq;

    RETURN v_Zfb_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0109ZfbDay;


  /*****************************************************************************
  -- 청구스케줄 Select - 중도완납 계약정보조회
  
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.6        2019-03-07  wjim             [20190307_01] 중도해지 시 장착수수료 산정기준 변경
                                          - 기존 : 장착수수료 집계정보가 있는 경우 사용하고, 없는 경우 계약일자 기준 장착수수료 조견표상 금액 사용
                                                   오프라인 주문의 장착수수료가 집계되지 않는 문제 존재
                                          - 변경 : 집계여부와 관계없이 장착일자 기준 조견표상 금액 사용 
  1.7        2023-07-10  kstka            [20230710_1] 중도해지시 위약금에 장탈착비 제외 (위법사항, 법무팀)                               
  *****************************************************************************/
  PROCEDURE p_sRtsd0109CancelList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*종료유형(S070:E,C)    */
    v_Canc_Day       IN RTSD0108.CANC_DAY%TYPE        /*취소일자(현재일)      */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  --------------------------- 계약정보 ----------------------------------
            A.ORD_NO                                                  AS ORD_NO    ,   /*계약번호*/
            A.STAT_CD                                                 AS STAT_CD   ,   /*장착상태*/
            A.CUST_NO                                                 AS CUST_NO   ,   /*고객번호*/
            PKG_RTSD0100.F_SRTSD0100CUSTNAME(A.CUST_NO)               AS CUST_NM   ,   /*고객명*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID)        AS ORD_NM    ,   /*주문구분*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)       AS CHAN_NM   ,   /*채널구분*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID)       AS SALE_NM   ,   /*계약유형*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)       AS STAT_NM   ,   /*계약상태*/
            A.ORD_DAY                                                 AS ORD_DAY   ,   /*접수일자*/
            --B.PLAN_DAY                                                AS PLAN_DAY  ,   /*장착일예정일*/
            ''                                                 AS PLAN_DAY  ,   /*장착일예정일*/
            A.PROC_DAY                                                AS PROC_DAY  ,   /*장착일자*/
            A.CANC_DAY                                                AS CANC_DAY  ,   /*취소일자*/
            --B.MAT_CD                                                  AS MAT_CD    ,   /*상품코드*/
            ''                                                  AS MAT_CD    ,   /*상품코드*/
            --Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD)                 AS MAT_NM    ,   /*상품명*/
            ''                 AS MAT_NM    ,   /*상품명*/
            --TO_NUMBER(B.ORD_QTY)                                      AS ORD_QTY   ,   /*수량*/
            ''                                      AS ORD_QTY   ,   /*수량*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)     AS PERIOD_NM ,   /*총렌탈기간*/
            'N'                                                       AS OS_YN     ,   /*소유권이전여부*/
            'N'                                                       AS MFP_YN    ,   /*중도완납여부*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)         AS PS_NM     ,   /*프리미엄서비스*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD)      AS MAKER_NM  ,   /*카메이커*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
            ||' '||
            Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)
            ||' '||
            Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD)         AS MC_NM     ,   /*차종*/
            A.CAR_NO                                                  AS CAR_NO    ,   /*차량번호*/
            A.CAR_OWNER                                               AS CAR_OWNER ,   /*차량소유자*/
            A.C_MILEAGE                                               AS C_MILEAGE ,   /*현재주행거리*/
            '0'                                                       AS MA_MILEAGE,   /*월 평균주행거리*/
            A.REQ_TEXT                                                AS REQ_TEXT,     /*비고(기타정보)*/
            A.MON_AMT                                                 AS MON_AMT,      /*월렌탈료*/
            --------------------------- 결제정보 ----------------------------------
            C.REGI_AMT                                                AS REGI_AMT,     /*회원등록비*/
            C.RGCP_AMT                                                AS RGCP_AMT,     /*회원등록비수납액*/
            C.RGBLANC_AMT                                             AS RGBLANC_AMT,  /*회원등록비잔액*/
            C.SALE_AMT + C.REGI_AMT                                   AS SALE_AMT,     /*총렌탈료*/
            C.RECP_AMT + C.RGCP_AMT                                   AS RECP_AMT,     /*렌탈료수납*/
            C.BLANC_AMT                                               AS BLANC_AMT,    /*렌탈료잔액*/
            C.ARRE1_AMT                                               AS ARRE1_AMT,    /*할인미대상*/
            C.ARRE2_AMT                                               AS ARRE2_AMT,    /*할인대상*/
            C.MAKE_AMT                                                AS MAKE_AMT,     /*납부예정금액*/
            C.SERV_AMT                                                AS SERV_AMT,     /*추가납부금액*/
            --NVL(C.PLAN_AMT,0) - NVL(D.PRPT_AMT,0)                     AS PLAN_AMT,     /*총납부예정금액*/
            CASE
            WHEN v_End_Tp = 'E' THEN NVL(C.PLAN_AMT,0) - NVL(D.PRPT_AMT,0)
--            WHEN v_End_Tp = 'C' THEN (NVL(C.PLAN_AMT,0) + NVL(ARRE1_PNLT_AMT,0) + NVL(PRCM_AMT,0) + NVL(F.SUB_DC_AMT,0)) - NVL(D.PRPT_AMT,0)
            WHEN v_End_Tp = 'C' THEN (NVL(C.PLAN_AMT,0) + NVL(ARRE1_PNLT_AMT,0) + NVL(F.SUB_DC_AMT,0)) - NVL(D.PRPT_AMT,0) /*20230710 중도해지인경우 장탈착비 제외-위법사항(법무팀)*/
            ELSE 0 END                                                AS PLAN_AMT,      /*총납부예정금액*/                               
            NVL(D.PRPT_AMT,0)                                         AS BALANCE_AMT,  /*선수금*/
            E.PRCM_AMT,                                                                 /*장탈착비*/
            C.ARRE1_PNLT_AMT,                                                           /*할인미대상 할인금액(기납부 매출의 할인금액)*/
            C.ARRE2_PNLT_AMT,                                                           /*할인대상 할인금액(미도래 매출의 할인금액(40%대상금액)*/
            NVL(F.SUB_DC_AMT,0)                                       AS SUB_DC_AMT     /* 부가제품 할인금액 */  
    FROM    RTSD0108 A,
            --RTSD0106 B,
            (
            SELECT  ORD_NO, REGI_AMT, RGCP_AMT, RGBLANC_AMT, SALE_AMT, RECP_AMT, BLANC_AMT,
                    ARRE1_AMT, ARRE2_AMT, MAKE_AMT, 0 SERV_AMT, MAKE_AMT AS PLAN_AMT, 
                    ARRE1_PNLT_AMT,ARRE2_PNLT_AMT 
            FROM    (
                    SELECT  ORD_NO, REGI_AMT, RGCP_AMT, RGBLANC_AMT, SALE_AMT, RECP_AMT, BLANC_AMT,
                            ARRE1_AMT, ARRE2_AMT,ARRE1_PNLT_AMT, ARRE2_PNLT_AMT,
                            CASE
                            WHEN v_End_Tp = 'E' THEN TRUNC(ARRE1_AMT + (ARRE2_AMT * 0.98),-1)
                            WHEN v_End_Tp = 'C' THEN TRUNC(ARRE1_AMT + ((ARRE2_AMT+ARRE2_PNLT_AMT) * 0.40),-1)
                            ELSE 0 END AS MAKE_AMT
                    FROM    (
                            SELECT  ORD_NO,
                                    SUM(REGI_AMT) AS REGI_AMT,
                                    SUM(RGCP_AMT) AS RGCP_AMT,
                                    SUM(REGI_AMT) - SUM(RGCP_AMT) AS RGBLANC_AMT,
                                    SUM(SALE_AMT) AS SALE_AMT,
                                    SUM(RECP_AMT) AS RECP_AMT,
                                    SUM(SALE_AMT) - SUM(RECP_AMT) AS BLANC_AMT,
                                    SUM(ARRE1_AMT) + (SUM(REGI_AMT) - SUM(RGCP_AMT)) AS ARRE1_AMT,
                                    SUM(ARRE2_AMT) AS ARRE2_AMT,
                                    SUM(ARRE1_PNLT_AMT) AS ARRE1_PNLT_AMT,
                                    SUM(ARRE2_PNLT_AMT) AS ARRE2_PNLT_AMT
                            FROM    (
                                    SELECT  A1.ORD_NO, A1.RECP_TP,
                                            DECODE(A1.RECP_TP, '01', A1.SALE_AMT, 0) REGI_AMT,
                                            DECODE(A1.RECP_TP, '01', A1.ARRE_AMT, 0) RGAR_AMT,
                                            DECODE(A1.RECP_TP, '01', A1.RECP_AMT, 0) RGCP_AMT,
                                            DECODE(A1.RECP_TP, '11', A1.SALE_AMT, 0) SALE_AMT,
                                            DECODE(A1.RECP_TP, '11', A1.ARRE_AMT, 0) ARRE_AMT,
                                            DECODE(A1.RECP_TP, '11', A1.RECP_AMT, 0) RECP_AMT, A1.DEMD_DT, A1.BEG_DAY, A1.END_DAY,
                                            CASE
                                                WHEN A1.DEMD_DT < SUBSTR(v_Canc_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', A1.ARRE_AMT,0)
                                            ELSE 0 END AS ARRE1_AMT,
                                            CASE
                                                WHEN A1.DEMD_DT >= SUBSTR(v_Canc_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', A1.ARRE_AMT,0)
                                            ELSE 0 END  AS ARRE2_AMT,
                                            CASE
                                                WHEN A1.DEMD_DT < SUBSTR(v_Canc_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', (B1.MON_AMT - A1.SALE_AMT),0)
                                            ELSE 0 END AS ARRE1_PNLT_AMT,
                                            CASE
                                                WHEN A1.DEMD_DT >= SUBSTR(v_Canc_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', B1.MON_AMT - A1.ARRE_AMT,0)
                                            ELSE 0 END  AS ARRE2_PNLT_AMT,                                            
                                            B1.MON_AMT
                                            --B1.*
                                    FROM    RTSD0109 A1,
                                            RTSD0104 B1
                                    WHERE   A1.ORD_NO   = v_Ord_No            
                                    AND     A1.SCD_STAT = 'S'
                                    AND     A1.ORD_NO = B1.ORD_NO
                                    )
                            GROUP   BY ORD_NO
                            )
                    )
            ) C,
            (
            SELECT ORD_NO
                 , NVL(PND_AMT - SBS_AMT,0) AS PRPT_AMT
              FROM
                   (
                    SELECT ORD_NO
                         , SUM(NVL(PND_AMT,0)) AS PND_AMT
                         , SUM(NVL(SBS_AMT,0)) AS SBS_AMT
                      FROM (
                            SELECT ORD_NO
                                 , PND_AMT
                                 , SBS_AMT
                              FROM RTRE0035
                             WHERE 1=1
                               AND ORD_NO = v_Ord_No
                               AND PND_STAT != 'S'
                           )
                    GROUP BY ORD_NO
                   )
            ) D,
            (
            SELECT  A.ORD_NO,
--                    NVL(E.PROCC_AMT, C.PRCM_AMT * TO_NUMBER( A.CNT_CD )) AS PRCM_AMT --[20190307_01] 이전
                    C.PRCM_AMT * TO_NUMBER( A.CNT_CD ) AS PRCM_AMT --[20190307_01]
            FROM    RTSD0108 A,
                    RTCS0001 B,
                    RTRE5020 C,
                    RTSD0007 D
--                    RTRE5050 E                                   --[20190307_01] 이전
            WHERE   A.ORD_NO       = v_Ord_No -- 대상 계약번호
            AND     A.ORD_NO       = B.ORD_NO
--            AND     A.CHAN_CD NOT IN ( '01', '05' )              --[20190307_01] 이전
            AND     C.MAT_CD       = B.MAT_CD
--            AND     C.STR_DAY     <= A.ORD_DAY                   --[20190307_01] 이전
--            AND     C.END_DAY     >= A.ORD_DAY                   --[20190307_01] 이전
            AND     C.STR_DAY     <= A.PROC_DAY                    --[20190307_01]
            AND     C.END_DAY     >= A.PROC_DAY                    --[20190307_01]
            AND     C.USE_YN       = 'Y'  
            AND     A.AGENCY_CD    = D.AGENCY_CD    
            AND     C.CHAN_LCLS_CD = D.CHAN_LCLS_CD
            AND     C.CHAN_MCLS_CD = D.CHAN_MCLS_CD 
--            AND     A.ORD_NO       = E.ORD_NO(+)                 --[20190307_01] 이전     
            )E,
            (
            SELECT ORD_NO,
                   SUM(DC_AMT) AS SUB_DC_AMT
            FROM   RTSD0041
            WHERE  1=1
            AND    ORD_NO = v_Ord_No
            GROUP BY ORD_NO   
             )F   
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.STAT_CD = '04' -- 장착상태만 가능 :  계약상태가 장착이 아닙니다. 확인바랍니다.
    AND     A.Mfp_Yn <> 'Y'  -- 중도완납된 것은 제외
    --AND     A.ORD_NO = B.ORD_NO
    AND     A.ORD_NO = C.ORD_NO
    AND     A.ORD_NO = D.ORD_NO(+)
    AND     A.ORD_NO = E.ORD_NO(+)
    AND     A.ORD_NO = F.ORD_NO(+);

  END p_sRtsd0109CancelList;


  /*****************************************************************************
  -- 청구스케줄 관리 - 중도완납 저장

  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.2        2018-04-19  wjim             [20180419_01] 중도완납(해약) 시 방문점검 당월 배정분 점검거부 자동 등록
  1.3        2018-04-25  wjim             [20180425_01] 중도완납(해약) 시 방문점검 점검거부 이력등록
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109CancelSave (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*종료유형(S070:E,C)    */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*수납금액(VAT포함)     */
    v_Arre1_Amt      IN RTSD0109.ARRE_AMT%TYPE,       /*할인미대상            */
    v_Bank_Day       IN RTRE0040.BANK_RECP_DAY%TYPE,  /*은행입금일            */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Mfp_Yn       RTSD0108.MFP_YN%TYPE DEFAULT NULL;      /*중도완납여부     */
    v_Equ_No       RTSD0108.EQU_NO%TYPE DEFAULT NULL;      /*설비번호         */
    v_Close_Yn     RTCS0001.CLOSE_YN%TYPE  DEFAULT NULL;   /*종료여부         */
    v_Scd_Stat     RTSD0109.SCD_STAT%TYPE DEFAULT NULL;    /*스케줄상태코드   */

    v_Schd_Seq     RTSD0109.SCHD_SEQ%TYPE DEFAULT NULL;    /*청구순번         */
    v_Sale_Amt     RTSD0109.SALE_NAMT%TYPE DEFAULT NULL;   /*매출금액         */
    v_Sale_Namt    RTSD0109.SALE_NAMT%TYPE DEFAULT NULL;   /*원금             */
    v_Sale_Vamt    RTSD0109.SALE_VAMT%TYPE DEFAULT NULL;   /*부가세           */

    v_Recp_Nu      RTSD0109.RECP_NU%TYPE DEFAULT NULL;     /*청구회차         */
    v_Cust_No      RTSD0109.CUST_NO%TYPE DEFAULT NULL;     /*고객번호         */
    v_Sales_Group  RTSD0109.SALES_GROUP%TYPE DEFAULT NULL; /*지사             */
    v_Sales_Office RTSD0109.SALES_OFFICE%TYPE DEFAULT NULL;/*지점             */
    v_Agency_Cd    RTSD0109.AGENCY_CD%TYPE DEFAULT NULL;   /*장착 대리점      */
    v_Pay_Mthd     RTSD0109.PAY_MTHD%TYPE DEFAULT NULL;    /*결제구분         */
    v_Pay_Dd       RTSD0109.PAY_DD%TYPE DEFAULT NULL;      /*이체일           */

    v_Recp_Pay     RTRE0041.RECP_PAY%TYPE DEFAULT NULL;    /*수납방법         */
    v_Arre_Amt     RTRE0031.ARRE_AMT%TYPE DEFAULT NULL;    /*연체금액         */

    ls_Equ_No       RTCS0001.EQU_NO%TYPE DEFAULT NULL;
    ln_Deny_Seq     RTCS0013.DENY_SEQ%TYPE DEFAULT NULL;
    ls_Deny_Yn      RTCS0013.DENY_YN%TYPE DEFAULT NULL;
    
    v_chk_cnt       number;

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 계약번호,종료유형,중도완납일, 수납금액, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_End_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S070', v_End_Tp)) THEN
        v_Return_Message := '종료유형('||v_End_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Cancl_Day) THEN
        v_Return_Message := '중도완납일('||v_Cancl_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recp_Amt) IS NULL THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 계약상태(S032)가 장착완료상태(04)가 아닌 경우 처리 불가
    IF '04' != Pkg_Rtsd0108.f_sRtsd0108StatCd(v_Ord_No) THEN
        v_Return_Message := '해당 주문번호('||v_Ord_No||')는 장착완료상태가 아니므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    SELECT COUNT(*)
      INTO v_chk_cnt
      FROM RTTEMPIWJ_190429_01
     WHERE COL_01 = v_Ord_No;
     
    IF v_chk_cnt > 0 THEN
        v_Return_Message := '채권매각대상이므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  

    -- 중도완납여부
    v_Mfp_Yn := 'Y';

    -- 장착 정보 Update - 중도완납
    IF 0 != Pkg_Rtsd0108.f_UpdateRtsd0108Cancel(v_Ord_No, v_Cancl_Day, v_Mfp_Yn, v_End_Tp,
                                                v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '중도완납 장착 정보(RTSD0108) Update 실패!!!'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 장착 정보 - 계약번호로 설비번호 획득
    v_Equ_No := Pkg_Rtsd0108.f_sRtsd0108EquNo(v_Ord_No);

    -- 계약종료여부(Y)
    v_Close_Yn := 'Y';

    -- 설비 정보 Update - 중도완납
    IF 0 != Pkg_Rtcs0001.f_UpdateRtcs0001Cancel(v_Equ_No, v_Ord_No, v_Close_Yn, v_Cancl_Day,
                                                v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '중도완납 설비 정보(RTCS0001) Update 실패!!!'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 중도완납(C)
    v_Scd_Stat := 'C';

    SELECT  (-- 청구회차 : 완납일자의 해당 회차
            SELECT  B.RECP_NU
            FROM    RTSD0109 B
            WHERE   B.ORD_NO   = A.ORD_NO
            AND     B.RECP_TP  = '11'
            AND     B.SCD_STAT = 'S'
            AND     v_Cancl_Day BETWEEN B.BEG_DAY AND B.END_DAY) RECP_NU,
            A.CUST_NO, A.SALES_GROUP, A.SALES_OFFICE, A.AGENCY_CD, A.PAY_MTHD, A.PAY_DD
    INTO    v_Recp_Nu, v_Cust_No, v_Sales_Group, v_Sales_Office, v_Agency_Cd, v_Pay_Mthd, v_Pay_Dd
    FROM    RTSD0108 A
    WHERE   A.ORD_NO = v_Ord_No;

    -- 청구스케줄 Update - 중도완납
    IF 0 != Pkg_Rtsd0109.f_UpdateRtsd0109Cancel(v_Ord_No, v_Cancl_Day, v_Scd_Stat, v_Reg_Id,
                                                v_ErrorText) THEN
        v_Return_Message := '중도완납 청구스케줄(RTSD0109) Update 실패!!!'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    ----------------------------------------------
    -- 방문점검 점검거부 자동등록 [20180425_01] --
    ----------------------------------------------

    -- 설비번호 획득
    SELECT  EQU_NO
      INTO  ls_Equ_No
      FROM  RTCS0001
     WHERE  ORD_NO = v_Ord_No;

    -- 방문점검 마지막 거부등록 순번 획득
    SELECT  NVL(MAX(DENY_SEQ), 0)
      INTO  ln_Deny_Seq
      FROM  RTCS0013
     WHERE  ORD_NO = v_Ord_No
       AND  EQU_NO = ls_Equ_No;

    IF ln_Deny_Seq > 0 THEN
        SELECT  DENY_YN
          INTO  ls_Deny_Yn
          FROM  RTCS0013
         WHERE  ORD_NO   = v_Ord_No
           AND  EQU_NO   = ls_Equ_No
           AND  DENY_SEQ = ln_Deny_Seq;

    ELSE
        ls_Deny_Yn := 'N';

    END IF;

    -- 방문점검 점검거부 이력등록
    IF ls_Deny_Yn = 'N' THEN
        INSERT INTO RTCS0013 (
              ORD_NO
            , EQU_NO
            , DENY_SEQ
            , DENY_YN
            , DENY_YMD
            , DENY_ID
            , DENY_STD_YM
            , DENY_DESC
            , WTHDRW_YMD
            , WTHDRW_ID
            , WTHDRW_STD_YM
            , WTHDRW_DESC
            , REG_ID
            , REG_DT
            , CHG_ID
            , CHG_DT
        ) VALUES (
              v_Ord_No
            , ls_Equ_No
            , ln_Deny_Seq + 1
            , 'Y'
            , TO_CHAR(SYSDATE, 'YYYYMMDD')
            , v_Reg_Id
            , TO_CHAR(SYSDATE, 'YYYYMM')
            , '중도완납(해약)에 따른 점검거부 자동등록'
            , NULL
            , NULL
            , NULL
            , NULL
            , v_Reg_Id
            , SYSDATE
            , v_Reg_Id
            , SYSDATE
        );
    END IF;

    -- 당월 이후 방문점검 배정 점검거부 처리 [20180419_01]
    UPDATE  RTCS0005
       SET  CHK_STAT  = '05'
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  ORD_NO    = v_Ord_No
       AND  STD_YM   >= TO_CHAR(SYSDATE, 'YYYYMM')
       AND  CHK_STAT NOT IN ('04', '05') --처리완료, 점검거부 건은 제외
    ;

    -- 종료유형(S070:E,C)
    IF v_End_Tp  = 'E' THEN


        -- 연체금액: 수납금액 - 할인미대상
        v_Sale_Amt :=  v_Recp_Amt - v_Arre1_Amt;

        -- 원금 : 매출금액 / 1.1 소수점 1자리에서 반올림
        v_Sale_Namt := ROUND(v_Sale_Amt/1.1);

        -- 부가세 : 매출금액 - 원금
        v_Sale_Vamt := v_Sale_Amt - NVL(v_Sale_Namt,0);

        -- 중도완납 할인대상금액 청구스케줄(RTSD0109) 생성
        Pkg_Rtsd0109.p_IUDRtsd0109 (
                'I'               , /*(v_Comm_Dvsn   )처리구분(I,U,D)       */
                v_Ord_No          , /*(v_Ord_No      )계약번호              */
                v_Schd_Seq        , /*(v_Schd_Seq    )청구순번              */
                '11'              , /*(v_Recp_Tp     )청구구분              */
                v_Recp_Nu         , /*(v_Recp_Nu     )청구회차              */
                'S'               , /*(v_Scd_Stat    )스케줄상태코드        */
                v_Sale_Amt        , /*(v_Sale_Amt    )매출금액(VAT 포함)    */
                v_Sale_Namt       , /*(v_Sale_Namt   )원금                  */
                v_Sale_Vamt       , /*(v_Sale_Vamt   )부가세                */
                0                 , /*(v_Recp_Amt    )수납금액(VAT포함)     */
                v_Sale_Amt        , /*(v_Arre_Amt    )연체금액(VAT포함)     */
                v_Cancl_Day       , /*(v_Demd_Dt     )청구일자              */
                'N'               , /*(v_Zlspr       )청구보류              */
                NULL              , /*(v_Rc_Day      )수납일자              */
                'N'               , /*(v_Rc_Yn       )수납여부              */
                v_Cancl_Day       , /*(v_Tax_Dt      )세금계산서발행일자(예 */
                NULL              , /*(v_Tax_No      )세금계산서번호        */
                v_Cancl_Day       , /*(v_Zfb_Day     )만기계산기준일        */
                v_Cancl_Day       , /*(v_Cancl_Day   )중도완납일            */
                v_Cust_No         , /*(v_Cust_No     )고객번호              */
                v_Sales_Group     , /*(v_Sales_Group )지사                  */
                v_Sales_Office    , /*(v_Sales_Office)지점                  */
                v_Agency_Cd       , /*(v_Agency_Cd   )장착 대리점           */
                v_Cancl_Day       , /*(v_Beg_Day     )시작일                */
                v_Cancl_Day       , /*(v_End_Day     )종료일                */
                'N'               , /*(v_Delay_Yn    )연체이자적용여부      */
                0                 , /*(v_Delay_Rate  )연체 이자율           */
                v_Pay_Mthd        , /*(v_Pay_Mthd    )결제구분              */
                v_Pay_Dd          , /*(v_Pay_Dd      )이체일                */
                'Y'               , /*(v_Use_Yn      )사용여부              */
                v_Reg_Id          , /*(v_Reg_Id      )등록자 ID             */
                v_Success_Code    ,
                v_Return_Message  ,
                v_ErrorText
                );

        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도완납 할인대상금액 청구스케줄(RTSD0109) 생성 실패!!!'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    -- 종료유형(S070) C 일 경우
    ELSE

        -- 연체금액: 수납금액 - 할인미대상
        v_Sale_Amt :=  v_Recp_Amt - v_Arre1_Amt;

        -- 원금 : 연체금액
        v_Sale_Namt := v_Sale_Amt;

        -- 부가세 : 매출금액 - 원금
        v_Sale_Vamt := v_Sale_Amt - NVL(v_Sale_Namt,0);

        -- 중도완납 할인대상금액 청구스케줄(RTSD0109) 생성
        Pkg_Rtsd0109.p_IUDRtsd0109 (
                'I'               , /*(v_Comm_Dvsn   )처리구분(I,U,D)       */
                v_Ord_No          , /*(v_Ord_No      )계약번호              */
                v_Schd_Seq        , /*(v_Schd_Seq    )청구순번              */
                '42'              , /*(v_Recp_Tp     )청구구분              */
                v_Recp_Nu         , /*(v_Recp_Nu     )청구회차              */
                'S'               , /*(v_Scd_Stat    )스케줄상태코드        */
                v_Sale_Amt        , /*(v_Sale_Amt    )매출금액(VAT 포함)    */
                v_Sale_Namt       , /*(v_Sale_Namt   )원금                  */
                v_Sale_Vamt       , /*(v_Sale_Vamt   )부가세                */
                0                 , /*(v_Recp_Amt    )수납금액(VAT포함)     */
                v_Sale_Amt        , /*(v_Arre_Amt    )연체금액(VAT포함)     */
                v_Cancl_Day       , /*(v_Demd_Dt     )청구일자              */
                'N'               , /*(v_Zlspr       )청구보류              */
                NULL              , /*(v_Rc_Day      )수납일자              */
                'N'               , /*(v_Rc_Yn       )수납여부              */
                v_Cancl_Day       , /*(v_Tax_Dt      )세금계산서발행일자(예 */
                NULL              , /*(v_Tax_No      )세금계산서번호        */
                v_Cancl_Day       , /*(v_Zfb_Day     )만기계산기준일        */
                v_Cancl_Day       , /*(v_Cancl_Day   )중도완납일            */
                v_Cust_No         , /*(v_Cust_No     )고객번호              */
                v_Sales_Group     , /*(v_Sales_Group )지사                  */
                v_Sales_Office    , /*(v_Sales_Office)지점                  */
                v_Agency_Cd       , /*(v_Agency_Cd   )장착 대리점           */
                v_Cancl_Day       , /*(v_Beg_Day     )시작일                */
                v_Cancl_Day       , /*(v_End_Day     )종료일                */
                'N'               , /*(v_Delay_Yn    )연체이자적용여부      */
                0                 , /*(v_Delay_Rate  )연체 이자율           */
                v_Pay_Mthd        , /*(v_Pay_Mthd    )결제구분              */
                v_Pay_Dd          , /*(v_Pay_Dd      )이체일                */
                'Y'               , /*(v_Use_Yn      )사용여부              */
                v_Reg_Id          , /*(v_Reg_Id      )등록자 ID             */
                v_Success_Code    ,
                v_Return_Message  ,
                v_ErrorText
                );

        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도해지 할인대상금액 청구스케줄(RTSD0109) 생성 실패!!!'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;



    END IF;

    -- 수납방법(R019) : (A1)무통장 , (C1)CMS이체 , (C2)카드이체 , (P1)카드(PG) , (P2)계좌이체(PG) , (P3)휴대폰(PG)
    v_Recp_Pay := 'A1';


    -- 수납정산
    Pkg_Rtre0041.p_InsertRtre0041PgReceipt (
            v_Cancl_Day                  , /*(v_Recv_Day     )수납일자              */
            v_Ord_No                     , /*(v_Ord_No       )계약번호              */
            v_Cust_No                    , /*(v_Cust_No      )고객번호              */
            NULL                         , /*(v_Recp_Id      )수납자ID              */
            v_Recp_Amt                   , /*(v_Recp_Amt     )수납금액              */
            v_Recp_Pay                   , /*(v_Recp_Pay     )수납방법              */
            v_Recp_Amt                   , /*(v_Arre_Amt     )연체금액              */
            v_Bank_Day                   , /*(v_Bank_Recp_Day)은행입금일            */
            NULL                         , /*(v_Tno          )PG거래번호            */
            v_Reg_Id                     , /*(v_Reg_Id       )등록자 ID             */
            v_Success_Code               ,
            v_Return_Message             ,
            v_ErrorText
            );

    IF 0 != v_Success_Code THEN
        v_Return_Message := '중도완납 무통장 수납처리(RTRE0041) 생성 실패!!!'||v_Return_Message;
        v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_InsertRtsd0109CancelSave(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_InsertRtsd0109CancelSave(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0109CancelSave;

  /*****************************************************************************
  -- 청구스케줄 관리 - 중도완납 저장(영업관리 시스템 공통팝업용 저장)

  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.2        2018-04-19  wjim             [20180419_01] 중도완납(해약) 시 방문점검 당월 배정분 점검거부 자동 등록
  1.3        2018-04-25  wjim             [20180425_01] 중도완납(해약) 시 방문점검 점검거부 이력등록
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109CancelSave2 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*종료유형(S070:E,C)    */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*수납금액(VAT포함)     */
    v_Arre1_Amt      IN RTSD0109.ARRE_AMT%TYPE,       /*할인미대상            */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Mfp_Yn       RTSD0108.MFP_YN%TYPE DEFAULT NULL;      /*중도완납여부     */
    v_Equ_No       RTSD0108.EQU_NO%TYPE DEFAULT NULL;      /*설비번호         */
    v_Close_Yn     RTCS0001.CLOSE_YN%TYPE  DEFAULT NULL;   /*종료여부         */
    v_Scd_Stat     RTSD0109.SCD_STAT%TYPE DEFAULT NULL;    /*스케줄상태코드   */

    v_Schd_Seq     RTSD0109.SCHD_SEQ%TYPE DEFAULT NULL;    /*청구순번         */
    v_Sale_Amt     RTSD0109.SALE_NAMT%TYPE DEFAULT NULL;   /*매출금액         */
    v_Sale_Namt    RTSD0109.SALE_NAMT%TYPE DEFAULT NULL;   /*원금             */
    v_Sale_Vamt    RTSD0109.SALE_VAMT%TYPE DEFAULT NULL;   /*부가세           */

    v_Period_Cd    RTSD0108.PERIOD_CD%TYPE DEFAULT NULL;   /*렌탈기간         */
    v_Recp_Nu      RTSD0109.RECP_NU%TYPE DEFAULT NULL;     /*청구회차         */
    v_Cust_No      RTSD0109.CUST_NO%TYPE DEFAULT NULL;     /*고객번호         */
    v_Sales_Group  RTSD0109.SALES_GROUP%TYPE DEFAULT NULL; /*지사             */
    v_Sales_Office RTSD0109.SALES_OFFICE%TYPE DEFAULT NULL;/*지점             */
    v_Agency_Cd    RTSD0109.AGENCY_CD%TYPE DEFAULT NULL;   /*장착 대리점      */
    v_Pay_Mthd     RTSD0109.PAY_MTHD%TYPE DEFAULT NULL;    /*결제구분         */
    v_Pay_Dd       RTSD0109.PAY_DD%TYPE DEFAULT NULL;      /*이체일           */

    v_Recp_Pay     RTRE0041.RECP_PAY%TYPE DEFAULT NULL;    /*수납방법         */
    v_Arre_Amt     RTRE0031.ARRE_AMT%TYPE DEFAULT NULL;    /*연체금액         */
    v_Arre2_Amt     RTRE0031.ARRE_AMT%TYPE DEFAULT NULL;    /*마지막회차시 월렌탈료         */
    v_Arre1_Chk_Amt RTRE0031.ARRE_AMT%TYPE DEFAULT NULL;    /*연체금액 비교         */
    ls_Equ_No       RTCS0001.EQU_NO%TYPE DEFAULT NULL;
    ln_Deny_Seq     RTCS0013.DENY_SEQ%TYPE DEFAULT NULL;
    ls_Deny_Yn      RTCS0013.DENY_YN%TYPE DEFAULT NULL;
    
    v_chk_cnt       number;

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 계약번호,종료유형,중도완납일, 수납금액, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_End_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S070', v_End_Tp)) THEN
        v_Return_Message := '종료유형('||v_End_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Cancl_Day) THEN
        v_Return_Message := '중도완납일('||v_Cancl_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recp_Amt) IS NULL THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 계약상태(S032)가 장착완료상태(04)가 아닌 경우 처리 불가
    IF '04' != Pkg_Rtsd0108.f_sRtsd0108StatCd(v_Ord_No) THEN
        v_Return_Message := '해당 주문번호('||v_Ord_No||')는 장착완료상태가 아니므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    SELECT COUNT(*)
      INTO v_chk_cnt
      FROM RTTEMPIWJ_190429_01
     WHERE COL_01 = v_Ord_No;
     
    IF v_chk_cnt > 0 THEN
        v_Return_Message := '채권매각대상이므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;     

    -- 연체금액 화면 입력값과 비교하기 위함
    SELECT NVL(A.ARRE1_AMT,0)
      INTO v_Arre1_Chk_Amt
      FROM ( 
            SELECT  ORD_NO,
                    SUM(ARRE1_AMT) + (SUM(REGI_AMT) - SUM(RGCP_AMT)) AS ARRE1_AMT
            FROM    (
                    SELECT  A1.ORD_NO, A1.RECP_TP,
                            DECODE(A1.RECP_TP, '01', A1.SALE_AMT, 0) REGI_AMT,
                            DECODE(A1.RECP_TP, '01', A1.RECP_AMT, 0) RGCP_AMT,
                            CASE
                                WHEN A1.DEMD_DT < SUBSTR(v_Cancl_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', A1.ARRE_AMT,0)
                            ELSE 0 END AS ARRE1_AMT
                    FROM    RTSD0109 A1
                    WHERE   A1.ORD_NO   = v_Ord_No            
                    AND     A1.SCD_STAT = 'S'
                    )
            GROUP   BY ORD_NO
            ) A;
    
    --연체금입력항목 체크        
    IF v_Arre1_Chk_Amt != v_Arre1_Amt THEN
        v_Return_Message := '할인미대상 금액('||v_Arre1_Amt||') : 할인미대상 금액이 실제 할인미대상 금액('||v_Arre1_Chk_Amt||') 과 다름으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  

    -- 중도완납여부
    v_Mfp_Yn := 'Y';

    -- 장착 정보 Update - 중도완납
    IF 0 != Pkg_Rtsd0108.f_UpdateRtsd0108Cancel(v_Ord_No, v_Cancl_Day, v_Mfp_Yn, v_End_Tp,
                                                v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '중도완납 장착 정보(RTSD0108) Update 실패!!!'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 장착 정보 - 계약번호로 설비번호 획득
    v_Equ_No := Pkg_Rtsd0108.f_sRtsd0108EquNo(v_Ord_No);

    -- 계약종료여부(Y)
    v_Close_Yn := 'Y';
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.MfpProctest_01', v_Ord_No, v_Recp_Amt);
    -- 설비 정보 Update - 중도완납
    IF 0 != Pkg_Rtcs0001.f_UpdateRtcs0001Cancel(v_Equ_No, v_Ord_No, v_Close_Yn, v_Cancl_Day,
                                                v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '중도완납 설비 정보(RTCS0001) Update 실패!!!'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 중도완납(C)
    v_Scd_Stat := 'C';
DBMS_OUTPUT.PUT_LINE('v_Close_Yn :: ' || v_Close_Yn);
    SELECT  (-- 청구회차 : 완납일자의 해당 회차
            --SELECT  B.RECP_NU
            SELECT  MIN(B.RECP_NU)
            FROM    RTSD0109 B
            WHERE   B.ORD_NO   = A.ORD_NO
            AND     B.RECP_TP  = '11'
            AND     B.SCD_STAT = 'S'
            AND     B.DEMD_DT >= SUBSTR(v_Cancl_Day,1,6)||'01') RECP_NU,
            --AND     v_Cancl_Day BETWEEN B.BEG_DAY AND B.END_DAY) RECP_NU,  --(20190208 청구회차 불러오는 값이 중도완납 할인회차 불러오는 것과 틀려 수정 : 임준호)
            --AND     SUBSTR(B.DEMD_DT, 1, 6) >= SUBSTR(v_Cancl_Day, 1, 6)) RECP_NU,
            A.CUST_NO, A.SALES_GROUP, A.SALES_OFFICE, A.AGENCY_CD, A.PAY_MTHD, A.PAY_DD, A.PERIOD_CD
    INTO    v_Recp_Nu, v_Cust_No, v_Sales_Group, v_Sales_Office, v_Agency_Cd, v_Pay_Mthd, v_Pay_Dd , v_Period_Cd
    FROM    RTSD0108 A
    WHERE   A.ORD_NO = v_Ord_No;
DBMS_OUTPUT.PUT_LINE('v_Recp_Nu :: ' || v_Recp_Nu);
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.MfpProctest_02', v_Ord_No, v_End_Tp);
    -- 청구스케줄 Update - 중도완납
    IF 0 != Pkg_Rtsd0109.f_UpdateRtsd0109Cancel(v_Ord_No, v_Cancl_Day, v_Scd_Stat, v_Reg_Id,
                                                v_ErrorText) THEN
        v_Return_Message := '중도완납 청구스케줄(RTSD0109) Update 실패!!!'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    ----------------------------------------------
    -- 방문점검 점검거부 자동등록 [20180425_01] --
    ----------------------------------------------

    -- 설비번호 획득
    SELECT  EQU_NO
      INTO  ls_Equ_No
      FROM  RTCS0001
     WHERE  ORD_NO = v_Ord_No;

    -- 방문점검 마지막 거부등록 순번 획득
    SELECT  NVL(MAX(DENY_SEQ), 0)
      INTO  ln_Deny_Seq
      FROM  RTCS0013
     WHERE  ORD_NO = v_Ord_No
       AND  EQU_NO = ls_Equ_No;

    IF ln_Deny_Seq > 0 THEN
        SELECT  DENY_YN
          INTO  ls_Deny_Yn
          FROM  RTCS0013
         WHERE  ORD_NO   = v_Ord_No
           AND  EQU_NO   = ls_Equ_No
           AND  DENY_SEQ = ln_Deny_Seq;

    ELSE
        ls_Deny_Yn := 'N';

    END IF;

    -- 방문점검 점검거부 이력등록
    IF ls_Deny_Yn = 'N' THEN
        INSERT INTO RTCS0013 (
              ORD_NO
            , EQU_NO
            , DENY_SEQ
            , DENY_YN
            , DENY_YMD
            , DENY_ID
            , DENY_STD_YM
            , DENY_DESC
            , WTHDRW_YMD
            , WTHDRW_ID
            , WTHDRW_STD_YM
            , WTHDRW_DESC
            , REG_ID
            , REG_DT
            , CHG_ID
            , CHG_DT
        ) VALUES (
              v_Ord_No
            , ls_Equ_No
            , ln_Deny_Seq + 1
            , 'Y'
            , TO_CHAR(SYSDATE, 'YYYYMMDD')
            , v_Reg_Id
            , TO_CHAR(SYSDATE, 'YYYYMM')
            , '중도완납(해약)에 따른 점검거부 자동등록'
            , NULL
            , NULL
            , NULL
            , NULL
            , v_Reg_Id
            , SYSDATE
            , v_Reg_Id
            , SYSDATE
        );
    END IF;

    -- 당월 이후 방문점검 배정 점검거부 처리 [20180419_01]
    UPDATE  RTCS0005
       SET  CHK_STAT  = '05'
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  ORD_NO    = v_Ord_No
       AND  STD_YM   >= TO_CHAR(SYSDATE, 'YYYYMM')
       AND  CHK_STAT NOT IN ('04', '05') --처리완료, 점검거부 건은 제외
    ;

    -- 종료유형(S070:E,C)
    IF v_End_Tp  = 'E' THEN
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.MfpProctest_03', v_Ord_No, v_Recp_Nu);
        IF v_Recp_Nu IS NULL THEN

            v_Recp_Nu  := v_Period_Cd;
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.MfpProctest_04', v_Ord_No, v_Recp_Nu);            
DBMS_OUTPUT.PUT_LINE('v_Recp_NuE :: ' || v_Recp_Nu);
            -- 마지막회차 금액            
            SELECT  ARRE_AMT
            INTO    v_Arre2_Amt
            FROM    RTSD0109 
            WHERE   ORD_NO   = v_Ord_No
            AND     RECP_TP  = '11'
            AND     SCD_STAT = 'C'
            AND     RECP_NU = v_Recp_Nu;
            
            -- 마지막회차 이전 연체금
            SELECT  SUM(ARRE_AMT)
            INTO    v_Arre_Amt
            FROM    RTSD0109 
            WHERE   ORD_NO   = v_Ord_No
            AND     RECP_TP  = '11'
            AND     SCD_STAT = 'S';
                           

            IF v_Recp_Amt = v_Arre2_Amt THEN
               -- 마지막회차가 미할인대상이며 금액이 같은경우
               v_Sale_Amt := v_Recp_Amt;
            ELSE
               -- 금액이 다른경우 마지막회차 이외의 연첵름을 뺀 금액을 매출생성
               v_Sale_Amt := v_Recp_Amt - v_Arre_Amt;
               --v_Sale_Amt := TRUNC(v_Sale_Amt,-1);
            END IF;
            
            --v_Sale_Amt := v_Recp_Amt - v_Arre2_Amt;
            
DBMS_OUTPUT.PUT_LINE('v_Recp_Amt :: ' || v_Recp_Amt);
DBMS_OUTPUT.PUT_LINE('v_Arre2_Amt :: ' || v_Arre2_Amt);              
DBMS_OUTPUT.PUT_LINE('v_Sale_Amt1 :: ' || v_Sale_Amt);                  
        ELSE
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.MfpProctest_05-1', v_Ord_No, v_Recp_Nu);        
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.MfpProctest_05-2', v_Ord_No, v_Recp_Amt);
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.MfpProctest_05-3', v_Ord_No, v_Arre1_Amt);
            -- 연체금액: 수납금액 - 할인미대상
            v_Sale_Amt :=  v_Recp_Amt - v_Arre1_Amt;
DBMS_OUTPUT.PUT_LINE('v_Recp_Amt :: ' || v_Recp_Amt);  
DBMS_OUTPUT.PUT_LINE('v_Arre1_Amt :: ' || v_Arre1_Amt);              
DBMS_OUTPUT.PUT_LINE('v_Sale_Amt2 :: ' || v_Sale_Amt);                  
        END IF;

        -- 원금 : 매출금액 / 1.1 소수점 1자리에서 반올림
        v_Sale_Namt := ROUND(v_Sale_Amt/1.1);

        -- 부가세 : 매출금액 - 원금
        v_Sale_Vamt := v_Sale_Amt - NVL(v_Sale_Namt,0);

        -- 중도완납 할인대상금액 청구스케줄(RTSD0109) 생성
        Pkg_Rtsd0109.p_IUDRtsd0109 (
                'I'               , /*(v_Comm_Dvsn   )처리구분(I,U,D)       */
                v_Ord_No          , /*(v_Ord_No      )계약번호              */
                v_Schd_Seq        , /*(v_Schd_Seq    )청구순번              */
                '11'              , /*(v_Recp_Tp     )청구구분              */
                v_Recp_Nu         , /*(v_Recp_Nu     )청구회차              */
                'S'               , /*(v_Scd_Stat    )스케줄상태코드        */
                v_Sale_Amt        , /*(v_Sale_Amt    )매출금액(VAT 포함)    */
                v_Sale_Namt       , /*(v_Sale_Namt   )원금                  */
                v_Sale_Vamt       , /*(v_Sale_Vamt   )부가세                */
                0                 , /*(v_Recp_Amt    )수납금액(VAT포함)     */
                v_Sale_Amt        , /*(v_Arre_Amt    )연체금액(VAT포함)     */
                v_Cancl_Day       , /*(v_Demd_Dt     )청구일자              */
                'N'               , /*(v_Zlspr       )청구보류              */
                NULL              , /*(v_Rc_Day      )수납일자              */
                'N'               , /*(v_Rc_Yn       )수납여부              */
                v_Cancl_Day       , /*(v_Tax_Dt      )세금계산서발행일자(예 */
                NULL              , /*(v_Tax_No      )세금계산서번호        */
                v_Cancl_Day       , /*(v_Zfb_Day     )만기계산기준일        */
                v_Cancl_Day       , /*(v_Cancl_Day   )중도완납일            */
                v_Cust_No         , /*(v_Cust_No     )고객번호              */
                v_Sales_Group     , /*(v_Sales_Group )지사                  */
                v_Sales_Office    , /*(v_Sales_Office)지점                  */
                v_Agency_Cd       , /*(v_Agency_Cd   )장착 대리점           */
                v_Cancl_Day       , /*(v_Beg_Day     )시작일                */
                v_Cancl_Day       , /*(v_End_Day     )종료일                */
                'N'               , /*(v_Delay_Yn    )연체이자적용여부      */
                0                 , /*(v_Delay_Rate  )연체 이자율           */
                v_Pay_Mthd        , /*(v_Pay_Mthd    )결제구분              */
                v_Pay_Dd          , /*(v_Pay_Dd      )이체일                */
                'Y'               , /*(v_Use_Yn      )사용여부              */
                v_Reg_Id          , /*(v_Reg_Id      )등록자 ID             */
                v_Success_Code    ,
                v_Return_Message  ,
                v_ErrorText
                );

        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도완납 할인대상금액 청구스케줄(RTSD0109) 생성 실패!!!'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    -- 종료유형(S070) C 일 경우
    ELSE
Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.MfpProctest_06', v_Ord_No, v_Recp_Nu);
        -- 연체금액: 수납금액 - 할인미대상
        v_Sale_Amt :=  v_Recp_Amt - v_Arre1_Amt;

        -- 원금 : 연체금액
        v_Sale_Namt := v_Sale_Amt;

        -- 부가세 : 매출금액 - 원금
        v_Sale_Vamt := v_Sale_Amt - NVL(v_Sale_Namt,0);

        -- 중도완납 할인대상금액 청구스케줄(RTSD0109) 생성
        Pkg_Rtsd0109.p_IUDRtsd0109 (
                'I'               , /*(v_Comm_Dvsn   )처리구분(I,U,D)       */
                v_Ord_No          , /*(v_Ord_No      )계약번호              */
                v_Schd_Seq        , /*(v_Schd_Seq    )청구순번              */
                '42'              , /*(v_Recp_Tp     )청구구분              */
                v_Recp_Nu         , /*(v_Recp_Nu     )청구회차              */
                'S'               , /*(v_Scd_Stat    )스케줄상태코드        */
                v_Sale_Amt        , /*(v_Sale_Amt    )매출금액(VAT 포함)    */
                v_Sale_Namt       , /*(v_Sale_Namt   )원금                  */
                v_Sale_Vamt       , /*(v_Sale_Vamt   )부가세                */
                0                 , /*(v_Recp_Amt    )수납금액(VAT포함)     */
                v_Sale_Amt        , /*(v_Arre_Amt    )연체금액(VAT포함)     */
                v_Cancl_Day       , /*(v_Demd_Dt     )청구일자              */
                'N'               , /*(v_Zlspr       )청구보류              */
                NULL              , /*(v_Rc_Day      )수납일자              */
                'N'               , /*(v_Rc_Yn       )수납여부              */
                v_Cancl_Day       , /*(v_Tax_Dt      )세금계산서발행일자(예 */
                NULL              , /*(v_Tax_No      )세금계산서번호        */
                v_Cancl_Day       , /*(v_Zfb_Day     )만기계산기준일        */
                v_Cancl_Day       , /*(v_Cancl_Day   )중도완납일            */
                v_Cust_No         , /*(v_Cust_No     )고객번호              */
                v_Sales_Group     , /*(v_Sales_Group )지사                  */
                v_Sales_Office    , /*(v_Sales_Office)지점                  */
                v_Agency_Cd       , /*(v_Agency_Cd   )장착 대리점           */
                v_Cancl_Day       , /*(v_Beg_Day     )시작일                */
                v_Cancl_Day       , /*(v_End_Day     )종료일                */
                'N'               , /*(v_Delay_Yn    )연체이자적용여부      */
                0                 , /*(v_Delay_Rate  )연체 이자율           */
                v_Pay_Mthd        , /*(v_Pay_Mthd    )결제구분              */
                v_Pay_Dd          , /*(v_Pay_Dd      )이체일                */
                'Y'               , /*(v_Use_Yn      )사용여부              */
                v_Reg_Id          , /*(v_Reg_Id      )등록자 ID             */
                v_Success_Code    ,
                v_Return_Message  ,
                v_ErrorText
                );

        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도해지 할인대상금액 청구스케줄(RTSD0109) 생성 실패!!!'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;



    END IF;

    -- 수납방법(R019) : (A1)무통장 , (C1)CMS이체 , (C2)카드이체 , (P1)카드(PG) , (P2)계좌이체(PG) , (P3)휴대폰(PG)
--    v_Recp_Pay := 'A1';

Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.MfpProctest_07', v_Ord_No, v_Recp_Nu);



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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_InsertRtsd0109CancelSave(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_InsertRtsd0109CancelSave(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0109CancelSave2;


  /*****************************************************************************
  -- 청구스케줄 Update - 중도완납
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109Cancel (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*스케줄상태코드        */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
    v_Recp_Nu       RTSD0109.RECP_NU%TYPE DEFAULT NULL;     /*청구회차         */
    v_Period_Cd     RTSD0108.PERIOD_CD%TYPE DEFAULT NULL;     /*청구회차         */
    
  BEGIN

    SELECT  (-- 청구회차 : 완납일자의 해당 회차
            --SELECT  B.RECP_NU
            SELECT  MIN(B.RECP_NU)
            FROM    RTSD0109 B
            WHERE   B.ORD_NO   = A.ORD_NO
            AND     B.RECP_TP  = '11'
            AND     B.SCD_STAT = 'S'
            AND     B.DEMD_DT >= SUBSTR(v_Cancl_Day,1,6)||'01') RECP_NU,
            --AND     v_Cancl_Day BETWEEN B.BEG_DAY AND B.END_DAY) RECP_NU,  --(20190208 청구회차 불러오는 값이 중도완납 할인회차 불러오는 것과 틀려 수정 : 임준호)
            --AND     SUBSTR(B.DEMD_DT, 1, 6) >= SUBSTR(v_Cancl_Day, 1, 6)) RECP_NU,
            A.PERIOD_CD
    INTO    v_Recp_Nu, v_Period_Cd 
    FROM    RTSD0108 A
    WHERE   A.ORD_NO = v_Ord_No;
       
    -- 마지막회차 인경우
    IF v_Recp_Nu IS NULL THEN

        UPDATE RTSD0109
        SET    SCD_STAT = v_Scd_Stat,
               CHG_ID   = v_Reg_Id,
               CHG_DT   = SYSDATE
        WHERE  ORD_NO   = v_Ord_No
        AND    RECP_TP  = '11'
        AND    SCD_STAT = 'S'
        AND    RECP_NU = v_Period_Cd;

    ELSE 
   
        UPDATE RTSD0109
        SET    SCD_STAT = v_Scd_Stat,
               CHG_ID   = v_Reg_Id,
               CHG_DT   = SYSDATE
        WHERE  ORD_NO   = v_Ord_No
        AND    RECP_TP  = '11'
        AND    SCD_STAT = 'S'
    --    AND    BEG_DAY  > v_Cancl_Day;
        AND    DEMD_DT >= SUBSTR(v_Cancl_Day,1,6)||'01';
        --AND    SUBSTR(DEMD_DT, 1, 6) >= SUBSTR(v_Cancl_Day, 1, 6);
    END IF;
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0109Cancel;


  /*****************************************************************************
  -- 결합고객 할인적용 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109Discount (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Sale_Amt       IN RTSD0109.SALE_AMT%TYPE,       /*매출금액              */
    v_Sale_Namt      IN RTSD0109.SALE_NAMT%TYPE,      /*원금                  */
    v_Sale_Vamt      IN RTSD0109.SALE_VAMT%TYPE,      /*부가세                */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0109
    SET    SALE_AMT  = v_Sale_Amt,
           SALE_NAMT = v_Sale_Namt,
           SALE_VAMT = v_Sale_Vamt,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ORD_NO    = v_Ord_No
    AND    SCHD_SEQ >= v_Schd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0109Discount;

  /*****************************************************************************
  -- 기준년월 청구일자 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109ApplYmZfbDay (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Appl_Ym        IN VARCHAR                       /*기준년월              */
    ) RETURN NUMBER IS

    v_Zfb_Day RTSD0109.ZFB_DAY%TYPE DEFAULT NULL;     /*청구일자              */
  BEGIN

    SELECT ZFB_DAY
    INTO   v_Zfb_Day
    FROM   RTSD0109
    WHERE  ORD_NO   = v_Ord_No
    AND    RECP_TP  = '11'
    AND    SCD_STAT = 'S'
    AND    ZLSPR    = 'N'
    AND    USE_YN   = 'Y'
    AND    ZFB_DAY  BETWEEN v_Appl_Ym||'01'
                    AND     TO_CHAR(LAST_DAY(v_Appl_Ym||'01'),'YYYYMMDD')
    ;

    RETURN v_Zfb_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0109ApplYmZfbDay;


  /*****************************************************************************
  -- 기준년월 청구금액 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109ApplYmSaleAmt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Appl_Ym        IN VARCHAR                       /*기준년월              */
    ) RETURN NUMBER IS

    v_Sale_Amt RTSD0109.SALE_AMT%TYPE DEFAULT 0;      /*청구금액              */
  BEGIN

    SELECT  NVL(SALE_AMT,0)
    INTO    v_Sale_Amt
    FROM    RTSD0109
    WHERE   ORD_NO   = v_Ord_No
    AND     RECP_TP  = '11'
    AND     SCD_STAT = 'S'
    AND     ZLSPR    = 'N'
    AND     USE_YN   = 'Y'
    AND     ZFB_DAY  BETWEEN v_Appl_Ym||'01'
                    AND     TO_CHAR(LAST_DAY(v_Appl_Ym||'01'),'YYYYMMDD');

    RETURN v_Sale_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0109ApplYmSaleAmt;


  /*****************************************************************************
  --  청구스케줄 - (수금내역조회) 선택된 계약번호를 기준으로 청구기간내의 청구내역을 조회한다.
  *****************************************************************************/
  PROCEDURE p_sRtsd0109ChargeCashApp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Zfb_Fd         IN RTSD0109.ZFB_DAY%TYPE,        /*시작청구일자          */
    v_Zfb_Td         IN RTSD0109.ZFB_DAY%TYPE         /*종료청구일자          */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  ORD_NO,
            SCHD_SEQ,
            RECP_TP,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R007', RECP_TP ) AS RECP_NM,
            RECP_NU,
            DEMD_DT,
            ZFB_DAY,
            SALE_AMT,
            RECP_AMT,
            ARRE_AMT,
            RC_DAY,
            PAY_DD
    FROM    RTSD0109
    WHERE   ORD_NO = v_Ord_No
    AND     SCD_STAT = 'S'  -- 매출취소가 발생한회차는 미노출 처리 임준호
    AND     ZFB_DAY BETWEEN v_Zfb_Fd AND v_Zfb_Td;

  END p_sRtsd0109ChargeCashApp;

  /*****************************************************************************
  --  수금관리(팝업) 청구/수납내역 조회
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-09-19  wjim             [20170224_01] 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0109CollectForReq (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Ord_No         IN RTSD0109.ORD_NO%TYPE        /*계약번호              */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  ''          AS CHK
         ,  A1.CUST_NO
         ,  A1.ORD_NO
         ,  A1.SCHD_SEQ
         ,  A1.RECP_TP
         ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('R007', A1.RECP_TP) AS RECP_NM
         ,  A1.RECP_NU
         ,  A1.DEMD_DT
         ,  A1.ZFB_DAY
         ,  A1.SALE_AMT
         ,  A1.RECP_AMT
         ,  A1.ARRE_AMT
         ,  A1.RC_DAY
      FROM  RTSD0109 A1
     WHERE  A1.ORD_NO = v_Ord_No
     ORDER  BY A1.SCHD_SEQ
    ;

  END p_sRtsd0109CollectForReq;

  /*****************************************************************************
   -- 미납내역 상세 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0109UnpaidList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                  , v_Ord_No   IN RTSD0109.ORD_NO%TYPE  /* 계약번호 */
                                  , v_Cust_No  IN RTSD0109.CUST_NO%TYPE /* 고객번호 */
                                 )
  IS

  BEGIN
      OPEN Ref_Cursor FOR
          SELECT  ORD_NO                                                       /* 계약번호 */
                , SCHD_SEQ                                                     /* 청구순번 */
                , RECP_NU                                                      /* 청구회차 */
                , RECP_TP                                                      /* 청구구분코드 */
                , Pkg_Rtcm0051.f_sRtcm0051CodeName('R007', RECP_TP) AS RECP_NM /* 청구구분명 */
                , DEMD_DT                                                      /* 청구일자 */
                , ZFB_DAY                                                      /* 만기계산기준일 */
                , SALE_AMT                                                     /* 청구금액 */
                , RECP_AMT                                                     /* 수납금액 */
                , ARRE_AMT                                                     /* 미납금액 */
                , Pkg_Rtre0220.f_getExistsVacc(CUST_NO, ORD_NO, ORD_NO, SCHD_SEQ) AS VACC_ISSUE  /* 가상계좌발급여부 */
          FROM    RTSD0109
          WHERE   RC_YN  <> 'Y'
          AND     ZFB_DAY < TO_CHAR(SYSDATE, 'YYYYMMDD')
          AND     CUST_NO = v_Cust_No
          AND     ORD_NO  = DECODE(v_Ord_No, NULL, ORD_NO, v_Ord_No)
          AND     SCD_STAT = 'S';
                                      
  END p_sRtsd0109UnpaidList;
  
  /*****************************************************************************
  -- 조회시점 청구회차 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109SearchRecpNu (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Req_Dt         IN RTSD0109.ZFB_DAY%TYPE        /*요청일자              */
    ) RETURN NUMBER IS

    v_Recp_Nu RTSD0109.RECP_NU%TYPE DEFAULT NULL;    /*청구회차              */
  BEGIN

    SELECT  RECP_NU
    INTO    v_Recp_Nu
    FROM    RTSD0109 
    WHERE   ORD_NO   = v_Ord_No
    AND     RECP_TP  = '11'
    AND     SCD_STAT = 'S'
    AND     v_Req_Dt BETWEEN BEG_DAY AND END_DAY ; 

    RETURN v_Recp_Nu;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0109SearchRecpNu;
   
  /*****************************************************************************
  -- 조회시점 부터 현재 까지 청구횟수 
  *****************************************************************************/
  FUNCTION f_sRtsd0109RecpNuCnt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Req_Dt         IN RTSD0109.ZFB_DAY%TYPE        /*요청일자              */
    ) RETURN NUMBER IS

    v_Recp_Nu_Cnt RTSD0109.RECP_NU%TYPE DEFAULT NULL;    /*청구회차              */
  BEGIN

    v_Recp_Nu_Cnt := NVL(f_sRtsd0109SearchRecpNu(v_Ord_No, TO_CHAR(SYSDATE, 'YYYYMMDD')), 0) - NVL(f_sRtsd0109SearchRecpNu(v_Ord_No, v_Req_Dt),0);

    RETURN v_Recp_Nu_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0109RecpNuCnt;
  
  
  /*****************************************************************************
  -- 조회시점 부터 현재 까지 청구횟수 
  *****************************************************************************/
  FUNCTION f_sRtsd0109SaleRecpNuCnt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Req_Dt         IN RTSD0109.ZFB_DAY%TYPE        /*요청일자              */
    ) RETURN NUMBER IS

    v_Cnt RTSD0109.RECP_NU%TYPE DEFAULT NULL;    /*청구회차              */
  BEGIN

    SELECT  COUNT(*) CNT
    INTO    v_Cnt
    FROM    RTSD0109 
    WHERE   ORD_NO   = v_Ord_No
    AND     RECP_TP  = '11'
    AND     SCD_STAT = 'S'
    AND     ARRE_AMT = 0
    AND     RECP_AMT != 0
    AND     BEG_DAY BETWEEN v_Req_Dt AND TO_CHAR(SYSDATE, 'YYYYMMDD');   

    RETURN v_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0109SaleRecpNuCnt;
  
  
  /*****************************************************************************
  -- 패키지 해지시 위약금 여부
  *****************************************************************************/
  FUNCTION f_sRtsd0109PenaltyAmt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2 IS

    v_Penalt_Amt     VARCHAR2(10);                    /*위약금                */
  BEGIN

    SELECT GREATEST(NVL(AA.DC_AMT * (AA.CNT+1), 0), 0) AS PENALTY_AMT
      INTO v_Penalt_Amt
      FROM ( SELECT A.ORD_NO,
                    A.DC_AMT - GREATEST(NVL(LEAD(A.DC_AMT) OVER(ORDER BY A.SEQ DESC), 0),0) AS DC_AMT,
                    A.CHG_DT,
                    (PKG_RTSD0109.f_sRtsd0109SaleRecpNuCnt(A.ORD_NO, TO_CHAR(A.CHG_DT, 'YYYYMMDD'))) AS CNT  
               FROM RTSD0040 A
              WHERE A.ORD_NO = v_Ord_No
              ORDER BY A.SEQ DESC ) AA
     WHERE ROWNUM = 1 ;

    RETURN v_Penalt_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN '0';

  END f_sRtsd0109PenaltyAmt;
  
  /*****************************************************************************
  -- 청구스케줄 단체 및 페기지 등록, 해약시 재설정
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109SchGrpYnSet (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Grp_YN         IN RTSD0104.GRP_YN%TYPE,         /*등록해지여부          */
    v_Penalt_Amt     IN RTSD0109.RECP_AMT%TYPE,       /*위약금                */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Recp_Nu       RTSD0109.RECP_NU%TYPE DEFAULT NULL;     /*청구회차         */
    --v_max_schd_seq  RTSD0109.SCHD_SEQ%TYPE DEFAULT NULL;  /* SCHD_SEQ 최대값 */
    --v_Penalt_Amt     RTSD0109.RECP_AMT%TYPE DEFAULT 0 ;     /*위약금           */
    v_Cust_No       RTSD0109.CUST_NO%TYPE DEFAULT NULL;     /*고객번호*/
    v_Sbs_Day       RTRE0035.PND_DAY%TYPE DEFAULT NULL;     /*선수 정리금액*/
    v_Recv_Seq      RTRE0035.RECV_SEQ%TYPE DEFAULT NULL;    /*수납거래번호*/
    v_Ritm_Seq      RTRE0035.RITM_SEQ%TYPE DEFAULT NULL;    /*거래일련번호 */
        
    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계약번호,  등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

   
    
    v_Recp_Nu := f_sRtsd0109SearchRecpNu(v_Ord_No, TO_CHAR(SYSDATE, 'YYYYMMDD'));
    
    IF (v_Recp_Nu IS NULL) THEN
        v_Return_Message := '변경 회차가 존재하지 않습니다.';
        RAISE e_Error;
    END IF;
    
    IF(v_Recp_Nu IS NOT NULL) THEN      
    
        IF(v_Grp_YN = 'N') THEN  -- 등록해지일 경우 위약금
            --v_Penalt_Amt := f_sRtsd0109PenaltyAmt(v_Ord_No); 
            
            INSERT  INTO RTSD0109 (
                    ORD_NO,                                   /*계약번호            */
                    SCHD_SEQ,                                 /*청구순번            */
                    RECP_TP,                                  /*청구구분            */
                    RECP_NU,                                  /*청구회차            */
                    SCD_STAT,                                 /*스케줄상태코드      */
                    SALE_AMT,                                 /*매출금액(VAT 포함)  */
                    SALE_NAMT,                                /*원금                */
                    SALE_VAMT,                                /*부가세              */
                    RECP_AMT,                                 /*수납금액(VAT포함)   */
                    ARRE_AMT,                                 /*연체금액(VAT포함)   */
                    DEMD_DT,                                  /*청구일자            */
                    ZLSPR,                                    /*청구보류            */
                    RC_DAY,                                   /*수납일자            */
                    RC_YN,                                    /*수납여부            */
                    TAX_DT,                                   /*세금계산서발행일자  */
                    TAX_NO,                                   /*세금계산서번호      */
                    ZFB_DAY,                                  /*만기계산기준일      */
                    CANCL_DAY,                                /*중도완납일          */
                    CUST_NO,                                  /*고객번호            */
                    SALES_GROUP,                              /*지사                */
                    SALES_OFFICE,                             /*지점                */
                    AGENCY_CD,                                /*장착 대리점         */
                    BEG_DAY,                                  /*시작일              */
                    END_DAY,                                  /*종료일              */
                    DELAY_YN,                                 /*연체이자적용여부    */
                    DELAY_RATE,                               /*연체 이자율         */
                    PAY_MTHD,                                 /*결제구분            */
                    PAY_DD,                                   /*이체일              */
                    USE_YN,                                   /*사용여부            */
                    REG_ID,                                   /*등록자 ID           */
                    REG_DT,                                   /*등록일              */
                    CHG_ID,                                   /*변경자 ID           */
                    CHG_DT                                    /*변경일              */
                    )
            SELECT   A.ORD_NO,                                    /*계약번호            */ 
                     A.SCHD_SEQ_NEW,                            /*청구순번            */ 
                     '42',                                        /*청구구분            */ 
                     A.RECP_NU_NEW,                                /*청구회차            */ 
                     'S',                                        /*스케줄상태코드      */ 
                     v_Penalt_Amt,                                /*매출금액(VAT 포함)  */ 
                     v_Penalt_Amt,                                /*원금                */ 
                     0,                                            /*부가세              */ 
                     0,                                            /*수납금액(VAT포함)   */ 
                     v_Penalt_Amt,                                /*연체금액(VAT포함)   */ 
                     TO_CHAR(SYSDATE, 'YYYYMMDD'),                /*청구일자            */ 
                     A.ZLSPR,                                    /*청구보류            */ 
                     TO_CHAR(SYSDATE, 'YYYYMMDD'),                /*수납일자            */ 
                     A.RC_YN,                                    /*수납여부            */ 
                     TO_CHAR(SYSDATE, 'YYYYMMDD'),                /*세금계산서발행일자  */ 
                     TO_CHAR(SYSDATE, 'YYYYMMDD'),                /*세금계산서번호      */ 
                     TO_CHAR(SYSDATE, 'YYYYMMDD'),                /*만기계산기준일      */ 
                     A.CANCL_DAY,                                /*중도완납일          */ 
                     A.CUST_NO,                                    /*고객번호            */ 
                     A.SALES_GROUP,                                /*지사                */ 
                     A.SALES_OFFICE,                            /*지점                */ 
                     A.AGENCY_CD,                                /*장착 대리점         */ 
                     A.BEG_DAY,                                    /*시작일              */ 
                     A.END_DAY,                                    /*종료일              */ 
                     A.DELAY_YN,                                /*연체이자적용여부    */ 
                     A.DELAY_RATE,                                /*연체 이자율         */ 
                     A.PAY_MTHD,                                /*결제구분            */ 
                     A.PAY_DD,                                    /*이체일              */ 
                     A.USE_YN,                                    /*사용여부            */ 
                     v_Reg_Id,                                    /*등록자 ID           */
                     SYSDATE,                                   /*등록일              */
                     v_Reg_Id,                                    /*변경자 ID           */
                     SYSDATE                                    /*변경일              */
            FROM    ( SELECT * 
                        FROM ( SELECT MAX(A.SCHD_SEQ+1) OVER() AS SCHD_SEQ_NEW, v_Recp_Nu AS RECP_NU_NEW, A.*
                                 FROM RTSD0109 A
                                WHERE A.ORD_NO = v_Ord_No) B
                       WHERE B.RECP_NU = v_Recp_Nu
                         AND B.SCD_STAT = 'S'
                    ) A;
        END IF;       

        UPDATE RTSD0109
        SET    SCD_STAT = 'T',               
               CHG_ID   = v_Reg_Id,
               CHG_DT   = SYSDATE
        WHERE  ORD_NO   = v_Ord_No
        AND    RECP_NU >= v_Recp_Nu
        AND    RECP_TP  = '11'
        AND    SCD_STAT = 'S';
        
        
        INSERT  INTO RTSD0109 (
                ORD_NO,                                   /*계약번호            */           
                SCHD_SEQ,                                 /*청구순번            */      
                RECP_TP,                                  /*청구구분            */
                RECP_NU,                                  /*청구회차            */
                SCD_STAT,                                 /*스케줄상태코드      */
                SALE_AMT,                                 /*매출금액(VAT 포함)  */
                SALE_NAMT,                                /*원금                */
                SALE_VAMT,                                /*부가세              */
                RECP_AMT,                                 /*수납금액(VAT포함)   */
                ARRE_AMT,                                 /*연체금액(VAT포함)   */
                DEMD_DT,                                  /*청구일자            */
                ZLSPR,                                    /*청구보류            */
                RC_DAY,                                   /*수납일자            */
                RC_YN,                                    /*수납여부            */
                TAX_DT,                                   /*세금계산서발행일자  */
                TAX_NO,                                   /*세금계산서번호      */
                ZFB_DAY,                                  /*만기계산기준일      */
                CANCL_DAY,                                /*중도완납일          */
                CUST_NO,                                  /*고객번호            */
                SALES_GROUP,                              /*지사                */
                SALES_OFFICE,                             /*지점                */
                AGENCY_CD,                                /*장착 대리점         */
                BEG_DAY,                                  /*시작일              */
                END_DAY,                                  /*종료일              */
                DELAY_YN,                                 /*연체이자적용여부    */
                DELAY_RATE,                               /*연체 이자율         */
                PAY_MTHD,                                 /*결제구분            */
                PAY_DD,                                   /*이체일              */
                USE_YN,                                   /*사용여부            */
                REG_ID,                                   /*등록자 ID           */
                REG_DT,                                   /*등록일              */
                CHG_ID,                                   /*변경자 ID           */
                CHG_DT                                    /*변경일              */
                )
        SELECT   A.ORD_NO,                                    /*계약번호            */ 
           
           CASE
               WHEN v_Grp_YN = 'Y' THEN A.SCHD_SEQ_NEW   
               WHEN v_Grp_YN = 'N' THEN A.SCHD_SEQ_NEW+1 
           END AS SCHD_SEQ_NEW,                             /*청구순번            */ 
                 A.RECP_TP,                                    /*청구구분            */ 
                 A.RECP_NU,                                    /*청구회차            */ 
                 'S',                                        /*스케줄상태코드      */ 
                 A.L_AMT,                                    /*매출금액(VAT 포함)  */ 
                 ROUND(A.L_AMT / 1.1, 0) SALE_NAMT,                  -- 원금               : SALE_AMT / 1.1 소수점 1자리에서 반올림
                 A.L_AMT - ROUND(A.L_AMT / 1.1, 0) SALE_VAMT,        -- 부가세             : SALE_AMT - SALE_NAMT
                 A.RECP_AMT,                                /*수납금액(VAT포함)   */ 
                 A.L_AMT,                                    /*연체금액(VAT포함)   */ 
                 A.DEMD_DT,                                    /*청구일자            */ 
                 A.ZLSPR,                                    /*청구보류            */ 
                 A.RC_DAY,                                    /*수납일자            */ 
                 A.RC_YN,                                    /*수납여부            */ 
                 A.TAX_DT,                                    /*세금계산서발행일자  */ 
                 A.TAX_NO,                                    /*세금계산서번호      */ 
                 A.ZFB_DAY,                                    /*만기계산기준일      */ 
                 A.CANCL_DAY,                                /*중도완납일          */ 
                 A.CUST_NO,                                    /*고객번호            */ 
                 A.SALES_GROUP,                                /*지사                */ 
                 A.SALES_OFFICE,                            /*지점                */ 
                 A.AGENCY_CD,                                /*장착 대리점         */ 
                 A.BEG_DAY,                                    /*시작일              */ 
                 A.END_DAY,                                    /*종료일              */ 
                 A.DELAY_YN,                                /*연체이자적용여부    */ 
                 A.DELAY_RATE,                                /*연체 이자율         */ 
                 A.PAY_MTHD,                                /*결제구분            */ 
                 A.PAY_DD,                                    /*이체일              */ 
                 A.USE_YN,                                    /*사용여부            */ 
                 A.REG_ID,                                    /*등록자 ID           */
                 SYSDATE,                                   /*등록일              */
                 v_Reg_Id,                                    /*변경자 ID           */
                 SYSDATE                                    /*변경일              */
        FROM    ( SELECT ROWNUM + MAX(SCHD_SEQ) OVER() AS SCHD_SEQ_NEW, B.L_AMT, A.*
                    FROM RTSD0109 A, RTSD0047 B
                   WHERE A.ORD_NO = B.ORD_NO 
                     AND A.ORD_NO = v_Ord_No
                     AND A.SCD_STAT = 'T'
                     AND A.RECP_TP  = '11'
                     AND A.RECP_NU >= v_Recp_Nu
                ) A;
        
        UPDATE RTSD0109
        SET    SCD_STAT = 'C'
        WHERE  ORD_NO   = v_Ord_No
        AND    RECP_NU >= v_Recp_Nu
        AND    SCD_STAT = 'T'
        AND    RECP_TP  = '11';
        
        -- 위약금이 있는경우 선수금잡힌 위약금을 정리해준다.        
        IF v_Penalt_Amt != '0' THEN        
            -- 위약금 선수금 정보취득
            SELECT CUST_NO, PND_DAY, RECV_SEQ, RITM_SEQ
              INTO v_Cust_No, v_Sbs_Day, v_Recv_Seq, v_Ritm_Seq
              FROM RTRE0035
             WHERE 1=1
               AND ORD_NO = v_Ord_No
               AND PND_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD')
               AND PND_STAT <> 'S';         
            
            Pkg_Rtre0035.p_UpdateRtre0035PkgClear (v_Sbs_Day, v_Ord_No, v_Cust_No, v_Recv_Seq, v_Ritm_Seq, 'P', v_Reg_Id,
                                                   v_Success_Code, v_Return_Message, v_ErrorText);
            IF 0 != v_Success_Code THEN
                v_Return_Message := '위약금 정리 실패!!('||v_Ord_No||')-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;          
        END IF;        
        
        v_Success_code := 0;
        v_Return_Message := '정상적으로 등록되었습니다';
        v_ErrorText := '';
        --COMMIT;
    END IF;
    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_InsertRtsd0109SchGrpYnSet(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_InsertRtsd0109SchGrpYnSet(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0109SchGrpYnSet;
   
  /*****************************************************************************
   -- 선납매출 Update
   *****************************************************************************/
    PROCEDURE p_UpdateRtsd0109SalesPrpt(  v_Ord_No         IN  RTSD0109.ORD_NO%TYPE   /* 계약번호 */
                                        , v_Schd_Seq_U     IN  RTSD0109.SCHD_SEQ%TYPE /* 청구순번 Update */
                                        , v_Scd_Stat_U     IN  RTSD0109.SCD_STAT%TYPE /* 스케줄상태코드 Update */
                                        , v_Reg_Id         IN  RTSD0109.REG_ID%TYPE   /* 등록자 ID */
                                        , v_Success_Code   OUT NUMBER
                                        , v_Return_Message OUT VARCHAR2
                                        , v_ErrorText      OUT VARCHAR2
                                       )
    IS
        
    e_Error EXCEPTION;
        
    BEGIN
        
    UPDATE  RTSD0109
    SET     SCD_STAT = v_Scd_Stat_U
          , CHG_ID   = v_Reg_Id
          , CHG_DT   = SYSDATE
    WHERE   ORD_NO   = v_Ord_No
    AND     RECP_TP  = '11'
    AND     SCD_STAT = 'S'
    AND     SCHD_SEQ = v_Schd_Seq_U;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';
    
    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_UpdateRtsd0109SalesPrpt(1)', v_ErrorText, v_Return_Message);
        
        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL(TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
            Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_UpdateRtsd0109SalesPrpt(2)', v_ErrorText, v_Return_Message);
    END p_UpdateRtsd0109SalesPrpt;

  /*****************************************************************************
  -- 납부회차 MAX획득
  *****************************************************************************/
  FUNCTION f_sRtsd0109MaxRecpNu(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE           /*계약번호            */
    ) RETURN NUMBER IS

    v_amx_recp_nu   NUMBER DEFAULT 0;
  BEGIN

    SELECT  MAX(RECP_NU) 
    INTO    v_amx_recp_nu
    FROM    RTSD0109
    WHERE   ORD_NO   = v_Ord_No
    AND     SCD_STAT   = 'S' ;

    RETURN v_amx_recp_nu;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0109MaxRecpNu;
  
  /*****************************************************************************
  -- 청구스케줄 관리 - 채권매각 처리를 위한 임시 프로그램

  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  X.X        2019-04-30  wjim             [20190430_01] 신규생성
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109CancelSave3 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*종료유형(S070:E,C)    */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Recp_Amt       IN RTSD0109.RECP_AMT%TYPE,       /*수납금액(VAT포함)     */
    v_Arre1_Amt      IN RTSD0109.ARRE_AMT%TYPE,       /*할인미대상            */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Mfp_Yn       RTSD0108.MFP_YN%TYPE DEFAULT NULL;      /*중도완납여부     */
    v_Equ_No       RTSD0108.EQU_NO%TYPE DEFAULT NULL;      /*설비번호         */
    v_Close_Yn     RTCS0001.CLOSE_YN%TYPE  DEFAULT NULL;   /*종료여부         */
    v_Scd_Stat     RTSD0109.SCD_STAT%TYPE DEFAULT NULL;    /*스케줄상태코드   */

    v_Schd_Seq     RTSD0109.SCHD_SEQ%TYPE DEFAULT NULL;    /*청구순번         */
    v_Sale_Amt     RTSD0109.SALE_NAMT%TYPE DEFAULT NULL;   /*매출금액         */
    v_Sale_Namt    RTSD0109.SALE_NAMT%TYPE DEFAULT NULL;   /*원금             */
    v_Sale_Vamt    RTSD0109.SALE_VAMT%TYPE DEFAULT NULL;   /*부가세           */

    v_Period_Cd    RTSD0108.PERIOD_CD%TYPE DEFAULT NULL;   /*렌탈기간         */
    v_Recp_Nu      RTSD0109.RECP_NU%TYPE DEFAULT NULL;     /*청구회차         */
    v_Cust_No      RTSD0109.CUST_NO%TYPE DEFAULT NULL;     /*고객번호         */
    v_Sales_Group  RTSD0109.SALES_GROUP%TYPE DEFAULT NULL; /*지사             */
    v_Sales_Office RTSD0109.SALES_OFFICE%TYPE DEFAULT NULL;/*지점             */
    v_Agency_Cd    RTSD0109.AGENCY_CD%TYPE DEFAULT NULL;   /*장착 대리점      */
    v_Pay_Mthd     RTSD0109.PAY_MTHD%TYPE DEFAULT NULL;    /*결제구분         */
    v_Pay_Dd       RTSD0109.PAY_DD%TYPE DEFAULT NULL;      /*이체일           */

    v_Recp_Pay     RTRE0041.RECP_PAY%TYPE DEFAULT NULL;    /*수납방법         */
    v_Arre_Amt     RTRE0031.ARRE_AMT%TYPE DEFAULT NULL;    /*연체금액         */
    v_Arre2_Amt     RTRE0031.ARRE_AMT%TYPE DEFAULT NULL;    /*마지막회차시 월렌탈료         */
    v_Arre1_Chk_Amt RTRE0031.ARRE_AMT%TYPE DEFAULT NULL;    /*연체금액 비교         */
    ls_Equ_No       RTCS0001.EQU_NO%TYPE DEFAULT NULL;
    ln_Deny_Seq     RTCS0013.DENY_SEQ%TYPE DEFAULT NULL;
    ls_Deny_Yn      RTCS0013.DENY_YN%TYPE DEFAULT NULL;
    
    v_Cancl_Day2    RTSD0109.CANCL_DAY%TYPE;
    
    v_chk_cnt       number;

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 계약번호,종료유형,중도완납일, 수납금액, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_End_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S070', v_End_Tp)) THEN
        v_Return_Message := '종료유형('||v_End_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Cancl_Day) THEN
        v_Return_Message := '중도완납일('||v_Cancl_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recp_Amt) IS NULL THEN
        v_Return_Message := '수납금액('||v_Recp_Amt||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 계약상태(S032)가 장착완료상태(04)가 아닌 경우 처리 불가
    IF '04' != Pkg_Rtsd0108.f_sRtsd0108StatCd(v_Ord_No) THEN
        v_Return_Message := '해당 주문번호('||v_Ord_No||')는 장착완료상태가 아니므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
--    SELECT COUNT(*)
--      INTO v_chk_cnt
--      FROM RTTEMPIWJ_190429_01
--     WHERE COL_01 = v_Ord_No;
--     
--    IF v_chk_cnt > 0 THEN
--        v_Return_Message := '채권매각대상이므로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;     

    -- 연체금액 화면 입력값과 비교하기 위함
--    SELECT NVL(A.ARRE1_AMT,0)
--      INTO v_Arre1_Chk_Amt
--      FROM ( 
--            SELECT  ORD_NO,
--                    SUM(ARRE1_AMT) + (SUM(REGI_AMT) - SUM(RGCP_AMT)) AS ARRE1_AMT
--            FROM    (
--                    SELECT  A1.ORD_NO, A1.RECP_TP,
--                            DECODE(A1.RECP_TP, '01', A1.SALE_AMT, 0) REGI_AMT,
--                            DECODE(A1.RECP_TP, '01', A1.RECP_AMT, 0) RGCP_AMT,
--                            CASE
--                                WHEN A1.DEMD_DT < SUBSTR(v_Cancl_Day,1,6)||'01' THEN DECODE(A1.RECP_TP, '11', A1.ARRE_AMT,0)
--                            ELSE 0 END AS ARRE1_AMT
--                    FROM    RTSD0109 A1
--                    WHERE   A1.ORD_NO   = v_Ord_No            
--                    AND     A1.SCD_STAT = 'S'
--                    )
--            GROUP   BY ORD_NO
--            ) A;
--    
--    --연체금입력항목 체크        
--    IF v_Arre1_Chk_Amt != v_Arre1_Amt THEN
--        v_Return_Message := '할인미대상 금액('||v_Arre1_Amt||') : 할인미대상 금액이 실제 할인미대상 금액('||v_Arre1_Chk_Amt||') 과 다름으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;  

    -- 중도완납여부
    v_Mfp_Yn := 'Y';

    -- 장착 정보 Update - 중도완납
    IF 0 != Pkg_Rtsd0108.f_UpdateRtsd0108Cancel(v_Ord_No, v_Cancl_Day, v_Mfp_Yn, v_End_Tp,
                                                v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '중도완납 장착 정보(RTSD0108) Update 실패!!!'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 장착 정보 - 계약번호로 설비번호 획득
    v_Equ_No := Pkg_Rtsd0108.f_sRtsd0108EquNo(v_Ord_No);

    -- 계약종료여부(Y)
    v_Close_Yn := 'Y';

    -- 설비 정보 Update - 중도완납
    IF 0 != Pkg_Rtcs0001.f_UpdateRtcs0001Cancel(v_Equ_No, v_Ord_No, v_Close_Yn, v_Cancl_Day,
                                                v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '중도완납 설비 정보(RTCS0001) Update 실패!!!'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 중도완납(C)
    v_Scd_Stat := 'C';

--    SELECT  (-- 청구회차 : 완납일자의 해당 회차
--            --SELECT  B.RECP_NU
--            SELECT  MIN(B.RECP_NU)
--            FROM    RTSD0109 B
--            WHERE   B.ORD_NO   = A.ORD_NO
--            AND     B.RECP_TP  = '11'
--            AND     B.SCD_STAT = 'S'
--            AND     B.DEMD_DT >= SUBSTR(v_Cancl_Day,1,6)||'01') RECP_NU,
--            --AND     v_Cancl_Day BETWEEN B.BEG_DAY AND B.END_DAY) RECP_NU,  --(20190208 청구회차 불러오는 값이 중도완납 할인회차 불러오는 것과 틀려 수정 : 임준호)
--            --AND     SUBSTR(B.DEMD_DT, 1, 6) >= SUBSTR(v_Cancl_Day, 1, 6)) RECP_NU,
--            A.CUST_NO, A.SALES_GROUP, A.SALES_OFFICE, A.AGENCY_CD, A.PAY_MTHD, A.PAY_DD, A.PERIOD_CD
--    INTO    v_Recp_Nu, v_Cust_No, v_Sales_Group, v_Sales_Office, v_Agency_Cd, v_Pay_Mthd, v_Pay_Dd , v_Period_Cd
--    FROM    RTSD0108 A
--    WHERE   A.ORD_NO = v_Ord_No;

    -- [20210630_01] kstka 속도이슈로 사전 데이터 생성 후 처리
    SELECT A.RECP_NU,
            A.CUST_NO, A.SALES_GROUP, A.SALES_OFFICE, A.AGENCY_CD, A.PAY_MTHD, A.PAY_DD, A.PERIOD_CD
    INTO    v_Recp_Nu, v_Cust_No, v_Sales_Group, v_Sales_Office, v_Agency_Cd, v_Pay_Mthd, v_Pay_Dd , v_Period_Cd 
    FROM RTTEMPIWJ_210630_08 A
    WHERE A.ORD_NO = v_Ord_No;
    
--    -- 청구스케줄 Update - 중도완납
--    IF 0 != Pkg_Rtsd0109.f_UpdateRtsd0109Cancel(v_Ord_No, v_Cancl_Day, v_Scd_Stat, v_Reg_Id,
--                                                v_ErrorText) THEN
--        v_Return_Message := '중도완납 청구스케줄(RTSD0109) Update 실패!!!'||v_ErrorText;
--        v_ErrorText := v_ErrorText;
--        RAISE e_Error;
--    END IF;
    
    FOR cur1 IN (
        SELECT  *
          FROM  RTSD0109 A1
         WHERE  A1.ORD_NO = v_Ord_No
           AND  A1.SCD_STAT = 'S'
    ) LOOP
    
        IF cur1.DEMD_DT >= '20210601' OR cur1.ARRE_AMT > 0 THEN
--        IF cur1.DEMD_DT >= '20190401' OR cur1.ARRE_AMT > 0 THEN
            UPDATE RTSD0109
            SET    SCD_STAT = v_Scd_Stat,
                   CHG_ID   = v_Reg_Id,
                   CHG_DT   = SYSDATE
            WHERE  ORD_NO   = v_Ord_No
            AND    SCHD_SEQ = cur1.SCHD_SEQ;
            
            INSERT INTO RTTEMPIWJ_210630_07 (COL_01, COL_02, COL_03) VALUES (v_Ord_No, cur1.SCHD_SEQ, 'U');
        END IF;
    
    END LOOP;

    ----------------------------------------------
    -- 방문점검 점검거부 자동등록 [20180425_01] --
    ----------------------------------------------

    -- 설비번호 획득
    SELECT  EQU_NO
      INTO  ls_Equ_No
      FROM  RTCS0001
     WHERE  ORD_NO = v_Ord_No;

    -- 방문점검 마지막 거부등록 순번 획득
    SELECT  NVL(MAX(DENY_SEQ), 0)
      INTO  ln_Deny_Seq
      FROM  RTCS0013
     WHERE  ORD_NO = v_Ord_No
       AND  EQU_NO = ls_Equ_No;

    IF ln_Deny_Seq > 0 THEN
        SELECT  DENY_YN
          INTO  ls_Deny_Yn
          FROM  RTCS0013
         WHERE  ORD_NO   = v_Ord_No
           AND  EQU_NO   = ls_Equ_No
           AND  DENY_SEQ = ln_Deny_Seq;

    ELSE
        ls_Deny_Yn := 'N';

    END IF;

    -- 방문점검 점검거부 이력등록
    IF ls_Deny_Yn = 'N' THEN
        INSERT INTO RTCS0013 (
              ORD_NO
            , EQU_NO
            , DENY_SEQ
            , DENY_YN
            , DENY_YMD
            , DENY_ID
            , DENY_STD_YM
            , DENY_DESC
            , WTHDRW_YMD
            , WTHDRW_ID
            , WTHDRW_STD_YM
            , WTHDRW_DESC
            , REG_ID
            , REG_DT
            , CHG_ID
            , CHG_DT
        ) VALUES (
              v_Ord_No
            , ls_Equ_No
            , ln_Deny_Seq + 1
            , 'Y'
            , TO_CHAR(SYSDATE, 'YYYYMMDD')
            , v_Reg_Id
            , TO_CHAR(SYSDATE, 'YYYYMM')
            , '중도완납(해약)에 따른 점검거부 자동등록'
            , NULL
            , NULL
            , NULL
            , NULL
            , v_Reg_Id
            , SYSDATE
            , v_Reg_Id
            , SYSDATE
        );
    END IF;

    -- 당월 이후 방문점검 배정 점검거부 처리 [20180419_01]
    UPDATE  RTCS0005
       SET  CHK_STAT  = '05'
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  ORD_NO    = v_Ord_No
       AND  STD_YM   >= TO_CHAR(SYSDATE, 'YYYYMM')
       AND  CHK_STAT NOT IN ('04', '05') --처리완료, 점검거부 건은 제외
    ;

    -- 종료유형(S070:E,C)
    IF v_End_Tp  = 'E' THEN

        IF v_Recp_Nu IS NULL THEN

            v_Recp_Nu  := v_Period_Cd;
            -- 마지막회차 금액            
            SELECT  ARRE_AMT
            INTO    v_Arre2_Amt
            FROM    RTSD0109 
            WHERE   ORD_NO   = v_Ord_No
            AND     RECP_TP  = '11'
            AND     SCD_STAT = 'C'
            AND     RECP_NU = v_Recp_Nu;
            
            -- 마지막회차 이전 연체금
            SELECT  SUM(ARRE_AMT)
            INTO    v_Arre_Amt
            FROM    RTSD0109 
            WHERE   ORD_NO   = v_Ord_No
            AND     RECP_TP  = '11'
            AND     SCD_STAT = 'S';
                           

            IF v_Recp_Amt = v_Arre2_Amt THEN
               -- 마지막회차가 미할인대상이며 금액이 같은경우
               v_Sale_Amt := v_Recp_Amt;
            ELSE
               -- 금액이 다른경우 마지막회차 이외의 연첵름을 뺀 금액을 매출생성
               v_Sale_Amt := v_Recp_Amt - v_Arre_Amt;
               --v_Sale_Amt := TRUNC(v_Sale_Amt,-1);
            END IF;
            
            --v_Sale_Amt := v_Recp_Amt - v_Arre2_Amt;
                         
        ELSE
            -- 연체금액: 수납금액 - 할인미대상
            v_Sale_Amt :=  v_Recp_Amt - v_Arre1_Amt;
              
        END IF;

        -- 원금 : 매출금액 / 1.1 소수점 1자리에서 반올림
        v_Sale_Namt := ROUND(v_Sale_Amt/1.1);

        -- 부가세 : 매출금액 - 원금
        v_Sale_Vamt := v_Sale_Amt - NVL(v_Sale_Namt,0);

        -- 중도완납 할인대상금액 청구스케줄(RTSD0109) 생성
        Pkg_Rtsd0109.p_IUDRtsd0109 (
                'I'               , /*(v_Comm_Dvsn   )처리구분(I,U,D)       */
                v_Ord_No          , /*(v_Ord_No      )계약번호              */
                v_Schd_Seq        , /*(v_Schd_Seq    )청구순번              */
                '11'              , /*(v_Recp_Tp     )청구구분              */
                v_Recp_Nu         , /*(v_Recp_Nu     )청구회차              */
                'S'               , /*(v_Scd_Stat    )스케줄상태코드        */
                v_Sale_Amt        , /*(v_Sale_Amt    )매출금액(VAT 포함)    */
                v_Sale_Namt       , /*(v_Sale_Namt   )원금                  */
                v_Sale_Vamt       , /*(v_Sale_Vamt   )부가세                */
                0                 , /*(v_Recp_Amt    )수납금액(VAT포함)     */
                v_Sale_Amt        , /*(v_Arre_Amt    )연체금액(VAT포함)     */
                v_Cancl_Day       , /*(v_Demd_Dt     )청구일자              */
                'N'               , /*(v_Zlspr       )청구보류              */
                NULL              , /*(v_Rc_Day      )수납일자              */
                'N'               , /*(v_Rc_Yn       )수납여부              */
                v_Cancl_Day       , /*(v_Tax_Dt      )세금계산서발행일자(예 */
                NULL              , /*(v_Tax_No      )세금계산서번호        */
                v_Cancl_Day       , /*(v_Zfb_Day     )만기계산기준일        */
                v_Cancl_Day       , /*(v_Cancl_Day   )중도완납일            */
                v_Cust_No         , /*(v_Cust_No     )고객번호              */
                v_Sales_Group     , /*(v_Sales_Group )지사                  */
                v_Sales_Office    , /*(v_Sales_Office)지점                  */
                v_Agency_Cd       , /*(v_Agency_Cd   )장착 대리점           */
                v_Cancl_Day       , /*(v_Beg_Day     )시작일                */
                v_Cancl_Day       , /*(v_End_Day     )종료일                */
                'N'               , /*(v_Delay_Yn    )연체이자적용여부      */
                0                 , /*(v_Delay_Rate  )연체 이자율           */
                v_Pay_Mthd        , /*(v_Pay_Mthd    )결제구분              */
                v_Pay_Dd          , /*(v_Pay_Dd      )이체일                */
                'Y'               , /*(v_Use_Yn      )사용여부              */
                v_Reg_Id          , /*(v_Reg_Id      )등록자 ID             */
                v_Success_Code    ,
                v_Return_Message  ,
                v_ErrorText
                );

        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도완납 할인대상금액 청구스케줄(RTSD0109) 생성 실패!!!'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    -- 종료유형(S070) C 일 경우
    ELSE
        -- 연체금액: 수납금액 - 할인미대상
        v_Sale_Amt :=  v_Recp_Amt - v_Arre1_Amt;

        -- 원금 : 연체금액
        v_Sale_Namt := v_Sale_Amt;

        -- 부가세 : 매출금액 - 원금
        v_Sale_Vamt := v_Sale_Amt - NVL(v_Sale_Namt,0);
        
--        v_Cancl_Day2 := '20190501';
        v_Cancl_Day2 := '20210601';
        
        IF v_Recp_Nu IS NULL THEN
            v_Recp_Nu  := TO_NUMBER(v_Period_Cd)+1;
        END IF;            

        -- 중도완납 할인대상금액 청구스케줄(RTSD0109) 생성
        Pkg_Rtsd0109.p_IUDRtsd0109 (
                'I'               , /*(v_Comm_Dvsn   )처리구분(I,U,D)       */
                v_Ord_No          , /*(v_Ord_No      )계약번호              */
                v_Schd_Seq        , /*(v_Schd_Seq    )청구순번              */
                '42'              , /*(v_Recp_Tp     )청구구분              */
                v_Recp_Nu         , /*(v_Recp_Nu     )청구회차              */
--                'S'               , /*(v_Scd_Stat    )스케줄상태코드        */
                'C'               , /*(v_Scd_Stat    )스케줄상태코드        */
                v_Sale_Amt        , /*(v_Sale_Amt    )매출금액(VAT 포함)    */
                v_Sale_Namt       , /*(v_Sale_Namt   )원금                  */
                v_Sale_Vamt       , /*(v_Sale_Vamt   )부가세                */
                0                 , /*(v_Recp_Amt    )수납금액(VAT포함)     */
                v_Sale_Amt        , /*(v_Arre_Amt    )연체금액(VAT포함)     */
                v_Cancl_Day2       , /*(v_Demd_Dt     )청구일자              */
                'N'               , /*(v_Zlspr       )청구보류              */
                NULL              , /*(v_Rc_Day      )수납일자              */
                'N'               , /*(v_Rc_Yn       )수납여부              */
                v_Cancl_Day2       , /*(v_Tax_Dt      )세금계산서발행일자(예 */
                NULL              , /*(v_Tax_No      )세금계산서번호        */
                v_Cancl_Day2       , /*(v_Zfb_Day     )만기계산기준일        */
                v_Cancl_Day2       , /*(v_Cancl_Day   )중도완납일            */
                v_Cust_No         , /*(v_Cust_No     )고객번호              */
                v_Sales_Group     , /*(v_Sales_Group )지사                  */
                v_Sales_Office    , /*(v_Sales_Office)지점                  */
                v_Agency_Cd       , /*(v_Agency_Cd   )장착 대리점           */
                v_Cancl_Day2       , /*(v_Beg_Day     )시작일                */
                v_Cancl_Day2       , /*(v_End_Day     )종료일                */
                'N'               , /*(v_Delay_Yn    )연체이자적용여부      */
                0                 , /*(v_Delay_Rate  )연체 이자율           */
                v_Pay_Mthd        , /*(v_Pay_Mthd    )결제구분              */
                v_Pay_Dd          , /*(v_Pay_Dd      )이체일                */
                'Y'               , /*(v_Use_Yn      )사용여부              */
                v_Reg_Id          , /*(v_Reg_Id      )등록자 ID             */
                v_Success_Code    ,
                v_Return_Message  ,
                v_ErrorText
                );

        IF 0 != v_Success_Code THEN
            v_Return_Message := '중도해지 할인대상금액 청구스케줄(RTSD0109) 생성 실패!!!'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        INSERT INTO RTTEMPIWJ_210630_07 (COL_01, COL_02, COL_03) VALUES (v_Ord_No, v_Schd_Seq, 'I');

    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
--        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_InsertRtsd0109CancelSave(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
--        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0109.p_InsertRtsd0109CancelSave(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0109CancelSave3;     

END Pkg_Rtsd0109;
/
