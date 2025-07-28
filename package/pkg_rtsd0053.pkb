CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0053 AS
/*******************************************************************************
   NAME      PKG_RTSD0053
   PURPOSE   렌탈지역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-01  Sean         1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- 렌탈지역 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0053 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP    IN RTSD0053.RENTAL_GROUP%TYPE,          /* 렌탈지사  */
    v_USE_YN          IN RTSD0052.USE_YN%TYPE,	
    v_USE_YN2         IN RTSD0053.USE_YN%TYPE
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT D.RENTAL_GROUP	    /* 렌탈지사   */
         , M.RENTAL_GROUP_NM  /* 렌탈지사명 */
         , D.RENTAL_OFFICE	  /* 렌탈지역   */
         , D.RENTAL_OFFICE_NM	/* 렌탈지역명 */
         , D.USE_YN	          /* 사용여부   */
         , D.REG_ID	          /* 등록자 ID  */
         , D.REG_DT	          /* 등록일     */
         , D.CHG_ID	          /* 변경자 ID  */
         , D.CHG_DT	          /* 변경일     */ 
      FROM RTSD0052 M         /* 렌탈지사   */
         , RTSD0053 D         /* 렌탈지역   */
     WHERE 1=1
       AND M.RENTAL_GROUP = D.RENTAL_GROUP
       AND D.RENTAL_GROUP = v_RENTAL_GROUP
       AND M.USE_YN like TRIM(v_USE_YN) || '%'
       AND D.USE_YN like TRIM(v_USE_YN2) || '%'       
     ORDER BY M.RENTAL_GROUP, D.RENTAL_OFFICE
       ; 
  END p_sRTSD0053;

  /*****************************************************************************
  -- 렌탈지역등록팝업 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0053_pop ( 
    Ref_Cursor         IN OUT SYS_REFCURSOR,
    v_RENTAL_OFFICE_NM IN RTSD0053.RENTAL_OFFICE_NM%TYPE        /* 렌탈지역명  */
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT D.RENTAL_GROUP	    /* 렌탈지사   */
         , M.RENTAL_GROUP_NM  /* 렌탈지사명 */
         , D.RENTAL_OFFICE	  /* 렌탈지역   */
         , D.RENTAL_OFFICE_NM	/* 렌탈지역명 */
         , D.USE_YN	          /* 사용여부   */
         , D.REG_ID	          /* 등록자 ID  */
         , D.REG_DT	          /* 등록일     */
         , D.CHG_ID	          /* 변경자 ID  */
         , D.CHG_DT	          /* 변경일     */ 
      FROM RTSD0052 M         /* 렌탈지사   */
         , RTSD0053 D         /* 렌탈지역   */
     WHERE 1=1
       AND M.RENTAL_GROUP = D.RENTAL_GROUP
       AND D.RENTAL_OFFICE_NM LIKE TRIM(v_RENTAL_OFFICE_NM) || '%'
       AND M.USE_YN = 'Y'
       AND D.USE_YN = 'Y'
     ORDER BY M.RENTAL_GROUP, D.RENTAL_OFFICE
    ;
  END p_sRTSD0053_pop;
  
  /*****************************************************************************
  -- 렌탈지역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0053 (
    v_Comm_Dvsn         IN CHAR,                         /* 처리구분(I,U,D) */
    v_RENTAL_GROUP	    IN RTSD0053.RENTAL_GROUP%TYPE,		  
    v_RENTAL_OFFICE     IN RTSD0053.RENTAL_OFFICE%TYPE,		  
    v_RENTAL_OFFICE_NM  IN RTSD0053.RENTAL_OFFICE_NM%TYPE,		  
    v_USE_YN            IN RTSD0053.USE_YN%TYPE,	
    v_REG_ID    		    IN RTSD0053.REG_ID%TYPE,		  
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN
    IF (TRIM(v_RENTAL_GROUP) IS NULL) THEN
        v_Return_Message := '렌탈지사('||v_RENTAL_GROUP||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_RENTAL_OFFICE) IS NULL) THEN
        v_Return_Message := '렌탈지역('||v_RENTAL_OFFICE||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_RENTAL_OFFICE_NM) IS NULL) THEN
        v_Return_Message := '렌탈지역명('||v_RENTAL_OFFICE_NM||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF v_Comm_Dvsn = 'I' THEN    
      IF 0 != f_InsertRTSD0053(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_RENTAL_OFFICE_NM,
                               v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;        
    ELSIF v_Comm_Dvsn = 'U' THEN
        IF 0 != f_UpdateRTSD0053(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_RENTAL_OFFICE_NM,
                                 v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지역 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSIF v_Comm_Dvsn = 'D' THEN    
        IF 0 != f_UpdateRTSD0053(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_RENTAL_OFFICE_NM,
                                 v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '렌탈지역 삭제 실패!!!'||'-'||v_ErrorText;
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

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0053.p_IUDRTSD0053(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0053.p_IUDRTSD0053(2)', v_ErrorText, v_Return_Message);
  END p_IUDRTSD0053;    

  /*****************************************************************************
  -- 렌탈지역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0053 (
    v_RENTAL_GROUP	    IN RTSD0053.RENTAL_GROUP%TYPE,		  
    v_RENTAL_OFFICE     IN RTSD0053.RENTAL_OFFICE%TYPE,		  
    v_RENTAL_OFFICE_NM  IN RTSD0053.RENTAL_OFFICE_NM%TYPE,		  
    v_USE_YN            IN RTSD0053.USE_YN%TYPE,	
    v_REG_ID    		    IN RTSD0053.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN 
    INSERT  INTO RTSD0053 (
            RENTAL_GROUP,		
            RENTAL_OFFICE,		
            RENTAL_OFFICE_NM,
            USE_YN,			    
            REG_ID,			    
            REG_DT,			    
            CHG_ID,			    
            CHG_DT    
            )
    VALUES  (
            v_RENTAL_GROUP,	  
            v_RENTAL_OFFICE,   
            v_RENTAL_OFFICE_NM,
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
        
  END f_InsertRTSD0053;    

  /*****************************************************************************
  -- 렌탈지역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0053 ( 
    v_RENTAL_GROUP	    IN RTSD0053.RENTAL_GROUP%TYPE,		  
    v_RENTAL_OFFICE     IN RTSD0053.RENTAL_OFFICE%TYPE,		  
    v_RENTAL_OFFICE_NM  IN RTSD0053.RENTAL_OFFICE_NM%TYPE,		  
    v_USE_YN            IN RTSD0053.USE_YN%TYPE,	
    v_REG_ID    		    IN RTSD0053.REG_ID%TYPE,  
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0053
       SET RENTAL_OFFICE_NM = v_RENTAL_OFFICE_NM,
           USE_YN			      = v_USE_YN,
           CHG_ID		        = v_REG_ID,
           CHG_DT		        = SYSDATE
     WHERE RENTAL_GROUP     = v_RENTAL_GROUP
       AND RENTAL_OFFICE	  = v_RENTAL_OFFICE
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTSD0053;    
END PKG_RTSD0053;