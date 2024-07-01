CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0100 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0100
   PURPOSE   연체대상 집계 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-24  jemcarry         1. Created this package body.
   1.4        2018-01-04  wjim             [20180104_01] 연체내역정보 건별조회 기능 추가
*******************************************************************************/

  /*****************************************************************************
  -- 연체대상 집계 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0100Count(
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,         /*연체기준일자        */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,           /*계약번호            */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,          /*고객번호            */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE           /*청구구분            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체대상 집계 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0100 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Appr_Amt       IN RTRE0100.APPR_AMT%TYPE,       /*연체금액              */
    v_Appr_Scnt      IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차              */
    v_Pay_Mthd       IN RTRE0100.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0100.PAY_DD%TYPE,         /*결제일자              */
    v_Acc_Seq        IN RTRE0100.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTRE0100.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Stat       IN RTRE0100.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Batch_Key      IN RTRE0100.BATCH_KEY%TYPE,      /*배치키                */
    v_Mfp_Yn         IN RTRE0100.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0100.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0100.OS_YN%TYPE,          /*소유권이전여부        */
    v_Del_Yn         IN RTRE0100.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 연체내역조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0100ArrearsList  (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Appr_Scnt_F    IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차 시작         */
    v_Appr_Scnt_T    IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차 종료         */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE         /*청구구분              */
    );

  /*****************************************************************************
  -- 연체대상 집계 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0100 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Appr_Amt       IN RTRE0100.APPR_AMT%TYPE,       /*연체금액              */
    v_Appr_Scnt      IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차              */
    v_Pay_Mthd       IN RTRE0100.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0100.PAY_DD%TYPE,         /*결제일자              */
    v_Acc_Seq        IN RTRE0100.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTRE0100.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Stat       IN RTRE0100.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Batch_Key      IN RTRE0100.BATCH_KEY%TYPE,      /*배치키                */
    v_Mfp_Yn         IN RTRE0100.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0100.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0100.OS_YN%TYPE,          /*소유권이전여부        */
    v_Del_Yn         IN RTRE0100.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체대상 집계 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0100 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Appr_Amt       IN RTRE0100.APPR_AMT%TYPE,       /*연체금액              */
    v_Appr_Scnt      IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차              */
    v_Pay_Mthd       IN RTRE0100.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0100.PAY_DD%TYPE,         /*결제일자              */
    v_Acc_Seq        IN RTRE0100.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTRE0100.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Stat       IN RTRE0100.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Batch_Key      IN RTRE0100.BATCH_KEY%TYPE,      /*배치키                */
    v_Mfp_Yn         IN RTRE0100.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0100.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0100.OS_YN%TYPE,          /*소유권이전여부        */
    v_Del_Yn         IN RTRE0100.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체대상 집계 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0100 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체대상 집계 내역 관리(IUD).
  *****************************************************************************/
  PROCEDURE p_IUDRtre0100 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Appr_Amt       IN RTRE0100.APPR_AMT%TYPE,       /*연체금액              */
    v_Appr_Scnt      IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차              */
    v_Pay_Mthd       IN RTRE0100.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0100.PAY_DD%TYPE,         /*결제일자              */
    v_Acc_Seq        IN RTRE0100.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTRE0100.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Stat       IN RTRE0100.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Batch_Key      IN RTRE0100.BATCH_KEY%TYPE,      /*배치키                */
    v_Mfp_Yn         IN RTRE0100.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0100.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0100.OS_YN%TYPE,          /*소유권이전여부        */
    v_Del_Yn         IN RTRE0100.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 연체대상 집계 내역 - 채권대상집계 - 연체내역 집계: 기준일자를 기준으로 연체된 내역을 집계한다.
  *****************************************************************************/
  PROCEDURE p_IUDRtre0100Aggregate (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Proc_Yn        IN VARCHAR,                      /*처리가능 여부         */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 연체대상 집계 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0100DelyDayCount(
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE          /*연체기준일자        */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 연체대상 집계 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0100DelyDayAll (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체내역 조회 : 고객번호 전월말일 기준
  *****************************************************************************/
  FUNCTION f_sRtre0100BMonthDelyAmt(
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE        /*기준일                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 연체내역 조회 : 에러메시지 획득
  *****************************************************************************/
  FUNCTION f_sRtre0100ErrMsg(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Pay_Mthd       IN RTSD0108.PAY_MTHD%TYPE,       /*결제구분              */
    v_Acc_Stat       IN RTSD0108.ACC_STAT%TYPE        /*계좌신청상태          */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 연체내역조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0100ArrearsListOrdSum  (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Appr_Scnt_F    IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차 시작         */
    v_Appr_Scnt_T    IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차 종료         */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE         /*고객번호              */
    );
    
  /*****************************************************************************
  -- 연체내역 정보 건별 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.4        2018-01-04  wjim             [20180104_01] 신규 개발
  *****************************************************************************/
  FUNCTION f_sRtre0100OrdNo(
      v_Ord_No       IN RTRE0100.ORD_NO%TYPE          /*계약번호              */
    , v_Dely_Day     IN RTRE0100.DELY_DAY%TYPE        /*연체기준일자          */
    , v_DIv_Day      IN VARCHAR2                      /*조회일자 기준 (A:해당월 최초 집계)           */
    , v_Div_Col      IN VARCHAR2                      /*조회항목 (APPR_SCNT:연체회차, PAY_DD:결제일) */
  ) RETURN VARCHAR;

END Pkg_Rtre0100;
/
