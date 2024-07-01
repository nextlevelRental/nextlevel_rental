CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0013 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0013
   PURPOSE   계약별 프리미엄서비스 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
   1.1        2018-02-26  wjim             [20180212_01] 선택형 프리미엄 서비스 도입
*******************************************************************************/

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0013Count(
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,           /*계약번호            */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,            /*프리미엄서비스      */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,          /*상세서비스          */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE            /*타이어본수          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0013 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE          /*타이어본수            */
    );

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0013 (
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt0      IN RTSD0013.SERV_CNT0%TYPE,      /*서비스횟수(최초)      */
    v_Serv_Cntr      IN RTSD0013.SERV_CNTR%TYPE,      /*서비스횟수(잔여)      */
    v_Serv_Amt       IN RTSD0013.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0013 (
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0013 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt0      IN RTSD0013.SERV_CNT0%TYPE,      /*서비스횟수(최초)      */
    v_Serv_Cntr      IN RTSD0013.SERV_CNTR%TYPE,      /*서비스횟수(잔여)      */
    v_Serv_Amt       IN RTSD0013.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약별 프리미엄서비스 - 계약번호 기준 프리미엄서비스 잔여횟수 획득 - 엔진오일 접수에서 배송 반영
  *****************************************************************************/
  FUNCTION f_sRtsd0013ServCntr(
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,           /*계약번호            */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE           /*상세서비스          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 - 계약번호 기준 프리미엄서비스 잔여횟수 획득 - 엔진오일 실 처리 건수 
  *****************************************************************************/
  FUNCTION f_sRtsd0013ServCntr2(
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,           /*계약번호            */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE           /*상세서비스          */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 계약별 프리미엄서비스 Update - 전자서명  서비스 확인서 서명완료 등록시 서비스잔여횟수 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0013ServCntr (
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 저장 - 온라인
  *****************************************************************************/
  PROCEDURE p_Online_InsertRtsd0013 (
    v_Ord_No          IN RTSD0014.ORD_NO%TYPE,          /*주문번호        */
    v_ApplyDate       IN RTSD0011.STR_DAY%TYPE,         /*적용일자          */
    v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE,       /*기간            */
    v_Cnt_Cd          IN RTSD0012.CNT_CD%TYPE,          /*타이어갯수         */
    v_Season          IN RTSD0011.SEASON_CD%TYPE,       /*계절용           */
    v_Reg_Id          IN RTSD0013.REG_ID%TYPE,          /*등록자 ID       */
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText       OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 계약별 선택형 프리미엄서비스 저장 - 온라인
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-02-26  wjim             [20180212_01] 신규 개발 
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0013Online (
      v_Ord_No          IN RTSD0014.ORD_NO%TYPE          /*주문번호        */
    , v_Ps_Cd           IN RTSD0012.PS_CD%TYPE           /*서비스코드      */
    , v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE       /*기간            */
    , v_Cnt_Cd          IN RTSD0012.CNT_CD%TYPE          /*타이어갯수      */
    , v_Reg_Id          IN RTSD0013.REG_ID%TYPE          /*등록자 ID       */
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  );

  /*****************************************************************************
  -- 계약별 선택형 프리미엄서비스 저장 - 온라인
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-12-04  sePark           
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0013OnlineNew (
      v_Ord_No          IN RTSD0014.ORD_NO%TYPE          /*주문번호        */
    , v_Ps_Cd           IN RTSD0012.PS_CD%TYPE           /*서비스코드      */
    , v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE       /*기간            */
    , v_Cnt_Cd          IN RTSD0012.CNT_CD%TYPE          /*타이어갯수      */
    , v_Prs_Dcd         IN RTSD0013.PRS_DCD%TYPE         /*상세서비스         2018.12.04추가   */
    , v_Serv_Cnt0       IN RTSD0013.SERV_CNT0%TYPE       /*서비스횟수(최초)   2018.12.04추가   */
    , v_Serv_Amt        IN RTSD0013.SERV_AMT%TYPE        /*서비스금액         2018.12.04추가   */
    , v_Reg_Id          IN RTSD0013.REG_ID%TYPE          /*등록자 ID       */
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  );


  /*****************************************************************************
  -- 계약별 프리미엄서비스 계약번호별 보관회수 및 보관타이어 개수(계약및사용)
  *****************************************************************************/
  PROCEDURE p_Rtsd0013ServCntNTireCnt (
    v_Ord_No          IN RTSD0013.ORD_NO%TYPE,            /*주문번호          */
    v_Serv_Cnt0       OUT RTSD0013.SERV_CNT0%TYPE,        /*보관회수(전체)    */
    v_Cnt_Cd          OUT RTSD0108.CNT_CD%TYPE,           /*계약타이어 개수   */
    v_Cont_Tire_Cnt   OUT NUMBER,                         /*계약타이어 총개수 */
    v_Use_Cnt0        OUT NUMBER,                         /*보관회수(사용)    */
    v_Use_Tire_Cnt    OUT NUMBER,                         /*보관타이어 총개수 */
    v_Reg_Id          IN RTSD0013.REG_ID%TYPE,            /*등록자 ID         */
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText       OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약별 프리미엄서비스 - 계약번호 기준 프리미엄서비스 최초횟수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0013ServCnt0(
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,           /*계약번호            */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE           /*상세서비스          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Select (온라인몰)
  *****************************************************************************/
  PROCEDURE p_sRtsd0013Online (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE            /*계약번호              */
    );

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Select List (온라인몰)
  *****************************************************************************/
  PROCEDURE p_sRtsd0013OnlineList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*SAFEKEY               */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE         /*사업자번호            */
    );

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Select List (온라인몰, O2O연계)
  *****************************************************************************/
  PROCEDURE p_sRtsd0013OnlineListNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*SAFEKEY               */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE         /*사업자번호            */
    );
    
  /*****************************************************************************
  -- 계약별 프리미엄서비스 관리(IUD) 일시불
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0013Direct (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt0      IN RTSD0013.SERV_CNT0%TYPE,      /*서비스횟수(최초)      */
    v_Serv_Cntr      IN RTSD0013.SERV_CNTR%TYPE,      /*서비스횟수(잔여)      */
    v_Serv_Amt       IN RTSD0013.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약별 프리미엄서비스 관리(IUD) 멤버십
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0013Member (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt0      IN RTSD0013.SERV_CNT0%TYPE,      /*서비스횟수(최초)      */
    v_Serv_Cntr      IN RTSD0013.SERV_CNTR%TYPE,      /*서비스횟수(잔여)      */
    v_Serv_Amt       IN RTSD0013.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  --프리미엄서비스 저장 - 온라인
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0013OrdSale (
      v_Ord_No          IN RTSD0014.ORD_NO%TYPE          /*주문번호        */
    , v_Sale_cd         IN RTSD0020.SALE_CD%TYPE         /*판매상품코드    */
    , v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE       /*기간            */
    , v_Cnt_Cd          IN RTSD0012.CNT_CD%TYPE          /*타이어갯수      */
    , v_Reg_Id          IN RTSD0013.REG_ID%TYPE          /*등록자 ID       */
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  );

  /*****************************************************************************
  -- 프리미엄 서비스 금액 비교 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0013ChkServAmt(
    v_Ord_No          IN RTSD0014.ORD_NO%TYPE          /*주문번호        */
  ) RETURN NUMBER;

 /*****************************************************************************
  -- 계약별 프리미엄서비스 Update - 서비스 횟수 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0013ServCnt0 (
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtsd0013;
/
