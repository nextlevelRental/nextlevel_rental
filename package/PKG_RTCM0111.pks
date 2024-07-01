CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0111 AS
/*******************************************************************************
    NAME        Pkg_Rtcm0111
    PURPOSE     ��Ż������ ���� ������
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
*******************************************************************************/
    
  /*****************************************************************************
  -- ��Ż������ ���� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0111 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Rnt_Mst_Id      IN RTCM0111.RNT_MST_ID%TYPE,
    v_Rnt_Mst_Nm      IN RTCM0111.RNT_MST_NM%TYPE,
    v_Use_Yn          IN RTCM0111.USE_YN%TYPE
    );
    
  /*****************************************************************************
  -- ��Ż�����������Է�(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0111 (
      v_Comm_Dvsn                    IN CHAR                                        /*ó������(I,U,D)      */
    , v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*��Ż������ ���           */
    , v_Rnt_Mst_Nm                   IN RTCM0111.RNT_MST_NM%TYPE                    /*��Ż������ �̸�             */
    , v_Mob_No                       IN RTCM0111.MOB_NO%TYPE                        /*��Ż������ �޴�����ȣ          */
    , v_Email_Addr                   IN RTCM0111.EMAIL_ADDR%TYPE                    /*��Ż������ EMAIL          */
    , v_Use_Yn                       IN RTCM0111.USE_YN%TYPE                        /*��뿩��          */
    , v_Pi_Dstry_Yn                  IN RTCM0111.PI_DSTRY_YN%TYPE                   /*���������ı⿩��          */
    , v_Pi_Dstry_Id                  IN RTCM0111.PI_DSTRY_ID%TYPE                   /*���������ı���ID          */
    , v_Pi_Dstry_Dt                  IN RTCM0111.PI_DSTRY_DT%TYPE                   /*���������ı�����          */
    , v_Reg_Id                       IN RTCM0111.REG_ID%TYPE                        /*����� ID             */
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
  FUNCTION f_InsertRtcm0111 (
      v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*��Ż������ ���           */
    , v_Rnt_Mst_Nm                   IN RTCM0111.RNT_MST_NM%TYPE                    /*��Ż������ �̸�             */
    , v_Mob_No                       IN RTCM0111.MOB_NO%TYPE                        /*��Ż������ �޴�����ȣ          */
    , v_Email_Addr                   IN RTCM0111.EMAIL_ADDR%TYPE                    /*��Ż������ EMAIL          */
    , v_Use_Yn                       IN RTCM0111.USE_YN%TYPE                        /*��뿩��          */
    , v_Pi_Dstry_Yn                  IN RTCM0111.PI_DSTRY_YN%TYPE                   /*���������ı⿩��          */
    , v_Pi_Dstry_Id                  IN RTCM0111.PI_DSTRY_ID%TYPE                   /*���������ı���ID          */
    , v_Pi_Dstry_Dt                  IN RTCM0111.PI_DSTRY_DT%TYPE                   /*���������ı�����          */
    , v_Reg_Id                       IN RTCM0111.REG_ID%TYPE                        /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ��Ż������ ���� Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0111 (
      v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*��Ż������ ���           */
    , v_Rnt_Mst_Nm                   IN RTCM0111.RNT_MST_NM%TYPE                    /*��Ż������ �̸�             */
    , v_Mob_No                       IN RTCM0111.MOB_NO%TYPE                        /*��Ż������ �޴�����ȣ          */
    , v_Email_Addr                   IN RTCM0111.EMAIL_ADDR%TYPE                    /*��Ż������ EMAIL          */
    , v_Use_Yn                       IN RTCM0111.USE_YN%TYPE                        /*��뿩��          */
    , v_Pi_Dstry_Yn                  IN RTCM0111.PI_DSTRY_YN%TYPE                   /*���������ı⿩��          */
    , v_Pi_Dstry_Id                  IN RTCM0111.PI_DSTRY_ID%TYPE                   /*���������ı���ID          */
    , v_Pi_Dstry_Dt                  IN RTCM0111.PI_DSTRY_DT%TYPE                   /*���������ı�����          */
    , v_Reg_Id                       IN RTCM0111.REG_ID%TYPE                        /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ��Ż������ �޴��� ��ȣ
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_GetRMMobNo (
      v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*��Ż������ ���           */
  ) RETURN VARCHAR;
  
END Pkg_Rtcm0111;
/