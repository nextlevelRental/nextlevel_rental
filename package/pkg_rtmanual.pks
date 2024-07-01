CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTMANUAL AS
/*******************************************************************************
    NAME        PKG_RTMANUAL
    PURPOSE     수기처리 모음

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
*******************************************************************************/

  /*****************************************************************************
  -- 홈쇼핑 가계약 일괄 업로드
  *****************************************************************************/
  PROCEDURE p_UpHshopProvsn_OLD (
      v_Hshop_Tp       IN RTSD0121.HSHOP_TP%TYPE   /* 홈쇼핑구분 [S096]       */
    , v_Provsn_Day     IN RTSD0121.PROVSN_DAY%TYPE /* 업로드일자 (YYYYMMDD)   */
    , v_Air_Day        IN RTSD0121.AIR_DAY%TYPE    /* 방송일자 (YYYYMMDD)     */
    , v_Air_Tm         IN RTSD0121.AIR_TM%TYPE     /* 방송시간 (HH24MI)       */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE     /* 등록자ID                */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 홈쇼핑 가계약 일괄 업로드 (NEW)
  *****************************************************************************/
  PROCEDURE p_UpHshopProvsn (
      v_Hshop_Tp       IN RTSD0121.HSHOP_TP%TYPE   /* 홈쇼핑구분 [S096]       */
    , v_Provsn_Day     IN RTSD0121.PROVSN_DAY%TYPE /* 업로드일자 (YYYYMMDD)   */
    , v_Air_Day        IN RTSD0121.AIR_DAY%TYPE    /* 방송일자 (YYYYMMDD)     */
    , v_Air_Tm         IN RTSD0121.AIR_TM%TYPE     /* 방송시간 (HH24MI)       */
    , v_Reg_Id         IN RTSD0121.REG_ID%TYPE     /* 등록자ID                */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
        
END PKG_RTMANUAL;
/
