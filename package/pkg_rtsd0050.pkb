CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0050 AS
/*******************************************************************************
   NAME:     PKG_RTSD0050
   PURPOSE:  렌탈마스터

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-05  Sean             1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- 렌탈마스터 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0050 (
    Ref_Cursor            IN OUT SYS_REFCURSOR,
    v_RTMASTER_NM         IN RTSD0050.RTMASTER_NM%TYPE        /* 렌탈 마스터 명 */
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT RTMASTER_NU	/* 렌탈 마스터 사번 */
        , RTMASTER_NM	  /* 렌탈 마스터 명   */
        , MOB_NO		    /* 핸드폰번호       */
        , TEL_NO		    /* 전화번호         */
        , USE_YN		    /* 렌탈마스터여부   */
        , REG_ID		    /* 등록자 ID        */
        , REG_DT		    /* 등록일           */
        , CHG_ID		    /* 변경자 ID        */
        , CHG_DT		    /* 변경일           */
      FROM RTSD0050     /* 렌탈마스터 */
     WHERE 1=1
       AND RTMASTER_NM LIKE TRIM(v_RTMASTER_NM) || '%'
;
  END p_sRtsd0050;

  /*****************************************************************************
  -- 렌탈마스터 관리지역 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0050MgmtArea (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RTMASTER_NU    IN RTSD0050.RTMASTER_NU%TYPE        /* 렌탈 마스터 사번 */
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR  
  SELECT MM.RTMASTER_NU     /* 렌탈 마스터 사번 */
       , MM.RENTAL_GROUP    /* 렌탈지사 */
       , G.RENTAL_GROUP_NM
       , MM.RENTAL_OFFICE   /* 렌탈지역 */
       , A.RENTAL_OFFICE_NM
       , MM.STR_DAY         /* 시작일자 */
       , MM.END_DAY         /* 종료일자 */
       , MM.REG_ID		      /* 등록자 ID */
       , MM.REG_DT		      /* 등록일    */
       , MM.CHG_ID		      /* 변경자 ID */
       , MM.CHG_DT		      /* 변경일    */     
    FROM RTSD0050 M       /* 렌탈마스터 */
       , RTSD0051 MM      /* 렌탈 마스터 관리지역 */
       , RTSD0052 G       /* 렌탈지사 */
       , RTSD0053 A       /* 렌탈지역 */
   WHERE 1=1
     AND G.RENTAL_GROUP = A.RENTAL_GROUP   
     AND M.RTMASTER_NU = MM.RTMASTER_NU(+)
     AND MM.RENTAL_GROUP = G.RENTAL_GROUP(+)
     AND MM.RENTAL_OFFICE = A.RENTAL_OFFICE(+)
     AND M.RTMASTER_NU = v_RTMASTER_NU
     AND MM.STR_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
     AND ( 
           CASE 
                WHEN MM.END_DAY IS NULL THEN TO_CHAR(SYSDATE+1, 'YYYYMMDD')
                ELSE MM.END_DAY
           END
         ) > TO_CHAR(SYSDATE, 'YYYYMMDD')
   ORDER BY MM.RTMASTER_NU, MM.RENTAL_GROUP, MM.RENTAL_OFFICE         
;
  END p_sRtsd0050MgmtArea;    

  /*****************************************************************************
  -- 소속판매인 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0050SalesAgent (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP   IN RTSD0052.RENTAL_GROUP%TYPE,      /* 렌탈지사 */
    v_RTMASTER_NU    IN RTSD0050.RTMASTER_NU%TYPE        /* 렌탈 마스터 사번 */    
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR      
    SELECT V.AGENCY_CD	        /* 판매인코드 		    */    
         , V.AGENCY_NM	        /* 판매점명   		    */    
         , V.SALES_GROUP	      /* 지사코드   		    */    
         , V.SALES_OFFICE	      /* 지점코드   		    */    
         , V.TEL_NO		          /* 전화번호   		    */    
         , V.CHAN_CD		        /* 체널구분   		    */    
         , V.LIFNR		          /* 벤더코드   		    */    
         , V.TAX_RQCD	          /* 세금계산서 발행방법*/  	
         , V.RENTAL_YN	        /* 렌탈대리점 여부 	  */
         , V.CHAN_LCLS_CD       /* 채널 대분류       */
         , V.CHAN_MCLS_CD       /* 채널 중분류       */         
         , V.RENTAL_GROUP	      /* 렌탈지사 		      */
         , G.RENTAL_GROUP_NM
         , V.RENTAL_OFFICE	    /* 렌탈지역 		      */
         , A.RENTAL_OFFICE_NM
      FROM RTVIEW33 V   /* 소속판매인 View */
         , RTSD0052 G   /* 렌탈지사 */  
         , RTSD0053 A   /* 렌탈지역 */  
     WHERE 1=1
       AND V.RENTAL_GROUP = G.RENTAL_GROUP
       AND V.RENTAL_OFFICE = A.RENTAL_OFFICE
       AND V.RENTAL_GROUP = v_RENTAL_GROUP
      AND V.RENTAL_OFFICE in (  
          SELECT IMM.RENTAL_OFFICE  /* 렌탈지역 */
            FROM RTSD0050 IM     /* 렌탈마스터 */
               , RTSD0051 IMM    /* 렌탈 마스터 관리지역 */
               , RTSD0053 IA     /* 렌탈지역 */
           WHERE 1=1
             AND IM.RTMASTER_NU = IMM.RTMASTER_NU
             AND IMM.RENTAL_OFFICE = IA.RENTAL_OFFICE
             AND IM.RTMASTER_NU = v_RTMASTER_NU
             AND IMM.STR_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
             AND IMM.END_DAY > TO_CHAR(SYSDATE, 'YYYYMMDD')  
      )    
