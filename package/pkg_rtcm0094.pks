CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0094 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0094
   PURPOSE   ���ν��� ���� �α� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ν��� ���� �α� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0094Count(
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,           /*�α׼���            */
    v_Pseq           IN RTCM0094.PSEQ%TYPE              /*�Ű����� ����       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν��� ���� �α� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0094 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE          /*�α׼���              */
    );
    
  /*****************************************************************************
  -- ���ν��� ���� �α� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*�α׼���              */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*�Ű����� ��           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*�Ű����� ��           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���ν��� ���� �α� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*�α׼���              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*�Ű����� ����         */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*�Ű����� ��           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*�Ű����� ��           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ν��� ���� �α� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0094 (
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*�α׼���              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*�Ű����� ����         */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���ν��� ���� �α� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0094 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Logseq         IN RTCM0094.LOGSEQ%TYPE,         /*�α׼���              */
    v_Pseq           IN RTCM0094.PSEQ%TYPE,           /*�Ű����� ����         */
    v_Par_Nm         IN RTCM0094.PAR_NM%TYPE,         /*�Ű����� ��           */
    v_Par_Value      IN RTCM0094.PAR_VALUE%TYPE,      /*�Ű����� ��           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtcm0094;
/
