CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0109 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0109
   PURPOSE   청구스케줄 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-13  jemcarry         1. Created this package body.
   1.1        2017-09-19  wjim             [20170224_01] 수금관리(팝업)용 청구내역조회 추가
   1.2        2018-04-19  wjim             [20180419_01] 중도완납(해약) 시 방문점검 당월 배정분 점검거부 자동 등록
   1.3        2018-04-25  wjim             [20180425_01] 중도완납(해약) 시 방문점검 점검거부 이력등록
   1.4        2018-11-09  ncho             1. 연체금수납 - 미납내역 상세 조회 추가
 *******************************************************************************/
  /*****************************************************************************
  -- 청구스케줄 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0109Count(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,           /*계약번호            */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE          /*청구순번            */
    ) RETURN NUMBER;

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
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 청구스케줄 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0109 (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE,       /*청구순번              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

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
    );

  /*****************************************************************************
  -- 청구스케줄 Count - 청구순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0109SchdSeq(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 청구스케줄 관리 - 계약번호 기준 청구스케쥴 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109ScheduleReal (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 멤버쉽 청구스케줄 관리 - 계약번호 기준 청구스케쥴 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0109MemberSchReal (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 청구스케줄 Count - 해당 계약번호에 대하여 스케줄 정보가 존재하는지 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0109UpdateCount(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0109.CUST_NO%TYPE,        /*고객번호              */
    v_Chg_Day        IN VARCHAR                       /*변경일자              */
    ) RETURN NUMBER;


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
    ) RETURN NUMBER;

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
    );

  /*****************************************************************************
  -- 청구스케줄 Select - 스케줄 조회(계약별)    청구 스케줄 조회(계약별) - 상세    SD-020303    SD00061
  *****************************************************************************/
  PROCEDURE p_sRtsd0109DetailList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE          /*계약번호              */
    );


  /*****************************************************************************
  -- 청구스케줄 - 청구일자 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0109DemdDt(
    v_Recp_Nu        IN RTSD0109.RECP_NU%TYPE,        /*청구회차              */
    v_Proc_Day       IN RTSD0104.PROC_DAY%TYPE,       /*장착일자              */
    v_Pay_Dd         IN RTSD0104.PAY_DD%TYPE          /*이체일                */
    ) RETURN VARCHAR;


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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 청구스케줄 청구회차 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109RecpNu (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE        /*청구순번              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 청구스케줄 만기일자 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109ZfbDay (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Schd_Seq       IN RTSD0109.SCHD_SEQ%TYPE        /*청구순번              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 청구스케줄 Select - 중도완납 계약정보조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0109CancelList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*종료유형(S070:E,C)    */
    v_Canc_Day       IN RTSD0108.CANC_DAY%TYPE        /*취소일자(현재일)      */
    );

  /*****************************************************************************
  -- 청구스케줄 관리 - 중도완납 저장
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
    );
    
  /*****************************************************************************
  -- 청구스케줄 관리 - 중도완납 저장(영업관리 시스템 공통팝업용 저장)
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
    );    

  /*****************************************************************************
  -- 청구스케줄 Update - 중도완납
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0109Cancel (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Cancl_Day      IN RTSD0109.CANCL_DAY%TYPE,      /*중도완납일            */
    v_Scd_Stat       IN RTSD0109.SCD_STAT%TYPE,       /*스케줄상태코드        */
    v_Reg_Id         IN RTSD0109.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기준년월 청구일자 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109ApplYmZfbDay (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Appl_Ym        IN VARCHAR                       /*기준년월              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 기준년월 청구금액 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109ApplYmSaleAmt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Appl_Ym        IN VARCHAR                       /*기준년월              */
    ) RETURN NUMBER;

  /*****************************************************************************
  --  청구스케줄 - (수금내역조회) 선택된 계약번호를 기준으로 청구기간내의 청구내역을 조회한다.
  *****************************************************************************/
  PROCEDURE p_sRtsd0109ChargeCashApp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Zfb_Fd         IN RTSD0109.ZFB_DAY%TYPE,        /*시작청구일자          */
    v_Zfb_Td         IN RTSD0109.ZFB_DAY%TYPE         /*종료청구일자          */
    );

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
  );

  /*****************************************************************************
   -- 미납내역 상세 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0109UnpaidList(  Ref_Cursor IN OUT SYS_REFCURSOR
                                  , v_Ord_No   IN RTSD0109.ORD_NO%TYPE  /* 계약번호 */
                                  , v_Cust_No  IN RTSD0109.CUST_NO%TYPE /* 고객번호 */
                                 );

  /*****************************************************************************
  -- 조회시점 청구회차 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0109SearchRecpNu (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Req_Dt         IN RTSD0109.ZFB_DAY%TYPE        /*요청일자              */
    ) RETURN NUMBER ;   
           
  /*****************************************************************************
  -- 조회시점 부터 현재 까지 청구횟수 
  *****************************************************************************/
  FUNCTION f_sRtsd0109RecpNuCnt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Req_Dt         IN RTSD0109.ZFB_DAY%TYPE         /*요청일자              */
    ) RETURN NUMBER ;   

  /*****************************************************************************
  -- 할인구간별 할인 횟수
  *****************************************************************************/
  FUNCTION f_sRtsd0109SaleRecpNuCnt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE,         /*계약번호              */
    v_Req_Dt         IN RTSD0109.ZFB_DAY%TYPE         /*요청일자              */
    ) RETURN NUMBER ;   
    
  /*****************************************************************************
  -- 패키지 해지시 위약금 여부
  *****************************************************************************/
  FUNCTION f_sRtsd0109PenaltyAmt (
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR2 ;   
   
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
    );   

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
                                       );
  /*****************************************************************************
  -- 납부회차 MAX획득
  *****************************************************************************/
  FUNCTION f_sRtsd0109MaxRecpNu(
    v_Ord_No         IN RTSD0109.ORD_NO%TYPE           /*계약번호            */
    ) RETURN NUMBER ;

  /*****************************************************************************
  -- 청구스케줄 관리 - 중도완납 저장
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
    );
    
END Pkg_Rtsd0109;