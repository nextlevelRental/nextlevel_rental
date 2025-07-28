CREATE OR REPLACE PACKAGE NXRADMIN.PKG_ZTSD0008 AS
/*******************************************************************************
   NAME:      Pkg_Ztsd0008
   PURPOSE   가격 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-03  Sean             1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 가격 관리 Select
  *****************************************************************************/
  PROCEDURE p_sZtsd0008 (
    Ref_Cursor  IN OUT SYS_REFCURSOR, 
    v_PRICE_CD               ZTSD0008.PRICE_CD%TYPE, 
    v_MAT_CD                 ZTSD0008.MAT_CD%TYPE, 
    v_PERIOD_CD              ZTSD0008.PERIOD_CD%TYPE, 
    v_CNT_CD                 ZTSD0008.CNT_CD%TYPE, 
    v_REGI_CD                ZTSD0008.REGI_CD%TYPE, 
    v_STR_DAY                ZTSD0008.STR_DAY%TYPE, 
    v_END_DAY                ZTSD0008.END_DAY%TYPE, 
    v_SEQ                    ZTSD0008.SEQ%TYPE, 
    v_AMT                    ZTSD0008.AMT%TYPE, 
    v_USE_YN                 ZTSD0008.USE_YN%TYPE, 
    v_REG_ID                 ZTSD0008.REG_ID%TYPE
  );

  /*****************************************************************************
  -- 가격 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN OUT Ztsd0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 가격 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN Ztsd0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 가격 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN Ztsd0008.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 가격 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDZtsd0008 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN OUT Ztsd0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 가격 관리 순번채번
  *****************************************************************************/
  FUNCTION f_sZtsd0008MaxSeq(
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,          /*가격적용 시작일     */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE          /*가격적용 완료일     */
    ) RETURN NUMBER;   

  /*****************************************************************************
  -- 가격 관리 Count
  *****************************************************************************/
  FUNCTION f_sZtsd0008Count(
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,          /*가격적용 시작일     */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,          /*가격적용 완료일     */
    v_Seq            IN Ztsd0008.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;


END PKG_ZTSD0008;