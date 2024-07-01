CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0423 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0423
    PURPOSE     ����Ʈ�ù� �ù�� ������
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-04  kstka            [20220704_01] Created this package spec.
*******************************************************************************/
   
  /*****************************************************************************
  -- �ù���ڵ� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0423Count(
    v_Logistics_Cd IN  RTSD0423.LOGISTICS_CD%TYPE            /*�ù���ڵ�        */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  --�ù���ڵ��
  *****************************************************************************/
  FUNCTION f_sRtsd0423Code(
      v_Logistics_Nm             IN RTSD0423.LOGISTICS_NM%TYPE                  /*�ù���              */
    ) RETURN VARCHAR;
  
  /*****************************************************************************
  --�ù���ڵ��
  *****************************************************************************/
  FUNCTION f_sRtsd0423CodeName(
      v_Logistics_Cd             IN RTSD0423.LOGISTICS_CD%TYPE                  /*�ù���              */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- �ù�������Է�(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-04  kstka            [20220704_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0423 (
      v_Comm_Dvsn                    IN CHAR                                        /*ó������(I,U,D)      */
    , v_Logistics_Cd                 IN RTSD0423.LOGISTICS_CD%TYPE                  /*�ù���ڵ�           */
    , v_Logistics_Nm                 IN RTSD0423.LOGISTICS_NM%TYPE                  /*�ù���             */
    , v_Logistics_International      IN RTSD0423.LOGISTICS_INTERNATIONAL%TYPE       /*�����ù迩��          */
    , v_Reg_Id          IN RTSD0423.REG_ID%TYPE                  /*����� ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
   
  /*****************************************************************************
  -- �ù������ Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-01  kstka            [20220701_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0423 (
      v_Logistics_Cd                 IN RTSD0423.LOGISTICS_CD%TYPE                  /*�ù���ڵ�           */
    , v_Logistics_Nm                 IN RTSD0423.LOGISTICS_NM%TYPE                  /*�ù���             */
    , v_Logistics_International      IN RTSD0423.LOGISTICS_INTERNATIONAL%TYPE       /*�����ù迩��          */
    , v_Reg_Id          IN RTSD0423.REG_ID%TYPE                  /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �ù������ Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-07-04  kstka            [20220704_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0423 (
      v_Logistics_Cd                 IN RTSD0423.LOGISTICS_CD%TYPE                  /*�ù���ڵ�           */
    , v_Logistics_Nm                 IN RTSD0423.LOGISTICS_NM%TYPE                  /*�ù���             */
    , v_Logistics_International      IN RTSD0423.LOGISTICS_INTERNATIONAL%TYPE       /*�����ù迩��          */
    , v_Reg_Id          IN RTSD0423.REG_ID%TYPE                 /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
     
END Pkg_Rtsd0423;
/