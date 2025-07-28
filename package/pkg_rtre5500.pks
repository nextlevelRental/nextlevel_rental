CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre5500 AS
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
      Ref_Cursor  OUT SYS_REFCURSOR
    , v_Close_Ym  IN  RTRE5500.CLOSE_YM%TYPE     /*마감년월              */
  );
  
  FUNCTION f_UpdateRtre5500 (
      v_If_No     IN RTRE5500.IF_NO%TYPE        /*인터페이스 일련번호   */
    , v_Exe_Sec   IN RTRE5500.EXE_SEC%TYPE      /*수행시간(초)          */
    , v_Relt_Code IN RTRE5500.RELT_CODE%TYPE    /*인터페이스 결과코드   */
    , v_Relt_msg  IN RTRE5500.RELT_MSG%TYPE     /*인터페이스 결과메시지 */
    , v_Chg_Id    IN RTRE5500.CHG_ID%TYPE       /*변경자 ID             */
    , v_ErrorText OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- EAI 인터페이스 리스트 생성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5500 (
    v_Close_Ym       IN  RTRE5500.CLOSE_YM%TYPE,        /*마감년월              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
  
END Pkg_Rtre5500;