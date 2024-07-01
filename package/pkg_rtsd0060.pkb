CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0060 AS
/******************************************************************************* 
   NAME      PKG_RTSD0060 
   PURPOSE   렌탈지역 관리 
 
   REVISIONS 
   Ver        Date        Author           Description 
   ---------  ----------  ---------------  ------------------------------------- 
   1.0        2018-11-01  Sean         1. Created this package body. 
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
    ) IS 
  BEGIN 
    OPEN Ref_Cursor FOR 
    SELECT
    COMM_TP,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('R042', COMM_TP) as COMM_TP_NM,
    CHAN_LCLS_CD,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('S090', CHAN_LCLS_CD) as CHAN_LCLS_NM,
    CHAN_MCLS_CD,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('S091', CHAN_MCLS_CD) as CHAN_MCLS_NM,
    CHR_SEQ,
    MIN_CNT,
    STR_DAY,
    MAX_CNT,
    END_DAY

    FROM RTSD0060

     WHERE COMM_TP  = DECODE(v_COMM_TP, NULL, COMM_TP, v_COMM_TP)  /*지점                  */
       AND CHAN_LCLS_CD  = DECODE(v_Chan_Lcis_Cd, NULL, CHAN_LCLS_CD, v_Chan_Lcis_Cd)
       AND CHAN_MCLS_CD  = DECODE(v_Chan_Mcls_Cd, NULL, CHAN_MCLS_CD, v_Chan_Mcls_Cd)
       AND CHR_SEQ  = DECODE(v_Chr_Seq, NULL, CHR_SEQ, v_Chr_Seq)
    
     ORDER BY COMM_TP, CHAN_LCLS_CD
       ;  
  END p_sRtsd0060visitorService; 


  /***************************************************************************** 
  -- 렌탈지역 조회 Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService2 ( 
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,               /* 수수료명  */
    v_Chan_Lcis_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,          /* 채널대분류  */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE           /* 채널중분류  */     
    ) IS 
  BEGIN 
    OPEN Ref_Cursor FOR 
    SELECT 
        COMM_TP,
        CHAN_LCLS_CD,
        CHAN_MCLS_CD,
        CHR_SEQ,
        SEQ,
        SALE_MIN_CNT,
        COMM_AMT,
        SALE_MAX_CNT,
        USE_YN
    FROM RTSD0061

     WHERE COMM_TP  = DECODE(v_COMM_TP, NULL, COMM_TP, v_COMM_TP)  /*지점                  */
       AND CHAN_LCLS_CD  = DECODE(v_Chan_Lcis_Cd, NULL, CHAN_LCLS_CD, v_Chan_Lcis_Cd)
       AND CHAN_MCLS_CD  = DECODE(v_Chan_Mcls_Cd, NULL, CHAN_MCLS_CD, v_Chan_Mcls_Cd)
       AND USE_YN='Y'
     ORDER BY SEQ,COMM_TP, CHAN_LCLS_CD
       ;  
  END p_sRtsd0060visitorService2;  
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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 가격_금액유형 , 상품코드,기간코드,타이어본수, 등록비코드,가격적용 시작일,가격적용 완료일,  사용여부 ,등록자 ID
    IF TRIM(v_Comm_Tp) IS NULL THEN
        v_Return_Message := '가격_금액유형 ('||v_Comm_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


