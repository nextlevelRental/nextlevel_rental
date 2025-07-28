CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0400 AS
/*******************************************************************************
    NAME        Pkg_Rtre0400
    PURPOSE     채권매각대상
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-08-08  kstka            [20220808_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- 채권매각대상 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-08-08  kstka            [20220808_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTRE0400 (
      Ref_Cursor           IN OUT SYS_REFCURSOR
    , v_Ord_No             IN RTRE0400.ORD_NO%TYPE           /*주문번호             */
    , v_Cust_No            IN RTRE0400.CUST_NO%TYPE          /*고객번호             */
    , v_Sale_Cnt           IN RTRE0400.SALE_CNT%TYPE         /*매각회차             */
  );
        
END Pkg_Rtre0400;