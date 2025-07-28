CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RENTAL_TEST AS
/*******************************************************************************
   NAME      PKG_RTCM0110
   PURPOSE   렌탈지사 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-31  Sean         1. Created this package body.
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
     ORDER BY A.CD
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
    ORDER BY A.CD
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
       SET CD_NM  = v_CD_NM,
           USE_YN = v_USE_YN,
           CHG_ID = v_REG_ID,
           CHG_DT = SYSDATE
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
       SET CD_NM  = v_CD_NM,
           USE_YN = v_USE_YN,
           RFR_2  = v_RFR_2,
           CHG_ID = v_REG_ID,
           CHG_DT = SYSDATE
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
       AND (A.CD LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR
            A.CD_NM LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%')
    ORDER BY A.RFR_2, A.CD
       ;
  END p_sRentalCustMst;
  
  

  /*****************************************************************************
  -- 렌탈지사/지점조회 DETAIL Select
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
                  ,B.RENTAL_GROUP
                  ,B.RENTAL_OFFICE
             FROM RTSD0007 A
                  ,(
                    SELECT  RENTAL_GROUP   
                           ,RENTAL_OFFICE         
                           ,1 AS CHK    
                      FROM RTSD0007            
                     WHERE 1 = 1
                       AND RENTAL_GROUP  = v_GRP_CD
                       AND RENTAL_OFFICE = v_CD
                   ) B
            WHERE A.RENTAL_GROUP  = B.RENTAL_GROUP(+)
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
                  ,B.RENTAL_GROUP
                  ,B.RENTAL_OFFICE
             FROM RTSD0113 A
                  ,(
                    SELECT  RENTAL_GROUP   
                           ,RENTAL_OFFICE         
                           ,1 AS CHK    
                      FROM RTSD0113            
                     WHERE 1 = 1
                       AND RENTAL_GROUP  = v_GRP_CD
                       AND RENTAL_OFFICE = v_CD
                   ) B
            WHERE A.RENTAL_GROUP  = B.RENTAL_GROUP(+)
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
                  ,B. RENTAL_GROUP
                  ,B. RENTAL_OFFICE
             FROM RTCS0002 A
                  ,(
                    SELECT  RENTAL_GROUP   
                           ,RENTAL_OFFICE         
                           ,1 AS CHK    
                      FROM RTCS0002            
                     WHERE 1 = 1
                       AND RENTAL_GROUP  = v_GRP_CD
                       AND RENTAL_OFFICE = v_CD
                   ) B
            WHERE A.RENTAL_GROUP  = B.RENTAL_GROUP(+)
              AND A.RENTAL_OFFICE = B.RENTAL_OFFICE(+)
              AND A.USE_YN = 'Y'
              AND (A.CARMASTER_NU LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%' OR
                   A.CARMASTER_NM LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%')
            ORDER BY A.AGENCY_CD ;
    
    END IF ;
            
  END p_sRentalCustDtl;


   /*****************************************************************************
  -- 렌탈지점/판매자연결 저장(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalCust (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D) */
    v_AGENCY_GBN     IN VARCHAR2, /* 판매자구분 */
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
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
            IF 0 != f_UpdateRentalCust1(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_AGENCY_CD, v_REG_ID, v_ErrorText) THEN
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
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust1 ( 
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
    
  BEGIN
    UPDATE RTSD0007
       SET RENTAL_GROUP  = v_RENTAL_GROUP,
           RENTAL_OFFICE = v_RENTAL_OFFICE,
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


  
END PKG_RENTAL_TEST;