CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0051 AS
/*******************************************************************************
   NAME:     PKG_RTSD0051
   Title:    ��Ż ������ ��������

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-09  Sean             1. Created this package spec.
*******************************************************************************/
  /*****************************************************************************
  -- ��Ż ������ �������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0051 (
    v_Comm_Dvsn      IN CHAR,                           /* ó������(I,U,D)     */
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ��Ż ������ ���     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ��Ż����            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* ��Ż����            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* ����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ��Ż ������ �������� Count
  *****************************************************************************/
  FUNCTION f_sRTSD0051Count(
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ��Ż ������ ���     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ��Ż����            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE     /* ��Ż����            */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ��Ż ������ �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0051 (
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ��Ż ������ ���     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ��Ż����            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* ��Ż����            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* ����� ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż ������ �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0051 ( 
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ��Ż ������ ���     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ��Ż����            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* ��Ż����            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* ����� ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��Ż ������ �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRTSD0051 ( 
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* ��Ż ������ ���     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* ��Ż����            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* ��Ż����            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* ����� ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER;      
END PKG_RTSD0051;
/
