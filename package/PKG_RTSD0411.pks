CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0411 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0412
    PURPOSE     �Ǹ��ο� ����ī�� ���αݾ�

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- �Ǹ��ο� ����ī�� ���αݾ� Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-08-24  kstka            [20210824_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0411 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Card_Cd         IN RTSD0411.CARD_CD%TYPE         /*ī���             */
  );
        
END Pkg_Rtsd0411;
/