CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_CreatePKG AS
/*******************************************************************************
   NAME:      Pkg_CreatePKG
   PURPOSE:   �⺻  ��Ű������
 
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- Package Spec Create
  *****************************************************************************/
  PROCEDURE p_CreateSpec(
    v_CreateType     IN  VARCHAR,                /*�������(S:Script, T:Table)*/
    v_Owner          IN  VARCHAR,                /*����                       */
    v_TableName      IN  VARCHAR,                /*���̺��                   */
    v_DevId          IN  VARCHAR,                /*������ID                   */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2     
    );

  /*****************************************************************************
  --Package Bady Create
  *****************************************************************************/
  PROCEDURE p_CreateBady(
    v_CreateType     IN  VARCHAR,                /*�������(S:Script, T:Table)*/
    v_Owner          IN  VARCHAR,                /*����                       */
    v_TableName      IN  VARCHAR,                /*���̺��                   */
    v_DevId          IN  VARCHAR,                /*������ID                   */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2     
    );
    
END Pkg_CreatePKG;
/
