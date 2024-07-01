CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0020 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0020
   PURPOSE:   �ǸŻ�ǰ���

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-10-16   sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- �����ڵ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0051CodeName(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*�ڵ�                */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- �����ڵ� �ڵ���ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0051Code(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*�ڵ�                */
    ) RETURN VARCHAR;

    
  /*****************************************************************************
  -- ���ε�� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0020 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0020.SALE_CD%TYPE         /* �Ǹ��ڵ�   */
  );


  /*****************************************************************************
  -- �ǸŻ�ǰ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0020SellProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_NM       IN RTSD0020.SALE_NM%TYPE,         /* �Ǹ��ڵ�       */
    v_Sale_STR_DAY  IN RTSD0020.SALE_STR_DAY%TYPE,    /* �ǸŽ�������   */
    v_Prdt_Grp      IN RTSD0020.  PRDT_GRP%TYPE,      /* �Ǹ�����(Lv1)  */
    v_Prdt_Grp2     IN RTSD0020.  PRDT_GRP_DTL%TYPE,      /* �Ǹ�����(Lv2)  */   
    v_Chan_Cd       VARCHAR2 DEFAULT NULL             /* �ֹ���Ͽ��� �Ǹ�ä�� �� */
  );

  /*****************************************************************************
  -- �ǸŻ�ǰ �Ǹ��ڵ� ä�� 
  *****************************************************************************/
  FUNCTION f_sRTSD0020Seq RETURN VARCHAR2;

  /*****************************************************************************
  -�ǸŻ�ǰ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0020 (
    v_Sale_Cd           IN RTSD0020.SALE_CD%TYPE,         /* �Ǹ��ڵ�                        */
    v_Sale_Nm           IN RTSD0020.SALE_NM%TYPE,         /* �ǸŻ�ǰ��                      */
    v_Sale_Str_Day      IN RTSD0020.SALE_STR_DAY%TYPE,    /* �ǸŽ�������                    */
    v_Sale_End_Day      IN RTSD0020.SALE_END_DAY%TYPE,    /* �Ǹ���������                    */
    v_Chan_Cd           IN RTSD0020.CHAN_CD%TYPE,         /* ä�α����ڵ�                    */
    v_Hshop_Gb          IN RTSD0020.HSHOP_GB%TYPE,        /* Ȩ���α����ڵ�                  */
    v_Dc_Rate           IN RTSD0020.DC_RATE%TYPE,         /* ������                          */
    v_Dc_Amt            IN RTSD0020.DC_AMT%TYPE,          /* ���αݾ�                        */
    v_Prdt_Grp          IN RTSD0020.PRDT_GRP%TYPE,        /* ��ǰ���ڵ�(��Ż��ǰ�ڵ�)        */
    v_Pkg_Dc_Yn         IN RTSD0020.PKG_DC_YN%TYPE,       /* ��Ű���ߺ����ο���              */
    v_Pre_Dc_Yn         IN RTSD0020.PRE_DC_YN%TYPE,       /* �����ߺ����ο���                */
    v_Fpay_Yn           IN RTSD0020.FPAY_YN%TYPE,         /* �Ͻó��Ǹſ���                  */
    v_Regi_Cal_Gb       IN RTSD0020.REGI_CAL_GB%TYPE,     /* ��Ϻ��걸��                  */
    v_Use_Yn            IN RTSD0020.USE_YN%TYPE,          /* ��뿩��                        */
    v_Grp_Sale_Gb       IN RTSD0020.GRP_SALE_GB%TYPE,     /* ��ü�Ǹű����ڵ�                */
    v_Prdt_Grp_Dtl      IN RTSD0020.PRDT_GRP_DTL%TYPE,    /* �Ǹ�����(Lv2)                   */
    v_Rerental_Dc_Yn    IN RTSD0020.RERENTAL_DC_YN%TYPE,  /* �緻Ż�ߺ����ο���              */
    v_Cust_Type         IN RTSD0020.CUST_TYPE%TYPE,       /* ������                        */
    v_Age_Limit         IN RTSD0020.AGE_LIMIT%TYPE,       /* ��������                        */
    v_Age               IN RTSD0020.AGE%TYPE,             /* ����                            */
    v_Contents          IN RTSD0020.CONTENTS%TYPE,        /* ��� */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,          /* ����� ID                       */
    v_hashTag1          IN RTSD0020.HASH_TAG1%TYPE,       /* �ؽ��±�1                       */
    v_hashTag2          IN RTSD0020.HASH_TAG2%TYPE,       /* �ؽ��±�2                       */
    v_hashTag3          IN RTSD0020.HASH_TAG3%TYPE,       /* �ؽ��±�3                       */
    v_hashTag4          IN RTSD0020.HASH_TAG4%TYPE,       /* �ؽ��±�4                       */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;   
  
  /*****************************************************************************
  -�ǸŻ�ǰ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0020 (
    v_Sale_Cd           IN RTSD0020.SALE_CD%TYPE,         /* �Ǹ��ڵ�                        */
    v_Sale_Nm           IN RTSD0020.SALE_NM%TYPE,         /* �ǸŻ�ǰ��                      */
    v_Sale_Str_Day      IN RTSD0020.SALE_STR_DAY%TYPE,    /* �ǸŽ�������                    */
    v_Sale_End_Day      IN RTSD0020.SALE_END_DAY%TYPE,    /* �Ǹ���������                    */
    v_Chan_Cd           IN RTSD0020.CHAN_CD%TYPE,         /* ä�α����ڵ�                    */
    v_Hshop_Gb          IN RTSD0020.HSHOP_GB%TYPE,        /* Ȩ���α����ڵ�                  */
    v_Dc_Rate           IN RTSD0020.DC_RATE%TYPE,         /* ������                          */
    v_Dc_Amt            IN RTSD0020.DC_AMT%TYPE,          /* ���αݾ�                        */
    v_Prdt_Grp          IN RTSD0020.PRDT_GRP%TYPE,        /* ��ǰ���ڵ�(��Ż��ǰ�ڵ�)        */
    v_Pkg_Dc_Yn         IN RTSD0020.PKG_DC_YN%TYPE,       /* ��Ű���ߺ����ο���              */
    v_Pre_Dc_Yn         IN RTSD0020.PRE_DC_YN%TYPE,       /* �����ߺ����ο���                */
    v_Fpay_Yn           IN RTSD0020.FPAY_YN%TYPE,         /* �Ͻó��Ǹſ���                  */
    v_Regi_Cal_Gb       IN RTSD0020.REGI_CAL_GB%TYPE,     /* ��Ϻ��걸��                  */
    v_Use_Yn            IN RTSD0020.USE_YN%TYPE,          /* ��뿩��                        */
    v_Grp_Sale_Gb       IN RTSD0020.GRP_SALE_GB%TYPE,     /* ��ü�Ǹű����ڵ�                */
    v_Prdt_Grp_Dtl      IN RTSD0020.PRDT_GRP_DTL%TYPE,    /* �Ǹ�����(Lv2)                   */
    v_Rerental_Dc_Yn    IN RTSD0020.RERENTAL_DC_YN%TYPE,  /* �緻Ż�ߺ����ο���              */
    v_Cust_Type         IN RTSD0020.CUST_TYPE%TYPE,       /* ������                        */
    v_Age_Limit         IN RTSD0020.AGE_LIMIT%TYPE,       /* ��������                        */
    v_Age               IN RTSD0020.AGE%TYPE,             /* ����                            */
    v_Contents          IN RTSD0020.CONTENTS%TYPE,        /* ��� */
    v_Reg_Id            IN RTSD0025.REG_ID%TYPE,          /* ����� ID                       */
    v_hashTag1          IN RTSD0020.HASH_TAG1%TYPE,       /* �ؽ��±�1                       */
    v_hashTag2          IN RTSD0020.HASH_TAG2%TYPE,       /* �ؽ��±�2                       */
    v_hashTag3          IN RTSD0020.HASH_TAG3%TYPE,       /* �ؽ��±�3                       */
    v_hashTag4          IN RTSD0020.HASH_TAG4%TYPE,       /* �ؽ��±�4                       */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER;   
  
  /*****************************************************************************
  --�ǸŻ�ǰ�������(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0020 (
    v_Comm_Dvsn         IN CHAR,                          /* ó������(I,U,D)                 */
    v_Sale_Cd           IN RTSD0020.SALE_CD%TYPE,         /* �Ǹ��ڵ�                        */
    v_Sale_Nm           IN RTSD0020.SALE_NM%TYPE,         /* �ǸŻ�ǰ��                      */
    v_Sale_Str_Day      IN RTSD0020.SALE_STR_DAY%TYPE,    /* �ǸŽ�������                    */
    v_Sale_End_Day      IN RTSD0020.SALE_END_DAY%TYPE,    /* �Ǹ���������                    */
    v_Chan_Cd           IN RTSD0020.CHAN_CD%TYPE,         /* ä�α����ڵ�                    */
    v_Hshop_Gb          IN RTSD0020.HSHOP_GB%TYPE,        /* Ȩ���α����ڵ�                  */
    v_Dc_Rate           IN RTSD0020.DC_RATE%TYPE,         /* ������                          */
    v_Dc_Amt            IN RTSD0020.DC_AMT%TYPE,          /* ���αݾ�                        */
    v_Prdt_Grp          IN RTSD0020.PRDT_GRP%TYPE,        /* ��ǰ���ڵ�(��Ż��ǰ�ڵ�)        */
    v_Pkg_Dc_Yn         IN RTSD0020.PKG_DC_YN%TYPE,       /* ��Ű���ߺ����ο���              */
    v_Pre_Dc_Yn         IN RTSD0020.PRE_DC_YN%TYPE,       /* �����ߺ����ο���                */
    v_Fpay_Yn           IN RTSD0020.FPAY_YN%TYPE,         /* �Ͻó��Ǹſ���                  */
    v_Regi_Cal_Gb       IN RTSD0020.REGI_CAL_GB%TYPE,     /* ��Ϻ��걸��                  */
    v_Use_Yn            IN RTSD0020.USE_YN%TYPE,          /* ��뿩��                        */
    v_Grp_Sale_Gb       IN RTSD0020.GRP_SALE_GB%TYPE,     /* ��ü�Ǹű����ڵ�                */
    v_Prdt_Grp_Dtl      IN RTSD0020.PRDT_GRP_DTL%TYPE,    /* �Ǹ�����(Lv2)                   */
    v_Rerental_Dc_Yn    IN RTSD0020.RERENTAL_DC_YN%TYPE,  /* �緻Ż�ߺ����ο���              */
    v_Cust_Type         IN RTSD0020.CUST_TYPE%TYPE,       /* ������                        */
    v_Age_Limit         IN RTSD0020.AGE_LIMIT%TYPE,       /* ��������                        */
    v_Age               IN RTSD0020.AGE%TYPE,             /* ����                            */
    v_Contents          IN RTSD0020.CONTENTS%TYPE,        /* ��� */
    v_Reg_Id            IN RTSD0020.REG_ID%TYPE,          /* ����� ID                       */
    v_hashTag1          IN RTSD0020.HASH_TAG1%TYPE,       /* �ؽ��±�1                       */
    v_hashTag2          IN RTSD0020.HASH_TAG2%TYPE,       /* �ؽ��±�2                       */
    v_hashTag3          IN RTSD0020.HASH_TAG3%TYPE,       /* �ؽ��±�3                       */
    v_hashTag4          IN RTSD0020.HASH_TAG4%TYPE,       /* �ؽ��±�4                       */    
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  );  

END Pkg_Rtsd0020;
/
