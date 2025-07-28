CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0005 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0005
   PURPOSE  상품 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
   1.2        2017-11-10  wjim             [20171110_01] B2B일시불 추가  
*******************************************************************************/

  /*****************************************************************************
  --상품 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0005Count(
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE            /*상품코드            */
    ) RETURN NUMBER;

  /*****************************************************************************
  --상품 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0005 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTSD0005.MAT_NM%TYPE,         /*상품명                */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Demend_Qty     IN RTSD0005.DEMEND_QTY%TYPE,     /*타이어소요량          */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  --상품 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0005 (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTSD0005.MAT_NM%TYPE,         /*상품명                */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Demend_Qty     IN RTSD0005.DEMEND_QTY%TYPE,     /*타이어소요량          */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  --상품 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0005 (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTSD0005.MAT_NM%TYPE,         /*상품명                */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Demend_Qty     IN RTSD0005.DEMEND_QTY%TYPE,     /*타이어소요량          */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  --상품 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0005 (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  --상품 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0005 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Mat_Nm         IN RTSD0005.MAT_NM%TYPE,         /*상품명                */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Demend_Qty     IN RTSD0005.DEMEND_QTY%TYPE,     /*타이어소요량          */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  --상품 마스터 - 상품코드로 상품명 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0005MatName(
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE            /*상품코드            */
    ) RETURN VARCHAR;


  /*****************************************************************************
  --상품 마스터 Select - 상품 마스터 조회 팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0005Popup (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Season_Cd       IN RTSD0005.SEASON_CD%TYPE,       /*계절구분            */
    v_Pettern_Cd      IN RTSD0005.PETTERN_CD%TYPE,      /*패턴                */
    v_Section_Width   IN RTSD0005.SECTION_WIDTH%TYPE,   /*패턴                */
    v_Aspect_Ratio    IN RTSD0005.ASPECT_RATIO%TYPE,    /*패턴                */
    v_Wheel_Inches    IN RTSD0005.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0005.PLY_RATING%TYPE       /*패턴                */
    );
    
  /*****************************************************************************
  --상품 마스터 Select - B2B상품 마스터 조회 팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0005B2BPopup (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*사양                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*전후 구분           */
    v_Season_Cd       IN RTSD0005.SEASON_CD%TYPE,       /*계절구분            */
    v_Pettern_Cd      IN RTSD0005.PETTERN_CD%TYPE,      /*패턴                */
    v_Section_Width   IN RTSD0005.SECTION_WIDTH%TYPE,   /*패턴                */
    v_Aspect_Ratio    IN RTSD0005.ASPECT_RATIO%TYPE,    /*패턴                */
    v_Wheel_Inches    IN RTSD0005.WHEEL_INCHES%TYPE,    /*인치                */
    v_Ply_Rating      IN RTSD0005.PLY_RATING%TYPE       /*패턴                */
  );

  /*****************************************************************************
  --상품 마스터 Select - 상품 마스터 조회 팝업(패턴/규격별)
  *****************************************************************************/
  PROCEDURE p_sRtsd0005PopupCamp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mat_Nm        IN RTSD0005.MAT_NM%TYPE        /*상품명                */
    );

  /*****************************************************************************
  --상품 마스터 Select - 상품 마스터 조회 팝업(패턴/규격별)
  *****************************************************************************/
  PROCEDURE p_sRtsd0005PopupCamp2 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mat_Nm        IN RTSD0005.MAT_NM%TYPE        /*상품명                */
    );

  /*****************************************************************************
  --상품 마스터 Update EAI INTERFACE
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0005Interface (
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,         /*상품코드              */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /*단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /*편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,     /*PR(강도)              */
    v_Pg_Cd          IN RTSD0005.PG_CD%TYPE,          /*Pricing Group Code    */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0005.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  --상품 마스터 - 사용여부에 따른 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0005UseCount(
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE,           /*상품코드            */
    v_Use_Yn         IN RTSD0005.USE_YN%TYPE            /*사용여부            */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  --특정 차종, 사양 규격에 상품정보 Select - 상품 및 가격조회 팝업 Combo용
  *****************************************************************************/
  PROCEDURE p_sRtsd0005Comboset (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*차종                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE      /*사양                */
  );
/*****************************************************************************
  --상품 마스터 Select - 타이어
  *****************************************************************************/
  PROCEDURE p_sRtsd0005TireCode (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE     /*패턴코드              */
    );    
    
/*****************************************************************************
--상품 마스터 Select - 타이어
*****************************************************************************/
  PROCEDURE p_sRtsd0005TireDetailCode (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Sale_Cd        IN RTSD0046.SALE_CD%TYPE   
    ) ;  

  /*****************************************************************************
  --쇼핑몰 최저가 구하기.(사이즈검색)
  *****************************************************************************/
  FUNCTION f_sRtsd0005SizeMinAmt(
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,  /* 단면폭                */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,   /* 편평비                */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE    /* 인치                  */    
  ) RETURN NUMBER;
  
  /*****************************************************************************
  --쇼핑몰 최자가 구하기.(차종검색)
  *****************************************************************************/
  FUNCTION f_sRtsd0005MakerMinAmt(
    v_Maker_cd       IN RTSD0001.MAKER_CD%TYPE,       /* 차종     */
    v_Model_cd       IN RTSD0001.MODEL_CD%TYPE,       /* 모델코드 */
    v_Size_Info      VARCHAR2  
  ) RETURN NUMBER;
  
  /*****************************************************************************
  --쇼핑몰 최저가 구하기.(상품코드)
  *****************************************************************************/
  FUNCTION f_sRtsd0005MinAmt(
    I_PriceCd       IN RTSD0008.PRICE_CD%TYPE,      /* 가격유형, 렌탈료:0002*/
    I_MatCd         IN RTSD0008.MAT_CD%TYPE         /* 상품코드 */
  ) RETURN NUMBER;
   
  /*****************************************************************************
  --상품 마스터 Select - 타이어
  *****************************************************************************/
  PROCEDURE p_sRtsd0005TireDetailCode2 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Sale_Cd        IN RTSD0046.SALE_CD%TYPE,
    v_Pettern_Cd      IN RTSD0046.PETTERN_CD%TYPE   
    );    
    
  /*****************************************************************************
  --상품 마스터 Select - 타이어
  *****************************************************************************/
  FUNCTION f_sRtsd0005TireDetailCount (
  v_Pettern_Cd        IN RTSD0046.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Sale_Cd        IN RTSD0046.SALE_CD%TYPE     
    )RETURN NUMBER;
    
