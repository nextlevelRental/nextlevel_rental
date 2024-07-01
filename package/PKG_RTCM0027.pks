CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0027 AS
/*******************************************************************************
   NAME:       Rtcm0027
   PURPOSE:    ���α׷�-���ѱ׷� �����̷� ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2021-10-29                   1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���α׷�-���ѱ׷� �����̷� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0027 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Prgm_Cd        IN RTCM0027.PRGM_CD%TYPE         /*���α׷��ڵ�          */
    , v_Auth_Grp_Cd    IN RTCM0027.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
  );
    
  /*****************************************************************************
  -- ���α׷�-���ѱ׷� �����̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0027(
      v_Prgm_Cd        IN RTCM0027.PRGM_CD%TYPE         /*���α׷��ڵ�          */
    , v_Auth_Grp_Cd    IN RTCM0027.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    , v_Comm_Dvsn      IN RTCM0027.COMM_DVSN%TYPE       /*ó������(I,U,D)       */
    , v_Reg_Id         IN RTCM0027.REG_ID%TYPE          /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
END Pkg_Rtcm0027;
/