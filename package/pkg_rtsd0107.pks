CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0107 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0107
   PURPOSE   계약 상품 정보 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-10  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계약 상품 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0107Count(
    v_Ord_No         IN RTSD0107.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0107.SEQ%TYPE,              /*순번                */
    v_Seq2           IN RTSD0107.SEQ2%TYPE              /*순번2               */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 상품 정보 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0107 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0107.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0107.SEQ%TYPE,            /*순번                  */
    v_Seq2           IN RTSD0107.SEQ2%TYPE,           /*순번2                 */
    v_Ord_Id         IN RTSD0107.ORD_ID%TYPE,         /*주문구분              */
    v_Period_Cd      IN RTSD0107.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0107.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0107.REGI_CD%TYPE,        /*등록비코드            */
    v_Fr_Cd          IN RTSD0107.FR_CD%TYPE,          /*장착위치              */
    v_Lr_Cd          IN RTSD0107.LR_CD%TYPE,          /*좌우                  */
    v_Mat_Cd         IN RTSD0107.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTSD0107.ORD_QTY%TYPE,        /*수량                  */
    v_Regi_Amt       IN RTSD0107.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Rent_Amt       IN RTSD0107.RENT_AMT%TYPE,       /*월렌탈료(조견표)      */
    v_Rentp_Amt      IN RTSD0107.RENTP_AMT%TYPE,      /*추가렌탈료(프리미엄)  */
    v_F_Dcrate       IN RTSD0107.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0107.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Dcamt      IN RTSD0107.MON_DCAMT%TYPE,      /*월렌탈료 할인액       */
    v_Mon_Amt        IN RTSD0107.MON_AMT%TYPE,        /*월렌탈료              */
    v_Plan_Day       IN RTSD0107.PLAN_DAY%TYPE,       /*장착예정일            */
    v_Plan_Tm        IN RTSD0107.PLAN_TM%TYPE,        /*장착예정시간(HHMM)    */
    v_Inst_Day       IN RTSD0107.INST_DAY%TYPE,       /*장착일                */
    v_Inst_Tm        IN RTSD0107.INST_TM%TYPE,        /*장착시간(HHMM)        */
    v_Inst_Yn        IN RTSD0107.INST_YN%TYPE,        /*장착여부              */
    v_Val_Yn         IN RTSD0107.VAL_YN%TYPE,         /*유효여부              */
    v_Equ_No         IN RTSD0107.EQU_NO%TYPE,         /*설비번호              */
    v_Os_Id          IN RTSD0107.OS_ID%TYPE,          /*소유권이전구분        */
    v_Os_Day         IN RTSD0107.OS_DAY%TYPE,         /*소유권이전일자(예정)  */
    v_Stat_Cd        IN RTSD0107.STAT_CD%TYPE,        /*상태                  */
    v_Fl_Yn          IN RTSD0107.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0107.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0107.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0107.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Mat_Desc       IN RTSD0107.MAT_DESC%TYPE,       /*비고                  */
    v_Reg_Id         IN RTSD0107.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 계약 상품 정보 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0107 (
    v_Ord_No         IN RTSD0107.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0107.SEQ%TYPE,            /*순번                  */
   	v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

 

END Pkg_Rtsd0107;