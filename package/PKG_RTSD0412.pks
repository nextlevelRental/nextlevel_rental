CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0412 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0412
    PURPOSE     판매인용 서비스 금액
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- 판매인용 서비스 금액 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0412 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Service_Cd         IN RTSD0412.SERVICE_CD%TYPE         /*서비스             */
    , v_Period_Cd          IN RTSD0412.PERIOD_CD%TYPE          /*기간             */
    , v_Appr_Cnt           IN RTSD0412.APPR_CNT%TYPE           /*횟수            */
  );
        
END Pkg_Rtsd0412;
/