CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0107 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0107
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
    ) RETURN NUMBER IS
    
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0107
    WHERE   ORD_NO = v_Ord_No
    AND     SEQ    = v_Seq
    AND     SEQ2   = v_Seq2;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0107Count;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.SEQ,                       /*순번                */
            A.SEQ2,                      /*순번2               */
            A.ORD_ID,                    /*주문구분            */
            A.PERIOD_CD,                 /*기간코드            */
            A.CNT_CD,                    /*타이어본수          */
            A.REGI_CD,                   /*등록비코드          */
            A.FR_CD,                     /*장착위치            */
            A.LR_CD,                     /*좌우                */
            A.MAT_CD,                    /*상품코드            */
            A.ORD_QTY,                   /*수량                */
            A.REGI_AMT,                  /*렌탈등록비          */
            A.RENT_AMT,                  /*월렌탈료(조견표)    */
            A.RENTP_AMT,                 /*추가렌탈료(프리미엄)*/
            A.F_DCRATE,                  /*최종할인율          */
            A.F_DCAMT,                   /*최종할인액          */
            A.MON_DCAMT,                 /*월렌탈료 할인액     */
            A.MON_AMT,                   /*월렌탈료            */
            A.PLAN_DAY,                  /*장착예정일          */
            A.PLAN_TM,                   /*장착예정시간(HHMM)  */
            A.INST_DAY,                  /*장착일              */
            A.INST_TM,                   /*장착시간(HHMM)      */
            A.INST_YN,                   /*장착여부            */
            A.VAL_YN,                    /*유효여부            */
            A.EQU_NO,                    /*설비번호            */
            A.OS_ID,                     /*소유권이전구분      */
            A.OS_DAY,                    /*소유권이전일자(예정)*/
            A.STAT_CD,                   /*상태                */
            A.FL_YN,                     /*장착위-앞,왼쪽      */
            A.FR_YN,                     /*장착위치-앞,오른쪽  */
            A.RL_YN,                     /*장착위치-뒤,왼쪽    */
            A.RR_YN,                     /*장착위치-뒤,오른쪽  */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0107 A
    WHERE   A.ORD_NO     = DECODE(v_Ord_No    , NULL, A.ORD_NO    , v_Ord_No)
    AND     A.SEQ        = DECODE(v_Seq       , NULL, A.SEQ       , v_Seq)
    AND     A.SEQ2       = DECODE(v_Seq2      , NULL, A.SEQ2      , v_Seq2)
    AND     A.ORD_ID     = DECODE(v_Ord_Id    , NULL, A.ORD_ID    , v_Ord_Id)
    AND     A.PERIOD_CD  = DECODE(v_Period_Cd , NULL, A.PERIOD_CD , v_Period_Cd)
    AND     A.CNT_CD     = DECODE(v_Cnt_Cd    , NULL, A.CNT_CD    , v_Cnt_Cd)
    AND     A.REGI_CD    = DECODE(v_Regi_Cd   , NULL, A.REGI_CD   , v_Regi_Cd)
    AND     A.FR_CD      = DECODE(v_Fr_Cd     , NULL, A.FR_CD     , v_Fr_Cd)
    AND     A.LR_CD      = DECODE(v_Lr_Cd     , NULL, A.LR_CD     , v_Lr_Cd)
    AND     A.MAT_CD     = DECODE(v_Mat_Cd    , NULL, A.MAT_CD    , v_Mat_Cd)
    AND     A.ORD_QTY    = DECODE(v_Ord_Qty   , NULL, A.ORD_QTY   , v_Ord_Qty)
    AND     A.REGI_AMT   = DECODE(v_Regi_Amt  , NULL, A.REGI_AMT  , v_Regi_Amt)
    AND     A.RENT_AMT   = DECODE(v_Rent_Amt  , NULL, A.RENT_AMT  , v_Rent_Amt)
    AND     A.F_DCRATE   = DECODE(v_F_Dcrate  , NULL, A.F_DCRATE  , v_F_Dcrate)
    AND     A.F_DCAMT    = DECODE(v_F_Dcamt   , NULL, A.F_DCAMT   , v_F_Dcamt)
    AND     A.MON_DCAMT  = DECODE(v_Mon_Dcamt , NULL, A.MON_DCAMT , v_Mon_Dcamt)
    AND     A.MON_AMT    = DECODE(v_Mon_Amt   , NULL, A.MON_AMT   , v_Mon_Amt)
    AND     A.PLAN_DAY   = DECODE(v_Plan_Day  , NULL, A.PLAN_DAY  , v_Plan_Day)
    AND     A.PLAN_TM    = DECODE(v_Plan_Tm   , NULL, A.PLAN_TM   , v_Plan_Tm)
    AND     A.INST_DAY   = DECODE(v_Inst_Day  , NULL, A.INST_DAY  , v_Inst_Day)
    AND     A.INST_TM    = DECODE(v_Inst_Tm   , NULL, A.INST_TM   , v_Inst_Tm)
    AND     A.INST_YN    = DECODE(v_Inst_Yn   , NULL, A.INST_YN   , v_Inst_Yn)
    AND     A.VAL_YN     = DECODE(v_Val_Yn    , NULL, A.VAL_YN    , v_Val_Yn)
    AND     A.EQU_NO     = DECODE(v_Equ_No    , NULL, A.EQU_NO    , v_Equ_No)
    AND     A.OS_ID      = DECODE(v_Os_Id     , NULL, A.OS_ID     , v_Os_Id)
    AND     A.OS_DAY     = DECODE(v_Os_Day    , NULL, A.OS_DAY    , v_Os_Day)
    AND     A.STAT_CD    = DECODE(v_Stat_Cd   , NULL, A.STAT_CD   , v_Stat_Cd)
    AND     A.FL_YN      = DECODE(v_Fl_Yn     , NULL, A.FL_YN     , v_Fl_Yn)
    AND     A.FR_YN      = DECODE(v_Fr_Yn     , NULL, A.FR_YN     , v_Fr_Yn)
    AND     A.RL_YN      = DECODE(v_Rl_Yn     , NULL, A.RL_YN     , v_Rl_Yn)
    AND     A.RR_YN      = DECODE(v_Rr_Yn     , NULL, A.RR_YN     , v_Rr_Yn)
    AND     A.MAT_DESC   = DECODE(v_Mat_Desc  , NULL, A.MAT_DESC  , v_Mat_Desc)
    AND     A.REG_ID     = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtsd0107;

  /*****************************************************************************
  -- 계약 상품 정보 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0107 (
    v_Ord_No         IN RTSD0107.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0107.SEQ%TYPE,            /*순번                  */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0107 (
            ORD_NO,
            SEQ,
            SEQ2,
            ORD_ID,
            PERIOD_CD,
            CNT_CD,
            REGI_CD,
            FR_CD,
            LR_CD,
            MAT_CD,
            MAT_CD_S,
            ORD_QTY,
            REGI_AMT,
            RENT_AMT,
            RENTP_AMT,
            F_DCRATE,
            F_DCAMT,
            MON_DCAMT,
            MON_AMT,
            PLAN_DAY,
            PLAN_TM,
            INST_DAY,
            INST_TM,
            INST_YN,
            VAL_YN,
            EQU_NO,
            OS_ID,
            OS_DAY,
            STAT_CD,
            FL_YN,
            FR_YN,
            RL_YN,
            RR_YN,
            MAT_DESC,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  A.ORD_NO,
            A.SEQ,
            NVL((SELECT  MAX(B.SEQ2)
                 FROM    RTSD0107 B
                 WHERE   B.ORD_NO = A.ORD_NO
                 AND     B.SEQ    = A.SEQ) + 1, 1) AS SEQ2,
            A.ORD_ID,
            A.PERIOD_CD,
            A.CNT_CD,
            A.REGI_CD,
            A.FR_CD,
            A.LR_CD,
            A.MAT_CD,
            A.MAT_CD_S,
            A.ORD_QTY,
            A.REGI_AMT,
            A.RENT_AMT,
            A.RENTP_AMT,
            A.F_DCRATE,
            A.F_DCAMT,
            A.MON_DCAMT,
            A.MON_AMT,
            A.PLAN_DAY,
            A.PLAN_TM,
            A.INST_DAY,
            A.INST_TM,
            A.INST_YN,
            A.VAL_YN,
            A.EQU_NO,
            A.OS_ID,
            A.OS_DAY,
            A.STAT_CD,
            A.FL_YN,
            A.FR_YN,
            A.RL_YN,
            A.RR_YN,
            A.MAT_DESC,
            A.REG_ID,
            A.REG_DT,
            A.CHG_ID,
            A.CHG_DT
    FROM    RTSD0106 A
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.SEQ    = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0107;



END Pkg_Rtsd0107;
/
