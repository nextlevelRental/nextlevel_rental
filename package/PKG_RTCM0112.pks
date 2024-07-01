CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0112 AS
/*******************************************************************************
    NAME        Pkg_Rtcm0112
    PURPOSE     ��Ż������ ���� ������
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
*******************************************************************************/
    
  /*****************************************************************************
  -- ��Ż-�븮�� ���� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0112 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Rnt_Mst_Id      IN RTCM0112.RNT_MST_ID%TYPE
    );
    
  /*****************************************************************************
  -- ��Ż�����������Է�(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0112 (
      v_Comm_Dvsn                    IN CHAR                                        /*ó������(I,U,D)      */
    , v_Rnt_Mst_Id                   IN RTCM0112.RNT_MST_ID%TYPE                    /*��Ż������ ���           */
    , v_Agency_Cd                    IN RTCM0112.AGENCY_CD%TYPE                     /*�븮���ڵ�             */
    , v_Reg_Id                       IN RTCM0112.REG_ID%TYPE                        /*����� ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
   
  /*****************************************************************************
  -- ��Ż���������� Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtcm0112 (
      v_Rnt_Mst_Id                   IN RTCM0112.RNT_MST_ID%TYPE                    /*��Ż������ ���           */
    , v_Agency_Cd                    IN RTCM0112.AGENCY_CD%TYPE                     /*�븮���ڵ�             */
    , v_Reg_Id                       IN RTCM0112.REG_ID%TYPE                        /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ��Ż������ ���� Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0112 (
      v_Rnt_Mst_Id                   IN RTCM0112.RNT_MST_ID%TYPE                    /*��Ż������ ���           */
    , v_Agency_Cd                    IN RTCM0112.AGENCY_CD%TYPE                     /*�븮���ڵ�             */
    , v_Reg_Id                       IN RTCM0112.REG_ID%TYPE                        /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ��Ż���� ����(DELETE)
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0112 (
    v_Rnt_Mst_Id     IN RTCM0112.RNT_MST_ID%TYPE,
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
        
END Pkg_Rtcm0112;
/