;
  END p_sRtsd0050SalesAgent;

   /*****************************************************************************
  -- 렌탈마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0050 (
    v_Comm_Dvsn       IN CHAR,                         /* 처리구분(I,U,D) */
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE,
    v_RTMASTER_NM     IN RTSD0050.RTMASTER_NM%TYPE,
    v_MOB_NO          IN RTSD0050.MOB_NO%TYPE,
    v_TEL_NO          IN RTSD0050.TEL_NO%TYPE,
    v_USE_YN          IN RTSD0050.USE_YN%TYPE,	
    v_REG_ID    		  IN RTSD0050.REG_ID%TYPE,		  
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS  

    e_Error EXCEPTION;
    
  BEGIN
 
    IF v_Comm_Dvsn = 'I' THEN
      IF 0 <> f_sRTSD0050Count(v_RTMASTER_NU) THEN
          v_Return_Message := '중복에러 : 이미 존재하는 사번('||v_RTMASTER_NU||')입니다!';
          RAISE e_Error;
      END IF;
      
      IF 0 != f_InsertRTSD0050(v_RTMASTER_NU, v_RTMASTER_NM, v_MOB_NO, v_TEL_NO,
                               v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈마스터 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
      END IF;        
    ELSIF v_Comm_Dvsn = 'U' THEN
      IF (TRIM(v_RTMASTER_NU) IS NULL) THEN
          v_Return_Message := '렌탈마스터 사번('||v_RTMASTER_NU||') : 필수 입력값 누락으로 처리가 불가 합니다!';
          RAISE e_Error;
      END IF;
    
      IF 0 = f_sRTSD0050Count(v_RTMASTER_NU) THEN
          v_Return_Message := '사번('||v_RTMASTER_NU||')에 해당하는 렌탈마스터 정보가 없습니다.!';
          RAISE e_Error;
      END IF;    
    
      IF 0 != f_UpdateRTSD0050(v_RTMASTER_NU, v_RTMASTER_NM, v_MOB_NO, v_TEL_NO,
                               v_USE_YN, v_REG_ID, v_ErrorText) THEN
          v_Return_Message := '렌탈마스터 수정 실패!!!'||'-'||v_ErrorText;
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
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0050.p_IUDRTSD0050(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0050.p_IUDRTSD0050(2)', v_ErrorText, v_Return_Message);
  END p_IUDRtsd0050;  

  /*****************************************************************************
  -- 렌탈마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0050 (
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE,
    v_RTMASTER_NM     IN RTSD0050.RTMASTER_NM%TYPE,
    v_MOB_NO          IN RTSD0050.MOB_NO%TYPE,
    v_TEL_NO          IN RTSD0050.TEL_NO%TYPE,
    v_USE_YN          IN RTSD0050.USE_YN%TYPE,	
    v_REG_ID    		  IN RTSD0050.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    INSERT  INTO RTSD0050 (
            RTMASTER_NU
          , RTMASTER_NM
          , MOB_NO		 
          , TEL_NO		 
          , USE_YN		 
          , REG_ID		 
          , REG_DT		 
          , CHG_ID		 
          , CHG_DT	   
            )
    VALUES  (
            v_RTMASTER_NU,
            v_RTMASTER_NM,
            v_MOB_NO,
            v_TEL_NO,
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
  END f_InsertRTSD0050;    

  /*****************************************************************************
  -- 렌탈마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0050 ( 
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE,
    v_RTMASTER_NM     IN RTSD0050.RTMASTER_NM%TYPE,
    v_MOB_NO          IN RTSD0050.MOB_NO%TYPE,
    v_TEL_NO          IN RTSD0050.TEL_NO%TYPE,
    v_USE_YN          IN RTSD0050.USE_YN%TYPE,
    v_REG_ID    		  IN RTSD0050.REG_ID%TYPE, 
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0050
       SET RTMASTER_NM = v_RTMASTER_NM,
           MOB_NO      = v_MOB_NO,
           TEL_NO      = v_TEL_NO,
           USE_YN			 = v_USE_YN,
           CHG_ID		   = v_REG_ID,
           CHG_DT		   = SYSDATE
     WHERE RTMASTER_NU = v_RTMASTER_NU
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTSD0050; 

  /*****************************************************************************
  -- 렌탈마스터 - 렌탈 마스터 사번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0050NuSeq RETURN VARCHAR2 IS
    v_NuSeq   RTSD0050.RTMASTER_NU%TYPE default 0; /* 렌탈 마스터 사번 */
  BEGIN
    SELECT  SEQ_RTSD0050RTMASTER_NU_SEQ.NEXTVAL NU_SEQ
      INTO  v_NuSeq
      FROM  DUAL;

    RETURN v_NuSeq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;
  END f_sRtsd0050NuSeq;
  
  /*****************************************************************************
  -- 렌탈마스터 Count
  *****************************************************************************/
  FUNCTION f_sRTSD0050Count ( 
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE
    ) RETURN NUMBER IS
    v_curr_cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cnt
    FROM    RTSD0050
    WHERE   RTMASTER_NU = v_RTMASTER_NU
    ;

    RETURN v_curr_cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRTSD0050Count;  
END PKG_RTSD0050;