/*****************************************************************************
  -타이어패턴코드 Delete
  *****************************************************************************/
  FUNCTION f_DeleteTireDetailRtsd0046 (
    v_Sale_Cd           IN RTSD0046.SALE_CD%TYPE,          /* 판매코드         */
    v_Pettern_Cd        IN RTSD0046.PETTERN_CD%TYPE
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 타이어패턴정보 IUD
  *****************************************************************************/
  PROCEDURE p_IUDTireDetailRtsd0046 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)  */
    v_Sale_Cd        IN RTSD0046.SALE_CD%TYPE,
    v_Mat_Cd         IN RTSD0046.MAT_CD%TYPE,
    v_Pettern_Cd        IN RTSD0046.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Reg_Id        IN RTSD0046.REG_ID%TYPE,     /*화면사용자              */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2    
    );         

/*****************************************************************************
  -타이어정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertTireDetailRtsd0046 (
    v_Sale_Cd           IN RTSD0046.SALE_CD%TYPE,           /* 판매코드         */
    v_Mat_Cd            IN RTSD0046.MAT_CD%TYPE,
    v_Pettern_Cd        IN RTSD0046.PETTERN_CD%TYPE,     /*패턴코드              */
    v_Reg_Id        IN RTSD0046.REG_ID%TYPE,     /*화면사용자              */    
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  --쇼핑몰 카페테리아 금액 계산
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopRentAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Mat_cd         IN RTSD0008.MAT_CD%TYPE,           /* 상품코드 */
    v_Maker_cd       IN RTSD0001.MAKER_CD%TYPE,         /* 차종     */
    v_Model_cd       IN RTSD0001.MODEL_CD%TYPE,         /* 모델코드 */
    v_Size_Info      VARCHAR2,
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  );    
  
  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 일시불
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopPayAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  );
  
  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 알뜰, 표준, 무한, 슈퍼
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopTotAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  );  
  
  /*****************************************************************************
  --업무용앱 금액산출 계산 - 알뜰, 표준, 무한, 슈퍼
  *****************************************************************************/
  PROCEDURE sRtsd0005MobTotAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  );
  
    /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 자유렌탈
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopFreeRentAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Add_RentAmt    IN NUMBER,                         /* 프리미엄서비스 합계금액(추가렌탈료) */
    v_Regi_Amt       IN NUMBER,                         /* 렌탈등록비 */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  );

  /*****************************************************************************
  --업무용앱  금액산출 계산 - 자유렌탈
  *****************************************************************************/
  PROCEDURE sRtsd0005MobFreeRentAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Add_RentAmt    IN NUMBER,                         /* 프리미엄서비스 합계금액(추가렌탈료) */
    v_Regi_Amt       IN NUMBER,                         /* 렌탈등록비 */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  );
  
  /*****************************************************************************
  --쇼핑몰 판매상품 별 금액산출 계산 - 알뜰, 표준, 무한, 슈퍼, 일시불(자유렌탈 제외)
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE,        /* 기간 */
    v_Sale_cd        IN RTSD0021.SALE_CD%TYPE           /* 판매상품코드 */
  );
  
  /*****************************************************************************
  --쇼핑몰 판매상품 별 프리미엄 서비스 금액
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopMemberShip (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Cnt_cd         IN RTSD0012.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0012.PERIOD_CD%TYPE,        /* 납부기간 */
    v_Sale_cd        IN RTSD0021.SALE_CD%TYPE           /* 판매상품코드 */
  );
  
  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 알뜰, 표준, 무한, 슈퍼 - 등록비 추가
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopTotAddRegiAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE,        /* 기간 */
    v_Regi_Amt       IN NUMBER                          /* 등록비 추가 */
  );
  
  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 멤버십 임시
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopMmTotAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_cd      IN RTSD0004.MODEL_CD%TYPE,
    v_Contents_cd   IN RTSD0004.CONTENTS_CD%TYPE,
    v_Cnt_cd        IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd     IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  );
  
  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 멤버십 상품별 임시
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopMmSaleAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_cd      IN RTSD0004.MODEL_CD%TYPE,
    v_Contents_cd   IN RTSD0004.CONTENTS_CD%TYPE,
    v_Cnt_cd        IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd     IN RTSD0008.PERIOD_CD%TYPE,         /* 기간 */
    v_Sale_cd        IN RTSD0021.SALE_CD%TYPE
  );
  
  /*****************************************************************************
  --쇼핑몰 금액산출 계산 - 임직원
  *****************************************************************************/
  PROCEDURE sRtsd0005ShopEmployeesAmt (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,    /* 단면폭 */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,     /* 편평비 */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,     /* 인치 */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,       /* PR(강도) */
    v_Pettern_cd     IN RTSD0005.PETTERN_CD%TYPE,       /* 패턴코드 */
    v_Cnt_cd         IN RTSD0008.CNT_CD%TYPE,           /* 타이어본수 */
    v_Period_cd      IN RTSD0008.PERIOD_CD%TYPE         /* 기간 */
  );  
  
END Pkg_Rtsd0005;