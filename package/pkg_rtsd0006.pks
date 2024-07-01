CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0006 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0006
   PURPOSE   우편번호 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 우편번호 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0006Count(
    v_Ser_No         IN RTSD0006.SER_NO%TYPE            /*일련번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 우편번호 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0006 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*우편번호              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*시도                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*군,구                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*동                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*번지                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 우편번호 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0006 (
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*우편번호              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*시도                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*군,구                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*동                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*번지                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 우편번호 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0006 (
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*우편번호              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*시도                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*군,구                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*동                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*번지                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 우편번호 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0006 (
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 우편번호 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0006 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*일련번호              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*우편번호              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*시도                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*군,구                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*동                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*번지                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtsd0006;
/
