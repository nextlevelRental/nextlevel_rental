CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE5401 AS
/*******************************************************************************
    NAME        PKG_RTRE5401
    PURPOSE     마감전표정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
*******************************************************************************/

  /*****************************************************************************
  -- 마감전표정보 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_sRtre5401 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Zmonth          IN RTRE5401.ZMONTH%TYPE         /*마감년월            */    
  );
  
  /*****************************************************************************
    -- 전표정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Statement (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Stmt_Cd        IN RTRE5401.STMT_CD%TYPE           /*전표코드(R070)    */
    , Ref_Cursor       IN SYS_REFCURSOR                   /*Item금액정보      */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );

  /*****************************************************************************
    -- 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401CalcTotal (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
    -- 01.등록비-선수금인식 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-28  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc01 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
    -- 02.등록비-월 렌탈수익 인식 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-29  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc02 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
    -- 03.렌탈료 수익 인식 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-29  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc03 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
    -- 04.리스자산/ 감가상각비 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-29  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc04 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
    -- 05.선급비용 및 충당금 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-29  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc05 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
    -- 09.무상교체서비스 마감전표 정보생성
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2020-07-30  ITSM            [] 신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5401Calc09 (
      v_Zmonth         IN RTRE5401.ZMONTH%TYPE            /*마감년월          */
    , v_Reg_Id         IN RTRE5401.REG_ID%TYPE            /*작업자 ID         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );

END PKG_RTRE5401;
/
