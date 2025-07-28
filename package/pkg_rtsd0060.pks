CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0060 AS 
/******************************************************************************* 
   NAME:     PKG_RTSD0060 
   PURPOSE   렌탈 지역 관리 
 
   REVISIONS 
   Ver        Date        Author           Description 
   ---------  ----------  ---------------  ------------------------------------- 
   1.0        2018-11-01  Sean         1. Created this package spec. 
*******************************************************************************/ 
  /***************************************************************************** 
  -- 렌탈지역 조회 Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService (  
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,               /* 수수료명  */
    v_Chan_Lcis_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,          /* 채널대분류  */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,           /* 채널중분류  */
     v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE         /*시퀀스              */      
    ); 
    
  /***************************************************************************** 
  -- 렌탈지역 조회 Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService2 (  
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,               /* 수수료명  */
    v_Chan_Lcis_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,          /* 채널대분류  */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE           /* 채널중분류  */    
    );  
    
  /***************************************************************************** 
  -- 렌탈지역 조회 Select 
  *****************************************************************************/     
      PROCEDURE p_IUDRtsd0060 (
    v_Comm_Dvsn         IN CHAR,                         /*처리구분(I,U,D)       */
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*가격,금액유형         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*상품코드              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*타이어본수            */
    v_Sale_Min_Cnt      IN RTSD0061.SALE_MIN_CNT%TYPE,        /*등록비코드            */
    v_Comm_Amt          IN RTSD0061.COMM_AMT%TYPE,        /*가격적용 시작일       */
    v_Sale_Max_Cnt      IN RTSD0061.SALE_MAX_CNT%TYPE,        /*가격적용 완료일       */
    v_Seq               IN RTSD0061.SEQ%TYPE,            /*순번                  */
    v_Use_Yn            IN RTSD0061.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id            IN RTSD0061.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
    
    
  /*****************************************************************************
  -- 가격 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060Count(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*가격,금액유형         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*상품코드              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*타이어본수            */
    v_Seq               IN RTSD0061.SEQ%TYPE            /*순번                  */ 
    )RETURN NUMBER;
    
    
    
  /*****************************************************************************
  -- 방문 점검 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0060(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*가격,금액유형         */    
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*타이어본수            */
    v_Sale_Min_Cnt      IN RTSD0061.SALE_MIN_CNT%TYPE,        /*등록비코드            */
    v_Comm_Amt          IN RTSD0061.COMM_AMT%TYPE,        /*가격적용 시작일       */
    v_Sale_Max_Cnt      IN RTSD0061.SALE_MAX_CNT%TYPE,        /*가격적용 완료일       */    
    v_Use_Yn            IN RTSD0061.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id            IN RTSD0061.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText         OUT VARCHAR2
    )RETURN NUMBER;
    


  /*****************************************************************************
  -- 방문 점검 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0060(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*가격,금액유형         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*상품코드              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*타이어본수            */
    v_Sale_Min_Cnt      IN RTSD0061.SALE_MIN_CNT%TYPE,        /*등록비코드            */
    v_Comm_Amt          IN RTSD0061.COMM_AMT%TYPE,        /*가격적용 시작일       */
    v_Sale_Max_Cnt      IN RTSD0061.SALE_MAX_CNT%TYPE,        /*가격적용 완료일       */
    v_Seq               IN RTSD0061.SEQ%TYPE,            /*순번                  */ 
    v_Use_Yn            IN RTSD0061.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id            IN RTSD0061.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText         OUT VARCHAR2 
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  -- 방문 점검 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0060(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*가격,금액유형         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*상품코드              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*타이어본수            */
    v_Seq               IN RTSD0061.SEQ%TYPE,            /*순번                  */
    v_ErrorText         OUT VARCHAR2  
    ) RETURN NUMBER;
    
    
    
    /*****************************************************************************
  -- 공통코드 Detail 조회- 대분류코드 기준 소분류코드/명 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0060CodeName (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd        IN  RTCM0051.CD%TYPE,            /*코드명                  */
    v_Cd2    IN  RTCM0051.CD%TYPE,        /*코드그룹코드            */ 
    v_Cd3    IN  RTCM0051.CD%TYPE,        /*코드그룹코드            */
    v_Cd4    IN  RTCM0051.CD%TYPE,        /*코드그룹코드            */
    v_Cd5    IN  RTCM0051.CD%TYPE,        /*코드그룹코드            */
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*코드그룹코드            */   
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE            /*사용여부                */
    );
    
    
