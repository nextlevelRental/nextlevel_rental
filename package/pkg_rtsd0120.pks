CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0120 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0120
   PURPOSE   판매인 정보 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-16  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 판매인 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0120Count(
    v_Ord_Agent      IN RTSD0120.ORD_AGENT%TYPE,        /*판매인번호          */
    v_Seq            IN RTSD0120.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 판매인 정보 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0120 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0120.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Seq            IN RTSD0120.SEQ%TYPE             /*순번                  */
    );

  /*****************************************************************************
  -- 판매인 정보 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0120 (
    v_Ord_Agent      IN RTSD0120.ORD_AGENT%TYPE,      /*판매인번호            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtsd0120;