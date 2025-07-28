CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0103 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0103
   PURPOSE   인바운드 지역코드 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-12  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 인바운드 지역코드 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0103Count(
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,  /*담당지구 코드       */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,           /*담당자 사번         */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,        /*지역코드            */
    v_City_No           IN RTCS0103.CITY_NO%TYPE           /*도시코드            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 인바운드 지역코드 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0103 (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*담당지구 코드         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*담당자 사번           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*지역코드              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*도시코드              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*담당지구 명           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*담당자명              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*지역명                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*도시명                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*담당자Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE             /*등록자ID              */
    );

  /*****************************************************************************
  -- 인바운드 지역코드 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0103 (
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*담당지구 코드         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*담당자 사번           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*지역코드              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*도시코드              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*담당지구 명           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*담당자명              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*지역명                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*도시명                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*담당자Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE,            /*등록자ID              */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 인바운드 지역코드 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0103 (
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*담당지구 코드         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*담당자 사번           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*지역코드              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*도시코드              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*담당지구 명           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*담당자명              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*지역명                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*도시명                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*담당자Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE,            /*등록자ID              */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 인바운드 지역코드 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0103 (
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*담당지구 코드         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*담당자 사번           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*지역코드              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*도시코드              */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE,            /*등록자ID              */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 인바운드 지역코드 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0103 (
    v_Comm_Dvsn         IN CHAR,                            /*처리구분(I,U,D)       */
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*담당지구 코드         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*담당자 사번           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*지역코드              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*도시코드              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*담당지구 명           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*담당자명              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*지역명                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*도시명                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*담당자Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE,            /*등록자ID              */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );

  /*****************************************************************************
  -- 인바운드 지역-도시코드 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0103City (
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_Sales_Office_Id   IN RTCS0103.SALES_OFFICE_ID%TYPE,   /*담당지구 코드         */
    v_Emp_Id            IN RTCS0103.EMP_ID%TYPE,            /*담당자 사번           */
    v_Region_No         IN RTCS0103.REGION_NO%TYPE,         /*지역코드              */
    v_City_No           IN RTCS0103.CITY_NO%TYPE,           /*도시코드              */
    v_Sales_Office_Nm   IN RTCS0103.SALES_OFFICE_NAME%TYPE, /*담당지구 명           */
    v_Emp_Name          IN RTCS0103.EMP_NAME%TYPE,          /*담당자명              */
    v_Region_Name       IN RTCS0103.REGION_NAME%TYPE,       /*지역명                */
    v_City_Name         IN RTCS0103.CITY_NAME%TYPE,         /*도시명                */
    v_Emp_Mobileno      IN RTCS0103.EMP_MOBILENO%TYPE,      /*담당자Mobile No       */
    v_Reg_Id            IN RTCS0103.REG_ID%TYPE             /*등록자ID              */
    );
        
  /*****************************************************************************
  -- 인바운드 지역코드- 도시 코드,명 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0103Region (
    Ref_Cursor  IN OUT SYS_REFCURSOR
    );
  
  /*****************************************************************************
  -- 인바운드 지역코드- 도시 코드,명 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0103City (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Region_No  IN RTCS0103.REGION_NO%TYPE           /*지역코드              */
    );
    
END Pkg_Rtcs0103;