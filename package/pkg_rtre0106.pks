CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0106 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0105
   PURPOSE   당월연체SMS발송

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-06-16  kstka         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- SMS발송대상 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0106 (
    Ref_Cursor       IN OUT SYS_REFCURSOR
    );

  /*****************************************************************************
  -- SMS발송대상  Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0106 (
    v_Send_Cnt      IN NUMBER,
    v_Send_Term    IN NUMBER,
    v_Send_Start     IN NUMBER,
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SMS발송대상 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0106(
    v_ErrorText      OUT VARCHAR2
  )  RETURN NUMBER;
  
   /*****************************************************************************
  -- SMS발송대상 집계
  *****************************************************************************/
  PROCEDURE p_ProcessRtre0106 (
    v_Send_Cnt          IN NUMBER,
    v_Send_Term        IN NUMBER,
    v_Send_Start         IN NUMBER,
    v_Success_code    OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 당월연체대상 SMS발송
  *****************************************************************************/
  PROCEDURE p_SendSmsRtre0106 (
    v_Reg_Id              IN VARCHAR2,
    v_Success_code    OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
          
END Pkg_Rtre0106;
/
