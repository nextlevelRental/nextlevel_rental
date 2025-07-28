CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0411 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0410
    PURPOSE     판매인용 제휴카드 할인금액

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- 판매인용 제휴카드 할인금액 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0411 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Card_Cd         IN RTSD0411.CARD_CD%TYPE         /*카드사             */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  CARD_CD
          , SEQ
          , GRADE_NM
          , STR_DAY
          , END_DAY
          , AMT
          , USE_YN
      FROM  RTSD0411
     WHERE  1=1
       AND  CARD_CD     = DECODE(v_Card_Cd, NULL, CARD_CD, v_Card_Cd)
       AND  USE_YN  = 'Y'
       AND  TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN STR_DAY AND END_DAY
    ; 

  END p_sRTSD0411; 
        
END Pkg_Rtsd0411;