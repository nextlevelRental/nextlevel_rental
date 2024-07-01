CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0042 AS 
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
    ) RETURN NUMBER IS 
    v_amt NUMBER DEFAULT 0; 
  
    BEGIN 
 
    SELECT T.AMT 
    INTO   v_amt 
        FROM RTSD0042 T  
        WHERE T.SALE_CD = DECODE( v_Sale_Cd , NULL, T.SALE_CD , v_Sale_Cd) 
          AND T.PERIOD_CD = DECODE( v_Period_Cd , NULL, T.PERIOD_CD , v_Period_Cd) 
          AND T.CNT_CD = DECODE( v_Cnt_Cd , NULL, T.CNT_CD , v_Cnt_Cd);   
           
    RETURN v_amt; 
 
    EXCEPTION 
      WHEN OTHERS THEN 
        RETURN 0;

  END f_sRtsd0042GetSumPay;
  
  
END Pkg_Rtsd0042;
/
