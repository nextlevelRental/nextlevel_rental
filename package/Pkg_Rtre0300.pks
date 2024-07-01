CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_RTRE0300 AS
/*******************************************************************************
   NAME      Pkg_RTRE0300
   PURPOSE   벤더정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-09-01  kstka             [20200901_01] 신규생성
*******************************************************************************/
  
  /*****************************************************************************
  -- 수수료 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0300 (
      slcm_ym           IN RTRE0300.SLCM_YM%TYPE  
    , lifnr             IN RTRE0300.LIFNR%TYPE                  /*벤더코드            */
    , comm_Tamt         IN RTRE0300.COMM_TAMT%TYPE              /*벤더명     */
    , comm_Namt         IN RTRE0300.COMM_NAMT%TYPE              /*전화번호            */
    , comm_Vamt         IN RTRE0300.COMM_VAMT%TYPE              /*휴대폰번호            */
    , slip_No           IN RTRE0300.SLIP_NO%TYPE                /*대리점코드            */
    , vndr_Nm           IN RTRE0300.VNDR_NM%TYPE                /*세금계산서발행방법            */
    , vndr_Mob_No       IN RTRE0300.VNDR_MOB_NO%TYPE            /*등록자ID            */
    , agency_Cd         IN RTRE0300.AGENCY_CD%TYPE              /*등록자ID            */
    , tax_Rqcd          IN RTRE0300.TAX_RQCD%TYPE               /*사용여부            */
    , rnt_Ofc           IN RTRE0300.RNT_OFC%TYPE                /*등록자ID            */
    , rnt_Pnt           IN RTRE0300.RNT_PNT%TYPE                /*등록자ID            */
    , rnt_Mst_Id        IN RTRE0300.RNT_MST_ID%TYPE             /*등록자ID            */
    , mst_Mob_No        IN RTRE0300.MST_MOB_NO%TYPE             /*등록자ID            */
    , mst_Email         IN RTRE0300.MST_EMAIL%TYPE              /*등록자ID            */
    , sms_Yn            IN RTRE0300.SMS_YN%TYPE                 /*등록자ID            */
    , sms_Dt            IN RTRE0300.SMS_DT%TYPE                 /*등록자ID            */
    , pi_Dstry_Yn       IN RTRE0300.PI_DSTRY_YN%TYPE            /*등록자ID            */
    , pi_Dstry_Id       IN RTRE0300.PI_DSTRY_ID%TYPE            /*등록자ID            */
    , pi_Dstry_Dt       IN RTRE0300.PI_DSTRY_DT%TYPE            /*등록자ID            */
    , reg_Id            IN RTRE0300.REG_ID%TYPE                 /*등록자ID            */
    , v_ErrorText       OUT VARCHAR2
  ) RETURN NUMBER;
   
  /*****************************************************************************
  -- 수수료 정보 Update
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0300 (
      slcm_ym           IN RTRE0300.SLCM_YM%TYPE  
    , reg_Id            IN RTRE0300.REG_ID%TYPE                 /*등록자ID            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 수수료 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTRE0300 (
      dvsn              IN CHAR                                 /*처리구분(I,U,D)     */
    , slcm_ym           IN RTRE0300.SLCM_YM%TYPE  
    , lifnr             IN RTRE0300.LIFNR%TYPE                  /*벤더코드            */
    , comm_Tamt         IN RTRE0300.COMM_TAMT%TYPE              /*벤더명     */
    , comm_Namt         IN RTRE0300.COMM_NAMT%TYPE              /*전화번호            */
    , comm_Vamt         IN RTRE0300.COMM_VAMT%TYPE              /*휴대폰번호            */
    , slip_No           IN RTRE0300.SLIP_NO%TYPE                /*대리점코드            */
    , vndr_Nm           IN RTRE0300.VNDR_NM%TYPE                /*세금계산서발행방법            */
    , vndr_Mob_No       IN RTRE0300.VNDR_MOB_NO%TYPE            /*등록자ID            */
    , agency_Cd         IN RTRE0300.AGENCY_CD%TYPE              /*등록자ID            */
    , tax_Rqcd          IN RTRE0300.TAX_RQCD%TYPE               /*사용여부            */
    , rnt_Ofc           IN RTRE0300.RNT_OFC%TYPE                /*등록자ID            */
    , rnt_Pnt           IN RTRE0300.RNT_PNT%TYPE                /*등록자ID            */
    , rnt_Mst_Id        IN RTRE0300.RNT_MST_ID%TYPE             /*등록자ID            */
    , mst_Mob_No        IN RTRE0300.MST_MOB_NO%TYPE             /*등록자ID            */
    , mst_Email         IN RTRE0300.MST_EMAIL%TYPE              /*등록자ID            */
    , sms_Yn            IN RTRE0300.SMS_YN%TYPE                 /*등록자ID            */
    , sms_Dt            IN RTRE0300.SMS_DT%TYPE                 /*등록자ID            */
    , pi_Dstry_Yn       IN RTRE0300.PI_DSTRY_YN%TYPE            /*등록자ID            */
    , pi_Dstry_Id       IN RTRE0300.PI_DSTRY_ID%TYPE            /*등록자ID            */
    , pi_Dstry_Dt       IN RTRE0300.PI_DSTRY_DT%TYPE            /*등록자ID            */
    , reg_Id            IN RTRE0300.REG_ID%TYPE                 /*등록자ID            */
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 수수료 정보 Update
  *****************************************************************************/
  PROCEDURE p_ChargeSendSms (
      v_Slcm_ym         IN RTRE0300.SLCM_YM%TYPE  
    , reg_Id            IN RTRE0300.REG_ID%TYPE                 /*등록자ID            */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
END Pkg_RTRE0300;
/