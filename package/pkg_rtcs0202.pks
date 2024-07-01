CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0202 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0202
   PURPOSE   [CS] 대리점 - 창고 연결정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-26  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] 대리점 - 창고 연결정보 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0202Count(
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,        /*대리점코드          */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE            /*창고연결순번        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 대리점 - 창고 연결정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0202 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*창고연결순번          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*업무종료일            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*창고코드              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- [CS] 대리점 - 창고 연결정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0202 (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*창고연결순번          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*업무종료일            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*창고코드              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 대리점 - 창고 연결정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0202 (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*창고연결순번          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*업무종료일            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*창고코드              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 대리점 - 창고 연결정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0202 (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*창고연결순번          */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 대리점 - 창고 연결정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0202 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*창고연결순번          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*업무종료일            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*창고코드              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 대리점 - 창고 내역 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0202AgencyWareh (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*창고코드              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );

  /*****************************************************************************
  -- [CS] 대리점 - 창고 조회
  *****************************************************************************/
  FUNCTION f_sRtcs0202Use_Yn (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*창고연결순번          */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*창고코드              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE          /*사용여부              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 대리점 - 창고 내역 조회(사용가능 창고)
  *****************************************************************************/
  PROCEDURE p_sRtcs0202UseAgencyWareh (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- [CS] 대리점 유효 창고 건수 COUNT (계약접수시)
  *****************************************************************************/
  FUNCTION f_sRtcs0202UseCntCheck (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE       /*대리점코드            */
    ) RETURN NUMBER;

END Pkg_Rtcs0202;
/
