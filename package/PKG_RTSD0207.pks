CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0207 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0207
   PURPOSE   SMS 집계 내역 조회

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-09-22  jemcarry         1. Created this package body.
*******************************************************************************/
   
  /*****************************************************************************
  -- 월마감시 SMS 발송내역 Select
  *****************************************************************************/
  PROCEDURE p_sSmsCollectionList (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Close_Ym      IN VARCHAR2,                /*마감월             */
    v_Send_Tp       IN VARCHAR2                 /*발송구분           */
    );
    
END Pkg_Rtsd0207;
/