/***************************************************************************** 
  -- 렌탈지역 조회 Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService3 ( 
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,               /* 수수료명  */
    v_Chan_Lcis_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE         /* 채널대분류  */   
    );
    
    
   /***************************************************************************** 
  --인센티브 저장
  *****************************************************************************/  
  PROCEDURE p_IUDRtsd0060Insentive (
    v_Comm_Dvsn         IN CHAR,                         /*처리구분(I,U,D)       */
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*가격,금액유형         */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*채널중분류              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*채널대분류            */    
    v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE,         /*시퀀스              */   
    v_Min_Cnt           IN RTSD0060.MIN_CNT%TYPE,        /*등록비코드   .         */
    v_Comm_Amt          IN RTSD0060.COMM_AMT%TYPE,        /*가격적용 시작일       */
    v_Max_Cnt           IN RTSD0060.MAX_CNT%TYPE,        /*가격적용 완료일       */    
    v_Use_Yn            IN RTSD0060.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Str_Day           IN RTSD0060.STR_DAY%TYPE,         /*등록자 ID             */
    v_End_Day           IN RTSD0060.END_DAY%TYPE,         /*등록자 ID             */ 
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 방문 점검 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*가격,금액유형         */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*타이어본수           */
    v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE         /*상품코드              */
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  -- 방문 점검 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0060Insentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*가격,금액유형         */    
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*타이어본수            */
    v_Min_Cnt           IN RTSD0060.MIN_CNT%TYPE,        /*등록비코드            */
    v_Comm_Amt          IN RTSD0060.COMM_AMT%TYPE,        /*가격적용 시작일       */
    v_Max_Cnt           IN RTSD0060.MAX_CNT%TYPE,        /*가격적용 완료일       */   
    v_Use_Yn            IN RTSD0060.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Str_Day           IN RTSD0060.STR_DAY%TYPE,         /*등록자 ID             */
    v_End_Day           IN RTSD0060.END_DAY%TYPE,         /*등록자 ID             */   
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 방문 점검 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0060Insentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*가격,금액유형         */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*타이어본수          */
    v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE,         /*상품코드              */
    v_Min_Cnt           IN RTSD0060.MIN_CNT%TYPE,        /*등록비코드            */
    v_Comm_Amt          IN RTSD0060.COMM_AMT%TYPE,        /*가격적용 시작일       */
    v_Max_Cnt           IN RTSD0060.MAX_CNT%TYPE,        /*가격적용 완료일       */ 
    v_Use_Yn            IN RTSD0060.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Str_Day           IN RTSD0060.STR_DAY%TYPE,         /*등록자 ID             */
    v_End_Day           IN RTSD0060.END_DAY%TYPE,         /*등록자 ID             */  
    v_ErrorText         OUT VARCHAR2 
    ) RETURN NUMBER;
    
  /***************************************************************************** 
  --인센티브 저장
  *****************************************************************************/  
  PROCEDURE p_IUDRtsd0060Insentive2 (
    v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE,       /*가격,금액유형         */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE         /*등록자 ID             */  
    );
    
  /*****************************************************************************
  -- 방문 점검 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive3(
    v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE      /*가격,금액유형         */    
   
    ) RETURN NUMBER; 
                 
    
  /*****************************************************************************
  -- 방문 점검 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive4(
    v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE      /*가격,금액유형         */    
    ) RETURN VARCHAR2;     
END PKG_RTSD0060;