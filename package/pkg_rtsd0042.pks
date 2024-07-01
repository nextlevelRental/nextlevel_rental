CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0042 AS 
/******************************************************************************* 
   NAME:      PKG_RTSD0042 
   PURPOSE    ����� �հ�޾� 
 
   REVISIONS 
   Ver        Date        Author           Description 
   ---------  ----------  ---------------  ------------------------------------- 
   1.0        2019-01-29  pc2288         1. Created this package body. 
*******************************************************************************/ 
 
 
  /***************************************************************************** 
  -- ����� �հ�޾� Select 
  *****************************************************************************/ 
  FUNCTION f_sRtsd0042GetSumPay ( 
    v_Sale_Cd       IN RTSD0042.SALE_CD%TYPE,          /*����ȣ              */ 
    v_Period_Cd     IN RTSD0042.PERIOD_CD%TYPE,          /*����ȣ              */ 
    v_Cnt_Cd        IN RTSD0042.CNT_CD%TYPE          /*����ȣ              */ 
    ) RETURN NUMBER; 
 
 
END PKG_RTSD0042;
/
