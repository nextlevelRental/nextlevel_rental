CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0106 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0106
   PURPOSE   계약 상품 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-09  jemcarry         1. Created this package body.
   1.2        2021-07-13  kstka            [20210713_01] 거점재고여부
   1.3        2021-07-13  kstka            [20210713_02] 대체규격컬럼추가
*******************************************************************************/

  /*****************************************************************************
  -- 계약 상품 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0106Count(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0106.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0106 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE            /*계약번호              */
    );
    

  /*****************************************************************************
  -- 계약 상품 정보 NEW Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0106New (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE            /*계약번호              */
    );

  /*****************************************************************************
  -- 계약 상품 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0106 (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0106.SEQ%TYPE,            /*순번                  */
    v_Ord_Id         IN RTSD0106.ORD_ID%TYPE,         /*주문구분              */
    v_Period_Cd      IN RTSD0106.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0106.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0106.REGI_CD%TYPE,        /*등록비코드            */
    v_Fr_Cd          IN RTSD0106.FR_CD%TYPE,          /*장착위치              */
    v_Lr_Cd          IN RTSD0106.LR_CD%TYPE,          /*좌우                  */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTSD0106.ORD_QTY%TYPE,        /*수량                  */
    v_Regi_Amt       IN RTSD0106.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Rent_Amt       IN RTSD0106.RENT_AMT%TYPE,       /*월렌탈료(조견표)      */
    v_Rentp_Amt      IN RTSD0106.RENTP_AMT%TYPE,      /*추가렌탈료(프리미엄)  */
    v_F_Dcrate       IN RTSD0106.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0106.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Dcamt      IN RTSD0106.MON_DCAMT%TYPE,      /*월렌탈료 할인액       */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_Plan_Day       IN RTSD0106.PLAN_DAY%TYPE,       /*장착예정일            */
    v_Plan_Tm        IN RTSD0106.PLAN_TM%TYPE,        /*장착예정시간(HHMM)    */
    v_Inst_Day       IN RTSD0106.INST_DAY%TYPE,       /*장착일                */
    v_Inst_Tm        IN RTSD0106.INST_TM%TYPE,        /*장착시간(HHMM)        */
    v_Inst_Yn        IN RTSD0106.INST_YN%TYPE,        /*장착여부              */
    v_Val_Yn         IN RTSD0106.VAL_YN%TYPE,         /*유효여부              */
    v_Equ_No         IN RTSD0106.EQU_NO%TYPE,         /*설비번호              */
    v_Os_Id          IN RTSD0106.OS_ID%TYPE,          /*소유권이전구분        */
    v_Os_Day         IN RTSD0106.OS_DAY%TYPE,         /*소유권이전일자(예정)  */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Fl_Yn          IN RTSD0106.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0106.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0106.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0106.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고  			    */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0106 (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,     /*계약번호              */
    v_Seq            IN RTSD0106.SEQ%TYPE,        /*순번                  */
    v_Ord_Id         IN RTSD0106.ORD_ID%TYPE,         /*주문구분              */
    v_Period_Cd      IN RTSD0106.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0106.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0106.REGI_CD%TYPE,        /*등록비코드            */
    v_Fr_Cd          IN RTSD0106.FR_CD%TYPE,          /*장착위치              */
    v_Lr_Cd          IN RTSD0106.LR_CD%TYPE,          /*좌우                  */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTSD0106.ORD_QTY%TYPE,        /*수량                  */
    v_Regi_Amt       IN RTSD0106.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Rent_Amt       IN RTSD0106.RENT_AMT%TYPE,       /*월렌탈료(조견표)      */
    v_Rentp_Amt      IN RTSD0106.RENTP_AMT%TYPE,      /*추가렌탈료(프리미엄)  */
    v_F_Dcrate       IN RTSD0106.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0106.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Dcamt      IN RTSD0106.MON_DCAMT%TYPE,      /*월렌탈료 할인액       */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_Plan_Day       IN RTSD0106.PLAN_DAY%TYPE,       /*장착예정일            */
    v_Plan_Tm        IN RTSD0106.PLAN_TM%TYPE,        /*장착예정시간(HHMM)    */
    v_Inst_Day       IN RTSD0106.INST_DAY%TYPE,       /*장착일                */
    v_Inst_Tm        IN RTSD0106.INST_TM%TYPE,        /*장착시간(HHMM)        */
    v_Inst_Yn        IN RTSD0106.INST_YN%TYPE,        /*장착여부              */
    v_Val_Yn         IN RTSD0106.VAL_YN%TYPE,         /*유효여부              */
    v_Equ_No         IN RTSD0106.EQU_NO%TYPE,         /*설비번호              */
    v_Os_Id          IN RTSD0106.OS_ID%TYPE,          /*소유권이전구분        */
    v_Os_Day         IN RTSD0106.OS_DAY%TYPE,         /*소유권이전일자(예정)  */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Fl_Yn          IN RTSD0106.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0106.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0106.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0106.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고  			    */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0106 (
    v_Ord_No         IN OUT RTSD0106.ORD_NO%TYPE,     /*계약번호              */
    v_Seq            IN RTSD0106.SEQ%TYPE,            /*순번                  */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0106 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN OUT RTSD0106.ORD_NO%TYPE,     /*계약번호              */
    v_Seq            IN OUT RTSD0106.SEQ%TYPE,        /*순번                  */
    v_Ord_Id         IN RTSD0106.ORD_ID%TYPE,         /*주문구분              */
    v_Period_Cd      IN RTSD0106.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0106.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0106.REGI_CD%TYPE,        /*등록비코드            */
    v_Fr_Cd          IN RTSD0106.FR_CD%TYPE,          /*장착위치              */
    v_Lr_Cd          IN RTSD0106.LR_CD%TYPE,          /*좌우                  */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTSD0106.ORD_QTY%TYPE,        /*수량                  */
    v_Regi_Amt       IN RTSD0106.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Rent_Amt       IN RTSD0106.RENT_AMT%TYPE,       /*월렌탈료(조견표)      */
    v_Rentp_Amt      IN RTSD0106.RENTP_AMT%TYPE,      /*추가렌탈료(프리미엄)  */
    v_F_Dcrate       IN RTSD0106.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0106.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Dcamt      IN RTSD0106.MON_DCAMT%TYPE,      /*월렌탈료 할인액       */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_Plan_Day       IN RTSD0106.PLAN_DAY%TYPE,       /*장착예정일            */
    v_Plan_Tm        IN RTSD0106.PLAN_TM%TYPE,        /*장착예정시간(HHMM)    */
    v_Inst_Day       IN RTSD0106.INST_DAY%TYPE,       /*장착일                */
    v_Inst_Tm        IN RTSD0106.INST_TM%TYPE,        /*장착시간(HHMM)        */
    v_Inst_Yn        IN RTSD0106.INST_YN%TYPE,        /*장착여부              */
    v_Val_Yn         IN RTSD0106.VAL_YN%TYPE,         /*유효여부              */
    v_Equ_No         IN RTSD0106.EQU_NO%TYPE,         /*설비번호              */
    v_Os_Id          IN RTSD0106.OS_ID%TYPE,          /*소유권이전구분        */
    v_Os_Day         IN RTSD0106.OS_DAY%TYPE,         /*소유권이전일자(예정)  */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Fl_Yn          IN RTSD0106.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0106.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0106.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0106.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고  			    */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약 상품 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0106New (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN OUT RTSD0106.ORD_NO%TYPE,     /*계약번호              */
    v_Seq            IN OUT RTSD0106.SEQ%TYPE,        /*순번                  */
    v_Ord_Id         IN RTSD0106.ORD_ID%TYPE,         /*주문구분              */
    v_Period_Cd      IN RTSD0106.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0106.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0106.REGI_CD%TYPE,        /*등록비코드            */
    v_Fr_Cd          IN RTSD0106.FR_CD%TYPE,          /*장착위치              */
    v_Lr_Cd          IN RTSD0106.LR_CD%TYPE,          /*좌우                  */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTSD0106.ORD_QTY%TYPE,        /*수량                  */
    v_Regi_Amt       IN RTSD0106.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Rent_Amt       IN RTSD0106.RENT_AMT%TYPE,       /*월렌탈료(조견표)      */
    v_Rentp_Amt      IN RTSD0106.RENTP_AMT%TYPE,      /*추가렌탈료(프리미엄)  */
    v_F_Dcrate       IN RTSD0106.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0106.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Dcamt      IN RTSD0106.MON_DCAMT%TYPE,      /*월렌탈료 할인액       */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_Plan_Day       IN RTSD0106.PLAN_DAY%TYPE,       /*장착예정일            */
    v_Plan_Tm        IN RTSD0106.PLAN_TM%TYPE,        /*장착예정시간(HHMM)    */
    v_Inst_Day       IN RTSD0106.INST_DAY%TYPE,       /*장착일                */
    v_Inst_Tm        IN RTSD0106.INST_TM%TYPE,        /*장착시간(HHMM)        */
    v_Inst_Yn        IN RTSD0106.INST_YN%TYPE,        /*장착여부              */
    v_Val_Yn         IN RTSD0106.VAL_YN%TYPE,         /*유효여부              */
    v_Equ_No         IN RTSD0106.EQU_NO%TYPE,         /*설비번호              */
    v_Os_Id          IN RTSD0106.OS_ID%TYPE,          /*소유권이전구분        */
    v_Os_Day         IN RTSD0106.OS_DAY%TYPE,         /*소유권이전일자(예정)  */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Fl_Yn          IN RTSD0106.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0106.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0106.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0106.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고  			    */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약 상품 정보 - 계약상품중 대표상품 코드 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0106MatCd(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE            /*계약번호            */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- 계약 상품 정보 - 계약상품중 대표 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0106ChoiceSeq(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약 상품 정보 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0106Seq (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 Update - 장착에 따른 상태 변경
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0106PrcStat (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,         /*계약번호              */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Inst_Day       IN RTSD0106.INST_DAY%TYPE,       /*장착일                */
    v_Seq            IN RTSD0106.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 - 전사서명 정보 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0106Sign (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,         /*계약번호              */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  FUNCTION f_UpdateRtsd0106OnlineCancel(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 -  계약번호 기준 최종 장착일 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0106PlanDay(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE            /*계약번호            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 계약 상품 정보 -  계약상태 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0106StatCd(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0106.SEQ%TYPE               /*순번                */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- 계약 상품 정보 - 결합고객 할인금액 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0106Discount (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,         /*계약번호              */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 Count - 상품코드로 진행주문 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0106CountMatCd(
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE            /*상품코드            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0106New (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  -- 계약 상품 정보 관리(IUD) 일시불
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-08-03  wjim             [20170803_01] ERP주문생성건은 수정불가
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0106Direct (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN OUT RTSD0106.ORD_NO%TYPE,     /*계약번호              */
    v_Seq            IN OUT RTSD0106.SEQ%TYPE,        /*순번                  */
    v_Ord_Id         IN RTSD0106.ORD_ID%TYPE,         /*주문구분              */
    v_Period_Cd      IN RTSD0106.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0106.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0106.REGI_CD%TYPE,        /*등록비코드            */
    v_Fr_Cd          IN RTSD0106.FR_CD%TYPE,          /*장착위치              */
    v_Lr_Cd          IN RTSD0106.LR_CD%TYPE,          /*좌우                  */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTSD0106.ORD_QTY%TYPE,        /*수량                  */
    v_Regi_Amt       IN RTSD0106.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Rent_Amt       IN RTSD0106.RENT_AMT%TYPE,       /*월렌탈료(조견표)      */
    v_Rentp_Amt      IN RTSD0106.RENTP_AMT%TYPE,      /*추가렌탈료(프리미엄)  */
    v_F_Dcrate       IN RTSD0106.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0106.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Dcamt      IN RTSD0106.MON_DCAMT%TYPE,      /*월렌탈료 할인액       */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_Plan_Day       IN RTSD0106.PLAN_DAY%TYPE,       /*장착예정일            */
    v_Plan_Tm        IN RTSD0106.PLAN_TM%TYPE,        /*장착예정시간(HHMM)    */
    v_Inst_Day       IN RTSD0106.INST_DAY%TYPE,       /*장착일                */
    v_Inst_Tm        IN RTSD0106.INST_TM%TYPE,        /*장착시간(HHMM)        */
    v_Inst_Yn        IN RTSD0106.INST_YN%TYPE,        /*장착여부              */
    v_Val_Yn         IN RTSD0106.VAL_YN%TYPE,         /*유효여부              */
    v_Equ_No         IN RTSD0106.EQU_NO%TYPE,         /*설비번호              */
    v_Os_Id          IN RTSD0106.OS_ID%TYPE,          /*소유권이전구분        */
    v_Os_Day         IN RTSD0106.OS_DAY%TYPE,         /*소유권이전일자(예정)  */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Fl_Yn          IN RTSD0106.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0106.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0106.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0106.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고                  */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약 상품 정보 관리(IUD) 멤버십
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-08-03  wjim             [20170803_01] ERP주문생성건은 수정불가
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0106Member (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN OUT RTSD0106.ORD_NO%TYPE,     /*계약번호              */
    v_Seq            IN OUT RTSD0106.SEQ%TYPE,        /*순번                  */
    v_Ord_Id         IN RTSD0106.ORD_ID%TYPE,         /*주문구분              */
    v_Period_Cd      IN RTSD0106.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0106.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0106.REGI_CD%TYPE,        /*등록비코드            */
    v_Fr_Cd          IN RTSD0106.FR_CD%TYPE,          /*장착위치              */
    v_Lr_Cd          IN RTSD0106.LR_CD%TYPE,          /*좌우                  */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTSD0106.ORD_QTY%TYPE,        /*수량                  */
    v_Regi_Amt       IN RTSD0106.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Rent_Amt       IN RTSD0106.RENT_AMT%TYPE,       /*월렌탈료(조견표)      */
    v_Rentp_Amt      IN RTSD0106.RENTP_AMT%TYPE,      /*추가렌탈료(프리미엄)  */
    v_F_Dcrate       IN RTSD0106.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0106.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Dcamt      IN RTSD0106.MON_DCAMT%TYPE,      /*월렌탈료 할인액       */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_Plan_Day       IN RTSD0106.PLAN_DAY%TYPE,       /*장착예정일            */
    v_Plan_Tm        IN RTSD0106.PLAN_TM%TYPE,        /*장착예정시간(HHMM)    */
    v_Inst_Day       IN RTSD0106.INST_DAY%TYPE,       /*장착일                */
    v_Inst_Tm        IN RTSD0106.INST_TM%TYPE,        /*장착시간(HHMM)        */
    v_Inst_Yn        IN RTSD0106.INST_YN%TYPE,        /*장착여부              */
    v_Val_Yn         IN RTSD0106.VAL_YN%TYPE,         /*유효여부              */
    v_Equ_No         IN RTSD0106.EQU_NO%TYPE,         /*설비번호              */
    v_Os_Id          IN RTSD0106.OS_ID%TYPE,          /*소유권이전구분        */
    v_Os_Day         IN RTSD0106.OS_DAY%TYPE,         /*소유권이전일자(예정)  */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Fl_Yn          IN RTSD0106.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0106.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0106.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0106.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고                  */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
    
  /*****************************************************************************
  -- 제품 관리 Select 멤버십
  *****************************************************************************/
  PROCEDURE p_sRtsd0106Member (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE,       /*가격,금액유형         */
    v_Sale_Cd      IN RTSD0106.SALE_CD%TYPE,      /*기간코드              */
    v_Model_Cd     IN RTSD0104.MODEL_CD%TYPE         /*타이어본수            */   
    );

  /*****************************************************************************
  --판매상품별 본수별 등록비 가져오기
  *****************************************************************************/
  FUNCTION f_sRtsd0106RegiAmt (
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE      /*  계약번호         */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 주문 등록시 SMS 발송
  *****************************************************************************/
 PROCEDURE p_regiSendSms (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,         /*주문번호              */
    v_Seq            IN RTSD0106.SEQ%TYPE,            /* 순번                 */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
 );
 
PROCEDURE P_SELECT_MAT_INFO_WITH_ORD(
    REF_CURSOR  IN OUT SYS_REFCURSOR,
    PI_VAL  IN VARCHAR2     /* ORD_NO */
);

FUNCTION F_GET_MAT_NM_WITH_CD(
    PI_VAL IN VARCHAR2   /* MAT_CD */
) RETURN VARCHAR2;

FUNCTION F_GET_MAT_NM_WITH_ORD(
    PI_VAL   IN VARCHAR2 /* 계약번호 */
) RETURN VARCHAR2;        
 
/*****************************************************************************
  -- GET SEARCH DUPLICATE ORDER COUNT
  *****************************************************************************/
FUNCTION F_GET_DUP_ORD_CNT(
    v_Cust_No       IN RTSD0100.CUST_NO%TYPE,        /* 고객번호 */
    v_Car_No        IN RTSD0104.CAR_NO%TYPE,         /* 차량번호 */
    v_Sale_Cd       IN RTSD0104.SALE_CD%TYPE,        /* 상품코드 */
    v_Mat_Cd        IN RTSD0106.MAT_CD%TYPE,         /* 제품코드 */
    v_Cnt_Cd        IN RTSD0104.CNT_CD%TYPE,         /* 수량 */
    v_Period_Cd     IN RTSD0104.PERIOD_CD%TYPE         /* 기간 */
) RETURN NUMBER;


END Pkg_Rtsd0106;