CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0042 AS 
/******************************************************************************* 
   NAME:      PKG_RTSD0042 
   PURPOSE    멤버쉽 합계급액 
 
   REVISIONS 
   Ver        Date        Author           Description 
   ---------  ----------  ---------------  ------------------------------------- 
   1.0        2019-01-29  pc2288         1. Created this package body. 
*******************************************************************************/ 
 
 
  /***************************************************************************** 
  -- 멤버쉽 합계급액 Select 
  *****************************************************************************/ 
  FUNCTION f_sRtsd0042GetSumPay ( 
    v_Sale_Cd       IN RTSD0042.SALE_CD%TYPE,          /*계약번호              */ 
    v_Period_Cd     IN RTSD0042.PERIOD_CD%TYPE,          /*계약번호              */ 
    v_Cnt_Cd        IN RTSD0042.CNT_CD%TYPE          /*계약번호              */ 
    ) RETURN NUMBER; 
 
 
END PKG_RTSD0042;
/
