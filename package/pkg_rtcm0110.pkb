CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTCM0110 AS
/*******************************************************************************
   NAME      PKG_RTCM0110
   PURPOSE   렌탈지사 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-31  Sean         	   1. Created this package body.
   1.1        2025-06-10  10244015         [20250610_01] 프리미엄퍼플점여부 추가
*******************************************************************************/
  /*****************************************************************************
  -- 렌탈지사조회 Select
  *****************************************************************************/
  PROCEDURE p_sRentalMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM IN RTCM0051.CD_NM%TYPE 
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT A.CD_GRP_CD   /* 그룹코드  */
         , A.CD          /* 코드*/
         , A.CD_NM       /* 코드명  */
         , A.ORDER_PT    /* 정렬 */
         , A.USE_YN      /* 사용여부   */
      FROM RTCM0051 A         
     WHERE 1=1
       AND A.CD_GRP_CD = 'S301'
       AND (A.CD LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR
            A.CD_NM LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%')
     ORDER BY A.ORDER_PT
       ;
  END p_sRentalMst;

  /*****************************************************************************
  -- 렌탈지점조회 Select
  *****************************************************************************/
  PROCEDURE p_sRentalDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD              IN RTCM0051.CD%TYPE, 
    v_CD_NM           IN RTCM0051.CD_NM%TYPE 
    ) IS
        
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT A.CD_GRP_CD   /* 그룹코드  */
          ,A.CD          /* 코드*/
          ,A.CD_NM       /* 코드명  */
          ,A.ORDER_PT    /* 정렬 */
          ,A.USE_YN      /* 사용여부   */
          ,A.RFR_1       /* 지사그룹코드 */
          ,A.RFR_2       /* 지사코드 */
          ,NVL(B.CHK,0) AS CHK  /*매핑체크*/
          ,(SELECT COUNT(*)  FROM RTCM0110 WHERE RNT_OFC = A.RFR_2 AND RNT_PNT = A.CD) AS DATA_YN /*렌탈마스터관리체크*/
     FROM RTCM0051 A
          ,(
            SELECT  CD_GRP_CD   /* 그룹코드  */
                   ,CD          /* 코드*/
                   ,1 AS CHK    /*매핑체크*/
              FROM RTCM0051            
             WHERE CD_GRP_CD = 'S302'
               AND RFR_1     = 'S301'
               AND RFR_2     = v_CD
           ) B
    WHERE A.CD_GRP_CD = 'S302'
      AND A.CD_GRP_CD = B.CD_GRP_CD(+)
      AND A.CD        = B.CD(+)
      AND (A.CD LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR
           A.CD_NM LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%')
    ORDER BY A.ORDER_PT
       ;
  END p_sRentalDtl;


   /*****************************************************************************
  -- 렌탈지사 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalMst (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
    v_CNT  NUMBER;
    
    
  BEGIN
  
    IF v_Comm_Dvsn = 'I' THEN    
    
        IF (TRIM(v_CD) IS NULL) THEN
            v_Return_Message := '렌탈지사코드('||v_CD||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
      
        IF (TRIM(v_CD_NM) IS NULL) THEN
            v_Return_Message := '렌탈지사명('||v_CD_NM||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        BEGIN
            SELECT COUNT(*) CNT
              INTO v_CNT
              FROM RTCM0051
             WHERE CD_GRP_CD = 'S301'
               AND CD        = v_CD;
               
        EXCEPTION WHEN NO_DATA_FOUND THEN
            v_CNT := 0;
        
        END;
        
        IF v_CNT > 0 THEN
            v_Return_Message := '이미 등록된 렌탈지사코드입니다.';
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    
      IF 0 != f_InsertRentalMst(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                               v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지사 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;        
    ELSIF v_Comm_Dvsn = 'U' THEN
        IF 0 != f_UpdateRentalMst(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                                 v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지사 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSIF v_Comm_Dvsn = 'D' THEN   
            
        --현재 삭제 버튼 사용 안함
    
        BEGIN
            SELECT COUNT(*) CNT
              INTO v_CNT
              FROM RTCM0051
             WHERE CD_GRP_CD = 'S302'
               AND RFR_2     = v_CD;
               
        EXCEPTION WHEN NO_DATA_FOUND THEN
            v_CNT := 0;
        
        END;
        
        IF v_CNT > 0 THEN
            v_Return_Message := '연결된 렌탈지점 삭제 후 삭제하십시요.';
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    
     
        IF 0 != f_DeleteRentalMst(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                                 v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지사 삭제 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
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

        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalMst(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalMst(2)', v_ErrorText, v_Return_Message);
  END p_IUDRentalMst;     


  /*****************************************************************************
  -- 렌탈지역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalMst (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN 
    INSERT  INTO RTCM0051 (
            CD_GRP_CD,        
            CD, 
            CD_NM, 
            ORDER_PT,
            USE_YN,                
            REG_ID,                
            REG_DT,                
            CHG_ID,                
            CHG_DT    
            )
    VALUES  (
            'S301',      
            v_CD,    
            v_CD_NM,    
            v_ORDER_PT,
            v_USE_YN,
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRentalMst;    


  /*****************************************************************************
  -- 렌탈지사 Update
  *****************************************************************************/
  FUNCTION f_UpdateRentalMst ( 
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2 
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTCM0051
       SET CD_NM    = v_CD_NM,
           ORDER_PT = v_ORDER_PT,
           USE_YN   = v_USE_YN,
           CHG_ID   = v_REG_ID,
           CHG_DT   = SYSDATE
     WHERE CD_GRP_CD = 'S301'
       AND CD        = v_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalMst; 


  /*****************************************************************************
  -- 렌탈지사 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRentalMst ( 
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2 
    ) RETURN NUMBER IS
  BEGIN
    DELETE
      FROM RTCM0051
     WHERE CD_GRP_CD = 'S301'
       AND CD        = v_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_DeleteRentalMst; 





   /*****************************************************************************
  -- 렌탈지점 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalDtl (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,   
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,  
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
    v_CNT  NUMBER;
    
  BEGIN
  
    IF v_Comm_Dvsn = 'I' THEN    
    
        IF (TRIM(v_CD) IS NULL) THEN
            v_Return_Message := '렌탈지점코드('||v_CD||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
      
        IF (TRIM(v_CD_NM) IS NULL) THEN
            v_Return_Message := '렌탈지점명('||v_CD_NM||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        BEGIN
            SELECT COUNT(*) CNT
              INTO v_CNT
              FROM RTCM0051
             WHERE CD_GRP_CD = 'S302'
               AND CD        = v_CD;
               
        EXCEPTION WHEN NO_DATA_FOUND THEN
            v_CNT := 0;
        
        END;
        
        IF v_CNT > 0 THEN
            v_Return_Message := '이미 등록된 렌탈지점코드입니다.';
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    
      IF 0 != f_InsertRentalDtl(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                               v_USE_YN, v_RFR_1, v_RFR_2, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지점 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;        
    ELSIF v_Comm_Dvsn = 'U' THEN
        IF 0 != f_UpdateRentalDtl(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                               v_USE_YN, v_RFR_1, v_RFR_2, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지점 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSIF v_Comm_Dvsn = 'D' THEN    
    
        --삭제시 렌탈마스터 사용여부 체크 로직 추가 후 삭제해야됨.. 현재 삭제버튼  사용안함.
    
        IF 0 != f_DeleteRentalDtl(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                               v_USE_YN, v_RFR_1, v_RFR_2, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지점 삭제 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
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

        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalDtl(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalDtl(2)', v_ErrorText, v_Return_Message);
  END p_IUDRentalDtl;     


  /*****************************************************************************
  -- 렌탈지점 Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalDtl (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,  
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,   
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN 
    INSERT  INTO RTCM0051 (
            CD_GRP_CD,        
            CD, 
            CD_NM, 
            ORDER_PT,
            USE_YN,     
            RFR_1,   
            RFR_2,              
            REG_ID,                
            REG_DT,                
            CHG_ID,                
            CHG_DT    
            )
    VALUES  (
            'S302',      
            v_CD,    
            v_CD_NM,    
            v_ORDER_PT,
            v_USE_YN,  
            v_RFR_1,   
            v_RFR_2,   
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRentalDtl;    


  /*****************************************************************************
  -- 렌탈지점 Update
  *****************************************************************************/
  FUNCTION f_UpdateRentalDtl ( 
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE, 
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,     
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTCM0051
       SET CD_NM    = v_CD_NM,
           ORDER_PT = v_ORDER_PT,
           USE_YN   = v_USE_YN,
           RFR_2    = v_RFR_2,
           CHG_ID   = v_REG_ID,
           CHG_DT   = SYSDATE
     WHERE CD_GRP_CD = 'S302'
       AND CD        = v_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalDtl; 


  /*****************************************************************************
  -- 렌탈지점 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRentalDtl ( 
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE, 
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,     
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
  BEGIN
    DELETE
      FROM RTCM0051
     WHERE CD_GRP_CD = 'S302'
       AND CD        = v_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_DeleteRentalDtl; 

  
  /*****************************************************************************
  -- 렌탈지사/지점조회 MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRentalCustMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM IN RTCM0051.CD_NM%TYPE 
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  A.RFR_2 AS GRP_CD
           ,(SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S301' AND CD = A.RFR_2) AS GRP_NM  
           ,A.CD
           ,A.CD_NM
      FROM RTCM0051 A    
     WHERE 1=1
       AND A.CD_GRP_CD = 'S302'
       AND A.RFR_2 IS NOT NULL
       AND ((SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S301' AND CD = A.RFR_2) LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR
            (SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S301' AND CD = A.RFR_2) LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR 
            A.CD LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR
            A.CD_NM LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' )
    ORDER BY (SELECT ORDER_PT FROM RTCM0051 WHERE CD_GRP_CD = 'S301' AND CD = A.RFR_2), A.ORDER_PT
       ;
  END p_sRentalCustMst;
  
  

  /*****************************************************************************
  -- 렌탈지사/지점조회 DETAIL Select
    
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.1      2025-06-10  10244015    [20250610_01] 프리미엄퍼플점여부 추가
  *****************************************************************************/
  PROCEDURE p_sRentalCustDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_GRP_CD          IN RTSD0007.RENTAL_GROUP%TYPE, /*지사코드 */
    v_CD              IN RTSD0007.RENTAL_OFFICE%TYPE, /*지점코드 */
    v_AGENCY_GBN      IN VARCHAR2, /* 판매자구분 */
    v_AGENCY_NM       IN RTSD0007.AGENCY_NM%TYPE /* 판매자명 */
    ) IS
        
  BEGIN
    IF v_AGENCY_GBN = '1' THEN
        OPEN Ref_Cursor FOR    
        
            SELECT A.AGENCY_CD            /* 판매인코드  */
                  ,A.AGENCY_NM            /* 판매인명*/
                  ,NVL(B.CHK,0) AS CHK    /*매핑체크*/
                  ,A.RENTAL_GROUP
                  ,A.RENTAL_OFFICE
                  ,DECODE(A.PRPL_YN, 'N', '0', '1') AS PRPL_YN
                  ,DECODE(A.PREM_PRPL_YN, 'N', '0', '1') AS PREM_PRPL_YN
                  ,'1' AS GROUP_NM
             FROM RTSD0007 A
                  ,(
                    SELECT  AGENCY_CD
                           ,RENTAL_GROUP   
                           ,RENTAL_OFFICE         
                           ,1 AS CHK    
                      FROM RTSD0007            
                     WHERE 1 = 1
                       AND RENTAL_GROUP  = v_GRP_CD
                       AND RENTAL_OFFICE = v_CD
                   ) B
            WHERE A.AGENCY_CD     = B.AGENCY_CD(+)
              AND A.RENTAL_GROUP  = B.RENTAL_GROUP(+)
              AND A.RENTAL_OFFICE = B.RENTAL_OFFICE(+)
              AND A.USE_YN = 'Y'
              AND (A.AGENCY_CD LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%' OR
                   A.AGENCY_NM LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%')
            ORDER BY A.AGENCY_CD ;
            
    ELSIF v_AGENCY_GBN = '2' THEN
        OPEN Ref_Cursor FOR    
        
            SELECT A.ORD_AGENT AGENCY_CD            /* 판매인코드  */
                  ,A.ORG_AGNM AGENCY_NM            /* 판매인명*/
                  ,NVL(B.CHK,0) AS CHK    /*매핑체크*/
                  ,A.RENTAL_GROUP
                  ,A.RENTAL_OFFICE
                  ,'' AS PRPL_YN
                  ,'' AS PREM_PRPL_YN
                  ,'2' AS GROUP_NM
             FROM RTSD0113 A
                  ,(
                    SELECT  ORD_AGENT
                           ,RENTAL_GROUP   
                           ,RENTAL_OFFICE         
                           ,1 AS CHK    
                      FROM RTSD0113            
                     WHERE 1 = 1
                       AND RENTAL_GROUP  = v_GRP_CD
                       AND RENTAL_OFFICE = v_CD
                   ) B
            WHERE A.ORD_AGENT     = B.ORD_AGENT(+)
              AND A.RENTAL_GROUP  = B.RENTAL_GROUP(+)
              AND A.RENTAL_OFFICE = B.RENTAL_OFFICE(+)
              AND A.USE_YN = 'Y'
              AND (A.ORD_AGENT LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%' OR
                   A.ORG_AGNM LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%')
            ORDER BY A.ORD_AGENT ;        
    
    ELSE
        OPEN Ref_Cursor FOR
    
            SELECT A.CARMASTER_NU AGENCY_CD            /* 판매인코드  */
                  ,A.CARMASTER_NM AGENCY_NM            /* 판매인명*/
                  ,NVL(B.CHK,0) AS CHK    /*매핑체크*/
                  ,A.RENTAL_GROUP
                  ,A.RENTAL_OFFICE
                  ,'' AS PRPL_YN
                  ,'' AS PREM_PRPL_YN
                  ,'3' AS GROUP_NM
             FROM RTCS0002 A
                  ,(
                    SELECT  CARMASTER_NU
                           ,RENTAL_GROUP   
                           ,RENTAL_OFFICE         
                           ,1 AS CHK    
                      FROM RTCS0002            
                     WHERE 1 = 1
                       AND RENTAL_GROUP  = v_GRP_CD
                       AND RENTAL_OFFICE = v_CD
                   ) B
            WHERE A.CARMASTER_NU  = B.CARMASTER_NU(+)
              AND A.RENTAL_GROUP  = B.RENTAL_GROUP(+)
              AND A.RENTAL_OFFICE = B.RENTAL_OFFICE(+)
              AND A.USE_YN = 'Y'
              AND (A.CARMASTER_NU LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%' OR
                   A.CARMASTER_NM LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%')
            ORDER BY A.AGENCY_CD ;
    
    END IF ;
            
  END p_sRentalCustDtl;


   /*****************************************************************************
  -- 렌탈지점/판매자연결 저장(IUD)
    
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.1      2025-06-10  10244015    [20250610_01] 프리미엄퍼플점여부 추가
  *****************************************************************************/
  PROCEDURE p_IUDRentalCust (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_AGENCY_GBN     IN CHAR, /* 판매자구분 */
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_PRPL_YN        IN RTSD0007.PRPL_YN%TYPE,
    v_PREM_PRPL_YN   IN RTSD0007.PREM_PRPL_YN%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,           
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
    v_CNT  NUMBER;
    
  BEGIN
  
    IF v_Comm_Dvsn = 'U' THEN    
        IF v_AGENCY_GBN = '1' THEN
            
            IF 0 != f_UpdateRentalCust1(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_AGENCY_CD, v_PRPL_YN, v_PREM_PRPL_YN, v_REG_ID, v_ErrorText) THEN
                v_Return_Message := '렌탈지점/판매자연결 RTSD0007 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        ELSIF v_AGENCY_GBN = '2' THEN
            IF 0 != f_UpdateRentalCust2(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_AGENCY_CD, v_REG_ID, v_ErrorText) THEN
                v_Return_Message := '렌탈지점/판매자연결 RTSD0113 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        ELSE
            IF 0 != f_UpdateRentalCust3(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_AGENCY_CD, v_REG_ID, v_ErrorText) THEN
                v_Return_Message := '렌탈지점/판매자연결 RTCS0002 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        
        END IF;
            
    ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
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

        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalCust(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalCust(2)', v_ErrorText, v_Return_Message);
  END p_IUDRentalCust;     


  /*****************************************************************************
  -- 렌탈지점/판매자연결 RTSD0007 update
      
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.1      2025-06-10  10244015    [20250610_01] 프리미엄퍼플점여부 추가
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust1 ( 
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_PRPL_YN        IN RTSD0007.PRPL_YN%TYPE,
    v_PREM_PRPL_YN   IN RTSD0007.PREM_PRPL_YN%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
    
  BEGIN
  
    UPDATE RTSD0007
       SET RENTAL_GROUP  = v_RENTAL_GROUP,
           RENTAL_OFFICE = v_RENTAL_OFFICE,
           PRPL_YN       = DECODE(v_PRPL_YN, '1', 'Y', 'N'),
           PREM_PRPL_YN  = DECODE(v_PREM_PRPL_YN, '1', 'Y', 'N'),
           CHG_ID        = v_REG_ID,
           CHG_DT        = SYSDATE
     WHERE AGENCY_CD = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalCust1; 

  /*****************************************************************************
  -- 렌탈지점/판매자연결 RTSD0113 update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust2 ( 
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
    
  BEGIN
    UPDATE RTSD0113
       SET RENTAL_GROUP  = v_RENTAL_GROUP,
           RENTAL_OFFICE = v_RENTAL_OFFICE,
           CHG_ID        = v_REG_ID,
           CHG_DT        = SYSDATE
     WHERE ORD_AGENT = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalCust2; 

  /*****************************************************************************
  -- 렌탈지점/판매자연결 RTCS0002 update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust3 ( 
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
    
  BEGIN
    UPDATE RTCS0002
       SET RENTAL_GROUP  = v_RENTAL_GROUP,
           RENTAL_OFFICE = v_RENTAL_OFFICE,
           CHG_ID        = v_REG_ID,
           CHG_DT        = SYSDATE
     WHERE CARMASTER_NU = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalCust3; 

  
  /*****************************************************************************
  -- 판매보조금정책 항목 관리 list
  *****************************************************************************/
  PROCEDURE p_sSaleSubsidyList (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_PLC_CD_NM    IN RTRE5000.PLC_CD_NM%TYPE,
    v_SLS_CD       IN RTRE5000.SLS_CD%TYPE,
    v_BNS_CD       IN RTRE5000.BNS_CD%TYPE,
    v_PYM_CD       IN RTRE5000.PYM_CD%TYPE,     
    v_ACN_CD       IN RTRE5000.ACN_CD%TYPE
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    
    SELECT PLC_CD,
           PLC_CD_NM,
           SLS_CD,
           BNS_CD,
           PYM_CD,
           ACN_CD,
           SALE_MIN,
           SALE_MAX,
           APL_AMT,
           PRF_MIN,
           PRF_MAX,
           ORDER_PT,
           USE_YN,
           REG_ID,
           REG_DT,
           CHG_ID,
           CHG_DT
      FROM RTRE5000        
     WHERE 1=1
       AND (PLC_CD    LIKE '%' || DECODE(v_PLC_CD_NM, NULL, '%', v_PLC_CD_NM) || '%' OR
            PLC_CD_NM LIKE '%' || DECODE(v_PLC_CD_NM, NULL, '%', v_PLC_CD_NM) || '%')
       AND SLS_CD LIKE '%' || DECODE(v_SLS_CD, NULL, '%', v_SLS_CD) || '%' 
       AND BNS_CD LIKE '%' || DECODE(v_BNS_CD, NULL, '%', v_BNS_CD) || '%' 
       AND PYM_CD LIKE '%' || DECODE(v_PYM_CD, NULL, '%', v_PYM_CD) || '%' 
       AND ACN_CD LIKE '%' || DECODE(v_ACN_CD, NULL, '%', v_ACN_CD) || '%' 
     ORDER BY PLC_CD
       ;
  END p_sSaleSubsidyList;


   /*****************************************************************************
  -- 판매보조금정책 항목 관리 저장(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDSaleSubsidy (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_PLC_CD         IN RTRE5000.PLC_CD%TYPE,
    v_PLC_CD_NM      IN RTRE5000.PLC_CD_NM%TYPE,   
    v_SALE_MIN       IN RTRE5000.SALE_MIN%TYPE,   
    v_SALE_MAX       IN RTRE5000.SALE_MAX%TYPE,   
    v_APL_AMT        IN RTRE5000.APL_AMT%TYPE,   
    v_ORDER_PT       IN RTRE5000.ORDER_PT%TYPE,   
    v_USE_YN         IN RTRE5000.USE_YN%TYPE,   
    v_REG_ID         IN RTRE5000.REG_ID%TYPE,            
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
    
  BEGIN
  
    IF v_Comm_Dvsn = 'U' THEN    
        
        IF 0 != f_UpdateSaleSubsidy(v_PLC_CD, v_PLC_CD_NM, v_SALE_MIN, v_SALE_MAX, v_APL_AMT, 
                                    v_ORDER_PT, v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지점/판매자연결 RTSD0007 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
            
    ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
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

        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDSaleSubsidy(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDSaleSubsidy(2)', v_ErrorText, v_Return_Message);
  END p_IUDSaleSubsidy;     


  /*****************************************************************************
  -- 판매보조금정책 항목 관리 UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateSaleSubsidy ( 
    v_PLC_CD         IN RTRE5000.PLC_CD%TYPE,
    v_PLC_CD_NM      IN RTRE5000.PLC_CD_NM%TYPE,   
    v_SALE_MIN       IN RTRE5000.SALE_MIN%TYPE,   
    v_SALE_MAX       IN RTRE5000.SALE_MAX%TYPE,   
    v_APL_AMT        IN RTRE5000.APL_AMT%TYPE,   
    v_ORDER_PT       IN RTRE5000.ORDER_PT%TYPE,   
    v_USE_YN         IN RTRE5000.USE_YN%TYPE,   
    v_REG_ID         IN RTRE5000.REG_ID%TYPE,  
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
    
  BEGIN
    UPDATE RTRE5000
       SET PLC_CD_NM  = v_PLC_CD_NM,
           SALE_MIN   = v_SALE_MIN,
           SALE_MAX   = v_SALE_MAX,
           APL_AMT    = v_APL_AMT,
           ORDER_PT   = v_ORDER_PT,
           USE_YN     = v_USE_YN,
           CHG_ID     = v_REG_ID,
           CHG_DT     = SYSDATE
     WHERE PLC_CD = v_PLC_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateSaleSubsidy; 


  /*****************************************************************************
  -- 렌탈마스터권한 마스터 조회
  *****************************************************************************/
  PROCEDURE p_sRentalAuthMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_USER_NM         IN RTCM0001.USER_NM%TYPE /* 코드명 */
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  USER_ID
           ,USER_NM
      FROM RTCM0001     
     WHERE 1=1
       AND LOCK_YN = 'N'
       AND USER_GRP = 'RM'
       AND (USER_ID LIKE '%' || DECODE(v_USER_NM, NULL, '%', v_USER_NM) || '%' OR
            USER_NM LIKE '%' || DECODE(v_USER_NM, NULL, '%', v_USER_NM) || '%')
     ORDER BY USER_ID
       ;
  END p_sRentalAuthMst;


  /*****************************************************************************
  -- 렌탈마스터권한 마스터 조회
  *****************************************************************************/
  PROCEDURE p_sRentalAuthDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_USER_ID         IN RTCM0001.USER_ID%TYPE, /* 사용자ID */
    v_CD_NM           IN RTCM0051.CD_NM%TYPE /* 코드명 */
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  A.RFR_2 AS RNT_OFC
           ,(SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S301' AND CD = A.RFR_2) AS RNT_OFC_NM  
           ,A.CD AS RNT_PNT
           ,A.CD_NM AS RNT_PNT_NM
           ,NVL(B.RNT_MST_ID, v_USER_ID) AS RNT_MST_ID
           ,NVL(B.CHK,0) AS CHK
      FROM RTCM0051 A,   
           (
            SELECT  A.RNT_MST_ID
                   ,A.RNT_OFC     /* 렌탈지사  */
                   ,A.RNT_PNT     /* 렌탈지점*/
                   ,B.CHK
              FROM RTCM0110  A  ,
                   (
                    SELECT  B.RNT_MST_ID
                           ,B.RNT_OFC     /* 렌탈지사  */
                           ,B.RNT_PNT     /* 렌탈지점*/
                           ,1 AS CHK    /* 매핑체크*/
                      FROM RTCM0110  B          
                     WHERE RNT_MST_ID = v_USER_ID
                     ) B
             WHERE A.RNT_MST_ID(+) = B.RNT_MST_ID
               AND A.RNT_OFC(+)    = B.RNT_OFC
               AND A.RNT_PNT(+)    = B.RNT_PNT
           ) B   
     WHERE 1=1
       AND A.CD_GRP_CD = 'S302'
       AND A.RFR_2 = B.RNT_OFC(+)
       AND A.CD    = B.RNT_PNT(+)
       AND A.RFR_2 IS NOT NULL
       AND ((SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S301' AND CD = A.RFR_2) LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR
            A.CD_NM LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%')
     ORDER BY ORDER_PT
       ;
  END p_sRentalAuthDtl;


   /*****************************************************************************
  -- 렌탈지사 관리(DELETE)
  *****************************************************************************/
    PROCEDURE p_DRentalMstAuth (
        v_RNT_MST_ID     IN RTCM0110.RNT_MST_ID%TYPE,
        v_Success_Code   OUT NUMBER,
        v_Return_Message OUT VARCHAR2
        ) IS
        
        e_Error EXCEPTION;
        
        v_CNT  NUMBER;
    BEGIN
        BEGIN
              
            DELETE
              FROM RTCM0110
             WHERE RNT_MST_ID = v_RNT_MST_ID;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '렌탈마스터권한 삭제 실패!!! [' || v_RNT_MST_ID || ']';
            RAISE e_Error;
        END;
        
        v_Success_code := 0;
        v_Return_Message := '정상적으로 저장되었습니다';
        

        EXCEPTION
          WHEN e_Error THEN
            v_Success_code := -1;
            
            Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_DRentalMstAuth(1)', v_Return_Message);

          WHEN OTHERS THEN
            v_Success_code := -1;
            v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
            Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_DRentalMstAuth(2)', SUBSTR(SQLERRM, 1, 200), v_Return_Message);
    END p_DRentalMstAuth;


   /*****************************************************************************
  -- 렌탈지사 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalMstAuth (
    v_RNT_MST_ID     IN RTCM0110.RNT_MST_ID%TYPE,
    v_RNT_OFC        IN RTCM0110.RNT_OFC%TYPE,
    v_RNT_PNT        IN RTCM0110.RNT_PNT%TYPE,
    v_REG_ID         IN RTCM0110.REG_ID%TYPE,             
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
    v_CNT  NUMBER;
    v_ErrorText VARCHAR2(400);
  BEGIN
    
    IF 0 != f_InsertRentalMstAuth(v_RNT_MST_ID, v_RNT_OFC, v_RNT_PNT, v_REG_ID, v_ErrorText) THEN
        v_Return_Message := '렌탈마스터권한 등록 실패!!!'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;        
  
    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    

    EXCEPTION
      WHEN e_Error THEN
        v_Success_code := -1;
        
        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalMstAuth(1)', v_Return_Message);

      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        
        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalMstAuth(2)', v_Return_Message, SUBSTR(SQLERRM, 1, 200));
  END p_IUDRentalMstAuth;     


  /*****************************************************************************
  -- 렌탈마스터권한 Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalMstAuth (
    v_RNT_MST_ID     IN RTCM0110.RNT_MST_ID%TYPE,
    v_RNT_OFC        IN RTCM0110.RNT_OFC%TYPE,
    v_RNT_PNT        IN RTCM0110.RNT_PNT%TYPE,
    v_REG_ID         IN RTCM0110.REG_ID%TYPE, 
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN 
    INSERT  INTO RTCM0110 (
            RNT_MST_ID,        
            RNT_OFC, 
            RNT_PNT,             
            REG_ID,                
            REG_DT,                
            CHG_ID,                
            CHG_DT    
            )
    VALUES  (
            v_RNT_MST_ID,      
            v_RNT_OFC,    
            v_RNT_PNT,    
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRentalMstAuth;    


  /*****************************************************************************
  -- 렌탈지사조회 Select
  *****************************************************************************/
  PROCEDURE p_userRentalGroup (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_USER_ID         IN RTSD0007.AGENCY_CD%TYPE 
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
        
    SELECT  USER_ID
           ,RENTAL_GROUP
           ,RENTAL_OFFICE
           ,(SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S301' AND CD = RENTAL_GROUP) AS RENTAL_GROUP_NM
           ,(SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S302' AND CD = RENTAL_OFFICE) AS RENTAL_OFFICE_NM
          -- ,(SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S301' AND CD = '101') AS RENTAL_GROUP_NM
          -- ,(SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S302' AND CD = '11') AS RENTAL_OFFICE_NM
      FROM (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113 -- 방문판매인
             WHERE ORD_AGENT = v_USER_ID
            UNION ALL         
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007 -- 대리점
             WHERE AGENCY_CD = v_USER_ID
            UNION ALL         
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002 -- MR.ROADIAN (카마스터)
             WHERE CARMASTER_NU = v_USER_ID
           )
       ;
  END p_userRentalGroup;
  
  /*****************************************************************************
   -- 미반영판매자 조회 Select
   *****************************************************************************/
  PROCEDURE p_sUnRlsSelerList(  Ref_Cursor   IN OUT SYS_REFCURSOR
                              , v_Agency_Gbn IN VARCHAR2
                             )
  IS
  
  BEGIN
      IF v_Agency_Gbn = '1' THEN
          OPEN Ref_Cursor FOR
              /* 대리점 */
              SELECT  A.AGENCY_CD /* 판매인코드  */
                    , A.AGENCY_NM /* 판매인명 */
              FROM    RTSD0007 A
              WHERE   (A.RENTAL_GROUP IS NULL OR A.RENTAL_OFFICE IS NULL)
              ORDER BY A.AGENCY_CD;
      ELSIF v_Agency_Gbn = '2' THEN
          OPEN Ref_Cursor FOR
              /* 방문판매 */
              SELECT  A.ORD_AGENT AS AGENCY_CD
                    , A.ORG_AGNM  AS AGENCY_NM
              FROM    RTSD0113 A
              WHERE   (A.RENTAL_GROUP IS NULL OR A.RENTAL_OFFICE IS NULL)
              ORDER BY A.ORD_AGENT;
      ELSE
          OPEN Ref_Cursor FOR
              /* 로디안 */
              SELECT  A.CARMASTER_NU AS AGENCY_CD
                    , A.CARMASTER_NM AS AGENCY_NM
              FROM    RTCS0002 A
              WHERE   (A.RENTAL_GROUP IS NULL OR A.RENTAL_OFFICE IS NULL)
              ORDER BY A.CARMASTER_NU;
      END IF;
  END p_sUnRlsSelerList;
  
END PKG_RTCM0110;