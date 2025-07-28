CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0055 AS
/*******************************************************************************
   NAME      Pkg_Rtre0055
   PURPOSE   출금스케쥴 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2019-06-21  wjim             [20190620_01] 신규생성
*******************************************************************************/
  
  /*****************************************************************************
  -- 출금스케쥴 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0055 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , ps_Std_Ym        IN VARCHAR2                      /*기준월              */
    , ps_Req_Div       IN RTRE0055.REQ_DIV%TYPE         /*출금구분(R066)      */
    , ps_Use_Yn        IN RTRE0055.USE_YN%TYPE          /*사용여부            */
  );
  
  /*****************************************************************************
  -- 출금스케쥴 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0055 (
      ps_Req_Day         IN RTRE0055.REQ_DAY%TYPE       /*출금일자            */
    , ps_Req_Div         IN RTRE0055.REQ_DIV%TYPE       /*출금구분(R066)      */
    , ps_Use_Yn          IN RTRE0055.USE_YN%TYPE        /*사용여부            */
    , ps_Reg_Id          IN RTRE0055.REG_ID%TYPE        /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 출금스케쥴 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0055 (
      ps_Req_Day         IN RTRE0055.REQ_DAY%TYPE       /*출금일자            */
    , ps_Req_Div         IN RTRE0055.REQ_DIV%TYPE       /*출금구분(R066)      */
    , ps_Use_Yn          IN RTRE0055.USE_YN%TYPE        /*사용여부            */
    , ps_Reg_Id          IN RTRE0055.REG_ID%TYPE        /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 출금스케쥴 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0055 (
      ps_Req_Day         IN RTRE0055.REQ_DAY%TYPE       /*출금일자            */
    , ps_Reg_Id          IN RTRE0055.REG_ID%TYPE        /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 출금스케쥴 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0055 (
      ps_Comm_Dvsn       IN CHAR                        /*처리구분(I,U,D)     */
    , ps_Req_Day         IN RTRE0055.REQ_DAY%TYPE       /*출금일자            */
    , ps_Req_Div         IN RTRE0055.REQ_DIV%TYPE       /*출금구분(R066)      */
    , ps_Use_Yn          IN RTRE0055.USE_YN%TYPE        /*사용여부            */
    , ps_Reg_Id          IN RTRE0055.REG_ID%TYPE        /*등록자ID            */
    , rn_Success_Code   OUT NUMBER
    , rs_Return_Message OUT VARCHAR2
    , rs_ErrorText      OUT VARCHAR2
  );

  /*****************************************************************************
  -- 출금요청일 여부 확인
     - 기준일자가 출금요청일인지 확인
     > rs_Return_Cd : A(정기출금), B(수시출금), Z(출금요청일 아님)
     > rs_Req_Ymd : 출금일자
  *****************************************************************************/
  PROCEDURE p_chkRtre0055ReqDay (
      ps_Std_Ymd        IN RTRE0055.REQ_DAY%TYPE        /*기준일자            */
    , ps_Com_Div        IN RTRE0057.COM_DIV%TYPE        /*기관구분(R067)      */
    , rs_Return_Cd     OUT VARCHAR2
    , rs_Req_Ymd       OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 출금요청일인 경우 담당자에게 SMS로 알림
  *****************************************************************************/
  PROCEDURE p_notiRtre0055ReqDay (
      rn_Success_Code   OUT NUMBER
    , rs_Return_Message OUT VARCHAR2
    , rs_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 출금요청일인데 파일다운로드 되지 않은 경우 담당자에게 SMS로 알림
  *****************************************************************************/
  PROCEDURE p_notiRtre0055Filedown (
      rn_Success_Code   OUT NUMBER
    , rs_Return_Message OUT VARCHAR2
    , rs_ErrorText      OUT VARCHAR2
  );
    
END Pkg_Rtre0055;