CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0106 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0106
   PURPOSE   계약 상품 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-09  jemcarry         1. Created this package body.
   1.1        2017-08-03  wjim             [20170803_01] ERP주문생성건은 수정불가
   1.2        2021-07-13  kstka            [20210713_01] 거점재고여부
   1.3        2021-07-13  kstka            [20210713_02] 대체규격컬럼추가
*******************************************************************************/

  /*****************************************************************************
  -- 계약 상품 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0106Count(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0106.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0106
    WHERE   ORD_NO = v_Ord_No
    AND     SEQ    = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0106Count;

  /*****************************************************************************
  -- 계약 상품 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0106 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE          /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.SEQ,                       /*순번                */
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
            A.MAT_DESC,                  /*비고                */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            Pkg_Exif0004.f_sExif0004O2OStockYn(B.OMS_ORDERNO) O2O_STOCK_YN      --[20210713_01] kstka 거점재고여부
    FROM    RTSD0106 A, RTSD0104 B
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.ORD_NO = B.ORD_NO;

  END p_sRtsd0106;
  
  /*****************************************************************************
  -- 계약 상품 정보 NEW Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0106New (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE          /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    
    SELECT A.MAT_CD, 
           A.MAT_NM, 
           A.PETTERN_CD, 
           A.SEASON_CD,
           PKG_RTCM0051.F_SRTCM0051CODENAME('S014',A.SEASON_CD) AS SEASON_NM,      /*계절구분 */
           B.PERIOD_CD,
           PKG_RTCM0051.F_SRTCM0051CODENAME('S021',B.PERIOD_CD) AS PERIOD_NM,      /*렌탈기간 */
           B.CNT_CD,
           PKG_RTCM0051.F_SRTCM0051CODENAME('S022',B.CNT_CD) AS CNT_NM,            /*본수 */  
           B.ORD_NO,
           B.SEQ,
           B.ORD_ID,
           B.REGI_CD,
           B.FR_CD,
           B.LR_CD,
           B.ORD_QTY,
           B.REGI_AMT,
           B.RENT_AMT,
           B.RENTP_AMT,
           B.F_DCRATE,
           B.F_DCAMT,
           B.MON_DCAMT,
           B.MON_AMT,
           B.PLAN_DAY,
           B.PLAN_TM,
           B.INST_DAY,
           B.INST_TM,
           B.INST_YN,
           B.VAL_YN,
           B.EQU_NO,
           B.OS_ID,
           B.OS_DAY,
           B.STAT_CD,
           B.FL_YN,
           B.FR_YN,
           B.RL_YN,
           B.RR_YN,
           B.MAT_DESC,
           B.SALE_CD,
           B.GDS_GB,
           B.GDS_GRP,
           C.OMS_ORDERNO,
           Pkg_Exif0004.f_sExif0004O2OStockYn(OMS_ORDERNO) O2O_STOCK_YN,     --[20210713_01] kstka 거점재고여부
           C.OUT_STOCK_YN,   --[20210806_01] kstka 직영도매재고사용여부 [20221107_1] 자사재고사용여부
           C.OUT_STOCK_TYPE, --[20221107_1] 자사재고 미사용 사유
           Pkg_Rtcm0051.f_sRtcm0051Codename('S313', C.OUT_STOCK_TYPE)     AS OUT_STOCK_TYPE_NM
      FROM RTSD0005 A, RTSD0106 B, RTSD0104 C 
     WHERE A.MAT_CD = B.MAT_CD  
       AND B.ORD_NO = v_Ord_No
       AND B.ORD_NO = C.ORD_NO;

  END p_sRtsd0106New;

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
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고                  */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0106 (
            ORD_NO,
            SEQ,
            ORD_ID,
            PERIOD_CD,
            CNT_CD,
            REGI_CD,
            FR_CD,
            LR_CD,
            MAT_CD,
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
            SALE_CD,
            GDS_GB,
            GDS_GRP,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            MAT_CD_S        --[20210713_02] kstka 대체규격컬럼추가
            )
    VALUES  (
            v_Ord_No,
            v_Seq,
            v_Ord_Id,
            v_Period_Cd,
            v_Cnt_Cd,
            v_Regi_Cd,
            v_Fr_Cd,
            v_Lr_Cd,
            v_Mat_Cd,
            v_Ord_Qty,
            v_Regi_Amt,
            v_Rent_Amt,
            v_Rentp_Amt,
            v_F_Dcrate,
            v_F_Dcamt,
            v_Mon_Dcamt,
            v_Mon_Amt,
            v_Plan_Day,
            v_Plan_Tm,
            v_Inst_Day,
            v_Inst_Tm,
            v_Inst_Yn,
            v_Val_Yn,
            v_Equ_No,
            v_Os_Id,
            TO_CHAR(ADD_MONTHS(TO_DATE(v_Plan_Day,'yyyymmdd'),v_Period_Cd)-1,'YYYYMMDD'),
            v_Stat_Cd,
            v_Fl_Yn,
            v_Fr_Yn,
            v_Rl_Yn,
            v_Rr_Yn,
            v_Mat_Desc,
            v_Sale_Cd,
            v_Gds_Gb,
            v_Gds_Grp,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Mat_Cd_S
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0106;

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
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고                  */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0106
    SET    ORD_ID     = v_Ord_Id,
           PERIOD_CD  = v_Period_Cd,
           CNT_CD     = v_Cnt_Cd,
           REGI_CD    = v_Regi_Cd,
           FR_CD      = v_Fr_Cd,
           LR_CD      = v_Lr_Cd,
           MAT_CD     = v_Mat_Cd,
           ORD_QTY    = v_Ord_Qty,
           REGI_AMT   = v_Regi_Amt,
           RENT_AMT   = v_Rent_Amt,
           RENTP_AMT  = v_Rentp_Amt,
           F_DCRATE   = v_F_Dcrate,
           F_DCAMT    = v_F_Dcamt,
           MON_DCAMT  = v_Mon_Dcamt,
           MON_AMT    = v_Mon_Amt,
           PLAN_DAY   = v_Plan_Day,
           PLAN_TM    = v_Plan_Tm,
           INST_DAY   = v_Inst_Day,
           INST_TM    = v_Inst_Tm,
           INST_YN    = v_Inst_Yn,
           VAL_YN     = v_Val_Yn,
           EQU_NO     = v_Equ_No,
           OS_ID      = v_Os_Id,
           OS_DAY     = TO_CHAR(ADD_MONTHS(TO_DATE(v_Plan_Day,'yyyymmdd'),v_Period_Cd)-1,'YYYYMMDD'),
           STAT_CD    = v_Stat_Cd,
           FL_YN      = v_Fl_Yn,
           FR_YN      = v_Fr_Yn,
           RL_YN      = v_Rl_Yn,
           RR_YN      = v_Rr_Yn,
           MAT_DESC   = v_Mat_Desc,
           SALE_CD    = v_Sale_Cd,
           GDS_GB     = v_Gds_Gb,
           GDS_GRP    = v_Gds_Grp,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE,
           MAT_CD_S   = v_Mat_Cd_S      --[20210713_02] kstka 대체규격컬럼추가
    WHERE  ORD_NO     = v_Ord_No
    AND    SEQ        = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0106;

  /*****************************************************************************
  -- 계약 상품 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0106 (
    v_Ord_No         IN OUT RTSD0106.ORD_NO%TYPE,     /*계약번호              */
    v_Seq            IN RTSD0106.SEQ%TYPE,            /*순번                  */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    -- STAT_CD 장착(04)상태에서는 업데이트 못하도록 - 추후 협의후 적용.
    UPDATE RTSD0106
    SET    STAT_CD = v_Stat_Cd,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  ORD_NO  = v_Ord_No
    AND    SEQ     = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0106;

  /*****************************************************************************
  -- 계약 상품 정보 관리(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-08-03  wjim             [20170803_01] ERP주문생성건은 수정불가
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
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고                  */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    
    v_RegiAmt RTSD0029.AMT%TYPE;
    v_MonAmt    RTSD0106.MON_AMT%TYPE;
    v_ChkSeq    RTSD0106.SEQ%TYPE;

    v_Cust_No   RTSD0100.CUST_NO%TYPE;
    v_Car_No    RTSD0104.CAR_NO%TYPE;
  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Inst_Yn) IS NULL THEN
        v_Return_Message := '장착여부('||v_Inst_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Val_Yn) IS NULL THEN
        v_Return_Message := '유효여부('||v_Val_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Fl_Yn) IS NULL THEN
        v_Return_Message := '장착위-앞,왼쪽('||v_Fl_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Fr_Yn) IS NULL THEN
        v_Return_Message := '장착위치-앞,오른쪽('||v_Fr_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rl_Yn) IS NULL THEN
        v_Return_Message := '장착위치-뒤,왼쪽('||v_Rl_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rr_Yn) IS NULL THEN
        v_Return_Message := '장착위치-뒤,오른쪽('||v_Rr_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ord_Qty) IS NULL THEN
        v_Return_Message := '수량('||v_Ord_Qty||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Regi_Amt) IS NULL THEN
        v_Return_Message := '렌탈등록비('||v_Regi_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rent_Amt) IS NULL THEN
        v_Return_Message := '월렌탈료(조견표)('||v_Rent_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_F_Dcamt) IS NULL THEN
        v_Return_Message := '최종할인액('||v_F_Dcamt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mon_Dcamt) IS NULL THEN
        v_Return_Message := '월렌탈료 할인액('||v_Mon_Dcamt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mon_Amt) IS NULL THEN
        v_Return_Message := '월렌탈료('||v_Mon_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Plan_Day) IS NULL THEN
        v_Return_Message := '장착예정일('||v_Plan_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Os_Id) IS NULL THEN
        v_Return_Message := '소유권이전구분('||v_Os_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_Id) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S029', v_Ord_Id)) THEN
        v_Return_Message := '주문구분('||v_Ord_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '기간코드('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
    IF (TRIM(v_Regi_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S023', v_Regi_Cd)) THEN
        v_Return_Message := '등록비코드('||v_Regi_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
   */

    IF TRIM(v_Regi_Cd) IS NULL  THEN
        v_Return_Message := '등록비코드('||v_Regi_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Fr_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S004', v_Fr_Cd)) THEN
        v_Return_Message := '장착위치('||v_Fr_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Stat_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S032', v_Stat_Cd)) THEN
        v_Return_Message := '상태('||v_Stat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    --[20210930_01] kstka 동일접수계약인 경우 신규접수 불가처리
    SELECT CUST_NO
        ,  CAR_NO
        INTO v_Cust_No
        ,    v_Car_No
    FROM RTSD0104
    WHERE ORD_NO = v_Ord_No;
    
    IF 0 < Pkg_Rtsd0106.F_GET_DUP_ORD_CNT(v_Cust_No, v_Car_No, v_Sale_Cd, v_Mat_Cd, v_Cnt_Cd, v_Period_Cd) THEN
        v_Return_Message := '동일 계약 내용이 접수상태에 있어 신규 접수가 불가합니다 !';
        RAISE e_Error;
    END IF;
    
    v_RegiAmt := f_sRtsd0106RegiAmt(v_Ord_No); /* 판매상품별, 본수별 등록비 가져오기 */
    
    v_Seq :=f_sRtsd0106Seq(v_Ord_No);

    IF 0 = f_sRtsd0106Count(v_Ord_No,v_Seq) THEN

        


        IF 0 != f_InsertRtsd0106(v_Ord_No, v_Seq, v_Ord_Id, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Fr_Cd, v_Lr_Cd, v_Mat_Cd,
                                 v_Ord_Qty, v_RegiAmt, v_Rent_Amt, '', v_F_Dcrate,
                                 v_F_Dcamt, v_Mon_Dcamt, v_Mon_Amt, v_Plan_Day,
                                 v_Plan_Tm, v_Inst_Day, v_Inst_Tm, v_Inst_Yn,
                                 v_Val_Yn, v_Equ_No,  v_Os_Id, v_Os_Day,
                                 v_Stat_Cd, v_Fl_Yn, v_Fr_Yn, v_Rl_Yn,
                                 v_Rr_Yn, v_Mat_Desc, v_Sale_Cd,
                                 v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_Mat_Cd_S,     --[20210713_02] kstka 대체규격컬럼추가
                                 v_ErrorText) THEN
            v_Return_Message := '계약 상품 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF TRIM(v_Ord_No) IS NULL THEN
                v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF TRIM(v_Seq) IS NULL THEN
                v_Return_Message := '순번('||v_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;

            IF '01' != f_sRtsd0106StatCd(v_Ord_No, v_Seq) THEN
                v_Return_Message := '계약상태('||Pkg_Rtcm0051.f_sRtcm0051CodeName('S032',f_sRtsd0106StatCd(v_Ord_No, v_Seq))||') : 계약상태가 계약접수가 아니므로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
            
            -- ERP오더가 이미 생성된 경우 상품-가격정보 수정불가 [20170803_01]
            -- - ERP오더 생성건의 상품을 수정하여 제품 오배송 클래임 발생 (2017-07-12)
            -- - 수정 필요 시 기존 계약 취소 후 재접수로 진행한다고 함 (2017-08-03, 박정석)
            IF 0 < Pkg_Rtsd0104.f_sRtsd0104ToRtsd0115Count(v_Ord_No, 'N') THEN
                v_Return_Message := 'ERP오더가 생성되어 상품-가격정보 수정이 불가합니다!';
                RAISE e_Error;
            END IF;

            IF 0 != f_UpdateRtsd0106(v_Ord_No, v_Seq, v_Ord_Id, v_Period_Cd, v_Cnt_Cd,
                                     v_Regi_Cd, v_Fr_Cd, v_Lr_Cd, v_Mat_Cd,
                                     v_Ord_Qty, v_RegiAmt, v_Rent_Amt, '', v_F_Dcrate,
                                     v_F_Dcamt, v_Mon_Dcamt, v_Mon_Amt, v_Plan_Day,
                                     v_Plan_Tm, v_Inst_Day, v_Inst_Tm, v_Inst_Yn,
                                     v_Val_Yn, v_Equ_No, v_Os_Id,v_Os_Day,
                                     v_Stat_Cd, v_Fl_Yn, v_Fr_Yn, v_Rl_Yn,
                                     v_Rr_Yn, v_Mat_Desc, v_Sale_Cd,
                                     v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_Mat_Cd_S,     --[20210713_02] kstka 대체규격컬럼추가
                                     v_ErrorText) THEN
                v_Return_Message := '계약 상품 정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0106(v_Ord_No, v_Seq, v_Stat_Cd, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '계약 상품 정보 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;

    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0107.f_InsertRtsd0107(v_Ord_No, v_Seq, v_ErrorText) THEN
        v_Return_Message := '계약 상품 정보 변경 이력 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    IF v_Ord_Id = '01' THEN 
  
        
        SELECT 
          T1.AMT
          INTO v_MonAmt
        FROM RTSD0106 T, RTSD0008 T1
        WHERE 1=1
        AND T.ORD_NO    = v_Ord_No
        AND T.SEQ       = v_Seq
        AND T.MAT_CD    = T1.MAT_CD
        AND T.PERIOD_CD = T1.PERIOD_CD
        AND T.CNT_CD    = T1.CNT_CD
        AND T1.PRICE_CD = (SELECT CASE WHEN PRDT_GRP_DTL = '02' THEN '0003' ELSE '0002' END FROM RTSD0020 WHERE SALE_CD = v_Sale_cd)
        AND TO_CHAR(SYSDATE, 'YYYYMMDD')  BETWEEN T1.STR_DAY AND T1.END_DAY;

        IF v_MonAmt > 0 THEN
            UPDATE RTSD0106
            SET MON_AMT     = v_MonAmt,
                RENT_AMT    = v_MonAmt 
            WHERE ORD_NO    = v_Ord_No
            AND SEQ         = v_Seq;
        END IF;
    END IF;
   
    PKG_RTSD0106.p_regiSendSms(v_Ord_No, v_Seq, v_Reg_Id, v_Success_Code, v_Return_Message, v_Errortext);
    IF 0 != v_Success_Code THEN
        v_Return_Message := 'SMS 발송을 실패하였습니다.!!!'||'-'||v_Return_Message;
        v_Errortext := v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0106.p_IUDRtsd0106(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0106.p_IUDRtsd0106(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0106;


  /*****************************************************************************
  -- 계약 상품 정보 관리(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-08-03  wjim             [20170803_01] ERP주문생성건은 수정불가
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
    v_Mat_Desc       IN RTSD0106.MAT_DESC%TYPE,       /*비고                  */
    v_Sale_Cd        IN RTSD0106.SALE_CD%TYPE,        /*판매코드              */
    v_Gds_Gb         IN RTSD0106.GDS_GB%TYPE,         /*제품구분              */
    v_Gds_Grp        IN RTSD0106.GDS_GRP%TYPE,        /*제품군                */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_Mat_Cd_S       IN RTSD0106.MAT_CD_S%TYPE,       /*대체규격제품코드        */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    
    v_Cust_No   RTSD0100.CUST_NO%TYPE;
    v_Car_No    RTSD0104.CAR_NO%TYPE;
  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Inst_Yn) IS NULL THEN
        v_Return_Message := '장착여부('||v_Inst_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Val_Yn) IS NULL THEN
        v_Return_Message := '유효여부('||v_Val_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Fl_Yn) IS NULL THEN
        v_Return_Message := '장착위-앞,왼쪽('||v_Fl_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Fr_Yn) IS NULL THEN
        v_Return_Message := '장착위치-앞,오른쪽('||v_Fr_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rl_Yn) IS NULL THEN
        v_Return_Message := '장착위치-뒤,왼쪽('||v_Rl_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rr_Yn) IS NULL THEN
        v_Return_Message := '장착위치-뒤,오른쪽('||v_Rr_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ord_Qty) IS NULL THEN
        v_Return_Message := '수량('||v_Ord_Qty||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Regi_Amt) IS NULL THEN
        v_Return_Message := '렌탈등록비('||v_Regi_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rent_Amt) IS NULL THEN
        v_Return_Message := '월렌탈료(조견표)('||v_Rent_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_F_Dcamt) IS NULL THEN
        v_Return_Message := '최종할인액('||v_F_Dcamt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mon_Dcamt) IS NULL THEN
        v_Return_Message := '월렌탈료 할인액('||v_Mon_Dcamt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Mon_Amt) IS NULL THEN
        v_Return_Message := '월렌탈료('||v_Mon_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Plan_Day) IS NULL THEN
        v_Return_Message := '장착예정일('||v_Plan_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Os_Id) IS NULL THEN
        v_Return_Message := '소유권이전구분('||v_Os_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_Id) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S029', v_Ord_Id)) THEN
        v_Return_Message := '주문구분('||v_Ord_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '기간코드('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
    IF (TRIM(v_Regi_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S023', v_Regi_Cd)) THEN
        v_Return_Message := '등록비코드('||v_Regi_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
   */

    IF TRIM(v_Regi_Cd) IS NULL  THEN
        v_Return_Message := '등록비코드('||v_Regi_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Fr_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S004', v_Fr_Cd)) THEN
        v_Return_Message := '장착위치('||v_Fr_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Stat_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S032', v_Stat_Cd)) THEN
        v_Return_Message := '상태('||v_Stat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    --[20210930_01] kstka 동일접수계약인 경우 신규접수 불가처리
    SELECT CUST_NO
        ,  CAR_NO
        INTO v_Cust_No
        ,    v_Car_No
    FROM RTSD0104
    WHERE ORD_NO = v_Ord_No;
    
    IF 0 < Pkg_Rtsd0106.F_GET_DUP_ORD_CNT(v_Cust_No, v_Car_No, v_Sale_Cd, v_Mat_Cd, v_Cnt_Cd, v_Period_Cd) THEN
        v_Return_Message := '동일 계약 내용이 접수상태에 있어 신규 접수가 불가합니다 !';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtsd0106Count(v_Ord_No,v_Seq) THEN

        v_Seq :=f_sRtsd0106Seq(v_Ord_No);

        IF 0 != f_InsertRtsd0106(v_Ord_No, v_Seq, v_Ord_Id, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Fr_Cd, v_Lr_Cd, v_Mat_Cd,
                                 v_Ord_Qty, v_Regi_Amt, v_Rent_Amt, v_Rentp_Amt, v_F_Dcrate,
                                 v_F_Dcamt, v_Mon_Dcamt, v_Mon_Amt, v_Plan_Day,
                                 v_Plan_Tm, v_Inst_Day, v_Inst_Tm, v_Inst_Yn,
                                 v_Val_Yn, v_Equ_No,  v_Os_Id, v_Os_Day,
                                 v_Stat_Cd, v_Fl_Yn, v_Fr_Yn, v_Rl_Yn,
                                 v_Rr_Yn, v_Mat_Desc, v_Sale_Cd,
                                 v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_Mat_Cd_S,     --[20210713_02] kstka 대체규격컬럼추가
                                 v_ErrorText) THEN
            v_Return_Message := '계약 상품 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            v_Success_code := 0;
        ELSIF v_Comm_Dvsn = 'D' THEN
            v_Success_code := 0;
        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0107.f_InsertRtsd0107(v_Ord_No, v_Seq, v_ErrorText) THEN
        v_Return_Message := '계약 상품 정보 변경 이력 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    /*
    --계약별할인정보 생성
    IF 0 != Pkg_Rtsd0040.f_InsertRtsd0040(v_Ord_No, v_Seq, v_Rent_Amt, v_Mon_Dcamt, v_Mon_Amt, v_ErrorText) THEN
        v_Return_Message := '계약할인정보 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    */

    PKG_RTSD0106.p_regiSendSms(v_Ord_No, v_Seq, v_Reg_Id, v_Success_Code, v_Return_Message, v_Errortext);
    IF 0 != v_Success_Code THEN
        v_Return_Message := 'SMS 발송을 실패하였습니다.!!!'||'-'||v_Return_Message;
        v_Errortext := v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0106.p_IUDRtsd0106(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0106.p_IUDRtsd0106(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0106New;

  /*****************************************************************************
  -- 계약 상품 정보 - 계약상품중 대표상품 코드 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0106MatCd(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE            /*계약번호            */
    ) RETURN VARCHAR IS
    v_Mat_Cd    RTSD0106.MAT_CD%TYPE DEFAULT NULL;      /*상품코드            */

  BEGIN

    -- 업무적으로 하나의 계약에 하나 이상의 상품으로 정의가능성이 있으며, 대표상품을 아래와 같이 정함
    -- MIN(SEQ)
    SELECT  /*+ INDEX_ASC (RTSD0106 RTSD0106_PK) */
            MAT_CD
    INTO    v_Mat_Cd
    FROM    RTSD0106
    WHERE   ORD_NO  = v_Ord_No
    AND     INST_YN = 'Y'  /*장착여부 */
    AND     STAT_CD = '04' /*상태    */
    AND     ROWNUM <= 1;

    RETURN v_Mat_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0106MatCd;


  /*****************************************************************************
  -- 계약 상품 정보 - 계약상품중 대표 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0106ChoiceSeq(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_Seq    RTSD0106.SEQ%TYPE DEFAULT 0; /*순번    */

  BEGIN

    -- 업무적으로 하나의 계약에 하나 이상의 상품으로 정의가능성이 있으며, 대표상품을 아래와 같이 정함
    -- MIN(SEQ)
    SELECT  /*+ INDEX_ASC (RTSD0106 RTSD0106_PK) */
            SEQ
    INTO    v_Seq
    FROM    RTSD0106
    WHERE   ORD_NO  = v_Ord_No
    AND     INST_YN = 'Y'  /*장착여부 */
    AND     STAT_CD = '04' /*상태    */
    AND     ROWNUM <= 1;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0106ChoiceSeq;


  /*****************************************************************************
  -- 계약 상품 정보 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0106Seq (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER IS

    v_Seq RTSD0106.SEQ%TYPE DEFAULT NULL;
  BEGIN

    SELECT  NVL(MAX(SEQ)+1,1)
    INTO    v_Seq
    FROM    RTSD0106
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0106Seq;


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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0106
    SET    STAT_CD  = v_Stat_Cd,
           INST_DAY = v_Inst_Day,
           INST_YN  = 'Y',
           VAL_YN   = 'Y',
           OS_DAY   = TO_CHAR(ADD_MONTHS(TO_DATE(v_Inst_Day,'yyyymmdd'),PERIOD_CD)-1,'YYYYMMDD'),
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ORD_NO   = v_Ord_No
    AND    SEQ      = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0106PrcStat;

  /*****************************************************************************
  -- 계약 상품 정보 - 전사서명 정보 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0106Sign (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,         /*계약번호              */
    v_Stat_Cd        IN RTSD0106.STAT_CD%TYPE,        /*상태                  */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0106
    SET    STAT_CD = v_Stat_Cd,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  ORD_NO  = v_Ord_No
    AND    STAT_CD = '01';

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0106Sign;

  /*****************************************************************************
  -- 계약 정보 Update - 온라인주문취소
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0106OnlineCancel (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0106
    SET    STAT_CD = '06',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  ORD_NO  = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0106OnlineCancel;


  /*****************************************************************************
  -- 계약 상품 정보 -  계약번호 기준 최종 장착일 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0106PlanDay(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE            /*계약번호            */
    ) RETURN VARCHAR IS

    v_Plan_Day  RTSD0106.PLAN_DAY%TYPE DEFAULT NULL;  /*장착예정일            */
  BEGIN

    SELECT  PLAN_DAY
    INTO    v_Plan_Day
    FROM    (
            SELECT  ORD_NO, PLAN_DAY, SEQ
            FROM    RTSD0106
            WHERE   ORD_NO = v_Ord_No
            ORDER   BY ORD_NO, SEQ DESC
            ) B
    WHERE   ROWNUM <= 1;

    RETURN v_Plan_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0106PlanDay;

  /*****************************************************************************
  -- 계약 상품 정보 -  계약번호 기준 최종 장착일 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0106StatCd(
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0106.SEQ%TYPE               /*순번                */
    ) RETURN VARCHAR IS

    v_Stat_Cd  RTSD0106.STAT_CD%TYPE DEFAULT NULL;      /*상태            */
  BEGIN

    SELECT  STAT_CD
    INTO    v_Stat_Cd
    FROM    RTSD0106
    WHERE   ORD_NO = v_Ord_No
    AND     SEQ = v_Seq;

    RETURN v_Stat_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0106StatCd;


  /*****************************************************************************
  -- 계약 상품 정보 - 결합고객 할인금액 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0106Discount (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,         /*계약번호              */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_Reg_Id         IN RTSD0106.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0106
    SET    MON_AMT = v_Mon_Amt,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  ORD_NO  = v_Ord_No
    AND    SEQ     = ( SELECT   MAX(SEQ) FROM RTSD0106
                       WHERE    ORD_NO = v_Ord_No );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0106Discount;

  /*****************************************************************************
  -- 계약 상품 정보 Count - 상품코드로 진행주문 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0106CountMatCd(
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE             /*상품코드            */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0106
    WHERE   MAT_CD  = v_Mat_Cd
    AND     STAT_CD IN ('01','03');

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0106CountMatCd;

  /*****************************************************************************
  -- 계약 상품 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0106New (
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER IS
  BEGIN

    DELETE FROM RTSD0106
    WHERE  ORD_NO = v_Ord_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0106.f_DeleteRtsd0106New(1)', '주문번호', v_Ord_No);

    RETURN SQLCODE;
  END f_DeleteRtsd0106New;
  
  
  


  /*****************************************************************************
  -- 계약 상품 정보 관리(IUD) 일시불
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
    ) IS

    e_Error EXCEPTION;

    v_Snd_Msg       RTSD0205.SND_MSG%TYPE DEFAULT NULL;               /*SMS메시지 [20170405_02] */
    v_StatCd        VARCHAR2(10);    --상태코드
    v_Cust_Nm       VARCHAR2(100);   --고객명
    v_Mat_Nm        VARCHAR2(100);  --계약상품
    v_OrdQty        VARCHAR2(100);  --계약수량
    v_Period_Nm     VARCHAR2(10);  --계약기간
    v_Regi_Nm       VARCHAR2(50);  --최초등록비
    v_Summon_Amt    NUMBER;  --월렌탈료
    v_Agency_Nm     VARCHAR2(100);  --장착점상호명
    v_Agency_Addr   VARCHAR2(500);  --장착점주소
    v_Agency_TelNo  VARCHAR2(20);  --장착점전화번호
    v_Prc_Day       VARCHAR2(20);  --장착예정일
    v_Customer_Mobno  VARCHAR2(20);--받는사람핸드폰번호

  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

   
    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

   

    IF (TRIM(v_Ord_Id) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S029', v_Ord_Id)) THEN
        v_Return_Message := '주문구분('||v_Ord_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '기간코드('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Seq :=f_sRtsd0106Seq(v_Ord_No);

    IF 0 = f_sRtsd0106Count(v_Ord_No,v_Seq) THEN


        IF 0 != f_InsertRtsd0106(v_Ord_No, v_Seq, v_Ord_Id, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Fr_Cd, v_Lr_Cd, v_Mat_Cd,
                                 v_Ord_Qty, v_Regi_Amt, v_Rent_Amt, v_Rentp_Amt, v_F_Dcrate,
                                 v_F_Dcamt, v_Mon_Dcamt, v_Mon_Amt, v_Plan_Day,
                                 v_Plan_Tm, v_Inst_Day, v_Inst_Tm, v_Inst_Yn,
                                 v_Val_Yn, v_Equ_No,  v_Os_Id, v_Os_Day,
                                 v_Stat_Cd, v_Fl_Yn, v_Fr_Yn, v_Rl_Yn,
                                 v_Rr_Yn, v_Mat_Desc, v_Sale_Cd,
                                 v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_Mat_Cd_S,     --[20210713_02] kstka 대체규격컬럼추가
                                 v_ErrorText) THEN
            v_Return_Message := '계약 상품 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            v_Success_code := 0;
        ELSIF v_Comm_Dvsn = 'D' THEN
            v_Success_code := 0;
        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0107.f_InsertRtsd0107(v_Ord_No, v_Seq, v_ErrorText) THEN
        v_Return_Message := '계약 상품 정보 변경 이력 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    IF v_Ord_No IS NOT NULL THEN
    
        SELECT A.STAT_CD 
        INTO   v_StatCd
        FROM RTSD0104 A 
        WHERE A.ORD_NO = v_Ord_No;
        
        IF v_StatCd = '01' THEN
            
            BEGIN
                SELECT
                  (SELECT A.CUST_NM FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS CUST_NM
                  ,(SELECT B.MAT_NM FROM RTSD0106 A, RTSD0005 B WHERE A.ORD_NO = T.ORD_NO AND A.MAT_CD = B.MAT_CD AND A.SEQ = v_Seq) AS MAT_NM
                  ,(SELECT A.ORD_QTY FROM RTSD0106 A WHERE A.ORD_NO = T.ORD_NO AND A.SEQ = v_Seq) AS ORD_QRY
                  ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', T.PERIOD_CD) AS PERIOD_NM 
                  ,T.REGI_AMT
                  ,T.SUM_MON_AMT
                  ,(SELECT A.AGENCY_NM  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_NM
                  ,(SELECT A.CITY||' '||A.STREET  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_ADDR
                  ,(SELECT REGEXP_REPLACE(REGEXP_REPLACE (A.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3')  
                    FROM RTSD0007 A 
                    WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_TEL_NO
                  ,TO_CHAR(TO_DATE(T.PROC_DAY,'YYYYMMDD'),'YYYY.MM.DD') AS PROC_DAY
                  ,(SELECT A.MOB_NO FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS MOB_NO
                INTO v_Cust_Nm          --고객명
                     ,v_Mat_Nm          --구매상품
                     ,v_OrdQty          --구매수량
                     ,v_Period_Nm       --계약기간
                     ,v_Regi_Nm         --최초등록비
                     ,v_Summon_Amt      --월렌탈료
                     ,v_Agency_Nm       --장착점상호명
                     ,v_Agency_Addr     --장착점주소
                     ,v_Agency_TelNo    --장착점전화번호
                     ,v_Prc_Day        --장착예정일
                     ,v_Customer_Mobno  --받는사람핸드폰번호
                FROM RTSD0104 T
                WHERE T.ORD_NO = v_Ord_No;
                
                
                v_Snd_Msg := '';
                v_Snd_Msg := '[넥센타이어] '||v_Cust_Nm||' 고객님 타이어 렌탈 서비스를 이용해 주셔서 감사합니다.';
                v_Snd_Msg := v_Snd_Msg||'구매자명 : '||v_Cust_Nm||', 구매 상품 : '||v_Mat_Nm||', 구매수량 : '||v_OrdQty||', 계약기간 : '||v_Period_Nm||', 총 결제금액 : '||v_Regi_Nm;
                v_Snd_Msg := v_Snd_Msg||'(장착점 안내) 상호명 : '||v_Agency_Nm||', 주소 : '||v_Agency_Addr||', 전화번호 : '||v_Agency_TelNo||', 장착 예정일 : '||v_Prc_Day;
                
                --주문접수완료 SMS 발송
                Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                      'I'                                   /*예약 전송여부    */
                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                    , v_Customer_Mobno                      /*받는 전화번호    */
                    , '18550100'                            /*보내는 전화번호  */
                    , v_Snd_Msg                             /*메시지내용       */
                    , ''                                    /*사용자지정 필드1 */
                    , v_Ord_No                              /*사용자지정 필드2 */
                    ,'2'
                    ,'RENTAL00000000000086'
                    , v_Reg_Id                              /*등록자 ID        */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN 
                Null; 
            END;
            
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0106.p_IUDRtsd0106Direct(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0106.p_IUDRtsd0106Direct(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0106Direct;
  
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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

   
    IF TRIM(v_Mat_Cd) IS NULL THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;



    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '기간코드('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
   

    IF TRIM(v_Regi_Cd) IS NULL  THEN
        v_Return_Message := '등록비코드('||v_Regi_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Fr_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S004', v_Fr_Cd)) THEN
        v_Return_Message := '장착위치('||v_Fr_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Stat_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S032', v_Stat_Cd)) THEN
        v_Return_Message := '상태('||v_Stat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0106Count(v_Ord_No,v_Seq) THEN

        v_Seq :=f_sRtsd0106Seq(v_Ord_No);

        IF 0 != f_InsertRtsd0106(v_Ord_No, v_Seq, v_Ord_Id, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Fr_Cd, v_Lr_Cd, v_Mat_Cd,
                                 v_Ord_Qty, v_Regi_Amt, v_Rent_Amt, v_Rentp_Amt, v_F_Dcrate,
                                 v_F_Dcamt, v_Mon_Dcamt, v_Mon_Amt, v_Plan_Day,
                                 v_Plan_Tm, v_Inst_Day, v_Inst_Tm, v_Inst_Yn,
                                 v_Val_Yn, v_Equ_No,  v_Os_Id, v_Os_Day,
                                 v_Stat_Cd, v_Fl_Yn, v_Fr_Yn, v_Rl_Yn,
                                 v_Rr_Yn, v_Mat_Desc, v_Sale_Cd,
                                 v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_Mat_Cd_S,     --[20210713_02] kstka 대체규격컬럼추가
                                 v_ErrorText) THEN
            v_Return_Message := '계약 상품 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            v_Success_code := 0;
        ELSIF v_Comm_Dvsn = 'D' THEN
            v_Success_code := 0;
        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
        END IF;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0107.f_InsertRtsd0107(v_Ord_No, v_Seq, v_ErrorText) THEN
        v_Return_Message := '계약 상품 정보 변경 이력 등록 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0106.p_IUDRtsd0106Direct(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0106.p_IUDRtsd0106Direct(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0106Member;



  
  /*****************************************************************************
  -- 제품 관리 Select 멤버십
  *****************************************************************************/
  PROCEDURE p_sRtsd0106Member (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE,       /*가격,금액유형         */
    v_Sale_Cd      IN RTSD0106.SALE_CD%TYPE,      /*기간코드              */
    v_Model_Cd     IN RTSD0104.MODEL_CD%TYPE         /*타이어본수            */   
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT    
        B.ORD_NO
        ,A.SEQ
        ,A.ORD_ID
        ,A.PERIOD_CD
        ,A.CNT_CD
        ,A.REGI_CD
        ,A.FR_CD
        ,A.LR_CD
        ,A.MAT_CD
        ,A.ORD_QTY
        ,A.REGI_AMT
        ,A.RENT_AMT
        ,A.RENTP_AMT
        ,A.F_DCRATE
        ,A.F_DCAMT
        ,A.MON_DCAMT
        ,A.MON_AMT
        ,A.PLAN_DAY
        ,A.PLAN_TM
        ,A.INST_DAY
        ,A.INST_TM
        ,A.INST_YN
        ,A.VAL_YN
        ,A.EQU_NO
        ,A.OS_ID
        ,A.OS_DAY
        ,A.STAT_CD
        ,A.FL_YN
        ,A.FR_YN
        ,A.RL_YN
        ,A.RR_YN
        ,A.MAT_DESC
        ,A.REG_ID
        ,A.REG_DT
        ,A.CHG_ID
        ,A.CHG_DT
        ,A.SALE_CD
        ,A.GDS_GB
        ,A.GDS_GRP
        ,B.ORD_NO
        ,Pkg_Exif0004.f_sExif0004O2OStockYn(OMS_ORDERNO) O2O_STOCK_YN   --[20210713_01] kstka 거점재고여부
        FROM RTSD0106 A, RTSD0104 B
        WHERE A.ORD_NO=B.ORD_NO
    AND B.SALE_CD   = DECODE(v_Sale_Cd    , NULL, B.SALE_CD    , v_Sale_Cd)
    AND A.ORD_NO    = DECODE(v_Ord_No    , NULL, A.ORD_NO    , v_Ord_No)
    AND B.MODEL_CD  = DECODE(v_Model_Cd    , NULL, B.MODEL_CD    , v_Model_Cd);

  END p_sRtsd0106Member; 

  /*****************************************************************************
  --판매상품별 본수별 등록비 가져오기
  *****************************************************************************/
  FUNCTION f_sRtsd0106RegiAmt (
    v_Ord_No       IN RTSD0104.ORD_NO%TYPE       /*  계약번호         */
    ) RETURN NUMBER IS

    v_RegiAmt RTSD0029.AMT%TYPE;
  BEGIN

    SELECT
     T1.AMT
     INTO v_RegiAmt
    FROM RTSD0104 T, RTSD0029 T1
    WHERE T.ORD_NO = v_Ord_No
    AND T.SALE_CD = T1.SALE_CD
    AND T.CNT_CD = '0'||T1.CNT_CD;

    RETURN v_RegiAmt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0106RegiAmt;


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
    ) IS

    e_Error EXCEPTION;

    v_Sms_Msg       RTSD0205.SND_MSG%TYPE := '';
    
    v_StatCd        VARCHAR2(10);    --상태코드
    v_Cust_Nm       VARCHAR2(100);   --고객명
    v_Mat_Nm        VARCHAR2(100);  --계약상품
    v_Ord_Qty       VARCHAR2(100);  --계약수량
    v_Period_Nm     VARCHAR2(10);  --계약기간
    v_Regi_Nm       VARCHAR2(50);  --최초등록비
    v_Summon_Amt    NUMBER;  --월렌탈료
    v_Agency_Nm     VARCHAR2(100);  --장착점상호명
    v_Agency_Addr   VARCHAR2(500);  --장착점주소
    v_Agency_TelNo  VARCHAR2(20);  --장착점전화번호
    v_Prc_Day       VARCHAR2(20);  --장착예정일
    v_Customer_Mobno  VARCHAR2(20);--받는사람핸드폰번호

    v_InstCd VARCHAR2(10); --[20200724_01] kstka 장착유형
    
   BEGIN
   
    IF v_Ord_No IS NOT NULL THEN
    
        SELECT A.STAT_CD, NVL(A.INST_CD, '1030') INST_CD 
        INTO   v_StatCd, v_InstCd
        FROM RTSD0104 A 
        WHERE A.ORD_NO = v_Ord_No;
        
        IF v_StatCd = '01' AND v_InstCd IN ('1030') THEN
            
            BEGIN
                SELECT
                  (SELECT A.CUST_NM FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS CUST_NM
                  ,(SELECT B.MAT_NM FROM RTSD0106 A, RTSD0005 B WHERE A.ORD_NO = T.ORD_NO AND A.MAT_CD = B.MAT_CD AND A.SEQ = v_Seq) AS MAT_NM
                  ,(SELECT A.ORD_QTY FROM RTSD0106 A WHERE A.ORD_NO = T.ORD_NO AND A.SEQ = v_Seq) AS ORD_QRY
                  ,T.PERIOD_CD
                  ,T.REGI_AMT
                  ,T.SUM_MON_AMT
                  ,(SELECT A.AGENCY_NM  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_NM
                  ,(SELECT A.CITY||' '||A.STREET  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_ADDR
                  ,(SELECT REGEXP_REPLACE(REGEXP_REPLACE (A.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3')  
                    FROM RTSD0007 A 
                    WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_TEL_NO
                  ,TO_CHAR(TO_DATE(T.PROC_DAY,'YYYYMMDD'),'YYYY.MM.DD') AS PROC_DAY
                  ,(SELECT A.MOB_NO FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS MOB_NO
                INTO v_Cust_Nm          --고객명
                     ,v_Mat_Nm          --계약상품
                     ,v_Ord_Qty         --계약수량
                     ,v_Period_Nm       --계약기간
                     ,v_Regi_Nm         --최초등록비
                     ,v_Summon_Amt      --월렌탈료
                     ,v_Agency_Nm       --장착점상호명
                     ,v_Agency_Addr     --장착점주소
                     ,v_Agency_TelNo    --장착점전화번호
                     ,v_Prc_Day        --장착예정일
                     ,v_Customer_Mobno  --받는사람핸드폰번호
                FROM RTSD0104 T
                WHERE T.ORD_NO = v_Ord_No;
                
                v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||' 고객님 타이어 렌탈 서비스를 이용해 주셔서 감사합니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'(렌탈 계약정보) 계약자명 : '||v_Cust_Nm||', 계약 상품 : '||v_Mat_Nm||', 계약 수량 : '||v_Ord_Qty||'개, 계약기간 : '||v_Period_Nm||'개월, 최초 등록비 : '||v_Regi_Nm||'원(1회), 월 렌탈료 : '||v_Summon_Amt||'원';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'(장착점 안내) 상호명 : '||v_Agency_Nm||', 주소 : '||v_Agency_Addr||', 전화번호 : '||v_Agency_TelNo||', 도착 예정일 : '||v_Prc_Day;
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'※장착점 내방시 계약자 신분증을 반드시 지참해주세요.'; --[20210107_01]
                v_Sms_Msg := v_Sms_Msg||'※타이어 재고 부족으로 예정일 대비 지연될 수 있습니다.';
                v_Sms_Msg := v_Sms_Msg||'※장착점 내방 전 유선 전화하시어 타이어 도착 유무 확인 및 장착 일정 협의바랍니다.';
                
                --주문접수완료 SMS 발송
                Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                      'I'                                   /*예약 전송여부    */
                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                    , v_Customer_Mobno                      /*받는 전화번호    */
                    , '18550100'                            /*보내는 전화번호  */
                    , v_Sms_Msg                             /*메시지내용       */
                    , 'S003'                                /*사용자지정 필드1 */
                    , v_Ord_No                              /*사용자지정 필드2 */
                    ,'2'
                    ,'RENTAL00000000000003'
                    , v_Reg_Id                              /*등록자 ID        */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN 
                Null; 
            END;
            
        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0104.p_regiAmtPay(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0104.p_regiAmtPay(2)', v_ErrorText, v_Return_Message);
  END p_regiSendSms;

  /*****************************************************************************
  -- SELECT MAT_NM WITH 계약번호
  *****************************************************************************/
PROCEDURE P_SELECT_MAT_INFO_WITH_ORD(
    REF_CURSOR  IN OUT SYS_REFCURSOR,
    PI_VAL  IN VARCHAR2     /* ORD_NO */
)   IS

BEGIN
    OPEN REF_CURSOR FOR
    
    SELECT MAT_CD,
           MAT_NM,
           SUBSTRB(MAT_NM, 1, 30) MAT_NM30
      FROM (
            SELECT MAT_CD,
                   PKG_RTSD0106.F_GET_MAT_NM_WITH_ORD(PI_VAL) MAT_NM
              FROM (
                    SELECT MAT_CD
                      FROM 
                            (
                            SELECT A.MAT_CD
                              FROM RTSD0106 A
                                    LEFT OUTER JOIN RTSD0005 B ON
                                        A.MAT_CD = B.MAT_CD
                             WHERE A.ORD_NO = PI_VAL
                               AND ROWNUM = 1
                             ORDER BY
                                   A.ORD_NO, A.SEQ
                          ) UNION
                          SELECT '' MAT_CD FROM DUAL
                    ORDER BY
                          MAT_CD NULLS LAST
                   )
           )
     WHERE 1=1
       AND ROWNUM = 1;
    
END P_SELECT_MAT_INFO_WITH_ORD;

  /*****************************************************************************
  -- GET MAT_NM WITH MAT_CD
  *****************************************************************************/
FUNCTION F_GET_MAT_NM_WITH_CD(
    PI_VAL IN VARCHAR2   /* MAT_CD */
) RETURN VARCHAR2 IS

    PO_MAT_NM   VARCHAR2(80);
BEGIN
    SELECT MAT_NM
      INTO PO_MAT_NM
      FROM (
            SELECT MAT_CD,
                   CASE WHEN SUBSTR(MAT_CD, 1, 1) = 'P' THEN (SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S078')
                   ELSE MAT_NM END MAT_NM
              FROM (
                    SELECT MAT_CD, MAT_NM
                      FROM 
                            (
                            SELECT A.MAT_CD, A.MAT_NM
                              FROM RTSD0005 A
                             WHERE A.MAT_CD = PI_VAL
                          ) UNION
                          SELECT '' MAT_CD, '' MAT_NM FROM DUAL
                    ORDER BY
                          MAT_CD NULLS LAST
                   )
           )
     WHERE 1=1
       AND ROWNUM = 1;
    
    RETURN PO_MAT_NM;
    
    EXCEPTION
      WHEN OTHERS THEN
        RETURN '';
       
END F_GET_MAT_NM_WITH_CD;

  /*****************************************************************************
  -- GET MAT_NM WITH 계약번호
  *****************************************************************************/
FUNCTION F_GET_MAT_NM_WITH_ORD(
    PI_VAL   IN VARCHAR2 /* 계약번호 */
) RETURN VARCHAR2 IS
    
    PO_MAT_NM   VARCHAR2(80);
BEGIN
    SELECT MAT_NM
      INTO PO_MAT_NM
      FROM (
            SELECT MAT_CD,
                   F_GET_MAT_NM_WITH_CD(MAT_CD) MAT_NM
              FROM (
                    SELECT MAT_CD, MAT_NM
                      FROM 
                            (
                            SELECT A.MAT_CD, B.MAT_NM
                              FROM RTSD0106 A
                                    LEFT OUTER JOIN RTSD0005 B ON
                                        A.MAT_CD = B.MAT_CD
                             WHERE A.ORD_NO = PI_VAL
                               AND ROWNUM = 1
                             ORDER BY
                                   A.ORD_NO, A.SEQ
                          ) UNION
                          SELECT '' MAT_CD, '' MAT_NM FROM DUAL
                    ORDER BY
                          MAT_CD NULLS LAST
                   )
           )
     WHERE 1=1
       AND ROWNUM = 1;
    
    RETURN PO_MAT_NM;
    
    EXCEPTION
      WHEN OTHERS THEN
        RETURN '';

END F_GET_MAT_NM_WITH_ORD;

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
) RETURN NUMBER IS
    
    v_Cnt   NUMBER;
BEGIN

    SELECT COUNT(*) 
    INTO v_Cnt
        FROM RTSD0104 A, RTSD0106 B 
    WHERE 1=1
    AND A.ORD_NO = B.ORD_NO
    AND A.CUST_NO   = v_Cust_No
    AND A.CAR_NO    = v_Car_No
    AND A.SALE_CD   = v_Sale_Cd
    AND B.MAT_CD    = v_Mat_Cd
    AND A.CNT_CD    = v_Cnt_Cd
    AND A.PERIOD_CD = v_Period_Cd
    AND A.STAT_CD   = '01';
    
    RETURN v_Cnt;
    
    EXCEPTION
      WHEN OTHERS THEN
        RETURN '';

END F_GET_DUP_ORD_CNT;


END Pkg_Rtsd0106;
/
