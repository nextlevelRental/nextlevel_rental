CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0103 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0103
   PURPOSE   �ιٿ�� �����ڵ� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-12  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �ιٿ�� �����ڵ� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0103Count(
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,  /*������� �ڵ�       */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,           /*����� ���         */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,        /*�����ڵ�            */
    v_City_No           IN RTCS0103.CITY_NO%TYPE           /*�����ڵ�            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �ιٿ�� �����ڵ� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0103 (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*������� �ڵ�         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*����� ���           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*�����ڵ�              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*�����ڵ�              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*������� ��           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*����ڸ�              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*������                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*���ø�                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*�����Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE             /*�����ID              */
    );

  /*****************************************************************************
  -- �ιٿ�� �����ڵ� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0103 (
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*������� �ڵ�         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*����� ���           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*�����ڵ�              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*�����ڵ�              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*������� ��           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*����ڸ�              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*������                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*���ø�                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*�����Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE,            /*�����ID              */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �ιٿ�� �����ڵ� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0103 (
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*������� �ڵ�         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*����� ���           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*�����ڵ�              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*�����ڵ�              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*������� ��           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*����ڸ�              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*������                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*���ø�                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*�����Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE,            /*�����ID              */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �ιٿ�� �����ڵ� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0103 (
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*������� �ڵ�         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*����� ���           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*�����ڵ�              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*�����ڵ�              */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE,            /*�����ID              */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �ιٿ�� �����ڵ� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0103 (
    v_Comm_Dvsn         IN CHAR,                            /*ó������(I,U,D)       */
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*������� �ڵ�         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*����� ���           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*�����ڵ�              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*�����ڵ�              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*������� ��           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*����ڸ�              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*������                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*���ø�                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*�����Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE,            /*�����ID              */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );

  /*****************************************************************************
  -- �ιٿ�� ����-�����ڵ� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0103City (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*������� �ڵ�         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*����� ���           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*�����ڵ�              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*�����ڵ�              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*������� ��           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*����ڸ�              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*������                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*���ø�                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*�����Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE             /*�����ID              */
    );
        
  /*****************************************************************************
  -- �ιٿ�� �����ڵ�- ���� �ڵ�,�� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0103Region (
    Ref_Cursor  IN OUT SYS_REFCURSOR
    );
  
  /*****************************************************************************
  -- �ιٿ�� �����ڵ�- ���� �ڵ�,�� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0103City (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Region_No  IN RTCS0103.REGION_NO%TYPE           /*�����ڵ�              */
    );
    
END Pkg_Rtcs0103;
/
