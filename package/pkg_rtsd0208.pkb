CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0208 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0208
    PURPOSE     ��������� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-30  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��������� Select
  
     REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2019-07-30  kstka            1. Created this package body.
  *****************************************************************************/
  PROCEDURE p_sRTSD0208 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Std_Ym          IN RTSD0208.STD_YM%TYPE        /* ����             */
    , v_Res_Yn          IN RTSD0208.RES_YN%TYPE        /* ����             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT
        STD_YM
        ,ORD_NO
        ,RES_CD
        ,RES_YN
        ,FILE_NAME
        ,REG_DT        
    FROM RTSD0208
    WHERE 1=1
        AND STD_YM = v_Std_Ym
        AND RES_YN = DECODE(v_Res_Yn, NULL, RES_YN, v_Res_Yn)
        ORDER BY ORD_NO;

    v_Success_code   := 0;
    v_Return_Message := '������ȸ�Ǿ����ϴ�.';
    
  EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0208.p_sRTSD0208(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0208.p_sRTSD0208(2)', v_ErrorText, v_Return_Message);        

  END p_sRTSD0208; 

      
END Pkg_Rtsd0208;
/
