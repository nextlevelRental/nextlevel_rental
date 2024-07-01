CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0402 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0402
    PURPOSE     방문장착 이력정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-12-02  wjim            [20181122_01] Created this package spec.
*******************************************************************************/

  /*****************************************************************************
  -- 방문장착 이력정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-12-02  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0402 (
      v_Ord_No         IN RTSD0402.ORD_NO%TYPE        /*계약번호              */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 방문장착 이력정보 목록 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-12-02  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0402 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTSD0402.ORD_NO%TYPE        /*계약번호             */
  );
        
END Pkg_Rtsd0402;
/
