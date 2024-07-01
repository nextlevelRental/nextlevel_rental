CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTVW0033 AS
/*******************************************************************************
   NAME:     PKG_RTVW0033
   PURPOSE:  �Ҽ��Ǹ���

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-13  Sean             1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- ��Ż����/���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtvw0033 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP   IN RTVIEW33.RENTAL_GROUP%TYPE,        /* ��Ż ���� */
    v_RENTAL_OFFICE  IN RTVIEW33.RENTAL_OFFICE%TYPE,       /* ��Ż ���� */
    v_CHN_CD         IN CHAR                               /* ����: 0, 1, 2, 3 */
    );
    
  /*****************************************************************************
  -- ��Ż����/���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtvw0033 (
    v_Comm_Dvsn      IN CHAR,                           /* ó������(I,U,D)     */
    v_CHN_CL         IN CHAR,                           /* �����ڵ�            */
    v_AGENCY_CD      IN RTVIEW33.AGENCY_CD%TYPE,        /* �븮���ڵ�          */
    v_RENTAL_GROUP_NEW IN RTVIEW33.RENTAL_GROUP%TYPE,   /* ��Ż����            */
    v_RENTAL_OFFICE_NEW IN RTVIEW33.RENTAL_OFFICE%TYPE, /* ��Ż����            */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,           /* ����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ��Ż����/����(�븮��) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0007 ( 
    v_AGENCY_CD         IN RTSD0007.AGENCY_CD%TYPE,     /* �븮���ڵ�          */
    v_RENTAL_GROUP_NEW  IN RTSD0007.RENTAL_GROUP%TYPE,  /* ��Ż����            */
    v_RENTAL_OFFICE_NEW IN RTSD0007.RENTAL_OFFICE%TYPE, /* ��Ż����            */
    v_Reg_Id            IN RTSD0007.REG_ID%TYPE,        /* ����� ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż����/����(�Ǹ���) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0113 ( 
    v_AGENCY_CD         IN RTSD0113.ORD_AGENT%TYPE,     /* �Ǹ��ι�ȣ          */
    v_RENTAL_GROUP_NEW  IN RTSD0113.RENTAL_GROUP%TYPE,  /* ��Ż����            */
    v_RENTAL_OFFICE_NEW IN RTSD0113.RENTAL_OFFICE%TYPE, /* ��Ż����            */
    v_Reg_Id            IN RTSD0113.REG_ID%TYPE,        /* ����� ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ��Ż����/����(�ε��) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCS0002 ( 
    v_AGENCY_CD         IN RTCS0002.ORD_AGENT%TYPE,     /* �븮���ڵ�          */
    v_RENTAL_GROUP_NEW  IN RTCS0002.RENTAL_GROUP%TYPE,  /* ��Ż����            */
    v_RENTAL_OFFICE_NEW IN RTCS0002.RENTAL_OFFICE%TYPE, /* ��Ż����            */
    v_Reg_Id            IN RTCS0002.REG_ID%TYPE,        /* ����� ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER;    
    
END PKG_RTVW0033;
/
