CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTVW0033 AS
/*******************************************************************************
   NAME:     PKG_RTVW0033
   PURPOSE:  소속판매인

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-13  Sean             1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- 렌탈지사/지역 조회
  *****************************************************************************/
  PROCEDURE p_sRtvw0033 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP   IN RTVIEW33.RENTAL_GROUP%TYPE,        /* 렌탈 지사 */
    v_RENTAL_OFFICE  IN RTVIEW33.RENTAL_OFFICE%TYPE,       /* 렌탈 지역 */
    v_CHN_CD         IN CHAR                               /* 구분: 1: 대리점, 2: 판매인, 3:로디안 */
    ) IS
  BEGIN
    IF v_CHN_CD = '1' THEN  -- 대리점
      IF (TRIM(v_RENTAL_OFFICE) IS NULL) THEN
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* 판매인코드 		    */    
             , V.AGENCY_NM	        /* 판매점명   		    */    
             , V.SALES_GROUP	      /* 지사코드   		    */    
             , V.SALES_OFFICE	      /* 지점코드   		    */    
             , V.TEL_NO		          /* 전화번호   		    */
             , V.CHAN_CD		        /* 체널구분: S030	    */    
             , V.LIFNR		          /* 벤더코드   		    */    
             , V.TAX_RQCD	          /* 세금계산서 발행방법*/  	
             , V.RENTAL_YN	        /* 렌탈대리점 여부 	  */
             , V.CHAN_LCLS_CD       /* 채널 대분류: S090 */
             , V.CHAN_MCLS_CD       /* 채널 중분류: S091 */
             , V.RENTAL_GROUP	      /* 렌탈지사 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* 렌탈지역 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* 구분: 대리점(1), 판매인(2), 로디안(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* 소속판매인 View */
             , RTSD0052 G   /* 렌탈지사 */  
             , RTSD0053 A   /* 렌탈지역 */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)        
           AND V.CHAN_CD IN ('01', '05') /* 대리점, 타이어뱅크 */
          ORDER BY V.AGENCY_CD
         ;
      ELSE       
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* 판매인코드 		    */    
             , V.AGENCY_NM	        /* 판매점명   		    */    
             , V.SALES_GROUP	      /* 지사코드   		    */    
             , V.SALES_OFFICE	      /* 지점코드   		    */    
             , V.TEL_NO		          /* 전화번호   		    */
             , V.CHAN_CD		        /* 체널구분: S030	    */    
             , V.LIFNR		          /* 벤더코드   		    */    
             , V.TAX_RQCD	          /* 세금계산서 발행방법*/  	
             , V.RENTAL_YN	        /* 렌탈대리점 여부 	  */
             , V.CHAN_LCLS_CD       /* 채널 대분류: S090 */
             , V.CHAN_MCLS_CD       /* 채널 중분류: S091 */
             , V.RENTAL_GROUP	      /* 렌탈지사 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* 렌탈지역 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* 구분: 대리점(1), 판매인(2), 로디안(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* 소속판매인 View */
             , RTSD0052 G   /* 렌탈지사 */  
             , RTSD0053 A   /* 렌탈지역 */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)
           AND V.CHAN_CD IN ('01', '05') /* 대리점, 타이어뱅크 */
           AND V.RENTAL_GROUP = v_RENTAL_GROUP                
           AND V.RENTAL_OFFICE = v_RENTAL_OFFICE                
          ORDER BY V.AGENCY_CD
         ;       
      END IF;
    ELSIF v_CHN_CD = '3' THEN  -- 로디안    
      IF (TRIM(v_RENTAL_OFFICE) IS NULL) THEN
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* 판매인코드 		    */    
             , V.AGENCY_NM	        /* 판매점명   		    */    
             , V.SALES_GROUP	      /* 지사코드   		    */    
             , V.SALES_OFFICE	      /* 지점코드   		    */    
             , V.TEL_NO		          /* 전화번호   		    */
             , V.CHAN_CD		        /* 체널구분: S030	    */    
             , V.LIFNR		          /* 벤더코드   		    */    
             , V.TAX_RQCD	          /* 세금계산서 발행방법*/  	
             , V.RENTAL_YN	        /* 렌탈대리점 여부 	  */
             , V.CHAN_LCLS_CD       /* 채널 대분류: S090 */
             , V.CHAN_MCLS_CD       /* 채널 중분류: S091 */
             , V.RENTAL_GROUP	      /* 렌탈지사 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* 렌탈지역 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* 구분: 대리점(1), 판매인(2), 로디안(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* 소속판매인 View */
             , RTSD0052 G   /* 렌탈지사 */  
             , RTSD0053 A   /* 렌탈지역 */
             , RTCS0002 B   /* 로디안 카마스타 마스터 */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)        
           AND V.CHAN_LCLS_CD = '03' 
           AND V.AGENCY_CD = B.ORD_AGENT
          ORDER BY V.AGENCY_CD
         ;
      ELSE       
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* 판매인코드 		    */    
             , V.AGENCY_NM	        /* 판매점명   		    */    
             , V.SALES_GROUP	      /* 지사코드   		    */    
             , V.SALES_OFFICE	      /* 지점코드   		    */    
             , V.TEL_NO		          /* 전화번호   		    */
             , V.CHAN_CD		        /* 체널구분: S030	    */    
             , V.LIFNR		          /* 벤더코드   		    */    
             , V.TAX_RQCD	          /* 세금계산서 발행방법*/  	
             , V.RENTAL_YN	        /* 렌탈대리점 여부 	  */
             , V.CHAN_LCLS_CD       /* 채널 대분류: S090 */
             , V.CHAN_MCLS_CD       /* 채널 중분류: S091 */
             , V.RENTAL_GROUP	      /* 렌탈지사 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* 렌탈지역 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* 구분: 대리점(1), 판매인(2), 로디안(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* 소속판매인 View */
             , RTSD0052 G   /* 렌탈지사 */  
             , RTSD0053 A   /* 렌탈지역 */
             , RTCS0002 B   /* 로디안 카마스타 마스터 */             
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)
           AND V.CHAN_LCLS_CD = '03' 
           AND V.AGENCY_CD = B.ORD_AGENT
           AND V.RENTAL_GROUP = v_RENTAL_GROUP                
           AND V.RENTAL_OFFICE = v_RENTAL_OFFICE                
          ORDER BY V.AGENCY_CD
         ;        
      END IF;      
    ELSIF v_CHN_CD = '2' THEN  -- 판매인
      IF (TRIM(v_RENTAL_OFFICE) IS NULL) THEN
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* 판매인코드 		    */    
             , V.AGENCY_NM	        /* 판매점명   		    */    
             , V.SALES_GROUP	      /* 지사코드   		    */    
             , V.SALES_OFFICE	      /* 지점코드   		    */    
             , V.TEL_NO		          /* 전화번호   		    */
             , V.CHAN_CD		        /* 체널구분: S030	    */    
             , V.LIFNR		          /* 벤더코드   		    */    
             , V.TAX_RQCD	          /* 세금계산서 발행방법*/  	
             , V.RENTAL_YN	        /* 렌탈대리점 여부 	  */
             , V.CHAN_LCLS_CD       /* 채널 대분류: S090 */
             , V.CHAN_MCLS_CD       /* 채널 중분류: S091 */
             , V.RENTAL_GROUP	      /* 렌탈지사 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* 렌탈지역 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* 구분: 대리점(1), 판매인(2), 로디안(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* 소속판매인 View */
             , RTSD0052 G   /* 렌탈지사 */  
             , RTSD0053 A   /* 렌탈지역 */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)        
           AND V.CHAN_LCLS_CD = '03' 
           AND NOT EXISTS
                   (SELECT 'O'
                      FROM RTCS0002 B /* 로디안 카마스타 마스터 */
                     WHERE B.ORD_AGENT = V.AGENCY_CD)
          ORDER BY V.AGENCY_CD
         ;
      ELSE       
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* 판매인코드 		    */    
             , V.AGENCY_NM	        /* 판매점명   		    */    
             , V.SALES_GROUP	      /* 지사코드   		    */    
             , V.SALES_OFFICE	      /* 지점코드   		    */    
             , V.TEL_NO		          /* 전화번호   		    */
             , V.CHAN_CD		        /* 체널구분: S030	    */    
             , V.LIFNR		          /* 벤더코드   		    */    
             , V.TAX_RQCD	          /* 세금계산서 발행방법*/  	
             , V.RENTAL_YN	        /* 렌탈대리점 여부 	  */
             , V.CHAN_LCLS_CD       /* 채널 대분류: S090 */
             , V.CHAN_MCLS_CD       /* 채널 중분류: S091 */
             , V.RENTAL_GROUP	      /* 렌탈지사 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* 렌탈지역 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* 구분: 대리점(1), 판매인(2), 로디안(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* 소속판매인 View */
             , RTSD0052 G   /* 렌탈지사 */  
             , RTSD0053 A   /* 렌탈지역 */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)
           AND V.CHAN_LCLS_CD = '03' 
           AND NOT EXISTS
                   (SELECT 'O'
                      FROM RTCS0002 B /* 로디안 카마스타 마스터 */
                     WHERE B.ORD_AGENT = V.AGENCY_CD)
           AND V.RENTAL_GROUP = v_RENTAL_GROUP                
           AND V.RENTAL_OFFICE = v_RENTAL_OFFICE                
          ORDER BY V.AGENCY_CD
         ;        
      END IF;      
    END IF;      
  END p_sRtvw0033;
  
  /*****************************************************************************
  -- 렌탈지사/지역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtvw0033 (
    v_Comm_Dvsn      IN CHAR,                           /* 처리구분(I,U,D)     */
    v_CHN_CL         IN CHAR,                           /* 구분코드            */
    v_AGENCY_CD      IN RTVIEW33.AGENCY_CD%TYPE,        /* 대리점코드          */
    v_RENTAL_GROUP_NEW IN RTVIEW33.RENTAL_GROUP%TYPE,   /* 렌탈지사            */
    v_RENTAL_OFFICE_NEW IN RTVIEW33.RENTAL_OFFICE%TYPE, /* 렌탈지역            */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,           /* 등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    e_Error EXCEPTION;    
  BEGIN 
 
    IF v_CHN_CL = '1' THEN -- 대리점 
      IF 0 != f_UpdateRTSD0007(v_AGENCY_CD, v_RENTAL_GROUP_NEW, v_RENTAL_OFFICE_NEW, 
                               v_Reg_Id, v_ErrorText) THEN
          v_Return_Message := '렌탈지사/지역(대리점) 수정 실패!!!'||'-'||v_ErrorText;
          v_ErrorText := v_ErrorText;
          RAISE e_Error;
      END IF;
    ELSIF v_CHN_CL = '2' THEN -- 판매인
      IF 0 != f_UpdateRTSD0113(v_AGENCY_CD, v_RENTAL_GROUP_NEW, v_RENTAL_OFFICE_NEW, 
                               v_Reg_Id, v_ErrorText) THEN
          v_Return_Message := '렌탈지사/지역(판매인) 수정 실패!!!'||'-'||v_ErrorText;
          v_ErrorText := v_ErrorText;
          RAISE e_Error;
      END IF;      
    ELSIF v_CHN_CL = '3' THEN -- 로디안
      IF 0 != f_UpdateRTCS0002(v_AGENCY_CD, v_RENTAL_GROUP_NEW, v_RENTAL_OFFICE_NEW, 
                               v_Reg_Id, v_ErrorText) THEN
          v_Return_Message := '렌탈지사/지역(로디안) 수정 실패!!!'||'-'||v_ErrorText;
          v_ErrorText := v_ErrorText;
          RAISE e_Error;
      END IF;    
    ELSE
        v_Return_Message := '구분코드(1,2,3)값 오류!!!['||v_CHN_CL||']';
        RAISE e_Error;    
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTVW0033.p_IUDRtvw0033(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTVW0033.p_IUDRtvw0033(2)', v_ErrorText, v_Return_Message);
  END p_IUDRtvw0033;  
  
  /*****************************************************************************
  -- 렌탈지사/지역(대리점) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0007 ( 
    v_AGENCY_CD         IN RTSD0007.AGENCY_CD%TYPE,     /* 대리점코드          */
    v_RENTAL_GROUP_NEW  IN RTSD0007.RENTAL_GROUP%TYPE,  /* 렌탈지사            */
    v_RENTAL_OFFICE_NEW IN RTSD0007.RENTAL_OFFICE%TYPE, /* 렌탈지역            */
    v_Reg_Id            IN RTSD0007.REG_ID%TYPE,        /* 등록자 ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0007
       SET RENTAL_GROUP  = v_RENTAL_GROUP_NEW,
           RENTAL_OFFICE = v_RENTAL_OFFICE_NEW,
           CHG_ID		     = v_Reg_Id,
           CHG_DT		     = SYSDATE
     WHERE AGENCY_CD     = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTSD0007;    

  /*****************************************************************************
  -- 렌탈지사/지역(판매인) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0113 ( 
    v_AGENCY_CD         IN RTSD0113.ORD_AGENT%TYPE,     /* 판매인번호          */
    v_RENTAL_GROUP_NEW  IN RTSD0113.RENTAL_GROUP%TYPE,  /* 렌탈지사            */
    v_RENTAL_OFFICE_NEW IN RTSD0113.RENTAL_OFFICE%TYPE, /* 렌탈지역            */
    v_Reg_Id            IN RTSD0113.REG_ID%TYPE,        /* 등록자 ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0113
       SET RENTAL_GROUP  = v_RENTAL_GROUP_NEW,
           RENTAL_OFFICE = v_RENTAL_OFFICE_NEW,
           CHG_ID		     = v_Reg_Id,
           CHG_DT		     = SYSDATE
     WHERE ORD_AGENT     = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTSD0113;
  
  /*****************************************************************************
  -- 렌탈지사/지역(로디안) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCS0002 ( 
    v_AGENCY_CD         IN RTCS0002.ORD_AGENT%TYPE,     /* 대리점코드          */
    v_RENTAL_GROUP_NEW  IN RTCS0002.RENTAL_GROUP%TYPE,  /* 렌탈지사            */
    v_RENTAL_OFFICE_NEW IN RTCS0002.RENTAL_OFFICE%TYPE, /* 렌탈지역            */
    v_Reg_Id            IN RTCS0002.REG_ID%TYPE,        /* 등록자 ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTCS0002
       SET RENTAL_GROUP  = v_RENTAL_GROUP_NEW,
           RENTAL_OFFICE = v_RENTAL_OFFICE_NEW,
           CHG_ID		     = v_Reg_Id,
           CHG_DT		     = SYSDATE
     WHERE ORD_AGENT     = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTCS0002;  
END PKG_RTVW0033;
/
