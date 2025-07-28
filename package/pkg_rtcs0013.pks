CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0013 AS
/*******************************************************************************
    NAME        Pkg_Rtcs0013
    PURPOSE     방문점검 거부철회 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-26  wjim            [20170726_01] 신규개발
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검 거부철회정보 조회
  *****************************************************************************/
  PROCEDURE p_sRTCS0013 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTCS0013.ORD_NO%TYPE           /* 계약번호         */
  );
  
  /*****************************************************************************
  -- 방문점검 거부등록
  *****************************************************************************/
  PROCEDURE p_SaveRtcs0013Deny (
      v_Ord_No          IN RTCS0013.ORD_NO%TYPE            /* 계약번호        */
    , v_Equ_No          IN RTCS0013.EQU_NO%TYPE            /* 설비번호        */
    , v_Deny_Std_Ym     IN RTCS0013.DENY_STD_YM%TYPE       /* 거부기준년월    */       
    , v_Deny_Desc       IN RTCS0013.DENY_DESC%TYPE         /* 거부내용        */
    , v_Reg_Id          IN RTCS0013.REG_ID%TYPE            /* 등록자ID        */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 방문점검 철회등록
  *****************************************************************************/
  PROCEDURE p_SaveRtcs0013Withdraw (
      v_Ord_No          IN RTCS0013.ORD_NO%TYPE            /* 계약번호        */
    , v_Equ_No          IN RTCS0013.EQU_NO%TYPE            /* 설비번호        */
    , v_Deny_Seq        IN RTCS0013.DENY_SEQ%TYPE          /* 거부순번        */
    , v_Wthdrw_Std_Ym   IN RTCS0013.WTHDRW_STD_YM%TYPE     /* 철회기준년월    */       
    , v_Wthdrw_Desc     IN RTCS0013.WTHDRW_DESC%TYPE       /* 철회내용        */
    , v_Reg_Id          IN RTCS0013.REG_ID%TYPE            /* 등록자ID        */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
        
END Pkg_Rtcs0013;