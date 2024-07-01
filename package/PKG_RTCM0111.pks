CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0111 AS
/*******************************************************************************
    NAME        Pkg_Rtcm0111
    PURPOSE     렌탈마스터 정보 마스터
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
*******************************************************************************/
    
  /*****************************************************************************
  -- 렌탈마스터 정보 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0111 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Rnt_Mst_Id      IN RTCM0111.RNT_MST_ID%TYPE,
    v_Rnt_Mst_Nm      IN RTCM0111.RNT_MST_NM%TYPE,
    v_Use_Yn          IN RTCM0111.USE_YN%TYPE
    );
    
  /*****************************************************************************
  -- 렌탈마스터정보입력(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0111 (
      v_Comm_Dvsn                    IN CHAR                                        /*처리구분(I,U,D)      */
    , v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Rnt_Mst_Nm                   IN RTCM0111.RNT_MST_NM%TYPE                    /*렌탈마스터 이름             */
    , v_Mob_No                       IN RTCM0111.MOB_NO%TYPE                        /*렌탈마스터 휴대폰번호          */
    , v_Email_Addr                   IN RTCM0111.EMAIL_ADDR%TYPE                    /*렌탈마스터 EMAIL          */
    , v_Use_Yn                       IN RTCM0111.USE_YN%TYPE                        /*사용여부          */
    , v_Pi_Dstry_Yn                  IN RTCM0111.PI_DSTRY_YN%TYPE                   /*개인정보파기여부          */
    , v_Pi_Dstry_Id                  IN RTCM0111.PI_DSTRY_ID%TYPE                   /*개인정보파기자ID          */
    , v_Pi_Dstry_Dt                  IN RTCM0111.PI_DSTRY_DT%TYPE                   /*개인정보파기일자          */
    , v_Reg_Id                       IN RTCM0111.REG_ID%TYPE                        /*등록자 ID             */
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
  FUNCTION f_InsertRtcm0111 (
      v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Rnt_Mst_Nm                   IN RTCM0111.RNT_MST_NM%TYPE                    /*렌탈마스터 이름             */
    , v_Mob_No                       IN RTCM0111.MOB_NO%TYPE                        /*렌탈마스터 휴대폰번호          */
    , v_Email_Addr                   IN RTCM0111.EMAIL_ADDR%TYPE                    /*렌탈마스터 EMAIL          */
    , v_Use_Yn                       IN RTCM0111.USE_YN%TYPE                        /*사용여부          */
    , v_Pi_Dstry_Yn                  IN RTCM0111.PI_DSTRY_YN%TYPE                   /*개인정보파기여부          */
    , v_Pi_Dstry_Id                  IN RTCM0111.PI_DSTRY_ID%TYPE                   /*개인정보파기자ID          */
    , v_Pi_Dstry_Dt                  IN RTCM0111.PI_DSTRY_DT%TYPE                   /*개인정보파기일자          */
    , v_Reg_Id                       IN RTCM0111.REG_ID%TYPE                        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 렌탈마스터 정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0111 (
      v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Rnt_Mst_Nm                   IN RTCM0111.RNT_MST_NM%TYPE                    /*렌탈마스터 이름             */
    , v_Mob_No                       IN RTCM0111.MOB_NO%TYPE                        /*렌탈마스터 휴대폰번호          */
    , v_Email_Addr                   IN RTCM0111.EMAIL_ADDR%TYPE                    /*렌탈마스터 EMAIL          */
    , v_Use_Yn                       IN RTCM0111.USE_YN%TYPE                        /*사용여부          */
    , v_Pi_Dstry_Yn                  IN RTCM0111.PI_DSTRY_YN%TYPE                   /*개인정보파기여부          */
    , v_Pi_Dstry_Id                  IN RTCM0111.PI_DSTRY_ID%TYPE                   /*개인정보파기자ID          */
    , v_Pi_Dstry_Dt                  IN RTCM0111.PI_DSTRY_DT%TYPE                   /*개인정보파기일자          */
    , v_Reg_Id                       IN RTCM0111.REG_ID%TYPE                        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 렌탈마스터 휴대폰 번호
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_GetRMMobNo (
      v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
  ) RETURN VARCHAR;
  
END Pkg_Rtcm0111;
/