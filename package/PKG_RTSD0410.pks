CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0410 AS
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
  );
   
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
  );
  
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
  );
       
END Pkg_Rtsd0410;
/