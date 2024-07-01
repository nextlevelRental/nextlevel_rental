CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_CreatePKG AS
/*******************************************************************************
   NAME:      Pkg_CreatePKG
   PURPOSE:   기본  패키지생성
 
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- Package Spec Create
  *****************************************************************************/
  PROCEDURE p_CreateSpec(
    v_CreateType     IN  VARCHAR,                /*생성방법(S:Script, T:Table)*/
    v_Owner          IN  VARCHAR,                /*계정                       */
    v_TableName      IN  VARCHAR,                /*테이블명                   */
    v_DevId          IN  VARCHAR,                /*개발자ID                   */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2     
    );

  /*****************************************************************************
  --Package Bady Create
  *****************************************************************************/
  PROCEDURE p_CreateBady(
    v_CreateType     IN  VARCHAR,                /*생성방법(S:Script, T:Table)*/
    v_Owner          IN  VARCHAR,                /*계정                       */
    v_TableName      IN  VARCHAR,                /*테이블명                   */
    v_DevId          IN  VARCHAR,                /*개발자ID                   */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2     
    );
    
END Pkg_CreatePKG;
/