IF 0 = f_sRtsd0060Count(v_Comm_Tp, v_Chr_Seq, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                            v_Seq) THEN

        IF 0 != f_InsertRtsd0060(v_Comm_Tp, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                                 v_Sale_Min_Cnt, v_Comm_Amt, v_Sale_Max_Cnt,
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '방문 점검 서비스 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF
        ;
    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0060(v_Comm_Tp, v_Chr_Seq, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                                 v_Sale_Min_Cnt, v_Comm_Amt, v_Sale_Max_Cnt, v_Seq,
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '방문 점검 서비스 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0060(v_Comm_Tp, v_Chr_Seq, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                                 v_Seq, v_ErrorText) THEN
                v_Return_Message := '방문 점검 서비스 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

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

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0060.p_IUDRtsd0060(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0060.p_IUDRtsd0060(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0060;  
  
  
  /*****************************************************************************
  -- 방문 점검 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060Count(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*가격,금액유형         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*상품코드              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*타이어본수            */
    v_Seq               IN RTSD0061.SEQ%TYPE            /*순번                  */ 
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0061
    WHERE   COMM_TP  = v_Comm_Tp 
    AND     CHAN_MCLS_CD = v_Chan_Mcls_Cd
    AND     CHAN_LCLS_CD    = v_Chan_Lcls_Cd
    AND     CHR_SEQ         = v_Chr_Seq
    AND     SEQ             = v_Seq;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0060Count;    


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
    ) RETURN NUMBER IS
   
  BEGIN

    INSERT INTO RTSD0061
    (
        COMM_TP,
        CHAN_MCLS_CD,
        CHAN_LCLS_CD,        
        CHR_SEQ,
        SEQ,
        SALE_MIN_CNT,
        COMM_AMT,
        SALE_MAX_CNT,
        USE_YN,
        REG_ID,
        REG_DT    
    )VALUES(
        v_Comm_Tp,
        v_Chan_Mcls_Cd,
        v_Chan_Lcls_Cd,
        (select max(chr_seq)+1 from rtsd0061),
        (select max(seq)+1 from rtsd0061),
        v_Sale_Min_Cnt,
        v_Comm_Amt,
        v_Sale_Max_Cnt,    
        v_Use_Yn,
        v_Reg_Id,
        SYSDATE   
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0060; 


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
    ) RETURN NUMBER IS
  
  BEGIN

    UPDATE RTSD0061
    SET    SALE_MIN_CNT = v_Sale_Min_Cnt,
           SALE_MAX_CNT = v_Sale_Max_Cnt,
           COMM_AMT     = v_Comm_Amt,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  COMM_TP      = v_Comm_Tp
    AND    CHR_SEQ      = v_Chr_Seq
    AND    CHAN_MCLS_CD = v_Chan_Mcls_Cd
    AND    CHAN_LCLS_CD = v_Chan_Lcls_Cd  
    AND    SEQ          = v_Seq;

   RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0060; 


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
    ) RETURN NUMBER IS
   
  BEGIN

   DELETE FROM RTSD0061
   WHERE COMM_TP = v_Comm_Tp AND CHR_SEQ = v_Chr_Seq
        AND CHAN_MCLS_CD = v_Chan_Mcls_Cd AND CHAN_LCLS_CD = v_Chan_Lcls_Cd
        AND SEQ = v_Seq;

   RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0060;
  
  
  
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CD,           /*코드        */
            A.CD_NM,        /*코드명      */
            A.CD_DESC       /*코드설명    */
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = v_Cd_Grp_Cd
    AND     A.USE_YN    = NVL(v_Use_Yn,'Y')
    AND     NVL(CD, ' ') LIKE '%'||v_Cd||'%'
    OR      NVL(CD, ' ') LIKE '%'||v_Cd2||'%'
    OR      NVL(CD, ' ') LIKE '%'||v_Cd3||'%'
    OR      NVL(CD, ' ') LIKE '%'||v_Cd4||'%'
    OR      NVL(CD, ' ') LIKE '%'||v_Cd5||'%' 
    
    ORDER   BY NVL(A.ORDER_PT,0), A.CD_NM;

  END p_sRtsd0060CodeName;  
  
  
/***************************************************************************** 
  -- 렌탈지역 조회 Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService3 ( 
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,               /* 수수료명  */
    v_Chan_Lcis_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE         /* 채널대분류  */   
    ) IS 
  BEGIN 
    OPEN Ref_Cursor FOR 
    SELECT
    COMM_TP,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('R042', COMM_TP) as COMM_TP_NM,
    CHAN_LCLS_CD,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('S090', CHAN_LCLS_CD) as CHAN_LCLS_NM,
    CHAN_MCLS_CD,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('S091', CHAN_MCLS_CD) as CHAN_MCLS_NM,
    CHR_SEQ,
    MIN_CNT,
    STR_DAY,
    MAX_CNT,
    END_DAY,
    COMM_AMT,
    USE_YN
    FROM RTSD0060
    
    WHERE   COMM_TP  = DECODE(v_COMM_TP, NULL, COMM_TP, v_COMM_TP)  /*지점                  */
    AND     CHAN_LCLS_CD  = DECODE(v_Chan_Lcis_Cd, NULL, CHAN_LCLS_CD, v_Chan_Lcis_Cd)
    
    ORDER BY COMM_TP,CHAN_LCLS_CD,CHAN_MCLS_CD,MIN_CNT,MAX_CNT;
   
   END p_sRtsd0060visitorService3; 
   
   
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
    ) IS

    e_Error EXCEPTION;
    
  BEGIN   
  
  
  IF (TRIM(v_Comm_Tp) IS NULL) THEN
        v_Return_Message := '수수료명('||v_Comm_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Chan_Mcls_Cd) IS NULL) THEN
        v_Return_Message := '채널대분류('||v_Chan_Mcls_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Chan_Lcls_Cd) IS NULL) THEN
        v_Return_Message := '채널중분류('||v_Chan_Lcls_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Min_Cnt) IS NULL) THEN
        v_Return_Message := '최소건수('||v_Min_Cnt||') : 최소건수를 입력해주세요';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Max_Cnt) IS NULL) THEN
        v_Return_Message := '최대건수('||v_Max_Cnt||') : 최대건수를 입력해주세요!';
        RAISE e_Error;
    END IF;  
  
  
  
  
  IF 0 = f_sRtsd0060CountInsentive(v_Comm_Tp, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,v_Chr_Seq) THEN

        IF 0 !=f_InsertRtsd0060Insentive(v_Comm_Tp, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                                 v_Min_Cnt, v_Comm_Amt, v_Max_Cnt,
                                 v_Use_Yn, v_Reg_Id, v_Str_Day,v_End_Day,v_ErrorText)
                                 THEN
            v_Return_Message := '인센티브 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF
        ;
  ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0060Insentive(v_Comm_Tp, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd, v_Chr_Seq,
                                 v_Min_Cnt, v_Comm_Amt, v_Max_Cnt, 
                                 v_Use_Yn, v_Reg_Id, v_Str_Day,v_End_Day, v_ErrorText) THEN
                v_Return_Message := '방문 점검 서비스 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        END IF;
  END IF;
  
     v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
   
  EXCEPTION
    WHEN e_Error THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := v_Return_Message;
      v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
      Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0105.p_InsertRtsd0105SaveOrder(1)', v_ErrorText, v_Return_Message);
  
    WHEN OTHERS THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := v_Return_Message;
      v_ErrorText := SUBSTR(SQLERRM, 1, 200);
      Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0105.p_InsertRtsd0105SaveOrder(2)', v_ErrorText, v_Return_Message);
      
   
  END p_IUDRtsd0060Insentive;
  
  
  /*****************************************************************************
  -- 방문 점검 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*가격,금액유형         */   
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*기간코드              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*타이어본수            */
     v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE         /*상품코드              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0060
    WHERE   COMM_TP  = v_Comm_Tp 
    AND     CHAN_MCLS_CD = v_Chan_Mcls_Cd
    AND     CHAN_LCLS_CD    = v_Chan_Lcls_Cd
    AND     CHR_SEQ         = v_Chr_Seq;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0060CountInsentive;    


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
    ) RETURN NUMBER IS
   
  BEGIN

    INSERT INTO RTSD0060
    (
        COMM_TP,
        CHAN_MCLS_CD,
        CHAN_LCLS_CD,        
        CHR_SEQ,
        MIN_CNT,
        COMM_AMT,
        MAX_CNT,
        USE_YN,
        REG_ID,
        REG_DT,
        STR_DAY,
        END_DAY   
    )VALUES(
        v_Comm_Tp,
        v_Chan_Mcls_Cd,
        v_Chan_Lcls_Cd,
        (select max(chr_seq)+1 from rtsd0061),     
        v_Min_Cnt,
        v_Comm_Amt,
        v_Max_Cnt,    
        v_Use_Yn,
        v_Reg_Id,
        SYSDATE,
        v_Str_Day,
        v_End_Day
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0060Insentive; 

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
    ) RETURN NUMBER IS
  
  BEGIN

    UPDATE RTSD0060
    SET    MIN_CNT = v_Min_Cnt,
           MAX_CNT = v_Max_Cnt,
           COMM_AMT     = v_Comm_Amt,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE,
           STR_DAY      = v_Str_Day,
           END_DAY      = v_End_Day
    WHERE  COMM_TP      = v_Comm_Tp
    AND    CHR_SEQ      = v_Chr_Seq
    AND    CHAN_MCLS_CD = v_Chan_Mcls_Cd
    AND    CHAN_LCLS_CD = v_Chan_Lcls_Cd;    

   RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0060Insentive;
  
  
  
  
  /***************************************************************************** 
  --인센티브 저장
  *****************************************************************************/  
  PROCEDURE p_IUDRtsd0060Insentive2 (  
    v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE,       /*가격,금액유형         */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE         /*등록자 ID             */      
    ) IS
   
  
  BEGIN
  IF 'D3' = f_sRtsd0060CountInsentive4(v_Slcm_Ym) THEN
  
   INSERT INTO RTSD0062 (AGENCY_CD ,SLCM_YM,COMM_TP,SALE_CNT,BONUS_AMT,CHAN_LCLS_CD,CHAN_MCLS_CD,REG_ID,REG_DT,CHG_ID,CHG_DT) 
   
   SELECT C.ORD_AGENT,
          v_Slcm_Ym,
          C.COMM_TP,
          C.SUMCNT_CD,
          C.CNT_CD * f_sRtsd0060CountInsentive3(v_Slcm_Ym),
          D.CHAN_LCLS_CD,
          D.CHAN_MCLS_CD,
          v_Reg_Id,
          SYSDATE,
          v_Reg_Id,
          SYSDATE
   FROM          
        (SELECT A.CNT_CD,B.ORD_AGENT,B.COMM_TP,B.SUMCNT_CD FROM (SELECT ORD_AGENT,COMM_TP,SUM(CNT_CD) SUMCNT_CD FROM RTRE5040 WHERE SLCM_YM=v_Slcm_Ym GROUP BY ORD_AGENT,COMM_TP) B,RTRE5040 A WHERE A.ORD_AGENT=B.ORD_AGENT)C,
         RTSD0113 D
   WHERE C.ORD_AGENT=D.ORD_AGENT
   ORDER BY C.ORD_AGENT;
  
  END IF;
  
  IF 'D2' = f_sRtsd0060CountInsentive4(v_Slcm_Ym) THEN  
    
  INSERT INTO RTSD0062 (AGENCY_CD ,SLCM_YM,COMM_TP,SALE_CNT,BONUS_AMT,CHAN_LCLS_CD,CHAN_MCLS_CD,REG_ID,REG_DT,CHG_ID,CHG_DT) 
   
   SELECT A.ORD_AGENT,
          v_Slcm_Ym,
          A.COMM_TP,
          A.CNT_CD,
          f_sRtsd0060CountInsentive3(v_Slcm_Ym)*A.CNT_CD,
          B.CHAN_LCLS_CD,
          B.CHAN_MCLS_CD,
          v_Reg_Id,
          SYSDATE,
          v_Reg_Id,
          SYSDATE
   FROM          
        (SELECT ORD_AGENT,COMM_TP,CNT_CD FROM RTRE5040 WHERE SLCM_YM=v_Slcm_Ym   GROUP BY ORD_AGENT,COMM_TP)A,
         RTSD0113 B
   WHERE A.ORD_AGENT=B.ORD_AGENT
   ORDER BY A.ORD_AGENT; 
    
  
  
        ELSE IF 'C3' = f_sRtsd0060CountInsentive4(v_Slcm_Ym) THEN  
    
        INSERT INTO RTSD0062 (AGENCY_CD ,SLCM_YM,COMM_TP,SALE_CNT,BONUS_AMT,CHAN_LCLS_CD,CHAN_MCLS_CD,REG_ID,REG_DT,CHG_ID,CHG_DT) 
   
        SELECT A.ORD_AGENT,
          v_Slcm_Ym,
          A.COMM_TP,
          A.CNT_CD,
          0,
          B.CHAN_LCLS_CD,
          B.CHAN_MCLS_CD,
          v_Reg_Id,
          SYSDATE,
          v_Reg_Id,
          SYSDATE
        FROM          
        (SELECT ORD_AGENT,COMM_TP,CNT_CD FROM RTRE5040 WHERE SLCM_YM=v_Slcm_Ym   GROUP BY ORD_AGENT,COMM_TP)A,
             RTSD0113 B
         WHERE A.ORD_AGENT=B.ORD_AGENT
        ORDER BY A.ORD_AGENT;         
      
   
   ELSE
   INSERT INTO RTSD0062 (AGENCY_CD ,SLCM_YM,COMM_TP,SALE_CNT,BONUS_AMT,CHAN_LCLS_CD,CHAN_MCLS_CD,REG_ID,REG_DT,CHG_ID,CHG_DT) 
   
   SELECT A.ORD_AGENT,
          v_Slcm_Ym,
          A.COMM_TP,
          A.SUMCNT_CD,
          f_sRtsd0060CountInsentive3(v_Slcm_Ym),
          B.CHAN_LCLS_CD,
          B.CHAN_MCLS_CD,
          v_Reg_Id,
          SYSDATE,
          v_Reg_Id,
          SYSDATE
   FROM          
        (SELECT ORD_AGENT,COMM_TP,SUM(CNT_CD) SUMCNT_CD   FROM RTRE5040 WHERE SLCM_YM=v_Slcm_Ym   GROUP BY ORD_AGENT,COMM_TP)A,
         RTSD0113 B
   WHERE A.ORD_AGENT=B.ORD_AGENT
   ORDER BY A.ORD_AGENT;
        END IF;
    END IF;

   
  END p_IUDRtsd0060Insentive2;
  
  /*****************************************************************************
  -- 방문 점검 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive3(
   v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE       /*가격,금액유형         */    
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT NVL(COMM_AMT, 0)
        INTO    v_curr_cunt
      FROM RTSD0060
     WHERE USE_YN='Y'
   AND STR_DAY>=v_Slcm_Ym+00
   AND END_DAY<=v_Slcm_Ym+99
   AND MIN_CNT<=(SELECT SUM(CNT_CD)
          FROM RTRE5040
         WHERE SLCM_YM=v_Slcm_Ym)
   AND MAX_CNT>=(SELECT SUM(CNT_CD)
          FROM RTRE5040
         WHERE SLCM_YM=v_Slcm_Ym);
         
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0060CountInsentive3;
  
  
    /*****************************************************************************
  -- 방문 점검 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive4(
   v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE       /*가격,금액유형         */    
    ) RETURN VARCHAR2 IS
    v_curr_cunt   VARCHAR(2);
  
  BEGIN
  

    SELECT COMM_TP
        INTO    v_curr_cunt
      FROM RTRE5040
      WHERE SLCM_YM=v_Slcm_Ym
        GROUP BY COMM_TP;
         
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;  


  END f_sRtsd0060CountInsentive4;  
  
   
END PKG_RTSD0060;
/
