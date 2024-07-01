CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0410 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0410
    PURPOSE     판매인용 렌탈료

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- 판매인용 렌탈료 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0410 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Class_Cd        IN RTSD0410.CLASS_CD%TYPE        /*차종             */
    , v_Cnt_Cd          IN RTSD0410.CNT_CD%TYPE          /*수량             */
    , v_Period_Cd       IN RTSD0410.PERIOD_CD%TYPE       /*기간             */
    , v_Grade_Cd        IN RTSD0410.GRADE_CD%TYPE        /*등급             */
    , v_Inch            IN RTSD0410.INCH%TYPE            /*인치             */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  PRICE_CD
          , CLASS_CD
          , PERIOD_CD
          , CNT_CD
          , GRADE_CD
          , INCH
          , STR_DAY
          , END_DAY
          , AMT
          , USE_YN
      FROM  RTSD0410
     WHERE  1=1
       AND  CLASS_CD     = DECODE(v_Class_Cd, NULL, CLASS_CD, v_Class_Cd)
       AND  CNT_CD     = DECODE(v_Cnt_Cd, NULL, CNT_CD, v_Cnt_Cd)
       AND  PERIOD_CD     = DECODE(v_Period_Cd, NULL, PERIOD_CD, v_Period_Cd)
       AND  GRADE_CD     = DECODE(v_Grade_Cd, NULL, GRADE_CD, v_Grade_Cd)
       AND  INCH     = DECODE(v_Inch, NULL, INCH, v_Inch)
       AND  USE_YN  = 'Y'
       AND  TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN STR_DAY AND END_DAY
    ; 

  END p_sRTSD0410;
  
  /*****************************************************************************
  -- 판매인용 등급 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0410GradeCd (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Class_Cd        IN RTSD0410.CLASS_CD%TYPE        /*차종             */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.GRADE_CD AS ID
           ,B.CD_NM AS LABEL
      FROM  RTSD0410 A
           ,RTCM0051 B
     WHERE  1=1
       AND  A.GRADE_CD = B.CD
       AND  B.CD_GRP_CD = 'S306'
       AND  A.CLASS_CD = DECODE(v_Class_Cd, NULL, A.CLASS_CD, v_Class_Cd)
       AND  A.USE_YN  = 'Y'
       AND  TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN A.STR_DAY AND A.END_DAY
       GROUP BY A.GRADE_CD, B.CD_NM
       ORDER BY A.GRADE_CD
    ; 

  END p_sRTSD0410GradeCd;  
   
  /*****************************************************************************
  -- 판매인용 인치 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0410Inch (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Class_Cd        IN RTSD0410.CLASS_CD%TYPE        /*차종             */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.INCH AS ID
           ,A.INCH AS LABEL
      FROM  RTSD0410 A
     WHERE  1=1
       AND  A.CLASS_CD = DECODE(v_Class_Cd, NULL, A.CLASS_CD, v_Class_Cd)
       AND  A.USE_YN  = 'Y'
       AND  TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN A.STR_DAY AND A.END_DAY
       GROUP BY A.INCH
       ORDER BY A.INCH
    ; 

  END p_sRTSD0410Inch;  
       
END Pkg_Rtsd0410;
/