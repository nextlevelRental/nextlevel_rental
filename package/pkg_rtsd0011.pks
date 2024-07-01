CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0011 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0011
   PURPOSE   프리미엄서비스 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
   1.1        2018-02-19  wjim             [20180212_01] 선택형 프리미엄 서비스 도입 
*******************************************************************************/

  /*****************************************************************************
  -- 프리미엄서비스 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0011Count(
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,            /*프리미엄서비스      */
    v_Seq            IN RTSD0011.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프리미엄서비스 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0011 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*순번                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 프리미엄서비스 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0011 (
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*순번                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프리미엄서비스 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0011 (
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*순번                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프리미엄서비스 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0011 (
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프리미엄서비스 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0011 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*순번                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*가격적용 시작일       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*가격적용 완료일       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*계절구분              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 프리미엄서비스팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0011_preminumPopup (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_applyDate          IN RTSD0011.STR_DAY%TYPE,              /*적용일자          */
      v_cnt                IN RTSD0012.CNT_CD%TYPE,              /*타이어갯수         */
      v_season            IN RTSD0011.SEASON_CD%TYPE,            /*계절용           */
      v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE          /*기간코드        */
  );
  
  /*****************************************************************************
  -- 선택형 프리미엄 서비스 팝업 조회
  -- 1) 일자구분 
      - ALL(전체), TODAY(오늘), IN(적용일자)
      
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-02-19  wjim             [20180212_01] 신규 개발 
  *****************************************************************************/
  PROCEDURE p_sRtsd0011_masterChoicePopup (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_dayTp           IN VARCHAR2                     /*일자구분            */
    , v_applyDate       IN RTSD0011.STR_DAY%TYPE        /*적용일자            */
    , v_ordId           IN RTSD0011.ORD_ID%TYPE         /*주문구분(S029)      */
    , v_chanCd          IN RTSD0011.CHAN_CD%TYPE        /*채널구분(S030)      */
    , v_Season_Cd       IN RTSD0011.SEASON_CD%TYPE      /*계절구분(S014)      */
  );

END Pkg_Rtsd0011;
/
