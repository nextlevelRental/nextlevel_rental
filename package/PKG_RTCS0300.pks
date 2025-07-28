CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0300 AS 
/*******************************************************************************
   NAME      Pkg_Rtcs0300
   PURPOSE   상담사 마스터 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-07-18  kstka           Created. [20230718_01]   
*******************************************************************************/
  
  /*****************************************************************************
  -- 상담사 마스터 정보 조회
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                             
  *****************************************************************************/
  PROCEDURE p_sRtcs0300 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_Id        IN RTCS0300.CALL_ID%TYPE,          /*상담사 ID                        */
    v_Provsn_Tp      IN RTCS0300.PROVSN_TP%TYPE,        /*소속그룹 P:가계약, H:홈쇼핑, R:재렌탈*/
    v_Holi_Yn        IN RTCS0300.HOLI_YN%TYPE,          /*휴무여부                        */
    v_Use_Yn         IN RTCS0300.USE_YN%TYPE            /*사용여부                        */
    );  
  
 /*****************************************************************************
  -- 상담사 등록 여부 확인
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                             
  *****************************************************************************/
  FUNCTION f_sRtcs0300Count (
    v_Call_Id        IN RTCS0300.CALL_ID%TYPE           /*상담사 ID                        */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 상담사 마스터 정보 INSERT
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                          
  *****************************************************************************/
  FUNCTION f_InsertRtcs0300 (
    v_Call_Id         IN RTCS0300.CALL_ID%TYPE,        /*상담사 ID         */
    v_Call_Nm         IN RTCS0300.CALL_NM%TYPE,        /*상담사명          */
    v_Provsn_Tp       IN RTCS0300.PROVSN_TP%TYPE,      /*상담사그룹        */
    v_Holi_Yn         IN RTCS0300.HOLI_YN%TYPE,        /*휴무여부          */
    v_Use_Yn          IN RTCS0300.USE_YN%TYPE,         /*사용여부          */
    v_Reg_Id          IN RTCS0300.REG_ID%TYPE,         /*등록자            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 상담사 마스터 정보 UPDATE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                  
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0300 (
     v_Call_Id         IN RTCS0300.CALL_ID%TYPE,        /*상담사 ID         */
    v_Call_Nm         IN RTCS0300.CALL_NM%TYPE,        /*상담사명          */
    v_Provsn_Tp       IN RTCS0300.PROVSN_TP%TYPE,      /*상담사그룹        */
    v_Holi_Yn         IN RTCS0300.HOLI_YN%TYPE,        /*휴무여부          */
    v_Use_Yn          IN RTCS0300.USE_YN%TYPE,         /*사용여부          */
    v_Reg_Id          IN RTCS0300.REG_ID%TYPE,         /*등록자            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 상담사 마스터 정보 (IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                                                                                         
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0300 (
    v_Comm_Dvsn       IN CHAR,                         /*1 처리구분(I,U,D)       */
    v_Call_Id         IN RTCS0300.CALL_ID%TYPE,       /*상담사 ID         */
    v_Call_Nm         IN RTCS0300.CALL_NM%TYPE,        /*상담사명          */
    v_Provsn_Tp       IN RTCS0300.PROVSN_TP%TYPE,      /*상담사그룹        */
    v_Holi_Yn         IN RTCS0300.HOLI_YN%TYPE,        /*휴무여부          */
    v_Use_Yn          IN RTCS0300.USE_YN%TYPE,         /*사용여부          */
    v_Reg_Id          IN RTCS0300.REG_ID%TYPE,         /*등록자            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
END Pkg_Rtcs0300;