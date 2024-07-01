CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0016 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0016
   PURPOSE   단종대체규격마스터

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-05-29  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 단종 대체규격 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0016RepMatCd(
    v_Mat_Cd       IN VARCHAR2,            /*신청규격        */
    v_Req_Day      IN VARCHAR2             /*신청일자        */
    ) RETURN VARCHAR2 IS
    
    v_rep_mat_cd VARCHAR2(18);
  BEGIN
    
    SELECT  REP_MAT_CD
    INTO    v_rep_mat_cd
    FROM    RTSD0016
    WHERE   MAT_CD = v_Mat_Cd
    AND     DECODE(v_Req_Day, NULL, TO_CHAR(SYSDATE, 'YYYYMMDD'), v_Req_Day) BETWEEN STR_DAY AND END_DAY
    AND     USE_YN = 'Y';

    RETURN v_rep_mat_cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;
        
  END f_sRtsd0016RepMatCd;

END Pkg_Rtsd0016;
/
