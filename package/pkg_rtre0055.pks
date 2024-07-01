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
/
