CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5500 AS
/*******************************************************************************
   NAME      Pkg_Rtre5500
   PURPOSE   월마감 EAI 인터페이스

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-06-13  wjim             1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- EAI 인터페이스 결과 조회
  *****************************************************************************/
  PROCEDURE p_sRtre5500 (
      Ref_Cursor       OUT SYS_REFCURSOR
    , v_Close_Ym       IN  RTRE5500.CLOSE_YM%TYPE        /*마감년월              */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  ''            AS CHK
         ,  A.IF_NO
         ,  A.CLOSE_YM
         ,  A.IF_ID
         ,  A.IF_NM
         ,  A.IF_TIME_CD
         ,  A.CALL_PROC
         ,  A.EXE_SEC
         ,  A.RELT_CODE
         ,  A.RELT_MSG
         ,  A.IN_PARAM_01
         ,  A.IN_PARAM_02
         ,  A.REG_ID
         ,  A.REG_DT
         ,  A.CHG_ID
         ,  A.CHG_DT
         ,  A.MULTI_SEND_YN
         ,  A.RAW_DATA_PROC
         ,  A.SEND_AMOUNT  
      FROM  RTRE5500 A
     WHERE  A.CLOSE_YM = DECODE(v_Close_Ym, NULL, A.CLOSE_YM, v_Close_Ym)
     ORDER  BY A.IF_NO;  

  END p_sRtre5500;
  
  /*****************************************************************************
  -- EAI 인터페이스 결과 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5500 (
      v_If_No     IN RTRE5500.IF_NO%TYPE        /*인터페이스 일련번호   */
    , v_Exe_Sec   IN RTRE5500.EXE_SEC%TYPE      /*수행시간(초)          */
    , v_Relt_Code IN RTRE5500.RELT_CODE%TYPE    /*인터페이스 결과코드   */
    , v_Relt_msg  IN RTRE5500.RELT_MSG%TYPE     /*인터페이스 결과메시지 */
    , v_Chg_Id    IN RTRE5500.CHG_ID%TYPE       /*변경자 ID             */
    , v_ErrorText OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    v_ErrorText := 'Success';

    UPDATE  RTRE5500
       SET  EXE_SEC   = v_Exe_Sec
         ,  RELT_CODE = v_Relt_Code
         ,  RELT_MSG  = v_Relt_msg
         ,  CHG_ID    = v_Chg_Id
         ,  CHG_DT    = SYSDATE 
     WHERE  IF_NO     = v_If_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5500;

  /*****************************************************************************
  -- EAI 인터페이스 리스트 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5500 (
    v_Close_Ym       IN  RTRE5500.CLOSE_YM%TYPE,        /*마감년월              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  ) IS

    v_Cnt NUMBER;
    e_Error EXCEPTION;
  BEGIN

    SELECT COUNT(*) 
    INTO v_Cnt
    FROM RTRE5500
    WHERE CLOSE_YM = v_Close_Ym;
    
    IF v_Cnt > 0 THEN
        v_Return_Message := '해당월 EAI리스트가 생성되어있습니다.';
        RAISE e_Error;
    END IF;
    
    INSERT INTO RTRE5500
    SELECT  v_Close_Ym || SUBSTR(A.IF_NO, 7)    AS IF_NO
         ,  v_Close_Ym                          AS CLOSE_YM
         ,  A.IF_ID
         ,  A.IF_NM
         ,  A.IF_TIME_CD
         ,  A.CALL_PROC
         ,  A.EXE_SEC
         ,  A.RELT_CODE
         ,  A.RELT_MSG
         ,  v_Close_Ym                          AS IN_PARAM_01
         ,  A.IN_PARAM_02
         ,  A.REG_ID
         ,  SYSDATE
         ,  A.CHG_ID
         ,  SYSDATE
         ,  A.MULTI_SEND_YN
         ,  A.RAW_DATA_PROC
         ,  A.SEND_AMOUNT  
      FROM  RTRE5500_BASIC A
     ORDER  BY A.IF_NO;  

    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Errortext := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        
      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL(TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다.!');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        
  END p_CreateRtre5500;
  
END Pkg_Rtre5500;
/