CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0200 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0200
   PURPOSE   [CS] 창고 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-26  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] 창고 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0200Count(
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE          /*창고코드            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 창고 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*업무종료일            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*우편번호 PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*상세주소              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전호번호              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*팩스번호              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- [CS] 창고 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*업무종료일            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*우편번호 PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*상세주소              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전호번호              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*팩스번호              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 창고 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*업무종료일            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*우편번호 PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*상세주소              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전호번호              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*팩스번호              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 창고 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 창고 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0200 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*업무개시일            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*업무종료일            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*우편번호 PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*우편번호              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*주소                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*상세주소              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전호번호              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*팩스번호              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 창고 내역 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0200WareHouse (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*창고코드              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*창고명                */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*전호번호              */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*사용여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- [CS] 창고 마스터 명칭 조회
  *****************************************************************************/
  FUNCTION f_sRtcs0200WarehNm(
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE          /*창고코드            */
    ) RETURN VARCHAR;

END Pkg_Rtcs0200;
/
