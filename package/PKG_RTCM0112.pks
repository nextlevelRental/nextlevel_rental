CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0112 AS
/*******************************************************************************
    NAME        Pkg_Rtcm0112
    PURPOSE     렌탈마스터 정보 마스터
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
*******************************************************************************/
    
  /*****************************************************************************
  -- 렌탈-대리점 정보 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0112 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Rnt_Mst_Id      IN RTCM0112.RNT_MST_ID%TYPE
    );
    
  /*****************************************************************************
  -- 렌탈마스터정보입력(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0112 (
      v_Comm_Dvsn                    IN CHAR                                        /*처리구분(I,U,D)      */
    , v_Rnt_Mst_Id                   IN RTCM0112.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Agency_Cd                    IN RTCM0112.AGENCY_CD%TYPE                     /*대리점코드             */
    , v_Reg_Id                       IN RTCM0112.REG_ID%TYPE                        /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
   
  /*****************************************************************************
  -- 렌탈마스터정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtcm0112 (
      v_Rnt_Mst_Id                   IN RTCM0112.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Agency_Cd                    IN RTCM0112.AGENCY_CD%TYPE                     /*대리점코드             */
    , v_Reg_Id                       IN RTCM0112.REG_ID%TYPE                        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 렌탈마스터 정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0112 (
      v_Rnt_Mst_Id                   IN RTCM0112.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Agency_Cd                    IN RTCM0112.AGENCY_CD%TYPE                     /*대리점코드             */
    , v_Reg_Id                       IN RTCM0112.REG_ID%TYPE                        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 렌탈지사 관리(DELETE)
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0112 (
    v_Rnt_Mst_Id     IN RTCM0112.RNT_MST_ID%TYPE,
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
        
END Pkg_Rtcm0112;
/