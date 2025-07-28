CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0008 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0008
   PURPOSE   가격 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-29  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 가격 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0008Count(
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,          /*가격적용 시작일     */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,          /*가격적용 완료일     */
    v_Seq            IN RTSD0008.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 가격 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 가격 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN OUT RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 가격 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 가격 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 가격 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0008 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Seq            IN OUT RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*금액                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 가격 관리 Select - 상품 및 가격조회 POPUP
  *****************************************************************************/
  PROCEDURE p_sRtsd0008PoPup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용일            */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE         /*타이어본수            */
    );


  /*****************************************************************************
  -- 상품가격 Select - 상품 및 가격조회 POPUP
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-13  wjim             [20170313_01] B2B일시불 가격정책 추가에 따른 파라미터 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0008_Pro_Pri_PoPup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,         /*가격적용일          */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,          /*상품코드            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,       /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,          /*타이어본수          */
    v_regi_Amt       IN RTSD0106.REGI_AMT%TYPE,        /*렌탈등록비          */
    v_Amt            IN RTSD0008.AMT%TYPE,             /*금액                */
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE         /*가격금액유형        */
    );
    

  /*****************************************************************************
    -- 상품가격 Select - 상품 및 가격조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0008_ProductList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,   /*단면폭              */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,    /*편평비              */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,    /*휠인치              */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,      /*강도                */    
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,       /*계절 구분           */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,      /*패턴코드            */
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,         /*가격적용일          */    
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,       /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE           /*타이어본수          */
    );
    
  /*****************************************************************************
  -- 가격 관리 순번채번
  *****************************************************************************/
  FUNCTION f_sRtsd0008MaxSeq(
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,          /*가격적용 시작일     */
    v_End_Day        IN RTSD0008.END_DAY%TYPE          /*가격적용 완료일     */
    ) RETURN NUMBER;    


  /*****************************************************************************
  -- 가격 이전일자등록여부 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0008ExistsDay(
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*가격,금액유형       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*상품코드            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*타이어본수          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*등록비코드          */
    v_Seq            OUT RTSD0008.SEQ%TYPE              /*순번 */
    ) RETURN VARCHAR;    

  
   /*****************************************************************************
  -- 가격 관리 관리(이전 종료일자 업데이트처리)
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0008EndDay (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*가격,금액유형         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*상품코드              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*등록비코드            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일       */
    v_End_Day2       IN RTSD0008.END_DAY%TYPE,        /*가격적용 완료일(수정)  */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 제품추가 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*차종                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*타이어본수          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*판메상품코드        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*차량상세            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,              /*장착위치            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE,
    v_Pettern_cd    IN RTSD0005.PETTERN_CD%TYPE,
    v_Spec_cd   IN VARCHAR2
  );  
  
  /*****************************************************************************
  -- 계약별 저장된 제품정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddSelProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*차종                */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*기간코드            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*타이어본수          */    
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,           /*계약번호            */ 
    v_Sale_Cd        IN RTSD0020.SALE_CD%TYPE,          /*타이어본수          */
    v_contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE       /*차량상세            */
  );
  
  
  /*****************************************************************************
  -- 계약별 저장된 제품정보 Select 일시불
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddSelProductDirect (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드            */  
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,            /*타이어본수          */ 
    v_Ord_no         IN RTSD0106.ORD_NO%TYPE,            /*계약번호            */  
    v_Sale_Cd        IN RTSD0020.SALE_CD%TYPE            /*타이어본수          */
  );


  /*****************************************************************************
  -- 제품추가 패턴 콤보박스  Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028PetternCombo (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*차종                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*타이어본수          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*판메상품코드        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*차량상세            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,             /*장착위치            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE
  );  

  /*****************************************************************************
  -- 제품추가 규격  콤보박스  Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028PetternComboStan (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*차종                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*기간코드            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*타이어본수          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*판메상품코드        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*차량상세            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,             /*장착위치            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE,
    v_Pettern_cd    IN RTSD0005.PETTERN_CD%TYPE
  ); 
  
  /*****************************************************************************
  -- 타이어 본수  체크
  *****************************************************************************/
  FUNCTION f_sRtsd0008GetWheelQty(
    v_Model_Cd      IN RTSD0001.MODEL_CD%TYPE,         /*차종                 */
    v_contents_Cd   IN RTSD0001.CONTENTS_CD%TYPE,      /*차량상세             */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE             /*장착위치             */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- 장착 가능 타이어 본수  체크
  *****************************************************************************/
  FUNCTION f_sRtsd0008GetWheelQtyLt(
    v_Model_Cd      IN RTSD0001.MODEL_CD%TYPE,         /*차종                 */
    v_contents_Cd   IN RTSD0001.CONTENTS_CD%TYPE,      /*차량상세             */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE             /*장착위치             */
    ) RETURN VARCHAR;
        
END Pkg_Rtsd0008;