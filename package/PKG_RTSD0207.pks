CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0207 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0207
   PURPOSE   SMS ���� ���� ��ȸ

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-09-22  jemcarry         1. Created this package body.
*******************************************************************************/
   
  /*****************************************************************************
  -- �������� SMS �߼۳��� Select
  *****************************************************************************/
  PROCEDURE p_sSmsCollectionList (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Close_Ym      IN VARCHAR2,                /*������             */
    v_Send_Tp       IN VARCHAR2                 /*�߼۱���           */
    );
    
END Pkg_Rtsd0207;
/