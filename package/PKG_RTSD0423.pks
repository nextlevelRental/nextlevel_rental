CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0423 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0423
    PURPOSE     스마트택배 택배사 마스터
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-04  kstka            [20220704_01] Created this package spec.
*******************************************************************************/
   
  /*****************************************************************************
  -- 택배사코드 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0423Count(
    v_Logistics_Cd IN  RTSD0423.LOGISTICS_CD%TYPE            /*택배사코드        */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  --택배사코드명
  *****************************************************************************/
  FUNCTION f_sRtsd0423Code(
      v_Logistics_Nm             IN RTSD0423.LOGISTICS_NM%TYPE                  /*택배사명              */
    ) RETURN VARCHAR;
  
  /*****************************************************************************
  --택배사코드명
  *****************************************************************************/
  FUNCTION f_sRtsd0423CodeName(
      v_Logistics_Cd             IN RTSD0423.LOGISTICS_CD%TYPE                  /*택배사명              */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- 택배사정보입력(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-04  kstka            [20220704_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0423 (
      v_Comm_Dvsn                    IN CHAR                                        /*처리구분(I,U,D)      */
    , v_Logistics_Cd                 IN RTSD0423.LOGISTICS_CD%TYPE                  /*택배사코드           */
    , v_Logistics_Nm                 IN RTSD0423.LOGISTICS_NM%TYPE                  /*택배사명             */
    , v_Logistics_International      IN RTSD0423.LOGISTICS_INTERNATIONAL%TYPE       /*국제택배여부          */
    , v_Reg_Id          IN RTSD0423.REG_ID%TYPE                  /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
   
  /*****************************************************************************
  -- 택배사정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-01  kstka            [20220701_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0423 (
      v_Logistics_Cd                 IN RTSD0423.LOGISTICS_CD%TYPE                  /*택배사코드           */
    , v_Logistics_Nm                 IN RTSD0423.LOGISTICS_NM%TYPE                  /*택배사명             */
    , v_Logistics_International      IN RTSD0423.LOGISTICS_INTERNATIONAL%TYPE       /*국제택배여부          */
    , v_Reg_Id          IN RTSD0423.REG_ID%TYPE                  /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 택배사정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-04  kstka            [20220704_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0423 (
      v_Logistics_Cd                 IN RTSD0423.LOGISTICS_CD%TYPE                  /*택배사코드           */
    , v_Logistics_Nm                 IN RTSD0423.LOGISTICS_NM%TYPE                  /*택배사명             */
    , v_Logistics_International      IN RTSD0423.LOGISTICS_INTERNATIONAL%TYPE       /*국제택배여부          */
    , v_Reg_Id          IN RTSD0423.REG_ID%TYPE                 /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
     
END Pkg_Rtsd0423;
/