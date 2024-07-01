CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0208 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0208
    PURPOSE     �緹Ż ��������� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2019-07-31  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  --�緻Ż ��������� Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2019-07-31  kstka            1. Created this package body.
  *****************************************************************************/
  PROCEDURE p_sRTSD0208 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Std_Ym          IN RTSD0208.STD_YM%TYPE        /* ����             */
    , v_Res_Yn          IN RTSD0208.RES_YN%TYPE        /* ����             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
END Pkg_Rtsd0208;
/
