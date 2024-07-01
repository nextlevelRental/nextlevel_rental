CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0206 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0206
   PURPOSE   [CS] 로디안 지역변경 작업

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-07-01  K.S.T.           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] 로디안 지역변경 업로드
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0206 (
    v_Comm_Dvsn      IN CHAR,                                   /*처리구분(I,U,D)   */
    v_Std_Ym           IN RTCS0206.STD_YM%TYPE,          /*처리년월              */
    v_Ord_No           IN RTCS0206.ORD_NO%TYPE,         /*계약번호              */
    v_Mr_Cd_Org       IN RTCS0206.MR_CD_ORG%TYPE,    /*구_로디안            */
    v_Mr_Cd_New       IN RTCS0206.MR_CD_NEW%TYPE,   /*신_로디안            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );        
       
    /*****************************************************************************
  -- [CS] 로디안 지역변경 반영
  *****************************************************************************/
  PROCEDURE p_ProcessRtcs0005 (
    v_Reg_Id            IN VARCHAR2,   /*사용자 ID            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
     
END Pkg_Rtcs0206;
/
