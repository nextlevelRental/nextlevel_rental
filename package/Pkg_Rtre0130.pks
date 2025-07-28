CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0130 AS
/*******************************************************************************
   NAME      Pkg_Rtre0130
   PURPOSE   벤더정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-09-01  kstka             [20200901_01] 신규생성
*******************************************************************************/
  
  /*****************************************************************************
  -- 벤더정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0130 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , ps_Lifnr           IN RTRE0130.LIFNR%TYPE                   /*벤더코드              */
    , ps_Vndr_Nm     IN RTRE0130.VNDR_NM%TYPE             /*벤더명                */
    , ps_Agency_Cd   IN RTRE0130.AGENCY_CD%TYPE           /*대리점코드           */
  );
  
  /*****************************************************************************
  -- 벤더정보 존재여부 Select
  *****************************************************************************/
  FUNCTION f_SelectRtre0130 (
      ps_Lifnr             IN RTRE0130.LIFNR%TYPE               /*벤더코드            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 벤더 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0130 (
      ps_Lifnr             IN RTRE0130.LIFNR%TYPE               /*벤더코드            */
    , ps_Vndr_Nm       IN RTRE0130.VNDR_NM%TYPE         /*벤더명     */
    , ps_Tel_No          IN RTRE0130.TEL_NO%TYPE            /*전화번호            */
    , ps_Mob_No        IN RTRE0130.MOB_NO%TYPE          /*휴대폰번호            */
    , ps_Agency_Cd     IN RTRE0130.AGENCY_CD%TYPE       /*대리점코드            */
    , ps_Tax_Rqcd       IN RTRE0130.TAX_RQCD%TYPE        /*세금계산서발행방법            */
    , ps_Rnt_Ofc         IN RTRE0130.RNT_OFC%TYPE           /*등록자ID            */
    , ps_Rnt_Pnt         IN RTRE0130.RNT_PNT%TYPE           /*등록자ID            */
    , ps_Use_Yn          IN RTRE0130.USE_YN%TYPE             /*사용여부            */
    , ps_Pi_Dstry_Yn     IN RTRE0130.PI_DSTRY_YN%TYPE       /*등록자ID            */
    , ps_Pi_Dstry_Id     IN RTRE0130.PI_DSTRY_ID%TYPE        /*등록자ID            */
    , ps_Pi_Dstry_Dt     IN RTRE0130.PI_DSTRY_DT%TYPE        /*등록자ID            */
    , ps_Reg_Id          IN RTRE0130.REG_ID%TYPE            /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 벤더 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0130 (
      ps_Lifnr             IN RTRE0130.LIFNR%TYPE               /*벤더코드            */
    , ps_Vndr_Nm       IN RTRE0130.VNDR_NM%TYPE         /*벤더명     */
    , ps_Tel_No          IN RTRE0130.TEL_NO%TYPE            /*전화번호            */
    , ps_Mob_No        IN RTRE0130.MOB_NO%TYPE          /*휴대폰번호            */
    , ps_Agency_Cd     IN RTRE0130.AGENCY_CD%TYPE       /*대리점코드            */
    , ps_Tax_Rqcd       IN RTRE0130.TAX_RQCD%TYPE        /*세금계산서발행방법            */
    , ps_Rnt_Ofc         IN RTRE0130.RNT_OFC%TYPE           /*등록자ID            */
    , ps_Rnt_Pnt         IN RTRE0130.RNT_PNT%TYPE           /*등록자ID            */
    , ps_Use_Yn          IN RTRE0130.USE_YN%TYPE             /*사용여부            */
    , ps_Pi_Dstry_Yn     IN RTRE0130.PI_DSTRY_YN%TYPE       /*등록자ID            */
    , ps_Pi_Dstry_Id     IN RTRE0130.PI_DSTRY_ID%TYPE        /*등록자ID            */
    , ps_Pi_Dstry_Dt     IN RTRE0130.PI_DSTRY_DT%TYPE        /*등록자ID            */
    , ps_Reg_Id          IN RTRE0130.REG_ID%TYPE            /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 벤더 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0130 (
      ps_Lifnr             IN RTRE0130.LIFNR%TYPE       /*벤더코드            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 벤더 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0130 (
      ps_Comm_Dvsn       IN CHAR                        /*처리구분(I,U,D)     */
    , ps_Lifnr             IN RTRE0130.LIFNR%TYPE               /*벤더코드            */
    , ps_Vndr_Nm       IN RTRE0130.VNDR_NM%TYPE         /*벤더명     */
    , ps_Tel_No          IN RTRE0130.TEL_NO%TYPE            /*전화번호            */
    , ps_Mob_No        IN RTRE0130.MOB_NO%TYPE          /*휴대폰번호            */
    , ps_Agency_Cd     IN RTRE0130.AGENCY_CD%TYPE       /*대리점코드            */
    , ps_Tax_Rqcd       IN RTRE0130.TAX_RQCD%TYPE        /*세금계산서발행방법            */
    , ps_Rnt_Ofc         IN RTRE0130.RNT_OFC%TYPE           /*등록자ID            */
    , ps_Rnt_Pnt         IN RTRE0130.RNT_PNT%TYPE           /*등록자ID            */
    , ps_Use_Yn          IN RTRE0130.USE_YN%TYPE             /*사용여부            */
    , ps_Pi_Dstry_Yn     IN RTRE0130.PI_DSTRY_YN%TYPE       /*등록자ID            */
    , ps_Pi_Dstry_Id     IN RTRE0130.PI_DSTRY_ID%TYPE        /*등록자ID            */
    , ps_Pi_Dstry_Dt     IN RTRE0130.PI_DSTRY_DT%TYPE        /*등록자ID            */
    , ps_Reg_Id          IN RTRE0130.REG_ID%TYPE            /*등록자ID            */
    , rn_Success_Code   OUT NUMBER
    , rs_Return_Message OUT VARCHAR2
    , rs_ErrorText      OUT VARCHAR2
  );
    
END Pkg_Rtre0130;