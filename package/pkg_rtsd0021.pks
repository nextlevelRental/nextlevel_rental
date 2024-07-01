CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0021 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0020
   PURPOSE:   �Ǹ���ǰ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-10-22      sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- �Ǹ�����ǰ(Ÿ�̾�) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0021 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0021.SALE_CD%TYPE,         /* �Ǹ��ڵ�  */
    v_Gds_Gb        IN     RTSD0021.GDS_GB%TYPE           /* ��ǰ����  */
  );

  /*****************************************************************************
  -- �Ǹźΰ���ǰ(���ջ�ǰ) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0021SaleProd (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0021.SALE_CD%TYPE,         /* �Ǹ��ڵ�  */
    v_Gds_Gb        IN     RTSD0021.GDS_GB%TYPE           /* ��ǰ����  */
  );
  
  /*****************************************************************************
  -�Ǹ���ǰ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0021 (
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* �Ǹ��ڵ�       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* Ÿ�̾��� ��� �����ڵ�, ������ ��� ����, �ΰ���ǰ�� ��� �ΰ���ǰ�ڵ�       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* ��ǰ����       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* ��ǰ�� */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* ����� ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -�Ǹ���ǰ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0021 (
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* �Ǹ��ڵ�       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* Ÿ�̾��� ��� �����ڵ�, ������ ��� ����, �ΰ���ǰ�� ��� �ΰ���ǰ�ڵ�       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* ��ǰ����       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* ��ǰ�� */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* ����� ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -�Ǹ���ǰ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0021 (
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* �Ǹ��ڵ�       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* Ÿ�̾��� ��� �����ڵ�, ������ ��� ����, �ΰ���ǰ�� ��� �ΰ���ǰ�ڵ�       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* ��ǰ����       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* ��ǰ�� */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* ����� ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  --�Ǹ���ǰ���� (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0021 (
    v_Comm_Dvsn         IN CHAR,                            /* ó������(I,U,D)*/
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* �Ǹ��ڵ�       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* Ÿ�̾��� ��� �����ڵ�, ������ ��� ����, �ΰ���ǰ�� ��� �ΰ���ǰ�ڵ�       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* ��ǰ����       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* ��ǰ�� */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* ����� ID      */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  );            

  /*****************************************************************************
  -- �Ǹ���ǰ���� ��ǰ���п� ���� ����
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0021DeleteGdsGb(
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* �Ǹ��ڵ�       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* Ÿ�̾��� ��� �����ڵ�, ������ ��� ����, �ΰ���ǰ�� ��� �ΰ���ǰ�ڵ�       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* ��ǰ����       */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );        
END Pkg_Rtsd0021;
/
