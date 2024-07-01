CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0410 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0410
    PURPOSE     �Ǹ��ο� ��Ż��

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- �Ǹ��ο� ��Ż�� Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0410 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Class_Cd        IN RTSD0410.CLASS_CD%TYPE        /*����             */
    , v_Cnt_Cd          IN RTSD0410.CNT_CD%TYPE          /*����             */
    , v_Period_Cd       IN RTSD0410.PERIOD_CD%TYPE       /*�Ⱓ             */
    , v_Grade_Cd        IN RTSD0410.GRADE_CD%TYPE        /*���             */
    , v_Inch            IN RTSD0410.INCH%TYPE            /*��ġ             */
  );
   
  /*****************************************************************************
  -- �Ǹ��ο� ��� Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0410GradeCd (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Class_Cd        IN RTSD0410.CLASS_CD%TYPE        /*����             */
  );
  
  /*****************************************************************************
  -- �Ǹ��ο� ��ġ Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0410Inch (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Class_Cd        IN RTSD0410.CLASS_CD%TYPE        /*����             */
  );
       
END Pkg_Rtsd0410;
/